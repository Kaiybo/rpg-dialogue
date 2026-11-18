-- Cenarion Hold's war desk and a stranger at its edge: Windcaller Kaldon (assigns field duty and takes badges),
-- Dirk Thunderwood (Ravenholdt's poison man), and Zannok Hidepiercer at Valor's Rest (leatherworking supplies).
-- Voice: bibles/hold_war.md
local P = RPGDialogueAPI:Pack("rpgd.silithus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Windcaller Kaldon
---------------------------------------------------------------------------
P:NPC {
  key = "kaldon", id = TODO_NPC("Windcaller Kaldon"), name = "Windcaller Kaldon",
  bible = "bibles/hold_war.md", role = "questgiver", tier = "quest",
  communities = { "cenarion_hold" }, temper = { "formal", "steady" }, values = { "duty", "careful" },
  notices = { "badges" },

  impression = {
    first = "Windcaller Kaldon assigns the newcomers at Cenarion Hold their field duty and keeps a careful tally of every badge they bring back. He talks like a quartermaster and thinks like a general.",
    third = "{name} met Windcaller Kaldon, the night elf who hands out field duty at Cenarion Hold.",
  },

  greetings = {
    { id = "g_default", text = "Another pair of hands for the war. Good, I've a list of places to put them." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and in one piece, which is more than my lists usually manage to say." },
    { id = "g_duty", when = { questActive = TODO_QUEST("Field Duty") }, text = "Your papers won't sign themselves. Report to the camp, do the work, and bring them back to me." },
    { id = "g_done", when = { questDone = TODO_QUEST("Field Duty") }, text = "You've done your field duty, so now you're on my real lists. I'm afraid that's not a reward." },
  },

  notice = {
    { id = "n_badges", cat = "badges", when = { reputation = { faction = "Cenarion Circle", min = "honored" } },
      text = "The Circle speaks well of you, and I've your name in my ledger more times than most. Keep it up; I'll make note of anyone who goes beyond the call." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Windcaller Kaldon. Before I give you any real work, you'll do your share of field duty like everyone else who comes to Cenarion Hold, because I need to know what you can do before I send you anywhere that matters." },
        { id = "h_alliance", when = { faction = "Alliance", questBefore = TODO_QUEST("Field Duty") },
          text = "You're Alliance, so you'll report to Captain Blackanvil's Ironforge Brigade outside Hive'Zora, or to his lieutenant, Janela Stouthammer. Get your papers signed there and come back to me, and please stay well away from the Orgrimmar Legion while you do it." },
        { id = "h_horde", when = { faction = "Horde", questBefore = TODO_QUEST("Field Duty") },
          text = "You're Horde, so you'll report to Krug Skullsplit and the Orgrimmar Legion's camp near Hive'Regal. Get your papers signed and come back to me, and do keep away from the dwarves while you're out there." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Field Duty"), days = 3 } },
          text = "Signed papers, and the captain's mark is genuine. I've prepared a set of tasks that should make good use of your skills, and you can get new briefings from the camp whenever you need them." },
      },
      again = {
        { id = "h_again", text = "What else? I've a dozen reports to read before the sun gets any higher." },
        { id = "h_again2", text = "Ask quickly. The war doesn't pause for questions, though I do." },
      },
      choices = {
        { text = "What is field duty?", next = "duty" },
        { text = "Why keep the Alliance and Horde apart?", next = "apart" },
        { text = "What are the Cenarion badges?", next = "badges" },
        { text = "Who are you fighting, exactly?", next = "enemy" },
        { text = "Where do I get gear for all this?", next = "gear", when = { questDone = TODO_QUEST("Field Duty") } },
        { text = "Leave me out of your lists.", next = "END" },
      },
    },

    duty = {
      lines = { { id = "du_default", text = "Work at the front: fighting, carrying, healing, whatever the camp captains need. Once you've done enough, they sign your papers, and I give you real assignments: combat, tactics or logistics, each with its own briefings and its own badges." } },
      choices = {
        { text = "Which assignment matters most?", next = "duty_which" },
        { text = "Something else.", next = "BACK" },
      },
    },
    duty_which = {
      big = true,
      lines = { { id = "dw_default", text = "The soldiers always say combat, and the quartermasters always say logistics, and the truth is that a war is lost the moment either one runs out. Still, I've seen more brave fools than good haulers come through this hold." } },
      choices = {
        { text = "Then I'll haul. Somebody has to keep the line fed.", next = "BACK", reply = "You have the patience of the old Sentinels. I carried water for the druids for longer than you have been alive before they let me call the winds, and I don't regret a single trip.", fx = { align = { order = 1 } } },
        { text = "Hauling is for others. Send me where the fighting is.", next = "BACK", reply = "Then I will send you, but remember that a soldier with no water is a soldier lying in the sand, and someone has to carry it to you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    apart = {
      lines = { { id = "ap_default", text = "Because they hate each other more than they hate the silithid, and I can't fight a war with two armies busy watching each other's backs. Separate camps, separate captains, and one Circle in the middle trying to keep them both pointed at the hives." } },
      choices = {
        { text = "Will they ever fight together?", next = "apart_together" },
        { text = "Something else.", next = "BACK" },
      },
    },
    apart_together = {
      lines = { { id = "at_default", text = "If what's under those hives is as bad as the Circle fears, they'll have to. I'd like to see it, if only once, because it will mean the world finally noticed what's happening in this desert." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "ahn_qiraj" } } } },
    },

    badges = {
      lines = { { id = "ba_default", text = "Combat, Tactical and Logistics badges, earned by completing the camp captains' briefings. Bring me one of each and I'll note your allegiance to the Circle, and Vargus will trade gear for the rest, because the Circle does reward those who serve it." } },
      choices = {
        { text = "And if I don't need gear?", next = "badges_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    badges_why = {
      lines = { { id = "bw_default", text = "Then bring them anyway. Even if you've no need for what we offer, those badges mark trust between us, and I'll make due note of anyone whose service goes beyond the call of duty." } },
      choices = { { text = "I'll bring them.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },

    enemy = {
      lines = { { id = "en_default", text = "The silithid, in their hives: Hive'Zora, Hive'Ashi, Hive'Regal. The Twilight's Hammer, in their camps and their strange robes. And underneath all of it, I'd bet my staff, whatever is waking up inside the walls of Ahn'Qiraj." } },
      choices = { { text = "That's a lot of enemies. Something else.", next = "BACK", fx = { learn = { "silithid_hives", "twilights_hammer" } } } },
    },

    gear = {
      lines = { { id = "ge_default", text = "Talk to Vargus, the blacksmith here at the hold, and show him whatever badges you've earned along the way. He'll give you gear to match your commitment, and you'll find he takes commitment very seriously." } },
      choices = { { text = "I'll find Vargus. Something else, though.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Field duty, briefings, badges, and which camp you belong in." } },
    cenarion_circle = { { id = "tp_cc", text = "The Circle holds Silithus because nobody else would. I keep its ledgers." } },
    silithid_hives = { { id = "tp_hives", text = "Three hives that I know of, and more under the sand that I don't." } },
    _none = { { id = "tp_none", text = "That's not on any of my lists. Ask someone else." } },
  },
}

---------------------------------------------------------------------------
-- Dirk Thunderwood
---------------------------------------------------------------------------
P:NPC {
  key = "dirk_thunderwood", id = TODO_NPC("Dirk Thunderwood"), name = "Dirk Thunderwood",
  bible = "bibles/hold_war.md", role = "questgiver", tier = "quest",
  communities = { "cenarion_hold" }, temper = { "sly", "jovial" }, values = { "cunning", "loyal" },
  notices = { "rogue", "poisoned" },

  impression = {
    first = "Dirk Thunderwood is a dwarf from Ravenholdt who runs the manor's poison work with his brother, and he's come to Silithus for the venom. He's friendly in a way that makes you count your fingers afterwards.",
    third = "{name} met Dirk Thunderwood, a Ravenholdt dwarf hunting rare venoms at Cenarion Hold.",
  },

  greetings = {
    { id = "g_default", text = "Hullo there. Don't touch the vials on the left, and I mean that kindly." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Ah, one of ours, or near enough. I can always tell by the way you look at my pockets." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Still breathing, which is how I like my customers." },
  },

  notice = {
    { id = "n_rogue", cat = "rogue", when = { class = "ROGUE" },
      text = "You're carrying blades the way a Ravenholdt hand carries them, tucked and quiet. Somebody taught you properly." },
    { id = "n_poison", cat = "poisoned", when = { debuffType = "Poison" },
      text = "You've a touch of venom in you, friend, and I can see it in your eyes. Scorpid, if I'm any judge, so go and see a healer before it sets." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Dirk Thunderwood, of Ravenholdt Manor, at your service. My brother and I run the manor's poison work, and Lord Ravenholdt sent me down here to find a new compound, one made from the venom of the nastiest beasts in Zul'Gurub and the Ruins of Ahn'Qiraj." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "A rogue! Then I'll speak plainly. I need two venom sacs, from Venoxis in Zul'Gurub and from Kurinnaxx in the Ruins of Ahn'Qiraj, and the manor will be eternally grateful, which in our trade is worth a good deal." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Perfect Poison"), days = 3 } },
          text = "Both sacs, and still fresh! Ravenholdt thanks you, hero. I'll be up half the night working with these, and the other half writing to my brother about how clever I am." },
      },
      again = {
        { id = "h_again", text = "What else? Mind the vials, mind the vials." },
        { id = "h_again2", text = "Go on, ask. I've nothing but time and venom." },
      },
      choices = {
        { text = "What is Ravenholdt?", next = "manor" },
        { text = "Why these two venoms?", next = "venoms" },
        { text = "Tell me about your brother.", next = "brother" },
        { text = "Isn't poison a coward's weapon?", next = "coward" },
        { text = "Does Lord Ravenholdt know my name?", next = "ravenholdt", when = { class = "ROGUE" } },
        { text = "I'll leave you to your vials.", next = "END" },
      },
    },

    manor = {
      lines = { { id = "ma_default", text = "A manor in the hills of Alterac, home to the best rogues in the world, and nobody finds it unless we want them to. We take the work that needs doing quietly, and we don't ask anyone which flag they fly." } },
      choices = {
        { text = "How does someone get invited?", next = "manor_invite" },
        { text = "Something else.", next = "BACK" },
      },
    },
    manor_invite = {
      lines = { { id = "mi_default", text = "By being useful, and by being noticed while being useful, which is harder than it sounds in our line of work. Help me with my venoms and I'll mention you in my letters, and that's as much as I can promise." } },
      choices = { { text = "That's enough for me.", next = "BACK", fx = { trait = { discreet = 1 } } } },
    },

    venoms = {
      lines = { { id = "ve_default", text = "Venoxis is a troll high priest in Zul'Gurub who's turned himself into something like a great serpent, and Kurinnaxx is a silithid brute guarding the Ruins of Ahn'Qiraj. Both of them carry venom that ought to be impossible, and impossible is exactly what the manor wants." } },
      choices = {
        { text = "What will you make from them?", next = "venoms_make" },
        { text = "Something else.", next = "BACK" },
      },
    },
    venoms_make = {
      lines = { { id = "vm_default", text = "That's between me, my brother and the vials, friend. I'll tell you this much: the result will be something no healer in Azeroth has a cure for, and Lord Ravenholdt will be very particular about who gets to use it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },

    brother = {
      lines = { { id = "br_default", text = "Smudge, back at the manor, who handles the everyday poisons while I'm off chasing the rare ones. He says I took this job to get out of the cold, and he's not entirely wrong, though I'd forgotten how much sand gets into everything." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    coward = {
      big = true,
      lines = { { id = "co_default", text = "A coward's weapon? Friend, a coward runs away. A poisoner walks up close enough to be seen, does the work, and walks away again, and I'd like to see a knight try that. Still, plenty of honest folk think the way you do." } },
      choices = {
        { text = "They're right. Face your enemy and fight fair.", next = "coward_end", fx = { align = { honor = 1 } } },
        { text = "Winning matters more than fairness. Poison wins.", next = "coward_end", fx = { align = { honor = -1 } } },
        { text = "What do you think, Dirk?", next = "coward_end" },
      },
    },
    coward_end = {
      lines = { { id = "ce_default", text = "I think a silithid doesn't care how it dies, and neither does a troll god's priest. Save your fair fights for people who'll return the favor, and use the vials on everything else." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    ravenholdt = {
      lines = { { id = "rv_default", text = "If you've been to the manor and done the work, then aye, someone there knows it, and someone else has written it down. Whether his lordship himself has read the page, I couldn't say, but bring me those sacs and I'll make sure he does." } },
      choices = { { text = "I'll bring them.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Venoms, poisons, antidotes, and the manor, though I'll only talk about three of those." } },
    background = { { id = "tp_bg", text = "Ravenholdt dwarf, poison man, older brother. Pleased to meet you.", next = "brother" } },
    advice = { { id = "tp_ad", text = "Never lick your blade, however clean it looks. I've buried two apprentices who did." } },
    silithid = { { id = "tp_sil", text = "Lovely venom, horrible manners." } },
    _none = { { id = "tp_none", text = "Couldn't say, friend, and wouldn't if I could." } },
  },
}

---------------------------------------------------------------------------
-- Zannok Hidepiercer
---------------------------------------------------------------------------
P:NPC {
  key = "zannok", id = TODO_NPC("Zannok Hidepiercer"), name = "Zannok Hidepiercer", title = "Leatherworking Supplies",
  bible = "bibles/hold_war.md", role = "vendor", tier = "service",
  communities = { "valors_rest" }, temper = { "dry", "weary" }, values = { "craft", "practical" },
  notices = { "leather" },

  impression = {
    first = "Zannok Hidepiercer sells leatherworking supplies at Valor's Rest, the bleakest corner of Silithus. He works with the desert's hides and complains about them, both with equal patience.",
    third = "{name} met Zannok Hidepiercer, who sells leatherworking supplies at Valor's Rest.",
  },

  greetings = {
    { id = "g_default", text = "Salt, thread, dye. Silithus takes the rest, so buy what you can carry." },
    { id = "g_back", when = { metBefore = true }, text = "Back at Valor's Rest. Nobody comes here twice by accident." },
  },

  notice = {
    { id = "n_leather", cat = "leather", when = { profession = { "Leatherworking", "Skinning" } },
      text = "A skinner, by your knife. Silithid chitin will blunt it in a day, so carry a whetstone." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Zannok Hidepiercer, and I sell leatherworking supplies at Valor's Rest. Hardly anyone comes to the southeast corner of Silithus unless they've a reason, so if you're here, you're probably skinning something that bites." },
        { id = "h_leather", when = { profession = "Leatherworking" },
          text = "A leatherworker! Then you'll know what this heat does to a hide. Dry it fast or it rots, dry it too fast and it cracks, and the sand gets into the grain either way." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "Ishnu-alah, though Elune seems a long way off out here. I'm Zannok Hidepiercer, and I sell leatherworking supplies to whoever the desert hasn't finished with yet, which today, it seems, is you." },
      },
      again = {
        { id = "h_again", text = "Something else? The wind will pick up soon." },
        { id = "h_again2", text = "Ask, then. Sand won't sell itself, and neither will salt." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Why set up shop at Valor's Rest?", next = "rest" },
        { text = "What hides does the desert give?", next = "hides" },
        { text = "You don't seem to like it here much.", next = "weary" },
        { text = "Any advice on working silithid plate?", next = "plate", when = { profession = { "Leatherworking", "Skinning" } } },
        { text = "Who else keeps this place?", next = "neighbors" },
        { text = "Goodbye.", next = "END" },
      },
    },
    rest = {
      lines = { { id = "re_default", text = "Because the hunters pass through here on their way to the southern hives, and hunters need thread and salt. It's named for the soldiers buried here, and it's quiet, which suits me, though the quiet is not always a friendly one." } },
      choices = {
        { text = "Who were the soldiers buried here?", next = "rest_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rest_dead = {
      lines = { { id = "rd_default", text = "Kaldorei, mostly, from the war against the swarm a thousand years ago, when the bugs came pouring out of Ahn'Qiraj and nearly overran us. Our people won, barely, and walled the insects in, and left the dead here because there was no one left to carry them home." } },
      choices = {
        { text = "And the quiet that isn't friendly?", next = "rest_quiet" },
        { text = "Something else.", next = "BACK", fx = { learn = { "ahn_qiraj" } } },
      },
    },
    rest_quiet = {
      lines = { { id = "rq_default", text = "Some nights the wind stops all at once, and the sand stops hissing, and you can hear the hives breathing under the ground, or I think I can. I don't sleep on those nights. I stitch, because a needle doesn't care what's underneath it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "silithid" } } } },
    },
    hides = {
      big = true,
      lines = { { id = "hi_default", text = "Scorpid shell, sand worm hide if you're very brave, and the odd silithid plate, which won't take a stitch to save your life. Some of the Circle druids don't like me buying from the hives at all. They say it only teaches hunters to go back for more." },
      },
      choices = {
        { text = "Hunt the hives dry. They'd do it to us.", next = "BACK", reply = "They would, and they do, so I'll not argue, but bring me hides with fewer holes in them, because the holes don't sell.", fx = { align = { light = -1 } } },
        { text = "The druids are right. Take only what you need.", next = "BACK", reply = "Maybe so, and I'll buy what I need and grumble about the rest, which is the only thing in Silithus I never run short of.", fx = { align = { light = 1 } } },
        { text = "Sand worm hide? How big are these worms?", next = "worms" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worms = {
      lines = { { id = "wo_default", text = "Big enough that you feel them before you see them, and by the time you see them you've usually made a poor decision. One hunter brought me a strip as long as this stall and wouldn't say how he got it, and his hands shook the whole time we haggled." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    weary = {
      lines = { { id = "we_default", text = "I don't, but I'm good at it, and that's what a craftsman learns to settle for. I worked hides in Ashenvale once, soft deer and saber pelts, and every so often I take one out of my pack just to remember what leather is supposed to feel like." } },
      choices = {
        { text = "Then why not go back to Ashenvale?", next = "weary_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    weary_why = {
      lines = { { id = "ww_default", text = "Because the Circle needed someone out here who knew which end of a hide is which, and nobody else said yes fast enough. I said yes because I was bored, and I've had a great many years since to regret being bored." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } } },
    },
    plate = {
      lines = { { id = "pl_default", text = "Don't stitch it, drill it, with a fine awl and patience, and soak the thread in oil so the edges don't saw through it. Better yet, sell the plate to the Hold and buy scorpid shell, which is honest material and doesn't argue with you." } },
      choices = {
        { text = "Who at the Hold buys it?", next = "plate_buy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plate_buy = {
      lines = { { id = "pb_default", text = "Vargus at the forge, for armour, and the Circle's quartermasters, who want to study it, though I've never seen what they learn. The goblins at the Hold buy anything, of course, but they pay in promises and charge in coin." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    neighbors = {
      lines = { { id = "ne_default", text = "Layo Starstrike tends the graves and talks to the dead more kindly than he talks to me, which is fair, since they complain less. Beyond him there's only the wind, and whatever the wind brings, which lately has been cultists in robes asking for directions." } },
      choices = {
        { text = "Cultists? What sort of cultists?", next = "cultists" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cultists = {
      lines = { { id = "cu_default", text = "Twilight's Hammer, the druids call them, humans and orcs and worse, all wearing the same robes and the same smile. One tried to buy rope from me last month, and I told him I was out, which was a lie, and I'd tell it again." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "twilights_hammer" } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Hides, salt, and the hunters who come through Valor's Rest." } },
    silithid = { { id = "tp_sil", text = "Hard shells, bad smell, and too many legs. Good for armour, if you can cut it, and you mostly can't." } },
    twilights_hammer = { { id = "tp_th", text = "I don't sell them rope. That's the whole of my policy on the Twilight's Hammer." } },
    _none = { { id = "tp_none", text = "Don't know. Ask the wind, it's been everywhere in this desert." } },
  },
}
