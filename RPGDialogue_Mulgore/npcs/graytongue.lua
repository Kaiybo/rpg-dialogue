-- Seer Graytongue, who sets the young braves of Camp Narache their Rite of Strength. Voice: bibles/graytongue.md
-- An old druid seer, slow and blunt, who has watched the Bristleback ruin land before and will not watch it again.
local P = RPGDialogueAPI:Pack("rpgd.mulgore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "graytongue", id = TODO_NPC("Seer Graytongue"), name = "Seer Graytongue",
  bible = "bibles/graytongue.md", role = "priest", tier = "quest",
  communities = { "narache" }, temper = { "calm" }, values = { "wise", "protective" },
  notices = { "race", "form" },
  impression = {
    first = "Seer Graytongue sets the young of Camp Narache their Rite of Strength against the Bristleback. He speaks slowly and bluntly, and he has seen what the quilboar leave behind them.",
    third = "{name} met Seer Graytongue on Red Cloud Mesa, the old seer who sets young braves their Rite of Strength.",
  },

  greetings = {
    { id = "o_quil_peace", when = { gossip = { topic = "quilboar", stance = "peace" } }, text = "Windfeather tells me you'd make peace with the quilboar. I've buried too many braves for that, young one, but I'll not stop you trying." },
    { id = "o_grim_lost", when = { gossip = { topic = "grimtotem", stance = "lost" } }, text = "The Chief says you'd break the Grimtotem. Remember the quilboar first, young one, because they're closer and they don't argue at the fire." },
    { id = "g_mesa", text = "Stand still a moment, young one. The mesa speaks, if you let it." },
    { id = "g_strength", when = { questActive = TODO_QUEST("Rite of Strength") }, text = "The Bristleback wait in the thornsnarl, so go and face them, and return when your Rite is done." },
    { id = "g_done", when = { questDone = TODO_QUEST("Rite of Strength") }, text = "You carry the Rite of Strength in your stride now. I see it from here." },
    { id = "g_away", when = { away = 14 }, text = "You've been {away} away from the mesa, and you come back taller. The Earth Mother has fed you well." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 6 }, text = "You were a calf when I set your first Rite, and now look at you. The Earth Mother is patient with all of us, and she has been generous with you." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "The braves of Camp Narache speak well of you. That is the first thing a tauren earns, and the hardest to lose." },
  },

  notice = {
    { id = "n_notauren", cat = "race", when = { ["not"] = { race = "Tauren" } },
      text = "You are not of the shu'halo, yet you stand on our mesa. Then the Earth Mother has sent you, and I will not ask why." },
    { id = "n_bear", cat = "form", when = { form = { "bear", "cat" } },
      text = "You wear a beast's shape before an old druid. Show me, then, whether the beast wears you or you wear it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Seer Graytongue. I set the young of Camp Narache their Rite of Strength, the first ceremony of a tauren brave, and I watch the land for what the Bristleback do to it." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Rite of Strength") },
          text = "Behold, {name}. The Bristleback are a blight, and nothing is left in their wake but bones and bare earth. Camp Narache could become that in a few days unless we stand and fight, so this will be your Rite of Strength." },
        { id = "h_rites", when = { questActive = TODO_QUEST("Rites of the Earthmother") },
          text = "Chief Hawkwind sent you to me. Good. The Rites of the Earthmother begin with strength, because a tauren who cannot protect the land cannot yet be trusted to understand it." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Rite of Strength"), days = 3 } },
          text = "You have fought well, {name}. We may yet be saved, and the Earth Mother will remember the blood you spilled for her." },
        { id = "h_druid", when = { class = "DRUID" }, text = "A young druid. The Earth Mother gives us her shapes so we can protect her, so remember that the claws are a gift and not a toy." },
      },
      again = {
        { id = "h_again", text = "What else would you know, young one?" },
        { id = "h_again2", text = "Ask. The mesa has time, as the Earth Mother does." },
      },
      choices = {
        { text = "What is the Rite of Strength?", next = "rite" },
        { text = "You seem to hate the Bristleback.", next = "bristleback" },
        { text = "Tell me of the Earth Mother.", next = "earthmother" },
        { text = "I walk the druid's path, Seer.", next = "druid", when = { class = "DRUID" } },
        { text = "I'm not tauren. Will the Rites still count?", next = "outsider", when = { ["not"] = { race = "Tauren" } } },
        { text = "I'm ready for my task.", next = "BUSINESS" },
        { text = "Earth Mother guide you, Seer.", next = "END" },
      },
    },
    rite = {
      lines = { { id = "r_default", text = "Strength is the first Rite, then Vision, then Wisdom, as the Earth Mother set them. Each one teaches the next, so a brave who skips strength will never have the vision to see what it is for." } },
      choices = {
        { text = "And what is strength for?", next = "rite2" },
        { text = "Something else, Seer.", next = "BACK" },
      },
    },
    rite2 = {
      lines = { { id = "r2_default", text = "For protecting those who cannot protect themselves, and for nothing else. A tauren who fights for glory is only a quilboar with better manners." } },
      choices = {
        { text = "Then what of those who fight for glory?", next = "rite3" },
        { text = "I understand.", next = "BACK" },
      },
    },
    rite3 = {
      big = true,
      lines = { { id = "r3_default", text = "They win battles, sometimes, and they lose themselves always. The Earth Mother does not punish them, but she stops speaking to them, and a tauren who hears nothing from her goes hollow." } },
      choices = {
        { text = "I'll fight to protect, not for glory.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Glory gives the young a reason to fight at all.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bristleback = {
      lines = { { id = "b_default", text = "I do not hate them, any more than I hate a fire. But a fire must be put out before it reaches the village, and the Bristleback burn through the plains, digging and fouling, and they leave nothing growing behind them." } },
      choices = {
        { text = "Perhaps they could be reasoned with.", next = "reason" },
        { text = "Then they must be stopped.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    reason = {
      lines = { { id = "re_default", text = "Some say so, and I have heard of quilboar who trade with travelers in the south. The ones in our thornsnarl only want our land, so we answer them with spears until they want something else." } },
      choices = {
        { text = "Peace should be tried first.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Spears are the only answer they'll understand.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    earthmother = {
      lines = { { id = "e_default", text = "She is the land beneath your hooves and the sky above it, and her eyes are An'she and Mu'sha, the sun and the moon. She does not speak in words, young one, but in seasons, so we learn to be patient." } },
      choices = { { text = "I'll learn to listen.", next = "BACK", fx = { affinity = 1 } } },
    },
    druid = {
      lines = { { id = "d_default", text = "Then you will take shapes that are not your own, and you will be tempted to stay in them. Return to yourself every night, young one, so the beast remembers who is in charge." } },
      choices = {
        { text = "I'll remember who I am.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    outsider = {
      lines = { { id = "o_default", text = "The Earth Mother does not ask whose hooves walk on her, only how they walk. Fight the Bristleback for our village, and the Rite is yours as surely as any calf's." } },
      choices = { { text = "Then I'll earn it.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I have been a seer on this mesa longer than most braves have been alive. The rest is between me and the Earth Mother." } },
    advice = { { id = "tp_ad", text = "Protect first, and ask questions after. The Earth Mother forgives a careful brave far more often than a late one." } },
    quilboar = { { id = "tp_quilboar", fx = { learn = { "razorfen" } }, text = "The Bristleback took the Greatmother, and they will take more if we let them. I send the young out to face them because a tauren who has met the quilboar is a tauren who will not be surprised by them." } },
    centaur = { { id = "tp_centaur", text = "The centaur are older enemies, and harder ones, but the quilboar are closer. One threat at a time, I tell the young, and the nearest one first." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother gives each of us a test, and the Rite of Strength is only the first. Pass it, and she will give you another, because that is how she shows her love." } },
    _none = { { id = "tp_none", text = "That is beyond what the mesa tells me, young one. Ask in Bloodhoof Village." } },
  },
}
