-- Angus Stern, head chef of the Blue Recluse in the Mage Quarter. Voice: bibles/angus_stern.md
-- Perfectionist, theatrical, always one banquet from disaster; nephew Morgan gathers recipes in Theramore.
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "angus_stern", id = TODO_NPC("Angus Stern"), name = "Angus Stern",
  title = "Head Chef",
  bible = "bibles/angus_stern.md", role = "vendor", tier = "quest",
  communities = { "stormwind" }, temper = { "fussy" }, values = { "craft", "proud" },
  notices = { "craft", "hunger" },

  impression = {
    first = "Angus Stern runs the Blue Recluse's kitchen as if every plate were going before the king. He's vain and anxious and very good, and he knew I knew it.",
    third = "{name} met Angus Stern, the perfectionist head chef of the Blue Recluse in Stormwind's Mage Quarter.",
  },

  greetings = {
    { id = "g_kitchen", text = "Not now, not now! Unless you're bringing me something fresh, in which case, yes, now." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Wonderful. Taste this and tell me it needs nothing." },
    { id = "g_haunch", when = { questActive = TODO_QUEST("A Meal Served Cold") }, text = "Do you have the haunch? I must start the marinade, or the banquet is ruined!" },
    { id = "g_morgan", when = { questActive = TODO_QUEST("Morgan Stern") }, text = "Have you reached Theramore yet? My nephew is a dear boy, but he writes no letters." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and I've reinvented the menu twice in that time. Neither time was it appreciated." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've become rather formidable since you first wandered into my kitchen. Formidable people eat well, you know; I should know." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Your name has been mentioned at my tables, and kindly! That's the finest seasoning there is." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You cook? I can smell it on you, smoke and onion. Never mind what the guild says; good cooking is half instinct." },
    { id = "n_hungry", cat = "hunger", when = { maxLevel = 15 },
      text = "You look like you've lived on hard bread and river water. I can't feed you from the banquet, but heavens, eat something." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Angus Stern, head chef of the Blue Recluse, the finest table in the Mage Quarter, which is to say the finest in the kingdom. If you've come to complain, the door is behind you." },
        { id = "h_menu", when = { questBefore = TODO_QUEST("Morgan Stern"), minLevel = 30 },
          text = "I'm writing a new menu, all rural dishes with a bayou flavour, and my clientele will adore it. My nephew Morgan went to Theramore to gather recipes, and I simply must know what he's found." },
        { id = "h_haunch_before", when = { questBefore = TODO_QUEST("A Meal Served Cold"), minLevel = 35 },
          text = "Chilled Basilisk in Lime Vinaigrette, one of my most famous dishes, and the meat won't keep! I need a fresh haunch from a Cold Eye Basilisk tonight, for a noble's birthday." },
        { id = "h_haunch_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Meal Served Cold"), days = 3 } },
          text = "The haunch arrived in time, chopped, marinated and garnished, and the noble cried. Happily, I'm told, though with nobles it's hard to be sure." },
      },
      again = {
        { id = "h_again", text = "What else? Quickly, the sauce is turning." },
        { id = "h_again2", text = "Go on. I can listen and whisk." },
      },
      choices = {
        { text = "I've heard the Blue Recluse is a special place.", next = "recluse" },
        { text = "Tell me about your nephew.", next = "morgan" },
        { text = "Why go to such lengths for one dish?", next = "lengths" },
        { text = "I cook as well. Have you any secrets to share?", next = "cook", when = { profession = "Cooking" } },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "I'll leave you to the sauce.", next = "END" },
      },
    },
    recluse = {
      lines = { { id = "r_default", text = "Wizards, my dear, who have travelled everywhere and eaten everything, and are therefore impossible to please. If I can please them, I can please anyone." },
      },
      choices = {
        { text = "And can you?", next = "recluse_please" },
        { text = "Something else.", next = "BACK" },
      },
    },
    recluse_please = {
      lines = { { id = "rp_default", text = "Most nights. The rest of the nights they talk about magic through the whole meal and don't notice what they've eaten, which is a kind of tragedy." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    morgan = {
      lines = { { id = "m_default", text = "My sister's boy, and a good cook, though he'd rather taste his way across the world than stand at a stove. Theramore suits him; it's damp and full of strange food." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lengths = {
      lines = { { id = "l_default", text = "Because the dish is the thing! A noble remembers a meal longer than a speech, and the kitchen that served it longer still." },
      },
      choices = {
        { text = "All that for a noble's birthday, though?", next = "lengths_nobles" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lengths_nobles = {
      big = true,
      lines = { { id = "ln_default", text = "The nobles pay for this kitchen, and the guards eat stew at the barracks. I don't make the world, I only cook in it. Does that bother you?" },
      },
      choices = {
        { text = "It does. Good food should feed everyone.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Not at all. Excellence goes where the coin is.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cook = {
      lines = { { id = "c_default", text = "Salt early, taste often, and never trust a recipe you haven't burned once. And never serve a dish you wouldn't eat yourself; that one cost me a week of the runs." },
      },
      choices = { { text = "Thank you, Chef.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Head chef of the Blue Recluse. Before that, a great many kitchens, and before that, a boy who burned things." } },
    advice = { { id = "tp_ad", text = "Fresh, fresh, fresh. Everything else can be forgiven, but stale meat cannot." } },
    _none = { { id = "tp_none", text = "Does it go in a pot? No? Then I couldn't tell you, my dear." } },
  },
}
