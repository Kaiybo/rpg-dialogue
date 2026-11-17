-- Sergeant De Vries, morale officer and drink seller inside Westbrook Garrison. Voice: bibles/sergeant_de_vries.md
-- Keeps an undermanned garrison's spirits up with a cask, a joke and a sharp eye for who's flagging.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "sergeant_de_vries", id = TODO_NPC("Sergeant De Vries"), name = "Sergeant De Vries",
  title = "Morale Officer",
  bible = "bibles/sergeant_de_vries.md", role = "vendor", tier = "service",
  communities = { "goldshire" }, temper = { "warm" }, values = { "loyal", "friendly" },
  notices = { "kit", "drink" },

  impression = {
    first = "Sergeant De Vries is Westbrook's morale officer, which seems to mean he sells the drink and listens to the complaining. He is better at the second part than he lets on.",
    third = "{name} met Sergeant De Vries, morale officer of Westbrook Garrison, who keeps tired soldiers going with drink and good humour.",
  },

  greetings = {
    { id = "g_cask", text = "Come in, come in! Something to wet your throat? Morale's my job, and thirst is the enemy of morale." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I knew you'd miss the place; nobody leaves Westbrook for good." },
    { id = "g_apple", when = { questActive = TODO_QUEST("An Apple Treat") }, text = "That apple business of mine, is it? Don't let me keep you from it." },
    { id = "g_apple_done", when = { questDone = TODO_QUEST("An Apple Treat") }, text = "Still grateful for that apple business, friend. Small things like that are half my job." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and the lads have been asking after you, or at least one of them has. Welcome back to Westbrook." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've filled out since you first came through that door, friend. You've the look of someone the lads would follow now." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Word down the road says you've done right by folk. That's good for morale too, you know, even mine." },
    { id = "g_word_intim", when = { word = "intimidated" }, text = "Heard you've been leaning on people. Not in my room, friend; this is where the lads come to get away from that." },
  },

  notice = {
    { id = "n_weary", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You look done in, and your kit looks worse. Sit down a moment; the smith can wait until you've had a drink." },
    { id = "n_drink", cat = "drink", when = { drunk = true },
      text = "Somebody's started early, I see! Well, I won't tell Rainer if you won't." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Sergeant De Vries, morale officer of Westbrook Garrison. I keep the drink flowing and the lads smiling, and some weeks the drink's the easier half." },
        { id = "h_soldier", when = { class = { "WARRIOR", "PALADIN" } },
          text = "A fighter, by the look of you. You'll know, then, that a soldier marches on his stomach and fights on whatever's in his cup." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Quiet night, so far. The gnolls usually wait till the small hours, and so do I before I pour the strong stuff." },
      },
      again = {
        { id = "h_again", text = "Anything else? The cask's not going anywhere." },
        { id = "h_again2", text = "Go on, friend. I've time for a chat; it's half the job." },
      },
      choices = {
        { text = "What does a morale officer do?", next = "job" },
        { text = "Your soldiers look worn thin, Sergeant.", next = "lads" },
        { text = "What's for sale?", next = "BUSINESS" },
        { text = "Take care, Sergeant.", next = "END" },
      },
    },
    job = {
      lines = { { id = "j_default", text = "Pour, listen and notice. A lad who stops eating, a lad who stops writing home, a lad who drinks too fast; I see it first, and I tell Rainer before it turns into something worse." },
      },
      choices = {
        { text = "And what do you do about it?", next = "job_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    job_how = {
      big = true,
      lines = { { id = "jh_default", text = "A kind word, mostly, or an extra night off when I can wangle one. Some officers say a firm hand does it better, and I'll admit they're not always wrong." },
      },
      choices = {
        { text = "Kindness first. Frightened men break faster.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "A firm hand. Soft treatment makes soft soldiers.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lads = {
      lines = { { id = "l_default", text = "Tired, and too few of them. With the kingdom's strength stretched so far from home, Westbrook gets what's left, and the gnolls and the Defias know it." },
      },
      choices = {
        { text = "Then I'll lend a hand outside.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A sergeant of the Stormwind Guard, posted to Westbrook. I'm better with a cask than a sword, and the captain knew it." } },
    advice = { { id = "tp_ad", text = "Eat something before you drink something. You'd be amazed how many soldiers never learn it." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. Ask Deputy Rainer; he's the one with the reports." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "When the Faire's at Goldshire I lose half the garrison to it on their days off, and they come back with sore heads and a story apiece. Good for morale, I tell the deputy, and he pretends to believe me." } },
    booty_bay = { { id = "tp_booty_bay", text = "I tasted rum from Booty Bay once that took the varnish off a table, and I've wanted a cask for the garrison ever since. Deputy Rainer says no, very firmly." } },
    varian = { { id = "tp_varian", text = "The lads ask me about the king, because I'm the morale officer and they think I know things. I pour them a drink and tell them he'll be back, and I hope I'm not a liar." } },
  },
}
