-- Southshore (Alliance). Voice: bibles/hillsbrad.md
local P = RPGDialogueAPI:Pack("rpgd.hillsbrad")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "redpath", id = TODO_NPC("Marshal Redpath"), name = "Marshal Redpath",
  bible = "bibles/hillsbrad.md", role = "soldier", tier = "major",
  communities = { "southshore" }, temper = { "steady" }, values = { "dutiful", "protective" },
  notices = { "soldier", "kit" },

  greetings = {
    { id = "g_hall", text = "Southshore. We're small, we're stubborn, and we're still here. State your business." },
    { id = "g_back", when = { metBefore = true }, text = "Good, you're back. Southshore's short of hands that stay." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You've the bearing of a soldier. Stormwind-trained? Doesn't matter. I'll take you either way." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Those ogres up the hill did that, I'll wager. Get it mended at Aebischer's. Then go back and return the favour." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Marshal Redpath. I was headman here when the first boats came from Stormwind, full of people with nothing left. Now I'm marshal, and the town's full of their children." },
        { id = "h_crushridge", tags = { "news" }, when = { questActive = TODO_QUEST("Crushridge Bounty") },
          text = "The Crushridge ogres come down out of Alterac and take whatever's loose. Including people. Thin them, and the hills breathe easier." },
        { id = "h_farren", when = { heardLine = "farren.h_default" },
          text = "Farren told you how much he hates it here? He tells everyone. I gave him the murlocs. He gave them to you, I suppose." },
      },
      choices = {
        { text = "The first boats from Stormwind?", next = "boats" },
        { text = "What threatens Southshore?", next = "threats" },
        { text = "I'll help.", next = "END", fx = { affinity = 2, standing = { southshore = 1 } } },
      },
    },
    boats = {
      big = true,
      lines = {
        { id = "b_default", key = true,
          text = "After Stormwind fell, the first time. Lothar came off the lead ship, and a young mage with him called Khadgar. I put my fastest rider on the road to King Terenas that same hour. Willem rode like the dead were after him. They nearly were." },
      },
      choices = {
        { text = "You met Lothar?", next = "lothar" },
        { text = "That's a lot of history.", next = "END", fx = { affinity = 1 } },
      },
    },
    lothar = {
      lines = { { id = "l_default", text = "For an hour. Tired, soaked, grieving, and still the most dangerous man I'd ever seen. I've never forgotten it." } },
      choices = { { text = "...", next = "END" } },
    },
    threats = {
      lines = { { id = "t_default", text = "Murlocs on the coast, naga past them, ogres in the hills. The Syndicate at Durnholde. And the dead in Tarren Mill, who'd like the whole valley." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    defias = { { id = "tp_defias", text = "Stormwind's thieves? We've our own. The Syndicate. Same rot, different noble names on the deeds." } },
    _none = { { id = "tp_none", text = "Ask the Magistrate. He's paid to know things. I'm paid to stand here." } },
  },
}

P:NPC {
  key = "maleb", id = TODO_NPC("Magistrate Henry Maleb"), name = "Magistrate Henry Maleb",
  bible = "bibles/hillsbrad.md", role = "noble", tier = "quest",
  communities = { "southshore" }, temper = { "weary" }, values = { "lawful", "dutiful" },
  notices = { "status" },

  greetings = {
    { id = "g_office", text = "Sit, sit. Don't mind the papers. The Syndicate keep me in reading." },
  },

  notice = {
    { id = "n_rogue", cat = "status", when = { class = "ROGUE" },
      text = "I'll speak plainly, since you look like someone who reads between lines anyway. The Syndicate wear faces like yours. Prove you're not one of them." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Henry Maleb, Magistrate of Southshore. I was thrilled to be given the post so young. Some evenings I wonder if I'd have done better as a clerk in Stormwind." },
        { id = "h_assassins", tags = { "news" }, when = { questActive = TODO_QUEST("Syndicate Assassins") },
          text = "Syndicate assassins, in the hills above town. Paid killers. Someone's paying them, and I want to know who. Start by finding out what they carry." },
        { id = "h_plans", when = { questActive = TODO_QUEST("Foreboding Plans") },
          text = "These plans name names. Old names. Alterac's nobility never died; it just learned to hire better." },
        { id = "h_council", tags = { "news" }, when = { questActive = TODO_QUEST("Dark Council") },
          text = "Whoever pulls these strings meets somewhere up in the mountains. Break them, and you'll do more for Southshore than ten years of my letters." },
      },
      choices = {
        { text = "Who are the Syndicate?", next = "syndicate" },
        { text = "Why not go back to Stormwind?", next = "stormwind" },
        { text = "Good day, Magistrate.", next = "END" },
      },
    },
    syndicate = {
      big = true,
      lines = {
        { id = "s_default", text = "Alterac's lords, or their heirs, who never forgave the Alliance for taking their kingdom away. They took Durnholde and called it a home. They'd take Southshore too, if we let them." },
      },
      choices = {
        { text = "Then we won't let them.", next = "END", fx = { affinity = 2, align = { order = 1 } } },
      },
    },
    stormwind = {
      lines = { { id = "st_default", text = "Because someone has to keep the law here, and everyone else who could has already gone. That's how most magistrates are made, I suspect." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    defias = { { id = "tp_defias", text = "A Stormwind problem. I've a Syndicate problem. I'd trade, some days." } },
    _none = { { id = "tp_none", text = "Not before the court. Ask Redpath; he knows the ground." } },
  },
}

P:NPC {
  key = "farren", id = TODO_NPC("Lieutenant Farren Orinelle"), name = "Lieutenant Farren Orinelle",
  bible = "bibles/hillsbrad.md", role = "soldier", tier = "quest",
  communities = { "southshore" }, temper = { "sulky" }, values = { "ambitious" },
  notices = { "drink" },

  greetings = {
    { id = "g_inn", text = "Pull up a chair. Not that one. That's mine. They're all mine, actually, I've been here so long." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ah, a fellow sufferer. Southshore drives everyone to it eventually. You're just ahead of schedule." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Lieutenant Farren Orinelle, late of the Stormwind City Guard. Now I'm in charge of murlocs, in a fishing town, at the end of the world. I'm told it builds character." },
        { id = "h_proof", tags = { "news" }, when = { questActive = TODO_QUEST("Farren's Proof") },
          text = "Redpath wants proof the murlocs are being dealt with. Deal with them, bring me proof, and I'll pass it up as if I'd been out there. Everyone wins." },
        { id = "h_stormwind", when = { questActive = TODO_QUEST("Stormwind Ho!") },
          text = "If I can show the city I've cleaned up this coast, they'll have to call me home. Please. I'm begging you, in a dignified way." },
        { id = "h_reassign", when = { questDone = TODO_QUEST("Reassignment") },
          text = "Still waiting on the reply. Any day now. Any day. I've packed. I've been packed for a month." },
      },
      choices = {
        { text = "Why do you hate it here?", next = "hate" },
        { text = "Fine, I'll deal with the murlocs.", next = "END", fx = { affinity = 1 } },
      },
    },
    hate = {
      big = true,
      lines = {
        { id = "h2_default", text = "It smells of fish, it rains sideways, and the most exciting thing that happens is the Forsaken trying to kill us. In Stormwind I had a uniform people respected. Here I have gulls." },
      },
      choices = {
        { text = "The people here need you.", next = "need", fx = { trait = { kind = 1 } } },
        { text = "Sounds rough.", next = "END", fx = { affinity = 1 } },
      },
    },
    need = {
      lines = { { id = "n_default", text = "...Low blow. Accurate, but low. Go and kill some murlocs before I start feeling guilty." } },
      choices = { { text = "...", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Couldn't tell you. I've stopped learning things about Southshore. It only encourages it." } },
  },
}

P:NPC {
  key = "bilger", id = TODO_NPC("Brewmeister Bilger"), name = "Brewmeister Bilger",
  bible = "bibles/hillsbrad.md", role = "citizen", tier = "quest",
  communities = { "southshore" }, temper = { "rueful" }, values = { "honest" },
  notices = { "paladin", "drink" },

  greetings = {
    { id = "g_cellar", text = "Careful o' the casks, lad. Lass. Whoever ye are. Hic. They're older than you an' better behaved." },
  },

  notice = {
    { id = "n_paladin", cat = "paladin", when = { class = "PALADIN" },
      text = "A paladin. Hic. I was one o' you, once. Silver Hand, back when the Hand meant somethin'. Don't look at me like that. I know what I look like." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ah, ye've been at it too! Hic. Good. I hate drinkin' with sober folk. They count." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Bilger. I brew. Hic. Used to be a knight of the Silver Hand, strict as a church bell, never touched a drop. Then the Hand broke, an' I found out what I'd been missin'." },
        { id = "h_moonshine", tags = { "news" }, when = { questActive = TODO_QUEST("MacKreel's Moonshine") },
          text = "MacKreel's moonshine! Now that's a brew. Hic. Get me a jug an' I'll tell ye a story about Uther that'll curl yer hair." },
      },
      choices = {
        { text = "What happened to the Silver Hand?", next = "hand" },
        { text = "Maybe ease off the brew?", next = "ease" },
        { text = "Cheers.", next = "END" },
      },
    },
    hand = {
      big = true,
      lines = {
        { id = "h2_default", text = "Uther died. Arthas did that. Hic. The rest of us scattered like rabbits. Some kept the faith. Some found a cellar. I'm no' proud of which one I am." },
      },
      choices = {
        { text = "It's not too late to go back.", next = "back", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I understand.", next = "END", fx = { affinity = 1 } },
      },
    },
    back = {
      lines = { { id = "b_default", text = "...Maybe. Hic. Ask me again when I'm sober. Bring breakfast. It'll be a while." } },
      choices = { { text = "...", next = "END" } },
    },
    ease = {
      lines = { { id = "e_default", text = "Ease off? I'm a brewmeister! It's research. Hic. Very serious research." } },
      choices = { { text = "Ha.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Dunno. Hic. Ask me after the next cask." } },
  },
}

P:NPC {
  key = "dibbs", id = TODO_NPC("Loremaster Dibbs"), name = "Loremaster Dibbs",
  bible = "bibles/hillsbrad.md", role = "scholar", tier = "quest",
  communities = { "southshore" }, temper = { "dry" }, values = { "curious", "careful" },
  notices = { "lore" },

  greetings = {
    { id = "g_books", text = "If you've come about the books, sit. If you've come about anything else, sit anyway; I'll get to the books." },
  },

  notice = {
    { id = "n_book", cat = "lore", when = { bookRead = "The Seven Kingdoms" },
      text = "The Seven Kingdoms. Good. Then you know Alterac was one of them, once. Most of its library is now ogre bedding." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Dibbs. I collect what's left of the old kingdom's knowledge before the ogres finish using it to start their fires. It's slow work. They're quick readers, in their way." },
        { id = "h_milton", when = { heardLine = "milton.h_default" },
          text = "Milton Sheaf sent you? Of course he did. Tell him I've three crates of Alterac's records for him, and one of them is mostly soot." },
        { id = "h_preserve", tags = { "news" }, when = { questActive = TODO_QUEST("Preserving Knowledge") },
          text = "Books still lie in the ruins of Alterac. The ogres have been at them. Bring me what you can save. Gently." },
        { id = "h_parchment", when = { questActive = TODO_QUEST("The Ensorcelled Parchment") },
          text = "This parchment has magic woven through it. Don't fold it. Don't read it aloud. Actually, don't read it at all." },
      },
      choices = {
        { text = "What did the ogres do?", next = "ogres" },
        { text = "Good luck with the books.", next = "END" },
      },
    },
    ogres = {
      lines = { { id = "o_default", text = "Burned some, sat on others, and used a history of the Alterac succession to prop up a table. Honestly, the history deserved it." } },
      choices = { { text = "Ha.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    seven_kingdoms = { { id = "tp_seven", text = "Seven, until Alterac sold itself to the Horde and stopped being one. The books remember. The ogres are working on that." } },
    _none = { { id = "tp_none", text = "Not in anything I've saved. Which isn't to say it isn't in something I haven't." } },
  },
}

P:NPC {
  key = "anderson", id = TODO_NPC("Innkeeper Anderson"), name = "Innkeeper Anderson",
  bible = "bibles/hillsbrad.md", role = "innkeeper", tier = "service",
  communities = { "southshore" }, temper = { "steady" }, values = { "practical" },
  notices = { "weary" },

  greetings = {
    { id = "g_inn", text = "Shut the door, the rain gets in. Bed, food or both? Both, you look like." },
    { id = "g_home", when = { homeInn = { "Southshore" } }, text = "Your room's dry. Mostly. The corner leaks. All the corners leak." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Up against the Syndicate, were you? Or the ogres? Sit. Fish stew. It's always fish stew. It's a fishing town." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Anderson. I keep the inn. Fishermen, soldiers, and a lieutenant who's been sitting in that chair since last spring." },
        { id = "h_bilger", when = { heardLine = "bilger.h_default" },
          text = "Bilger told you he was a paladin? He was. A good one, my father said. I keep the cellar unlocked for him. Somebody should be kind to him." },
        { id = "h_chair", when = { metBefore = true }, text = "The lieutenant asked for his usual. I didn't have to ask what. That's either a good inn or a sad story. Both, maybe." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Fishermen come in at this hour smelling of the bay. I keep the windows open. Lord knows why. Habit." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Just resting.", next = "END" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask the Marshal. He knows everyone in town by name and most of their grandparents." } },
  },
}
