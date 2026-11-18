-- Betty Quin, Cordell's Enchanting (second floor), Mage Quarter canals, Stormwind. Voice: bibles/betty_quin.md
-- Lucan Cordell's journeyman. Young, eager, a little scorched. Forever: gives Camping 101: Enchanting.
local P = RPGDialogueAPI:Pack("rpgd.stormwind")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

local CAMP = TODO_QUEST("Camping 101: Enchanting")

P:NPC {
  key = "betty_quin", id = TODO_NPC("Betty Quin"), name = "Betty Quin",
  bible = "bibles/betty_quin.md", role = "trainer", tier = "quest",
  communities = { "stormwind" }, temper = { "warm", "eager" }, values = { "craft", "arcane" },
  notices = { "craft", "arcane", "kin" },

  impression = {
    first = "She has stopped trying to hide the scorch mark on her sleeve.",
    third = "{name} met Betty Quin, Lucan Cordell's journeyman, who teaches enchanting upstairs at Cordell's.",
  },

  greetings = {
    { id = "g_default", text = "Hail, traveler! What brings you to my doorstep? Mind the step; it's the one Lucan keeps meaning to fix." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, it's you again! Come up, come up. Nothing's on fire today, which I'm counting as a good sign." },
    { id = "g_ench", when = { profession = "Enchanting" }, text = "You've got dust on your cuffs, the shimmery sort. A fellow enchanter! Sit down before you fall over from all that unmaking." },
    { id = "g_camp", when = { questActive = CAMP }, text = "You're here about the camping lesson, aren't you? I can tell, you've got that look of somebody who's slept on a tree root." },
    { id = "g_campdone", when = { questDone = CAMP }, text = "My camper's back! Did the rune hold out there? Tell me it held. Lucan bet me a silver it wouldn't last the night." },
    { id = "g_away", when = { away = 14, metBefore = true }, text = "You've been gone {away}! I'd started to think you'd gone off to Dalaran without me." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Look at you! You've come a long way since you last stood on my stair, and you've got the scars to show for it." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Jessara says you were decent to her downstairs, and Jessara doesn't say that about anybody. Come in!" },
    { id = "g_word_angered", when = { word = "angered" }, text = "I've heard things about you from the canal folk. I'm not one to judge on gossip, but I'm keeping the good rods behind the counter." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Oh! Oh, my. You're not supposed to be in here, are you? Please don't break anything; it's all very expensive and none of it is mine." },
  },

  notice = {
    { id = "n_ench", cat = "craft", when = { profession = "Enchanting" }, place = "before",
      text = "Your hands smell of strange dust, a bit like lightning and a bit like old pennies. You've been disenchanting, haven't you?" },
    { id = "n_mage", cat = "arcane", when = { class = "MAGE", faction = "Alliance" },
      text = "A real mage! I'll try not to talk too much shop, but I'll fail, so I'm sorry in advance." },
    { id = "n_young", cat = "kin", when = { maxLevel = 12, race = "Human" },
      text = "You can't be much older than I was when I first came up these stairs. Do you know your letters? You'll need them for runes." },
    { id = "n_mq", cat = "arcane", when = { origin = "human_mage_quarter" },
      text = "Don't I know you from the Quarter? You used to hang about the Wizard's Sanctum steps, didn't you? So did I!" },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "I'm Betty Quin, and I teach enchanting up here while Master Cordell does the difficult work downstairs. I can show you the beginnings, and I'm told I'm good at them, mostly because I've made every mistake there is." },
        { id = "h_camp", tags = { "news" }, when = { questActive = CAMP },
          text = "So you're making camp out in the wild. Good! A fire keeps you warm, but an enchanter's rune can make that fire mean something, and I'll show you how." },
        { id = "h_campdone", tags = { "news" }, when = { questDone = CAMP },
          text = "I still can't believe people go out and sleep in the woods on purpose. I tried it once at Crystal Lake and a murloc stole my boots." },
        { id = "h_ench", when = { profession = "Enchanting" },
          text = "You've started already, then! Whatever you learned elsewhere, I'll do my best to unteach the bad habits and keep the good ones." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf! The runesmiths of Ironforge do something close to what we do, but with hammers. Lucan says they're showing off; I think it's wonderful." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "A gnome! Every gnome who comes up here wants to put a spring or a valve on my rods, and I've only said yes twice." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "You're one of the kaldorei. I've heard your people don't care for arcane magic, so it's very brave of you to climb my stairs at all." },
      },
      again = {
        { id = "h_again", text = "What else? Ask me anything; I've got all afternoon and only one rod to polish." },
        { id = "h_again2", text = "Go on, then. I like questions; they make me feel like a proper teacher." },
        { id = "h_again3", text = "Anything else? Just don't touch the blue jar. Nobody knows what's in the blue jar." },
      },
      choices = {
        { text = "Teach me enchanting.", next = "BUSINESS" },
        { text = "What exactly is enchanting?", next = "craft" },
        { text = "How did you come to work for the Cordells?", next = "story" },
        { text = "What's that scorch mark on your sleeve?", next = "sleeve" },
        { text = "What's an enchanter got to do with camping?", next = "camp", when = { questActive = CAMP } },
        { text = "What do you make of the Mage Quarter these days?", next = "quarter" },
        { text = "Why don't mages just do this themselves?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Could you enchant a blade for a paladin?", next = "xpala", when = { class = "PALADIN", faction = "Alliance" } },
        { text = "I grew up near the Sanctum steps too.", next = "xmq", when = { origin = "human_mage_quarter" } },
        { text = "Goodbye, Betty.", next = "END" },
      },
    },

    craft = {
      lines = {
        { id = "c_default", text = "It's taking a little of the magic that's already in a thing and asking it to stay. You break down an old cloak or a cracked ring into dust, and then you put that dust into something new with a rod and a lot of patience." },
      },
      choices = {
        { text = "You break things to make things?", next = "craft_unmake" },
        { text = "What's a runed rod?", next = "craft_rod" },
        { text = "Who wants enchantments, mostly?", next = "craft_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    craft_unmake = {
      lines = {
        { id = "cu_default", text = "That's the bit everybody hates at first. You can't get the magic out without the thing coming apart, and some of those things belonged to somebody once. I unmade my grandmother's brooch by accident in my first week, and I cried into the dust." },
      },
      choices = {
        { text = "Did you tell your grandmother?", next = "brooch" },
        { text = "Old things should be kept, not ground into dust.", next = "unmake_stance", fx = { align = { order = 1 } } },
        { text = "If a thing's no use, better it feeds something new.", next = "unmake_stance", fx = { align = { order = -1 } } },
      },
    },
    brooch = {
      lines = {
        { id = "br_default", text = "I did, eventually. She looked at the little pouch of dust for a long while and then said it had never once sparkled like that when it was a brooch. I think she was being kind, but I've kept the pouch anyway." },
      },
      choices = {
        { text = "That's a good grandmother.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    unmake_stance = {
      lines = {
        { id = "us_default", text = "Lucan says the same argument has been had in Dalaran for a thousand years, and they've never settled it there either. I only know a soldier with an enchanted sword comes home more often than one without." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    craft_rod = {
      lines = {
        { id = "cr_default", text = "A copper rod with runes cut along it, and a bit of silver if you can afford it. It's how you push the dust where it should go. My first one bent in half, because I was holding it like a spoon." },
      },
      choices = {
        { text = "Can I make my own?", next = "craft_rod2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    craft_rod2 = {
      lines = {
        { id = "cr2_default", text = "You can, and you should, but you'll need a blacksmith to draw the copper and a bit of strange dust to wake it. Jessara sells them ready-made downstairs, if you'd rather not lose a weekend to it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    craft_who = {
      lines = {
        { id = "cw_default", text = "Soldiers off to Westfall and Redridge, mostly, wanting a bit of extra on their bracers. And nobles who want their gloves to shimmer at a ball, and pay three times as much for it." },
      },
      choices = {
        { text = "The soldiers should come first.", next = "who_stance", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Charge the nobles double. Their gold spends the same.", next = "who_stance", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_stance = {
      lines = {
        { id = "ws_default", text = "Lucan does a bit of both, if I'm honest. He charges Lady What's-her-name a fortune for sparkly gloves and then does a guardsman's bracers for the price of the dust. I didn't notice for a whole year." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    story = {
      lines = {
        { id = "s_default", text = "I'm from Goldshire, born above my father's cooperage, and I was hopeless with barrels. A wizard came through on his way to the city, and his staff glowed blue, and I followed him all the way down the road to the gates." },
      },
      choices = {
        { text = "You followed a stranger to Stormwind?", next = "story_follow" },
        { text = "And Lucan took you in?", next = "story_lucan" },
        { text = "Do you ever go home?", next = "story_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    story_follow = {
      lines = {
        { id = "sf_default", text = "I was twelve and very stubborn. He turned round at the gate and asked what I wanted, and I said I wanted to know how the staff did that. He laughed and walked me straight to the Cordells' door, and I never saw him again." },
      },
      choices = {
        { text = "Do you know who he was?", next = "story_wizard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    story_wizard = {
      lines = {
        { id = "sw_default", text = "No idea. He was going north, he said, to Dalaran, and that was a long time before the trouble up there. I like to think he's still somewhere, glowing at people." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    story_lucan = {
      lines = {
        { id = "sl_default", text = "He didn't want to. He said I was too young and too loud, and he was right on both counts. Jessara said I could sweep the floors, and I swept them for two years before he let me hold a rod." },
      },
      choices = {
        { text = "Two years of sweeping? That's hard.", next = "story_lucan2" },
        { text = "What's Lucan like as a master?", next = "lucan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    story_lucan2 = {
      lines = {
        { id = "sl2_default", text = "It's not, really. Do you know how much magic falls on the floor of an enchanter's shop? I learned more from the sweepings than some apprentices learn from books, and I never told him." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    story_home = {
      lines = {
        { id = "sh_default", text = "At Harvest Festival, when I can. My father still asks when I'll stop all this and come make barrels, and then he shows everyone at the Lion's Pride Inn the lamp I enchanted for him, so I think he's proud." },
      },
      choices = {
        { text = "He sounds proud to me.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    lucan = {
      lines = {
        { id = "l_default", text = "Patient, mostly, and slow, and he chooses every word like it costs him gold. When he says \"adequate\", I go home and tell everyone. He's said it to me four times." },
      },
      choices = {
        { text = "And Jessara?", next = "jessara" },
        { text = "Do you want his job one day?", next = "lucan_job" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jessara = {
      lines = {
        { id = "j_default", text = "Jessara runs the shop, the money, the stock, and Lucan. She's terrifying and I love her. She once threw a nobleman out for calling me \"the girl\", and then charged him for the door." },
      },
      choices = {
        { text = "She sounds worth knowing.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lucan_job = {
      lines = {
        { id = "lj_default", text = "Light, no. I want a shop of my own, maybe in Lakeshire or Goldshire, where people need good things and can't get to the city. Don't tell Lucan; he'll be hurt, and then he'll be adequate about it." },
      },
      choices = {
        { text = "Stay in the city. That's where the real work is.", next = "BACK", reply = "You sound exactly like Lucan, and I love him for it, but the real work is wherever someone's plough-blade needs a good rune and can't afford the walk.", fx = { align = { order = 1 } } },
        { text = "Go. The villages need you more than the nobles do.", next = "BACK", reply = "Oh, thank you! I'll hold onto that the next time Lucan sighs at me over his ledger, which will probably be about an hour from now.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    sleeve = {
      lines = {
        { id = "sl_sleeve", text = "That? That's from the blue jar. I don't want to talk about the blue jar." },
      },
      choices = {
        { text = "Now I have to know about the blue jar.", next = "jar" },
        { text = "All right, I won't ask. Something else.", next = "BACK" },
      },
    },
    jar = {
      lines = {
        { id = "jar_default", text = "Fine. It came in a crate from Dalaran years ago, sealed, with no label. Lucan says not to open it. I opened it, just a crack, and it sneezed at me. Jars shouldn't sneeze." },
      },
      choices = {
        { text = "You should take it to the Sanctum.", next = "jar_stance", fx = { align = { order = 1 } } },
        { text = "Open it properly. You'll never learn otherwise.", next = "jar_stance", fx = { align = { order = -1 } } },
        { text = "What did Lucan say?", next = "jar_lucan" },
      },
    },
    jar_lucan = {
      lines = {
        { id = "jl_default", text = "He looked at my sleeve, and looked at the jar, and said, \"Well, now you know.\" Then he went back downstairs. That was the whole lesson." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    jar_stance = {
      lines = {
        { id = "js_default", text = "I've thought about both, late at night, when the jar makes its little noise. For now it lives on the top shelf with a cloth over it, like a parrot." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    camp = {
      lines = {
        { id = "cp_default", text = "A campfire's just a fire until somebody puts a little care into it. I'll teach you a rune you can lay beside it, and then the camp holds its warmth and its luck a bit longer than it ought to. It won't stop a bear, mind you." },
      },
      choices = {
        { text = "Does it actually work?", next = "camp_work" },
        { text = "Have you ever camped yourself?", next = "camp_you" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_work = {
      lines = {
        { id = "cpw_default", text = "It does! The dust remembers being something warm, a cloak or a pair of gloves, and it's happy to keep warming. That's my theory, anyway. Lucan says dust isn't happy, but he's never watched it closely." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_you = {
      lines = {
        { id = "cpy_default", text = "Once, at Crystal Lake, to prove I could. The rune held beautifully, I slept like a baby, and a murloc took both my boots. I walked back to Goldshire in my stockings." },
      },
      choices = {
        { text = "The murlocs are getting bolder.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    quarter = {
      lines = {
        { id = "q_default", text = "Busier than ever. Since Dalaran shut its gates to rebuild, everybody who needs magic in Stormwind comes here instead, and the Sanctum can't keep up. You'll find Lucan's work on every other shelf along this canal." },
      },
      choices = {
        { text = "Is that good for the city?", next = "quarter_good" },
        { text = "Have you ever been to Dalaran?", next = "dalaran" },
        { text = "Something else.", next = "BACK" },
      },
    },
    quarter_good = {
      lines = {
        { id = "qg_default", text = "It's good for the Cordells' purse. But it means the whole city leans on a handful of tired people up a lot of stairs, and if Lucan catches a cold the guard's bracers go bare for a fortnight." },
      },
      choices = {
        { text = "The crown should pay for more enchanters.", next = "BACK", reply = "That's what I keep saying, but the crown would rather buy another wall than a second enchanter, and walls don't catch colds, I suppose.", fx = { align = { order = 1 } } },
        { text = "Leave the crown out. The shops manage themselves.", next = "BACK", reply = "They manage, if you count Lucan asleep on his workbench at midnight as managing. I'd count it as a warning, but nobody asked me.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dalaran = {
      lines = {
        { id = "d_default", text = "Never. I've wanted to my whole life. I've a letter written to the Kirin Tor asking if they take enchanters from Goldshire, and I've been too frightened to post it for three years." },
      },
      choices = {
        { text = "Post it, Betty. The worst they can say is no.", next = "BACK", fx = { affinity = 2 } },
        { text = "Stay here. Stormwind needs you more.", next = "BACK", fx = { affinity = 1 } },
      },
    },

    xmage = {
      lines = {
        { id = "xm_default", text = "Because your spells fade when you stop thinking about them, and mine don't. You can freeze a man solid, which I can't, but by morning he's thawed. A good enchantment outlives the enchanter." },
      },
      choices = {
        { text = "Then you're doing the more lasting work.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpala = {
      lines = {
        { id = "xp_default", text = "Of course I could! Though I always wonder if the Light minds sharing a sword with arcane dust. Lucan says the Light's never complained, which isn't quite an answer." },
      },
      choices = {
        { text = "The Light welcomes any honest help.", next = "BACK", reply = "That's a lovely way to put it, and I'm going to steal it for the next paladin who frowns at my rods. Lucan will say he thought of it first.", fx = { align = { light = 1 } } },
        { text = "My faith carries the sword. Your dust just sharpens it.", next = "BACK", reply = "Just sharpens it? I'll have you know that dust took me three hours to grind, but I suppose a good whetstone doesn't need the credit.", fx = { align = { light = -1 } } },
      },
    },
    xmq = {
      lines = {
        { id = "xq_default", text = "I knew it! Did you ever see the old wizard who fed the pigeons and swore at them in Thalassian? I've always wondered whether he was a high elf or just very rude." },
      },
      choices = {
        { text = "Just very rude, I always thought.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Goldshire born, a cooper's daughter, swept floors at Cordell's for two years, and now I teach. It's not a grand story, but the middle has a sneezing jar in it." } },
    advice = { { id = "tp_ad", text = "Never hold a rod like a spoon, and never open anything from Dalaran without a label." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know about that. Ask Jessara downstairs; she knows everything, and she'll tell you, too." } },
  },
}
