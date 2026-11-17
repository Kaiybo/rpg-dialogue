-- Camp Narache: the Hawkwind tribe's camp, still grieving the Greatmother. Voice: bibles/mulgore.md
local P = RPGDialogueAPI:Pack("rpgd.mulgore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "hawkwind", id = TODO_NPC("Chief Hawkwind"), name = "Chief Hawkwind",
  bible = "bibles/mulgore.md", role = "noble", tier = "major",
  communities = { "narache" }, temper = { "resolute" }, values = { "dutiful", "protective" },
  notices = { "greenness", "race" },
  impression = {
    first = "Since the Bristleback killed his mother, the Greatmother, Chief Hawkwind has mourned her by standing straighter. Every task he gives seems meant to teach the young of his camp to do the same.",
    third = "{name} met Chief Hawkwind at Camp Narache, who leads the young of his tribe through their first rites.",
  },

  greetings = {
    { id = "g_camp", text = "Welcome to the Hawkwind's fire. Sit if you're tired, or stand if you're ready to work." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned to the fire, and the tribe notices." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 3 },
      text = "So young, and already sent to me. Good. The Earth Mother tests early those she means to keep." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A child of the plains. Every one of you who stands up makes the Greatmother's absence lighter." },
  },

  start = "hello",
  nodes = {
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "My people have sung her to the Earth Mother already, but a prayer from a stranger would honour her too, because she always said the Horde would teach us new ways of honouring the dead. Say it standing straight, and she will hear it." } },
      choices = {
        { text = "I'll say it gladly, Chief, standing straight.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Your rites are enough. She has no need of mine.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Chief.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Then they'll know how my mother felt when they came for her. I won't pretend I don't want them to suffer, but a tauren grieves standing up, so do your work in Brambleblade Ravine and let the camp see you come back with your head high." },
      },
      choices = {
        { text = "I'll come back with my head high, Chief.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Grief can wait. The quilboar die first, unseen.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What was the Greatmother like?", next = "greatmother" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Nothing would have saved her that night but more spears and better luck. The arcane is a strange power to my people, and I'll not curse it, but I'll not wish it here either, because Narache is a place for the young to learn the old ways first." },
      },
      choices = {
        { text = "The old ways first. I understand, Chief.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Your young would be safer if they learned new ways.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Will you tell me about the Greatmother?", next = "greatmother" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "I'll trust what you do, not what you carry, because my mother taught me that much before the Bristleback took her. The orcs say their warlocks once nearly destroyed them, so serve the Horde and I'll remember it, and if you serve something else, I'll remember that too." },
      },
      choices = {
        { text = "I serve the Horde, Chief, and I'll show it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I serve my own path. Judge me by my deeds.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Hawkwind, chief of this camp. The Bristleback took my mother from us, the Greatmother of this tribe, and we mourn her by standing straighter, not by bending." },
        { id = "h_humble", tags = { "news" }, when = { questActive = TODO_QUEST("A Humble Task") },
          text = "A humble task first, for every great hunter's first task was humble. Do it well anyway." },
        { id = "h_rites", when = { questActive = TODO_QUEST("Rites of the Earthmother") },
          text = "The rites of the Earthmother are older than this camp, older than the bluffs. Walk them with respect." },
        { id = "h_strength", when = { questActive = TODO_QUEST("Rite of Strength") },
          text = "The rite of strength asks what you'll do when it hurts. Answer it well." },
        { id = "h_adventurer", when = { questActive = TODO_QUEST("The Adventurer") },
          text = "Before you leave Mulgore, take this bundle to Kaga Wildhoof, camped outside Bloodhoof. She helped us when we needed it. I'd like to repay her." },
        { id = "h_attack", when = { questActive = TODO_QUEST("Attack on Camp Narache") },
          text = "They came to our camp with fire and spears, and now we go to theirs. Make them remember the Hawkwind." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "The spirits have touched you, young one, and I can see it in the way you stand. My mother would have wanted you beside her at the rites." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde at Narache. My mother would have welcomed you, because the Greatmother believed every healer was a gift from the Earth Mother, whatever name they gave it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock in Narache. My mother would have welcomed you, so I will too, but I will be watching you." },
      },
      choices = {
        { text = "Tell me about the Greatmother.", next = "greatmother" },
        { text = "I'm ready for the Rite of Strength, Chief.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Where should a hunter go first, Chief?", next = "hunter", when = { class = "HUNTER" } },
        { text = "The trainer says I'm to be a druid.", next = "druid", when = { race = "Tauren", class = "DRUID" } },
        { text = "I was born Grimtotem, Chief. I chose Bloodhoof.", next = "grimtotem", when = { origin = "tauren_grimtotem_born" } },
        { text = "Did the Greatmother walk with the spirits, Chief?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "The Bristleback won't see me coming, Chief.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Could the arcane have saved the Greatmother, Chief?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Would you want a prayer said for the Greatmother, Chief?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Will you trust a warlock in your camp, Chief?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "I'll do what's asked.", next = "END", fx = { affinity = 2, standing = { narache = 1 } } },
      },
      again = {
        { id = "h_again", text = "What else? The fire is warm, and I can spare a little of it." },
        { id = "h_again2", text = "Speak, young one. A chief listens before he sends." },
      },
    },
    warrior = {
      big = true,
      lines = { { id = "wa_default", text = "Are you? The rite doesn't ask how hard you hit; it asks whether you'll keep going when the boars hit back. My mother fell to the Bristleback, and this tribe honors her by standing up again each morning; that is the strength the rite looks for." } },
      choices = {
        { text = "Then I'll stand as she stood.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I'd rather live to fight again than fall like that.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "To Grull, who leads our hunts, and then out among the plainstriders, because a hunter's first kill should be something that runs. Bring the meat back to the fire, and the tribe will know your name." },
        { id = "hu_pet", when = { pet = { type = "Beast" } },
          text = "And bring {pet} back to the fire too. The braves will want to see a beast that chose to walk beside one of us." },
      },
      choices = { { text = "I'll go to Grull.", next = "BACK", fx = { affinity = 1, standing = { narache = 1 } } } },
    },
    druid = {
      lines = { { id = "dr_default", text = "Then the Earth Mother has plans for you, and I won't stand in their way. Go to your trainer when you're called, and one day go up to Hamuul on the bluffs, who will teach you what no one at this fire can." } },
      choices = { { text = "I'll make the camp proud.", next = "BACK", fx = { affinity = 2, standing = { narache = 1 } } } },
    },
    grimtotem = {
      lines = { { id = "gt_default", text = "I know. The braves told me before you'd reached the fire. Your birth isn't your fault, and your choice is to your credit, but the Grimtotem don't forgive those who leave them, so watch your back on the bluffs." } },
      choices = {
        { text = "My tribe is the Bloodhoof now.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "The Grimtotem aren't all wrong, Chief.", next = "BACK", fx = { affinity = -2, align = { order = -1 } } },
      },
    },
    greatmother = {
      big = true,
      lines = {
        { id = "gm_default", text = "The Bristleback came into our lands, and she fell before them. Every brave who trains at this camp honors her, and so will you, by doing well." },
      },
      choices = {
        { text = "She sounds brave.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then let's make them pay.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "She did, and the elements answered her more readily than they answer most elders on the bluffs. When the Bristleback came, she called on the earth against them, and it was not enough, so learn faster than she was given time to." } },
      choices = {
        { text = "I'll learn the rites properly, step by step, as she did.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Then I'll find my own way to strength, and quicker.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The hunters bring word back to this fire, and some of it is worth hearing. Ask about these, and I'll tell you what the tribe knows." },
    },
    _none = { { id = "tp_none", text = "Ask in Bloodhoof Village. Baine knows the wider world better than an old chief." } },
  },
}

P:NPC {
  key = "grull", id = TODO_NPC("Grull Hawkwind"), name = "Grull Hawkwind",
  bible = "bibles/mulgore.md", role = "questgiver", tier = "quest",
  communities = { "narache" }, temper = { "fierce" }, values = { "loyal", "brave" },
  notices = { "class" },
  impression = {
    first = "Grull Hawkwind is the Chief's son, and he leads Narache's hunts until the day he leads the camp. He has a fierce kind of eagerness, as though the hunt itself were waiting on him.",
    third = "{name} met Grull Hawkwind, the Chief's son, who leads the hunts of Camp Narache.",
  },

  greetings = {
    { id = "g_hunt", text = "You've come to hunt? Good, because Mulgore is full of things that need hunting." },
    { id = "g_back", when = { metBefore = true }, text = "Ready for more? The hunt doesn't rest, and neither should we." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid! There's a note waiting for you from your trainer. The wild has been asking for you." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter? Then you already know the first lesson: be patient, and then don't be." },
  },

  start = "hello",
  nodes = {
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "If you can keep up! The Bristleback lurk in Brambleblade Ravine, and the plainstriders kick harder than you'd think, so a healer at my back would let me run straight at them. My father says a leader should know when to call for help, and I'm learning." } },
      choices = {
        { text = "I'll keep you standing, Grull. Run as far as you like.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Learn to hunt without a healer, or don't hunt.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Grull.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "That you face the quilboar of Brambleblade Ravine and come back with your strength proven. My father led the hunts before me, and one day I'll lead this camp, so I watch every warrior who walks up that ravine to see what kind of brave they'll become." } },
      choices = {
        { text = "I'll face the Rite with honour, Grull.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Rites are old customs. Strength speaks for itself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "You could, because the plainstriders spook at every tauren hoof and you'd get close enough to count them. Watch the Bristleback camps for me too, because they've been bold since they killed my grandmother, and I want to know where they sleep." },
      },
      choices = {
        { text = "I'll scout, and let your hunters take the kill fairly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Why scout when I can cut them down asleep?", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Welcome, but not with fire, because the grass of Red Cloud Mesa burns and so would all of us. Bring your frost and slow the plainstriders for my braves, and you'll eat first at the feast." },
      },
      choices = {
        { text = "I'll follow your lead on the hunt, Grull.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll hunt my own way, frost or fire.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "He doesn't trust anything that might bite the hand that feeds it, and the orcs say demons always do. I'm curious, though, so if you and your demon hunt the Bristleback with my braves, I'll judge you by what you bring home." },
      },
      choices = {
        { text = "Then I'll hunt beside your braves and honor your father's camp.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Your father's trust isn't something I need.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Grull Hawkwind, the Chief's son. One day I'll lead this camp, and until then, I lead its hunts." },
        { id = "h_hunt", tags = { "news" }, when = { questActive = TODO_QUEST("The Hunt Begins") },
          text = "Plainstriders are fast, stupid, and good eating. Bring me meat and feathers, and we'll call it a start." },
        { id = "h_continues", when = { questActive = TODO_QUEST("The Hunt Continues") },
          text = "The hunt goes on, as it always does. Bring me what the grasslands give you." },
        { id = "h_battleboars", when = { questActive = TODO_QUEST("The Battleboars") },
          text = "The quilboar breed battleboars in a pen to the south. Thin them, and the next raid on this camp comes on foot." },
        { id = "h_note", when = { questActive = TODO_QUEST("Verdant Note") },
          text = "Your trainer wants you, so go; the Hawkwind will still be here." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Good, because the hunt goes better when the wind is on our side, and you can ask it nicely." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. You'll be facing the Rite of Strength, then, because every brave of Narache must prove themselves before they go down to Bloodhoof." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Narache's hunts come home with plenty of scratches, so stay close, because I'd rather lead a hunt with a healer than without one." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue! You'd make a fine scout for my hunts, if you can keep up." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage! Can you light a fire without flint? My hunters would trade a lot for that." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. My father would want me to send you away, but I'd rather see what you can do." },
      },
      choices = {
        { text = "Will you lead well?", next = "lead" },
        { text = "Can my beast hunt beside your braves?", next = "hunter", when = { class = "HUNTER" } },
        { text = "Should a shaman hunt, Grull, or only bless the hunters?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What does the Rite of Strength ask of a warrior, Grull?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Will you take a priest on your next hunt, Grull?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Could a rogue scout your hunts, Grull?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Would a mage be welcome on your hunts, Grull?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Your father doesn't trust warlocks, Grull?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Good hunting, Grull.", next = "END" },
      },
      again = {
        { id = "h_again", text = "What else? Quickly, the plainstriders won't stand still for long." },
      },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "Beside them? In front of them, if it's fast! The braves still hunt the old way, on foot with a spear, and I'd like them to see what a hunter and a beast can do together." },
        { id = "hu_pet", when = { pet = { type = "Beast" } },
          text = "Is that {pet}? Ha, look at it, already sniffing at the plainstrider tracks. Bring it to the southern pens with you; the battleboars won't know what to do." },
      },
      choices = { { text = "We'll show them.", next = "BACK", fx = { affinity = 2 } } },
    },
    lead = {
      lines = { { id = "l_default", text = "I'll lead the way my grandmother did, from the front. If that's not well, the tribe can tell me so." } },
      choices = {
        { text = "I believe you.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "A wise chief leads from where the spears can't reach.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Both, if you ask me, and nobody ever does. A shaman who sits by the fire knows less about plainstriders than one who's chased them, and the Bristleback won't wait for a blessing before they raid." } },
      choices = {
        { text = "I'll hunt beside the braves and earn my place there.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let the spirits strike from afar. I won't risk my own hide.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask my father. I'm better at the hunt than at answers." } },
  },
}
