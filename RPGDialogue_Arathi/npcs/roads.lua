-- Between the towns: Phin Odelic's agents at Go'Shek Farm, and a gnome in Drywhisker Gorge. Voice: bibles/roads.md
local P = RPGDialogueAPI:Pack("rpgd.arathi")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "quae", id = TODO_NPC("Quae"), name = "Quae",
  bible = "bibles/roads.md", role = "questgiver", tier = "quest",
  communities = { "goshek_watch" }, temper = { "brisk" }, values = { "dutiful", "sharp" },
  notices = { "class" },
  impression = {
    first = "Quae keeps her notes in a hand nobody else can read and her eyes on the orc farm below the ridge. She speaks quickly, as if each word costs her a moment of watching.",
    third = "{name} met Quae, one of Phin Odelic's agents, keeping watch on Go'Shek Farm in the Arathi Highlands.",
  },

  greetings = {
    { id = "g_watch", text = "Keep low, please. The orcs at Go'Shek don't look up often, but when they do, they look up here." },
    { id = "g_back", when = { metBefore = true }, text = "You again, good. Kinelory's been pacing, and I'd like someone else to talk to." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You move like someone who's done this before. That's a comfort, out here." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because there are more orcs down there than either of us could fight, and because Phin wants to know what they're doing, not merely stop it. Kinelory has a plan for the courier, and she'll need someone loud when it goes wrong, so stay close to her." } },
      choices = {
        { text = "I'll protect Kinelory. She shouldn't face this alone.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Kinelory's plan is her own. I'll look after myself.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Quae.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Wagons, and the crates on them, and who signs for them when they arrive. The orcs are farming nothing I'd eat, and the wagons come from the west, from the Forsaken lands, which is why Phin sent us up here." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} still, please, because the orcs keep wolves down there, and a wolf can smell a beast on the ridge as easily as you can see it." },
      },
      choices = {
        { text = "If it's plague, we stop it, whatever it costs.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Watch and report. What the Forsaken brew isn't our concern.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Farming, they say, though nothing I'd eat grows in that soil anymore. Kinelory swears they're bringing their plague into the highlands one barrel at a time." } },
      choices = {
        { text = "Not every Forsaken brews plague. Learn the truth first.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Burn the farm. Plague isn't worth the risk.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I fear it more than I let Kinelory see, because everyone knows what the plague did to Lordaeron, and nothing I've watched at that farm looks like farming. If it does come, it won't stop at the Highlands, and I don't think Southshore is ready." } },
      choices = {
        { text = "The Light will stand against it. We'll stop it here.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then strike first and leave nothing. Mercy can wait.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Quae.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, keep low! If the Forsaken really are brewing plague down at Go'Shek Farm, we'll want someone who knows the Light when it's all over, so please don't get yourself spotted." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! Could you not slip into Go'Shek Farm as a cat and see what the Forsaken are hiding? Kinelory would sleep easier, and so would I." },
        { id = "h_default", key = true,
          text = "Quae, and that nervous one by the tree is Kinelory. We work for Phin Odelic in Southshore, and we've been watching Go'Shek Farm longer than either of us likes." },
        { id = "h_phin", tags = { "news" }, when = { questActive = TODO_QUEST("Hints of a New Plague?") },
          text = "Phin sent you? Light bless that worried man. Tell him we're alive, and tell him he was right, because the Forsaken are sending something to that farm." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, {class}? Then maybe you can read the courier's papers, for I can't make out half of it, and the half I can, I don't like." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You've a quiet way of standing, {class}, and Phin would like the look of you. Sit down, and keep your head below the ridge." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, keep low, please, because armour flashes in the sun and the orcs at Go'Shek notice anything that flashes." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, good. Your eyes are probably better than mine, so tell me what you see moving down at Go'Shek Farm, and keep your voice down." },
      },
      choices = {
        { text = "What are the Forsaken doing at Go'Shek Farm?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What are the Forsaken sending?", next = "courier" },
        { text = "Why does Phin care about an orc farm?", next = "phin" },
        { text = "How long have you been out here?", next = "watch" },
        { text = "Phin said you hadn't checked in. He was frantic.", next = "frantic", when = { questActive = TODO_QUEST("Hints of a New Plague?") } },
        { text = "What kind of writing is on the courier's papers?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What are the Forsaken doing at Go'Shek Farm?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you fear the plague is coming to the Highlands?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why not just attack Go'Shek Farm outright, Quae?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What should I watch for at Go'Shek Farm, Quae?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Stay low, then. Farewell.", next = "END" },
      },
      again = {
        { id = "h_again", text = "What else? I can talk and watch at the same time, mostly." },
        { id = "h_again2", text = "Go on, quietly." },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Moving papers and crates, and the crates smell of the apothecaries' work, which is why Phin wants to know who signs those papers. I watch who comes and goes, but someone who could get inside the farm would learn more in a night than I have in a month." } },
      choices = {
        { text = "If the Forsaken brew plague, they must be stopped.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Whatever they brew could be turned to our use.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Apothecary shorthand, I think, full of measures and words I don't know, and a few lines that look like a recipe. A mage might see a pattern in it, and Phin would be very glad of anyone who could tell him what the Forsaken are brewing." } },
      choices = {
        { text = "If it's plague, it must be stopped at once.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Their recipes could be useful to us.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Quae.", next = "BACK" },
      },
    },
    courier = {
      lines = {
        { id = "co_default", text = "Papers and sealed crates, carried by a Forsaken courier who comes and goes on the road from the north. If those papers say what I think, Tarren Mill's apothecaries mean to try their new plague on more than mountain lions." },
      },
      choices = { { text = "Then someone should take those papers.", next = "courier_plan" } },
    },
    courier_plan = {
      lines = {
        { id = "cp_default", text = "Kinelory wants to, and Kinelory is braver than Kinelory is sensible. Walk with her when she goes for the courier, and I'll write the report afterwards in letters Phin can actually read." },
      },
      choices = {
        { text = "Stealing their papers is better than a fight.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "We should face the courier openly and take them.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    phin = {
      lines = {
        { id = "ph_default", text = "Because his cousin's dog went mad in a single night, and Phin doesn't believe in coincidences. Neither do I, now that I've watched what goes in and out of that farm." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = "new_plague" } } },
    },
    watch = {
      lines = {
        { id = "wa_default", text = "Long enough to know the farmhands by their gait and the guards by their snores. Long enough that my feet have stopped complaining, which can't be a good sign." },
      },
      choices = { { text = "I'll bring you a better pair of boots, someday.", next = "BACK", fx = { affinity = 1 } } },
    },
    frantic = {
      lines = {
        { id = "fr_default", text = "He's always frantic, bless him, though this time he had reason. We couldn't risk a messenger past the farm, so we stayed put and hoped he'd send somebody clever." },
      },
      choices = { { text = "He sent me. Make of that what you like.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    new_plague = { { id = "tp_plague", text = "Whatever the Forsaken are brewing, it travels in sealed crates and comes through Go'Shek." } },
    _none = { { id = "tp_none", text = "Ask me in Southshore, over a drink, when I'm not counting orcs." } },
  },
}

P:NPC {
  key = "kinelory", id = TODO_NPC("Kinelory"), name = "Kinelory",
  bible = "bibles/roads.md", role = "questgiver", tier = "quest",
  communities = { "goshek_watch" }, temper = { "nervous" }, values = { "brave", "loyal" },
  notices = { "kit" },
  impression = {
    first = "Kinelory paces when she isn't watching and watches when she isn't pacing. She is plainly frightened and plainly going to do the dangerous thing anyway.",
    third = "{name} met Kinelory, Quae's partner in Phin Odelic's service, who means to waylay a Forsaken courier near Go'Shek Farm.",
  },

  greetings = {
    { id = "g_pace", text = "Oh! You startled me, which isn't hard lately. Are you here to help, or only passing by on your way to somewhere sensible?" },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your armour's in worse shape than my nerves, and that's saying something. Mend it before we go anywhere near that road." },
  },

  start = "hello",
  nodes = {
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I'd thought to ambush him, but if you could follow him without his noticing, perhaps we could learn where he goes, which would be cleverer. Oh, I do wish I were braver about it all." } },
      choices = {
        { text = "Ambush him. Take the papers and be done.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Confront him openly. No ambush, no tricks.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Would you? I'll still be the one walking up to him, because Quae says I'm the least suspicious-looking of us, which I don't think was a compliment. But if I know someone's watching from the trees, I might stop shaking long enough to grab the papers." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And {pet} will be watching too, won't it? That helps, actually, because a beast doesn't hesitate, and I hesitate quite a lot." },
      },
      choices = {
        { text = "I'll stay close and keep you safe. That's a promise.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll cover you, but if it goes wrong, I'm leaving.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Kinelory.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Because somebody has to, and Phin trusted me with this, and if I let fear decide for me then I'd never do anything at all. I've been scared since the day we got here, honestly, and I've found I can be scared and still keep walking." } },
      choices = {
        { text = "That's true courage. The Light walks with you.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fear is telling you something. Let someone else take him.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "He comes the same way every few days and never stops anywhere for long, which tells me he knows someone might be watching. I mean to stop him before he reaches the farm, but I'll admit I'd rather do it in the open than in the dark." } },
      choices = {
        { text = "Then we'll stop him in the open, face to face.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Ambush him in the dark. Fair play won't stop a plague.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "Oh, a priest, that's, well, that's a comfort, because if I'm going after that Forsaken courier I'd rather someone said a prayer over me first, just in case it goes the way Quae thinks it will." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Oh, thank the Light, because I've been working up my courage to go after that courier for days, and it would be a great deal easier with someone in plate walking beside me." },
        { id = "h_default", key = true,
          text = "Kinelory, at your service, if you'll have a nervous one. There's a Forsaken courier who carries papers to Go'Shek Farm, and I mean to take them off him before he gets there." },
        { id = "h_strike", tags = { "news" }, when = { questActive = TODO_QUEST("Kinelory Strikes") },
          text = "Ready, are you? Stay close and keep his guards off me, and I'll do the rest, as long as my hands stop shaking first." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock! Oh dear, please don't take that the wrong way, {class}, it's only that the courier is Forsaken, and I'd rather not be surrounded by spooky things." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Oh, you're quiet, {class}, quieter than me by a mile, and I've been practising all week so the courier won't hear me coming." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "Oh, a hunter, that's, well, that's very good, because you can shoot the courier's guards from a distance, and then I won't have to see them coming." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "Oh, a druid! I'm terribly sorry, I'm a bit nervous, but you seem like the sort of person who could find a Forsaken courier without being seen." },
      },
      choices = {
        { text = "I'll take the loud part. Stealth was never my way.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Why go after him yourself?", next = "why" },
        { text = "What's the plan?", next = "plan" },
        { text = "Quae says you're braver than you are sensible.", next = "quae" },
        { text = "I'll keep my demon behind you, then.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Want some help ambushing the Forsaken courier?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "You're frightened, Kinelory. Why go after the courier yourself?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What do you know of the courier's route?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Shall I cover you from the trees when you face the courier?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Should we ambush the courier, or follow him quietly?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Not today, I'm afraid.", next = "END" },
      },
      again = { { id = "h_again", text = "Something else? Talking helps, honestly, so please do." } },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I'd like it more than I can say, though I'll still go if you don't, because Phin needs those papers and Quae can't leave her post. Stay close behind me, and if I start shaking, just pretend you didn't see." } },
      choices = {
        { text = "No shame in shaking. You're braver than you think.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Shaking gets people killed. Steady yourself.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Kinelory.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Behind me is worse, actually, for I'd keep looking back at it instead of at the road. Perhaps out front, where the courier can be frightened instead of me, which seems fairer all round." } },
      choices = {
        { text = "Using fear on the enemy is fair play.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd rather beat him fairly, without tricks.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    why = {
      lines = {
        { id = "wh_default", text = "Because Quae has the better eyes and I have the faster legs, and someone has to. If those papers reach the farm, Phin's whole worry comes true, and Hillsbrad's farms pay for it." },
      },
      choices = {
        { text = "Fear doesn't stop you. That's real courage.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Courage is fine. Just don't get me killed.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
      },
    },
    plan = {
      lines = {
        { id = "pl_default", text = "We wait by the road where it bends, and when the courier passes, we take him. His guards will come running, and that's where you come in, if you don't mind being the loud part." },
      },
      choices = { { text = "And after we have the papers?", next = "plan_after" } },
    },
    plan_after = {
      lines = {
        { id = "pa_default", text = "Then back to Quae, who reads them, and then a very long sleep for me. Phin can decide what Southshore does with them; I only want them out of Forsaken hands." },
      },
      choices = { { text = "Simple enough. Something else.", next = "BACK" } },
    },
    quae = {
      lines = {
        { id = "qu_default", text = "She would say that, wouldn't she? She's right, of course, but she also writes like a spider fell in the inkpot, so we each have our failings." },
      },
      choices = { { text = "Something else, then.", next = "BACK", fx = { affinity = 1 } } },
    },
    warrior = {
      lines = { { id = "wr_default", text = "Oh, thank the Light, a proper warrior! Stand in the road and shout at them, please, and I'll be the one nobody notices." } },
      choices = { { text = "Shouting I can do.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know, and I'm too jumpy to guess." } },
  },
}

P:NPC {
  key = "phizzlethorpe", id = TODO_NPC("Professor Phizzlethorpe"), name = "Professor Phizzlethorpe",
  bible = "bibles/roads.md", role = "scholar", tier = "quest",
  communities = { "drywhisker" }, temper = { "flustered" }, values = { "curious", "learned" },
  notices = { "race" },
  impression = {
    first = "Professor Phizzlethorpe has lost his notes, his patience and very nearly his nerve in a kobold-infested gorge. He talks faster than he walks, which, given the kobolds, is a worry.",
    third = "{name} met Professor Phizzlethorpe, a gnome scholar stranded among the kobolds of Drywhisker Gorge.",
  },

  greetings = {
    { id = "g_gorge", text = "A rescuer! Or at least a person with a weapon, which at this point I'll gladly take." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A fellow gnome, out here! Splendid, you'll understand the equations, and you'll certainly understand the kobolds' smell." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Only the ones between me and the coast, if you'd be so kind, which by my count is all of them. I've calculated that a warrior walking ahead of me cuts my chances of being bitten by seven parts in ten, though I confess the figures are rough." } },
      choices = {
        { text = "Stay behind me and keep to the path, Professor.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Forget the path. We charge straight through and run for it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Professor.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Against my will, yes, and I've concluded that they track by candle smoke and earwax, which is not a sentence I ever expected to write. A real tracker would tell me if I'm wrong, though I'd rather you told me after we've left." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is the first creature in this gorge that hasn't tried to steal from me, and I'm prepared to name a chapter after it. Do keep it beside me while we walk." },
      },
      choices = {
        { text = "Finish your notes properly, Professor. Science needs rigour.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Forget the notes. Some things aren't worth knowing.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Then the land is full of candle thieves with very poor manners. I came to Drywhisker to study the minerals of the gorge, and I've learned more about kobold teeth than I ever wished to." } },
      choices = {
        { text = "Drive them out and the gorge will be safe for study.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Leave the kobolds their tunnels and study somewhere else.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, by my notes! Do your kind take an interest in kobolds, I wonder, or only in creatures that don't steal candles?" },
        { id = "h_default", key = true,
          text = "Professor Phizzlethorpe, scholar and, at present, hostage to circumstance. I came to Drywhisker Gorge for my research, and the kobolds came for my candles." },
        { id = "h_escort", tags = { "news" }, when = { questActive = TODO_QUEST("Sunken Treasure") },
          text = "Lead on, then, and keep the kobolds off my coattails! My work waits for me down at the coast, and so does a very dull goblin." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior, splendid! The kobolds respect nothing but the sharp end of things, and you appear to have several sharp ends about your person." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! Perhaps you can tell me whether kobolds count as wildlife, then, because I've been keeping notes, and I'm undecided." },
      },
      choices = {
        { text = "Kobolds belong to the land too, Professor.", next = "druid_q", when = { class = "DRUID" } },
        { text = "Shall I tinker your notes back together, Professor?", next = "gnome", when = { race = "Gnome" } },
        { text = "What were you researching here?", next = "research" },
        { text = "Why do the kobolds want candles?", next = "kobolds" },
        { text = "Who waits for you at the coast?", next = "coast" },
        { text = "Shall I clear the kobolds from your path, Professor?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Have you studied the kobolds while you've been stuck here?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Good luck, Professor.", next = "END" },
      },
      again = { { id = "h_again", text = "Yes, yes? Quickly, before they come back for the rest of my wax." } },
    },
    research = {
      lines = {
        { id = "re_default", text = "Submerged salvage, my dear fellow! There's treasure sunk off the Arathi coast, and I've worked out how to reach it, or I had, before the kobolds took a fancy to my notebook." },
      },
      choices = { { text = "They stole your notes?", next = "notes" } },
    },
    notes = {
      lines = {
        { id = "no_default", text = "Ate half of them, I suspect, which is the cruellest review I've ever received. Fortunately the important parts are up here, in my head, so long as my head stays where it is." },
      },
      choices = {
        { text = "Sunken gold should go to whoever finds it.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Sunken gold belongs to the crown it sank from.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
      },
    },
    kobolds = {
      lines = {
        { id = "ko_default", text = "\"You no take candle!\" That's the whole of their philosophy, I'm afraid. They light the tunnels with them and fight over them like misers over coins." },
      },
      choices = { { text = "Something else, Professor.", next = "BACK", fx = { affinity = 1 } } },
    },
    coast = {
      lines = {
        { id = "ca_default", text = "A goblin colleague who funds the expedition and never lets me forget it. We disagree about everything except the treasure, which is quite enough to work together." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnome = {
      lines = { { id = "gn_default", text = "Bless you, but kobold teeth are hard on paper, and harder on diagrams. Walk me to the coast, and we'll redraw them together over a proper cup of something hot." } },
      choices = { { text = "Gladly, Professor.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Fascinating question, and I haven't the faintest idea." } },
  },
}
