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
    { id = "dp_rep_la", when = { rep = { faction = "League of Arathor", min = "Honored" } }, text = "The League honours you, and Arathor remembers its friends. Stand with us." },
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
    { id = "dp_rep_df", when = { rep = { faction = "The Defilers", min = "Honored" } }, text = "The Defilers honour you. The Dark Lady will hear of your deeds in the basin." },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you still standing. Come, stand with us a while." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Say what you came to say, and then leave us to our work." },
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
        { id = "xh_again2", text = "Back again? Then make it short; the ledger won't fill itself." },
        { id = "h_again", text = "Anything else? I've a ledger waiting." },
      },
      choices = {
        { text = "A soldier's word should be as strong as his shield.", next = "BACK", reply = "Aye, and the good ones are. I've stood beside a few.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A clever soldier lies to the enemy and lives.", next = "BACK", reply = "Maybe so, but don't make a habit of it with your friends.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "How goes the fighting?", next = "fight" },
        { text = "The mill on the ridge looks important.", next = "mill" },
        { text = "Who commands the League here?", next = "xcommand" },
        { text = "What do you think of the Defilers?", next = "xdef" },
        { text = "Do you have enough soldiers?", next = "xmen" },
        { text = "I'm a warrior. Where do you need a shield?", next = "xwarrior", when = { class = "WARRIOR" } },
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
    xcommand = {
      lines = { { id = "xco_default", text = "The League answers to the Hall and to Stromgarde's old blood, though in the field it's whoever shouts loudest and makes sense. I'm a sergeant, so I shout the loudest and hope the sense follows." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdef = {
      narr = "He sets down his quill and drums his fingers on the ledger.",
      lines = { { id = "xde_default", text = "Dead Lordaeronians digging up Arathor's barrows for their apothecaries, and calling it a war. Some of them might have been my neighbours once, and that's the part I try not to think about." } },
      choices = {
        { text = "Then give them no mercy. They chose the Dark Lady.", next = "BACK", reply = "Aye, that's what I tell the new lads, and it helps them sleep.", fx = { align = { light = -1 } } },
        { text = "Pity them, even as you fight them.", next = "BACK", reply = "I do, quietly, and I'd thank you not to tell the men.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmen = {
      lines = { { id = "xme_default", text = "Never. Farmers, refugees and a few old veterans hold the line until adventurers like you come and swell it. When you leave, I count heads again, and the number's always smaller." } },
      choices = {
        { text = "Then I'll stay as long as the fight lasts.", next = "xstay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xstay = {
      lines = { { id = "xsy_default", text = "Big words, and I've heard them before, but I'll write your name in the ledger all the same. Prove me wrong, {class}, and I'll buy the first round at Refuge Pointe." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xwarrior = {
      lines = { { id = "xwa_default", text = "At the Blacksmith, where the fighting's thickest and the ground's flattest. Stand in front of the archers and don't fall over, and that's half the job done." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    stromgarde = { { id = "xtp_strom", text = "That's what we're fighting for, when it comes down to it. Every flag we hold puts us a little nearer home." } },
    defilers = { { id = "xtp_def", text = "The Dark Lady's lot, all rot and resentment. They fight well for corpses, I'll give them that." } },
    _none = { { id = "xtp_none", text = "Not in my ledger, {class}. Ask at the Stables, they hear everything." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back, friend. You're always welcome here." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Make it quick, if you please. I've no time for you." },
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
        { id = "xh_again2", text = "You again. Either you're curious or you're stalling, and I hope it's the former." },
        { id = "h_again", text = "Something else? My reagents won't keep forever." },
      },
      choices = {
        { text = "What's under the soil?", next = "soil" },
        { text = "What's in the crates?", next = "crates" },
        { text = "What do you think of the League of Arathor?", next = "xleague" },
        { text = "Do you remember being alive?", next = "xalive" },
        { text = "What does Faranell want with old bones?", next = "xfaranell" },
        { text = "I'm Forsaken as well. What's your work, really?", next = "xforsaken", when = { race = "Scourge" } },
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
    xleague = {
      lines = { { id = "xlg_default", text = "Stubborn, warm-blooded and very attached to their ruins. They fight as if Arathor still mattered, and I suppose to them it does, which makes them almost interesting to study." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xalive = {
      narr = "The apothecary pauses, a stoppered vial halfway to the crate.",
      lines = { { id = "xal_default", text = "I was an alchemist's apprentice in Lordaeron, mixing tonics for gout. Now I study what the Plague left behind in me, which is rather more rewarding, and rather less dull." } },
      choices = {
        { text = "Do you hate the living for what was lost?", next = "xhate" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhate = {
      lines = { { id = "xha_default", text = "Hate is a strong word for a chemist, and I prefer to measure things. The living abandoned us when we woke, so I don't owe them anything, but I don't waste my time hating them either." } },
      choices = {
        { text = "The living earned your contempt. Use them as they used you.", next = "BACK", reply = "You'd fit in at the Society, I think. Few have the stomach for honesty.", fx = { align = { light = -1 } } },
        { text = "Some living still mourn you. Don't forget that.", next = "BACK", reply = "Sentimental, and probably untrue. Still, I'll note it in the margin.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfaranell = {
      lines = { { id = "xfa_default", text = "Answers, and the kind of patience that bones a thousand years old have in them. Beyond that, ask him yourself in the Apothecarium, if you think he'll tell you more than I will." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xforsaken = {
      lines = { { id = "xfo_default", text = "Soil samples, bone dust and a few experiments the orcs at Hammerfall pretend not to notice. We serve the Dark Lady's interests, and her interests are wide, so don't ask for a full list." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    royal_apothecary_society = { { id = "xtp_ras", text = "The finest minds in the Undercity, and the only ones I'd trust with a sample. The rest are amateurs." } },
    arathi = { { id = "xtp_arathi", text = "Old soil, old bones and old grudges. Excellent conditions for research." } },
    _none = { { id = "xtp_none", text = "Not a subject I study. Ask someone with a pulse, perhaps." } },
  },
}

-- Arathi Blacksmith: League smith working the forge at the Blacksmith node.
P:NPC {
  key = "bg_ab_arathi_blacksmith", id = 15063, name = "Arathi Blacksmith", role = "smith", tier = "service",
  communities = { "league_of_arathor" }, temper = { "gruff", "steady" }, values = { "craft", "loyal" },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you, friend. I've been keeping an eye out for things you might want." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'll sell to you, since that's my trade, but I'll not pretend I'm pleased about it." },
    { id = "g_default", text = "Mind the sparks, {class}. This forge has gone cold three times today, and I'll not let it go cold again." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Get away from my anvil, Horde, before I find out how your skull rings." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", key = true, text = "I keep the basin's forge burning for the League, and every blade and horseshoe that goes out to the fight comes off this anvil. Hold the Blacksmith and we hold the steel, it's that simple." } },
      again = {
        { id = "h_again", text = "Anything else? The iron's cooling." },
        { id = "xh_again2", text = "Still here? Then pump the bellows while you talk, and earn your keep." },
      },
      choices = {
        { text = "Why does the forge matter so much?", next = "forge" },
        { text = "The Defilers keep taking it from you.", next = "defilers" },
        { text = "Where did you learn your trade?", next = "xlearn" },
        { text = "What do you think of the League?", next = "xleague" },
        { text = "Are the Defilers' blades any good?", next = "xblades" },
        { text = "I'm a blacksmith too.", next = "xsmith", when = { profession = "Blacksmithing" } },
        { text = "A dwarf could teach you a thing or two here.", next = "xdwarf", when = { race = "Dwarf" } },
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
    xlearn = {
      narr = "He turns a half-finished blade in the tongs and squints down its length.",
      lines = { { id = "xle_default", text = "In Stromgarde, at my father's forge under the old walls, before the ogres and the Syndicate made a ruin of the place. I've been making swords for a kingdom that's lost its capital ever since." } },
      choices = {
        { text = "Will Stromgarde ever be retaken?", next = "xstrom" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xstrom = {
      lines = { { id = "xst_default", text = "If the League can hold this basin and keep the iron flowing, aye, I believe it. Galen Trollbane's line still holds part of the keep, and the rest of us mean to give them back the whole of it." } },
      choices = {
        { text = "Stromgarde's line deserves its throne back.", next = "BACK", reply = "Spoken like a friend of Arathor. I'll mark your blade with the old crest.", fx = { align = { order = 1 } } },
        { text = "Old kingdoms die. Build something new instead.", next = "BACK", reply = "Something new, on Thoradin's land? You're not from round here, are you?", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xleague = {
      lines = { { id = "xlg_default", text = "Soldiers and refugees and farmers who've had enough, under a banner that's older than Stormwind. We're not the prettiest army you'll ever see, but we're the stubbornest, and stubborn wins basins." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xblades = {
      lines = { { id = "xbl_default", text = "Sharp enough, I'll grant them that, and heavier than they need to be. Forsaken smiths don't feel the weight, so they never learn balance, and I'd not trade one of mine for ten of theirs." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xsmith = {
      lines = { { id = "xsm_default", text = "Are you, now? Then you'll know why I curse every time the forge goes cold. Pick up a hammer between fights if you like, and we'll see if you've the arm for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdwarf = {
      lines = { { id = "xdw_default", text = "Aye, they could, and they never let me forget it. Your folk taught my grandfather's grandfather to work steel in the Troll Wars, and we've been trying to catch up ever since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    stromgarde = { { id = "xtp_strom", text = "My city, and the League's reason for fighting. We'll have it back, one forged blade at a time." } },
    defilers = { { id = "xtp_def", text = "Dead men who want our iron. They can have it, point first." } },
    _none = { { id = "tp_none", text = "I hammer metal, friend. Ask a sergeant about anything else." } } },
}

-- Arathi Stablehand: League groom caring for the horses at the Stables node.
P:NPC {
  key = "bg_ab_arathi_stablehand", id = 15086, name = "Arathi Stablehand", role = "worker", tier = "service",
  communities = { "league_of_arathor" }, temper = { "nervous", "earnest" }, values = { "duty" },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There you are. I was hoping you'd come by again." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Make it quick, if you please. I've no time for you." },
    { id = "g_default", text = "Easy, easy, you'll spook the mares. They've had a hard enough day with all the shouting." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Stay back from the horses! I'll... I'll call the guard, I swear it!" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", key = true, text = "I look after the horses here at the Stables, and the League rides them out to every corner of the basin. It's not glorious work, but a knight without a horse is just a man in very heavy boots." } },
      again = {
        { id = "h_again", text = "Anything else? The bay mare needs her feed." },
        { id = "xh_again2", text = "Oh, you're back. Mind the grey, she bites, though only people she likes." },
      },
      choices = {
        { text = "Why fight for a stable?", next = "why" },
        { text = "Are you a soldier?", next = "soldier" },
        { text = "Which horse is your favourite?", next = "xfav" },
        { text = "Do the Defilers ride horses too?", next = "xdead" },
        { text = "Tell me about your father.", next = "xfather" },
        { text = "I'm a paladin. My charger could use a look.", next = "xpaladin", when = { class = "PALADIN" } },
        { text = "I'm a hunter. Horses and I get on well.", next = "xhunter", when = { class = "HUNTER" } },
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
    xfav = {
      narr = "His face brightens, and he points to a dappled mare chewing at the fence rail.",
      lines = { { id = "xfa_default", text = "That one, Bramble, who's carried riders to the Gold Mine and back more times than anyone. She's scared of chickens and nothing else, which is a better record than most soldiers here." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdead = {
      lines = { { id = "xde_default", text = "Dead ones, all bones and stitches, and they don't even whinny. I saw one up close at the Stables after the Defilers took it, and I couldn't sleep for two nights afterwards." } },
      choices = {
        { text = "Their horses deserve pity too, poor things.", next = "BACK", reply = "That's what I thought, and nobody here would listen. Thank you.", fx = { align = { light = 1 } } },
        { text = "Burn every one of them. They're abominations.", next = "BACK", reply = "I suppose you're right, though I'd rather someone else did the burning.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfather = {
      lines = { { id = "xft_default", text = "He rode in the Second War with Trollbane's lancers and came home with a limp and a hundred stories. He wanted me to be a knight, but I only ever wanted to be in the stable, brushing the horses he rode." } },
      choices = {
        { text = "Was he disappointed?", next = "xdisapp" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdisapp = {
      lines = { { id = "xdi_default", text = "He said a good groom saves more knights than a good lance does, and then he went quiet. I think he meant it, and I think he was a little disappointed too." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpaladin = {
      lines = { { id = "xpa_default", text = "One of the Light's own chargers? I'd be honoured, though I'm told they won't let anyone but their rider touch them. If yours lets me, I'll know you've a kind one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhunter = {
      lines = { { id = "xhu_default", text = "I can tell, the way you stood just now, so the mares didn't startle. If you ever want a job tending horses instead of fighting, the League could use you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    stables = { { id = "xtp_stables", text = "The best horses in Arathi are here, and I mean to keep them safe whoever holds the flag." } },
    trollbane = { { id = "xtp_troll", text = "My father rode for the old king's son. He still lifts his mug to Thoradin's line every night." } },
    _none = { { id = "tp_none", text = "I only know horses, I'm afraid. Ask someone with a helmet." } } },
}

-- Forsaken Blacksmith: Defiler smith holding the forge for the Dark Lady.
P:NPC {
  key = "bg_ab_forsaken_blacksmith", id = 15064, name = "Forsaken Blacksmith", role = "smith", tier = "service",
  communities = { "defilers" }, temper = { "cold", "sardonic" }, values = { "craft", "loyal" },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you again. For a regular like you, I'll find the better stock from the back." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Buy what you need and be on your way, if you please." },
    { id = "g_default", text = "The forge is warm and I am not. Speak, if you have business with the Defilers' steel." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "A living thing at my anvil. How quaint. You'll make a fine quenching, I imagine." },
    { id = "yg_0", when = { race = "Scourge" }, text = "Another of the risen. Pull up a stool; the fire won't warm you, but it's company." },
  },
  start = "hello",
  nodes = {
    y_tools = {
      lines = {
        { id = "y_y_tools", text = "These are my own tools, from my shop in Andorhal. I went back for them after I rose. The shop was full of Scourge, and I was half afraid they'd mistake me for one of their own. They nearly did." },
      },
      choices = {
        { text = "What was Andorhal like before?", next = "y_andor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_andor = {
      lines = {
        { id = "y_y_andor", text = "Busy, warm, full of grain carts and arguing farmers. I shod horses for half the county. Now it's a city of the dead, and the Scourge have their own smiths. I wonder sometimes if one of them uses my old anvil." },
        { id = "y_y_andor_v0", when = { race = "Human" }, text = "Busy and warm, full of grain carts. You may have bought bread from there, once. Now it's a city of the dead, and I try not to think about it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_league = {
      lines = {
        { id = "y_y_league", text = "The League of Arathor's smiths are good, I'll grant them that. I've picked up a few of their dropped hammers on the field. Well balanced, honest work. I don't tell the Defilers I admire them." },
      },
      choices = {
        { text = "Admire good work wherever you find it.", next = "BACK", reply = "Yes. The iron doesn't care whose hands worked it.", fx = { align = { honor = 1 } } },
        { text = "The League are the enemy. Admire nothing.", next = "BACK", reply = "Hm. That's what the Dark Lady would say. I'll keep my admiration to myself.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", key = true, text = "I was a smith in Lordaeron before the Plague, and I am a smith in Arathi now, for the Dark Lady and the Defilers. The fire doesn't care whether my hands are warm, and neither does the iron." } },
      again = {
        { id = "h_again", text = "What else? I've blades to finish." },
        { id = "xh_again2", text = "Back again. The forge doesn't mind company, and neither do I, much." },
      },
      choices = {
        { text = "You remember your old life?", next = "past" },
        { text = "Why do the Defilers want the basin?", next = "basin" },
        { text = "What do you make for the Defilers?", next = "xmake" },
        { text = "What do you think of the League's smith?", next = "xrival" },
        { text = "Do the orcs at Hammerfall trust your work?", next = "xorcs" },
        { text = "I work the forge myself.", next = "xsmith", when = { profession = "Blacksmithing" } },
        { text = "For the Dark Lady.", next = "END", when = { faction = "Horde" } },
        { text = "Tell me about your tools.", next = "y_tools" },
        { text = "What do you think of the League's smiths?", next = "y_league" },
        { text = "I worked a forge in life too.", next = "BACK", when = { race = "Scourge" }, reply = "Then you know the iron remembers what the hand forgets. Mine certainly does." },
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
    xmake = {
      lines = { { id = "xma_default", text = "Cleavers, mostly, and blades heavy enough that a living arm would ache to hold them. My soldiers don't feel the weight, so I make what kills best and leave the balance to the living." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xrival = {
      narr = "He glances across the basin toward the League's distant forge smoke.",
      lines = { { id = "xri_default", text = "Competent, for a man who still sleeps, and very proud of his balance. He'll never understand that a dead man's blade doesn't need it, and that's why I'll outlast him." } },
      choices = {
        { text = "He fights for his home. Respect that.", next = "BACK", reply = "I fought for my home once, and look where it got me.", fx = { align = { honor = 1 } } },
        { text = "Balance won't save him from your steel.", next = "BACK", reply = "No, it won't. You understand the craft better than he does.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorcs = {
      lines = { { id = "xor_default", text = "They trust the iron, if not the smith. The Warchief's grunts ask me to sharpen their axes and then wash their hands afterward, as if death were catching." } },
      choices = {
        { text = "Is it?", next = "xcatch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcatch = {
      lines = { { id = "xca_default", text = "Ask the people of Andorhal, if you can find any who still breathe. The Plague came in grain sacks, not in handshakes, but the orcs never let facts spoil a good fear." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xsmith = {
      lines = { { id = "xsm_default", text = "Then hold your hand near this fire and tell me how it feels. I can't remember anymore, and some days I'd like to." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    smithing = { { id = "tp_ysmithing", text = "Smithing is all I had in life, and all I have now. It is enough." } },
    andorhal = { { id = "xtp_andorhal", text = "My old home, rotting under the Scourge now. I don't go back, and I don't want to." } },
    league_of_arathor = { { id = "xtp_league", text = "Living men in a dead kingdom. They'll learn, one way or another." } },
    _none = { { id = "tp_none", text = "I don't know and I don't care. Ask an apothecary." } } },
}

-- Forsaken Stablehand: Defiler groom keeping the skeletal horses at the Stables.
P:NPC {
  key = "bg_ab_forsaken_stablehand", id = 15087, name = "Forsaken Stablehand", role = "worker", tier = "service",
  communities = { "defilers" }, temper = { "dry", "morbid" }, values = { "duty" },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you. Come, stay a while." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. Say what you need, and then go." },
    { id = "g_default", text = "Don't stand behind that one, it kicks, and it doesn't feel the need to stop." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "The horses are dead and so am I, but you're not. Shall we fix that?" },
    { id = "yg_0", when = { race = "Scourge" }, text = "Another of the dead. Good. The horses don't spook at you, and they spook at everything else." },
  },
  start = "hello",
  nodes = {
    y_horse = {
      lines = {
        { id = "y_y_horse", text = "This one is Bones. That's not a joke; that's his name. He was a farm horse in Hillsbrad, and he came back with the rest of us. He doesn't remember his old owner, but he remembers apples, and he still looks for them." },
      },
      choices = {
        { text = "Do you give him apples?", next = "y_apple" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_apple = {
      lines = {
        { id = "y_y_apple", text = "I do, though he can't eat them anymore. He just holds them in his teeth until they rot. I think it makes him happy, or as close to happy as a dead horse gets." },
        { id = "y_y_apple_v0", when = { class = "HUNTER" }, text = "I do, though he can't eat them. You're a hunter; you know beasts keep their habits. He holds them in his teeth until they rot." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_league = {
      lines = {
        { id = "y_y_league", text = "The League's stables are across the field. I see their grooms sometimes, brushing living horses. I wonder if they'd trade one. Not for the war, just so I could feel a warm flank again." },
      },
      choices = {
        { text = "Trade with them. A horse is a horse.", next = "BACK", reply = "Perhaps. I doubt they'd agree, but I could ask.", fx = { align = { order = 1 } } },
        { text = "Never deal with the enemy.", next = "BACK", reply = "Of course. The Dark Lady wouldn't approve. I'll keep my dead horses.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", key = true, text = "I tend the horses at the Stables for the Defilers, and most of them are as dead as I am. They don't need feeding, which saves a great deal of trouble, though they do have a habit of losing pieces." } },
      again = {
        { id = "h_again", text = "Something else? The roan's lost a hoof again." },
        { id = "xh_again2", text = "Still here? Pass me that thread, then, the grey's lost an ear." },
      },
      choices = {
        { text = "Dead horses?", next = "horses" },
        { text = "Do you miss the living ones?", next = "miss" },
        { text = "Who was the lord in Hillsbrad?", next = "xlord" },
        { text = "How do you fix a horse that loses a leg?", next = "xfix" },
        { text = "What do you think of the League's stables?", next = "xleague" },
        { text = "Could I ride one of these?", next = "xride", when = { race = "Scourge" } },
        { text = "Tell me about this horse.", next = "y_horse" },
        { text = "Do you envy the League's stables?", next = "y_league" },
        { text = "I rode horses once, in life.", next = "BACK", when = { race = "Scourge" }, reply = "So did I. Now I ride nothing, but I tend everything. It's a change." },
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
    xlord = {
      lines = { { id = "xlo_default", text = "A minor house near Southshore, with more horses than sense. He died the same week I did, and I'm told he's a ghoul in the Plaguelands now, which pleases me more than it should." } },
      choices = {
        { text = "He got what he deserved, then.", next = "BACK", reply = "I like to think so. Small comforts are all the dead get.", fx = { align = { light = -1 } } },
        { text = "No one deserves the Scourge, not even him.", next = "BACK", reply = "Perhaps not. I'll try to feel sorry for him, though I don't promise to succeed.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfix = {
      narr = "He holds up a heavy curved needle and a length of black thread.",
      lines = { { id = "xfi_default", text = "Needle, thread and a fresh leg from somewhere, and the apothecaries supply the somewhere. I don't ask, and the horse doesn't seem to mind." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xleague = {
      lines = { { id = "xle_default", text = "Warm horses, warm grooms and a lot of feed to carry in. Their boy weeps when a horse dies, I hear, which must make for a very wet stable." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xride = {
      lines = { { id = "xri_default", text = "Of course, if you don't mind the odd rib working loose. Skeletal horses go faster than you'd think, and they never tire, so hold on to the reins and don't look down." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    horses = { { id = "tp_yhorses", text = "Dead horses are easier to keep than living ones, but they're worse company." } },
    hillsbrad = { { id = "xtp_hb", text = "I groomed horses there once. Now the humans keep their horses and we keep ours, and I prefer ours." } },
    royal_apothecary_society = { { id = "xtp_ras", text = "They keep my horses walking, so I don't complain about their methods." } },
    _none = { { id = "tp_none", text = "I only know dead horses and where to find their missing parts." } } },
}
