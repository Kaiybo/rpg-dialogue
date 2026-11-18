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
    opn_forsaken = {
      lines = {
        { id = "opn_forsaken_q", text = "Honestly? I've watched that farm for weeks, and they bury nobody, they eat nothing, and they work through the night on things they won't let the wind near. Kinelory says some of them were Lordaeron farmers once, and maybe they were. You've seen more of them than I have; tell me what you think." },
      },
      choices = {
        { text = "Walking corpses with a plague. Burn the lot.", next = "opn_forsaken_r_hate", fx = { affinity = 1, align = { light = -1 }, opinion = { forsaken = "hate" } } },
        { text = "They were people once. Some still are.", next = "opn_forsaken_r_pity", fx = { align = { light = 1 }, trait = { kind = 1 }, opinion = { forsaken = "pity" } } },
        { text = "Watch them, like you're doing. That's enough for now.", next = "opn_forsaken_r_watch", fx = { trait = { careful = 1 }, opinion = { forsaken = "watch" } } },
        { text = "I knew some of them, living. I can't hate them.", next = "opn_forsaken_r_pity", when = { origin = "human_lordaeron_refugee" }, fx = { opinion = { forsaken = "pity" } } },
        { text = "Their plague is the problem, not them.", next = "opn_forsaken_r_dangerous", fx = { opinion = { new_plague = "dangerous" } } },
        { text = "Let's just get those papers.", next = "BACK" },
      },
    },
    opn_forsaken_r = {
      lines = {
        { id = "opn_forsaken_r_default", text = "Agreed. Talk later, papers now." },
      },
      choices = {
        { text = "Something else, Quae.", next = "BACK" },
      },
    },
    opn_forsaken_r_hate = {
      lines = {
        { id = "opn_forsaken_r_hate", text = "I'd like to, believe me, but there's two of us on this ridge and a farm full of them down there. Papers first, fire later." },
      },
      choices = {
        { text = "Something else, Quae.", next = "BACK" },
      },
    },
    opn_forsaken_r_pity = {
      lines = {
        { id = "opn_forsaken_r_pity", text = "Maybe. Kinelory would kiss you for saying it, and then she'd faint. I'll keep watching them all the same, people or not." },
      },
      choices = {
        { text = "Something else, Quae.", next = "BACK" },
      },
    },
    opn_forsaken_r_watch = {
      lines = {
        { id = "opn_forsaken_r_watch", text = "Glad someone thinks so, because my feet have stopped complaining and started filing reports of their own." },
      },
      choices = {
        { text = "Something else, Quae.", next = "BACK" },
      },
    },
    opn_forsaken_r_dangerous = {
      lines = {
        { id = "opn_forsaken_r_plague", text = "That's the part that keeps me on this ridge. Whatever they are, what they're brewing doesn't care which flag you fly." },
      },
      choices = {
        { text = "Something else, Quae.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Anything the orcs down there say to their spirits, if they say anything at all, for I've watched one of them walk the fences at dusk and I've no idea what he's asking for. Phin would give his last silver to know, and I'd give mine to know whether it's about us." } },
      choices = {
        { text = "Spying on a shaman's prayers is wrong, Quae. I won't.", next = "BACK", reply = "You're a better person than I am, then, and I'll not ask again. I'll keep my eyes on the wagons instead.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll listen in and tell you everything. War is war.", next = "BACK", reply = "Good, though I hope there's nothing to tell. If there is, Phin will want every word.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because there are more orcs down there than either of us could fight, and because Phin wants to know what they're doing, not merely stop it. Kinelory has a plan for the courier, and she'll need someone loud when it goes wrong, so stay close to her." } },
      choices = {
        { text = "I'll protect Kinelory. She shouldn't face this alone.", next = "BACK", reply = "Thank you. She'd never admit she needs it, but she does, and I'll rest easier knowing you're there.", fx = { align = { honor = 1 } } },
        { text = "Kinelory's plan is her own. I'll look after myself.", next = "BACK", reply = "Then I'll look after her myself, from up here, and hope my arrows are faster than her feet.", fx = { align = { honor = -1 } } },
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
        { text = "If it's plague, we stop it, whatever it costs.", next = "BACK", reply = "That's what Phin says, and he's usually right. I'd rather it cost us than Hillsbrad.", fx = { align = { light = 1 } } },
        { text = "Watch and report. What the Forsaken brew isn't our concern.", next = "BACK", reply = "Easy to say from up here, where the wind blows the smell away. I'll report, but I'll not pretend it's nothing.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Farming, they say, though nothing I'd eat grows in that soil anymore. Kinelory swears they're bringing their plague into the highlands one barrel at a time." } },
      choices = {
        { text = "Not every Forsaken brews plague. Learn the truth first.", next = "BACK", reply = "You sound like Phin, and he'd agree with you. I'll keep watching until I'm sure.", fx = { align = { light = 1 } } },
        { text = "Burn the farm. Plague isn't worth the risk.", next = "BACK", reply = "Tempting, and Kinelory would light the first torch. But if we're wrong, we've started a war for nothing.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I fear it more than I let Kinelory see, because everyone knows what the plague did to Lordaeron, and nothing I've watched at that farm looks like farming. If it does come, it won't stop at the Highlands, and I don't think Southshore is ready." } },
      choices = {
        { text = "The Light will stand against it. We'll stop it here.", next = "BACK", reply = "I hope so. I'll pray for it too, quietly, where Kinelory can't see me do it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then strike first and leave nothing. Mercy can wait.", next = "BACK", reply = "That's what my heart says, every night up here. My head keeps telling it to wait.", fx = { align = { light = -1 } } },
        { text = "Something else, Quae.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Nothing loud, not yet, because if Phin's right, there's plague being moved through that farm, and if we charge in, they'll only move it somewhere we can't see. Help Kinelory take the courier's papers first, and once we know what the Forsaken are planning, you can be as loud and shiny as you like." } },
      choices = {
        { text = "Patience first, then. We'll learn what they're planning.", next = "BACK", reply = "Patience it is, and thank you. Kinelory will hate it, but she'll thank you later.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If there's plague down there, I'll burn it out now.", next = "BACK", reply = "Then you'll spread it across the Highlands if you're wrong about the wind. Wait a little, please.", fx = { align = { order = -1 } } },
        { text = "Something else, Quae.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "It might, but the Forsaken down there have warlocks of their own, I'd wager, and they'd know a summoned thing the moment it crept past the fence. Phin taught us that the best way to watch is to be boring, and I've never met a demon that knew how to be boring." } },
      choices = {
        { text = "Boring it is. I'll keep the demon back.", next = "BACK", reply = "Thank you. Boring keeps us alive, and alive is how I like us.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them notice. My demon could clear that farm.", next = "BACK", reply = "It could, and it might bring every Forsaken in Arathi down on our heads. Please, not yet.", fx = { align = { order = -1 } } },
        { text = "Something else, Quae.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman, of all the things to come up this ridge! Keep your voice down, {class}, and if the wind tells you anything about that farm down there, tell me first." },
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
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Keep that hammer low and that shine lower, {class}, because the orcs down at Go'Shek Farm would spot holy light from the other side of the Highlands." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock, keep low, and keep that demon lower, {class}, because the last thing Kinelory needs is to turn round and see something with horns behind her." },
      },
      choices = {
        { text = "What are the Forsaken doing at Go'Shek Farm?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What's going on down at Go'Shek Farm?", next = "courier" },
        { text = "Why does Phin care about an orc farm?", next = "phin" },
        { text = "You look like you've been out here a long while.", next = "watch" },
        { text = "Phin said you hadn't checked in. He was frantic.", next = "frantic", when = { questActive = TODO_QUEST("Hints of a New Plague?") } },
        { text = "What kind of writing is on the courier's papers?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What are the Forsaken doing at Go'Shek Farm?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "You seem to fear the plague is coming to the Highlands.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why not just attack Go'Shek Farm outright, Quae?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What should I watch for at Go'Shek Farm, Quae?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What would you have a paladin do about Go'Shek Farm, Quae?", next = "xapala", when = { class = "PALADIN" } },
        { text = "A demon would make a good scout down at Go'Shek, Quae.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What should I listen for at Go'Shek Farm, Quae?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
        { text = "If the Forsaken brew plague, they must be stopped.", next = "BACK", reply = "They must, and they will be, if we learn enough before they move. That's why we're watching.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Whatever they brew could be turned to our use.", next = "BACK", reply = "Turned to our use? I'd sooner see it burned, and so would Phin. Don't let him hear you say that.", fx = { align = { light = -1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Apothecary shorthand, I think, full of measures and words I don't know, and a few lines that look like a recipe. A mage might see a pattern in it, and Phin would be very glad of anyone who could tell him what the Forsaken are brewing." } },
      choices = {
        { text = "If it's plague, it must be stopped at once.", next = "BACK", reply = "That's what I'm afraid of, and why I want the papers read properly before we do anything.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Their recipes could be useful to us.", next = "BACK", reply = "Useful? I've seen what plague does, and I'd rather not see what we'd do with it. Let's burn it.", fx = { align = { light = -1 } } },
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
        { text = "What do you make of the Forsaken, Quae?", next = "opn_forsaken" },
        { text = "Stealing their papers is better than a fight.", next = "BACK", reply = "It is, and it's safer for Kinelory. Thank you for seeing it that way.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "We should face the courier openly and take them.", next = "BACK", reply = "Openly? Kinelory would love that, and I'd spend the whole time terrified. Let's try it quietly first.", fx = { affinity = 1, align = { honor = 1 } } },
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
    forsaken = { { id = "tp_forsaken", text = "The orc farm below the ridge has Forsaken visitors now and then, and they carry vials. I write down everything, and I don't like what I'm writing." } },
    scourge = { { id = "tp_scourge", text = "The plague came from the north, and it's spreading, and I'm sure the Forsaken have a hand in it now. I'll find out how, if it's the last thing I do." } },
    stromgarde = { { id = "tp_stromgarde", text = "Refuge Pointe needs to know what the Horde is doing here, and I'm the one watching. Captain Nials gets my notes first, and the Syndicate never sees them." } },
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
    { id = "o_forsaken_pity", tags = { "news" }, when = { gossip = { topic = "forsaken", stance = "pity" } },
      text = "Quae says you think some of the Forsaken are still people! I, well, I think so too, sometimes, though I'd never say it to Quae, and I suppose you already have." },
    { id = "o_forsaken_hate", tags = { "news" }, when = { gossip = { topic = "forsaken", stance = "hate" } },
      text = "Quae told me you'd burn the whole farm! I mean, I wouldn't stop you, exactly, but please wait until we've got the papers out first." },
    { id = "g_pace", text = "Oh! You startled me, which isn't hard lately. Are you here to help, or only passing by on your way to somewhere sensible?" },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your armour's in worse shape than my nerves, and that's saying something. Mend it before we go anywhere near that road." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Terribly, yes, because if those papers say what Phin thinks they say, the Forsaken are planning something for Hillsbrad that none of us will like. I'd feel braver if the earth itself were on our side, and I suppose with you here, it rather is." } },
      choices = {
        { text = "We'll stop them. Hillsbrad's people won't suffer this.", next = "BACK", reply = "Thank you. I'll feel braver with you beside me, and I'll need to.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Whatever they plan, it's Hillsbrad's problem, not mine.", next = "BACK", reply = "Hillsbrad's my problem, then, and I'll carry it whether you help or not. I'd rather you helped.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I'd thought to ambush him, but if you could follow him without his noticing, perhaps we could learn where he goes, which would be cleverer. Oh, I do wish I were braver about it all." } },
      choices = {
        { text = "Ambush him. Take the papers and be done.", next = "BACK", reply = "That's the quicker way, and the one I was going to take. Let's do it before I lose my nerve.", fx = { align = { honor = -1 } } },
        { text = "Confront him openly. No ambush, no tricks.", next = "BACK", reply = "Openly? I'd shake the whole time, but you're right that it's honest. Walk with me, then.", fx = { affinity = 1, align = { honor = 1 } } },
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
        { text = "I'll stay close and keep you safe. That's a promise.", next = "BACK", reply = "Then I'll walk up to him a little taller. Thank you, truly.", fx = { align = { honor = 1 } } },
        { text = "I'll cover you, but if it goes wrong, I'm leaving.", next = "BACK", reply = "That's fair, and honest, which is more than most give. I'll try not to make you leave.", fx = { align = { honor = -1 } } },
        { text = "Something else, Kinelory.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Because somebody has to, and Phin trusted me with this, and if I let fear decide for me then I'd never do anything at all. I've been scared since the day we got here, so scared I couldn't eat the first week, and I've found I can be scared and still keep walking." } },
      choices = {
        { text = "That's true courage. The Light walks with you.", next = "BACK", reply = "Thank you. I'll take any company the Light offers, and yours too.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fear is telling you something. Let someone else take him.", next = "BACK", reply = "It is, and it's been telling me since I woke up. I'm going anyway.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "He comes the same way every few days and never stops anywhere for long, which tells me he knows someone might be watching. I mean to stop him before he reaches the farm, but I'll admit I'd rather do it in the open than in the dark." } },
      choices = {
        { text = "Then we'll stop him in the open, face to face.", next = "BACK", reply = "Face to face, then, and I'll try not to look as frightened as I feel.", fx = { align = { honor = 1 } } },
        { text = "Ambush him in the dark. Fair play won't stop a plague.", next = "BACK", reply = "You're probably right, and that's what scares me. Let's make it quick, at least.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "He was one of the Kirin Tor's students, before he left, and he still reads everything twice and argues with it once. He says the courier's papers might be written in a cipher the Forsaken apothecaries use, and if they are, I'll need someone cleverer than me to read them, which is most people, honestly." } },
      choices = {
        { text = "Bring me the papers. We'll read them together.", next = "BACK", reply = "He'll like that. Two readers and one argument, and Phin will be very happy.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Ciphers are dull. I'd rather burn the courier.", next = "BACK", reply = "Phin would never forgive you, and neither would I. We need what's in those papers.", fx = { align = { honor = -1 } } },
        { text = "Something else, Kinelory.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Oh, and a dwarven one, that's, well, that's wonderful, {class}, and if you could ask the wind to slow that Forsaken courier down, I'd be terribly grateful." },
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
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Oh, that's, well, that's very good, {class}, because Phin studied at Dalaran and he always said a mage is worth a whole patrol, though I suspect he meant himself." },
      },
      choices = {
        { text = "I'll take the loud part. Stealth was never my way.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Why go after him yourself?", next = "why" },
        { text = "You must have a plan.", next = "plan" },
        { text = "Quae says you're braver than you are sensible.", next = "quae", when = { heardLine = "quae.cp_default" } },
        { text = "I'll keep my demon behind you, then.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Want some help ambushing the Forsaken courier?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "You're frightened, Kinelory. Why go after the courier yourself?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What do you know of the courier's route?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Shall I cover you from the trees when you face the courier?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Should we ambush the courier, or follow him quietly?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Phin seems to set great store by mages, Kinelory.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "You seem frightened of what that courier carries, Kinelory.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Not today, I'm afraid.", next = "END" },
      },
      again = { { id = "h_again", text = "Something else? Talking helps, so please do; it's better than listening to the kobolds." } },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I'd like it more than I can say, though I'll still go if you don't, because Phin needs those papers and Quae can't leave her post. Stay close behind me, and if I start shaking, just pretend you didn't see." } },
      choices = {
        { text = "No shame in shaking. You're braver than you think.", next = "BACK", reply = "Thank you. I'm not sure that's true, but I'll pretend it is until it's over.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Shaking gets people killed. Steady yourself.", next = "BACK", reply = "You're right, and I'm trying. My legs just haven't heard the news.", fx = { align = { light = -1 } } },
        { text = "Something else, Kinelory.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Behind me is worse, actually, for I'd keep looking back at it instead of at the road. Perhaps out front, where the courier can be frightened instead of me, which seems fairer all round." } },
      choices = {
        { text = "Using fear on the enemy is fair play.", next = "BACK", reply = "Fair, perhaps, but terrifying, which I suppose is the point. Out front, then, where I can't see it.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd rather beat him fairly, without tricks.", next = "BACK", reply = "Thank you. I'd rather beat him with my own feet and my own nerve.", fx = { align = { honor = 1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    why = {
      lines = {
        { id = "wh_default", text = "Because Quae has the better eyes and I have the faster legs, and someone has to. If those papers reach the farm, Phin's whole worry comes true, and Hillsbrad's farms pay for it." },
      },
      choices = {
        { text = "Fear doesn't stop you. That's real courage.", next = "BACK", reply = "Thank you. I've never thought of myself as brave, and I'd like to start.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Courage is fine. Just don't get me killed.", next = "BACK", reply = "I'll do my best not to. I'd rather we both came home.", fx = { affinity = -1, align = { light = -1 } } },
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
    forsaken = { { id = "tp_forsaken", text = "The Forsaken are brewing a new plague, I'm sure of it, and they're testing it here in the Highlands. Quae thinks I'm frightened, and she's right, but I'm going anyway." } },
    scourge = { { id = "tp_scourge", text = "The Scourge's plague emptied half of Lordaeron, and I'll not stand by while someone brews a second one. Whatever the Forsaken are making down there, I mean to stop it." } },
    holy_light = { { id = "tp_holy_light", text = "I pray to the Light every night, and I ask it to keep me brave. It hasn't answered yet, but I'm still here." } },
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
    { id = "g_gorge", text = "A rescuer! Or at least a person with a weapon, which at this point raises my odds of survival by a good forty percent, and I'll gladly take it." },
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
        { text = "Stay behind me and keep to the path, Professor.", next = "BACK", reply = "Very sensible, and I'll measure your stride as we go. Purely for science, you understand.", fx = { align = { order = 1 } } },
        { text = "Forget the path. We charge straight through and run for it.", next = "BACK", reply = "Charge? Through kobolds? My calculations give that a very poor survival rate, but I'll run fast.", fx = { align = { order = -1 } } },
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
        { text = "Finish your notes properly, Professor. Science needs rigour.", next = "BACK", reply = "I quite agree, and I'll finish them by candlelight tonight, assuming any candles survive.", fx = { align = { order = 1 } } },
        { text = "Forget the notes. Some things aren't worth knowing.", next = "BACK", reply = "Some things, yes, but candle-smoke tracking is not one of them! I'll finish them anyway.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Then the land is full of candle thieves with very poor manners. I came to Drywhisker to study the minerals of the gorge, and I've learned more about kobold teeth than I ever wished to." } },
      choices = {
        { text = "Drive them out and the gorge will be safe for study.", next = "BACK", reply = "Splendid, and the minerals will finally get the attention they deserve.", fx = { align = { order = 1 } } },
        { text = "Leave the kobolds their tunnels and study somewhere else.", next = "BACK", reply = "Elsewhere? I've three weeks of measurements here, but I suppose the kobolds have more.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Individually, no, but they come in such numbers and with such conviction, and they've a way of shouting about candles that unsettles a man of learning. I'd be grateful for an escort to the coast, and grateful again if you didn't smite anything that merely looked at me unkindly." } },
      choices = {
        { text = "I'll see you safely out, and smite only what attacks.", next = "BACK", reply = "Very proper, and very much appreciated. I'll stay behind you at a calculated distance.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Anything that waves a pick at us gets smitten.", next = "BACK", reply = "That's most of them, by my count, so smite away, and I'll take notes.", fx = { align = { light = -1 } } },
        { text = "Something else, Professor.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "My research notes, which they couldn't possibly read, and a brass astrolabe, which they couldn't possibly use. I suspect they took them simply because I seemed to want them back, which is a very kobold sort of reasoning, and rather hurtful." } },
      choices = {
        { text = "I'll fetch back what's yours, Professor.", next = "BACK", reply = "Thank you! The astrolabe is irreplaceable, and the notes even more so.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Brass astrolabe, you say? I could find a buyer.", next = "BACK", reply = "A buyer? It's an heirloom! I'll want it back, if you please, unsold.", fx = { align = { honor = -1 } } },
        { text = "Something else, Professor.", next = "BACK" },
      },
    },
    xpriest = {
      big = true,
      lines = { { id = "xpriest_default", text = "Absolutely, and for my notes, which would have been the greater loss to scholarship, if not to me personally. The kobolds kept me awake every night chanting about wax, and I'll confess I said a prayer or two, though I've never been sure who listens to a gnome in a gorge." } },
      choices = {
        { text = "Someone always listens, Professor. Take heart.", next = "BACK", reply = "Thank you. I'll take heart, and I'll take my notes, if they're still in one piece.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Nobody listens. Your own wits got you through.", next = "BACK", reply = "My wits, yes, and a good deal of running. I'll take the credit, then.", fx = { align = { light = -1 } } },
        { text = "Something else, Professor.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Everything, naturally, but chiefly why the rock here is so riddled with tunnels, and whether the kobolds dug them or merely moved in. A shaman could ask the earth directly, I suppose, though I'd want the answer written down, since I've never trusted anything I couldn't put in a footnote." } },
      choices = {
        { text = "The earth deserves to be heard, not footnoted.", next = "BACK", reply = "Heard, then, and footnoted afterwards, if the earth doesn't mind. I'll compromise.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Write it down, then. Knowledge should be kept properly.", next = "BACK", reply = "Exactly my view! Every tunnel catalogued, every mineral named, and every kobold noted.", fx = { align = { order = 1 } } },
        { text = "Something else, Professor.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The tides along the Arathi coast, and the ships the old kingdom lost to them, which is a long story with a great many footnotes. The goblin waiting at the shore thinks only of what might be salvaged, and I think only of what might be learned, and between us we nearly make one sensible expedition." } },
      choices = {
        { text = "Learning first, Professor. The salvage can wait.", next = "BACK", reply = "Learning first, yes, though the goblins won't like it. I'll share my findings either way.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The goblin has the right idea. Salvage pays.", next = "BACK", reply = "It does pay, I'll grant you, and my research grants are very small. Perhaps a little salvage.", fx = { align = { honor = -1 } } },
        { text = "Something else, Professor.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Only in books, and the books were unkind to your profession, though I've always suspected the authors had never met one either. I'll take you as I find you, which so far is helpful and not trying to eat me, which is more than I can say for the kobolds." } },
      choices = {
        { text = "Fair judgement, Professor. I'll keep the demon civil.", next = "BACK", reply = "Thank you. Civil demons make for much better footnotes than uncivil ones.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The books were right about some of us, Professor.", next = "BACK", reply = "How refreshingly honest! I'll add a footnote to the books, then, with your permission.", fx = { align = { light = -1 } } },
        { text = "Something else, Professor.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, by my notes! Do your kind take an interest in kobolds, I wonder, or only in creatures that don't steal candles?" },
        { id = "h_default", key = true,
          text = "Professor Phizzlethorpe, scholar, engineer, late of Gnomeregan and, at present, hostage to circumstance. I came to Drywhisker Gorge for my research, with a colleague waiting for me at the coast, and the kobolds came for my candles." },
        { id = "h_escort", tags = { "news" }, when = { questActive = TODO_QUEST("Sunken Treasure") },
          text = "Lead on, then, and keep the kobolds off my coattails! My work waits for me down at the coast, and so does a very dull goblin." },
        { id = "h_warcl", when = { class = "WARRIOR" }, text = "A warrior, splendid! The kobolds respect nothing but the sharp end of things, and you appear to have several sharp ends about your person." },
        { id = "h_huntcl", when = { class = "HUNTER" }, text = "A hunter! Perhaps you can tell me whether kobolds count as wildlife, then, because I've been keeping notes, and I'm undecided." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, by my notes! I'm told your sort can make a whole cave glow, {class}, which would be terribly useful, since the kobolds took every candle I owned." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Oh! You startled me, {class}, and I'm already quite startled enough today. Unless you're a kobold in a very good disguise, in which case, well done, and please give back my candles." },
        { id = "h_priestcl", when = { class = "PRIEST" }, text = "A priest! I was half hoping someone would come along to read my last rites, {class}, though I'd much rather you read the road to the coast instead." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! I've read that your kind can speak with the very stones, {class}, so perhaps you could ask the gorge why it lets kobolds live in it, for I've been wondering." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage, splendid, a fellow scholar! Do forgive the state of me, {class}, for the kobolds have had me living on cave water and indignation for a week." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Good heavens, is that a demon? I've read about them, of course, {class}, but reading is so much less alarming than seeing one blink at you." },
      },
      choices = {
        { text = "Kobolds belong to the land too, Professor.", next = "druid_q", when = { class = "DRUID" } },
        { text = "Shall I tinker your notes back together, Professor?", next = "gnome", when = { race = "Gnome" } },
        { text = "You must have been researching something out here.", next = "research" },
        { text = "The kobolds seem very keen on candles.", next = "kobolds" },
        { text = "Who waits for you at the coast?", next = "coast" },
        { text = "Shall I clear the kobolds from your path, Professor?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "You must have studied the kobolds while you've been stuck here.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Are the kobolds really so dangerous, Professor?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Did the kobolds take anything besides candles, Professor?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "You must have been afraid for your life, Professor.", next = "xpriest", when = { class = "PRIEST" } },
        { text = "What do you want to know about the gorge, Professor?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What were you studying before the kobolds came, Professor?", next = "xmage", when = { class = "MAGE" } },
        { text = "Have you never met a warlock before, Professor?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Good luck, Professor.", next = "END" },
      },
      again = { { id = "h_again", text = "Yes, yes? Quickly, please, before they come back for the rest of my wax and the last of my calculations." } },
    },
    research = {
      lines = {
        { id = "re_default", text = "Submerged salvage, my dear fellow! There's treasure sunk off the Arathi coast, and I've worked out how to reach it, or I had, before the kobolds took a fancy to my notebook." },
      },
      choices = { { text = "So they stole your notes.", next = "notes" } },
    },
    notes = {
      lines = {
        { id = "no_default", text = "Ate half of them, I suspect, which is the cruellest review I've ever received. Fortunately the important parts are up here, in my head, so long as my head stays where it is." },
      },
      choices = {
        { text = "Sunken gold should go to whoever finds it.", next = "BACK", reply = "Whoever finds it is the most efficient arrangement, yes, mathematically speaking. The crown may disagree.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Sunken gold belongs to the crown it sank from.", next = "BACK", reply = "A principled position! Stromgarde has rather bigger worries these days, though, so the paperwork will be fascinating.", fx = { affinity = -1, align = { order = 1 } } },
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
    gnomeregan = { { id = "tp_gnomeregan", text = "I studied in Gnomeregan before the troggs came, and I lost all my notes in the evacuation. Now I've lost them again, to kobolds, which is somehow worse." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran's mages are clever, I'll grant you, but they've no head for engineering. I'd show them a thing or two, if they'd only let me in." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's goblins build things that explode, and they think that's the point. I build things that explode only when I want them to, and that's science." } },
    _none = { { id = "tp_none", text = "Fascinating question, and I haven't the faintest idea, which I shall note as a gap in the data." } },
  },
}
