-- Grark Lorkrub: a Kargath orc who sold the Horde's plans to the Blackrock and now sits under their protection in Blackrock Stronghold. Voice: bibles/grark.md
local P = RPGDialogueAPI:Pack("rpgd.burningsteppes")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "grark", id = TODO_NPC("Grark Lorkrub"), name = "Grark Lorkrub",
  bible = "bibles/grark.md", role = "questgiver", tier = "quest",
  communities = { "blackrock_stronghold" }, temper = { "sneering", "defiant" }, values = { "ambitious", "proud" },
  notices = { "race", "class" },

  impression = {
    first = "Grark Lorkrub sold Kargath to the Blackrock and isn't the least bit sorry. He talks about the power he's joined as though I ought to envy him, and I think part of him really believes I do.",
    third = "{name} found Grark Lorkrub, a Horde traitor sheltering with the Blackrock clan, in Blackrock Stronghold in the Burning Steppes.",
  },

  greetings = {
    { id = "g_default", text = "Another of Lexlort's errand-runners, come all this way into a Blackrock fortress. Brave, or very stupid, and I've lost money betting on the first one before." },
    { id = "g_back", when = { metBefore = true }, text = "Still alive? The Blackrock must be getting soft, and they were the last orcs with any blood left in them." },
    { id = "g_chained", when = { questActive = TODO_QUEST("Precarious Predicament") }, text = "These shackles won't hold me for long, and they won't hold you up either, when my friends come." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc, still wearing the Warchief's collar and calling it freedom. You'll understand one day, if you live." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman, begging rocks and wind for favours. The Blackrock never begged for anything, and look at their fortress." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Grark Lorkrub, and if Kargath sent you, then you've come to drag me back for Goretooth's axe. Can you not see the power we gain by joining the legion of Blackrock?" },
        { id = "h_bound", tags = { "news" }, when = { questActive = TODO_QUEST("Precarious Predicament") },
          text = "Do you really believe you'll make it to your rendezvous with me in custody? You broke into a fortress to take a prized asset of theirs, and you think nobody noticed?" },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "Alliance, here? The Blackrock will mount your head beside the others, and I'll watch from a comfortable distance." },
      },
      again = {
        { id = "h_again", text = "Anything else, slave of Thrall, before the guards notice you?" },
        { id = "h_again2", text = "Speak, then, since you've walked so far to hear me." },
      },
      choices = {
        { text = "Why did you betray Kargath?", next = "why" },
        { text = "You told the Blackrock plenty, I'd wager.", next = "secrets" },
        { text = "What do you think happens to you now?", next = "fate" },
        { text = "I'm Horde. You betrayed my people.", next = "xhorde", when = { faction = "Horde" } },
        { text = "The Blackrock will use you and discard you.", next = "xorc", when = { race = "Orc" } },
        { text = "Enough talk.", next = "END" },
      },
    },

    why = {
      lines = {
        { id = "wh_default", text = "Because Kargath is a dusty fort full of soldiers who'll die defending a Warchief who's never even seen it. The Blackrock have a mountain, an army and dragons at their call, and I like to be on the side that's winning." },
      },
      choices = {
        { text = "Winning? They're renegades in a mountain.", next = "why_power" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_power = {
      lines = {
        { id = "wp_default", text = "Renegades who've held this mountain since the Second War, while Thrall's Horde was rotting in human camps. Ask yourself which of us has been free longer." },
      },
      choices = {
        { text = "Freedom built on demons and dragons isn't freedom.", next = "BACK", reply = "Spoken like a dog who's never tasted real meat. The Blackrock feast while Kargath eats dust, and you call that freedom.", fx = { align = { order = 1 } } },
        { text = "Strength is strength. I can see the appeal.", next = "BACK", reply = "Of course you can, because you've got eyes. Kargath will never give you what the Blackrock gave me, so think on that on the long road home.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    secrets = {
      lines = {
        { id = "se_default", text = "Kargath's day to day operations, patrols, supply runs, who sleeps where and when the watch changes. Lexlort caught me with the papers in my hand, I'll give him that, but he caught me too late." },
      },
      choices = {
        { text = "Soldiers died because of what you told them.", next = "secrets_cost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    secrets_cost = {
      lines = {
        { id = "sc_default", text = "Some, and more will, because the Blackrock don't forget what they're told. I didn't hold the blades, so don't look at me as though I did." },
      },
      choices = {
        { text = "You held the map. That's worse.", next = "BACK", reply = "Worse, is it? A map never killed anyone, whelp, and the hands that used it belong to braver orcs than you.", fx = { align = { honor = 1 } } },
        { text = "War's war. Information's a weapon like any other.", next = "BACK", reply = "Now you talk like someone who's lived through a war. Kargath forgets that when it calls me traitor, and it won't remember until it's too late.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    fate = {
      lines = {
        { id = "fa_default", text = "You'll try to walk me through Blackrock Mountain to the Searing Gorge, where Lexlort's men are waiting, I suppose. You'll be destroyed long before then." },
        { id = "fa_bound", when = { questActive = TODO_QUEST("Precarious Predicament") },
          text = "You'll drag me through the mountain with every Blackrock and Dark Iron between here and the Gorge on our heels. I almost hope you get far enough to see Lexlort's face when you don't arrive." },
      },
      choices = {
        { text = "And if I make it?", next = "fate_kargath" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fate_kargath = {
      lines = {
        { id = "fk_default", text = "Then Goretooth will have me killed, and I'll die knowing the Blackrock have Kargath's measure. I'd call that a fair trade, though you won't." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    xhorde = {
      big = true,
      lines = {
        { id = "xh_default", text = "Your people? I've been Horde longer than you, whelp, and I've watched it go soft under a Warchief who makes peace with humans. The Blackrock remember what we were, and so do I." },
      },
      choices = {
        { text = "What we were nearly destroyed us. Thrall saved us.", next = "BACK", reply = "Thrall saved us by teaching us to bow to humans. I'll take the old blood and the old fire over that kind of salvation every time.", fx = { align = { light = 1 } } },
        { text = "Maybe we did go soft. But you're still a traitor.", next = "BACK", reply = "Traitor to a Horde that forgot itself, aye, and I'll wear the name gladly. At least you have the guts to admit what you see.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorc = {
      big = true,
      lines = {
        { id = "xo_default", text = "Maybe, but they use me as a lieutenant uses a blade, and Kargath used me as a mule. Better to be a tool someone values than a beast someone forgets." },
      },
      choices = {
        { text = "A free orc is no one's tool.", next = "BACK", reply = "Pretty words for a mule in a free orc's harness. Go back to Kargath and tell me how free you feel.", fx = { align = { honor = 1 } } },
        { text = "Everyone's someone's tool. You chose badly.", next = "BACK", reply = "Badly, you say, from where you stand on that dirt. Come up and see the forges in Blackrock Spire, and then tell me again.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I served at Kargath until I found a better master, one who still remembers the strength the old Horde had. That's all you need to know." } },
    advice = { { id = "tp_ad", text = "Always know who's winning, and stand beside them before they've won." } },
    thrall = {
      { id = "tp_thrall", text = "The Warchief is a fool who's made the Horde soft, and I've found a stronger master. I don't expect you to understand." },
      { id = "tp_thrall2", when = { faction = "Horde" }, text = "You serve the slave-born fool too, then, and you'll learn soon enough that the old ways were stronger. I'll be here when you do." },
    },
    blackrock = { { id = "tp_blackrock", text = "The Blackrock clan remembers what the Horde was, before Thrall made us weak. I serve them now, and I'm not sorry." } },
    blackrock_spire = { { id = "tp_blackrock_spire", text = "The Spire is a fortress no army can take, and I'm safe inside it. Kargath can scream all it likes." } },
    black_dragonflight = { { id = "tp_black_dragonflight", text = "The black dragons rule the Spire, and they reward those who serve them. You should consider it." } },
    _none = { { id = "tp_none", text = "Why would I tell you anything for free? Honor never filled my purse." } },
  },
}
