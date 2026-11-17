-- The Sepulcher: the Forsaken's crypt-fortress in Silverpine. Voice: bibles/silverpine.md
local P = RPGDialogueAPI:Pack("rpgd.silverpine")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "hadrec", id = TODO_NPC("High Executor Hadrec"), name = "High Executor Hadrec",
  bible = "bibles/silverpine.md", role = "soldier", tier = "major",
  communities = { "sepulcher" }, temper = { "iron" }, values = { "loyal", "dutiful" },
  notices = { "kit", "race" },
  impression = {
    first = "With enemies on three sides, High Executor Hadrec has no time to spare for a fourth. He lists the worgen, the Scourge, the gnolls and Dalaran's mages among them, and seems entirely undaunted by the list.",
    third = "{name} met High Executor Hadrec, who holds the Sepulcher and Silverpine Forest for the Dark Lady.",
  },

  greetings = {
    { id = "g_sepulcher", text = "Speak. The Sepulcher has enemies on three sides, and I have little time for the fourth." },
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
    xcl_sfk = {
      big = true,
      lines = { { id = "xcl_sfk_default", text = "Then the Sepulcher has one front fewer, and I'll gladly take it. Arugal was a mage of Dalaran who loosed those beasts on this forest and let them have the Baron's house, and I've never understood why a man who feared the Scourge so much would make something worse to fight it." } },
      choices = {
        { text = "Arugal was a fool, but he meant well, and that counts for something.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Meaning well counts for nothing. He deserved worse than he got.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "What became of the two deathstalkers you sent in?", next = "xcl_sfk2" },
      },
    },
    xcl_sfk2 = {
      lines = { { id = "xcl_sfk2_default", text = "Adamant came back thin and furious and asking for his blade, and he has it again, and that's enough said about Adamant. Vincent did not come back, and his name is cut into the crypt wall with the others the Sepulcher owes." } },
      choices = {
        { text = "Then I'll remember Vincent's name too.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Against the Scourge first, because your Light does more to them than any blade of ours, and against Arugal's worgen second. Dalaran's mages would find you curious, and I'd rather they didn't find you at all, so keep clear of their camp unless I send you." } },
      choices = {
        { text = "As you command, High Executor. The Scourge first.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll go where I'm needed most, wherever that leads.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "At the Sepulcher's door, mending the deathstalkers who limp in from the forest, until I need you somewhere worse. The worgen tear, the gnolls stab, and Dalaran's mages throw fire from behind their wall, so there's always someone to stitch. Do that well, and I'll find you harder work." } },
      choices = {
        { text = "I'll keep your deathstalkers on their feet.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll mend whom I choose, High Executor.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
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
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Good, because my deathstalkers come back in pieces, and I'd rather they came back in one." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Moonrage", min = 40 } }, text = "The Moonrage packs are fewer than they were, and my deathstalkers can walk the north road again without looking over their shoulders every step. You've done the Sepulcher real service." },
        { id = "h_cl_sfk", tags = { "news" }, when = { cleared = "Shadowfang Keep", faction = "Horde" },
          text = "Arugal is dead, and the howling from the keep has gone ragged and leaderless overnight. I sent two deathstalkers into those walls before you ever came to the Sepulcher, and I'm told you went in after them." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin of the Forsaken, at the Sepulcher. I have worgen, Scourge, gnolls and Dalaran's mages to fight, and a paladin who can stand against all four is worth more to me than a dozen Deathguard." },
      },
      choices = {
        { text = "Where can a priest serve the Sepulcher best, High Executor?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Where do you need the storm, High Executor?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Will you let me fight the worgen as a beast, High Executor?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What threatens the Sepulcher?", next = "threats" },
        { text = "Send me after your deathstalkers, High Executor.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Where's the line weakest? Put me there.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I know Dalaran's spells. I can read their work at Ambermill.", next = "mage", when = { class = "MAGE" } },
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
        { text = "Reports first. The mission matters more than the dead.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I'll bring the bodies too. They were ours.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
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
        { id = "ma_default", text = "Then Dalar will want you, though he'll talk your ear off first. Dalaran's mages at Ambermill are building something, and I don't care what it is so long as it doesn't work. Find out, and break it." },
        { id = "ma_dalaran", when = { origin = "forsaken_dalaran_apprentice" },
          text = "Dalaran-trained, and they'd know your face. Good; let them see you, and wonder how much of their work you can still read." },
      },
      choices = {
        { text = "Break it, and learn what I can first.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Break it, as ordered. Nothing more.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
      },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "A living hunter, in my forest. Worgen don't leave tracks like wolves; they walk upright when they think nobody's looking, so look for the prints that change halfway. My deathstalkers learned that the hard way." },
        { id = "hu_pet", when = { pet = { type = "Beast" } },
          text = "Keep {pet} close in these woods. The worgen hate a living beast's scent nearly as much as they hate ours, and they'll go for it first." },
      },
      choices = { { text = "Prints that change. I'll watch for them.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } } },
    },
    threats = {
      big = true,
      lines = {
        { id = "t_default", text = "The worgen of the south, Arugal's beasts, and the Scourge to the east, and Dalaran's mages poking about Ambermill. And the gnolls, who don't know when to stop." },
      },
      choices = { { text = "I'll help hold the line.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "South, over the Dead Fields, where the gnolls gather at night, and then wherever the worgen are thickest. Fenris Isle should burn well, so if your spirits have a taste for gnolls, send them across the water." } },
      choices = {
        { text = "Your orders, High Executor. Point the way.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My spirits choose their own battles.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "I'll let you fight them as anything you like, so long as you come back and report. My deathstalkers have mistaken their own shadows for worgen before, though, so let them see you change, or they'll put a bolt in you before you can explain." } },
      choices = {
        { text = "I'll report as ordered, and let your scouts know me.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll hunt alone and report when it suits me.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "One front would be a mercy, since I have four and too few Deathguard to hold any of them well. Send your demons at the Rot Hide gnolls, who are too stupid to be frightened of anything and will at least keep them busy." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "You'd have heard of the Cult in life, and perhaps more than heard, but the Dark Lady has given you a new master and a new purpose. Use your demons for her, and I'll not care where you learned to call them." },
        { id = "xwarlock_orc", when = { race = "Orc" }, text = "The Warchief sends orcs to help, and here is one who brought fel fire with him, which I didn't expect. Point it at the Rot Hides and I'll see your name in my report." },
      },
      choices = {
        { text = "The Rot Hides will burn, on your order.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll choose which front I hold, High Executor.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What threatens the Sepulcher most?", next = "threats" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Every deathstalker report in Silverpine ends on my desk. Ask what you need to know, and I'll tell you what they found." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "You'll get the short version, since I've no time for the long one with you." },
    },
    worgen = { { id = "tp_worgen", text = "Arugal's creatures, a Dalaran mage's mistake loose in my forest. I'd like the mage, too." } },
    _none = { { id = "tp_none", text = "Ask Allister; information is his business, not mine." } },
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
    { id = "g_lab", text = "Don't touch anything green, or anything that glows, or anything at all, really." },
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
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "It might, or it might improve it, and I've no way of knowing without testing, which is the real tragedy of working out here. If you ever feel inclined to lend a drop of holy power to the Society's recipe, I'd be very interested in the results." } },
      choices = {
        { text = "The Light stays out of your recipes, Apothecary.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Take what you need, if it hurts our enemies.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Both of us know exactly what a body can bear, and both of us push it past that point for a purpose. The difference is that my results can be bottled, labelled and carried to the Undercity, while yours depend on whoever happens to be listening. I prefer a method that doesn't rely on anybody's mood." } },
      choices = {
        { text = "Faith asks more of a healer than any recipe does.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "You're right. Results matter more than belief.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I need a guard on the shipments, since half of what comes down the road from Brill arrives broken or not at all. And the Rot Hide gnolls carry a sickness someone made deliberately, so if you cut one down, don't cut your own hand on the same blade." } },
      choices = {
        { text = "I'll guard the shipments. Your work serves the Dark Lady.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I came to fight gnolls, Apothecary, not carry crates.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Apothecary Renferrel, of the Royal Apothecary Society. Our work goes on here, far from the Undercity's eyes and nose." },
        { id = "h_delivery", when = { questActive = TODO_QUEST("Delivery to Silverpine Forest") },
          text = "Johaan's package, and intact, too. He'll be pleased, and I'm relieved." },
        { id = "h_recipe", tags = { "news" }, when = { questActive = TODO_QUEST("A Recipe For Death") },
          text = "A recipe for death, though not mine; I only improve on it. Bring me what it calls for." },
        { id = "h_rothide", when = { any = { { questActive = TODO_QUEST("Rot Hide Ichor") }, { questActive = TODO_QUEST("Rot Hide Origins") } } },
          text = "The Rot Hide gnolls carry a sickness, and I want to know where it came from, because someone made it." },
        { id = "h_thule", when = { questActive = TODO_QUEST("Thule Ravenclaw") },
          text = "The trail leads to a lich called Thule Ravenclaw. Bethor Iceshard in the Undercity knew him once, so tread carefully." },
        { id = "h_samples", when = { metBefore = true }, text = "The samples spoiled again in the damp. Silverpine rots everything, which is ideal for some studies and infuriating for others." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Don't call up any water spirits in here, because the damp is already ruining my samples." },
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
        { text = "What makes the Rot Hide sickness?", next = "rothide" },
        { text = "The Rot Hide sickness reminds me of the Cult's work.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "Could I coat my blades with any of this?", next = "rogue", when = { class = "ROGUE" } },
        { text = "A mage's eye might help with your recipe, Apothecary.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do you need a guard for your samples, Apothecary?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Would the Light spoil your work, Apothecary?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll gather what you need.", next = "END", fx = { affinity = 1 } },
      },
      again = {
        { id = "h_again", text = "Yes? And keep your hands at your sides." },
      },
    },
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "Could you? The Moonrage worgen interest me a great deal, and so do the spiders near Fenris Isle. Bring me what I ask for intact, and I'll think better of hunters forever." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} on a short leash while you gather, would you? A Moonrage sample is no use to me with tooth marks in it, and I've seen what a hungry beast does to a spider from Fenris Isle." },
      },
      choices = {
        { text = "I'll bring them back just as you need them.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll bring what's left after the fight.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    rothide = {
      lines = { { id = "rh_default", text = "That's what I mean to find out. It isn't natural to gnolls, it smells of the Scourge's cauldrons, and it's been made to spread. Somebody brewed it, and I want their notes." } },
      choices = { { text = "Then I'll find who brewed it.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } } },
    },
    warlock = {
      lines = {
        { id = "wl_default", text = "Does it? Then you've seen the Cult's work closer than I'd like to ask about. Yes, it's the same hand, or someone who learned from it. Tell me what else you recognize when you bring the ichor." },
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
        { text = "Then I'll ask, and we'll find whoever brewed it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Find it yourself. The spirits aren't your laboratory.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "To understand them, primarily, and to find what makes the curse spread. A curse that passes from one creature to another is very like a plague, druid, and the Society takes a professional interest in anything that spreads." } },
      choices = {
        { text = "Understanding a curse is the first step to ending it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Learn it, then turn it on our enemies.", next = "BACK", fx = { align = { light = -1 } } },
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
        { text = "It's your laboratory. I'll follow your method.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll do it my way, or not at all.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What makes the Rot Hide sickness?", next = "rothide" },
      },
    },
  },

  topics = {
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
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and nobody here has listened to a word I've said in all that time. Do sit down, I've a great deal saved up." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear you talked someone round to your view not long ago. I could have used that talent when I warned Dalaran, because they certainly never listened to me." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Someone here spoke well of you, which in the Sepulcher is practically a public honour. I'm pleased to hear it, and I'm not easily pleased." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. Then you'll understand how it galls me to watch Dalaran's fools stumble about in this forest, making the same mistakes twice." },
  },

  start = "hello",
  nodes = {
    xcl_sfk = {
      big = true,
      lines = { { id = "xcl_sfk_default", text = "Ah, you called me Archmage, how very kind. Arugal was the cleverest student of his year and the worst listener, and when the Scourge came he reached for the worgen because nobody would stop him, and nobody would stop him because the council was too busy arguing over whose fault the plague was." } },
      choices = {
        { text = "The council should have reined him in. That was their duty.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Nobody could have stopped him. Councils never stop anything.", next = "BACK", fx = { align = { order = -1 } } },
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
        { text = "Then let the Light and the arcane stand together now.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Grievances are useful. Keep yours sharp, Archmage.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "That the Light would protect the city, which it did not, and that I was too fond of dark predictions, which I was not. They prayed very beautifully while Kel'Thuzad's cult grew fat in the farmlands around them. I hope your faith listens better than theirs did, priest, because faith that doesn't listen is only noise." } },
      choices = {
        { text = "They failed, Dalar, not faith itself.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Faith is noise. You were right to scorn it.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
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
        { text = "Then I'll hunt them by day, as you advise.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll hunt them under the moon. That's the real test.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
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
        { text = "Can you explain what I do, Archmage?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What did the Kirin Tor get wrong about druids?", next = "druid_q", when = { class = "DRUID" } },
        { text = "The Sepulcher could use more steel and fewer spells, Dalar.", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "What did you warn them about?", next = "warned" },
        { text = "I studied magic too. What would you teach me?", next = "mage", when = { class = "MAGE", race = "Scourge" } },
        { text = "An orc mage, Archmage. Go on, laugh.", next = "orcmage", when = { race = "Orc", class = "MAGE" } },
        { text = "I deal with the Nether, Archmage. Spare me the lecture.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "Do mages ever trust rogues, Archmage?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
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
        { text = "Power should be studied first. Dalaran was right about that.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Power is for using. Caution is how Dalaran fell.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
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
        { text = "Small bargains, close exits. Understood.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Kel'Thuzad simply bargained badly.", next = "BACK", fx = { affinity = -2, align = { light = -1 } } },
      },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "Steel holds a line, I'll grant you, but it can't see through Arugal's illusions or burn a worgen pack at fifty paces. We need both of us, warrior, and that's the uncomfortable truth." } },
      choices = {
        { text = "Then we'll fight together, spell and steel.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I've never needed a mage to win a fight.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    warned = {
      big = true,
      lines = {
        { id = "w_default", text = "Many things, and Dalaran preferred not to hear any of them. I was there when Kel'Thuzad called the demon down; I'd have liked to be wrong." },
      },
      choices = { { text = "And now?", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Not in the least, and I find I don't mind, which surprises me. The arcane is a lock I picked and your elements are a door somebody opened for you, so I suppose the difference is courtesy, and I was never much good at that." } },
      choices = {
        { text = "Courtesy keeps the door open, Archmage.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A picked lock opens just the same.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "That you were simple, chiefly, and that nature magic was what a mage practised before he learned to read. Then Arugal called up his wolves and couldn't put them down again, and I'd wager no druid would have made that mistake." } },
      choices = {
        { text = "Nature's power demands humility. Arugal had none.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Arugal was weak. Power belongs to those who can hold it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Never, which is why Dalaran's wards were the finest in the world and also why they were always being tested. I'd have you look at Ambermill for me, since a thief who gets close to their wards would tell me more than my scrying ever has." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "In life you'd have been just the sort I warned the Kirin Tor about, a cutpurse lurking in the Violet Citadel's shadow. Now you're the only sort I'd trust to do the job they never let me do." },
      },
      choices = {
        { text = "I'll get close to their wards and report back.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll get close, and whatever I find is mine.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What did you warn them about?", next = "warned" },
      },
    },
  },

  topics = {
    worgen = { { id = "tp_worgen", text = "Arugal's mess, and a fool with power is the most dangerous creature in any forest." } },
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
        { text = "Keep them, then. I trust the Dark Lady's servants.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My name is my own. I'll guard it myself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "To see clearly, mostly, and to stop expecting the Light to love us again. The Shadow doesn't care whether you were a farmer or a bishop before you died; it gives strength to whoever has the will to hold it. A troll's loa might ask for gratitude, but the Shadow asks only that you never look away." } },
      choices = {
        { text = "Some of us still remember the Light. It isn't gone.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I won't look away. The Shadow suits me.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Very little, I'm afraid, because a watcher must go unnoticed and you could not go unnoticed in a fog. But someone has to deal with what my watchers find, and that, I suspect, is where you come in." } },
      choices = {
        { text = "Then show me what they find, and I'll deal with it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I find my own fights. I don't need your watchers.", next = "BACK", fx = { align = { order = -1 } } },
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
        { text = "I'll report honestly, Shadow Priest, and nothing more.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll report what serves me, Shadow Priest.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Shadow Priest Allister. I keep watchers in every corner of Lordaeron, and what moves in Silverpine, I learn of first." },
        { id = "h_border", tags = { "news" }, when = { questActive = TODO_QUEST("Border Crossings") },
          text = "Someone has been crossing into our lands who shouldn't be. Find out who, and what they carry." },
        { id = "h_ambermill", when = { questActive = TODO_QUEST("Ambermill Investigations") },
          text = "Dalaran's mages have taken an interest in Ambermill, and I'd like to know why before they finish whatever it is." },
        { id = "h_weaver", when = { questActive = TODO_QUEST("The Weaver") },
          text = "The Weaver is Dalaran's, and dangerous. Remove that problem, and quietly, if you can." },
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
        { text = "Do you ever stop listening, Shadow Priest?", next = "druid_q", when = { class = "DRUID" } },
        { text = "My spells could serve your watchers, Allister.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Demons make fine watchers, Allister.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What do your watchers say about paladins like me?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "What do you want me to learn?", next = "END", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "I'm good in the shadows. Make me one of your watchers.", next = "rogue", when = { class = "ROGUE" } },
        { text = "What use are warriors to your watchers, Shadow Priest?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
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
          text = "Hadrec has the deathstalkers, and I have the watchers, and they're not quite the same trade. His kill quietly; mine listen quietly. Try mine for a while." },
      },
      choices = {
        { text = "Only what happened. No opinions.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "My opinions are worth hearing too.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
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
        { text = "Before Hadrec, then. You'll hear it first.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Hadrec commands here. He hears it first.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Never, and it's a great comfort to me. A cat on a roof in Pyrewood hears more than any of my watchers, so if you'd care to spend a night up there, I'd make it worth your while." } },
      choices = {
        { text = "I'll watch Pyrewood for you, and report everything.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My eyes are my own. I'll share what I choose.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They could, and I'd like to know how far you can see, since my watchers tell me the Dalaran mages at Ambermill are scrying in our direction. A mage who can feel the edge of a scrying spell would be worth a dozen spies at a window." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "I know a few who studied in Dalaran and now study for us, and every one of them still flinches when the Violet Citadel is mentioned. You'll learn I don't judge loyalty by where it began." },
      },
      choices = {
        { text = "I'll serve the Dark Lady's watchers gladly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll share what I see when I choose to.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Is there something else you'd ask of me?", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "They make fine noise, which isn't the same thing, though I admit an imp in a chimney sees a great deal. Bring me what it overhears in Pyrewood, and I'll decide whether it was worth the scorch marks." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "I watched the Cult's people in the old days, and they all thought their demons and their dead made them invisible. They were wrong, so you'll forgive me if I watch you just as closely." },
      },
      choices = {
        { text = "Then I'll bring you only what's useful.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll keep what the imp hears until it suits me.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Is there something else you'd ask of me?", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "My watchers bring me a great deal, and some of it I'm even permitted to share. These, for instance, if you ask nicely." },
      { id = "tp_knows_warm", when = { disposition = { min = 65 } }, text = "You've been discreet, and I reward discretion, so I'll tell you rather more than I tell most." },
    },
    _none = { { id = "tp_none", text = "If I knew, I wouldn't tell you for free, and I don't know." } },
  },
}

P:NPC {
  key = "bates", id = TODO_NPC("Innkeeper Bates"), name = "Innkeeper Bates",
  bible = "bibles/silverpine.md", role = "innkeeper", tier = "service",
  communities = { "sepulcher" }, temper = { "hospitable" }, values = { "generous" },
  notices = { "weary" },
  impression = {
    first = "Innkeeper Bates runs an inn in a crypt and keeps calling the beds slabs out of habit. He has come to an arrangement with the spiders, and he can tell the worgen apart by their howls.",
    third = "{name} rested at Innkeeper Bates's crypt of an inn at the Sepulcher, where the roof at least keeps the worgen out.",
  },

  greetings = {
    { id = "g_inn", text = "Come in out of the pines. There's a chair by the fire and nothing out here that bites. Mostly." },
    { id = "g_home", when = { homeInn = { "The Sepulcher" } }, text = "Back to the crypt, are you? Your slab's made up, I mean your bed; it's habit." },
    { id = "g_xknight", when = { origin = "forsaken_risen_knight" }, text = "You've a knight's bearing, even now, and I can't think where else you'd have learned it. There's a chair by the fire, sir, and nobody here will ask what oath you swore." },
    { id = "g_away", when = { away = 14 }, text = "Back to the crypt after {away}, are you? Your slab's made up, I mean your bed, and the spiders kept to their side of the arrangement." },
    { id = "g_away_long", when = { away = 60 }, text = "You've been gone {away}, and I'd started to think the worgen had finally got you. Sit by the fire and tell me which howls you heard on the way in." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The deathguards say you've been doing good work around the Sepulcher. That earns you the slab nearest the fire, and I don't give that one to just anybody." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look grave-tired, and I'd know. Sit a while." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "They mind everything, but they mind the Light most of all, and I've an arrangement with them that I'd rather not break. Still, I sleep easier with a paladin under the roof, worgen being what they are, so I'll not complain too loudly." } },
      choices = {
        { text = "I'll keep it low and keep watch, Bates.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If the worgen come, the spiders can mind all they like.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Most of us have had our last rites already, and some had them twice. Still, a deathstalker came in last week asking for a prayer before he went to Shadowfang, and I didn't have one to give him. He didn't come back, so if you've a spare, I'll keep it for the next one." } },
      choices = {
        { text = "I'll leave a prayer here for them, Bates.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers wouldn't have saved him. Better steel might.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Everyone's welcome who keeps the worgen out and pays for the slab. The Dark Lady's warlocks pass through on their way to deal with the Dalaran wizards at Ambermill, and they've always been perfectly polite guests, which I find a little unsettling." },
      },
      choices = {
        { text = "I'll be a polite guest too, Bates.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll be whatever kind of guest I please.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
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
        { text = "Do the worgen ever come to your door, Bates?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Want me to see off the worgen at your door, Bates?", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Can my beast sleep in here, Bates?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Do you get many living guests out here?", next = "living", when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "Anyone in your crypt worth watching, Bates?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Your crypt's cold, Bates. Want a fire?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Are warlocks welcome in your crypt, Bates?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do the spiders really mind the Light, Bates?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Just a rest, thanks.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Anything else? The fire's not going anywhere." },
      },
    },
    living = {
      lines = { { id = "lv_default", text = "One or two a season, and I keep a cask of water and some hard bread for them. You'd be surprised how much the living need: food, sleep, blankets. Exhausting, I'd imagine, but I do envy the bread." } },
      choices = { { text = "The bread's not that good.", next = "BACK", fx = { affinity = 2 } } },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "Bless you for offering, but the roof's done that job well enough so far. If you're keen, the Deathguard on the road to Pyrewood would be glad of a warrior, and the worgen out there are a sight bolder than the ones who sniff at my door." } },
      choices = {
        { text = "Then I'll stand with the Deathguard on the road.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll hunt the worgen alone, on my own terms.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "Of course it can, since there's a slab in the east crypt going spare, and the spiders will learn to keep their distance. Just don't let it howl back at the worgen, because then they howl louder and nobody gets any rest." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "{pet} can have the east crypt, and the spiders will learn to keep their distance. Don't let it answer the worgen, though, because then they howl louder and nobody gets any rest." },
      },
      choices = {
        { text = "It'll keep quiet. You have my word.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If the worgen howl, it can howl right back.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Calm them? I've kept this inn the better part of a year and never heard a peep from anyone but the spiders. If there's somebody else about, I'd rather not know, so leave them be, and if they're happy, let them stay happy." } },
      choices = {
        { text = "Your crypt, your rules. I'll leave them be.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll see them on their way, whether you like it or not.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "They sniff about at night and scratch at the stones, but the Sepulcher's walls are thick and they've never got in. I lie and listen to them howl and try to tell which ones were men once, and I wish I couldn't." } },
      choices = {
        { text = "Some of them may yet be saved, Bates. Keep hoping.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Men or not, they're beasts now. Bar the door.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Everyone in a crypt is worth watching, friend, since half of them are deathstalkers and the other half are spiders. The deathstalkers drink on the left-hand slabs and the spiders keep to the right, and I'd keep to the middle if I were you." },
        { id = "xrogue_troll", when = { race = "Troll" }, text = "A troll among my slabs, and a quiet one at that. The left-hand side is driest, though the deathstalkers drink there and they'll watch you from it, so I'd keep to the middle if I were you." },
      },
      choices = {
        { text = "I'll keep to the middle and keep my peace.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll sit wherever I like, Bates.", next = "BACK", fx = { align = { order = -1 } } },
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
        { text = "I'll keep it small and away from the webs.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Spiders burn, Bates. That's their problem.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Do many living guests come out here?", next = "living" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I keep the fire. Ask the High Executor for the rest." } },
  },
}
