-- Dolanaar: Teldrassil's crossroads village between Shadowglen and Darnassus. Voice: bibles/teldrassil.md
-- Classic quests only. Nobody blames the Arch Druid for the tree's troubles; they only notice them.
local P = RPGDialogueAPI:Pack("rpgd.teldrassil")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "corithras", id = TODO_NPC("Corithras Moonrage"), name = "Corithras Moonrage",
  bible = "bibles/teldrassil.md", role = "questgiver", tier = "quest",
  communities = { "dolanaar" }, temper = { "grave" }, values = { "devout", "dutiful" },
  notices = { "class" },
  impression = {
    first = "Corithras Moonrage tastes the moonwells himself and swears the third one is wrong. The Sentinels think he fusses, but I have rarely seen anyone so certain and so quietly afraid.",
    third = "{name} met Corithras Moonrage, the grave keeper of Teldrassil's moonwells, who watches the young tree like a feverish child.",
  },

  greetings = {
    { id = "g_well", text = "The moonwells of Teldrassil each have a voice. Listen, and you'll hear that they don't all sing the same note." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "DRUID" } },
      text = "You serve Elune, or the wild. Either way, you'll feel what I feel in the wells. Tell me if I'm wrong." },
  },

  start = "hello",
  nodes = {
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The nightsabers near the third well have grown thin and short-tempered, and the owls no longer roost above it at dusk. A hunter would see such things sooner than a keeper of wells, so tell me what you find when you pass that way." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Watch whether your {pet} will drink from the third well, for I have seen beasts turn away from it. They always know first." },
      },
      choices = {
        { text = "I'll watch the beasts at the wells and report.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Thin beasts are just thin beasts. You fret too much.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Then you would see more than I have, for I watch openly and whatever does this waits until I am gone. Keep to the shadow of the trees near the well and stay until dawn, and tell me what comes to drink." },
        { id = "xro_nightelf", when = { race = "NightElf" }, text = "You walk as the Sentinels' scouts do, and the shadows suit you. Keep to the trees beside the well and stay until dawn, and tell me what comes to drink." },
      },
      choices = {
        { text = "I'll watch and report, and touch nothing.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If I catch it at the well, I'll end it there.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What is wrong with the wells?", next = "wells" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "I am sure you could, and that is little comfort to me. The moonwells are Elune's, and it was the Highborne's hunger for magic like yours that brought the Legion and broke the world, so forgive me if I would rather a druid looked first." },
        { id = "xma_gnome", when = { race = "Gnome" }, text = "Your people never knew the Well of Eternity, so I will not lay its ruin at your feet. But the moonwells are Elune's, and I would rather no spell of yours touched them while a druid can look instead." },
      },
      choices = {
        { text = "I understand. I'll keep my magic away from them.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Fear of magic didn't save your Well either.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Which wells are affected?", next = "which" },
      },
    },
    warrior_c = {
      lines = {
        { id = "wc_default", text = "That's a warrior's answer, and some days it's the right one. But the sickness in these wells has no throat to cut yet, so carry the vial first, and keep the blade for whatever we find at the bottom of it." },
      },
      choices = {
        { text = "Then I'll wait until there's something to strike.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Waiting is how things get worse.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Corithras Moonrage. I watch the moonwells of Teldrassil. Something is wrong with them, and I mean to learn what." },
        { id = "h_crown", tags = { "news" }, when = { questActive = TODO_QUEST("Crown of the Earth") },
          text = "Tenaron sent the vessel; good. Fill a phial at each well I name and bring it back to me, for the waters will tell us what the tree will not." },
        { id = "h_third", when = { metBefore = true }, text = "I tasted the third well again at dawn, and it is still wrong. I've stopped telling the Sentinels, because they think I fuss." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The wells shine brightest now. It's easier to see what's wrong in them with Elune watching too." },
        { id = "h_delivered", when = { questDone = TODO_QUEST("Crown of the Earth") },
          text = "The vessel reached the Archdruid, I hear, and he said we took our time over it. We did, and the wells deserved that much." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. The beasts drink from the moonwells as we do, and you would notice sooner than I if they had begun to sicken." },
      },
      again = {
        { id = "h_again", text = "What else? Speak softly near the well." },
        { id = "h_again2", text = "Ask what you like. The water is patient, and so am I." },
      },
      choices = {
        { text = "What's wrong with the wells?", next = "wells" },
        { text = "Tell me the story Tenaron began.", next = "story" },
        { text = "Which wells do you watch?", next = "which" },
        { text = "I can feel something in the water too.", next = "feel", when = { class = { "PRIEST", "DRUID" } } },
        { text = "I'll carry the vial.", next = "END", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If something fouls the wells, I'll cut it down.", next = "warrior_c", when = { class = "WARRIOR" } },
        { text = "I can watch the wells unseen and see who fouls them.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I could sense what has tainted the wells.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Have the beasts near the moonwells changed, Corithras?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Wells go stale, and I doubt the tree's in any danger.", next = "END", fx = { affinity = -1, align = { light = -1 } } },
      },
    },
    wells = {
      big = true,
      lines = {
        { id = "w_default", text = "Small things. A taste that wasn't there. A shimmer that's a shade off. Teldrassil is young, and young things are easily hurt." },
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
      lines = { { id = "s_default", text = "After Hyjal we were lost. Nordrassil smoked, our immortality was gone, Malfurion vanished. The Arch Druid convinced the Circle it was time to rebuild." } },
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
    _none = { { id = "tp_none", text = "The wells don't speak of that, and neither can I." } },
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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "If they come at you, you must, because they have stopped hearing reason and they will tear you open if you hesitate. But they were our friends once, warrior, so fight them as you would a friend who has lost his mind, and take no joy in it." } },
      choices = {
        { text = "I'll fight them, but I won't take joy in it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A foe is a foe, whatever they once were.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xlock = {
      lines = {
        { id = "xwl_default", text = "You know it, and I would very much like to know how. Fel is the Legion's mark, the thing that burned Hyjal, and yet if you can lead me to where it grows thickest, I will listen to you before I judge you." },
      },
      choices = {
        { text = "I'll help you burn it out, and then I'll leave.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It's power, druid. Fear won't keep it away.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What is driving the furbolgs mad?", next = "moss" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "They were our friends, and I would know what turned them before any more of them are killed. Get close to their camps and watch the shaman, for if something is whispering to them, it will be whispering there." },
      },
      choices = {
        { text = "I'll only watch. They deserve a chance.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If the shaman's to blame, I'll remove him quietly.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Were they really your friends?", next = "friends" },
      },
    },
    hunter_a = {
      lines = {
        { id = "ha_default", text = "Rabid is the right word, and it grieves me to hear a hunter say it so easily. The Gnarlpine kept these woods with us for longer than you've been alive, so take what you must, but look at their eyes before you loose, and tell me what you see." },
      },
      choices = {
        { text = "I'll hunt them as I'd hunt any sick beast.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll spare any I can. They didn't choose this.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "What should I look for?", next = "moss" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Athridas Bearmantle, a druid of Dolanaar, and the Gnarlpine furbolgs are my concern. They were never our enemies, but they are now." },
        { id = "h_corruption", tags = { "news" }, when = { questActive = TODO_QUEST("Gnarlpine Corruption") },
          text = "Ursal and the Fel Moss? By the stars, then Gaerolas was right to fear for the barrow den, and we may already be too late." },
        { id = "h_relics", when = { questActive = TODO_QUEST("The Relics of Wakening") },
          text = "Gnarlpine raiders are in the Ban'ethil Barrow Den. The sleeping druids can't wake without the Relics of Wakening. Bring them to me." },
        { id = "h_ursal", when = { questActive = TODO_QUEST("Ursal the Mauler") },
          text = "Ursal drove the Gnarlpine mad with Fel Moss, and the waking ritual cannot be finished while he lives, so end him." },
        { id = "h_breeze", when = { questActive = TODO_QUEST("A Troubling Breeze") },
          text = "Gaerolas Talvethren hasn't sent word from Starbreeze Village. He wards the sleeping Druids of the Talon. Go east and bring me his report." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. The Gnarlpine are not your enemies by choice, so remember that when you draw on them." },
      },
      again = {
        { id = "h_again", text = "What else? Speak quickly, if you would." },
        { id = "h_again2", text = "Speak, then, for the Gnarlpine won't wait on us." },
      },
      choices = {
        { text = "Were the Gnarlpine ever friends?", next = "friends" },
        { text = "Can the furbolgs be saved?", next = "saved" },
        { text = "Who are the sleeping druids?", next = "talon" },
        { text = "I can tell a sick beast from an angry one.", next = "druidtest", when = { class = "DRUID" } },
        { text = "I've hunted Gnarlpine. They fought like rabid wolves.", next = "hunter_a", when = { class = "HUNTER" } },
        { text = "That fel moss. I know the stink of it.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "I could get close enough to the Gnarlpine to see what's turned them.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Must I fight the Gnarlpine, Athridas?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
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
        { id = "f_trade", text = "When the tree was young, yes. They kept to their hills in peace, and the Sentinels called them friends. I miss that more than I expected to." },
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
      lines = { { id = "t_default", text = "They are the Druids of the Talon, hibernating in the Ban'ethil Barrow Den by a pact with Ysera, and Gaerolas guards them. Disturb the ritual wrongly and they could be lost in the Dream." } },
      choices = {
        { text = "Lost in the Dream?", next = "talon2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    talon2 = {
      lines = { { id = "t2_default", text = "Their spirits walk the Dream while they sleep. Without the right relics, the waking can't be done, and they'd sleep forever without knowing it." } },
      choices = {
        { text = "Then the relics matter.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If they chose to sleep, then let them sleep.", next = "BACK", fx = { align = { light = -1 } } },
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
    advice = { { id = "tp_ad", text = "Don't fight a furbolg in its own hills. Draw it out where you can see the trees around you." } },
    fel_moss = { { id = "tp_moss", text = "It is the Gnarlpine's ruin, for wherever it grows, they turn." } },
    furbolgs = { { id = "tp_furbolgs", text = "They were peaceful, once. Ask me again when Ursal is dead." } },
    cenarion_circle = { { id = "tp_circle", text = "I serve the Circle as best I can from Dolanaar. They have bigger worries than furbolgs. Somebody has to have this one." } },
    _none = { { id = "tp_none", text = "That's not my concern; the Gnarlpine are." } },
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
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 8 },
      text = "Fresh from Shadowglen. The road to Darnassus runs through here; most of what you'll need, you'll learn on the way." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I need their mystic Ferocitas to stop feeding on the dreams he stole from me, and I need the young ones guarding my groves to stop getting hurt. Go to the Gnarlpine camps if you will, and come back whole, because I am tired of mourning." } },
      choices = {
        { text = "I'll come back whole, and bring your dreamcatcher.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll go in hard, and I won't count their dead.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They've driven the deer from the southern groves and left snares where the nightsabers walk, which no furbolg would have done a year ago. Whatever is in them now has forgotten the old ways of the forest, and the beasts have learned to fear them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Mind your {pet} near the southern groves, for the Gnarlpine snares were not set for deer. I've freed two young cats from them this month." },
      },
      choices = {
        { text = "I'll clear their snares and spare what I can.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll turn their own snares back on them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    rogue_t = {
      lines = {
        { id = "rt_default", text = "Could you? The furbolgs sleep in my neighbours' beds now and they wake at a twig snapping, so if you can get in and out of my house without a fight, you're a better thief than I'd like to know about." },
      },
      choices = {
        { text = "No one need ever know I was there.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "I'd rather they knew who took it back.", next = "BACK", fx = { align = { honor = 1 }, trait = { brave = 1 } } },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Tallonkai Swiftroot. The Gnarlpine have grown bold, and they hold something of mine. I'd like it back, and I'd like them to stop." },
        { id = "h_dreamcatcher", tags = { "news" }, when = { questActive = TODO_QUEST("The Emerald Dreamcatcher") },
          text = "My dreamcatcher is still in my dresser in Starbreeze Village, and the furbolgs hold Starbreeze now. Bring it back, please." },
        { id = "h_ferocitas", when = { questActive = TODO_QUEST("Ferocitas the Dream Eater") },
          text = "Ferocitas the Dream Eater has the jewel from my dreamcatcher. He's north of Starbreeze. Bring it back, and I can mend the thing." },
        { id = "h_twisted", when = { questActive = TODO_QUEST("Twisted Hatred") },
          text = "Lord Melenas is a satyr, and he has gathered grells in Fel Rock to the north. Deal with him quickly and quietly, bring me his head, and say nothing of it to anyone." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Good, because the Gnarlpine have grown bold, and they listen to a blade sooner than to words." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. The Gnarlpine hunt my groves now, and I would like to see someone hunt them back." },
      },
      again = {
        { id = "h_again", text = "Anything else, young one?" },
        { id = "h_again2", text = "Go on, I'm listening." },
      },
      choices = {
        { text = "What was the dreamcatcher to you?", next = "dreamcatcher" },
        { text = "What happened to Starbreeze Village?", next = "starbreeze" },
        { text = "Who is Lord Melenas?", next = "melenas", when = { questActive = TODO_QUEST("Twisted Hatred") } },
        { text = "I could slip into Starbreeze and take it back unseen.", next = "rogue_t", when = { class = "ROGUE" } },
        { text = "I'll protect the village.", next = "END", fx = { affinity = 2, standing = { dolanaar = 1 } } },
        { text = "Do you need a blade against the Gnarlpine, Tallonkai?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "How have the Gnarlpine changed the hunting in these woods?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
      },
    },
    dreamcatcher = {
      lines = {
        { id = "d_gift", text = "A gift from Gaerolas Talvethren, who wards the sleeping druids. It draws a little luck out of the Emerald Dream. Few are ever given one." },
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
      lines = { { id = "sb_default", text = "The Gnarlpine overran it. It was a quiet place once. My dresser is still there, and so is everything else we left behind." } },
      choices = {
        { text = "Will you go back?", next = "starbreeze2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    starbreeze2 = {
      lines = { { id = "sb2_default", text = "When it's safe, and not before. Teldrassil has enough brave fools in it already, and I'd rather be a careful one." } },
      choices = {
        { text = "Wise.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "I'll make it safe.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },
    melenas = {
      lines = { { id = "me_default", text = "He is a satyr, and his story shames us; it is too close to home for me to tell. Let it be enough that trust must be earned." } },
      choices = { { text = "I won't ask again.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "My dresser is still in Starbreeze Village, if that tells you anything. These days I stay wherever the Gnarlpine aren't." } },
    advice = { { id = "tp_ad", text = "Help where the forest needs it. Dolanaar notices who does." } },
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
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The ones nobody wants: thinning the mangy nightsabers that have turned on travellers, and carrying soil to Denalan at the lake, which sounds dull until the timberlings come at you. Those orders wait the longest, and things only get worse the longer they wait." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} can follow a scent better than any order I could write. Let it lead, and I'll mark the task done when you're back." },
      },
      choices = {
        { text = "Give me the orders that have waited longest.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll pick my own hunts, thank you.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "The Council does not deal in discretion, as a rule, but the forest sometimes must. Zenn Foulhoof is up to something in the wilds, and someone who goes unnoticed might learn what before he sees them coming." },
      },
      choices = {
        { text = "I'll learn what I can and bring it straight to you.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll learn it, and decide what to do with it myself.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Who is Zenn?", next = "zenn" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "The Council of the Forest has very little to do with mages, and would prefer to keep it that way. You are a guest on Teldrassil, so walk gently, and if you must cast, cast at what attacks you and nothing else." },
      },
      choices = {
        { text = "I'll respect the Council's wishes.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Magic isn't the Council's to ration.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What is the Council, exactly?", next = "council" },
      },
    },
    warrior_sy = {
      lines = {
        { id = "wsy_default", text = "The Council has no shortage of those, and most of them involve Zenn Foulhoof's errands or Denalan's lake, which the young ones avoid. Ask me for the dull orders, though, and I'll know you're serious." },
      },
      choices = {
        { text = "I'll take the dull ones. Someone must.", next = "BACK", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "Dull orders are for other people.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Syral Bladeleaf. I carry the Council of the Forest's orders to those who'll follow them. There are always more orders than hands." },
        { id = "h_redemption", tags = { "news" }, when = { questActive = TODO_QUEST("Seek Redemption!") },
          text = "The Council knows you ran errands for Zenn Foulhoof. Feed that satyr a few fel cones, and the forest will call it even." },
        { id = "h_denalan", when = { questActive = TODO_QUEST("Denalan's Earth") },
          text = "Denalan studies Teldrassil's plants at Lake Al'Ameth. His rare earth from Darnassus came late. Take it to him, please." },
        { id = "h_sort", when = { metBefore = true }, text = "The Council sends more orders than Dolanaar has hands. I sort them by which ones get someone hurt if they wait." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. The Council always has more orders than hands, and hunters can carry the ones that lead into the deep wood." },
      },
      again = {
        { id = "h_again", text = "What else? There are always more orders." },
        { id = "h_again2", text = "Speak, and I'll find you something useful." },
      },
      choices = {
        { text = "What is the Council of the Forest?", next = "council" },
        { text = "Who is Denalan?", next = "denalan" },
        { text = "Who is Zenn Foulhoof?", next = "zenn" },
        { text = "I'm an herbalist. What grows here?", next = "herbs", when = { profession = "Herbalism" } },
        { text = "I'll take on the Council's orders.", next = "END", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Give me the orders nobody else will take.", next = "warrior_sy", when = { class = "WARRIOR" } },
        { text = "Have you any orders for someone discreet?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Does the Council have any work for a mage?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Which of the Council's orders suit a hunter, Syral?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'll help where I see a need, not where the Council points.", next = "END", fx = { align = { order = -1 } } },
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
      lines = { { id = "z_default", text = "A satyr by the road who asks young ones for favours. He calls it business. The Council keeps track of who helps him." } },
      choices = {
        { text = "I helped him. I didn't know.", next = "zenn2", when = { questDone = TODO_QUEST("Zenn's Bidding") } },
        { text = "I'll stay away from him.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Whose favours I do is my own business.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
      },
    },
    zenn2 = {
      lines = { { id = "z2_default", text = "Then set it right. Fel cones fall under the trees, smoking green; feed him a few, and he'll think you've brought him a snack." } },
      choices = {
        { text = "I'll set it right.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "The Council can keep its tally, because I owe it nothing.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "That's a dirty trick.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    herbs = {
      lines = { { id = "h2_default", text = "Then you'll see what I mean about the soil: the plants are still deciding what to be. Show Denalan whatever looks wrong to you." } },
      choices = { { text = "I will.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I carry the Council's orders. If I had a story, I'd have had to file it." } },
    advice = { { id = "tp_ad", text = "Don't make bargains with anything that has hooves and smiles." } },
    _none = { { id = "tp_none", text = "The Council hasn't spoken on that, so neither will I." } },
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
    { id = "g_inn", text = "Rest a while; the inn is yours for as long as you need it." },
    { id = "g_home", when = { homeInn = { "Dolanaar" } }, text = "Welcome home. The fire's low and warm, the way you like it." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You've had a hard road back from somewhere grey. Sit down; Elune's light reaches the inn too." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Most of them, fresh from Kyra Windblade's lessons and sure they're ready for Ashenvale already. I pour them tea and let them talk, and by the second cup they usually admit they'd like a bed before they go." } },
      choices = {
        { text = "I'll rest first. Ashenvale can wait a night.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "No bed for me. The front won't wait.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Some sleep here and some under the trees, and Lyreena Duskblade will tell you the trees are better, though she's always grateful for my tea in the morning. Either way I like to know who's out there, so tell me if you mean to camp." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} can curl up by the hearth if it likes; the last companion who did wouldn't leave for two days. Travellers leave lighter here, and so do their beasts." },
      },
      choices = {
        { text = "A warm bed tonight. A roof is a blessing.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll camp under the trees. Roofs make me restless.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "You are welcome to a bed, of course; I turn no traveler away. I ask only that you leave your spells at the door, for the old tree hears more than you would think, and Dolanaar remembers what spellcraft cost our people." },
        { id = "xma_gnome", when = { race = "Gnome" }, text = "You are a long way from your mountain, and you are welcome to a bed. I ask only what I ask of every mage, that you leave your spells at the door, for Dolanaar remembers what spellcraft cost our people." },
      },
      choices = {
        { text = "Of course. Your house, your rules.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My spells go where I go, innkeeper.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Who usually stays here?", next = "inn" },
      },
    },
    xlock = {
      lines = {
        { id = "xwl_default", text = "I can see why. There is a smell on you of something that never grew on any tree, and my guests are kaldorei who remember Hyjal, so you may have the room at the end, and I'd be grateful if you were on the road by morning." },
      },
      choices = {
        { text = "I'll leave quietly at first light.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Hyjal was long ago. The power is still useful.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What's on the road ahead?", next = "road" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Innkeeper Keldamyr. Travelers between Shadowglen and Darnassus all stop here, sooner or later. I like to think they leave lighter." },
        { id = "h_delivery", when = { questActive = TODO_QUEST("Dolanaar Delivery") },
          text = "So these are the herbs from Porthannius. It's a pity he couldn't bring them himself, for we've a great deal to talk about, he and I." },
        { id = "h_joke", when = { metBefore = true }, text = "A Sentinel told me a joke last night. It wasn't funny, but she laughed so hard I laughed too. That's the inn on a good night." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "It's late, and the Sentinels coming off watch will want tea. They always want tea, and they never admit they're cold." },
        { id = "h_corithras", when = { heardLine = "corithras.h_default" }, text = "Corithras and his wells. He tastes every one himself, you know, to find the trouble. I keep peppermint tea for him after." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Sit and take the armor off for an hour, because tea doesn't taste right through a helmet." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. Your companion is welcome by the fire, so long as it doesn't mind the other guests' boots." },
      },
      again = {
        { id = "h_again", text = "Anything else I can do for you? There's tea, if you'd like some." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "How's the inn?", next = "inn" },
        { text = "Any word from the road?", next = "road" },
        { text = "Is a mage welcome under your roof?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do many warriors stop here on the way to Darnassus?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do hunters stay at the inn, or sleep in the woods?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'll need a room away from the others.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
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
      lines = { { id = "r_default", text = "The Gnarlpine grow bolder every week. Sentinel Kyra takes her rest here when she's off the road; ask her, she'll tell you plainly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everyone passing between Shadowglen and Darnassus stops here, and they leave a little news behind with the crumbs. Ask me what you like." },
    },
    background = { { id = "tp_bg", text = "I keep a fire lit between Shadowglen and Darnassus. It's a good place for a fire." } },
    advice = { { id = "tp_ad", text = "Rest when you can. A body and mind left without peace give out at the worst moment." } },
    _none = { { id = "tp_none", text = "I hear only the gentle gossip. Ask a Sentinel for the other kind." } },
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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Easier than you'd think, once you take the armor off and stop listening for every snapped twig. Pick a spot with your back to a trunk, count the stars through the leaves, and let the forest keep watch for a while." } },
      choices = {
        { text = "I'll trust the forest and sleep.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll sleep in my armor with my sword in hand.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Plenty, if you mean to sleep in the wild and wake up with your purse and your throat. A rogue's camp is a cold camp, with no smoke and no fire, and that is the first thing I would teach you." },
      },
      choices = {
        { text = "Teach me properly. I'll do it your way.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll take the useful bits and leave the rest.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Why sleep outside at all?", next = "why" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Simple until the spell runs dry or you're too tired to cast it, and then you'll wish you knew which stream runs clean. The forest gives water to anyone who knows how to ask, and it doesn't care if you're tired." },
      },
      choices = {
        { text = "Then teach me the forest's way.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll trust my spells over a stream.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What else do you teach?", next = "teach" },
      },
    },
    hunter_ly = {
      lines = {
        { id = "hly_default", text = "Sleeps, maybe, but does she sleep well? Most hunters I meet curl up with their companions and wake stiff as a branch, so there's more to it than lying down in the leaves." },
        { id = "hly_pet", when = { class = "HUNTER", pet = { named = true } },
          text = "And {pet} will keep you warmer than any blanket, if you let it lie on the windward side. You'd be surprised how many hunters get that backwards." },
      },
      choices = {
        { text = "Then teach me properly.", next = "teach", fx = { learn = { "camping" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Lyreena Duskblade. I'd rather sleep under the canopy than under a roof. If you want to learn how, I'll teach you." },
        { id = "h_outdoors", tags = { "news" }, when = { questActive = TODO_QUEST("The Great Outdoors") },
          text = "Sit by the fire and stay there until you feel rested through. It comes slowly, then all at once." },
        { id = "h_stars", when = { metBefore = true }, text = "Last night I counted the stars through the leaves until I fell asleep, and I got to forty, which is further than usual." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll sleep in the wilds often enough on campaign, so you might as well learn to do it well." },
      },
      again = {
        { id = "h_again", text = "Anything else? The fire's still going, so there's no hurry." },
      },
      choices = {
        { text = "Teach me.", next = "teach", fx = { affinity = 2, learn = { "camping" } } },
        { text = "Why sleep outdoors?", next = "why" },
        { text = "Where have you camped?", next = "where" },
        { text = "I'm a cook. What can I bring to a camp?", next = "cook", when = { profession = "Cooking" } },
        { text = "A hunter sleeps outdoors already.", next = "hunter_ly", when = { class = "HUNTER" } },
        { text = "I sleep light and move quietly. What else is there to learn?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I can conjure water. Camping's simple for me.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Can a warrior learn to sleep outdoors as you do?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
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
    _none = { { id = "tp_none", text = "I'm only passing through, I'm afraid, so ask in the village." } },
  },
}
