-- Lorekeeper Raintotem, keeper of Red Rocks, the sacred burial ground of Mulgore. Voice: bibles/raintotem.md
-- An old lorekeeper who knows every name on the hill and can no longer drive the quilboar off them.
local P = RPGDialogueAPI:Pack("rpgd.mulgore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "raintotem", id = TODO_NPC("Lorekeeper Raintotem"), name = "Lorekeeper Raintotem",
  bible = "bibles/raintotem.md", role = "scholar", tier = "quest",
  temper = { "gentle" }, values = { "devout", "wise" },
  notices = { "race", "class" },
  impression = {
    first = "Lorekeeper Raintotem tends Red Rocks, where the most valiant tauren are laid to rest. He knows every name there and is too old to drive the quilboar off them, which shames him more than he admits.",
    third = "{name} met Lorekeeper Raintotem at Red Rocks, the aged keeper of the tauren's sacred burial ground.",
  },

  greetings = {
    { id = "g_rocks", text = "Walk softly here, {class}. Every stone on this hill has a name beneath it." },
    { id = "g_active", when = { questActive = TODO_QUEST("A Sacred Burial") }, text = "The Bristleback are among the graves still. Drive them off, and quickly." },
    { id = "g_done", when = { questDone = TODO_QUEST("A Sacred Burial") }, text = "The hill is quiet again, as it should be. The honored dead thank you, and so do I." },
    { id = "g_away", when = { away = 14 }, text = "{away} away, and the hill has kept its peace. I hope your travels did the same for you." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You have grown strong since you cleared this hill for an old man. The ancestors watch the strong ones closely, so walk well." },
  },

  notice = {
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "One of the Forsaken, at Red Rocks. Forgive an old lorekeeper if he wonders how the dead feel, walking among the honored dead." },
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "PRIEST" } },
      text = "You hear the spirits, I think. Then you will hear how restless they have been." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Lorekeeper Raintotem. Only the most valiant tauren are laid to rest at Red Rocks, the great warriors who founded and defended Thunder Bluff and those who gave their lives for their tribes, and I keep their names." },
        { id = "h_before", when = { questBefore = TODO_QUEST("A Sacred Burial") },
          text = "A foul menace has come onto our holy ground, {class}. A band of Bristleback interlopers is ravaging the grave sites, and I am too old and too far past my prime to drive them away, so they must be driven off by someone else." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Sacred Burial"), days = 3 } },
          text = "Well done. You have sent the Bristleback a clear message, and they will think twice before they dig on this hill again." },
        { id = "h_ceremony", when = { questActive = TODO_QUEST("Preparation for Ceremony") },
          text = "Eyahn sent you with the ceremony preparations? Good, then the dead will be honored properly, once the quilboar are gone from among them." },
      },
      again = {
        { id = "h_again", text = "What else would you know of this place?" },
        { id = "h_again2", text = "Ask, and I will answer, as the lorekeepers always have." },
      },
      choices = {
        { text = "Who is buried at Red Rocks?", next = "buried" },
        { text = "Why would quilboar dig up graves?", next = "quilboar" },
        { text = "What does a lorekeeper do?", next = "lorekeeper" },
        { text = "Do the spirits here speak to you?", next = "spirits", when = { class = { "SHAMAN", "PRIEST", "DRUID" } } },
        { text = "How can I help the honored dead?", next = "BUSINESS" },
        { text = "Rest well, Lorekeeper.", next = "END" },
      },
    },
    buried = {
      lines = { { id = "b_default", text = "Warriors who held the wandering tribes together when the centaur hunted us, and chieftains who led us to Mulgore. Some of their names you'd know from songs, and some only I remember now." } },
      choices = {
        { text = "Tell me one of the names only you remember.", next = "name" },
        { text = "Something else, Lorekeeper.", next = "BACK" },
      },
    },
    name = {
      lines = { { id = "n_default", text = "There's a warrior under the third stone from the top who held a pass for a day and a night so the herds could cross. Her name was spoken at her burial, and then the people moved on, and now I am the only one who says it." } },
      choices = {
        { text = "What happens when you're gone?", next = "name_end" },
        { text = "Then I'll remember her too.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    name_end = {
      big = true,
      lines = { { id = "ne_default", text = "Then another lorekeeper takes the names, if one comes, and if none comes, the Earth Mother holds them anyway. I try not to fear that, but I am old, and my knees ache before rain, and I fear more than I used to." } },
      choices = {
        { text = "The dead live on in those who remember them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead are gone. The living matter more.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    quilboar = {
      lines = { { id = "q_default", text = "For the grave goods, I think, the weapons and charms we lay beside our warriors. Or perhaps only to shame us, because the Bristleback know where it hurts us most." } },
      choices = {
        { text = "They'll pay for it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Drive them off, but don't add more graves.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lorekeeper = {
      lines = { { id = "l_default", text = "We remember, so the tribes don't have to carry everything at once. When a young tauren completes the Rite of Wisdom, it is the ancestors who speak to them, and the lorekeepers who made sure the ancestors were remembered well enough to answer." } },
      choices = { { text = "That's a heavy duty.", next = "BACK", fx = { affinity = 1 } } },
    },
    spirits = {
      lines = { { id = "s_default", text = "Every night, softly, and lately with anger. The ancestors do not like hooves and snouts in their earth, and I have had to tell them, again and again, that help is coming." } },
      choices = {
        { text = "Then tell them help has come.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A lorekeeper, and an old one. My life has been other people's names, and I've found that enough." } },
    advice = { { id = "tp_ad", text = "Learn the names of those who came before you. You will be surprised how often they help." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother holds our dead in her arms at Red Rocks, and I keep their names so she does not have to. It is a heavy task, and an honourable one." } },
    quilboar = { { id = "tp_quilboar", text = "The quilboar desecrate our sacred ground, and I am too old to drive them off. That shames me more than I can say, and I am grateful to anyone who does it for me." } },
    cairne = { { id = "tp_cairne", text = "Cairne will be laid at Red Rocks one day, among the greatest of our people. I pray to the Earth Mother that the day is far off, and that I am not the one to carve his name." } },
    second_war = { { id = "tp_second_war", text = "The orcs speak of the Second War, but the tauren had their own wars in those years, against the centaur. I have carved the names of those who fell, and there are many." } },
    _none = { { id = "tp_none", text = "That is not among the things I keep, {class}. Ask the elders in Thunder Bluff." } },
  },
}
