-- Darrowshire's ghost child, and the people of Light's Hope who never got a word before. Voice: bibles/roads.md
local P = RPGDialogueAPI:Pack("rpgd.easternplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "carlin", id = TODO_NPC("Carlin Redpath"), name = "Carlin Redpath",
  bible = "bibles/roads.md", role = "questgiver", tier = "quest",
  communities = { "light_hope", "argent_dawn" }, temper = { "weary" }, values = { "loyal", "kind" },
  notices = { "class" },
  impression = {
    first = "Carlin Redpath survived Darrowshire, and he has never quite forgiven himself for it. He speaks of his brother Joseph as if Joseph might walk in at any moment.",
    third = "{name} met Carlin Redpath at Light's Hope Chapel, a survivor of the fall of Darrowshire.",
  },

  greetings = {
    { id = "g_chapel", text = "Light keep you, friend. Sit a moment, if you're not in a hurry; few people stop to talk to an old man about an old battle." },
    { id = "g_back", when = { metBefore = true }, text = "You came back. I'd hoped you would, though I couldn't say why." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin. Joseph wanted the Light's training once, and our father wanted him on the farm, and the farm won. I've wondered since how that day might have gone otherwise." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Carlin Redpath, and I was at Darrowshire when the Scourge came. My brother Joseph led the defense, and I lived and he didn't, and I've spent every day since trying to make that mean something." },
        { id = "h_villains", tags = { "news" }, when = { questActive = TODO_QUEST("Villains of Darrowshire") },
          text = "The villains of that day still have relics lying about the Plaguelands. Bring them to me, and I'll see they're never honored by anyone again." },
        { id = "h_heroes", when = { questActive = TODO_QUEST("Heroes of Darrowshire") },
          text = "And the heroes, too; their things are scattered and forgotten, and they shouldn't be. Joseph's among them, of course, and so is Davil Lightfire, who came to help us." },
        { id = "h_pamela", when = { questDone = TODO_QUEST("Uncle Carlin") },
          text = "You found Pamela, or what's left of her, and she remembered me. I don't know whether to thank you or weep, so I expect I'll do both." },
      },
      choices = {
        { text = "I've met Marlene on Sorrow Hill. She asks after you.", next = "marlene", when = { questDone = TODO_QUEST("Little Pamela") } },
        { text = "What happened at Darrowshire?", next = "battle" },
        { text = "Tell me about Joseph.", next = "joseph" },
        { text = "Are there others of your family?", next = "family" },
        { text = "I'll leave you to your memories.", next = "END" },
      },
      again = { { id = "h_again", text = "What else would you hear? I've little but stories now, but I've plenty of those." } },
    },
    battle = {
      lines = {
        { id = "ba_default", text = "The Scourge came out of the north, more of them than any of us had imagined, and Joseph held the town square while the women and children hid. Then something worse than the rest came, and Joseph fell, and when he rose again he wasn't Joseph." },
      },
      choices = { { text = "Who led the Scourge that day?", next = "battle_villain" } },
    },
    battle_villain = {
      lines = {
        { id = "bv_default", text = "The thing that wore my brother, they call Redpath the Corrupted now. With it came Horgus the Ravager and Marduke the Black, and their relics still lie about the Plaguelands, if you've the stomach to hunt them." },
      },
      choices = {
        { text = "Vengeance won't bring Joseph back, Carlin.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "They'll answer for it. I'll see to that.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
      },
    },
    joseph = {
      lines = {
        { id = "jo_default", text = "Big, loud, and kind, the sort of man who carried other people's children on his shoulders at the harvest fair. He'd have laughed at a monument, but there is one, among the graves in Darrowshire." },
      },
      choices = { { text = "Something else, Carlin.", next = "BACK", fx = { learn = "darrowshire" } } },
    },
    family = {
      lines = {
        { id = "fa_default", text = "My sister Marlene, on Sorrow Hill in the west, if she still lives, and Joseph's little girl Pamela, who was hidden when the battle came. I never found her, and I've stopped letting myself hope." },
      },
      choices = { { text = "I'll look for Pamela.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    marlene = {
      lines = { { id = "ml_default", text = "Marlene, alive! Light be thanked, I'd feared the worst for her too. Tell her I'll walk west when the roads allow, and that I'm sorry it's taken me so long." } },
      choices = { { text = "I'll tell her.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },

  topics = {
    darrowshire = { { id = "tp_darrowshire", text = "My home, and my brother's grave, and the worst day of my life." } },
    _none = { { id = "tp_none", text = "I'm sorry, friend; my head's full of one day, and there's not much room left." } },
  },
}

P:NPC {
  key = "pamela", id = TODO_NPC("Pamela Redpath"), name = "Pamela Redpath",
  bible = "bibles/roads.md", role = "questgiver", tier = "quest",
  communities = { "darrowshire" }, temper = { "childlike" }, values = { "kind", "lonely" },
  notices = { "race" },
  impression = {
    first = "Pamela Redpath is a little girl, or the ghost of one, playing alone in the ruins of Darrowshire. She doesn't seem to know she's dead, or she knows and has decided not to mind.",
    third = "{name} met the ghost of Pamela Redpath in the ruins of Darrowshire, where she still waits for her family.",
  },

  greetings = {
    { id = "g_ruins", text = "Hello! Are you here to play? Nobody plays with me anymore, except the pale people, and they don't play nicely." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "You've got a beard like Papa's friend from the mountains! He used to let me pull it, but only a little." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Pamela, and this is my house, only it's broken now. Papa told me to hide and wait, so I did, and I'm still waiting, but he hasn't come." },
        { id = "h_doll", tags = { "news" }, when = { questActive = TODO_QUEST("Pamela's Doll") },
          text = "Did you find my dolly? The pale people tore her into pieces and threw them all around the houses, and I can't find her head anywhere." },
        { id = "h_marlene", when = { questActive = TODO_QUEST("Auntie Marlene") },
          text = "Auntie Marlene lives on the big hill in the west! Please tell her I've been good, and that I still have the hairpin she gave me." },
      },
      choices = {
        { text = "Would you like me to hold your hand a while?", next = "priest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Where is your papa, Pamela?", next = "papa" },
        { text = "Who are the pale people?", next = "pale" },
        { text = "Do you have any family left?", next = "family" },
        { text = "I have to go now, Pamela.", next = "END" },
      },
      again = { { id = "h_again", text = "Do you want to hear something else? I know lots of things, mostly about dollies." } },
    },
    papa = {
      lines = {
        { id = "pa_default", text = "He went to fight the bad things in the town square, with a big sword and a big shout. He said he'd come back for me, and Papa always keeps his promises, so he's just late, I think." },
      },
      choices = { { text = "What will you do when he comes?", next = "papa_when" } },
    },
    papa_when = {
      lines = {
        { id = "pw_default", text = "Show him my dolly, all fixed! And then we'll go to Auntie Marlene's for supper, like we used to, and I'll chase the chickens in her yard." },
      },
      choices = {
        { text = "Your papa would be very proud of you.", next = "BACK", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "Pamela, I have to tell you the truth about your papa.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
      },
    },
    pale = {
      lines = {
        { id = "pl_default", text = "The ones who walk funny and smell bad. They come through the town at night, and I hide under the floor where they can't see me, and I'm very, very quiet." },
      },
      choices = { { text = "Keep hiding. You're very brave.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    family = {
      lines = {
        { id = "fa_default", text = "Auntie Marlene, and Uncle Carlin who tells silly jokes, but I don't know where they went. Could you find them for me? Tell them Pamela says hello." },
      },
      choices = { { text = "I'll try, Pamela.", next = "BACK", fx = { learn = "darrowshire" } } },
    },
    priest = {
      lines = { { id = "pr_default", text = "Your hand's warm, like Papa's. That's nice, but it makes me sleepy, and if I sleep I might miss him coming home." } },
      choices = { { text = "Then I'll let you keep watch.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know that one. Do you know any songs instead?" } },
  },
}

P:NPC {
  key = "smokey", id = TODO_NPC("Smokey LaRue"), name = "Smokey LaRue",
  bible = "bibles/roads.md", role = "questgiver", tier = "service",
  communities = { "light_hope", "argent_dawn" }, temper = { "gruff" }, values = { "practical", "stubborn" },
  notices = { "race" },
  impression = {
    first = "Smokey LaRue is a dwarf of the Argent Dawn who smells of pipe smoke and something worse. He wants Scourge parts, and he does not much care how you feel about collecting them.",
    third = "{name} met Smokey LaRue, an ill-tempered dwarf working for the Argent Dawn at Light's Hope Chapel.",
  },

  greetings = {
    { id = "g_smoke", text = "Aye? Speak up, or get out of me smoke." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, at last! Somebody here who knows a proper pipe from a burnin' rag." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Smokey LaRue's the name, an' Scourge bits are me trade, more's the pity. I brew things for the Dawn that keep the plague off our boots, an' the recipes call for parts you'd rather not carry." },
        { id = "h_compound", tags = { "news" }, when = { questActive = TODO_QUEST("Smokey's Special Compound") },
          text = "Ye've got the bits? Good, toss 'em in the bin, not on me bench. The compound's half done, an' it's a mean thing when it's interrupted." },
      },
      choices = {
        { text = "What does the compound do?", next = "compound" },
        { text = "Why does everyone call you Smokey?", next = "name" },
        { text = "I'll leave you to it.", next = "END" },
      },
      again = { { id = "h_again", text = "Still here? Fine, but ye're breathin' my smoke." } },
    },
    compound = {
      lines = {
        { id = "co_default", text = "Keeps the rot from climbin' up a soldier's legs on the long patrols. It stinks worse than a ghoul, mind, which is why nobody thanks me for it." },
      },
      choices = {
        { text = "It's foul work, but somebody has to do it.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = {
        { id = "na_default", text = "On account of the pipe, an' the bench, an' the time I set the eastern tent alight. Nobody's let me forget that one, an' I've stopped askin' 'em to." },
      },
      choices = { { text = "Something else, Smokey.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Don't know, don't care, an' ye're blockin' me light." } },
  },
}

P:NPC {
  key = "betina", id = TODO_NPC("Betina Bigglezink"), name = "Betina Bigglezink",
  bible = "bibles/roads.md", role = "questgiver", tier = "quest",
  communities = { "light_hope", "argent_dawn" }, temper = { "bright" }, values = { "clever", "dutiful" },
  notices = { "class" },
  impression = {
    first = "Betina Bigglezink is a gnome of the Argent Dawn with a contraption for every problem and a very large problem in Scholomance. She talks about it cheerfully, which makes it sound worse.",
    third = "{name} met Betina Bigglezink of the Argent Dawn at Light's Hope Chapel, who is building something meant for Scholomance.",
  },

  greetings = {
    { id = "g_bench", text = "Oh, hello! Careful of the vial, it's only mostly stable." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! You'll appreciate this, then: it's alchemy and engineering together, and nothing arcane about it, which I'm rather proud of." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Betina Bigglezink, of the Argent Dawn. I make things that help, and right now I'm making something that helps by being very unpleasant to the Cult of the Damned." },
        { id = "h_gambit", tags = { "news" }, when = { questActive = TODO_QUEST("Dawn's Gambit") },
          text = "You've got the Gambit, how wonderful! Set it in the viewing room in Scholomance, step back, and then please step back a bit further than that." },
      },
      choices = {
        { text = "Gnomeregan's loss made us all inventors, didn't it?", next = "gnome", when = { race = "Gnome" } },
        { text = "What is Scholomance?", next = "scholo" },
        { text = "What exactly are you building?", next = "gambit" },
        { text = "How did a gnome end up at Light's Hope?", next = "why" },
        { text = "Good luck with it.", next = "END" },
      },
      again = { { id = "h_again", text = "Something else? I can talk and solder, mostly." } },
    },
    scholo = {
      lines = {
        { id = "sc_default", text = "A school for necromancers in the old Barov family keep on Caer Darrow, in the middle of Darrowmere Lake. They teach the dead to stand up and the living to help them, and they keep very good records." },
      },
      choices = { { text = "And you mean to stop the lessons?", next = "scholo_stop" } },
    },
    scholo_stop = {
      lines = {
        { id = "ss_default", text = "I mean to make one room very hard to study in! The viewing room is where they show off their work to the Cult's masters, and if the Gambit goes off there, there'll be nothing left to show." },
      },
      choices = {
        { text = "Burn the whole school down, I say.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Strike where it counts, and leave the rest to the Dawn.", next = "BACK", fx = { align = { order = 1 } } },
      },
    },
    gambit = {
      lines = {
        { id = "ga_default", text = "A little device that releases a holy vapour, which the undead find perfectly dreadful. I named it Dawn's Gambit, because a gamble is exactly what it is." },
      },
      choices = { { text = "Something else, then.", next = "BACK", fx = { affinity = 1 } } },
    },
    why = {
      lines = {
        { id = "wh_default", text = "Gnomeregan taught me what it's like to lose a home to something that won't stop. When the Dawn asked for clever hands, mine were very glad to be asked." },
      },
      choices = { { text = "They were lucky to get you.", next = "BACK", fx = { affinity = 2 } } },
    },
    gnome = {
      lines = { { id = "gn_default", text = "It made us all stubborn, anyway, which is the most useful thing an inventor can be. When the Gambit works, I'll drink a toast to home, and you're welcome to join me." } },
      choices = { { text = "I'll hold you to that toast.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Hmm, no, but if you find out, write it down for me!" } },
  },
}
