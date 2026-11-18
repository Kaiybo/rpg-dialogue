-- Galvan the Ancient: master armorsmith of the Mithril Order, camped south of the Zul'Gurub gate, who holds that mithril is noble and truesilver a liar. Voice: bibles/galvan.md
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "galvan", id = TODO_NPC("Galvan the Ancient"), name = "Galvan the Ancient",
  bible = "bibles/galvan.md", role = "blacksmith", tier = "quest",
  communities = { "stranglethorn" }, temper = { "boisterous", "eccentric" }, values = { "craft", "proud" },
  notices = { "profession", "kit" },

  impression = {
    first = "Galvan the Ancient speaks of himself by name and of truesilver as if she once broke his heart. He's loud and odd and plainly a master, and he trusts a hard worker more than any title.",
    third = "{name} met Galvan the Ancient, master armorsmith of the Mithril Order, at his camp near the gates of Zul'Gurub.",
  },

  greetings = {
    { id = "g_default", text = "HAH! A visitor, at Galvan's anvil, in the middle of the troll jungle! Either you're lost or you're a smith, and you don't look lost." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Galvan hopes you've brought bars, because Galvan has brought lessons." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and the forge hasn't cooled a moment. Galvan doesn't wait for anyone, but he's glad you came back." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 6 }, text = "You're stronger than you were, Galvan can see it in your shoulders. A smith needs good shoulders, and so does anyone who walks this jungle." },
  },

  notice = {
    { id = "n_smith", cat = "profession", when = { profession = "Blacksmithing" },
      text = "Hands like yours have held a hammer, Galvan can tell from a league away. Show me your burns, and Galvan will tell you what you've been doing wrong." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armor's crying out for a hammer, friend, and Galvan can hear it. Mithril would never have let you down like that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Galvan the Ancient, of the Mithril Order, and for many long years Galvan has gathered more knowledge of armorsmithing than any dwarf alive. The Order sends Galvan its best, and Galvan sends them away better." },
        { id = "h_smelt", tags = { "news" }, when = { questActive = TODO_QUEST("Smelt On, Smelt Off") },
          text = "Bring Galvan forty bars of iron and forty of mithril, every one dug and smelted yourself, or Galvan will know! There can be no blacksmithing without mining, and that's the first lesson." },
        { id = "h_silver", tags = { "news" }, when = { questActive = TODO_QUEST("The Great Silver Deceiver") },
          text = "Bring Galvan forty bars of mithril and five of truesilver, and you'll learn for yourself that truesilver is a liar! She's a cruel mistress, and Galvan has the burned eyebrows to prove it." },
        { id = "h_expert", tags = { "news" }, when = { questRecent = { TODO_QUEST("Expert Blacksmith!"), days = 3 } },
          text = "One of Galvan's finest pupils, and Galvan knew it the day you walked in! You've earned the title of expert, and such devotion deserves a reward." },
        { id = "h_felbane", tags = { "news" }, when = { questActive = TODO_QUEST("Enchanted Azsharite Fel Weaponry") },
          text = "Give Galvan a moment with your fel weapon, for fel steel takes its time and burns the hand that rushes it. Galvan won't hurry a blade meant for demons." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf! Then you know there's no shame in a beard full of soot. Sit by the forge, cousin, and let Galvan tell you about mithril." },
      },
      again = {
        { id = "h_again", text = "What else? Galvan's hammer is listening!" },
        { id = "h_again2", text = "Ask away. The iron's not hot yet." },
      },
      choices = {
        { text = "Why do you call truesilver a liar?", next = "silver" },
        { text = "I've heard of the Mithril Order.", next = "order" },
        { text = "Why set up a forge here, by Zul'Gurub?", next = "camp" },
        { text = "Can you really forge fel steel?", next = "fel", when = { questDone = TODO_QUEST("The Formation of Felbane") } },
        { text = "Teach me about mithril.", next = "xsmith", when = { profession = "Blacksmithing" } },
        { text = "I'd have thought a smith needn't be a miner too.", next = "xminer", when = { profession = "Mining" } },
        { text = "Farewell, Galvan.", next = "END" },
      },
    },

    silver = {
      lines = {
        { id = "si_default", text = "Because they say truesilver is stronger and more durable than mithril, and Galvan doesn't disagree, but contrary to its name, truesilver is not true! Mithril is a far nobler mineral, HAH, and Galvan will die saying so." },
      },
      choices = {
        { text = "What did truesilver do to you?", next = "silver_alterac" },
        { text = "Something else.", next = "BACK" },
      },
    },
    silver_alterac = {
      lines = {
        { id = "sa_default", text = "Galvan spent over a decade in the mountains of Alterac learning her ways, and she lied to him the whole time, shining and promising and cracking in the cold. Mithril never promised anything, and it never broke." },
      },
      choices = {
        { text = "So you prefer the honest metal.", next = "silver_lesson" },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    silver_lesson = {
      lines = {
        { id = "sl_default", text = "Galvan prefers the metal that tells you what it is, and so should you, in smithing and in friends. A shiny thing that cracks is worse than a dull thing that holds." },
      },
      choices = {
        { text = "Plain and steady over shiny and fickle. Agreed.", next = "BACK", reply = "Ha! Galvan could kiss yer forge-black hands for that, if Galvan were the kissing sort, which he is not. Mithril and honest friends, and ye'll never be sorry.", fx = { align = { order = 1 } } },
        { text = "Sometimes the shiny gamble is worth taking.", next = "BACK", reply = "Then Galvan wishes ye luck, and a good surgeon for when the shiny thing shatters in yer hand. He has seen it happen, and the scars were not shiny at all.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    order = {
      lines = {
        { id = "or_default", text = "The finest armorsmiths in the world, and Galvan leads them, more or less, because nobody else wanted to argue with him. When an Order smith finds a student with the skill and the drive, they send them to Galvan." },
      },
      choices = {
        { text = "You must have a finest pupil.", next = "order_pupil" },
        { text = "Something else.", next = "BACK" },
      },
    },
    order_pupil = {
      lines = {
        { id = "op_default", text = "Trenton Lighthammer, in Gadgetzan, and a finer hand with ornate mithril Galvan has never trained. When you've learned all Galvan can teach, go to him, and tell him Galvan sent you." },
      },
      choices = {
        { text = "I'll go when I'm ready.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    camp = {
      lines = {
        { id = "ca_default", text = "Because the jungle hills are full of good ore, and nobody bothers Galvan out here, except the trolls, and Galvan has a very large hammer. Booty Bay was too noisy, all those goblins haggling over every nail." },
      },
      choices = {
        { text = "Aren't you worried about Zul'Gurub?", next = "camp_zg" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_zg = {
      lines = {
        { id = "cz_default", text = "Galvan worries about bad steel, not old ruins full of trolls. If the Gurubashi want to come out and argue, they'll find Galvan's armor doesn't crack, and that'll be a lesson for them too." },
      },
      choices = {
        { text = "Brave words, Galvan.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    fel = {
      lines = {
        { id = "fe_default", text = "Galvan can, with Azsharite and patience, though very few smiths in the world would admit to trying. Fel steel can weaken the demon lord Razelikh, who lurks in the Blasted Lands, and his minions too, and that's the only reason Galvan would touch such a thing." },
      },
      choices = {
        { text = "Is it dangerous to forge?", next = "fel_danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fel_danger = {
      lines = {
        { id = "fd_default", text = "Galvan's eyebrows are still growing back, if that answers you. A finer demon slayer has never existed than the one Galvan makes, but Galvan bathes twice after every forging." },
      },
      choices = {
        { text = "Fighting fire with fel is wise.", next = "BACK", reply = "Aye, so long as ye stand well back from the anvil while it's done. Galvan's eyebrows can vouch that the fel bites the hand that shapes it.", fx = { align = { light = -1 } } },
        { text = "Fel steel is a dark tool, even against demons.", next = "BACK", reply = "A dark tool, aye, and Galvan won't pretend otherwise, but a demon does not care how clean yer conscience is. Use it, wash after, and never grow fond of it.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xsmith = {
      big = true,
      lines = {
        { id = "xs_default", text = "Mithril wants heat, but not too much, and it wants a patient hammer, never an angry one. Fortify it with citrine and it'll hold any enchantment you put to it, and never complain." },
      },
      choices = {
        { text = "Teach me patience at the anvil, master.", next = "BACK", fx = { affinity = 1, trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xminer = {
      big = true,
      lines = {
        { id = "xm_default", text = "Can there be blacksmithing without mining? An impossibility! The accomplished smith must also be an accomplished miner, and Galvan won't hear otherwise." },
      },
      choices = {
        { text = "A smith should dig his own ore. Agreed.", next = "BACK", reply = "At last, somebody with sense in their beard! Ore that ye dug yerself tells ye its secrets on the anvil, and ore ye bought only tells ye the price.", fx = { align = { honor = 1 } } },
        { text = "I'd rather buy my ore than dig for it.", next = "BACK", reply = "Bought ore! Galvan's own apprentices would be thrown in the forge-water for saying such a thing, and Galvan would hold them under a wee while longer.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "A dwarf of the Mithril Order, a decade in Alterac's mountains, a while in Booty Bay, and now a forge in the jungle." } },
    advice = { { id = "tp_ad", text = "Trust mithril, doubt truesilver, and always dig your own ore." } },
    magni = { { id = "tp_magni", text = "King Magni's a fine king, but Galvan has never been one for kings, Galvan likes a good forge and a good ingot better. Still, the man knows his metal." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons make fine steel with poisoned hands, and Galvan has never trusted a dwarf who works for a fire lord. Their forges burn too hot, and Galvan knows what that does to iron." } },
    stromgarde = { { id = "tp_stromgarde", text = "Galvan spent a decade in the mountains near Stromgarde, and the human smiths there were the best Galvan ever saw outside Ironforge. Now they're scattered, and Galvan misses the competition." } },
    alterac = { { id = "tp_alterac", text = "Galvan worked the mines of Alterac before the war, and the ore there was cold and pure as the snow. Galvan would give his beard to work that ore again, but the ogres hold those mines now." } },
    booty_bay = { { id = "tp_booty_bay", text = "Galvan went to Booty Bay once and left with a headache and a lighter purse. The jungle is quieter, and the mithril listens better." } },
    _none = { { id = "tp_none", text = "Galvan knows metal, not that! Ask him about mithril instead." } },
  },
}
