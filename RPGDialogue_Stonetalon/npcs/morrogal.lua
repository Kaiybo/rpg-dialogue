-- Mor'rogal, tauren shaman at Sun Rock Retreat, uneasy about what the kobolds dig at Boulderslide (0.72.0). Voice: bibles/morrogal.md
-- Classic: Boulderslide Ravine, Earthen Arise (Goggeroc, an earthen sealed in a Resonite cask).
local P = RPGDialogueAPI:Pack("rpgd.stonetalon")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "morrogal", id = TODO_NPC("Mor'rogal"), name = "Mor'rogal",
  bible = "bibles/morrogal.md", role = "questgiver", tier = "quest",
  communities = { "sun_rock" }, temper = { "uneasy", "deliberate" }, values = { "wisdom", "spirits" },
  notices = { "class", "craft" },
  impression = {
    first = "Mor'rogal feels something wrong under the mountains before he can name it, and he hates not being able to name it. He speaks of the earthen with the dread of someone who has only ever heard them in legends.",
    third = "{name} met Mor'rogal, a tauren shaman at Sun Rock Retreat troubled by what the kobolds of Boulderslide Ravine have dug up.",
  },

  greetings = {
    { id = "g_hello", text = "Can you feel the tension in the air, {class}? The stone itself is holding its breath." },
    { id = "g_ravine", when = { questActive = TODO_QUEST("Boulderslide Ravine") }, text = "Resonite, and the depth of that cave. Whatever the kobolds are digging toward, I must know it." },
    { id = "g_earthen", when = { questActive = TODO_QUEST("Earthen Arise") }, text = "Goggeroc will wake weak from his long sleep. That moment is the only one you'll get, so strike then." },
    { id = "g_done", when = { questDone = TODO_QUEST("Earthen Arise") }, text = "The mountain sleeps easier since Goggeroc fell, and so do I. All of Stonetalon owes you, whether it knows it or not." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and back at Sun Rock. The Earth Mother keeps her children's paths winding, but they come home." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You have grown much since you went into that ravine for me. The earth knows your step now, I think." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "The braves of Sun Rock speak well of you. That is no small thing, among folk who say so little." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. Put your hand on the rock here and listen, and tell me if you hear the deep hum too, because I've begun to doubt myself." },
    { id = "n_mine", cat = "craft", when = { profession = "Mining" },
      text = "You carry a miner's pick. Then you'll know that some veins should be left alone, and I fear the kobolds never learned it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Mor'rogal, and I listen to the earth for Sun Rock. Something is amiss beneath these mountains, and the kobolds of Boulderslide Ravine are at the heart of it." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Boulderslide Ravine") },
          text = "Southeast of here lies a deep cave in Boulderslide Ravine, where the kobolds frantically mine a rare crystal called Resonite. Bring me samples, and learn how deep that cave goes, because I must know what evil lurks under these mountains." },
        { id = "h_ravine_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Boulderslide Ravine"), days = 3 } },
          text = "Yes, that's it! The Resonite carries a trace of earthen magic, so the kobolds have dug deep enough to uncover one of the earthen. The legend I couldn't place my hoof on has found me instead." },
        { id = "h_earthen", tags = { "news" }, when = { questActive = TODO_QUEST("Earthen Arise") },
          text = "The cask in that cave holds a slumbering earthen named Goggeroc. I have changed the Resonite with my magic, so take the enchanted crystal, smash the cask open, and slay him before he wakes fully." },
        { id = "h_earthen_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Earthen Arise"), days = 3 } },
          text = "You bear good news, and I am more relieved than I can say. Slaying Goggeroc was a task for a hero, {class}, and you have done it." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "Child of the Earth Mother, you'll feel it in your hooves before I say a word. The ground here is not easy, and I cannot yet say why." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? I am listening, to you and to the stone both." },
        { id = "h_again2", text = "Ask. Talking helps me think, and the earth is in no hurry." },
      },
      choices = {
        { text = "What are the earthen?", next = "earthen" },
        { text = "Why are the kobolds digging?", next = "kobolds" },
        { text = "What is Sun Rock like?", next = "sunrock" },
        { text = "I hear the hum too, Mor'rogal.", next = "shaman_m", when = { class = "SHAMAN" } },
        { text = "Why kill Goggeroc? He's done nothing yet.", next = "goggeroc", when = { any = { { questActive = TODO_QUEST("Earthen Arise") }, { questDone = TODO_QUEST("Earthen Arise") } } } },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "Walk with the Earth Mother, Mor'rogal.", next = "END" },
      },
    },

    earthen = {
      lines = {
        { id = "ea_default", text = "Legend says they are beings of living stone, made by the titans to shape the very land our hooves walk on. Few tauren have ever seen one, and I'd hoped never to be one of them." },
      },
      choices = {
        { text = "Why fear something that shaped the land?", next = "earthen_fear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    earthen_fear = {
      lines = {
        { id = "ef_default", text = "Because a thing that can shape mountains can unshape them, {class}. An earthen woken by kobolds, hungry and half mad from its sleep, is not a thing I want walking out into Stonetalon." },
      },
      choices = {
        { text = "Do you know what the titans wanted?", next = "earthen_titans" },
        { text = "Something else.", next = "BACK" },
      },
    },
    earthen_titans = {
      big = true,
      lines = {
        { id = "et_default", text = "No one does, and I think that is as it should be. Some things in the deep places are better left to the Earth Mother's keeping than dug up and asked questions." },
      },
      choices = {
        { text = "Then we should seal it away, not study it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Knowledge is power. We should learn all we can.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    kobolds = {
      lines = {
        { id = "ko_default", text = "Kobolds dig because digging is what kobolds do, and they never ask what's at the bottom. This time they've found something older than their whole race, and they're too foolish to be afraid of it." },
      },
      choices = {
        { text = "Could they control it?", next = "kobolds_control" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kobolds_control = {
      lines = {
        { id = "kc_default", text = "Control it? No, but they might wake it and point it in a direction before it eats them. That's what frightens me: an earthen loose with no master and no sense." },
      },
      choices = {
        { text = "I'll make sure it doesn't come to that.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    sunrock = {
      lines = {
        { id = "su_default", text = "A safe place on the high road, with water and good grazing and the Horde's banners over it. Orcs and tauren together, and mostly we manage not to tread on each other's tails." },
      },
      choices = {
        { text = "Mostly?", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shaman_m = {
      lines = {
        { id = "sm_default", text = "Then I am not imagining it, and I'm glad and sorry at once. Help me, {class}; two shaman listening will hear more than one." },
      },
      choices = {
        { text = "I'll help you listen.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    goggeroc = {
      big = true,
      lines = {
        { id = "go_default", text = "Not yet, no, and I have weighed that. But when he wakes he'll be weak, and after that he won't, and I'll not gamble Stonetalon on hoping he wakes kind." },
      },
      choices = {
        { text = "Better to strike first than mourn later.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "It feels wrong to slay a sleeper.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A shaman of Thunder Bluff who came to Sun Rock to listen to the mountains. Lately they've had too much to say." } },
    advice = { { id = "tp_ad", text = "If the ground hums under your hooves, step back and listen before you take another step." } },
    the_elements = { { id = "tp_the_elements", text = "The earth spirits under Stonetalon are uneasy, as if something old were stirring beneath them and they did not like it. I can feel it in my hooves, and I cannot name it, which is worse." } },
    uldaman = { { id = "tp_uldaman", text = "The dwarves say there is a titan vault in the Badlands called Uldaman, full of stone guardians like the ones in our legends. If the earthen sleep there, they may sleep here too, and that is what troubles me." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother made the mountains, and the titans shaped them, or so the old stories say. I do not know which is true, and I am beginning to fear both are." } },
    cairne = { { id = "tp_cairne", text = "Cairne sent us to Sun Rock to heal the land, and I mean to do it. But the land does not always want healing, and sometimes it wants to be left alone." } },
    _none = { { id = "tp_none", text = "I cannot say, {class}. The earth is my study, and that is not of the earth." } },
  },
}
