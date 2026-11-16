-- Farmer Saldean, Saldean's Farm. Voice: bibles/saldean.md
-- Stayed when the others left. Now scarecrows walk his fields.
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "saldean", id = TODO_NPC("Farmer Saldean"), name = "Farmer Saldean",
  bible = "bibles/saldean.md", role = "farmer", tier = "quest",
  communities = { "westfall_farms" }, temper = { "proud" }, values = { "stern", "honest" },
  notices = { "work", "kit" },
  impression = {
    first = "When all his neighbours fled, Farmer Saldean stayed, and he says so with a certain grim pride. His furrows are the only straight thing he has left, by his own reckoning.",
    third = "{name} met Farmer Saldean, who holds his ground while harvest watchers stalk his fields.",
  },

  greetings = {
    { id = "g_fields", text = "Step careful. The furrows are all I've got left that's straight." },
    { id = "g_watchers", when = { questActive = TODO_QUEST("The Killing Fields") }, text = "Still standing out there, aren't they. I can see them from the porch." },
    { id = "g_after", when = { questDone = TODO_QUEST("The Killing Fields") }, text = "I walked my own field this morning, for the first time since spring." },
  },

  notice = {
    { id = "n_farmer", cat = "work", when = { profession = { "Herbalism", "Skinning" } },
      text = "You've dirt under your nails, honest dirt, and I can always tell a body that works with their hands." },
    { id = "n_hay", cat = "kit", when = { questObjective = { TODO_QUEST("The Killing Fields"), left = { max = 5 } } },
      text = "You've straw all down your front, which means they're coming apart. Good." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      lines = { { id = "xro_default", text = "Do you now? Then you'll know they came at night, took the Molsens' plough first and the Molsens next, and never once looked a man in the eye. If you can think like that and still stand on my porch honest, you're welcome here." } },
      choices = {
        { text = "I'll give them a taste of their own medicine.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll stand honest, Saldean. You have my word.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Where did your neighbours go?", next = "neighbours" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "I didn't need a warlock to tell me that, though I'll admit it's a strange comfort to hear it said aloud. Something puts the walk in those scarecrows, and it isn't Westfall straw." } },
      choices = {
        { text = "I'll find what moves them and turn it to my use.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll burn them down and let the darkness go with them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Where did the watchers come from?", next = "watchers" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "That's the best news I've had since the Defias took the Jansen farm. My father always said Westfall dirt was stubborn, and I reckon he was right about that much." } },
      choices = {
        { text = "Then rest a field each year, and it will repay you.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the weeds have it awhile. The wild knows best.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_druidx", when = { class = "DRUID" },
          text = "You've a strange way of looking at my rows, friend, like you're listening to them. My wife does that too, now and then." },
        { id = "h_default", text = "The name's Saldean, and this is my farm. The thieves ran all the neighbours off, but I'm still here, so make of that what you like." },
        { id = "h_before", when = { questBefore = TODO_QUEST("The Killing Fields") },
          text = "See those scarecrows in my field? Harvest watchers, they call them, and they walk and they swing, and they don't belong to me, and they won't leave." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Killing Fields") },
          text = "Start with my field, and if you've arms left after, clear the neighbours' too. Somebody might come back for them one day." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Killing Fields"), days = 3 } },
          text = "Straw and sticks all over the south field. Salma says it looks like a harvest festival gone wrong. I say it's the best it's looked in a year." },
        { id = "h_later", when = { questLater = { TODO_QUEST("The Killing Fields"), days = 14 } },
          text = "I turned the soil on the south field yesterday. There might be a crop yet, if we're lucky." },
        { id = "h_salma", when = { heardLine = "salma.h_default" },
          text = "Salma's been feeding you, then; she feeds everyone. I married the softest heart in Westfall, and I'll not hear a word against it." },
        { id = "h_soil", when = { metBefore = true }, text = "The soil's tired, and so am I, but we'll both get up tomorrow anyway. That's farming." },
      },
      again = {
        { id = "h_again", text = "Something else? Make it quick, because daylight's for working." },
        { id = "h_again2", text = "Ask away. The pumpkins won't mind if I stop to answer you." },
      },
      choices = {
        { text = "Your soil is tired, but it isn't dead yet.", next = "druid_talk", when = { class = "DRUID" } },
        { text = "Why did you stay?", next = "stay" },
        { text = "Where did the watchers come from?", next = "watchers" },
        { text = "Where did your neighbours go?", next = "neighbours" },
        { text = "Your wife sets a fine table.", next = "salma" },
        { text = "I worked fields like these, growing up.", next = "farmhand", when = { origin = "human_westfall_farmhand" } },
        { text = "Shall I bless your fields?", next = "bless", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "I know how thieves think, Saldean. I can help.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Those watchers aren't natural, Saldean. I can feel it.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Good luck with the harvest.", next = "END" },
      },
    },
    stay = {
      big = true,
      lines = {
        { id = "s_default", text = "My grandfather cleared this land. I'm not handing it to a man in a red mask because he asked with a knife." },
      },
      choices = {
        { text = "Good for you.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Pay them off and live. Land can be bought back.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Pride won't stop a knife.", next = "pride", fx = { trait = { skeptical = 1 } } },
        { text = "Everyone else left. Doesn't that worry you?", next = "fool" },
      },
    },
    pride = {
      lines = { { id = "p_default", text = "No. But it gets me up in the morning, and that's something a knife can't take." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
    fool = {
      lines = { { id = "fo_default", text = "Theodore Furlbrow told me to get out while I could and called me a fool for staying. I call him a fool for going, and one of us is right, but it's his wagon that's broken." } },
      choices = {
        { text = "Maybe you're both right.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Be kinder to him. He's frightened.", next = "BACK", fx = { affinity = -1, trait = { kind = 1 } } },
      },
    },
    watchers = {
      lines = {
        { id = "w_default", text = "Don't know, and I've stopped guessing. One day the fields were empty, next day they were full of things that wouldn't stay put." },
      },
      choices = {
        { text = "How many are out there?", next = "count" },
        { text = "Galiaan thinks someone set them on you.", next = "set_on", when = { heardLine = "galiaan.wa_default" } },
        { text = "I'm a tinker. I could take one apart.", next = "tinker", when = { race = "Gnome" } },
        { text = "I'll deal with them.", next = "BACK", fx = { learn = { "harvest_watchers" }, affinity = 1 } },
      },
    },
    count = {
      lines = {
        { id = "co_default", text = "Twenty, near enough, in mine and the neighbours' fields. Chop them down and there's coin in it, and a supper if Salma likes the look of you.",
          fx = { learn = { "harvest_watchers" } } },
      },
      choices = {
        { text = "Twenty, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    set_on = {
      big = true,
      lines = { { id = "so_default", text = "Did he, now? Then whoever did it knew what a farmer fears, because scarecrows that walk aren't robbery. That's cruelty with a plan." } },
      choices = {
        { text = "Then let's end the plan.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "It's only a guess.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    tinker = {
      lines = { { id = "tk_default", text = "Could you? Then take them apart, the lot, in bits small enough to burn. And if you find out who wound them up, tell me first." } },
      choices = {
        { text = "Gladly. Machines shouldn't be cruel.", next = "BACK", fx = { affinity = 2, learn = { "harvest_watchers" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    neighbours = {
      lines = {
        { id = "ne_default", text = "The Furlbrows ran and the Molsens ran, and thieves sleep in their beds now. If you're looking for honest work, Gryan's up on the hill and he'll find you plenty." },
        { id = "ne_report", when = { questActive = TODO_QUEST("Report to Gryan Stoutmantle") },
          text = "Gryan's up in the stone tower on Sentinel Hill, so tell him Saldean sent you. He'll not mind; he's short of everything." },
      },
      choices = {
        { text = "Will they ever come back?", next = "ne_back" },
        { text = "Something else.", next = "BACK", fx = { learn = { "people_militia" } } },
      },
    },
    ne_back = {
      lines = { { id = "nb_default", text = "If the fields are cleared, and if the thieves go, they might. Farmers live on ifs, and most years the ifs feed us." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    salma = {
      lines = { { id = "sa_default", text = "Best cook in Westfall, and the kindest. She'd feed a man in a red mask if he knocked politely. Don't tell her I know about that." } },
      choices = {
        { text = "She's fed Defias?", next = "salma_defias" },
        { text = "Something else.", next = "BACK" },
      },
    },
    salma_defias = {
      lines = { { id = "sd_default", text = "More than once. I keep my pitchfork by the door and my mouth shut, which is most of what marriage is." } },
      choices = {
        { text = "Wise man.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "That's a risk.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    farmhand = {
      lines = { { id = "fa_default", text = "Then you know the soil out here's gone thin. Whose fields were you on, before?" } },
      choices = {
        { text = "A farm the Defias hold now.", next = "farmhand_theirs" },
        { text = "I'd rather not say.", next = "BACK" },
      },
    },
    farmhand_theirs = {
      lines = { { id = "ft_default", text = "Then help clear it and work it again. I've seed put by; what I haven't got is hands." } },
      choices = {
        { text = "You'll have mine, when it's clear.", next = "BACK", fx = { affinity = 2, standing = { westfall_farms = 2 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bless = {
      lines = { { id = "bl_default", text = "Bless them after they're cleared. The Light's welcome here, but it won't pull a scarecrow out of my corn." } },
      choices = {
        { text = "Then I'll clear them first.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The Light pulls more than you'd think.", next = "BACK", fx = { align = { light = 1 }, trait = { pious = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've farmed this land all my life, and there's not much happens on it I don't hear about. Ask me about any of this." },
    },
    background = { { id = "tp_bg", text = "A farmer on the land my grandfather cleared. That's the whole of it, and it isn't finished yet.", next = "stay" } },
    advice = { { id = "tp_ad", text = "Don't stand still in a field after dark. The watchers don't see well, but they don't need to." } },
    harvest_watchers = {
      { id = "tp_watchers", text = "There were twenty in my field alone, last I counted, and then I stopped counting." },
    },
    defias = { { id = "tp_defias", text = "Thieves, the lot of them. They took the Furlbrows' farm and the Molsens', but they'll not take mine." } },
    westfall = { { id = "tp_westfall", text = "Best soil in the kingdom, under all that dust. People forget." } },
    old_blanchy = { { id = "tp_blanchy", text = "That's the Furlbrows' horse, older than sin and twice as stubborn. A good animal, though." } },
    people_militia = { { id = "tp_militia", text = "Good lads and lasses, the lot of them. They walk past my fence twice a day, and I sleep better for it." } },
    _none = { { id = "tp_none", text = "I can't help you there, friend. Ask me about soil instead." } },
  },
}
