-- Brill's watch: the Deathguard who send the newly risen into the fields, east toward the
-- Bulwark and against the Crusade, and the Crusader they keep in chains. Voices: bibles/brill_watch.md
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Deathguard Simmer: sends the risen to steal the Crusade's pumpkins.
P:NPC {
  key = "tir_simmer", id = TODO_NPC("Deathguard Simmer"), name = "Deathguard Simmer",
  bible = "bibles/brill_watch.md", role = "soldier", tier = "quest",
  communities = { "brill" }, temper = { "dry", "gruff" }, values = { "practical", "dutiful" },
  notices = { "kit", "race", "greenness" },
  impression = {
    first = "Deathguard Simmer sends fresh corpses out to steal pumpkins from under the Crusade's noses, and he finds the whole business funnier than he lets on. Something in him still knows a good harvest when he sees one.",
    third = "{name} met Deathguard Simmer, who sent the newly risen to raid the pumpkin fields of the Solliden Farmstead.",
  },

  greetings = {
    { id = "g_default", text = "Another one fresh up from Deathknell. Stand still a moment and let me see whether you'll do." },
    { id = "g_active", when = { questActive = TODO_QUEST("Fields of Grief") }, text = "Pumpkins, corpse, not excuses. Solliden's west of here, and they don't walk over on their own." },
    { id = "g_done", when = { questDone = TODO_QUEST("Fields of Grief") }, text = "You're the pumpkin thief. The apothecary's still smiling about it, and I'd not thought his face could do that." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and the Crusade's planted a fresh row at Solliden in the meantime. They never learn, and I'm grateful for it." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've filled out since you were stealing vegetables for me. Funny how the Glades does that to the ones who don't fall apart." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Word in Brill is you've been useful. Useful's the best thing a Deathguard can say about anyone, so don't let it go to your head." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 6 },
      text = "You've still got grave dirt in your ears. That's fine; the Crusade won't look closely before they shoot at you, either way." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "One of the living, in Brill. The Crusade will shoot you just the same as us, so at least you'll fit in." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Those Crusade archers have been at your armor. Get it mended, because they don't miss twice." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Deathguard Simmer. I keep the west road for the Dark Lady and I find work for fresh corpses who'd otherwise stand about the square looking lost." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Fields of Grief") },
          text = "The Crusade sits on the Solliden Farmstead, west of here, and they've been tending the old pumpkin fields like they'll still be around to eat them. The apothecaries want those pumpkins, and I'd like to spoil the Crusade's supper, so we're agreed on that much." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Fields of Grief"), days = 3 } },
          text = "Ten pumpkins, right out from under their tower. I'd have paid good silver to see the Crusade's faces when they found the vines bare." },
        { id = "h_scourge", when = { race = "Scourge", maxLevel = 8 },
          text = "You'll remember being alive, or bits of it, and you'll wish you didn't. The cure for that is work, and I happen to have some." },
      },
      again = {
        { id = "h_again", text = "What else? The road's quiet, so I can spare the breath I don't have." },
        { id = "h_again2", text = "Go on, then. I'm only watching the hedges." },
      },
      choices = {
        { text = "Why do the apothecaries want pumpkins?", next = "why" },
        { text = "Tell me about the Solliden Farmstead.", next = "solliden" },
        { text = "How do I get past the Crusade's patrols?", next = "patrols", when = { questActive = TODO_QUEST("Fields of Grief") } },
        { text = "Were you a farmer once, Simmer?", next = "farmer" },
        { text = "What's Brill like for the newly risen?", next = "brill" },
        { text = "Any work for me?", next = "BUSINESS" },
        { text = "I'll be off.", next = "END" },
      },
    },

    why = {
      lines = { { id = "w_default", text = "I'm told they grew in earth the plague soaked through, and that makes them interesting to Apothecary Johaan. I don't ask what interesting means, because he'd tell me, and then I'd know." } },
      choices = {
        { text = "Doesn't that worry you?", next = "why_worry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_worry = {
      big = true,
      lines = { { id = "ww_default", text = "Not much worries a man who's already been buried. The Society says it's for the war on the Scourge, and the Scourge killed me, so I'm happy to pass the apothecary whatever he likes and let him get on with it." } },
      choices = {
        { text = "Whatever hurts the Scourge, I'll carry it.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'd like to know what he's brewing first.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    solliden = {
      lines = { { id = "s_default", text = "An old farmstead west of Brill that the Crusade took for its own, with a watch tower nearby to keep an eye on the fields. Their patrols walk the rows by day and their archers sit in the tower by night, and between them they think they've got it all well guarded." },
      },
      choices = {
        { text = "Who lived there before the Crusade?", next = "sol_before" },
        { text = "Why don't the Deathguard take it back?", next = "sol_take" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sol_before = {
      lines = { { id = "sb_default", text = "Farmers, the same as everywhere in the Glades, and most of them are in the ground now or walking the fields without a thought in their heads. Some of the mindless out there still pull weeds, if you watch long enough, which is the worst thing I've seen in Tirisfal." } },
      choices = {
        { text = "That's grim, Simmer.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sol_take = {
      lines = { { id = "st_default", text = "Because the Executor's got more Crusade than he's got Deathguard, and the farmhouse isn't worth what we'd lose taking it. Better to bleed them slowly, and steal their vegetables, and let them sit in their tower wondering who's next." } },
      choices = {
        { text = "Slow bleeding is a coward's war.", next = "sol_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sol_stance = {
      big = true,
      lines = { { id = "sst_default", text = "Call it what you like, corpse, it keeps my people walking. You're welcome to march up to the tower and knock, and I'll be sure to tell Zygand you were very brave." } },
      choices = {
        { text = "A straight fight would end this sooner.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Fair point. Let them bleed and wonder.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    patrols = {
      lines = { { id = "p_default", text = "They walk the rows in pairs, and they talk to each other about the Light while they do it, which is loud. Wait for the sermon to start, take what you can carry, and don't stop to admire the pumpkins." } },
      choices = {
        { text = "And if they catch me?", next = "patrols_caught" },
        { text = "Something else.", next = "BACK" },
      },
    },
    patrols_caught = {
      lines = { { id = "pc_default", text = "Then you'll come back to Deathknell the long way, and Mordo will say welcome back, and you'll try again. Dying's less of a setback for us than it is for them, and that's the one advantage I'll ever brag about." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    farmer = {
      lines = { { id = "f_default", text = "I think so, though I couldn't swear to it. I don't remember the farm or the people on it, but my hands know how to twist a pumpkin off the stem without bruising it, and somebody must have taught them that." } },
      choices = {
        { text = "Does it bother you, not remembering?", next = "farmer_mem" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farmer_mem = {
      big = true,
      lines = { { id = "fm_default", text = "Some nights, when the wind comes off the fields smelling of earth. Mostly I think whoever I was would hate what I am, and I'd rather not meet him, so the forgetting suits us both." } },
      choices = {
        { text = "You're more than what the plague left you.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Forget him. The man who died is gone.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    brill = {
      lines = { { id = "b_default", text = "Brill's the Dark Lady's first real town outside the Undercity, and it's busy for a place full of dead folk. Magistrate Sevren runs it, Executor Zygand guards it, and Renee at the Gallows' End feeds whoever still wants feeding." } },
      choices = {
        { text = "Who's worth knowing here?", next = "brill_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brill_who = {
      lines = { { id = "bw_default", text = "Johaan, if you don't mind his questions, and Coleman at the inn, if you don't mind his grudges. Burgess by the hall wants Crusader rings, and Linnea out east wants the Scourge kept off her road, so nobody here is short of things for you to kill." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    scarlet_crusade = { { id = "tp_scarlet", text = "They plant pumpkins and burn people, and they're better at the pumpkins." } },
    new_plague = { { id = "tp_plague", text = "Ask Johaan. I only carry his vegetables." } },
    _none = { { id = "tp_none", text = "Never heard of it, and I watch a road for a living. Ask the magistrate." } },
  },
}

-- Deathguard Linnea: watches the east road and the Scourge that slip past the Bulwark.
P:NPC {
  key = "tir_linnea", id = TODO_NPC("Deathguard Linnea"), name = "Deathguard Linnea",
  bible = "bibles/brill_watch.md", role = "soldier", tier = "quest",
  communities = { "brill" }, temper = { "steady", "wry" }, values = { "dutiful", "practical" },
  notices = { "kit", "class", "weary" },
  impression = {
    first = "Deathguard Linnea watches the east road for whatever the Bulwark lets slip, and she sounds tired in a way the dead shouldn't. She is level-headed and wry, and she gives credit where it's due without making a fuss of it.",
    third = "{name} met Deathguard Linnea, who keeps watch east of Brill for Scourge that slip past the Bulwark.",
  },

  greetings = {
    { id = "g_default", text = "Keep your voice down; I'm listening to the road. What is it?" },
    { id = "g_duties", when = { questActive = TODO_QUEST("Forsaken Duties") }, text = "The magistrate sent you for a report, did he? He'll have one, and it's not a cheerful one." },
    { id = "g_patrol", when = { questActive = TODO_QUEST("Rear Guard Patrol") }, text = "Balnir Farmstead, east of here. Horrors and spirits both, and they don't stop coming because you've killed a few." },
    { id = "g_done", when = { questDone = TODO_QUEST("Rear Guard Patrol") }, text = "The road's been quieter since your patrol. I sent your name on to Executor Zygand, so don't make me regret it." },
    { id = "g_away", when = { away = 14 }, text = "{away} away. I've been here the whole time, in case you wondered, and I've counted every one of the dead that came down the road." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown into your armor. When you first came out here, I'd have bet a week's pay on the horrors." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "You've been out east already, I can see it on your gear. The horrors bleed, but they bite harder than they bleed." },
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "PALADIN", "SHAMAN" } },
      text = "A healer, out on my road. Good, because the patrols that come back come back torn." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Deathguard Linnea. I keep the east road between Brill and the Bulwark, and I watch for the Scourge that get past the defenders there, which is more of them than anyone in Brill likes to hear." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Forsaken Duties") },
          text = "If the magistrate wants to know how the border holds, he can ask me, and I'll tell him. The Bulwark stops most of them, but most isn't all, and all is what he'd like to hear." },
        { id = "h_report", tags = { "news" }, when = { questRecent = { TODO_QUEST("Return to the Magistrate"), days = 3 } },
          text = "Did Sevren read my report, or did he skim it and file it? Don't answer that, I know him." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Rear Guard Patrol"), days = 3 } },
          text = "That's a fine patrol, horrors and spirits both, and I've seen Deathguard do worse in twice the time. I'll write it up for Zygand tonight." },
      },
      again = {
        { id = "h_again", text = "Anything else? Ask while the road's quiet." },
        { id = "h_again2", text = "Go on, I'm still listening, to you and the road both." },
      },
      choices = {
        { text = "What gets past the Bulwark?", next = "past" },
        { text = "What happened at Balnir Farmstead?", next = "balnir" },
        { text = "What's the Bulwark like?", next = "bulwark" },
        { text = "How long have you stood this post?", next = "post" },
        { text = "Any work for me?", next = "BUSINESS" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },

    past = {
      lines = { { id = "p_default", text = "Bleeding horrors, which are what the Scourge stitches together when it has spare parts, and wandering spirits, which are what's left of the people who died out east. Neither of them think, and neither of them stop." } },
      choices = {
        { text = "How do they get through?", next = "past_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_how = {
      lines = { { id = "ph_default", text = "Through the woods to the south of the wall, and along the river, and sometimes straight past the gate while the defenders are busy with something larger. Sporadic, the reports call it, which is a clerk's word for not often enough to send help." } },
      choices = {
        { text = "Then I'll be the help that isn't sent.", next = "past_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_stance = {
      big = true,
      lines = { { id = "ps_default", text = "That's kindly meant, and I'll take it. Still, the clerks have a point; the Bulwark needs every sword, and if they emptied it to guard my road, I'd have a lot more than horrors coming down it." } },
      choices = {
        { text = "The chain of command knows best. Hold the line.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Orders that leave you alone out here are bad orders.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    balnir = {
      lines = { { id = "b_default", text = "A farmstead east of here that died in the plague and never got buried. The Scourge that slip past the Bulwark gather there, like water finds the low ground, and lately there are more of them in the yard than there ever were living folk." } },
      choices = {
        { text = "Why there, of all places?", next = "balnir_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    balnir_why = {
      lines = { { id = "bw_default", text = "I don't know, and nobody's paid me to find out. My guess is the place still smells of the plague, and the horrors go where it's strongest, the way a dog goes back to where it was fed." } },
      choices = {
        { text = "Should it be burned to the ground?", next = "balnir_burn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    balnir_burn = {
      big = true,
      lines = { { id = "bb_default", text = "I've asked, and the answer was that the Crusade burns farms and we don't, which I'll grant is a fine thing to say. It would still save me a great many patrols." } },
      choices = {
        { text = "Burn it. Saving patrols matters more.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Leave it standing. We're not the Crusade.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    bulwark = {
      lines = { { id = "bu_default", text = "A wall across the road east, where Tirisfal ends and the Plaguelands start. The Dark Lady's best hold it, Deathguard and apothecaries both, and they've held it since we took the Undercity, though nobody I know has ever slept a full night there." } },
      choices = {
        { text = "What lies beyond it?", next = "bulwark_beyond" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bulwark_beyond = {
      lines = { { id = "bbe_default", text = "The Plaguelands, and Andorhal, and the Scourge that still serve the Lich King, which is most of them. I've not been, and I've no plans to go, but you'll end up there one day if you keep growing at this rate." } },
      choices = {
        { text = "Then I'll see it for you, Linnea.", next = "BACK", fx = { affinity = 1, learn = { "andorhal" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "andorhal" } } },
      },
    },

    post = {
      lines = { { id = "po_default", text = "Since Brill was retaken, near enough. Before that I was one of the mindless out east, and I only know that because I know the road too well for someone who's never walked it." } },
      choices = {
        { text = "You came down this road as Scourge?", next = "post_scourge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    post_scourge = {
      lines = { { id = "psc_default", text = "I think so, and I think that's why I stand here now. Every horror that comes down this road is somebody who didn't get lucky the way I did, and I'd like to be the one who ends it for them, rather than the Crusade." } },
      choices = {
        { text = "That's a kind way to see it.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    andorhal = { { id = "tp_andorhal", text = "East past the Bulwark, and full of Scourge. That's all I know, and more than I'd like." } },
    _none = { { id = "tp_none", text = "Ask in Brill. Out here I only know the road." } },
  },
}

-- The Captured Scarlet Zealot: a prisoner in Brill, kept for the apothecaries' tests.
P:NPC {
  key = "tir_zealot", id = TODO_NPC("Captured Scarlet Zealot"), name = "Captured Scarlet Zealot",
  bible = "bibles/brill_watch.md", role = "citizen", tier = "service",
  communities = { "brill" }, temper = { "fierce", "anxious" }, values = { "devout", "proud" },
  notices = { "race", "class" },
  impression = {
    first = "The Scarlet Zealot chained in Brill is frightened and furious in equal measure, and he holds on to his faith as though it were the last thing in the room that belongs to him. I could not decide whether I pitied him.",
    third = "{name} spoke with a Scarlet Zealot kept prisoner in Brill.",
  },
  greetings = {
    { id = "g_default", text = "Stay back, abomination! The Light sees you, even here, even now." },
    { id = "g_living", when = { race = { "Orc", "Troll", "Tauren" } }, text = "You're living, and you walk with these things? Then you're worse than they are, because you chose it." },
    { id = "g_priest", when = { class = { "PRIEST", "PALADIN" } }, text = "I can feel the Light on you. How can you carry it and stand among the dead? Answer me that." },
    { id = "g_again", when = { metBefore = true }, text = "You again. Come to watch? They come to watch every day." },
  },
  notice = {
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "Your face is grey, but you were someone's son or daughter once. I'll pray for whoever you were, whether you want it or not." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am a soldier of the Scarlet Crusade, and that is all you will get from me. They can bring their vials and their questions, and I'll answer every one with a prayer." },
        { id = "h_human", when = { race = "Human" }, text = "A living man, here? Free me, in the Light's name, before they come back with their bottles." },
      },
      again = {
        { id = "h_again", text = "What more do you want? I've nothing left to take." },
        { id = "h_again2", text = "Ask, then. I've nowhere to go." },
      },
      choices = {
        { text = "Why are you kept here?", next = "why" },
        { text = "Why does the Crusade burn the Forsaken?", next = "burn" },
        { text = "Do you have family somewhere?", next = "family" },
        { text = "Leave him.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "For their potions. The apothecaries bring a new one every few days and watch to see whether I live, and so far I have, which seems to disappoint them." } },
      choices = {
        { text = "Do you know what they're testing?", next = "why_test" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_test = {
      big = true,
      lines = { { id = "wt_default", text = "Poison, I think, though they never tell me what it's meant for. I only know it burns going down, and that the one who writes it all down never looks me in the eye." } },
      choices = {
        { text = "You'd do the same to us, given the chance.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Nobody should be kept for poison tests.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    burn = {
      lines = { { id = "b_default", text = "Because the plague took everything and left these things wearing our neighbours' faces. Fire is the only mercy left for them, and the Light commands mercy, so we burn them, and I would burn you." } },
      choices = {
        { text = "Some of us chose to be free of the Scourge.", next = "burn_free" },
        { text = "Something else.", next = "BACK" },
      },
    },
    burn_free = {
      lines = { { id = "bf_default", text = "Free to do what? To brew plagues in a cellar and keep living men in chains for them? If that's your freedom, then you've only changed masters, and the new one's crueller." } },
      choices = {
        { text = "That's a fair hit.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    family = {
      lines = { { id = "f_default", text = "A sister, at the monastery, if she's still alive. Don't ask me her name, because I'll not give them anything they can use against her." } },
      choices = {
        { text = "I won't ask. I hope she's safe.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    scarlet_crusade = { { id = "tp_scarlet", text = "We are the last of Lordaeron's faithful. Remember that, when you burn." } },
    _none = { { id = "tp_none", text = "I'll tell you nothing, about that or anything else." } },
  },
}
