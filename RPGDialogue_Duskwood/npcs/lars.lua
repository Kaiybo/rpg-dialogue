-- Lars, Sven Yorgen's companion at the camp on the Hushed Bank. Voice: bibles/lars.md
-- Hunts for the camp's food and gets chased home by dire wolves every time.
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "lars", id = TODO_NPC("Lars"), name = "Lars",
  bible = "bibles/lars.md", role = "questgiver", tier = "quest",
  communities = {}, temper = { "cheerful" }, values = { "loyal", "practical" },
  notices = { "animal", "hunger" },

  impression = {
    first = "Wolves chase him home, and he jokes about it and stays.",
    third = "{name} met Lars, who hunts for Sven Yorgen's camp on Duskwood's western edge and is forever being chased home by dire wolves.",
  },

  greetings = {
    { id = "dp_warm", when = { metBefore = true, disposition = { min = 60 } }, text = "Friend! Sit by the fire; I've saved you a rabbit, and the snare only took a little of my finger this time." },
    { id = "dp_cold", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Mind the snare, and mind your manners too, while you're at it." },
    { id = "g_camp", text = "Mind the snare by the log, friend. It's for rabbits, but it isn't fussy." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Did you bring meat, or are you hoping I did?" },
    { id = "g_wolves", when = { questActive = TODO_QUEST("Wolves at Our Heels") }, text = "Still hunting wolves? I can hear them, so I'd say you've a few left." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and I've been chased home by wolves at least twice for every day of it. Welcome back." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown since you thinned those wolves for us. I'd let you hunt my side of the river now." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Folk in Darkshire say you've been a help. Sven pretends not to care, but he asked after you." },
    { id = "g_word_angered", when = { word = "angered" }, text = "They tell me you've upset somebody out east. Out here we've got bigger troubles than grudges, so leave it at the river." },
  },

  notice = {
    { id = "n_pet", cat = "animal", when = { pet = { type = "Beast" } },
      text = "Keep {pet} close; the dire wolves will take it for a rival, and they don't share." },
    { id = "n_hungry", cat = "hunger", when = { maxLevel = 22 },
      text = "You look half-starved yourself. There's a bit of stew in the pot, though I won't say what's in it." },
  },

  start = "hello",
  nodes = {
    lar_sv1 = {
      lines = {
        { id = "lar_sv1_1", text = "Watches the road to Raven Hill, mostly, and sharpens the same knife he sharpened yesterday. Now and then he writes in a little book, and I don't ask what, because once I did and he didn't speak for two days." },
      },
      choices = {
        { text = "Does he ever go into town?", next = "lar_sv2" },
        { text = "Something else, Lars.", next = "BACK" },
      },
    },
    lar_sv2 = {
      lines = {
        { id = "lar_sv2_1", text = "Never, not once since I've known him. Darkshire sends things out to him instead, flash bundles and letters from the Commander and the odd parcel nobody explains, and I'm the one who walks to the road to collect them." },
      },
      choices = {
        { text = "Who sends the parcels?", next = "lar_sv3" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    lar_sv3 = {
      lines = {
        { id = "lar_sv3_1", text = "The Commander's name is on most of them, though I've seen Madame Eva's seal once or twice. Whatever's in them, Sven reads every word and burns the wrappings, and I've stopped wondering why folk in town care so much about a hermit." },
      },
      choices = {
        { text = "Maybe he matters more than you think.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lar_sup1 = {
      lines = {
        { id = "lar_sup1_1", text = "I walk into Darkshire once a fortnight, early, with a pack and a long knife, and I trade pelts for flour and salt. The wolves have learned the day, I swear, because that's when they come closest to the camp." },
      },
      choices = {
        { text = "I'll walk you in next time.", next = "lar_sup2", when = { class = { "HUNTER", "WARRIOR" } } },
        { text = "The wolves can't count days.", next = "lar_sup2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lar_sup2 = {
      lines = {
        { id = "lar_sup2_1", text = "Maybe not, but they can smell an empty camp, and Sven's no help against them when he's in one of his moods. Anyone who thinned that pack would have my thanks, I'll say that much." },
      },
      choices = {
        { text = "Then they'll learn to respect you. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Lars. Sven's the brooding one by the fire, and I'm the one who goes out and finds dinner. Living out here alone is dangerous work, but somebody's got to feed him." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Wolves at Our Heels") },
          text = "Every time I'm heading back with meat on me, starving or rabid dire wolves come out of the forest wanting a bite. If you could thin them out, we'd have an easier time of it." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Wolves at Our Heels") },
          text = "They prowl north and east of here, mostly, near the river. The starving ones are desperate, and the rabid ones are worse, so don't let them bite you." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Wolves at Our Heels"), days = 3 } },
          text = "You thinned that pack nicely, and without wolves nipping at our heels we can turn our minds to the necromancer. Take some of the flash bundles; folk in town keep sending them to Sven." },
        { id = "h_morbent", when = { questDone = TODO_QUEST("Morbent Fel") },
          text = "Sven sat up all night after Morbent Fel fell, not talking. I think that was him being glad." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter! Thank the Light, someone who knows which end of a rabbit to start on." },
      },
      again = {
        { id = "h_again", text = "Anything else? Ask while the rabbit's on, and mind the smoke; the wind's turning." },
        { id = "h_again2", text = "Go on, I'm listening, as long as you don't mind me skinning while you talk." },
      },
      choices = {
        { text = "Not many would stay out here with Sven.", next = "sven" },
        { text = "What's worse here, wolves or the dead?", next = "danger" },
        { text = "Who else makes trouble in these woods?", next = "necro" },
        { text = "Let me teach you a better snare.", next = "snare", when = { class = { "HUNTER", "DRUID" } } },
        { text = "I'll help with the wolves.", next = "BUSINESS" },
        { text = "What does Sven do all day by that fire?", next = "lar_sv1" },
        { text = "How do you get supplies out here?", next = "lar_sup1" },
        { text = "What's in the pot tonight?", next = "e3_stew" },
        { text = "Good hunting, Lars.", next = "END" },
      },
    },
    sven = {
      lines = { { id = "s_default", text = "Nobody else would, so I do, and a man who's lost what Sven's lost shouldn't sit by a fire on his own. He'd tell you he doesn't need me, and he'd be wrong." },
      },
      choices = {
        { text = "What did he lose?", next = "sven_loss" },
        { text = "That's good of you.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    sven_loss = {
      lines = { { id = "sl_default", text = "His family, his farm, and most of his reasons for getting up in the morning. He'll tell you himself if he wants to, so I'll not tell it for him." },
      },
      choices = {
        { text = "He sounds like a man who wants revenge.", next = "sven_revenge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sven_revenge = {
      big = true,
      lines = { { id = "sr_default", text = "He wants a name, and I think he wants the man behind it dead. I've told him it won't bring them back, and he looks at me like I've said something stupid. What do you think?" },
      },
      choices = {
        { text = "Justice, not revenge. Let the Watch handle it.", next = "BACK", reply = "That's what I keep telling him, though the Watch has its hands full just holding Darkshire. Maybe if he hears it from you, he'll stop looking at me like I'm daft.", fx = { align = { order = 1 } } },
        { text = "He's earned his revenge, and you should help him get it.", next = "BACK", reply = "Ha, you sound like him on a bad night. I'll stand by him, I always have, but I'd rather he lived long enough to enjoy whatever he finds.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "I don't know, Lars.", next = "BACK" },
      },
    },
    danger = {
      lines = { { id = "d_default", text = "The wolves, because they're hungry every day. The dead only come for you if you go looking, and I make a point of not going looking." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    necro = {
      lines = { { id = "n_default", text = "A necromancer called Morbent Fel, up past Raven Hill. Sven says his name the way other folk spit, and I don't ask him why, because I can guess." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    snare = {
      lines = { { id = "sn_default", text = "Would you? Mine catch rabbits about one night in four, and the wolves eat the rabbit half the time anyway." },
      },
      choices = {
        { text = "Set it low, by the water, and use wire.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    e3_stew = {
      lines = {
        { id = "e3_stew_l0", text = "Rabbit, if the snare was kind, and wolf, if it wasn't and the wolf came after my rabbit. Tonight it's a bit of both, with wild onion and a mushroom Scott Carevin swore was safe, so if I'm dead by morning, you know who to blame." },
      },
      choices = {
        { text = "Does Sven ever eat?", next = "e3_stew2" },
        { text = "Wolf stew. Fitting.", next = "BACK" },
      },
    },
    e3_stew2 = {
      lines = {
        { id = "e3_stew2_l0", text = "When I put the bowl right in his hands and stand there, yes, and he says it's good, which from Sven is a speech. Some nights he even asks what's in it, and those are the nights I think he's coming back to us." },
      },
      choices = {
        { text = "Keep cooking for him. Something else.", next = "BACK" },
        { text = "He'll come back in his own time.", next = "BACK" },
      },
    },
  },

  topics = {
    regard = {
      { id = "dp_rg", text = "You're good company, friend, and Sven says so too, though he'd never say it to your face." },
    },
    grievance = {
      { id = "dp_gv", text = "You've been short with me, and I'm the friendly one in this camp. Ask Sven how rare that is." },
    },
    background = { { id = "tp_bg", text = "I hunt, I cook, and I keep Sven company. It's not much of a story, but it's mine." } },
    advice = { { id = "tp_ad", text = "Carry the meat on your back, not in your hand. A wolf goes for the hand first." } },
    morbent_fel = { { id = "tp_morbent", text = "Sven's business, mostly, though I'd not weep if somebody finished him.", next = "necro" } },
    _none = { { id = "tp_none", text = "No idea, friend. Ask Sven, if you can get more than three words out of him." } },
    dark_riders = { { id = "tp_dark_riders", text = "Sven wants the riders dead, and so do I, but I want Sven alive more. I keep the fire low and one eye on the road." } },
    raven_hill = { { id = "tp_raven_hill", text = "Game's thin near Raven Hill, because the wolves have more sense than we do and stay away. I don't hunt there, and neither should you." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I won a knife at the Faire in Elwynn years back for throwing a ring over a bottle. It's the best knife I own, and I've skinned half of Duskwood with it." } },
  },
}
