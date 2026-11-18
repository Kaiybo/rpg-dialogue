-- The Sepulcher: the Forsaken's crypt-fortress in Silverpine. Voice: bibles/silverpine.md
local P = RPGDialogueAPI:Pack("rpgd.silverpine")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "hadrec", id = TODO_NPC("High Executor Hadrec"), name = "High Executor Hadrec",
  prejudice = { class = "MAGE", amount = 8, why = "Dalaran's mages are one of his four enemies; any mage reminds him of Arugal and the Kirin Tor's meddling in Silverpine." },
  bible = "bibles/silverpine.md", role = "soldier", tier = "major",
  communities = { "sepulcher" }, temper = { "iron" }, values = { "loyal", "dutiful" },
  notices = { "kit", "race" },
  impression = {
    first = "High Executor Hadrec holds the Sepulcher against the worgen, the Scourge, the gnolls and Dalaran's mages all at once, and he recites the list without a flicker of worry.",
    third = "{name} met High Executor Hadrec, who holds the Sepulcher and Silverpine Forest for the Dark Lady.",
  },

  greetings = {
    { id = "g_prej", when = { prejudiced = true }, text = "A mage. Arugal was a mage, and his wolves are howling in my forest because of it, and Dalaran's people still tramp through Silverpine as though they own it. You'll forgive me if I keep you in sight." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "You've done more good in Silverpine than the whole Kirin Tor ever did, mage. That isn't high praise, but it's sincere." },
    { id = "g_sepulcher", text = "Speak quickly. The Sepulcher has enemies on every side, and I can spare little time from any of them." },
    { id = "g_back", when = { metBefore = true }, text = "Back from the forest, are you? Report, and be brief." },
    { id = "g_xremember", when = { origin = "forsaken_scourge_remembered" }, text = "You served the Scourge and you remember it; I can always tell, because the ones who remember never sit with their backs to a door. Good, so make that memory useful in this forest." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and our enemies made good use of every day of it. Report what you saw, and be brief." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "When I first sent you into the forest you were barely worth the burial, and now you look like a proper weapon of the Dark Lady. Good, because I have four fronts to hold." },
    { id = "g_word_intimidated", when = { word = "intimidated" }, text = "I'm told you cowed someone at the Sepulcher without a blade drawn. Fear is cheaper than steel, and I approve of cheap victories." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "One of your lies was found out here, I hear. I have enemies enough on every side, so I'll be watching to see which side you're on." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The forest bit you, I see. Mend yourself, and then bite back." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "One of the Warchief's people, in Silverpine. The worgen won't care which side you're on, and neither will the Scourge." },
  },

  start = "hello",
  nodes = {
    prej_hadrec = {
      big = true,
      lines = { { id = "prej_hadrec_default", text = "I treat every mage that way, and every mage has earned it. Arugal summoned the worgen to fight the Scourge and lost control of them, and now they are my problem, and Dalaran's mages walk past the Sepulcher on their way to Ambermill without a word of apology." } },
      choices = {
        { text = "Arugal's mistake isn't mine. Judge my spells by their targets.", next = "BACK", reply = "By their targets, then, and I'll be watching every one of them. Give me reason to change my mind and I will.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Magic always costs something. Better wolves than the Scourge.", next = "BACK", reply = "Better wolves than the Scourge, you say, as Arugal did. I've buried the deathstalkers who paid for that arithmetic.", fx = { align = { honor = -1 }, affinity = -1 } },
        { text = "Then point me at the worgen, and I'll show you what my magic is for.", next = "prej_hadrec_calm", fx = { affinity = 1 } },
        { text = "What do the mages want with Ambermill?", next = "prej_hadrec_why" },
      },
    },
    prej_hadrec_why = {
      lines = { { id = "prej_hadrec_why_default", text = "Something under it, or around it, that they think worth guarding with a wall of their own. Their apprentices shoot first at anything grey, so they've cost me three deathguards who only went to ask." } },
      choices = { { text = "I see. Let me answer you, then.", next = "prej_hadrec" }, { text = "Something else.", next = "BACK" } },
    },
    prej_hadrec_calm = {
      lines = { { id = "prej_hadrec_calm_default", text = "Good. Shadowfang Keep is to the south, and Arugal is in it, and if a mage finishes what a mage started, there's a kind of tidiness in that I can appreciate." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_hillsbrad = {
      big = true,
      lines = {
        { id = "ophb_default", text = "Hillsbrad's farmers are Alliance subjects, and the Dark Lady means to have that land back for Lordaeron's rightful dead. Some of my deathguards grumble that they're only farmers, so tell me what you say." },
      },
      choices = {
        { text = "They're farmers, High Executor. Leave them be.", next = "op_hillsbrad_r1", fx = { affinity = -1, align = { light = 1 }, opinion = { hillsbrad_war = "mercy", alliance = "mercy" } } },
        { text = "That land was Lordaeron's. Take it back.", next = "op_hillsbrad_r2", fx = { affinity = 1, align = { light = -1 }, opinion = { hillsbrad_war = "war", alliance = "war" } } },
        { text = "My family farmed those fields once. I want them back.", next = "op_hillsbrad_r3", fx = { affinity = 1, trait = { stern = 1 }, opinion = { hillsbrad_war = "war" } }, when = { race = "Scourge" } },
        { text = "I'll leave Hillsbrad to the Dark Lady.", next = "BACK" },
      },
    },
    op_hillsbrad_r1 = {
      lines = { { id = "ophb_r1", text = "Farmers who feed Southshore's garrison, which feeds the Alliance. I'll note your view and file it with all the others I don't act on." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_hillsbrad_r2 = {
      lines = { { id = "ophb_r2", text = "That is very nearly how the Dark Lady put it, and she put it to me first. You'll find plenty of work on the road south to Hillsbrad." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_hillsbrad_r3 = {
      lines = { { id = "ophb_r3", text = "Then you've more right to them than any farmer from Stormwind. Go south and see who's living on them now." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xcl_sfk = {
      big = true,
      lines = { { id = "xcl_sfk_default", text = "Then the Sepulcher has one front fewer, and I'll gladly take it. Arugal was a mage of Dalaran who loosed those beasts on this forest and let them have the Baron's house, and I've never understood why a man who feared the Scourge so much would make something worse to fight it." } },
      choices = {
        { text = "Arugal was a fool, but he meant well, and that counts for something.", next = "BACK", reply = "It counts for nothing in my crypt, where his good intentions are carved into the walls by name.", fx = { align = { honor = 1 } } },
        { text = "Meaning well counts for nothing. He deserved worse than he got.", next = "BACK", reply = "He did, and I'm glad someone outside the Sepulcher says so. I'd have liked to hand him the shovel myself.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "What became of the two deathstalkers you sent in?", next = "xcl_sfk2" },
      },
    },
    xcl_sfk2 = {
      lines = { { id = "xcl_sfk2_default", text = "Adamant came back thin and furious and asking for his blade, and he has it again, and I'll say no more about Adamant, because he still owes me for the bandages. Vincent did not come back, and his name is cut into the crypt wall with the others the Sepulcher owes." } },
      choices = {
        { text = "Then I'll remember Vincent's name too.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Against the Scourge first, because your Light does more to them than any blade of ours, and against Arugal's worgen second. Dalaran's mages would find you curious, and a curious mage is a nuisance I don't need, so keep clear of their camp unless I send you." } },
      choices = {
        { text = "As you command, High Executor. The Scourge first.", next = "BACK", reply = "Good. The Scourge first and Arugal after, and if you're still standing, I'll find you a third.", fx = { align = { order = 1 } } },
        { text = "I'll go where I'm needed most, wherever that leads.", next = "BACK", reply = "Wherever, so long as it's in Silverpine and against our enemies. I'll not hold you tighter than that.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "At the Sepulcher's door, mending the deathstalkers who limp in from the forest, until I need you somewhere worse. The worgen tear, the gnolls stab, and Dalaran's mages throw fire from behind their wall, so there's always someone to stitch. Do that well, and I'll find you harder work." } },
      choices = {
        { text = "I'll keep your deathstalkers on their feet.", next = "BACK", reply = "Good. They limp in by the dozen, and every one you mend is one less name on my wall.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll mend whom I choose, High Executor.", next = "BACK", reply = "Choose quickly, then, and choose the Sepulcher's. I've no patience for healers with opinions.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "o_wgpity", tags = { "news" }, when = { gossip = { topic = "worgen", stance = "pity" } }, text = "Renferrel tells me you pity the worgen. Pity them from a distance, then, and with your blade drawn." },
        { id = "h_default", key = true,
          text = "High Executor Hadrec. I hold Silverpine for the Dark Lady, and whatever stands against the Forsaken here, we push back, and then we push again." },
        { id = "h_deathstalkers", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("The Deathstalkers' Report") }, { questActive = TODO_QUEST("Lost Deathstalkers") } } },
          text = "My deathstalkers went into the forest and didn't report back. Find them, or find what's left of them." },
        { id = "h_fields", when = { questActive = TODO_QUEST("The Dead Fields") },
          text = "The gnolls of the Dead Fields grow bold. Cut them down, for the Sepulcher's roads must stay open." },
        { id = "h_fenris", when = { questActive = TODO_QUEST("Assault on Fenris Isle") },
          text = "The Rot Hide gnolls nest on Fenris Isle, so burn it out." },
        { id = "h_shadowfang", when = { questActive = TODO_QUEST("Deathstalkers in Shadowfang") },
          text = "Some of my best went into Shadowfang Keep, Arugal's keep, and haven't come out. Go in after them." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Good, because Silverpine has more enemies than I have soldiers, and lightning is cheaper than a deathstalker." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, in my Sepulcher. The Warchief's people keep surprising me, and I'm not easily surprised." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Good, because my deathstalkers come back in pieces, and the apothecaries charge me for the thread." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Moonrage", min = 40 } }, text = "The Moonrage packs are fewer than they were, and my deathstalkers can walk the north road again without looking over their shoulders every step. You've done the Sepulcher real service." },
        { id = "h_cl_sfk", tags = { "news" }, when = { cleared = "Shadowfang Keep", faction = "Horde" },
          text = "Arugal is dead, and the howling from the keep has gone ragged and leaderless overnight. I sent two deathstalkers into those walls before you ever came to the Sepulcher, and I'm told you went in after them." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin of the Forsaken, at the Sepulcher. I have worgen, Scourge, gnolls and Dalaran's mages to fight, and a paladin who can stand against all four is worth more to me than a dozen Deathguard." },
      },
      choices = {
        { text = "You treat me like one of Dalaran's spies, Hadrec.", next = "prej_hadrec", when = { prejudiced = true } },
        { text = "Where can a priest serve the Sepulcher best, High Executor?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Where do you need the storm, High Executor?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Will you let me fight the worgen as a beast, High Executor?", next = "druid_q", when = { class = "DRUID" } },
        { text = "The Sepulcher seems hemmed in on every side.", next = "threats" },
        { text = "Send me after your deathstalkers, High Executor.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Where's the line weakest? Put me there.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I know Dalaran's spells. I can read their mages' work for you.", next = "mage", when = { class = "MAGE" } },
        { text = "I can track worgen through these woods.", next = "hunter", when = { class = "HUNTER" } },
        { text = "My demons could hold one of your fronts, High Executor.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Where should a paladin stand in Silverpine, High Executor?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Shadowfang Keep has no master now, High Executor.", next = "xcl_sfk", when = { cleared = "Shadowfang Keep", faction = "Horde" } },
        { text = "For the Dark Lady.", next = "END", fx = { affinity = 1, standing = { sepulcher = 1 } } },
      },
      again = {
        { id = "h_again", text = "What else? The worgen are moving tonight, so keep it to a report." },
        { id = "h_again2", text = "Speak. The forest won't wait, and neither will I." },
      },
    },
    rogue = {
      big = true,
      lines = {
        { id = "ro_default", text = "Good. They went south toward Pyrewood and Shadowfang, quietly, the way they're trained, and the forest swallowed them just as quietly. Find out whether it was worgen or something smarter." },
        { id = "ro_deathstalker", when = { origin = "forsaken_deathstalker_recruit" },
          text = "One of ours, then, and you'll know the marks they leave on the trees. Follow them, and if you find the deathstalkers dead, bring back their reports before you bring back their bodies." },
      },
      choices = {
        { text = "Reports first. The mission matters more than the dead.", next = "BACK", reply = "Exactly so. Their bodies will keep; their reports won't.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I'll bring the bodies too. They were ours.", next = "BACK", reply = "Then you'll carry them both, and I'll not stop you. They were ours, and they'll be buried here.", fx = { affinity = -1, align = { order = -1 } } },
      },
    },
    warrior = {
      lines = {
        { id = "wa_default", text = "South, by the Dead Fields, where the gnolls test us every night. Hold the road there, and the Sepulcher can spare its deathstalkers for real work." },
        { id = "wa_soldier", when = { origin = "forsaken_lordaeron_soldier" },
          text = "A Lordaeron soldier. You'll remember Silverpine from the old patrols to Pyrewood, when the worst thing in these woods was a wolf. Hold the south road the way you held it then." },
      },
      choices = { { text = "The south road, then.", next = "BACK", fx = { affinity = 2, standing = { sepulcher = 1 } } } },
    },
    mage = {
      lines = {
        { id = "ma_default", text = "Then Dalar Dawnweaver, our own archmage, will want you, though he'll talk your ear off first. Dalaran's mages at Ambermill are building something, and I don't care what it is so long as it doesn't work. Find out, and break it." },
        { id = "ma_dalaran", when = { origin = "forsaken_dalaran_apprentice" },
          text = "Dalaran-trained, and they'd know your face. Good; let them see you, and wonder how much of their work you can still read." },
      },
      choices = {
        { text = "Break it, and learn what I can first.", next = "BACK", reply = "A sensible mage, at last. Learn what you can, and then break it before they finish.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Break it, as ordered. Nothing more.", next = "BACK", reply = "Good. Orders are orders, and Dalar can lecture someone else.", fx = { affinity = 2, align = { order = 1 } } },
      },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "A living hunter, in my forest. Worgen don't leave tracks like wolves; they walk upright when they think nobody's looking, so look for the prints that change halfway. Two of my deathstalkers came back in pieces before they learned it." },
        { id = "hu_pet", when = { pet = { type = "Beast" } },
          text = "Keep {pet} close in these woods. The worgen hate a living beast's scent nearly as much as they hate ours, and they'll go for it first." },
      },
      choices = { { text = "Prints that change. I'll watch for them.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } } },
    },
    threats = {
      big = true,
      lines = {
        { id = "t_default", text = "The worgen of the south, Arugal's beasts, and the Scourge to the east, and Dalaran's mages poking about Ambermill, and on top of all that the gnolls, who don't know when to stop." },
      },
      choices = {
        { text = "Is the Alliance a threat out here, High Executor?", next = "op_hillsbrad" },
        { text = "I'll help hold the line.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "South, over the Dead Fields, where the gnolls gather at night, and then wherever the worgen are thickest. Fenris Isle should burn well, so if your spirits have a taste for gnolls, send them across the water." } },
      choices = {
        { text = "Your orders, High Executor. Point the way.", next = "BACK", reply = "Due south, then, and mind the gnolls. They row in after dusk.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My spirits choose their own battles.", next = "BACK", reply = "Then let them choose the worgen. I'll not complain about the outcome.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "I'll let you fight them as anything you like, so long as you come back and report. My deathstalkers have mistaken their own shadows for worgen before, though, so let them see you change, or they'll put a bolt in you before you can explain." } },
      choices = {
        { text = "I'll report as ordered, and let your scouts know me.", next = "BACK", reply = "Good. My scouts will be glad of the help; there are fewer of them every week.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll hunt alone and report when it suits me.", next = "BACK", reply = "When it suits you is not a schedule I recognise. Report when I ask, or don't come back.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "One front would be a mercy, since I have four and too few Deathguard to hold any of them well. Send your demons at the Rot Hide gnolls, who are too stupid to be frightened of anything and will at least keep them busy." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "You'd have heard of the Cult of the Damned in life, and perhaps more than heard, but the Dark Lady has given you a new master and a new purpose. Use your demons for her, and I'll not care where you learned to call them." },
        { id = "xwarlock_orc", when = { race = "Orc" }, text = "The Warchief sends orcs to help, and here is one who brought fel fire with him, which I didn't expect. Point it at the Rot Hides and I'll see your name in my report." },
      },
      choices = {
        { text = "The Rot Hides will burn, on your order.", next = "BACK", reply = "Good. The Rot Hides have been rotting long enough, and fire is the only medicine they'll get from me.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll choose which front I hold, High Executor.", next = "BACK", reply = "Choose, then, but choose one I can't hold myself. I've four and too few hands.", fx = { align = { order = -1 } } },
        { text = "What threatens the Sepulcher most?", next = "threats" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Every deathstalker report in Silverpine ends on my desk. Ask what you need to know, and I'll tell you what they found." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "You'll get the short version, since I've no time for the long one with you." },
    },
    worgen = { { id = "tp_worgen", text = "The worgen are Arugal's creatures, a Dalaran mage's mistake let loose in my forest. I'd like the mage as well." } },
    scourge = {
      { id = "tp_scourge", text = "The Scourge pushes in from the north and east, and the Deathguard pushes back every day. It doesn't tire and neither do we, so it becomes a question of who has the better commanders." },
      { id = "tp_scourge2", when = { race = "Scourge" }, text = "You know what they are, because you were one. Use that, and you'll last longer than the living ones I send out." },
    },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken hold the Sepulcher because the Dark Lady ordered it held, and I hold it because I don't fail her. That's the whole chain of command, and it's enough." } },
    shadowfang = { { id = "tp_shadowfang", text = "Arugal sits in his keep and lets his wolves run wild through Silverpine. I've sent Deathstalkers after him, and none came back, which tells me something about his defenses." } },
    gilneas = { { id = "tp_gilneas", text = "The Gilneans hid behind their wall when Lordaeron needed them most, and now there are worgen on our side of it. If Genn Greymane wants his land back, he'll have to come through me." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran's mages hold Ambermill and claim it as theirs, and they hide their city behind shields while they rebuild. I count them among my enemies, and I'm not short of enemies." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady trusts me with the Sepulcher, and I've never given her reason to doubt it. I don't intend to start now." } },
    thrall = { { id = "tp_thrall", text = "The Warchief's people come through Silverpine now and then, on their way somewhere else. They fight well enough, and I'm glad of any blade that points at my enemies." } },
    lordaeron = { { id = "tp_lordaeron", text = "Silverpine was Lordaeron's western forest, and its people fled or died when the plague came. The forest has forgotten them, but I haven't." } },
    _none = { { id = "tp_none", text = "Ask Shadow Priest Allister; information is his business, not mine." } },
  },
}

P:NPC {
  key = "renferrel", id = TODO_NPC("Apothecary Renferrel"), name = "Apothecary Renferrel",
  bible = "bibles/silverpine.md", role = "scholar", tier = "quest",
  communities = { "sepulcher" }, temper = { "focused" }, values = { "ambitious", "curious" },
  notices = { "craft" },
  impression = {
    first = "Apothecary Renferrel works far from the Undercity's eyes and nose, and he takes Silverpine's damp as a personal insult. He calls his work improving on a recipe for death without a hint of irony.",
    third = "{name} met Apothecary Renferrel of the Royal Apothecary Society, who pursues his studies in the damp crypts of the Sepulcher.",
  },

  greetings = {
    { id = "g_lab", text = "Don't touch anything green, or anything that glows, or anything at all, really. The last deathguard who did is the stain by the door." },
    { id = "g_xcult", when = { origin = "forsaken_cult_remnant" }, text = "You were with the Cult before you died? Then you've seen what a properly made plague can do, so you'll understand why I'm so particular about my bottles." },
    { id = "g_away", when = { away = 14 }, text = "Back after {away}, and the damp hasn't rotted you yet, I see. It's rotting my reagents, so do try to be useful." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "I hear someone at the Sepulcher swallowed one of your stories whole. A neat bit of work, and frankly more refined than anything else in this wretched forest." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = { "Alchemy", "Herbalism" } },
      text = "Ah, you know your reagents, good. Half my work is waiting on people who don't." },
  },

  start = "hello",
  nodes = {
    op_worgen = {
      big = true,
      lines = {
        { id = "opwg_default", text = "Some of them were men, before Arugal called them into these woods, and some of them never were. I'm asked to study them, but I'd like to hear it from someone who's been bitten at: do you pity them, or would you burn the lot?" },
      },
      choices = {
        { text = "Pity them. They never asked for the curse.", next = "op_worgen_r1", fx = { align = { light = 1 }, opinion = { worgen = "pity" } } },
        { text = "Burn them. Whatever they were, they're beasts now.", next = "op_worgen_r2", fx = { affinity = 1, align = { light = -1 }, opinion = { worgen = "hunt" } } },
        { text = "The wild in them was twisted. That isn't their fault.", next = "op_worgen_r3", fx = { trait = { kind = 1 }, opinion = { worgen = "pity" } }, when = { class = "DRUID" } },
        { text = "I'd rather not think about them.", next = "BACK" },
      },
    },
    op_worgen_r1 = {
      lines = { { id = "opwg_r1", text = "Pity is a luxury in Silverpine, but I'll grant they didn't ask, any more than we did. I'd still like one alive for my tables, mind." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_worgen_r2 = {
      lines = { { id = "opwg_r2", text = "Practical. Bring me what's left after the burning, if you would, because even ash tells me something." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_worgen_r3 = {
      lines = { { id = "opwg_r3", text = "A druid's answer, and probably a wiser one than mine. If your Circle ever learns how to untwist it, I'd very much like to read the notes." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "It might, or it might improve it, and I've no way of knowing without testing, which is the real tragedy of working out here. If you ever feel inclined to lend a drop of holy power to the Society's recipe, I'd be very interested in the results." } },
      choices = {
        { text = "The Light stays out of your recipes, Apothecary.", next = "BACK", reply = "A pity. The Light might have done marvellous things to my recipes, but I'll respect your wishes.", fx = { align = { light = 1 } } },
        { text = "Take what you need, if it hurts our enemies.", next = "BACK", reply = "Excellent. Hold still, then, and I'll take a little of whatever it is you carry.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Both of us know exactly what a body can bear, and both of us push it past that point for a purpose. The difference is that my results can be bottled, labelled and carried to the Undercity, while yours depend on whoever happens to be listening. I prefer a method that doesn't rely on anybody's mood." } },
      choices = {
        { text = "Faith asks more of a healer than any recipe does.", next = "BACK", reply = "Faith asks, I'm sure, but I find it rarely answers. My recipes, at least, are consistent.", fx = { align = { light = 1 } } },
        { text = "You're right. Results matter more than belief.", next = "BACK", reply = "At last, a priest with sense. You'd do well in the Apothecarium.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I need a guard on the shipments, since half of what comes down the road from Brill arrives broken or not at all. And the Rot Hide gnolls carry a sickness someone made deliberately, so if you cut one down, don't cut your own hand on the same blade." } },
      choices = {
        { text = "I'll guard the shipments. Your work serves the Dark Lady.", next = "BACK", reply = "Good. The Dark Lady thanks you, and so do my vials, which break if you so much as look at them.", fx = { align = { order = 1 } } },
        { text = "I came to fight gnolls, Apothecary, not carry crates.", next = "BACK", reply = "Crates feed the war that feeds the gnolls to you. Suit yourself, but I'll remember.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "o_udimprove", tags = { "news" }, when = { opinion = { topic = "undeath", stance = "improvement" } }, text = "Master Apothecary Faranell writes from the Undercity that you think undeath an improvement on the alternative. He's thrilled, and I'm inclined to agree, though I'd never tell him so." },
        { id = "h_default", key = true,
          text = "Apothecary Renferrel, of the Royal Apothecary Society. Our work goes on here, far from the Undercity's eyes and nose, and just now it's the sickness the Rot Hide gnolls carry." },
        { id = "h_delivery", when = { questActive = TODO_QUEST("Delivery to Silverpine Forest") },
          text = "Apothecary Johaan's package from Brill, and intact, too. He'll be pleased, and I'm relieved." },
        { id = "h_recipe", tags = { "news" }, when = { questActive = TODO_QUEST("A Recipe For Death") },
          text = "That's the recipe I sent for. It's a recipe for death, though not mine; I only improve on it, so bring me what it calls for." },
        { id = "h_rothide", when = { any = { { questActive = TODO_QUEST("Rot Hide Ichor") }, { questActive = TODO_QUEST("Rot Hide Origins") } } },
          text = "The Rot Hide gnolls carry a sickness, and I want to know where it came from, because someone made it." },
        { id = "h_thule", when = { questActive = TODO_QUEST("Thule Ravenclaw") },
          text = "The trail leads to a lich called Thule Ravenclaw. Bethor Iceshard in the Undercity knew him once, so tread carefully." },
        { id = "h_samples", when = { metBefore = true }, text = "The samples spoiled again in the damp. Silverpine rots everything, which is ideal for some studies and infuriating for others." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Don't call up any water spirits in here, because the damp is already ruining my samples of the Rot Hide sickness." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, how fortunate. The Moonrage worgen and the spiders near Fenris Isle both interest me, and you'll know them better than my errand-runners." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Do keep your blade sheathed in here, {class}, because the samples are fragile and I am out of patience with this damp." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. If you've come to bless my work, don't bother, because it does its job very well without anyone's god." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin. Keep your hands to yourself in here, if you'd be so kind, because the Light and this damp are both ruinous to my reagents, and I can't replace them until the next bat flies in." },
      },
      choices = {
        { text = "Are a priest's craft and yours alike, Renferrel?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Could the spirits help trace the Rot Hide sickness, Renferrel?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What do you want with the worgen, Renferrel?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I could bring you samples from Silverpine's beasts.", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "The Rot Hide sickness doesn't look natural.", next = "rothide" },
        { text = "The Rot Hide sickness reminds me of the Cult's work.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "I could coat my blades with some of this.", next = "rogue", when = { class = "ROGUE" } },
        { text = "A mage's eye might help with your recipe, Apothecary.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do you need a guard for your samples, Apothecary?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "The Light might spoil your work, Apothecary.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll gather what you need.", next = "END", fx = { affinity = 1 } },
      },
      again = {
        { id = "h_again", text = "Yes? And keep your hands at your sides." },
      },
    },
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "Could you? The Moonrage worgen interest me professionally, and so do the spiders near Fenris Isle. Bring me what I ask for intact, and I'll think better of hunters forever." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} on a short leash while you gather, would you? A Moonrage sample is no use to me with tooth marks in it, and I've seen what a hungry beast does to a spider from Fenris Isle." },
      },
      choices = {
        { text = "I'll bring them back just as you need them.", next = "BACK", reply = "Splendid. Undamaged, if you please, and labelled by location.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll bring what's left after the fight.", next = "BACK", reply = "What's left after the fight is usually a mess, but a mess is still data. I'll take it.", fx = { align = { order = -1 } } },
      },
    },
    rothide = {
      lines = { { id = "rh_default", text = "That's what I mean to find out. It isn't natural to gnolls, it smells of the Scourge's cauldrons, and it's been made to spread. Somebody brewed it, and I want their notes." } },
      choices = {
        { text = "What do you make of the worgen, Apothecary?", next = "op_worgen" },
        { text = "Then I'll find who brewed it.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
      },
    },
    warlock = {
      lines = {
        { id = "wl_default", text = "Does it? Then you've seen the Cult's work closer than I'd like to ask about. Yes, it's the same hand, or someone who learned from it. Tell me what else you recognize when you bring me the gnolls' ichor." },
        { id = "wl_cult", when = { origin = "forsaken_cult_remnant" },
          text = "You'd know, wouldn't you? I've heard what you were. Help me trace this sickness back to whoever made it, and you'll be undoing a little of your own work." },
      },
      choices = { { text = "I'll tell you what I recognize.", next = "BACK", fx = { affinity = 2 } } },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Absolutely not, unless you'd like your blade to rot in its sheath and your hand with it. Ask in the Undercity for proper poisons; mine are for studying, not stabbing." } },
      choices = { { text = "Studying, not stabbing. Fair.", next = "BACK", fx = { affinity = 1 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Possibly, though I doubt the spirits keep notes, and I need notes. Whoever brewed it worked with the Scourge's cauldrons, so if your elements can tell you where the earth was poisoned first, I'll take it, however unscientific the source." } },
      choices = {
        { text = "Then I'll ask, and we'll find whoever brewed it.", next = "BACK", reply = "Splendid. I'll want every word, written down, whatever the spirits think of notes.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Find it yourself. The spirits aren't your laboratory.", next = "BACK", reply = "The spirits are not my laboratory, I agree, but they'd make an excellent one. A pity.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "To understand them, primarily, and to find what makes the curse spread. A curse that passes from one creature to another is very like a plague, druid, and the Society takes a professional interest in anything that spreads." } },
      choices = {
        { text = "Understanding a curse is the first step to ending it.", next = "BACK", reply = "It is, and the second step is replicating it, which I suspect you'd like less. One step at a time.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Learn it, then turn it on our enemies.", next = "BACK", reply = "Turn it on our enemies, yes, that's exactly the Society's thinking. You'd fit in nicely downstairs.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "A mage's eye might, if it could stop looking for the arcane in everything and see that some things are only chemistry. Still, I'd welcome a second pair of hands in this damp, since mine keep slipping on the vials." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "Dalaran's alchemists would have called my work crude, and some of them now work for the Society, which I find very satisfying. If you trained there, by all means lend a hand, but leave your pride at the door." },
      },
      choices = {
        { text = "It's your laboratory. I'll follow your method.", next = "BACK", reply = "Good. Methods are what separate apothecaries from mages, and you've just chosen correctly.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll do it my way, or not at all.", next = "BACK", reply = "Then do it your way, and I'll write down where it went wrong. Science thrives on failure.", fx = { align = { order = -1 } } },
        { text = "The Rot Hide sickness doesn't look natural.", next = "rothide" },
      },
    },
  },

  topics = {
    new_plague = { { id = "tp_new_plague", text = "I'm improving on a recipe for death, and that's all I'm going to say. The Society doesn't care for loose talk, and neither do I." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken will win this war with clever minds and sharp poisons, not with swords alone. I'm doing my part, out here in this miserable damp." } },
    scourge = { { id = "tp_scourge", text = "The Scourge's plague is a blunt instrument, and we're making a scalpel. Don't ask me which way it cuts." } },
    shadowfang = { { id = "tp_shadowfang", text = "Worgen blood has fascinating properties, I'm told, and I'd love a fresh sample from Arugal's keep. Nobody seems willing to fetch one." } },
    _none = { { id = "tp_none", text = "If it can't be bottled, it can't hold my attention." } },
  },
}

P:NPC {
  key = "dalar", id = TODO_NPC("Dalar Dawnweaver"), name = "Dalar Dawnweaver",
  bible = "bibles/silverpine.md", role = "scholar", tier = "quest",
  communities = { "sepulcher" }, temper = { "proud" }, values = { "sharp", "proud" },
  notices = { "class" },
  impression = {
    first = "Dalar Dawnweaver would still like to be called Archmage, and thinks the Kirin Tor rude for stopping when he died. He warned Dalaran once and nobody listened, and he has not let it go.",
    third = "{name} met Dalar Dawnweaver, a former archmage of the Kirin Tor who now watches Dalaran's mages from the Sepulcher.",
  },

  greetings = {
    { id = "g_mage", text = "You may address me as Archmage, if you like. The Kirin Tor stopped doing so when I died, which I thought rude of them." },
    { id = "g_back", when = { metBefore = true }, text = "You again, good. You're the only one here who listens." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and nobody here has listened to a word I've said in all that time. Do sit down; I've been saving it all up for someone who still has ears." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear you talked someone round to your view not long ago. I could have used that talent when I warned Dalaran, because they certainly never listened to me." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Someone here spoke well of you, which in the Sepulcher is practically a public honour. I'm pleased to hear it, and I'm not easily pleased." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. Then you'll understand how it galls me to watch Dalaran's fools stumble about in this forest, making the same mistakes twice." },
  },

  start = "hello",
  nodes = {
    op_kirin_tor = {
      big = true,
      lines = {
        { id = "opkt_default", text = "Less every season, and more than I'd like. The wizards at Ambermill would kill me on sight, and yet I still read their handwriting with a certain fondness, so tell me, {class}, what do you make of the Kirin Tor?" },
      },
      choices = {
        { text = "They're our enemy now. Ambermill proves it.", next = "op_kirin_tor_r1", fx = { affinity = 1, align = { honor = -1 }, opinion = { kirin_tor = "enemy" } } },
        { text = "They made mistakes, but they're scholars, not monsters.", next = "op_kirin_tor_r2", fx = { align = { honor = 1 }, opinion = { kirin_tor = "respect" } } },
        { text = "I'd learn from them still, if they'd teach me.", next = "op_kirin_tor_r3", fx = { opinion = { kirin_tor = "admire" } }, when = { class = "MAGE" } },
        { text = "Dalaran is your business, Archmage.", next = "BACK" },
      },
    },
    op_kirin_tor_r1 = {
      lines = { { id = "opkt_r1", text = "It does, and I've stopped pretending otherwise, though I'd still rather outwit them than burn them. You may not have the luxury of choosing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_kirin_tor_r2 = {
      lines = { { id = "opkt_r2", text = "Scholars, yes, and frightened ones, which is the most dangerous kind. I warned them once, and I'd warn them again if they'd let me through the door." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_kirin_tor_r3 = {
      lines = { { id = "opkt_r3", text = "So would I, and that's the cruelty of it. Learn what you can from their books, then, and leave their towers well alone." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xcl_sfk = {
      big = true,
      lines = { { id = "xcl_sfk_default", text = "Ah, you called me Archmage, how very kind. Arugal was the cleverest student of his year and the worst listener, and when the Scourge came he reached for the worgen because nobody would stop him, and nobody would stop him because the council was too busy arguing over whose fault the plague was." } },
      choices = {
        { text = "The council should have reined him in. That was their duty.", next = "BACK", reply = "They should have, and I said so at the time, and they told me to stop being gloomy. I'll not forgive them.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Nobody could have stopped him. Councils never stop anything.", next = "BACK", reply = "You may be right, and that's the most depressing thing I've heard all week. Thank you.", fx = { align = { order = -1 } } },
        { text = "Did you know Arugal well, before all this?", next = "xcl_sfk2" },
      },
    },
    xcl_sfk2 = {
      lines = { { id = "xcl_sfk2_default", text = "Well enough to dislike him, and not well enough to stop him, which is what I'd have carved on my tomb if anyone had bothered to give me one. He always finished his work first, and he never once checked it." } },
      choices = {
        { text = "Then I'm sorry you were right, Archmage.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "That faith can hold where wards fail, and that the knights of Lordaeron might have seen the plague for what it was if anyone had asked them. Nobody asked, and now you and I are dead, and the Kirin Tor are rebuilding a ruin and slow to open its gates, and I find it hard to be gracious about it." } },
      choices = {
        { text = "Then let the Light and the arcane stand together now.", next = "BACK", reply = "Together, yes, and for once I agree with a paladin. Write the date down; it won't happen again.", fx = { align = { light = 1 } } },
        { text = "Grievances are useful. Keep yours sharp, Archmage.", next = "BACK", reply = "Oh, I intend to. Grievances are the one thing in the Sepulcher that never rot.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "That the Light would protect the city, which it did not, and that I was too fond of dark predictions, which I was not. They prayed very beautifully while Kel'Thuzad's cult grew fat in the farmlands around them. I hope your faith listens better than theirs did, priest, because faith that doesn't listen is only noise." } },
      choices = {
        { text = "They failed, Dalar, not faith itself.", next = "BACK", reply = "Faith itself, no, I'll grant you that. The people holding it, though, were quite as bad as I said.", fx = { align = { light = 1 } } },
        { text = "Faith is noise. You were right to scorn it.", next = "BACK", reply = "You flatter me, but I'll accept it. Being right was never much consolation.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Carefully, and never at night, because the curse makes them stronger under the moon and cleverer than any wolf has a right to be. They are Arugal's mistake, called up from somewhere he didn't understand, and they don't die as easily as ordinary game." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Carefully, and keep {pet} close, because a worgen will go for your beast first to get at you. The curse makes them stronger under the moon and cleverer than any wolf has a right to be." },
      },
      choices = {
        { text = "Then I'll hunt them by day, as you advise.", next = "BACK", reply = "Good. You'll live longer, and I'll have fewer letters to write.", fx = { align = { order = 1 } } },
        { text = "I'll hunt them under the moon. That's the real test.", next = "BACK", reply = "The real test, and the real grave, I expect. Let me know how it goes, if you're able.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "o_ktblame", tags = { "news" }, when = { opinion = { topic = "kirin_tor", stance = { "blame", "hate" } } }, text = "You've no love for the Kirin Tor, from what I hear, and I can't say you're wrong. Sit, and I'll tell you what they did right, so you've the whole account." },
        { id = "h_default", key = true,
          text = "Dalar Dawnweaver. I was an archmage of the Kirin Tor until the Scourge took Dalaran and me with it, and I warned them, but nobody listened." },
        { id = "h_prove", when = { questActive = TODO_QUEST("Prove Your Worth") },
          text = "Before I trust you with real work, show me you can survive the forest. It's a low bar, and yet many trip on it." },
        { id = "h_folly", tags = { "news" }, when = { questActive = TODO_QUEST("Arugal's Folly") },
          text = "Arugal was a Kirin Tor mage who called up beasts he couldn't control, and now they run Silverpine. That is what Dalaran calls a solution." },
        { id = "h_cl_sfk", tags = { "news" }, when = { cleared = "Shadowfang Keep", faction = "Horde" },
          text = "Arugal is dead, and I didn't even get to watch it happen, which is a disappointment, frankly. I told the Kirin Tor he would come to this, and nobody listened, and now nobody needs to." },
        { id = "h_intentions", when = { any = { { questActive = TODO_QUEST("Dalar's Analysis") }, { questActive = TODO_QUEST("Dalaran's Intentions") } } },
          text = "Dalaran's mages are in Ambermill. I want to know why. Bring me what they're carrying, and I'll read it better than they wrote it." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The Kirin Tor never trusted shamans, and I always thought it was because they couldn't explain what you did, and they hated anything they couldn't explain." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. Dalaran's libraries had three shelves on the Cenarion Circle and two of them were wrong, so I'd welcome a correction." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Arugal's worgen are beasts only in shape, {class}, and I'd advise you not to treat them like ordinary game." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Dalaran had priests too, clever ones in fine robes, and they listened to my warnings no better than the Kirin Tor did." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin of the Forsaken. The Kirin Tor never did take the Light seriously, which is one of many things I warned them about, and they listened to that about as well as they listened to everything else." },
      },
      choices = {
        { text = "What did Dalaran's priests say when you warned them, Dalar?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "I doubt you can explain what I do, Archmage.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What did the Kirin Tor get wrong about druids?", next = "druid_q", when = { class = "DRUID" } },
        { text = "The Sepulcher could use more steel and fewer spells, Dalar.", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "You sound like a man whose warnings went unheard.", next = "warned" },
        { text = "I studied magic too. What would you teach me?", next = "mage", when = { class = "MAGE", race = "Scourge" } },
        { text = "An orc mage, Archmage. Go on, laugh.", next = "orcmage", when = { race = "Orc", class = "MAGE" } },
        { text = "I deal with the Nether, Archmage. Spare me the lecture.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "I'd guess mages never trust rogues, Archmage.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "How should I hunt Arugal's worgen, Archmage?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What did you warn the Kirin Tor about the Light?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Arugal is dead, Archmage. I was there.", next = "xcl_sfk", when = { cleared = "Shadowfang Keep", faction = "Horde" } },
        { text = "I'll help.", next = "END", fx = { affinity = 1 } },
      },
      again = {
        { id = "h_again", text = "What else? I'm glad of a mind to talk to, so don't waste it." },
      },
    },
    mage = {
      big = true,
      lines = {
        { id = "ma_default", text = "To distrust anyone who says a spell is safe, starting with yourself. Dalaran taught that power should be studied before it's used, and then forgot its own lesson every time someone clever enough came along." },
        { id = "ma_dalaran", when = { origin = "forsaken_dalaran_apprentice" },
          text = "An apprentice of the Kirin Tor, before? Then you've already learned half of what they teach and none of what they hide. Stay with me a season, and I'll fix that." },
      },
      choices = {
        { text = "Power should be studied first. Dalaran was right about that.", next = "BACK", reply = "It was, and it's the one thing it was right about. Pity it never studied Arugal.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Power is for using. Caution is how Dalaran fell.", next = "BACK", reply = "Caution is how Dalaran survived as long as it did, I assure you. Recklessness is how it fell.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "What do they hide?", next = "mage_hide" },
      },
    },
    mage_hide = {
      lines = { { id = "mh_default", text = "Their mistakes, chiefly. Arugal is the one you can see from here, howling in the woods. There are others in their records, and the Kirin Tor are very good at losing records." } },
      choices = { { text = "Then I'll go looking for records.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } } },
    },
    orcmage = {
      lines = { { id = "om_default", text = "Laugh? The Kirin Tor spent the Second War insisting your people could manage nothing subtler than a warlock's fire. Watching you prove them wrong is the most pleasure I've had since I died, so don't spoil it by being careless." } },
      choices = { { text = "I won't be careless.", next = "BACK", fx = { affinity = 2 } } },
    },
    warlock = {
      lines = { { id = "wl_default", text = "Spare you? I watched Kel'Thuzad bargain with the Nether in the halls of Dalaran, and I watched where it led him. You'll get the lecture whether you want it or not, so keep your bargains small and your exits close." } },
      choices = {
        { text = "Small bargains, close exits. Understood.", next = "BACK", reply = "Good. Small bargains and close exits, and you might live long enough to be a disappointment instead of a catastrophe.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Kel'Thuzad simply bargained badly.", next = "BACK", reply = "He bargained beautifully, I assure you, and he got exactly what he asked for. That was the problem.", fx = { affinity = -2, align = { light = -1 } } },
      },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "Steel holds a line, and I've seen it hold at the Sepulcher gate, but it can't see through Arugal's illusions or burn a worgen pack at fifty paces. We need both of us, warrior, and that's the uncomfortable truth." } },
      choices = {
        { text = "Then we'll fight together, spell and steel.", next = "BACK", reply = "Spell and steel, yes, the way it should have been done the first time. Lead on.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I've never needed a mage to win a fight.", next = "BACK", reply = "Then you've never fought Arugal. You'll need one soon, I promise.", fx = { align = { order = -1 } } },
      },
    },
    warned = {
      big = true,
      lines = {
        { id = "w_default", text = "Many things, and Dalaran preferred not to hear any of them. I was there when Kel'Thuzad called the demon down; I'd have liked to be wrong." },
      },
      choices = {
        { text = "Do you still feel any loyalty to Dalaran?", next = "op_kirin_tor" },
        { text = "I'm sorry nobody listened, Archmage.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Not in the least, and I find I don't mind, which surprises me. The arcane is a lock I picked and your elements are a door somebody opened for you, so I suppose the difference is courtesy, and I was never much good at that." } },
      choices = {
        { text = "Courtesy keeps the door open, Archmage.", next = "BACK", reply = "It does, and I'm glad you value it. Keep it open, and I'll keep asking questions.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A picked lock opens just the same.", next = "BACK", reply = "It does, and the mages who picked theirs sit in ruins. Mind your lock, shaman.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "That you were simple, chiefly, and that nature magic was what a mage practised before he learned to read. Then Arugal called up his wolves and couldn't put them down again, and I'd wager no druid would have made that mistake." } },
      choices = {
        { text = "Nature's power demands humility. Arugal had none.", next = "BACK", reply = "It does, and Arugal had none, as I've said for years. You're already wiser than he was, which is a low bar, but still.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Arugal was weak. Power belongs to those who can hold it.", next = "BACK", reply = "Weak, yes, and power certainly held him. You may want to think about that.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Never, and that's how Dalaran's wards came to be the finest in the world, and also why they were always being tested. I'd have you look at Ambermill for me, since a thief who gets close to their wards would tell me more than my scrying ever has." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "In life you'd have been just the sort I warned the Kirin Tor about, a cutpurse lurking in the Violet Citadel's shadow. Now you're the only sort I'd trust to do the job they never let me do." },
      },
      choices = {
        { text = "I'll get close to their wards and report back.", next = "BACK", reply = "Good. Report it all, and I'll tell you which parts will kill you.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll get close, and whatever I find is mine.", next = "BACK", reply = "Mine, you say? Dalaran's wards keep a very good inventory. Report first, and then we'll discuss shares.", fx = { align = { order = -1 } } },
        { text = "You sound like a man whose warnings went unheard.", next = "warned" },
      },
    },
  },

  topics = {
    worgen = { { id = "tp_worgen", text = "The worgen are Arugal's mess, and a fool with power is the most dangerous creature in any forest." } },
    dalaran = { { id = "tp_dalaran", text = "I was an archmage of Dalaran, and I warned the Kirin Tor of what was coming, and nobody listened. Now they rebuild behind their shields and send their apprentices to squat in Ambermill, and they still don't listen." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor stopped calling me Archmage the moment I died, which I find extraordinarily rude. I haven't forgotten a single one of their names." } },
    shadowfang = { { id = "tp_shadowfang", text = "Arugal was one of ours, a fine mage once, and the Kirin Tor let him summon the worgen to fight the Scourge. He lost his mind, and now he hides in Shadowfang Keep calling the wolves his children." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad was a member of the Council once, before he chose a different master. I remember him well, and I remember how many of us thought him merely eccentric." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken gave me a place when Dalaran wouldn't, and I serve the Dark Lady gladly. I'd serve her more gladly still if she let me burn Ambermill." } },
    _none = { { id = "tp_none", text = "Beneath my notice, or above my current research. Either way, not today." } },
  },
}

P:NPC {
  key = "allister", id = TODO_NPC("Shadow Priest Allister"), name = "Shadow Priest Allister",
  bible = "bibles/silverpine.md", role = "priest", tier = "quest",
  communities = { "sepulcher" }, temper = { "smooth" }, values = { "cunning", "loyal" },
  notices = { "class", "stealth" },
  impression = {
    first = "Shadow Priest Allister had heard I was coming before I arrived, and he wanted me to know it. He keeps watchers in every corner of Lordaeron and trades in whatever they bring him.",
    third = "{name} met Shadow Priest Allister, the Sepulcher's spymaster, who learns of everything that moves in Silverpine.",
  },

  greetings = {
    { id = "g_shadows", text = "Ah, I heard you were coming. I hear most things." },
    { id = "g_xchapel", when = { origin = "forsaken_chapel_priest" }, text = "I hear you preached the Light in the old chapels, and that you still pray to it when you think nobody's listening. Somebody is always listening, but the Dark Lady tolerates it, and so shall I." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and I heard a good deal of what you did while you were away. I hear most things, after all." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "My watchers tell me someone here believed a tale you spun them. I trade in secrets myself, so I do appreciate a well-placed untruth." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I heard one of your lies was seen through, and I heard it before you did, I expect. A clumsy lie is worse than none, so be more careful." },
  },

  notice = {
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "Quiet feet, I see, and I've uses for quiet feet. Come and see me when you're ready to earn your keep in shadows." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "That there are a handful of you, and that the Scarlet Crusade would pay very well to learn your names, because a dead paladin is an insult to everything they stand for. I keep those names to myself, {class}, but I do keep them, and you'd be wise to remember that." } },
      choices = {
        { text = "Keep them, then. I trust the Dark Lady's servants.", next = "BACK", reply = "Good. Your trust is well placed, and I'll see that it stays that way.", fx = { align = { order = 1 } } },
        { text = "My name is my own. I'll guard it myself.", next = "BACK", reply = "Guard it well, then. The Scarlets are patient, and so am I.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "To see clearly, mostly, and to stop expecting the Light to love us again. The Shadow doesn't care whether you were a farmer or a bishop before you died; it gives strength to whoever has the will to hold it. A troll's loa might ask for gratitude, but the Shadow asks only that you never look away." } },
      choices = {
        { text = "Some of us still remember the Light. It isn't gone.", next = "BACK", reply = "It may not be gone, but it's certainly not looking at us. Still, I'll not argue with you.", fx = { align = { light = 1 } } },
        { text = "I won't look away. The Shadow suits me.", next = "BACK", reply = "Then you'll see more than most. Welcome to the Shadow.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Very little, I'm afraid, because a watcher must go unnoticed and you could not go unnoticed in a fog. But someone has to deal with what my watchers find, and that, I suspect, is where you come in." } },
      choices = {
        { text = "Then show me what they find, and I'll deal with it.", next = "BACK", reply = "Good. I'll send them out tonight, and you'll make a great deal of noise wherever they point.", fx = { align = { order = 1 } } },
        { text = "I find my own fights. I don't need your watchers.", next = "BACK", reply = "Then find them, and we'll see who finds them first.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Perhaps, if you can report what you see without adding what you wish you'd seen. Hunters notice beasts and tracks and weather, and a watcher needs all three, so tell me what moves along the roads past Pyrewood, and how many of them come back." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Perhaps, and {pet} would make a better watcher than most of mine, because a beast never adds what it wishes it had seen. Tell me what moves along the roads past Pyrewood, and how many of them come back." },
      },
      choices = {
        { text = "I'll report what I saw, Shadow Priest, and nothing more.", next = "BACK", reply = "Good. Plain reports are the rarest kind.", fx = { align = { honor = 1 } } },
        { text = "I'll report what serves me, Shadow Priest.", next = "BACK", reply = "Then I'll know which parts to discard. That's my job.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "o_vmdistrust", tags = { "news" }, when = { gossip = { topic = "varimathras", stance = "distrust" } }, text = "Deathstalker Erland says you don't trust Varimathras, the dreadlord at the Dark Lady's side. Neither do I, but the shadow teaches patience, and so should you." },
        { id = "h_default", key = true,
          text = "Shadow Priest Allister. I keep watchers in every corner of Lordaeron, and what moves in Silverpine, I learn of first." },
        { id = "h_border", tags = { "news" }, when = { questActive = TODO_QUEST("Border Crossings") },
          text = "Someone has been crossing into our lands who shouldn't be. Find out who, and what they carry." },
        { id = "h_ambermill", when = { questActive = TODO_QUEST("Ambermill Investigations") },
          text = "Dalaran's mages have taken an interest in Ambermill, and I'd like to know why before they finish whatever it is." },
        { id = "h_weaver", when = { questActive = TODO_QUEST("The Weaver") },
          text = "The Weaver is a Dalaran mage at Ambermill, and a dangerous one. Remove that problem, and quietly, if you can." },
        { id = "h_watchers", when = { metBefore = true }, text = "One of my watchers came back from the north with a story I don't believe, and I wrote it down anyway. That's the work." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. I heard you were coming, of course, and I heard your spirits were noisy, which I'd ask you to keep in mind near the border." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. I heard a tauren had come to Silverpine, and I heard you'd been sniffing about Pyrewood, so I assume you've something to tell me." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. My watchers saw you coming, {class}, and you're not hard to see, with all that steel catching the light." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You read the forest the way my watchers read people, {class}, and I wonder which of you is the better at it." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. I heard one was coming, of course, and I'm pleased to see you look the part, for the Shadow could use more servants in Silverpine who know how to listen." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Dalaran", min = 20 } }, text = "The Dalaran wizards at Ambermill have lost a good many of their number, and the survivors are keeping behind their walls. Whatever they're building there, you've slowed it down." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin of the Forsaken. My watchers told me one was coming to Silverpine, though they didn't say you'd glow quite so brightly, which will make you rather harder to hide." },
      },
      choices = {
        { text = "What does the Forgotten Shadow ask of its priests, Allister?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What do you want from a shaman, Shadow Priest?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "You never seem to stop listening, Shadow Priest.", next = "druid_q", when = { class = "DRUID" } },
        { text = "My spells could serve your watchers, Allister.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Demons make fine watchers, Allister.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What do your watchers say about paladins like me?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "What do you want me to learn?", next = "END", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "I'm good in the shadows. Make me one of your watchers.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Warriors must be of some use to your watchers, Shadow Priest.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Could a hunter serve as one of your watchers, Allister?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "A living face could cross the border easier.", next = "living", when = { race = { "Orc", "Troll", "Tauren" } } },
      },
      again = {
        { id = "h_again", text = "Something else? Lower your voice, though; even crypts have ears." },
      },
    },
    rogue = {
      lines = {
        { id = "ro_default", text = "You might be, in time. My watchers go where they're sent and report what they see, not what they think, and the second part is harder than it sounds. Start with the border, and tell me only what happened." },
        { id = "ro_deathstalker", when = { origin = "forsaken_deathstalker_recruit" },
          text = "Hadrec has the deathstalkers, and I have the watchers, and they're not quite the same trade. His kill quietly, and mine listen quietly. Try mine for a while." },
      },
      choices = {
        { text = "Only what happened. No opinions.", next = "BACK", reply = "Good. Opinions get watchers killed.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "My opinions are worth hearing too.", next = "BACK", reply = "They may be, in time. For now, I'd like the facts.", fx = { affinity = -1, align = { order = -1 } } },
      },
    },
    living = {
      lines = { { id = "lv_default", text = "Easier past the Alliance, harder past the worgen, who prefer warm meat. But yes, the travellers at the border would talk to you before they'd talk to one of us. Do ask them where they're going, and remember the answers." } },
      choices = { { text = "I'll remember everything.", next = "BACK", fx = { affinity = 2 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Your ears, mostly. The travellers on the border speak freely in front of the living, so if the wind carries you anything about Dalaran's mages at Ambermill, I'd like to hear it before Hadrec does." } },
      choices = {
        { text = "Before Hadrec, then. You'll hear it first.", next = "BACK", reply = "Good. I'll pass it along to Hadrec once I've weighed it.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Hadrec commands here. He hears it first.", next = "BACK", reply = "He does, and he'll hear it. I'd only like to hear it too.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Never, and it's a great comfort to me. A cat on a roof in Pyrewood hears more than any of my watchers, so if you'd care to spend a night up there, I'd make it worth your while." } },
      choices = {
        { text = "I'll watch Pyrewood for you, and report everything.", next = "BACK", reply = "Thank you. The Pyrewood folk never look up, and a cat on a roof sees everything.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My eyes are my own. I'll share what I choose.", next = "BACK", reply = "Then choose wisely, druid, and remember who asked.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They could, and I'd like to know how far you can see, since my watchers tell me the Dalaran mages at Ambermill are scrying in our direction. A mage who can feel the edge of a scrying spell would be worth a dozen spies at a window." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "I know a few who studied in Dalaran and now study for us, and not one has stopped flinching when the Violet Citadel is mentioned. You'll learn I don't judge loyalty by where it began." },
      },
      choices = {
        { text = "I'll serve the Dark Lady's watchers gladly.", next = "BACK", reply = "Gladly is the right word. They'll find a use for your eyes.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll share what I see when I choose to.", next = "BACK", reply = "Then choose often, and choose well. The Dark Lady notices.", fx = { align = { order = -1 } } },
        { text = "Is there something else you'd ask of me?", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They make fine noise, which isn't the same thing, though I admit an imp in a chimney hears what a deathstalker at the window misses. Bring me what it overhears in Pyrewood, and I'll decide whether it was worth the scorch marks." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "I watched the Cult's people in the old days, and they all thought their demons and their dead made them invisible. They were wrong, so you'll forgive me if I watch you just as closely." },
      },
      choices = {
        { text = "Then I'll bring you only what's useful.", next = "BACK", reply = "Good. Useful is all I need, and an imp in a chimney is very useful.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll keep what the imp hears until it suits me.", next = "BACK", reply = "Then the imp keeps it, and you keep the imp. Let me know when it suits you.", fx = { align = { order = -1 } } },
        { text = "Is there something else you'd ask of me?", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "My watchers bring me more than the High Executor ever hears, and some of it I'm even permitted to share. These, for instance, if you ask nicely." },
      { id = "tp_knows_warm", when = { disposition = { min = 65 } }, text = "You've been discreet, and I reward discretion, so I'll tell you rather more than I tell most." },
    },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken have eyes in every corner of Lordaeron, and most of those eyes report to me. I trade in what they bring back, and business is very good." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady values information above gold, and I give her plenty of it. In return, she lets me keep the rest for my own uses." } },
    dalaran = { { id = "tp_dalaran", text = "My watchers tell me Dalaran is rebuilding steadily, and that the Kirin Tor keep the gates shut to all but their own. They also tell me which of their own are unhappy about it." } },
    gilneas = { { id = "tp_gilneas", text = "Nothing comes over the Greymane Wall, not even rumors, and that bothers me more than I'd like. I hate a closed door." } },
    shadowfang = { { id = "tp_shadowfang", text = "I know a good deal about what goes on inside Shadowfang Keep, and none of it is pleasant. Arugal is mad, but a madman can still be useful." } },
    _none = { { id = "tp_none", text = "If I knew, I wouldn't tell you for free, and I don't know." } },
  },
}

P:NPC {
  key = "bates", id = TODO_NPC("Innkeeper Bates"), name = "Innkeeper Bates",
  gender = "male",
  bible = "bibles/silverpine.md", role = "innkeeper", tier = "service",
  communities = { "sepulcher" }, temper = { "hospitable" }, values = { "generous" },
  notices = { "weary" },
  impression = {
    first = "Innkeeper Bates runs an inn in a crypt and keeps calling the beds slabs out of habit. He has come to an arrangement with the spiders, and he can tell the worgen apart by their howls.",
    third = "{name} rested at Innkeeper Bates's crypt of an inn at the Sepulcher, where the roof at least keeps the worgen out.",
  },

  greetings = {
    { id = "g_inn", text = "Come in out of the pines. There's a chair by the fire, and nothing in here bites, mostly." },
    { id = "g_home", when = { homeInn = { "The Sepulcher" } }, text = "Back to the crypt, are you? Your slab's made up, I mean your bed; it's habit." },
    { id = "g_xknight", when = { origin = "forsaken_risen_knight" }, text = "You've a knight's bearing, even now, and I can't think where else you'd have learned it. There's a chair by the fire, sir, and nobody here will ask what oath you swore." },
    { id = "g_away", when = { away = 14 }, text = "Back to the crypt after {away}, are you? Your slab's made up, I mean your bed, and the spiders kept to their side of the arrangement." },
    { id = "g_away_long", when = { away = 60 }, text = "You've been gone {away}, and I'd started to think the worgen had finally got you. Sit by the fire and tell me which howls you heard on the way in." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The deathguards say you've been doing good work around the Sepulcher. That earns you the slab nearest the fire, and I don't give that one to just anybody." },
    { id = "g_fl", when = { flirt = true, chance = 0.4, ["not"] = { npcFlagBefore = "bates_fl_no" } }, text = "Come in out of the pines, and well, aren't you a sight for sore eyes? Mine are sorer than most, having gone a little soft at the corners, but they still know a pleasant view." },
    { id = "g_fl_yes", when = { flirt = true, chance = 0.5, npcFlagBefore = "bates_fl_yes" }, text = "There you are! I've made up the slab by the fire, I mean the bed, and put a fresh fur on it, though not for any particular reason." },
    { id = "g_fl_no", when = { flirt = true, chance = 0.3, npcFlagBefore = "bates_fl_no" }, text = "Welcome back. A bed and a fire and no fuss from the innkeeper, just as you like it." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look grave-tired, and I'd know. Sit a while." },
  },

  start = "hello",
  nodes = {
    fl = {
      lines = { { id = "fl_default", text = "Was I? An old habit, from when I had a collar worth straightening and a face worth putting above it. It's been a long while since anyone this pleasant walked into my crypt, and I find I want to look my best, or at least my least decomposed." } },
      choices = {
        { text = "You look very well preserved, Bates.", next = "fl_yes", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "bates_fl_yes" }, clear = { "bates_fl_no" } } } },
        { text = "Can the Forsaken still feel that sort of thing?", next = "fl_feel" },
        { text = "We're both corpses, Bates. Does that make it easier?", next = "fl_dead", when = { race = "Scourge" } },
        { text = "That's kind, but I'm only here to rest.", next = "BACK", fx = { trait = { reserved = 1 }, npcFlag = { set = { "bates_fl_no" }, clear = { "bates_fl_yes" } } }, reply = "Of course, of course, and rest you shall. I'll stop fiddling with my collar and fetch you a blanket." },
        { text = "Don't trouble yourself, Bates. I'm not interested.", next = "BACK", fx = { trait = { stern = 1 }, npcFlag = { set = { "bates_fl_no", "bates_fl_rebuff" }, clear = { "bates_fl_yes" } } }, reply = "Ah, well, the spiders still think I'm handsome. Your bed's the east slab." },
      },
    },
    fl_feel = {
      lines = { { id = "flf_default", text = "We feel it after a fashion, the way you'd feel a song you only half remember. There's no warmth in it now, but there's a sort of pleasure in being glad to see someone, and I'm very glad to see you." } },
      choices = {
        { text = "I'm glad to see you too, Bates.", next = "fl_yes", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "bates_fl_yes" }, clear = { "bates_fl_no" } } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fl_dead = {
      lines = { { id = "fld_default", text = "Easier? It's a great deal less awkward, at least, since neither of us has to worry about blushing or breathing too hard. And I'll say this for unlife: you've worn it far better than I have." } },
      choices = {
        { text = "You've worn it well enough, Bates.", next = "fl_yes", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "bates_fl_yes" }, clear = { "bates_fl_no" } } } },
        { text = "Let's leave the dead to rest, Bates.", next = "BACK", fx = { trait = { reserved = 1 }, npcFlag = { set = { "bates_fl_no" }, clear = { "bates_fl_yes" } } }, reply = "Wise words in a crypt. Your slab's by the fire." },
      },
    },
    fl_yes = {
      lines = { { id = "fly_default", text = "Well preserved! That's the nicest thing anyone's said to me since I was buried. Come back some night when the worgen are quiet, and I'll sit by the fire with you and tell you about the dances in Pyrewood, back when I could still dance without anything falling off." } },
      choices = {
        { text = "I'd like to hear about Pyrewood, Bates.", next = "BACK", reply = "Then come back on a quiet night. They're rare out here, so I'll save one for you." },
        { text = "Something else.", next = "BACK" },
      },
    },
    op_tauren = {
      big = true,
      lines = {
        { id = "optr_default", text = "We get one now and again, come to see the dead with their own eyes and always terribly polite about the smell. I'd rather hear yours, friend, since it was the tauren who spoke for us before the Horde." },
      },
      choices = {
        { text = "Good people. They didn't have to stand up for us.", next = "op_tauren_r1", fx = { align = { honor = 1 }, opinion = { tauren = "respect" } } },
        { text = "They pity us. I'd rather be feared than pitied.", next = "op_tauren_r2", fx = { align = { honor = -1 }, trait = { proud = 1 }, opinion = { tauren = "resent" } } },
        { text = "We spoke for you because the Earth Mother wants balance.", next = "op_tauren_r3", fx = { affinity = 1, opinion = { tauren = "kin" } }, when = { race = "Tauren" } },
        { text = "I've no opinion on them, Bates.", next = "BACK" },
      },
    },
    op_tauren_r1 = {
      lines = { { id = "optr_r1", text = "That's how I see it too, and I keep the best chair for them when they come. It's a bit small, mind, but they never complain." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_tauren_r2 = {
      lines = { { id = "optr_r2", text = "Fear doesn't buy you a room for the night, friend, and pity sometimes does. Still, I'll not tell you what to want." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_tauren_r3 = {
      lines = { { id = "optr_r3", text = "Then thank her for me, will you? I've not got the knack of talking to mothers, earth or otherwise, since I died." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "They mind everything, but they mind the Light most of all, and I've an arrangement with them that I'd rather not break. Still, I sleep easier with a paladin under the roof, worgen being what they are, so I'll not complain too loudly." } },
      choices = {
        { text = "I'll keep it low and keep watch, Bates.", next = "BACK", reply = "Much obliged. The spiders and I have an understanding, and I'd hate to lose it.", fx = { align = { order = 1 } } },
        { text = "If the worgen come, the spiders can mind all they like.", next = "BACK", reply = "They'll mind it on your behalf, I'm sure. Just don't wake them before the worgen arrive.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Most of us have had our last rites already, and some had them twice. Still, a deathstalker came in last week asking for a prayer before he went to Shadowfang, and I didn't have one to give him. He didn't come back, so if you've a spare, I'll keep it for the next one." } },
      choices = {
        { text = "I'll leave a prayer here for them, Bates.", next = "BACK", reply = "I'll write it on the wall by the door, then, where the next one will see it on his way out.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers wouldn't have saved him. Better steel might.", next = "BACK", reply = "Better steel, maybe, but he had good steel, and it didn't help. The prayer, then.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Everyone's welcome who keeps the worgen out and pays for the slab. The Dark Lady's warlocks pass through on their way to deal with the Dalaran wizards at Ambermill, and they've always been perfectly polite guests, which I find a little unsettling." },
      },
      choices = {
        { text = "I'll be a polite guest too, Bates.", next = "BACK", reply = "The spiders appreciate it, and so do I. The last guest wasn't, and he's still picking webs out of his hair.", fx = { align = { order = 1 } } },
        { text = "I'll be whatever kind of guest I please.", next = "BACK", reply = "Then pay for the slab, and please yourself. Just keep it off the webs.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "o_hbmercy", tags = { "news" }, when = { gossip = { topic = "hillsbrad_war", stance = "mercy" } }, text = "The High Executor's been muttering that you've a soft spot for Hillsbrad's farmers. You'll not hear it from me, and you'll not hear it from him twice." },
        { id = "h_default", key = true,
          text = "I'm Bates, the innkeeper, though it's not much of an inn, being a crypt and all. But the roof keeps the worgen out, and that's what counts in Silverpine." },
        { id = "h_cobwebs", when = { metBefore = true }, text = "I swept the cobwebs out of the east crypt this morning, and the spiders were back by noon. We've come to an arrangement." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Hear the howling? That's worgen, out past the trees. Listen long enough and you can tell them apart, and I wish I couldn't." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, in my crypt! Sit down, and if your spirits want a chair as well, they'll have to share with the spiders." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, under my roof! You'll want somewhere soft to sleep, and I'm afraid all I've got are slabs, though I've thrown a fur over the east one." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Welcome to the slabs, I mean the beds; you'll find the crypt quiet, mostly, though the spiders hear every prayer said aloud." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. Your demon will have to share a slab with the spiders, I'm afraid, because the good slabs are taken." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin in my crypt! Don't mind the slabs, they're only beds now, and I'll ask you to keep the Light low after dark, because it sets the spiders off something awful." },
      },
      choices = {
        { text = "Do your guests ever ask for last rites, Bates?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Shall I calm the spirits of this crypt, Bates?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "The worgen must come to your door some nights, Bates.", next = "druid_q", when = { class = "DRUID" } },
        { text = "Want me to see off the worgen at your door, Bates?", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Can my beast sleep in here, Bates?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "I'd guess you get few living guests out here.", next = "living", when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "Anyone in your crypt worth watching, Bates?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Your crypt's cold, Bates. Want a fire?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "I doubt warlocks are welcome in your crypt, Bates.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do the spiders really mind the Light, Bates?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I cut timber in Silverpine, Bates, and drank in Pyrewood.", next = "xorig_woods", when = { origin = "forsaken_silverpine_woodsman" } },
        { text = "Why are you straightening your collar, Bates?", next = "fl", when = { flirt = true, ["not"] = { npcFlagBefore = "bates_fl_rebuff" } } },
        { text = "Just a rest, thanks.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Anything else? The fire's not going anywhere, and neither are the rest of us; we've already made our last journey once." },
      },
    },
    xorig_woods = {
      lines = {
        { id = "xwd_default", text = "Pyrewood! Then you'll have drunk at the same inn I did, back when the beer was warm and so were we. They're still there, you know, the Pyrewood folk, and every night they turn into something with teeth. Do you ever think about going back?" },
      },
      choices = {
        { text = "Never. I'd rather remember them as they were.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Sometimes. I'd like to know who's left.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Was the beer ever actually warm, Bates?", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    living = {
      lines = { { id = "lv_default", text = "One or two a season, and I keep a cask of water and some hard bread for them. You'd be surprised how much the living need: food, sleep, blankets. Exhausting, I'd imagine, but I do envy the bread." } },
      choices = {
        { text = "What do you make of the tauren, Bates?", next = "op_tauren" },
        { text = "The bread's not that good.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "Bless you for offering, but the roof's done that job well enough so far. If you're keen, the Deathguard on the road to Pyrewood would be glad of a warrior, and the worgen out there are a sight bolder than the ones who sniff at my door." } },
      choices = {
        { text = "Then I'll stand with the Deathguard on the road.", next = "BACK", reply = "Good. They'll be glad of you, and the roof will be glad of the rest.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll hunt the worgen alone, on my own terms.", next = "BACK", reply = "Your terms, then, but come back to the Sepulcher with your skin. The slabs are paid for.", fx = { align = { order = -1 } } },
      },
    },
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "Of course it can, since there's a slab in the east crypt going spare, and the spiders will learn to keep their distance. Just don't let it howl back at the worgen, because then they howl louder and nobody gets any rest." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "{pet} can have the east crypt, and the spiders will learn to keep their distance. Don't let it answer the worgen, though, because then they howl louder and nobody gets any rest." },
      },
      choices = {
        { text = "It'll keep quiet. You have my word.", next = "BACK", reply = "That's a relief. The spiders have opinions about howling.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If the worgen howl, it can howl right back.", next = "BACK", reply = "Then the spiders will howl back, and I'll get no sleep. Not that I sleep.", fx = { align = { honor = -1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Calm them? I've kept this inn the better part of a year and never heard a peep from anyone but the spiders. If there's somebody else about, I'd rather not know, so leave them be, and if they're happy, let them stay happy." } },
      choices = {
        { text = "Your crypt, your rules. I'll leave them be.", next = "BACK", reply = "I'm grateful. Quiet is the only thing in this crypt that isn't dead or eight-legged.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll see them on their way, whether you like it or not.", next = "BACK", reply = "Do it quietly, then, if you must. I'd rather not know.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "They sniff about at night and scratch at the stones, but the Sepulcher's walls are thick and they've never got in. I lie and listen to them howl and try to tell which ones were men once, and I wish I couldn't." } },
      choices = {
        { text = "Some of them may yet be saved, Bates. Keep hoping.", next = "BACK", reply = "Hope is cheap in a crypt, friend, but I'll keep a little. Thank you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Men or not, they're beasts now. Bar the door.", next = "BACK", reply = "The door's always barred, friend. It's the only thing that keeps the slabs warm.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Everyone in a crypt is worth watching, friend, and down here it's deathstalkers and spiders, in about equal measure. The deathstalkers drink on the left-hand slabs and the spiders keep to the right, and I'd keep to the middle if I were you." },
        { id = "xrogue_troll", when = { race = "Troll" }, text = "A troll among my slabs, and a quiet one at that. The left-hand side is driest, though the deathstalkers drink there and they'll watch you from it, so I'd keep to the middle if I were you." },
      },
      choices = {
        { text = "I'll keep to the middle and keep my peace.", next = "BACK", reply = "Wise. The middle is where the quiet folk sit.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll sit wherever I like, Bates.", next = "BACK", reply = "Sit wherever you like, but the spiders choose their own seats. Mind them.", fx = { align = { order = -1 } } },
        { text = "Do many living guests come out here?", next = "living" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "I'd like a fire very much, but the last mage who offered set the cobwebs alight, and the spiders haven't forgiven any of us. Warm your hands if you must, only keep the flame small and away from the ceiling." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "We can't feel the cold, you and I, so a fire down here is only for the look of the thing. I'd still like one for the look of the thing, if you're offering, and if you keep it off the webs." },
      },
      choices = {
        { text = "I'll keep it small and away from the webs.", next = "BACK", reply = "That would be grand. The last mage who stayed here singed half the ceiling.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Spiders burn, Bates. That's their problem.", next = "BACK", reply = "And mine, when they come down from the ceiling to discuss it. Small fires, please.", fx = { align = { order = -1 } } },
        { text = "Do many living guests come out here?", next = "living" },
      },
    },
  },

  topics = {
    forsaken = { { id = "tp_forsaken", text = "The Forsaken don't sleep, but they like a slab of their own to lie on, all the same. I keep them clean, and I keep the spiders out, mostly." } },
    shadowfang = { { id = "tp_shadowfang", text = "I can tell the worgen apart by their howls now, and the ones from Shadowfang Keep are the worst. They sound like they're laughing." } },
    scourge = { { id = "tp_scourge", text = "The Scourge comes knocking at the crypt door sometimes, and we answer with the Deathguard. My guests sleep through it, or they would, if they slept." } },
    _none = { { id = "tp_none", text = "I keep the fire. Ask the High Executor for the rest." } },
  },
}
