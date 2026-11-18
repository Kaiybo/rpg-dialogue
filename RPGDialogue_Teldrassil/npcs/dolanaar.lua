-- Dolanaar: Teldrassil's crossroads village between Shadowglen and Darnassus. Voice: bibles/teldrassil.md
-- Classic quests only. Nobody blames the Arch Druid for the tree's troubles; they only notice them.
local P = RPGDialogueAPI:Pack("rpgd.teldrassil")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "corithras", id = TODO_NPC("Corithras Moonrage"), name = "Corithras Moonrage",
  prejudice = { race = { "Human", "Dwarf", "Gnome" }, amount = 6, why = "Thinks the new tree was planted for the Kaldorei and fears what outsiders carry up from the shore." },
  bible = "bibles/teldrassil.md", role = "questgiver", tier = "quest",
  communities = { "dolanaar" }, temper = { "grave" }, values = { "devout", "dutiful" },
  notices = { "class" },
  impression = {
    first = "Corithras Moonrage tastes the moonwells himself and swears the third one is wrong. The Sentinels think he fusses, but I have rarely seen anyone so certain and so quietly afraid.",
    third = "{name} met Corithras Moonrage, the grave keeper of Teldrassil's moonwells, who watches the young tree like a feverish child.",
  },

  greetings = {
    { id = "g_prej", when = { prejudiced = true }, text = "You've come a long way from your own lands to walk under Teldrassil. I'll ask you to keep to the paths, outsider, and to remember that this tree was planted for the Kaldorei." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "Welcome back to Dolanaar. I said once that the tree was not for outsiders, and you've made a liar of me in the kindest way." },
    { id = "g_well", text = "The moonwells of Teldrassil each have a voice. Listen, and you'll hear that they don't all sing the same note." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and in that time the third well has not grown any sweeter. Listen to it with me, and tell me I'm wrong." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown much stronger since you last carried water for me. Strong enough, I hope, to face whatever is fouling the wells." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I hear you have given offence to someone in Dolanaar. We have trouble enough in the wells without trouble between us, so mend it." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "DRUID" } },
      text = "You serve Elune, or the wild. Either way, you'll feel what I feel in the wells. Tell me if I'm wrong." },
  },

  start = "hello",
  nodes = {
    prej = {
      big = true,
      lines = { { id = "prej_default", text = "I would rather the tree were given time to heal before a thousand boots tread on it. The Arch Druid planted it for our people, and something in it already sickens, and I can't help wondering what visitors carry up from the shore." } },
      choices = {
        { text = "Your tree sickened before we came. Look closer to home.", next = "prej_a", fx = { align = { order = -1 } } },
        { text = "Then I'll walk softly and keep to your paths.", next = "prej_b", fx = { align = { order = 1 } } },
        { text = "What sickens in the tree, Corithras?", next = "prej_calm", fx = { affinity = 1 } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    prej_a = {
      lines = { { id = "prej_a_default", text = "You say that as if I hadn't thought it in the small hours myself. Keep that thought quiet in Darnassus, outsider, but don't think I'll forget you said it." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    prej_b = {
      lines = { { id = "prej_b_default", text = "Then you're a better guest than many. Teldrassil remembers who treads softly, and so do I." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    prej_calm = {
      lines = { { id = "prej_calm_default", text = "Something in the roots, and in the Gnarlpine, who were gentle once. I won't say more to an outsider yet, but thank you for asking rather than telling." } },
      choices = { { text = "Let's speak of something else.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The third one does, and I am certain of it. The water is blessed by Elune, yet something sour has crept in. If your spirits of water feel it too, then I am not a foolish old elf." } },
      choices = {
        { text = "Then test each well carefully, Corithras. Certainty needs proof.", next = "BACK", reply = "I will, though my tongue has rarely lied to me in four hundred years of tasting these waters. Proof it is, then, and quickly.", fx = { align = { order = 1 } } },
        { text = "Trust your tongue and act now. Waiting lets the rot spread.", next = "BACK", reply = "My heart agrees with you, shaman, but the Council will want more than my tongue before it acts. Help me give it to them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Guard them, perhaps, though I would not have you pour your Light into the water, for Elune's wells answer to her alone. Stand watch by the third well if you would serve, and if whatever fouls it comes by night, let it find a shield there." } },
      choices = {
        { text = "I'll stand guard as you ask, and leave the water be.", next = "BACK", reply = "Thank you, paladin, and Elune will see the courtesy even if the water cannot. Your shield is welcome here.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If the Light can cleanse the well, I won't wait for permission.", next = "BACK", reply = "Then you will answer to the priestesses as well as to me, and they are less patient than I am. Please, leave the water be.", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The nightsabers near the third well have grown thin and short-tempered, and the owls no longer roost above it at dusk. A hunter would see such things sooner than a keeper of wells, so tell me what you find when you pass that way." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The nightsabers near the third well have grown thin and short-tempered, and the owls no longer roost above it. Watch whether your {pet} will drink from that well, for I have seen beasts turn away from it." },
      },
      choices = {
        { text = "I'll watch the beasts at the wells and report.", next = "BACK", reply = "Thank you, hunter, for the beasts see what I cannot. Tell me the moment the owls return.", fx = { align = { order = 1 } } },
        { text = "Thin beasts are just thin beasts. You fret too much.", next = "BACK", reply = "Perhaps I do, but thin beasts near a sick well are not a coincidence. Watch them anyway, for my peace of mind.", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Then you would see more than I have, for I watch openly and whatever does this waits until I am gone. Keep to the shadow of the trees near the well and stay until dawn, and tell me what comes to drink." },
        { id = "xro_nightelf", when = { race = "NightElf" }, text = "You walk as the Sentinels' scouts do, soft on the heel. Keep to the trees beside the well and stay until dawn, and tell me what comes to drink." },
      },
      choices = {
        { text = "I'll watch and report, and touch nothing.", next = "BACK", reply = "That is exactly what I need, and exactly what I hoped you would say. The shadows will serve us both.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If I catch it at the well, I'll end it there.", next = "BACK", reply = "Please do not, for I would rather know what it is before it dies. A dead culprit tells no tales.", fx = { align = { honor = -1 } } },
        { text = "What is wrong with the wells?", next = "wells" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "I am sure you could, and that is little comfort to me. The moonwells are Elune's, and it was the Highborne's hunger for magic like yours that brought the Legion and broke the world, so I would have a druid look first." },
        { id = "xma_gnome", when = { race = "Gnome" }, text = "Your people never knew the Well of Eternity, so I will not lay its ruin at your feet. But the moonwells are Elune's, and I would rather no spell of yours touched them while a druid can look instead." },
      },
      choices = {
        { text = "I understand. I'll keep my magic away from them.", next = "BACK", reply = "Thank you, mage, and the wells will be grateful. I am sorry to ask it of you.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Fear of magic didn't save your Well either.", next = "BACK", reply = "No, it did not, and that is a wound we still carry. I would rather not open it again here.", fx = { align = { order = -1 } } },
        { text = "Which wells are affected?", next = "which" },
      },
    },
    warrior_c = {
      lines = {
        { id = "wc_default", text = "That's a warrior's answer, and some days it's the right one. But the sickness in these wells has no throat to cut yet, so carry the vial first, and keep the blade for whatever we find at the bottom of it." },
      },
      choices = {
        { text = "Then I'll wait until there's something to strike.", next = "BACK", reply = "Wise, and patient, which is rarer in a warrior than you might think. I will call you when there is.", fx = { align = { order = 1 } } },
        { text = "Waiting is how things get worse.", next = "BACK", reply = "It is, sometimes, and I lie awake fearing it. Still, I cannot strike what I cannot see.", fx = { align = { order = -1 } } },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "No, I don't think so, because the trouble in the third well began before you ever came through Dolanaar. But fel taint and moonwell water are old enemies, and the Sentinels watch the wells closely now, so give them no reason to wonder." },
      },
      choices = {
        { text = "Then I'll keep my servant far from the water.", next = "BACK", reply = "You have my thanks, warlock. The Sentinels draw their water here, and they would not drink it if they knew a demon had been near.", fx = { align = { order = 1 } } },
        { text = "The Sentinels can wonder all they like.", next = "BACK", reply = "They will, and they will remember it too. I would rather you gave them nothing to wonder about.", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    dd_melenas = {
      lines = {
        { id = "ddm_default", text = "I wondered the same, so I knelt and tasted the third well the morning after his head came to Tallonkai. It is no sweeter, which tells me the trouble runs deeper than one satyr in a cave." },
      },
      choices = {
        { text = "Then whatever fouls it is still out there.", next = "BACK", reply = "Or under us, in the roots. Keep listening as you travel, and tell me if any other well tastes of what the third one does.", fx = { affinity = 1 } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_relics", tags = { "news" }, when = { questDone = TODO_QUEST("The Relics of Wakening") }, text = "Gaerolas sent word that the Relics of Wakening are back in Athridas' keeping, and the sleeping druids may yet be roused. If the Druids of the Talon wake, perhaps they will hear in the wells what I hear." },
        { id = "h_dd_melenas", tags = { "news" }, when = { questDone = TODO_QUEST("Twisted Hatred") }, text = "Lord Melenas is dead, they tell me, and his grells are scattering out of Fel Rock. A satyr so near the moonwells troubled me more than I let the Sentinels see, so you have my thanks." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin of the Light, so far from your kingdoms? The moonwells are Elune's, but I will not turn away anyone who comes to guard them." },
        { id = "h_default", key = true,
          text = "I am Corithras Moonrage, and I have kept the moonwells of Teldrassil since the first of them was blessed. Something is wrong with them, and by Elune, I mean to learn what." },
        { id = "h_crown", tags = { "news" }, when = { questActive = TODO_QUEST("Crown of the Earth") },
          text = "Tenaron sent you with the vessel, good. Fill a phial at each well I name and bring it back to me, for the waters will tell us what the tree will not." },
        { id = "h_third", when = { metBefore = true }, text = "I tasted the third well again at dawn, and it is still wrong. I've stopped telling the Sentinels, because they think I fuss." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The wells shine brightest now. It's easier to see what's wrong in them with Elune watching too." },
        { id = "h_delivered", when = { questDone = TODO_QUEST("Crown of the Earth") },
          text = "The vessel reached the Archdruid, I hear, and he said we took our time over it. We did, and the wells deserved that much." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. The beasts drink from the moonwells as we do, and you would notice sooner than I if they had begun to sicken." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock, at the moonwells of Dolanaar. Keep your servant well back from the water, because something has fouled one well already, and I'll not have it blamed on you." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "One who speaks with spirits. Then perhaps you will taste what I taste in the third moonwell, for the Sentinels think I fuss over nothing." },
      },
      again = {
        { id = "h_again", text = "What else? Speak softly near the well, for the water has heard enough loud voices since the sundering of the world." },
        { id = "h_again2", text = "Ask what you like. The water is patient, and so am I, though my knees are less so after a night kneeling on wet stone." },
      },
      choices = {
        { text = "Was Lord Melenas the one fouling the third well?", next = "dd_melenas", when = { questDone = TODO_QUEST("Twisted Hatred") } },
        { text = "You'd rather outsiders stayed off Teldrassil, wouldn't you?", next = "prej", when = { prejudiced = true } },
        { text = "What's wrong with the wells?", next = "wells" },
        { text = "Tell me the story Tenaron began.", next = "story", when = { any = { { questActive = TODO_QUEST("Crown of the Earth") }, { questDone = TODO_QUEST("Crown of the Earth") } } } },
        { text = "You must have more than one well to watch over.", next = "which" },
        { text = "I can feel something in the water too.", next = "feel", when = { class = { "PRIEST", "DRUID" } } },
        { text = "The Light could help you guard your moonwells, Corithras.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the moonwells feel wrong to you, Corithras?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll carry the vial.", next = "END", reply = "Then carry it carefully, paladin, and may Elune guide your steps to the well. I will be waiting for word.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If something fouls the wells, I'll cut it down.", next = "warrior_c", when = { class = "WARRIOR" } },
        { text = "I can watch the wells unseen and see who fouls them.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I could sense what has tainted the wells.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Have the beasts near the moonwells changed, Corithras?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Could my craft have fouled the moonwells?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Wells go stale, and I doubt the tree's in any danger.", next = "END", reply = "I hope you are right, and I would sleep easier if you were. Go, then, and may the Light keep you all the same.", fx = { affinity = -1, align = { light = -1 } } },
      },
    },
    wells = {
      big = true,
      lines = {
        { id = "w_default", text = "Small things, like a taste that wasn't there before and a shimmer a shade off true. Teldrassil is young, and young things are easily hurt." },
      },
      choices = {
        { text = "I'll help you find out.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 }, standing = { dolanaar = 1 } } },
        { text = "Is it the tree itself?", next = "wells2" },
      },
    },
    wells2 = {
      lines = { { id = "w2_default", text = "The tree grew without the dragons' blessing. Nozdormu called the asking arrogant, and Alexstrasza agreed. Since then its growth has been... unpredictable." } },
      choices = {
        { text = "Then someone should find out why.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    story = {
      lines = { { id = "s_default", text = "After Hyjal we were lost, with Nordrassil smoking, our immortality gone and Malfurion asleep in the Dream. Fandral, the Arch Druid, convinced the Circle it was time to rebuild." } },
      choices = {
        { text = "And so, Teldrassil.", next = "story2", fx = { learn = { "cenarion_circle" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    story2 = {
      lines = { { id = "s2_default", text = "With the Circle's approval, Staghelm and the strongest druids grew it. It is magnificent, but it is also young, and I watch it the way you would watch a feverish child." } },
      choices = {
        { text = "I hope the fever breaks.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    which = {
      lines = { { id = "wh_default", text = "The one by Starbreeze Village, the one at the Pools of Arlithrien, and the first and strongest, under the Oracle Tree. Each tells me something different." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    feel = {
      lines = { { id = "f_default", text = "Then I'm not imagining it, and I thank you. You cannot know how much I needed to hear that from someone who isn't me." } },
      choices = { { text = "You're not imagining it.", next = "BACK", fx = { affinity = 2, standing = { dolanaar = 1 } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The moonwells tell me things if I listen long enough, and so do the druids who pass through Dolanaar. Ask, and I'll share what I've learned." },
    },
    background = { { id = "tp_bg", text = "I listen to the moonwells, because someone ought to, and they never shout." } },
    advice = { { id = "tp_ad", text = "Drink from a moonwell only if a priestess says it is well, and even then, only sip." } },
    teldrassil = { { id = "tp_teldrassil", text = "Young, and not as well as it looks. The wells say so before anyone else does." } },
    cenarion_circle = { { id = "tp_circle", text = "The Circle says the tree will grow strong in time, and I hope so, though the wells are less certain." } },
    nordrassil = { { id = "tp_nordrassil", text = "Nordrassil drank from the Well and grew true, and our long lives came with it. Teldrassil drinks from the moonwells, and I listen to them every night for any sign that it is not enough." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The moonwells hum a little like the Dream, if you sit with them long enough. Lately the hum has been fainter on this tree, and I have not yet found out why." } },
    elune = { { id = "tp_elune", text = "The moonwells are Elune's gift as much as the Circle's, and the priestesses never let us forget it. I don't mind, because the water has never once cared who blessed it." } },
    green_dragons = { { id = "tp_green_dragons", text = "Ysera's children never blessed Teldrassil as they blessed the first tree. Fandral says it doesn't matter, and the moonwells say otherwise, very quietly." } },
    tyrande = {
      { id = "tp_tyrande", text = "The High Priestess comes to the moonwells herself now and then, and she listens to them longer than anyone but me. I think she hears what I hear, though she is too careful to say it." },
      { id = "tp_tyrande2", when = { disposition = { min = 65 } }, text = "Since you ask kindly, I'll tell you that the High Priestess asked me once what the wells were saying. I told her, and she went very quiet, and she has not asked again." },
    },
    _none = { { id = "tp_none", text = "The wells do not speak of that, and I have listened to little else for more years than I care to count." } },
  },
}

P:NPC {
  key = "athridas", id = TODO_NPC("Athridas Bearmantle"), name = "Athridas Bearmantle",
  bible = "bibles/teldrassil.md", role = "questgiver", tier = "quest",
  communities = { "dolanaar" }, temper = { "stern" }, values = { "protective", "dutiful" },
  notices = { "class", "form" },
  impression = {
    first = "There is no patience for riddles in Athridas Bearmantle, only plain words and a heavy heart. The Gnarlpine were never his enemies, and it grieves him more than he lets on that they are now.",
    third = "{name} met Athridas Bearmantle, the stern druid of Dolanaar who would rather cure the maddened Gnarlpine than kill them.",
  },

  greetings = {
    { id = "g_druid", text = "Speak plainly, friend. The forest has troubles enough, and I've no patience for riddles today." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the Gnarlpine have not grown any gentler. Speak plainly, then, because I've no time for anything else." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown since I first sent you among the Gnarlpine, and it shows. I hope the forest taught you that strength isn't the same as cruelty." },
    { id = "g_word_intim", when = { word = "intimidated" }, text = "I hear you've been frightening folk in Dolanaar. The corrupted furbolgs frighten folk enough, and I'll not have our own guests doing it too." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Someone in the village caught you in a lie, I'm told. I've no patience for riddles, and I have even less for lies." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid, good. I need one who can tell a sick animal from an angry one, because there is a difference, and it matters." },
  },

  react = {
    { id = "r_bear", on = "form", when = { form = "bear" }, text = "You wear the bear well, but Ursal won't care, so be careful." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They were friends to the kaldorei, gentle and wise in their way, and now they rave in the woods. Something has twisted them. My heart is heavy with it." } },
      choices = {
        { text = "Then we should find the cause and help them if we can.", next = "BACK", reply = "Then you have a druid's heart, whatever your spirits say. Help me find the cause, and we may yet save them.", fx = { align = { honor = 1 } } },
        { text = "They are lost. Defend the groves and grieve later.", next = "BACK", reply = "That may be all we can do, for now, and I will not argue it. But I will grieve them, and I hope you will too.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I have prayed over them, and so have the priestesses, but the fel moss is in their blood and prayer alone will not draw it out. If you must fight them, pray for them afterward, because they did not choose what they have become." } },
      choices = {
        { text = "I'll pray for every one I'm forced to fell.", next = "BACK", reply = "Then Elune will hear you, and so will they, I think. That is more mercy than most offer.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Pity won't stop a furbolg's club, so I'll save my prayers.", next = "BACK", reply = "No, it will not, and I would not ask you to die for my pity. Save your prayers, then, and I will say them for you.", fx = { align = { light = -1 } } },
        { text = "Something else, Athridas.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Sick, though a sick bear will kill you as surely as a wicked one. Strike when they attack you and no more than that, and leave the judging to those of us who knew them before the fel moss came." } },
      choices = {
        { text = "I'll strike only those who strike at me.", next = "BACK", reply = "Then you are a better friend to the Gnarlpine than most, paladin. That is all I ask.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A furbolg raising a club is guilty enough for me.", next = "BACK", reply = "It is guilty enough to strike, perhaps, but not guilty enough to hate. Remember they were friends once.", fx = { align = { honor = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "If they come at you, you must, because they have stopped hearing reason and they will tear you open if you hesitate. But they were our friends once, warrior, so fight them as you would a friend who has lost his mind, and take no joy in it." } },
      choices = {
        { text = "I'll fight them, but I won't take joy in it.", next = "BACK", reply = "Then you are the warrior I hoped you would be. Joy has no place in a fight like this.", fx = { align = { honor = 1 } } },
        { text = "A foe is a foe, whatever they once were.", next = "BACK", reply = "Then fight them, and I will not stop you. But I will grieve for what they were.", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xlock = {
      lines = {
        { id = "xwl_default", text = "You know it, and I would very much like to know how. Fel is the Legion's mark, the thing that burned Hyjal, and yet if you can lead me to where it grows thickest, I will listen to you before I judge you." },
      },
      choices = {
        { text = "I'll help you burn it out, and then I'll leave.", next = "BACK", reply = "Then you would be doing more good than I could have hoped for, warlock. Help me, and then go in peace.", fx = { align = { light = 1 } } },
        { text = "It's power, druid. Fear won't keep it away.", next = "BACK", reply = "Fear has kept my people alive for ten thousand years, warlock. Power without it burned Hyjal.", fx = { align = { light = -1 } } },
        { text = "What is driving the furbolgs mad?", next = "moss" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "They were our friends, and I would know what turned them before any more of them are killed. Get close to their camps and watch the shaman, for if something is whispering to them, it will be whispering there." },
      },
      choices = {
        { text = "I'll only watch. They deserve a chance.", next = "BACK", reply = "Then watch closely and tell me everything, rogue. If there is a cure, it will be found by someone who looked before they struck.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If the shaman's to blame, I'll remove him quietly.", next = "BACK", reply = "Then be sure before you do, for I would not have the wrong furbolg die. Bring me proof first.", fx = { align = { honor = -1 } } },
        { text = "It's hard to believe they were ever your friends.", next = "friends" },
      },
    },
    hunter_a = {
      lines = {
        { id = "ha_default", text = "Rabid is the right word, and it grieves me to hear a hunter say it so easily. The Gnarlpine kept these woods with us for longer than you've been alive, so take what you must, but look at their eyes before you loose, and tell me what you see." },
      },
      choices = {
        { text = "I'll hunt them as I'd hunt any sick beast.", next = "BACK", reply = "Then hunt them as a sick beast is hunted, with mercy and a clean kill. That is all I ask.", fx = { align = { light = -1 } } },
        { text = "I'll spare any I can. They didn't choose this.", next = "BACK", reply = "Then you are more than a hunter to me. Thank you, truly.", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "What should I look for?", next = "moss" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "I don't blame you, but I remember, and so does every elf in Dolanaar. What I'd ask of you now is simpler: the Gnarlpine are sick, not wicked, so if you must fight them, don't burn the forest around them." },
      },
      choices = {
        { text = "I'll fight carefully. They're sick, not wicked.", next = "BACK", reply = "Thank you, mage. If we find the cure, I want there to be furbolgs left to give it to.", fx = { align = { light = 1 } } },
        { text = "If they attack me, they burn, sick or not.", next = "BACK", reply = "Then they will burn, and I will grieve them. Only do not seek them out.", fx = { align = { light = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "o_furbolgs_pity", tags = { "news" }, when = { gossip = { topic = "furbolgs", stance = "pity" } },
          text = "Tallonkai says you think the Gnarlpine were poisoned, not born wicked. I've thought the same for a long while, and it's good to hear it from someone else." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, and welcome. The Gnarlpine were a gentle people once, and I would have you remember that before you raise a hand against them." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Your order hunts the corrupted, I am told, but the Gnarlpine are sick rather than wicked, and I ask you to remember the difference." },
        { id = "h_default", key = true,
          text = "I am Athridas Bearmantle, a druid of Dolanaar, and the Gnarlpine furbolgs are my concern. They were never our enemies, but they are now." },
        { id = "h_corruption", tags = { "news" }, when = { questActive = TODO_QUEST("Gnarlpine Corruption") },
          text = "Ursal is feeding his people fel moss? By the stars, then Gaerolas was right to fear for the barrow den, and we may already be too late." },
        { id = "h_relics", when = { questActive = TODO_QUEST("The Relics of Wakening") },
          text = "Gnarlpine raiders are in the Ban'ethil Barrow Den, and the sleeping druids can't be woken without the Relics of Wakening. Bring the relics to me." },
        { id = "h_ursal", when = { questActive = TODO_QUEST("Ursal the Mauler") },
          text = "Ursal drove the Gnarlpine mad with Fel Moss, and the waking ritual cannot be finished while he lives, so end him." },
        { id = "h_breeze", when = { questActive = TODO_QUEST("A Troubling Breeze") },
          text = "Gaerolas Talvethren, who guards the sleeping druids, hasn't sent word from Starbreeze Village. Go east and bring me his report." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. The Gnarlpine are not your enemies by choice, so remember that when you draw on them." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. My people learned the cost of the arcane long ago, but I'll judge you by what you do, not by what the Highborne did." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Gnarlpine", min = 40 } },
          text = "You have killed a great many Gnarlpine, and I'll not pretend it doesn't grieve me, though I know it had to be done. They were our friends once, so when you think of them, remember that too." },
        { id = "h_shores_resolved", tags = { "news" }, when = { thread = { id = "both_shores", state = "resolved" } },
          text = "Thundris Windweaver wrote to me from Auberdine about a satyr who poisoned the food of the Blackwood furbolgs, and I have read his letter more times than I should. If the Gnarlpine were given their sickness by a hand, then I was right to grieve for them and wrong to think it was only the moss." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Speak plainly, then, as I do. The Gnarlpine were never our enemies, and I would know whether your spirits can tell me what poisoned them." },
      },
      again = {
        { id = "h_again", text = "What else? Speak quickly, if you would; I watched the Gnarlpine for centuries, and I never saw them fall so fast." },
        { id = "h_again2", text = "Speak, then, for the Gnarlpine won't wait on us." },
      },
      choices = {
        { text = "Were the Gnarlpine ever friends?", next = "friends" },
        { text = "Can the furbolgs be saved?", next = "saved" },
        { text = "Is anything else in danger from the Gnarlpine?", next = "talon" },
        { text = "I can tell a sick beast from an angry one.", next = "druidtest", when = { class = "DRUID" } },
        { text = "I've hunted Gnarlpine. They fought like rabid wolves.", next = "hunter_a", when = { class = "HUNTER" } },
        { text = "There's a stink of fel on the Gnarlpine. I know it well.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "I could get close enough to the Gnarlpine to see what's turned them.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I'd rather not fight the Gnarlpine, Athridas.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Can prayer reach the Gnarlpine, Athridas?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Are the Gnarlpine guilty, or only sick, Athridas?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you blame mages for what the Highborne did?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What happened to the Gnarlpine, Athridas?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll look into it.", next = "END", fx = { affinity = 1 } },
      },
    },
    saved = {
      lines = { { id = "s_default", text = "Some of them, but not all. That is the hardest lesson a druid learns: you cannot heal everything that's sick, and sometimes you can only stop it spreading." } },
      choices = {
        { text = "That's hard.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then we stop it spreading.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    friends = {
      lines = {
        { id = "f_trade", text = "They were, when the tree was young. They kept to their hills in peace, and the Sentinels called them friends. I miss that more than I expected to." },
      },
      choices = {
        { text = "What changed them?", next = "moss" },
        { text = "Maybe they'll be friends again.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    moss = {
      lines = { { id = "m_default", text = "It was the Fel Moss. Ursal, their chieftain, uses its power to drive them mad, and wherever it spreads, they turn." } },
      choices = {
        { text = "Then Ursal's the root.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    talon = {
      lines = { { id = "t_default", text = "The sleeping Druids of the Talon are, for they hibernate in the Ban'ethil Barrow Den by a pact with Ysera, and Gaerolas guards them. Disturb the ritual wrongly and they could be lost in the Dream." } },
      choices = {
        { text = "Being lost in the Dream sounds a lonely fate.", next = "talon2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    talon2 = {
      lines = { { id = "t2_default", text = "Their spirits walk the Dream while they sleep. Without the right relics, the waking can't be done, and they'd sleep forever without knowing it." } },
      choices = {
        { text = "Then the relics matter.", next = "BACK", reply = "They do, and they are worth more than gold to the Circle. Find them, if you can.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If they chose to sleep, then let them sleep.", next = "BACK", reply = "Some of them did, perhaps, but not like this. The Dream is no place to be trapped.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druidtest = {
      lines = { { id = "dt_default", text = "Then tell me which the Gnarlpine are... You hesitate, and you're right to, because they are both. Remember that when you're standing over one." } },
      choices = { { text = "I'll remember.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I keep watch on Teldrassil's troubles from this village, and there are more of them than I would like. Ask me of any of these." },
    },
    background = { { id = "tp_bg", text = "I'm a druid of Dolanaar, and the Gnarlpine are my charge now, whether I wanted it or not." } },
    advice = { { id = "tp_ad", text = "Don't fight a furbolg in its own hills. Draw it out where you can see the trees, and stand upwind, because they reek of wet fur and fel moss." } },
    fel_moss = { { id = "tp_moss", text = "It is the Gnarlpine's ruin, for wherever it grows, they turn." } },
    furbolgs = { { id = "tp_furbolgs", text = "They were peaceful, once. Ask me again when Ursal is dead." } },
    cenarion_circle = { { id = "tp_circle", text = "I serve the Circle as best I can from Dolanaar. They have bigger worries than furbolgs. Somebody has to have this one." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw of Felwood are what the Gnarlpine were before the corruption took them, proud and clear-eyed. I think of them when I put down another of our own furbolgs, and it doesn't help." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The druids say the Dream shows the world as it should be. I'd like it to show me Teldrassil before the Gnarlpine went mad." } },
    burning_legion = { { id = "tp_burning_legion", text = "The fel in the Gnarlpine smells of the Legion, and I fought the Legion at Hyjal. I'd hoped never to smell it again, and certainly not on our own tree." } },
    nordrassil = { { id = "tp_nordrassil", text = "Nordrassil was blessed and this tree was not, and the Gnarlpine are suffering for the difference. I won't say more than that inside Dolanaar." } },
    _none = { { id = "tp_none", text = "That is not my concern, friend. The Gnarlpine are, and they will be until this is ended." } },
  },
}

P:NPC {
  key = "tallonkai", id = TODO_NPC("Tallonkai Swiftroot"), name = "Tallonkai Swiftroot",
  bible = "bibles/teldrassil.md", role = "questgiver", tier = "quest",
  communities = { "dolanaar" }, temper = { "approving" }, values = { "protective", "kind" },
  notices = { "greenness" },
  impression = {
    first = "Something fatherly shows in the way Tallonkai Swiftroot looks over the young ones guarding the groves. He wants his dreamcatcher back, and I suspect he would like a few other things handled quietly as well.",
    third = "{name} met Tallonkai Swiftroot of Dolanaar, who approves of the young taking up the groves' defence and has errands of his own for them.",
  },

  greetings = {
    { id = "g_groves", text = "Good to see the young taking a hand in guarding the groves. Come, I've work for willing hands." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and the groves have missed your willing hands. Good to see you back on the path." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown since you first took work from me, young one, and the Gnarlpine have noticed it before I did. I'm proud, if you'll allow an old elf to say so." },
    { id = "g_word_helped", when = { word = "helped" }, text = "I hear you've been helping folk around Dolanaar, and quietly too. That's exactly the kind of work I like to see done." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "Word is someone in the village took a story of yours for truth. Some things are best handled quietly, but never with a second lie laid over the first." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 8 },
      text = "Fresh from Shadowglen. The road to Darnassus runs through here; most of what you'll need, you'll learn on the way." },
  },

  start = "hello",
  nodes = {
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "Some blame the Gnarlpine, and some blame whatever turned them, and some blame us for not seeing it sooner. You have been among the furbolgs now. What do you think of them?" },
      },
      choices = {
        { text = "They're beasts now. Put them down before they kill again.", next = "op_r1", fx = { align = { light = -1 }, trait = { stern = 1 }, opinion = { furbolgs = "hate" } } },
        { text = "They were our friends once. Something poisoned them.", next = "op_r2", fx = { affinity = 1, align = { light = 1 }, trait = { kind = 1 }, opinion = { furbolgs = "pity" } } },
        { text = "I don't care why. I care that the village is safe.", next = "op_r3", fx = { trait = { practical = 1 }, opinion = { furbolgs = "guard" } } },
        { text = "I don't know enough to judge.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "Many in Dolanaar say the same, and I said it myself the night Starbreeze burned. I find it harder to say now that the ash has cooled." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "They were, and the old ones in Dolanaar still remember trading with them. Find what poisoned them, {class}, and you'll do more good than any arrow." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "That is a guard's answer, and the village needs guards. I only hope someone else is asking why." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It draws a little good fortune out of the Emerald Dream, and it kept the nightmares from the young ones who guard my groves. Without it their sleep is troubled, as perhaps your spirits understand." } },
      choices = {
        { text = "I will help find it, Tallonkai. The young deserve peace.", next = "BACK", reply = "Thank you, shaman, and the young ones will sleep easier for it. They have had too many bad nights.", fx = { align = { light = 1 } } },
        { text = "Nightmares harden them. Let them learn.", next = "BACK", reply = "Nightmares only break them, shaman, they do not harden anyone. I would rather they slept in peace.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The priestesses in Darnassus, when we can carry them that far, and whoever has steady hands when we can't. If you have a healing prayer to spare, there are Sentinels in the village who would thank you for it." } },
      choices = {
        { text = "I'll see to them before I go anywhere else.", next = "BACK", reply = "Bless you, priest. Some of them have been hiding their wounds from me, so look under the bandages.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I came to fight the Gnarlpine, not to nurse Sentinels.", next = "BACK", reply = "Then fight the Gnarlpine, and the Sentinels will thank you for that too. But they will still need mending.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Openly, I think, for they hold Starbreeze and my dreamcatcher besides, and they have grown bold because nobody stands against them. Show them a shield that does not break, and the rest of them may think twice about the road." } },
      choices = {
        { text = "I'll meet them in the open, shield first.", next = "BACK", reply = "Then they will learn that someone stands against them, at last. Go with my blessing, paladin.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'd sooner take them unawares and spare myself the bruises.", next = "BACK", reply = "A wise choice, and a less painful one. Only bring back my dreamcatcher.", fx = { align = { honor = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I need the jewel back from Ferocitas, their mystic, and I need the young ones guarding my groves to stop getting hurt. Go to the Gnarlpine camps if you will, and come back whole, because I am tired of mourning." } },
      choices = {
        { text = "I'll come back whole, and bring your dreamcatcher.", next = "BACK", reply = "Then I will be twice in your debt, warrior. Come back whole, and quickly.", fx = { align = { honor = 1 } } },
        { text = "I'll go in hard, and I won't count their dead.", next = "BACK", reply = "Then go, and I will not ask what you leave behind. Only bring my dreamcatcher back.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They've driven the deer from the southern groves and left snares where the nightsabers walk, which no furbolg would have done a year ago. Whatever is in them now has forgotten the old ways of the forest, and the beasts have learned to fear them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They've driven the deer from the southern groves and left snares where the nightsabers walk, which no furbolg would have done a year ago. Mind your {pet} there, for I've freed two young cats from those snares this month." },
      },
      choices = {
        { text = "I'll clear their snares and spare what I can.", next = "BACK", reply = "Thank you, hunter, and the deer will be grateful. So will I.", fx = { align = { honor = 1 } } },
        { text = "I'll turn their own snares back on them.", next = "BACK", reply = "A fitting end, though I would rather they stopped setting them altogether. Be careful.", fx = { align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    rogue_t = {
      lines = {
        { id = "rt_default", text = "Could you? The furbolgs sleep in my neighbours' beds now and they wake at a twig snapping, so if you can get in and out of my house without a fight, you're a better thief than I'd like to know about." },
      },
      choices = {
        { text = "No one need ever know I was there.", next = "BACK", reply = "Then you are exactly what I need, and the furbolgs will never know. Thank you.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "I'd rather they knew who took it back.", next = "BACK", reply = "Then they will remember you, and perhaps come looking. Be careful what you leave behind.", fx = { align = { honor = 1 }, trait = { brave = 1 } } },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Both, if you can, though the ones that come at you with madness in their eyes are past healing for today. Protect the groves first and leave the curing to Athridas, because he has a better chance of it than either of us." } },
      choices = {
        { text = "I'll protect the groves first, as you say.", next = "BACK", reply = "Thank you, druid. The groves were planted by hands I knew, and I would not see them trampled.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I won't give up on a furbolg just because it attacks me.", next = "BACK", reply = "Then you are braver than I am, and kinder too. Be careful, all the same.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Welcome enough, though our elders remember the Well of Eternity and won't forget it for a stranger's smile. The Gnarlpine have overrun Starbreeze, and I'd sooner have you helping us there than worrying about what the elders think." },
      },
      choices = {
        { text = "Their caution is earned. I'll respect it.", next = "BACK", reply = "Thank you, mage, and they will soften, in time. Respect goes a long way here.", fx = { align = { order = 1 } } },
        { text = "Let them remember. I'll show them a better use.", next = "BACK", reply = "Then show them, and I hope they believe you. It will take more than a smile.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Most of them were too young to stand at Hyjal, and all they know of the Legion comes from stories told beside the moonwell. The grells that crawl out of Fel Rock are the nearest they've come to a demon, and that's near enough for anyone." },
      },
      choices = {
        { text = "Then I'll keep it out of their sight.", next = "BACK", reply = "Thank you, warlock. Most of them have never seen a demon outside a story, and I would keep it that way a little longer.", fx = { align = { order = 1 } } },
        { text = "Better they see one leashed than one loose.", next = "BACK", reply = "Perhaps, but they would rather see neither. Keep it out of sight, please.", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    dd_ursal = {
      lines = {
        { id = "ddu_default", text = "Relieved and grieved at once, for Athridas knew Ursal before the fel moss ever touched him. He spoke of him at the well this morning as one speaks of an old friend lost at sea." },
      },
      choices = {
        { text = "Ursal was too far gone to save. It had to be done.", next = "BACK", reply = "Perhaps, and I think Athridas knows it. Knowing a thing and making peace with it are seldom the same day's work.", fx = { align = { light = -1 } } },
        { text = "I wish there had been a way to bring him back.", next = "BACK", reply = "So do I, young one, and it speaks well of you that you say it. Tell Athridas, if you can bear his silence afterward.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_ursal", tags = { "news" }, when = { questDone = TODO_QUEST("Ursal the Mauler") }, text = "Athridas tells me Ursal the Mauler is dead at last, and that you were the one who ended him. I am glad of it, young one, though I wish the Gnarlpine had been left a chieftain worth sparing." },
        { id = "h_dd_road", when = { questDone = TODO_QUEST("The Road to Darnassus") }, text = "Amara says the ambushers' den on the northern path is quiet and the carts reach Darnassus whole. That is your doing too, I hear, and Dolanaar notices such things." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Good, for Dolanaar has had wounded enough since the Gnarlpine grew bold, and the Sentinels bring me more of them every week." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin in Dolanaar, in armor that rings like a temple bell! The Gnarlpine will hear you coming, but perhaps that's no bad thing." },
        { id = "h_default", key = true,
          text = "I am Tallonkai Swiftroot. The Gnarlpine have grown bold, and they hold something of mine, and I'd like it back. More than that, I'd like them to remember the peace our peoples kept for so long." },
        { id = "h_dreamcatcher", tags = { "news" }, when = { questActive = TODO_QUEST("The Emerald Dreamcatcher") },
          text = "My dreamcatcher is still in my dresser in Starbreeze Village, and the furbolgs hold Starbreeze now. Bring it back, please." },
        { id = "h_ferocitas", when = { questActive = TODO_QUEST("Ferocitas the Dream Eater") },
          text = "Ferocitas the Dream Eater has the jewel from my dreamcatcher. He's north of Starbreeze. Bring it back, and I can mend the thing." },
        { id = "h_twisted", when = { questActive = TODO_QUEST("Twisted Hatred") },
          text = "Lord Melenas is a satyr, and he has gathered grells in Fel Rock to the north. Deal with him quickly and quietly, bring me his head, and say nothing of it to anyone." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Good, because the Gnarlpine have grown bold, and they listen to a blade sooner than to words." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. The Gnarlpine hunt my groves now, and I would like to see someone hunt them back." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A young druid, guarding the groves as you should. The Gnarlpine have grown bold this season, and I'm glad to see one of the Circle's own standing against it." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage, here in Dolanaar? You've come a long way from Stormwind or Ironforge, and I hope the young ones guarding the groves didn't stare too hard." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock, on Teldrassil. Keep your servant close and quiet, because the young Sentinels here have never seen a demon, and their first should not be yours." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, walking among my young ones. Your spirits are rougher than our druids' ways, but I sense no harm in them. Have you seen my dreamcatcher?" },
      },
      again = {
        { id = "h_again", text = "Anything else, young one? Ask freely, for the young always have one more question, and the old have the time to answer it." },
        { id = "h_again2", text = "Go on, I'm listening, as patiently as the groves themselves." },
      },
      choices = {
        { text = "Athridas must be relieved that Ursal is gone.", next = "dd_ursal", when = { questDone = TODO_QUEST("Ursal the Mauler") } },
        { text = "Who do you blame for Starbreeze?", next = "op_ask" },
        { text = "They took something that mattered to you.", next = "dreamcatcher" },
        { text = "Where are the Gnarlpine causing trouble?", next = "starbreeze" },
        { text = "I keep hearing the name of Lord Melenas.", next = "melenas", when = { questActive = TODO_QUEST("Twisted Hatred") } },
        { text = "I could slip into Starbreeze and take your dreamcatcher back unseen.", next = "rogue_t", when = { class = "ROGUE" } },
        { text = "Who tends the wounded the Gnarlpine leave behind?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "How should a paladin face the Gnarlpine, Tallonkai?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is a mage welcome in Dolanaar, Tallonkai?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Have the young Sentinels really never seen a demon?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Why does your dreamcatcher matter so much, Tallonkai?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll protect the village.", next = "END", fx = { affinity = 2, standing = { dolanaar = 1 } } },
        { text = "Do you need a blade against the Gnarlpine, Tallonkai?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "How have the Gnarlpine changed the hunting in these woods?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Should a druid fight the Gnarlpine, or try to heal them?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
      },
    },
    dreamcatcher = {
      lines = {
        { id = "d_gift", text = "My dreamcatcher, a gift from Gaerolas Talvethren, who wards the sleeping druids. It draws a little luck out of the Emerald Dream. Few are ever given one." },
      },
      choices = {
        { text = "I understand.", next = "BACK", fx = { affinity = 2 } },
        { text = "Luck from the Dream?", next = "dream2" },
      },
    },
    dream2 = {
      lines = { { id = "d2_default", text = "Only a little, enough to tip things your way. I'd hate to tell Gaerolas his gift is sitting in a furbolg's den." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    starbreeze = {
      lines = { { id = "sb_default", text = "They overran Starbreeze Village, east of here, and it was a quiet place once. My dresser is still there, and so is everything else we left behind." } },
      choices = {
        { text = "Will you go back?", next = "starbreeze2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    starbreeze2 = {
      lines = { { id = "sb2_default", text = "When it's safe, and not before. Teldrassil has brave fools enough among its saplings, and someone must be the careful one." } },
      choices = {
        { text = "Wise.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "I'll make it safe.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },
    melenas = {
      lines = { { id = "me_default", text = "He is a satyr, and like every satyr he was one of us once, which is a story that shames us. Deal with him quietly, and let that be enough." } },
      choices = { { text = "I won't ask again.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "My dresser is still in Starbreeze Village, with my good cloak in it, and some Gnarlpine is probably sleeping on both. These days I stay wherever the Gnarlpine aren't." } },
    advice = { { id = "tp_ad", text = "Help where the forest needs it. Dolanaar notices who does." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw are furbolgs who never lost their minds, which makes them better neighbours than the ones who stole my dresser. I'd trade them for the Gnarlpine any day." } },
    elune = { { id = "tp_elune", text = "I pray to Elune that Starbreeze gets cleared out before my cloak is entirely chewed. She hasn't answered, but she's had a lot on." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I took a girl from Starbreeze to the Darkmoon Faire once, years back. I won her a fish in a bowl, and the fish outlived the romance." } },
    _none = { { id = "tp_none", text = "Ask Athridas; he knows the furbolgs. I know only what they've done." } },
  },
}

P:NPC {
  key = "syral", id = TODO_NPC("Syral Bladeleaf"), name = "Syral Bladeleaf",
  bible = "bibles/teldrassil.md", role = "questgiver", tier = "quest",
  communities = { "dolanaar" }, temper = { "composed" }, values = { "dutiful", "loyal" },
  notices = { "craft" },
  impression = {
    first = "Syral Bladeleaf sorts the Council's orders by which ones get someone hurt if they wait. He is calm about it, which may be the only way to bear having more orders than hands.",
    third = "{name} met Syral Bladeleaf, who carries the Council of the Forest's orders to anyone in Dolanaar willing to follow them.",
  },

  greetings = {
    { id = "g_council", text = "Dolanaar welcomes those who welcome the land. Tell me, do you?" },
  },

  notice = {
    { id = "n_herb", cat = "craft", when = { profession = { "Herbalism", "Alchemy" } },
      text = "You know your herbs. Teldrassil's soil is new, and the plants here are still deciding what they'll be, so watch them closely." },
  },

  start = "hello",
  nodes = {
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "The Council argues it every season. Some say a satyr who stays in sight is better than one who hides, and some say we should have shot him the day he arrived. You've met him, I expect, so what would you do with Zenn?" },
      },
      choices = {
        { text = "Drive him off Teldrassil before he corrupts someone.", next = "op_r1", fx = { align = { light = -1 }, trait = { stern = 1 }, opinion = { zenn_foulhoof = "hard" } } },
        { text = "Watch him closely. He's done nothing we can prove.", next = "op_r2", fx = { affinity = 1, trait = { cautious = 1 }, opinion = { zenn_foulhoof = "watch" } } },
        { text = "He's lonely and harmless. Let him be.", next = "op_r3", fx = { affinity = -1, align = { light = 1 }, trait = { kind = 1 }, opinion = { zenn_foulhoof = "harmless" } } },
        { text = "The forest will judge him in its own time.", next = "op_r4", fx = { trait = { patient = 1 }, opinion = { zenn_foulhoof = "forest_judges" } }, when = { class = "DRUID" } },
        { text = "That's for the Council to decide.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "That is what the Sentinels said, nearly word for word. The druids answered that a satyr driven off is a satyr nobody is watching." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "That is the Council's answer as well, more or less, and it is the reason I keep a scout within sight of his glade." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "Harmless is what satyrs want you to think, {class}. Each of them was Highborne once, and each of them chose the Legion with open eyes." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r4 = {
      lines = { { id = "op_r4_default", text = "The forest is slow and Zenn is quick, though I take your point, and so would the Council." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The ones about the furbolgs and the spiders, always. Your spirits might tell you where the danger lies before my Sentinels find it." } },
      choices = {
        { text = "Then I will take the most urgent first, Syral.", next = "BACK", reply = "Good, and the Sentinels will be grateful. The furbolgs come first, always.", fx = { align = { order = 1 } } },
        { text = "I will choose my own tasks, thank you.", next = "BACK", reply = "As you wish, though the Council's tasks will wait for you. They usually do.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "None written down, but Denalan's work by Lake Al'Ameth leaves him scratched and stung more often than he admits, and Iverron lies sick near Shadowglen. The Council would never order it, so I will only say that a healer would be welcome at both." } },
      choices = {
        { text = "I'll see to them both, for healing needs no order.", next = "BACK", reply = "Then you will be welcome in Dolanaar for as long as you like. Healing needs no order, indeed.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I heal those who pay me, the same as any trade.", next = "BACK", reply = "Then you will find few customers here, priest. The Council does not pay for mending.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The Council trusts what it sees done, and an oath sworn in Stormwind means little in Dolanaar until it has been kept here. Take an order and carry it through, and they will remember your name better than any vow." } },
      choices = {
        { text = "Then give me an order, and I'll see it done.", next = "BACK", reply = "Then I will give you one, and the Council will see it done. Come back when you are ready.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My oath is to the Light, not to your Council.", next = "BACK", reply = "Then your oath is your own, and the Council will judge you by your deeds instead. That is fair.", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The ones nobody wants: thinning the mangy nightsabers that have turned on travellers, and carrying soil to Denalan at the lake, which sounds dull until the timberlings come at you. Those orders wait the longest, and things only get worse the longer they wait." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The ones nobody wants: thinning the mangy nightsabers that have turned on travellers, and guarding Denalan's lake from the timberlings. Your {pet} can follow a scent better than any order I could write, so let it lead." },
      },
      choices = {
        { text = "Give me the orders that have waited longest.", next = "BACK", reply = "Then take the mangy sabers first, and the soil after. Denalan will be glad of you.", fx = { align = { order = 1 } } },
        { text = "I'll pick my own hunts, thank you.", next = "BACK", reply = "As you wish, hunter, but the oldest orders are often the most important. They wait for someone.", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "The Council does not deal in discretion, as a rule, but the forest sometimes must. Zenn Foulhoof is up to something in the wilds, and someone who goes unnoticed might learn what before he sees them coming." },
      },
      choices = {
        { text = "I'll learn what I can and bring it straight to you.", next = "BACK", reply = "Then the Council will be grateful, and so will I. Be careful near Zenn.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll learn it, and decide what to do with it myself.", next = "BACK", reply = "Then decide carefully, rogue, and remember the Council is watching. Zenn is no friend of anyone.", fx = { align = { honor = -1 } } },
        { text = "Who is Zenn?", next = "zenn" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "The Council of the Forest has very little to do with mages, and would prefer to keep it that way. You are a guest on Teldrassil, so walk gently, and if you must cast, cast at what attacks you and nothing else." },
      },
      choices = {
        { text = "I'll respect the Council's wishes.", next = "BACK", reply = "Thank you, mage, and the Council will be grateful. You are welcome on Teldrassil.", fx = { align = { order = 1 } } },
        { text = "Magic isn't the Council's to ration.", next = "BACK", reply = "It is not, perhaps, but the island is, and the Council guards it. Remember that.", fx = { align = { order = -1 } } },
        { text = "What is the Council, exactly?", next = "council" },
      },
    },
    warrior_sy = {
      lines = {
        { id = "wsy_default", text = "The Council has no shortage of those, and most of them mean clearing timberlings from Denalan's lake, which the young ones avoid. Ask me for the dull orders, though, and I'll know you're serious." },
      },
      choices = {
        { text = "I'll take the dull ones. Someone must.", next = "BACK", reply = "Then you are a rare warrior, and the Council will remember it. Dull orders keep the forest safe.", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "Dull orders are for other people.", next = "BACK", reply = "Then you will find the Council has little else for you. Most of our work is dull.", fx = { align = { order = -1 } } },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "It asks, and the Circle usually listens, because Darnassus and the Enclave need each other more than either will admit. A druid who heals the land and still answers a summons is worth three who only do one or the other." } },
      choices = {
        { text = "The Council should have my help whenever it asks.", next = "BACK", reply = "Then the Council will be glad of you, druid. Darnassus and the Enclave need each other.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A druid answers to the land, and not to any council.", next = "BACK", reply = "It does, and the Council knows it. But the land and the Council are not always at odds.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "The Council would sooner not know you were here, I think, and some of them would ask me to see you off the island. I've more orders than hands, though, and Denalan's lake doesn't care who clears the timberlings from it, so long as someone does." },
      },
      choices = {
        { text = "I'll do the work and ask for no thanks.", next = "BACK", reply = "Then I will thank you anyway, warlock, quietly. The Council need not know.", fx = { align = { honor = 1 } } },
        { text = "If the Council won't have me, I'll work for coin.", next = "BACK", reply = "Then you will find few who will pay you here, but I will not stop you. Work honestly, at least.", fx = { align = { honor = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "o_fandral_doubt", tags = { "news" }, when = { opinion = { topic = "fandral", stance = "doubt" } },
          text = "Word is you'd follow neither the High Priestess nor the Archdruid. Keep thinking for yourself; the Council could use more of it." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. The Council's orders are mostly for blades and bows, but there is always someone on the list who needs mending more than fighting." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Your order is sworn to obey, they tell me, which makes you easier to give orders to than most of the adventurers I see." },
        { id = "h_default", key = true,
          text = "I am Syral Bladeleaf, and I carry the Council of the Forest's orders to those who will follow them. My people have had ten thousand years to learn patience, and still there are more orders than hands." },
        { id = "h_redemption", tags = { "news" }, when = { questActive = TODO_QUEST("Seek Redemption!") },
          text = "The Council knows you ran errands for Zenn Foulhoof. Feed that satyr a few fel cones, and the forest will call it even." },
        { id = "h_denalan", when = { questActive = TODO_QUEST("Denalan's Earth") },
          text = "Denalan studies Teldrassil's plants at Lake Al'Ameth, and the rare earth he ordered from Darnassus came late. Take it to him, please." },
        { id = "h_sort", when = { metBefore = true }, text = "The Council sends more orders than Dolanaar has hands. I sort them by which ones get someone hurt if they wait." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. The Council always has more orders than hands, and hunters can carry the ones that lead into the deep wood." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. The Council of the Forest has work for the Circle's young as well as for the Sentinels, and I have more of it than I have druids to carry it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. The Council sent me no orders concerning your kind, which means I'll have to decide for myself, so I hope you will make that decision an easy one." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, and welcome. I have more orders than hands, and I sort them by which ones will get someone hurt if they wait, so perhaps your spirits can carry one or two." },
      },
      again = {
        { id = "h_again", text = "What else? There are always more orders." },
        { id = "h_again2", text = "Speak, and I'll find you something useful." },
      },
      choices = {
        { text = "Should Zenn Foulhoof be allowed to stay?", next = "op_ask" },
        { text = "What is the Council of the Forest?", next = "council" },
        { text = "Who is Denalan?", next = "denalan", when = { questActive = TODO_QUEST("Denalan's Earth") } },
        { text = "Who is Zenn Foulhoof?", next = "zenn", when = { any = { { questActive = TODO_QUEST("Seek Redemption!") }, { questActive = TODO_QUEST("Zenn's Bidding") }, { questDone = TODO_QUEST("Zenn's Bidding") } } } },
        { text = "I'm an herbalist, and the plants here look strange to me.", next = "herbs", when = { profession = "Herbalism" } },
        { text = "Has the Council any orders for a priest?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "I'd hope the Council trusts a paladin's oath, Syral.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Which order is most urgent, Syral?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll take on the Council's orders.", next = "END", reply = "Good, priest, and the wounded on the list will thank you for it. Go with Elune's light.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Give me the orders nobody else will take.", next = "warrior_sy", when = { class = "WARRIOR" } },
        { text = "Have you any orders for someone discreet?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Does the Council have any work for a mage?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Which of the Council's orders suit a hunter, Syral?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Does the Council give orders to druids too, Syral?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would the Council give orders to a warlock?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "I'll help where I see a need, not where the Council points.", next = "END", reply = "Then go where you see it, and may Elune guide you there. The Council will notice either way.", fx = { align = { order = -1 } } },
      },
    },
    council = {
      lines = { { id = "c_default", text = "Those who speak for the forest around Dolanaar. I carry their word to anyone who'll act on it." } },
      choices = {
        { text = "Who sits on it?", next = "council2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    council2 = {
      lines = { { id = "c2_default", text = "That is the Council's business, and mine is the orders. You'd be surprised how much quieter my life is that way." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { discreet = 1 } } } },
    },
    denalan = {
      lines = { { id = "d_default", text = "A colleague, camped by Lake Al'Ameth, testing what grows in the new soil. The timberlings there have him worried." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    zenn = {
      lines = { { id = "z_default", text = "A satyr by the road who asks young ones for favours and calls it business. The Council keeps track of who helps him." } },
      choices = {
        { text = "I helped him. I didn't know.", next = "zenn2", when = { questDone = TODO_QUEST("Zenn's Bidding") } },
        { text = "I'll stay away from him.", next = "BACK", reply = "Wise, and the Council will be glad of it. He is not worth the trouble.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Whose favours I do is my own business.", next = "BACK", reply = "It is, and the Council will remember whose favours you do. That is their business.", fx = { affinity = -1, align = { order = -1 } } },
      },
    },
    zenn2 = {
      lines = { { id = "z2_default", text = "Then set it right. Fel cones fall under the trees, smoking green; feed him a few, and he'll think you've brought him a snack." } },
      choices = {
        { text = "I'll set it right.", next = "BACK", reply = "Good, and quickly, before the Council hears. Zenn will never know what hit him.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "The Council can keep its tally, because I owe it nothing.", next = "BACK", reply = "You owe it nothing, perhaps, but the forest is watching too. Think about it.", fx = { align = { order = -1 } } },
        { text = "That's a dirty trick.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    herbs = {
      lines = { { id = "h2_default", text = "Then you'll see what I mean about the soil: the plants are still deciding what to be. Show Denalan whatever looks wrong to you." } },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I bear the Council's orders. If I had a story, I'd have had to file it in triplicate." } },
    advice = { { id = "tp_ad", text = "Don't make bargains with anything that has hooves and smiles." } },
    tyrande = { { id = "tp_tyrande", text = "The High Priestess's orders come down to me sealed, and I carry them sealed. I have never read one, and I sleep well because of it." } },
    bolvar = { { id = "tp_bolvar", text = "Lord Bolvar sends the Council correspondence in a very fine human hand, and very long. I file it, and someone more important reads it." } },
    sentinels = { { id = "tp_sentinels", text = "The Sentinels keep the roads and I keep the paperwork, and between us nothing is ever lost. Well, almost nothing." } },
    theramore = { { id = "tp_theramore", text = "Theramore's dispatches come in on the Auberdine boat, stamped with Lady Proudmoore's seal. Human seals use far too much wax." } },
    _none = { { id = "tp_none", text = "The Council of the Forest hasn't spoken on that, and I'll not speak before my elders do." } },
  },
}

P:NPC {
  key = "keldamyr", id = TODO_NPC("Innkeeper Keldamyr"), name = "Innkeeper Keldamyr",
  bible = "bibles/teldrassil.md", role = "innkeeper", tier = "service",
  communities = { "dolanaar" }, temper = { "gentle" }, values = { "generous" },
  notices = { "weary" },
  impression = {
    first = "At Keldamyr's inn the tea is always ready and nobody is asked why they look tired. Travellers leave lighter, and I think that is the whole point of the place.",
    third = "{name} stopped at Innkeeper Keldamyr's hearth in Dolanaar, where every traveller between Shadowglen and Darnassus rests sooner or later.",
  },

  greetings = {
    { id = "g_inn", text = "Ishnu-alah, traveler. Rest a while; the inn is yours for as long as you need it, and Elune keeps the night watch so that you need not." },
    { id = "g_home", when = { homeInn = { "Dolanaar" } }, text = "Welcome home. The fire's low and warm, the way you like it." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and you look as though the road took its toll. Sit, and the tea will be ready in a moment." },
    { id = "g_away_long", when = { away = 60 }, text = "It's been {away} since you last rested here, and I'm glad the road has brought you back. Your fire's still low and warm, the way you like it." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Folk in the village have been speaking kindly of you over their tea. I always thought you were good company." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You've had a hard road back from somewhere grey. Sit down; Elune's light reaches the inn too." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Most of them do. I give them tea and quiet, and they leave lighter, and perhaps your spirits could use the rest as well." } },
      choices = {
        { text = "Kindness like yours is rare, Keldamyr. Thank you.", next = "BACK", reply = "Thank you, shaman, and you will always have a cup waiting here. Rest well.", fx = { align = { light = 1 } } },
        { text = "Tea will not fix the world's troubles.", next = "BACK", reply = "No, but it fixes a great many small ones. Sit, and let me pour you a cup.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More than they used to, since the Gnarlpine turned and the spiders grew bold in the Webwood. I give them a bed and a hot meal, and I would sleep easier if someone who knew a prayer looked in on them now and then." } },
      choices = {
        { text = "I'll look in on them before I sleep.", next = "BACK", reply = "Thank you, priest. The one by the window cries out in her sleep, so go gently with her.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'm resting tonight, and the wounded can wait for morning.", next = "BACK", reply = "They can, and you have earned your rest. Sleep well, priest.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Rarely, and when they do it's mostly a quarrel over the hearth, which I settle with soup. But a tired traveler sleeps better knowing someone armed is under the same roof, so stay as long as you like." } },
      choices = {
        { text = "I'll keep watch tonight so your guests can sleep.", next = "BACK", reply = "Thank you, paladin, and they will sleep soundly for it. I will bring you tea.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'm here to rest, not to stand guard for strangers.", next = "BACK", reply = "Then rest, and I will keep the peace myself, with soup. Sleep well.", fx = { align = { honor = -1 } } },
        { text = "Just rest, then.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Most of them, fresh from Kyra Windblade's lessons in Shadowglen and sure they're ready for Ashenvale already. I pour them tea and let them talk, and by the second cup they usually admit they'd like a bed before they go." } },
      choices = {
        { text = "I'll rest first. Ashenvale can wait a night.", next = "BACK", reply = "Good, and you will reach Ashenvale all the stronger. Sleep well, warrior.", fx = { align = { order = 1 } } },
        { text = "No bed for me. The front won't wait.", next = "BACK", reply = "Then go, and take some tea with you for the road. Ashenvale will still be there tomorrow.", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Some sleep here and some under the trees, and Lyreena Duskblade will tell you the trees are better, though she's always grateful for my tea in the morning. Either way I like to know who's out there, so tell me if you mean to camp." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Some sleep here and some under the trees, and either is welcome. Your {pet} can curl up by the hearth if it likes; the last companion who did wouldn't leave for two days." },
      },
      choices = {
        { text = "A warm bed tonight. A roof is a blessing.", next = "BACK", reply = "It is, and I am glad you think so. Sleep well, hunter.", fx = { align = { order = 1 } } },
        { text = "I'll camp under the trees. Roofs make me restless.", next = "BACK", reply = "Then camp well, and come back for breakfast. Lyreena will be glad of the company.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "You are welcome to a bed, of course; I turn no traveler away. I ask only that you leave your spells at the door, for the old tree hears more than you would think, and Dolanaar remembers what spellcraft cost our people." },
        { id = "xma_gnome", when = { race = "Gnome" }, text = "You are a long way from your mountain, and you are welcome to a bed. I ask only what I ask of every mage, that you leave your spells at the door, for Dolanaar remembers what spellcraft cost our people." },
      },
      choices = {
        { text = "Of course. Your house, your rules.", next = "BACK", reply = "Thank you, mage. The last one set a pillow alight showing off, and the druid in the next room has not forgiven either of us.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My spells go where I go, innkeeper.", next = "BACK", reply = "Then please keep them quiet, at least. My guests are light sleepers.", fx = { align = { order = -1 } } },
        { text = "You must see all sorts pass through here.", next = "inn" },
      },
    },
    xlock = {
      lines = {
        { id = "xwl_default", text = "I can see why. There is a smell on you of something that never grew on any tree, and my guests are kaldorei who remember Hyjal, so you may have the room at the end, and I'd be grateful if you were on the road by morning." },
      },
      choices = {
        { text = "I'll leave quietly at first light.", next = "BACK", reply = "Thank you, and I am sorry to ask it of you. Rest well, while you are here.", fx = { align = { light = 1 } } },
        { text = "Hyjal was long ago. The power is still useful.", next = "BACK", reply = "It was, but they remember it as though it were yesterday. Please be gentle with them.", fx = { align = { light = -1 } } },
        { text = "What's on the road ahead?", next = "road" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Most of them, sooner or later, and a few stay longer than they meant to because the Gnarlpine trouble them more than they say. I don't ask why they look tired, but I keep the tea hot." } },
      choices = {
        { text = "The Gnarlpine trouble me too, and I've the claw marks to show for it.", next = "BACK", reply = "Then you are welcome here, druid, and the tea is hot. Rest those claw marks.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A druid should keep their worries and not burden your inn.", next = "BACK", reply = "Nonsense, that is what an inn is for. Sit, and tell me about it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Not in the least, because travellers rest better when nobody asks them questions, and resting is what my inn is for. If you'd like to tell me, I'll listen, but the tea is ready either way." },
      },
      choices = {
        { text = "I'll tell you the truth, if you want it.", next = "BACK", reply = "Only if you want to tell it. I am happy either way.", fx = { align = { honor = 1 } } },
        { text = "Better you don't know. Pour the tea.", next = "BACK", reply = "Then I will pour it, and ask nothing. That is what my inn is for.", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    dd_ursal = {
      lines = {
        { id = "ddu_default", text = "Everyone hears everything at an inn, sooner or later. Athridas didn't celebrate, mind you; he only sat and stared into his cup, and then he said the Gnarlpine might be a gentle people again one day, with Ursal gone." },
      },
      choices = {
        { text = "Do you think the Gnarlpine can be gentle again?", next = "dd_ursal2" },
        { text = "Something else, Keldamyr.", next = "BACK" },
      },
    },
    dd_ursal2 = {
      lines = {
        { id = "ddu2_default", text = "I remember them trading honey at the edge of the village, so I would like to believe it. The Sentinels don't, and they're the ones who carry the wounded in here, so I keep my hopes to myself and pour the tea." },
      },
      choices = {
        { text = "Then we heal them, not hunt them.", next = "BACK", reply = "That's a kind thought, and Athridas would bless you for it. Say it where the Sentinels can hear you, though, and mind their faces.", fx = { align = { light = 1 } } },
        { text = "Hope won't stop an ambusher's club. They need putting down.", next = "BACK", reply = "Perhaps it won't, and I've bandaged enough heads to know it. Still, I'd rather you didn't say it so cheerfully under my roof.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_ursal", tags = { "news" }, when = { questDone = TODO_QUEST("Ursal the Mauler") }, text = "Athridas sat by my fire last night longer than he has in a year, and he told me Ursal the Mauler is dead. He said a traveler did it, and from the way he described you, I think that traveler is standing at my counter." },
        { id = "h_dd_melenas", tags = { "news" }, when = { questDone = TODO_QUEST("Twisted Hatred") }, text = "Tallonkai carried that satyr's head through half of Dolanaar before anyone could talk him out of it, which is not like him at all. The Sentinels drank to whoever brought down Lord Melenas, and I gather it was you." },
        { id = "h_dd_deaths", when = { deaths = { min = 8 } }, text = "You have the look of someone who has woken at the spirit healer's feet more than once, friend. Sit by the fire, and don't tell me how many times, because I would only worry." },
        { id = "h_alt_any", when = { alt = true, metBefore = false },
          text = "Welcome to Dolanaar. You walk in the way {alt} did, a {altrace} {altclass} who rested here on the road to Darnassus, and I've a fondness for travelers who stop long enough to be remembered." },
        { id = "h_alt_back", when = { alt = { days = 30 }, metBefore = true }, cooldown = "5d",
          text = "{alt} passed through only a little while ago and asked whether the road to Darnassus was safe. I said it was, mostly, which is the same answer I'll give you." },
        { id = "o_kaldorei_immortality_loss", tags = { "news" }, when = { gossip = { topic = "kaldorei_immortality", stance = "loss" } },
          text = "Zarrin the cook says you'd trade anything to have our immortality back. Sit down and have a cup first, because you can't trade what's already gone." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest under my roof! The road from Shadowglen is kind, mostly, but now and then someone comes in limping, and it helps to have a healer near." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, and a long way from home! Leave your hammer by the door if you like, for nobody in Dolanaar will touch it, though they will certainly stare." },
        { id = "h_default", key = true,
          text = "I am Keldamyr, and I keep the inn for travelers between Shadowglen and Darnassus. They all stop beneath these boughs sooner or later, and I like to think they leave lighter." },
        { id = "h_delivery", when = { questActive = TODO_QUEST("Dolanaar Delivery") },
          text = "So these are the herbs from Porthannius. It's a pity he couldn't bring them himself, for there are seasons of news between us still unspoken." },
        { id = "h_joke", when = { metBefore = true }, text = "A Sentinel told me a joke last night. It wasn't funny, but she laughed so hard I laughed too. That's the inn on a good night." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "It's late, and the Sentinels coming off watch will want tea. They always want tea, and they never admit they're cold." },
        { id = "h_corithras", when = { heardLine = "corithras.h_default" }, text = "So you've met Corithras. He tastes every one of his wells himself to find the trouble, and I keep peppermint tea for him afterward." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Sit and take the armor off for an hour, because tea doesn't taste right through a helmet." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Your companion is welcome by the fire, so long as it doesn't mind the other guests' boots." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid. Sit, and I'll bring you some tea, because the young ones from Shadowglen always arrive with that tired look that comes from listening to the forest too hard." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You came in so quietly that the kettle didn't even notice, and it notices everyone. Sit down, and I won't ask where you've been." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, far from home. Sit and have some tea, for nobody here will ask why you look tired, and your spirits may rest beneath the leaves as well." },
      },
      again = {
        { id = "h_again", text = "Anything else I can do for you? There's tea, if you'd like some, though I'd skip the moonberry; it's gone a bit fizzy." },
      },
      choices = {
        { text = "I take it you heard about Ursal.", next = "dd_ursal", when = { questDone = TODO_QUEST("Ursal the Mauler") } },
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Who stops at your inn?", next = "inn" },
        { text = "I'd guess you hear all the road's news in here.", next = "road" },
        { text = "Is a mage welcome under your roof?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do many warriors stop here on the way to Darnassus?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters stay at the inn, or sleep in the woods?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'll need a room away from the others.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do the wounded often come to your inn, Keldamyr?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do your guests ever bring trouble to the inn?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do many druids stop at your inn on the way to Darnassus?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Don't you want to know where I've been, Keldamyr?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do many travellers come to your inn tired, Keldamyr?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Just rest, thank you.", next = "END" },
      },
    },
    inn = {
      lines = {
        { id = "i_guests", text = "Young elves on their way to Darnassus, Sentinels off watch, and now and then a druid who forgets to change back before coming in. I've learned to keep the door wide." },
      },
      choices = {
        { text = "A druid, forgetting?", next = "druids_k" },
        { text = "Ha. Good to know.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    druids_k = {
      lines = { { id = "dk_default", text = "It happens. A bear at the hearth is good for business, right up until it tries a chair." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    road = {
      lines = { { id = "r_default", text = "The Gnarlpine grow bolder every week, and that's most of the news. Ask any Sentinel resting by the fire, and she'll tell you plainly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everyone passing between Shadowglen and Darnassus stops here, and they leave a little news behind with the crumbs. Ask me what you like." },
    },
    background = { { id = "tp_bg", text = "I keep a fire lit between Shadowglen and Darnassus. It's a good place for a fire." } },
    advice = { { id = "tp_ad", text = "Rest when you can, and take your boots off to do it. I've seen Sentinels lose toenails to Teldrassil's damp." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "Folks who've been to the Darkmoon Faire come back with stories that grow every time they tell them at my fire. I let them, because a good story keeps people buying cider." } },
    theramore = { { id = "tp_theramore", text = "We get a few humans through from Theramore, mostly on their way to Darnassus, mostly lost. I give them a bed and the right road in the morning." } },
    elune = { { id = "tp_elune", text = "I keep a lamp lit for Elune at the window, as my mother did. Travellers see it from the road, and that's half of what prayer is for." } },
    booty_bay = { { id = "tp_booty_bay", text = "Sailors say Booty Bay's inn is built over a harbour full of sharks. I'll keep my little fire and my quiet road, thank you." } },
    _none = { { id = "tp_none", text = "I hear only the gentle gossip, the kind that drifts in with the moonlight. Ask a Sentinel for the other kind." } },
  },
}

-- Forever's camping: the adventurer by the road near Dolanaar.
P:NPC {
  key = "lyreena", id = TODO_NPC("Lyreena Duskblade"), name = "Lyreena Duskblade",
  bible = "bibles/teldrassil.md", role = "questgiver", tier = "quest",
  communities = { "dolanaar" }, temper = { "easy" }, values = { "curious", "generous" },
  notices = { "craft" },
  impression = {
    first = "Lyreena Duskblade would rather sleep under the canopy than a roof, and she counts stars through the leaves until she drifts off. Sitting at her small fire, I found it hard to argue with her.",
    third = "{name} shared a small fire with Lyreena Duskblade, who teaches anyone willing how to make a camp feel like home.",
  },

  greetings = {
    { id = "g_fire", text = "Come and sit down. The fire's small, but it's honest, and there's room for one more." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook. Then you already hold the first secret of a good camp: the fire. Everything else gathers around it." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Under the canopy I hear the forest breathe. A roof shuts it out. Your spirits must know that feeling." } },
      choices = {
        { text = "The forest's breath is worth hearing, Lyreena.", next = "BACK", reply = "It is, and it is worth more than any roof. Sleep under the trees with me some night.", fx = { align = { honor = 1 } } },
        { text = "A roof keeps you safe. You should use one.", next = "BACK", reply = "It does, but it keeps out the forest too. I would rather have the forest.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Pray, sleep, eat and think, all of it, because a roof only gets in the way of the moon. The priestesses say Elune hears you wherever you are, and I've always taken that to mean she'd rather you came outside." } },
      choices = {
        { text = "My faith goes wherever I go, roof or no roof.", next = "BACK", reply = "Then you understand me better than most, priest. The moon is the best roof of all.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'd rather have a roof and a dry blanket than a sermon.", next = "BACK", reply = "Then you will sleep well under Keldamyr's roof, and I will sleep well under mine. Each to their own.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Anyone can learn, though you'll wake with bark printed on your back and dew in every joint. You have to stop fighting the ground and let it hold you, which I suspect is the hardest lesson there is for a paladin." } },
      choices = {
        { text = "Then I'll learn to bear it, as I bear everything else.", next = "BACK", reply = "Then you will learn, and quickly, I think. The woods will take care of you.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll take the armor off and trust the woods instead.", next = "BACK", reply = "Then you will sleep better than you ever have. Trust them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Easy enough, once you take the armor off and stop listening for every snapped twig. Pick a spot with your back to a trunk, count the stars through the leaves, and let the forest keep watch for a while." } },
      choices = {
        { text = "I'll trust the forest and sleep.", next = "BACK", reply = "Good, and you will wake rested for the first time in weeks. Keep the fire low, and the owls will keep watch for you.", fx = { align = { light = 1 } } },
        { text = "I'll sleep in my armor with my sword in hand.", next = "BACK", reply = "Then you will wake stiff and tired, and the forest will laugh at you. Take it off.", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Plenty, if you mean to sleep in the wild and wake up with your purse and your throat. A rogue's camp is a cold camp, with no smoke and no fire, and that is the first thing I would teach you." },
      },
      choices = {
        { text = "Teach me properly. I'll do it your way.", next = "BACK", reply = "Good, and you will wake with your purse and your throat. That is all a camp should promise.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll take the useful bits and leave the rest.", next = "BACK", reply = "Then take the useful bits, and you may wake with half your purse. That is better than none.", fx = { align = { order = -1 } } },
        { text = "Most folk would take a roof over the open sky.", next = "why" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Simple until the spell runs dry or you're too tired to cast it, and then you'll wish you knew which stream runs clean. The forest gives water to anyone who knows how to ask, and it doesn't care if you're tired." },
      },
      choices = {
        { text = "Then teach me the forest's way.", next = "BACK", reply = "Good. We will start with the dew on the broad leaves at dawn, and you will never go thirsty again.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll trust my spells over a stream.", next = "BACK", reply = "Then trust them, until they run dry. I will be here when they do.", fx = { align = { order = -1 } } },
        { text = "What else do you teach?", next = "teach" },
      },
    },
    hunter_ly = {
      lines = {
        { id = "hly_default", text = "Sleeps outdoors, maybe, but sleeps well? Most hunters I meet curl up with their companions and wake stiff as a branch, so there's more to it than lying down in the leaves." },
        { id = "hly_pet", when = { class = "HUNTER", pet = { named = true } },
          text = "Your {pet} will keep you warmer than any blanket if you let it lie on the windward side, and you'd be surprised how many hunters get that backwards." },
      },
      choices = {
        { text = "Then teach me properly.", next = "teach", fx = { learn = { "camping" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Not so very different, though I build a fire and you'd rather not, because the Circle says even a small flame makes the young tree flinch. I keep mine small and put it out properly, and I'd like to think Teldrassil forgives me." } },
      choices = {
        { text = "The Circle is right, and a druid should sleep without fire.", next = "BACK", reply = "It is, and I do not disagree, though I build mine anyway. The Circle forgives me, mostly.", fx = { align = { order = 1 } } },
        { text = "A small, careful fire does the forest no harm.", next = "BACK", reply = "It does not, and I am glad to hear a druid say it. The Circle is too strict, sometimes.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Anyone can, though you'll find the woods go very quiet around you, and quiet woods are hard to sleep in. Learn to cook over a small fire and keep your camp tidy, and the forest will forgive you a little." },
      },
      choices = {
        { text = "I'll learn the forest's ways, then.", next = "BACK", reply = "Good. Sit still for an hour tonight and tell me what you heard; most can name three sounds, and there are thirty.", fx = { align = { order = 1 } } },
        { text = "The forest can keep its silence. I sleep fine.", next = "BACK", reply = "Then you will sleep alone, and very soundly. The forest will not mind.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Have you ever prayed under the open sky, with no roof between you and whatever's listening? It's the only way I'd do it." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "You're wearing more metal than I've carried in my whole life, {class}. Have you ever tried sleeping in it under a tree? I'd like to watch." },
        { id = "h_default", key = true,
          text = "I am Lyreena Duskblade. I'd rather sleep beneath the canopy with Elune's light in the leaves than under any roof, and if you want to learn how, I'll teach you." },
        { id = "h_outdoors", tags = { "news" }, when = { questActive = TODO_QUEST("The Great Outdoors") },
          text = "Sit by the fire and stay there until you feel rested through. Rest comes slowly, then all at once." },
        { id = "h_stars", when = { metBefore = true }, text = "Last night I counted the stars through the leaves until I fell asleep, and I got to forty, which is further than usual." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll sleep in the wilds often enough on campaign, so you might as well learn to do it well." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! You'll already know half of what I teach, since your kind sleep under the leaves as easily as most folk sleep in a bed." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock, out here by my fire. Your servant can sit on the far side of it if it likes, though I'd rather it didn't count the stars with me." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Sit by my fire, if you like. My people have slept under the stars since before there were roofs, and I'd guess your spirits like the open sky as well." },
      },
      again = {
        { id = "h_again", text = "Anything else? The fire's still going, so there's no hurry." },
      },
      choices = {
        { text = "Teach me.", next = "teach", fx = { affinity = 2, learn = { "camping" } } },
        { text = "Why sleep outdoors?", next = "why" },
        { text = "You look like you've camped in a good many places.", next = "where" },
        { text = "I'm a cook. What can I bring to a camp?", next = "cook", when = { profession = "Cooking" } },
        { text = "A hunter sleeps outdoors already.", next = "hunter_ly", when = { class = "HUNTER" } },
        { text = "I sleep light and move quietly. What else is there to learn?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I can conjure water. Camping's simple for me.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Can a warrior learn to sleep outdoors as you do?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you really prefer to pray under the canopy?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Can a paladin learn to camp in full armor?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is camping in the wild really so different from a druid's way?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Can a warlock camp as you do, Lyreena?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Why do you prefer the canopy to a roof, Lyreena?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Not now.", next = "END" },
      },
    },
    teach = {
      lines = { { id = "t_default", text = "Sit by the fire and rest. Stay a few minutes and you'll feel it settle in. Then learn a trade in Dolanaar; every trade brings something to a camp." } },
      choices = {
        { text = "What does each trade bring?", next = "trades" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trades = {
      lines = { { id = "tr_default", text = "A leatherworker brings a tent, a fisher brings a rack and a cook brings a pot. Put them round a fire, and a camp starts to feel like a house without walls." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "camping" } } } },
    },
    why = {
      lines = { { id = "w_default", text = "Roofs keep the rain off and the stars out. I'd rather get wet." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    where = {
      lines = { { id = "wh_default", text = "Wherever the road ran out. I don't keep a list of them; lists are for innkeepers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cook = {
      lines = { { id = "c_default", text = "The first thing: the fire. A basic campfire is a cook's trick, and everything else in a camp gathers round it." } },
      choices = { { text = "Then I'll build one.", next = "BACK", fx = { affinity = 1, learn = { "camping" } } } },
    },
  },

  topics = {
    camping = { { id = "tp_camping", text = "A fire, first. Then each trade brings its piece: a tent, a rack for fish, a pot. Anyone who passes may share it." } },
    background = { { id = "tp_bg", text = "I'd rather sleep under the canopy than under a roof. That's most of my story." } },
    advice = { { id = "tp_ad", text = "Sit by a fire before you sleep, even a small one. You wake up a different person." } },
    timbermaw = { { id = "tp_timbermaw", text = "I've camped near Timbermaw ground in Felwood, and they knew I was there before I'd lit a fire. They let me sleep, which is a kind of welcome." } },
    centaur = { { id = "tp_centaur", text = "Centaur don't camp, from what the scouts say; they just ride until the beasts drop. I like a good night's sleep too much to respect that." } },
    everlook = { { id = "tp_everlook", text = "Winterspring's beautiful and Everlook is the only roof for miles. I've slept outside it in the snow, and I don't recommend it, though the stars were very good." } },
    _none = { { id = "tp_none", text = "I am only passing through, as my people have passed through forests since long before the maps were drawn, so ask in the village." } },
  },
}
