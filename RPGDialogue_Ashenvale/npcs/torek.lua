-- Torek, orc raid leader near the Warsong Labor Camp, about to hit Silverwing Outpost (0.72.0). Voice: bibles/torek.md
-- Classic: Torek's Assault (escort; report to Ertog Ragetusk).
local P = RPGDialogueAPI:Pack("rpgd.ashenvale")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "torek", id = TODO_NPC("Torek"), name = "Torek",
  bible = "bibles/torek.md", role = "soldier", tier = "quest",
  communities = { "splintertree" }, temper = { "eager", "boisterous" }, values = { "glory", "loyal" },
  notices = { "soldier", "class" },
  impression = {
    first = "Torek wants scars the way some people want gold, and he wants company while he earns them. He respects the night elves enough to want a good fight from them.",
    third = "{name} met Torek, an orc raid leader in Ashenvale planning an assault on the Silverwing Outpost.",
  },

  greetings = {
    { id = "g_hello", text = "Hey, {class}, come here! I've got a fight that needs one more blade." },
    { id = "g_active", when = { questActive = TODO_QUEST("Torek's Assault") }, text = "Ready? My raiders are itching, and the elves won't wait forever to notice us." },
    { id = "g_done", when = { questDone = TODO_QUEST("Torek's Assault") }, text = "Silverwing burned, and Duriel Moonfire fell! I'm still picking splinters out of my arm, and I couldn't be happier." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and back with all your limbs? You're not trying hard enough, {class}." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've put on muscle since we hit Silverwing together. Come raid with me again and add some scars to match." },
    { id = "g_word_intimidated", when = { word = "intimidated" }, text = "Heard you put the fear into somebody at the post. Good! Save some for the elves, though." },
  },

  notice = {
    { id = "n_scars", cat = "soldier", when = { honorKills = { min = 50 } },
      text = "You've been fighting the Alliance; I can see it in how you stand. Good, because my raiders could use someone who's seen a Sentinel's arrow coming." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN", race = "Orc" },
      text = "A shaman of the clans! Call down a storm on the outpost for me, and I'll tell the tale in Orgrimmar for a year." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Torek, and my raiders and I are about to hit the Silverwing Outpost to the west. Our target is its leader, Duriel Moonfire, and the scouts say it's thick with Sentinels, so the battle will be glorious, and we'll all come home with fresh scars." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Torek's Assault") },
          text = "Stay close and keep my raiders alive, and when it's over, you report our success to Ertog Ragetusk. With luck, we'll all gain some good scars today." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Torek's Assault"), days = 3 } },
          text = "Did Ertog say anything about me? I hope he said I was loud, because I was very loud, and the elves heard it." },
        { id = "h_young", when = { maxLevel = 18 },
          text = "You're a bit green for this raid, {class}. Come back when you've been blooded somewhere, and then we'll see." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren! The elves will scatter when they see you coming through the trees, and I want to be there to see it." },
        { id = "h_undead", when = { race = "Scourge" },
          text = "One of the Forsaken. You don't scar, do you? That seems unfair, but I'll still take your blade." },
      },
      again = {
        { id = "h_again", text = "What else? Ask fast, my raiders are getting bored." },
        { id = "h_again2", text = "Speak up, {class}. Talking's fine, but fighting's better." },
      },
      choices = {
        { text = "Why attack Silverwing Outpost?", next = "why" },
        { text = "Who is Duriel Moonfire?", next = "duriel" },
        { text = "Why do you want scars?", next = "scars" },
        { text = "Thrall wants peace. Is this wise?", next = "thrall" },
        { text = "I'm a warrior too. What's your plan?", next = "warrior_t", when = { class = "WARRIOR" } },
        { text = "I'm with you.", next = "BUSINESS" },
        { text = "Not today, Torek.", next = "END" },
      },
    },

    why = {
      lines = {
        { id = "wh_default", text = "Because the Sentinels there shoot our loggers and burn our lumber, and Warsong needs that wood. Break the outpost and the camp breathes easier for a season." },
      },
      choices = {
        { text = "The forest isn't ours to take.", next = "why_forest" },
        { text = "Something else.", next = "BACK", fx = { learn = { "warsong" } } },
      },
    },
    why_forest = {
      big = true,
      lines = {
        { id = "wf_default", text = "Maybe not, but the Horde needs timber and the elves won't sell it, so here we are. I didn't start this, {class}; I just mean to finish my part of it well." },
      },
      choices = {
        { text = "Then we'll finish it together.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "There must be another way than burning their homes.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    duriel = {
      lines = {
        { id = "du_default", text = "She commands Silverwing, and she's good at it, which is why she has to fall. Night elves are decent foes, a little skinny but strong and fierce, and I'd sooner fight a good one than a bad one." },
      },
      choices = {
        { text = "You respect them.", next = "duriel_respect" },
        { text = "Something else.", next = "BACK" },
      },
    },
    duriel_respect = {
      big = true,
      lines = {
        { id = "dr_default", text = "Course I do. Only a fool sneers at someone who can put an arrow through his eye at a hundred paces, and I've buried fools." },
      },
      choices = {
        { text = "Respect your enemy, and fight them fairly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Respect gets you killed. Hit them while they sleep.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    scars = {
      lines = {
        { id = "sc_default", text = "A scar is a story nobody can take from you. My father had so many he looked like a map of Draenor, and he could tell you where he got every one." },
      },
      choices = {
        { text = "What's your best scar?", next = "scars_best" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scars_best = {
      lines = {
        { id = "sb_default", text = "This one, along the jaw, from a Sentinel's glaive on the Falfarren. I don't remember her name, but I hope she remembers mine." },
      },
      choices = {
        { text = "That's a good story, Torek.", next = "BACK", fx = { affinity = 1 } },
        { text = "Goodbye, Torek.", next = "END" },
      },
    },

    thrall = {
      lines = {
        { id = "th_default", text = "The Warchief wants peace, sure, and he also wants Orgrimmar built and warm. Hellscream's people at Warsong cut the wood, and we keep the elves off them, and that's all this is." },
      },
      choices = {
        { text = "It's a thin line, Torek.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warrior_t = {
      lines = {
        { id = "wt_default", text = "Plan? We run in, loud, and we hit whatever has a bow. You stay at my shoulder and keep my raiders standing, and if you see Duriel, she's mine." },
      },
      choices = {
        { text = "Good plan.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "That's not a plan.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A raider of the Horde, born in the camps and freed by Thrall. Since then I've been looking for a good fight, and Ashenvale's full of them." } },
    advice = { { id = "tp_ad", text = "In these woods, the arrow comes before the sound. Keep your shield up even when it's quiet." } },
    warsong = { { id = "tp_warsong", text = "Hellscream's own clan, out there cutting timber for the Horde. Somebody has to guard them, and I'd rather it was me." } },
    sentinels = { { id = "tp_sentinels", text = "Good fighters, every one, and quieter than any orc. I like them better than I should." } },
    _none = { { id = "tp_none", text = "No idea. Ask Ertog in Splintertree; he does the thinking." } },
  },
}
