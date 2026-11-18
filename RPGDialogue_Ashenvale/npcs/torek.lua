-- Torek, orc raid leader near the Warsong Labor Camp, about to hit Silverwing Outpost (0.72.0). Voice: bibles/torek.md
-- Classic: Torek's Assault (escort; report to Ertog Ragetusk).
local P = RPGDialogueAPI:Pack("rpgd.ashenvale")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "torek", id = TODO_NPC("Torek"), name = "Torek",
  bible = "bibles/torek.md", role = "soldier", tier = "quest",
  prejudice = { race = "Scourge", amount = 8, why = "an orc who fights for scars and songs; the Forsaken fight without joy and keep vats under their city, so he doesn't trust them" },
  communities = { "splintertree" }, temper = { "eager", "boisterous" }, values = { "glory", "loyal" },
  notices = { "soldier", "class" },
  impression = {
    first = "He wants scars the way some people want gold.",
    third = "{name} met Torek, an orc raid leader in Ashenvale planning an assault on the Silverwing Outpost.",
  },

  greetings = {
    { id = "g_pj_dead", when = { prejudiced = true }, text = "A Forsaken in my raiding camp. Thrall says you're Horde, so I'll say it too, but a warrior who can't bleed can't earn a scar, and I don't trust anyone who has nothing left to lose." },
    { id = "g_pj_over", when = { prejudiced = "overcome" }, text = "There you are! I've been telling the raiders you fight like an orc with a grudge, and they laughed, so I made them stop. I was wrong about the Forsaken, or at least about you." },
    { id = "g_hello", text = "Lok'tar, {class}, come here! I've got a fight that needs one more blade, and there's honor enough in it for both of us." },
    { id = "g_active", when = { questActive = TODO_QUEST("Torek's Assault") }, text = "Ready? My raiders are itching, and the elves won't wait forever to notice us." },
    { id = "g_done", when = { questDone = TODO_QUEST("Torek's Assault") }, text = "Silverwing burned, and Duriel Moonfire fell! I'm still picking splinters out of my arm, and I couldn't be happier." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and back with all your limbs? You're not trying hard enough, {class}, so come and bleed with us." },
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
    pj_torek = {
      lines = { { id = "pj_torek_default", text = "Plainly, then. An orc fights to be remembered, and every scar is a story his children will tell, but you dead fight like you're clearing a field, with no joy in it at all. And the grunts say the apothecaries brew things under your city that a warrior shouldn't touch." } },
      choices = {
        { text = "What have the grunts heard about the apothecaries?", next = "pj_torek2" },
        { text = "A fight's a fight. I'll earn your respect on the field.", next = "BACK", reply = "Hah! Now that's an answer I can respect. Show me on the field, and I'll eat my words with a smile.", fx = { align = { honor = 1 } } },
        { text = "Joy doesn't win wars, orc. Patience and poison do.", next = "BACK", reply = "Maybe they do, dead one, but they don't make songs either. I'll take my scars and my stories, thank you.", fx = { align = { honor = -1 } } },
        { text = "I see why we unsettle you. Give it time.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    pj_torek2 = {
      lines = { { id = "pj_torek2_default", text = "Only what gets said round the fire, that the Forsaken keep vats of sickness under the Undercity and don't like questions about them. Maybe it's grunt talk, but I've never known a grunt invent something that frightened him." } },
      choices = {
        { text = "I'll keep my own eyes open. Thanks for the warning.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "Don't say that loud in Splintertree, because there are grunts here who'd agree with you, and that's the problem. You tell me, then: what do you make of the Warchief?" },
      },
      choices = {
        { text = "He freed us from the camps. I'd follow him anywhere.", next = "op_r1", fx = { affinity = 1, align = { honor = 1 }, opinion = { warchief = "trust" } } },
        { text = "He's too soft on the humans, and on the elves.", next = "op_r2", fx = { affinity = 1, align = { honor = -1 }, trait = { stern = 1 }, opinion = { warchief = "soft" } } },
        { text = "Thrall wants peace. The Warsong camp makes that harder.", next = "op_r3", fx = { trait = { cautious = 1 }, opinion = { warchief = "respect", peace = "peace" } } },
        { text = "Thrall is the son of Durotan. That's enough for me.", next = "op_r4", fx = { affinity = 1, opinion = { warchief = "loyal" } }, when = { race = "Orc" } },
        { text = "I'll keep my thoughts to myself.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "So would I, and so did I, but freedom doesn't build walls. We build them, out here, with Warsong lumber." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "Ha! You and half my raiders. Keep it in the barracks, though, because there's a runner from Orgrimmar in town." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "The Warsong make lumber, and lumber makes Orgrimmar, and I don't see Thrall sending it back." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r4 = {
      lines = { { id = "op_r4_default", text = "It's enough for me most days. On the other days I remember that Durotan never had to feed a city." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dd_hunt = {
      lines = {
        { id = "ddh_default", text = "It wasn't meant to be. The tauren hunt to honour the beasts, and I respect it, but in this forest every kill is also a message to the elves that we're not leaving. Ursangous and Shadumbra were their forest's pride, and now they're our trophies." },
      },
      choices = {
        { text = "I hunted to honour the beasts, as Senani does.", next = "BACK", reply = "Then do it her way, and I'll do it mine. The elves won't know the difference either way.", fx = { align = { honor = 1 } } },
        { text = "Then let the elves read the message in their blood.", next = "BACK", reply = "Lok'tar! That's a warrior's answer. Come back when you're ready to hit the outpost again.", fx = { align = { honor = -1 } } },
        { text = "Something else, Torek.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_hunt", when = { questDone = TODO_QUEST("The Hunt Completed") }, text = "Senani says you finished her great hunt, the bear, the black saber and the hippogryph. Good. A warrior who can kill Ashenvale's beasts can kill the elves who hide behind them." },
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
        { id = "h_again", text = "What else? Ask fast; my raiders are getting bored, and a bored orc is a dangerous thing." },
        { id = "h_again2", text = "Speak up, {class}. Talking's fine, but an orc proves himself with deeds, not words." },
      },
      choices = {
        { text = "Senani's hunt was no easy thing, Torek.", next = "dd_hunt", when = { questDone = TODO_QUEST("The Hunt Completed") } },
        { text = "Why attack Silverwing Outpost?", next = "why" },
        { text = "Who is Duriel Moonfire?", next = "duriel" },
        { text = "You seem eager for scars.", next = "scars" },
        { text = "Thrall wants peace. Is this wise?", next = "thrall" },
        { text = "I'm a warrior too, and I'd like to hear your plan.", next = "warrior_t", when = { class = "WARRIOR" } },
        { text = "I'm with you.", next = "BUSINESS" },
        { text = "You don't trust the Forsaken, Torek. Say it plainly.", next = "pj_torek", when = { prejudiced = true } },
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
        { text = "Then we'll finish it together.", next = "BACK", reply = "Together, then, and we'll make a song of it. Lok'tar, {class}.", fx = { align = { light = -1 } } },
        { text = "There must be another way than burning their homes.", next = "BACK", reply = "Maybe there is, and if you find it, tell the Warchief. Until then, I've got trees to guard.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    duriel = {
      lines = {
        { id = "du_default", text = "She commands Silverwing, and she's good at it, so she has to fall. Night elves are decent foes, a little skinny but strong and fierce, and I'd sooner fight a good one than a bad one." },
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
        { text = "Respect your enemy, and fight them fairly.", next = "BACK", reply = "Aye, and that's the orc way, the old way. Duriel would agree, I think, if she didn't want me dead.", fx = { align = { honor = 1 } } },
        { text = "Respect gets you killed. Hit them while they sleep.", next = "BACK", reply = "It gets you killed slower than a sentinel's arrow, I'll grant. But I'd rather die knowing I fought well.", fx = { align = { honor = -1 } } },
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
        { id = "sb_default", text = "This one, along the jaw, from a Sentinel's glaive by the Falfarren River. I don't remember her name, but I hope she remembers mine." },
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
        { text = "Some say Thrall's gone soft. What do you think?", next = "op_ask" },
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
    background = { { id = "tp_bg", text = "I'm a raider of the Horde, born in the camps and freed by Thrall. Since then I've been looking for a good fight, and Ashenvale's full of them." } },
    advice = { { id = "tp_ad", text = "In these woods, the arrow comes before the sound. Keep your shield up even when it's quiet." } },
    warsong = { { id = "tp_warsong", text = "Hellscream's own clan, out there cutting timber for the Horde. Somebody has to guard them, and it may as well be me." } },
    sentinels = { { id = "tp_sentinels", text = "Good fighters, every one, and quieter than any orc. I like them better than I should." } },
    thrall = { { id = "tp_thrall", text = "Thrall broke the chains on my people and gave us back our honour. I raid these woods because he needs the timber, and I'd raid anywhere he asked." } },
    tyrande = { { id = "tp_tyrande", text = "Tyrande is the night elves' high priestess, and her Sentinels are the best fighters I've ever faced. I'd like to meet her across a battlefield, just once." } },
    burning_legion = { { id = "tp_burning_legion", text = "The Legion used my people once, and Grom paid for our freedom with his life at Ashenvale. I'll fight the demons any day, and I'll laugh while I do it." } },
    centaur = { { id = "tp_centaur", text = "Centaur are a good fight, all charge and fury. I'd raid them for sport if the Warchief allowed it." } },
    _none = { { id = "tp_none", text = "No idea. Ask Ertog in Splintertree; he does the thinking, and I do the bleeding." } },
  },
}
