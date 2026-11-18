-- The Mage Quarter: the Wizard's Sanctum upstairs and the Slaughtered Lamb's cellar below.
-- Voices: bibles/mage_quarter.md (Jennea Cannon and Gakin the Darkbinder are in city.lua.)
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Maginor Dumas: the Sanctum's most renowned master, and its sternest warning.
P:NPC {
  key = "maginor", id = TODO_NPC("Maginor Dumas"), name = "Maginor Dumas", title = "Master Mage",
  bible = "bibles/mage_quarter.md", role = "trainer", tier = "quest",
  communities = { "stormwind" }, temper = { "steady" }, values = { "proud", "cautious" },
  notices = { "mage", "priest", "gnome" },
  impression = {
    first = "Maginor Dumas warned me that magic burns the untrained before he'd tell me anything else. He speaks like a man who has written books on the subject, and he has.",
    third = "{name} met Maginor Dumas, Master Mage of the Wizard's Sanctum and one of Stormwind's most renowned magi.",
  },

  greetings = {
    { id = "g_wary", text = "Well met, traveler. Be wary of magic; it burns the untrained." },
    { id = "g_mage", when = { class = "MAGE" }, text = "Greetings, mage. Shall we see what you've learned since last time?" },
    { id = "g_xylem", when = { questActive = TODO_QUEST("Magecraft") }, text = "Azshara is far, but Xylem is worth the journey. Mind his servant." },
  },

  notice = {
    { id = "n_mage", cat = "mage", when = { class = "MAGE", minLevel = 40 },
      text = "You've grown into your power, I see; it sits on you more easily than it did. Good. The ones who struggle with it are the ones I worry about least, and the ones who find it easy, most." },
    { id = "n_priest", cat = "priest", when = { class = "PRIEST" },
      text = "A priest in the Sanctum. Your Light and our arcane are cousins, I've always thought, both disciplines of the will, though your people would call that heresy and mine would call it sentiment." },
    { id = "n_gnome", cat = "gnome", when = { race = "Gnome", class = "MAGE" },
      text = "Gnomeregan trained some of the finest magi I ever corresponded with. I'm glad at least some of their students reached us." },
  },

  start = "hello",
  nodes = {
    xpt_maginor = {
      big = true,
      lines = { { id = "xpt_maginor_default", text = "That they will read every book you find before you can sell it, and that they will be right about the dangerous ones, so let them. A mage in a company can turn a whole fight, provided someone else is minding the door while they're thinking." } },
      choices = {
        { text = "Every tome we find should go to the Quarter.", next = "BACK", reply = "A sensible company, then. Bring them up the Sanctum stairs, and I'll see that the dangerous ones never reach a market stall.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "What we find, we sell. Scholars can bid like anyone.", next = "BACK", reply = "Then some scholar will bid on a book that ends him, and you'll have sold it. I'd ask you to think again.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xcl_sfk = {
      big = true,
      lines = { { id = "xcl_sfk_default", text = "They will, because a summoning outlives its summoner far more often than students like to believe. He meant to save Lordaeron from the Scourge, and he reached for something older and wilder than he understood, and there's the whole lesson of magic in one man's ruin." } },
      choices = {
        { text = "Then some powers should never be touched, Master Dumas.", next = "BACK", reply = "Some, yes, and I've spent forty years learning which ones. Kel'Thuzad never did.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "He failed for want of control, not because the power was wrong.", next = "BACK", reply = "Perhaps, but the power didn't care which. That's the lesson he died without learning.", fx = { align = { light = -1 } } },
        { text = "What drove Arugal mad?", next = "xcl_sfk2" },
      },
    },
    xcl_sfk2 = {
      lines = { { id = "xcl_sfk2_default", text = "Guilt, the scholars say, when the worgen turned on the very people he'd called them to save, and he took the beasts for his children rather than admit the mistake. I'd call it pride wearing grief's clothes, but I didn't know the man well enough to swear to it." } },
      choices = {
        { text = "Pride or grief, it ended the same way.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "All power is dangerous without discipline. The orcs taught us that, when their shamans turned warlock. I'd be watchful, dwarf, of your own path." } },
      choices = {
        { text = "Discipline keeps me honest, and I'll keep it close.", next = "BACK", reply = "Good. Keep it close, and you'll outlast most who wield what you do.", fx = { align = { order = 1 } } },
        { text = "Fear of power is no reason to refuse it.", next = "BACK", reply = "No, but fear is often the first sign of wisdom. I'd keep a little of it, dwarf.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I'd call them powerful beyond anything Dalaran ever dreamed, and power without restraint burns the world as well as the student. Your ancestors learned that lesson at a cost we can only read about, and I'd sooner learn it from books." } },
      choices = {
        { text = "Then keep your chains on the books, Master Dumas.", next = "BACK", reply = "They'll stay on, and gladly. Your ancestors taught us that lesson, though we were slow to learn it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Fear of power is its own trap. Knowledge should be free.", next = "BACK", reply = "Your ancestors said the same, and the sea swallowed their city. I'll keep the chains.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because a spell read by the wrong eyes is worse than a dagger in the wrong hand, and this city already has enough daggers. SI:7 understands that, and I'm told Master Shaw keeps a shelf of his own that nobody is allowed to read." } },
      choices = {
        { text = "Some knowledge should stay locked away. You're right to chain it.", next = "BACK", reply = "Thank you. It's an unpopular view in a tower full of students.", fx = { align = { order = 1 } } },
        { text = "Knowledge locked up only helps whoever holds the key.", next = "BACK", reply = "It helps whoever holds the key, and that's precisely why I hold it carefully.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Respect, not fear, and know when to close the distance before the spell is finished. The orc warlocks of the Second War were stopped by soldiers who learned to charge through the fire instead of fleeing it." } },
      choices = {
        { text = "I'll respect magic, and stand with those who wield it.", next = "BACK", reply = "Then you'll be welcome on any field where my students stand. They need people like you.", fx = { align = { order = 1 } } },
        { text = "Magic is just one more thing to cut down.", next = "BACK", reply = "Then make sure you cut it down before it finishes, because it won't wait for you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Rather a lot, and very little of it safe. The ley lines run under Elwynn and Duskwood both, and the beasts that live on them can grow strange, so the Sanctum keeps a close eye on reports from the woods." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} seems untouched by any of it, which is good. Keep it well away from the Sanctum's reagents, though, because it may not stay that way." },
      },
      choices = {
        { text = "I'll report anything strange in the woods to the Sanctum.", next = "BACK", reply = "Please do. The Sanctum would be grateful, and so would the people in those woods.", fx = { align = { order = 1 } } },
        { text = "What happens in the wild is no business of mages.", next = "BACK", reply = "Until the strange things walk out of the woods and into Goldshire. Then it becomes everyone's business.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "It must be, for I've seen priests who lost their discipline burn as badly as any careless mage. Power that is granted can be withdrawn, and power that is studied can be misused, and I am not certain which is the greater danger." } },
      choices = {
        { text = "Power given in faith is safer than power taken by study.", next = "BACK", reply = "Safer, perhaps, until it's withdrawn. I'd not stake my life on either alone.", fx = { align = { light = 1 } } },
        { text = "Studied power answers to the mind. That makes it safer.", next = "BACK", reply = "That's the Kirin Tor's answer, and I've watched it fail in Dalaran's own halls. Kel'Thuzad studied very carefully, too.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Respect it, certainly, for every power in this world asks a price of those who wield it. The paladins who frightened me were never the doubtful ones, only those who were sure the Light could never be wrong." } },
      choices = {
        { text = "A paladin follows the order's teaching, not his own certainty.", next = "BACK", reply = "A sound order and a humble knight, then. Uther would have liked you, I think.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A paladin must trust conscience above any teacher.", next = "BACK", reply = "Conscience, yes, if it's been tested. Certainty without testing is what frightened me.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_maginor", tags = { "news" }, when = { party = { class = "MAGE" } },
          text = "Your companion {companion} is one of ours, I see; I'd know those singed cuffs anywhere. Do keep them from setting anything alight in the Quarter, because the last time a visiting mage lost their temper here we spent a month replacing the gutters." },
        { id = "h_cl_sfk", tags = { "news" }, when = { cleared = "Shadowfang Keep" },
          text = "Arugal is dead, I hear, and you were the one standing over him in Silverpine. I knew his name from Dalaran long before I knew what he'd become, so I'll not be calling it a victory." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest in the Sanctum. You draw your power from without, and we from within, and I've always found the comparison instructive, if you'll indulge me." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Be careful with the fire you carry, {class}, for the Light burns the untrained as surely as any spell." },
        { id = "h_default", text = "Maginor Dumas, Master Mage of the Sanctum. My advice to you is this: as you travel the world, be wary of magic, for it will burn the untrained, and most of the world is untrained." },
        { id = "h_magecraft", key = true, tags = { "news" }, when = { questBefore = TODO_QUEST("Magecraft"), class = "MAGE" },
          text = "Archmage Xylem has been asking after mages of your experience, which is a compliment, though he'd never phrase it as one. He keeps a tower in Azshara, and he teaches what we here cannot." },
        { id = "h_magecraft_active", tags = { "news" }, when = { questActive = TODO_QUEST("Magecraft") },
          text = "Take the road where it forks at the ruins of Eldarath and go north to the cliffs. Xylem's servant, Sanath Lim-yo, will sneer at you and then send you up, and you'd do well to bear the sneer politely." },
        { id = "h_magecraft_done", when = { questDone = TODO_QUEST("Magecraft") },
          text = "So you've met Xylem. Brilliant, isn't he, and quite insufferable. I'd be grateful if you didn't tell him I said the first part." },
        { id = "h_human", when = { race = "Human" },
          text = "Stormwind's magi have stood on their own since Dalaran closed its gates to the world. The Sanctum is all the kingdom has now, and I intend it to be enough." },
        { id = "h_quarter", when = { origin = "human_mage_quarter" },
          text = "One of the Quarter's own apprentices, grown up and come back through the front door. Your old masters still mention Dalaran at every supper, I'm afraid; some habits outlive cities." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue in the Sanctum. You'll find our doors open and our books chained, and I'd ask you to remember the difference between the two." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior in the Sanctum. You'll be wary of magic, I hope, because the untrained always are, and the ones who aren't tend to burn." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You've spent your days in the wild, so you'll know the world is full of power, much of it untrained and most of it dangerous." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid in the Sanctum. Your people once had the greatest mages the world has known and then gave it all away, and I've never decided whether that was wisdom or fear." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "Magic burns the untrained, as I tell everyone. A shaman doesn't study the arcane, but I wonder whether the elements burn the careless too." },
      },
      again = {
        { id = "h_again", text = "Is there more? I have students waiting, but they can wait." },
        { id = "h_again2", text = "Go on. Questions are the beginning of every discipline." },
      },
      choices = {
        { text = "What do you mean, magic burns?", next = "burn" },
        { text = "I've heard of Archmage Xylem.", next = "xylem", when = { any = { { questActive = TODO_QUEST("Magecraft") }, { questDone = TODO_QUEST("Magecraft") }, { heardLine = "maginor.h_magecraft" } } } },
        { text = "Tell me about the Wizard's Sanctum.", next = "sanctum" },
        { text = "I'm not sure what a mage of my level should study.", next = "mage", when = { class = "MAGE" } },
        { text = "The Light seems a discipline much like yours.", next = "light", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "The Kirin Tor sent the High Order to Stormwind's mages.", next = "skyborne", when = { race = "Skyborne" } },
        { text = "Gnomeregan's mages need a new home, Master Dumas.", next = "gnome", when = { race = "Gnome", class = "MAGE" } },
        { text = "Does the Sanctum know what goes on under the Lamb?", next = "lamb", when = { class = "WARLOCK" } },
        { text = "Why chain the books, Master Dumas?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Should a warrior fear magic, Master Dumas?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Is there magic in the wild, Master Dumas?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Is faith a discipline like your magic, Master Dumas?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should a paladin fear the Light he carries, Master Dumas?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would you call my people's ancient mages reckless, Master Dumas?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Is shamanism dangerous, Master Dumas?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Arugal is dead, Master Dumas, but his worgen still prowl Silverpine.", next = "xcl_sfk", when = { cleared = "Shadowfang Keep" } },
        { text = "What should I know about travelling with a mage?", next = "xpt_maginor", when = { party = { class = "MAGE" } } },
        { text = "I was a student in Dalaran when it fell, Master Dumas.", next = "xorig_dalstray", when = { origin = "human_dalaran_stray" } },
        { text = "I'll be wary, Master Dumas.", next = "END" },
      },
    },
    xorig_dalstray = {
      lines = {
        { id = "xodalstray_default", text = "Then you've seen what I warn everyone of, and better than any book of mine could tell it. The Kirin Tor will take their students back when the dome comes down, I'm told, though I've stopped asking them when. Until then, would you study here, under a master who at least answers his letters?" },
      },
      choices = {
        { text = "I'd be glad to, Master Dumas.", next = "BACK", fx = { affinity = 2 } },
        { text = "I'll find my own way, without masters.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    burn = {
      lines = { { id = "b_default", text = "Precisely what I say. Magic is a current, and it runs through everything; I wrote a book on the flows of it, which three people have read. Draw on it without discipline and it draws on you, and I've buried students who didn't believe me." } },
      choices = {
        { text = "Then magic should be tightly controlled.", next = "burn_control", fx = { align = { order = 1 } } },
        { text = "Anyone should be free to learn it.", next = "burn_control", fx = { align = { order = -1 } } },
        { text = "What happened to them?", next = "burn_control" },
      },
    },
    burn_control = {
      lines = { { id = "bc_default", text = "Some went too far into fire and some too far into the arcane itself, and they hungered for it the way a drunkard hungers for drink. That's why the Sanctum keeps watch on its students, and why I keep watch on the cellar of the tavern across the way." } },
      choices = {
        { text = "The Slaughtered Lamb?", next = "burn_lamb" },
        { text = "Something else.", next = "BACK" },
      },
    },
    burn_lamb = {
      big = true,
      lines = { { id = "bl_default", text = "I say nothing about the Lamb that would hold up before the House of Nobles. I'll say only that what's taught down there is a shortcut, and shortcuts in magic always end somewhere you didn't mean to go." } },
      choices = {
        { text = "Then they should be shut down.", next = "BACK", reply = "Perhaps they should, and perhaps they will be one day. I'll not be the one to say it before the House.", fx = { align = { light = 1 } } },
        { text = "Every power has its use, Master Dumas.", next = "BACK", reply = "Every power has a use, and every shortcut a cost. Mind which you're paying for.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xylem = {
      lines = { { id = "x_default", text = "An archmage of great power who has made his home in a tower in Azshara, far from anyone who might ask him to share. He takes the occasional student, and the ones he sends back are worth ten of mine.",
        fx = { learn = { "xylem" } } } },
      choices = {
        { text = "Azshara seems a long way to go.", next = "xylem_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xylem_why = {
      lines = { { id = "xw_default", text = "The night elves' old ruins lie all over that coast, and the arcane is thick there, like dust in an attic. Xylem studies it, and keeps his own counsel about what he finds, which is what worries me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sanctum = {
      lines = { { id = "s_default", text = "The heart of magic in this kingdom, now that Dalaran keeps to itself. We teach, we study, and we advise the court when the court remembers to ask, which is less often than it should." } },
      choices = {
        { text = "Who teaches here?", next = "sanctum_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sanctum_who = {
      lines = { { id = "sw_default", text = "Jennea Cannon, who believes everyone's fundamentals have gaps, and is usually right. Elsharin, who has been teaching apprentices since before I was one, and Larimaine Purdue, who teaches portals and will tell you that you aren't clever enough for them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mage = {
      big = true,
      lines = { { id = "m_default", text = "Whatever frightens you most. A mage who studies only what comes easily becomes a very good candle, and the world doesn't need more candles; it needs people who can hold back a fire." } },
      choices = {
        { text = "Then I'll study what frightens me.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "I'd rather master one thing well.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    light = {
      lines = { { id = "l_default", text = "A discipline, yes, though of the heart rather than the mind. Yours asks you to believe and ours asks us to understand, and I've met very few people who could manage both at once." } },
      choices = {
        { text = "Faith needs no understanding.", next = "BACK", reply = "For some, perhaps, and I've met priests who prove it. I'll keep asking questions anyway.", fx = { align = { light = 1 } } },
        { text = "I'd trust understanding over belief.", next = "BACK", reply = "So would I, but I've seen understanding fail as often as belief. It's humbling.", fx = { align = { light = -1 }, trait = { skeptical = 1 } } },
      },
    },
    skyborne = {
      lines = { { id = "skyborne_l", text = "They told us to expect you, and very little else, which is how the Kirin Tor tell anyone anything. I'd welcome a conversation about what your people preserved, when you trust the Sanctum enough to have it." } },
      choices = {
        { text = "In time, Master Dumas.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "What do you most want to know?", next = "skyborne2" },
      },
    },
    skyborne2 = {
      lines = { { id = "skyborne2_l", text = "Whether your people lost as much as ours did, or whether you kept something we burned. Dalaran's libraries are ash and rubble the Kirin Tor are still sifting, and every scholar alive is hoping someone, somewhere, made copies." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnome = {
      lines = { { id = "gnome_l", text = "They have one; half my best apprentices this year came from Tinker Town, and they argue with me about everything, which I've decided is a compliment. Stay as long as you need." } },
      choices = {
        { text = "We'll go home when Gnomeregan is ours again.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Thank you, Master Dumas.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    lamb = {
      big = true,
      lines = { { id = "lamb_l", text = "The Sanctum knows, and the Sanctum does not go downstairs. I'd ask you to understand why a building full of Dalaran's survivors finds it hard to share a street with summoners." } },
      choices = {
        { text = "Dalaran fell to necromancy, not to us.", next = "BACK", reply = "No, not to you, and I don't pretend otherwise. But the road to necromancy began in a cellar.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "I understand. I'd keep my distance too.", next = "BACK", reply = "Thank you. It's not prejudice, only memory, and Dalaran's memory is long.", fx = { affinity = 1, align = { light = 1 } } },
      },
    },
  },

  topics = {
    dalaran = { { id = "tp_dalaran", text = "Dalaran is rebuilding behind its walls, and the Kirin Tor have yet to open its gates to the rest of us. I've written three books on the city's history, and I'd like to finish the fourth inside it." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor are the finest mages in the world, and they're very slow to forgive those who left. I stayed in Stormwind to teach, and they've not forgiven me, though they've not said so in writing." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad was one of the Kirin Tor's brightest, and he turned to necromancy when they wouldn't let him study it. Every mage I teach hears his name in the first lesson, because he's the warning that matters most." } },
    shadowfang = { { id = "tp_shadowfang", text = "Arugal summoned the worgen to fight the Scourge, and they turned on everyone, including him. I've told my students that story many times, and I'll tell it to you: magic burns the untrained, and sometimes the trained too." } },
    jaina = { { id = "tp_jaina", text = "Jaina Proudmoore was the most gifted student of her generation, and she proved it when she led her people across the sea. I envy her talent, and I don't envy her burdens at all." } },
    burning_legion = { { id = "tp_burning_legion", text = "The Burning Legion is the source of all fel magic, and the warlocks under the Lamb know it as well as I do. I'd have them closed down, but the Regent says it's better to know where they are." } },
    knows = {
      { id = "tp_knows", text = "The Sanctum hears from magi across the Alliance, and I read every letter, slowly. Ask, and I'll tell you what is known, and be honest about what is merely believed." },
    },
    background = { { id = "tp_bg", text = "I have studied the flows of magic all my life and written a book on them, which I recommend and nobody reads. That will do for a history." } },
    advice = { { id = "tp_ad", text = "Be wary of magic, for it burns the untrained. You may think you've heard that before; it bears repeating." } },
    xylem = { { id = "tp_xylem", text = "Archmage Xylem is a brilliant archmage in Azshara, and an insufferable one. Both are true, and both matter.", next = "xylem" } },
    _none = { { id = "tp_none", text = "That lies outside my study, I'm afraid. Try the Royal Library; Milton will be delighted to see you." } },
  },
}

-- Elsharin: a quel'dorei teacher of apprentices who stayed in Stormwind.
P:NPC {
  key = "elsharin", id = TODO_NPC("Elsharin"), name = "Elsharin", title = "Mage Trainer",
  bible = "bibles/mage_quarter.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "patient" }, values = { "proud", "patient" },
  notices = { "mage", "kaldorei" },
  impression = {
    first = "Elsharin is a high elf who teaches Stormwind's youngest mages, patiently, as if she has all the time in the world, which perhaps she does. She stayed when her homeland burned.",
    third = "{name} met Elsharin, a high elf who teaches apprentice mages in the Wizard's Sanctum.",
  },

  greetings = {
    { id = "g_well", text = "Welcome to the Mage Quarter. Touch nothing that hums, and you'll leave with your eyebrows." },
    { id = "g_mage", when = { class = "MAGE" }, text = "Greetings, mage. Shall I give you a little more insight today?" },
  },

  notice = {
    { id = "n_mage", cat = "mage", when = { class = "MAGE", maxLevel = 20 },
      text = "You're one of the new ones. I can tell by how tightly you hold your focus, as if the spell might run off; it won't, I promise you, if you loosen your grip a little." },
    { id = "n_kaldorei", cat = "kaldorei", when = { race = "NightElf" },
      text = "Ishnu-alah, if I have it right. Our peoples have a long and complicated history, kaldorei, and I suggest we both leave it at the door of the Sanctum." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Not as you are, no. We had our magisters and our Sunwell, and we lost much of both, so I would not dismiss any path that might heal." } },
      choices = {
        { text = "Every path that heals deserves respect, Elsharin.", next = "BACK", reply = "They do, and I'm glad to hear a {class} say it. Quel'Thalas could use more healing.", fx = { align = { light = 1 } } },
        { text = "Some paths lead nowhere. Choose with care.", next = "BACK", reply = "I've walked a few of those myself, to my cost. I'll be careful.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I doubt it, because your elders still remember why mine were sent away, and mine have never quite forgiven them. But Quel'Thalas burned and the Alliance took me in, so I've learned that old quarrels matter less than who stands beside you now." } },
      choices = {
        { text = "Old wounds should heal. I'd call you cousin gladly.", next = "BACK", reply = "Then cousin it is. It's a small thing, but small things are how old wounds close.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The exile was earned, Elsharin, and my elders were right.", next = "BACK", reply = "Perhaps it was. I'll not argue with ten thousand years, only with the cost.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Every spring, and every spring I let them, because a student who learns the city's alleys learns caution faster than any lesson of mine. They come back with cut purses and humbled pride, and then they listen." } },
      choices = {
        { text = "You should keep them in. The alleys aren't a classroom.", next = "BACK", reply = "Perhaps, but they'd find the alleys anyway. Better they learn while I'm still watching.", fx = { align = { order = 1 } } },
        { text = "Let them roam. The streets teach what books can't.", next = "BACK", reply = "They do, and some of my best students learned more in a week of alleys than a year of books.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "It saddens me more than it frightens me, because I've seen what that path did to others who were sure they were its master. My people learned that lesson once, long ago, and I'd spare you the price of learning it again." } },
      choices = {
        { text = "I'll walk carefully, then, and remember your warning.", next = "BACK", reply = "Good. That's more than most who walk your road ever say to me.", fx = { align = { light = 1 } } },
        { text = "Others failed because they were weak. I'm not.", next = "BACK", reply = "They all thought so, every one. I hope you're the first to be right.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The Farstriders, who guarded our forests for thousands of years, and they move with a patience your soldiers would find maddening. They wait in the trees for hours, and then a battle is over in a breath." } },
      choices = {
        { text = "Patience is a weapon too. I'll learn it.", next = "BACK", reply = "Good. The Farstriders would welcome you for it; we once waited three days in a tree for a single troll scout.", fx = { align = { order = 1 } } },
        { text = "Waiting is wasted time. Strike first and strike hard.", next = "BACK", reply = "Then you'd not have lasted a season with the Farstriders. The Amani waited out our patrols for years, and struck the night someone grew impatient.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Every day, and every night more so, because these human streets have no stars in them. The hunters of my people say the forest is a teacher and the beast a student, and I have come to think the same of magic." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Every day, and every night more so, because these human streets have no stars in them. Your {pet} has a kind look, though it is restless among all this stone. Take it out into Elwynn often; it will thank you for it." },
      },
      choices = {
        { text = "The wild should be guarded, like the Sentinels guard it.", next = "BACK", reply = "I'd not argue with the Sentinels on that, nor with anyone who's walked Eversong at night. A wood left unguarded fills up with trolls.", fx = { align = { light = 1 } } },
        { text = "The wild is a resource. It should be used.", next = "BACK", reply = "That's how my people saw the Sunwell, and you can see where it led us. I'd be careful.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "We did, to the Light as the humans taught us long ago, though many of my people put more faith in the Sunwell. Now the Sunwell is defiled and the prayers remain, and I've stopped trying to decide what that means." } },
      choices = {
        { text = "Faith outlasts every fountain of power. That's its strength.", next = "BACK", reply = "That's a comforting thought, and I'd like to believe it. Some days I do.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Faith survived because it asked nothing of you. Power did.", next = "BACK", reply = "That's harsh, and perhaps true. My people are still learning what power cost us.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Some of us do, the ones who stayed, though Quel'Thalas left the Alliance after that war and those still there have other griefs now. I stay because Stormwind's apprentices need a patient teacher, and because I owe the old promises more than my kin seem to." } },
      choices = {
        { text = "Old promises bind us still. I'm glad you keep them.", next = "BACK", reply = "Thank you. The promise is all I have left of the old Alliance, and I'll keep it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Your people chose to leave. You owe Stormwind nothing.", next = "BACK", reply = "Perhaps not, but I owe my own word something. I'll keep it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. In Quel'Thalas the priests of the Light served alongside our magisters, and I find I miss the sound of their prayers more than I expected." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Your order's founders fought beside my people's rangers in the Second War, and I have not forgotten it, though many of my kin have." },
        { id = "h_default", text = "I am Elsharin. I teach the apprentices of the Sanctum their first spells, and I try to teach them patience, which is harder. Humans are always in such a hurry." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "The fundamentals never stop mattering, whatever the more senior magi tell their students. Come back to me whenever a spell feels wrong in your hands, and we'll find out why." },
        { id = "h_human", when = { race = "Human" },
          text = "I've lived among your people for a long time now, and I've grown fond of the haste. Everything you build, you build as if you'd never get another chance." },
        { id = "h_quarter", when = { origin = "human_mage_quarter" },
          text = "One of the Quarter's own apprentices, come back to me. I remember you in the back row, listening to your masters talk about Dalaran and watching what they did rather than what they said, which was the wiser course." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You walk very quietly, and I notice it because my apprentices walk like a herd of goats. Do you need something from the Sanctum?" },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "I can feel the fel on you, faint as old smoke, and it troubles me. Even so, I'd rather talk to you than about you." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Your kind always arrives in such a rush, with your armour clanking and your hand on your sword, as if the room might attack." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Among my people, the rangers walked the woods of Eversong with hawks on their wrists, so I feel a little less far from home." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid of the kaldorei, in my classroom. Our peoples parted long ago, cousin, and I sometimes wonder what you see when you look at me." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. My people learned the arcane from careful study, and I confess spirits seem strange to me. But I have learned patience with strange things." },
      },
      again = {
        { id = "h_again", text = "Yes? There is no hurry." },
      },
      choices = {
        { text = "I'd like to train.", next = "BUSINESS", when = { class = "MAGE" } },
        { text = "You're a long way from Quel'Thalas.", next = "stay" },
        { text = "Your apprentices look like a handful.", next = "apprentices" },
        { text = "I'd welcome your advice on my practice, Elsharin.", next = "practise", when = { class = "MAGE" } },
        { text = "My people came from the Highborne too, long ago.", next = "skyborne", when = { race = "Skyborne" } },
        { text = "Why do you speak to a kaldorei so carefully?", next = "kaldorei", when = { race = "NightElf" } },
        { text = "Do you teach gnomes differently?", next = "gnome", when = { race = "Gnome", class = "MAGE" } },
        { text = "The other teachers here seem a clever lot.", next = "others" },
        { text = "I'd wager your apprentices try to sneak out sometimes.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Did Quel'Thalas have warriors of its own, Elsharin?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you miss the forests of Quel'Thalas, Elsharin?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Does my kind of magic frighten you, Elsharin?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Did your people pray in Quel'Thalas, Elsharin?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do the high elves still honour the Alliance, Elsharin?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Might our two peoples ever be one again, Elsharin?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Did Quel'Thalas know any shamans, Elsharin?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "My masters never stopped talking about Dalaran. Were they right to?", next = "xorig_mq", when = { origin = "human_mage_quarter" } },
        { text = "Farewell.", next = "END" },
      },
    },
    xorig_mq = {
      lines = {
        { id = "xmq_default", text = "Dalaran taught a great many good mages and a few disastrous ones, and the disastrous ones were usually the loudest about where they'd studied. Your masters were proud of the Violet Citadel, I think, because it let them forget how much they still had to learn." },
      },
      choices = {
        { text = "I learned more from their mistakes than their lectures.", next = "xorig_mq2", fx = { trait = { witty = 1 }, affinity = 1 } },
        { text = "They earned that pride. Dalaran made them.", next = "xorig_mq2", fx = { trait = { stern = 1 } } },
        { text = "You speak as if you've seen the place yourself.", next = "xorig_mq2", fx = { trait = { curious = 1 } } },
      },
    },
    xorig_mq2 = {
      lines = {
        { id = "xmq2_default", text = "I visited, long ago, and I found it beautiful and very sure of itself, which is a dangerous pairing in a city of mages. Learn from your masters' mistakes by all means, but don't tell them so; they'll only make new ones out of spite." },
      },
      choices = {
        { text = "I'll keep that between us.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Elsharin.", next = "BACK" },
      },
    },
    stay = {
      big = true,
      lines = { { id = "s_default", text = "Quel'Thalas burned when the Scourge came north, and the forests I knew are grey now. I was here, teaching, and I chose to keep teaching; there are those who say I should have gone home, and perhaps they're right." } },
      choices = {
        { text = "Your work here matters.", next = "stay_more", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Your people needed you more.", next = "stay_more", fx = { align = { honor = -1 } } },
        { text = "What's left there now?", next = "stay_more" },
      },
    },
    stay_more = {
      lines = { { id = "sm_default", text = "Fewer of my people than there were, and those who remain are angry and grieving. I hear very little from them, and I've learned not to ask the travellers too many questions." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    apprentices = {
      lines = { { id = "a_default", text = "Eager, clumsy and brave, as apprentices should be. One set his own sleeve alight last week and kept casting; I scolded him, and then I told him that was the right instinct, only aimed the wrong way." } },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "I'll leave you to them.", next = "END" },
      },
    },
    practise = {
      lines = { { id = "practise_l", text = "Stillness between spells. Your people rush from one casting to the next as if silence were wasted, and that's where the mistakes creep in. Breathe once, between, and you'll make half as many." } },
      choices = {
        { text = "In a fight there's no time to breathe.", next = "practise_fight" },
        { text = "I'll practise the breath.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
    practise_fight = {
      lines = { { id = "practise_fight_l", text = "There's always time for one breath, young one; there's never time for the mistake you'd make without it. That's the only lesson I've ever really taught." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    skyborne = {
      lines = { { id = "skyborne_l", text = "So the Kirin Tor say, and I've wondered, since I first heard of you, how much of our old learning you carried up into the sky. My people went east, yours went somewhere none of us ever thought to look." } },
      choices = {
        { text = "Perhaps we're distant cousins.", next = "skyborne_cousins" },
        { text = "We keep our own counsel on that.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    skyborne_cousins = {
      lines = { { id = "skyborne_cousins_l", text = "Perhaps, ten thousand years removed, which among elves is closer than it sounds. I won't claim kinship until we know more, but I'd like it, I think." } },
      choices = { { text = "So would I.", next = "BACK", fx = { affinity = 2 } } },
    },
    kaldorei = {
      big = true,
      lines = { { id = "kaldorei_l", text = "Because your people exiled mine, once, for loving magic too much, and mine have never quite forgiven it, nor quite admitted we deserved some of it. I'd rather be careful than repeat that argument in a human city." } },
      choices = {
        { text = "The exile was just. Magic nearly ended the world.", next = "BACK", reply = "It was, and I'll say so in front of my own people. We nearly did.", fx = { align = { order = 1 } } },
        { text = "It was long ago. We can let it go.", next = "BACK", reply = "That's generous, and I'll try. It's easier for those who don't live as long as we do.", fx = { affinity = 2, align = { order = -1 } } },
        { text = "Do you still love magic too much?", next = "kaldorei_love" },
      },
    },
    kaldorei_love = {
      lines = { { id = "kaldorei_love_l", text = "Very likely. Every quel'dorei does; it's the thing we're best at, and the thing that keeps nearly destroying us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnome = {
      lines = { { id = "gnome_l", text = "Only in that I let them argue more. Gnome apprentices want to know why a spell works before they'll cast it, which humans never do, and I find it refreshing, if exhausting." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    others = {
      lines = { { id = "others_l", text = "Jennea is brilliant and impatient, Maginor is brilliant and knows it, and Larimaine is brilliant at portals and nothing else. I am the patient one, which in this building makes me the odd one out." } },
      choices = {
        { text = "There's still the cellar under the Lamb.", next = "others_lamb" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_lamb = {
      lines = { { id = "others_lamb_l", text = "I've seen what demons did to Quel'Thalas's borders, long before the Scourge came. I don't go down those stairs, and I don't teach anyone who does." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    sylvanas = { { id = "tp_sylvanas", text = "Sylvanas Windrunner was the Ranger-General of Silvermoon, and she died defending our gates against the prince. Now she leads the dead, they tell me, and I can't decide whether to pray for her or for us." } },
    arthas = { { id = "tp_arthas", text = "Arthas Menethil marched on Quel'Thalas and broke our gates and our Sunwell, and I watched my homeland burn from a hill above the city. I stayed here to teach, because there was nothing left to go back to." } },
    scourge = { { id = "tp_scourge", text = "The Scourge took my homeland, and I've seen what's left of it, which is very little. I teach the young mages here so they'll be ready if the dead ever come south." } },
    dalaran = { { id = "tp_dalaran", text = "I studied in Dalaran for a century before the plague, and I loved its libraries more than my own home. They're rebuilding it now, and I'd go back if they'd let me, though I don't know what I'd find." } },
    forsaken = { { id = "tp_forsaken", text = "Some of my people are among the Forsaken now, raised by the Scourge and freed by Sylvanas. I don't know if I'd want to meet them, and I don't know if they'd want to meet me." } },
    knows = {
      { id = "tp_knows", text = "I've watched this city for longer than most of its citizens have been alive, and I listen more than I speak. Ask." },
    },
    background = { { id = "tp_bg", text = "A teacher of the quel'dorei who has stayed in Stormwind longer than she meant to. That is all, and it is enough." } },
    advice = { { id = "tp_ad", text = "Loosen your grip. Magic, swords, grief: everything is easier held a little less tightly." } },
    _none = { { id = "tp_none", text = "I don't know that one. It is pleasant, at my age, to still have things I don't know." } },
  },
}

-- Larimaine Purdue: portals, and very little patience for anyone who can't make one.
P:NPC {
  key = "larimaine", id = TODO_NPC("Larimaine Purdue"), name = "Larimaine Purdue", title = "Portal Trainer",
  bible = "bibles/mage_quarter.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "proud" }, values = { "proud" },
  notices = { "mage" },
  impression = {
    first = "Larimaine Purdue teaches portal magic and doubts that most people could grasp it. She said so to my face, politely enough, and seemed to think she'd done me a kindness.",
    third = "{name} met Larimaine Purdue, who teaches portal magic in the Wizard's Sanctum to the few she thinks capable of it.",
  },

  greetings = {
    { id = "g_doubt", text = "I don't believe you possess the acuity for portal magic, but do go on." },
    { id = "g_mage", when = { class = "MAGE" }, text = "A mage. Then perhaps we have something to discuss." },
  },

  notice = {
    { id = "n_mage", cat = "mage", when = { class = "MAGE", minLevel = 40 },
      text = "You're ready, I think, or nearly. A mage of your standing can open a door back to this very room from anywhere in the world, and I can teach you how, if you can follow." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "For most people, yes. It requires precision and patience, and I imagine your spirits have little use for either. I mean that kindly." } },
      choices = {
        { text = "Precision is a virtue. I'll not mock it.", next = "BACK", reply = "Thank you, and I mean that. Precision is all that keeps a portal from becoming a grave.", fx = { align = { order = 1 } } },
        { text = "Spirits aren't simple. You just haven't listened to one.", next = "BACK", reply = "Perhaps I haven't, and I'll admit it's a gap in my education. They're very loud in my experience.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "In principle, yes, once someone of sufficient skill anchors one there, though I doubt your elders would let a human mage carve a door into their tree. Until then you'll take the boat from Menethil like everyone else." } },
      choices = {
        { text = "My elders are right. Some places should stay hard to reach.", next = "BACK", reply = "I respect it, truly, though I'll admit I find it professionally frustrating.", fx = { align = { order = 1 } } },
        { text = "They should allow it. Distance only keeps allies strangers.", next = "BACK", reply = "My thinking exactly, though I suspect your elders will need more convincing than you do.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Only by bribing a mage to open one, and the Sanctum would hear of it within the hour. We keep a record of every portal opened from this tower, and I keep it personally." } },
      choices = {
        { text = "Good. A portal is too dangerous to leave unrecorded.", next = "BACK", reply = "Exactly. Every door in this tower has a ledger, and every ledger has my name on it.", fx = { align = { order = 1 } } },
        { text = "Every record has a gap, if someone looks hard enough.", next = "BACK", reply = "Possibly, but finding it would be very foolish. I'd advise you not to look.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They're entirely different, and the difference matters. A portal folds this world onto itself, while your circles open a door to somewhere else entirely and invite whatever waits on the other side to step through." } },
      choices = {
        { text = "You're right. I'll treat every door I open as a danger.", next = "BACK", reply = "That's the right instinct. Most of my students take years to learn it.", fx = { align = { light = 1 } } },
        { text = "Whatever comes through my door answers to me.", next = "BACK", reply = "Then you'd better be right, because it won't answer to anyone else.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Twice, during the war, and both times they came out the other side sick as a dog and ready to fight. I'll say this for you: your sort don't panic when the world folds, because you're used to things hitting you." } },
      choices = {
        { text = "We go where we're needed, however we get there.", next = "BACK", reply = "That's a soldier's answer, and I respect it, though I'd still bring a bucket.", fx = { align = { order = 1 } } },
        { text = "I'll walk, thank you. Portals are for mages.", next = "BACK", reply = "Suit yourself. The road's longer, but it never loses an apprentice.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "It confuses them terribly, because they smell one place and then suddenly another, without any of the road between. I've seen a hound come through a portal from Theramore and sit down and refuse to move for an hour." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "It confuses them terribly, because they smell one place and then suddenly another, without any of the road between. Your {pet} would hate it, I'm sure. Walk it, or fly it, and spare it the experience." },
      },
      choices = {
        { text = "I'll spare my pet the discomfort and take the road.", next = "BACK", reply = "That's kind of you, and wise. The road's slower, but your pet will thank you.", fx = { align = { light = 1 } } },
        { text = "My pet will get used to it. It has to.", next = "BACK", reply = "It will, in time, though I'd prefer you didn't experiment on it in my tower.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Lost is a strong word, though there was an apprentice who arrived in Ironforge some hours after he left, and he never quite explained where he'd been. I'd prefer the Cathedral didn't hear about it, if you don't mind." } },
      choices = {
        { text = "That should be reported, Larimaine. People must know the risks.", next = "BACK", reply = "It was reported, in very small writing. I'd thank you not to read it aloud.", fx = { align = { order = 1 } } },
        { text = "Your secret's safe. The Cathedral needn't hear everything.", next = "BACK", reply = "Thank you. The Cathedral has quite enough opinions about my tower already.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Not with my own life, but with yours, possibly, and they do need someone to practise on. Most arrive in one piece, and the ones who don't are usually missing something they won't miss." } },
      choices = {
        { text = "Then I'll wait for a master. Rules exist for good reasons.", next = "BACK", reply = "A wise choice, and a rare one. I'll find you a master who won't lose you.", fx = { align = { order = 1 } } },
        { text = "I'll risk it. Someone has to help them learn.", next = "BACK", reply = "Then you're braver than I'd be, and I'll make sure they practise slowly.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, here for portals? No, I suppose you're here about someone who stepped through one badly, which happens more often than the Sanctum likes to admit." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. I'm afraid I can't teach you to fold the world, {class}, but if you're ever in a hurry to reach Ironforge, I could find you a student who's practising." },
        { id = "h_default", text = "Larimaine Purdue. I teach the conjuring of portals, which is to say I teach a select few mages how to fold the world in half and step across the crease. I don't believe you're one of them." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "As a mage, you belong to a select group that can conjure a portal back to this very place. I'll teach you when you're ready, and I'll tell you to your face if you aren't." },
        { id = "h_quarter", when = { origin = "human_mage_quarter" },
          text = "Ah, one of the Quarter's apprentices. Your masters used to send you up here with notes for me, and you always read them on the stairs, didn't you? I could tell by the creases." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue, and so not a portal mage, whatever you may hope. I'll answer you briefly, if you'll keep your fingers off the focusing stones." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock in a portal mage's tower. I'll be civil, but I'll be watching what you do with your hands." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You don't need a portal; you need a road and a pair of good boots, and I suspect you already have both." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, and I suppose you'd like to know whether your beast can come through a portal. It can, but it won't like it." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, which means you'll have walked or swum here, I suppose. Your people do seem to prefer the long way round to everything." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I doubt you'd grasp portal theory, but then I doubt you'd want to. Spirits must be terribly simple by comparison." },
      },
      again = {
        { id = "h_again", text = "Something further? Concisely, please." },
      },
      choices = {
        { text = "Teach me.", next = "BUSINESS", when = { class = "MAGE", minLevel = 40 } },
        { text = "A portal must be a difficult thing to hold open.", next = "how" },
        { text = "Why so sure I couldn't learn it?", next = "acuity" },
        { text = "Could a thief ever make use of your portals?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Have you ever sent warriors through a portal, Larimaine?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "A portal must frighten an animal, Larimaine.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Surely your portals and my summonings aren't so different?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Has anyone ever been lost in a portal, Larimaine?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would you trust a student's portal yourself, Larimaine?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Could your portals ever reach Darnassus, Larimaine?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Is portal magic truly so difficult, Larimaine?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good day.", next = "END" },
      },
    },
    how = {
      lines = { { id = "hw_default", text = "You anchor one end to a place you know intimately, open the other where you stand, and hold both in your mind at once without letting either slip. Most people can't hold one thought steadily, let alone two places." } },
      choices = {
        { text = "What if it slips?", next = "how_slip" },
        { text = "Something else.", next = "BACK" },
      },
    },
    how_slip = {
      lines = { { id = "hs_default", text = "Then you arrive somewhere else, or partly somewhere else, and I don't teach that part because nobody has ever come back to describe it, and so I'm very particular about my students." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    acuity = {
      big = true,
      lines = { { id = "a_default", text = "Because portal magic doesn't forgive, and I would sooner offend you than bury you. If that sounds arrogant, consider that I've never yet lost a student between here and Ironforge." } },
      choices = {
        { text = "Fair. Better proud than careless.", next = "BACK", reply = "Exactly. Arrogance I can live with, but carelessness buries people.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Gatekeepers like you hold the world back.", next = "BACK", reply = "Perhaps I do, but every one of my students is alive. I'll take that bargain.", fx = { affinity = -1, align = { order = -1 } } },
      },
    },
  },

  topics = {
    dalaran = { { id = "tp_dalaran", text = "The Kirin Tor are rebuilding Dalaran, and portal magic was one of its great arts. I learned mine from a master there, and I doubt anyone in Stormwind could follow half of what he taught me." } },
    kirin_tor = { { id = "tp_kirin_tor", text = "The Kirin Tor understood portal magic as no one else does, and they've kept their best secrets very close. I don't blame them, because most people would open a portal into a wall." } },
    jaina = { { id = "tp_jaina", text = "Jaina Proudmoore is said to be the finest teleporter of her age, and I'd like to see her work before I believe it. I'm told she moved a whole people across the sea, which is either brilliant or reckless, and possibly both." } },
    theramore = { { id = "tp_theramore", text = "Theramore is very far away, and a portal to it would take more power than most mages could manage. Lady Proudmoore manages it, they say, and I'd like to know how." } },
    knows = {
      { id = "tp_knows", text = "I know where every portal in the Alliance opens and who opened it last. Ask, if you think you'll follow the answer." },
    },
    background = { { id = "tp_bg", text = "I teach portals, and I'm very good at it, which is the only part of my history that should concern you." } },
    advice = { { id = "tp_ad", text = "Know one place so well you could find it with your eyes shut. Everyone should have that, mage or not." } },
    _none = { { id = "tp_none", text = "That's not my field, and I don't pretend to fields that aren't mine." } },
  },
}

-- Zardeth of the Black Claw: the Slaughtered Lamb's patient problem-solver.
P:NPC {
  key = "zardeth", id = TODO_NPC("Zardeth of the Black Claw"), name = "Zardeth of the Black Claw",
  bible = "bibles/mage_quarter.md", role = "questgiver", tier = "quest",
  communities = { "stormwind" }, temper = { "calm" }, values = { "proud", "practical" },
  notices = { "warlock", "priest" },
  impression = {
    first = "Zardeth of the Black Claw has excellent manners and speaks of keeping a lord preoccupied in a way that made the cellar feel colder. Whatever the Lamb's coven needs done quietly, I suspect he is the one who does it.",
    third = "{name} met Zardeth of the Black Claw, who keeps the Slaughtered Lamb's coven safe from prying lords.",
  },

  greetings = {
    { id = "g_cellar", text = "Welcome to our little establishment. Do mind the stairs." },
    { id = "g_brew", when = { questActive = TODO_QUEST("A Noble Brew") }, text = "Have you found my ingredients? Wishock grows louder by the day." },
  },

  notice = {
    { id = "n_warlock", cat = "warlock", when = { class = "WARLOCK" },
      text = "One of our own, and a promising one, I hear. The cellar protects its own, you'll find, and it's always grateful to those who help protect the cellar." },
    { id = "n_priest", cat = "priest", when = { class = "PRIEST" },
      text = "A priest, in my cellar. How refreshing; the last one who came down those stairs left very quickly and prayed very loudly on the way up." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They did, my friend, because power seeks power, and the spirits are slow and fussy while demons are quick. I merely note what history shows." } },
      choices = {
        { text = "I'll keep to slow and honest power, thank you.", next = "BACK", reply = "Then you'll live longer and achieve less. I'll not say which I'd choose.", fx = { align = { order = 1 } } },
        { text = "History favours the bold. I'll remember that.", next = "BACK", reply = "Bold, yes, and the bold also fill most of the footnotes about explosions. Remember that part too, my friend.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They wilt, as most things do when they're far from the sun and close to something hungry. I'd not take it personally, druid, because the cellar has never been fond of anything that grows." } },
      choices = {
        { text = "The Crown should seal this cellar for good.", next = "BACK", reply = "It's tried, more than once, and the cellar always finds a new door. Sealing it would only scatter us.", fx = { align = { order = 1 } } },
        { text = "Your cellar, your darkness. I won't meddle in it.", next = "BACK", reply = "A sensible view, druid. Your plants may never forgive me, but you might.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Of course they do, and we let them, because there's nothing in our ledgers that Shaw hasn't read already. He knows exactly what we are, and he's decided we're worth more to him alive and indoors." } },
      choices = {
        { text = "Then I'll keep the watch honest and report what I see.", next = "BACK", reply = "By all means, report what you see. Shaw already knows most of it.", fx = { align = { order = 1 } } },
        { text = "Then I'll keep your secrets, Zardeth, if the price is right.", next = "BACK", reply = "Prices are always right, my friend, if you ask the right man. I'll keep that in mind.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because he'd rather know where we are than wonder, and because he's a sensible man under all that disapproval. The Sanctum and the cellar are two floors of the same house, my friend, and both of us know it, even if he'll never say so." } },
      choices = {
        { text = "The Sanctum should have shut you down long ago.", next = "BACK", reply = "Perhaps they should have, but Dumas is wiser than you think. He'd rather have a floor between us than a war.", fx = { align = { light = 1 } } },
        { text = "Better you down here than scattered and hidden. That's sense.", next = "BACK", reply = "Exactly. You understand the arrangement better than most of the Sanctum.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Nothing at all, and that's rather the point. My colleagues prefer their guests quiet and their soldiers absent, and I prefer that nobody causes a scene I'll have to tidy up." } },
      choices = {
        { text = "I'll keep the peace while I'm here.", next = "BACK", reply = "Good. That's all the cellar ever asks of its guests.", fx = { align = { order = 1 } } },
        { text = "If I find something rotten down here, I'll make a scene.", next = "BACK", reply = "Then I'll be watching very closely, warrior, and so will the things in the corners.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Sulphur, old blood and a little fear, I'd imagine; the cellar's work leaves traces. A beast's nose is the one thing my wards can't silence, which is why I don't care for them at all." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Sulphur, old blood and a little fear, I'd imagine; the cellar's work leaves traces. Keep {pet} on a short leash, if you please. The last animal that came down here wandered into a circle and came out rather less of an animal." },
      },
      choices = {
        { text = "If something's wrong down here, I'll find out.", next = "BACK", reply = "You may find it, and you may wish you hadn't. Be careful what your beast sniffs.", fx = { align = { light = 1 } } },
        { text = "Your business is your own. I'll leave it alone.", next = "BACK", reply = "A sensible hunter. Your beast will thank you for it too.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The crown's tolerance, Master Dumas's discretion, and the simple fact that you don't know which of us to arrest first. You'd make a terrible racket and find a great many locked doors, and the people you came to save would read about it in Wishock's speech." } },
      choices = {
        { text = "Then I'll wait for the law and come back with its warrant.", next = "BACK", reply = "Then you'll wait a very long time, paladin, and we'll still be here when you come.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Locked doors have never stopped the Light before.", next = "BACK", reply = "No, they haven't, and they rarely needed to. The doors open from our side too.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, down here. How very bold, and how very unwise, though I'll be civil if you will." },
        { id = "h_default", text = "Zardeth, of the Black Claw. I attend to the cellar's more delicate affairs, so that my colleagues may attend to their studies undisturbed. You'd be surprised how often studies are disturbed." },
        { id = "h_brew_before", key = true, tags = { "news" }, when = { questBefore = TODO_QUEST("A Noble Brew"), minLevel = 30 },
          text = "Lord Wishock is causing quite a stir in the House of Nobles. He's learned of our little establishment and wants a full inquiry, and I have a plan to keep him preoccupied, if you'd care to help." },
        { id = "h_brew_active", tags = { "news" }, when = { questActive = TODO_QUEST("A Noble Brew") },
          text = "A small white flower called the Tear of Tilloa grows in the garden of Stalvan, outside Darkshire, and a Musquash Root grows at the foot of the falls below the Stonewrought Dam. Bring me both, and I'll brew his lordship something memorable." },
        { id = "h_brew_done", when = { questDone = TODO_QUEST("A Noble Brew") },
          text = "The House has gone remarkably quiet on the subject of taverns. We're very grateful, you and I, and we'll leave it at that." },
        { id = "h_human", when = { race = "Human" },
          text = "Stormwind likes to think its magic all lives upstairs in the Sanctum. The city has always had a cellar, my friend; it's simply learned not to look." },
        { id = "h_lamb", when = { origin = "human_lamb_cellar" },
          text = "Our little visitor, grown up. I remember the first night you came down those stairs out of curiosity, and I remember thinking you'd never come back, and then you came back the next night, and the next." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue, and one who found the stairs. Shaw's people come down here now and again to count us, and they always leave having counted wrong." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage from upstairs, slumming in the cellar. The Sanctum sends someone down to disapprove of us every few months, and I've grown rather fond of the visits." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, in the cellar. How unexpected. Do keep your hands away from the circles; they're more delicate than they look, and so, I suspect, are you." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Your beast is sniffing the air, I notice. It smells what I'd rather it didn't." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, on the Lamb's stairs. How refreshing, though I'd ask you not to bring any of your saplings down here, because they never last long." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. How charming. The orcs had shamans too, before they found better teachers. Perhaps you'll find your way here one day." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've all evening." },
        { id = "h_again2", text = "Go on. Discretion is my favourite subject." },
      },
      choices = {
        { text = "What do you want with Wishock?", next = "wishock", when = { any = { { questActive = TODO_QUEST("A Noble Brew") }, { questDone = TODO_QUEST("A Noble Brew") }, { heardLine = "zardeth.h_brew_before" }, { heardLine = "gakin.ln_default" } } } },
        { text = "This place doesn't feel like part of the Mage Quarter.", next = "cellar" },
        { text = "That brew smells like more than ale, Zardeth.", next = "brew", when = { questActive = TODO_QUEST("A Noble Brew") } },
        { text = "I know what you are. The Light will find you.", next = "priest", when = { class = "PRIEST" } },
        { text = "I'm one of the cellar's own, and I'm at your service.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "Does SI:7 watch the Lamb's cellar?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why does Master Dumas tolerate you down here?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What would the Black Claw want with a warrior?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "My pet smells something down here, Zardeth.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What keeps me from turning this cellar out, Zardeth?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What becomes of the green things that come down here, Zardeth?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Did the orcs truly turn from shamans to warlocks, Zardeth?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Why did you let me keep coming down the stairs, Zardeth?", next = "xorig_lamb", when = { origin = "human_lamb_cellar" } },
        { text = "I'll be going.", next = "END" },
      },
    },
    xorig_lamb = {
      lines = {
        { id = "xlb_default", text = "Because nobody upstairs would have asked you a single interesting question, and curiosity left unfed goes looking for worse kitchens than ours. Tell me, now that you've seen what's beyond the circles, do you regret the stairs?" },
      },
      choices = {
        { text = "No. Power is power, and I'd take it again.", next = "xorig_lamb2", fx = { align = { light = -1 }, trait = { curious = 1 } } },
        { text = "Some nights. I keep a careful eye on what I've learned.", next = "xorig_lamb2", fx = { align = { light = 1 }, trait = { cautious = 1 } } },
        { text = "I'd rather not answer that down here.", next = "xorig_lamb2" },
      },
    },
    xorig_lamb2 = {
      lines = {
        { id = "xlb2_default", text = "A fine answer either way, and I'd distrust anyone who gave me a simpler one. Keep coming back down when the city upstairs bores you, because it will, and the cellar remembers its own." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Goodnight, Zardeth.", next = "END" },
      },
    },
    wishock = {
      lines = { { id = "w_default", text = "Only quiet. His lordship drank here on credit for a year, wandered where he shouldn't, and now he wants the House to send soldiers down our stairs. It would be very inconvenient for everyone, including the soldiers." } },
      choices = {
        { text = "He has a point about this place.", next = "wishock_point" },
        { text = "A drunk lord isn't worth worrying about.", next = "wishock_point" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wishock_point = {
      big = true,
      lines = { { id = "wp_default", text = "Perhaps he does. But a man who'd drink a tavern dry on credit and then call for it to be burned isn't acting from principle, and I don't see why his hypocrisy should cost us our home. Do you?" } },
      choices = {
        { text = "Hypocrite or not, he's right about you.", next = "BACK", reply = "Perhaps he is, but right and drunk are a poor combination in the House of Nobles.", fx = { affinity = -2, align = { light = 1 } } },
        { text = "No. Let him learn some manners.", next = "BACK", reply = "Exactly. A little humility would do his lordship good.", fx = { affinity = 2, align = { light = -1 } } },
      },
    },
    cellar = {
      lines = { { id = "c_default", text = "A place of study for those whose studies the Sanctum finds distasteful. Gakin, Ursula and the others teach; Spackle keeps the books on demons; I keep the peace with the people upstairs." } },
      choices = {
        { text = "And the people upstairs know?", next = "cellar_know" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cellar_know = {
      lines = { { id = "ck_default", text = "They know and they don't, which is the way Stormwind prefers most of its truths. The Sanctum gets to feel superior, the guard gets a quiet street, and we get left alone. Everyone's content until a lord comes looking for the privy." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brew = {
      lines = { { id = "b_default", text = "A stout, a rather special one, with a flower from a dead man's garden and a root from the bottom of a waterfall. His lordship has a weakness for a good drink, and I'd hate for him to go without." } },
      choices = {
        { text = "You're going to kill him.", next = "brew_kill" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brew_kill = {
      big = true,
      lines = { { id = "bk_default", text = "I'm going to keep him preoccupied, which is what I said. What becomes of him after that is between his lordship and his appetite. You're still carrying my ingredients, I notice." } },
      choices = {
        { text = "I won't be part of murder.", next = "END", reply = "Then walk away, and forget you ever heard me. The cellar has a long memory for those who talk.", fx = { affinity = -3, align = { honor = 1 } } },
        { text = "His appetite, his problem.", next = "BACK", reply = "Exactly so. His lordship's appetite has always been his own worst enemy.", fx = { affinity = 1, align = { honor = -1 }, trait = { cruel = 1 } } },
      },
    },
    priest = {
      lines = { { id = "p_default", text = "It found my cellar long ago, my dear, and it comes down the stairs every Sunday with a candle and a frown, and then it goes back up again. Your Light is a very polite neighbour." } },
      choices = {
        { text = "Not every priest is so polite.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warlock = {
      big = true,
      lines = { { id = "warlock_l", text = "Then I'll ask your help, of a discreet kind, with a noble who talks too much about us at the wrong dinners. You understand that if Wishock's speech succeeds, there will be no cellar for anyone to be one of." } },
      choices = {
        { text = "Then he'll have to be silenced.", next = "BACK", reply = "Silenced, or simply distracted. I prefer the gentler word, but I'll not argue with yours.", fx = { align = { light = -1, honor = -1 } } },
        { text = "I'll not poison a man for a speech.", next = "BACK", reply = "Then don't, my friend, and leave it to me. The cellar has other errand-runners.", fx = { affinity = -1, align = { light = 1, honor = 1 } } },
        { text = "I doubt Gakin knows about this.", next = "warlock2" },
      },
    },
    warlock2 = {
      lines = { { id = "warlock2_l", text = "Gakin knows what Gakin chooses to know, which is the arrangement that keeps him teaching. I find it's kinder not to burden him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    burning_legion = { { id = "tp_burning_legion", text = "The Burning Legion is an endless sea of power, and we merely dip our cups in it, very carefully. Those who drink too deeply are soon drunk, and soon dead, and soon very useful to someone else." } },
    dark_portal = { { id = "tp_dark_portal", text = "The orcs' warlocks opened the Dark Portal, and every warlock since has been blamed for it. I find that terribly unfair, though I'll admit I'd have liked to see it open." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad traded his life for power, which is a poor bargain, as I'd have told him had he asked. I prefer to trade other people's lives, which keeps the books much more balanced." } },
    shadowfang = { { id = "tp_shadowfang", text = "Arugal's mistake was to summon what he couldn't control, and then to love it. I'd never make the second mistake, and I'm very careful with the first." } },
    knows = {
      { id = "tp_knows", text = "A great many people pass through this tavern on their way somewhere they shouldn't go. I listen to all of them. Ask." },
    },
    background = { { id = "tp_bg", text = "I have a talent for making problems go quiet. The Black Claw values that talent. The rest is nobody's affair." } },
    advice = { { id = "tp_ad", text = "Never wander a tavern looking for the privy. Ask the barkeep, like a civilised person." } },
    stalvan = { { id = "tp_stalvan", text = "Stalvan Mistmantle is a dead man with a lovely garden outside Darkshire. I'm told the house is unpleasant; the flowers, however, are exquisite." } },
    _none = { { id = "tp_none", text = "I couldn't say. And if I could, I'd want something for it." } },
  },
}

-- Ursula Deline: the cellar's teacher of discipline.
P:NPC {
  key = "ursula", id = TODO_NPC("Ursula Deline"), name = "Ursula Deline", title = "Warlock Trainer",
  bible = "bibles/mage_quarter.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "sharp" }, values = { "proud" },
  notices = { "warlock", "priest" },
  impression = {
    first = "Ursula Deline believes the arcane only corrupts the weak, and she looked me up and down as if deciding which I was. She teaches warlocks in the Slaughtered Lamb's cellar and suffers no one else.",
    third = "{name} met Ursula Deline, who trains warlocks in the cellar of the Slaughtered Lamb.",
  },

  greetings = {
    { id = "g_weak", text = "The arcane only corrupts the weak. Which are you?" },
    { id = "g_warlock", when = { class = "WARLOCK" }, text = "Your name has reached my ears as one seeking a master. Good." },
  },

  notice = {
    { id = "n_warlock", cat = "warlock", when = { class = "WARLOCK" },
      text = "Keep up with your training, or you'll find the same fate as the ones who didn't. They're still here, some of them, in a manner of speaking." },
    { id = "n_priest", cat = "priest", when = { class = "PRIEST" },
      text = "A priest. I'll tell you what I tell the Cathedral's spies: we're very boring down here, and you're welcome to report that." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I think anything that relies on another's goodwill is fragile. The elements may refuse you; my power answers when I call. Think on it." } },
      choices = {
        { text = "Goodwill freely given is stronger than anything forced.", next = "BACK", reply = "Goodwill can be withdrawn at any moment. Force cannot. That's the whole difference.", fx = { align = { order = 1 } } },
        { text = "You're right. Power that answers is worth having.", next = "BACK", reply = "At last, someone with sense. Come back when you want to learn how.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Anyone can, but only the weak are, and your own Druids of the Fang went mad dreaming in a cave in the Barrens. I'd look to your own kind before you look down at my circles." } },
      choices = {
        { text = "Corruption must be rooted out, wherever it grows.", next = "BACK", reply = "Root it out, then, and look first at your own forests. I'll watch with interest.", fx = { align = { order = 1 } } },
        { text = "Each walks their own path, and falls by their own choices.", next = "BACK", reply = "Exactly, and I'll take my own falls without blaming anyone else.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because what I teach can burn a street to the ground, and the crown would like to know whose street. I don't resent the watching, so long as Shaw's people remember that I'm watching them back." } },
      choices = {
        { text = "The crown is right to watch you. Somebody must.", next = "BACK", reply = "Somebody must, and Shaw does it well. I'd rather have him than an idiot.", fx = { align = { order = 1 } } },
        { text = "What you teach down here is nobody's business but yours.", next = "BACK", reply = "The crown knows it, and leaves us alone, mostly. Shaw's men still come by to count the candles.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because a mage who loses control burns a curtain, while a warlock who loses control is eaten, so we're not permitted to be careless. Dumas teaches caution as a virtue, and I teach it as a means of staying alive." } },
      choices = {
        { text = "Then I'll keep to my own path and leave yours alone.", next = "BACK", reply = "A wise choice for someone who cares about curtains.", fx = { align = { light = 1 } } },
        { text = "Your discipline sounds worth learning, Ursula, whatever it costs.", next = "BACK", reply = "It costs a great deal, and most students can't pay it. Come back if you think you can.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because the things beyond this world are drawn to steel that has tasted blood, and they like to whisper to it. Most warriors are deaf to it, which makes them restful company down here." } },
      choices = {
        { text = "Nothing whispers to my blade. My will is my own.", next = "BACK", reply = "That's what every warrior says before they hear it. I hope you're right.", fx = { align = { light = 1 } } },
        { text = "If a blade sings of power, I'd listen.", next = "BACK", reply = "Then you'll listen, and you'll learn, and perhaps you'll survive it. Few do.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Some do, though they would sooner die than say so. A demon will obey you to the end of the world, but it will never fetch your slippers out of affection." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Some do, though they would sooner die than say so. Your {pet} is watching me very carefully, and it is right to. Animals always know which of us has the most to hide." },
      },
      choices = {
        { text = "Affection is stronger than any binding.", next = "BACK", reply = "Stronger, perhaps, but far less reliable. A demon never sulks.", fx = { align = { light = 1 } } },
        { text = "A demon that obeys is all I need.", next = "BACK", reply = "Exactly. Affection is a weakness, and demons don't have any.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Fear is for those who don't study their footing, and I study mine every night. Your faith asks you to trust what you can't see, while I insist on seeing everything, and I'd ask which of us is the braver." } },
      choices = {
        { text = "Trusting what you can't see is the hardest courage there is.", next = "BACK", reply = "It is, and I don't mock it. I simply prefer to see the floor before I walk on it.", fx = { align = { light = 1 } } },
        { text = "Perhaps you are. Blind faith is no virtue.", next = "BACK", reply = "It isn't, and I'm glad a priest can admit it. Most can't.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because I teach discipline to people who would otherwise learn without it, and that's the worse danger by far. Close this cellar and those who want this power will find it in the woods, alone and badly taught." } },
      choices = {
        { text = "Dark power taught well is still dark power, Ursula.", next = "BACK", reply = "It is, and I've never pretended otherwise. But taught badly, it's a plague.", fx = { align = { light = 1 } } },
        { text = "Perhaps you're right. Better taught here than wild in the woods.", next = "BACK", reply = "Exactly. Shut this cellar and you'll have warlocks in every barn in Elwynn.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. If you've come to save me, I'll spare you the trouble, because I'm not lost and I know exactly where I'm going." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, in the cellar. I'm sure you're very righteous, so do keep your hands off the circles, because they're older than your order." },
        { id = "h_default", text = "Ursula Deline. I teach discipline to those who would command what lies beyond the world. The darkness doesn't embrace everyone, so if it doesn't embrace you, I'd ask you to leave before it notices." },
        { id = "h_warlock", when = { class = "WARLOCK" },
          text = "You've come to learn, then, not to gawk. Keep up your training, because the arcane only corrupts those who are weak, and I don't intend to lose another student to weakness." },
        { id = "h_lamb", when = { origin = "human_lamb_cellar" },
          text = "The child who kept coming back down the stairs. Gakin wanted to send you home, and I said the curious ones are either the best or the dead, and here you are, not dead." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue on my stairs, which means Shaw is curious again or you're lost. Either way, keep to the lamplight and don't touch the circles." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, come down from the Sanctum to see how we study below the Lamb. Look all you like, though you'll find our discipline is stricter than yours." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, among warlocks. You may stay, but if your sword begins to sing, I'd advise you to put it down and leave quickly." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You bind beasts, and we bind demons. The difference, they tell me, is that yours love you, and mine merely obey." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid on my stairs. Your people fear corruption above all else, I'm told, so I wonder what brought you so close to it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. You bargain with the elements, and the weak think it's safe. Is it?" },
      },
      again = {
        { id = "h_again", text = "More? Be brief." },
      },
      choices = {
        { text = "I'm ready to train.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "What do you mean, corrupts the weak?", next = "weak" },
        { text = "Have you ever lost a student?", next = "student" },
        { text = "I should be practising something, I suppose.", next = "practise", when = { class = "WARLOCK" } },
        { text = "Is the power worth what it costs?", next = "price", when = { class = "WARLOCK" } },
        { text = "Gnomeregan's warlocks were stronger than you think.", next = "gnome", when = { race = "Gnome", class = "WARLOCK" } },
        { text = "You don't seem fond of Gakin.", next = "gakin" },
        { text = "Why would SI:7 care what you teach?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Stricter than the Sanctum's? How so?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why would my sword sing down here, Ursula?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do warlocks envy a hunter's bond, Ursula?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you ever fear where your path leads, Ursula?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why should a paladin leave you in peace, Ursula?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you think a druid could ever be corrupted, Ursula?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do you think shamanism makes a person weak, Ursula?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll go.", next = "END" },
      },
    },
    weak = {
      big = true,
      lines = { { id = "w_default", text = "Power has a price, and the weak pay it with themselves. The strong pay with will, and keep their souls. Everything else the Cathedral tells you about us is fear wearing a robe." } },
      choices = {
        { text = "Strength is all that matters, then.", next = "BACK", reply = "Strength, and will, and the sense to know what you're paying. That's all.", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "No one is strong enough for that bargain.", next = "BACK", reply = "Many aren't, and I watch them fail every year. A few are, and I teach them.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    student = {
      lines = { { id = "s_default", text = "One. He grew impatient and reached for more than he could hold, and what he reached for held him instead. We don't speak his name down here, and you won't either." } },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "I'll go.", next = "END" },
      },
    },
    practise = {
      lines = { { id = "practise_l", text = "Pain. Not inflicting it, enduring it; every pact you make is paid for in your own health, and the warlock who flinches loses the spell. Cut your life to feed your mana until it bores you." } },
      choices = {
        { text = "That sounds like madness.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "I'll practise until I stop flinching.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    price = {
      big = true,
      lines = { { id = "price_l", text = "Worth it to whom? To the kingdom, which uses us and pretends not to, yes. To you, only if you're strong enough to keep paying, and most of my students weren't." } },
      choices = {
        { text = "I'll pay whatever it costs.", next = "BACK", reply = "Pay it, then, and we'll see what's left of you afterwards. Most who say that leave less behind than they hoped.", fx = { align = { light = -2 } } },
        { text = "I'll stop before it costs too much.", next = "price_stop", fx = { align = { light = 1 } } },
      },
    },
    price_stop = {
      lines = { { id = "price_stop_l", text = "They all say that. The ones who mean it stop before they start, and the rest learn where too much is by going past it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnome = {
      lines = { { id = "gnome_l", text = "I don't need to think it; I've taught them. Gnomes come to the craft like clockmakers, careful and pleased with themselves, and they're excellent until the day a demon does something that isn't in the manual." } },
      choices = { { text = "Then I'll write a better manual.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    gakin = {
      lines = { { id = "gakin_l", text = "He's clever, and soft, and too fond of the students who disappoint him. He still says Surena's name like a wound, and I've told him that's a weakness." } },
      choices = {
        { text = "Or a kindness.", next = "BACK", reply = "Kindness is a weakness wearing a nicer robe. Gakin would agree with you, though.", fx = { align = { light = 1 } } },
        { text = "You're right. Sentiment gets warlocks killed.", next = "BACK", reply = "I've seen it happen, more than once. Tell Gakin that, would you? He won't hear it from me.", fx = { affinity = 1, align = { light = -1 } } },
      },
    },
  },

  topics = {
    burning_legion = {
      { id = "tp_burning_legion", text = "The Burning Legion corrupts the weak, and the strong learn to bend it to their will. I've seen both kinds pass through this cellar, and I can tell which is which in a single look." },
      { id = "tp_burning_legion2", when = { class = "WARLOCK" }, text = "You've touched the Legion's fire, warlock, so you know how it whispers. Learn to hear the lie in every word it speaks, and you might survive long enough to be worth teaching." },
    },
    dark_portal = { { id = "tp_dark_portal", text = "The orcs opened the Dark Portal with fel magic, and they were consumed by it. That's the lesson every warlock must learn, and most never do." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad was weak, for all his power, and he let the dead own him. I'd never be owned by anything, and I'd like to see the power that tried." } },
    scourge = { { id = "tp_scourge", text = "The Scourge is necromancy on a scale I've never seen, and I'll admit I'm curious about it. Curiosity is a dangerous thing in our trade, though, and I keep mine on a very short leash." } },
    knows = {
      { id = "tp_knows", text = "Ask. I'll answer if it pleases me." },
    },
    background = { { id = "tp_bg", text = "I teach here, and my past belongs to me; I've given away enough of myself already." } },
    advice = { { id = "tp_ad", text = "Never bargain while tired. Whatever is on the other side never is." } },
    _none = { { id = "tp_none", text = "I don't concern myself with that. Neither should you." } },
  },
}

-- Spackle Thornberry: a cheerful gnome who sells the books that teach you to call demons.
P:NPC {
  key = "spackle", id = TODO_NPC("Spackle Thornberry"), name = "Spackle Thornberry", title = "Demon Trainer",
  bible = "bibles/mage_quarter.md", role = "trainer", tier = "service",
  communities = { "stormwind" }, temper = { "eager" }, values = { "curious", "practical" },
  notices = { "warlock", "gnome", "imp" },
  impression = {
    first = "Spackle Thornberry sells grimoires in the Slaughtered Lamb's cellar and talks about demons the way other gnomes talk about gears. He is cheerful about it, which somehow makes it worse.",
    third = "{name} met Spackle Thornberry, the gnome who sells demon grimoires in the Slaughtered Lamb's cellar.",
  },

  greetings = {
    { id = "g_books", text = "Grimoires, grimoires, fresh from the press! Oh, you're not a warlock. Never mind." },
    { id = "g_warlock", when = { class = "WARLOCK" }, text = "Come to teach your little friend a new trick? I've just the book." },
    { id = "g_morzul", when = { questActive = TODO_QUEST("Mor'zul Bloodbringer") }, text = "Off to the Burning Steppes? Bring a coat; it's hot, but you'll want the pockets." },
  },

  notice = {
    { id = "n_imp", cat = "imp", when = { pet = { family = "Imp" } },
      text = "Oh, look at him! Healthy colour, good sulk, nice little flames; you've been feeding him properly. Most people let their imps go all grey and mopey." },
    { id = "n_gnome", cat = "gnome", when = { race = "Gnome" },
      text = "A fellow gnome! Don't look at me like that; Gnomeregan's gone, and a gnome must earn a living somewhere, and demons are only clockwork with opinions, really." },
    { id = "n_warlock", cat = "warlock", when = { class = "WARLOCK", minLevel = 60 },
      text = "My, you've come a long way! I'd say you were ready for a very special mount, the kind that breathes fire and doesn't need feeding, but you'll have to earn it the hard way." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Fond is a strong word, but they're excellent company! Elementals must be similar, only less likely to eat the neighbours." } },
      choices = {
        { text = "Elementals are friends, not prisoners. There's the difference.", next = "BACK", reply = "A fine distinction, and probably a true one! I'll write it in the margins.", fx = { align = { honor = 1 } } },
        { text = "Fond of demons? I'd watch my back, Spackle.", next = "BACK", reply = "Oh, I always do, and so do they! It's very nearly a friendship.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Once, a herbal with a demon pressed between the pages like a flower, but the druid who bought it set it on fire in the street. I thought that was a bit much, though I suppose it was her book by then." } },
      choices = {
        { text = "She was right to burn it. Some books shouldn't exist at all.", next = "BACK", reply = "Perhaps she was, though I thought the binding was lovely. It's a shame about the cover.", fx = { align = { order = 1 } } },
        { text = "It was hers to burn or keep. That's nobody else's business.", next = "BACK", reply = "That's what I thought too! Though I'd have preferred she didn't do it in the street.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Hardly any, because the stairs are dark and the imps are nosy, and nobody likes being shouted at in Infernal. The last one tried to pocket a grimoire, and it bit him, which taught us both something." } },
      choices = {
        { text = "Then I'll keep my hands to myself, Spackle.", next = "BACK", reply = "Thank you! The books will thank you too, or at least they won't bite you.", fx = { align = { honor = 1 } } },
        { text = "A book that bites is just a challenge, really.", next = "BACK", reply = "Oh, I like you! But I'd still keep your fingers well clear of the red-bound ones.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Oh, they know, and they pretend not to, and every so often an apprentice creeps down the stairs for a look and goes back up very pale. I think it's good for them, and it keeps them from pinching my biscuits for a week afterwards." } },
      choices = {
        { text = "Some things a mage is better off never knowing.", next = "BACK", reply = "Perhaps, but then they'd never know what's under their own tower! I think it's good for them.", fx = { align = { light = 1 } } },
        { text = "Knowing is never wasted, Spackle. Not even about demons.", next = "BACK", reply = "Exactly! Knowledge is never wasted, only sometimes very alarming.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "By being a very large amount of nothing in exactly the right place, which I think is very elegant. I've always said a good warrior and a good voidwalker have a lot in common, except the warrior can be reasoned with, mostly." } },
      choices = {
        { text = "Give me a living shield over a demon any day.", next = "BACK", reply = "Living shields complain, though, and voidwalkers never do. Still, I see your point.", fx = { align = { light = 1 } } },
        { text = "A shield that never tires sounds useful to me.", next = "BACK", reply = "Exactly! A voidwalker never asks for a day off, which is more than I can say for my cousin.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I tried, once, with my cousin's dog, and it learned to sit very still and stare at me in a disquieting way. I don't think it was the grimoire, though; I think it was just a very clever dog." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is a much better listener than any imp I've known, I'll tell you that! Imps are dreadful listeners, and they bite." },
      },
      choices = {
        { text = "Beasts deserve better than demon tricks.", next = "BACK", reply = "My cousin's dog would agree with you, and loudly. I've stopped experimenting on animals since.", fx = { align = { light = 1 } } },
        { text = "If it works on an imp, it might work on my pet.", next = "BACK", reply = "It might, though I'd be very careful, and I'd stand well back. My cousin's dog still stares.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "It did at first, but then I worked out that the books will be sold anyway, and at least I keep a ledger. I've never sold one to anybody who couldn't already summon something, so I like to think I'm only improving their manners." } },
      choices = {
        { text = "Improving a demon's manners still feeds the demon, Spackle.", next = "BACK", reply = "A little, I'll grant you, but a demon with manners is far less likely to eat the neighbours.", fx = { align = { light = 1 } } },
        { text = "I'd rather buy from a careful dealer than a reckless one.", next = "BACK", reply = "Thank you! That's exactly how I see it, and I keep very good books.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Officially the crown, unofficially Master Dumas, and practically whoever's standing at the bottom of the stairs. I keep my books in order and my mouth shut, and nobody's arrested me yet, which I take as a sort of permit." } },
      choices = {
        { text = "Silence isn't a permit, Spackle. The law should rule here too.", next = "BACK", reply = "Then I'll be ready when the law comes, with my ledgers in perfect order.", fx = { align = { order = 1 } } },
        { text = "If no one's stopped you, the law can't mind much.", next = "BACK", reply = "My thinking exactly! Though I'd not say it too loudly near the Cathedral.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Don't mind the grimoires, they're perfectly safe so long as nobody reads them aloud, and I'd guess you're not the reading-aloud sort." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Oh dear, I'd better put the dreadsteed grimoire under the counter, hadn't I? Not that it's illegal, it's only a bit embarrassing." },
        { id = "h_default", text = "Spackle Thornberry, purveyor of fine grimoires! Each one teaches a demon a new trick, which I'm sorry to say is only of any use to warlocks, but I'll happily talk about them to anyone." },
        { id = "h_morzul", key = true, tags = { "news" }, when = { class = "WARLOCK", minLevel = 60 },
          text = "Your mastery over the denizens of other worlds has grown very strong, and I think you're ready to bind a dreadsteed. Speak to Mor'zul Bloodbringer, at the Altar of Storms in the Burning Steppes, and bring plenty of gold." },
        { id = "h_morzul_done", when = { questDone = TODO_QUEST("Mor'zul Bloodbringer") },
          text = "Did you meet Mor'zul? Charming fellow, in an orcish sort of way. Whatever he asks of you, it'll cost blood, sweat and a purse that's heavier going in than coming out, and it's worth every bit." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Oh, a rogue! I had a rogue customer once who wanted a grimoire to teach his lockpicks to talk, and I had to tell him, very sadly, that no such book exists." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Don't look so stern; my grimoires are perfectly respectable by the standards of this cellar, and they're very well bound." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Oh, I'm afraid none of my grimoires will do anything for you, unless you'd like to read about how a voidwalker blocks a sword. It's fascinating, really." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! I sell grimoires for demons, not beasts, but I've always thought the principles were rather similar, haven't you?" },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "Oh, a druid! I've no grimoires for you, sadly, because nobody's ever written down how to talk to a tree, or if they have, the tree kept the book." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Do your elementals have little personalities? My demons certainly do, and one of them sulks, which is adorable." },
      },
      again = {
        { id = "h_again", text = "What else? I love a good chat between customers, and by my own tally I sell eleven percent more grimoires while I'm talking." },
      },
      choices = {
        { text = "Show me your grimoires.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "I didn't expect to find a gnome down here.", next = "gnome" },
        { text = "I've never quite understood what a grimoire is.", next = "grimoire" },
        { text = "I've heard warlocks speak of a dreadsteed.", next = "dreadsteed", when = { class = "WARLOCK", minLevel = 50 } },
        { text = "Which grimoire should I start with?", next = "first", when = { class = "WARLOCK" } },
        { text = "I studied Gnomeregan's forbidden shelves too.", next = "shelves", when = { race = "Gnome", class = "WARLOCK" } },
        { text = "The other trainers must have opinions about you.", next = "others" },
        { text = "Do you get many thieves down here?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Does the Sanctum know what you sell down here?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "How does a voidwalker block a sword, Spackle?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Could a beast learn tricks from a grimoire, Spackle?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Doesn't selling books like these worry you, Spackle?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Who decides what's legal to sell down here, Spackle?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Have you ever sold a book a druid might want, Spackle?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Are you really fond of your demons, Spackle?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye, Spackle.", next = "END" },
      },
    },
    gnome = {
      lines = { { id = "g_default", text = "I ended up here the same way most of us end up anywhere these days: Gnomeregan fell, we ran, and we took whatever work would have us. I was always good with instructions and little monsters, so here I am, and I do very well, thank you." } },
      choices = {
        { text = "You sound like you miss it.", next = "gnome_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnome_miss = {
      lines = { { id = "gm_default", text = "Oh, terribly. I had a workshop with a window, and the window had a view of the big gears turning. Down here the only things that turn are imps, and they turn on you if you're careless.",
        fx = { learn = { "gnomeregan" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    grimoire = {
      big = true,
      lines = { { id = "gr_default", text = "A book of instructions, really, that a warlock reads aloud to their demon, and the demon learns a new spell, grudgingly. Imps learn fire, voidwalkers learn to suffer for you, and succubi learn things I won't describe in company." } },
      choices = {
        { text = "Binding demons is an abomination.", next = "BACK", reply = "Some say so, and I understand why. I just think the books are fascinating.", fx = { align = { light = 1 } } },
        { text = "A tool's a tool, whatever it's made of.", next = "BACK", reply = "Exactly! Though some tools bite, and the trick is knowing which.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dreadsteed = {
      lines = { { id = "d_default", text = "A demon horse from Xoroth, all hooves and fire, and the finest mount a warlock can own. Mor'zul Bloodbringer knows the ritual, and he camps near the Altar of Storms in the Burning Steppes, if you're brave and very rich." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    first = {
      lines = {
        { id = "first_l", text = "Firebolt, for your imp, rank by rank, because an imp that hits harder sulks less! Then Sacrifice for your voidwalker, which is grim but very practical, and then we'll talk about the fancy ones." },
        { id = "first_old", when = { minLevel = 40 },
          text = "At your stage? Whatever your felhunter's missing, because a felhunter that can't devour magic is just a very ugly dog. I've a lovely edition of Spell Lock, if you've the coin." },
      },
      choices = {
        { text = "Do you ever read them yourself?", next = "first_read" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first_read = {
      lines = { { id = "first_read_l", text = "Only the footnotes, which are wonderful, and only in daylight. I'm a salesman, not a warlock, and I like my soul where it is, thank you." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    shelves = {
      big = true,
      lines = {
        { id = "shelves_l", text = "Oh, the restricted stacks deep in Gnomeregan? I helped catalogue half of them before the troggs came, and I always wondered who carried the rest out. Was it you? It was you, wasn't it." },
        { id = "shelves_texts", when = { origin = "gnome_forbidden_texts" },
          text = "You're the one who carried them out, aren't you! I helped catalogue half those stacks before the troggs came, and I always wondered where the rest went." },
      },
      choices = {
        { text = "Somebody had to save them.", next = "BACK", reply = "Somebody did, and I'd love to know who. I'd buy them a drink and borrow their lists.", fx = { affinity = 2, align = { order = -1 } } },
        { text = "Some of them should have stayed buried.", next = "BACK", reply = "Perhaps some of them, yes. I catalogued a few that made my ears ring for a week.", fx = { align = { order = 1 } } },
      },
    },
    others = {
      lines = { { id = "others_l", text = "Ursula thinks I'm frivolous, Gakin thinks I'm useful, and the Sanctum upstairs thinks I don't exist. I've decided they're all correct and sell to whoever's left." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    burning_legion = { { id = "tp_burning_legion", text = "The Burning Legion is full of the most fascinating creatures, and I've catalogued over two hundred of them! Most of them would eat me, of course, but that's what the binding circles are for." } },
    dark_portal = { { id = "tp_dark_portal", text = "The orcs opened the Dark Portal, and I'd love to study the mechanism, from a safe distance, with notes. It's a magnificent piece of work, even if it nearly ended the world." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons have demons of their own, I'm told, summoned from the fires under their mountain. I'd love to compare notes, but I'm told they'd rather compare me to a furnace." } },
    ratchet = { { id = "tp_ratchet", text = "The goblins of Ratchet sold me a book on summoning that turned out to be a cookbook. I tried a few recipes anyway, and one of them summoned something, so I'd call it a fair trade." } },
    knows = {
      { id = "tp_knows", text = "Customers chatter, and demons chatter more, if you know how to listen. Ask me anything!" },
    },
    background = { { id = "tp_bg", text = "Gnomeregan first, then the long road south, and now this lovely cellar, because a gnome must keep busy.", next = "gnome" } },
    advice = { { id = "tp_ad", text = "Name your imp something dignified. They live up to their names, and they never forgive a silly one." } },
    gnomeregan = { { id = "tp_gnome", text = "Gnomeregan was home, once. I try not to think about the radiation, and mostly I manage." } },
    _none = { { id = "tp_none", text = "No idea! Is there a grimoire about it? There ought to be." } },
  },
}
