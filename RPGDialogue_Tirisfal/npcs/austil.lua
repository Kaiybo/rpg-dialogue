-- Austil de Mon, warrior trainer in the Gallows' End Tavern, Brill. Voice: bibles/austil.md
-- A drillmaster who trains corpses to fight like soldiers, and is quietly proud when they do.
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "austil", id = TODO_NPC("Austil de Mon"), name = "Austil de Mon", title = "Warrior Trainer",
  bible = "bibles/austil.md", role = "trainer", tier = "service",
  communities = { "brill" }, temper = { "gruff" }, values = { "dutiful", "proud" },
  notices = { "class", "kit" },
  impression = {
    first = "Austil de Mon drills warriors in the back of the Gallows' End Tavern as if Lordaeron's army still needed recruits. He is gruff about everything except a good stance.",
    third = "{name} met Austil de Mon, who trains the Forsaken's warriors in Brill's tavern.",
  },

  greetings = {
    { id = "g_drill", text = "Feet apart, shield up, and stop leaning on the bar; dead knees don't lock the way living ones did. What do you need?" },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? Good. The ones who stop coming back are usually the ones who stopped getting up." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}. I hope you were fighting, though in Brill a corpse can sit in the tavern for a month and nobody can tell it from the furniture." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've put on some steel since I last saw you. Show me your guard... yes, much better." },
    { id = "g_word_intimidated", when = { word = "intimidated" }, text = "Word is you made someone in town back down without a fight. Fine work, but don't make a habit of winning that way, or you'll forget how to win the other way." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR", race = { "Orc", "Tauren", "Troll" } },
      text = "A warrior of the Horde, in my tavern. I'll not pretend I can teach an orc much about swinging an axe, but I can teach you how a Lordaeron footman fights, and you'll be meeting plenty of them in red." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Look at that armor. A warrior who lets his gear rot is telling his enemies where to aim." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Austil de Mon. I drilled Lordaeron's footmen when they still bled, and now I train the warriors of Brill, if you've the stomach for it and the coin." },
        { id = "h_warrior", when = { class = "WARRIOR", race = "Scourge" },
          text = "Another one of ours with a blade. Plenty of you woke with your old drills still in your arms, and my job is to remind your arms what they knew." },
        { id = "h_ready", when = { class = "WARRIOR", questBefore = TODO_QUEST("Speak with Dillinger") },
          text = "You're coming along. Deathguard Dillinger at the west end of town has a task that wants a warrior, and I think you might be ready for it." },
        { id = "h_ulag", tags = { "news" }, when = { questDone = TODO_QUEST("Ulag the Cleaver") },
          text = "Dillinger tells me Ulag is dead and you're the one who did it. I said you'd do, and I'm glad I wasn't wrong in front of him." },
        { id = "h_other", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
          text = "Not one of mine, by the look of you. Still, a caster who knows how to take a hit lives twice as long as one who doesn't." },
      },
      again = {
        { id = "h_again", text = "Something else? Make it quick; I've a corpse out back who thinks a shield is a hat, and he's lost two fingers proving it." },
      },
      choices = {
        { text = "What makes a good warrior, in your eyes?", next = "good" },
        { text = "Your recruits look freshly risen.", next = "recruits" },
        { text = "Dillinger's task. What is it?", next = "dillinger", when = { class = "WARRIOR", heardLine = "austil.h_ready" } },
        { text = "I'm here to train.", next = "BUSINESS" },
        { text = "I'll get out of your way.", next = "END" },
      },
    },

    good = {
      lines = { { id = "go_default", text = "Getting up, mostly. Anyone can swing a sword, but a warrior is the one still standing in the line when everyone sensible has run." } },
      choices = {
        { text = "And when the line breaks?", next = "good_line" },
        { text = "Something else.", next = "BACK" },
      },
    },
    good_line = {
      big = true,
      lines = { { id = "gl_default", text = "Then you make a new one with whoever's left. Lordaeron's lines all broke, and here we are anyway, still arguing over who holds the left flank." } },
      choices = {
        { text = "Then I'll hold the line, whatever's left of it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Or you survive by running first. That works too.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    recruits = {
      lines = { { id = "re_default", text = "Farmers, clerks, a baker last week, all freshly dead and all sure they're going to fall apart if they swing too hard. They don't, mostly, but the doubt is the first thing I have to beat out of them." } },
      choices = {
        { text = "And the living ones? Orcs, trolls?", next = "recruits_living" },
        { text = "Something else.", next = "BACK" },
      },
    },
    recruits_living = {
      lines = { { id = "rl_default", text = "They come through now and then, and they hit very hard and listen very little. I've learnt more from watching one orc fight than from ten years of drill manuals, though I'll deny it if you tell him." } },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    dillinger = {
      lines = { { id = "di_default", text = "That's for Dillinger to tell you, and he'll tell it better than I would. Report to his post by the graveyard, and don't make me regret sending you." } },
      choices = {
        { text = "You won't regret it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I drilled footmen before the plague, and I drill corpses now. The corpses complain less." } },
    advice = { { id = "tp_ad", text = "Keep your shield up even when you're winning, because that's exactly when people stop." } },
    lordaeron = { { id = "tp_lordaeron", text = "I drilled recruits for King Terenas once, in a yard much like this one, and not one of those lads lived to see the plague's end. Lordaeron fell because the people who loved it most were the first to die for it." } },
    scourge = { { id = "tp_scourge", text = "The Scourge has no stance and no form, only numbers and hunger, and numbers will still beat a poor stance every time. So learn a good one, and stand where they have to come at you one at a time." } },
    second_war = { { id = "tp_second_war", text = "I held a pike at Lordaeron's gates when the Horde came up out of the south. We beat them, and I'll tell you plainly that I'd sooner face a hundred orcs than one more field of walking dead." } },
    arthas = { { id = "tp_arthas", text = "I saluted the prince on parade, back when he was a fine boy with a fine seat on a horse. Don't ask me more than that, because I've no wish to think on it." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken are what's left of Lordaeron's people when you take away the warmth and keep the stubbornness. I'll take a stubborn recruit over a warm one any day." } },
    _none = { { id = "tp_none", text = "I teach fighting, and I stopped caring about much else when I died. Ask Renee at the bar." } },
  },
}
