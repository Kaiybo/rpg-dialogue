-- The Cenarion Enclave: the druid, hunter and rogue trainers, and Jenal behind the Arch Druid's tree.
-- Voices: bibles/enclave.md
-- Fandral is written straight: abrasive and proud, nothing more is hinted.
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Jenal: shuffles dirt outside the Enclave and calls himself a visionary; receives the Un'Goro soil.
P:NPC {
  key = "jenal", id = TODO_NPC("Jenal"), name = "Jenal",
  title = "Ditch Digger",
  bible = "bibles/enclave.md", role = "worker", tier = "quest",
  communities = { "darnassus" }, temper = { "proud", "chatty" }, values = { "ambitious", "proud" },
  notices = { "class", "kit" },

  impression = {
    first = "Jenal digs ditches behind the Cenarion Enclave and insists he is a visionary kept down by lesser minds. He asked me not to step in the dirt, then talked about his dreams for a long while.",
    third = "{name} met Jenal, who shovels dirt behind the Cenarion Enclave and considers himself a misunderstood visionary.",
  },

  greetings = {
    { id = "g_dirt", text = "Mind where you step, please. That pile is sorted, and so is that one." },
    { id = "g_back", when = { metBefore = true }, text = "You again! At last, someone who listens. Don't step in the dirt." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest! Perhaps you'll understand, since you've a calling yourself. My calling is greater than this shovel, though the shovel hasn't heard yet." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "One of the Circle's own. Tell the Arch Druid I'm still out here, would you? He forgets, and I suspect it's on purpose." },
    { id = "n_dirty", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You've been rolling in worse dirt than mine, I see. Mine is at least sorted." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Ditches that carry water to every tree in Darnassus! The Enclave ignores me, but your earth spirits might see the beauty." } },
      choices = {
        { text = "Keep digging the proper way, Jenal, and no shortcuts.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Your vision is ditches. Aim higher.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Because I have vision, and patience, and I listen to people, mostly, when they aren't talking nonsense. The Sisterhood says faith begins with humility, which I have always considered a very convenient rule for the people already in charge." } },
      choices = {
        { text = "Humility is where faith begins, Jenal, and they're right.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "You may have a point, for humility mostly serves the powerful.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "To guard the soil shipments, of course, and to impress visitors, and to make sure nobody overlooks a dreamer when the honors are handed out. You've done all that and more for your king, I expect, so you see the sense in it." } },
      choices = {
        { text = "A knight serves others, Jenal, not their own honors.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Honors are worth chasing, and I'd want my share too.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Faster? You've missed the point entirely, because any brute can move dirt quickly and it takes a visionary to move it thoughtfully. Still, a warrior's back is a fine thing, and when I'm running the Enclave one day I'll have a dozen of you." } },
      choices = {
        { text = "Every task deserves to be done well, even dirt.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Dirt is dirt. Your visions won't change that.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Every night, and I've no idea what, because I'm far too important to stay up and watch. Something small with clever paws, I think, and if you caught it I'd name a dirt pile after you." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Every night, and I've no idea what, though I think it's something small with clever paws. And your {pet} is eyeing my piles right now, isn't it? I'll thank it to think about something else." },
      },
      choices = {
        { text = "I'll catch your little digger and let it go elsewhere.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Your dirt isn't worth a night's lost sleep.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Constantly, and I once fancied myself a rogue like you, slipping through the back windows of grand houses. The trouble is I can't keep quiet for more than a minute, so I'm back with the dirt, which never tells anyone what I've said." },
      },
      choices = {
        { text = "Honest dirt is better than a dishonest trade, Jenal.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A rogue's life beats digging, and you know it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Because they think the arcane is how our people lost the old lands to the sea, and they're not wrong, are they? Still, it'd be very nice to have a spell for shoveling, and I'd keep it a secret if you did." },
      },
      choices = {
        { text = "Dig with your hands, Jenal. The druids are right.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If I had that spell, I'd teach it you myself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnome_j = {
      lines = {
        { id = "gj_default", text = "Machines that dig! There, you see, a visionary idea, and I'm nearly certain I had it first. Don't mention it to the Arch Druid, though, because he'd only make me dig the machine a ditch." },
      },
      choices = {
        { text = "I could sketch one for you.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "The druids would never allow it.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "They look down on everyone with an idea of their own, and mine are better than most, if I say so myself. You and I are both misunderstood, warlock, though I'd still thank you to keep your servant out of my ditch, because it scratches." },
      },
      choices = {
        { text = "The druids have reasons to watch me. Not you.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Misunderstood suits us both. Dig on, Jenal.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Now there's a calling, though I've always thought I'd make a fine priest myself, if the Temple ever stopped looking at me like that." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I've always said the Circle should have knights of its own, and here you are, proving me right." },
        { id = "h_default", key = true,
          text = "Jenal, at your service, though not for long, I hope. I'm a dreamer, you see, a visionary, and until the world sees it I help the Cenarion Circle by moving these piles of dirt about." },
        { id = "h_soil", tags = { "news" }, when = { questActive = TODO_QUEST("Un'Goro Soil") },
          text = "Is that soil from Un'Goro? Unload it here, carefully, noble {class}. It must have been quite a burden, not unlike the burden of being a visionary, and I'll see to the honorarium the Arch Druid set aside." },
        { id = "h_soil_done", when = { questDone = TODO_QUEST("Un'Goro Soil") },
          text = "Your Un'Goro soil is in the third pile, the important one. The Arch Druid wanted a word with you after, and I'd go, since he doesn't ask twice and he certainly doesn't ask me." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Still here, yes, and still digging. A visionary keeps odd hours, and the dirt doesn't mind the dark." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "Oh, a rogue! Have you come to dig too? No, of course you haven't, nobody does, but you're welcome to stand there and look thoughtful." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A real mage, here among the dirt piles! Could you make these move themselves? No, the druids would have my ears for it, forget I asked." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Mind the dirt, would you, because I've only just got that pile exactly where I want it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Don't let your beast dig in my piles, because the last one undid three days of my work." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! At last, someone else the druids look down on. Mind the dirt, though, because it's been arranged very carefully." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Please don't step in the dirt. I am a visionary, you know, held back by lesser minds for a good few centuries now, and I think your spirits would understand." },
      },
      again = {
        { id = "h_again", text = "What else? I've got all night, and more dirt than any one elf should have to sort." },
        { id = "h_again2", text = "Go on, ask me something; nobody else ever does." },
      },
      choices = {
        { text = "What are you actually doing?", next = "dirt" },
        { text = "You look like someone with big dreams.", next = "dream" },
        { text = "Who's keeping you down?", next = "conspiracy" },
        { text = "The Circle seems very interested in Un'Goro soil.", next = "soil", when = { any = { { questActive = TODO_QUEST("Un'Goro Soil") }, { questDone = TODO_QUEST("Un'Goro Soil") } } } },
        { text = "Gnomes build machines that dig, you know.", next = "gnome_j", when = { race = "Gnome" } },
        { text = "Did you ever think about another line of work?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why would the druids object to a little magic?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Need someone to shift those piles faster, Jenal?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Has anything been digging through your piles at night?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Why do you think you'd make a fine priest, Jenal?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why would the Circle want knights of its own, Jenal?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the druids look down on you, Jenal?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What is your grand vision, Jenal?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll let you dig.", next = "END" },
      },
    },
    dirt = {
      lines = {
        { id = "di_default", text = "Moving it from there to here, and occasionally back again. The druids want the ground around the Enclave just so, and somebody has to do it, apparently forever." },
      },
      choices = {
        { text = "Honest work is nothing to be ashamed of.", next = "BACK", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "You're wasted on a shovel.", next = "BACK", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "Who told you to do it?", next = "fandral" },
      },
    },
    fandral = {
      lines = {
        { id = "fa_default", text = "The Arch Druid himself. I told him I was a dreamer, and he looked at me with that face of his and said the world has need of people who dig ditches, too." },
      },
      choices = {
        { text = "He's not wrong.", next = "BACK", fx = { align = { order = 1 }, trait = { witty = 1 } } },
        { text = "That was cruel of him.", next = "BACK", fx = { align = { order = -1 }, affinity = 1, trait = { kind = 1 } } },
        { text = "I hope you gave him a sharp answer.", next = "fandral2" },
      },
    },
    fandral2 = {
      lines = {
        { id = "f2_default", text = "Nothing, to my lasting shame, because he's Fandral Staghelm and I am holding a shovel. I've thought of a great many good answers since, mostly at night." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } } },
    },
    dream = {
      big = true,
      lines = {
        { id = "dr_default", text = "A better future for all of us, naturally. I don't have the details yet, because a vision comes first and details come later, but when it arrives you'll hear about it." },
      },
      choices = {
        { text = "A dream without a plan is just sleep.", next = "BACK", fx = { align = { order = 1 }, trait = { skeptical = 1 }, affinity = -1 } },
        { text = "Every great thing started as a dream.", next = "BACK", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "What sort of better future?", next = "dream2" },
      },
    },
    dream2 = {
      lines = {
        { id = "d2_default", text = "One where a night elf can be judged by his ideas and not by his shovel, for a start. Beyond that, I'm keeping it to myself, because there are people who'd steal a vision like that." },
      },
      choices = { { text = "Your secret's safe. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    conspiracy = {
      lines = {
        { id = "co_default", text = "Conspiracies abound, friend. There are those without the vision to understand what I do, and they would keep me chained to obscurity, here, behind a tree." },
      },
      choices = {
        { text = "Name them, then.", next = "conspiracy2" },
        { text = "Perhaps no one is plotting against you.", next = "BACK", fx = { align = { honor = 1 }, trait = { skeptical = 1 } } },
        { text = "Then outwit them. Quietly.", next = "BACK", fx = { align = { honor = -1 }, affinity = 2 } },
      },
    },
    conspiracy2 = {
      lines = {
        { id = "c2_default", text = "I couldn't possibly, not out loud, not this close to the Enclave. Let's say a certain tree has a certain arch druid in it, and leave it there." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    soil = {
      lines = {
        { id = "so_default", text = "They say the soil of Un'Goro is rich with some sort of power, and the Arch Druid wants facts from falsehoods. I sort it, label it and keep it out of the rain, and a mislabeled jar could cost the Circle a season's study." },
      },
      choices = {
        { text = "The Circle studies everything.", next = "BACK", fx = { learn = { "cenarion_circle" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "People talk in front of a man with a shovel as if he were a tree stump. I've heard plenty, so ask." } },
    background = { { id = "tp_bg", text = "Visionary. Currently digging. The two will meet one day, and on that day you'll be glad you knew me." } },
    advice = { { id = "tp_ad", text = "Never let anyone tell you you're only a ditch digger, even if, at the moment, you are." } },
    cenarion_circle = { { id = "tp_circle", text = "Great druids, the lot of them, and not one of them has ever asked my opinion. Their loss." } },
    dalaran = { { id = "tp_dalaran", text = "The wizards of Dalaran rebuilt their city with magic, which shows a lamentable lack of shovels. I'd have dug them proper foundations, if anyone had thought to ask me." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "The gnomes tunnelled a whole city under a mountain, and I think about that every day. I've written to them twice offering my services, and I'm sure the replies are only delayed." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire has a strongman who can lift an anvil, I'm told. I'd like to see him dig a proper ditch, because lifting isn't everything." } },
    nordrassil = { { id = "tp_nordrassil", text = "The World Tree has roots deeper than any ditch anyone has ever dug. Someday I'll make it down to them, and I'll say hello on behalf of all of us." } },
    _none = { { id = "tp_none", text = "No idea, friend. I've been out here with the dirt; it doesn't gossip." } },
  },
}

-- Syurna: rogue trainer in the Enclave; plagued by Jannok's roses; sends rogues after Sethir the Ancient.
P:NPC {
  key = "syurna", id = TODO_NPC("Syurna"), name = "Syurna",
  title = "Rogue Trainer",
  bible = "bibles/enclave.md", role = "trainer", tier = "quest",
  communities = { "darnassus" }, temper = { "cold", "sharp" }, values = { "cunning", "careful" },
  notices = { "class", "stealth" },

  impression = {
    first = "Syurna hardly speaks to anyone who isn't a rogue, and she made sure I knew it. Underneath the chill she cares a great deal about what is happening to the forests of Teldrassil.",
    third = "{name} met Syurna, the cool and guarded rogue trainer of the Cenarion Enclave.",
  },

  greetings = {
    { id = "g_cold", text = "You're standing in my light. Was there something?" },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Young rogue. Wipe your boots; the last one tracked Ashenvale mud across my floor and swore he'd never been here." },
  },

  notice = {
    { id = "n_canal", cat = "class", when = { origin = "human_canal_pickpocket" },
      text = "You learned on Stormwind's canals, I'd wager, because you've checked where my hands are twice already. Keep the habit; it's the only one of theirs worth having." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest, in the dim corners of the Enclave. Your kind usually stands in the middle of the room and glows; it's restful to see one who doesn't." },
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "I saw you come in, so you can stop that. It was decent work, though, and better than Jannok's couriers ever manage." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They do, though few listen, and the corruption creeps further every season. If your spirits feel it, you're less useless than most." } },
      choices = {
        { text = "Then I will help guard the forests, Syurna.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Corruption is the druids' problem, not mine.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "You go where the dying are and I go where the guilty are, and neither of us is welcome until we're needed. The difference is that you're thanked afterward, and I prefer not to be." } },
      choices = {
        { text = "I'd rather heal than hunt, thanked or not.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Some of the guilty deserve whatever comes to them.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I doubt anyone's justice once it has to be done quickly and quietly, because an open court is a luxury. If you ever learn to hold to your oaths when nobody is watching, come back and tell me, and I'll be impressed." } },
      choices = {
        { text = "My oaths hold whether anyone is watching or not.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Sometimes justice has to be done quietly, and I know it.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll leave you to your corner.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "That the loudest fighter is the easiest to find, and usually the first to die. The Gnarlpine went for the shouting camps first every time, so think on that before you bang your shield again." } },
      choices = {
        { text = "A warrior stands in the open so others can hide.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Quiet works. I'll learn to use it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Close enough that I've lost marks to hunters who got there first. You stalk to kill a beast and I stalk to finish a job, but the forest doesn't care which, so long as you keep off the dry leaves." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Close enough that I've lost marks to hunters who got there first, and the forest doesn't care which of us is stalking. Your {pet} moves more quietly than you do, which you should take as a lesson rather than an insult." },
      },
      choices = {
        { text = "I hunt in the open. My quarry sees me coming.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Quarry that never sees me is quarry I keep.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Your kind crackles, and anyone with patience can feel it across a room, the way our ancestors felt Azshara's palace humming before it fell. If you ever need to go unnoticed, let a rogue do it, and don't be too proud to ask." },
      },
      choices = {
        { text = "I'll ask. There's no shame in using the right tool.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll do my own work, unseen or not.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Both, and with good reason, since the Highborne who called the Legion into this world began as curious as you. I'll tell you plainly that if your demon so much as turns toward a student of mine, I'll have my blade in it before it finishes turning." },
      },
      choices = {
        { text = "Fair. I'll keep it leashed while I'm here.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "You'd find my servant harder to kill than you think.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue_s = {
      big = true,
      lines = {
        { id = "rs_default", text = "Shadowmeld is a gift; everything after it is patience. Humans learn the dark in alleys, but we learned it from the forest, which hides better than any alley and never boasts of what it saw." },
        { id = "rs_watch", when = { origin = "nightelf_watcher_trained" },
          text = "You stand with your back to the wall, like the Watchers teach, and I won't ask who taught you. Then you already know we don't take a life for coin; we take it for the forest, or not at all." },
      },
      choices = {
        { text = "Shadows or not, I keep my word.", next = "rogue_s2", fx = { align = { honor = 1 } } },
        { text = "I work in the dark because it works. Nothing more.", next = "rogue_s2", fx = { align = { honor = -1 } } },
        { text = "What's the first lesson, then?", next = "rogue_s2" },
      },
    },
    rogue_s2 = {
      lines = {
        { id = "rs2_default", text = "Stillness. Most rogues get caught moving, because they are afraid of being seen, and the fear makes them hurry; stand still in a shadow long enough and even a Sentinel will walk past you." },
      },
      choices = { { text = "I'll practise. Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "That the rot in Darkshore's woods is creeping across the water into ours, and that nobody in the Enclave seems to be in a hurry about it. I had to send a rogue to learn that much, so you may judge for yourself how hard the druids were looking." } },
      choices = {
        { text = "The Circle will act once it has proof, so bring it to them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then I won't wait for the Circle, and I'll go and look myself.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. You won't learn anything from me, but I'll grant that your trade and mine both work in the dark, after a fashion." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, in my shade. Your kind speak loudly of justice, and I'm always curious how much of it survives a dark alley." },
        { id = "h_default", text = "I'm Syurna, and I train rogues. If you aren't one, I can't teach you anything, and I rarely talk for the pleasure of it, so choose your questions well." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "We are darkness and shadow, rogue, and the forest needs both now more than ever. Ask what you came to ask." },
        { id = "h_rose", tags = { "news" }, when = { questActive = TODO_QUEST("The Apple Falls") },
          text = "Another rose, and I suppose it's from Jannok. If I'd kept every flower that fool sent, I could have opened a shop, but his latest courier may prove more useful than he is." },
        { id = "h_sethir", tags = { "news" }, when = { questActive = TODO_QUEST("Destiny Calls") },
          text = "Sethir the Ancient hides on a branch beyond the Oracle Glade, and everyone who approached him openly met their doom. Go unseen, take what he carries and bring it to me." },
        { id = "h_sethir_done", when = { questDone = TODO_QUEST("Destiny Calls") },
          text = "Sethir's journal said what I feared: the sickness in Darkshore's forests is creeping into ours. You did well, but this is beyond a rogue's reach now." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "You aren't a rogue, so I can't teach you anything. You are a mage, though, and that makes you very easy to hear coming." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock in the Enclave. You're bolder than most of my students, and I don't mean that kindly." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. I don't teach your kind, and you make far too much noise in my alcove." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, which at least means you know how to keep still. Most who come down these steps clatter like a cart full of pans." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, in my alcove. You can't learn anything from me, but your Circle ought to be listening harder to what Teldrassil's forests are trying to tell it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I speak to rogues, not to spirit-callers, but the forests suffer all the same, so tell me whether your spirits feel it." },
      },
      again = {
        { id = "h_again", text = "Anything else? Be brief, for the shadows under the tree don't wait on anyone." },
        { id = "h_again2", when = { class = "ROGUE" }, text = "Go on. You've earned a few more questions." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "Who is Jannok?", next = "jannok", when = { any = { { questActive = TODO_QUEST("The Apple Falls") }, { questDone = TODO_QUEST("The Apple Falls") } } } },
        { text = "I've heard something is wrong in Teldrassil's forests.", next = "forest", when = { any = { { questActive = TODO_QUEST("Destiny Calls") }, { questDone = TODO_QUEST("Destiny Calls") } } } },
        { text = "Why do night elves need rogues?", next = "why" },
        { text = "Teach me how the kaldorei move unseen.", next = "rogue_s", when = { class = "ROGUE" } },
        { text = "Is a mage really so easy to notice?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What could a rogue teach a warrior, Syurna?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do rogues and hunters stalk the same way, Syurna?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the kaldorei hate warlocks, or only fear them?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "How do our trades both work in the dark, Syurna?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you doubt a paladin's justice, Syurna?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What should the Circle be hearing in the forests, Syurna?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Do the forests of Teldrassil suffer, Syurna?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I'll leave you to your dark corner, then.", next = "END" },
      },
    },
    jannok = {
      lines = {
        { id = "ja_default", text = "Jannok Breezesong, who paints my face on his walls and forgets to eat while he sighs about the love we could have had. We never had anything; I spoke to him once, about the weather." },
      },
      choices = {
        { text = "Let him down gently, at least.", next = "BACK", fx = { align = { honor = 1 }, trait = { kind = 1 } } },
        { text = "Ignore him. He'll tire of it.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Why won't you see him?", next = "jannok2" },
      },
    },
    jannok2 = {
      lines = {
        { id = "j2_default", text = "Because I won't talk to anyone who isn't a rogue, and he knows it, so he keeps sending you. Tell him I said that, if you like; he'll only paint another picture." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    forest = {
      big = true,
      lines = {
        { id = "fo_default", text = "Something is wrong with the trees and the water beyond the Oracle Glade, and the satyr Sethir the Ancient knows more than he should. His journal points to the same sickness that grips Darkshore." },
      },
      choices = {
        { text = "The druids should be told at once.", next = "BACK", fx = { align = { order = 1 }, learn = { "satyrs" } } },
        { text = "Some things are better learned quietly first.", next = "BACK", fx = { align = { order = -1 }, affinity = 1, learn = { "satyrs" } } },
        { text = "Why steal from Sethir instead of fighting him?", next = "forest2" },
      },
    },
    forest2 = {
      lines = {
        { id = "f2_default", text = "Because force failed and diplomacy failed, and his minions came for everyone who tried either. A satyr expects a sword or a speech; he never expects a quiet hand in his pack." },
      },
      choices = {
        { text = "Stealth has its place.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "I'd rather face an enemy openly.", next = "BACK", fx = { align = { honor = 1 }, trait = { brave = 1 } } },
      },
    },
    why = {
      lines = {
        { id = "wh_default", text = "Our enemies are older than your kingdoms and patient as stone, and not all of them can be fought in the open. The Sentinels guard the gates; we watch the places the gates don't reach." },
        { id = "wh_rogue", when = { class = "ROGUE", race = "Human" },
          text = "You'd know, human; your SI:7 has the same idea. Our ways are older, and quieter, but the Alliance needs both kinds of shadow." },
      },
      choices = {
        { text = "That's honest of you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I hear what moves in the dark parts of the forest. Choose your question carefully; I don't answer twice." } },
    background = { { id = "tp_bg", text = "I teach rogues. What I did before that isn't anyone's business." } },
    advice = { { id = "tp_ad", text = "Watch the hands, not the face. The face lies more often." } },
    satyrs = { { id = "tp_satyrs", text = "Old enemies, twisted from our own people. They hide on the edges of Teldrassil, and they know more than they should." } },
    ravenholdt = { { id = "tp_ravenholdt", text = "I've heard of Ravenholdt, always from people who were careful to say it quietly. If they want you, they'll find you, so don't go looking." } },
    highborne = { { id = "tp_highborne", text = "Azshara's court had its knives too, you know, more of them than anyone admits. Some of what I teach is older than this tree." } },
    booty_bay = { { id = "tp_booty_bay", text = "A goblin port where the law is whoever paid last. It's a useful place to sell what you'd rather not explain, though I'd never recommend it." } },
    onyxia = { { id = "tp_onyxia", text = "A black dragon in the southern marsh, the stories go. Rogues who go after a dragon's hoard tend to become part of it." } },
    _none = { { id = "tp_none", text = "I don't know, and I wouldn't tell a stranger if I did." } },
  },
}

-- Jocaste: hunter trainer in the Enclave; stern, revered; teaches young hunters to train their pets.
P:NPC {
  key = "jocaste", id = TODO_NPC("Jocaste"), name = "Jocaste",
  title = "Hunter Trainer",
  bible = "bibles/enclave.md", role = "trainer", tier = "quest",
  communities = { "darnassus" }, temper = { "stern", "steady" }, values = { "wise", "proud" },
  notices = { "class", "pet" },

  impression = {
    first = "Jocaste is as stern as the hunters warned, but I saw her watch the young ones with something close to pride. She speaks of balance as if it were a law she personally enforces.",
    third = "{name} met Jocaste, the stern and respected hunter trainer of the Cenarion Enclave.",
  },

  greetings = {
    { id = "g_hunter", when = { class = "HUNTER" }, text = "Welcome to the Cenarion Circle, hunter. Is your companion fed and well?" },
    { id = "g_other", text = "You've come to the Enclave. Speak plainly, and I'll answer plainly." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest among the hunters. You'll find we mend our own beasts as often as you mend people, though we use rather less prayer." },
    { id = "n_pet", cat = "pet", when = { pet = { family = "Cat" } },
      text = "A good cat, and well kept. Mind its claws in the Enclave; the druids take it personally." },
    { id = "n_pet_any", cat = "pet", when = { class = "HUNTER", pet = { named = true } },
      text = "{pet} looks healthy and alert. That tells me more about you than anything you could say." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Some do, by asking too much of the spirits. Yours must give as much as they take, because that is the law of the wild, and I keep it." } },
      choices = {
        { text = "Balance is wise, Jocaste. I will respect it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Balance is for hunters. My spirits have their own law.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every living thing has a place in it, and a healer's place is to mend what the hunt leaves behind. Don't heal the beast my hunters have rightly brought down, though, for that is not mercy, it is meddling." } },
      choices = {
        { text = "Mercy is never meddling, Jocaste, and I'll heal what suffers.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then I'll leave the hunt's dead to the balance.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "There is corruption, like the fel moss that has turned the Gnarlpine, and I would have you strike it wherever you find it. But a wolf that kills a deer is not evil, and I'd thank you not to judge it as if it were." } },
      choices = {
        { text = "The balance is yours to keep, so I'll strike only corruption.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Anything that preys on the helpless is evil, to my eyes.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "A warrior can, though most don't try, because steel teaches you to strike first and ask nothing. Learn the beasts of Teldrassil before you cut them down, and you'll find that fewer of them need cutting." } },
      choices = {
        { text = "I'll learn the forest before I draw a blade in it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A beast that charges me gets my blade. That's balance enough.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "A hunter hides to watch the balance, and strikes only when the balance asks it. A rogue hides for whatever reason pleases them, and that is the difference, so take care which of the two you become." },
      },
      choices = {
        { text = "I'll strike only when there's need, as a hunter does.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I hide for my own reasons, and they stay mine.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "A hunter's companion is bound by trust and freely given, while your servant is bound by chains and hates you for them. The forest knows the difference, and you'll find every beast in Teldrassil does too." },
      },
      choices = {
        { text = "Then I'll treat my servant with care, at least.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Chains work. Trust is slower and less reliable.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sabers = {
      lines = {
        { id = "sb_default", text = "Then you learned the first lesson before you came to me: a saber carries you because it chooses to. Riders make patient hunters or impatient ones, so which are you?" },
      },
      choices = {
        { text = "Patient. A hunt is won in the waiting.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Impatient. The saber taught me speed.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    human_h = {
      lines = {
        { id = "hh_default", text = "Somewhere I didn't expect, and I'll admit it. Your people fence the land and farm it, so the balance is harder to see in Elwynn than in Ashenvale, but a hunter who learns to see it there will see it anywhere." },
        { id = "hh_wood", when = { origin = "human_eastvale_woodsman" },
          text = "A woodsman's child from Eastvale. Then you grew up between the axe and the forest, and you know already that a tree is not only lumber; that puts you ahead of most of my students." },
      },
      choices = {
        { text = "What do you see in Elwynn that I don't?", next = "human_h2" },
        { text = "Every land feeds its hunters. Mine included.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    human_h2 = {
      lines = {
        { id = "hh2_default", text = "Wolves pushed off their ground by your farms, and bears driven down by your logging camps, and both of them turning on the roads. Nothing in a forest goes hungry without a reason, and the reason is usually one of us." },
      },
      choices = {
        { text = "People have to eat too.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Then the land should be given back.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    gun_h = {
      lines = {
        { id = "gh_default", text = "Every beast in Teldrassil heard you arrive, I'm sure, and so did the Sentinels on the far bridges. I won't tell you to put it down, since Ironforge's hunters swear by them, but a bow lets the forest keep its silence, and the forest remembers who keeps it." },
      },
      choices = {
        { text = "A clean kill matters more than a quiet one.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll learn the bow as well, then.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The same, though from different ends of it, because a hunter takes what the wild can spare and a druid mends what it cannot. When the Gnarlpine went mad it was my hunters who were sent and your Circle who grieved, and I think both of them were right." } },
      choices = {
        { text = "I'd rather cure a maddened furbolg than see any hunter shoot it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Sometimes the arrow is the kinder cure, and I accept that.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "A mage can respect anything, if they choose to, but the arcane takes from the world and seldom asks. A hunter's first lesson is awe, and I'd say it should be yours too, before you learn another spell." },
      },
      choices = {
        { text = "Awe first, then. I'll take the lesson.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The arcane is a tool, not a sin.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Respect the balance, as I tell my hunters, and you'll find the beasts of Teldrassil kinder to a healer than to a hunter." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. Your order judges good and evil, I'm told, but in the wild there is only the balance, and the balance does not take sides." },
        { id = "h_default", text = "I am Jocaste, and I train the hunters of Darnassus. Always respect the balance and live in awe of the nature around you, because that's the first lesson, and the last." },
        { id = "h_path", tags = { "news" }, when = { questActive = TODO_QUEST("The Hunter's Path") },
          text = "Yes, it's time. You're skilled enough to keep a beast at your side, so go to Dazalar in Dolanaar; he'll set you on the path to earning one." },
        { id = "h_beast", tags = { "news" }, when = { questActive = TODO_QUEST("Training the Beast") },
          text = "A fledgling hunter, with a companion of your own now. I can teach you to train it, to feed it and to call it back if it falls, so listen well." },
        { id = "h_beast_done", when = { questDone = TODO_QUEST("Training the Beast") },
          text = "You and your companion have grown since we last spoke. Remember the balance, and we shall speak again when you're ready for more." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You move like a hunter stalking, rogue, only without the respect. The forest still notices you, even if the guards don't." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "The beasts are restless, warlock, and so am I. Whatever walks behind you is no part of the balance I teach." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. You'll find no training here, but you may stand and listen if you keep still." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, a keeper of the balance as my hunters are. Yours is the gentler half of the work, though I've seen a druid in cat shape who would shame any hunter of mine." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage. The Highborne's magic once tore this world apart, and I cannot greet you without remembering it." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Balance is the oldest law of the wild, older than my people's memory, so tell me whether your spirits respect it or upset it." },
      },
      again = {
        { id = "h_again", text = "What else? Speak, and I'll listen as the forest listens, without hurry." },
        { id = "h_again2", text = "Another question? Good. Hunters who stop asking stop learning." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "What do you mean by balance?", next = "balance" },
        { text = "Choosing a companion must take care.", next = "companion" },
        { text = "Who else teaches hunters here?", next = "dorion" },
        { text = "How do I teach my companion new tricks?", next = "teach", when = { class = "HUNTER" } },
        { text = "I rode nightsabers before I ever drew a bow.", next = "sabers", when = { origin = "nightelf_nightsaber_rider" } },
        { text = "Humans hunt too. Where do I fit?", next = "human_h", when = { race = "Human", class = "HUNTER" } },
        { text = "My rifle serves me as well as any bow.", next = "gun_h", when = { race = "Dwarf", class = "HUNTER" } },
        { text = "What does a hunter think of a rogue's stealth?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Can a warrior keep the balance as a hunter does?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Is a demon really so different from a hunter's pet?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Does a priest have any place in the balance, Jocaste?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is there no evil in the wild, Jocaste?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do hunters and druids keep the same balance, Jocaste?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Can a mage respect the balance, Jocaste?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you think shamans upset the balance, Jocaste?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell, Jocaste.", next = "END" },
      },
    },
    balance = {
      big = true,
      lines = {
        { id = "ba_default", text = "Take only what you need, and never kill for the pleasure of it. The forest feeds the hunter as long as the hunter remembers that she belongs to the forest, and not the other way around." },
      },
      choices = {
        { text = "The wild should be left to itself.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Someone has to keep the wild in order.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "And those who break the balance on purpose?", next = "balance2" },
      },
    },
    balance2 = {
      lines = {
        { id = "b2_default", text = "Poachers, demons, orcs with axes in Ashenvale? We answer them, with arrows if we must. Balance isn't the same thing as peace, and every hunter learns that sooner or later." },
      },
      choices = {
        { text = "Then I'll answer them too.", next = "BACK", fx = { align = { honor = 1 }, trait = { brave = 1 } } },
        { text = "I'd rather avoid fights I don't need.", next = "BACK", fx = { align = { honor = -1 }, trait = { cautious = 1 } } },
      },
    },
    companion = {
      lines = {
        { id = "cm_default", text = "You don't choose; you earn. A beast that follows you because you beat it will leave the first chance it gets, but one that follows you because you fed it and stood by it will die for you." },
        { id = "cm_hunter", when = { class = "HUNTER", pet = { named = true } },
          text = "Look at {pet}, and ask yourself whether it follows you from fear or from trust. You already know the answer; the beast knows it too." },
      },
      choices = {
        { text = "I'll earn its trust, then.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    teach = {
      lines = {
        { id = "tc_default", text = "Patiently, and one lesson at a time, the same way I teach you. A beast learns from what it sees you do far more than from what you tell it, so fight cleanly in front of it." },
      },
      choices = {
        { text = "A companion should obey, first and always.", next = "BACK", fx = { align = { order = 1 }, trait = { stern = 1 } } },
        { text = "A companion should be free to follow its instincts.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
      },
    },
    dorion = {
      lines = {
        { id = "do_default", text = "Dorion, over there with his wolf, Shadow. He's gentler than I am, and the young ones like him better, which is how it should be, since they learn more from me." },
      },
      choices = {
        { text = "A stern teacher is a good one.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Kindness teaches too.", next = "BACK", fx = { align = { order = -1 }, trait = { kind = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Hunters bring back more than pelts; they bring news from every corner of the forest. Ask, and I'll share what's worth sharing." } },
    background = { { id = "tp_bg", text = "I teach hunters, and I teach them hard. Ask any of them in ten years whether it was worth it." } },
    advice = { { id = "tp_ad", text = "Feed your companion before you feed yourself. It's watching to see whether you will." } },
    centaur = { { id = "tp_centaur", text = "The centaur of the Barrens and Desolace ride in war bands and hold nothing sacred but the hunt. Respect that, because it means they're good at it." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw are proud and quick to anger, but they keep their word, even to those they would sooner see gone from their tunnels." } },
    blackfathom = { { id = "tp_blackfathom", text = "The drowned temple off Ashenvale's coast, where the nagas crawl. Bring a pet that can swim, and don't go alone." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "I leave the Dream to the druids. A hunter's job is the waking world, and that keeps me plenty busy." } },
    _none = { { id = "tp_none", text = "That's no concern of the hunt, and Elune gave me only so many years to learn the hunt in. Ask someone else." } },
  },
}

-- Denatharion: druid trainer in the Enclave; sends young druids up to Mathrengyl (Heeding the Call).
P:NPC {
  key = "denatharion", id = TODO_NPC("Denatharion"), name = "Denatharion",
  title = "Druid Trainer",
  bible = "bibles/enclave.md", role = "trainer", tier = "quest",
  communities = { "darnassus" }, temper = { "calm", "patient" }, values = { "wise", "loyal" },
  notices = { "form", "class" },

  impression = {
    first = "Denatharion blesses everyone in Cenarius's name, even those who will never take a shape. He speaks of the Enclave's quarrels with a teacher's tact, and of the young druids with real fondness.",
    third = "{name} met Denatharion, a patient druid trainer of the Cenarion Enclave.",
  },

  greetings = {
    { id = "g_cenarius", text = "The blessings of Cenarius be yours, {class}." },
    { id = "g_druid", when = { class = "DRUID" }, text = "Back again, young druid? Good; the forest has been waiting for you to grow into it." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest in the Enclave! The Temple and the Circle are old friends who argue, so you're welcome here, as long as you don't take sides." },
    { id = "n_bear", cat = "form", when = { form = { "bear", "cat" } },
      text = "You wear that shape well, but take it off before you sit down, please. The benches are older than you are." },
    { id = "n_travel", cat = "form", when = { form = "travel" },
      text = "Running indoors? The Arch Druid would have words, and none of them kind." },
  },

  start = "hello",
  nodes = {
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "That is the question young druids ask in whispers. It stands without the blessing the Aspects gave Nordrassil, and the forests at its feet sicken here and there, and yet our people live in its branches and sleep soundly. What do you think of the tree, {class}?" },
      },
      choices = {
        { text = "It's a marvel, and the Archdruid was right to grow it.", next = "op_r1", fx = { affinity = 1, align = { order = 1 }, opinion = { teldrassil_tree = "admire", fandral = "admire" } } },
        { text = "A tree grown without blessing will bear bad fruit.", next = "op_r2", fx = { align = { order = -1 }, trait = { cautious = 1 }, opinion = { teldrassil_tree = "wrong" } } },
        { text = "It's home now. Tend it and stop asking.", next = "op_r3", fx = { affinity = 1, trait = { practical = 1 }, opinion = { teldrassil_tree = "home" } } },
        { text = "The furbolgs and timberlings are sick. Something here is wrong.", next = "op_r4", fx = { trait = { curious = 1 }, opinion = { teldrassil_tree = "uneasy" } }, when = { class = "DRUID" } },
        { text = "I've no answer for that.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "Say so in the Cenarion Enclave and you'll have friends there for life. I hope you're right." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "Hush, now, not so loud under the Archdruid's own branches. Some of us think it, and none of us say it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "A good answer for a gardener, and maybe the right one. Rellian would agree with you, if he ever stopped fussing over his timberlings long enough to say so." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r4 = {
      lines = { { id = "op_r4_default", text = "So you've seen it too. The Gnarlpine and the timberlings are not the tree's fault, I tell myself, though I tell myself rather often." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Some in the Enclave see you as crude imitators of our craft, others as distant kin. I see a seeker of the world's voices, and a seeker gets my blessing, crude or not." } },
      choices = {
        { text = "I accept your blessing gladly, Denatharion.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I need no blessing. My spirits are enough.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "That healing begins with the one being healed and not with the healer's power, which the young ones are slow to learn. A priest sits with the dying, and a druid too often rushes to save what was meant to go back to the earth." } },
      choices = {
        { text = "Every life is worth saving, whatever the earth wants.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some things should be let go, and the druids are right.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Only when it's swung carelessly, and I suspect your order swings it less carelessly than most. Show my students that strength can be held back as well as used, and you'll teach them something I've struggled to." } },
      choices = {
        { text = "Strength held back is still strength, and I'll show them.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Strength is for using, and holding back gets people killed.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Most of my students think a bear's claws make a warrior unnecessary, until the first time they're knocked out of the shape and find themselves on the ground. I tell them to watch how you stand, because a warrior knows how to take a blow, and that is a lesson for any guardian." } },
      choices = {
        { text = "I'll stand in front, so your druids can heal.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Your druids should learn to take their own blows.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Some do, and I tell them it's a different bond, because they become the beast for a while and you walk beside one for years. The best of them come to respect you for it, and the rest grow up eventually." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Some do, and I tell them it's a different bond, because they become the beast for a while and you walk beside one for years. Your {pet} has the calm of a well-loved animal, and Cenarius would be glad of it." },
      },
      choices = {
        { text = "My companion is family, as Cenarius would want.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It's a hunting beast. Sentiment gets you killed.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Mostly how you can draw on something so wild without it drawing on you in turn. Malfurion taught us that the arcane was a wound in the world, and so we turned to Cenarius instead; I've yet to meet a mage who could tell me he was wrong." },
      },
      choices = {
        { text = "Maybe he wasn't wrong. I'll take care with the wound.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Malfurion knew nature. He didn't know my craft.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "There is, slowly, and so Felwood still has druids working at its edges instead of only graves. It takes a hundred of us a year to cleanse what one careless summoner can burn in an afternoon, so you'll understand why I do not offer you tea." },
      },
      choices = {
        { text = "Then I'll be the careful kind of summoner.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The fel burns quicker than you heal. That's your problem.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    forms = {
      big = true,
      lines = {
        { id = "fm_default", text = "Every young druid asks me that, and every old one has a different answer. The bear stands and holds, the cat hunts unseen, the seal goes where we can't, and your true shape is the one you are when you come back from them." },
      },
      choices = {
        { text = "The bear. Stand where everyone can see you.", next = "forms2", fx = { align = { honor = 1 } } },
        { text = "The cat. Strike before they know you're there.", next = "forms2", fx = { align = { honor = -1 } } },
        { text = "And what if I don't come back?", next = "forms2" },
      },
    },
    forms2 = {
      lines = {
        { id = "fm2_default", text = "Then you'll not be the first, and that's why Mathrengyl tests the heart and not only the body. Come back to yourself every evening, even when it would be easier to stay four-footed, and you'll be fine." },
      },
      choices = { { text = "I'll remember. Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } } },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Cenarius blesses all that lives in balance with the world, and a quiet step doesn't trouble that balance at all. What you do when you get where you're going is another matter, and I'll trust you to judge it as the wild would." },
      },
      choices = {
        { text = "I'll strike only when I must.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The wild kills without a second thought, and so do I.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I had another question.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. The young druids think healing is all growing vines over wounds, so I'm always glad when a priest comes by to remind them there's more than one way." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, in the Enclave. The young druids will stare at your armor, I'm afraid, because they think anything made of iron must be at war with the forest." },
        { id = "h_default", text = "I am Denatharion, one of those who teach the young druids of the Enclave. Most of them come to me knowing how to grow a vine and leave knowing why they shouldn't always." },
        { id = "h_call", tags = { "news" }, when = { questActive = TODO_QUEST("Heeding the Call") },
          text = "Mathrengyl Bearwalker has asked for you by name, young druid. He's on the second floor of the Arch Druid's tree, and you'll find no wiser teacher in all of Teldrassil." },
        { id = "h_bear_done", when = { questDone = TODO_QUEST("Body and Heart") },
          text = "You've met the Great Bear, I can tell; you stand differently. Mathrengyl chose well." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage in the Enclave, studying us studying the land. I suppose that's fair, since we spend enough time wondering about you." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "I teach young druids to heal what the fel has burned, warlock, so you'll understand if I'd rather you kept walking." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "Cenarius bless you, warrior. Even those who will never take a shape are welcome in the Enclave." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "Cenarius bless you, hunter, and whatever walks beside you. You and my students share a love of the wild, though you show it differently." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "Cenarius bless you, rogue, even if you walk too quietly for the young druids' comfort. They're used to hearing people coming before they see them." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Cenarius bless you, even though your path is different from ours; the Enclave argues about such things, but I have lived too long to bother." },
      },
      again = {
        { id = "h_again", text = "What else would you know? The Enclave is slow, and so are its answers, but they come." },
        { id = "h_again2", text = "Ask on, then, since questions are how roots find water." },
      },
      choices = {
        { text = "Is Teldrassil a true world tree?", next = "op_ask" },
        { text = "Train me.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "Who is Cenarius, to you?", next = "cenarius" },
        { text = "A young druid must have much to learn.", next = "first" },
        { text = "How is the Circle under Fandral?", next = "circle" },
        { text = "Which shape is truest to a druid?", next = "forms", when = { class = "DRUID" } },
        { text = "What do druids wonder about mages?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What do druids think of warriors, Denatharion?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do your young druids envy a hunter's companion?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Is there any healing for what the fel has done?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What can young druids learn from a priest, Denatharion?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Is iron really at war with the forest, Denatharion?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does Cenarius bless rogues as well, Denatharion?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do the druids argue about shamans, Denatharion?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    cenarius = {
      big = true,
      lines = {
        { id = "ce_default", text = "The forest's demigod, and the first teacher of our druids, long ago. He fell in the war against the orcs, in Ashenvale, and we still teach in his name because the forest hasn't forgotten him either." },
      },
      choices = {
        { text = "The orcs should answer for his death.", next = "BACK", fx = { align = { honor = 1 }, learn = { "warsong" } } },
        { text = "Vengeance won't bring him back.", next = "BACK", fx = { align = { honor = -1 }, learn = { "warsong" } } },
        { text = "Do druids still feel him?", next = "cenarius2" },
      },
    },
    cenarius2 = {
      lines = {
        { id = "c2_default", text = "Some say they do, in the old groves, and I won't tell them they're wrong. I feel the forest, and most days I don't need it to answer." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    first = {
      lines = {
        { id = "fi_default", text = "Patience, then the bear, then the rest. A druid who rushes the shapes ends up wearing them badly, like a borrowed cloak." },
        { id = "fi_druid", when = { class = "DRUID", maxLevel = 15 },
          text = "You'll learn it soon enough. When Mathrengyl sends for you, go at once, and don't be ashamed if the Great Bear leaves you a little dazed." },
      },
      choices = {
        { text = "Patience isn't my strength.", next = "BACK", fx = { align = { order = -1 }, trait = { witty = 1 } } },
        { text = "Discipline first. I understand.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
      },
    },
    circle = {
      lines = {
        { id = "ci_default", text = "Busy, and loud, and growing like the tree. The Arch Druid has a vision for Teldrassil, and he pursues it harder than anyone, which some admire and some find tiring." },
      },
      choices = {
        { text = "I can't tell which you are.", next = "circle2" },
        { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } },
      },
    },
    circle2 = {
      lines = {
        { id = "c2b_default", text = "A teacher, which means I admire him on the days I'm rested and find him tiring on the others. Don't tell him which day it is." },
      },
      choices = {
        { text = "A leader needs that drive.", next = "BACK", fx = { align = { order = 1 }, learn = { "cenarion_circle" } } },
        { text = "A leader needs to listen, too.", next = "BACK", fx = { align = { order = -1 }, learn = { "cenarion_circle" } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The Enclave is full of druids, and druids whisper beneath the boughs as freely as any gossip in a tavern. Ask, and I'll tell you what I've overheard." } },
    background = { { id = "tp_bg", text = "I teach the young druids before Mathrengyl takes them further. It's a gentle post, and I like it." } },
    advice = { { id = "tp_ad", text = "Listen to the forest before you speak for it. Most druids skip that step." } },
    cenarion_circle = { { id = "tp_circle", text = "We are the Circle, and we serve the balance. Our leaders disagree sometimes, but the duty doesn't change." } },
    emerald_dream = {
      { id = "tp_emerald_dream", text = "The Dream is the world as it might have been, green and unbroken, and every druid feels it at the edges of sleep. Don't chase it yet, because it will find you when you're ready." },
      { id = "tp_emerald_dream2", when = { class = "DRUID" }, text = "You've felt it already, haven't you, at the edges of your sleep. Be patient with it, because it's been waiting a long time and can wait a little longer." },
    },
    nordrassil = { { id = "tp_nordrassil", text = "Nordrassil is the first World Tree, on Hyjal's summit, and it keeps our long lives. Every young druid should see it once before they decide they know everything." } },
    green_dragons = { { id = "tp_green_dragons", text = "Ysera's flight guards the Dream and the druids who walk it. Be respectful if you ever meet one, and don't ask them to explain themselves." } },
    elune = { { id = "tp_elune", text = "Elune and Cenarius were close in the old stories, closer than the Temple and the Enclave are now. I'd like to see that again." } },
    _none = { { id = "tp_none", text = "The forest hasn't told me that one. Try the Temple, perhaps." } },
  },
}
