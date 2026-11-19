-- Cathedral Square: the Cathedral's other clergy, its altar boy, and the orphanage beside it.
-- Voices: bibles/cathedral_square.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Bishop Farthing: the kind bishop Darkshire still trusts. (Classic only; nothing later.)
P:NPC {
  key = "farthing", id = TODO_NPC("Bishop Farthing"), name = "Bishop Farthing",
  bible = "bibles/cathedral_square.md", role = "priest", tier = "quest",
  communities = { "stormwind" }, temper = { "gentle" }, values = { "kind", "pious" },
  notices = { "priest", "undeath", "duskwood" },
  impression = {
    first = "He asks what weighs on me before he asks what I want.",
    third = "{name} met Bishop Farthing of the Cathedral of Light, the one churchman Darkshire still writes to.",
  },

  greetings = {
    { id = "g_rest", text = "Rest a moment, {g:brother|sister}. The pews were built for tired people." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "Ah, one of our own, and not sleeping enough, by the look of you." },
    { id = "g_fleet", when = { questActive = TODO_QUEST("The Doomed Fleet") }, text = "Menethil is a long, wet walk, I know, but Glorin will be glad of the company." },
  },

  notice = {
    { id = "n_priest", cat = "priest", when = { class = "PRIEST", minLevel = 20 },
      text = "You've the look of a priest who has been healing more than resting. Sit down before you fall down, {g:brother|sister}, because the Light doesn't need you exhausted." },
    { id = "n_shadow", cat = "undeath", when = { form = "shadow" },
      text = "That shadow you wear is cold enough to feel from here. I won't scold you for it, but I'd ask you to step into the sunlight by the windows while we speak." },
    { id = "n_duskwood", cat = "duskwood", when = { questDone = TODO_QUEST("Seeking Wisdom") },
      text = "You've walked in Duskwood since we last spoke, and it clings, doesn't it? The dark there gets into the cloth of you." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Grief, mostly, and most of it from Darkshire, where the dead do not rest. If your spirits know how to comfort the restless, I'd sooner learn than judge." } },
      choices = {
        { text = "Comfort is holy work, Bishop, whoever does it.", next = "BACK", reply = "It is, my friend, and I'm glad to hear you say it. Darkshire would welcome any comfort you could bring.", fx = { align = { light = 1 } } },
        { text = "The restless dead need a blade more than comfort.", next = "BACK", reply = "They need both, I think, and the blade first, more often than I'd like. Commander Ebonlocke would agree with you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "I trust people to be who they are, and you are someone who sees what others miss, which Darkshire could use badly. Commander Ebonlocke has asked me more than once whether anyone in Stormwind knows what's walking about in Duskwood at night, and I've never had an honest answer to give her." },
      },
      choices = {
        { text = "Then I'll be your honest answer, Bishop.", next = "BACK", reply = "Bless you. Commander Ebonlocke will be glad of a straight report for once.", fx = { align = { honor = 1 } } },
        { text = "Honest answers cost extra, Bishop.", next = "BACK", reply = "Then I'll pay what I can, which isn't much, and pray for you with the change.", fx = { align = { honor = -1 } } },
        { text = "Something else, Bishop.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Something rotted it from the inside, and the worgen and the dead came with the rot, though nobody in Darkshire can tell me what started it. The trees there feel wrong to walk under, and I'd value a druid's opinion more than a scholar's." } },
      choices = {
        { text = "I'll walk those woods and tell Darkshire what I find.", next = "BACK", reply = "Thank you. The Night Watch will be grateful, and so will I, though I'll pray you come back.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A sick forest is best left alone until it heals or dies.", next = "BACK", reply = "Perhaps, but the people living under those trees can't wait for it to decide. I'll pray it heals.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Darkshire welcomes anyone who stands between it and Raven Hill, and the Night Watch has never once asked a volunteer's school. Fire does well against the walking dead, so long as the one throwing it remembers there are living folk in the houses nearby." } },
      choices = {
        { text = "I'll keep my fire well away from the living, Bishop.", next = "BACK", reply = "Thank you. The Night Watch has seen enough of fire in the wrong places.", fx = { align = { light = 1 } } },
        { text = "War burns what it burns, Bishop, and I won't hold back.", next = "BACK", reply = "It does, my friend, and that's why I pray for those who wield it. Be careful in those woods.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The faces, most often, of the ones they couldn't hold the line for. I tell them the Light remembers every name, so they needn't carry them all alone, and some of them believe me." } },
      choices = {
        { text = "I'll carry them anyway. They deserve to be remembered.", next = "BACK", reply = "Then carry them with care, and come to me when the weight grows too much. The Light shares the load.", fx = { align = { light = 1 } } },
        { text = "I don't look back. It only slows you down.", next = "BACK", reply = "Perhaps not, but they look back for you, in the quiet hours. I'll pray for you all the same.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "There's room for anyone's, and I think a hunter's are often the most honest, because you know what it costs to live. I've heard farmers pray over a lamb with less feeling than the trappers from Elwynn pray over their snares." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And your {pet} may sit too; I don't think the Light minds where its blessings fall. It has the look of a beast that has walked every mile beside you." },
      },
      choices = {
        { text = "I give thanks for every kill, Bishop.", next = "BACK", reply = "Then you understand more about prayer than most of my congregation. The Light honours it.", fx = { align = { light = 1 } } },
        { text = "A kill is a kill. I don't pray over meat.", next = "BACK", reply = "That's honest, and I'll not scold you for it. I'll pray over it for you, quietly.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Worgen in the woods, the dead at Raven Hill, and a necromancer named Morbent Fel with more patience than the Night Watch has men. Commander Ebonlocke is a proud woman, but she'd take your help, and she'd be wise to." } },
      choices = {
        { text = "Then I'll go to Darkshire and stand with the Night Watch.", next = "BACK", reply = "The Light go with you, then. Tell Ebonlocke that the Cathedral hasn't forgotten Darkshire.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Darkshire chose to stay in that cursed wood. Let it defend itself.", next = "BACK", reply = "They stay because it's home, my friend, and home is worth defending. I'll pray you change your mind.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Darkshire could use you more than this altar can, {class}, but I'll ask what's weighing on you first, as I ask everyone." },
        { id = "h_default", text = "I'm Bishop Farthing. People come to this altar with heavy things on their backs, lately most of them from Darkshire, where a necromancer has the dead walking, and I've found it's kinder to ask about the burden before the business. What's yours?" },
        { id = "h_journal", key = true, tags = { "news" }, when = { questActive = TODO_QUEST("Seeking Wisdom") },
          text = "You've come from Darkshire; I can tell by the way you keep glancing at the corners. Give me Jitters' journal, and then tell me plainly what you mean to do about Morbent Fel." },
        { id = "h_fleet", tags = { "news" }, when = { questActive = TODO_QUEST("The Doomed Fleet") },
          text = "The Kul Tiran wreck lies somewhere off the Wetlands coast, and if anyone can tell you where, it's Glorin Steelbrow in Menethil Harbor. Tell him I sent you; he'll grumble, but he'll help." },
        { id = "h_fleet_done", when = { questDone = TODO_QUEST("The Doomed Fleet") },
          text = "Glorin wrote to say you found him, and that you didn't flinch at what the iron would cost you. I've been praying for you since, whether you wanted it or not." },
        { id = "h_human", when = { race = "Human" },
          text = "Stormwind's own child, come home to the Cathedral. Good. Too many of you only visit when someone has died, and I'd much prefer a christening to a funeral." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf at the altar! My friend Glorin in Menethil would say you've wandered into the wrong sort of hall, but the Light has never minded a beard." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage at the altar, and welcome. Darkshire could use your fire as much as my prayers, I suspect, because the dead there burn better than they listen." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You carry your burden on the outside, in steel, and I find that's often the lighter kind to carry." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, with the quiet look of someone who's spent a long time alone. Sit, if you like; the altar keeps no hours." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, and so I'll ask what weighs on you, as I ask everyone. Duskwood was green once, before the dark crept into it, and I wonder whether your people feel such things more than mine do." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You keep your own counsel, I see, and the silent ones usually have the most to say once they sit down." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Something weighs on you, I think, before you say a word. A dwarf who hears spirits must hear grief on every wind in these times." },
      },
      again = {
        { id = "h_again", text = "What else weighs on you, {g:brother|sister}?" },
        { id = "h_again2", text = "Go on. I've nowhere more important to be than here." },
      },
      choices = {
        { text = "Why does Darkshire trust you, and not the city?", next = "darkshire" },
        { text = "What is lightforge iron, Bishop?", next = "iron", when = { any = { { questActive = TODO_QUEST("Seeking Wisdom") }, { questActive = TODO_QUEST("The Doomed Fleet") }, { questDone = TODO_QUEST("The Doomed Fleet") } } } },
        { text = "I don't see how faith alone fights a necromancer.", next = "fel" },
        { text = "Bishop, you must have taught a great many young priests.", next = "priest", when = { class = "PRIEST" } },
        { text = "I've come from the Night Watch in Darkshire.", next = "watch", when = { questDone = TODO_QUEST("Seeking Wisdom") } },
        { text = "Morbent Fel may have started out much like me.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "Would Darkshire welcome a mage, Bishop?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What burden do warriors bring to your altar, Bishop?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Is there room for a hunter's prayers, Bishop?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What would a paladin find waiting in Duskwood, Bishop?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What happened to Duskwood's forest, Bishop?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you trust someone in my line of work, Bishop?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What do you hear in the people who come to you, Bishop?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Nothing weighs on me today, Bishop.", next = "END" },
      },
    },
    darkshire = {
      big = true,
      lines = { { id = "d_default", text = "Because I answer their letters. The court decided long ago that Duskwood was too costly to defend, and the Night Watch has held it ever since with farmers, lanterns and very little sleep. I can't send them soldiers, but I can make sure they're not forgotten." } },
      choices = {
        { text = "Stormwind should be ashamed of that.", next = "darkshire_shame", fx = { align = { order = -1 } } },
        { text = "The crown can't defend every village.", next = "darkshire_shame", fx = { align = { order = 1 } } },
        { text = "What do they write to you about?", next = "darkshire_letters" },
      },
    },
    darkshire_shame = {
      lines = {
        { id = "ds_default", text = "Shame is cheap, {g:brother|sister}, and the court has plenty of it already. What Darkshire needs is people willing to walk into the woods, and every so often one of them comes to this altar first." },
      },
      choices = {
        { text = "Then I'll walk into the woods.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 }, learn = { "night_watch" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    darkshire_letters = {
      lines = { { id = "dl_default", text = "The dead walking in the vineyards, a madman in the tower on the hill, and worgen in the trees, which I'd have laughed at once. Mostly, though, they write to ask whether anyone in the city still remembers they exist. I write back that I do." } },
      choices = {
        { text = "That must mean the world to them.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 }, learn = { "worgen" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    iron = {
      lines = { { id = "i_default", text = "Metal forged with prayer as well as fire, so that a blade made from it carries the Light into whatever it strikes. The Third Fleet of Kul Tiras sank off the Wetlands with a hold full of it, years ago, and no one has brought it up since." } },
      choices = {
        { text = "That fleet went down for a reason, I'd wager.", next = "iron_fleet" },
        { text = "Who could find it?", next = "iron_glorin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    iron_fleet = {
      lines = { { id = "if_default", text = "Storms, rocks and bad luck, the sailors say, and the Wetlands have plenty of all three. Whatever the reason, the iron has lain in the dark water ever since, waiting for someone desperate enough to fetch it.",
        fx = { learn = { "third_fleet" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    iron_glorin = {
      lines = { { id = "ig_default", text = "Glorin Steelbrow, a dwarven colleague of mine in Menethil Harbor. He knows that coast and its wrecks better than any sailor, and he owes me a letter, so you'd be doing us both a kindness." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fel = {
      big = true,
      lines = { { id = "f_default", text = "Morbent Fel has wrapped himself in dark enchantments, so no common blade will touch him. Faith alone won't either; it needs a weapon to travel down. That's why the iron matters, and why I'd never send anyone against him empty-handed.",
        fx = { learn = { "morbent_fel" } } } },
      choices = {
        { text = "Then the Light is a weapon too.", next = "fel_weapon", fx = { align = { light = 1 } } },
        { text = "I'd sooner trust steel than prayers.", next = "fel_weapon", fx = { align = { light = -1 }, trait = { skeptical = 1 } } },
        { text = "He sounds hard to beat.", next = "fel_weapon" },
      },
    },
    fel_weapon = {
      lines = { { id = "fw_default", text = "The Light is many things, and a sword is the least of them, though some days it's the one we need. Fel stole the dead from their rest, and I believe they deserve someone who'll put them back." } },
      choices = {
        { text = "They'll get their rest.", next = "BACK", reply = "Thank you. That's all I ask for them, and for those who bring them home.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "The dead don't care who puts them back, Bishop.", next = "BACK", reply = "Perhaps not, but the living do, and I'd rather it were someone kind.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest = {
      big = true,
      lines = { { id = "p_default", text = "I teach them that a priest who only heals in the Cathedral has learned only the easy part of the craft. The rest is out where the wounded can't walk to us: Darkshire, the Wetlands, the roads between. Go where you're least comfortable, and you'll find the Light was there first." } },
      choices = {
        { text = "I'll go where I'm needed.", next = "priest_where", fx = { affinity = 2, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "My skills are wasted on backwater villages.", next = "priest_where", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "And when the Light isn't there?", next = "priest_where" },
      },
    },
    priest_where = {
      lines = { { id = "pw_default", text = "Then it's you, {g:brother|sister}, holding a lantern in the dark until it is. That's the whole of my wisdom, and it took me thirty years to find out how short it was." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    watch = {
      lines = { { id = "w_default", text = "Then you've met Commander Ebonlocke, and Sven at his little camp, and you've seen how thin the lanterns are spread. Tell me plainly: is Darkshire holding?" } },
      choices = {
        { text = "Barely. They need soldiers, not letters.", next = "BACK", fx = { trait = { stern = 1 }, opinion = { night_watch = "needs_soldiers" } } },
        { text = "They're holding, Bishop, and they're proud of it.", next = "BACK", fx = { affinity = 2, opinion = { night_watch = "holding" } } },
      },
    },
    warlock = {
      big = true,
      lines = { { id = "warlock_l", text = "I don't know how he started, and I'd be lying if I said the thought didn't frighten me. Each of those warlocks was somebody's apprentice once, but you asked, and you still can, and I'll hold on to that." } },
      choices = {
        { text = "I'll never become that, Bishop. I'm far more careful than he was.", next = "warlock2", fx = { align = { light = 1 } } },
        { text = "Power isn't evil. What he did with it was.", next = "warlock2", fx = { align = { light = -1 } } },
      },
    },
    warlock2 = {
      lines = { { id = "warlock2_l", text = "Then come back and tell me so in a year, and in five, and I'll believe you a little more each time. The door of this altar doesn't close, whatever my brothers mutter." } },
      choices = { { text = "Something else, Bishop.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    worgen = { { id = "tp_worgen", text = "The worgen of Duskwood are beasts that walk like men, and the people of Darkshire live behind their walls in terror of them. I pray for the town every night, and I pray the Night Watch has enough silver." } },
    stalvan = { { id = "tp_stalvan", text = "Stalvan Mistmantle was a man of good family who did a terrible thing in a tower in Duskwood, years ago. Darkshire still won't speak of it plainly, and I've learned not to press." } },
    holy_light = { { id = "tp_holy_light", text = "The Light is in Darkshire too, even in the gloom, and the people there cling to it harder than any congregation in Stormwind. I'd trade a dozen grand sermons here for one evening service there." } },
    scourge = { { id = "tp_scourge", text = "Darkshire's graveyards have begun to stir, and I'm told it's not the Scourge, only something like it. I've sent priests and holy water, and I've asked the Light to make the distinction clearer." } },
    raven_hill = { { id = "tp_raven_hill", text = "The dead of Raven Hill don't stay in their graves, and the Night Watch has buried some of them twice. I've given up asking why, and I've started asking for more priests instead." } },
    brotherhood_northshire = { { id = "tp_brotherhood_northshire", text = "The Brotherhood at Northshire sent two of their brothers to Darkshire last winter, and only one came back. He doesn't speak of it, and I don't ask, because I can see it in his eyes." } },
    knows = {
      { id = "tp_knows", text = "Letters reach this altar from every frightened corner of the kingdom, and Darkshire's most of all. Ask me what you like, {g:brother|sister}; I'll tell you what I've read and what I've prayed over." },
    },
    background = { { id = "tp_bg", text = "A bishop of the Church, and a slow reader of other people's letters. There's no grander story than that, and I've never needed one." } },
    advice = { { id = "tp_ad", text = "Never walk into Duskwood after dark without a lantern and a friend, and if you can only bring one, bring the friend." } },
    morbent_fel = { { id = "tp_fel", text = "A necromancer in the Duskwood hills who has wrapped himself in spells. Plain steel won't reach him, so don't try it.", next = "fel" } },
    third_fleet = { { id = "tp_fleet", text = "The Kul Tiran ships that sank off the Wetlands with their lightforge iron. Glorin Steelbrow in Menethil knows where they lie.", next = "iron" } },
    night_watch = { { id = "tp_watch", text = "Brave people who were left to guard their own homes and have done it. I pray for every one of them by name." } },
    _none = { { id = "tp_none", text = "I don't know, {g:brother|sister}, and I won't guess at something that matters to you." } },
  },
}

-- Brother Kristoff: a preacher with a sermon on fortitude and a book about iron.
P:NPC {
  key = "kristoff", id = TODO_NPC("Brother Kristoff"), name = "Brother Kristoff",
  bible = "bibles/cathedral_square.md", role = "priest", tier = "quest",
  communities = { "stormwind" }, temper = { "eager" }, values = { "pious", "curious" },
  notices = { "priest", "craft" },
  impression = {
    first = "He rehearses his sermon to anyone standing still.",
    third = "{name} met Brother Kristoff outside the Cathedral, a priest preparing a sermon on fortitude from a book about iron.",
  },

  greetings = {
    { id = "g_rehearse", text = "Oh! Forgive me, I was rehearsing. Did that sound like a sermon to you, or like a man talking to a wall?" },
    { id = "g_book", when = { questActive = TODO_QUEST("Speaking of Fortitude") }, text = "Any luck at the Royal Library? Milton will find it, if anyone can." },
    { id = "g_done", when = { questDone = TODO_QUEST("Return to Kristoff") }, text = "My friend of the iron book! The sermon's coming along, slowly, like good steel." },
  },

  notice = {
    { id = "n_priest", cat = "priest", when = { class = "PRIEST" },
      text = "You'll know the prayer of Fortitude, {g:brother|sister}; every priest learns it early. Have you ever wondered why it's that word, and not strength or health? That's my whole sermon, really." },
    { id = "n_smith", cat = "craft", when = { any = { { profession = "Blacksmithing" }, { profession = "Mining" } } },
      text = "You work with metal! Then you'll know better than I do that iron is strongest when it's been through the fire, and I'd love to hear you say it in your own words." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Iron, my friend, and how it is tempered by the fire to be strong. Your people know that better than anyone, and your spirits must know fire too." } },
      choices = {
        { text = "A good sermon. Let them hear about honest strength.", next = "BACK", reply = "Honest strength, yes! I'll put that in the opening line, if you don't mind.", fx = { align = { honor = 1 } } },
        { text = "Iron breaks too, Brother. Tell them that part as well.", next = "BACK", reply = "It does, and that's the part I like best. Iron that breaks can be forged again.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Iron that's quenched in the wrong oil still holds an edge, the book says, but it cracks when you least expect it. I don't mean it unkindly, because you plainly have will enough for two, and I'd only say a sermon needs a warning in the middle, and you'd make a fine one." },
      },
      choices = {
        { text = "Then let me be the warning. Use it well.", next = "BACK", reply = "You'd make a fine example, my friend, and a good sermon. I'll pray it holds.", fx = { align = { light = 1 } } },
        { text = "My iron holds. Your book is wrong.", next = "BACK", reply = "Perhaps it does, and the book's only a book. I'll pray it stays that way for you.", fx = { align = { light = -1 } } },
        { text = "Something else, Brother.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I would, and I'd argue the oak has the better of it, because iron must be forged and an oak simply grows. The dwarf who wrote my book would disagree, I'm sure, but he isn't here to stop me." } },
      choices = {
        { text = "Iron, Brother. Strength that's forged and tested is strength you can trust.", next = "BACK", reply = "That's what the dwarf said, and you've convinced me. Iron it is, for this week's sermon.", fx = { align = { order = 1 } } },
        { text = "Iron is made strong, but the oak is born strong, and that's better.", next = "BACK", reply = "That's lovely, and I'll steal it if you don't mind. The oak has its own sermon.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I'd put anyone in it who knows that the hidden work is the hard work, and I suspect you do. The congregation would be scandalised, of course, but a sermon nobody argues about afterwards has failed." } },
      choices = {
        { text = "Hidden work still answers to the Light, Brother.", next = "BACK", reply = "I'm glad you see it that way, my friend, though I'll not be preaching it from the steps. The congregation would be scandalised.", fx = { align = { light = 1 } } },
        { text = "Hidden work answers to whoever pays for it, Brother.", next = "BACK", reply = "Then I'll pray whoever pays for it is kind. The Light still sees the work.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Only a single footnote, about how forges near the Mage Quarter run hotter than they should, and I've built half a paragraph from it already. Fortitude, you see, is knowing how much fire you can stand before you change shape." } },
      choices = {
        { text = "A mage's fortitude is knowing when to stop, Brother.", next = "BACK", reply = "That's beautiful, and I'll write it down at once. Fortitude is knowing your limits.", fx = { align = { order = 1 } } },
        { text = "A mage's fortitude is pushing past the point others fear.", next = "BACK", reply = "Then you'd make a frightening sermon, my friend. I'll pray you know when to stop.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Well, an arrow holds true because each feather balances the others, and I thought the soul might work the same way. Brother Sarno says I'm overreaching, and the metallurgy book, sadly, says nothing about feathers." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Well, an arrow holds true because each feather balances the others, and I thought the soul might work the same way. And your {pet}, does it have fortitude? I suppose it must, following you through all weathers." },
      },
      choices = {
        { text = "A steady soul is like a straight arrow. You're on to something.", next = "BACK", reply = "Thank you! I'll tell Brother Sarno that a real hunter agrees with me.", fx = { align = { light = 1 } } },
        { text = "An arrow's just a stick with a point, Brother.", next = "BACK", reply = "Oh. Well, perhaps I am overreaching. I'll think of a better metaphor.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That impurity is beaten out, not prayed out, and that it takes the hammer and the fire both. The book says a blade quenched too fast will shatter, and I've decided that's true of novices as well, though I haven't yet worked out how to say it from the pulpit." } },
      choices = {
        { text = "Faith is forged slowly, under discipline. Your sermon's right.", next = "BACK", reply = "That's exactly what the book says! I'll quote you to Brother Joshua.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Faith isn't forged, Brother. It's either in you or it isn't.", next = "BACK", reply = "Some people say that, and maybe it's true for them. I think most of us need the forge.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Now here's someone who'll understand my sermon, because what is a paladin but iron that's been through the fire and come out stronger?" },
        { id = "h_default", text = "Brother Kristoff, of the Cathedral. I'm to give a sermon on the Fortitude of the Spirit, and I've decided, against the advice of everyone I've asked, to build it from a book on metallurgy." },
        { id = "h_quest", tags = { "news" }, when = { questActive = TODO_QUEST("Speaking of Fortitude") },
          text = "The Stresses of Iron, that's the one. The Royal Library should have a copy, up in the Keep, and Milton Sheaf knows every shelf like his own family. Ask him kindly; he likes kindness, and he likes clean hands better." },
        { id = "h_return", tags = { "news" }, when = { questRecent = { TODO_QUEST("Return to Kristoff"), days = 3 } },
          text = "That's the one! I've already marked eleven passages, and I'll have to cut nine of them. Thank you, and if you see Milton, tell him I'm sorry it wandered so far." },
        { id = "h_human", when = { race = "Human" },
          text = "You'll come to hear it, won't you, when it's ready? A sermon needs a few faces in the pews who aren't already asleep, and Stormwind folk are kind enough to stay awake out of politeness." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf! The book I want was written by one of your people, a miner, and I think he understood more about the soul than he ever meant to. Has anyone told you that about your own books?" },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You'd make a fine sermon, actually, because a blade kept sharp in the dark is only of use if it's drawn at the right moment. May I borrow you?" },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! You'll know about stresses and strains, surely, since the book says iron and the arcane both crack along the same lines, or at least my book does." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Tell me, do you fletch your own arrows? I've been reading about the tempering of arrowheads for my sermon, and I've lost track of the metaphor entirely." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! You'd make a fine chapter, because a tree endures the winter without a word of complaint, and that's fortitude if anything is. May I borrow you for my sermon?" },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! Splendid, I've been looking for an example of fortitude gone astray, if you'd stand still a moment." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf! And a shaman! You may be just the illustration my sermon on the fortitude of the spirit has been lacking." },
      },
      again = {
        { id = "h_again", text = "What else? I'm glad of any excuse to stop rehearsing." },
        { id = "h_again2", text = "Go on, go on. The sermon can wait a minute." },
      },
      choices = {
        { text = "Why a book about iron?", next = "iron" },
        { text = "Let me hear the opening.", next = "opening" },
        { text = "I'd like to see that book for myself.", next = "book" },
        { text = "Fortitude must mean something special to you, Brother.", next = "fortitude", when = { class = "PRIEST" } },
        { text = "I know iron, Brother, and it's honest stuff.", next = "smith", when = { any = { { profession = "Blacksmithing" }, { profession = "Mining" } } } },
        { text = "Fortitude is getting up after you're knocked down, Brother.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I doubt you'd really put a rogue in your sermon.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Does your book say anything about the arcane?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "How does fletching fit into a sermon on fortitude, Brother?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What does iron teach about a paladin's faith, Brother?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would you put an oak in a sermon about iron, Brother?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Am I really an example of fortitude gone astray?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What is your sermon about, Brother Kristoff?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good luck with the sermon.", next = "END" },
      },
    },
    iron = {
      lines = { { id = "i_default", text = "Because the author spent his life watching what breaks and what doesn't. Iron that's been heated and hammered and cooled again holds better than iron that's never been tested, and if that isn't a sermon about suffering, I don't know what is." } },
      choices = {
        { text = "So suffering makes us stronger?", next = "iron_suffer" },
        { text = "That's a stretch, Brother.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    iron_suffer = {
      big = true,
      lines = { { id = "is_default", text = "No, and that's where my brothers misread me. Suffering breaks plenty of iron too. What the book says is that it's the smith's care through the fire that makes the difference, and that's the Light's part, and ours, for each other." } },
      choices = {
        { text = "Then we're each other's smiths.", next = "BACK", reply = "That's it exactly! I'll make that the closing line, if you'll let me.", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Nobody tempered me but me.", next = "BACK", reply = "Then you've had a hard forge, my friend, and I'm sorry for it. You needn't do it alone now.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
      },
    },
    opening = {
      lines = {
        { id = "o_default", text = "Ahem. \"Brothers and sisters, the Light does not ask us to be unbreakable; it asks us to be mended.\" That's as far as I've got that I like. The next eleven versions are worse." },
      },
      choices = {
        { text = "It's good. Keep it.", next = "opening_more", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Too soft. Start with the iron.", next = "opening_more", fx = { trait = { stern = 1 } } },
      },
    },
    opening_more = {
      lines = { { id = "om_default", text = "You're the first person who's answered instead of nodding politely, so I'll take it to heart. Archbishop Benedictus says a good sermon is one the farmer can carry home in his pocket, and I keep writing ones that need a cart." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    book = {
      lines = {
        { id = "b_default", text = "The Royal Library has a copy, or ought to. Milton Sheaf will know, and he'll tell you the whole history of it whether you ask or not." },
        { id = "b_paxton", when = { questDone = TODO_QUEST("Return to Kristoff") }, text = "Right here in my satchel, copied out and returned, after a detour through Northshire involving a goat, a ditch and a very cross Brother Neals." },
      },
      choices = {
        { text = "Who wrote it?", next = "book_author" },
        { text = "Something else.", next = "BACK" },
      },
    },
    book_author = {
      lines = { { id = "ba_default", text = "A dwarven miner, Margulf Blaggon, who never once mentions the Light and understood it better than most sermons I've dozed through. I'd like to meet him, though I'd probably only stammer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fortitude = {
      big = true,
      lines = { { id = "f_default", text = "It means that when we lay that prayer on someone, we aren't making them stronger than they are; we're reminding their body of what it can already bear. I think the spirit works the same way, if someone's there to remind it." } },
      choices = {
        { text = "I'll remember that when I cast it.", next = "BACK", reply = "Do, and see if it doesn't feel different. It always does to me.", fx = { affinity = 2, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "It's a spell, Brother, so don't dress it up.", next = "BACK", reply = "It is a spell, but it's a prayer too. I'll keep dressing it, if you don't mind.", fx = { align = { light = -1 }, trait = { skeptical = 1 } } },
      },
    },
    smith = {
      lines = { { id = "s_default", text = "Then tell me, because I've only read about it: when you quench the hot iron, does it truly sing? The book says it does, and I've built half a paragraph on that." } },
      choices = {
        { text = "It hisses, mostly, but call it singing anyway.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "It sings, Brother.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    warrior = {
      lines = { { id = "warrior_l", text = "Oh, that's good, may I use that? I'd been circling round it for three pages, and you've said it in one breath, like someone who's actually been knocked down." } },
      choices = {
        { text = "Use it. Fortitude needs no priest to explain it.", next = "warrior2", fx = { trait = { stern = 1 } } },
        { text = "Use it, but leave out my name.", next = "warrior2", fx = { trait = { cautious = 1 } } },
      },
    },
    warrior2 = {
      lines = { { id = "warrior2_l", text = "A warrior I met at the altar, I'll say, which is true and mysterious and will make the old ladies sit up. Iron bends before it breaks, and so do we." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    magni = { { id = "tp_magni", text = "King Magni's dwarves have a faith in the stone as deep as ours in the Light, and I'm building a sermon on it. Fortitude of the spirit, I'll call it, and the iron will be the metaphor." } },
    holy_light = { { id = "tp_holy_light", text = "The Light is a forge, I'll tell the congregation, and the spirit is the iron that's tempered in it. I've rehearsed it forty times, and it gets better every time, though the sexton disagrees." } },
    explorers_league = { { id = "tp_explorers_league", text = "The Explorers' League dig up the old world to find where the dwarves came from, and I'm told they think they were made from stone. I'd like to fit that into my sermon too, but I fear it's getting rather long." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons are a lesson in what happens when iron forgets its maker, and I'll use them as a warning in my sermon. I just need to find a way to say it that won't offend the dwarves in the front pew." } },
    knows = {
      { id = "tp_knows", text = "I stand outside the Cathedral all day rehearsing, so people tell me things to make me stop. Ask me about any of it." },
    },
    background = { { id = "tp_bg", text = "A brother of the Cathedral with more sermons in his head than courage to give them. This one, though, I mean to finish." } },
    advice = { { id = "tp_ad", text = "Read outside your own trade. The best thing I ever learned about the soul came from a book about mining." } },
    northshire_abbey = { { id = "tp_abbey", text = "Brother Paxton at Northshire Abbey is a fine copyist and a very slow one. I say that with love." } },
    _none = { { id = "tp_none", text = "Oh, I don't know that one at all. Is there a book on it? There's usually a book." } },
  },
}

-- Brother Sarno: the first face inside the Cathedral door.
P:NPC {
  key = "sarno", id = TODO_NPC("Brother Sarno"), name = "Brother Sarno",
  bible = "bibles/cathedral_square.md", role = "priest", tier = "quest",
  communities = { "stormwind" }, temper = { "warm" }, values = { "kind", "pious" },
  notices = { "stealth", "gnome", "priest" },
  impression = {
    first = "He worries about the gnomes' ruined city as though it were his.",
    third = "{name} met Brother Sarno, who welcomes every visitor at the door of the Cathedral of Light.",
  },

  greetings = {
    { id = "g_welcome", text = "Welcome, welcome, friend, to the Cathedral of Light!" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! The Cathedral's glad of you, and so am I." },
    { id = "g_techbot", when = { questActive = TODO_QUEST("Tinkmaster Overspark") }, text = "Have you been to Tinker Town yet? Poor Overspark is waiting." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "Welcome to the Cathedral of Light! Oh, you needn't creep, friend; I greet everyone who comes through that door, even the ones who'd rather I didn't." },
    { id = "n_gnome", cat = "gnome", when = { race = "Gnome" },
      text = "Oh, a gnome! I pray for Gnomeregan every evening, I hope you know that. I don't know if the Light listens to prayers about machinery, but I keep trying." },
    { id = "n_priest", cat = "priest", when = { class = "PRIEST" },
      text = "Welcome home, {g:brother|sister}! It's always good to see robes coming back through the door rather than going out of it." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Every evening, for a city drowned in its own poison and a people sleeping in Ironforge's halls. I wonder whether the earth there mourns too." } },
      choices = {
        { text = "Keep praying, Brother. Gnomeregan will need every voice.", next = "BACK", reply = "I will, every evening, and I'll add your name to it, my friend.", fx = { align = { light = 1 } } },
        { text = "Prayers won't clear that poison. Engineers and soldiers will.", next = "BACK", reply = "They will, and I'll pray for the engineers too. Prayers and wrenches, side by side.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They need everyone's help, I'm afraid, since Gnomeregan's survivors lost everything to that poison and are still trying to count what's gone. A mage who can read their workings and doesn't laugh at their gadgets is worth more to them than gold, and you'd make their day just by listening." },
      },
      choices = {
        { text = "Then I'll listen, Brother, and help where I can.", next = "BACK", reply = "Thank you. The gnomes are glad of any kind face, and so am I.", fx = { align = { light = 1 } } },
        { text = "The gnomes made their own trouble, Brother.", next = "BACK", reply = "Perhaps they did, my friend, but nobody deserves to lose a whole city. I'll pray for them anyway.", fx = { align = { light = -1 } } },
        { text = "Something else, Brother.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Never for me, though I've seen it on your people's faces, and I understand it a little better since the gnomes came. They lost a whole city under the ground and some of them can't bear a roof at all now, so I keep the doors open as long as the bishops allow." } },
      choices = {
        { text = "A church needs walls and doors. That's what makes it a sanctuary.", next = "BACK", reply = "That's a sensible view, my friend. I'll keep the doors where they are.", fx = { align = { order = 1 } } },
        { text = "Leave the doors open always, Brother. Faith shouldn't need walls.", next = "BACK", reply = "I'd like that too, though the Archbishop worries about the draught. The doors are always unlocked.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not many, though I'll confess the odd fellow comes through at night with his hood up, and I say hello anyway, and he looks very cross about it. I've decided it's good for people to be greeted, whether they like it or not." } },
      choices = {
        { text = "Greet them all, because honest folk have nothing to hide.", next = "BACK", reply = "I do, my friend, every one, and they never seem to like it. I'll keep at it.", fx = { align = { order = 1 } } },
        { text = "Let the hooded ones pass, Brother. They came to pray unseen.", next = "BACK", reply = "You may be right, my friend. I'll smile at them quietly, then, and say nothing.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Of course you are, because the door doesn't ask what you've studied, and neither do I. The Light can sort out the rest, and in my experience it's a good deal kinder about it than people are." } },
      choices = {
        { text = "Then I'll try to earn that welcome, Brother.", next = "BACK", reply = "You needn't earn it, my friend, but I'll be glad if you try.", fx = { align = { light = 1 } } },
        { text = "I'll take the welcome and keep my studies to myself.", next = "BACK", reply = "That's quite all right. The Light knows what you've studied, and it hasn't locked the door.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every day, and mostly from the Barracks just over the way, to pray before they march or to give thanks when they come home. I say hello to them all, and I try very hard to remember which ones I haven't seen in a while." } },
      choices = {
        { text = "I'll come back and say hello when I return.", next = "BACK", reply = "Do, my friend! I keep a list of the ones who came back, and I'd like to add your name.", fx = { align = { light = 1 } } },
        { text = "Don't count on me returning. That's the job.", next = "BACK", reply = "Then I'll pray all the harder for you, my friend, and hope you surprise yourself.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Very much, though the Archbishop says I'm not to feed the pigeons on the steps any more because they've grown too bold. If I weren't a priest I think I'd have been a shepherd somewhere near Goldshire." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Very much, though the Archbishop says I'm not to feed the pigeons on the steps any more because they've grown too bold. Hello there, {pet}! Oh, it's lovely." },
      },
      choices = {
        { text = "Every beast deserves a kind word, Brother.", next = "BACK", reply = "They do, and the pigeons agree with you. The Archbishop does not.", fx = { align = { light = 1 } } },
        { text = "Don't get attached. It's a working animal.", next = "BACK", reply = "Oh, my friend, it's too late for that. I've already named three of them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Every morning, and they always nod to me, though the nobles never do. I like to think each of them is going out to help someone, so I say a little prayer for each as they pass, even the grumpy ones." } },
      choices = {
        { text = "Your prayers matter, Brother. I'll gladly carry one with me.", next = "BACK", reply = "Bless you, my friend. I'll say it now, and you can carry it to Westfall.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Save your prayers for the gnomes. Paladins can look after themselves.", next = "BACK", reply = "Paladins can, I'm sure, but a prayer never hurt anyone. You'll have one anyway.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, welcome, welcome! Lord Shadowbreaker keeps his hall here in the Cathedral, though I expect you know the way better than I do." },
        { id = "h_default", text = "Brother Sarno, at your service! I keep the door, which mostly means I say hello to everyone in Stormwind at least once. Is this your first time in the Cathedral?" },
        { id = "h_quest", tags = { "news" }, when = { questActive = TODO_QUEST("Tinkmaster Overspark") },
          text = "Tinkmaster Overspark is in Tinker Town, in Ironforge, and he's beside himself over Techbot. Do go and see him; I've been worrying about that little machine all week." },
        { id = "h_quest_before", when = { questBefore = TODO_QUEST("Tinkmaster Overspark"), minLevel = 20 },
          text = "I've had sad news from Ironforge, of all places. Tinkmaster Overspark writes that his Techbot has gone wrong, and I remember it as such a kind, helpful thing." },
        { id = "h_human", when = { race = "Human" },
          text = "A Stormwind face! You'd be surprised how many folk born in this city have never once stepped inside, so I'm doubly glad to see you." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "Welcome, friend from Ironforge! We've a few of your countrymen who come to pray, and they always look at the stonework before they look at the altar." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Late visitors are my favourite. The Cathedral is quiet at night, and people say the things they came to say." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Welcome, welcome! Oh, you were trying not to be noticed, weren't you? I'm sorry, but I notice everyone, because that's what I'm for." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Welcome to the Cathedral of Light! You're very welcome, really you are, though you may want to wait a moment before going near the High Priestess." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, welcome! Wipe your boots, if you would, because the Archbishop notices mud the way you notice an open flank." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, welcome to the Cathedral! I'm afraid your companion will have to wait by the door, though I'll keep it company if you like." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "Welcome, welcome, druid! I've greeted three of your people this year, and each one looked up at the ceiling as if it might fall on them." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Welcome, welcome. The Cathedral doesn't get as many of you as it should, and the gnomes in the corner would love a word." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Welcome, friend, welcome! A shaman from Ironforge, I'd guess. Do the spirits of the mountain grieve for Gnomeregan, as we do?" },
      },
      again = {
        { id = "h_again", text = "Anything else I can help you with? I know where everything is." },
        { id = "h_again2", text = "Go on, I'm listening. The door can keep itself a moment." },
      },
      choices = {
        { text = "I don't know who to see in here.", next = "who" },
        { text = "I keep hearing about something called Techbot.", next = "techbot", when = { any = { { questActive = TODO_QUEST("Tinkmaster Overspark") }, { heardLine = "sarno.h_quest_before" } } } },
        { text = "Do you really greet everyone?", next = "everyone" },
        { text = "Tell me about Gnomeregan's fall.", next = "gnomeregan", when = { race = "Gnome" } },
        { text = "I'm a priest of this house, Brother.", next = "priest", when = { class = "PRIEST" } },
        { text = "Doesn't anyone get past you, Brother?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I've seen plenty of soldiers at prayer here, Brother Sarno.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "You seem fond of animals, Brother Sarno.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Am I really welcome here, Brother?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do many paladins pass through your doors, Brother?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does the Cathedral ever feel too closed in, even for you, Brother?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do the gnomes here need a mage's help, Brother?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you pray for the gnomes of Gnomeregan, Brother Sarno?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Thank you, Brother.", next = "END" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "The Archbishop, of course, if he's free, and High Priestess Laurena for prayers and training. Bishop Farthing listens better than anyone in the building, and if you're a paladin, Duthorian Rall will find you before you find him." } },
      choices = {
        { text = "There's a man in red downstairs too.", next = "who_crowley" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_crowley = {
      big = true,
      lines = { { id = "wc_default", text = "Brother Crowley, of the Scarlet Crusade. I greet him too, every morning, though he never greets me back. The Archbishop says the doors stay open, so they do." } },
      choices = {
        { text = "The Crusade has no place in a church.", next = "BACK", reply = "Perhaps not, but the door's open to everyone, or it's not a church. I'll keep greeting him.", fx = { align = { light = -1 }, learn = { "scarlet_crusade" } } },
        { text = "Open doors are right, even for him.", next = "BACK", reply = "Thank you, my friend. It's hard sometimes, but I think it's right.", fx = { affinity = 1, align = { light = 1 }, learn = { "scarlet_crusade" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    techbot = {
      lines = { { id = "t_default", text = "A little mechanical helper the gnomes built, who used to direct people and fetch things and answer questions. Tinkmaster Overspark says it's malfunctioned, gone rogue in the ruins, and he sounded so sad in his letter." } },
      choices = {
        { text = "It's only a machine, Brother.", next = "techbot_machine" },
        { text = "Why does a priest care about a machine?", next = "techbot_machine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    techbot_machine = {
      big = true,
      lines = { { id = "tm_default", text = "Perhaps, but Overspark made it to be kind, and it was, and now it isn't. I think there's something sad in that whatever it's made of. Besides, the gnomes have lost their whole city, and if they can save one small thing from it, I'd like them to." } },
      choices = {
        { text = "Then I'll help them save it.", next = "BACK", reply = "Bless you. The gnomes in Tinker Town will be so glad.", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Pity is wasted on gears, Brother.", next = "BACK", reply = "Perhaps, my friend, but I'll pity it anyway. It used to be kind.", fx = { align = { light = -1 }, trait = { skeptical = 1 } } },
      },
    },
    everyone = {
      lines = { { id = "e_default", text = "Everyone! Soldiers, beggars, lords, a goblin once, and some folk who think they've slipped in unseen. The Light sees them anyway, so I don't see why I shouldn't say hello." } },
      choices = {
        { text = "Even someone sneaking in?", next = "everyone_sneak" },
        { text = "Something else.", next = "BACK" },
      },
    },
    everyone_sneak = {
      lines = { { id = "es_default", text = "Especially them. A person who sneaks into a church usually needs it more than the one who strolls in, and a warm hello has turned a few of them around." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    gnomeregan = {
      lines = { { id = "g_default", text = "Only what your people have told me here, so I'd like to hear it from you. Is there anyone you're still waiting to hear from?",
        fx = { learn = { "gnomeregan" } } } },
      choices = {
        { text = "Too many. Thank you for asking.", next = "BACK", fx = { affinity = 3 } },
        { text = "I'd rather not talk about it.", next = "BACK" },
      },
    },
    priest = {
      lines = { { id = "p_default", text = "Then you'll know that keeping the door is the most important job here, and that nobody believes me when I say it. Every soul who stays for the Light first stayed because someone said hello." } },
      choices = {
        { text = "I'll remember to say hello.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    holy_light = { { id = "tp_holy_light", text = "I greet everyone who walks through these doors, because the Light lives in all of them. Even the ones who come in to get out of the rain are welcome, and I tell them so." } },
    scourge = { { id = "tp_scourge", text = "Some of the refugees who come through these doors have lost everything to the Scourge, even their names. I give them a blessing and a bowl, and I hope that's a start." } },
    magni = { { id = "tp_magni", text = "King Magni gave the gnomes of Gnomeregan a home in Ironforge after their city was poisoned, and that's the Light at work, whether the dwarves call it that or not. I pray for him every week." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire visited Goldshire once while I was there, and a gnome there showed me a mechanical bird that sang hymns. I've not stopped thinking about it, and I'm sure the Light was pleased." } },
    knows = {
      { id = "tp_knows", text = "Everyone who comes through the Cathedral door says a little something to me on the way in, and it adds up. Ask me about any of it!" },
    },
    background = { { id = "tp_bg", text = "A brother of the Cathedral who was given the door, and who has loved it ever since. There isn't much more to tell than that, I'm afraid." } },
    advice = { { id = "tp_ad", text = "Say hello to people first. It costs nothing, and often they've been waiting all day for someone to." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "The gnomes' city under Dun Morogh, lost to something in its own depths. I pray for it, machines and all." } },
    scarlet_crusade = { { id = "tp_crusade", text = "The Scarlet Crusade are Brother Crowley's people. I greet him every morning, and one day he'll greet me back." } },
    _none = { { id = "tp_none", text = "Oh, I've no idea, but someone inside surely does. Shall I point you to them?" } },
  },
}

-- Thomas: the altar boy who carries Bishop DeLavey's quiet errands.
P:NPC {
  key = "thomas_altar", id = TODO_NPC("Thomas"), name = "Thomas",
  bible = "bibles/cathedral_square.md", role = "child", tier = "quest",
  communities = { "stormwind" }, temper = { "eager" }, values = { "pious", "dutiful" },
  notices = { "priest", "paladin" },
  impression = {
    first = "He is proud of his secret errands and too loud about them.",
    third = "{name} met Thomas, an altar boy who walks the length of the Cathedral and runs the Bishop's errands.",
  },

  greetings = {
    { id = "g_walk", text = "I can't stop, I'm doing the candles, but I can talk while I walk." },
    { id = "g_secret", when = { questActive = TODO_QUEST("The Missing Diplomat") }, text = "Did you see him yet? The Bishop, I mean, in the Keep? Shh." },
  },

  notice = {
    { id = "n_priest", cat = "priest", when = { class = "PRIEST" },
      text = "Are those real priest's robes, from the High Priestess? I'm going to have some when I'm older, Brother Joshua says, if I learn my prayers and stop running in the nave." },
    { id = "n_paladin", cat = "paladin", when = { class = "PALADIN" },
      text = "You're a paladin! Is the armour heavy, and do you have to polish it yourself, or does a squire do it, because I'd do it for free if you needed someone." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Yes, but I can't tell you, except that it's for Brother Sarno and it's candles. Is your errand about spirits? That sounds much better than candles." } },
      choices = {
        { text = "A secret kept is a promise kept, Thomas. Hold to it.", next = "BACK", reply = "I will! Brother Sarno says a promise is like a candle, you keep it lit.", fx = { align = { honor = 1 } } },
        { text = "Candles are dull. Tell me everything you know.", next = "BACK", reply = "I can't! Brother Sarno would be cross, and then he'd be sad, and that's worse.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Brother Joshua says to pray for them, and Brother Crowley says something I'm not allowed to repeat, and the Bishop just sighs. I think you look sad more than wicked, but please don't tell the priests I talked to you, because I'm meant to be carrying candles." },
      },
      choices = {
        { text = "I won't tell, Thomas. Go and carry your candles.", next = "BACK", reply = "Thank you! You're nicer than Brother Crowley says. I'll go now.", fx = { align = { light = 1 } } },
        { text = "Crowley's words aren't so bad. Repeat them.", next = "BACK", reply = "I can't! Brother Joshua would wash my mouth with soap. I'd better go.", fx = { align = { light = -1 } } },
        { text = "Something else, Thomas.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Yes, please, but quietly, because Brother Joshua says I ask too many questions about things that aren't the Light. Is it like a font, only bigger, and does the moon really go in it?" } },
      choices = {
        { text = "Ask Brother Joshua first, Thomas, and then I'll tell you.", next = "BACK", reply = "All right, but he'll say no, and then I'll come back and ask you anyway.", fx = { align = { order = 1 } } },
        { text = "Never mind Joshua. A good question doesn't need permission.", next = "BACK", reply = "Really? Then tell me now, before Brother Joshua comes round the pillar!", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Mostly, because I walk past every pillar a hundred times a day, and boots are hard to hide. Bishop DeLavey says I'd make a good spy, but Brother Joshua says I'd make a better candle-lighter, so I'm doing that for now." } },
      choices = {
        { text = "Stay with the candles, Thomas, because that's honest work.", next = "BACK", reply = "I will, but I'll keep watching too, just a little. Don't tell Brother Joshua.", fx = { align = { honor = 1 } } },
        { text = "Keep watching, Thomas. Spies learn more than candle-lighters do.", next = "BACK", reply = "I knew it! Bishop DeLavey was right. I'll practise behind the pillars.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Would you? Only Brother Joshua says the candles have to be lit by hand, because that's part of the prayer, so maybe it doesn't count if you magic them. I'll just get the ladder, but you could hold it." } },
      choices = {
        { text = "Rules are rules, Thomas, so light them by hand.", next = "BACK", reply = "All right. I'll light them by hand, but I'll think about the magic while I do it.", fx = { align = { order = 1 } } },
        { text = "The candles don't mind how they're lit, Thomas.", next = "BACK", reply = "That's what I said! But Brother Joshua says the candles mind very much.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They say warriors are brave but loud, and Brother Joshua says you can be both if you mean it. I carried candles to a soldier's funeral last week and everybody was very quiet, even the warriors." } },
      choices = {
        { text = "Being brave means being quiet sometimes, Thomas.", next = "BACK", reply = "I'll remember that. I was quiet at the funeral, and I think it was brave.", fx = { align = { order = 1 } } },
        { text = "Warriors are loud because they're brave, Thomas.", next = "BACK", reply = "Then I'll be loud too, someday, when I'm brave enough. Thank you!", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Only once, on the way to Goldshire, and there was a wolf by the road and the cart man threw a rock at it! I wanted to see it properly but it ran away into the trees." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Only once, on the way to Goldshire, and there was a wolf by the road and the cart man threw a rock at it! Is that {pet}? Can I touch it?" },
      },
      choices = {
        { text = "Wolves are just trying to live too, Thomas.", next = "BACK", reply = "That's what I thought too! I wanted to give it bread, but the cart man said no.", fx = { align = { light = 1 } } },
        { text = "The cart man was right. Wolves are dangerous, Thomas.", next = "BACK", reply = "I suppose so, but it looked so hungry. I'll stay in the cart next time.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Thomas, I serve at the altar, which means candles mostly, and bells, and carrying things for the priests. I walk the whole Cathedral end to end about a hundred times a day, so I see everybody." },
        { id = "h_diplomat", key = true, tags = { "news" }, when = { questBefore = TODO_QUEST("The Missing Diplomat"), minLevel = 18 },
          text = "Excuse me, {g:sir|madam}, um, Bishop DeLavey asked me to find adventurers who could help him with something delicate, and you look like one, so could you go up to the Keep and see him, quietly? It's important, he said, and secret, so please don't tell anyone I said." },
        { id = "h_diplomat_active", when = { questActive = TODO_QUEST("The Missing Diplomat") },
          text = "The Bishop's in the Petitioner's Chamber in the Keep, past the throne room. Don't tell anyone I sent you, all right? I'm not even supposed to know it's a secret." },
        { id = "h_diplomat_done", when = { questDone = TODO_QUEST("The Missing Diplomat") },
          text = "The Bishop said you've been a great help, and he patted my head, which he never does. I didn't ask what about, because he'd have told me not to." },
        { id = "h_human", when = { race = "Human" },
          text = "Did you grow up in Stormwind too? I've lived by the Cathedral since I was little, and I've never been past the Elwynn gate, not once." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You were behind the pillar the whole time, weren't you? I saw your boots, but I didn't say, because I thought you might be playing a game." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "Are you a mage? Could you light the high candles, the ones up by the window? I can't reach them, and the ladder wobbles." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "Are you a warrior? You walk like the Barracks men, all stompy, and the priests always tell them to walk softer in here." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "Are you a hunter? You've got a bow, so you must be, unless you stole it, but you don't look like a thief." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "You're a druid, aren't you? I can tell by the leaves on your boots, and the Bishop says nobody else in Stormwind ever brings leaves in." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Oh! Are you a warlock? I've never met one, not properly, only seen them going down to the Lamb at night." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "You're a shaman? I won't tell anyone. I'm very good at secrets. Mostly very good. Are you on a secret errand too?" },
      },
      again = {
        { id = "h_again", text = "What else? I've got four more candles on this side." },
        { id = "h_again2", text = "Ask me anything, I know where all the priests are." },
      },
      choices = {
        { text = "I'd wager the Bishop has some secret, Thomas.", next = "secret", when = { any = { { questActive = TODO_QUEST("The Missing Diplomat") }, { heardLine = "thomas_altar.h_diplomat" } } } },
        { text = "You seem to like serving at the altar.", next = "altar" },
        { text = "Some of these priests must be strict.", next = "strict" },
        { text = "You'll make a fine priest someday, I'd guess.", next = "priest", when = { class = "PRIEST" } },
        { text = "Would you like to be a paladin someday?", next = "paladin", when = { class = "PALADIN" } },
        { text = "Do you notice everyone who sneaks in here, Thomas?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Shall I light the high candles for you?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What do the priests say about warriors, Thomas?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Have you ever seen the woods outside the city, Thomas?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Shall I tell you what a moonwell looks like, Thomas?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "What do the priests say about the folk from the Lamb, Thomas?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Are you on a secret errand right now, Thomas?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Off you go, then.", next = "END" },
      },
    },
    secret = {
      lines = {
        { id = "s_default", text = "I don't know, really, and I wouldn't tell if I did, because the Bishop trusts me. I only know it's about somebody who went somewhere and didn't get there, and that he looked worried." },
      },
      choices = {
        { text = "Good lad. Keep it that way.", next = "secret_good", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Come on, you can tell me. I won't say.", next = "secret_good", fx = { affinity = -1, align = { order = -1 } } },
      },
    },
    secret_good = {
      lines = { { id = "sg_default", text = "I'm not telling, because I don't know anything else, which is a good way to keep a secret, Brother Joshua says. He says most people who leak secrets didn't need to know them in the first place." } },
      choices = {
        { text = "Which bishop do you mean, Thomas?", next = "delavey" },
        { text = "Something else.", next = "BACK" },
      },
    },
    delavey = {
      lines = { { id = "d_default", text = "Bishop DeLavey. He speaks for the Church at court, up in the Keep, so he has to be clever and polite at the same time, which is very hard. He gives me errands because I'm quick and I don't chatter, mostly." } },
      choices = { { text = "Mostly.", next = "BACK", fx = { trait = { witty = 1 } } }, { text = "Something else.", next = "BACK" } },
    },
    altar = {
      lines = { { id = "a_default", text = "I love it, except the early bells. When the sun comes through the big windows in the morning and the candles are all lit, it looks like the Light's actually in the room, and I'm the one who lit them." } },
      choices = {
        { text = "That's important work.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    strict = {
      lines = { { id = "st_default", text = "Brother Joshua, about running, and High Priestess Laurena, about everything else, though she's nice after. The Archbishop isn't strict at all, he just looks sad when you do something wrong, which is worse." } },
      choices = { { text = "Ha. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    priest = {
      lines = { { id = "p_default", text = "I hope so, more than anything! Only I'm worried I won't be good enough at the healing part, because I faint when I see blood, a bit. Did you ever faint?" } },
      choices = {
        { text = "Once or twice, and you get past it.", next = "BACK", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "Never. You'll have to toughen up.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    paladin = {
      lines = { { id = "paladin_l", text = "Yes, I think so, or maybe! Lord Shadowbreaker says I'm too young and too short, and Arthur says height has nothing to do with it, and I'm on Arthur's side." } },
      choices = {
        { text = "Arthur's right. Keep lighting candles.", next = "paladin2", fx = { trait = { kind = 1 } } },
        { text = "Start by lifting heavier candlesticks.", next = "paladin2", fx = { trait = { witty = 1 } } },
      },
    },
    paladin2 = {
      lines = { { id = "paladin2_l", text = "I already carry the big brass ones on feast days, both at once! Will you show me how you hold your hammer, before you go?" } },
      choices = { { text = "Like this. Gently.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    holy_light = { { id = "tp_holy_light", text = "I'm going to be a priest someday and fill the whole Cathedral with Light, enough so you can see it from Goldshire. Brother Joshua says I'll need to practise a lot more first." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire has a fortune-teller, and she said I'd become a great man of the Light! I asked her if she'd tell the Archbishop, and she just laughed at me." } },
    valley_of_heroes = { { id = "tp_valley_of_heroes", text = "I ran messages to the Valley of Heroes once, and I stopped to look up at the statues, and I was very late. Brother Joshua said they'd waited a long time already and could wait a little more." } },
    scourge = { { id = "tp_scourge", text = "The new orphans from Lordaeron sometimes cry at night about the dead walking. I tell them the Light won't let it happen here, and I hope I'm right, because I promised them." } },
    knows = {
      { id = "tp_knows", text = "I hear lots of things walking up and down, because grown-ups forget I'm there. Ask me, but not about the secret." },
    },
    background = { { id = "tp_bg", text = "I'm the altar boy. That's it, really, but it's a good thing to be." } },
    advice = { { id = "tp_ad", text = "Don't run in the nave, because Brother Joshua will see you, he always does." } },
    _none = { { id = "tp_none", text = "I don't know, sorry, I'm only the altar boy. Ask a priest, they know everything." } },
  },
}

-- Orphan Matron Nightingale: the costs of war, counted one child at a time.
P:NPC {
  key = "nightingale", id = TODO_NPC("Orphan Matron Nightingale"), name = "Orphan Matron Nightingale",
  prejudice = { class = "WARLOCK", amount = 12, why = "An imp from a Slaughtered Lamb lodger set the orphanage linen alight two winters back." },
  bible = "bibles/cathedral_square.md", role = "citizen", tier = "quest",
  communities = { "stormwind" }, temper = { "steady" }, values = { "kind", "dutiful" },
  notices = { "refugee", "young", "priest" },
  impression = {
    first = "She remembers every child who has passed through her door.",
    third = "{name} met Orphan Matron Nightingale, who keeps Stormwind's orphanage and remembers every child by name.",
  },

  greetings = {
    { id = "g_prej", when = { prejudiced = true }, text = "You again, and I'll thank you to stay on the step. I've forty children in this house, and not one of them needs to see what follows a warlock home." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "Come in, then, and mind the boots by the door. I was wrong about you, I think, though I'll still count the children after you've gone." },
    { id = "g_door", text = "Mind the step; small feet have worn it crooked." },
    { id = "g_week", when = { questActive = TODO_QUEST("Children's Week") }, text = "Take good care of your little one, {class}. They'll remember this week for years." },
    { id = "g_letter", when = { questActive = TODO_QUEST("Remember That I Love You") }, text = "You're carrying something for me, I think. Bring it here, gently." },
  },

  notice = {
    { id = "n_refugee", cat = "refugee", when = { origin = "human_lordaeron_refugee" },
      text = "You came south from Lordaeron, didn't you? I can always tell; you look at the orphanage the way some of our children look at the gate, as if it might close." },
    { id = "n_priest", cat = "priest", when = { class = "PRIEST" },
      text = "A priest! The children say their prayers better when someone in robes is listening, so if you've a quarter-hour this evening, it would be a kindness." },
    { id = "n_young", cat = "young", when = { maxLevel = 9 },
      text = "You're hardly older than my eldest, and already out on the roads. Be careful, {class}; I'd rather not meet any more children because of what happened to their parents." },
  },

  start = "hello",
  nodes = {
    prej = {
      big = true,
      lines = { { id = "prej_default", text = "No, I don't, and I'll not dress it up for you. Two winters back a warlock lodging at the Slaughtered Lamb let his imp loose, and it came through our kitchen window and set the linen alight with the little ones asleep upstairs." } },
      choices = {
        { text = "What I keep is chained so it hurts no one. That's the point.", next = "prej_a", fx = { align = { light = -1 } } },
        { text = "You're right to be careful. I'll keep my distance from the children.", next = "prej_b", fx = { align = { light = 1 } } },
        { text = "What would put your mind at ease, Matron?", next = "prej_calm", fx = { affinity = 1 } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    prej_a = {
      lines = { { id = "prej_a_default", text = "Then bind them somewhere else, {class}. I've heard every clever word about mastery and control, and none of it puts out a fire in a nursery." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    prej_b = {
      lines = { { id = "prej_b_default", text = "Thank you. It isn't you I hate, and I'm not sure I could tell you what it is, only that I smelled that smoke for a month." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    prej_calm = {
      lines = { { id = "prej_calm_default", text = "Time, I suppose, and you being decent with it. Leave whatever you keep in that satchel at the inn, and bring the little ones something sweet now and then." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Bread, shoes, and someone who stays. The war cost this city a generation of parents, and the crown counts it in coin when it should count it in children." } },
      choices = {
        { text = "Then the crown should keep proper count of them.", next = "BACK", reply = "It should, {class}, and I'll keep writing letters until it does. Thank you.", fx = { align = { order = 1 } } },
        { text = "The crown won't help. Neighbours will, or no one.", next = "BACK", reply = "Then I'll be grateful for every neighbour who comes, and there are a few. Thank you for being one.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I fear what the world does to children, {class}, and I've seen enough of it to have no fear left over for you in particular. But I've had boys come back from the Mage Quarter with burns they wouldn't explain, so I'll thank you to keep away from the young ones who've begun asking questions about power." },
      },
      choices = {
        { text = "I'll keep away from them, Matron. You have my word.", next = "BACK", reply = "Thank you, {class}. That means more than you'd think.", fx = { align = { light = 1 } } },
        { text = "Children who ask about power always find it, Matron. One way or another.", next = "BACK", reply = "Then I'll pray they ask someone kinder than the Lamb. Please, don't be the one they find.", fx = { align = { light = -1 } } },
        { text = "Something else, Matron.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Some do, and the canals have a way of keeping them, especially since the Defias began paying boys to carry messages. The ones who come back are quieter, and they lock their doors at night." } },
      choices = {
        { text = "Then the city owes them a better path than the canals.", next = "BACK", reply = "It does, and I'll keep saying so. Every boy the canals keep is one this city lost.", fx = { align = { light = 1 } } },
        { text = "The canals teach them to survive, and that's worth something.", next = "BACK", reply = "It is, I suppose, but I'd rather they learned it from me than from the Defias.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "One or two, perhaps, especially a girl who reads everything and sets nothing on fire, which I'm told is rare. The Quarter takes so few orphans, though, because an apprenticeship costs money that nobody here has." } },
      choices = {
        { text = "The Quarter's rules are there for a reason, Matron.", next = "BACK", reply = "Perhaps, but rules that keep a clever girl out of the Quarter don't serve anyone. I'll keep trying.", fx = { align = { order = 1 } } },
        { text = "Talent should matter more than a purse, Matron.", next = "BACK", reply = "Thank you. I'll write that in my next letter to the Sanctum, though they won't listen.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "To know that their parents mattered, and that the kingdom hasn't forgotten them. If you speak to them, speak of their fathers and mothers as soldiers, not as losses, because that's what they need to hear." } },
      choices = {
        { text = "Their parents were heroes, and I'll tell them so.", next = "BACK", reply = "Thank you. They need to hear it, and they need to hear it from someone in armour.", fx = { align = { light = 1 } } },
        { text = "I won't lie to them. War is ugly, and they should know.", next = "BACK", reply = "They'll learn that soon enough, {class}. Let them have their heroes a little longer.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Very good, I think, for the quiet ones who won't speak to people. I've seen a boy who hasn't said a word in a month talk for an hour to a stray dog in the square." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Very good, I think, for the quiet ones who won't speak to people. Your {pet} looks gentle enough. If you'd let it sit on the steps with them a while, I'd be grateful, {class}." },
      },
      choices = {
        { text = "Of course. A little kindness costs nothing.", next = "BACK", reply = "Thank you. The quiet ones will remember you longer than you'll remember them.", fx = { align = { light = 1 } } },
        { text = "I can't spare the time. We're needed on the road.", next = "BACK", reply = "I understand, {class}, but come by when you can. They'd love it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Whether their parents can see them, mostly, and whether they're angry that the children lived. I tell them no, they aren't angry, and yes, they're watching, but I'd sleep easier if someone wiser than me said it." } },
      choices = {
        { text = "Their parents watch over them. I'll tell them so myself.", next = "BACK", reply = "Thank you. They believe it more when it comes from someone who's been out there.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I can't tell them what I don't know, Matron. Better the truth.", next = "BACK", reply = "I know, and I struggle with it too. But a child who can't sleep needs hope more than truth.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "They'll go when they're of age, and some of them will die, which is the cost of war that people forget. I'd only ask that whoever trains them remembers they were children first, because nobody remembered it for their fathers." } },
      choices = {
        { text = "Every soldier was someone's child. I won't forget it.", next = "BACK", reply = "Thank you. That's all I ask of anyone who trains them.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The kingdom needs soldiers, Matron. Sentiment won't hold the walls.", next = "BACK", reply = "It won't, but it'll remind them why the walls are worth holding. I'll keep my sentiment.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. The children will want a story with the Light in it, {class}, and I'll want you to make it one with a happy ending." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Some of my oldest boys would follow you into the Burning Steppes if you let them, {class}, so I'll thank you not to." },
        { id = "h_default", text = "There are costs to war, {class}, and the ones people forget are the children. Those with no one else come here, to us, and stay until they can fend for themselves. I'm Matron Nightingale, and this is their home." },
        { id = "h_letter", key = true, tags = { "news" }, when = { questActive = TODO_QUEST("Remember That I Love You") },
          text = "Heartweaver... oh, little Jeremy Heartweaver! He came to us years ago, after Lordaeron fell, with both his parents lost, and he hardly said a word the whole time he was here." },
        { id = "h_letter2", tags = { "news" }, when = { questActive = TODO_QUEST("Remember That I Love You (2)") },
          text = "Avette Fellwood took Jeremy in, out in Duskwood. If you see him, tell him we're all thinking of him here, won't you? Even the ones who were too small to remember his name." },
        { id = "h_week", tags = { "news" }, when = { questActive = TODO_QUEST("Children's Week") },
          text = "One week a year the children get to see a little more of the world than these walls. Show them something wonderful, and bring them back with all their fingers, please." },
        { id = "h_human", when = { race = "Human" },
          text = "Most of my children are Stormwind's, or Lordaeron's, and a few came from Westfall last year. You'll know the names of their villages, I expect, better than they do now." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You've the look of one of the canal children grown up, {class}, and I'd know that watchful way of standing anywhere, because half of mine have it." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! The older children have been begging for someone to tell them what the Mage Quarter does all day, and I've run out of ways to say I don't know." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Many of the children here are the sons and daughters of soldiers, {class}, and they will watch you very closely." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. The children will want to see your companion, {class}, and I'll ask you to keep it calm; some of them have had frights enough." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock, at the orphanage door. I'll ask you plainly to keep whatever you carry well away from my children." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I've children here whose fathers died at orc hands, and some of them will hear spirit-talk and think of axes. Speak gently, please." },
      },
      again = {
        { id = "h_again", text = "Anything else, dear? I've a moment before supper." },
        { id = "h_again2", text = "Go on. The children can manage without me for a minute or two." },
      },
      choices = {
        { text = "You don't want me near the children, do you, Matron?", next = "prej", when = { prejudiced = true } },
        { text = "These children come from all over, by the look of them.", next = "where" },
        { text = "Do the children ever get out of the city?", next = "week" },
        { text = "You can't run this place alone.", next = "help" },
        { text = "I've wondered what became of Jeremy Heartweaver.", next = "jeremy", when = { questDone = TODO_QUEST("Remember That I Love You") } },
        { text = "I was one of them, once. From Lordaeron.", next = "refugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "Would the children like to see a bear, Matron?", next = "druid", when = { class = "DRUID" } },
        { text = "Do your children ever run off to the canals?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would any of your children make good mages?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What do the soldiers' children need most, Matron?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Would a gentle beast be good for the children, Matron?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What do the orphans ask about when they pray, Matron?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should the older boys train as soldiers, Matron?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you fear what I am, Matron?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What do the orphans need most, Matron?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day, Matron.", next = "END" },
      },
    },
    where = {
      big = true,
      lines = { { id = "w_default", text = "From every war the kingdom has fought in my lifetime: the orcs, then the plague in the north, and now the Defias in Westfall, who make orphans as fast as they make thieves. Each war sends us a few more than the last." } },
      choices = {
        { text = "Then the wars must end.", next = "where_end", fx = { align = { light = 1 } } },
        { text = "Wars make soldiers of orphans. That's the way of it.", next = "where_end", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "You'll have a houseful by now, I expect.", next = "where_end" },
      },
    },
    where_end = {
      lines = { { id = "we_default", text = "More than we have beds for, and fewer than there were last winter, which I count as a good year. Some go to families, some to apprenticeships, and some to the army the day they're old enough, and I pray for those most of all.",
        fx = { learn = { "defias" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    week = {
      lines = { { id = "wk_default", text = "Every spring the Alliance gives something back to these innocents: an adventurer takes an orphan under their wing for a few days and shows them the world. Some of my children talk about it for the rest of the year." } },
      choices = {
        { text = "I'd like to do that.", next = "week_how", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Isn't it dangerous for them?", next = "week_how" },
      },
    },
    week_how = {
      lines = { { id = "wh_default", text = "Not if you're sensible, and I only give them to sensible people. Come back in the spring and ask me; I'll know by then whether you're one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    help = {
      lines = { { id = "hp_default", text = "I don't. There's Shellene, inside, who loves them and shouts at them in equal measure, and Stephanie Turner and her husband, who clothe and feed them. The Cathedral sends priests, and the Light sends the rest, eventually." } },
      choices = {
        { text = "What could I do?", next = "help_do" },
        { text = "Something else.", next = "BACK" },
      },
    },
    help_do = {
      lines = { { id = "hd_default", text = "Come back alive, mostly. Half of my children are here because someone brave didn't, so if you want to help us, be a little less brave than you'd like." } },
      choices = {
        { text = "I'll be careful, Matron.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
        { text = "Being careful won't save anyone.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    jeremy = {
      lines = { { id = "j_default", text = "Avette wrote to me afterward. She says he isn't ready for his mother's letter yet, and she'll keep it for him until he is, which is exactly what I'd have done. I'm glad he has someone who knows to wait." } },
      choices = {
        { text = "She was right to wait.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "He deserved to know.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    refugee = {
      lines = { { id = "r_default", text = "Then welcome home, in a way. Will you tell me what helped you, those first years, so I can do more of it? The children who came from the north still won't say much to me." } },
      choices = {
        { text = "Someone who didn't ask questions.", next = "BACK", fx = { affinity = 3 } },
        { text = "Work. Something to do with my hands.", next = "BACK", fx = { affinity = 3 } },
        { text = "Nothing helped. You just get older.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    druid = {
      lines = { { id = "druid_l", text = "Oh, my word. They'd adore it, and then they'd have nightmares, and I'd be up till dawn with all of them. Could you be a small bear, dear?" } },
      choices = {
        { text = "A very small, very gentle bear.", next = "druid2" },
        { text = "Perhaps a cat would frighten them less.", next = "druid2", fx = { trait = { cautious = 1 } } },
      },
    },
    druid2 = {
      lines = { { id = "druid2_l", text = "Then come by at Children's Week, when they're all in good spirits, and I'll tell them a friend of the kaldorei is visiting. They'll talk of nothing else for a month." } },
      choices = { { text = "Something else, Matron.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    scourge = { { id = "tp_scourge", text = "The Scourge sends me more orphans than the orcs ever did, and they come with nightmares the orcs never gave anyone. I've given up asking the Keep for more beds and started asking for more candles." } },
    second_war = { { id = "tp_second_war", text = "The Second War filled this orphanage once, and I thought we'd never see it so full again. Then the plague came, and I learned I was wrong, and I've stopped making that sort of promise." } },
    deadmines = { { id = "tp_deadmines", text = "The Defias take older boys from the streets and teach them to steal, and some of them go west to the mines under Moonbrook. I've lost three that way, and I remember every one." } },
    holy_light = { { id = "tp_holy_light", text = "The Light keeps the roof over our heads and the bread on the table, with some help from the Cathedral's purse. I pray every night, and I count the beds every morning." } },
    knows = {
      { id = "tp_knows", text = "Children tell you everything if you wait long enough, and their parents' friends tell you the rest. Ask me what you like." },
    },
    background = { { id = "tp_bg", text = "I keep the orphanage. That has been the whole of my life for longer than most of my children have been alive, and it's enough." } },
    advice = { { id = "tp_ad", text = "If you ever find a child on the road with no one, bring them here. Don't wait to be sure; we'll sort it out." } },
    defias = { { id = "tp_defias", text = "Every Westfall farmer they kill sends me another child. I've no other opinion of them, and I don't need one." } },
    _none = { { id = "tp_none", text = "That's beyond me, I'm afraid. I know children, and not much else." } },
  },
}

-- Shellene: inside the orphanage, mid-scold.
P:NPC {
  key = "shellene", id = TODO_NPC("Shellene"), name = "Shellene",
  bible = "bibles/cathedral_square.md", role = "citizen", tier = "service",
  communities = { "stormwind" }, temper = { "warm" }, values = { "kind", "pious" },
  notices = { "priest" },
  impression = {
    first = "She scolds the orphans and blesses them in the same breath.",
    third = "{name} met Shellene, who looks after the children in Stormwind's orphanage.",
  },

  greetings = {
    { id = "g_children", text = "Now, children, stop that, I mean it! Oh, hello there, dear." },
    { id = "g_future", text = "Mind the little ones underfoot, they get everywhere." },
  },

  notice = {
    { id = "n_priest", cat = "priest", when = { class = "PRIEST" },
      text = "Oh, a priest! Would you say a blessing over them before you go? They sleep better after, I swear it, and so do I." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Gently, and in daylight, and nothing that bangs. The Light will see them right, but a little wonder never hurt a child." } },
      choices = {
        { text = "Wonder is a gift, Shellene. I'll be gentle with it.", next = "BACK", reply = "Lovely. They'll talk about it for weeks, and then they'll try to copy it.", fx = { align = { light = 1 } } },
        { text = "They need lessons, not wonders. Teach them something useful.", next = "BACK", reply = "Oh, they get plenty of lessons, love. A bit of wonder helps the lessons stick.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I'd like to believe it, because I pray over every child every night and I'd hate to think any of them was beyond it. If the Light can find a way to a canal urchin who bit me twice last week, I suppose it can find a way to you, though you might meet it halfway." },
      },
      choices = {
        { text = "I'll try to meet it halfway, Shellene.", next = "BACK", reply = "That's all I ask, love. The Light will meet you the rest of the way.", fx = { align = { light = 1 } } },
        { text = "The Light can come to me, if it wants me.", next = "BACK", reply = "Oh, it will, love, it always does, usually when you've stopped looking. I'll pray it doesn't take too long about it.", fx = { align = { light = -1 } } },
        { text = "Something else, Shellene.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Every day since one of your people came through with a cart of saplings and told them trees could talk. Now half of them whisper to the potted fern by the door, and I haven't the heart to tell them it never answers." } },
      choices = {
        { text = "Better they learn their letters than talk to ferns, Shellene.", next = "BACK", reply = "They learn their letters too, love, and then they read them to the fern. It's very sweet.", fx = { align = { order = 1 } } },
        { text = "Let them keep whispering. A fern by a window hears every word.", next = "BACK", reply = "I thought so too! I'll tell the children you said so, and they'll be thrilled.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "There's a boy who can lift a biscuit off my plate while I'm saying grace, and I pray over him twice as hard because of it. All will be well with him, I'm sure, so long as somebody kind finds him before somebody clever does." } },
      choices = {
        { text = "Then teach him kindness, so he chooses well.", next = "BACK", reply = "That's what I pray for every night, love. Kindness and a full belly.", fx = { align = { light = 1 } } },
        { text = "Clever is what keeps a canal boy alive, Shellene.", next = "BACK", reply = "It does, love, and I'll not pretend otherwise. But I want him to be more than alive.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "A soft one might, now you say it, because some of them have been frightened of the dark since they came here. The Light shall see to them, of course, but I don't suppose it would mind a little help from you." } },
      choices = {
        { text = "A gentle light, then, for as long as they need it.", next = "BACK", reply = "A gentle one, yes. I'll see to it, and they'll sleep easier.", fx = { align = { light = 1 } } },
        { text = "They'll have to face the dark sooner or later.", next = "BACK", reply = "They will, love, but not tonight. Tonight they need a light.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "All day, with broom handles and pot lids, and someone always ends up crying. I let them, because the Light knows they need something to feel brave about, and I'll mend the bumps after." } },
      choices = {
        { text = "Let them play. Courage has to start somewhere.", next = "BACK", reply = "That's what I think too. A pot lid's a fine shield for a boy of six.", fx = { align = { light = 1 } } },
        { text = "Take the brooms away. War isn't a game.", next = "BACK", reply = "It isn't, love, but for them it's the only way to feel safe. I'll keep the brooms.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Hardly ever, which is a shame, because a day in the Elwynn woods would do them more good than a week of sermons. The Matron took the older ones to Goldshire once, and they talked about the deer for a whole season." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Hardly ever, which is a shame, because a day in the Elwynn woods would do them more good than a week of sermons. Oh, look at {pet}! The children would adore it, so long as it promises not to eat the bread." },
      },
      choices = {
        { text = "I'll show them the woods one day, if the Matron allows.", next = "BACK", reply = "Would you? Oh, the Matron would say yes, I'm sure. They'd love it.", fx = { align = { order = 1 } } },
        { text = "The woods are no place for children. Keep them here.", next = "BACK", reply = "Perhaps, love, but a day of sunshine never hurt anyone. I'll keep asking.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "They worship you, and they shouldn't, since the Light deserves that and you only borrow it. Still, a child needs someone to look up to, so mind your manners and your language while you're in the square." } },
      choices = {
        { text = "I'll set them a good example, Shellene. I promise.", next = "BACK", reply = "Thank you, love. They'll be watching, so mind you keep it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'm a soldier, not a nursemaid. They'll learn what they learn.", next = "BACK", reply = "They'll learn from you anyway, love. You might as well give them something worth learning.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Now stand up straight, the children are watching, and they'll copy everything you do, so I'd thank you to do it well." },
        { id = "h_default", text = "I'm Shellene, I help the Matron with the children, which is to say I chase them, feed them, and pray over them every night. All will be well with them, the Light shall see to that, and I'll see to the rest." },
        { id = "h_human", when = { race = "Human" },
          text = "You'll forgive the noise, I hope; some of them have never had a place to be loud before, so I let them be loud a little. Not too much, mind, children!" },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Oh, you gave me a fright! The children creep about like that when they're after the jam, and I thought I'd caught the worst of them." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Please don't do anything sparkly where they can see, dear, or I'll never get them to sleep tonight." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and big, too! The little ones will climb you like a tree if you stand still, so don't stand still." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Oh, please don't let your beast near the kitchen; the last time a dog got in, we lost a whole loaf and two of the children chased it to the canals." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "Oh, a druid! The children will beg to see a bear, and Matron's already said no, so please don't let them talk you into it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "Oh, Light preserve us! Keep that thing away from the children, please, before one of them tries to feed it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! The children will be delighted and frightened at once, which is how they are about most things, the little dears." },
      },
      again = {
        { id = "h_again", text = "Something else, dear? Quickly, before they find the jam." },
      },
      choices = {
        { text = "The children seem in good spirits.", next = "children" },
        { text = "You seem sure all will be well.", next = "well" },
        { text = "Let me bless them before I go.", next = "bless", when = { class = "PRIEST" } },
        { text = "There must be a little sneak or two in the orphanage.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would a little light help them sleep, Shellene?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do the children play at being soldiers, Shellene?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the children ever leave the city, Shellene?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the children look up to paladins, Shellene?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the children ever ask about the night elves, Shellene?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would the Light find its way to someone like me, Shellene?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Will you let me show the children something of the spirits?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    children = {
      lines = { { id = "c_default", text = "Loud, hungry and wonderful, every one. I believe these children are our future, you know, and I tell them so, though they mostly want to know when supper is." } },
      choices = {
        { text = "They're lucky to have you.", next = "children_luck", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    children_luck = {
      lines = { { id = "cl_default", text = "Lucky isn't the word for any child who lives here, dear, but they're loved, and that's next best. Matron Nightingale would say the same, only more sternly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    well = {
      big = true,
      lines = { { id = "w_default", text = "I have to, or I'd sit down and cry with them, and then who'd cook? It's sad for the poor things, it really is, but sadness won't feed anyone, and faith gets me out of bed." } },
      choices = {
        { text = "That's real faith.", next = "BACK", reply = "It's just what's needed, love. The Light sees to the rest.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Faith won't feed them either.", next = "BACK", reply = "No, love, but it gets me up in the morning to cook. That's something.", fx = { align = { light = -1 }, trait = { skeptical = 1 } } },
      },
    },
    bless = {
      lines = { { id = "b_default", text = "Oh, would you? Children, all of you, come and stand still, still, I said! There, now, go on, and say it slowly so they can follow." } },
      choices = { { text = "Light keep you all, little ones.", next = "END", fx = { affinity = 3, trait = { kind = 1 } } } },
    },
  },

  topics = {
    holy_light = { { id = "tp_holy_light", text = "The Light will see the children right, I'm sure of it, though I give it a nudge now and then. I tell them stories of the saints at bedtime, and they fall asleep before the end, which is the trick." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "We took the children to the Darkmoon Faire once, and one of them ate so much candy he turned green. The Light forgive me, but I laughed until I wept." } },
    scourge = { { id = "tp_scourge", text = "The children from Lordaeron draw pictures of the dead walking, and I hang them on the wall because they asked me to. I pray for them every night, and some nights I pray I'll know what to say." } },
    valley_of_heroes = { { id = "tp_valley_of_heroes", text = "I take the orphans to the Valley of Heroes so they'll know there were brave people in the world before them. Some of them ask if their mothers and fathers will have statues, and I never know what to say." } },
    knows = {
      { id = "tp_knows", text = "Not much gets past a houseful of children, and they tell me all of it. Ask, dear." },
    },
    background = { { id = "tp_bg", text = "Me? I look after the children. There's nothing else to tell that would interest anyone." } },
    advice = { { id = "tp_ad", text = "Eat something hot every day, and say your prayers even when you're tired. Especially then." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know, dear. Ask the Matron; she reads the broadsheets." } },
  },
}
