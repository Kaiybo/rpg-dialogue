-- Stonetalon Mountains. Voice: bibles/stonetalon.md
-- Sun Rock Retreat and Malaka'jin (Horde), Stonetalon Peak (Alliance, neutral keeper).
local P = RPGDialogueAPI:Pack("rpgd.stonetalon")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "maggran", id = TODO_NPC("Maggran Earthbinder"), name = "Maggran Earthbinder",
  bible = "bibles/stonetalon.md", role = "soldier", tier = "major",
  communities = { "sun_rock" }, temper = { "hard" }, values = { "loyal", "brave" },
  notices = { "kit", "race" },
  impression = {
    first = "Maggran Earthbinder holds Sun Rock with the hardness of an old warrior who says he was gentle once. The years and the battles took that from him, he claims, and I believe him.",
    third = "{name} met Maggran Earthbinder, the battle-hardened tauren who holds Sun Rock Retreat for Cairne Bloodhoof.",
  },

  greetings = {
    { id = "g_rock", text = "The wind is strong on Sun Rock and the sun stronger, which is good for old wounds. Say what you need." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the rock, good. I've work for the ones who come back." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear up here, where the wind could knock you off the rock. Your people's witch doctor down at Malaka'jin keeps strange company, so mind you don't catch it." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You've been bloodied. Good; it means you fought. Now mend, and fight smarter." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of my people. You'll find me less gentle than the elders, for the years and the battles took that from me." },
  },

  start = "hello",
  nodes = {
    warrior_mg = {
      lines = {
        { id = "wmg_default", text = "Windshear Crag, where the Bloodfury nest, and the Webwinder Path, where the spiders take whoever the harpies miss. I lost my patience for small fights long ago, warrior, so take the big ones and leave the small ones to the braves." },
        { id = "wmg_grunt", when = { origin = "orc_razor_hill_grunt" },
          text = "A Razor Hill grunt, a long way up a mountain. Orgrimmar trains its grunts to hold a gate; up here there are no gates, only cliffs, and the harpies come at you from every one of them." },
      },
      choices = {
        { text = "The big ones, then. I'll start with the Ripper.", next = "BACK", fx = { align = { honor = 1 }, trait = { brave = 1 } } },
        { text = "I'll pick them off where they're weakest.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    shaman_mg = {
      lines = {
        { id = "smg_default", text = "Not to me; I'm a warrior, whatever my name says, and the spirits stopped talking to me when I stopped listening. The wind up here is kind to my old wounds, though, and I suppose that is the spirits' way of speaking to someone too stubborn to hear." },
        { id = "smg_rise", when = { origin = "tauren_spirit_rise" },
          text = "You stood at the Spirit Rise and they answered you, I can see it in how you carry the totems. Then ask the wind about the Charred Vale, because it was screaming the night the fires came, and I've never known why." },
      },
      choices = {
        { text = "The wind here is restless. Something hurts it.", next = "shaman_mg2" },
        { text = "Something else, Maggran.", next = "BACK" },
      },
    },
    shaman_mg2 = {
      lines = {
        { id = "smg2_default", text = "The Venture Company's saws and the goblins' fires, most likely, and the harpies on top of it. If you can soothe what's angry up here, do it; I'd sooner have the spirits on our side than one more brave." },
      },
      choices = {
        { text = "The spirits ask for balance, not for sides.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Then I'll ask them to stand with Sun Rock.", next = "BACK", fx = { align = { order = 1 }, affinity = 2 } },
      },
    },
    forsaken_mg = {
      big = true,
      lines = {
        { id = "fmg_default", text = "Then you and I have both lost something we can't get back, though I'd say you lost more of it. Cairne sent me here to heal; I don't know who sends your kind anywhere to heal, or whether you would go." },
      },
      choices = {
        { text = "Some of us would. If there were anywhere.", next = "BACK", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "Healing's for the living. I want my due.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Maggran Earthbinder. Cairne gave me Sun Rock to hold, and the wind and sun here to ease what the years did to me. I was gentle once, but I'm not anymore." },
        { id = "h_harpies", tags = { "news" }, when = { questActive = TODO_QUEST("Harpies Threaten") },
          text = "The Bloodfuries are why there are more harpies in Kalimdor every year, and they hem in every living thing near their roosts. Cull them in the Charred Vale, and strike hard." },
        { id = "h_bloodfury", when = { questActive = TODO_QUEST("Bloodfury Bloodline") },
          text = "Bloodfury Ripper is all but a queen to that flock, and she keeps to the western hills of the Charred Vale. End her, and the rest will scatter like leaves." },
        { id = "h_spiders", when = { questActive = TODO_QUEST("Arachnophobia") },
          text = "Besseleth and her brood hunt the Webwinder Path at night, out of Sishir Canyon. Her fang found me once, two feet of it, and I barely got clear, so kill her and I'll sleep easier." },
        { id = "h_reserves", when = { questActive = TODO_QUEST("Calling in the Reserves") },
          text = "Grish Longrunner has guarded the Great Lift a long while and asked to see his family. Take him my letter; it tells him a reserve warrior is coming to relieve him." },
        { id = "h_ripper_dead", when = { questDone = TODO_QUEST("Bloodfury Bloodline") },
          text = "Since the Ripper fell, the anger's gone quiet in me, and I hardly know what to do with the silence. Perhaps it's time I looked to the good, as a tauren should." },
      },
      again = {
        { id = "h_again", text = "What else? Say it plainly; I've no patience left for riddles." },
        { id = "h_again2", text = "Go on. The rock's quiet for once, and I can spare the time." },
      },
      choices = {
        { text = "What hardened you?", next = "hard" },
        { text = "What troubles Sun Rock?", next = "troubles" },
        { text = "Tell me about the spider that nearly had you.", next = "besseleth" },
        { text = "What does Sun Rock do up here?", next = "work" },
        { text = "The Ripper is dead. How do you feel?", next = "after", when = { questDone = TODO_QUEST("Bloodfury Bloodline") } },
        { text = "Cairne sent you here. Why?", next = "cairne", when = { race = "Tauren" } },
        { text = "I'll help hold Sun Rock.", next = "END", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I'm a warrior. Put me where the harpies hit hardest.", next = "warrior_mg", when = { class = "WARRIOR" } },
        { text = "Do the spirits of this mountain speak to you?", next = "shaman_mg", when = { class = "SHAMAN" } },
        { text = "I was gentle once too, before I died.", next = "forsaken_mg", when = { race = "Scourge" } },
        { text = "Sun Rock can hold itself. I have my own road.", next = "END", fx = { align = { honor = -1 } } },
      },
    },
    hard = {
      big = true,
      lines = {
        { id = "h2_default", text = "Battle and loss, and spider venom once, that left me shaking for a season. Cairne sent me here to heal, and the mountains healed the body; the rest is still working on it." },
      },
      choices = {
        { text = "Does the wind help?", next = "wind" },
        { text = "I understand.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    wind = {
      lines = {
        { id = "w_default", text = "Some days. The sun warms the old wounds and the wind carries the worst of my thoughts off the rock, and on the days it doesn't, I find a harpy to take it out on." },
      },
      choices = {
        { text = "That's honest, at least.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    troubles = {
      lines = {
        { id = "tr_default", text = "Harpies, first and worst. The Bloodfuries roost in the Charred Vale and breed faster than we can thin them, and they're the reason harpies plague half of Kalimdor." },
      },
      choices = {
        { text = "How do we break them?", next = "ripper" },
        { text = "What else?", next = "troubles2" },
      },
    },
    ripper = {
      lines = {
        { id = "ri_default", text = "Killing them by the score is not enough, for the cure is to kill their leader. Bloodfury Ripper rules them from the western hills, and without her they'll weaken, and maybe we can finish them." },
      },
      choices = {
        { text = "I'll find her.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 }, standing = { sun_rock = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    troubles2 = {
      lines = {
        { id = "t2_default", text = "The Venture Company's saws, and the angry fire that came after them, and the spiders on the roads. The Horde has been strong in Kalimdor since the war, and I mean to keep these mountains part of that strength." },
      },
      choices = {
        { text = "Then I'll help keep them.", next = "BACK", fx = { affinity = 1, learn = { "venture_company" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "venture_company" } } },
      },
    },
    besseleth = {
      lines = {
        { id = "b_default", text = "Besseleth is an old predator of these parts, larger than any of her brood. She took me on the Webwinder Path in the dark, and I fought her off and crawled to safety, and I've a scar to rub when the weather turns." },
      },
      choices = {
        { text = "Is there a bounty?", next = "bounty" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bounty = {
      lines = {
        { id = "bo_default", text = "There's a poster on the main road, south of Windshear Crag, and I'll pay it gladly. Bring me her fang and more folk will dare the road to Sun Rock after dark." },
      },
      choices = {
        { text = "I'll bring you the fang.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = {
        { id = "wo_default", text = "Orcs and tauren together, mending what the Venture Company and worse did to these mountains. Tammra plants, the braves fight, and I keep the rock standing while they do it." },
      },
      choices = {
        { text = "And the mage by the fire?", next = "braelyn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    braelyn = {
      lines = {
        { id = "br_default", text = "Braelyn Firehand. The Horde gives her a roof, and she pays for it in fire, and what she does with her own time is between her and her conscience. Watch her if you work for her, is all I'll say." },
      },
      choices = {
        { text = "I'll keep my eyes open.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      big = true,
      lines = {
        { id = "a_default", text = "Strange. Knowing evil roosted near my land kept my thoughts busy for years, and now they're silent, so perhaps that's a good thing. Maybe now I can turn to the good, as the elders always told me to." },
      },
      choices = {
        { text = "You've earned the quiet.", next = "BACK", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "There'll always be another fight.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "What frightens you about the quiet?", tag = "Persuade", next = "after_fear",
          check = { pass = { any = { { disposition = { min = 65 } }, { race = "Tauren" }, { trait = "kind" } } } },
          fail = { next = "after_wall", fx = { affinity = -1 } } },
      },
    },
    cairne = {
      lines = {
        { id = "c_default", text = "Because he's wiser than I am, and he saw I'd stopped being humble before I did. He gave me a hard post and a gentle wind, and I think he meant me to mend here, so I'm still trying." },
      },
      choices = {
        { text = "The Earth Mother keeps her own time.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    after_fear = {
      lines = {
        { id = "af_default", text = "That I've forgotten how to be gentle, and that the braves only follow me because I'm hard. A hard chieftain is easy to obey, and I don't know yet whether a gentle one is someone they'd follow at all." },
      },
      choices = {
        { text = "They'll follow you either way.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then learn it slowly.", next = "BACK", fx = { affinity = 1, trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    after_wall = {
      lines = {
        { id = "aw_default", text = "Nothing frightens me on this rock but a harpy I didn't see coming. Ask your questions of Tammra; she likes them better." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I hold this rock, so I hear about everything that threatens it. Ask about any of these, and plainly." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "You'll get what every brave on this rock already knows, and nothing more, so pick one." },
    },
    background = { { id = "tp_bg", text = "Cairne sent me to Sun Rock to hold it and to mend. The holding I can do.", next = "hard" } },
    advice = { { id = "tp_ad", text = "Don't walk the Webwinder Path at night, and if you must, don't walk it alone." } },
    venture_company = { { id = "tp_venture", text = "Goblins with saws who think a mountain's worth what they can cut off it. We spend our days mending after them." } },
    cenarion_circle = { { id = "tp_circle", text = "Their keeper watches the peak to the north. We leave each other be, mostly. Mostly is a fragile word up here." } },
    _none = { { id = "tp_none", text = "That's not my concern. Ask Tammra; she has more patience than I do." } },
  },
}

P:NPC {
  key = "tammra", id = TODO_NPC("Tammra Windfield"), name = "Tammra Windfield",
  bible = "bibles/stonetalon.md", role = "questgiver", tier = "quest",
  communities = { "sun_rock" }, temper = { "gentle" }, values = { "hopeful", "patient" },
  notices = { "class", "form" },
  impression = {
    first = "On her knees in burned ground, Tammra Windfield coaxes green shoots out of it and counts five living against two dead as a good night. I have rarely seen stubbornness look so hopeful.",
    third = "{name} met Tammra Windfield, who tends what grows on Sun Rock and means to bring the Charred Vale back to life.",
  },

  greetings = {
    { id = "g_seeds", text = "Careful where you step. Those little green shoots are the first things to grow in that soil in years." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid! Then you'll know how hard it is to make dead ground live again. Help me, if you've a moment." },
  },

  start = "hello",
  nodes = {
    shaman_ta = {
      lines = {
        { id = "sta_default", text = "I thought so, though I've only the dirt under my nails to tell me. If you could ask them to be patient a little longer, I'd be grateful, because these shoots need a spring without the ground shaking under them." },
      },
      choices = {
        { text = "I'll speak for your garden.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "The spirits don't take requests, Tammra.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Tammra Windfield, and I tend what grows on Sun Rock and try to bring back what doesn't. Every mountain can heal, given time and stubbornness." },
        { id = "h_kaya", tags = { "news" }, when = { questActive = TODO_QUEST("Kaya's Alive") },
          text = "Kaya's alive? My niece, alive! Oh, Earth Mother be thanked, for after the Grimtotem fell on Camp Aparaje we'd all thought her lost." },
        { id = "h_rebirth", when = { questActive = TODO_QUEST("Cycle of Rebirth") },
          text = "Death feeds life, if you let it. It's the oldest cycle there is. Help me turn it the right way round." },
        { id = "h_newlife", when = { questActive = TODO_QUEST("New Life") },
          text = "Plant them gently, and water them more gently still; they're the future of these slopes." },
        { id = "h_shoots", when = { metBefore = true }, text = "Two of the new shoots died in the night, but five lived, and I'll take five." },
      },
      again = {
        { id = "h_again", text = "Anything else, while my hands are in the dirt? I can listen and plant at once." },
        { id = "h_again2", text = "Ask on. The seeds don't mind company." },
      },
      choices = {
        { text = "Why bring the ground back?", next = "why" },
        { text = "What happened to the land here?", next = "land" },
        { text = "What are you planting?", next = "seeds" },
        { text = "How is your niece?", next = "kaya", when = { questDone = TODO_QUEST("Kaya's Alive") } },
        { text = "I'm a druid. Could I help the shoots along?", next = "druid", when = { class = "DRUID" } },
        { text = "Did the seeds take, in the Charred Vale?", next = "future", when = { questDone = TODO_QUEST("New Life") } },
        { text = "The earth spirits here are angry. I can feel it.", next = "shaman_ta", when = { class = "SHAMAN" } },
        { text = "Good luck with your garden.", next = "END", fx = { affinity = 1 } },
      },
    },
    land = {
      big = true,
      lines = {
        { id = "l_default", text = "Fire, and goblin axes, and fighting, until the vale to the west burned black. But burned ground is still ground, and it remembers how to be green." },
      },
      choices = {
        { text = "Who burned it?", next = "venture" },
        { text = "I'll help it remember.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Burned ground is just ground. Let the goblins have it.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    venture = {
      lines = {
        { id = "v_default", text = "The Venture Company, chasing lumber, and the war that came with them, and then the fire spirits they angered. Greed and war together will wreck any land; it takes the Earth Mother's blessing to cure it." },
      },
      choices = {
        { text = "Then the Venture Company has a lot to answer for.", next = "BACK", fx = { learn = { "venture_company" }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "venture_company" } } },
      },
    },
    why = {
      lines = {
        { id = "w_right", text = "Because the mountain's been cut and burned, and someone ought to make it right. It doesn't much matter who, and it happens to be me." },
      },
      choices = {
        { text = "How do you make it right?", next = "blessing" },
        { text = "I'm glad it's you.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Let the mountain mend itself. It isn't your burden.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    blessing = {
      lines = {
        { id = "b_default", text = "I chant over the seeds and ask the Earth Mother to quicken them, and she listens, most days. The seeds do the real work; I only remind them they're allowed to." },
      },
      choices = {
        { text = "That's a kind of faith I understand.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    seeds = {
      lines = {
        { id = "s_default", text = "Gaea seeds, which grow only here in Stonetalon, along the water's edge at Mirkfallon Lake, north of the rock. They're small and hard and stubborn, which is just what this ground needs." },
      },
      choices = {
        { text = "Where do they go once they're blessed?", next = "planting" },
        { text = "Something else.", next = "BACK" },
      },
    },
    planting = {
      lines = {
        { id = "p_default", text = "Into the mounds of good soil in the heart of the Charred Vale, where the fire was worst. The harpies and the angry fire spirits are still there, so whoever plants them has to be brave as well as gentle." },
      },
      choices = {
        { text = "I can be both.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kaya = {
      lines = {
        { id = "k_default", text = "Safe with her father, my brother-in-law Makaba, and that's all I'll ask of the world this year. The Grimtotem took her from Camp Aparaje and kept her at their post, and I still can't think of it without shaking." },
      },
      choices = {
        { text = "She's safe now. That's what matters.", next = "BACK", fx = { align = { honor = -1 }, affinity = 3, trait = { kind = 1 } } },
        { text = "The Grimtotem will answer for it.", next = "BACK", fx = { affinity = 1, learn = { "grimtotem" }, align = { honor = 1 } } },
      },
    },
    druid = {
      lines = {
        { id = "d_default", text = "Oh, would you? Talk to them, then, however you druids do it, and tell them the rock is a safe place to grow. They'll take it better from you than from me." },
      },
      choices = {
        { text = "(Kneel and lay a hand on the shoots.)", next = "BACK", fx = { affinity = 2, standing = { sun_rock = 1 }, align = { order = 1 } } },
        { text = "They'll grow wild and strong without my coaxing.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    future = {
      big = true,
      lines = {
        { id = "f_default", text = "They took, and they're strong, holding back the corruption and making a foothold for everything else. In time the goblins will give up and go, the fire spirits will settle, and the land itself will drive the harpies off, and that's the day Stonetalon will know peace." },
      },
      choices = {
        { text = "I hope I see it.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The goblins won't give up. They never do.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I mostly know seeds, but people tell a gardener things while she works. Ask me about any of these." },
    },
    background = { { id = "tp_bg", text = "I tend the ground on Sun Rock and pray over seeds. My niece Kaya and her father lived at Camp Aparaje, and that's family enough to worry over." } },
    advice = { { id = "tp_ad", text = "Never step on a green shoot up here. It might be the only one for a mile." } },
    venture_company = { { id = "tp_venture", text = "They cut until there's nothing left to cut, and then they move on and leave the burning for us." } },
    cenarion_circle = { { id = "tp_circle", text = "They want the same thing I want, a living mountain. I wish we could plant side by side instead of glaring across the ridges." } },
    _none = { { id = "tp_none", text = "I don't know, I'm afraid; I mostly know seeds." } },
  },
}

P:NPC {
  key = "braelyn", id = TODO_NPC("Braelyn Firehand"), name = "Braelyn Firehand",
  bible = "bibles/stonetalon.md", role = "questgiver", tier = "quest",
  communities = { "sun_rock" }, temper = { "bitter" }, values = { "ambitious", "vengeful" },
  notices = { "class", "form" },
  impression = {
    first = "Braelyn Firehand keeps her fire lit without wood and her grudges burning longer still. Her hatred of the druids has the sound of an old wound, and she would rather not say how she learns most things.",
    third = "{name} met Braelyn Firehand, an embittered mage at Sun Rock who wants the druids of the Talon Den gone and the land's magic restored.",
  },

  greetings = {
    { id = "g_mage", text = "You've a capable look, and I've work for capable people. It's unpleasant work, but well paid." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! Then you'll understand. Magic is being choked out of these mountains by druids who think every spell is a crime." },
    { id = "n_druid", cat = "form", when = { class = "DRUID" },
      text = "A druid, though in the Horde, at least, which I suppose is something. You'll not like what I'm about to ask, so don't ask what it is." },
  },

  start = "hello",
  nodes = {
    forsaken_b = {
      lines = {
        { id = "fb_default", text = "Did you? Then you remember what it felt like to cast in a city that wanted you to, and you'll understand why this mountain makes me furious. Every spell up here leaks like a bucket full of holes, and the druids like it that way." },
        { id = "fb_dal", when = { origin = "forsaken_dalaran_apprentice" },
          text = "An apprentice of the Violet Citadel, walking about with a jaw that doesn't quite close. The Kirin Tor would have you burned, and I would have you help me, which is the better offer." },
      },
      choices = {
        { text = "Magic should flow freely. I'll help you.", next = "BACK", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "The druids have their reasons. I won't kill them for it.", next = "BACK", fx = { align = { order = 1 }, affinity = -1 } },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Braelyn Firehand. The Horde gives me a roof here, and I give it my spells. The druids of the Talon Den want this land bare of magic, and I want it back." },
        { id = "h_legacy", tags = { "news" }, when = { questActive = TODO_QUEST("Cenarius' Legacy") },
          text = "The druids at the Talon Den, and Cenarius's brood with them, would strangle every spell in the world if they could. Thin their numbers." },
        { id = "h_ordanus", tags = { "news" }, when = { questActive = TODO_QUEST("Ordanus") },
          text = "Ordanus is a keeper in Ashenvale, at the top of a great tree, and I knew him, long ago. He thought himself above even the Highborne, so bring me his head." },
        { id = "h_den", tags = { "news" }, when = { questActive = TODO_QUEST("The Den") },
          text = "The Gatekeeper's Key is hidden in a little lantern at the mouth of the Den. I had that from one of the druids, eventually, and I'd rather not say how." },
      },
      again = {
        { id = "h_again", text = "Well? I've a fire to keep and little patience to spare." },
        { id = "h_again2", text = "Ask, then. Questions cost me nothing, though answers might cost you." },
      },
      choices = {
        { text = "Why do you hate the druids?", next = "hate" },
        { text = "What's wrong with the magic here?", next = "magic" },
        { text = "Who sent you to these mountains?", next = "master" },
        { text = "I'm a mage. I feel it too.", next = "mage", when = { class = "MAGE" } },
        { text = "Jaedenar? That's the Shadow Council's hold.", next = "council", when = { class = "WARLOCK" } },
        { text = "You knew Ordanus. What was he to you?", next = "ordanus", when = { any = { { questActive = TODO_QUEST("Ordanus") }, { questDone = TODO_QUEST("Ordanus") } } } },
        { text = "I'm a druid. You're speaking of my order.", next = "druid", when = { class = "DRUID" } },
        { text = "I studied in Dalaran, before I died.", next = "forsaken_b", when = { race = "Scourge", class = "MAGE" } },
        { text = "I'll think about it.", next = "END" },
      },
    },
    hate = {
      big = true,
      lines = {
        { id = "h2_default", text = "Because they decide what magic may live and what must die, and call it balance. I've seen what balance costs. I'll not pay it twice." },
      },
      choices = {
        { text = "That sounds like a grudge.", next = "grudge", fx = { trait = { skeptical = 1 } } },
        { text = "I see.", next = "BACK" },
      },
    },
    grudge = {
      lines = { { id = "g2_default", text = "It is a grudge, and a very old one. Old grudges are the only kind worth keeping." } },
      choices = {
        { text = "How old?", next = "temple" },
        { text = "Something else.", next = "BACK" },
      },
    },
    magic = {
      lines = {
        { id = "m_default", text = "The druids on the peak use their little powers to stifle the flow of magic, even this far south of their precious forests. Casting here is like drawing water from a well with a bucket full of holes." },
      },
      choices = {
        { text = "Why does that matter so much to you?", next = "rush" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rush = {
      lines = {
        { id = "r_default", text = "Because life without magic coursing through your veins is a pale, grey mockery of living. The kaldorei spurn that gift and call themselves wise for it, and I'll never understand them." },
      },
      choices = {
        { text = "Some would call that hunger.", next = "BACK", fx = { trait = { skeptical = 1 }, align = { light = 1 } } },
        { text = "I know the feeling.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
      },
    },
    temple = {
      lines = {
        { id = "t_default", text = "Old enough to remember that the ruins on Stonetalon Peak were a temple of Queen Azshara. The night elves crawl over our sacred stones now and call it a grove, and they think I should be grateful." },
      },
      choices = {
        { text = "Our sacred stones? Yours?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    master = {
      lines = {
        { id = "ma_default", text = "My master, who is none of your concern. Would that I could go back to Jaedenar and feel magic flow freely again, but I'm not allowed to return until my work here is done." },
      },
      choices = {
        { text = "And the Horde doesn't mind your master?", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    council = {
      lines = {
        { id = "co_default", text = "You've a good memory and a loose tongue, warlock, and only one of those will serve you well. Keep the name of that place out of Maggran's hearing, and we'll get along." },
      },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
        { text = "We'll see.", next = "BACK", fx = { align = { light = 1 }, affinity = -1 } },
      },
    },
    mage = {
      lines = {
        { id = "mg_default", text = "Then you know what I mean by the bucket full of holes. Help me break the druids' grip on the peak, and you'll feel the flood come back, sweet as anything." },
      },
      choices = {
        { text = "I'll consider it.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Not at that price.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
      },
    },
    ordanus = {
      big = true,
      lines = {
        { id = "o_default", text = "One of the eldest sons of their forest god, with all the arrogance of his kind. They spirited him away from the peak before I could reach him, but my magic found him at Raynewood all the same." },
        { id = "o_done", when = { questDone = TODO_QUEST("Ordanus") },
          text = "I knew him long ago, when he looked down on everyone, even the Highborne. He isn't holding his head so high these days, is he?" },
      },
      choices = {
        { text = "You never said how you knew him.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid = {
      lines = {
        { id = "d_default", text = "I am, and I don't take a word back. You wear the Horde's colours, so we'll be civil, but don't expect me to like what you are." },
      },
      choices = {
        { text = "Civil will do.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "You'll find I'm not what you think.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a mage, and I'm here on business that isn't yours. That's all the story you'll get." } },
    advice = { { id = "tp_ad", text = "Never let anyone tell you which magic you're allowed to love." } },
    cenarion_circle = { { id = "tp_circle", text = "Gardeners with claws, so don't let their smiles fool you." } },
    _none = { { id = "tp_none", text = "Irrelevant, unless it's magic, and then it's mine." } },
  },
}

P:NPC {
  key = "jinzil", id = TODO_NPC("Witch Doctor Jin'Zil"), name = "Witch Doctor Jin'Zil",
  bible = "bibles/stonetalon.md", role = "questgiver", tier = "quest",
  communities = { "sun_rock" }, temper = { "sly" }, values = { "loyal", "curious" },
  notices = { "class", "race" },
  impression = {
    first = "Most of the cages in Witch Doctor Jin'Zil's cave are empty, he told me, and then he said 'most' again in a way I did not care for. He laughs easily and boasts endlessly that he is better than Darsok.",
    third = "{name} met Witch Doctor Jin'Zil, a sly Darkspear who keeps a cave full of cages and a pot always on the boil near Sun Rock.",
  },

  greetings = {
    { id = "g_cave", text = "Come in, come in, mon, and don't mind the cages; most of dem be empty. Most." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Darkspear! Ya smell like the Echo Isles, mon. Sit, sit, Jin'Zil got stories and stew." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "Ah, the spirits like you, and dey whisper about you. Not all good things, but dey whisper." },
  },

  start = "hello",
  nodes = {
    warlock_j = {
      big = true,
      lines = {
        { id = "wj_default", text = "Ah, so you be one of dose. Jin'Zil keep elves in cages and boil dere eyes, so I ain't gonna lecture you, but the loa know who you talk to, nephew, and dey don't forget it." },
        { id = "wj_voice", when = { origin = "troll_other_voice" },
          text = "Dat other voice been with you since you were small, eh? Some witch doctors say send it back, some say make it work for you, and Jin'Zil say find out what it want before it find out what you want." },
      },
      choices = {
        { text = "The loa had their chance. I'll use what answers.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll keep the voice on a short leash.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jin'Zil be my name: witch doctor, Darkspear, and friend to Darsok and Rokhan. Dis cave be my workshop, and da forest out dere be my pantry." },
        { id = "h_letter", tags = { "news" }, when = { questActive = TODO_QUEST("Letter to Jin'Zil") },
          text = "A letter from Darsok, dat old knife? Is he still bragging? Course he still bragging, so give it here, mon." },
        { id = "h_magic", when = { questActive = TODO_QUEST("Jin'Zil's Forest Magic") },
          text = "Da forest got magic in it, if you know where to cut. Bring Jin'Zil what he asked, and don't let da tree-folk catch you." },
        { id = "h_darsok", when = { heardLine = "darsok.h_default" },
          text = "You met Darsok at da Crossroads? Ha! He tell you he the best? He always say dat, but he be second best, and Jin'Zil be first." },
        { id = "h_quiet", when = { metBefore = true }, text = "De spirits been quiet today. Quiet spirits make Jin'Zil nervous, mon, like a cage that stop rattlin'." },
      },
      again = {
        { id = "h_again", text = "What else you want, mon? Jin'Zil got all day and a pot on da boil." },
        { id = "h_again2", text = "Ask, ask, and mind da cauldron while you do." },
      },
      choices = {
        { text = "What's in the cages?", next = "cages" },
        { text = "How do you know Darsok?", next = "darsok" },
        { text = "What do the spirits tell you?", next = "spirits" },
        { text = "What became of the elves in the cages?", next = "after", when = { questDone = TODO_QUEST("Jin'Zil's Forest Magic") } },
        { text = "The Echo Isles send their greetings, uncle.", next = "troll", when = { race = "Troll" } },
        { text = "I hear another voice when I cast, uncle. Not the loa.", next = "warlock_j", when = { race = "Troll", class = "WARLOCK" } },
        { text = "I'll be going.", next = "END" },
      },
    },
    cages = {
      lines = { { id = "c_default", text = "Ingredients, mon, and sometimes ingredients be talking. Dat's normal, so don't listen to dem." } },
      choices = {
        { text = "...those are night elves.", next = "elves" },
        { text = "...right.", next = "BACK" },
      },
    },
    elves = {
      big = true,
      lines = {
        { id = "e_default", text = "Three little cages for three little elves, from up by da peak where dey hug dem trees. Jin'Zil gonna give dem a taste of dey own forest magic, mon, and dey gonna feel right at home." },
      },
      choices = {
        { text = "What's in the brew?", next = "brew" },
        { text = "That's cruel, even for war.", next = "BACK", fx = { affinity = -1, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Let the elves taste their own magic, then.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    brew = {
      lines = {
        { id = "b_default", text = "Stonetalon sap, whiskers off dem twilight runners, a fey dragon's scale, and eyes, lots of courser eyes, because you can never have enough eyes. All of it from da peak, mon, so da elves be gettin' a little bit of home." },
      },
      choices = {
        { text = "I'll fetch it.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
        { text = "I won't help you poison anyone, Jin'Zil.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    darsok = {
      lines = {
        { id = "d_default", text = "Darsok Swiftdagger and Jin'Zil go way back, but Jin'Zil not heard from him in many years before dat letter. He wrote dat da last of da Bloodfeathers be dead, and dat make an old troll smile." },
      },
      choices = {
        { text = "The Bloodfeathers?", next = "rokhan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rokhan = {
      lines = {
        { id = "r_default", text = "Harpies in da Barrens, mon, nasty ones. My friend Rokhan went with dat crazy mok'nathal Rexxar to kill da older sister, back in da day. Ah, to be young like you again." },
      },
      choices = {
        { text = "Rexxar? The Champion of the Horde?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirits = {
      lines = {
        { id = "s_default", text = "Dey tell Jin'Zil when it gonna rain, when somebody lyin', and when somebody about to knock over da good pot. Dey talk more when dey hungry, so Jin'Zil keep dem fed." },
      },
      choices = {
        { text = "Fed with what?", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      lines = {
        { id = "a_default", text = "Dey went out like little lights, mon, little wisps flyin' out da cave and gone. So much for da power of nature, eh?" },
      },
      choices = {
        { text = "I'll carry that one a while.", next = "BACK", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "So much for it.", next = "BACK", fx = { affinity = 1, align = { light = -1 }, trait = { cruel = 1 } } },
      },
    },
    troll = {
      lines = {
        { id = "t_default", text = "Ha! Don't call Jin'Zil uncle, he not dat old, not yet. Sit by da fire, Darkspear, and tell me how da Isles be doin' since Zalazane went bad." },
      },
      choices = {
        { text = "Not well, uncle. Not yet.", next = "BACK", fx = { affinity = 2, learn = { "echo_isles" } } },
        { text = "Another time.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Jin'Zil be a witch doctor of da Darkspear, mon. Dat be all da story you need, and most of it true." } },
    advice = { { id = "tp_ad", text = "Never eat nothin' in a witch doctor's cave, mon, not even if he say it be stew." } },
    _none = { { id = "tp_none", text = "Da spirits don't say, mon. Ask again tomorrow; maybe dey change dey minds." } },
  },
}

P:NPC {
  key = "jayka", id = TODO_NPC("Innkeeper Jayka"), name = "Innkeeper Jayka",
  bible = "bibles/stonetalon.md", role = "innkeeper", tier = "service",
  communities = { "sun_rock" }, temper = { "warm" }, values = { "generous" },
  notices = { "weary" },
  impression = {
    first = "Innkeeper Jayka wants weapons down, boots off and a story of who you have been fighting before anything else. The wind howls around her inn, and she would not live anywhere else.",
    third = "{name} rested at Innkeeper Jayka's inn on Sun Rock, where weary warriors trade stories for a seat by the fire.",
  },

  greetings = {
    { id = "g_inn", text = "Weapons down, boots off, and tell me who you've been fighting. That's how we do it on Sun Rock." },
    { id = "g_home", when = { homeInn = { "Sun Rock Retreat" } }, text = "Home on the rock again! The wind's howling tonight, so it's a good night to be indoors." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Harpies or spiders? It's always one or the other up here. Sit down and eat; both kinds of trouble will wait." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Jayka, and I keep the inn on Sun Rock. Warriors come in tired and leave rested, or at least less tired, and that's the job." },
        { id = "h_harpies", when = { metBefore = true }, text = "The harpies screamed all night, the braves screamed back, and nobody slept. Breakfast?" },
      },
      again = {
        { id = "h_again", text = "Anything else? The fire's warm and the stew's hot, so take your time." },
        { id = "h_again2", text = "Sit a while longer if you like. Nobody hurries on the rock." },
      },
      choices = {
        { text = "Do you like it up here?", next = "rock" },
        { text = "What's the news on the rock?", next = "news" },
        { text = "Want to hear how my last fight went?", next = "story" },
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Just resting.", next = "END" },
      },
    },
    rock = {
      lines = {
        { id = "r_high", text = "It's high, it's windy, and the water's cold enough to stop your heart. I wouldn't live anywhere else." },
      },
      choices = {
        { text = "Why not?", next = "lands" },
        { text = "I can see why.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    lands = {
      lines = {
        { id = "l_default", text = "If the Horde means to hold these new lands, it needs somewhere to rest its bones between battles, and someone has to keep that place. I'd rather it was me than some goblin charging by the hour." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    news = {
      lines = {
        { id = "n_default", text = "Maggran's still after the Bloodfuries, Tammra's still on her knees in the dirt, and the mage by the fire still won't eat my stew. Same as every week, and I'm glad of it." },
      },
      choices = {
        { text = "The mage won't eat?", next = "braelyn" },
        { text = "Something else.", next = "BACK" },
      },
    },
    braelyn = {
      lines = {
        { id = "b_default", text = "Says the food's too plain, and I say she's too thin. She pays her board, though, and she keeps the fire lit without wood, so I've no real complaint." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    story = {
      lines = {
        { id = "s_default", text = "Always! Put your axe down by the hearth and tell it properly, mind, with the bit where it nearly killed you." },
      },
      choices = {
        { text = "(Tell it straight, the bad parts too.)", next = "story_true", fx = { trait = { kind = 1 } } },
        { text = "(Tell it bigger than it was.)", next = "story_tall", fx = { trait = { witty = 1 } } },
      },
    },
    story_true = {
      lines = { { id = "st_default", text = "Now that's a story worth hearing, because it's true. The braves will be telling it wrong by tomorrow, but you and I will know." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, standing = { sun_rock = 1 } } } },
    },
    story_tall = {
      lines = { { id = "sl_default", text = "Ha! Twelve of them, was it, and you with one arm? You'll fit right in on Sun Rock, where every harpy grows a foot with each telling." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep the inn on Sun Rock, and I've heard more battle stories than any war chronicler alive." } },
    advice = { { id = "tp_ad", text = "Sleep while you can up here. The harpies don't keep regular hours." } },
    _none = { { id = "tp_none", text = "Ask Maggran. He knows the mountain; he just doesn't like saying much about it." } },
  },
}

P:NPC {
  key = "albagorm", id = TODO_NPC("Keeper Albagorm"), name = "Keeper Albagorm",
  bible = "bibles/stonetalon.md", role = "noble", tier = "quest",
  communities = { "stonetalon_peak" }, temper = { "serene" }, values = { "patient", "protective" },
  spiritSensitive = true,
  notices = { "class", "form" },
  impression = {
    first = "Keeper Albagorm calls everyone 'little one' and says crimes are done with hands, not banners. The fires in the vale to the south weigh on him, though he speaks of them with great patience.",
    third = "{name} met Keeper Albagorm, the serene keeper of the grove at Stonetalon Peak who mourns the burning of the Charred Vale.",
  },

  greetings = {
    { id = "g_grove", text = "Peace, little one. This grove is old, and wise, and wary. Tread softly and you'll find it kind." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A child of the Circle! Welcome, welcome. The mountain has missed druids, and so have I." },
    { id = "n_horde", cat = "class", when = { faction = "Horde" },
      text = "You come from Sun Rock's side of the ridges, but that's no crime here; crimes are done with hands, not banners." },
  },

  start = "hello",
  nodes = {
    tauren_al = {
      lines = {
        { id = "tal_default", text = "And I return them, gladly. Malfurion chose well when he taught your people, whatever the Archdruid in Darnassus says about it, and this grove has seen tauren druids walk its paths with more care than some of my own kind." },
        { id = "tal_pupil", when = { origin = "tauren_hamuul_pupil" },
          text = "You learned at Hamuul's own fire? Then you'll know his patience, and you'll need it here, for the vale won't heal for any of us in a single season." },
      },
      choices = {
        { text = "The Circle should be one, whatever its races.", next = "BACK", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "My people walk their own path, Keeper.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    sky_al = {
      lines = {
        { id = "sal_default", text = "I've heard there were druids among the sky-folk, and that they lean to the winds more than to Elune. You're welcome in this grove, though I'll admit you're the first of your people I've ever spoken to, and I'm curious what the wind tells you about the vale." },
      },
      choices = {
        { text = "It tells me the fire isn't finished.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Very little. The winds here are strangers.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Albagorm, keeper of the grove. I watch over this peak and its forest, and lately I watch the vale to the south, where the fires came." },
        { id = "h_journey", tags = { "news" }, when = { questActive = TODO_QUEST("Journey to Stonetalon Peak") },
          text = "You climbed all this way? Good; the mountain needs friends who can climb. Rest a moment, and then listen." },
        { id = "h_vale", tags = { "news" }, when = { questActive = TODO_QUEST("Reclaiming the Charred Vale") },
          text = "The Charred Vale was green once. Those who burn it must be driven out, and then we can begin again. Will you help?" },
        { id = "h_falfindel", when = { questDone = TODO_QUEST("Reclaiming the Charred Vale") },
          text = "The Bloodfuries are broken for now, but they will gather again unless we move quickly. If Falfindel can call the forest's spirits to the vale, the regrowth can finally begin." },
      },
      again = {
        { id = "h_again", text = "Ask what you will, little one. The grove has time, and so do I." },
        { id = "h_again2", text = "Speak on. The wind is gentle up here, and so are the trees, most days." },
      },
      choices = {
        { text = "How old is the grove?", next = "age" },
        { text = "What happened to the vale?", next = "vale" },
        { text = "Who keeps the Talon Den?", next = "den" },
        { text = "Faldreas in Astranaar sent me to you.", next = "faldreas", when = { any = { { questActive = TODO_QUEST("Journey to Stonetalon Peak") }, { questDone = TODO_QUEST("Journey to Stonetalon Peak") } } } },
        { text = "Have humans ever come up here before?", next = "human", when = { race = "Human" } },
        { text = "Can the Light heal burned land?", next = "priest", when = { class = "PRIEST" } },
        { text = "I'll help the grove.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Hamuul Runetotem sends his respects, Keeper.", next = "tauren_al", when = { race = "Tauren", class = "DRUID" } },
        { text = "My people's druids honour the Circle too.", next = "sky_al", when = { race = "Skyborne", class = "DRUID" } },
        { text = "The vale's already burned, and I've no time for trees.", next = "END", fx = { align = { light = -1 } } },
      },
    },
    vale = {
      big = true,
      lines = {
        { id = "v_default", text = "Fire, and greed, and those who'd rather the mountain bare. Forests have died before. They come back, if someone stands between them and the next fire." },
      },
      choices = {
        { text = "Who set the fire?", next = "venture" },
        { text = "Then I'll stand there.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    venture = {
      lines = {
        { id = "ve_default", text = "A greedy army of machines and the industrialists who drive them, little one, the goblins of the Venture Company. And now the Bloodfury harpies have settled on the burned ground and refuse us passage, so not one seed can be planted." },
      },
      choices = {
        { text = "Then the harpies must go.", next = "falfindel" },
        { text = "Something else.", next = "BACK", fx = { learn = { "venture_company" } } },
      },
    },
    falfindel = {
      lines = {
        { id = "f_default", text = "They must, and then we will need more than saplings. Far to the south, where Thousand Needles meets the edge of Feralas, a wise druid named Falfindel Waywarder can call great spirits of the forest to the vale's aid." },
      },
      choices = {
        { text = "I'll carry word to him when the time comes.", next = "BACK", fx = { affinity = 2, standing = { stonetalon_peak = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    age = {
      lines = {
        { id = "a_old", text = "Older than the mountain's name, and older than the Horde's coming, or the Alliance's, though young, for a tree. The trees would laugh at you for asking." },
      },
      choices = {
        { text = "What was here before the grove?", next = "temple" },
        { text = "Then I'll ask the trees.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    temple = {
      lines = {
        { id = "t_default", text = "The old stones you walked past were a temple of Queen Azshara, long ago, before the world broke. Not everyone is glad that druids tend those ruins now, and some would rather see us gone from them." },
      },
      choices = {
        { text = "Who would rather you were gone?", next = "raiders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raiders = {
      big = true,
      lines = {
        { id = "r_default", text = "Raiders come up from the Horde's side of the ridges and kill my kin, the sons and daughters of Cenarius, and the botanists who tend the peak. They say the druids choke their magic, and so they come with fire." },
      },
      choices = {
        { text = "I'll stand with your kin.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 }, standing = { stonetalon_peak = 1 } } },
        { text = "Do the druids choke their magic?", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    den = {
      lines = {
        { id = "d_default", text = "The druids of the Talon Den keep a barrow in the mountain's heart, where dryads and keepers of Mirkfallon stand guard. They keep many things there that must never fall into the wrong hands, which is why the way in is guarded by a scheme of hidden keys." },
      },
      choices = {
        { text = "Keys?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    faldreas = {
      lines = {
        { id = "fa_default", text = "So Faldreas listened to the forest spirits after all, and they told him true; they said you were brave and not afraid of a long road. The Talondeep Path is no gentle road, and you are here." },
      },
      choices = {
        { text = "What do you need of me?", next = "vale" },
        { text = "Something else.", next = "BACK" },
      },
    },
    human = {
      lines = {
        { id = "hu_default", text = "In the war against the Burning Legion, the Lady Proudmoore's expedition camped near the caverns below this peak, and the orcs came after, searching for a prophet. The trees remember the noise of it, and they were glad when both had gone." },
      },
      choices = {
        { text = "We're quieter now, I hope.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "Your Light mends flesh, little one, and I have seen it close wounds my own craft could not. Burned land wants seeds and rain and the slow patience of roots, but a healer who keeps the planters alive is welcome in my grove." },
      },
      choices = {
        { text = "Then I'll keep your planters alive.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "Your planters will have to keep themselves alive.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The grove remembers a great deal, little one, and I remember some of what it tells me. Ask about any of these." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "You've been a friend to this peak, so the grove has no secrets from you that it's mine to share. Ask, little one." },
    },
    background = { { id = "tp_bg", text = "I am a keeper of the grove, as my brothers are, and this peak is the place I keep." } },
    advice = { { id = "tp_ad", text = "Go around the Charred Vale if you can, little one, and if you can't, go quickly and look up. The harpies come from above." } },
    venture_company = { { id = "tp_venture", text = "They brought fire and machines to a sacred mountain and called it business. The mountain will outlast them, but not without help." } },
    cenarion_circle = { { id = "tp_circle", text = "My father's children and their students. We keep the old places, and not everyone thanks us for it." } },
    _none = { { id = "tp_none", text = "The grove doesn't know, little one. Nor do I." } },
  },
}

P:NPC {
  key = "faralia", id = TODO_NPC("Innkeeper Faralia"), name = "Innkeeper Faralia",
  bible = "bibles/stonetalon.md", role = "innkeeper", tier = "service",
  communities = { "stonetalon_peak" }, temper = { "quiet" }, values = { "kind" },
  notices = { "weary" },
  impression = {
    first = "Up at the top of the peak, Innkeeper Faralia keeps a small, quiet inn and tries to count the stars from her step. She speaks softly and gives sensible warnings about walking down after dark.",
    third = "{name} found Innkeeper Faralia's small inn atop Stonetalon Peak, a quiet refuge for the few who climb that far.",
  },

  greetings = {
    { id = "g_inn", text = "Rest here. It's quiet on the peak, and the trees keep the wind off." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Faralia, and I keep a small inn for those who climb up to the grove. Not many do, and the ones who do usually need the bed." },
        { id = "h_druid", when = { metBefore = true }, text = "A druid came up from the grove at dawn and sat on my step without a word, watching the mountain, and then she left. I've decided it was a compliment." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Up here the stars are near enough to count, and I've tried, but I always lose my place somewhere past the ridge." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm in no hurry, and neither is the peak." },
        { id = "h_again2", text = "Ask whatever you like while the kettle's on." },
      },
      choices = {
        { text = "Who comes up here?", next = "visitors" },
        { text = "How do people get up and down the peak?", next = "roads" },
        { text = "You pray to Elune? I pray to the Light.", next = "elune", when = { class = "PRIEST" } },
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Just resting.", next = "END" },
      },
    },
    visitors = {
      lines = {
        { id = "v_default", text = "Druids from the Talon Den, Sentinels on their rounds, and adventurers sent up by the Keeper, most of them with harpy scratches. Now and then a human or a dwarf, looking very surprised to find an inn at the top of a mountain." },
      },
      choices = {
        { text = "Why does the Keeper need adventurers?", next = "keeper" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keeper = {
      lines = {
        { id = "k_default", text = "For the Charred Vale, mostly, where the Bloodfuries keep the druids from planting. He'll tell you himself, gently, and then he'll send you somewhere dreadful." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    roads = {
      lines = {
        { id = "r_default", text = "Teloren keeps the hippogryphs here on the peak, and they'll take you to Auberdine, Astranaar or Nijel's Point. Otherwise it's the long walk down past Windshear Crag, and I wouldn't do it after dark." },
      },
      choices = {
        { text = "What's wrong with the road after dark?", next = "dark" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dark = {
      lines = {
        { id = "d_default", text = "Goblin camps at Windshear Crag and spiders in the canyons, and none of them keep an innkeeper's hours. Sleep here, and go down in the morning light." },
      },
      choices = { { text = "Sound advice.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } } },
    },
    elune = {
      lines = {
        { id = "e_default", text = "I ask her to guide my guests' dreams, that's all; I'm no priestess. If your Light gives a tired traveller a good night's sleep, then I think she and it would get along." },
      },
      choices = {
        { text = "I think they would.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep the inn on the peak. There isn't much more to it than that, and I like it that way." } },
    advice = { { id = "tp_ad", text = "You look worn through. Rest under a roof tonight, and let Elune see to your dreams." } },
    _none = { { id = "tp_none", text = "Ask the Keeper. He's lived here longer than the trees." } },
  },
}
