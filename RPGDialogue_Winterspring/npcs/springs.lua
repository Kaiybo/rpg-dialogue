-- Winterspring's wilds: the hot springs and the E'ko witch doctor. Voice: bibles/winterspring.md
local P = RPGDialogueAPI:Pack("rpgd.winterspring")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "donova", id = TODO_NPC("Donova Snowden"), name = "Donova Snowden",
  bible = "bibles/winterspring.md", role = "questgiver", tier = "quest",
  communities = { "winterspring_wilds" }, temper = { "warm" }, values = { "curious", "protective" },
  notices = { "race", "class" },

  impression = {
    first = "She means to find out what is poisoning the Winterfall furbolgs.",
    third = "{name} met Donova Snowden, a warm-hearted dwarf naturalist studying the hot springs of Winterspring.",
  },

  greetings = {
    { id = "g_springs", text = "Welcome, welcome! Come stand by the spring. It's the only warm water for miles, an' Winterspring has more secrets than snowflakes." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid! Then ye'll feel it too: somethin's poisonin' the furbolgs, an' it's no' natural." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, all this way north! We're a long way from Khaz Modan, the both of us." },
  },

  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The way it turns 'em, for one, because drink makes a body foolish, no' cruel. The Winterfall used tae trade wi' Everlook peaceable enough, an' now they'd as soon tear yer arm off, an' I've seen satyr tracks round their stores that have nae business bein' there." } },
      choices = {
        { text = "I'll find who's brewing it and stop them for good.", next = "BACK", reply = "Aye, an' I'll no' weep for whoever it is, but dinnae go cuttin' through half the Winterfall tae reach them. The furbolgs are the ones bein' poisoned here.", fx = { align = { order = -1 } } },
        { text = "Bring proof to Everlook first. The town should judge it.", next = "BACK", reply = "That's a cautious head on ye, an' I like it, for the goblins hate surprises worse than yetis. Bring them somethin' they can hold in their hands, an' they'll listen.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I cannae say, friend, for it's no' a plague like they've got in the east. It's firewater, brewed strong an' brewed wrong, an' I've a mind somethin' fel is mixed in the barrels, so if yer Light can see that, it'll see it at Winterfall Village." } },
      choices = {
        { text = "Then I'll try to heal them, not just fight them.", next = "BACK", reply = "Bless ye for that, friend, for there's few enough out here who'd think o' it. Even a wee bit o' healin' might remind one o' them who he used tae be.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Whatever's in them, I'll put down the ones who attack.", next = "BACK", reply = "I'll no' blame ye for keepin' yer own skin whole, for a mad furbolg's claws are no joke. Only spare the ones who turn an' run, if ye can, for they've still some sense left.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They were never gentle, but they fought like folk, wi' sense an' a reason. Now they come on like they cannae feel the blade, an' that's the firewater, which makes me think whoever's brewin' it wants an army, no' a tribe." } },
      choices = {
        { text = "Then I'll fight them hard but cleanly. They're sick, not wicked.", next = "BACK", reply = "That's a warrior's heart wi' a healer's sense in it, an' I'm glad o' both. Clean an' quick is the kindest thing ye can give a sick beast.", fx = { align = { light = 1 } } },
        { text = "Sick or not, they're dangerous. I'll cut them down without pity.", next = "BACK", reply = "I'll no' argue they're dangerous, but pity costs ye nothin' an' it's all they've got left. Mind yer temper doesnae turn ye into what the firewater turned them into.", fx = { align = { light = -1 } } },
        { text = "Something else, Donova.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They used tae walk straight an' purposeful, from camp tae spring an' back, an' now they stagger an' double back an' fight each other over nothin'. A hunter's eye on 'em would tell me more than I'll ever learn from goo in a jar." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They used tae walk straight an' purposeful, an' now they stagger an' double back an' fight each other over nothin'. Keep {pet} away from their camps, aye, for I found a fox that had been lappin' at a spilled barrel, an' it was no' a pretty sight." },
      },
      choices = {
        { text = "I'll track them honestly and tell you what I see.", next = "BACK", reply = "That's all I'm askin', an' an honest eye is worth more tae me than ten brave ones. Mark where they drink an' where they stagger, an' we'll learn somethin'.", fx = { align = { honor = 1 } } },
        { text = "I'll follow one home and steal a barrel for you to study.", next = "BACK", reply = "Oh, ye cheeky thing, an' I'll no' say no, mind ye, for I'd dearly love tae see what's in those barrels. Just don't get caught, or they'll have ye for supper.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf_dn = {
      lines = {
        { id = "ddn_default", text = "Aye, an' we're the only two daft enough! The cold's no bother tae a Dun Morogh lass; it's the furbolgs I worry about, for they used tae trade wi' me for honey an' now they throw rocks." },
        { id = "ddn_bear", when = { origin = "dwarf_bear_tracker" },
          text = "A bear tracker from back home, eh? Then ye'll know a beast that's sick from one that's angry, an' the Winterfall are both, which is the worst o' the lot." },
      },
      choices = {
        { text = "I'll find who's brewing their firewater.", next = "who", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I cannae prove it yet, but the Deadwood in Felwood went the same way, an' Felwood stinks o' demons from end tae end. If somebody's brewin' that poison wi' fel in it, I'll find out who, an' I'll not be gentle about it." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I cannae prove it yet, but the Deadwood went the same way, an' Felwood stinks o' demons, an' so does that one o' yours, if ye don't mind my sayin'. If somebody's brewin' that poison wi' fel in it, I'll find out who, so keep it well back from my samples while I work." },
      },
      choices = {
        { text = "Whoever's poisoning them deserves no mercy.", next = "BACK", reply = "I'll no' argue wi' that, for poisonin' a whole people is as low as it gets. Only make sure ye've got the right one before ye pass sentence.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fel's just a tool. Blame the brewer, not the power.", next = "BACK", reply = "Ye would say that, warlock, wi' a demon at yer heel. Mebbe ye're right about the brewer, but I've seen what fel does tae a forest, an' I'll no' be callin' it a tool.", fx = { align = { light = -1 } } },
        { text = "I'll keep my nose open for it.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Tae find where the firewater's comin' from, an' who's bringin' it. Somebody's sellin' it tae them, I'm sure o' that, an' a quiet pair o' eyes would learn more in one night than I've learned in a month o' sittin' by these springs." } },
      choices = {
        { text = "I'll find your seller, quietly.", next = "BACK", reply = "Quiet's the word, an' ye've the feet for it, I can tell. Find me a name or a cart an' I'll see it gets tae Everlook before the barrels move again.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd rather walk in and ask them straight.", next = "BACK", reply = "Ye're braver than me, then, or more foolish, an' I cannae tell which. Whoever's sellin' that poison willnae answer polite questions wi' polite answers.", fx = { align = { honor = 1 } } },
        { text = "Let me think on it.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I'd like tae think not, because they were peaceable enough before the firewater came, an' a sober furbolg's no' a bad neighbour. But some o' them have drunk so long they've forgotten what they were, an' I don't know if prayer or medicine reaches that far." } },
      choices = {
        { text = "Then we try. Whoever was turned can be turned back.", next = "BACK", reply = "That's what I've been tellin' myself every night out here, an' it's good tae hear it from someone wi' the Light about them. Mebbe between us we'll prove it.", fx = { align = { light = 1 } } },
        { text = "Then stop the brewing, and the drinkers with it, quickly.", next = "BACK", reply = "Quick an' hard, aye, I understand it, but I cannae hear ye say the drinkers too without it stickin' in my throat. They didnae ask tae be poisoned.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Firewater, brewed from somethin' foul an' poured down their throats till they rage. The Winterfall used tae be a peaceable folk, an' I cannae stand watchin' them turned intae beasts by a drink an' whoever's sellin' it." } },
      choices = {
        { text = "Then let's find the source and stop it.", next = "BACK", reply = "Then ye're a friend o' mine, an' o' the Winterfall too, though they'll no' know it. Find where it's brewed, an' we'll make it stop.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Mad furbolgs are easier to kill than sane ones.", next = "BACK", reply = "Easier, mebbe, but that's no' the measure o' a good deed, an' ye know it fine. Kill the mad ones if ye must, but I'll no' thank ye for enjoyin' it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_timber", when = { reputation = { faction = "Timbermaw Hold", min = "honored" } },
          text = "Salfa tells me the Timbermaw speak well o' ye these days, which is more than they've ever said o' me. Furbolgs are slow tae trust, so whatever ye did for 'em, ye did it proper." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Winterfall", min = 30 } },
          text = "Ye've been thinnin' the Winterfall, I hear, an' I'll no' pretend it gladdens me, for they were decent folk before the firewater. Still, the trappers can walk the valley again, an' that's somethin'." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Ye'll have a sharper eye for magic than I do, an' I've a feelin' there's more than drink in that Winterfall firewater, so look close if ye go near their camps." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, aye? Good, for there's a sickness on the Winterfall, an' I've been wonderin' whether a bit o' holy light might show us what's at the root of it." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, aye? Good, because the Winterfall'll no' be talked down, an' when they come at ye half-mad on firewater, ye'll want a shield between ye an' them." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! Ye'll have seen the Winterfall's tracks, then, an' how they've changed, wanderin' in circles like a beast wi' a fever." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock, is it? Then mebbe ye can tell me what's in the firewater the Winterfall are drinkin', because it smells of somethin' a good deal worse than whisky." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue, aye? Good, because the Winterfall camps are thick wi' furbolgs, an' I'd rather someone crept in quiet than went bashin' through like a dwarf in a china shop." },
        { id = "h_default", key = true,
          text = "Donova Snowden's the name, an' I study the springs an' the creatures that live by 'em, though these days it's mostly the Winterfall. The furbolgs used tae keep tae themselves, but now they're drinkin' somethin' that makes 'em mad as a kicked hive." },
        { id = "h_firewater", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Winterfall Firewater") }, { questActive = TODO_QUEST("Falling to Corruption") } } },
          text = "It's firewater, an' the Winterfall are swillin' it by the barrel, but it's no' just drink; it's turnin' 'em. I want tae know who's brewin' it, an' why." },
        { id = "h_goo", when = { any = { { questActive = TODO_QUEST("Mystery Goo") }, { questActive = TODO_QUEST("Toxic Horrors") } } },
          text = "Look at this goo, an' smell it... no, on second thought, don't. Whatever's in the firewater is in this too." },
        { id = "h_chief", when = { any = { { questActive = TODO_QUEST("High Chief Winterfall") }, { questActive = TODO_QUEST("Words of the High Chief") } } },
          text = "The High Chief knows who's behind it, an' he'll no' tell us kindly, so make him tell us anyway." },
        { id = "h_linken", when = { questActive = TODO_QUEST("It's a Secret to Everybody") },
          text = "A gnome's sword, found in a crater, an' ye want me tae temper it? Well, the springs are hot enough, so leave it with me." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, an' in this cold! Ye'll want tae see the Winterfall, then, because whatever's in that firewater is eatin' 'em from the inside, an' it's a sorry thing tae watch." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, eh? Ye'll want tae see the Winterfall, then, for there's a sickness in 'em that no herb o' mine can reach, an' maybe somethin' o' yours can." },
        { id = "h_winterfall_resolved", tags = { "news" }, when = { thread = { id = "winterfall_firewater", state = "resolved" } },
          text = "I told Everlook what ye told me, that the Winterfall are sick an' no' wicked, an' the goblins looked at me like I'd asked for a loan. I've filled half a notebook since, an' I'll find what's in that firewater if I have tae boil every barrel in the valley." },
        { id = "h_winterfall_soured", when = { thread = { id = "winterfall_firewater", state = "soured" } },
          text = "Everlook's hired its bruisers for the road, like ye said they should. It's safer, I'll grant ye that, but I've stopped walkin' out tae the dens of an evenin', an' I find I miss the grumpy great lumps." },
      },
      again = { { id = "h_again", text = "Aye? The spring's warm; take yer time." } },
      choices = {
        { text = "What were the Winterfall like before?", next = "before" },
        { text = "Why study hot springs?", next = "springs" },
        { text = "Someone must have brewed that on purpose.", next = "who" },
        { text = "The furbolgs' sickness. Can I feel it?", next = "druid", when = { class = { "DRUID", "SHAMAN" } } },
        { text = "A dwarf this far north? You and me both.", next = "dwarf_dn", when = { race = "Dwarf" } },
        { text = "Do you think the firewater is demonic?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "You'd have me sneak into the Winterfall camps.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Are the Winterfall beyond saving, Donova?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "The Winterfall look sick to me, Donova.", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "The Winterfall must be dangerous fighters, Donova.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What have you noticed about the Winterfall's tracks?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Could the Light cure what ails the Winterfall, Donova?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What makes you think there's magic in the firewater, Donova?", next = "xmage", when = { class = "MAGE" } },
        { text = "I've heard the Timbermaw and Everlook on the Winterfall, Donova.", next = "winterfall_word",
          when = { thread = { id = "winterfall_firewater", beat = "b5_donova", state = { "stirring", "unfolding" } } } },
        { text = "I'll look into the furbolgs.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    winterfall_word = {
      big = true,
      lines = { { id = "ww_default", text = "Then ye've heard more voices on it than I have, an' I'll take yer counsel before I give Everlook mine. Do I tell 'em the Winterfall can be brought back if we find the brewer, or do I tell 'em tae hire bruisers an' keep the road clear o' furbolgs?" } },
      again = { { id = "ww_again", text = "So, friend, what do I tell Everlook about the Winterfall?" } },
      choices = {
        { text = "They're sick, not wicked. Find the brewer and they may come back.", next = "winterfall_hope",
          fx = { thread = { id = "winterfall_firewater", state = "resolved" }, affinity = 3, align = { light = 1 }, trait = { kind = 1 } },
          journal = { first = "Told Donova the Winterfall are sick and worth saving. She means to cure them out of sheer stubbornness.",
                      third = "{name} told Donova Snowden the Winterfall were sick and worth saving." } },
        { text = "Some of them are past saving. Tell Everlook to arm.", next = "winterfall_arm",
          fx = { thread = { id = "winterfall_firewater", state = "soured" }, affinity = -1, align = { light = -1 }, trait = { skeptical = 1 } },
          journal = { first = "Told Donova some of the Winterfall can't be brought back and Everlook should arm. She agreed, and it grieved her.",
                      third = "{name} told Donova Snowden the Winterfall were past saving and Everlook should arm." } },
        { text = "What do the Timbermaw think should be done?", next = "winterfall_timbermaw" },
      },
    },
    winterfall_timbermaw = {
      lines = { { id = "wt_default", text = "Salfa, the Timbermaw who keeps the tunnel, won't say it plain, but I think the Timbermaw have stopped hopin' for the Deadwood an' cannae bear tae stop hopin' for the Winterfall too. They'd rather the answer came from somebody who isnae kin, which is you." } },
      choices = { { text = "Then I'll give you an answer.", next = "winterfall_word" } },
    },
    winterfall_hope = {
      lines = { { id = "wh_default", text = "Aye, that's what I hoped ye'd say, an' what I was feart tae say first in case it sounded like an old dwarf bein' soft. I'll tell Everlook the Winterfall are patients, no' bandits, an' let the goblins grumble." } },
      choices = { { text = "Good luck with the notebook, Donova.", next = "END" } },
    },
    winterfall_arm = {
      lines = { { id = "wa_default", text = "Ye're likely right, an' that's the worst of it. I'll tell Everlook tae hire their bruisers, an' I'll keep my notebook all the same, for whatever good it does the ones they cannae save." } },
      choices = { { text = "...", next = "END" } },
    },
    before = {
      lines = { { id = "b_default", text = "Shy an' gruff, an' they kept tae their dens an' left travellers be. I used tae trade them fish for news, but now they'd sooner take my arm than my fish." } },
      choices = {
        { text = "Can they be brought back?", next = "before_back" },
        { text = "Something else.", next = "BACK" },
      },
    },
    before_back = {
      lines = { { id = "bb_default", text = "If the drink stops, maybe, an' I'd like tae think so. A creature's no' its worst week." } },
      choices = {
        { text = "No creature should be judged by its worst week.", next = "BACK", reply = "Aye, an' I'd want the same mercy for myself after some o' my worse weeks. Ye've a kind way o' lookin' at things, friend.", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "A creature's worst week tells you what it's capable of.", next = "BACK", reply = "That's a hard view, an' mebbe a true one, but if we all got judged by our worst weeks, there'd be precious few o' us left standin'. I'll hope for better from them.", fx = { align = { light = -1 } } },
      },
    },
    springs = {
      lines = { { id = "s_default", text = "Because they're warm in a place that isnae, an' life gathers round warm things. Ye learn a land by where it chooses tae live." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    who = {
      lines = { { id = "w_default", text = "Somebody who wants the Winterfall angry an' doesnae care what it costs them. I've a list o' guesses. None of 'em are good, an' none of 'em are proof." } },
      choices = {
        { text = "Tell me your best guess. I won't hold you to it.", tag = "Persuade", next = "who_guess",
          check = { pass = { any = { { disposition = { min = 65 } }, { trait = "curious" }, { class = "DRUID" } } } },
          fail = { next = "who_proof", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid = {
      lines = { { id = "d_default", text = "Then ye'll feel it worse than me. It's like the woods are holdin' their breath. Go gentle near the dens; whatever's in them isnae all furbolg any more." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    who_guess = {
      lines = {
        { id = "wg_default", text = "Between us, then, an' only as a guess: that goo smells like the water out o' Felwood, sick an' sweet at once, so I'd look south before I'd look anywhere else. Whoever's brewin' it wants the furbolgs mad an' doesnae care who they bite." },
      },
      choices = {
        { text = "Then I'll keep an eye to the south.", next = "BACK", fx = { affinity = 2, learn = { "cenarion_circle" } } },
        { text = "A guess is a start.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_proof = {
      lines = {
        { id = "wp_default", text = "Guesses get folk killed up here, so I keep mine in my notebook till I've proof. Bring me somethin' I can test, an' then we'll talk." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've studied these springs an' everythin' that drinks from 'em for a good long while. Ask me about any o' these." },
    },
    background = { { id = "tp_ba", text = "A dwarf who likes the cold an' loves a puzzle. Winterspring has plenty o' both." } },
    advice = { { id = "tp_ad", text = "Never drink anythin' a furbolg offers ye, no' this year." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw are the last furbolgs who've kept their wits, and they're worried about the Winterfall too. I'd trust a Timbermaw over most people I've met." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The druids say the Dream is the world as it was meant to be. I'd like to think the hot springs here are a little piece of it, warm and green in all this snow." } },
    everlook = { { id = "tp_everlook", text = "Everlook is a good town for supplies, though the goblins charge a fortune for everything. I come in when I must and leave as soon as I can." } },
    nordrassil = { { id = "tp_nordrassil", text = "The World Tree stands on Hyjal, just south of here, and you can feel it in the land if you stand still long enough. I wonder sometimes whether the furbolgs feel it too." } },
    _none = { { id = "tp_none", text = "Couldnae tell ye, but ask me about the springs instead, for I know the springs." } },
  },
}

P:NPC {
  key = "mauari", id = TODO_NPC("Witch Doctor Mau'ari"), name = "Witch Doctor Mau'ari",
  bible = "bibles/winterspring.md", role = "questgiver", tier = "quest",
  communities = { "winterspring_wilds" }, temper = { "playful" }, values = { "mystical", "proud" },
  notices = { "race", "class" },

  impression = {
    first = "She has stopped complaining about the cold, but not feeling it.",
    third = "{name} met Witch Doctor Mau'ari, the playful troll witch doctor of Winterspring who trades in E'ko and juju.",
  },

  greetings = {
    { id = "g_hello", text = "Ah, a visitor come all dis way to see Mau'ari! Smart, you are, or maybe lost, but either way, sit." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear, up here in de ice! You be feelin' de cold in your tusks, eh? Mau'ari feel it too." },
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "PRIEST", "DRUID" } },
      text = "You know de spirits. Den you know what Mau'ari be talkin' about when she say every beast got a little magic left in it." },
  },

  start = "hello",
  nodes = {
    xpt_mauari = {
      big = true,
      lines = { { id = "xpt_mauari_default", text = "For de juju, mon, because de spirits up here be old and cold, and dey remember things de jungle forgot. Mau'ari would sooner freeze learning than stay warm and ignorant, and maybe your troll friend understands that too." } },
      choices = {
        { text = "Some old spirits are best left forgotten, Mau'ari.", next = "BACK", reply = "Ha! Maybe dey be, mon, but de forgotten ones be de hungriest, and Mau'ari would rather know dem by name than meet dem in de dark. Not knowin' never kept a troll warm.", fx = { align = { light = 1 } } },
        { text = "Old spirits hold power. You're right to seek it.", next = "BACK", reply = "Ya, you see it, mon, and de loa smile on a curious mind. Old cold spirits teach things de jungle never dreamed of, if you got de patience to listen.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because a beast dat dies afraid gives you only fear, mon, and fear be useless juju. A beast dat dies quick and proud gives its strength, so a rogue who strikes clean makes de best E'ko of all, and Mau'ari pay attention to such things." } },
      choices = {
        { text = "I'll make it quick and clean, then. They deserve that.", next = "BACK", reply = "Good, mon, dat be de way, and de spirits will remember your blade kindly. Bring me what be left after, and I make sure de E'ko go somewhere good.", fx = { align = { honor = 1 } } },
        { text = "I'll make it however I like, so long as you pay.", next = "BACK", reply = "Ha, a hard one you are, mon, and Mau'ari pay all de same. But de E'ko of a frightened beast be thin stuff, so don't be surprised when your charm come out weak.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Some do, some don't, mon, same as people. De E'ko be de spirit stuff of de beasts, and when Mau'ari puts it in de juju, it carry a little of what de beast was, so a frostsaber's E'ko be proud and a yeti's be angry, and none of dem care much for your Light." } },
      choices = {
        { text = "Then I'll respect the beasts and leave their spirits in peace.", next = "BACK", reply = "Dat be your choice, and a respectful one, mon, but de beasts give de E'ko whether you take it or not. Mau'ari only catch what be fallin' anyway.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Spirits torn from beasts? That sounds like dark work to me.", next = "BACK", reply = "Dark? Nah, mon, a troll know dark work when he see it, and dis be gentle by comparison. Mau'ari only take what de beast leave behind, and give it work to do.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Dey respect strength, mon, and dey respect a warrior who know when strength be enough and when it not. Every beast you kill up here leave a little E'ko behind, and a warrior who bring dat to Mau'ari learn what juju be good for." } },
      choices = {
        { text = "I'll take the E'ko with respect for the spirits, Mau'ari.", next = "BACK", reply = "Den you be a warrior de spirits like, mon, and dat be rarer than you think. Respect cost you nothing and it keep de cold ones off your back.", fx = { align = { light = 1 } } },
        { text = "Spirits or not, I'll take whatever makes me stronger.", next = "BACK", reply = "Ha, honest at least, mon, and strength be a fine thing to want. Just remember de spirits got long memories, and dey know who took without a thank you.", fx = { align = { light = -1 } } },
        { text = "Something else, Mau'ari.", next = "BACK" },
      },
    },
    hunter_ma = {
      lines = {
        { id = "hma_default", text = "Ha! Every beast carry it, mon, and dat one carry plenty, but Mau'ari ain't gonna take it from a beast dat still be breathin' and followin' you round. Keep it close; a hunter's companion be better juju than anything Mau'ari make." },
      },
      choices = {
        { text = "Good. Hands off, witch doctor.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Then I'll bring you E'ko from the wild ones.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Mau'ari ask de spirits nice, and dey give a little and go home, mon. You chain your demon and make it work, and one day it remember every lash, and dat be why Mau'ari only bargain with spirits who can say no." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Mau'ari ask de spirits nice, and dey give a little and go home, mon, but look at dat one, standin' behind you and countin' every lash. You chain it and make it work, and Mau'ari can see in its eyes it be rememberin', which be why Mau'ari only bargain with spirits who can say no." },
      },
      choices = {
        { text = "Maybe you're right. Chains breed resentment.", next = "BACK", reply = "Now you be talkin' like a troll, mon, and maybe you live longer for it. Ask nice and leave a gift, and de spirit come back next time smilin'.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A chained demon is a useful demon.", next = "BACK", reply = "Useful till de chain slip, mon, and chains always slip in de end. When yours do, don't come cryin' to Mau'ari for juju to fix it.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "We all make our bargains.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "De E'ko, mon, de spirit-bits of every beast in Winterspring, and a little patience from Mau'ari. Every charm Mau'ari make, a creature give something for it, and dat be a fair trade, unlike your arcane, which take and take and never say thank you." } },
      choices = {
        { text = "A fair trade is always the better way.", next = "BACK", reply = "Ya, mon, you got sense, and de spirits feel de difference in de charm. A charm made greedy crack in de cold before de week be out.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The arcane owes thanks to nobody.", next = "BACK", reply = "Ha! Mau'ari know plenty mages who think dat, mon, and plenty of dem got frozen solid by somethin' dey never thanked. De cold don't care how clever you be.", fx = { align = { order = -1 } } },
        { text = "I'll bring you some E'ko.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Dey reach wherever a troll carry dem, mon, and Mau'ari carry plenty. De cold spirits here be different, sharp and hungry, so Mau'ari give dem respect and a little E'ko, and dey leave her be, mostly." } },
      choices = {
        { text = "Then I'll give the cold spirits respect, as you do.", next = "BACK", reply = "Den de cold ones gonna treat you right, mon, and Mau'ari be proud of you. Leave a little somethin' at de spring when you pass, a bead, a bone, anything.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Spirits are tools, Mau'ari, and hungry ones most of all.", next = "BACK", reply = "Careful, mon, de hungry ones hear you sayin' dat, and dey don't like bein' called tools any more than you would. I seen one freeze a man's beard to his chest for less.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_deaths", when = { deaths = { min = 10 } },
          text = "Ha, Mau'ari can see Bwonsamdi's fingerprints all over you, mon! He keep sending you back, so either he like you or he can't stand your company, and Mau'ari not decide which yet." },
        { id = "h_pt_mauari", tags = { "news" }, when = { party = { race = "Troll" } },
          text = "Mau'ari sees a troll walking with you, and that warms her more than the fire. {companion} knows what the cold does to troll bones, so you be keeping each other close up here." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Chillwind", min = 25 } },
          text = "De chillwind beasts be fewer in de hills, mon, and Mau'ari know who been huntin' dem. Bring de E'ko, and maybe de spirits forgive you dat many." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "Ah, a rogue, mon, with quiet feet. Mau'ari like quiet feet, because de beasts don't run from dem, and de E'ko come easier when de beast never see you comin'." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin come to Mau'ari's fire, mon! Your Light don't burn so cold as you'd think up here, and Mau'ari wonder if de spirits of de beasts be likin' it or fearin' it." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, mon, come all de way up de mountain wit a big blade! Mau'ari like dat, because de spirits up here respect anyone who walk in de cold wit no magic to keep him warm." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Ah, a warlock come up de mountain! Mau'ari feel de demon on you, mon, cold as dis snow and twice as hungry, so you be careful which spirit you be feedin'." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, way up here in de ice! You be a long way from your warm towers, mon, but Mau'ari like a visitor who know dat magic got a cost." },
        { id = "h_default", key = true,
          text = "Mau'ari be de witch doctor up here, mon. Every creature in dis frozen place carry a little spirit, a little E'ko, and if you bring it to Mau'ari, she make you juju, good juju, mostly." },
        { id = "h_cache", tags = { "news" }, when = { questActive = TODO_QUEST("Cache of Mau'ari") },
          text = "First, Mau'ari need her cache back, because in it be de charm you need for catchin' E'ko. No charm, no E'ko, and no E'ko, no juju." },
        { id = "h_luck", when = { any = { { questActive = TODO_QUEST("A Little Luck") }, { questActive = TODO_QUEST("Luck Be With You") } } },
          text = "Luck, you want? Mau'ari got plenty, so bring de right E'ko, and maybe some find its way to you." },
        { id = "h_cold", when = { metBefore = true }, text = "Mau'ari been up here a long time, mon, long enough to stop complainin' about de cold, but not long enough to stop feelin' it." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, mon, come up de mountain! Mau'ari can feel de loa on you, or maybe somethin' colder, and either way you be welcome by her fire." },
        { id = "h_loa", when = { origin = "troll_loa_speaker" }, text = "Ah, a speaker for de loa! Mau'ari can tell, because you got dat look like somebody just told you a joke at your own expense. De loa be colder up here, mon, and dey laugh slower, so you got time to think before you repeat what dey say." },
        { id = "h_apprentice", when = { origin = "troll_witch_doctor_apprentice" }, text = "You ground roots for an old witch doctor at Sen'jin, eh? Mau'ari can smell it on your hands. Good, den you already know de first rule, mon: every spirit want somethin', and you find out what before you ask it for juju." },
      },
      again = { { id = "h_again", text = "More questions? Mau'ari got answers, and some of dem even true." } },
      choices = {
        { text = "What is E'ko, exactly?", next = "eko" },
        { text = "That juju must do something useful.", next = "juju" },
        { text = "Why come all the way up here?", next = "why" },
        { text = "A Darkspear in the snow is a strange sight.", next = "troll", when = { race = "Troll" } },
        { text = "What do the loa want from an E'ko, Mau'ari?", next = "xekowant", when = { origin = "troll_witch_doctor_apprentice" } },
        { text = "Does my beast carry E'ko too?", next = "hunter_ma", when = { class = "HUNTER", pet = true } },
        { text = "Is your juju so different from my magic?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Your juju can't come cheap.", next = "xmage", when = { class = "MAGE" } },
        { text = "Do the loa reach this far north, Mau'ari?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do the spirits respect warriors, Mau'ari?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do the beasts' spirits fear the Light, Mau'ari?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why does the E'ko come easier from an unseen kill, Mau'ari?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why does a troll come up into the ice, Mau'ari?", next = "xpt_mauari", when = { party = { race = "Troll" } } },
        { text = "I'll bring E'ko.", next = "END", fx = { affinity = 2 } },
      },
    },
    eko = {
      lines = { { id = "e_default", text = "It be de little bit of spirit every beast carry, and when dey fall, it linger. Mau'ari's charm catch it before it blow away on de wind." } },
      choices = {
        { text = "Taking a beast's spirit doesn't sit right with me.", next = "eko_right", fx = { align = { light = 1 } } },
        { text = "A spirit's no use to anyone, blowing on the wind.", next = "eko_right", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    eko_right = {
      lines = { { id = "er_default", text = "Better Mau'ari use it than de wind waste it, and de spirits don't mind. Mau'ari asked, and dey said yes... mostly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    juju = {
      lines = { { id = "j_default", text = "It make you faster, or tougher, or a little lucky, but never all at once, because even Mau'ari not dat good, not yet." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "De spirits up here be old and strange, and strange is interestin', where warm is just boring. Mau'ari choose interestin' every time." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    troll = {
      lines = { { id = "t_default", text = "Mau'ari be here for de same reason you be anywhere, mon: somethin' called and you answer, and de cold just come with it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    xekowant = {
      big = true,
      lines = {
        { id = "xek_default", text = "Ha! Your old master teach you right. De E'ko be a little spirit dat want to finish what de beast was doin' when it died, mon, runnin' or huntin' or keepin' warm, so Mau'ari give it a job in de juju and it go quiet and happy. Some witch doctors say dat be a kindness, and some say it be a leash, so which you think?" },
      },
      choices = {
        { text = "A kindness. A spirit with work is a spirit at rest.", next = "BACK", reply = "Ya, you understand de E'ko, mon, and your old master would grin to hear it. A spirit with somethin' to do be a spirit dat don't haunt nobody.", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "A leash, and leashes are useful. That's the craft.", next = "BACK", reply = "Hmm, you got a cold way of sayin' it, mon, but maybe you not wrong. Just remember who holdin' de leash, and who might be holdin' yours.", fx = { affinity = 1, align = { light = -1 }, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Mau'ari know many t'ings, mon, and some of dem she even tell. Ask about any of dese." },
    },
    background = { { id = "tp_ba", text = "Mau'ari be a witch doctor, and dat's de story; de rest she keep, like a good charm." } },
    advice = { { id = "tp_ad", text = "Wear two pairs of socks, mon. De spirits don't care, but your toes will." } },
    echo_isles = { { id = "tp_echo_isles", text = "De islands, warm and green, Mau'ari remember dem well. She come up here anyway, because de magic in de snow be stranger." } },
    voljin = { { id = "tp_voljin", text = "Vol'jin leads da Darkspear, and Mau'ari be one of his people, even up here in da ice. He a wise one, and he be watchin' da spirits close." } },
    darkspear = { { id = "tp_darkspear", text = "Da Darkspear be a proud tribe, and we stand with da Horde because Thrall saved us. Mau'ari don't forget dat, not ever." } },
    thrall = { { id = "tp_thrall", text = "Thrall be da Warchief, and he save da Darkspear from da humans and da murlocs on da islands. Mau'ari owe him, and so do all da trolls." } },
    the_elements = { { id = "tp_the_elements", text = "Da spirits be strong up here, mon, cold and old and quiet. Mau'ari listen to dem, and dey tell her many things." } },
    everlook = { { id = "tp_everlook", text = "Everlook be a goblin town, and dey sell everyting for too much. Mau'ari buy only what she need, and she need very little." } },
    _none = { { id = "tp_none", text = "Mau'ari know many t'ings, but not dat one, mon." } },
  },
}
