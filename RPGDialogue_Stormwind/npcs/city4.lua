-- Stormwind, part four: the general at the gate, the goblin at SI:7, the captain in the
-- throne room, and the baker who never stops walking. Voice: bibles/city4.md
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "marcus", id = TODO_NPC("General Marcus Jonathan"), name = "General Marcus Jonathan",
  bible = "bibles/city4.md", role = "soldier", tier = "major",
  communities = { "stormwind" }, temper = { "steady" }, values = { "dutiful", "courteous" },
  notices = { "soldier", "kit" },

  greetings = {
    { id = "g_gate", text = "Well met. The Valley of Heroes is open to all who come in peace. Keep your blade sheathed and you'll find us friendly." },
    { id = "g_back", when = { metBefore = true }, text = "Good, you've come back. I like faces that come back." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You stand like a soldier. Stormwind's army could use you, if you ever tire of the road. We all tire of it eventually." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You've been in a real fight. Get to the smiths in the Dwarven District before you go back out. That's an order. A friendly one." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "General Marcus Jonathan, High Commander of Stormwind's defence. I keep the city's walls and its army, such as the kingdom can spare of it." },
        { id = "h_messenger", tags = { "news" }, when = { questActive = TODO_QUEST("Messenger to Stormwind") },
          text = "Magistrate Solomon writes again. Reinforcements for Lakeshire. I'll take it to the throne myself. Tell him the army hasn't forgotten Redridge." },
        { id = "h_messenger_done", when = { questDone = TODO_QUEST("Messenger to Stormwind") },
          text = "I promised Solomon support, and I meant it. Whether the Keep lets me send it is another matter. Between us." },
        { id = "h_solomon", when = { heardLine = "solomon.s_default" },
          text = "Solomon's letters reach me. Every one. I read them twice. I can't answer them the way he'd like, and that sits badly with me." },
      },
      choices = {
        { text = "Why won't the army help Lakeshire?", next = "army" },
        { text = "Good day, General.", next = "END", fx = { affinity = 1 } },
      },
    },
    army = {
      big = true,
      lines = {
        { id = "a_default", text = "It will. When the orders come. I've asked. I keep asking. The Regent has many voices in his ear, and not all of them speak for the soldiers." },
      },
      choices = {
        { text = "Whose voices?", next = "voices", fx = { trait = { curious = 1 } } },
        { text = "Keep asking.", next = "END", fx = { affinity = 2, align = { order = 1 } } },
      },
    },
    voices = {
      lines = { { id = "v_default", text = "That's above a general's rank to say. I'll only say I salute the Regent, and I watch the court." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    defias = { { id = "tp_defias", text = "A Westfall matter, the court says. A soldier's matter, I say. We'll see who's right." } },
    blackrock = { { id = "tp_blackrock", text = "Orcs in Redridge, near enough to see from Lakeshire's walls. Near enough to worry me." } },
    _none = { { id = "tp_none", text = "Not a military matter. Try City Hall." } },
  },
}

P:NPC {
  key = "renzik", id = TODO_NPC("Renzik \"The Shiv\""), name = "Renzik \"The Shiv\"",
  bible = "bibles/city4.md", role = "trainer", tier = "quest",
  communities = { "stormwind" }, temper = { "prickly" }, values = { "proud", "practical" },
  notices = { "class", "stealth" },

  greetings = {
    { id = "g_rogue", when = { class = "ROGUE" }, text = "You got potential. Renzik can see it. Renzik can also see you're about to get yourself killed. Let's fix that." },
    { id = "g_other", when = { ["not"] = { class = "ROGUE" } }, text = "You lost? This ain't the bank. Renzik don't do visitors." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "Cute. Renzik saw you come in. Renzik sees everybody come in. That's the job." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Renzik. People call me the Shiv. Second to the boss here at SI:7. I don't like people much, but I like being the guy they gotta be polite to." },
        { id = "h_si7", tags = { "news" }, when = { questActive = TODO_QUEST("SI:7") },
          text = "So you wanna work for us. Good. First you gotta not die. Go see Lucius in Redridge. He'll teach you the parts that keep you breathing." },
        { id = "h_redridge", when = { questActive = TODO_QUEST("Redridge Rendezvous") },
          text = "Lucius is a pro. Do what he says, how he says. Don't improvise. Improvisers end up in rivers." },
        { id = "h_shakedown", when = { questActive = TODO_QUEST("Kingly Shakedown") },
          text = "Some people forget who they owe. Remind 'em. Politely, if they're polite. Otherwise, the other way." },
        { id = "h_shaw", when = { heardLine = "shaw.h_default" },
          text = "Talked to the boss, huh? He don't say much. Renzik says the rest. That's the arrangement." },
      },
      choices = {
        { text = "Why do you talk about yourself like that?", next = "third" },
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "I'll go.", next = "END" },
      },
    },
    third = {
      big = true,
      lines = {
        { id = "t_default", text = "Because Renzik is a reputation, pal. Me? I'm a goblin in a back room. Renzik is the guy nobody wants to meet in an alley. Gotta keep the reputation fed." },
      },
      choices = { { text = "Fair enough.", next = "END", fx = { affinity = 2 } } },
    },
  },

  topics = {
    defias = { { id = "tp_defias", text = "SI:7's business. Which means none of yours. Unless you want it to be. Then talk to Renzik." } },
    _none = { { id = "tp_none", text = "Renzik don't know. And if Renzik don't know, it ain't worth knowing." } },
  },
}

