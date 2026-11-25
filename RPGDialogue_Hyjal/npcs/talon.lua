-- Thisalee Crow, Druid of the Talon, in eastern Mount Hyjal. Voice: bibles/hyjal.md
local P = RPGDialogueAPI:Pack("rpgd.hyjal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "hyj_thisalee", id = TODO_NPC("Thisalee Crow"), name = "Thisalee Crow", title = "Druid of the Talon",
  bible = "bibles/hyjal.md", role = "questgiver", tier = "major",
  communities = { "hyjal", "druids_of_the_talon" }, temper = { "proud", "sharp" }, values = { "brave", "loyal", "curious" },
  likesTone = "blunt",
  notices = { "class", "race", "form", "kit" },

  impression = {
    first = "She thinks caution is something that happens to other people.",
    third = "{name} met Thisalee Crow, a headstrong young Druid of the Talon who keeps watch over the wounded slopes of Mount Hyjal.",
  },

  greetings = {
    { id = "g_default", text = "Keep your voice down near the nests, and keep walking if you've nothing to say." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and still in one piece. The mountain hasn't eaten you yet, then." },
    { id = "g_warm", when = { disposition = { min = 70 } }, text = "There you are! I was hoping you'd come back up this way; I've got opinions to share and nobody worth sharing them with." },
    { id = "g_cold", when = { disposition = { max = 34 } }, text = "Oh, it's you. Say your piece, and then let me get back to work." },
    { id = "g_initiate", when = { origin = "nightelf_druid_initiate" }, text = "Oh, you're one of the ones who slept through everything, aren't you? Don't look like that, I'm not cross, only you've a lot of catching up to do, and the mountain won't wait while you yawn." },
    { id = "g_hyjal", when = { origin = "nightelf_hyjal_survivor" }, text = "You were up here for the battle, weren't you? I was too young to stand on the line, and I've been trying to make up for it ever since, so tell me what you saw when you've a moment, because the elders never will." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and I'd started to think the mountain had eaten you after all, so don't just stand there, tell me what you saw." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Look at you, you've grown a lot stronger since you were last up here, and about time, because this mountain needs people who can keep up." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear you talked someone round on the mountain, which takes more patience than I've got, because I'd have told them they were wrong and walked off." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Somebody up here's furious with you, I hear, and I don't much care why, but the Talon's got enough trouble without people squabbling, so sort it out, would you?" },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid of the Circle! Good, because the mountain needs every one of us it can get, and Nighthaven keeps far too many of you sitting in the grass." },
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "Bear's a fine shape for holding a line, but it's terrible for keeping up with me. Change back when you want to talk." },
    { id = "n_cat", cat = "form", when = { form = "cat" },
      text = "Ha! Somebody's been teaching you the cat's patience. Just don't go stalking the owls; they're not prey up here." },
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "Whatever that darkness is that you've wrapped yourself in, keep it away from my birds. They've seen enough shadow on this mountain to last them a lifetime." },
    { id = "n_warlock", cat = "class", place = "before", when = { class = "WARLOCK" },
      text = "I can smell the fel on you from here, and so can every bird on the slope. The last ones who carried that stink up this mountain burned half of it." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "One of our own, come home. The mountain remembers us, even if most of our people have forgotten the way back up." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You look like you came through the gorge the hard way. Sit before you fall over; the demons in there don't care how tired you are." },
  },

  react = {
    { id = "r_stealth", on = "stealth", text = "I can hear you breathing, you know. The owls heard you three ridges back." },
    { id = "r_mount", on = "mount", text = "Get that beast off the moss, would you? We're trying to grow things up here." },
  },

  start = "hello",
  nodes = {
    d_road = {
      hub = true,
      lines = { { id = "dr_thr_default", text = "Ask, then, and be quick about it, because a druid of the Circle on Hyjal is a druid I mean to put to work as soon as you've finished talking." } },
      again = { { id = "dr_thr_again", text = "What else? I've a ridge to fly, but for a druid I'll make it two questions." } },
      choices = {
        { text = "Why don't the Talon teach your shape to the rest of us?", next = "d_shape" },
        { text = "You don't think much of Nighthaven, do you?", next = "d_moon" },
        { text = "Does the Arch Druid's new tree slow Nordrassil's healing?", next = "d_tree", when = { race = "NightElf" } },
        { text = "Would the Talon ever take a tauren druid?", next = "d_tauren", when = { race = "Tauren" } },
        { text = "That's enough about the Circle.", next = "BACK" },
      },
    },
    d_shape = {
      big = true,
      lines = { { id = "dr_ths_default", text = "Because Aviana gives it, not us, and she gives it to very few, and the ones who get it spend the rest of their lives looking after her birds. Nighthaven would have every druid learn every shape like recipes in a book, and some shapes aren't recipes." } },
      choices = {
        { text = "Then it should stay with the Talon. Some gifts must be earned.", next = "d_road", reply = "Thank you! Finally somebody from Moonglade who understands that, and you can tell Loganaar I said so.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Every druid ought to be able to learn every shape.", next = "d_road", reply = "Spoken like somebody who's never been bitten by an owl. Ask Aviana yourself, if you can find her shrine; I'd love to watch.", fx = { align = { order = -1 } } },
        { text = "Back to the Circle.", next = "d_road" },
      },
    },
    d_moon = {
      big = true,
      lines = { { id = "dr_thm_default", text = "I think Nighthaven's a lovely meadow full of druids who'd rather talk about balance than climb a mountain and do some. The Keeper's wise, I'll give him that, but wisdom doesn't pull up thornbushes or carry wounded owls down a slope." } },
      choices = {
        { text = "Somebody has to keep the glade. I'll defend Nighthaven.", next = "d_road", reply = "Defend it all you like; I'm not saying it should burn. I'm saying it should send me twelve more druids, and it never does.", fx = { align = { order = 1 } } },
        { text = "You're right. The work is up here, not in a meadow.", next = "d_road", reply = "There, you see? I knew I liked you. Go and find Thylaen, and tell him I said you're useful.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Back to the Circle.", next = "d_road" },
      },
    },
    d_tree = {
      big = true,
      lines = { { id = "dr_tht_default", text = "It heals slowly because a tree that size takes a long time to heal, and quickly would be worse, for we'd think our long lives had returned. I don't mind the Arch Druid's tree half as much as the Keeper does; I mind that he thought we needed a new one more than we needed this one mended." } },
      choices = {
        { text = "Teldrassil was right. Our people needed a new home.", next = "d_road", reply = "Maybe they did, and maybe I'm only cross because I'm the one up here with a shovel. Go and look at the crown, though, and tell me it doesn't need us.", fx = { align = { order = 1 } } },
        { text = "Every druid we have should be here, mending Nordrassil.", next = "d_road", reply = "Now you're talking like a Druid of the Talon! I'll find you a shovel and an owl, and you can start with whichever bites less.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Back to the Circle.", next = "d_road" },
      },
    },
    d_tauren = {
      lines = { { id = "dr_thta_default", text = "Not yet, but I'd take one in a heartbeat if you could keep up on the slopes. Hamuul's druids are patient and strong, and the owls like the way you smell, which is more than I can say for half the Circle." } },
      choices = { { text = "Back to the Circle.", next = "d_road", fx = { affinity = 2 } } },
    },
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "That's what I ask everyone who climbs this far. Should the Talon keep watching and writing, the way the Skylord wants, or should we be out there burning the fel off this mountain? Be honest; the owls already know what I think." },
      },
      choices = {
        { text = "Act. Every day you wait, the fel spreads.", next = "op_r1", fx = { affinity = 2, align = { order = -1 }, trait = { brave = 1 }, opinion = { talon_caution = "act" } } },
        { text = "Omnuron is right. Rush in and you'll spread it further.", next = "op_r2", fx = { affinity = -1, align = { order = 1 }, trait = { cautious = 1 }, opinion = { talon_caution = "wait" } } },
        { text = "Do both. Scout first, then burn it hard.", next = "op_r3", fx = { trait = { practical = 1 }, opinion = { talon_caution = "both" } } },
        { text = "A druid acts, Thisalee. Watching is for owls.", next = "op_r4", fx = { affinity = 1, opinion = { talon_caution = "act" } }, when = { class = "DRUID" } },
        { text = "That's between you and the Skylord.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "Yes! Thank you! I'm going to write that down and leave it on the Skylord's perch, unsigned." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "You sound exactly like him, and the worst of it is that you might both be right." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "Well, that's what I've been doing, more or less, I just haven't told anyone about the second part." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r4 = {
      lines = { { id = "op_r4_default", text = "Careful, the owls will hear you, and they're terribly sensitive about it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "dr_th_full", when = { class = "DRUID", minLevel = 58 },
          text = "A druid who's actually finished training, up on my mountain! You've no idea how rare that is, because most of the Circle's strong ones end up in Silithus or asleep in a barrow den." },
        { id = "h_default", key = true,
          text = "I am Thisalee Crow, of the Druids of the Talon. If you came up through Darkwhisper Gorge, you've already had the worst welcome this mountain offers, so you may as well tell me what you're after." },
        { id = "h_young", when = { maxLevel = 55 },
          text = "You're young to have climbed this high. The mountain doesn't grade its dangers by who's asking, so stay close to the paths until you know the slopes." },
        { id = "h_feathers", tags = { "news" }, when = { questActive = TODO_QUEST("Feathers in Flight") },
          text = "Feathers, is it? Take what the owls drop in their nests and I'll say nothing, but if I see you plucking a live bird, you and I are going to have words." },
        { id = "h_celastrus", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Celastrus the Bitter"), days = 3 } },
          text = "The thornbush on the eastern slope is gone, and the deer are already back in that hollow. Thylaen won't thank you loudly, so I'll do it for both of us." },
        { id = "h_windwalk", tags = { "news" }, key = true, when = { questRecent = { TODO_QUEST("Yashiro's Windwalk"), days = 3 } },
          text = "The birds came back over Dae'gun this morning. I'm told a doomguard won't be getting up again, and that you were there when it fell." },
        { id = "h_human", when = { race = "Human" },
          text = "A human, this far north. Your people held these slopes beside ours once, and some of them never went home, so walk softly near Mourning's Rest." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "The Horde, up here. Your warriors stood on this mountain when the Legion came, so I won't spit, but I'll be watching where you put your feet." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest. Good, actually; there's more dying on this mountain than there ought to be, and not all of it stays dead." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, with your beast at your heel. Keep it off the nests and I'll like you well enough." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "A mage. You'll feel the old magic pooling in places up here; don't go poking at it just because it hums." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Night's the best time on the mountain. The owls hunt, the moon's close, and nobody from Everlook is shouting prices at me." },
      },
      again = {
        { id = "h_again", text = "What else? Talk fast; I've a ridge to fly before dark." },
        { id = "h_again2", text = "Go on, then. I've got time for one more question, maybe two." },
      },
      choices = {
        { text = "I don't know the Druids of the Talon.", next = "talon" },
        { text = "I'm surprised anyone can reach this place at all.", next = "gorge" },
        { text = "The World Tree still looks badly scarred.", next = "tree" },
        { text = "Where is help needed on the mountain?", next = "work" },
        { text = "The Talon take their orders from someone, I expect.", next = "omnuron" },
        { text = "About the owl feathers...", next = "feathers", when = { questActive = TODO_QUEST("Feathers in Flight") } },
        { text = "I'm a priest. Who here needs the Light?", next = "xpriest", when = { class = "PRIEST" } },
        { text = "I'm of the Circle. How can I help?", next = "xdruid", when = { class = "DRUID" } },
        { text = "This mountain was ours. Why did we leave it?", next = "xnelf", when = { race = "NightElf" } },
        { text = "My people fought here. Do you remember them?", next = "xhuman", when = { race = "Human" } },
        { text = "Why do you flinch whenever I come near?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What hunts on these slopes?", next = "xhunter", when = { class = "HUNTER" } },
        { text = "Does the Horde have friends up here?", next = "xhorde", when = { faction = "Horde" } },
        { text = "Archimonde fell on this mountain. Were you here?", next = "kal_arch", when = { race = "NightElf" } },
        { text = "Tell me how the Talon sits with the rest of the Circle.", next = "d_road", when = { class = "DRUID" } },
        { text = "Fair winds, Thisalee.", next = "END" },
      },
    },

    talon = {
      lines = {
        { id = "ta_default", text = "We're the druids who learned the shape of the crow and the storm, and we take our gift from Aviana, the Mistress of Birds. Every winged thing on this mountain is ours to look after, so my days go to chasing owls and my nights to chasing the things that eat them." },
      },
      choices = {
        { text = "I know little of Aviana.", next = "aviana" },
        { text = "Where is your shrine?", next = "shrine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    aviana = {
      big = true,
      lines = {
        { id = "av_default", text = "A goddess of the sky, terrible and beautiful at once. She fought the demons in the War of the Ancients until they surrounded her and brought her down, and the first druids carried her body up here, to the highest mountain they could find, and laid her to rest." },
        { id = "av_nelf", when = { race = "NightElf" }, text = "You'll have heard the story as a child, I expect, but you never heard it standing where she fell. The first druids carried her up here and laid her in a ring of stones, and the birds still won't nest inside it." },
      },
      choices = {
        { text = "And the World Tree?", next = "aviana_seed" },
        { text = "Gods die. The living have to carry on.", next = "BACK", reply = "Maybe, but carrying on means remembering her, and I don't think the mountain would let us forget even if we tried.", fx = { align = { order = 1 } } },
        { text = "Then some of her fury lives on in you.", next = "BACK", reply = "I like to think so, and the elders frown when I say it, but every time a demon crawls out of that gorge, I feel her wings in my own.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    aviana_seed = {
      lines = {
        { id = "as_default", text = "A seed from G'hanir, the Mother Tree she lived in, was all that survived of her home, and it was planted here and became Nordrassil. So when I say this mountain is sacred to the Talon, I mean our goddess is buried under the same sky as the tree that grew from her house." },
      },
      choices = {
        { text = "That's a heavy thing to guard.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shrine = {
      lines = {
        { id = "sh_default", text = "The Shrine of Aviana stands on the rim of the mountain, where her stones are. It's a refuge for anything with wings, and if a bird comes in hurt, it doesn't leave until it can fly, whatever Everlook pays for owl feathers." },
      },
      choices = {
        { text = "Everlook pays for owl feathers?", next = "supply" },
        { text = "Something else.", next = "BACK" },
      },
    },

    gorge = {
      lines = {
        { id = "go_default", text = "After the battle, Malfurion Stormrage sealed the summit away behind a wall of growth so the tree could heal, and for years the only way up was on wings. Now the way through Darkwhisper Gorge is open, and all sorts are coming up it, and nobody bothers to tell the Talon why." },
      },
      choices = {
        { text = "Someone must have opened that gorge.", next = "gorge_who" },
        { text = "And Malfurion himself?", next = "gorge_malf" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gorge_who = {
      big = true,
      lines = {
        { id = "gw_default", text = "If anyone knows, they're not telling a Talon as young as me. All I know is that the demons who fled into the gorge after Archimonde fell are still in there, and now people are walking past them with packs on their backs." },
      },
      choices = {
        { text = "The mountain needs hands. Let them come.", next = "BACK", reply = "Then you'd better be one of the hands that knows where the demons are, because I'm tired of hauling travellers out of the gorge by their packs.", fx = { align = { order = -1 } } },
        { text = "It should have stayed sealed until it healed.", next = "BACK", reply = "That's what I said to Omnuron, and he told me I was being rash, which is the first time anyone has accused me of being too careful.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gorge_malf = {
      lines = {
        { id = "gm_default", text = "He sleeps in the Emerald Dream, and his body lies in the barrow dens below Moonglade, and the Circle keeps his place for him. I'd like to think he'd be pleased with what we've done up here, though I'd also like to think he'd let me do it faster." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "malfurion" } } },
      },
    },

    tree = {
      big = true,
      lines = {
        { id = "tr_default", text = "Wounded, but alive. When the wisps tore Archimonde apart, the blast scorched Nordrassil to its heart, and our people lost the gift that kept us from growing old. The tree is mending, slowly, and the land around it is mending with it." },
        { id = "tr_nelf", when = { race = "NightElf" }, text = "You feel it too, don't you? We're mortal now, every one of us, and the tree that kept us otherwise is still scarred black at the crown. I say we'd better hurry, then, because we haven't got forever any more." },
      },
      choices = {
        { text = "Surely the tree could heal faster with help.", next = "tree_faster" },
        { text = "Some things should heal in their own time.", next = "BACK", reply = "That's what the elders say, and I suppose you're all right, but patience is easy to preach when you're not the one watching it wither.", fx = { align = { order = 1 } } },
        { text = "Then we push, and help it along.", next = "BACK", reply = "Now you sound like a Talon worth flying with, and if Omnuron asks, you can tell him I didn't put the idea in your head.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tree_faster = {
      lines = {
        { id = "tf_default", text = "The tree heals itself; what it can't do is weed its own garden. The fel that rained down in the war soured the growth on the lower slopes, and now the brambles strangle everything else. Clear the rot, and the tree does the rest." },
      },
      choices = {
        { text = "Who's clearing the rot?", next = "work" },
        { text = "Something else.", next = "BACK" },
      },
    },

    work = {
      lines = {
        { id = "wo_default", text = "Pick a direction and you'll find trouble. There's Thylaen, who wants the poisoned thornbushes cut back, and an orc blademaster called Yashiro who's set on burning the demons out of Dae'gun, and the dead walking at Mourning's Rest, which nobody wants to talk about." },
      },
      choices = {
        { text = "Tell me about Thylaen.", next = "work_thylaen" },
        { text = "I didn't expect to see an orc up here.", next = "work_yashiro" },
        { text = "The dead at Mourning's Rest?", next = "work_mourning" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_thylaen = {
      lines = {
        { id = "wt_default", text = "Thylaen tends the slopes and talks to the weeds like they're unruly children, which some of them are. There's a great thorn called Celastrus to the east that eats whatever it catches, and Thylaen has been wanting it gone for a long while." },
        { id = "wt_done", when = { questDone = TODO_QUEST("Celastrus the Bitter") }, text = "You already cut down Celastrus, so Thylaen likes you, though you'd never guess it. Go back; there's always another bramble." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    work_yashiro = {
      big = true,
      lines = {
        { id = "wy_default", text = "Yashiro walks alone, fights alone, and doesn't ask anyone's leave. I like him more than I should, since he does exactly what I'd do if Omnuron would let me. He means to light fires in Dae'gun until the demons come out to answer them." },
      },
      choices = {
        { text = "An orc fighting demons on your mountain is a gift.", next = "BACK", reply = "Exactly, and I keep telling the Circle so, though they look at him the way they look at a fire somebody else lit.", fx = { align = { honor = 1 } } },
        { text = "I'd watch him. Orcs and demons have history.", next = "BACK", reply = "Oh, I watch him, and he knows it, and I think he likes it better that way, but he hasn't given me a single reason to worry yet.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    work_mourning = {
      lines = {
        { id = "wm_default", text = "There's an old battlefield to the west where the defenders camped below the summit, and now the dead there have got up again. A Wild God has taken an interest, a great vulture called Marrosis, and if you go, don't mention food; it gets irritable." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    omnuron = {
      lines = {
        { id = "om_default", text = "Skylord Omnuron leads the Talon, and he's wise and patient and careful, and I'd follow him into any fire. He'd just rather we look at the fire for a month first and write down what colour it is." },
      },
      again = { { id = "om_again", text = "Anything else about the Skylord? Careful, though; the owls carry gossip." } },
      choices = {
        { text = "Should the Talon keep watching, or start acting?", next = "op_ask" },
        { text = "You don't agree with him.", next = "omnuron_disagree" },
        { text = "What do you really think of his caution?", tag = "Persuade", next = "omnuron_secret",
          check = { pass = { any = { { disposition = { min = 65 } }, { trait = "brave" }, { class = "DRUID" }, { questDone = TODO_QUEST("Yashiro's Windwalk") } } } },
          fail = { next = "omnuron_no", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    omnuron_disagree = {
      big = true,
      lines = {
        { id = "od_default", text = "I agree with him about everything except speed. He says the mountain's survived ten thousand years and can survive a careful plan, and I say the mountain survived because somebody fought for it when it mattered." },
      },
      choices = {
        { text = "He's right. Rash druids get killed.", next = "BACK", reply = "Maybe he is, and maybe I'll be the one they bury, but I'd rather that than watch the mountain lose another grove while we draw up plans.", fx = { align = { order = 1 } } },
        { text = "You're right. Act first, report later.", next = "BACK", reply = "Finally, someone who understands, but please don't say it near Omnuron, because he'll know exactly whose idea it was.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    omnuron_secret = {
      lines = {
        { id = "os_default", text = "All right, since you asked properly. Omnuron sent no word when the gorge opened, so the Talon learned of it from a goblin trader in Everlook. I flew up anyway without asking him, and if you tell him so, I'll know where you sleep." },
      },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    omnuron_no = {
      lines = {
        { id = "on_default", text = "Nice try. I don't complain about the Skylord to strangers, and I especially don't complain about him to strangers who ask like that." },
      },
      choices = { { text = "Then I'll ask a less nosy question.", next = "BACK" } },
    },

    supply = {
      lines = {
        { id = "su_default", text = "A goblin there does, for fletching, and he'll get none from me. Everlook's where our supplies come from, though: a goblin called Azzleby runs his beasts through the passes for me, and it works well enough when the Winterfall furbolgs aren't robbing the caravans." },
      },
      choices = {
        { text = "I'd not have thought you'd trust a goblin.", next = "supply_goblins" },
        { text = "The Winterfall raid you?", next = "supply_winterfall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    supply_goblins = {
      big = true,
      lines = {
        { id = "sg_default", text = "I trust Azzleby to want his money, which is the same thing as trusting him, near enough. He's never cheated me and never asked what the crates are for, and a few druids I could name have pried harder than that goblin ever has." },
      },
      choices = {
        { text = "An honest bargain is worth respecting.", next = "BACK", reply = "It is, and Azzleby's earned it, though I'd never tell him so, because then he'd find a way to charge me for the compliment.", fx = { align = { honor = 1 } } },
        { text = "A goblin who asks nothing is hiding something.", next = "BACK", reply = "Maybe, but I've looked, and all I found was a goblin who likes gold more than questions, which is more than I can say for most visitors.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    supply_winterfall = {
      lines = {
        { id = "sw_default", text = "They used to be a peaceful tribe, by all accounts, and something has soured them. Now they take whatever comes through the passes, and I've lost more crates of Moonglade supplies to them than I like to count." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "furbolgs" } } } },
    },

    feathers = {
      big = true,
      lines = {
        { id = "fe_default", text = "The owls shed feathers in their nests all the time, and there's no harm in gathering them. But the birds are Aviana's children, and some of the hunters coming up the gorge seem to think a live owl is just a feather that hasn't fallen yet." },
      },
      choices = {
        { text = "I'll only take what's been shed.", next = "BACK", reply = "Thank you, truly, because the owls know who's been kind to them, and they'll watch your back in the gorge even if you never see them.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Arrows keep people alive. The owls will manage.", next = "BACK", reply = "They'd better manage, because if I catch you with a live one on your belt, you'll find out Aviana's children have friends with talons.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xpriest = {
      big = true,
      lines = {
        { id = "xp_default", text = "The dead at Mourning's Rest, for a start; they're not resting at all, and the druids don't have the right words for that kind of sickness. And the wounded who come down out of Dae'gun, for another, though Yashiro would sooner bleed than ask." },
        { id = "xp_shadow", when = { form = "shadow" }, text = "Not like that, you won't. Whatever shadow you're wearing, the wounded will run from it, so put it away before you go near anyone hurt." },
      },
      choices = {
        { text = "I'll lay the dead to rest, gently.", next = "BACK", reply = "Good. Go gently with them; none of them asked to wake up like that, and nothing on this mountain deserves it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead can wait. The living fight first.", next = "BACK", reply = "Tell that to the dead, then, and see if they wait for you, because they've been very impatient up here so far.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = {
        { id = "xd_default", text = "Help me clear the rot, and help me keep the newcomers from trampling everything they don't understand. The Circle sends too few of us and expects the tree to do the work alone." },
      },
      choices = {
        { text = "The Circle should send more. I'll tell them.", next = "BACK", reply = "Please do, and tell them loudly, because they only seem to hear me when I'm shouting, and I've nearly run out of voice.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Forget Nighthaven. I'll stay and work.", next = "BACK", reply = "That's the best thing I've heard all season, and I'll find you work before you change your mind, so don't change it.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xnelf = {
      big = true,
      lines = {
        { id = "xn_default", text = "Because the tree was burned and the Shan'do said it needed rest, and Teldrassil was planted far away in the sea. I understand it, but every time I fly over the summit I think we left our home to strangers and called it patience." },
      },
      choices = {
        { text = "Teldrassil is our home now.", next = "BACK", reply = "I know it is, and I try to love it, but the summit was where our grandmothers sang, and Teldrassil still smells of sea to me.", fx = { align = { order = 1 } } },
        { text = "Hyjal will always be home. We should return.", next = "BACK", reply = "You feel it too? Good, then I'm not the only fool on the mountain. One day we'll stand on that summit, you and I, and wave everyone home.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman = {
      big = true,
      lines = {
        { id = "xh_default", text = "I carried messages over the lines that day instead of standing in them, but I remember the banners of the humans who came across the sea, and I remember how many of them were carried off the slopes afterwards. Their camp was where Mourning's Rest is now, and I hear the dead there have started walking." },
      },
      choices = {
        { text = "Then I'll see them properly buried.", next = "BACK", reply = "Would you? Find me before you go and I'll show you where their camp stood, because I think they'd want someone from their own land to say a word over them.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead are dead. I'll fight what walks.", next = "BACK", reply = "Then fight it, and I'll be glad of you, but a few of those walking dead had names once, and somebody ought to remember them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xl_default", text = "Because fel is what made this mountain sick. It rained down when the Legion came, the brambles drank it, and they are still killing things years later, so I flinch at what you carry." },
      },
      choices = {
        { text = "I bear this burden so others never have to.", next = "BACK", reply = "Perhaps you do, and I'd like to believe it, but the brambles only meant to drink the rain, and look at them now.", fx = { align = { light = 1 } } },
        { text = "Power's power. Your brambles don't scare me.", next = "BACK", reply = "They should, because they don't care what you think you are, and they'll grow straight through you the same as everything else.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunter = {
      big = true,
      lines = {
        { id = "xhu_default", text = "Owls by night and hawks by day, and things with too many teeth in between. The fel soured some of the beasts as badly as the brambles, and those you can hunt with my blessing; the clean ones, leave be." },
      },
      choices = {
        { text = "I'll take only the corrupted ones.", next = "BACK", reply = "Then you'll have my blessing and Aviana's too, and I'll point you to the dens where the worst of them have gone to ground.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A hunter takes what feeds the hunt.", next = "BACK", reply = "Then hunt elsewhere, or hunt the corrupted, because the clean beasts on this mountain have suffered enough without your appetite.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhorde = {
      big = true,
      lines = {
        { id = "xho_default", text = "An orc blademaster called Yashiro, for one, who's been killing demons in Dae'gun like he's paying back a debt. And there's a troll camp somewhere on the slopes that keeps trying to leave and keeps getting dragged back into the fighting." },
      },
      choices = {
        { text = "We fought here together. We can again.", next = "BACK", reply = "We did, and I remember it, even if Orgrimmar and Darnassus would both prefer I didn't, so I'm glad you remember too.", fx = { align = { honor = 1 } } },
        { text = "The Horde will hold its own ground.", next = "BACK", reply = "Then hold it, and stay off mine, and I won't have to decide whether I'm a Talon or a Sentinel when I see you on the slopes.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kal_arch = {
      big = true,
      lines = { { id = "kar_d", text = "That day I flew as a storm crow between the Sentinels' lines, and I saw the wisps rise out of the forest like snow falling upward. When the World Tree gave its strength and the demon came apart, the whole mountain went quiet, and I forgot how to be anything but a bird for three days." } },
      choices = {
        { text = "The tree's sacrifice cost us our immortality.", next = "BACK", reply = "It did, and I would make the trade again tomorrow. A long life under the Legion is not a life.", fx = { align = { order = 1 } } },
        { text = "We should have found another way to stop him.", next = "BACK", reply = "Tell me what it was, and I will fly it to Malfurion myself. Until then, I will honour the way we had.", fx = { align = { order = -1 } } },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Oh! Well, nobody up here says things like that, because the Skylord thinks praise makes us careless. Say it again when the owls are listening, would you?" },
        { id = "s2", text = "You're all right, you know that? I get told off so often that I'd forgotten what the other thing sounds like, and I'm not going to pretend I don't like it." },
        { id = "s3", when = { class = "DRUID" }, text = "From another druid, that actually counts for something, because you know how hard the flying is. Don't tell Nighthaven I said so, but you're the best of them I've met." },
      },
      fail = {
        { id = "f1", text = "You sound like a trader working up to a price, and I've got crates to count. If you want something off the Talon, just ask me straight." },
        { id = "f2", text = "Don't do that. The owls can tell when somebody's laying it on, and they've all turned to look at you." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! Finally, somebody on this mountain who bites back instead of bowing. I was starting to think the whole world had gone as careful as the Skylord." },
        { id = "s2", text = "Oh, you're asking for it, and I love that you are. Keep up with me on the slopes and you can say whatever you like to my face." },
      },
      fail = {
        { id = "f1", text = "I've got demons in the gorge and fel in the roots, and you want to stand here being clever at me. Go and be clever somewhere it'll help." },
        { id = "f2", text = "Say that again and I'll have an owl drop something on you, and they've very good aim. I'm busy, and you're not half as funny as you think." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "All right, all right, you've made your point, and you didn't have to loom to make it. I'm not scared of much, but I'm not stupid either, and you look like trouble I don't need today." },
        { id = "s2", text = "Huh. The owls have all gone quiet, and they only do that for hawks and for worse. Fine, you win this one, but don't go trying it on the younger ones." },
      },
      fail = {
        { id = "f1", text = "I carried messages over the lines when the Legion was on this mountain, so you'll forgive me if I don't fall over. Try scaring the demons instead, because they've earned it." },
        { id = "f2", text = "Really? On my mountain, in front of my birds? Back off, before I forget the Skylord told me to be polite to visitors." },
      },
    },
  },

  topics = {
    druids = { { id = "tp_dr_druids", text = "Too many sit in meadows and too few climb mountains, and you can tell the Keeper I said so. The ones who climb are the best people I know." } },
    _gated = {
      { id = "gt1", text = "I'm not telling you that, not yet. I talk too much as it is, and I've learned to save some of it for people I trust." },
      { id = "gt2", text = "No, that one's not for strangers. Do something for the mountain first, and then we'll see." },
    },
    knows = {
      { id = "tp_knows", text = "I've flown over most of this mountain, and what I haven't flown over, the owls have. Ask, and I'll tell you what I'd want to know in your boots." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "Ask, then, but don't expect me to hold your hand through the answer." },
    },
    background = { { id = "tp_bg", text = "I was born under Nordrassil's shade and trained under the Skylord, and I've spent every year since getting into trouble on this mountain's behalf." } },
    advice = { { id = "tp_ad", text = "Don't trust the plants on the lower slopes, don't walk into Dae'gun alone, and don't let anyone at Mourning's Rest grab hold of you." } },
    malfurion = { { id = "tp_malf", text = "The Shan'do sealed this mountain so it could heal, and he sleeps in the Dream while it does. I hope he wakes to find we've done him proud." } },
    cenarion_circle = { { id = "tp_cc", text = "The Talon answers to the Circle, mostly, when the Circle remembers we're up here." } },
    burning_legion = { { id = "tp_bl", text = "They came up this mountain once and the wisps blew their lord to pieces. The ones who ran are still hiding in the gorge and in Dae'gun, and I want them gone." } },
    furbolgs = { { id = "tp_furb", text = "The Winterfall rob my caravans, and the ones in the caves by Malorne's Retreat will have your arm off. Not every tribe has gone bad, but those have." } },
    nordrassil = {
      { id = "tp_nordrassil", text = "I was born under Nordrassil's shade, and I'll fight for it till the owls stop flying. It's wounded and it's old, but it's ours, and it's still the best tree in the world." },
      { id = "tp_nordrassil2", when = { race = "NightElf" }, text = "You're kaldorei, so you feel it too, don't you, that tug at the heart when you see it? I think that's the mountain remembering us, even if we've stopped living forever." },
    },
    emerald_dream = { { id = "tp_emerald_dream", text = "The Skylord walks the Dream more than I do, and he comes back worried and won't say why. The owls are worried too, and they don't say why either." } },
    green_dragons = { { id = "tp_green_dragons", text = "Ysera's flight used to visit the mountain more often, the old druids say. I've only seen one, once, and it looked at me like I was an interesting beetle." } },
    thrall = {
      { id = "tp_thrall", text = "Thrall's orcs fought on this mountain alongside us, and I like Yashiro, so I like Thrall. That's how it works, isn't it?" },
      { id = "tp_thrall2", when = { faction = "Horde" }, text = "Your warchief's orcs held this mountain with us once, and I've not forgotten it. Tell him to stop cutting Ashenvale, though, would you?" },
    },
    tyrande = { { id = "tp_tyrande", text = "The High Priestess is very wise and very patient, and I'm neither. The owls think she'd be disappointed in me, and the owls are usually right." } },
    scourge = { { id = "tp_scourge", text = "The undead came up the slopes before the demons, and the mountain buried them. Sometimes I find bones in the snow and the owls get very upset." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw guard the gorge into Winterspring, and they'll let you pass if you're polite. I wasn't, once, and I'm still apologising." } },
    _none = { { id = "tp_none", text = "No idea, and I've no time to find out. Ask the owls; they're terrible gossips, and Elune made them that way on purpose, I'm sure of it." } },
    grievance = {
      { id = "gv_1", text = "You've done nothing for the mountain, and you act like it owes you something. That's my problem with you." },
      { id = "gv_val", when = { grudge = "values" }, text = "You're careless with the forest, and the owls noticed before I did. They're never wrong about people." },
      { id = "gv_pers", when = { grudge = "persuade" }, text = "You tried to bully me, and I've been bullied by Loganaar, who's much better at it. It didn't work then either." },
    },
    amends = {
      { id = "am_1", text = "Do something for Hyjal that you won't get paid for. Then I'll stop glaring at you." },
      { id = "am_val", when = { grudge = "values" }, text = "Clean up after yourself on the slopes and stop trampling the saplings. The owls will tell me if you do." },
    },
    spite = {
      { id = "sp_1", text = "I think you're the kind of person who walks past a wounded owl and calls it nature. I've no time for that." },
      { id = "sp_val", when = { grudge = { worst = "values" } }, text = "I think you'd cut down Nordrassil for kindling if no one was watching. Good thing the owls are always watching." },
    },
    regard = {
      { id = "rg_1", text = "You're all right, you know that? You don't dither, you don't lecture, and you don't ask me to slow down, which is three more things than the Skylord manages." },
      { id = "rg_earned", when = { fondness = "earned" }, text = "You've done more for this mountain in a few weeks than the Circle has done in years, and the owls have noticed. They don't notice much that isn't a mouse." },
      { id = "rg_tone", when = { fondness = "tone" }, text = "You talk straight, and you don't wrap everything in ten layers of moonlight and manners. I like that, and so do the owls." },
      { id = "rg_chaos", when = { fondness = "alignment", alignment = { axis = "order", max = -30 } }, text = "You don't wait for permission any more than I do, and look how much we get done between us. The Skylord would hate you, which is the best thing I can say about anyone." },
    },
    confide = {
      { id = "cf_1", text = "During the battle I carried messages over the lines in owl shape, and I was younger than any Talon ought to have been. I saw things from the air that I still dream about, and I've never told the Skylord how bad the dreams get." },
      { id = "cf_2", text = "The Skylord thinks I'm reckless, and he's right, but he's wrong about why. I'm not brave, {name}, I just can't stand waiting while something I love gets hurt." },
    },
    trust = {
      { id = "tr_1", text = "Trust Yashiro with your life, because he'll trust you with his, and he never says anything he doesn't mean. Trust Jereman too, even when he answers sideways." },
      { id = "tr_2", text = "Trust the Timbermaw, trust the owls, and don't trust anybody selling firewater on the road out of Felwood. That's half of what I know about people, and it's the useful half." },
    },
    watchout = {
      { id = "wo_1", text = "Watch out for Celastrus on the eastern slopes, that horrible thornbush that eats things. Thylaen will tell you it's only a plant, and Thylaen is wrong." },
      { id = "wo_2", text = "Don't fly low over Darkwhisper Gorge, even in bird shape. Something down there throws fire at anything with feathers, and I've lost tail feathers proving it." },
    },
    worries = {
      { id = "wy_1", text = "The Skylord keeps walking the Dream and coming back grey and quiet, and he won't tell me why. I'd rather he shouted at me like he used to, because at least then I'd know he was all right." },
      { id = "wy_2", text = "The owls are leaving the southern valley earlier every year, and owls don't leave a place they love without a reason. I don't know the reason yet, and I hate not knowing." },
    },
    hopes = {
      { id = "hp_1", text = "I hope to see Aviana's shrine full of Talon again, with feathers on every branch and nobody asking the Circle's leave to fly. That's how it was in the old stories, and I want to see it for real." },
      { id = "hp_2", text = "I hope Nordrassil heals while I'm still young enough to fly to the top of it. The Skylord says that's centuries away, and I say he was never any good at counting." },
    },
    favor = {
      { id = "fv_1", text = "If you go through the Timbermaw tunnel, be extra polite to them and tell them Thisalee says sorry. I still owe them an apology, and I'm terrible at making them." },
      { id = "fv_2", text = "Bring me a white feather from the southern valley if you find one lying loose. Don't pull one from a nest, though, or the owls will never forgive either of us." },
    },
    friendship = {
      { id = "fr_1", text = "Of course I do, you great lump! I don't tell just anybody what the owls really think, you know." },
      { id = "fr_earned", when = { fondness = { best = "earned" } }, text = "You've fought for this mountain and you've put up with me, which is harder, so yes, you're my friend, {name}, and the owls agree." },
    },
    never_told = {
      { id = "nt_1", text = "During the battle I dropped a message I was carrying to the Sentinels, and they didn't get the order to fall back in time. Nobody ever found out, and I've spent every year since trying to make it up to this mountain." },
      { id = "nt_2", text = "I'm afraid of the Dream, {name}. The other Talon walk it like it's a meadow, and I go in for a moment and come out shaking, and I've never told a single druid." },
    },
  },
  blurts = {
    { id = "bl_1", text = "The Winterfall furbolgs are drinking a firewater brewed with something out of Felwood, and it's driving them mad. Somebody is supplying it, and the Circle won't listen." },
    { id = "bl_2", text = "The Timbermaw tunnel is the only safe way between Felwood and Winterspring. Make friends with them before you need it, not after." },
  },
  confides = {
    { id = "cnf_1", text = "The Shrine of Aviana has a ring of old stones where the first druids laid her to rest, and nobody is allowed to raise a weapon inside it, not even against a demon." },
    { id = "cnf_2", text = "The safest way down from the Cradle to Mourning's Rest follows the stream, because the raveners won't cross running water if they can help it." },
    { id = "cnf_3", text = "Azzleby's caravan drivers will carry a letter back to Everlook if you ask them nicely, and they hear more gossip on the passes than the owls do." },
  },
}
