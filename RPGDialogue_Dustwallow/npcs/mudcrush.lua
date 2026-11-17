-- Mudcrush Durtfeet, a very hungry ogre by the marsh road (0.72.0). Voice: bibles/mudcrush.md
-- Big, simple, always hungry; the threat to eat you is half a joke.
local P = RPGDialogueAPI:Pack("rpgd.dustwallow")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "mudcrush", id = TODO_NPC("Mudcrush Durtfeet"), name = "Mudcrush Durtfeet",
  bible = "bibles/mudcrush.md", role = "questgiver", tier = "quest",
  temper = { "blunt", "cheerful" }, values = { "honest" },
  notices = { "hunger", "kin" },
  impression = {
    first = "Mudcrush Durtfeet is a huge ogre by the marsh road who wants fish heads and says he'll eat me if he doesn't get them. I think he's mostly joking, though I wouldn't stake much on it.",
    third = "{name} met Mudcrush Durtfeet, a hungry ogre by the Dustwallow road who likes murloc heads.",
  },

  greetings = {
    { id = "g_default", text = "Mud big ogre, and Mud hungry, and you are walking food, so you better talk fast." },
    { id = "g_active", when = { questActive = TODO_QUEST("Hungry!") }, text = "Where is fishy? Mud's belly is making noises at you." },
    { id = "g_done", when = { questDone = TODO_QUEST("Hungry!") }, text = "Fishy friend! Mud not eat you today, or maybe ever, if you keep bringing fishy." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Mud remembers you, because you smell less like food than most." },
  },

  notice = {
    { id = "n_food", cat = "hunger", when = { profession = "Cooking" },
      text = "You smell like cooking! Mud likes you already, so you can stay alive a while." },
    { id = "n_small", cat = "kin", when = { race = "Gnome" },
      text = "You very small, little one, too small for a meal, so Mud lets you go. Bring a bigger friend next time." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Mud is Mudcrush Durtfeet, and Mud is the biggest ogre on this road. Mud sits here because Mud is hungry, and walking makes Mud hungrier." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Hungry!") },
          text = "Go bash fishy and bring Mud food, because you feed Mud or Mud eats you. That is the deal, and it is a good deal for you." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Hungry!") },
          text = "The fishy-men live by the water, the ones with the green fins. Bring Mud their heads, eight of them, because Mud's belly can count to eight." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Hungry!"), days = 3 } },
          text = "Mud like fishy head! Mud ate them all already, and Mud is still a little hungry, but less hungry than before." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "Big cow person! You too big to eat in one go, so Mud will just talk to you." },
      },
      again = {
        { id = "h_again", text = "More talking? Talking does not fill Mud's belly." },
        { id = "h_again2", text = "Mud is listening, but Mud is listening hungry." },
      },
      choices = {
        { text = "Would you really eat me?", next = "eat" },
        { text = "You're a long way from the village out here.", next = "alone" },
        { text = "What's so good about murloc heads?", next = "fishy" },
        { text = "Want some bread instead? I can make it from nothing.", next = "mage", when = { class = "MAGE" } },
        { text = "I could cook those heads for you.", next = "cook", when = { profession = "Cooking" } },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "Goodbye, Mudcrush.", next = "END" },
      },
    },
    eat = {
      lines = { { id = "e_default", text = "Maybe Mud would, maybe not. Mud has never eaten anybody who brought fishy, so the best way not to find out is to bring fishy." } },
      choices = {
        { text = "Have you ever eaten anyone?", next = "eat_ever" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eat_ever = {
      big = true,
      lines = { { id = "ee_default", text = "Mud ate a boot once, with a foot still in it, but the foot belonged to a raptor, so it does not count. Raptors taste like boots anyway." } },
      choices = {
        { text = "Threatening people is no way to get fed.", next = "eat_stance", fx = { align = { light = 1 } } },
        { text = "A threat gets things done, Mudcrush.", next = "eat_stance", fx = { align = { light = -1 } } },
        { text = "What else do you eat?", next = "eat_stance" },
      },
    },
    eat_stance = {
      lines = { { id = "es_default", text = "Mud eats everything that does not run fast enough, and some things that do. Mud is not clever, but Mud's belly is very clever, and it always gets fed." } },
      choices = { { text = "Something else, Mudcrush.", next = "BACK" } },
    },
    alone = {
      lines = { { id = "a_default", text = "The village is full of ogres who want Mud's food, and Mud wants Mud's food. Out here there is only the road, and the road brings people who bring fishy." } },
      choices = {
        { text = "The other ogres must miss you.", next = "alone_miss" },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    alone_miss = {
      lines = { { id = "am_default", text = "Mud does not think so. When Mud was in the village, the others said Mud ate too much, and Mud said they ate too little, and then there was hitting." } },
      choices = { { text = "Sounds like you're better off out here.", next = "BACK", fx = { affinity = 1 } } },
    },
    fishy = {
      lines = { { id = "f_default", text = "Crunchy outside and soft inside, and the eyes go pop! The fishy-men are mean and they throw spears, but their heads are worth it." } },
      choices = {
        { text = "That's disgusting, Mudcrush.", next = "fishy_gross", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fishy_gross = {
      lines = { { id = "fg_default", text = "You say disgusting, Mud says lunch. You try one, maybe, and then you see." } },
      choices = { { text = "I'll pass, thanks.", next = "BACK" } },
    },
    mage = {
      lines = { { id = "m_default", text = "Bread from nothing? Mud ate magic bread once, from a robe man, and Mud was hungry again before the robe man was out of sight. Magic bread is a lie." } },
      choices = { { text = "Fish heads it is, then.", next = "BACK", fx = { affinity = 1 } } },
    },
    cook = {
      lines = { { id = "c_default", text = "Cook them? Fire makes food smaller, and Mud wants food bigger. But you can cook one, and Mud will eat it, and then Mud will decide." } },
      choices = { { text = "A deal, Mudcrush.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Mud was born hungry and Mud is still hungry. That is the whole story, and Mud tells it every day." } },
    advice = { { id = "tp_ad", text = "Eat first, then fight. Nobody fights good hungry, except Mud, and Mud is special, and Mud also ate a frog this morning by mistake." } },
    _none = { { id = "tp_none", text = "Mud does not know, and Mud does not care, unless it is food." } },
  },
}
