-- Madame Eva, fortune-teller, Darkshire. Voice: bibles/eva.md
-- The old arts. Cards, stars, and a voice that makes the candles lean.
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "eva", id = TODO_NPC("Madame Eva"), name = "Madame Eva",
  bible = "bibles/eva.md", role = "questgiver", tier = "quest",
  communities = { "darkshire" }, temper = { "steady" }, values = { "curious", "cunning" },
  spiritSensitive = true,
  notices = { "fate", "fel" },

  greetings = {
    { id = "g_expected", text = "Ah. You. The stars said you would come. They did not say you would be so late." },
    { id = "g_back", when = { metBefore = true }, text = "Sit. The cards have been restless since you left." },
  },

  notice = {
    { id = "n_deaths", cat = "fate", when = { deaths = { min = 10 } },
      text = "The cards keep turning up Death for you, and Death keeps sending you back. It finds you amusing, I think. Do not test it." },
    { id = "n_warlock", cat = "fel", place = "before", when = { class = "WARLOCK" },
      text = "You carry something that does not belong to this world. The cards will not lie flat while you stand there. Step back, please." },
    { id = "n_taint", cat = "fel", when = { taint = { min = 25 } },
      text = "There is a shadow at your shoulder that is not yours. I see it in the candle. Don't turn around. It doesn't like to be looked at." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Madame Eva. I follow the old arts. I read what the cards say and what the stars refuse to. Horrors wait in the night here. I simply know their names." },
        { id = "h_shadowy", tags = { "news" }, when = { questActive = TODO_QUEST("The Shadowy Figure") },
          text = "A figure in the fog, watching the farm where the Yorgens died. The cards show me a frightened man, not a monster. Find him." },
        { id = "h_totem", when = { questActive = TODO_QUEST("The Totem of Infliction") },
          text = "A totem, made of suffering. I need it whole. Bring me what it asks for, and do not ask me what it does." },
        { id = "h_stalvan", when = { questActive = TODO_QUEST("The Legend of Stalvan") },
          text = "The manor. The cards show a teacher with a gentle hand and something behind his back. Follow the letters. They lead uphill." },
        { id = "h_new", when = { maxLevel = 20 },
          text = "So young, to be walking in Duskwood. The stars are fond of you. That isn't always a kindness." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "The cards don't know what to make of you. They keep turning up the Wind. It has never come up twice in one night before." },
        { id = "h_cards", when = { metBefore = true }, text = "The cards turned up the Tower again this morning. They always do, in Duskwood. I've stopped charging extra for it." },
      },
      choices = {
        { text = "Read my cards.", next = "cards" },
        { text = "What waits in the night?", next = "night" },
        { text = "I'll go.", next = "END" },
      },
    },
    cards = {
      lines = {
        { id = "c_default", text = "The Traveller. The Tower, reversed. And the Raven, which in Darkshire means only that you'll be here a while." },
        { id = "c_light", when = { alignment = { axis = "light", min = 40 } },
          text = "The Sun, burning in a dark room. A good card. A lonely one." },
        { id = "c_hand", once = true, when = { heardLine = "pool:spirithealer.pr_default" }, fx = { hear = "spirithealer_other_hand" },
          text = "Death, upright. And across it, in a neat hand that isn't mine: not here, not yet. I did not write that. Who have you been talking to?" },
        { id = "c_lantern", when = { heardLine = "pool:spirithealer.ln6" },
          text = "The Lantern. I have dealt that card for forty years and never once seen it lit. Tonight it's lit. Someone, somewhere, stopped waiting." },
        { id = "c_dark", when = { alignment = { axis = "light", max = -40 } },
          text = "The Knife. Again. Every time I deal for you. I've stopped shuffling; it makes no difference." },
      },
      choices = {
        { text = "What does that mean?", next = "mean", fx = { trait = { curious = 1 } } },
        { text = "I don't believe in cards.", next = "END", fx = { trait = { skeptical = 1 }, affinity = -1 } },
      },
    },
    mean = {
      lines = { { id = "m_default", text = "It means you will pay me for the reading. Everything else is up to you." } },
      choices = { { text = "Ha. Fair.", next = "END", fx = { affinity = 1 } } },
    },
    night = {
      big = true,
      lines = {
        { id = "n_door", when = { heardLine = "pool:spirithealer.dr_default" },
          text = "The dead, the wolves, the men who choose to be monsters. And past them all, a door; you've heard of it, I see. The cards call it the Threshold. Do not knock." },
        { id = "n_default", text = "The dead, walking. The worgen, howling. And men who choose to be monsters, which are worse than either, because they could have chosen otherwise." },
      },
      choices = { { text = "I'll remember.", next = "END", fx = { learn = { "stalvan" } } } },
    },
  },

  topics = {
    stalvan = { { id = "tp_stalvan", text = "His card is the Tutor. Patient. Gentle. Holding an axe where you cannot see it." } },
    worgen = { { id = "tp_worgen", text = "Something was found in Roland's Doom that should have stayed lost. The wolves came after." } },
    night_watch = { { id = "tp_watch", text = "Brave. Brave is a card too. It falls a lot." } },
    _none = { { id = "tp_none", text = "The cards are silent on that. They are rarely silent. Make of that what you will." } },
  },
}
