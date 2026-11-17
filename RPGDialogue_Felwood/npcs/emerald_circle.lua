-- The Emerald Circle at the Emerald Sanctuary: Taronn Redfeather (tauren druid, the craters of Shatter Scar Vale)
-- and Kelek Skykeeper (night elf druid who knows the furbolgs).
-- Voice: bibles/emerald_circle.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Taronn Redfeather
---------------------------------------------------------------------------
P:NPC {
  key = "taronn", id = TODO_NPC("Taronn Redfeather"), name = "Taronn Redfeather", title = "Emerald Circle",
  bible = "bibles/emerald_circle.md", role = "questgiver", tier = "quest",
  communities = { "emerald_sanctuary" }, temper = { "calm", "weary" }, values = { "nature", "patient" },
  notices = { "tauren", "druid" },

  impression = {
    first = "Taronn Redfeather is a tauren of the Emerald Circle who came to Felwood looking for one clean spring. He speaks slowly, like someone who has said bad news many times and wants to get it right.",
    third = "{name} met Taronn Redfeather, a tauren druid of the Emerald Circle searching Felwood for pure water.",
  },

  greetings = {
    { id = "g_default", text = "Walk softly here, friend. The ground in Felwood remembers every boot, and most of what it remembers is bad." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back up the road. The Earth Mother keeps you, it seems, even in this place." },
    { id = "g_active", when = { questActive = TODO_QUEST("Verifying the Corruption") }, text = "Shatter Scar Vale is north, east of the road. Look at the craters, and keep your distance from the infernals while you do." },
    { id = "g_done", when = { questDone = TODO_QUEST("Verifying the Corruption") }, text = "I still think about those craters. I keep hoping one of them will have cleared itself, though I know better." },
  },

  notice = {
    { id = "n_tauren", cat = "tauren", when = { race = "Tauren" },
      text = "Another of the People, this far north! Greta and I are the only two here, and it eases my heart to hear a third Mulgore voice." },
    { id = "n_druid", cat = "druid", when = { class = "DRUID" },
      text = "You carry the Dream about you, druid. Felwood will pull at it, so keep your mind on the living things and not on the rot." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Taronn Redfeather of the Emerald Circle. I came to Felwood hoping to find one spring, one pool, one trickle of water the corruption never touched, because healing a forest is much easier when you have something clean to start from." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Verifying the Corruption") },
          text = "I am Taronn Redfeather, and I need someone with stronger legs than mine and a little less sense. North of here, in Shatter Scar Vale, the demons fell from the sky in the last great war, and I must know whether the water in those craters is still poisoned." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Verifying the Corruption"), days = 3 } },
          text = "You're alive, which is the good news. The craters are still full of that fetid water, which is the bad news, and I have stopped pretending one will turn up clean on its own." },
        { id = "h_horde", when = { faction = "Horde", race = { "Orc", "Troll", "Scourge" } },
          text = "The Horde has a camp at Bloodvenom Post, and I hear they drink from the falls there. I've told them it's poison, and they've told me orcs have strong stomachs." },
      },
      again = {
        { id = "h_again", text = "What else is on your mind? I have time, though the forest doesn't." },
        { id = "h_again2", text = "Ask. A slow answer is still an answer." },
      },
      choices = {
        { text = "What do you need from Shatter Scar Vale?", next = "vale" },
        { text = "A tauren among night elf druids?", next = "circle" },
        { text = "Can Felwood actually be healed?", next = "heal" },
        { text = "What fell in those craters?", next = "infernals" },
        { text = "Do you miss Mulgore, Taronn?", next = "mulgore", when = { race = "Tauren" } },
        { text = "I've heard the Dream sounds wrong here. Have you?", next = "dream", when = { class = "DRUID" } },
        { text = "I'll let you work.", next = "END" },
      },
    },

    vale = {
      lines = {
        { id = "va_default", text = "Two things, and both matter. Are the entropic beasts still roaming the vale, and are the craters still holding the corrupt water that gathered after the infernals struck? If the water has cleared, I have a place to begin." },
        { id = "va_done", when = { questDone = TODO_QUEST("Verifying the Corruption") },
          text = "You already went for me, and you came back with the answer I didn't want. The beasts still walk and the water is still poison, so I've turned my hands to saving the creatures I can reach." },
      },
      choices = {
        { text = "What are entropic beasts?", next = "vale_beasts" },
        { text = "Why does one clean spring matter so much?", next = "vale_spring" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vale_beasts = {
      lines = { { id = "vb_default", text = "Elementals of a kind, though the earth never meant to make them. Where the infernals landed, the stone and soil were twisted into something that only wants to unmake things, and they wander the vale still, years after the demons stopped falling." } },
      choices = {
        { text = "I'll go and look for you.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    vale_spring = {
      big = true,
      lines = { { id = "vs_default", text = "Because a forest heals from the water up. A clean spring would let us grow cleansed saplings and send clean water down the streams, but without one we can only burn out the worst and pray. Some in the Circle say we should burn far more than we do." },
      },
      choices = {
        { text = "Burn it out. A sick forest only spreads its sickness.", next = "vale_burn", fx = { align = { light = -1 } } },
        { text = "Nothing should burn that can still be healed.", next = "vale_burn", fx = { align = { light = 1 } } },
        { text = "What do you think, Taronn?", next = "vale_burn" },
      },
    },
    vale_burn = {
      lines = { { id = "vbn_default", text = "I think fire is quick and the Earth Mother is slow, and that both have their seasons. But I have seen what grows back after a burn in the Barrens, and I'd rather not see Felwood go the same way while there's still a tree here worth saving." } },
      choices = {
        { text = "Then let's hope for a clean spring.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    circle = {
      lines = { { id = "ci_default", text = "The Emerald Circle cares about the forest, not the shape of the druid tending it. Eridan Bluewind welcomed me as she would any other healer, and Greta Mosshoof, who is of the People like me, still argues with me about everything, which I take as a sign of respect." } },
      choices = {
        { text = "Do the Sentinels trust you?", next = "circle_sentinels" },
        { text = "Who is Eridan Bluewind?", next = "circle_eridan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    circle_sentinels = {
      lines = { { id = "cs_default", text = "The ones at Talonbranch Glade watch me, and I don't blame them, because their sisters are fighting the Horde in Ashenvale while I sit here wearing Horde colors on my bracers. I keep to the sanctuary and do my work, and so far that has been enough." } },
      choices = {
        { text = "That's a hard peace to keep.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    circle_eridan = {
      lines = { { id = "ce_default", text = "She leads us here, and she talks to the trees as if they were wounded friends, which I suppose they are. If you want to help the forest rather than just pass through it, she's the one to ask." } },
      choices = { { text = "I'll find her. Something else, though.", next = "BACK" } },
    },

    heal = {
      lines = { { id = "he_default", text = "In time, yes, but not in mine and maybe not in yours. The demons poured their filth into this land for years, and the Jadefire satyrs and the Shadow Council are still pouring, so the best we can do now is keep the sickness from spreading south into Ashenvale." } },
      choices = {
        { text = "Then why stay, if you won't see it healed?", next = "heal_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    heal_why = {
      lines = { { id = "hw_default", text = "Because somebody planted the trees I sat under as a calf, and they never saw me sit there. The Earth Mother asks us to plant for the ones who come after, and Felwood needs a great deal of planting." } },
      choices = {
        { text = "That's worth staying for.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    infernals = {
      lines = { { id = "in_default", text = "Infernals, called down by the Legion in the war at Hyjal, ten thousand years ago and again in the last war. They hit the ground like falling stars and burned holes in the world, and some of them never stopped walking afterwards." } },
      choices = {
        { text = "They're still out there?", next = "infernals_still" },
        { text = "Something else.", next = "BACK" },
      },
    },
    infernals_still = {
      lines = { { id = "is_default", text = "Some of them, yes, wandering the vale like boulders that hate you. Don't fight them if you can walk around them, because they don't tire and they don't bleed." } },
      choices = { { text = "I'll walk around. Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },

    mulgore = {
      lines = { { id = "mu_default", text = "Every morning, when the mist here is green instead of white. I miss the grass, and the sound of the kodo herds, and the smell of a clean rain on the plains, and I've decided it's good to miss things, because it reminds me what I'm working for." } },
      choices = {
        { text = "Mulgore will be there when you go home.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dream = {
      lines = { { id = "dr_default", text = "I have. In Moonglade the Dream sounds like a river, and here it sounds like a river with something dead in it. Don't go walking in it while you're in Felwood, druid, not until you've rested somewhere clean." } },
      choices = {
        { text = "I'll take care. Something else.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the craters, the corrupt water and the animals that drink it. Ask me about any of those." } },
    background = { { id = "tp_bg", text = "A druid out of Mulgore who went to Moonglade to learn and came to Felwood to work.", next = "circle" } },
    advice = { { id = "tp_ad", text = "Don't drink from any stream in Felwood, however clear it looks. Bring your water with you." } },
    cenarion_circle = { { id = "tp_cc", text = "The Emerald Circle is the Cenarion Circle's hands in Felwood. We do the dirty work so Moonglade stays clean." } },
    burning_legion = { { id = "tp_legion", text = "They left Felwood like this and went away. That is the thing I can't forgive them." } },
    _none = { { id = "tp_none", text = "I don't know that, friend. The forest takes up all my thinking these days." } },
  },
}

---------------------------------------------------------------------------
-- Kelek Skykeeper
---------------------------------------------------------------------------
P:NPC {
  key = "kelek", id = TODO_NPC("Kelek Skykeeper"), name = "Kelek Skykeeper", title = "Emerald Circle",
  bible = "bibles/emerald_circle.md", role = "questgiver", tier = "quest",
  communities = { "emerald_sanctuary" }, temper = { "dry", "patient" }, values = { "curious", "wise" },
  notices = { "timbermaw" },

  impression = {
    first = "Kelek Skykeeper is a night elf druid of the Emerald Circle who has spent more time among furbolgs than among his own people. He reads furbolg scratchings the way other scholars read old scrolls.",
    third = "{name} met Kelek Skykeeper, an Emerald Circle druid at the Emerald Sanctuary who knows the furbolg tribes better than anyone.",
  },

  greetings = {
    { id = "g_default", text = "If you've come from the north, you'll have met furbolgs. Tell me which ones, and whether they were drunk." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. I've been reading a furbolg's handwriting all morning, and I'm glad of a face that isn't covered in fur." },
    { id = "g_log", when = { questDone = TODO_QUEST("Words of the High Chief") }, text = "I'm still working through that log you brought me. The High Chief's spelling is a punishment of its own." },
  },

  notice = {
    { id = "n_timbermaw", cat = "timbermaw", when = { reputation = { faction = "Timbermaw Hold", min = "friendly" } },
      text = "You smell of Timbermaw Hold, of pine smoke and honey. They don't let many outsiders that close, so you must have done them a great kindness." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Kelek Skykeeper of the Emerald Circle. While the others tend trees, I tend the furbolgs, or try to: the Timbermaw who still think clearly, the Deadwood who don't, and the Winterfall up in Winterspring, who are getting worse every season." },
        { id = "h_ready", when = { questActive = TODO_QUEST("Words of the High Chief") },
          text = "Donova Snowden sent you? Then that must be the log she wrote me about. Give it here, and let's see what the Winterfall's High Chief has been writing to himself." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Words of the High Chief"), days = 3 } },
          text = "The log is worse than I feared. Someone has been teaching the Winterfall to brew that firewater, and it isn't a furbolg, because no furbolg I know could write a recipe that precise." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid! Good, then I don't have to explain why I'd rather talk to a furbolg than an archdruid. The furbolgs were the first of Cenarius's children to trust us, and look what has become of them." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've an hour before the light goes and I can't read." },
        { id = "h_again2", text = "Go on. I'm a better listener than the furbolgs, at least." },
      },
      choices = {
        { text = "What's wrong with the Winterfall?", next = "winterfall" },
        { text = "Tell me about the Timbermaw.", next = "timbermaw" },
        { text = "Why do the Deadwood attack everyone?", next = "deadwood" },
        { text = "What's in the log I brought you?", next = "log", when = { questDone = TODO_QUEST("Words of the High Chief") } },
        { text = "The Timbermaw call me friend now.", next = "friend", when = { reputation = { faction = "Timbermaw Hold", min = "friendly" } } },
        { text = "Furbolgs were Cenarius's children?", next = "cenarius", when = { race = "NightElf" } },
        { text = "I'll leave you to your reading.", next = "END" },
      },
    },

    winterfall = {
      lines = { { id = "wf_default", text = "They drink, and the drink makes them mad. It's a firewater they brew in their camps in Winterspring, and it smells of something that has never grown in any forest I know, which is why Donova Snowden has been sending me every scrap she can find." } },
      choices = {
        { text = "Who's Donova Snowden?", next = "wf_donova" },
        { text = "Something is making them brew it?", next = "wf_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wf_donova = {
      lines = { { id = "wfd_default", text = "A Cenarion druid who keeps watch over the Winterfall from the hot springs in Winterspring. She's braver than I am, and she writes better letters, too." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wf_who = {
      lines = { { id = "wfw_default", text = "That's my fear. The Felwood furbolgs fell because the land itself was poisoned, but Winterspring's snow is still clean, so the Winterfall had help. If there's a hand behind them, I'd like to know whose before it reaches for the Timbermaw too." } },
      choices = {
        { text = "Demons, then?", next = "wf_demons" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wf_demons = {
      lines = { { id = "wfde_default", text = "I won't say it until I can prove it, because a druid who sees demons behind every tree soon stops being listened to. But I've seen what demons did here, and the shape of it feels very familiar." } },
      choices = { { text = "I'll keep my eyes open.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },

    timbermaw = {
      lines = { { id = "tm_default", text = "The last tribe still in its right mind, or near enough. They hold the tunnels between Felwood and Winterspring and they trust nobody, which has kept them alive. Win their trust, and you can walk through the mountain as a friend instead of a meal." } },
      choices = {
        { text = "How do I win their trust?", next = "tm_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tm_trust = {
      big = true,
      lines = { { id = "tmt_default", text = "By killing Deadwood, mostly, which is a sad thing to say about a people I love. Nafien and Grazle at the hold will take the feathers and beads as proof, and the Timbermaw count every one." } },
      choices = {
        { text = "The Deadwood are lost. Ending them is mercy.", next = "tm_mercy", fx = { align = { light = -1 } } },
        { text = "I'll fight them, but I won't call it mercy.", next = "tm_mercy", fx = { align = { light = 1 } } },
        { text = "Is there no cure for them?", next = "tm_mercy" },
      },
    },
    tm_mercy = {
      lines = { { id = "tmm_default", text = "If there's a cure, the Circle hasn't found it, and I've looked harder than most. So I write down everything I learn about them, so that someday, when there is a cure, someone will remember who they used to be." } },
      choices = {
        { text = "That's a kind thing to do.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    deadwood = {
      lines = { { id = "dw_default", text = "Because the corruption got into them through the water and the wood, and it took everything except their anger. They used to be a gentle tribe, and that's the part I find hardest, that the gentlest fell first." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    log = {
      lines = { { id = "lg_default", text = "Boasts, mostly, and tallies of firewater barrels, and a great many words I'm still guessing at. But the High Chief writes about a gift, and about a voice that taught his shamans the recipe, and I don't like either of those words." } },
      choices = {
        { text = "Who could the voice be?", next = "wf_demons" },
        { text = "Something else.", next = "BACK" },
      },
    },
    friend = {
      lines = { { id = "fr_default", text = "Then you've done what most of the Circle never manages. Go to the hold and let them feed you honey, and don't refuse it, because a Timbermaw takes a refused meal very personally." } },
      choices = { { text = "I'll eat the honey. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    cenarius = {
      lines = { { id = "ce_default", text = "So the old stories say, and the furbolgs say it too, in their way. Cenarius loved them, and they guarded the forests for him long before our people built a single temple, and I think we owe them more than we ever paid." } },
      choices = {
        { text = "Then we should pay it now.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Furbolgs, mostly: the Timbermaw, the Deadwood, the Winterfall, and the firewater." } },
    background = { { id = "tp_bg", text = "A druid of the Emerald Circle who prefers furbolgs to people, and doesn't apologize for it.", next = "timbermaw" } },
    advice = { { id = "tp_ad", text = "If a furbolg offers you honey, take it. If it offers you firewater, run." } },
    furbolgs = { { id = "tp_furb", text = "Ask me anything about them. I've spent forty years learning, and I'm still a beginner." } },
    cenarion_circle = { { id = "tp_cc", text = "The Emerald Circle answers to Moonglade, though Moonglade rarely sends anything but advice." } },
    _none = { { id = "tp_none", text = "That's outside my furbolgs, friend. Ask one of the others." } },
  },
}
