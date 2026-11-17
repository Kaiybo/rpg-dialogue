-- Clara Charles, at her farmhouse outside Stormwind, with Markus in the garden. Voice: bibles/clara_charles.md
-- Goes to her well every day; Defias ambushers wait in the bushes by it, and she pretends not to know.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "clara_charles", id = TODO_NPC("Clara Charles"), name = "Clara Charles",
  bible = "bibles/clara_charles.md", role = "farmer", tier = "service",
  communities = {}, temper = { "steady" }, values = { "kind", "careful" },
  notices = { "stealth", "hunger" },

  impression = {
    first = "Clara Charles keeps a tidy farmhouse within sight of Stormwind's walls and walks to her well as if nobody were hiding beside it. I couldn't tell whether that was courage or simply having nowhere else to go.",
    third = "{name} met Clara Charles, who keeps a farm near Stormwind and goes on fetching water although Defias lurk by her well.",
  },

  greetings = {
    { id = "g_farm", text = "Good day to you. Mind the apples on the table; they're spoken for." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you again. Markus will be pleased; he's been playing at being you all week." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and nothing's changed here, which out on this road counts as good news." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown into your boots since you last came by, if you don't mind me saying. Markus says you'll be a hero, and I'm starting to think he's right." },
    { id = "g_word_helped", when = { word = "helped" }, text = "They tell me you've been helping folk along the road. It's good to know somebody is." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Folk on the road say you've upset somebody. I'll judge you as I find you, but do mind your temper near the boy." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "Oh! Light above, you gave me a turn, creeping about like that. I get enough of that from the bushes by the well." },
    { id = "n_hungry", cat = "hunger", when = { maxLevel = 10 },
      text = "You look half-starved, dear. I can't spare the apples, but there's bread on the shelf if you're desperate." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Clara Charles. This is our farm, such as it is, and that's Markus out in the garden, digging for treasure in my cabbages." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "You've a careful way of looking at the hedges, as if you know what's in them. Most folk walk right past." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "A paladin, out here! Markus will want to touch your armour, so I apologise now for his sticky hands." },
      },
      again = {
        { id = "h_again", text = "Anything else, dear? I've the washing to see to." },
        { id = "h_again2", text = "Go on, I'm listening, though Markus will need shouting at in a moment." },
      },
      choices = {
        { text = "Who's hiding in the bushes by your well?", next = "well" },
        { text = "Tell me about Markus.", next = "markus" },
        { text = "Those apples look too fine for the table.", next = "apples" },
        { text = "I've been watching the men by your well.", next = "ambush", when = { class = { "ROGUE", "HUNTER" } } },
        { text = "Good day, Clara.", next = "END" },
      },
    },
    well = {
      lines = { { id = "w_default", text = "Nobody, if you ask me in front of the boy. Every time I go for water, two men in red masks rise up out of the brush and then think better of it and sink back down again." },
      },
      choices = {
        { text = "And still you keep going to the well.", next = "well_why" },
        { text = "Have you told the guards?", next = "well_guards" },
      },
    },
    well_why = {
      lines = { { id = "ww_default", text = "We need water, dear, and the Defias haven't taken any of it yet. I think they're watching the road, not me, and I'd rather not give them a reason to change their minds." },
      },
      choices = {
        { text = "That's brave of you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    well_guards = {
      big = true,
      lines = { { id = "wg_default", text = "I've told them, and they come and look, and the men are gone, and the guards go home. If you were me, would you keep complaining, or keep your head down and your boy safe?" },
      },
      choices = {
        { text = "Keep complaining. The guards owe you protection.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Keep your head down. The law won't save you here.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I don't know, Clara.", next = "BACK" },
      },
    },
    markus = {
      lines = { { id = "m_default", text = "He's a good boy with too much imagination, and he thinks every stranger on the road is a knight or a bandit. I try to keep him in the garden where I can see him." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    apples = {
      lines = { { id = "a_default", text = "They're for selling, in the city, when I can get them there. They're the best thing this farm grows, and folk ask after them, so I keep them where I can count them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ambush = {
      lines = { { id = "am_default", text = "Then you'll have seen they never go far. If you can see them, dear, please don't start anything near the house, not with Markus in the garden." },
      },
      choices = {
        { text = "I'll wait until the boy is inside.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep a farm and a boy and an apple tree, and that's all there is to tell." } },
    advice = { { id = "tp_ad", text = "Don't walk past a hedge without looking at it twice. Not on this road." } },
    defias = { { id = "tp_defias", text = "They're by my well most days, and I've learned to pretend they aren't.", next = "well" } },
    _none = { { id = "tp_none", text = "I wouldn't know, dear. I don't get to the city as often as I'd like." } },
  },
}
