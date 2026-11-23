-- The Deadmines: Edwin VanCleef, the stonemason who became the Defias kingpin, and Mr. Smite,
-- his tauren first mate, both have words for intruders before the fighting starts.
-- Voices: bibles/dg_vancleef.md, bibles/dg_mr_smite.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Edwin VanCleef: master of the Stonemasons' Guild, cheated by Stormwind's nobles.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_vancleef", id = TODO_NPC("Edwin VanCleef"), name = "Edwin VanCleef", title = "Defias Kingpin",
  bible = "bibles/dg_vancleef.md", role = "boss", tier = "major",
  temper = { "bitter", "proud" }, values = { "just", "vengeful" },
  notices = { "race", "class" },
  impression = {
    first = "Under the mask, his voice is that of a tired craftsman, not a bandit.",
    third = "{name} confronted Edwin VanCleef aboard his ship in the Deadmines.",
  },

  greetings = {
    { id = "g_default", text = "So Stormwind finally sent someone down here. I expected more of you, or at least someone better paid." },
    { id = "g_defias", when = { questActive = TODO_QUEST("The Defias Brotherhood") }, text = "Gryan Stoutmantle sent you, I suppose. Tell him from me that he picked the wrong side, if you live long enough to tell anyone anything." },
  },

  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "A Stormwind face. Did you know your city stands on our stone? Every wall you walk past, my men laid, and none of us were paid for it." },
    { id = "n_horde", cat = "race", when = { race = { "Orc", "Troll", "Tauren", "Scourge" } },
      text = "The Horde, in my mine. I didn't think anyone outside Stormwind cared what happens in Westfall. Strange, how that works." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A rogue. If the world were fairer, you'd be one of mine. The Brotherhood could always use quiet hands." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Edwin VanCleef. I was master of the Stonemasons' Guild once, and I rebuilt Stormwind from its ashes. Now they call me a bandit, because I asked to be paid." },
      },
      again = { { id = "h_again", text = "Say what you came to say, then. My crew is listening, and they get impatient." } },
      choices = {
        { text = "What happened with the stonemasons?", next = "masons" },
        { text = "Your Brotherhood is murdering Westfall farmers.", next = "westfall" },
        { text = "What are you building down here?", next = "ship" },
        { text = "Who else stands behind the Defias?", next = "backers" },
        { text = "This ends now, VanCleef.", next = "END" },
      },
    },
    masons = {
      lines = { { id = "m_default", text = "After the orcs burned Stormwind, we rebuilt it stone by stone, and the House of Nobles promised to pay us when the work was done. When it was done, they decided they couldn't afford us. When we protested, they called it riot and sent the guard." } },
      choices = {
        { text = "That was a real injustice.", next = "injustice" },
        { text = "Something else.", next = "BACK" },
      },
    },
    injustice = {
      lines = { { id = "i_default", text = "It was, and nobody in a fine house lost a night's sleep over it. So we left the city, every mason who'd follow me, and we swore Stormwind would pay what it owes one way or another." } },
      choices = {
        { text = "Your grievance is just, but your methods aren't.", next = "BACK", reply = "Spoken like someone who's never been cheated by a king. Justice doesn't come to people like us when we ask politely.", fx = { align = { order = 1 } } },
        { text = "When the law fails, people take what's owed.", next = "BACK", reply = "Exactly, and that's all the Brotherhood is. Pity you've come to stand in our way.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    westfall = {
      lines = { { id = "w_default", text = "Westfall was hungry before we ever came, and Stormwind left it that way. Some of my people are cruel, I'll grant you. But the farmers who joined us did it because the crown had already forgotten them." } },
      choices = {
        { text = "That doesn't excuse killing them.", next = "BACK", reply = "No, it doesn't. Neither does the crown's neglect, and nobody's marched on them yet.", fx = { align = { light = 1 } } },
        { text = "War has costs. You chose to pay them.", next = "BACK", reply = "I did, and I'd make the same choice again. Somebody had to make Stormwind feel it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ship = {
      lines = { { id = "s_default", text = "A juggernaut, the finest ship ever built by honest hands. When she's ready, the Brotherhood will sail where we please, and Stormwind's harbor will learn what masons can build when they're properly motivated." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    backers = {
      lines = { { id = "b_default", text = "You'd love a name, wouldn't you? Let's say not every friend of the Brotherhood lives in a mine. Some of them wear silk and sit very near the throne." } },
      choices = {
        { text = "You're lying to save yourself.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    defias = { { id = "tp_def", text = "The Defias Brotherhood, my masons and everyone who's been cheated alongside us.", next = "masons" } },
    _none = { { id = "tp_none", text = "I don't care to discuss that. We're both busy, I think." } },
  },
}

---------------------------------------------------------------------------
-- Mr. Smite: VanCleef's tauren first mate, guarding the cove.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_mr_smite", id = TODO_NPC("Mr. Smite"), name = "Mr. Smite",
  bible = "bibles/dg_mr_smite.md", role = "boss", tier = "quest",
  temper = { "gruff", "blunt" }, values = { "loyal", "practical" },
  notices = { "race" },
  impression = {
    first = "He's huge, patient, and carries a hammer like it weighs nothing.",
    third = "{name} met Mr. Smite, VanCleef's first mate, in the Deadmines.",
  },

  greetings = {
    { id = "g_default", text = "We're under attack! Somebody tell the boss... oh. It's just you, then." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "One of my own people. You're a long way from Mulgore, same as me, and I won't pretend it's comfortable seeing you here." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Mr. Smite, first mate to the boss. I keep the crew in line and the intruders out, and I'm better at the second than I look." },
      },
      again = { { id = "h_again", text = "You still want to talk? All right. For now." } },
      choices = {
        { text = "How did a tauren end up here?", next = "tauren" },
        { text = "Why follow VanCleef?", next = "loyal" },
        { text = "Step aside and nobody gets hurt.", next = "aside" },
        { text = "Let's settle this.", next = "END" },
      },
    },
    tauren = {
      lines = { { id = "t_default", text = "I worked the ships out of the Eastern Kingdoms before the Brotherhood found me, hauling cargo nobody else would touch. When the boss needed someone who could swing a hammer and keep his mouth shut, I was nearest." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    loyal = {
      lines = { { id = "l_default", text = "He pays, and he keeps his word to his own. That's more than I can say for most captains, and more than I can say for Stormwind." } },
      choices = {
        { text = "Loyalty to a killer isn't worth much.", next = "BACK", reply = "Everyone's a killer in somebody's story. I'll take a captain who keeps his word.", fx = { align = { order = 1 } } },
        { text = "A captain who keeps his word is rare.", next = "BACK", reply = "Now you're talking sense. Shame about what happens next.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    aside = {
      lines = { { id = "a_default", text = "That's what the last group said, and the one before that. I've lost track of how many, honestly. Pick up your weapon, and let's be done with it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask the boss. I just hit things." } },
  },
}
