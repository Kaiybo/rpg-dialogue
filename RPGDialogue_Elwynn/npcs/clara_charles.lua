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
    first = "She walks to her well as if nobody were hiding beside it.",
    third = "{name} met Clara Charles, who keeps a farm near Stormwind and goes on fetching water although Defias lurk by her well.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There you are. Markus has been asking after you all week, and so, I'll admit, have I." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Good day. I'd thank you to say your piece quickly, as I've the well to see to." },
    { id = "g_farm", text = "Good day to you. Mind the apples on the table; they're spoken for." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you again. My Markus will be pleased; he's been playing at being you all week." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and nothing's changed here, which out on this road counts as good news." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown into your boots since you last came by, if you don't mind me saying. Markus says you'll be a hero, and I'm starting to think he's right." },
    { id = "g_word_helped", when = { word = "helped" }, text = "They tell me you've been helping folk along the road. It's good to know somebody is." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Folk on the road say you've upset somebody. I'll judge you as I find you, but do mind your temper near the boy." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "Oh! Light above, you gave me a turn, creeping about like that. I get enough of that from the men hiding in the bushes by my well." },
    { id = "n_hungry", cat = "hunger", when = { maxLevel = 10 },
      text = "You look half-starved, dear. I can't spare the apples, but there's bread on the shelf if you're desperate." },
  },

  start = "hello",
  nodes = {
    d6_market3 = {
      lines = { { id = "d6_market3_a", text = "Cabbages, which Markus digs up looking for treasure, and pumpkins in the autumn, which he wants to live inside. The apple trees were my mother's, and they're the only thing on the farm that's never once failed me, so I don't let the boy climb them." } },
      choices = {
        { text = "Your mother planted well.", next = "BACK" },
        { text = "Let's talk about something else, Clara.", next = "BACK" },
      },
    },
    d6_market = {
      lines = { { id = "d6_market_a", text = "On my back, dear, in two baskets, and Markus carries the small one and eats from it when he thinks I'm not looking. The guards at the gate know me now and wave me through, and the stall-keepers in the Trade District pay fair for good fruit." } },
      choices = {
        { text = "That's a long walk with two baskets.", next = "d6_market2" },
        { text = "Do you ever have trouble on the road?", next = "d6_market2" },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    d6_market2 = {
      lines = { { id = "d6_market2_a", text = "It's long, but the road's busy enough that nobody bothers us in daylight. I set off before the sun and I'm home before it's gone, and Markus sleeps the whole way back on the cart of a farmer who lets him ride for an apple." } },
      choices = {
        { text = "Markus has the right idea.", next = "BACK", fx = { affinity = 1 } },
        { text = "What else grows on the farm?", next = "d6_market3" },
        { text = "Something else, Clara.", next = "BACK" },
      },
    },
    d6_westfall = {
      lines = { { id = "d6_westfall_a", text = "Some of them, I'd wager. A good many Westfall folk came through here when their farms failed, hungry and angry, and most went on to the city to find work, but some went into the hedges instead and came out wearing red." } },
      choices = {
        { text = "I could slip up on them at the well.", next = "d6_westfall2", when = { class = "ROGUE" } },
        { text = "You sound almost sorry for them.", next = "d6_westfall2" },
        { text = "Hunger doesn't excuse banditry.", next = "d6_westfall2" },
      },
    },
    d6_westfall2 = {
      lines = {
        { id = "d6_westfall2_a", text = "I gave bread at this door to a boy from Westfall, two winters ago, and last month I saw his face over a red mask by the well. I don't excuse it, dear, but I know he was hungry once, and I wish someone had given him more than a loaf." },
        { id = "d6_westfall2_rogue", when = { class = "ROGUE" }, text = "I don't doubt you could, dear, by the way you stand, but not near the house, please. If there's to be blood, let it be down the road where Markus can't see, and let it be quick, because I'll have to walk past that spot every day." },
      },
      choices = {
        { text = "I'll keep it far from the house.", next = "BACK", fx = { learn = { "defias" } } },
        { text = "Let's leave that, Clara.", next = "BACK" },
      },
    },

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
        { text = "How do you get the apples to the city?", next = "d6_market" },
        { text = "Are the men by the well from Westfall?", next = "d6_westfall" },
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
      lines = { { id = "ww_default", text = "We need water, dear, and the Defias haven't taken any of it yet. I think they're watching the road, not me, and I don't mean to give them a reason to change their minds." },
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
        { text = "Keep complaining. The guards owe you protection.", next = "BACK", reply = "You're right, and I know it, though it's hard to keep knocking on a door that never opens. I'll go to the Marshal again tomorrow, and I'll keep on going until somebody listens.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Keep your head down. The law won't save you here.", next = "BACK", reply = "That's what my head says too, though my heart hates hearing it. I'll keep the shutters closed and my boy close, and pray the Light keeps watch where the guards won't.", fx = { align = { order = -1 } } },
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
      lines = { { id = "am_default", text = "Then you'll have seen they never go far. Please don't start anything near the house, dear, not with Markus in the garden." },
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
    stonemasons = { { id = "tp_stonemasons", text = "My cousin carried stone for the guild when they raised the city walls, and he came home with blistered hands and no wages. I'd not say it loud, but I know why some of those boys went to the hedges." } },
    varian = { { id = "tp_varian", text = "The king rode off and never came home, and the city is quieter about it than I'd like. A farm notices when the man who's meant to keep the roads safe isn't there." } },
    the_stockade = { { id = "tp_the_stockade", text = "They take the ones they catch to the Stockade, and a few weeks later the same faces are by my well again. I've stopped counting them." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "Markus begs to go every time the Faire comes to Goldshire, and every time I tell him there are apples to pick. One year I'll let him, when the road's safer." } },
  },
}
