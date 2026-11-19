-- Farmer Saldean, Saldean's Farm. Voice: bibles/saldean.md
-- Stayed when the others left. Now scarecrows walk his fields.
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "saldean", id = TODO_NPC("Farmer Saldean"), name = "Farmer Saldean",
  prejudice = { origin = "human_minor_noble", amount = 12, why = "Blames the House of Nobles for Westfall's ruin; neighbours now in the Deadmines." },
  bible = "bibles/saldean.md", role = "farmer", tier = "quest",
  communities = { "westfall_farms" }, temper = { "proud" }, values = { "stern", "honest" },
  notices = { "work", "kit" },
  impression = {
    first = "He stayed when every neighbour fled, and he is proud of it.",
    third = "{name} met Farmer Saldean, who holds his ground while harvest watchers stalk his fields.",
  },

  greetings = {
    { id = "hum_g1", when = { race = "Human" }, priority = 5,
      text = "Stormwind, is it? Well, you've come further west than most of the city ever bothers, so I'll not hold your boots against you." },
    { id = "g_prej", when = { prejudiced = true }, text = "Soft hands and a straight back, and I'd wager a name with 'of' in it. Westfall's been bled white by people like your family, so say what you want and mind the chickens." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "You again. I took you for another lord's child come to gawp at the poor, and you rolled your sleeves up and proved me wrong, which my Salma won't let me forget." },
    { id = "g_op_leave_stay", when = { gossip = { topic = "westfall_leave", stance = "stay" } }, text = "Salma tells me you think we ought to stay and see it through. Took a stranger to say it, but you're right, and you can tell Theodore I said so." },
    { id = "g_fields", text = "Step careful. The furrows are all I've got left that's straight." },
    { id = "g_watchers", when = { questActive = TODO_QUEST("The Killing Fields") }, text = "Those harvest watchers are still standing out in my field. I can see them from the porch." },
    { id = "g_after", when = { questDone = TODO_QUEST("The Killing Fields") }, text = "I walked my own field this morning, for the first time since spring." },
    { id = "g_away", when = { away = 14 }, text = "Haven't seen you down this lane in {away}. The field's still here and so am I, which is about all a man can say in Westfall." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown into your boots since you last stood in my furrows. You've the look of someone who finishes what they start now." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "Heard you spun some yarn for one of the neighbours and they believed it. Round here a man's word is all he's got left, so I'd keep yours straight." },
  },

  notice = {
    { id = "n_farmer", cat = "work", when = { profession = { "Herbalism", "Skinning" } },
      text = "You've dirt under your nails, honest dirt, and I can always tell a body that works with their hands." },
    { id = "n_hay", cat = "kit", when = { questObjective = { TODO_QUEST("The Killing Fields"), left = { max = 5 } } },
      text = "You've straw all down your front, which means they're coming apart. Good." },
  },

  start = "hello",
  nodes = {
    prej = {
      big = true,
      lines = { { id = "prej_default", text = "I hold the House of Nobles against you, and you came out of it. They left the masons unpaid and Westfall undefended, and when the farms burned they sent a letter of regret, and my neighbours are in the Deadmines because of it." } },
      choices = {
        { text = "Nobles or not, the crown's law still matters out here.", next = "prej_a", fx = { align = { order = 1 } } },
        { text = "You're right. The nobles earned every curse Westfall throws.", next = "prej_b", fx = { align = { order = -1 } } },
        { text = "What would you have me do, Farmer?", next = "prej_calm", fx = { affinity = 1 } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    prej_a = {
      lines = { { id = "prej_a_default", text = "The crown's law is a handful of militiamen at Sentinel Hill with no supplies, and Gryan Stoutmantle holding the rest together himself. Tell your father that, if he still writes to you." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    prej_b = {
      lines = { { id = "prej_b_default", text = "Well, I never thought I'd hear that from someone with your manners. Don't go saying it at court, or you'll find out how quick they are to disown their own." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    prej_calm = {
      lines = { { id = "prej_calm_default", text = "Pick up a hoe or a sword, either will do. Westfall's had enough of people who only come to look at it." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    op_tithe = {
      lines = {
        { id = "op_tithe_a", text = "Every season, what little there is, and Salma calls me a fool for it. The city's sent us nothing back, not a soldier nor a sack of seed, but my father paid it and his father before him. Tell me straight, should I keep paying?" },
      },
      choices = {
        { text = "Keep paying. The kingdom is still your kingdom.", next = "op_tithe_1", fx = { opinion = { westfall_tithe = "pay", stormwind = "patience" }, align = { order = 1 } } },
        { text = "Stop. Not another copper until Stormwind sends soldiers.", next = "op_tithe_2", fx = { opinion = { westfall_tithe = "withhold", stormwind = "abandoned_its_own" }, align = { order = -1 }, affinity = 1 } },
        { text = "Give it to Sentinel Hill instead. Gryan's actually defending you.", next = "op_tithe_3", fx = { opinion = { westfall_tithe = "militia", westfall = "send_soldiers" }, trait = { practical = 1 }, affinity = 2 } },
        { text = "I can't tell a man what to do with his harvest.", next = "BACK" },
      },
    },
    op_tithe_1 = {
      lines = { { id = "op_tithe_r1", text = "That's what my father would have said, and he's long in the ground, so I'll take it as his vote. The tithe goes up the road next week, light as it is." } },
      choices = { { text = "Something else, then.", next = "BACK" } },
    },
    op_tithe_2 = {
      lines = { { id = "op_tithe_r2", text = "Ha! Salma will kiss you, and Gryan will scowl at you, and I'll lie awake a night or two. You might be right, which is the worst part." } },
      choices = { { text = "Something else, then.", next = "BACK" } },
    },
    op_tithe_3 = {
      lines = { { id = "op_tithe_r3", text = "Now that's a thought I hadn't had, and I've had most of them, sitting here. The Militia eat what they're given and say thank you, which is more than Stormwind Keep ever did." } },
      choices = { { text = "Something else, then.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Because a farmer belongs on his farm, thieves or not. My furrows are straight, and they're the only straight thing left. The earth here deserves someone who stays." } },
      choices = {
        { text = "Staying took courage, Saldean. The land is lucky to have you.", next = "BACK", reply = "Lucky, is it? I don't know about luck, but I know about staying, and I'll keep doing it. My furrows thank you.", fx = { align = { honor = 1 } } },
        { text = "Staying was foolish. Your family's safety matters more.", next = "BACK", reply = "Salma's safe enough with me and my pitchfork. Leaving would've been safer for a season and foolish for a lifetime.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "My field doesn't need fixing, it needs those cursed watchers knocked down and kept down, and then it needs a man with a plough. I'll grant a fireball might do the first part quicker than a pitchfork, so long as you remember where the wheat ends and the scarecrows begin." },
      },
      choices = {
        { text = "I'll aim carefully and leave the ploughing to you.", next = "BACK", reply = "Good, and I'll hold you to that, because every row out there is a winter's bread. Knock them down and leave the rest to me.", fx = { align = { order = 1 } } },
        { text = "If the field burns, at least the watchers burn too.", next = "BACK", reply = "Burn my field and you can plough it yourself next spring. Mind where you aim.", fx = { align = { order = -1 } } },
        { text = "Something else, Saldean.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They're slow and stupid, but they don't tire, and they swing those straw arms like flails. You'll want to take them apart limb by limb, and burn the bits, because I swear they put themselves back together." } },
      choices = {
        { text = "I'll take them apart and burn every one.", next = "BACK", reply = "That's the way of it, and I'll bring the kindling. Watch the arms, they hit harder than you'd think.", fx = { align = { honor = 1 } } },
        { text = "Burn the whole field. It's quicker.", next = "BACK", reply = "Quicker for you, and it's a year's hunger for us. Take them apart by hand, or don't bother.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Coyotes at night and vultures by day, and the Goretusks when they're feeling brave. Salma says the boars come for the scraps, and I say they come because nobody's here to stop them anymore." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Coyotes at night and vultures by day, and the goretusks when they're feeling brave. That {pet} of yours would scare off the coyotes, I'd bet, so bring it round at night if you're passing." },
      },
      choices = {
        { text = "I'll keep the beasts off your farm, Saldean.", next = "BACK", reply = "Then you're the first help I've had out here in a long while. Salma will want to feed you for it.", fx = { align = { honor = 1 } } },
        { text = "I'll hunt where the game is, not where you need it.", next = "BACK", reply = "That's your right, I suppose, though the game's here because nobody's stopping it. Go on, then.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Do you now? Then you'll know they came at night, took the Molsens' plough first and the Molsens next, and never once looked a man in the eye. If you can think like that and still stand on my porch honest, you're welcome here." } },
      choices = {
        { text = "I'll give them a taste of their own medicine.", next = "BACK", reply = "A taste of it, aye, and I'll hold the spoon. Just don't let it go to your head, or you'll be no better than them.", fx = { align = { honor = -1 } } },
        { text = "I'll stand honest, Saldean. You have my word.", next = "BACK", reply = "Your word's good enough for me. There's few enough honest folk left in Westfall.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Where did your neighbours go?", next = "neighbours" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "I didn't need the likes of you to tell me that, though I'll admit it's a strange comfort to hear it said aloud. Something puts the walk in those scarecrows, and it isn't Westfall straw." } },
      choices = {
        { text = "I'll find what moves them and turn it to my use.", next = "BACK", reply = "Turn it to your use, eh? I'll not ask what you mean by that, so long as it's off my land.", fx = { align = { light = -1 } } },
        { text = "I'll burn them down and let the darkness go with them.", next = "BACK", reply = "That's what I'd do, if I knew how. Burn them, and I'll stand at the edge and cheer.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Where did the watchers come from?", next = "watchers" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "That's the best news I've had since the Defias took the Jansen farm. My father always said Westfall dirt was stubborn, and I reckon he was right about that much." } },
      choices = {
        { text = "Then rest a field each year, and it will repay you.", next = "BACK", reply = "That's what my father did, and his father before him. Good to hear a druid say it too.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the weeds have it awhile. The wild knows best.", next = "BACK", reply = "Weeds? I've fought weeds my whole life, druid, and I'll not hand them the farm now.", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Salma does the praying for the both of us, and I do the ploughing, and that seems a fair split. I'll say this, though: every morning I'm still standing here feels like an answer to something." } },
      choices = {
        { text = "That's faith holding you up, Saldean. Don't let go of it.", next = "BACK", reply = "I'll try, though some mornings it's hard to say which of us is holding which. Salma would say faith, and she's usually right.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "That's your own stubbornness. Give yourself the credit.", next = "BACK", reply = "Ha, I'll take that, since nobody else will give me credit for anything. Salma will say otherwise.", fx = { align = { light = -1 } } },
        { text = "Something else, Saldean.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Gryan's militia, when he can spare a man, and me with a pitchfork when he can't. I'm not proud, so if the Silver Hand wants to send a few of its own down this road, Salma will feed them." } },
      choices = {
        { text = "The Silver Hand stands with those who stay. So will I.", next = "BACK", reply = "Then you're welcome at my table, and Salma will make sure you leave full. The Silver Hand's always welcome out here.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A lone farm out here isn't worth defending, Saldean.", next = "BACK", reply = "It's worth defending to me, and to Salma, and to my grandfather in the ground. That's enough.", fx = { align = { honor = -1 } } },
        { text = "Something else, Saldean.", next = "BACK" },
      },
    },
    hu_bread = {
      lines = {
        { id = "hum_bread", key = true,
          text = "Fed it, clothed it and sent it soldiers, every year since before your grandfather was born. When Stormwind was raised again after the war, Westfall grain and Westfall sons did a good share of the raising, and I'd like to see that remembered somewhere in the Keep." },
      },
      choices = {
        { text = "And now the Keep sends nothing back.", next = "hu_bread2" },
        { text = "Something else, Saldean.", next = "BACK" },
      },
    },
    hu_bread2 = {
      big = true,
      lines = {
        { id = "hum_bread2",
          text = "Not a sack nor a soldier, friend, though the tax men kept coming until the Defias made the roads too dangerous for them. That's the only kindness the Brotherhood ever did me, and I hate that I'm grateful for it." },
      },
      choices = {
        { text = "The crown failed you. I'm ashamed of it.", next = "BACK",
          reply = "Don't be ashamed, be useful, because shame never weeded a field. But I thank you for saying it, which is more than the last city man did.",
          fx = { align = { order = -1 }, opinion = { westfall = "abandoned" } } },
        { text = "The crown has a war's debts to pay. It isn't simple.", next = "BACK",
          reply = "Nothing's simple to a man with a full belly. Come back and tell me that in a dry month, and we'll see how simple you find it.",
          fx = { align = { order = 1 }, opinion = { stormwind = "patience" } } },
        { text = "Good luck with the harvest, Saldean.", next = "END" },
      },
    },
    hello = {
      lines = {
        { id = "hum_h1", when = { race = "Human" },
          text = "You city folk always ask why we stay, as though a man could pick up his fields and carry them to Elwynn. I'm still here, and I'll still be here when the Keep remembers it owns a breadbasket." },
        { id = "dd_stew_sald", when = { questDone = TODO_QUEST("Westfall Stew") },
          text = "Salma tells me you went out after the meat for her stew, and she's not one to praise strangers lightly. You've eaten at our table in all but name, friend, and that counts for a lot in this house." },

        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Harvest", min = 30 } }, text = "You've been knocking down those harvest watchers, haven't you? I can see clear to the fence line for the first time in a month, and I'll not pretend I'm sorry about it." },
        { id = "h_druidx", when = { class = "DRUID" },
          text = "You've a strange way of looking at my rows, friend, like you're listening to them. My wife does that too, now and then." },
        { id = "h_default", text = "The name's Saldean, and this is my farm. The thieves ran all the neighbours off, but I'm still here, so make of that what you like." },
        { id = "h_before", when = { questBefore = TODO_QUEST("The Killing Fields") },
          text = "See those scarecrows in my field? Harvest watchers, they call them, and they walk and they swing, and they don't belong to me, and they won't leave." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Killing Fields") },
          text = "Start with my field, and if you've arms left after, clear the neighbours' too. Somebody might come back for them one day." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Killing Fields"), days = 3 } },
          text = "Straw and sticks all over the south field. Salma says it looks like a harvest festival gone wrong. I say it's the best it's looked in a year." },
        { id = "h_later", when = { questLater = { TODO_QUEST("The Killing Fields"), days = 14 } },
          text = "I turned the soil on the south field yesterday. There might be a crop yet, if we're lucky." },
        { id = "h_salma", when = { heardLine = "salma.h_default" },
          text = "Salma's been feeding you, then; she feeds everyone. I married the softest heart in Westfall, and I'll not hear a word against it." },
        { id = "h_soil", when = { metBefore = true }, text = "The soil's tired, and so am I, but we'll both get up tomorrow anyway. That's farming." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and just the thing for my field. The harvest watchers don't scare, and they don't stop, so I hope you hit hard." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll not find much worth hunting in my field, except scarecrows that walk, and they don't make good eating." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Salma will want you blessing the soup pot, so go easy on my field and save some for her." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, is it? The watchers don't care for oaths, so I hope you hit as hard as you shine." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage, is it? I'll not have you setting my field alight, even if it is the watchers you're aiming at." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Our neighbours fled, but we stayed. If your earth spirits have a word for this soil, I'd like to hear it." },
      },
      again = {
        { id = "h_again", text = "Something else? Make it quick, because daylight's for working." },
        { id = "h_again2", text = "Ask away. The pumpkins won't mind if I stop to answer you." },
      },
      choices = {
        { text = "You hold my family against me, Farmer Saldean.", next = "prej", when = { prejudiced = true } },
        { text = "Your soil is tired, but it isn't dead yet.", next = "druid_talk", when = { class = "DRUID" } },
        { text = "Most men would have left with their neighbours.", next = "stay" },
        { text = "Where did the watchers come from?", next = "watchers" },
        { text = "Every farm on this road stands empty.", next = "neighbours" },
        { text = "Is that your wife at the stove?", next = "salma" },
        { text = "I worked fields like these, growing up.", next = "farmhand", when = { origin = "human_westfall_farmhand" } },
        { text = "Shall I bless your fields?", next = "bless", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "I know how thieves think, Saldean. I can help.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Those watchers aren't natural, Saldean. I can feel it.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "How do the harvest watchers fight, Saldean?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What hunts around your farm, apart from the scarecrows?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you pray much, Saldean, out here on your own?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Who protects the farms that still stand, Saldean?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Could a spell or two fix your field, Saldean?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why did you stay when everyone else fled, Saldean?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Westfall fed Stormwind once, didn't it, Saldean?", next = "hu_bread", when = { race = "Human" } },
        { text = "Good luck with the harvest.", next = "END" },
      },
    },
    stay = {
      big = true,
      lines = {
        { id = "s_default", text = "My grandfather cleared this land. I'm not handing it to a man in a red mask because he asked with a knife." },
      },
      choices = {
        { text = "Good for you.", next = "BACK", reply = "It's not good, it's just right, and there's a difference. Thank you all the same.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Pay them off and live. Land can be bought back.", next = "BACK", reply = "Bought back with what, the money they'd take? No, I'll keep my land, and my knife's as sharp as theirs.", fx = { align = { honor = -1 } } },
        { text = "Pride won't stop a knife.", next = "pride", fx = { trait = { skeptical = 1 } } },
        { text = "Everyone else left. Doesn't that worry you?", next = "fool" },
      },
    },
    pride = {
      lines = { { id = "p_default", text = "No, but it gets me up in the morning, and that's something a knife can't take." } },
      choices = {
        { text = "Do you still send the city its tithe?", next = "op_tithe" }, { text = "Right. Something else, then.", next = "BACK" } },
    },
    fool = {
      lines = { { id = "fo_default", text = "Theodore Furlbrow told me to get out while I could and called me a fool for staying. I call him a fool for going, and one of us is right, but it's his wagon that's broken." } },
      choices = {
        { text = "Maybe you're both right.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Be kinder to him. He's frightened.", next = "BACK", fx = { affinity = -1, trait = { kind = 1 } } },
      },
    },
    watchers = {
      lines = {
        { id = "w_default", text = "I don't know, and I've stopped guessing. One day the fields were empty, and the next they were full of things that wouldn't stay put." },
      },
      choices = {
        { text = "There must be a good many of them out there.", next = "count" },
        { text = "Galiaan thinks someone set them on you.", next = "set_on", when = { heardLine = "galiaan.wa_default" } },
        { text = "I'm a tinker. I could take one apart.", next = "tinker", when = { race = "Gnome" } },
        { text = "I'll deal with them.", next = "BACK", fx = { learn = { "harvest_watchers" }, affinity = 1 } },
      },
    },
    count = {
      lines = {
        { id = "co_default", text = "Twenty, near enough, in mine and the neighbours' fields. Chop them down and there's coin in it, and a supper if Salma likes the look of you.",
          fx = { learn = { "harvest_watchers" } } },
      },
      choices = {
        { text = "Twenty, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    set_on = {
      big = true,
      lines = { { id = "so_default", text = "Did he, now? Then whoever did it knew what a farmer fears, because scarecrows that walk aren't robbery. That's cruelty with a plan." } },
      choices = {
        { text = "Then let's end the plan.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "It's only a guess.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    tinker = {
      lines = { { id = "tk_default", text = "Could you? Then take them apart, the lot, in bits small enough to burn. And if you find out who wound them up, tell me first." } },
      choices = {
        { text = "Gladly. Machines shouldn't be cruel.", next = "BACK", fx = { affinity = 2, learn = { "harvest_watchers" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    neighbours = {
      lines = {
        { id = "ne_default", text = "The Furlbrows ran and the Molsens ran, and thieves sleep in their beds now. If you're looking for honest work, Gryan's up on the hill and he'll find you plenty." },
        { id = "ne_report", when = { questActive = TODO_QUEST("Report to Gryan Stoutmantle") },
          text = "Gryan's up in the stone tower on Sentinel Hill, so tell him Saldean sent you. He'll not mind; he's short of everything." },
      },
      choices = {
        { text = "Will they ever come back?", next = "ne_back" },
        { text = "Something else.", next = "BACK", fx = { learn = { "people_militia" } } },
      },
    },
    ne_back = {
      lines = { { id = "nb_default", text = "If the fields are cleared, and if the thieves go, they might. Farmers live on ifs, and most years the ifs feed us." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    salma = {
      lines = { { id = "sa_default", text = "She's the best cook in Westfall, and the kindest. She'd feed a man in a red mask if he knocked politely. Don't tell her I know about that." } },
      choices = {
        { text = "She's fed Defias?", next = "salma_defias" },
        { text = "Something else.", next = "BACK" },
      },
    },
    salma_defias = {
      lines = { { id = "sd_default", text = "More than once. I keep my pitchfork by the door and my mouth shut, which is most of what marriage is." } },
      choices = {
        { text = "Wise man.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "That's a risk.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    farmhand = {
      lines = { { id = "fa_default", text = "Then you know the soil out here's gone thin. Whose fields were you on, before?" } },
      choices = {
        { text = "A farm the Defias hold now.", next = "farmhand_theirs" },
        { text = "I'd rather not say.", next = "BACK" },
      },
    },
    farmhand_theirs = {
      lines = { { id = "ft_default", text = "Then help clear it and work it again. I've seed put by; what I haven't got is hands." } },
      choices = {
        { text = "You'll have mine, when it's clear.", next = "BACK", fx = { affinity = 2, standing = { westfall_farms = 2 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bless = {
      lines = { { id = "bl_default", text = "Bless them after they're cleared. The Light's welcome here, but it won't pull a scarecrow out of my corn." } },
      choices = {
        { text = "Then I'll clear them first.", next = "BACK", reply = "That's the order of it, aye, and the Light can follow once the corn's clear. Watch your back in the rows.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The Light can pull harder than any plough-horse.", next = "BACK", reply = "Does it now? Then it can start with that big one by the fence, and I'll believe you.", fx = { align = { light = 1 }, trait = { pious = 1 } } },
      },
    },
  },

  topics = {
    deadmines = { { id = "tp_deadmines", text = "The Defias have dug themselves in under Moonbrook like grubs in a turnip, and I'd plough the whole hill over if I had the horses. Instead I've got scarecrows that walk, and they're on the wrong side." } },
    holy_light = { { id = "tp_holy_light", text = "I pray to the Light the way I plough, which is straight and early and without complaining. It hasn't sent me rain in two summers, but it hasn't let me leave either." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "Salma made me take her to the Darkmoon Faire once, and I spent the whole day worrying about the cows. She says I'm the only man alive who's been bored at a faire, and she may be right." } },
    second_war = { { id = "tp_second_war", text = "I kept this farm through the Second War, when the orcs came close enough that we could see their fires. I'll keep it through the Defias as well, and I'll keep it after, if the Light permits." } },
    stonemasons = { { id = "tp_stonemasons", text = "The masons that went bad were once honest men, and I fed a few of them myself when they came through looking for work. I'd not feed them now, and that's a sorrow I didn't ask for." } },
    knows = {
      { id = "tp_knows", text = "I've farmed this land all my life, and there's not much happens on it I don't hear about. Ask me about any of this." },
    },
    background = { { id = "tp_bg", text = "I'm a farmer on the land my grandfather cleared. That's the whole of it, and it isn't finished yet.", next = "stay" } },
    advice = { { id = "tp_ad", text = "Don't stand still in a field after dark. The watchers don't see well, but they don't need to." } },
    harvest_watchers = {
      { id = "tp_watchers", text = "There were twenty in my field alone, last I counted, and then I stopped counting." },
    },
    defias = { { id = "tp_defias", text = "Thieves, the lot of them. They took the Furlbrows' farm and the Molsens', but they'll not take mine." } },
    westfall = { { id = "tp_westfall", text = "It's the best soil in the kingdom under all that dust, though people forget." } },
    old_blanchy = { { id = "tp_blanchy", text = "That's the Furlbrows' horse, older than sin and twice as stubborn. A good animal, though." } },
    people_militia = { { id = "tp_militia", text = "Good lads and lasses, the lot of them. They walk past my fence twice a day, and I sleep better for it." } },
    _none = { { id = "tp_none", text = "I can't help you there, friend. Ask me about soil instead." } },
  },
}
