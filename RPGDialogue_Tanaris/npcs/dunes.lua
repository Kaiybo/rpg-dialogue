-- Tanaris beyond the gates: Steamwheedle Port, the wandering turtle Tooga, and the Gadgetzan folk earlier passes skipped.
local P = RPGDialogueAPI:Pack("rpgd.tanaris")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "ironboot", id = TODO_NPC("Prospector Ironboot"), name = "Prospector Ironboot",
  bible = "bibles/tanaris.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Prospector Ironboot is a dwarf at Steamwheedle Port who came to Tanaris for its buried treasures and stayed for the sand in his beard.",
    third = "{name} met Prospector Ironboot at Steamwheedle Port in Tanaris.",
  },
  greetings = {
    { id = "g_main", text = "Well met, friend! Shake the sand off yer boots before ye come any closer." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? The desert didn't swallow ye, then. Good." },
  },
  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Bones, mostly, an' old troll stonework. But I'll say this tae a fellow dwarf: the ground here shifts like it's dreamin', an' I'd sooner ye asked it what it dreams than me." } },
      choices = {
        { text = "Then I'll ask it, and respect what it tells me.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Dig deeper, Ironboot. The earth's dreams aren't our problem.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I need someone who'll stand in the sand all day and not wander off after the first bandit he sees, aye. The last fellow I hired chased a Wastewanderer over three dunes and came back with no water, no bandit and no notion where the dig was." } },
      choices = {
        { text = "A guard holds his post. Chasing glory gets diggers killed.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Best defence is running the bandits down before they reach you.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Hyenas by day and scorpids by night, and once a basilisk that sat on my best trench for two days and glared at anyone who came near. I lost a good shovel and a better digger to that stare before it wandered off." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And keep {pet} out of the trenches, if ye don't mind, because the last beast that dug in my dig found a troll's skull and wouldn't give it back." },
      },
      choices = {
        { text = "Beasts only take what they need. Drive them off, don't slaughter them.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A hyena that learns to raid camps should be put down.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "They're Sandfury dead, or their grandfathers, and they were buried with charms meant to keep them down. I'd sooner a priest said proper words over them than have some Zul'Farrak witch doctor come looking for what I've moved." } },
      choices = {
        { text = "I'll lay them to rest properly. The dead deserve that much.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Dead trolls make useful servants. I'd not waste them on rest.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Bones, mostly, and old troll stonework that crumbles the moment the air touches it. Once or twice the ground's shifted under me like it was turning over in its sleep, and I'll admit I didn't stay to see it wake." } },
      choices = {
        { text = "The earth remembers. Dig with respect, or it'll bury you.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Ruins belong to whoever holds the shovel. Dig deep.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The League won't say it out loud, but aye, they've paid for quiet hands before. A sealed vault under the dunes keeps its secrets well, and sometimes the only key is someone who can open what was never meant to be opened." } },
      choices = {
        { text = "Ancient tombs should stay sealed. Leave the dead be.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If it's buried and forgotten, it's fair game.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Let's dig into something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "There's old something, I'd stake my beard on it, because nobody builds walls like the ones at Eastmoon for no reason. The trolls of Zul'Farrak won't say what came before them, and the sand won't either, so I keep digging and hoping." } },
      choices = {
        { text = "Some old power should stay buried, Ironboot.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Dig it all up. Knowledge belongs to the finders.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Near Zul'Farrak they have, aye, and I'll not pretend otherwise. The trolls there don't let their dead lie quiet, so a dwarf with a shovel learns to listen for scratching under the sand before he digs another foot." } },
      choices = {
        { text = "Treat their graves with reverence, even if they're troll graves.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The dead won't miss what you take from them.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Someone to stand between my diggers and whatever we wake, mostly, because a shovel's no use against a troll with a spear. The League pays in maps and gratitude, I'm afraid, but there's honest work in keeping good folk alive." } },
      choices = {
        { text = "I'll guard your diggers. That's what a paladin is for.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Light doesn't serve the League. I go where I'm needed.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Bones, mostly, an' some of them far too big for any beast I know. There's petrified wood down there as well, whole trunks of it, so there was a forest here once, an' I'd give a lot to know what killed it." } },
      choices = {
        { text = "Dig it up. The past should be known.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Let the dead forest rest. Not every secret needs digging.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Old troll cities, older than Zul'Farrak, and things the trolls themselves were afraid of, if the carvings are tae be believed. I dig for the League's knowledge, not for power, an' I'd ask ye tae respect the difference while ye're at my camp." } },
      choices = {
        { text = "I'll respect it. Some things should stay buried.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If there's power down there, it's wasted on dust.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "A shaman, eh? I've no great love for the Horde, but out here the sand's the enemy of us all, so say yer piece and mind the dig." },
        { id = "h_default", key = true, text = "Prospector Ironboot, digger, surveyor and dwarf of Ironforge, out here in the worst sandbox ever made. Tanaris has more buried under the dunes than anyone knows, and I mean to find a bit of it." },
        { id = "h_c0", when = { race = "Dwarf" }, text = "A fellow dwarf! Then ye'll know why I'm here: Explorers' League blood doesn't let a dwarf sit still while there's ruins to dig." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "Light fingers and soft boots, eh? I've worked digs with your sort before, and ye'd be surprised how often a locked tomb turns into an open one when there's a rogue on the payroll." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, out here in the sand! Tell me, can ye feel anything under these dunes? Old magic, buried cities, anything a poor prospector might dig up?" },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde, at my dig? I'll not pretend I'm easy about it, but if ye can quiet the troll bones I keep turning up, ye're welcome to try." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, out here in the dunes! Say a word over the dig for me, friend, because some of the troll bones I've turned up didn't seem to want turning." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, by my beard! There's not many of yer order this far south, and I'll sleep easier at the port knowing there's a hammer of the Light about." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior with a proper shield, eh? Good, because the Wastewanderers don't respect a surveyor's flag, but they do respect a dwarf with an axe standing next to it." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, eh? Ye'll have seen the hyenas trailing ye in from the road, then; they've learned that diggers drop their lunch when they run." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A kaldorei druid in Tanaris! Ye'll not find much growing out here, but I've found a root or two buried deep that'd interest ye." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock at my dig, is it? Keep yer wee beastie away from the tomb mouths, because I've a feelin' some o' what's buried out here would be glad o' the company." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! I'd heard tell o' this, but I didnae believe it till now. Out here the sand's the enemy o' us all, so say yer piece an' mind the dig." },
      },
      again = { { id = "h_again", text = "Anything more, friend?" }, { id = "h_again2", text = "Go on, ask; the sand'll wait." } },
      choices = {
        { text = "What lies buried under these dunes?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "The earth here is dry and old. What have your digs disturbed?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "What's buried out here?", next = "b1_1" },
        { text = "Why Steamwheedle Port?", next = "b2_1" },
        { text = "Is it dangerous?", next = "b3_1" },
        { text = "Ironforge must miss its diggers.", next = "x_1", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Should the old ruins be left alone?", next = "s_1" },
        { text = "Would the Explorers' League hire a rogue, Ironboot?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Is there old magic buried in Tanaris?", next = "xmage", when = { class = "MAGE" } },
        { text = "Have your digs disturbed any restless dead, Ironboot?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What troubles you about the bones you dig up, Ironboot?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What does the Explorers' League need from a paladin out here?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you need someone to guard your digs, Ironboot?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What beasts plague your digs out here, Ironboot?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What do you think is buried under Tanaris, Ironboot?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "The earth here is dry and old. What have your digs disturbed?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Old troll cities, for a start, the Sandfury's ancestors and Zul'Farrak's lot, and older things beneath them still. Some of the ruins out east are so old the trolls themselves don't know who built them." } },
      choices = { { text = "Older than the trolls?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "The problem is the Wastewanderers, the Sandfury and the heat, and not always in that order. A dwarf can dig for a week and still find nothing but sand." } },
      choices = { { text = "What keeps you going?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "But when ye do find something, friend, there's no feeling like it in all the world. That's what keeps me out here." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Because the goblins sell everything a digger needs and don't ask questions about where ye're going. Cost me a fortune, mind, but nothing's free in Tanaris." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Everything here is dangerous, from the sand to the scorpids to the goblins' prices. Bring water, then bring more, and then shake out your bedroll, because I once woke up with a scorpid using my beard as a pillow." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Aye, and I miss Ironforge's ale, but a dwarf goes where the dirt's got somethin' buried in it. Tell Magni I said hello, if ye ever see him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some say it's grave robbing, digging up the old troll cities. I say knowledge buried is knowledge wasted." } },
      choices = { { text = "Learn from the past. Dig carefully.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } }, { text = "Let the dead keep their cities.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Can't say I've dug that up yet, friend." } } },
}

P:NPC {
  key = "tooga", id = TODO_NPC("Tooga"), name = "Tooga",
  bible = "bibles/tanaris.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Tooga is an old turtle wandering the Tanaris sands, lost and very far from the friend who's waiting for him in Feralas.",
    third = "{name} met Tooga, a wandering turtle in the deserts of Tanaris.",
  },
  greetings = {
    { id = "g_main", text = "Tooga sees you! Tooga is lost, and very hot, and very slow." },
    { id = "g_back", when = { metBefore = true }, text = "Tooga remembers you. You are kind to Tooga." },
  },
  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Tooga is a turtle, and turtles carry their own wall on their backs, so Tooga hides inside it and waits. But the scorpids are patient too, and Tooga has been hiding a long time, and Torta is still very far away." } },
      choices = {
        { text = "Patience wins. I'll walk at your pace and guard you, Tooga.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Better to charge the scorpids than wait for them to come.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Tooga would like a prayer for shade, and one for water, and one more that Torta is not too cross that Tooga wandered off. The sand is very big and Tooga is very slow, so the prayers had better be strong ones." } },
      choices = {
        { text = "Keep to the road this time, Tooga, and don't stray from it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Wander as you please, Tooga. The best paths are never on a map.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The sand is hot on top and cold underneath, and it whispers when the wind runs over it. Tooga does not understand the whispering, but Tooga thinks the desert is lonely, like Tooga." } },
      choices = {
        { text = "Every land has its spirits, and every spirit keeps its place.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Spirits wander where they like, Tooga, just like you.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because Torta is Tooga's, and Tooga is Torta's, and that is how it has been for a very long time. Tooga only went for a little walk, and then the little walk became a big walk, and now Torta is far away and probably cross." } },
      choices = {
        { text = "Then I'll carry you to her myself if I must.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "You wandered off, Tooga. You can walk yourself home.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "The scorpids, because they are fast, and Tooga is not fast. Tooga hides in Tooga's shell, and the scorpids tap on it, tap tap tap, and Tooga waits until they get bored, which is a long time." } },
      choices = {
        { text = "I'll keep the scorpids off you all the way to Torta.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Hide in your shell, Tooga. That's what it's for.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Tooga asked a goblin once, and he wanted a lot of gold, and Tooga does not have gold, only a shell. Also Tooga thinks Torta would want Tooga to walk, so that Tooga learns not to wander off so much." } },
      choices = {
        { text = "Torta's right. Walking home will teach you something.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Forget the lesson. I'd rush you home if I could.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "A little, because it looks at Tooga like the scorpids do. But you came to help Tooga, and Tooga thinks a person who helps a turtle cannot be all bad, even if their friend has horns." } },
      choices = {
        { text = "He won't harm you, Tooga. I'll make sure of it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "He goes where I send him. Stay close and you'll be fine.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Pray that Torta is not too cross, and that the sun is not too hot, and that the scorpids are asleep. That is three prayers, so maybe pray slowly, like Tooga walks, so none of them fall out." } },
      choices = {
        { text = "I'll pray for all three, and walk beside you too.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Prayers won't move your legs, Tooga. Let's just go.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "You smell like rain and stone, and Tooga likes that smell. Can you ask the sky to make a little water for a lost turtle?" },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "You smell quiet and smoky, like a candle in a tent. Will you say a prayer that Tooga finds his way home to Torta?" },
        { id = "h_default", key = true, text = "Tooga is Tooga, and Tooga is very far from home. Torta is waiting for Tooga in Feralas, but the desert is big and Tooga's legs are small." },
        { id = "h_c0", when = { questActive = TODO_QUEST("Tooga's Quest") }, text = "You will take Tooga to Torta? Tooga is slow, so please be patient, and please do not let the scorpids eat Tooga." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "Tooga sees the big shield and the big sword. Tooga thinks you could keep the scorpids away, if you walk slowly, very slowly, like Tooga." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "Tooga sees a shiny shell, like Tooga's, but on the outside of a person! Tooga thinks you must be very safe in there." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Tooga did not hear you, and Tooga always hears things, very slowly. You are a quiet one, and Tooga likes quiet ones." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "Tooga smells something sparkly on you! Can you make Tooga go fast, very fast, all the way to Feralas?" },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "Tooga sees your little friend with the horns, and Tooga is going to stay in Tooga's shell for a while, if that is all right with you." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "You smell like candles and quiet singing. Tooga thinks you must be a kind person, and Tooga hopes you are, because Tooga needs a kind person." },
      },
      again = { { id = "h_again", text = "What else? Tooga listens slowly." }, { id = "h_again2", text = "Tooga is here." } },
      choices = {
        { text = "What do the sands feel like to an old turtle, Tooga?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "How did you get lost?", next = "b1_1" },
        { text = "Who is Torta?", next = "b2_1" },
        { text = "Are you all right?", next = "b3_1" },
        { text = "I understand beasts. Let me guide you.", next = "x_1", when = { class = { "DRUID", "HUNTER" } } },
        { text = "Should you have stayed home?", next = "s_1" },
        { text = "What would you have me pray for, Tooga?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Are you afraid of the things in the desert, Tooga?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Why do you want to go back to Torta so badly, Tooga?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What scares you most out here, Tooga?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why don't you ask someone to teleport you home, Tooga?", next = "xmage", when = { class = "MAGE" } },
        { text = "Are you afraid of my demon, Tooga?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What would you have me pray for, Tooga?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Tooga went for a walk, and Tooga kept walking, and now Tooga is in the desert. Turtles are not good at deserts." } },
      choices = { { text = "Torta worries?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Tooga thinks Torta must be worried, because Torta always worries. Torta is Tooga's best friend." } },
      choices = { { text = "Probably?", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "If Tooga can get home, Tooga will never walk so far again, probably." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Torta is a turtle too, and Torta is very wise and very old. Torta lives near the water in Feralas, and Tooga misses the water." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "Tooga is hot and tired and thirsty, but Tooga is still Tooga. Turtles are tough on the outside." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "You speak to Tooga like a friend. Tooga likes that, and Tooga will follow you anywhere slow." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Torta always tells Tooga to stay close, but Tooga likes to wander. Tooga does not know if that is good or bad." } },
      choices = { { text = "Wandering is how you see the world.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } }, { text = "Stay close to home next time, Tooga.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Tooga does not know, because Tooga is a turtle." } } },
}

P:NPC {
  key = "curgle", id = TODO_NPC("Curgle Cranklehop"), name = "Curgle Cranklehop",
  bible = "bibles/tanaris.md", role = "questgiver", tier = "quest",
  impression = {
    first = "Curgle Cranklehop is a gnome in Gadgetzan with a scholar's curiosity and a habit of finishing other people's sentences.",
    third = "{name} met Curgle Cranklehop, a gnome in Gadgetzan.",
  },
  greetings = {
    { id = "g_main", text = "Oh! A visitor, how wonderful. Do you have a moment for some science?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I've been thinking about what we discussed." },
  },
  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Oh, absolutely, armor is a diary nobody can lie in! Those long scratches are a hyena's claws, and those little pits by your collar, unless I'm very much mistaken, are where a scorpid's venom ate the finish off your steel." } },
      choices = {
        { text = "Scars are lessons, and a good warrior studies every one.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I don't study my wounds. I just hit back harder.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "I study everything, which is rather my problem, but faith out here interests me most, because the Sandfury pray to loa that answer them and the goblins pray to profit, which also seems to answer them. I'd dearly like to know whether the Light works the same in a desert as it does in a cathedral." } },
      choices = {
        { text = "The Light works the same everywhere. That's rather the point of it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Out here, the shadow answers faster than the Light ever has.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "The scorpids, without question! They go weeks without water and never complain, which is more than I can say for anyone in Gadgetzan, and if I could build a machine half as clever, I'd retire tomorrow." } },
      choices = {
        { text = "Some marvels should be admired, not copied.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Copy it, then. The scorpids won't miss the idea.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The basilisks certainly do; they bask on the stones at exactly the hour the rock holds the most heat, as if something told them. And the scorpids dig down a full hour before a sandstorm, which is either instinct or, well, a very good informant." } },
      choices = {
        { text = "Instinct, nothing more. Your notes will explain it in time.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "They listen to the land. Scholars should try it sometime.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Natural magic, yes, that's what I said on Tuesday, and then on Wednesday I said the opposite! If you ever have to freeze one, do write down whether it turns to stone any slower, because nobody in Gadgetzan will take notes for me." } },
      choices = {
        { text = "Leave them in peace. Not every creature needs studying.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Knowledge is worth a few frozen basilisks.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Only to look, because a creature is a creature, and I study creatures! Though I'll admit the scorpids at least have the decency to be from this world, which your little friend clearly isn't, and that bothers the scholar in me terribly." } },
      choices = {
        { text = "Study it all you like. Fear is for the ignorant.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "You're wise to keep your distance.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Never mind my demon.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Oh, much worse, and I've the notes to prove it! Thirst thins the blood, scorpid venom sits in it for days, and a fever out here climbs twice as fast as one in a cool stone city, so a healer in Tanaris never runs short of patients." } },
      choices = {
        { text = "Then I'll tend whoever falls ill, scholar or bandit alike.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Wastewanderers can look after their own sick.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Only on myself, and only a very little, and I couldn't feel my left foot for a week. The goblins laughed, but I learned that the stone begins at the skin and works inward, which is more than anyone in Gadgetzan knew before." } },
      choices = {
        { text = "Science is worth a numb foot. Keep at it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Be careful, Curgle. No discovery is worth your life.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I would dearly love a basilisk egg, still whole, from the nests south of town. The Bruisers took the last one off me at the gate, so this time I'd prefer nobody knew I had it." } },
      choices = {
        { text = "No eggs in town, Curgle. The Bruisers have a point.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll get you an egg, and the Bruisers will never know.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Now, I've read that your people speak with the elements, which is either superstition or the most fascinating field study in Kalimdor, and I'd dearly like to know which." },
        { id = "h_default", key = true, text = "Curgle Cranklehop, at your service! I study the creatures of Tanaris, from the scorpids to the basilisks, because the desert hides more marvels than anyone in Gadgetzan gives it credit for." },
        { id = "h_c0", when = { race = "Gnome" }, text = "A fellow gnome! Oh, splendid, someone who'll understand when I talk about mechanical reproduction of insect behavior." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! Oh, wonderful, you can settle an argument I've been having with myself: do basilisks really turn things to stone, or do they just stare very hard?" },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Oh, wonderful, you'll know whether the basilisks' stone gaze is an arcane effect or a natural one, because I've been arguing with myself about it for a fortnight." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Is that an imp? Oh, my, it is! May I look at it, from a distance, a safe and sensible distance, preferably with you between us?" },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest from the Horde! I've read that troll priests and Forsaken priests pray to entirely different things, and I'd give a week's notes to hear you explain the difference yourself." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Oh, wonderful, because I've been wondering whether the Light works the same on a basilisk as on a person, and nobody in Gadgetzan will let me find out." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! You'll forgive me for staring at the dents in your armor, but I can tell a scorpid's sting from a basilisk's bite at ten paces, and you've met both." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Oh, wonderful, do you know I've always wondered whether a basilisk's gaze works on someone who's glowing with the Light? Purely academic, of course." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Oh, you startled me! You move like a sand scorpid, all quiet and sudden, and I mean that as a compliment, a scientific one." },
      },
      again = { { id = "h_again", text = "What else, friend?" }, { id = "h_again2", text = "More questions? Wonderful!" } },
      choices = {
        { text = "Do the desert beasts feel the elements the way I do?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What creature in Tanaris fascinates you most, Curgle?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What do you study?", next = "b1_1" },
        { text = "Why live in Gadgetzan?", next = "b2_1" },
        { text = "What do the goblins think of you?", next = "b3_1" },
        { text = "My pet might interest you.", next = "x_1", when = { class = "HUNTER" } },
        { text = "Is studying beasts better than hunting them?", next = "s_1" },
        { text = "I'd guess the basilisk gaze is natural magic.", next = "xmage", when = { class = "MAGE" } },
        { text = "You want to study my demon, Curgle?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Does the desert make sickness worse, Curgle?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you study the way faith works, Curgle?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Can you really read a fight from my armor, Curgle?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Have you ever tested the basilisk gaze on a person, Curgle?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you need anything collected quietly, Curgle?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "The way desert creatures survive with so little water, mostly. The scorpids, the hyenas and the basilisks have all adapted in ways I can only dream of reproducing." } },
      choices = { { text = "Reproducing them?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "I've been keeping notes for months, and I've filled four journals. The goblins think I'm mad, but they also think anything not for sale is mad." } },
      choices = { { text = "I'll keep an eye out.", next = "b1_3" }, { text = "Something else.", next = "BACK" } },
    },
    b1_3 = {
      lines = { { id = "b1_3_l", text = "If you see any unusual creatures out there, tell me about them. Science needs eyes, and I only have two." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "It's the only town in Tanaris with walls, water and a decent workbench. The bruisers keep the peace and the goblins keep the shops open, and I can't ask for more." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b3_1 = {
      lines = { { id = "b3_1_l", text = "They think I'm a customer who never buys anything, which is fair. I spend all my money on notebooks." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    x_1 = {
      lines = { { id = "x_1_l", text = "Oh, it might ever, and I'd love to take notes while it does, though I promise I won't poke it, at least not without asking." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some say knowledge is wasted on beasts we'll only kill. I say we kill them because we don't understand them." } },
      choices = { { text = "Understanding beats killing every time.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } }, { text = "Beasts are for hunting. Study books instead.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I don't know, but I'd love to find out!" } } },
}

P:NPC {
  key = "jabbey", id = TODO_NPC("Jabbey"), name = "Jabbey",
  bible = "bibles/tanaris.md", role = "vendor", tier = "service",
  impression = {
    first = "Jabbey sells odds and ends from a stall in Gadgetzan, and every one of them, he swears, is a bargain.",
    third = "{name} met Jabbey, a vendor in Gadgetzan.",
  },
  greetings = {
    { id = "g_main", text = "Step right up, step right up! Jabbey's got what you need, even if you don't know you need it." },
    { id = "g_back", when = { metBefore = true }, text = "My favorite customer! What can Jabbey sell you today?" },
  },
  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Bandages, mostly, because the Wastewanderers fight dirty and the Bruisers won't patch you up for free. And a spare waterskin, since a warrior who runs dry halfway to Noonshade Ruins ends up a skeleton the hyenas argue over." } },
      choices = {
        { text = "I fight fair, even against bandits who don't.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Against bandits, I'll fight every bit as dirty as they do.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Arrows, shot, and a salve for blistered paws, which out here sells faster than the arrows. By noon the sand gets so hot I've watched a hunter's wolf hop from foot to foot all the way down the main street." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks like it's been walking on that sand all day, friend, and Jabbey would say it's earned a tin of the good salve." },
      },
      choices = {
        { text = "A beast at your side deserves the care you'd give yourself.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A beast toughens up or it doesn't. Coddling helps nobody.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Jabbey buys it from a fellow who swears a priest blessed it, and Jabbey has never had a complaint, so who is to say it isn't holy? Out here, friend, folk believe in whatever keeps the sand out of their wounds, and they pay for it gladly." } },
      choices = {
        { text = "Faith deserves better than a counterfeit, Jabbey. Stop selling it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If it comforts them, sell all you can. I'll take a bottle.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Depends who's talking. The caravan folk swear the dust devils out past the Noonshade Ruins follow wagons on purpose, and one fellow told me the wind stole his hat and gave it back a mile on, though I sold him a new one anyway, just in case." } },
      choices = {
        { text = "The wind keeps its own accounts. Respect it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Dust devils are just hot air, like most travellers' tales.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Jabbey cares that the coin is real and the Bruisers don't see the blinding happen inside the walls. What happens in the dunes is between you and whoever you're blinding, and Jabbey sleeps very well, thank you." } },
      choices = {
        { text = "A merchant should care where his goods end up.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Good. I don't want my business known either.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Booty Bay, mostly, and Ratchet when the boats are kind. Jabbey doesn't ask where Booty Bay gets them, and Booty Bay doesn't ask where Jabbey sends them, and that's how reagents get across the sea in one piece." } },
      choices = {
        { text = "Good trade keeps the world turning, whoever's on the other end.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "You should know who you're buying from.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "That'll do for reagents.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Jabbey thinks you're a customer like any other, so long as you buy what's on the shelf. What you do with your own shadows is your business, but Jabbey would rather not have them in his stall." } },
      choices = {
        { text = "Every merchant has his price. Yours is just higher.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "A man with a line is worth respecting.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else, Jabbey.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Ask for 'em? They buy charms for 'em, friend, because a charm comes with a receipt. Most of this town believes in the Cartel first and luck second, though I'll tell you, when the Wastewanderers raid, everybody suddenly remembers a god or two." } },
      choices = {
        { text = "Selling charms to frightened folk is a cheap trick, Jabbey.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If a charm calms them, sell it. Comfort is comfort.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Here and there, mostly there, which is to say I don't ask the pickers too many questions. Some of it comes up from Un'Goro in crates, and anything that still bites when it arrives goes in the back." } },
      choices = {
        { text = "Trade is trade. Don't ask, don't worry.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Ask questions. Stolen herbs are still stolen.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Nothing! Well, nothing much, because Jabbey can't always say where a thing came from, only where it went next. A crate comes in from Steamwheedle Port and Jabbey doesn't ask, because asking makes the crates stop coming." } },
      choices = {
        { text = "You should ask. Stolen goods hurt somebody.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A merchant can't question every crate, Jabbey.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Then you'll be wanting ankhs, and I keep a few under the counter for your sort, priced like everything else here: fair, more or less." },
        { id = "h_default", key = true, text = "Name's Jabbey, and I sell a little of everything: reagents, odds, ends and the occasional thing I can't explain. Gadgetzan's the crossroads of Tanaris, and everything passes through my stall sooner or later." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "Flash powder and blinding powder, friend, and Jabbey asks no questions about who you plan to blind. That's what makes Jabbey a reliable vendor." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Jabbey keeps runes and feathers for your kind, and arcane powder when the boats bring it, because mages always run out right before they need it most." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Jabbey doesn't sell soul shards, friend, so don't ask. Jabbey sells a lot of strange things, but even Jabbey has a line, and that line is anything that used to be somebody." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Jabbey has candles, holy water of mostly reliable origin, and a very nice skull that a Forsaken gentleman almost bought last month." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, is it? I've got holy water, or something that was holy water before it crossed the sea, and candles, and one very old prayer book I can't read a word of." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, and a thirsty one by the look of you! Jabbey's got whetstones, bandages and a tonic that'll put the fight back in your arms, all at a very reasonable markup." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! Now, Jabbey doesn't sell meat, but if your beast's hungry I know a fellow named Dirge who asks very few questions about where his comes from." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! I've got seeds, herbs, and something in a jar I'm told used to be a cactus, so you'll find something here, I promise." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin at Jabbey's stall! Jabbey sells honest goods to honest folk, mostly, and Jabbey would like you to remember the honest part." },
      },
      again = { { id = "h_again", text = "What else? Jabbey's always open." }, { id = "h_again2", text = "More? Jabbey loves questions that end in sales." } },
      choices = {
        { text = "Where do you get your herbs, Jabbey?", next = "xdruid", when = { class = "DRUID" } },
        { text = "What do travellers say about the desert spirits out there?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What sells best here?", next = "b1_1" },
        { text = "Where do you get your goods?", next = "b2_1" },
        { text = "Do you ever overcharge?", next = "s_1" },
        { text = "You really don't care what your powder gets used for?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Where do you get your reagents out here?", next = "xmage", when = { class = "MAGE" } },
        { text = "You think less of me for my craft?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do folks in Gadgetzan ever ask for prayers, Jabbey?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Holy water of mostly reliable origin, Jabbey?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What does a warrior actually need from your stall, Jabbey?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do you sell anything for a hunter, Jabbey?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What's not honest about your goods, Jabbey?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Water, friend, by a long way, then cooling potions and anything that keeps the scorpids off you. After that, it's whatever the adventurers are hunting this week." } },
      choices = { { text = "Turtle shells?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Last month it was snake bits, this month it's turtle shells. Next month, who knows, but Jabbey'll have it." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Here and there, from traders and travelers and the port. Jabbey doesn't ask, and Jabbey doesn't tell, which is how business works in Gadgetzan." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Jabbey charges what the market bears, friend. If you call that overcharging, take it up with the market." } },
      choices = { { text = "Fair prices build loyal customers.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } }, { text = "A goblin should get what he can.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Jabbey doesn't sell that, but Jabbey might know a guy." } } },
}

P:NPC {
  key = "vizzklick", id = TODO_NPC("Vizzklick"), name = "Vizzklick",
  bible = "bibles/tanaris.md", role = "vendor", tier = "service",
  impression = {
    first = "Vizzklick sells cloth and tailoring supplies in Gadgetzan, and she thinks most adventurers dress, as though they lost a fight with a sandstorm.",
    third = "{name} met Vizzklick, the cloth vendor in Gadgetzan.",
  },
  greetings = {
    { id = "g_main", text = "Welcome, welcome! Oh dear, look at the state of your robes." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! And still in those clothes, I see." },
  },
  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Everything under the plate is cloth, friend, and everything under the cloth is you, slowly roasting. Half the Bruisers wear my linings under their mail now, and not one of them has fainted on duty since." } },
      choices = {
        { text = "Discipline means caring for your kit, even the parts nobody sees.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Comfort makes soldiers soft. I'll sweat and fight anyway.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Hides, now and then, though I'm a tailor and not a leatherworker, so mostly I get hunters asking me to mend what their own beasts chewed. Every one of them swears the beast is house-trained, and every sleeve tells me otherwise." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} away from my bolts, please, because I've lost a whole roll of silk to a curious nose before, and I don't sell it by the chewed yard." },
      },
      choices = {
        { text = "A beast should be trained to leave other folk's goods alone.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Beasts will be beasts. I let mine be what it is.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "It matters to the people you're praying over, dearie, because nobody wants to be blessed by someone who looks like a sandstorm's leftovers. A clean robe tells folk you've come to help, and in Gadgetzan that's half the battle won." } },
      choices = {
        { text = "A priest should look the part. People take comfort in it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The faithful won't care about my hem. Only the work matters.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "It doesn't, which is how I stay in business. The sand gets into the weave and grinds it thin from the inside, so I double-stitch everything and charge full price for the second stitch." } },
      choices = {
        { text = "Double stitches and proper seams. Discipline beats the desert every time.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Cloth that fights the wind loses. Wear less and move with it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They're fine for Stormwind, or Undercity, or wherever you come from, but the desert sand gets into every seam and eats them. A mage who looks like a scarecrow doesn't get much respect at the auction house, and that's free advice." } },
      choices = {
        { text = "A mage's worth is in the spell, not the robe.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Fine. Appearances matter, even out here.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let's discuss something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "It wears beautifully, and that's the trouble, because it hums when I hold it. I sell to warlocks the same as anyone, but I keep their cloth at the back of the shelf where it can't touch my good silk." } },
      choices = {
        { text = "Then your prejudice costs you good customers.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "That's sensible. Fel taints whatever it touches.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else, please.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Everybody cares, friend, whether they admit it or not, and a clean white robe in Gadgetzan says you've got water to spare for washing. Folks here trust a healer who looks like they've walked through the desert, though, so maybe dust is the right look for you after all." } },
      choices = {
        { text = "A priest's robe should be plain and kept clean. That's discipline.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The Light doesn't care about hems, Vizzklick, and neither do I.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I've asked three druids that question and got three different answers, and none of them made sense to a tailor. My theory is the robe goes somewhere nice and waits for you, which is more than I can say for most of my customers." } },
      choices = {
        { text = "Study it, Vizzklick. Magic clothing could make you rich.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Some mysteries are sacred. A tailor shouldn't pry.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "It can, dearie, because it's what's under the plate that matters in this heat. A good linen padding, washed every few days, and you'll stop smelling like a forge, which the Road Warrior would appreciate." } },
      choices = {
        { text = "Comfort keeps a fighter going. I'll take your advice.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Plate is meant to be endured, not made comfortable.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Cloth is cloth, dearie, and I don't ask what it's going to be used for. Dark wool for a cloak keeps the night cold out, and if it also keeps the Bruisers from seeing someone, that's hardly my stitching's fault." } },
      choices = {
        { text = "You should ask. Somebody pays for what's done in the dark.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Good. A tailor sells cloth, not judgment.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, with totems clattering off your belt and a hem the wind's been chewing on. I'd ask the spirits for better tailoring, if I were you." },
        { id = "h_default", key = true, text = "Vizzklick, cloth and thread and the finest tailoring supplies in Tanaris! Desert living is hard on clothes, and I keep half of Gadgetzan dressed, whether they like it or not." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, dearie, and in robes that have seen far too much sand! Mageweave holds up better in this heat, if you'd let me show you some proper cloth." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Felcloth, is that? No, don't tell me where it came from, dearie, because I've heard the stories about the satyrs, and I'd sooner not know." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, and in robes that have seen more sand than soap, dearie. Whether you pray to the Light or to something gloomier, I can at least make you look the part." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, in robes cut for cool stone halls! Your order makes a fine garment, I'll grant you, but its tailors never met a sandstorm, and it shows on every hem you're wearing." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, and wearing a padded gambeson under all that in Tanaris, by the look of the sweat! I could line that armor with something that breathes, and you'd stop cooking inside it." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! I can always tell, because you're the only folk who walk in with fur on your sleeves that isn't part of the design." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! You wear fur half the time and robes the other half, so I'm guessing you're hard on clothes, and I can help with that." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, dearie, and baking inside all that plate! Let me line it with something cool, or at least something that doesn't chafe, because I can see you walking stiff from here." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue, dearie, in leathers that creak in this heat! Let me show you some dark cloth that doesn't make a sound, because you'll hear your own sleeves before you hear the guards." },
      },
      again = { { id = "h_again", text = "What else, dearie?" }, { id = "h_again2", text = "Anything more? I've got a needle waiting." } },
      choices = {
        { text = "What happens to your robes when we take bear form?", next = "xdruid", when = { class = "DRUID" } },
        { text = "The wind here never rests. How does cloth hold up against it?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What's good cloth for the desert?", next = "b1_1" },
        { text = "Do you sew yourself?", next = "b2_1" },
        { text = "Do clothes really matter out here?", next = "s_1" },
        { text = "My robes are fine, Vizzklick.", next = "xmage", when = { class = "MAGE" } },
        { text = "Felcloth wears just as well as any other cloth.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Should a priest care how the robes look?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does it matter what a priest wears, Vizzklick?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Can cloth really do anything for someone in plate, Vizzklick?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do hunters bring you anything useful, Vizzklick?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Can cloth really help someone in plate, Vizzklick?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you really sell to anyone who asks, Vizzklick?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Farewell.", next = "END" },
      },
    },
    b1_1 = {
      lines = { { id = "b1_1_l", text = "Light, tight and pale, dearie, unless you enjoy roasting in your own boots. The sand gets into everything, so a good weave keeps it out." } },
      choices = { { text = "And mageweave?", next = "b1_2" }, { text = "Something else.", next = "BACK" } },
    },
    b1_2 = {
      lines = { { id = "b1_2_l", text = "Silk's lovely, but it tears on the rocks, so most folks out here settle for mageweave and pray." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    b2_1 = {
      lines = { { id = "b2_1_l", text = "Of course! Selling cloth without knowing how to sew is like selling water without knowing how to drink." } },
      choices = { { text = "Let me ask something else.", next = "BACK" } },
    },
    s_1 = {
      lines = { { id = "s_1_l", text = "Some say a fighter shouldn't care about looks. I say a well-dressed fighter frightens enemies twice as much." } },
      choices = { { text = "Looking sharp is half the battle.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } }, { text = "A blade matters more than a hem.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Not my line of work, dearie, but I'll keep an ear open." } } },
}
