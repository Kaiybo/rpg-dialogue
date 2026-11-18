-- The Lakeshire docks: Arantir (a night elf rogue of Ravenholdt hunting the Horns of Nez'ra), Hilary
-- (the little girl whose necklace fell in the lake, and her cat Effsee) and Zem Leeward (who fishes,
-- and catches nothing). Voice: bibles/lakeshire_docks.md
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Arantir
---------------------------------------------------------------------------
P:NPC {
  key = "arantir", id = TODO_NPC("Arantir"), name = "Arantir",
  bible = "bibles/lakeshire_docks.md", role = "questgiver", tier = "quest",
  communities = { "lakeshire" }, temper = { "cold", "patient" }, values = { "loyal", "cunning" },
  notices = { "class", "race" },

  impression = {
    first = "Arantir is a night elf rogue who stands on the Lakeshire docks beside Lucius and watches the mountains as if they owed him something. He's searched across continents and oceans for the Horns of Nez'ra, and he's finally found out who has them.",
    third = "{name} met Arantir, the night elf of Ravenholdt who hunts the stolen Horns of Nez'ra among the Blackrock orcs of Redridge.",
  },

  greetings = {
    { id = "g_default", text = "Stand where I can see you, and speak low. Lakeshire carries voices across the water." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Either you have news of the horns, or you've grown curious, and curiosity is a fine quality in our trade." },
    { id = "g_horns", when = { questActive = TODO_QUEST("Horns of Nez'ra") }, text = "Every Blackrock orc you cross, {name}. One of them carries the horns, and they don't know what they have." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Ah, one of ours, or one who might be. Lucius speaks well of you, which he rarely does of anyone." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You walk soft on the planks, like someone who's been taught. Good, because the docks creak, and creaking gets people killed." },
    { id = "n_elf", cat = "race", when = { race = "NightElf" },
      text = "Another kaldorei, so far from the forests. Ishnu-alah, sister or brother; it's good to hear the old tongue on a human dock." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Arantir. Many years ago, the Horns of Nez'ra were stolen from Ravenholdt Manor, and across continents and oceans I have searched for them. Now I learn that these insignificant beasts, the Blackrock, have had them all along." },
        { id = "h_horns_done", when = { questDone = TODO_QUEST("Horns of Nez'ra") },
          text = "To deny Ravenholdt the artifact would be to deny one's own existence, and you did not deny us. You may yet walk among the assassins of Ravenholdt, {name}, and that is no small thing to say." },
        { id = "h_notrogue", when = { class = { "WARRIOR", "PALADIN", "PRIEST", "MAGE", "WARLOCK", "HUNTER", "DRUID" } },
          text = "You're not of my trade, so I'll say little. I'm waiting on the Blackrock to give up something they stole, and I'm a patient man." },
      },
      again = {
        { id = "h_again", text = "Something more? Keep it brief." },
        { id = "h_again2", text = "Ask, then. The orcs aren't going anywhere tonight." },
      },
      choices = {
        { text = "What are the Horns of Nez'ra?", next = "horns" },
        { text = "What is Ravenholdt?", next = "ravenholdt" },
        { text = "What brings a night elf to Lakeshire?", next = "elf" },
        { text = "Can I help recover the horns?", next = "help", when = { class = "ROGUE" } },
        { text = "You and Lucius know each other?", next = "lucius" },
        { text = "I'll leave you to your watching.", next = "END" },
      },
    },

    horns = {
      lines = { { id = "ho_default", text = "The horns of a demon prince, Nez'ra, taken from his skull long ago and kept in Ravenholdt's vaults. They're worth nothing to an orc but a trinket, and something else entirely to us, though I won't say why to a stranger." } },
      choices = {
        { text = "A demon prince?", next = "ho_demon", fx = { learn = { "burning_legion" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ho_demon = {
      lines = { { id = "hod_default", text = "Dead, if you're worried, and has been for longer than Lakeshire has stood. His horns are a trophy, and a trophy stolen from Ravenholdt is an insult that the Manor does not forget." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    ravenholdt = {
      lines = {
        { id = "ra_default", text = "A manor in the hills of Alterac, where those of my trade gather under no flag. If you don't already know of it, then you were never meant to, and I've said too much." },
        { id = "ra_rogue", when = { class = "ROGUE" }, text = "A manor in the hills of Alterac, where the best of our trade gather under no flag. Serve it well, and one day you'll find the way there yourself." },
      },
      choices = {
        { text = "Under no flag? Not even the Alliance?", next = "ra_flag" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ra_flag = {
      big = true,
      lines = { { id = "raf_default", text = "Not even the Alliance. Kings come and go, but a guild that answers to none of them outlasts them all, and the Manor has seen many crowns fall." } },
      choices = {
        { text = "A guild without a king is just a gang of killers.", next = "BACK", reply = "Call us what you like; the Manor has heard worse from kings who later hired it. A gang scatters when its leader dies, and Ravenholdt has outlived every one of them.", fx = { align = { order = 1 } } },
        { text = "Better free than bound to some throne.", next = "BACK", reply = "You understand more than most who stand on these docks. A throne is a fine thing to sit on and a poor thing to be chained to.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    elf = {
      lines = { { id = "el_default", text = "The horns, and nothing else. I've been many places in my search, and none of them were forests, which is a strange life for a kaldorei. In my youth in Darkshore, I never thought I'd end up on a human dock watching orcs." } },
      choices = {
        { text = "What were you like, in Darkshore?", next = "el_youth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    el_youth = {
      lines = { { id = "ely_default", text = "Young and tired, mostly, until I found a thistle growing by the shore that made a tea to put fire back in my limbs. I've drunk it ever since, on every shore I've searched." } },
      choices = {
        { text = "Thistle tea?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    help = {
      lines = { { id = "he_default", text = "Slay every Blackrock orc you cross until the horns turn up. They don't know what they're carrying, so it could be any of them, which is a fine excuse to kill all of them." } },
      choices = {
        { text = "That's a lot of orcs.", next = "he_more" },
        { text = "I'll find them.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    he_more = {
      lines = { { id = "hem_default", text = "Then you'll get very good at it, and Lakeshire will thank you for every one. The Manor rewards those who serve it, and it remembers names." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "blackrock" } } } },
    },

    lucius = {
      lines = { { id = "lu_default", text = "Lucius teaches the young ones to open locks, and he keeps an eye on the docks for me. He's a dwarf with poor manners and good instincts, and I'd trust him with my back sooner than most." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The horns, the orcs who have them, and little else I'd share." } },
    background = { { id = "tp_bg", text = "A kaldorei of Ravenholdt. That is all you need." } },
    advice = { { id = "tp_ad", text = "Never stand in the moonlight on a dock, because the water shows your shape to anyone watching." } },
    blackrock = { { id = "tp_br", text = "Thieves who don't know what they stole. That makes them easier to rob back." } },
    _none = { { id = "tp_none", text = "I don't know, and if I did, I wouldn't say." } },
  },
}

---------------------------------------------------------------------------
-- Hilary
---------------------------------------------------------------------------
P:NPC {
  key = "hilary", id = TODO_NPC("Hilary"), name = "Hilary",
  bible = "bibles/lakeshire_docks.md", role = "child", tier = "quest",
  communities = { "lakeshire" }, temper = { "tearful", "sweet" }, values = { "family" },
  notices = { "pet", "race" },

  impression = {
    first = "Hilary is a little girl on the Lakeshire docks who dropped the necklace her father gave her into the lake. She's sure he'll be cross, and her cat Effsee is no help at all.",
    third = "{name} met Hilary, a little girl in Lakeshire who lost her necklace in Lake Everstill.",
  },

  greetings = {
    { id = "g_default", text = "I think my necklace fell in the lake. My daddy got it for me, and he's gonna be mad now." },
    { id = "g_back", when = { metBefore = true }, text = "Hi again! Did you see any monsters in the lake? Shawn says there's lots." },
    { id = "g_done", when = { questDone = TODO_QUEST("Hilary's Necklace") }, text = "I'm wearing it, see? I'm never taking it off again, not even for baths, which Mama says is not allowed." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Is that your {pet}? Can I pet it? Effsee doesn't like other animals, but I do, I like all of them." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "You're small like me! Are you a grown-up? You talk like a grown-up, but you're small like me." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Hilary, and this is Effsee, she's my cat. We were fishing with Shawn all day, and my necklace fell in the lake, and now it's gone." },
        { id = "h_active", when = { questActive = TODO_QUEST("Hilary's Necklace") },
          text = "Shawn asked you to find it? He's so nice. Daddy says there are monsters in the lake, so did you beat up any monsters yet?" },
        { id = "h_done", when = { questDone = TODO_QUEST("Hilary's Necklace") },
          text = "Thank you for finding my necklace! You're the best! Effsee says thank you too, I know how to speak kitty, and that's what she said." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "You have such a big beard! Is it heavy? Can you hide things in it? Shawn says dwarves keep their lunch in their beards." },
      },
      again = {
        { id = "h_again", text = "What else? Effsee is listening, she's very smart." },
        { id = "h_again2", text = "Do you want to know more stuff? I know lots of stuff." },
      },
      choices = {
        { text = "Where did you lose it?", next = "lost" },
        { text = "Tell me about Effsee.", next = "effsee" },
        { text = "Will your daddy really be mad?", next = "daddy" },
        { text = "What's it like, living in Lakeshire?", next = "lakeshire" },
        { text = "I have to go now, Hilary.", next = "END" },
      },
    },

    lost = {
      lines = { { id = "lo_default", text = "Right here, off the dock, I think. We looked all around and it's not anywhere, so Shawn says it fell in the lake, and we're not allowed to swim because Mama says there are mean things underwater." } },
      choices = {
        { text = "I'll look in the lake for you.", next = "lo_look" },
        { text = "What sort of mean things?", next = "lo_mean" },
      },
    },
    lo_look = {
      lines = { { id = "lol_default", text = "Really? You're not scared of the mean things? You must be really brave, braver than Shawn even, and he's the bravest boy I know." } },
      choices = { { text = "I'll be careful.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    lo_mean = {
      lines = { { id = "lom_default", text = "Murlocs! They go mrglglgl and they have big eyes and they steal fish. Shawn says they steal kids too, but I think he's making that up to scare me." } },
      choices = {
        { text = "He's making it up.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    effsee = {
      lines = { { id = "ef_default", text = "Effsee is the best cat in Lakeshire, and she catches mice, and one time she caught a fish bigger than her. She talks to me, but only I can understand her, because I know how to speak kitty." } },
      choices = {
        { text = "What is she saying now?", next = "ef_say" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ef_say = {
      lines = {
        { id = "efs_default", text = "She says you smell like the road, and she wants to know if you have any fish. She always wants to know if people have fish." },
        { id = "efs_pet", when = { pet = { type = "Beast" } }, text = "She says she doesn't like your {pet} and she's going to sit on the roof until it leaves. She's a little rude sometimes." },
      },
      choices = { { text = "Tell her I'm sorry.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },

    daddy = {
      big = true,
      lines = { { id = "da_default", text = "He said it was very special and I had to be careful, and I wasn't careful. Mama says I should tell him the truth, but Shawn says I could just not say anything and maybe he won't notice." } },
      choices = {
        { text = "Tell him the truth. He'll forgive you.", next = "da_more", fx = { align = { honor = 1 } } },
        { text = "Don't say anything. We'll find it first.", next = "da_more", fx = { align = { honor = -1 } } },
        { text = "What makes it special?", next = "da_more" },
      },
    },
    da_more = {
      lines = { { id = "dam_default", text = "He got it for me when he went to Stormwind with the soldiers, and he said every time I wear it, he'll know I'm thinking of him. He's at the guard tower a lot, so I wear it every day." } },
      choices = {
        { text = "Then we'll find it.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    lakeshire = {
      lines = { { id = "la_default", text = "It's nice, except for the orcs and the gnolls and the bridge being broken, and the murlocs. But we have the lake, and the fish, and Mr. Solomon gives me a sweet if I don't run in the town hall." } },
      choices = {
        { text = "Do you run in the town hall?", next = "la_run" },
        { text = "Something else.", next = "BACK" },
      },
    },
    la_run = {
      lines = { { id = "lar_default", text = "Only sometimes, when nobody's looking. Don't tell Mr. Solomon, please, I really like the sweets." } },
      choices = { { text = "I won't tell.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Cats, and fish, and where all the good hiding places are in Lakeshire." } },
    background = { { id = "tp_bg", text = "I'm six and a half and I live in Lakeshire with Mama and Daddy and Effsee." } },
    advice = { { id = "tp_ad", text = "Don't swim in the lake. Mama says there are mean things." } },
    _none = { { id = "tp_none", text = "I don't know that. Effsee doesn't know it either, she says." } },
  },
}

---------------------------------------------------------------------------
-- Zem Leeward
---------------------------------------------------------------------------
P:NPC {
  key = "zem_leeward", id = TODO_NPC("Zem Leeward"), name = "Zem Leeward",
  bible = "bibles/lakeshire_docks.md", role = "citizen", tier = "service",
  communities = { "lakeshire" }, temper = { "lazy", "hopeful" }, values = { "leisure" },
  notices = { "craft" },

  impression = {
    first = "Zem Leeward fishes off the Lakeshire docks all day and catches almost nothing. He's sure the fish are just about to bite, and he's been sure of it for years.",
    third = "{name} met Zem Leeward, who fishes off a Lakeshire dock with endless patience and very little success.",
  },

  greetings = {
    { id = "g_default", text = "Here fishy fishy... come to papa. Oh, hello there, keep your voice down, you'll scare 'em off." },
    { id = "g_back", when = { metBefore = true }, text = "Nothing biting yet. It'll pick up any minute now, you'll see." },
  },

  notice = {
    { id = "n_fish", cat = "craft", when = { profession = "Fishing" },
      text = "A fellow angler! What bait are you using? Don't tell me if it's working, I don't think I could bear it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Zem Leeward, and I fish this dock every day the weather allows, and most days it doesn't. Nothing biting yet, but they're down there, I can feel 'em." },
        { id = "h_fisher", when = { profession = "Fishing" },
          text = "You fish too, I can tell by the way you looked at the water. Pull up a crate, friend, and let's both catch nothing together." },
      },
      again = {
        { id = "h_again", text = "Anything else? Softly, now." },
        { id = "h_again2", text = "Ask away, the fish aren't listening anyway." },
      },
      choices = {
        { text = "Have you ever caught anything?", next = "caught" },
        { text = "Why fish here, of all places?", next = "why" },
        { text = "What bait are you using?", next = "bait" },
        { text = "Does all that hammering on the bridge bother the fish?", next = "bridge" },
        { text = "Try a lure from Vernon Hale. It works for me.", next = "lure", when = { profession = "Fishing" } },
        { text = "In Darnassus we fish by moonlight. Have you tried?", next = "moon", when = { race = "NightElf" } },
        { text = "Good luck, Zem.", next = "END" },
      },
    },

    caught = {
      lines = { { id = "ca_default", text = "Once, three summers back, a trout as long as my arm. I had it on the dock for a moment, and then it flopped back in, and nobody believes me, but it happened." } },
      choices = {
        { text = "I believe you.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Sounds like a fish story to me.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },

    why = {
      big = true,
      lines = { { id = "wh_default", text = "Because it's quiet, and the lake doesn't care about orcs or gnolls or broken bridges. The marshal says every man should be on the wall, but I say somebody's got to keep the fish honest." } },
      choices = {
        { text = "The marshal's right. Lakeshire needs every man.", next = "wh_more", fx = { align = { order = 1 } } },
        { text = "A man's time is his own. Fish on.", next = "wh_more", fx = { align = { order = -1 } } },
        { text = "Do the murlocs bother you?", next = "wh_more" },
      },
    },
    wh_more = {
      lines = { { id = "whm_default", text = "The murlocs take more fish than I do, which isn't hard, and they glare at me from the reeds. I glare back, and so far we've agreed to leave each other alone." } },
      choices = {
        { text = "You've got a truce with murlocs?", next = "wh_truce" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wh_truce = {
      lines = { { id = "wht_default", text = "Well, I don't go in the reeds and they don't come up the dock, and that's as good a treaty as anything the Magistrate's ever signed. One of them left a fish head on my crate once, and I've chosen to take it as a friendly gesture." } },
      choices = {
        { text = "Or a warning.", next = "wh_warning" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wh_warning = {
      lines = { { id = "whw_default", text = "Don't say that, friend, I've got to sit here all afternoon! The guards say the murlocs up the shore have been raiding the fishing camps, but these ones by the dock are the polite sort, I'm almost certain." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "murlocs" } } } },
    },

    bait = {
      lines = { { id = "ba_default", text = "Worms from Alma Jainrose's garden, bread from the inn, and once a bit of Chef Breanna's goulash, which the fish wouldn't touch, and I can't say I blame them. I've tried everything but luck, and Lakeshire's short on that this year." } },
      choices = {
        { text = "Have you tried fishing somewhere else?", next = "ba_else" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ba_else = {
      lines = { { id = "bae_default", text = "Out on the lake, once, in Dockmaster Baren's rowboat, until an orc arrow went past my ear from the far shore. Now I keep to this dock, where the worst that can happen is nothing at all, which is what usually happens." } },
      choices = {
        { text = "Someone should drive the orcs off that shore.", next = "ba_orcs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ba_orcs = {
      lines = { { id = "bao_default", text = "Somebody should, and the Marshal keeps saying somebody will, and I keep fishing till they do. It's not that I'm afraid, you understand, it's only that a man has to have priorities." } },
      choices = {
        { text = "Your neighbors are fighting. Pick up a spear, Zem.", next = "BACK", fx = { align = { honor = 1 } },
          reply = "Oh, don't you start too. My mother says the same, and she's eighty." },
        { text = "Leave war to soldiers. Someone has to catch supper.", next = "BACK", fx = { align = { honor = -1 } },
          reply = "Exactly! You're the first sensible person I've met all week." },
        { text = "Something else.", next = "BACK" },
      },
    },

    bridge = {
      lines = { { id = "br_default", text = "It does, and I've told Foreman Oslow so, and he told me where I could put my rod. They've been fixing that bridge since before I can remember, and the fish have learned to swim upstream whenever a hammer drops." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "lakeshire_bridge" } } } },
    },

    lure = {
      lines = { { id = "lu_default", text = "A lure! From Vernon Hale? I've walked past his stall a hundred times thinking a lure is cheating, but if it's good enough for a proper angler like you, perhaps it's good enough for old Zem." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    moon = {
      lines = { { id = "mo_default", text = "By moonlight? I tried fishing after dark once and Guard Parker sent me home for my own good. Besides, if they won't bite in daylight, I can't think why they'd do me any favours at night." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Fish, mostly, and where they aren't." } },
    background = { { id = "tp_bg", text = "Born in Lakeshire and fished the lake ever since, and there's not much else to tell." } },
    advice = { { id = "tp_ad", text = "Patience, then more patience, and then go home and try again tomorrow." } },
    murlocs = { { id = "tp_murlocs", text = "These ones by the dock are the polite sort. I'm almost certain of it." } },
    lakeshire_bridge = { { id = "tp_bridge", text = "Always being mended, always scaring the fish. Ask Foreman Oslow, if you want shouting." } },
    _none = { { id = "tp_none", text = "If it doesn't swim, I wouldn't know it." } },
  },
}
