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
    first = "He is gruff about everything except a good stance.",
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
        { id = "h_default", key = true, text = "I'm Austil de Mon. I drilled Lordaeron's footmen when they still bled, and now I train the warriors of Brill, if you've the stomach for it and the coin." },
        { id = "h_orcwar", when = { class = "WARRIOR", race = "Orc" },
          text = "An orc, come all the way to Brill to learn from a dead footman. I spent the Second War trying to kill your people, so you'll forgive me if I enjoy teaching you how we nearly did it." },
        { id = "h_taurwar", when = { class = "WARRIOR", race = "Tauren" },
          text = "A tauren warrior in Gallows' End! Mind the rafters, and mind the furniture, because the last time one of you sparred indoors I lost a table and a regular." },
        { id = "h_w10", tags = { "news" }, when = { class = "WARRIOR", minLevel = 10, questBefore = TODO_QUEST("Path of Defense") }, text = "You've outgrown a tavern drillyard. Take the zeppelin from the tower outside town to Durotar and find an orc called Uzzek near Far Watch in the Barrens, because he teaches the shield better than I ever did, and it galls me to say so." },
        { id = "h_w20", when = { class = "WARRIOR", minLevel = 20 }, text = "You've grown past Brill, and the trainers in the Undercity's War Quarter can give you more than I can. Still, it does an old drillmaster good to see one of his corpses come back walking." },
        { id = "h_warrior", when = { class = "WARRIOR", race = "Scourge" },
          text = "Another one of ours with a blade. Plenty of you woke with your old drills still in your arms, and my job is to remind your arms what they knew." },
        { id = "h_ready", when = { class = "WARRIOR", questBefore = TODO_QUEST("Speak with Dillinger") },
          text = "You're coming along. Deathguard Dillinger at the west end of town has a task that wants a warrior, and I think you might be ready for it." },
        { id = "h_ulag", tags = { "news" }, when = { questDone = TODO_QUEST("Ulag the Cleaver") },
          text = "Dillinger tells me Ulag the Cleaver is dead and you're the one who did it. I said you'd do, and I'm glad I wasn't wrong in front of him." },
        { id = "h_other", when = { class = { "MAGE", "PRIEST", "WARLOCK" } },
          text = "Not one of mine, by the look of you. Still, a caster who knows how to take a hit lives twice as long as one who doesn't." },
      },
      again = {
        { id = "h_again", text = "Something else? Make it quick; I've a corpse out back who thinks a shield is a hat, and he's lost two fingers proving it." },
        { id = "h_again2", text = "Go on, then. Ask, and keep your guard up while you do." },
      },
      choices = {
        { text = "What makes a good warrior, in your eyes?", next = "good" },
        { text = "Your recruits look freshly risen.", next = "recruits" },
        { text = "What's this task Dillinger has for me?", next = "dillinger", when = { class = "WARRIOR", heardLine = "austil.h_ready" } },
        { text = "I'm here to train.", next = "BUSINESS" },
        { text = "How do I fight a Scarlet footman?", next = "w_footman", when = { class = "WARRIOR" } },
        { text = "What comes after Brill for a warrior?", next = "w_after", when = { class = "WARRIOR", minLevel = 8 } },
        { text = "I'll get out of your way.", next = "END" },
      },
    },

    good = {
      lines = { { id = "go_default", text = "Getting back up, mostly. Anyone can swing a sword, but a warrior is the one still standing in the line when everyone sensible has run." } },
      choices = {
        { text = "And when the line breaks?", next = "good_line" },
        { text = "Something else.", next = "BACK" },
      },
    },
    good_line = {
      big = true,
      lines = { { id = "gl_default", text = "Then you make a new one with whoever's left. Lordaeron's lines all broke, and here we are anyway, still arguing over who holds the left flank." } },
      choices = {
        { text = "Then I'll hold the line, whatever's left of it.", next = "BACK", reply = "That's the right answer, and I've heard it from fewer recruits than you'd hope. Hold it until there's nobody left to hold it with, and then hold it a little longer.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Or you survive by running first. That works too.", next = "BACK", reply = "It works until the day there's nowhere left to run, and in Lordaeron that day came quicker than anyone expected. I'd rather you learned that here than in the Plaguelands.", fx = { align = { honor = -1 } } },
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

    w_footman = {
      lines = {
        { id = "wf_default", text = "The way I taught them to fight, so I know where they're weak: they're drilled to hold the shield high against a sword, so a footman never sees a blow to the knee coming. Hamstring him, and he'll stand there bleeding and wondering why his drills failed him." },
        { id = "wf_low", when = { maxLevel = 9 }, text = "Carefully, because they're living, rested and trained, and you've been out of the grave a week. Charge one when he's alone, rend him, and back off if a second one comes, because two Scarlets will finish you." },
      },
      choices = {
        { text = "Do you hate them for what they've become?", next = "w_footman2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w_footman2 = {
      big = true,
      lines = { { id = "wf2_default", text = "Some of them I trained myself, when they were boys with pikes too long for them. They'd burn me now without a second look, so no, I don't hate them, but I won't lose a moment's sleep over killing them either." } },
      choices = {
        { text = "They're the Dark Lady's enemies. That's all that matters.", next = "BACK", reply = "That's a soldier's answer, and I've no better one. Go and give them a lesson.", fx = { align = { order = 1 } } },
        { text = "They're fools, but they're not monsters. I'll pity them.", next = "BACK", reply = "Pity them after, then, and not before. They won't return the favour.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    w_after = {
      lines = {
        { id = "wa_default", text = "The War Quarter of the Undercity, where Angela Curthas, Christoph Walker and that loudmouth Baltus Fowler train the Dark Lady's soldiers. Before long they'll put you on a zeppelin to the Barrens to learn the shield from an orc, and you'll find out what the rest of the Horde makes of us." },
      },
      choices = {
        { text = "What will the orcs make of us?", next = "w_after2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w_after2 = {
      lines = { { id = "wa2_default", text = "They'll stare, and some of them will remember killing men who looked a lot like you, and some of them will remember being killed by them. Fight well beside them, and they'll stop staring; fight badly, and they'll only stare harder." } },
      choices = { { text = "I'll fight well. Something else.", next = "BACK" } },
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
    _none = { { id = "tp_none", text = "I teach fighting, and I stopped caring about much else when I died. Ask Innkeeper Renee at the bar." } },
  },
}
