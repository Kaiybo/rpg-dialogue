-- Lakeshire, the rest of the town: a dwarf with a drinking challenge, a rogue on the docks, a
-- boy whose friend lost her necklace, the fishing trainer, the inn's bartender, the herbalism
-- trainer and a man from the bridge crew. Voice: bibles/lakeshire_more.md
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "yorus", id = TODO_NPC("Yorus Barleybrew"), name = "Yorus Barleybrew",
  bible = "bibles/lakeshire_more.md", role = "questgiver", tier = "quest",
  communities = { "lakeshire" }, temper = { "jovial" }, values = { "brave", "proud" },
  notices = { "class", "drink" },

  impression = {
    first = "He thinks courage is best measured staggering, and he may be right.",
    third = "{name} met Yorus Barleybrew, a dwarf in the Lakeshire Inn whose challenge to the Alliance's warriors is called the Rethban Gauntlet.",
  },

  greetings = {
    { id = "g_default", text = "Hah! Pull up a stool, friend, and mind the cask, for it's family an' it bites." },
    { id = "g_back", when = { metBefore = true }, text = "Back for another, are ye? Most folk only need the one sip to learn their lesson." },
    { id = "g_run", when = { questActive = TODO_QUEST("The Rethban Gauntlet") }, text = "Why are ye standin' here? The clock's runnin', and so should you be!" },
    { id = "g_hero", when = { questDone = TODO_QUEST("The Rethban Gauntlet") }, text = "There's the one who ran the Gauntlet! Hip hip, and I'll save the rest for when ye're sober." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "Now there's a warrior's stance, feet planted like ye mean it. Ye've heard o' my challenge, then, or ye're about to." },
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "Somebody's had a head start! Careful, friend; my family's brew doesn't care for competition." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The best test there is! A shaman might cheat with spirits, though. Will you drink honest?" } },
      choices = {
        { text = "I'll drink honest and run honest, Yorus.", next = "BACK", reply = "Ha, that's the spirit, and I mean the drinkin' kind! Ye'll be the first honest runner I've had since the thaw, so mind ye don't trip on yer own beard.", fx = { align = { honor = 1 } } },
        { text = "I'll cheat if I must. Spirits are mine to use.", next = "BACK", reply = "Cheatin' with spirits, he says, while the rest o' us cheat with ale! Fair's fair, I suppose, though the gnolls'll not care which kind ye've got in ye.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A handful, and every one o' them a legend in this inn, at least until they sobered up. The sport is runnin' through gnoll country with Barleybrew in yer belly, and the gnolls can smell it, so they come runnin' too." } },
      choices = {
        { text = "I'll run it sober, or not at all.", next = "BACK", reply = "Sober? Then ye've missed the whole point o' the thing, but I'll not stop ye. The gnolls'll be disappointed, mind.", fx = { align = { order = 1 } } },
        { text = "Pour it strong. I'll run it the proper dwarven way.", next = "BACK", reply = "Now there's a runner after my own heart! Drink it down and run like yer beard's on fire, because it might well be.", fx = { align = { order = -1 } } },
        { text = "Something else, Yorus.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Aye, if ye've the legs, though the challenge was meant for warriors, and they'll grumble if a hunter beats their time. Leave yer beast behind, mind, because it'll not like the smell o' the brew." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Aye, if ye've the legs, though the warriors will grumble if a hunter beats their time. That {pet} o' yours would outrun any of them, {class}, and I'd put a silver on it, if I had one to spare." },
      },
      choices = {
        { text = "I'll run it with my beast at my side, fair and square.", next = "BACK", reply = "Fair and square with a beast at yer side, aye, I'll allow it. The warriors'll grumble, but they grumble at everythin'.", fx = { align = { honor = 1 } } },
        { text = "I'll run it, and leave the warriors grumbling behind me.", next = "BACK", reply = "Ha! Grumblin' warriors are the best kind o' trophy, and I'll drink to ye when they do. Off ye go, then.", fx = { align = { honor = -1 } } },
        { text = "Something else, Yorus.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Bruised, mostly, an' a bit green, an' one lad who ran the wrong way an' ended up in the lake. Nobody's died on my challenge yet, an' I'll thank ye to say a prayer that it stays that way." } },
      choices = {
        { text = "I'll pray for every one who takes your challenge.", next = "BACK", reply = "That's kind o' ye, and I'll hold ye to it. A prayer and a pint, the two best things in a dwarf's life.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If they die, they were fools. That's no matter for prayer.", next = "BACK", reply = "Hard words for a priest, and I'll thank ye not to say 'em in my inn. They're brave fools, at least.", fx = { align = { light = -1 } } },
        { text = "Something else, Yorus.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Oh, aye, likely faster, but where's the honour in that? The Scalder's the test, because any fool can be brave sober, an' it takes a Barleybrew brew to show ye what's underneath." } },
      choices = {
        { text = "Then I'll drink and run it properly. Rules are rules.", next = "BACK", reply = "Rules are rules, aye, and Barleybrew rules are the best rules there are! Drink up, and run like the wind.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll tip mine in a pot plant and run it anyway.", next = "BACK", reply = "Ye'd waste good Scalder on a pot plant? I'll pretend I didnae hear that, and so will the plant.", fx = { align = { honor = -1 } } },
        { text = "Something else, Yorus.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Yorus Barleybrew, of the Barleybrews, and that's the finest brewing name in Khaz Modan whatever the Thunderbrews tell ye. I've a challenge for any warrior with the stomach for it, and the legs." },
        { id = "h_quest", tags = { "news" }, when = { questActive = TODO_QUEST("Yorus Barleybrew") },
          text = "Word o' my challenge reached ye, then! Take a stool and a mug, and drink slow, because a warrior should never rush what might be his final pint." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Rethban Gauntlet"), days = 3 } },
          text = "Ye made it back inside the hour, and still standin', near enough! I'll be tellin' that one in Ironforge till my beard's white." },
        { id = "h_shield", when = { questDone = TODO_QUEST("The Shieldsmith") },
          text = "Did Furen Longbeard make ye a good shield in Stormwind? He'd better have, because he owes me more favours than I can count, and I've counted." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "Now there's a warrior if ever I saw one! Ye'll be wantin' to hear about my challenge, I'd wager, and ye'll be wantin' a mug before ye do." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, eh? Ye've the look o' someone who'd rather shoot a gnoll than drink a pint, which is a sad thing, and I'll try to fix it." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest at the bar! Ye'll be wantin' to bless the Scalder, I'd wager, an' I'll warn ye now it's beyond savin'." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin at my table! I'd not ask ye to drink, but I'd wager ye'd run the gauntlet faster than any warrior." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Drink my family's brew and run through gnoll country on it, because courage is best measured staggerin', I say." },
      },
      again = {
        { id = "h_again", text = "What else? Talk while I pour, for it saves time an' the Scalder doesnae like waitin'." },
        { id = "h_again2", text = "Go on, {g:lad|lass}, I'm all ears and half a beard." },
      },
      choices = {
        { text = "What's this challenge of yours?", next = "gauntlet" },
        { text = "What are you pouring there, Yorus?", next = "scalder" },
        { text = "Why Redridge, of all places?", next = "redridge" },
        { text = "Drinking before a fight hardly seems wise.", next = "wisdom" },
        { text = "I'm no warrior. Can I still run it?", next = "notwarrior", when = { class = { "PRIEST", "MAGE", "WARLOCK", "ROGUE", "HUNTER", "DRUID", "PALADIN", "SHAMAN" } } },
        { text = "A dwarf can hold his drink, Yorus.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Have many warriors run your Gauntlet and finished, Yorus?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What did your Gauntlet really prove, Yorus?", next = "proof", when = { class = "WARRIOR", questDone = TODO_QUEST("The Rethban Gauntlet") } },
        { text = "Darnath Bladesinger sent me all the way from Darnassus.", next = "darnath", when = { class = "WARRIOR", race = "NightElf" } },
        { text = "Can a hunter run your Gauntlet, Yorus?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do your challengers ever come back hurt, Yorus?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Could a paladin pass your challenge without the drink, Yorus?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Your brew hardly seems a test of courage, Yorus.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Pour me one, Yorus.", next = "END", fx = { affinity = 1 } },
      },
    },

    proof = {
      big = true,
      lines = { { id = "pf_default", text = "That ye can fight when yer own body's against ye, which it will be, someday, wi' a wound or a fever or a week without sleep. The gnolls were never the test, friend; the test was whether ye'd keep yer feet when the ground started arguin'." } },
      choices = {
        { text = "Then it was a fine test, and I'm grateful.", next = "BACK", reply = "Grateful! Hear that, Daniels? Somebody's grateful for a hangover.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "It proved I can drink. Nothing more.", next = "BACK", reply = "Ach, ye'll see it one day, when ye're fightin' wi' a fever an' remember my Scalder.", fx = { align = { order = -1 } } },
        { text = "Something else, Yorus.", next = "BACK" },
      },
    },
    darnath = {
      lines = { { id = "dn_default", text = "Did he, now! Darnath's a fine elf, an' the only one o' yer people who ever drank my Scalder without makin' a face. He'll want tae know how ye ran, so I'll write him myself, an' I'll tell him ye sang the whole way back." } },
      choices = {
        { text = "I did not sing.", next = "BACK", reply = "Ye will, by the time ye're back. They all do.", fx = { trait = { witty = 1 } } },
        { text = "Tell him I ran it well.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    gauntlet = {
      lines = {
        { id = "ga_default", text = "I call it the Rethban Gauntlet. Ye take a swig of my family's Scalder, run to the Rethban Caverns in the foothills north o' town, as far as the first fork, and come back here within the hour." },
        { id = "ga_done", when = { questDone = TODO_QUEST("The Rethban Gauntlet") },
          text = "Ye know what it is, ye ran it! Through the gnolls with Scalder in yer blood, and back before the hour, and that's a story ye'll tell yer grandchildren." },
      },
      choices = {
        { text = "That sounds easy enough.", next = "gauntlet_wrinkles" },
        { text = "And the reward?", next = "gauntlet_reward" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gauntlet_wrinkles = {
      lines = {
        { id = "gw_default", text = "Easy, aye, if ye ignore the gnoll packs between here and there, and the fact ye won't be walkin' straight, and the hour that doesn't wait for anyone who falls in a stream." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "redridge_gnolls" } } } },
    },
    gauntlet_reward = {
      lines = {
        { id = "gr_default", text = "A shield, from my friend Furen Longbeard in Stormwind's Dwarven District, the best shieldsmith ye'll ever meet. He owes me a big favour, and I mean to collect it on yer behalf." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    scalder = {
      lines = {
        { id = "sc_default", text = "Barley, fire and family secrets. It heats the blood and dulls the nerves, which is what a warrior wants, though it does leave ye a mite unsteady on yer feet for a while." },
      },
      choices = {
        { text = "How unsteady?", next = "scalder_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scalder_how = {
      lines = {
        { id = "sh_default", text = "Ye'll find out! Let's say the ground gets ideas, and ye'll be arguin' with it all the way to the caverns." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    redridge = {
      lines = {
        { id = "r_default", text = "Because a challenge needs danger, and Redridge has plenty, gnolls in the hills and orcs past the lake. Besides, the inn's warm and Daniels doesn't mind me makin' noise, whereas in Ironforge they'd have the guard round by the second song." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "blackrock" } } } },
    },

    wisdom = {
      big = true,
      lines = {
        { id = "w_default", text = "Wise? No! But a warrior who can't fight half-cut and half-blind will meet a day when he has to, and better he meets it in my Gauntlet than on a battlefield." },
      },
      choices = {
        { text = "A clear head wins fights. Not brew.", next = "BACK", reply = "Maybe so, friend, until the day it doesnae. I'll keep pourin' for those who want to find out.", fx = { align = { order = 1 } } },
        { text = "Hah! Fight drunk, fight anything. I like it.", next = "BACK", reply = "Now ye're talkin' like a Barleybrew! Sit down, and I'll tell ye about the time I fought a gnoll in my socks.", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    notwarrior = {
      lines = {
        { id = "nw_default", text = "It's a warrior's challenge, so the reward's for warriors, but I'll not stop anyone fool enough to drink with me. Ye'll get a cheer and a headache, and Furen's shield stays in Stormwind." },
      },
      choices = {
        { text = "A cheer and a headache. I've paid more for less.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "Every dwarf says so, and every dwarf who's run my gauntlet came back swearing the Scalder was brewed by a dragon. Hold it you might, friend, but run on it? That's the test." } },
      choices = {
        { text = "Pour it. I'll show you a dwarf running.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "A dwarf doesn't run. He walks, steady.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons brew a stout down in their mountain that's said to melt a man's teeth, and I'd risk my teeth for a taste. That's the only thing I'd ever thank them for, mind, and I'd still hit them afterward." } },
    magni = { { id = "tp_magni", text = "King Magni can drink any dwarf in Ironforge under the table, and I've tried twice, though not with him personally. Some day I'll have the honour, and I'll lose gladly." } },
    blackrock_spire = { { id = "tp_blackrock_spire", text = "The orcs in that mountain north of the Steppes drink some foul black grog, I hear, and they fight better for it. That's a lesson in brewing nobody should take, and I'll not say it twice." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammers drink their ale on the backs of gryphons, which is a courage test I've never dared set anyone. Come to think of it, I might write that down for later." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "They sell a drink at the Darkmoon Faire that makes you see things that aren't there, and they charge twice what my family's brew does. Mine makes you see gnolls, and those are real enough." } },
    knows = { { id = "tp_knows", text = "I know brewin', fightin' and the shortest way to the Rethban Caverns, in roughly that order. What'll it be?" } },
    background = { { id = "tp_bg", text = "A Barleybrew, a warrior and a dwarf a long way from home, and only the first one matters to my mother." } },
    advice = { { id = "tp_ad", text = "Run west o' town past the herb garden before ye turn north, and ye'll miss most o' the gnolls." } },
    redridge_gnolls = { { id = "tp_gnolls", text = "They're big an' angry an' always in the way, which makes them perfect for a Gauntlet." } },
    _none = { { id = "tp_none", text = "I've nae idea, friend, but I'll drink to it all the same." } },
  },
}

P:NPC {
  key = "lucius", id = TODO_NPC("Lucius"), name = "Lucius",
  bible = "bibles/lakeshire_more.md", role = "trainer", tier = "quest",
  communities = { "lakeshire" }, temper = { "sharp" }, values = { "cunning", "practical" },
  notices = { "class", "stealth" },

  impression = {
    first = "He is fonder of a clever lock than of most people.",
    third = "{name} met Lucius, a dwarf on the Lakeshire docks who teaches young rogues to open locks that aren't theirs.",
  },

  greetings = {
    { id = "g_default", text = "Keep your hands where I can see them, friend, mostly for your sake." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Either you've something for me, or you've got a lot of free time." },
    { id = "g_mill", when = { questActive = TODO_QUEST("Alther's Mill") }, text = "That lockbox up at Alther's Mill won't open itself, unless the orcs got to it first." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A rogue! I can tell by the way you looked at my belt pouch before you looked at my face. Good; there's hope for you yet." },
  },

  react = {
    { id = "r_stealth", on = "stealth",
      text = "Very nice, very quiet, and I still heard your boots on the third plank. Stand up; we'll work on it." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Locks are honest, and people lie. Your spirits might be honest too, but I'd not bet on it." } },
      choices = {
        { text = "Some people are honest, Lucius. Give them a chance.", next = "BACK", reply = "Some are, and I've met maybe three, and one of them robbed me later. I'll give them a chance, but I'll lock my door.", fx = { align = { honor = 1 } } },
        { text = "You're right. Locks don't betray anyone.", next = "BACK", reply = "Exactly, and a lock tells you what it is the moment you touch it. People take longer, and they're usually worse.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Now and then, when the job needs someone to stand at the front and make a lot of noise. A good warrior draws every eye in the room, and a good rogue uses that moment, so we get along fine, mostly." } },
      choices = {
        { text = "I'll make the noise. Somebody has to stand at the front.", next = "BACK", reply = "Good, because I'm terrible at it. Stand at the front and shout, and we'll do the rest.", fx = { align = { honor = 1 } } },
        { text = "I don't play distraction for anyone's knife.", next = "BACK", reply = "Then you'll be no use to me, and that's fine. Fight your own fights, then.", fx = { align = { honor = -1 } } },
        { text = "Something else, Lucius.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "How to move without that beast giving you away, for a start, though I suppose it does the same job as a sharp ear. Most hunters I've met track things that can't talk, and I track things that can, so we're not so different." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "How to move without that beast giving you away, for a start, since I track things that can talk. That {pet} of yours has its eye on my pocket, {class}, and I've known pickpockets with worse manners." },
      },
      choices = {
        { text = "I'll track the honest way, Lucius.", next = "BACK", reply = "Honest's fine for animals, and slower for people. Suit yourself.", fx = { align = { honor = 1 } } },
        { text = "Teach me what you know. Quiet's quiet, whoever teaches it.", next = "BACK", reply = "Now there's sense, and from a hunter, no less. Come back when you've an hour.", fx = { align = { honor = -1 } } },
        { text = "Something else, Lucius.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Plenty, and they all think a lock is a puzzle to be solved with a fireball. Come back when you can open a door without leaving a scorch mark, and we'll talk." } },
      choices = {
        { text = "Fine. Finesse over force, then.", next = "BACK", reply = "That's the way, and you'll find doors open easier for it. Come back and show me.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A scorched door opens just as well.", next = "BACK", reply = "It does, and so does a broken one, and the guards hear both. Finesse, mage, finesse.", fx = { align = { order = -1 } } },
        { text = "Who are you, really?", next = "who" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "Not the same things, friend. I work in shadows, and you work with the things that live in them, which is a different trade entirely. Mine leaves a man missing a purse, and yours leaves him missing a good deal more." } },
      choices = {
        { text = "Shadows are shadows. Don't be squeamish.", next = "BACK", reply = "I'm not squeamish, friend, I'm careful, which keeps me alive. Keep your friends away from my lads.", fx = { align = { light = -1 } } },
        { text = "I'll keep what I practise well away from Lakeshire's folk.", next = "BACK", reply = "Good, because I'd have to do something about it if you did. We understand each other.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "What do you teach down here?", next = "teach" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "No, because worrying's bad for the hands. Some go to work for the crown, some go to work for themselves, and a few end up in the lake, and none of it's on me, priest, so you can keep the sermon." } },
      choices = {
        { text = "It's on you a little, Lucius. Think on that.", next = "BACK", reply = "Maybe a little, and I'll think on it when I've nothing better to do. Which is never.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They chose their road. That's not on you.", next = "BACK", reply = "That's what I tell myself, and it's good to hear a priest agree. Run along, then.", fx = { align = { light = -1 } } },
        { text = "Something else, Lucius.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Marris knows well enough, and he pretends not to, because a guard who can move quiet comes home from the hills more often. Justice is a fine thing in Stormwind, paladin, but out here it's a luxury." } },
      choices = {
        { text = "The law should hold here just as it does in Stormwind.", next = "BACK", reply = "It should, paladin, and in a perfect world it would. This isn't one.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Out here, results count for more than the law.", next = "BACK", reply = "Now you're talking sense, and I didn't expect it from a paladin. Marris would agree.", fx = { align = { order = -1 } } },
        { text = "Something else, Lucius.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "You could teach them to hide in a hedge, maybe, but my lot hide in crowds and cellars, and there's no hedge in a Stormwind alley. Still, quiet is quiet, so stop by if the trees ever bore you." } },
      choices = {
        { text = "Stealth is for the hunt, not for picking pockets.", next = "BACK", reply = "For your hunt, maybe, but mine's a different kind of hunting. Each to their own.", fx = { align = { honor = 1 } } },
        { text = "Quiet is quiet. I'll use it however it pays best.", next = "BACK", reply = "Now you sound like one of mine. Stop by anytime, and I'll show you a thing or two.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Lucius. I sit on these docks, I watch the boats, and if a certain sort of person comes along, I teach them something useful. You're not that sort, I'd guess, but I've been wrong." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "Renzik the Shiv sent you down from Stormwind? Let's see those hands... clumsy, but I've fixed worse, and some of the worst are working for the crown now." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Alther's Mill"), days = 5 } },
          text = "So the lockbox gave in to you. Good; whatever kills you from here on, at least it won't be my teaching." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You're not the sort I teach, but you're the sort who protects the sort I teach, so you can stand there if you want." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Your step's quiet enough, but that beast of yours breathes like a bellows, and I can hear it from here." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, on my docks. Come to save my soul? You'll need a bigger boat." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Shiny, loud and honest, which are the three things I can't teach anybody." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. I've watched your cats prowl about, and I'll grant they move quieter than most of my students." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Get off the docks unless you've a lock to show me. I prefer locks to people." },
      },
      again = {
        { id = "h_again", text = "What else? Quietly, if you please; sound carries over water." },
        { id = "h_again2", text = "Go on. I'm watching the boats, not ignoring you." },
      },
      choices = {
        { text = "What do you teach, exactly?", next = "teach" },
        { text = "What would you have me do, Lucius?", next = "mill", when = { class = "ROGUE" } },
        { text = "Who are you working for?", next = "who" },
        { text = "What do you make of Lakeshire?", next = "town" },
        { text = "Opening other people's locks hardly seems honest work.", next = "honest" },
        { text = "Gnomes build better locks than this.", next = "gnome", when = { race = "Gnome" } },
        { text = "You train rogues. Ever met a mage worth his salt?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do rogues and warriors ever work together, Lucius?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Could a hunter learn something from a rogue, Lucius?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "We both deal in things decent folk won't name, Lucius.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "You must worry what becomes of the folk you train.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does Marshal Marris know what you teach down here?", next = "xapala", when = { class = "PALADIN" } },
        { text = "My people walk unseen in the forest. Could I teach your students?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you really prefer locks to people, Lucius?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll leave you to your boats.", next = "END" },
      },
    },

    teach = {
      lines = {
        { id = "t_default", text = "Locks, mostly. Not every young thief has hands as quick as mine, so somebody has to show them how a tumbler thinks before they're sent anywhere that matters." },
      },
      choices = {
        { text = "How does a tumbler think?", next = "teach_tumbler" },
        { text = "Something else.", next = "BACK" },
      },
    },
    teach_tumbler = {
      lines = {
        { id = "tt_default", text = "Slowly, and it wants to be listened to, not forced. Most people are the same, as it happens, which is the second lesson and the one I charge for." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    mill = {
      lines = {
        { id = "m_default", text = "Up off the road east of here is Alther's Mill, and I keep a chest up there with a token inside. Open the lockbox, bring back the token, and you'll have your certificate." },
        { id = "m_done", when = { questDone = TODO_QUEST("Alther's Mill") },
          text = "The lockbox is empty now, and I'll fill it again by morning for the next pair of fat fingers. You'd be amazed how many I get." },
      },
      choices = {
        { text = "Anything else up there I should know?", next = "mill_orcs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mill_orcs = {
      lines = {
        { id = "mo_default", text = "Orcs, now and then, sniffing about the mill for whatever orcs sniff for. Consider them the part of the lesson I don't charge for." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "blackrock" } } } },
    },

    who = {
      lines = {
        { id = "w_default", text = "For myself, and for some friends in Stormwind who prefer not to be named on docks. If you've heard of them, you know better than to ask, and if you haven't, you don't need to." },
        { id = "w_rogue", when = { class = "ROGUE" },
          text = "The same people who sent you, so let's not say their name out here. SI:7 is a word that makes the fishermen nervous." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "si7" } } } },
    },

    town = {
      lines = {
        { id = "to_default", text = "A nice town with a magistrate who writes orders nobody can follow and a marshal who follows them anyway. The docks are honest, mostly; it's the shore you want to watch." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    honest = {
      big = true,
      lines = {
        { id = "ho_default", text = "Honest? It's useful, and useful is better than honest when the Blackrock are across the lake. A lock between a good man and an orc's battle plans is a lock I want opened." },
      },
      choices = {
        { text = "Useful today, criminal tomorrow. Honesty matters.", next = "BACK", reply = "Maybe, but tomorrow's tomorrow and the orcs are today. I'll worry about honesty later.", fx = { align = { honor = 1 }, affinity = -1 } },
        { text = "Agreed. A clever hand serves the kingdom too.", next = "BACK", reply = "Exactly. My friends in Stormwind would agree with you, though they'd never say so out loud.", fx = { align = { honor = -1 }, affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnome = {
      lines = { { id = "gn_default", text = "Gnomes build cleverer locks, which isn't the same thing; a clever lock has a clever flaw, and I've opened plenty. Show me one of yours sometime and I'll prove it." } },
      choices = {
        { text = "My locks don't have flaws.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Then teach me the flaw.", next = "teach", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    ravenholdt = { { id = "tp_ravenholdt", text = "There's a manor in the Alterac foothills where the best of my trade gather, and you'll find it when they decide you've found it. Don't ask me where, because I'd only tell you wrong on purpose." } },
    syndicate = { { id = "tp_syndicate", text = "The Syndicate are thieves with family crests, which makes them worse thieves and worse nobles. I'd not take a job from one, because they'd pay in a knife." } },
    the_stockade = { { id = "tp_the_stockade", text = "A good half of my old students have done a spell in the Stockade, and a few of them are running it now, from what I hear. I'm proud and ashamed in about equal measure." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's the only port in the world where a rogue can walk down the street with his hood down. The goblins don't care what you've done, just what you're spending." } },
    knows = { { id = "tp_knows", text = "I know locks, boats and who's been where they shouldn't, and that last list is longer than the Magistrate would like, so choose." } },
    background = { { id = "tp_bg", text = "I'm a dwarf on a dock, and that's as much as anyone gets, friend." } },
    advice = { { id = "tp_ad", text = "Never pick a lock you haven't looked at twice, and never trust a door that's already open." } },
    si7 = { { id = "tp_si7", text = "Never heard of it, and you didn't hear me say that." } },
    _none = { { id = "tp_none", text = "Not my business, and I like to keep it that way." } },
  },
}

P:NPC {
  key = "shawn", id = TODO_NPC("Shawn"), name = "Shawn",
  bible = "bibles/lakeshire_more.md", role = "child", tier = "quest",
  communities = { "lakeshire" }, temper = { "eager" }, values = { "loyal", "hopeful" },
  notices = { "class", "kit", "lock_shards" },

  impression = {
    first = "He wants to be a hero, and he's practising on me.",
    third = "{name} met Shawn, a boy on the Lakeshire docks whose friend Hilary dropped her necklace in the lake.",
  },

  greetings = {
    { id = "g_default", text = "Excuse me, {g:mister|ma'am}, are you busy? Could you help us, just a little bit, please?" },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Hilary, look, it's them again!" },
    { id = "g_done", when = { questDone = TODO_QUEST("Hilary's Necklace") }, text = "Hilary's still wearing it! I'm going to be a hero like you someday, I've decided." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = { "PALADIN", "WARRIOR" } },
      text = "Wow, is that real armour? Is it heavy? Can I knock on it? I'll knock very softly." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your armour's all broken! Did a monster do that? Was it a big one?" },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 5 } },
      text = "Is your bag humming? Effsee's ears went flat, and I think there's something alive in there, so is it a frog? Hilary keeps frogs in her pockets and they don't hum." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Yes, and I want to be a hero and find it. Would you help? I'll practise being brave." } },
      choices = {
        { text = "I'll help you find it, Shawn. You'll be a hero.", next = "BACK", reply = "Really? Thank you, oh, thank you! Hilary will be so happy, and I'll practise being brave the whole time.", fx = { align = { honor = 1 } } },
        { text = "Find it yourself. That's how heroes are made.", next = "BACK", reply = "Myself? I suppose that is how heroes do it, isn't it? I'll try, but the murlocs are awfully scary.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "A little, but Effsee's more frightened, so I've got to be brave for her. Can that thing of yours swim? Because Hilary's necklace is somewhere at the bottom of the lake, and the murlocs are too scary for us to go in after it." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "A little, and more now it's looking straight at me, but Effsee's hiding behind my legs, so I've got to be brave for her. Can {pet} swim? Because Hilary's necklace is at the bottom of the lake, and the murlocs are too scary for us to go in after it." },
      },
      choices = {
        { text = "I'll find the necklace for you myself.", next = "BACK", reply = "Would you? Then I'll tell Hilary you're the bravest person in Lakeshire, and Effsee too.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It doesn't fetch necklaces, kid. It fetches worse things.", next = "BACK", reply = "Oh, that's all right, it was only an idea. Can it at least do tricks?", fx = { align = { light = -1 } } },
        { text = "Something else, Shawn.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Yes, and I'm going to be the bravest warrior in the whole Alliance, and fight the Blackrock, and save Lakeshire! Hilary says I'm too small, but I practise every day with a stick, and I'm getting better." } },
      choices = {
        { text = "Practise hard, Shawn. Lakeshire needs brave folk.", next = "BACK", reply = "I will, every day, I promise, and I'll get big enough to fight orcs. Hilary will see.", fx = { align = { honor = 1 } } },
        { text = "Fishing's safer, lad. Stick to that.", next = "BACK", reply = "That's what Hilary says too, and my mum. But fishing's boring, and I want to be brave.", fx = { align = { honor = -1 } } },
        { text = "Something else, Shawn.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Really? Hilary says I'm the loudest boy in Lakeshire, so you'd have your work cut out. But if I could sneak, I'd creep up on the murlocs and get her necklace back myself!" } },
      choices = {
        { text = "Heroes don't sneak, Shawn. They stand tall.", next = "BACK", reply = "Then I'll stand tall, really tall, and maybe I'll grow a bit. Thank you!", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Sneaking is how you win, Shawn.", next = "BACK", reply = "Is it? Then maybe I'll learn to sneak, and then I can get the necklace myself. Hilary won't believe it.", fx = { align = { honor = -1 } } },
        { text = "What happened to the necklace?", next = "necklace" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Yes! Can you do the one where water turns to ice? Because then I could walk right out on the lake and look for Hilary's necklace without getting wet." },
        { id = "xma_gnome", when = { race = "Gnome" }, text = "You're hardly taller than me, and you can do magic? Can you do the one where water turns to ice, so I could walk right out on the lake and look for Hilary's necklace?" },
      },
      choices = {
        { text = "Magic isn't a toy, Shawn. Study first.", next = "BACK", reply = "Oh, I know, I'll study really hard, I promise. Can you show me just one spell, though?", fx = { align = { order = 1 } } },
        { text = "All right, but don't tell your mother.", next = "BACK", reply = "Really? I won't tell her, I promise, cross my heart! This is the best day ever.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Do you want to be a hero?", next = "hero" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Mostly, except when I fall asleep in the middle, which is a lot. I prayed for Hilary's necklace, and for Effsee not to fall in the lake, and for the orcs to go back where they came from, and only the cat one's come true so far." } },
      choices = {
        { text = "Keep praying, Shawn. Prayers get answered in their own time.", next = "BACK", reply = "Then I'll keep praying, and maybe the necklace one will come true next. Thank you!", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers don't find necklaces, Shawn. Looking does.", next = "BACK", reply = "Then I'll look, but the lake's ever so big. Maybe you could look too?", fx = { align = { light = -1 } } },
        { text = "Something else, Shawn.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Only a bit, because Hilary says they just want to be left alone, and I think she's right, mostly. But one of them took her necklace, and that's not leaving us alone, is it?" } },
      choices = {
        { text = "A thief should give back what it took. That's only fair.", next = "BACK", reply = "That's what I think, and Hilary should get her necklace back. It's only fair.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Hilary's right. Leave the murlocs alone and they'll leave you.", next = "BACK", reply = "Maybe, but I still want the necklace back. Do you think they'd just give it?", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Shawn, and that's Hilary, and that's her cat Effsee. We were fishing off this dock and Hilary's necklace went missing, and we looked everywhere on the boards, so it must be in the lake." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Hilary's Necklace") },
          text = "Did you look in the lake yet? Mom says there's nasty things down there, but you look like you've fought nasty things before, haven't you?" },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Hilary's Necklace"), days = 5 } },
          text = "Hilary hasn't taken it off once since you brought it back, not even for bed, and Effsee keeps trying to bat it, so she sleeps with her hand on it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "Wow, a real warrior! Hilary, look, it's a real warrior, with armour! Have you killed an orc? Have you killed lots of orcs?" },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "Are you a priest? My mom says priests can talk to the Light, so could you ask it where Hilary's necklace went?" },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "Are you really a druid? Hilary says druids can turn into seals and swim all day, and if that's true, you could find her necklace in no time!" },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Whoa, is that a real demon? Hilary, look, a real demon, and Effsee's hissing at it!" },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Excuse me, are you a shaman? Could your water spirits find Hilary's necklace? It's in the lake." },
      },
      again = {
        { id = "h_again", text = "What else? I can talk all day, we're not catching anything anyway." },
        { id = "h_again2", text = "Ask me something else! Hilary's shy, so you have to ask me." },
      },
      choices = {
        { text = "Tell me about the necklace.", next = "necklace" },
        { text = "Why don't you swim for it?", next = "swim" },
        { text = "Do you really want to be a hero?", next = "hero" },
        { text = "It doesn't look like you're catching much.", next = "fish" },
        { text = "This is {pet}. Want to say hello?", next = "hunter", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "I'm a paladin. That's a sort of hero.", next = "paladin", when = { class = "PALADIN" } },
        { text = "I could teach you to sneak, Shawn.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Want to see a spell, Shawn?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you want to be a warrior someday, Shawn?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you say your prayers at night, Shawn?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you ever worry about the murlocs in the lake, Shawn?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Aren't you frightened of what walks with me, Shawn?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Did Hilary lose her necklace in the lake, Shawn?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll keep an eye out for it.", next = "END", fx = { affinity = 1 } },
      },
    },

    necklace = {
      lines = {
        { id = "n_default", text = "Her daddy got it for her, and it's the prettiest thing she's got. She was showing it to Effsee and then it was just gone, and she cried, and I didn't know what to do, so I asked you." },
      },
      choices = {
        { text = "I'll find it, I promise.", next = "BACK", when = { questBefore = TODO_QUEST("Hilary's Necklace") }, fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    swim = {
      lines = {
        { id = "s_default", text = "Our parents don't want us swimming in the lake. My mom says there's mean things in it, and Mister Baren says the murlocs come right up to the shore some mornings, so I don't even put my feet in." },
      },
      choices = {
        { text = "Your mother's right, so stay out of there.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hero = {
      big = true,
      lines = {
        { id = "he_default", text = "More than anything! Heroes fight orcs and find necklaces and everybody cheers. What do heroes do when nobody's cheering, though? Do they still do it?" },
      },
      choices = {
        { text = "They do. Heroes keep their word, cheers or not.", next = "BACK", reply = "Then I'll keep my word, too, even when nobody's watching. That's what I'll do.", fx = { align = { honor = 1 }, affinity = 2 } },
        { text = "Mostly they get paid. Remember that.", next = "BACK", reply = "Paid? Heroes get paid? Then I'll be a hero and buy Hilary a new necklace.", fx = { align = { honor = -1 } } },
        { text = "Be a good friend first. That's a start.", next = "hero_friend" },
      },
    },
    hero_friend = {
      lines = {
        { id = "hf_default", text = "Like asking someone to find Hilary's necklace when I couldn't? ...Huh. Maybe I'm a little bit of a hero already, then, or a helper, which is nearly the same." },
      },
      choices = { { text = "Nearly the same.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },

    fish = {
      lines = {
        { id = "f_default", text = "Nothing all day, because the murlocs eat all the good ones. Effsee caught a frog, though, and she was very proud of it, so we counted that." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Can I really? Hilary's going to be so jealous, because her mum says one cat is plenty. Does {pet} like fish, do you think, because I've caught three little ones and nobody wants them." } },
      choices = {
        { text = "Go on, {pet} loves fish.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Careful, now. Pets bite strangers.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    paladin = {
      lines = { { id = "pa_default", text = "A real paladin, with the Light and the hammer and everything? Could you make it glow, just a little, so I can tell Hilary I saw it?" } },
      choices = {
        { text = "Just a little.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "The Light isn't a trick for showing off.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
  },

  topics = {
    onyxia = { { id = "tp_onyxia", text = "Is there really a dragon in a swamp who eats knights for breakfast? Hilary says she's real, and I said I'd fight her, and now Hilary won't stop laughing at me." } },
    valley_of_heroes = { { id = "tp_valley_of_heroes", text = "My da took me to Stormwind once, and I saw the statues in the Valley of Heroes, and they were so big I fell over looking up. I'm going to be up there one day, right next to the biggest one." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "Hilary and I saved our coppers all year for the Darkmoon Faire, and then I spent mine on a whistle and she got a little stuffed murloc. She won, I think, though the whistle's very loud." } },
    thrall = { { id = "tp_thrall", text = "The soldiers say the orcs have a big chief called Thrall who lives across the sea. I asked if he was bigger than the Blackrock ones, and they told me to go fish." } },
    knows = { { id = "tp_knows", text = "I know lots of things! Mostly about the dock, and Hilary, and Effsee. Ask me!" } },
    background = { { id = "tp_bg", text = "I live in Lakeshire and I'm going to be a hero, that's my whole story so far." } },
    advice = { { id = "tp_ad", text = "Don't swim in the lake, my mom says, so I'm saying it too." } },
    blackrock = { { id = "tp_blackrock", text = "The orcs are across the lake. I'm not allowed to look at them, but I look sometimes." } },
    _none = { { id = "tp_none", text = "I don't know that one. Is it a grown-up thing?" } },
  },
}

P:NPC {
  key = "hooper", id = TODO_NPC("Matthew Hooper"), name = "Matthew Hooper",
  bible = "bibles/lakeshire_more.md", role = "trainer", tier = "service",
  communities = { "lakeshire" }, temper = { "patient" }, values = { "patient", "practical" },
  notices = { "craft", "class", "lock_shadow" },

  impression = {
    first = "To him the lake is an old friend keeping bad company.",
    third = "{name} met Matthew Hooper, who teaches fishing on the Lakeshire docks.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, my best pupil. Come and sit on the end of the dock, where the lake's deepest and the quiet's best." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "If you've come to learn, then learn quietly. If not, the lake is big, and I'd rather you fished the far side of it." },
    { id = "g_default", text = "Quiet on the dock, if you would. The fish listen, even when the murlocs don't." },
    { id = "g_back", when = { metBefore = true }, text = "Back for another lesson? Good, the lake's in a teaching mood today." },
  },

  notice = {
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "You fish! I can see it in your hands, all those little line cuts. Come and tell me what's biting where you've been." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "The fish went deep the moment your shadow touched the water, and I've seen that happen with a heron but never with a person. Sit on the dock if you like, but sit with your back to the sun." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It wasn't, friend; it was peaceful once, like an old friend, and now it's full of murlocs and worse. Your water spirits might know how to cleanse it." } },
      choices = {
        { text = "A good catch comes from patience, not from luck or tricks.", next = "BACK", reply = "That's the whole of it, friend. The lake rewards the ones who wait, and nobody else.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "I'd throw a bit of blasting powder in and scoop them up.", next = "BACK", reply = "That's how you empty a lake for a generation, friend, and you'll learn nothing from it.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Then let's restore it, Matthew. The lake deserves peace.", next = "BACK", reply = "Let's, and I'll fish it every morning until it's peaceful again. Thank you, friend.", fx = { align = { order = 1 } } },
        { text = "The lake's ruined. Fish somewhere else.", next = "BACK", reply = "Somewhere else? There's no other water I'd rather fish. I'll stay with my old friend.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "It does mine, and I've had a few troubles, though nothing like yours, I'd wager. Sit on the dock for an hour with a line in the water and see whether whatever whispers to you doesn't go quiet for a while." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "It does mine, and maybe it'd do yours, though I doubt the fish will bite with that thing of yours glaring at the water. Send it off for an hour, sit with a line, and see whether whatever whispers to you doesn't go quiet for a while." },
      },
      choices = {
        { text = "I might try that, Matthew. Thank you.", next = "BACK", reply = "Do, and you'll find it does wonders. The lake's good at listening.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "What whispers to me is worth hearing.", next = "BACK", reply = "Then it'll not be quiet, and you'll not catch anything, and I'll have the best seat on the dock to watch.", fx = { align = { light = -1 } } },
        { text = "Something else, Matthew.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Some do, and they're the worst at it, because they can't abide waiting for anything. Lake Everstill teaches patience whether you like it or not, and a mage with patience would be a frightening thing, I'd think." } },
      choices = {
        { text = "Then I'll learn patience at your lake.", next = "BACK", reply = "Then you'll be the most frightening mage in Redridge, and the best fisherman. Grab a rod.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Patience is for those without spells.", next = "BACK", reply = "Then you'll never catch a fish worth having. The lake doesn't care about spells.", fx = { align = { order = -1 } } },
        { text = "Something else, Matthew.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Plenty, friend, for both are about waiting quietly for the right moment and then moving quick. The difference is that a fish doesn't hold a grudge, and from what I hear, the people you rob do." } },
      choices = {
        { text = "I'd rather fish than rob, Matthew.", next = "BACK", reply = "Then you'll make a fine fisherman, I think. The lake will be glad of you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Grudges are a risk of the trade.", next = "BACK", reply = "They are, and fish are kinder. Think on it, friend.", fx = { align = { honor = -1 } } },
        { text = "Something else, Matthew.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A fair bit, because both are about waiting for the right moment and then not hesitating. The murlocs taught me that, since they hit the line fast and you've got to be faster, or they'll take your rod as well." } },
      choices = {
        { text = "Patience first, then the strike. I like that.", next = "BACK", reply = "That's the way of it, and you'd make a fair angler. Grab a rod and see.", fx = { align = { order = 1 } } },
        { text = "I'll stick to fighting. Fish don't fight back.", next = "BACK", reply = "They do, if they're murlocs. Mind your fingers.", fx = { align = { order = -1 } } },
        { text = "Something else, Matthew.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Murlocs by the hundred, and they're the least of it, because there was something big in the deep water last summer that broke three lines in an afternoon. I'd like to know what it was, and then I'd like it gone." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Murlocs by the hundred, and something big in the deep water last summer that broke three lines in an afternoon. Your {pet} is watching the water like it wants a fish, {class}, and I'll give it one, because a hungry beast is a noisy one." },
      },
      choices = {
        { text = "I'll find what's breaking your lines.", next = "BACK", reply = "Would you? Then I'll sleep easier, and so will the trout. It was a big one.", fx = { align = { honor = 1 } } },
        { text = "Let the lake keep its secrets. I've enough to hunt.", next = "BACK", reply = "Fair enough, though I'd like to know. Maybe someday I'll find out myself.", fx = { align = { honor = -1 } } },
        { text = "Something else, Matthew.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "In a way, every morning, when I cast the first line and hope something's still alive down there besides murlocs. My father taught me that a lake has a soul, same as a man, and Everstill's has been troubled since the war came." } },
      choices = {
        { text = "Then I'll pray with you for the lake's healing.", next = "BACK", reply = "That would mean a great deal to me, and maybe to the lake. Thank you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A lake has no soul, Matthew. It's only water.", next = "BACK", reply = "Maybe so, friend, but my father would have argued with you. I'll keep my soul and the lake's both.", fx = { align = { light = -1 } } },
        { text = "Something else, Matthew.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Driven back, aye, but not all the way, because they were here before Lakeshire was and they'll be here after. It's the new ones that worry me, the poachers, because they fish like someone's paying them." } },
      choices = {
        { text = "Leave the old ones in peace. They have their place too.", next = "BACK", reply = "That's how I see it, and the lake was theirs first. The poachers are another matter.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Clear them all. A murloc is a murloc, Matthew.", next = "BACK", reply = "Then you'd have the old ones and the poachers both gone, and the lake would be quieter. I'm not sure it'd be better.", fx = { align = { light = -1 } } },
        { text = "Something else, Matthew.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The water's gone cloudy along the east shore where the orcs dump their ash, and the trout there come up thin and pale. My father would have said the lake's heartsick, and I've started saying it too." } },
      choices = {
        { text = "Then the orcs must answer for what they've poured into it.", next = "BACK", reply = "They must, and someday they will. Until then, I'll fish the west shore.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A lake that large will wash itself clean. Give it time.", next = "BACK", reply = "Maybe it will, and I hope you're right. My father would be sad to see it like this.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Matthew Hooper. I teach fishing, which is mostly teaching patience with a stick and string. Lake Everstill used to be the best water in the kingdom, and it still is, if you can get to it past the murlocs." },
        { id = "h_poachers", when = { questDone = TODO_QUEST("Murloc Poachers") },
          text = "Since someone thinned the murlocs on the east shore, my students have actually caught things. One of them cried, and I nearly did too." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior on my dock. Sit down and hold a rod, and we'll see if you've the patience for something that doesn't fight back straight away." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, and you'll understand what I mean when I say Lake Everstill is an old friend that's fallen in with bad company." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Sit and hold a rod a while, because fishing's the nearest thing to prayer I know." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin on my dock. Patience is a virtue, they say, so sit down and see if you've got it." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! You'll understand what I mean, then, when I say Lake Everstill has been out of sorts for years." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue! Well, a rogue's patience is a fisherman's patience, so you might be better at this than most." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! I've heard your kind can conjure water, though I don't suppose you can conjure fish in it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "You'd be surprised how many folk come to fishing to quiet something in their heads, and I'd guess yours is noisier than most." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman by the lake. The Everstill's fallen in with bad company, and it's murlocs, mostly." },
      },
      again = {
        { id = "h_again", text = "What else? The line's out, so I've time." },
        { id = "h_again2", text = "Go on, then. Fish don't mind talk if it's soft." },
      },
      choices = {
        { text = "Teach me to fish.", next = "BUSINESS" },
        { text = "What's wrong with the lake?", next = "lake" },
        { text = "Does the lake have any old legends?", next = "thresher" },
        { text = "What do you think of the murlocs?", next = "murlocs" },
        { text = "Is fishing anything like fighting, Matthew?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What lives in Lake Everstill besides fish, Matthew?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "You speak of the lake like an old friend. Do you pray for it?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should the murlocs be driven out of the lake entirely?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What's ailing the lake, Hooper? I'd like to understand it.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Is fishing really like a rogue's work, Matthew?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do mages ever take up fishing, Matthew?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Does fishing really quiet a troubled head, Matthew?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "The lake can't always have been so troubled, Matthew.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good fishing, Matthew.", next = "END" },
      },
    },

    lake = {
      lines = {
        { id = "l_default", text = "Murlocs in the shallows, gnolls on the north shore, orcs to the east, and a bridge missing in the middle. The fish are fine, it's everything around them that's gone wrong." },
      },
      choices = {
        { text = "Where's the best water left?", next = "lake_best" },
        { text = "Something else.", next = "BACK", fx = { learn = { "everstill_bridge" } } },
      },
    },
    lake_best = {
      lines = {
        { id = "lb_default", text = "Right here off the dock, where the guards can see you. The deep water east of the bridge is better, but a fish isn't worth an arrow in the back." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    thresher = {
      lines = {
        { id = "t_default", text = "The Lake Thresher, the old men call it, and they swear it took a whole skiff once. I've never seen it, but I've seen a line go out so fast it smoked, and I don't fish the deep water alone anymore." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    murlocs = {
      big = true,
      lines = {
        { id = "m_default", text = "They're fishermen, same as us, and better at it, which is the trouble. Baren thinks something drove them here, and I think they found good water and told their friends." },
      },
      choices = {
        { text = "Then drive them out. The lake's ours.", next = "BACK", reply = "Ours, aye, mostly. I'll fish it, and they'll fish it, and we'll see who blinks first.", fx = { align = { order = 1 } } },
        { text = "Share the lake. They were hungry first.", next = "BACK", reply = "That's what I think too. The lake's big enough for all of us, if the poachers would only leave the shallows alone.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    murlocs_east = { { id = "tp_murlocs_east", text = "The murlocs in Everstill have learned where every good trout lies, and they get there first and leave nothing behind. I've fished this lake since I was a boy, and I've never been out-fished by a fish before." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's got the best fishing in the world, so the sailors say, and a goblin there pays good gold for a big catch. I'd go and see, but somebody's got to keep this lake honest." } },
    gilneas = { { id = "tp_gilneas", text = "I fished with a Gilnean once, a sour old fellow who said the sea had better manners than people. I didn't argue with him, because I'd met people." } },
    ratchet = { { id = "tp_ratchet", text = "The goblins of Ratchet sell a lure they swear brings fish leaping into the boat, and I bought one once, out of curiosity. It exploded in my tackle box, which I suppose is a goblin's idea of fishing." } },
    knows = { { id = "tp_knows", text = "I know the lake, its fish, and a few of its stories, true and otherwise. Which do you want?" } },
    background = { { id = "tp_bg", text = "I fish, and I teach others to fish, and that's been enough for one life so far." } },
    advice = { { id = "tp_ad", text = "Fish where the guards can see you; no fish is worth an arrow in the back." } },
    _none = { { id = "tp_none", text = "Can't say, friend; I know water, not that." } },
  },
}

P:NPC {
  key = "wental", id = TODO_NPC("Bartender Wental"), name = "Bartender Wental",
  bible = "bibles/lakeshire_more.md", role = "vendor", tier = "service",
  communities = { "lakeshire" }, temper = { "cheerful" }, values = { "friendly", "practical" },
  notices = { "hunger", "drink" },

  impression = {
    first = "He gets asked for ale fifty times a day and mostly smiles.",
    third = "{name} met Bartender Wental, who sells food and soft drink at the Lakeshire Inn.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again, and still not asking for ale! Come up to the counter, friend, and have your pick of today's cheese." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Bread, cheese and milk, same as always. Buy what you need, and I'll get back to my other customers." },
    { id = "g_default", text = "Bread, cheese, a good cut of meat, and milk. No, not ale; Daniels does the ale." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! And you didn't ask for ale. Light bless you, friend." },
    { id = "g_dry", when = { questActive = TODO_QUEST("Dry Times") }, text = "Running Daniels's errand? Then you'll know why everyone keeps asking me for drink, since he's got none." },
  },

  notice = {
    { id = "n_hungry", cat = "hunger", when = { nearlyNaked = true },
      text = "Light's sake, friend, where's the rest of your clothes? Eat something, at least; you look half starved and half frozen." },
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "You've had plenty already, I can see. Have some bread to soak it up; it's on the menu, and it works." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Daniels serves ale; I serve food. People forget, and I remind them with good humour, mostly." } },
      choices = {
        { text = "Fair food at a fair price keeps a hungry town going.", next = "BACK", reply = "That's my thinking. With the roads cut, nobody in Lakeshire can afford to be robbed at the counter.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "With the roads cut, you could charge triple for bread.", next = "BACK", reply = "I could, and then I'd be the most hated man in Lakeshire. I'll leave that honour to the orcs.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Good humour's a virtue, Wental. Keep it.", next = "BACK", reply = "I will, friend, it's the only virtue I've got left. Bread and cheese?", fx = { align = { honor = 1 } } },
        { text = "Just serve the ale. People want it.", next = "BACK", reply = "I'd love to, friend, but Daniels has it and he hasn't got any. Bread and milk it is.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Not much, for a man still wants his bread fresh from the oven, whatever he can conjure. Mind, a mage once filled my water barrels during a dry spell and wouldn't take a copper for it, and I've thought kindly of your kind ever since." } },
      choices = {
        { text = "I'd fill your barrels gladly, Wental.", next = "BACK", reply = "Then I'll hold you to it come the next dry spell, and I'll think kindly of you every time I knead the bread.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "My water isn't for giving away.", next = "BACK", reply = "That's fair, and I'll not ask again. Bread and cheese, then?", fx = { align = { honor = -1 } } },
        { text = "Something else, Wental.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every warrior thinks so, and they all ask me, and I tell them all the same thing: bread and milk will carry you further than ale. The ones who listen tend to come back, and the ones who don't tend to ask Daniels." } },
      choices = {
        { text = "Bread and milk, then. I'll fight with a clear head.", next = "BACK", reply = "That's the way, and you'll come back, I'd wager. Milk's on the counter.", fx = { align = { order = 1 } } },
        { text = "I'll see Daniels. A warrior needs his courage.", next = "BACK", reply = "Then you'll be disappointed, since he's out. Come back for bread when you're done.", fx = { align = { order = -1 } } },
        { text = "Something else, Wental.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Not me, but Sherman on the block will, and Chef Breanna will too, for the soldiers' stew. Bring them boar or condor and you'll eat well here for a week." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Not me, but Sherman on the block will, and Chef Breanna too, for the soldiers' stew. Your {pet} is looking at my cheese, {class}, and I'll let it have the rind, but no more than that." },
      },
      choices = {
        { text = "I'll hunt for the soldiers' stew.", next = "BACK", reply = "That's good of you, and the soldiers will be grateful. Bring it to the back.", fx = { align = { honor = 1 } } },
        { text = "I'll hunt, but I'll eat the best cuts myself.", next = "BACK", reply = "Then you'll eat well, and the soldiers will eat stew. Fair enough.", fx = { align = { honor = -1 } } },
        { text = "Something else, Wental.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Don't tempt me, friend, because I'd be first in line and Bailiff Conacher would be second. The Magistrate's ruled no ale till the road's clear, and I've got to live here after you've gone." } },
      choices = {
        { text = "Laws are laws. I'll keep to them.", next = "BACK", reply = "That's the spirit, and Conacher will be pleased. Bread and milk, then?", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Rules bend for ale, Wental.", next = "BACK", reply = "They do, friend, but not in this inn and not today. Sorry.", fx = { align = { honor = -1 } } },
        { text = "Why no ale, then?", next = "noale" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "Does it now? Well, drink it quick, then, before it notices you. I've had stranger customers this month, though not many, and none of them complained about the cheese." } },
      choices = {
        { text = "Sorry. I'll keep it to myself.", next = "BACK", reply = "Thank you, friend. The cheese and I appreciate it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A little sourness never killed anyone.", next = "BACK", reply = "No, but it ruins good milk. Drink it quick, please.", fx = { align = { light = -1 } } },
        { text = "Who eats here these days?", next = "eaters" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "They do, and they pay what they can, and Brianna and I square the rest at the end of the week without telling Daniels. Nobody goes hungry under this roof, and the day someone does, I'll hand in my apron." } },
      choices = {
        { text = "That's charity rightly done, Wental.", next = "BACK", reply = "It is, and I'm glad someone sees it. Don't tell Daniels.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Brianna's too soft. The inn will go under that way.", next = "BACK", reply = "Too soft, maybe, but nobody's gone hungry yet. I'll take the risk.", fx = { align = { light = -1 } } },
        { text = "Something else, Wental.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Sleep, mostly, and a letter from home, and something to eat that isn't goulash. I can manage the last one, and I'd gladly manage the others if I knew how." } },
      choices = {
        { text = "Then I'll carry letters for them when I travel.", next = "BACK", reply = "That'd be kind, and they'd thank you more than they'd say. Ask at the barracks.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Soldiers knew the life when they signed on.", next = "BACK", reply = "They did, but they didn't know it'd be this long. I'll keep feeding them.", fx = { align = { honor = -1 } } },
        { text = "Something else, Wental.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "From the Jainrose farm and the two herds still grazing by the lake, though they lose a cow to the gnolls every week or so. Martie says she'll keep milking till the last one's gone, and I believe her." } },
      choices = {
        { text = "Bring the herds inside the town. Safety comes first.", next = "BACK", reply = "Inside? There's no room inside, friend, not for cows. I'll tell Martie you said so, though.", fx = { align = { order = 1 } } },
        { text = "Cows need open pasture. Let them graze, and guard them.", next = "BACK", reply = "That's what Martie says, and I believe her. Guard them, if you can.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Wental, bartender of the Lakeshire Inn, though I don't pour a drop of anything strong. Daniels has the barrels, I have the bread, and between us nobody goes hungry or thirsty, most weeks." },
        { id = "h_dry_before", when = { questBefore = TODO_QUEST("Dry Times") },
          text = "Daniels's shipment's late again, so everyone's been coming to me for drink, and I've had to tell forty soldiers that milk is very good for the bones." },
        { id = "h_dry_done", when = { questDone = TODO_QUEST("Dry Times") },
          text = "Daniels has his bottles back, thank the Light, and I can go back to being asked for bread like a normal bartender." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and you'll be asking for ale, I suppose, so I'll save you the trouble: I've milk, and Daniels has the ale, when he has any." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, and you'll want some cheese for the road and a bit of meat for your beast, I'd wager, and I've plenty of both." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Bread, cheese, milk and no ale, which I'd guess suits you better than most." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll be one of the few who orders milk without pulling a face, I'd wager." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A druid! Milk, bread and cheese is all I serve, and I'd guess a night elf won't miss the ale as much as the soldiers do." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! I've no strong drink, but I've bread and cool water, and I'd guess you can make your own of both." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Bread, cheese, meat or milk? Not ale, before you ask, because I'm asked fifty times a day." },
      },
      again = {
        { id = "h_again", text = "What else can I do for you? And no, still no ale." },
        { id = "h_again2", text = "Go on. The bread's warm, and I'm guarding it from those two children off the dock, who think I can't count loaves." },
      },
      choices = {
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "A bartender without ale is a strange sight.", next = "noale" },
        { text = "Who eats here?", next = "eaters" },
        { text = "How's the town holding up?", next = "town" },
        { text = "I know where a cask of ale might fall off a wagon.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Doesn't a warrior need ale before a fight, Wental?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Does the inn buy game, Wental?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'll take milk. Something about me sours it anyway.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do the poor in Lakeshire eat at the inn, Wental?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What do the soldiers need most, Wental, besides ale?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Where does your milk come from, with the farms under threat?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Does conjured food hurt your trade, Wental?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "I'd have expected an inn to serve ale, Wental.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Just the bread, thanks.", next = "END" },
      },
    },

    noale = {
      lines = {
        { id = "na_default", text = "I know, I know, I've heard every joke there is. Somebody hung the sign before I took the job, and Daniels said changing it would confuse the regulars, so here I am." },
      },
      choices = {
        { text = "Why not sell ale yourself?", next = "noale_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    noale_why = {
      lines = {
        { id = "nw_default", text = "And go to war with Daniels over the barrels? No thank you; I've seen what he does to a man who touches his tap. Bread doesn't start fights." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    eaters = {
      lines = {
        { id = "e_default", text = "Soldiers of the battalion when Chef Breanna's kitchen is full, which is always, and travellers waiting on the bridge. The bridge crew eat like a family of bears, and pay like one." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "everstill_bridge" } } } },
    },

    town = {
      big = true,
      lines = {
        { id = "t_default", text = "Nervous, if you ask me. The orcs are across the lake, the gnolls are in the hills, and folk keep saying Stormwind should send more soldiers. I'm just a bartender, but I keep wondering who'd feed them if it did." },
      },
      choices = {
        { text = "Stormwind will send help. Trust the marshal.", next = "BACK", reply = "I'll trust him, then, and keep the bread coming. Thank you.", fx = { align = { order = 1 } } },
        { text = "Lakeshire should arm itself and stop waiting.", next = "BACK", reply = "Arm itself with what, bread knives? I'll leave that to the Marshal.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    booty_bay = { { id = "tp_booty_bay", text = "Half my customers ask if I've got Booty Bay rum, and I don't, and I've got milk, which somehow disappoints them more. The road from the south has orcs on it, and milk doesn't sail." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire sells a cheese that's been aged in a cave somewhere in Kalimdor, and I tasted it once. I've been ashamed of my own cheese ever since, though nobody else seems to mind." } },
    dark_iron = { { id = "tp_dark_iron", text = "I was asked for Dark Iron ale three times this morning by a dwarf, and I told him I had milk. He looked at me the way an orc looks at a gnoll, and I've decided to take it as a compliment." } },
    holy_light = { { id = "tp_holy_light", text = "I'm not much of a churchman, but I bless the bread before I set it out, the way my mother did. It's a habit more than a prayer, though the Light can take it either way." } },
    knows = { { id = "tp_knows", text = "Everyone talks at a bar, even one with no ale, so I hear a fair bit. What would you like to know?" } },
    background = { { id = "tp_bg", text = "I'm the bartender who doesn't serve drink, which is the only interesting thing about me." } },
    advice = { { id = "tp_ad", text = "Eat before you go into the hills; a hungry fighter makes mistakes, and gnolls don't." } },
    _none = { { id = "tp_none", text = "No idea, friend, but would you like some bread while you think about it?" } },
  },
}

P:NPC {
  key = "alma", id = TODO_NPC("Alma Jainrose"), name = "Alma Jainrose",
  bible = "bibles/lakeshire_more.md", role = "trainer", tier = "service",
  communities = { "lakeshire" }, temper = { "gentle" }, values = { "patient", "kind" },
  notices = { "craft", "class" },

  impression = {
    first = "She speaks of the hills as a garden that's been trampled.",
    third = "{name} met Alma Jainrose, who teaches herbalism in Lakeshire.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There you are, and with clean cuts on your stems, I'd wager. Come in, and let's see what you've learned." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Wipe your boots, if you must come in. I'll teach you what's owed, but I've not forgotten how you've behaved." },
    { id = "g_default", text = "Wipe your boots, please; I've seedlings drying by the door." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Show me your hands, and tell me you've been cutting the stems, not tearing them." },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You've been gathering, I can smell the briarthorn on you. Good; now let's see if you've been doing it properly." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid! I've always wondered whether your sort hear the plants complain. Don't tell me if they do; I'd never pick another leaf." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They are, and the orcs and gnolls trample them more each day. Your spirits might help them heal." } },
      choices = {
        { text = "An herbalist should leave enough root for the plant to return.", next = "BACK", reply = "Yes, exactly that. Take a little from every patch, and the hills will feed you for years.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Strip the whole patch; someone else will pick it if I don't.", next = "BACK", reply = "And then nobody picks it next year, dear. The hills only give as much as we leave them.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Then let's help them heal, Alma. Gently.", next = "BACK", reply = "Gently, yes, that's the only way. Thank you for understanding.", fx = { align = { light = 1 } } },
        { text = "Gardens grow back. Don't fret about it.", next = "BACK", reply = "They do, but slowly, and the gnolls don't wait. I'll fret, thank you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because I teach herbalism to heal folk, not to drug them, and I've seen what a careless hand does with the wrong root. Learn the healing herbs first, and if you still want the other kind after that, at least you'll know what you're doing." } },
      choices = {
        { text = "Healing herbs first, then. You have my word.", next = "BACK", reply = "Good, then you'll learn properly. Come back when you've learned the first three.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll learn what I need, healing or not.", next = "BACK", reply = "Then you'll learn it somewhere else. Not from me.", fx = { align = { light = -1 } } },
        { text = "Something else, Alma.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Peacebloom for the bruises and silverleaf for the cuts, and a good poultice will have you back on your feet before the healer's finished his prayer. You'd be surprised how many warriors don't know a single plant that could save their life." } },
      choices = {
        { text = "Teach me a few. A warrior should know how to heal himself.", next = "BACK", reply = "Gladly, and you'll thank me for it. Peacebloom first, then silverleaf.", fx = { align = { order = 1 } } },
        { text = "That's what healers are for. I'll swing the sword.", next = "BACK", reply = "Then I hope there's always a healer nearby. There usually isn't.", fx = { align = { order = -1 } } },
        { text = "Something else, Alma.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Briarthorn under the trees and earthroot in the open, and if you see a patch of it torn up, that'll be the boars or the gnolls. The hills grow more than people think, and I'd like to know before it's all been rooted out." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Briarthorn under the trees and earthroot in the open, and torn-up patches mean boars or gnolls. Your {pet} has been sniffing my peacebloom, {class}, and it's a good nose, because that patch is the best in Lakeshire." },
      },
      choices = {
        { text = "I'll gather gently and leave the roots.", next = "BACK", reply = "That's the way, and the hills will thank you. Leave a little for next year.", fx = { align = { order = 1 } } },
        { text = "I'll gather what I need. The hills can regrow.", next = "BACK", reply = "They can, but slower than you'd think. Take what you need, and no more.", fx = { align = { order = -1 } } },
        { text = "Something else, Alma.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Reagents are herbs someone in Stormwind dried, put in a pretty bottle and charged you double for. Learn to pick your own, mage, and you'll never pay the Mage Quarter's prices again." } },
      choices = {
        { text = "The proper reagents come from proper shops.", next = "BACK", reply = "They do, and they cost double. Suit yourself, mage.", fx = { align = { order = 1 } } },
        { text = "I'll pick my own, then. Teach me.", next = "BACK", reply = "Gladly, and you'll save a fortune. Come back in the morning.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "What grows around here?", next = "herbs" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "Some do, and I know which ones, and I don't pick them. Grave moss is for necromancers and fools, and Redridge has had enough of both since the sorcerer Morganth took his tower in the foothills." } },
      choices = {
        { text = "Wise. Leave the grave moss in the ground.", next = "BACK", reply = "It is, and I'm glad you see it. Redridge has had enough of that.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power grows where it grows, Alma.", next = "BACK", reply = "It does, and some of it should stay buried. Leave it, please.", fx = { align = { light = -1 } } },
        { text = "Do you teach Martie?", next = "martie" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "No, and before the war you could walk from here to Stonewatch through briarthorn so thick it caught your skirts. The Blackrock burn what they don't trample, and I've seen whole hillsides go black that'll take ten years to green again." } },
      choices = {
        { text = "Then I'll pray for the hills, and help you replant.", next = "BACK", reply = "I'll take the help, and gladly. Bring gloves, because briarthorn lives up to its name.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Burnt land is the price of war. Accept it, Alma.", next = "BACK", reply = "Accept it? I've accepted it for years, and I still replant. Someone has to.", fx = { align = { light = -1 } } },
        { text = "Something else, Alma.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I already do, every week, and the gnolls haven't caught me yet because they don't notice a woman bent over a bush. Martie thinks I'm mad and the healer thinks I'm a saint, and I think the herbs don't pick themselves." } },
      choices = {
        { text = "Next time, I'll stand guard while you gather.", next = "BACK", reply = "Would you? Then I'll gather twice as much and bring it to the healer. Thank you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "That's your risk, Alma. Don't ask others to share it.", next = "BACK", reply = "I don't ask anyone to share it; I just do it, and that's the difference.", fx = { align = { honor = -1 } } },
        { text = "Something else, Alma.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Alma Jainrose, and I teach herbalism to anyone who'll listen and a few who won't, Martie by the lake among them. Redridge grows more than people think, if the gnolls and the boars leave anything standing." },
        { id = "h_bellygrub", when = { questDone = TODO_QUEST("An Unwelcome Guest") },
          text = "Martie says you dealt with that boar in her garden. I've been telling her to build a better fence for years, so I'm glad somebody solved it the other way." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and I'll ask you nicely, the same as I ask everyone: don't trample my herbs on your way out to fight." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, and you'll be out in the hills more than anyone in town, so you can tell me what's growing and what's been trampled flat." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Healers and herbalists ought to be friends, so mind you don't pull my peacebloom up by the roots." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Your sort tread heavy, so mind my beds as you go." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue! You'll want to know which herbs put a body to sleep, I expect, and I'll tell you which ones to leave well alone." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Mind you don't pull my plants up by the roots, and tell me, do your earth spirits know how to treat a garden?" },
      },
      again = {
        { id = "h_again", text = "Something else? I'll keep sorting while you ask." },
        { id = "h_again2", text = "Go on, I'm listening, the leaves don't mind." },
      },
      choices = {
        { text = "Teach me herbalism.", next = "BUSINESS" },
        { text = "What grows around Lakeshire?", next = "herbs" },
        { text = "You and Martie must work together.", next = "martie" },
        { text = "Should herb lore be shared freely?", next = "share" },
        { text = "Herbs are fine, but reagents are what I really need.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do your herbs help warriors in a fight, Alma?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What should a hunter look for in the hills, Alma?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Some plants grow better where there's been death.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "The hills can't always have been this trampled, Alma.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would you gather herbs for the wounded out in gnoll country?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why would you warn a rogue off certain herbs, Alma?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you think the hills are a trampled garden, Alma?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Thank you, Alma.", next = "END" },
      },
    },

    herbs = {
      lines = {
        { id = "he_default", text = "Peacebloom and silverleaf near the water, briarthorn and bruiseweed in the hills, and a little mageroyal if you look under the pines. The gnolls trample the hill patches flat, and the guards bleed all over the lakeside ones." },
      },
      choices = {
        { text = "So the guards use your herbs.", next = "herbs_guards" },
        { text = "Something else.", next = "BACK", fx = { learn = { "redridge_gnolls" } } },
      },
    },
    herbs_guards = {
      lines = {
        { id = "hg_default", text = "For poultices, every day, since the orcs started coming over the hills. I'd rather grow flowers for their own sake, but bandages are what's needed." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    martie = {
      lines = {
        { id = "ma_default", text = "We share a name and a love of growing things, and she keeps the prettier garden, which she'll tell you herself. I teach, she grows, and between us most of the town's cuts get mended." },
      },
      choices = {
        { text = "She seems sweet on someone, doesn't she?", next = "martie_parker" },
        { text = "Something else.", next = "BACK" },
      },
    },
    martie_parker = {
      lines = {
        { id = "mp_default", text = "Seems? She talks about Guard Parker's patrols the way I talk about rare herbs. I keep my opinions to myself, because Darcy at the inn has opinions enough for all of Lakeshire." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    share = {
      big = true,
      lines = {
        { id = "s_default", text = "There's a question I argue with myself about. Teach everyone and the hills get stripped bare, or teach only the careful and leave folk without the cures they need." },
      },
      choices = {
        { text = "Teach everyone. Healing belongs to all.", next = "BACK", reply = "Maybe you're right, and I'll think on it tonight. Healing does belong to everyone.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Guard it. Careless hands kill the land.", next = "BACK", reply = "That's what my heart says too, though I feel guilty for it. Careful hands only, then.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    emerald_dream = { { id = "tp_emerald_dream", text = "A night elf druid passed through looking for herbs once and spoke of a green dream where the world grows as it should. I'd like to sleep there one night, if it's anything like the hills before the gnolls." } },
    elune = { { id = "tp_elune", text = "The night elves leave a little water out for their moon-goddess before they cut any herb, and I've started doing it too. I don't know if it helps the plants, but it slows me down, and that helps me." } },
    cenarion_circle = { { id = "tp_cenarion_circle", text = "The druids of the Cenarion Circle know more about growing things than anyone in Stormwind, and they're kind enough to share it if you don't trample their roots. I'd study with them if I could get to Moonglade." } },
    blackrock_spire = { { id = "tp_blackrock_spire", text = "The orcs stripped the hills bare all the way north to the Steppes, and from what I hear, nothing grows near that black mountain of theirs. I can't imagine living somewhere with no green at all." } },
    knows = { { id = "tp_knows", text = "Herbs, soil, and who in Lakeshire needs a poultice this week, which is most of us. Ask away." } },
    background = { { id = "tp_bg", text = "I grow things and teach others to, and that's all the story I've got." } },
    advice = { { id = "tp_ad", text = "Cut the stem and leave the root, and the plant will be there for the next person." } },
    redridge_gnolls = { { id = "tp_gnolls", text = "They trample everything I'd like to pick. I don't think they even notice the flowers." } },
    _none = { { id = "tp_none", text = "That's not something that grows, so I can't help you." } },
  },
}

P:NPC {
  key = "trent", id = TODO_NPC("Bridge Worker Trent"), name = "Bridge Worker Trent",
  bible = "bibles/lakeshire_more.md", role = "worker", tier = "service",
  communities = { "lakeshire" }, temper = { "gruff" }, values = { "hardworking", "loyal" },
  notices = { "craft", "kit", "lock_pact" },

  impression = {
    first = "He complains about his foreman with real affection.",
    third = "{name} met Bridge Worker Trent, one of Foreman Oslow's crew rebuilding the Everstill Bridge.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There you are. Grab the end of a beam if you like; you're the only one who ever offers." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Stay off the scaffold, and stay out of my way while you're at it." },
    { id = "g_default", text = "Mind your feet, there's stone everywhere and it all wants to land on someone." },
    { id = "g_back", when = { metBefore = true }, text = "You again? Grab the other end of this, then, if you're going to stand there." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { profession = { "Blacksmithing", "Engineering", "Mining" } },
      text = "A tradesman, by your hands! The foreman would hire you in a heartbeat, so don't let him see you." },
    { id = "n_lock_pact", cat = "lock_pact", when = { class = "WARLOCK", aura = { 6307, 7804, 7805, 11766, 11767 } },
      text = "You're running hot, friend, like a man who's carried stone all day, and you've not carried a thing. If that's the imp's doing, I wish I could borrow some of it for the afternoon shift." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I carry every block of it, and Oslow complains, and I complain about Oslow. Your spirits might lighten the load." } },
      choices = {
        { text = "Honest work's its own reward, Trent.", next = "BACK", reply = "It is, and it's the only reward Oslow gives. I'll keep hauling.", fx = { align = { honor = 1 } } },
        { text = "Let the spirits carry it. You've earned a rest.", next = "BACK", reply = "Rest? Oslow'd have my hide. I'll keep hauling, thank you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Hard but fair, and forever saying we're slow, though he'd say that to a gryphon. The Blackrock knocked the bridge down once and they'll try again, so if you're staying in Lakeshire, keep an eye on the hills while we work." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Hard but fair, and he'd call your demon slow too if it stood about the way it's doing now, so tell it to keep out from under the beams if it means to stay. The Blackrock knocked the bridge down once and they'll try again, so if you're staying in Lakeshire, keep an eye on the hills while we work." },
      },
      choices = {
        { text = "I'll watch the hills while you build.", next = "BACK", reply = "That's good of you, and the crew will work faster for it. Mind the far bank.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'm not here to mind a bridge, Trent.", next = "BACK", reply = "Fair enough, nobody is but us. I'll keep one eye on the hills myself.", fx = { align = { order = -1 } } },
        { text = "Something else, Trent.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Knocked it down the first time, and the second time they sent the gnolls to steal the mortar. The foreman says we're slow, but a man can't lay stone with one eye on the far shore." } },
      choices = {
        { text = "I'll watch the shore so you can watch your work.", next = "BACK", reply = "That'd be a help, and Oslow might even say thank you. Might.", fx = { align = { honor = 1 } } },
        { text = "Build faster. I've my own fights to finish.", next = "BACK", reply = "Faster? Tell that to the stones. I'll do what I can.", fx = { align = { honor = -1 } } },
        { text = "Something else, Trent.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Up into the hills past Alther's Mill, I'd guess, though nobody's been brave enough to follow them. A hunter could track them easy, I'd think, and bring back a pick or two if the gnolls haven't eaten them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Up into the hills past Alther's Mill, I'd guess, though nobody's been brave enough to follow them. Your {pet} would sniff out our tools in an afternoon, {class}, and I'd buy it a whole ham if it did." },
      },
      choices = {
        { text = "I'll track them and bring back your tools.", next = "BACK", reply = "You would? Then I'll owe you, and so will Oslow. Pick's got a notch in the handle.", fx = { align = { honor = 1 } } },
        { text = "Buy new tools, Trent. Gnolls aren't worth the chase.", next = "BACK", reply = "With what coin? I'll chase them myself if I have to.", fx = { align = { honor = -1 } } },
        { text = "Something else, Trent.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "You could, and I'd be grateful, because I hate feeling eyes on my back while I'm hauling. Every night there's a fire on the far bank where there wasn't one before, and Oslow says not to look at it." } },
      choices = {
        { text = "I'll find who lit it, and quietly.", next = "BACK", reply = "Quietly, aye, and come back and tell me. Oslow needn't know.", fx = { align = { honor = -1 } } },
        { text = "I'll stand guard here, where they can see me.", next = "BACK", reply = "That's good of you, and the crew will be glad to see you there. Thank you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Is the work dangerous?", next = "danger" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Could you? Then why have I been doing it with my back for eight months? Don't tell Oslow, because he'll have you on the payroll before supper." } },
      choices = {
        { text = "Honest labour builds a better bridge.", next = "BACK", reply = "That's what Oslow says, and he's right, I suppose. Back to the stones.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Work smarter, Trent. A good spell beats a sore back.", next = "BACK", reply = "A good spell, aye, but who pays the mage? I'll keep my back.", fx = { align = { order = -1 } } },
        { text = "What's Oslow like to work for?", next = "oslow" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Not in words, but every morning somebody touches the stone with the names on it before picking up a hammer, and nobody says anything. That's how we talk about it on this crew." } },
      choices = {
        { text = "That's a good way to remember. I'll touch it too.", next = "BACK", reply = "That's kind of you, and the crew will see it. They'll not say anything, but they'll see.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Better to forget, Trent. Grief only slows the work.", next = "BACK", reply = "Maybe it does, but we'll not forget. That's not how we work.", fx = { align = { light = -1 } } },
        { text = "Something else, Trent.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "They should, but they won't, and Oslow says a bridge built with our own hands is worth two built under guard. I'd still like a guard, mind, because I'm not as proud as the foreman." } },
      choices = {
        { text = "Stormwind should send soldiers. That's what the crown is for.", next = "BACK", reply = "It is, and they should, and they don't, so here we are, masons playing soldier with a trowel in one hand.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Don't wait on Stormwind. Arm the crew yourselves.", next = "BACK", reply = "With what, hammers? We'd do it if we could. Oslow would lead the charge.", fx = { align = { order = -1 } } },
        { text = "Something else, Trent.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "From the quarry up the north shore, a cart at a time, and every cart has to pass a gnoll camp on the way down. Oslow says the hill gives the stone and the gnolls charge the toll, and he's not wrong." } },
      choices = {
        { text = "Then I'll clear that quarry road. The work should go on.", next = "BACK", reply = "That'd be a help, and the carts would move faster. Thank you, friend.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let the gnolls keep it. Find stone somewhere quieter.", next = "BACK", reply = "There's nowhere quieter, friend, not in Redridge. The gnolls have found every quarry from here to Stonewatch.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Trent, one of Oslow's crew. The Blackrock knocked the bridge down, and we're putting it back up, one stone at a time, while the foreman tells us we're slow." },
        { id = "h_tools", when = { questDone = TODO_QUEST("The Lost Tools") },
          text = "You fished the foreman's toolbox out of the lake! He's been humming, and none of us knew he could hum." },
        { id = "h_bridge", when = { questDone = TODO_QUEST("The Everstill Bridge") },
          text = "Those iron pikes you took off the gnolls are holding up the new span now. I'll think of you every time I walk across it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll not be much help with the stones, I'd guess, but you might be some help with the orcs, and the orcs are what slow us down." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, and you'll know the hills, then, and you'll know where the gnolls take the things they steal from us." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Bless the bridge if you like, but say one for my back while you're at it." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. You'll be some help with the orcs, I'd wager, and maybe even with the stones." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. Don't let Oslow see you standing about, or he'll have you hauling stone in bear shape before supper." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Is that thing at your heel any good at carrying stone? The foreman would put it to work, and he'd still say it was slow." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Blackrock", min = 20 } }, text = "No Blackrock scouts have come down to the bridge in days, and Oslow's had to find something else to complain about. I hear we've you to thank, so thank you." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Oslow's a slave driver, but I love him for it. Can your earth spirits lift a stone or two?" },
      },
      again = {
        { id = "h_again", text = "Something else? Quick, the foreman's looking." },
        { id = "h_again2", text = "Go on, then. I could use the rest, and I've a blister on my palm the size of a copper." },
      },
      choices = {
        { text = "The bridge doesn't look much closer to done.", next = "bridge" },
        { text = "What's Foreman Oslow like to work for?", next = "oslow" },
        { text = "Is the work dangerous?", next = "danger" },
        { text = "Should Stormwind pay you more for this?", next = "pay" },
        { text = "The orcs watch your bridge. I could watch them back.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I could lift that block with a spell.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What's the worst the Blackrock have done to the bridge, Trent?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Where do the gnolls take your stolen tools, Trent?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Does the crew ever talk about the men it's lost?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should Stormwind send soldiers to guard your crew, Trent?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Where does the stone for the bridge come from, Trent?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What's Foreman Oslow like to work for, Trent?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "You must carry the bridge stone by stone, Trent.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Back to work with you.", next = "END" },
      },
    },

    bridge = {
      lines = {
        { id = "b_default", fx = { learn = { "everstill_bridge" } },
          text = "Slowly. The orcs sank our tools, the gnolls stole our iron, and the rains are coming. Every span we lay, the foreman stands on it a while like it's his own child." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    oslow = {
      lines = {
        { id = "o_default", text = "Hard, fair and never satisfied. He'll shout at you for a crooked stone and then buy you a drink at the inn for a straight one, and you'll work twice as hard the next day for the drink." },
      },
      choices = {
        { text = "Sounds like a good foreman.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    danger = {
      lines = {
        { id = "d_default", text = "Falling stone, cold water and the odd orc arrow from across the lake. We work in pairs, and one of us always watches the far shore." },
      },
      choices = {
        { text = "Have you lost anyone?", next = "danger_lost" },
        { text = "Something else.", next = "BACK", fx = { learn = { "blackrock" } } },
      },
    },
    danger_lost = {
      lines = {
        { id = "dl_default", text = "Two to the catapults and a lad to the lake, and the foreman means to stop at that. He'd rather the bridge was late than one more of us was buried under it, though he'd never say so out loud." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    pay = {
      big = true,
      lines = {
        { id = "p_default", text = "More? We'd settle for paid on time. I've heard what happened to the masons who built Stormwind and never saw their coin, so we all keep an eye on the purse." },
      },
      choices = {
        { text = "Stormwind will pay in the end. Trust the crown.", next = "BACK", reply = "Trust the crown, aye, I'll try. But I'll keep my eye on the purse.", fx = { align = { order = 1 } } },
        { text = "If they don't, stop work until they do.", next = "BACK", reply = "That's what the masons did, and look where they are now. We'll keep working, for now.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK", fx = { learn = { "stonemasons" } } },
      },
    },
  },

  topics = {
    thandol_span = { { id = "tp_thandol_span", text = "The dwarves built the Thandol Span over a gorge you could drop a city into, and Oslow still says ours is harder. That's because he's not had to carry stone across theirs." } },
    deadmines = { { id = "tp_deadmines", text = "The Defias are hiding in the old Moonbrook mines, I hear, and they took half Stormwind's stonemasons with them. Oslow's never been prouder that we stayed honest, and never been shorter of good hands." } },
    stonemasons = { { id = "tp_stonemasons", text = "A lot of the lads I trained with joined the Stonemasons' Guild and went bad when the nobles wouldn't pay them. I'd have gone too, maybe, if Oslow hadn't found me first and shouted at me until I stayed." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I won a strength contest at the Darkmoon Faire once, and the prize was a ribbon and a very sore back. Oslow made me carry stone the next morning anyway." } },
    knows = { { id = "tp_knows", text = "I know stone, the bridge, and what the foreman likes for breakfast. That's about the lot." } },
    background = { { id = "tp_bg", text = "I carry stone for a living, and I'm carrying this bridge across a lake, that's all." } },
    advice = { { id = "tp_ad", text = "Lift with your legs, not your back, and never stand downhill of a block." } },
    everstill_bridge = { { id = "tp_bridge", text = "Our bridge, near enough; we'll have it up before the rains if the foreman's right, and he usually is.", next = "bridge" } },
    _none = { { id = "tp_none", text = "Ask the foreman, he knows everything, or says he does." } },
  },
}
