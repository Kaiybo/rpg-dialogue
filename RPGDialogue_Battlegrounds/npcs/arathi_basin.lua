-- Arathi Basin, inside the battleground: the soldiers who hold Trollbane Hall for the League of Arathor
-- and the Defiler's Den for the Forsaken. The 1.12 basin has no named NPCs inside, so these are
-- name-matched generic soldiers (TODO_NPC matches by name in game). The emissaries live in
-- RPGDialogue_World/emissaries/arathi_basin.lua; the supply officers (Samuel Hawke, Rutherford Twing)
-- in RPGDialogue_Arathi/npcs/more_folk.lua.
local P = RPGDialogueAPI:Pack("rpgd.battlegrounds")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- League of Arathor Elite: a Stromgarde-born veteran guarding Trollbane Hall.
P:NPC {
  key = "bg_ab_arathor_elite", id = TODO_NPC("League of Arathor Elite"), name = "League of Arathor Elite",
  role = "soldier", tier = "quest",
  communities = { "league_of_arathor" }, temper = { "proud", "steady" }, values = { "loyal", "dutiful" },
  notices = { "soldier", "reputation" },

  impression = {
    first = "A Stromgarde veteran who speaks of the basin as an inheritance, not a prize.",
    third = "{name} spoke with a League of Arathor elite guarding Trollbane Hall in Arathi Basin.",
  },

  greetings = {
    { id = "g_default", text = "Keep your blade up near the hall, {class}. The Defilers like to test the road from the Stables when they think we're all out at the flags." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and on your own feet, which is more than I can say for half the lads who rode out with you last time." },
    { id = "g_horde", when = { faction = "Horde" }, text = "You're a long way from the Den, and you'll find no welcome at Trollbane Hall. Say your piece quickly, Horde." },
    { id = "g_honored", when = { reputation = { faction = "League of Arathor", min = "honored" } }, text = "The Hall knows your name, friend, and so do the Defilers, I'd wager. Come in out of the wind a moment." },
  },

  notice = {
    { id = "n_human", cat = "soldier", when = { race = "Human", faction = "Alliance" },
      text = "Lordaeron blood or Stormwind, it makes no matter to me today. Every son and daughter of Arathor belongs in this valley." },
    { id = "n_exalted", cat = "reputation", when = { reputation = { faction = "League of Arathor", min = "exalted" } },
      text = "I've heard the officers say your name in the same breath as Trollbane's, and they don't say that lightly in this hall." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "This is Trollbane Hall, named for the kings of Stromgarde, and while I stand here no Forsaken sets foot inside it. Ask what you need to, then get out to the points where you're wanted." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf at the Hall! Your folk fought beside Thoras Trollbane's men in the Second War, and we haven't forgotten it. Ask what you need, friend." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "Kaldorei, this far into the old kingdom of men? I'm glad of you, though I'll wager these hills look young to your eyes. Ask what you need." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Whatever you've come for, you'll not have the Hall. Ask your questions and go back to your corpses in the Den." },
      },
      again = {
        { id = "h_again", text = "What else, then? The Defilers won't wait on us." },
        { id = "h_again2", text = "Go on, I'm listening, though I'm watching the road while I do it." },
      },
      choices = {
        { text = "Why is it called Trollbane Hall?", next = "hall" },
        { text = "What are we fighting for out there?", next = "points" },
        { text = "You don't think much of the Defilers.", next = "defilers" },
        { text = "I was raised in Lordaeron, before the Plague.", next = "lordaeron", when = { race = "Human" } },
        { text = "A paladin's place is at the front, not the Hall.", next = "paladin", when = { class = "PALADIN" } },
        { text = "For Arathor.", next = "END" },
      },
    },

    hall = {
      lines = {
        { id = "ha_default", text = "Thoras Trollbane was the last great king of Stromgarde, and his line goes back to Arathor itself, the first kingdom of men. We named the hall for him because a soldier ought to know whose land he's bleeding on." },
      },
      choices = {
        { text = "Is Stromgarde still standing?", next = "hall_strom" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hall_strom = {
      lines = {
        { id = "hs_default", text = "What's left of it, aye, though the Syndicate holds the lower city and the ogres prowl the hills behind it. The basin's fields and iron are how we'll take it back, which is why we fight so hard for a farm and a mill." },
      },
      choices = {
        { text = "Stromgarde should have stood with Lordaeron, not left the Alliance.", next = "hall_left", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Trollbane was right to leave. Terenas squandered good men.", next = "hall_right", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hall_left = {
      lines = {
        { id = "hl_default", text = "Plenty in Stormwind say so, and they weren't the ones paying for the internment camps out of their own harvests. Stromgarde kept its pride and paid for it, and I'll not apologize for either." },
      },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
    hall_right = {
      lines = {
        { id = "hr_default", text = "You've a good head on you, {class}. Terenas asked kings to feed orcs while Quel'Thalas burned, and Thoras told him no, and the whole north knows now who was right." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    points = {
      lines = {
        { id = "pt_default", text = "Five places that once fed and armed all of Arathor: the Stables, the Gold Mine, the Lumber Mill, the Blacksmith and the Farm. Hold them and the resources flow to the Hall, and the first side to gather two thousand carries the day." },
        { id = "pt_warrior", when = { class = "WARRIOR" },
          text = "Five points, warrior, and the one that matters most is the Blacksmith in the middle, because from there you can see every other flag. Plant yourself on it and don't let anyone shift you." },
      },
      choices = {
        { text = "The Stables are closest. That's where I'd start.", next = "points_st" },
        { text = "Which one do the Defilers want most?", next = "points_def" },
        { text = "Something else.", next = "BACK" },
      },
    },
    points_st = {
      lines = {
        { id = "ps_default", text = "Every fresh recruit says the same, and they're right, as far as it goes. The Stables are ours by morning most days, but a hall that only holds its doorstep loses the valley, so don't stop there." },
      },
      choices = {
        { text = "Where next, then?", next = "points_def" },
        { text = "Something else.", next = "BACK" },
      },
    },
    points_def = {
      big = true,
      lines = {
        { id = "pd_default", text = "The Farm, always the Farm, since it sits right under their Den and they can be on it before we're out of the saddle. I've seen their apothecaries walking the rows after they take it, and they aren't looking at the wheat." },
      },
      choices = {
        { text = "What are they looking for, then?", next = "defilers_graves" },
        { text = "Something else.", next = "BACK" },
      },
    },

    defilers = {
      lines = {
        { id = "df_default", text = "They're Forsaken, sent by their Dark Lady and led by a dreadlord, Varimathras, if the scouts have it right. Some of them were Arathi farmers once, and they come back to the same fields wearing their own graves." },
      },
      choices = {
        { text = "A dreadlord? Serving the Forsaken?", next = "defilers_dread" },
        { text = "They were our people once. Perhaps they can be again.", next = "defilers_pity", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Then we put them back in the ground for good.", next = "defilers_hate", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    defilers_dread = {
      lines = {
        { id = "dd_default", text = "So they say, though I'd sooner believe a demon serves itself and calls it loyalty. Whatever leash the Banshee Queen holds on him, I'd not want to be standing near it when it breaks." },
      },
      choices = {
        { text = "What else do the Defilers want here?", next = "defilers_graves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    defilers_pity = {
      lines = {
        { id = "dp_default", text = "The Light keep you soft-hearted if you can manage it out there, {class}. I watched one of them cut down a boy who'd called him uncle, and he never once looked back." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    defilers_hate = {
      lines = {
        { id = "dh_default", text = "Aye, and deep enough this time that nothing in Undercity can dig them out again. That's the only mercy I've got left for them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    defilers_graves = {
      lines = {
        { id = "dg_default", text = "The barrows, the old Arathorian graves under the fields, some older than Stormwind itself. Every time they hold the Farm for a day, we find another one opened and empty, and the emissary at the camp will tell you the same." },
      },
      choices = {
        { text = "I'll make sure they don't hold it a day.", next = "END" },
        { text = "Something else.", next = "BACK" },
      },
    },

    lordaeron = {
      lines = {
        { id = "lo_default", text = "Then you know what the Forsaken are better than any recruit from Goldshire. I had cousins in Hillsbrad, and when the Defilers come over the rise I look at every face, and I pray I don't know one." },
      },
      choices = {
        { text = "Have you ever recognized one?", next = "lordaeron_face" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lordaeron_face = {
      lines = {
        { id = "lf_default", text = "Once, at the Lumber Mill, a woman who'd sold apples on the Southshore road. She knew me too, I'd swear it, and she drew her bow all the same." },
      },
      choices = { { text = "I'm sorry. Something else.", next = "BACK" } },
    },

    paladin = {
      lines = {
        { id = "pa_default", text = "No argument from me, but the Light shines just as well on a man holding a door. The Defilers would love nothing better than to walk into an empty Hall while all the paladins are off chasing glory at the Mine." },
      },
      choices = { { text = "Point taken. Something else.", next = "BACK" } },
    },
  },
}

-- Defiler Elite: a Forsaken soldier guarding the Defiler's Den.
P:NPC {
  key = "bg_ab_defiler_elite", id = 15128, name = "Defiler Elite",
  role = "soldier", tier = "quest",
  communities = { "defilers" }, temper = { "cold", "contemptuous" }, values = { "loyal", "vengeful" },
  notices = { "soldier", "reputation" },

  impression = {
    first = "A Forsaken soldier who guards the Den as though the hills owe him a debt.",
    third = "{name} spoke with a Defiler elite guarding the Defiler's Den in Arathi Basin.",
  },

  greetings = {
    { id = "g_default", text = "Another body for the basin, {class}. Try to keep yours in one piece, since the apothecaries are busy enough." },
    { id = "g_back", when = { metBefore = true }, text = "Still breathing, or still walking, at any rate. Either will do for the Dark Lady's purposes." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "How bold of you, wandering up to the Den. I'd tell you to turn back, but I'd rather you kept coming so I could watch." },
    { id = "g_honored", when = { reputation = { faction = "The Defilers", min = "honored" } }, text = "Ah, one of the useful ones. The Den remembers its friends, which is more than the living can say." },
  },

  notice = {
    { id = "n_undead", cat = "soldier", when = { race = "Scourge" },
      text = "One of our own, and wearing it well. Did you know these fields, before? Many of us did." },
    { id = "n_exalted", cat = "reputation", when = { reputation = { faction = "The Defilers", min = "exalted" } },
      text = "Varimathras himself has heard your name, I'm told. I would not envy you that, but I'll salute it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "This is the Defiler's Den, and these hills belong to the Horde now, whatever the Stromgarde rabble in their hall would like to believe. State your business and spare me the speeches." },
        { id = "h_orc", when = { race = "Orc" },
          text = "An orc from Hammerfall, come to help us bury Stromgarde's last pride? Good, your people have more reason than most to hate those walls." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren, come all the way from the plains to stand among the dead. Your Earth Mother would not approve of what we take from this soil, I suspect, but you're welcome all the same." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "You've come a long way from Trollbane Hall to stand among the corpses. Speak, and then go back to your rotting kingdom." },
      },
      again = {
        { id = "h_again", text = "Something else? I have all the time in the world, as it happens." },
        { id = "h_again2", text = "Go on. The dead are patient listeners." },
      },
      choices = {
        { text = "Who commands the Defilers?", next = "command" },
        { text = "Your apothecaries keep digging near the Farm.", next = "graves" },
        { text = "What do you make of the League of Arathor?", next = "league" },
        { text = "I walked these hills before I died.", next = "before", when = { race = "Scourge" } },
        { text = "Hammerfall remembers the internment camps well enough.", next = "camps", when = { race = "Orc" } },
        { text = "For the Dark Lady.", next = "END" },
      },
    },

    command = {
      lines = {
        { id = "co_default", text = "Lord Varimathras, by the Dark Lady's will, and that is all a soldier needs to know. He was a dreadlord of the Scourge once, and now he bends the knee to Sylvanas, which pleases me more than I can say." },
      },
      choices = {
        { text = "You trust a dreadlord?", next = "command_trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    command_trust = {
      lines = {
        { id = "ct_default", text = "Trust? I trust that he fears her, and that will do. The Dark Lady keeps her demons on short chains, and the day one slips is the day she'll show us all how she deals with traitors." },
      },
      choices = {
        { text = "A demon on a leash is still a demon. This will end badly.", next = "command_doubt", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Using the Scourge's own weapons against them is clever.", next = "command_clever", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    command_doubt = {
      lines = {
        { id = "cd_default", text = "Spoken like someone who still has a heartbeat to lose. Keep your doubts away from the Den, {class}, for there are ears here that report to Undercity." },
      },
      choices = { { text = "Noted. Something else.", next = "BACK" } },
    },
    command_clever = {
      lines = {
        { id = "cc_default", text = "Precisely, and the Lich King feeds on irony as poorly as we feed on bread. Every weapon he made, we turn back on him in time." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    graves = {
      lines = {
        { id = "gr_default", text = "The barrows beneath those fields are older than Stromgarde, and what lies in them is no longer anyone's concern but ours. The Royal Apothecary Society has uses for old bones that the living would find distasteful." },
      },
      choices = {
        { text = "What uses, exactly?", next = "graves_use" },
        { text = "Something else.", next = "BACK" },
      },
    },
    graves_use = {
      big = true,
      lines = {
        { id = "gu_default", text = "That is a question for an apothecary, and they're not in the habit of answering it. I've carried the sealed crates back to the Den myself, and I can tell you they're heavier going out than coming in." },
      },
      choices = {
        { text = "Robbing graves is beneath any soldier.", next = "graves_shame", fx = { affinity = -2, align = { light = 1 } } },
        { text = "The dead don't need their bones. The Horde does.", next = "graves_fine", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    graves_shame = {
      lines = {
        { id = "gs_default", text = "Beneath? I was buried myself, {class}, and nobody asked my leave to dig me up again. Spare me the funeral manners of the living." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    graves_fine = {
      lines = {
        { id = "gf_default", text = "Ha, a practical sort. If only the warchief's people in Hammerfall saw it so plainly, they'd stop wrinkling their noses at our crates." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    league = {
      lines = {
        { id = "le_default", text = "Children of a dead kingdom, playing at soldiers in a hall named for a king who abandoned Lordaeron when it needed him most. When Arthas came, Stromgarde kept its gates shut, and now they want sympathy." },
      },
      choices = {
        { text = "They're fighting for their homes. That's worth respect.", next = "league_respect" },
        { text = "Something else.", next = "BACK" },
      },
    },
    league_respect = {
      lines = {
        { id = "lr_default", text = "Their homes, you say, and whose homes were in Brill and Deathknell, before the Plague and the paladins put them to the torch? Respect is for those who stood beside us when it mattered." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    before = {
      lines = {
        { id = "bf_default", text = "Then you know the smell of the Farm in harvest, and how little it means to us now. I tilled fields in Tirisfal myself, and I came back to find the Scarlets had burned them and called it cleansing." },
      },
      choices = {
        { text = "Do you miss it?", next = "before_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    before_miss = {
      lines = {
        { id = "bm_default", text = "I miss being hungry for something, if that answers you. The Dark Lady gives us vengeance instead, and I find it fills the belly better than bread ever did." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    camps = {
      lines = {
        { id = "ca_default", text = "They do, and Stromgarde's coin built half of them, which is why I'm glad of your company at the Den. Your people get their vengeance and mine get the graves, and the League gets nothing at all." },
      },
      choices = { { text = "Lok'tar. Something else.", next = "BACK" } },
    },
  },
}

-- A sergeant at Trollbane Hall (generic, name-matched; not a confirmed 1.12 spawn).
P:NPC {
  key = "bg_ab_arathor_sergeant", id = TODO_NPC("Arathor Sergeant"), name = "Arathor Sergeant",
  role = "soldier", tier = "service",
  communities = { "league_of_arathor" }, temper = { "gruff", "practical" }, values = { "dutiful" },

  impression = {
    first = "A gruff sergeant who measures the battle in horses and bread.",
    third = "{name} spoke with a League sergeant at Trollbane Hall.",
  },

  greetings = {
    { id = "g_default", text = "Don't stand in the doorway, {class}, there's a rider coming in from the Mine and he won't stop for you." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde, in the Hall? Go on before the guards notice you and I have to fill in a report." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Sergeant of the Hall, which means I count the horses, the arrows and the dead, and none of the three ever adds up right. What do you want?" },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, good. I could use someone who can watch the Lumber Mill ridge without falling asleep. What do you want?" },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a ledger waiting." },
      },
      choices = {
        { text = "How goes the fighting?", next = "fight" },
        { text = "The mill on the ridge looks important.", next = "mill" },
        { text = "Carry on, Sergeant.", next = "END" },
      },
    },
    fight = {
      lines = {
        { id = "fi_default", text = "Like it always goes, back and forth across the same five flags until somebody's ledger hits two thousand. We lose good horses at the Gold Mine every day, and good men with them." },
      },
      choices = {
        { text = "Why the Gold Mine?", next = "fight_mine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fight_mine = {
      lines = {
        { id = "fm_default", text = "It's tucked away in the east, far from both bases, so whoever holds it holds it alone. The Defilers send their rogues there by the dozen, and I've stopped counting the ones we don't get back." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mill = {
      lines = {
        { id = "mi_default", text = "It is, because a good archer up there can see the Blacksmith and half the valley below it. Whoever holds the high ground has an easier day, so hold it, and don't jump off the edge unless you mean to." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

-- An apothecary at the Defiler's Den (generic, name-matched; not a confirmed 1.12 spawn).
P:NPC {
  key = "bg_ab_defiler_apothecary", id = TODO_NPC("Defiler Apothecary"), name = "Defiler Apothecary",
  role = "apothecary", tier = "service",
  communities = { "defilers", "apothecaries" }, temper = { "cold", "curious" }, values = { "ambitious" },

  impression = {
    first = "An apothecary who talks about Arathi's barrows the way a merchant talks about stock.",
    third = "{name} spoke with a Royal Apothecary Society chemist at the Defiler's Den.",
  },

  greetings = {
    { id = "g_default", text = "Mind the crates, {class}, and do not open any of them. Some of what's inside is still deciding whether it's dead." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "A living specimen, wandering into the Den on its own. How very considerate of you." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "The Royal Apothecary Society sends its regards, and very little else, to the soldiers of this camp. I'm here for the soil and what lies under it, so ask quickly." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "A mage, and not one of Dalaran's simpering sort, I hope. You'd appreciate the chemistry here, if you've the stomach for it. Ask quickly." },
      },
      again = {
        { id = "h_again", text = "Something else? My reagents won't keep forever." },
      },
      choices = {
        { text = "What's under the soil?", next = "soil" },
        { text = "What's in the crates?", next = "crates" },
        { text = "Good luck with your work.", next = "END" },
      },
    },
    soil = {
      lines = {
        { id = "so_default", text = "Barrows, old as Arathor itself, full of kings and soldiers who died before Lordaeron was a name. Their bones have a quality that fresh corpses lack, and Master Apothecary Faranell is most interested in it." },
      },
      choices = {
        { text = "What quality?", next = "soil_quality" },
        { text = "Something else.", next = "BACK" },
      },
    },
    soil_quality = {
      lines = {
        { id = "sq_default", text = "Patience, mostly, the kind that only comes from lying still a thousand years. Beyond that, the Society's findings belong to the Society, and to the Dark Lady when she asks for them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    crates = {
      lines = {
        { id = "cr_default", text = "Samples bound for Undercity, sealed and labeled by the Society's own hand. The orcs at Hammerfall refuse to carry them, which is why the Defilers do it, and why I trust nobody else to." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

-- Arathi Blacksmith: League smith working the forge at the Blacksmith node.
P:NPC {
  key = "bg_ab_arathi_blacksmith", id = 15063, name = "Arathi Blacksmith", role = "smith", tier = "service",
  communities = { "league_of_arathor" }, temper = { "gruff", "steady" }, values = { "craft", "loyal" },
  greetings = {
    { id = "g_default", text = "Mind the sparks, {class}. This forge has gone cold three times today, and I'll not let it go cold again." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Get away from my anvil, Horde, before I find out how your skull rings." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", key = true, text = "I keep the basin's forge burning for the League, and every blade and horseshoe that goes out to the fight comes off this anvil. Hold the Blacksmith and we hold the steel, it's that simple." } },
      again = { { id = "h_again", text = "Anything else? The iron's cooling." } },
      choices = {
        { text = "Why does the forge matter so much?", next = "forge" },
        { text = "The Defilers keep taking it from you.", next = "defilers" },
        { text = "Keep the fire hot.", next = "END" },
      },
    },
    forge = {
      lines = { { id = "f_default", text = "Without the forge, the mine's iron is just rock and the lumber's just firewood. Stromgarde's going to need arms to take back its walls, and this is where they'll be made." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    defilers = {
      lines = { { id = "d_default", text = "Aye, they do, and every time they do they foul the quench barrel, the filthy corpses. I'd like to see one of them hammer out a decent blade without its fingers falling off." } },
      choices = {
        { text = "We'll take it back and keep it.", next = "BACK", reply = "Good. I'll have a fresh blade waiting for you when you do.", fx = { align = { order = 1 } } },
        { text = "Let them have it. Hit their stables instead.", next = "BACK", reply = "Clever, maybe, but I'm not leaving my forge to the dead for anything.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I hammer metal, friend. Ask a sergeant about anything else." } } },
}

-- Arathi Stablehand: League groom caring for the horses at the Stables node.
P:NPC {
  key = "bg_ab_arathi_stablehand", id = 15086, name = "Arathi Stablehand", role = "worker", tier = "service",
  communities = { "league_of_arathor" }, temper = { "nervous", "earnest" }, values = { "duty" },
  greetings = {
    { id = "g_default", text = "Easy, easy, you'll spook the mares. They've had a hard enough day with all the shouting." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Stay back from the horses! I'll... I'll call the guard, I swear it!" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", key = true, text = "I look after the horses here at the Stables, and the League rides them out to every corner of the basin. It's not glorious work, but a knight without a horse is just a man in very heavy boots." } },
      again = { { id = "h_again", text = "Anything else? The bay mare needs her feed." } },
      choices = {
        { text = "Why fight for a stable?", next = "why" },
        { text = "Are you a soldier?", next = "soldier" },
        { text = "Take care of them.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because horses win wars, my father always said, and he rode with Trollbane's cavalry. Whoever holds the Stables holds the fastest way to every other point in the basin." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    soldier = {
      lines = { { id = "s_default", text = "Not really, no, though they gave me a sword and told me to stand by the gate. I'd rather the horses didn't see me use it, if it's all the same to you." } },
      choices = {
        { text = "Everyone fights when their home is threatened.", next = "BACK", reply = "I suppose that's true, though I wish it weren't.", fx = { align = { order = 1 } } },
        { text = "Leave the fighting to soldiers. Tend the horses.", next = "BACK", reply = "Thank you. That's what I'd rather do anyway.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I only know horses, I'm afraid. Ask someone with a helmet." } } },
}

-- Forsaken Blacksmith: Defiler smith holding the forge for the Dark Lady.
P:NPC {
  key = "bg_ab_forsaken_blacksmith", id = 15064, name = "Forsaken Blacksmith", role = "smith", tier = "service",
  communities = { "defilers" }, temper = { "cold", "sardonic" }, values = { "craft", "loyal" },
  greetings = {
    { id = "g_default", text = "The forge is warm and I am not. Speak, if you have business with the Defilers' steel." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "A living thing at my anvil. How quaint. You'll make a fine quenching, I imagine." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", key = true, text = "I was a smith in Lordaeron before the Plague, and I am a smith in Arathi now, for the Dark Lady and the Defilers. The fire doesn't care whether my hands are warm, and neither does the iron." } },
      again = { { id = "h_again", text = "What else? I've blades to finish." } },
      choices = {
        { text = "You remember your old life?", next = "past" },
        { text = "Why do the Defilers want the basin?", next = "basin" },
        { text = "For the Dark Lady.", next = "END", when = { faction = "Horde" } },
        { text = "I'll go.", next = "END" },
      },
    },
    past = {
      lines = { { id = "p_default", text = "I remember a shop in Andorhal and a wife who sang off-key. I don't remember what her face looked like, and I find I don't much care to." } },
      choices = {
        { text = "That's a sad thing to lose.", next = "BACK", reply = "Sad is for the living. I have work to do.", fx = { align = { light = 1 } } },
        { text = "The past is dead. Like you.", next = "BACK", reply = "Exactly so. You learn quickly.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    basin = {
      lines = { { id = "b_default", text = "The Dark Lady wants the resources, and she wants the humans of Stromgarde to know their old kingdom belongs to the dead now. I'm happy to help with both." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I don't know and I don't care. Ask an apothecary." } } },
}

-- Forsaken Stablehand: Defiler groom keeping the skeletal horses at the Stables.
P:NPC {
  key = "bg_ab_forsaken_stablehand", id = 15087, name = "Forsaken Stablehand", role = "worker", tier = "service",
  communities = { "defilers" }, temper = { "dry", "morbid" }, values = { "duty" },
  greetings = {
    { id = "g_default", text = "Don't stand behind that one, it kicks, and it doesn't feel the need to stop." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "The horses are dead and so am I, but you're not. Shall we fix that?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", key = true, text = "I tend the horses at the Stables for the Defilers, and most of them are as dead as I am. They don't need feeding, which saves a great deal of trouble, though they do have a habit of losing pieces." } },
      again = { { id = "h_again", text = "Something else? The roan's lost a hoof again." } },
      choices = {
        { text = "Dead horses?", next = "horses" },
        { text = "Do you miss the living ones?", next = "miss" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    horses = {
      lines = { { id = "h2_default", text = "The Royal Apothecary Society sees to their keeping, and I see to their stitching. They don't tire, don't spook and don't mind the smell, which makes them better mounts than most living ones." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    miss = {
      lines = { { id = "m_default", text = "I kept horses for a lord in Hillsbrad, once, and the living ones loved me. These ones don't, but they don't hate me either, which is more than I can say for the living." } },
      choices = {
        { text = "There's still some warmth in you.", next = "BACK", reply = "Don't tell the apothecaries. They'd want to cut it out and study it.", fx = { align = { light = 1 } } },
        { text = "The living never deserved your loyalty.", next = "BACK", reply = "No, they didn't. The Dark Lady does.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I only know dead horses and where to find their missing parts." } } },
}
