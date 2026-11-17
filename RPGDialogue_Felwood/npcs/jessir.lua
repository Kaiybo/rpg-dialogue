-- Jessir Moonbow, at the Emerald Sanctuary, waiting on two friends who went into Jaedenar.
-- Voice: bibles/jessir.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "jessir", id = TODO_NPC("Jessir Moonbow"), name = "Jessir Moonbow",
  bible = "bibles/jessir.md", role = "questgiver", tier = "quest",
  communities = { "emerald_sanctuary" }, temper = { "warm", "anxious" }, values = { "loyal", "protective" },
  notices = { "pet", "paladin" },

  impression = {
    first = "Jessir Moonbow came from Darnassus to meet two friends at the Emerald Sanctuary, and they never came. She keeps her wolf close and her eyes on the road to Jaedenar.",
    third = "{name} met Jessir Moonbow, who waits at the Emerald Sanctuary for two friends who went looking for the Shadow Council.",
  },

  greetings = {
    { id = "g_default", text = "Have you come up the road from Jaedenar? Forgive me, I ask everyone that." },
    { id = "g_della", text = "Della, sit. She growls at strangers, but she doesn't mean a word of it." },
    { id = "g_wait", when = { questBefore = TODO_QUEST("Rescue From Jaedenar") }, text = "Still no word from them, and they're days late now. I keep telling myself the road is simply slow." },
    { id = "g_arko", when = { questDone = TODO_QUEST("Rescue From Jaedenar") }, text = "Arko's on her way to Darnassus because of you. I can breathe again, a little." },
    { id = "g_trey", when = { questDone = TODO_QUEST("The Remains of Trey Lightforge") }, text = "Trey's resting now, thanks to you. I light a candle for him every night, and Della sits with me while I do." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and I caught myself watching the road for you as well. Old habits, I suppose." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown much harder since you first stopped here, and I think Jaedenar would think twice about you now." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The druids say you've been helping around the sanctuary. It's good to know there are kind hands on this road." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Someone at the sanctuary is cross with you, and I'd rather not know the details. We're all frightened up here, and fear makes short tempers." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Della likes {pet}, which is rare; she usually just stares at other beasts until they leave. Keep it close in Felwood, because the wolves here aren't wolves any more." },
    { id = "n_paladin", cat = "paladin", when = { class = "PALADIN" },
      text = "You carry yourself the way Trey does, with that same Light about you. It's a comfort to see it, and it hurts a little too." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Jessir Moonbow, and I came from Darnassus to meet two friends here, Arko'narin and a paladin named Trey Lightforge. They went into Jaedenar to see whether the Shadow Council has really returned, and they should have been back days ago." },
        { id = "h_rescue", tags = { "news" }, when = { questRecent = { TODO_QUEST("Rescue From Jaedenar"), days = 3 } },
          text = "You were the one who got Arko out of Shadow Hold? She ran through here with Trey's sword and wouldn't even stop for the druids to see to her wounds. She told me what you both found in there, and she didn't cry, which frightens me more than if she had." },
        { id = "h_retribution", when = { questActive = TODO_QUEST("Retribution of the Light") },
          text = "The succubus Rakaiah is still in Shadow Hold, and so is what's left of Trey. Please be careful in there; I can't lose anyone else to that place." },
        { id = "h_remains", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Remains of Trey Lightforge"), days = 3 } },
          text = "You brought him back. I'll see that he's sent home to his own people with the honors a Knight of the Silver Hand deserves, and Arko will know that his torturer is dead. That will matter to her more than she'll admit." },
        { id = "h_key", when = { questActive = TODO_QUEST("A Strange Red Key") },
          text = "A key made of bone, taken from a Shadow Council cultist? Then there's something locked away in Jaedenar that they want kept, and I can only think of one thing I'd lock up." },
        { id = "h_apala", when = { class = "PALADIN", faction = "Alliance" },
          text = "A paladin of the Light, here in Felwood. Trey always said he'd be the only one of your order mad enough to come this far north, and I'd love to tell him he was wrong." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "You're Horde, and I'll not pretend that's easy for me after Ashenvale. But the Shadow Council made your people suffer before they ever touched mine, so perhaps we want the same thing here." },
      },
      again = {
        { id = "h_again", text = "What else would you know? I've time, I'm afraid; all I do here is wait." },
        { id = "h_again2", text = "Go on. Della and I aren't going anywhere." },
      },
      choices = {
        { text = "Tell me about your friends.", next = "friends" },
        { text = "What is the Shadow Council?", next = "council" },
        { text = "What do you know about Jaedenar?", next = "jaedenar" },
        { text = "Who's this wolf?", next = "della" },
        { text = "What happened to Trey in there?", next = "trey", when = { questDone = TODO_QUEST("Rescue From Jaedenar") } },
        { text = "Trey was of my order. I'll see him avenged.", next = "xpala", when = { class = "PALADIN" } },
        { text = "I know warlocks. The Council isn't what I am.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "The Horde has its own debt with the Council.", next = "xhorde", when = { faction = "Horde" } },
        { text = "Farewell, Jessir.", next = "END" },
      },
    },
    friends = {
      lines = {
        { id = "f_default", text = "Arko'narin is young and fierce and far too brave for her own good, and Trey is a human who follows her everywhere and pretends it was his idea. I was meant to meet them here, at the Circle's camp, and go home with them." },
        { id = "f_after", when = { questDone = TODO_QUEST("Rescue From Jaedenar") }, text = "Arko'narin is young and fierce and far too brave for her own good, and Trey was a human who followed her everywhere and pretended it was his idea. I still talk about him as if he'll come up the road, and I don't know how to stop." },
      },
      choices = {
        { text = "How did a night elf and a human become friends?", next = "friends_how" },
        { text = "Why didn't you go in with them?", next = "friends_stay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    friends_how = {
      lines = {
        { id = "fh_default", text = "Over a fight, as most good friendships start, though I'll let them tell you which of them lost. Trey says the Light and Elune are only two names for the same lamp, and Arko pretends to roll her eyes and then repeats it to everyone she meets." },
      },
      choices = {
        { text = "That sounds like a good friendship.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    friends_stay = {
      big = true,
      lines = {
        { id = "fs_default", text = "Because someone had to be waiting with water and bandages when they came out, and they agreed it should be me. I've gone over that conversation a hundred times since, and every time I wish I'd said no." },
      },
      choices = {
        { text = "You kept your word. That's what friends do.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Waiting got you nothing. You should have followed them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    council = {
      lines = {
        { id = "c_default", text = "Warlocks, mostly, who sold their souls to the demons long before the orcs ever came to this world. They're the ones who claim the credit for most of what the orcs suffered, and now they seem to want some of that power back." },
      },
      choices = {
        { text = "Why would they come to Felwood?", next = "council_why", fx = { learn = { "burning_legion" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    council_why = {
      lines = {
        { id = "cw_default", text = "Because the demons were here, and something of them is still in the ground and the water. Arko thought they were drawing on it at Jaedenar, building something in the old barrow they call Shadow Hold, and she wanted proof before she went to the Sentinels." },
      },
      choices = {
        { text = "And if she found her proof?", next = "council_proof" },
        { text = "Something else.", next = "BACK" },
      },
    },
    council_proof = {
      big = true,
      lines = {
        { id = "cp_default", text = "Then Darnassus has to listen, and the Sentinels have to come north in force, and that means fewer of them in Ashenvale. It's a hard thing to ask of them, but a nest of warlocks in Felwood is worse than any war on the border." },
      },
      choices = {
        { text = "Darnassus should root them out, whatever it costs.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Sentinels won't fix this. A few good blades will.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jaedenar = {
      lines = {
        { id = "j_default", text = "It's south and east of here, along the road, and the satyrs and the Jaedenar cultists hold all of it now. There are hounds of the Legion there too, and the deeper you go into the barrow, the less of it is ruins and the more of it is theirs." },
        { id = "j_rogue", when = { class = "ROGUE" }, text = "South and east, along the road, and full of cultists who've grown careless because nothing has ever got past them. Someone who walks quietly might, I think, and you look like you walk quietly." },
      },
      choices = {
        { text = "Do you think your friends are still alive?", next = "alive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alive = {
      lines = {
        { id = "a_default", text = "I have to think so, because the alternative is that I've been sitting here doing nothing while they died. If the Council took them, they'd keep them, at least for a while, because cultists like to ask questions." },
        { id = "a_done", when = { questDone = TODO_QUEST("Rescue From Jaedenar") }, text = "One of them was, and that's because of you. The other I already know about, and I'd rather not say it aloud again today." },
      },
      choices = {
        { text = "I'll look for them in Jaedenar.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trey = {
      lines = {
        { id = "t_default", text = "They tortured him to death, and then whatever they'd done to him kept his spirit there, twisted against its own friends. Arko had to fight him on the way out, with his own sword in her hands." },
      },
      choices = {
        { text = "Who did it to him?", next = "trey_who" },
        { text = "How is Arko'narin bearing it?", next = "trey_arko" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trey_who = {
      lines = {
        { id = "tw_default", text = "A succubus named Rakaiah, one of the things the Council keeps in Shadow Hold. His body is still in there somewhere, and I can't bear to think of leaving him in that place." },
      },
      choices = {
        { text = "Then I'll go back for him.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trey_arko = {
      big = true,
      lines = {
        { id = "ta_default", text = "She'd like me to believe she's fine, and that she's strong enough to carry it on her own. I know better, but I can't make her stop and grieve, so the least we can do is finish what was started in there." },
      },
      choices = {
        { text = "She deserves peace, and Rakaiah deserves justice.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Grief is for later. Rakaiah dies first.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    della = {
      lines = {
        { id = "d_default", text = "That's Della, and she's been with me since she was a pup no bigger than my boot. She doesn't like Felwood any more than I do, and she won't drink from the streams, which is sensible of her." },
      },
      choices = {
        { text = "She seems well trained.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpala = {
      big = true,
      lines = {
        { id = "xp_default", text = "Then you'll understand him better than I ever could, because he never once spoke of the Light as if it were a weapon. He spoke of it as a promise, and he'd want whoever avenges him to remember that." },
      },
      choices = {
        { text = "I'll avenge him as he lived, with the Light.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Promises didn't save him. Steel will answer for him.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xl_default", text = "You'll forgive me if I find that hard to believe today, with my friends in their hands. I'll grant you this much: you came and spoke to me in the open, which is more than any of them ever has." },
      },
      choices = {
        { text = "Judge me by what I do in Jaedenar.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Believe what you like. Power is power.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhorde = {
      lines = {
        { id = "xh_default", text = "So I've heard, that they drove the orcs to the demons long before any of you crossed the sea. If that's true, then I suppose your people have more reason than mine to want them gone from Felwood." },
      },
      choices = {
        { text = "We do. Let's see them gone.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm from Darnassus, and I came north to meet two friends who were braver than I am. That's all of it, really." } },
    advice = { { id = "tp_ad", text = "Don't drink from the streams up here, and don't go into Jaedenar alone. My friends went in together, and look how that turned out." } },
    silver_hand = { { id = "tp_sh", text = "Trey's order. He wore their tabard as if it were the finest thing he owned, and to him I think it was." } },
    burning_legion = { { id = "tp_bl", text = "Gone from this forest, they say, except that everything here still remembers them, and so do the warlocks who serve them." } },
    cenarion_circle = { { id = "tp_cc", text = "The Emerald Circle's druids have been kind to me while I wait, though they've far more to worry about than my friends." } },
    holy_light = { { id = "tp_holy_light", text = "Trey prays to the Light, and he believes it goes with him everywhere. I'm a moon girl, myself, but I hope he's right tonight." } },
    elune = { { id = "tp_elune", text = "I pray to Elune for Arko'narin every night, and for Trey, and a little for myself. She hasn't said no yet." } },
    satyrs = { { id = "tp_satyrs", text = "Shadow Hold is full of satyrs, and they took my friends. I'm not brave, but I'm not leaving them there." } },
    scourge = { { id = "tp_scourge", text = "Trey fought the dead in the human lands before he came here, and he doesn't talk about it. He only goes very quiet." } },
    _none = { { id = "tp_none", text = "I'm sorry, I can't think about much besides Jaedenar just now. Ask Greta; she knows this forest far better than I do." } },
  },
}
