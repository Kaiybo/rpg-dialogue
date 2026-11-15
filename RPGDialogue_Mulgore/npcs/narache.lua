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
      },
      choices = {
        { text = "Tell me about the Greatmother.", next = "greatmother" },
        { text = "I'll do what's asked.", next = "END", fx = { affinity = 2, standing = { narache = 1 } } },
      },
    },
    greatmother = {
      big = true,
      lines = {
        { id = "gm_default", text = "The Bristleback came into our lands, and she fell before them. Every brave who trains at this camp honors her, and so will you, by doing well." },
      },
      choices = {
        { text = "She sounds brave.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then let's make them pay.", next = "END", fx = { affinity = 1, trait = { stern = 1 } } },
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
      },
      choices = {
        { text = "Will you lead well?", next = "lead" },
        { text = "Good hunting, Grull.", next = "END" },
      },
    },
    lead = {
      lines = { { id = "l_default", text = "I'll lead the way my grandmother did, from the front. If that's not well, the tribe can tell me so." } },
      choices = {
        { text = "I believe you.", next = "END", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "A wise chief leads from where the spears can't reach.", next = "END", fx = { align = { honor = -1 } } },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask my father. I'm better at the hunt than at answers." } },
  },
}
