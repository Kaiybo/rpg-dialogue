-- Vargus, Cenarion Hold's tauren blacksmith (0.72.0). Voice: bibles/vargus.md
-- Fights the sand more than the bugs; respects chitin, distrusts anything the cult has touched.
local P = RPGDialogueAPI:Pack("rpgd.silithus")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "vargus", id = TODO_NPC("Vargus"), name = "Vargus", title = "Blacksmith",
  bible = "bibles/vargus.md", role = "blacksmith", tier = "service",
  communities = { "cenarion_hold" }, temper = { "steady", "gruff" }, values = { "craft", "patient" },
  notices = { "kit", "craft" },
  impression = {
    first = "Vargus keeps Cenarion Hold's forge hot in a desert that's already too hot, and fights the sand in every joint and buckle. He speaks slowly, works fast and respects silithid chitin more than most steel.",
    third = "{name} met Vargus, the tauren blacksmith who keeps the Cenarion Hold forge burning.",
  },

  greetings = {
    { id = "g_default", text = "Set it on the anvil and tell me what broke. Then tell me what broke it, because that matters more; my father said the hunt is in the wound, not the spear." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and with more sand in your armor, I'd wager. Let me see." },
    { id = "g_away", when = { away = 14 }, text = "You were gone {away}, and the forge never cooled once. Neither did the sand, though I pray to An'she for a cooler day." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The Hold speaks well of you. Good; a smith likes to know whose armor he's mending." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Earth Mother, look at that. You've been to the hives in that and come back, which says more for you than for the armor." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith. You'll know, then, that sand in a hinge is worse than any blade, and you'll forgive my temper about it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Vargus, and I keep the forge for the Hold. Bugs, cultists and stone giants all break armor, but it's the sand that ruins it, so that's what I fight, every day, with the patience the Earth Mother gave my people." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "One of the people, so far from the plains. The Wildmane brothers will be glad of you, and so am I." },
        { id = "h_warrior", when = { class = { "WARRIOR", "PALADIN" } },
          text = "Plate, in this heat. You must be either very brave or very stubborn, and I've not yet met a warrior who was only one." },
      },
      again = {
        { id = "h_again", text = "Something else? The iron won't wait long, though I will." },
        { id = "h_again2", text = "Go on. I can listen and hammer." },
      },
      choices = {
        { text = "What does the sand do to armor?", next = "sand" },
        { text = "What do you make of silithid chitin?", next = "chitin" },
        { text = "I'd guess a few cultist blades come through here.", next = "cult" },
        { text = "Any advice for a fellow smith?", next = "smith", when = { profession = "Blacksmithing" } },
        { text = "Fix my gear, Vargus.", next = "BUSINESS" },
        { text = "Thank you, Vargus.", next = "END" },
      },
    },
    sand = {
      lines = { { id = "s_default", text = "It gets into every rivet and grinds, and grinds, until a strap snaps in the middle of a fight. Clean your buckles every night, even when you're tired, and especially when you're tired." } },
      choices = {
        { text = "Every night?", next = "sand_night" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sand_night = {
      lines = { { id = "sn_default", text = "Every night. The soldiers here grumble, and then one of them loses a pauldron to a stinger and stops grumbling. I'd sooner you learned it from me." } },
      choices = { { text = "I'll learn it from you.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } } },
    },
    chitin = {
      lines = { { id = "c_default", text = "Light, and harder than it has any right to be, and it shrugs off a blade the way good plate does. I have studied pieces the soldiers bring back, and I respect it, though I like the creatures that grow it not at all." } },
      choices = {
        { text = "Would you forge with it?", next = "chitin_forge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    chitin_forge = {
      big = true,
      lines = { { id = "cf_default", text = "Some smiths would, and some leatherworkers already do. I am not sure it is wise to wear the enemy's shell, but I am not sure it is foolish either, and out here the useful thing usually wins." } },
      choices = {
        { text = "Use every advantage. The bugs would.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Some lines are worth keeping, even here.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult = {
      lines = { { id = "cu_default", text = "Now and then a soldier brings me a Twilight blade to melt down. I melt them, and I don't keep the metal, because some of them hum in the fire, and a smith knows when to listen to his forge." } },
      choices = { { text = "Wise of you.", next = "BACK" } },
    },
    smith = {
      lines = { { id = "sm_default", text = "Quench in oil, not water, out here; the water's too precious and the steel cools too fast in this heat anyway. And keep your hammer out of the sand, or you'll be filing grit off your work for a week." } },
      choices = { { text = "Good advice.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A smith of the people, come south with the Circle because the Circle needed someone to keep its soldiers in one piece." } },
    advice = { { id = "tp_ad", text = "Clean your buckles. I will keep saying it until somebody listens." } },
    twilights_hammer = { { id = "tp_twh", text = "Their blades hum in my fire, and I don't like the tune. That's all I want to know about them." } },
    _none = { { id = "tp_none", text = "Ask someone who doesn't spend all day at an anvil. That's most of the Hold, and the Earth Mother bless them for it." } },
  },
}
