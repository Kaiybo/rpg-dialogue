-- Brill's other residents: Deathguard Burgess (Proof of Demise), the Gallows' End trainers
-- (Dark Cleric Beryl, Cain Firesong, Marion Call), the riding trainer Velma Warnam, the
-- herbalist Faruza, and the shopkeepers Mrs. Winters and Abigail Shiel.
-- Voices: bibles/brill_folk.md
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Deathguard Burgess
---------------------------------------------------------------------------
P:NPC {
  key = "burgess", id = TODO_NPC("Deathguard Burgess"), name = "Deathguard Burgess",
  bible = "bibles/brill_folk.md", role = "questgiver", tier = "quest",
  communities = { "brill" }, temper = { "proud", "sharp" }, values = { "loyal", "zealous" },
  notices = { "race", "kit" },

  impression = {
    first = "He writes down the names of anyone who doesn't praise Varimathras.",
    third = "{name} met Deathguard Burgess, who collects Scarlet insignia rings in Brill as proof of loyalty to the Dark Lady.",
  },

  greetings = {
    { id = "g_default", text = "Stand straight when you pass the town hall, {class}. The Dark Lady's lieutenant has eyes in Brill, and I am one pair of them." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. I hope your pockets clink, because I've an empty box waiting for Scarlet rings." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the Crusade spent every day of it marching about in our fields. I trust you've been killing some of them somewhere else." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "One of the Warchief's living folk, in Brill. The Crusade hates you very nearly as much as it hates us, so you'll find plenty to do here." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The zealots have chewed your armor half to pieces. Get it mended before you go back out, because they won't stop at the armor next time." },
  },

  start = "hello",
  nodes = {
    dd_rothide = {
      lines = { { id = "dd_rothide_default", text = "That's because they are starving dogs. They came for the graves when the plague emptied the farms, and they've a taste for the dead now, so they'll not learn any lesson but the blade." } },
      choices = {
        { text = "They're vermin. I'll keep killing them until they stop coming.", next = "BACK", reply = "Good. That's the only treaty a gnoll understands, and Brill can't afford to offer another.", fx = { align = { light = -1 } } },
        { text = "They're only hungry. The plague took their game too.", next = "BACK", reply = "Hungry or not, they dig up our dead. Pity them if you must, but do it after they're buried.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Deathguard Burgess, at the Dark Lady's service and Lord Varimathras's. Brill stands because the Deathguard stands, and the Deathguard stands because we prove our loyalty every day, in Scarlet blood." },
        { id = "h_war", when = { questDone = TODO_QUEST("At War With The Scarlet Crusade") },
          text = "Executor Zygand tells me you've already been out killing Scarlet Crusaders, and he was pleased, which he rarely is. The Executor counts heads, though, and I count rings, so I have more work for you." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Proof of Demise") },
          text = "Ten Scarlet Insignia Rings, {class}, taken from ten Crusaders. A zealot's word is worth nothing, so his jewelry will have to speak for him." },
        { id = "h_done", when = { questDone = TODO_QUEST("Proof of Demise") },
          text = "Your rings went down to the Undercity in a sealed box, and I'm told Lord Varimathras looked at each one himself. You've been noticed, which is an honor or a warning, depending entirely on how you go on serving." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren, all the way from the Warchief's plains to my town hall. I'm told your people honor the living and the dead alike, which must make Tirisfal a very confusing place for you." },
        { id = "h_dd_rothide", tags = { "news" }, when = { killed = { name = "Rot Hide", min = 20 } },
          text = "The Rot Hide gnolls have gone quiet along the north road, and my patrols are coming back with fewer bites in them. Somebody's been thinning the pack, and I'm told it's you." },
      },
      again = {
        { id = "h_again", text = "Something else? Speak up, I've a road to watch." },
        { id = "h_again2", text = "Go on, then. Loyalty never minds a question, so long as it's the right one." },
      },
      choices = {
        { text = "What work do you have for me?", next = "quest" },
        { text = "Who is Lord Varimathras?", next = "varim" },
        { text = "Why does the Crusade hate the Forsaken so much?", next = "crusade" },
        { text = "What's it like keeping watch in Brill?", next = "watch" },
        { text = "Did you serve Lordaeron in life, Burgess?", next = "past", when = { race = "Scourge" } },
        { text = "Do the Forsaken hate all the living, Burgess?", next = "xliving", when = { race = { "Tauren", "Orc", "Troll" } } },
        { text = "For the Dark Lady.", next = "END", fx = { affinity = 1, standing = { brill = 1 } } },
        { text = "The Rot Hides fight like starving dogs.", next = "dd_rothide", when = { killed = { name = "Rot Hide", min = 20 } } },
      },
    },

    -- Proof of Demise
    quest = {
      lines = {
        { id = "q_default", text = "Executor Zygand has the fields and I have the proof. Bring me ten Scarlet Insignia Rings from the Crusaders who camp across Tirisfal, and your name will go down to the Undercity with them as one who serves the Dark Lady properly." },
        { id = "q_done", when = { questDone = TODO_QUEST("Proof of Demise") }, text = "You've given me your proof already, and it was well received. The Crusade hasn't run short of rings, though, so if you're in the fields anyway, keep cutting." },
      },
      choices = {
        { text = "Why rings, and not heads?", next = "quest_rings" },
        { text = "Where will I find the Crusaders?", next = "quest_where" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    quest_rings = {
      big = true,
      lines = { { id = "qr_default", text = "Heads rot, even for us, and they're awkward to carry down the stairs into the Undercity. A ring bears the Crusade's mark and fits in a box, and they wear them as a promise to their Light, which makes taking them all the sweeter." } },
      choices = {
        { text = "Kill them cleanly. Mocking their faith is beneath us.", next = "BACK", reply = "Beneath us, is it? The Crusade burns our people alive and calls it mercy, and you'd have me spare their feelings. Bring me the rings and keep your scruples to yourself.", fx = { align = { light = 1 } } },
        { text = "Good. Let them see their Light fail them.", next = "BACK", reply = "Exactly that, and I hope they feel it right to the end. Every ring in that box is one fewer prayer going up from the Scarlet Monastery.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    quest_where = {
      lines = { { id = "qw_default", text = "Solliden Farmstead to the west is crawling with them, and their watch posts line the road north toward the Monastery. Start at the farmstead, because the young ones there are careless and their rings come off easily." } },
      choices = {
        { text = "And the Monastery itself?", next = "quest_monastery" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quest_monastery = {
      lines = { { id = "qm_default", text = "Leave the Monastery for when you're older and harder, because its halls are full of zealots who've done nothing but train and pray for years. The ones at the farmstead will do for now, and there are more than enough of them." } },
      choices = { { text = "The farmstead first, then. Let me ask something else.", next = "BACK" } },
    },

    -- Varimathras
    varim = {
      lines = { { id = "v_default", text = "Lord Varimathras is the Dark Lady's lieutenant, and he sees to it that our war on the Crusade is waged properly. He's no Forsaken, being a demon of the old sort, but he serves her, and that's the only question that matters in Brill." } },
      choices = {
        { text = "A demon, serving the Forsaken? Can he be trusted?", next = "varim_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    varim_trust = {
      big = true,
      lines = { { id = "vt_default", text = "The Dark Lady trusts him, and I trust the Dark Lady, so the question never troubles me for long. Some of the deathguards mutter about it in the Gallows' End, and I write their names down, purely out of habit." } },
      choices = {
        { text = "The Dark Lady's judgment is good enough for me.", next = "BACK", reply = "Then you'll go far in the Dark Lady's service, and you'll never find your name in my book. Varimathras serves her, and that is the whole of what we need to know.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd keep a close eye on any demon, lieutenant or not.", next = "BACK", reply = "Careful, now, because that's the sort of thing the deathguards mutter in the Gallows' End. I'll not write your name down, this once, but I'd keep that opinion quieter.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "You write down their names?", next = "varim_names" },
      },
    },
    varim_names = {
      lines = { { id = "vn_default", text = "Only so I remember who to watch, {class}. In Brill we say our loyalty aloud and often, and the ones who say it quietly get noticed, by me if by nobody else." } },
      choices = {
        { text = "I'll be sure to say it loudly, then.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The Crusade
    crusade = {
      lines = { { id = "c_default", text = "They were Lordaeron's own once: soldiers, priests and farmers' sons who watched the plague take their kin and decided the cure was fire. Now they burn anything that walks without a heartbeat, and they'd burn Brill to its foundations if the Deathguard let them." } },
      choices = {
        { text = "Some of them must have been your neighbors.", next = "crusade_kin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crusade_kin = {
      lines = { { id = "ck_default", text = "One of them was my brother-in-law, if the face I saw at Solliden was his, though I didn't stop to ask. He called me an abomination and loosed an arrow at me, and I took his ring, so I'd say the family accounts are settled." } },
      choices = {
        { text = "That's a hard thing to carry, Burgess.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Brill
    watch = {
      lines = { { id = "w_default", text = "Brill is quiet by day and quieter at night, apart from the bats and Gordo the abomination dragging his feet past the tavern. The trouble always comes in from the fields, so I stand by the town hall and watch the road, and I send people like you to do the walking." } },
      choices = {
        { text = "Who else should I know in Brill?", next = "watch_town" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch_town = {
      lines = { { id = "wt_default", text = "Magistrate Sevren runs the town, Executor Zygand runs the war, and the apothecaries in the hall run experiments I don't ask about. Renee keeps the Gallows' End, and if you want to know what Brill really thinks, buy a drink there and listen." } },
      choices = { { text = "I'll listen, then. Let me ask about something else.", next = "BACK" } },
    },

    -- Forsaken only
    past = {
      big = true,
      lines = { { id = "p_default", text = "I stood on a wall in Lordaeron's army, though I couldn't tell you which wall or which year, since the plague took that along with my heartbeat. I remember the Dark Lady's voice when she freed me, and I find that's all the past I need." } },
      choices = {
        { text = "She gave us everything. I'll serve her the same way.", next = "BACK", reply = "Then we're of one mind, and you'll find no truer purpose in Lordaeron. Serve her well and the past can rot as it likes.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I'd rather remember who I was. All of it.", next = "BACK", reply = "All of it? Then I hope you find more pleasant memories than I did. Most of mine ended on a wall with the Scourge coming over it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- The Warchief's people
    xliving = {
      lines = { { id = "xl_default", text = "Only the ones pointing arrows at us, and your people seem to be the exception. I respect the Warchief's bargain with the Dark Lady, and I'll respect you, so long as you bring me rings rather than sermons." } },
      choices = { { text = "Rings, not sermons, then. What else should I know?", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "That's no question for a deathguard. Ask the Magistrate, or ask Renee, who hears more than he does." } },
  },
}

---------------------------------------------------------------------------
-- Velma Warnam
---------------------------------------------------------------------------
P:NPC {
  key = "velma", id = TODO_NPC("Velma Warnam"), name = "Velma Warnam", title = "Riding Trainer",
  bible = "bibles/brill_folk.md", role = "trainer", tier = "service",
  communities = { "brill" }, temper = { "brisk" }, values = { "practical", "kind" },
  notices = { "mount" },

  impression = {
    first = "She says a dead horse fears nothing, which is exactly the trouble.",
    third = "{name} met Velma Warnam, who teaches riding in Brill.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again, and sitting straight in the saddle now. The horses have noticed, and they're glad to see you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Mind the hooves, take your lesson, and try not to frighten the beasts this time." },
    { id = "g_default", text = "Mind the hooves. They don't kick, but they don't look where they step either." },
    { id = "g_mounted", when = { mounted = true }, text = "Sitting straighter than you did, I see. Your horse has noticed, even if you haven't." },
  },

  notice = {
    { id = "n_mounted", cat = "mount", when = { mounted = true },
      text = "Keep your heels down and your will up, and that beast will carry you to Orgrimmar and back without a single complaint." },
  },

  start = "hello",
  nodes = {
    w3_fallen = {
      lines = {
        { id = "w3_fallen_1", text = "Plenty, {class}, and most of them stood up again, which is the advantage of teaching the dead. The worst was a mage who tried to teleport home at a full gallop and arrived in the Undercity without the horse, which carried on to the Bulwark on its own." },
      },
      choices = {
        { text = "Did you get the horse back?", next = "w3_back" },
        { text = "Falling's the first lesson, really.", next = "BACK", reply = "It's the lesson everyone learns whether I teach it or not. I just try to make sure they learn it on soft ground." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_back = {
      lines = {
        { id = "w3_back_1", text = "A Deathguard rode it back three days later, very pleased with himself, and Zachariah charged the mage for the inconvenience. The horse stood at the field gate for an hour after, as if it had enjoyed the trip and wanted another." },
      },
      choices = {
        { text = "Perhaps it did. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Velma Warnam. I teach the riding of the dead horses that Zachariah Post sells, which is nothing like riding the live sort, and I'll thank you not to tell me how your uncle did it." },
        { id = "h_ready", when = { minLevel = 40 }, text = "You're seasoned enough to sit a horse now, I think, and the road to the Bulwark is a long walk on dead feet. Shall we begin?" },
        { id = "h_young", when = { maxLevel = 39 }, text = "You're young yet for a saddle, {class}. Come back when you've seen more of the world, and the horses will still be here, since they don't age either." },
      },
      again = {
        { id = "h_again", text = "Something else? The horses can wait. They're very good at it, better than you." },
      },
      choices = {
        { text = "A rider should treat a dead horse as well as a living one.", next = "BACK", reply = "Exactly. They can't feel it, but they know it, in their way, and they'll carry you further for it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A dead horse feels nothing. Drive it until its bones crack.", next = "BACK", reply = "Then you'll walk the rest of the way, and you'll deserve to. I don't teach riders like that.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Teach me to ride.", next = "BUSINESS", when = { minLevel = 40 } },
        { text = "How is a dead horse different?", next = "horses" },
        { text = "Who rides them besides the Forsaken?", next = "others" },
        { text = "What's the first lesson in the saddle?", next = "lesson" },
        { text = "Tell me about Zachariah Post.", next = "zach" },
        { text = "Did you ride before you died, Velma?", next = "xlife", when = { race = "Scourge" } },
        { text = "Will a dead horse even carry one of the living?", next = "xliving", when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "Has anyone ever fallen off one of your horses?", next = "w3_fallen" },
        { text = "I'll go.", next = "END" },
      },
    },
    horses = {
      lines = { { id = "ho_default", text = "A living horse is frightened of everything and a dead one is frightened of nothing, which sounds better than it is, because it'll walk you straight off a cliff if you let it. You don't steer with kindness, you steer with your will, and the horse always knows which you're using." } },
      choices = {
        { text = "Do they remember being alive?", next = "horses2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    horses2 = {
      lines = { { id = "ho2_default", text = "Sometimes one of them will stop at a field gate and just stand there, as if it's waiting to be let in for the night. I don't push them on when they do, though Zachariah says I'm sentimental and that bones don't remember pasture." } },
      choices = {
        { text = "Let them stand. They've earned that much.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      big = true,
      lines = { { id = "o_default", text = "The Forsaken, mostly, and the odd orc or troll who has done enough for the Undercity that the Dark Lady counts them a friend. Some of the living don't care for the smell or the clatter, and I tell them the horse feels the same about them." } },
      choices = {
        { text = "Only the Undercity's proven friends should ride them.", next = "BACK", reply = "Proven friends, aye, and the Dark Lady decides who those are. Still, I'm glad you understand that a skeletal horse isn't just a pony with fewer manners.", fx = { align = { order = 1 } } },
        { text = "A horse is a horse. Sell to anyone with coin.", next = "BACK", reply = "Coin's coin, I'll grant you, but the Dark Lady decides who rides her horses. I'll sell to whoever she says and let the rest grumble.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lesson = {
      lines = { { id = "le_default", text = "Getting on, which sounds simple until the horse decides it's a statue and you're a fly. You put your foot in the stirrup and your will in the reins at the same moment, and if either one's late, you'll be sitting in the mud of Brill's main road." } },
      choices = {
        { text = "And the second lesson?", next = "lesson2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lesson2 = {
      lines = { { id = "l2_default", text = "Stopping, which is harder, because a dead horse has no reason to want to. You think of a wall in front of it, a real one you remember, and the beast believes you, and that's why the old soldiers make the best riders." } },
      choices = {
        { text = "Why the old soldiers?", next = "lesson3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lesson3 = {
      lines = { { id = "l3_default", text = "Because they remember walls better than anyone, {class}, having stood on so many of them. The farmers think of fences and the horse jumps them, which is a lesson of its own, and a muddy one." } },
      choices = {
        { text = "I'll think of a very tall wall.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    zach = {
      lines = { { id = "za_default", text = "Zachariah sells the horses and I teach the riding, and he thinks that makes him the important one. He's a fair dealer and a poor rider, and he'd tell you the first and deny the second." } },
      choices = {
        { text = "Where does he get dead horses?", next = "zach2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    zach2 = {
      lines = { { id = "z2_default", text = "From the same place we all came from, the fields and stables the plague emptied, raised by the Undercity's people and sent up to Brill. I don't ask whose horse each one was, though now and then one of them knows the way to a farm that isn't there anymore." } },
      choices = {
        { text = "That's a sad thing, Velma.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlife = {
      lines = { { id = "xl_default", text = "Every day, out to the fields north of here, on a grey mare who wouldn't cross running water for love or apples. I don't know what became of her, and I've stopped looking for her face among Zachariah's stock, mostly." } },
      choices = {
        { text = "Some things are better not found.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xliving = {
      lines = { { id = "xv_default", text = "It'll carry you without a complaint, though it won't warm to you, since it doesn't warm to anyone. The trouble is your own beast's nose, because a living horse or wolf smells the grave on these and wants nothing to do with them." } },
      choices = {
        { text = "Then I'll keep my own mount. Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    forsaken = { { id = "tp_forsaken", text = "We rose with nothing, and the Dark Lady gave us back a town, a cause and, in time, a horse apiece for those who earned one. That's more than most kings managed." } },
    lordaeron = { { id = "tp_lordaeron", text = "Lordaeron had the finest horses in the north once, and its knights rode them proudly. I teach their bones now, and I like to think the bones remember the roads." } },
    _none = { { id = "tp_none", text = "I know horses, and very little else. Ask Zachariah Post, or ask Magistrate Sevren." } },
  },
}