P:NPC {
  key = "samuelson", id = TODO_NPC("Major Samuelson"), name = "Major Samuelson",
  bible = "bibles/city4.md", role = "guard", tier = "quest",
  communities = { "stormwind" }, temper = { "curt" }, values = { "dutiful" },
  notices = { "soldier" },

  greetings = {
    { id = "g_throne", text = "This is the King's throne room. Conduct yourself accordingly." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You carry yourself like you've been drilled. Good. Too many come in here like they're entering a tavern." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Major Samuelson, captain of the guard in the Keep. I keep the throne room orderly and the people in it safe. That's all you need to know." },
        { id = "h_farren", when = { heardLine = "farren.h_default" },
          text = "Orinelle. I trained him. He's a good officer who thinks he's wasted in Southshore. He isn't. Don't tell him I said so." },
        { id = "h_reassign", tags = { "news" }, when = { questActive = TODO_QUEST("Reassignment") },
          text = "Orinelle's asking to come home again. Tell him his request has been received. Tell him nothing else." },
      },
      choices = {
        { text = "Who do you guard?", next = "guard" },
        { text = "I'll go.", next = "END" },
      },
    },
    guard = {
      lines = { { id = "g2_default", text = "The Regent. The young King. The court. Everyone who stands in this room, whether I'd choose to guard them or not." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Not my concern. My concern is this room." } },
  },
}

P:NPC {
  key = "thomas_miller", id = TODO_NPC("Thomas Miller"), name = "Thomas Miller",
  bible = "bibles/city4.md", role = "vendor", tier = "service",
  communities = { "stormwind" }, temper = { "cheerful" }, values = { "hardworking" },
  notices = { "hunger" },

  barks = {
    { id = "b_bread", text = "Bread! Hot from the oven, or near enough!" },
    { id = "b_loaf", text = "A loaf for the road, a loaf for the pocket, a loaf for later!" },
  },
  greetings = {
    { id = "g_bread", text = "Bread, friend? Best price in the Trade District, and I'll stand behind every crust." },
  },

  notice = {
    { id = "n_hungry", cat = "hunger", when = { durability = { max = 0.25 } },
      text = "You look like you haven't eaten since Goldshire. Have a roll. Go on. Then buy six." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Thomas Miller, baker. I walk the Trade District from dawn to dusk with a basket. My feet hate me. My customers love me. It evens out." },
      },
      choices = {
        { text = "Show me your bread.", next = "BUSINESS" },
        { text = "Why not open a shop?", next = "shop" },
        { text = "Not hungry.", next = "END" },
      },
    },
    shop = {
      lines = { { id = "s_default", text = "A shop waits for customers. A basket goes and finds them. Besides, the rent in this city would make a dwarf weep." } },
      choices = { { text = "Ha.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I only know bread, friend. And which streets have the best customers." } },
  },
}
