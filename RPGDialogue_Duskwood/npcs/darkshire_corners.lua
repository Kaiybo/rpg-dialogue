-- Darkshire's corners: the Town Crier (who raises the alarm when the abomination walks the road),
-- Finbus Geargrind (gnome engineering trainer) and Malissa (poisons, behind a building).
-- Voice: bibles/darkshire_corners.md
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Town Crier
---------------------------------------------------------------------------
P:NPC {
  key = "darkshire_crier", id = TODO_NPC("Town Crier"), name = "Town Crier",
  bible = "bibles/darkshire_corners.md", role = "citizen", tier = "service",
  communities = { "darkshire" }, temper = { "loud", "nervous" }, values = { "dutiful", "community" },
  notices = { "class" },

  impression = {
    first = "He shouts the town to arms when the abomination walks the road.",
    third = "{name} met Darkshire's Town Crier, who rings the alarm when undead march on the town.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There's a face I'm glad to shout about! Come in close, friend, and you'll hear the news before the rest of Darkshire does." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "It's you. I'll cry the news to the whole town, friend, but I'll not waste my voice cheering your arrival." },
    { id = "g_default", text = "Hear ye, hear ye! Oh, it's only you. Forgive me, friend, I shout at everyone out of habit." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! No news is good news, they say, and today there's no news, so it's a good day by Darkshire standards." },
    { id = "g_stitches", when = { killed = { name = "Stitches" } }, text = "You were there when the abomination fell! I shouted myself hoarse that night, and I'd do it again, though I hope I don't have to." },
  },

  notice = {
    { id = "n_soldier", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "A fighter! If you hear me ring the bell, friend, run toward the center of town, not away from it. We'll need every sword." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Darkshire's Town Crier, friend, and my job is to tell the town what it needs to hear, which lately is mostly warnings. When something comes up the road, I'm the first to shout and the last to stop." },
        { id = "h_stitches", when = { killed = { name = "Stitches" } },
          text = "The abomination's gone, thanks to folk like you, and the night I don't have to shout 'Rouse to arms!' is a night I sleep like a babe." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Quiet so far tonight, friend, but the night's long, and my bell's never far from my hand." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm saving my voice, but I can spare a few words." },
        { id = "h_again2", text = "Ask away, friend, but quietly, if you would." },
      },
      choices = {
        { text = "What do you announce?", next = "announce" },
        { text = "What's this abomination?", next = "abomination" },
        { text = "Do people listen to you?", next = "listen" },
        { text = "Who keeps the Night Watch these days?", next = "watch" },
        { text = "You look like you haven't slept in a week.", next = "sleep" },
        { text = "Shout something from Ironforge for once.", next = "ironforge", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Do you announce the funerals as well?", next = "funerals", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Farewell, crier.", next = "END" },
      },
    },

    announce = {
      lines = { { id = "an_default", text = "Curfews, missing persons, the price of lamp oil, and every now and then a wedding, which I shout extra loud because it's good news. Mostly it's warnings, though, because Duskwood keeps giving me reasons." } },
      choices = {
        { text = "Who's gone missing lately?", next = "missing" },
        { text = "Why a curfew? The dead don't keep hours.", next = "curfew" },
        { text = "Something else.", next = "BACK" },
      },
    },
    missing = {
      lines = { { id = "mi_default", text = "A woodcutter out past Brightwood Grove, a farmhand from the Rotting Orchard, and a lad who swore he'd see Raven Hill for himself. I shout their names every morning, friend, and every morning nobody answers." } },
      choices = {
        { text = "Does anyone ever come back?", next = "mi_back" },
        { text = "I'll keep an eye out on the roads.", next = "BACK", fx = { affinity = 1 },
          reply = "Bless you for it. If you find them, or find what's left, tell the Watch first and me second." },
      },
    },
    mi_back = {
      lines = { { id = "mib_default", text = "Some do, ragged and wide-eyed, and the first thing they ask for is a lamp. Sven Yorgen's the one who still won't come in, out in his camp by the ruined farm, and I've given up shouting at him to try." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "sven_yorgen" } } } },
    },
    curfew = {
      lines = { { id = "cu_default", text = "No, but the worgen do, and they come out with the dark like it's a dinner bell. The council set the curfew after the Brightwood went quiet, and Councilman Millstipe asks me to read it twice a day as if repeating it makes the wolves listen." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "worgen" } } } },
    },

    watch = {
      lines = { { id = "wa_default", text = "Commander Althea Ebonlocke runs the Night Watch, and her father Lord Ello sits on the council, so between them they've got the town and the road both in hand. Most of the Watch are farmers' sons with a borrowed spear, mind you, and they know it." } },
      choices = {
        { text = "Farmers with spears won't hold against the dead.", next = "wa_odds" },
        { text = "What do the Watch need most?", next = "wa_need" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wa_odds = {
      lines = { { id = "wao_default", text = "They've held so far, friend, though every time the abomination comes there are fewer of them to hold. The commander says courage is cheaper than steel, which I suppose is true, since Darkshire can't afford much of either." } },
      choices = {
        { text = "Courage won't stop a corpse. Get them proper soldiers.", next = "BACK", fx = { align = { order = 1 } },
          reply = "You'd have to ask Stormwind for those, and Stormwind hasn't answered a letter of ours in years." },
        { text = "Courage is enough. Townsfolk defend their own best.", next = "BACK", fx = { align = { order = -1 } },
          reply = "That's what I tell them when I ring the bell, and I almost believe it myself." },
        { text = "Something else.", next = "BACK" },
      },
    },
    wa_need = {
      lines = { { id = "wan_default", text = "Lamp oil, arrows, and someone willing to walk the road to the Raven Hill cemetery at night. The commander posts the work on her board, and Watcher Backus will tell you plainly whether it's worth your neck." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } } },
    },

    sleep = {
      lines = { { id = "sl_default", text = "Ha! You've a sharp eye, friend, and you're right. I sleep with one boot on and the bell beside my pillow, because the night I take both boots off is the night the dead come knocking." } },
      choices = {
        { text = "Has anyone offered to take a night shift?", next = "sl_shift" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sl_shift = {
      lines = { { id = "sls_default", text = "Tavernkeep Smitts offered once, and he's got the lungs for it, but he rang the bell for a stray dog and half the town turned out in their nightshirts. Nobody's offered since, and I can't say I blame them." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    ironforge = {
      lines = { { id = "if_default", text = "I would if anyone sent me some! The only news from Ironforge that reaches Darkshire is the price of their ale and the odd gnome looking for a bench, like our Finbus. Bring me something cheerful from the mountain and I'll shout it from the well." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    funerals = {
      lines = { { id = "fu_default", text = "I do, and I hate it, {class}. I keep a softer voice for those, and I read the name slow so the families can hear it properly, because some days it's the last time anyone says it aloud." } },
      choices = {
        { text = "The Light keeps every name. You do it honor.", next = "BACK", fx = { affinity = 1 },
          reply = "Thank you, {class}. I'll remember that the next time my voice cracks." },
        { text = "Something else.", next = "BACK" },
      },
    },

    abomination = {
      big = true,
      lines = { { id = "ab_default", text = "A great stitched thing of corpses that marches on the town some nights, overrunning the Night Watch camps on the road. When it comes I shout 'Rouse to arms, citizens of Darkshire!' and everybody who can hold a weapon gathers in the center of town." } },
      choices = {
        { text = "When it comes, I'll stand with the town.", next = "ab_more", fx = { align = { honor = 1 } } },
        { text = "Let the Watch handle it. That's their job.", next = "ab_more", fx = { align = { honor = -1 } } },
        { text = "Who made such a thing?", next = "ab_more" },
      },
    },
    ab_more = {
      lines = { { id = "abm_default", text = "Nobody knows for certain, and nobody wants to say what they suspect. Somebody out there in the woods is sewing the dead together, friend, and the thought of it keeps me up more than the shouting does." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    listen = {
      lines = { { id = "li_default", text = "They listen when I shout about the dead, friend, and ignore me when I shout about the curfew. I've stopped taking it personally, mostly." } },
      choices = {
        { text = "I'll listen.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Everything that's worth shouting about in Darkshire, friend." } },
    background = { { id = "tp_bg", text = "Born with a loud voice and no talent for anything quieter." } },
    advice = { { id = "tp_ad", text = "When you hear the bell, don't stop to ask why. Come running." } },
    night_watch = { { id = "tp_watch", text = "Brave lads, and the first to fall when the abomination comes." } },
    worgen = { { id = "tp_worgen", text = "That's why there's a curfew, friend, and why I read it twice a day." } },
    sven_yorgen = { { id = "tp_sven", text = "Stubborn as an old stump, out in his camp. I've stopped shouting at him to come in." } },
    _none = { { id = "tp_none", text = "No announcement on that, friend, I'm afraid." } },
  },
}

---------------------------------------------------------------------------
-- Finbus Geargrind
---------------------------------------------------------------------------
P:NPC {
  key = "finbus", id = TODO_NPC("Finbus Geargrind"), name = "Finbus Geargrind",
  title = "Engineering Trainer",
  bible = "bibles/darkshire_corners.md", role = "trainer", tier = "service",
  communities = { "darkshire" }, temper = { "chatty", "harried" }, values = { "craft", "home" },
  notices = { "craft", "race" },

  impression = {
    first = "Darkshire was the first town after Gnomeregan to allow him a workbench.",
    third = "{name} met Finbus Geargrind, the gnome engineering trainer of Darkshire.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "My favourite student, back at the bench! Sit down, sit down, there's a gear train here that's been dying to meet you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. I'll teach you, since that's the job, but stand on the far side of the bench, please, where the shrapnel goes." },
    { id = "g_default", text = "I'm never too busy to speak to a stranger! Almost never, anyway... mind the solder, it's still warm." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, back again! Come in, come in, nothing's on fire at the moment." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Oh, splendid, somebody to talk to about torque ratios. Herble only wants to talk about prices." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Out here, in Duskwood! Tell me, were you a Gnomeregan gnome or an Ironforge gnome? I was Gnomeregan, third level, east workshops." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Finbus Geargrind, engineering trainer! I teach the craft to anyone with steady hands and a reasonable fear of explosions. When you outgrow me, and you will, you'll want Springspindle Fizzlegear in Ironforge." },
        { id = "h_eng", when = { profession = "Engineering" },
          text = "Back for more lessons? Splendid! You're getting good, I can tell, you've stopped flinching at the sparks." },
      },
      again = {
        { id = "h_again", text = "What else? I'll keep tinkering while we talk, if you don't mind." },
        { id = "h_again2", text = "Go on, I'm listening, at about sixty percent capacity, with the rest of me on this lens." },
      },
      choices = {
        { text = "A good engineer shows the guild every flaw in a design.", next = "BACK", reply = "Exactly right! Half the accidents in Gnomeregan came from somebody hiding a cracked valve, and I was standing next to most of them.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "If the gadget works, nobody needs to know how it nearly didn't.", next = "BACK", reply = "Hmm, that's how the third-level east workshop got its scorch marks, and its new ceiling, and its very short memorial plaque.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Train me.", next = "BUSINESS", when = { profession = "Engineering" } },
        { text = "Why Darkshire, of all places?", next = "why" },
        { text = "Do you know Viktori's star device?", next = "viktori" },
        { text = "What do you build for the town?", next = "build" },
        { text = "Your workbench has scorch marks on every inch.", next = "scorch" },
        { text = "I was Gnomeregan too. Which workshops did you say?", next = "gnome_home", when = { race = "Gnome" } },
        { text = "Can you fit a better scope to my gun?", next = "scope", when = { class = "HUNTER" } },
        { text = "Farewell, Finbus.", next = "END" },
      },
    },

    build = {
      lines = { { id = "bu_default", text = "Lamps, mostly, the long-burning kind that don't gutter in the damp, because in Duskwood a lamp that goes out is a door left open. After that, wagon axles for the road to Westfall and the odd snare for whatever's been at Mabel's chickens." } },
      choices = {
        { text = "Tell me about these lamps.", next = "bu_lamps" },
        { text = "Do snares hold a worgen?", next = "bu_snare" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bu_lamps = {
      lines = { { id = "bul_default", text = "A doubled wick, a reflector of polished tin, and a little glass chimney so the rain can't drown it, which is roughly eleven percent brighter than the old lanterns and forty percent less likely to set your hat on fire. The Night Watch hang them on the road to the camps." } },
      choices = {
        { text = "Who pays for all that tin?", next = "bu_pay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bu_pay = {
      lines = { { id = "bup_default", text = "The council, eventually, after Councilman Millstipe has read the invoice three times and sighed at every line. I'd do it for nothing if I could, but tin isn't free, and Herble certainly isn't." } },
      choices = {
        { text = "Then charge them properly. Good work deserves its price.", next = "BACK", fx = { align = { order = 1 } },
          reply = "You sound like Herble! He'd adore you, and then he'd sell you something." },
        { text = "Give the poor folk lamps for free and bill the rich.", next = "BACK", fx = { align = { order = -1 } },
          reply = "Oh, I like that, though I suspect the rich would notice eventually." },
        { text = "Something else.", next = "BACK" },
      },
    },
    bu_snare = {
      lines = { { id = "bus_default", text = "Not for long, I'm sorry to say. A worgen chewed through my best spring-loaded snare in about the time it takes to say 'spring-loaded snare', so now I build them for the smaller things and leave the wolves to the Watch's arrows." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "worgen" } } } },
    },

    scorch = {
      lines = { { id = "sc_default", text = "Every scorch has a story, friend, and most of them end with me saying 'well, that's data.' That big black one on the corner was a flare I was making for the Watch, which worked beautifully, just a bit sooner than planned." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    gnome_home = {
      lines = { { id = "gh_default", text = "Third level, east workshops, near the pressure valves that always whistled in the winter! Did you get out in the first wave or the second? I was the second, and I left a half-finished gyroscope on my bench that I still think about." } },
      choices = {
        { text = "First wave. I barely had time to grab my tools.", next = "BACK", fx = { affinity = 1 },
          reply = "Then you were luckier than most, and I'm glad of it. Tinker Town must feel cramped, but it's home for now." },
        { text = "I'd rather not talk about it.", next = "BACK",
          reply = "No, no, of course not. Forgive an old exile his chatter." },
      },
    },

    scope = {
      lines = { { id = "sco_default", text = "A scope! Now that's proper work. Any engineer can fit one once they've learned the craft, and the better the glass, the farther you'll see, though in Duskwood fog you'll mostly see more fog, I'm afraid." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    why = {
      big = true,
      lines = { { id = "wh_default", text = "After Gnomeregan fell, I wandered, and Darkshire was the first place that let me set up a bench without asking questions. The town needs engineers, too: lamps, traps, wagon axles, all the little things that keep the dark back." } },
      choices = {
        { text = "That's good work, and you're helping people who need it.", next = "wh_more", fx = { align = { light = 1 } } },
        { text = "You should go back and fight for Gnomeregan.", next = "wh_more", fx = { align = { light = -1 } } },
        { text = "Do you miss Gnomeregan?", next = "wh_more" },
      },
    },
    wh_more = {
      lines = { { id = "whm_default", text = "Every day, friend, every single day. But I can't fight radiation with a wrench, and here I can fight the dark with lamps, and that will have to do until the High Tinker has a plan." } },
      choices = {
        { text = "What is the High Tinker planning?", next = "wh_tinker" },
        { text = "Something else.", next = "BACK", fx = { learn = { "gnomeregan" } } },
      },
    },
    wh_tinker = {
      lines = { { id = "wht_default", text = "Mekkatorque doesn't tell a trainer in Darkshire his plans, friend, but the letters from Tinker Town say he's measuring, counting and building, which is what gnomes do when they're too angry to cry. One day we'll go back and throw Thermaplugg out on his ear." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "gnomeregan" } } } },
    },

    viktori = {
      lines = { { id = "vi_default", text = "The star-viewing contraption? He wants a bronze tube and a looking glass and who knows what else, and he's asked me six times whether it will see through fog. It won't, I keep telling him, but he keeps hoping." } },
      choices = {
        { text = "Herble sells bronze tubes too.", next = "vi_herble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vi_herble = {
      lines = { { id = "vih_default", text = "He does, and at a price that would make a goblin blush. We're friends, of course, but I wouldn't buy a bolt from him without counting the threads first." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Engineering, lamps, and every bolt in Darkshire." } },
    background = { { id = "tp_bg", text = "Gnomeregan, third level, east workshops, before everything went green." } },
    advice = { { id = "tp_ad", text = "Always keep a spare fuse. And a spare eyebrow, if you can manage it." } },
    gnomeregan = { { id = "tp_gnome", text = "Home, once. I still dream about the hum of it." } },
    worgen = { { id = "tp_worgen", text = "They chewed through my best snare, so I'll leave them to the Watch's arrows." } },
    herble = { { id = "tp_herble", text = "A dear friend whose prices would make a goblin blush." } },
    _none = { { id = "tp_none", text = "Oh, that's not my field, I'm afraid, though I could build something to find out." } },
  },
}

---------------------------------------------------------------------------
-- Malissa
---------------------------------------------------------------------------
P:NPC {
  key = "malissa", id = TODO_NPC("Malissa"), name = "Malissa",
  title = "Poison Supplies",
  bible = "bibles/darkshire_corners.md", role = "vendor", tier = "service",
  communities = { "darkshire" }, temper = { "cool", "discreet" }, values = { "cunning", "practical" },
  notices = { "class", "stealth" },

  impression = {
    first = "She is polite and never asks what anything is for.",
    third = "{name} met Malissa, who sells poison supplies from behind a building in Darkshire.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you. Come round into the shadow, friend; a customer who knows how to be discreet is always welcome at my corner." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Buy what you came for and go, and do it without lingering in the lamplight on my account." },
    { id = "g_default", text = "Quietly, please. The Watch knows I'm here, but they prefer not to be reminded." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Vials, or something to put in them?" },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Ah, one of the trade. Come around the corner where the lamplight doesn't reach." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "I heard you coming, friend. The cobbles back here are loose on purpose." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Malissa. I sell vials, leaded and crystal, and the reagents to fill them, and I don't ask what they're for. In Duskwood, a blade that bites twice is what gets you home before dark." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "A rogue, and a careful one by the look of you. Take what you need, and if anyone asks, you came back here to get out of the wind." },
        { id = "h_priest", when = { class = { "PRIEST", "PALADIN" } },
          text = "A holy one, back here? Lost, I hope. If you're not, I'll trust you won't mention me to the commander." },
      },
      again = {
        { id = "h_again", text = "Something more? Lean into the shadow and say it soft; the lamplight carries gossip." },
        { id = "h_again2", text = "Ask, but softly." },
      },
      choices = {
        { text = "Even with poison, you should look your enemy in the eye.", next = "BACK", reply = "Some do, I'm told, and most of them are buried on Raven Hill. I only sell the vials; what you do with them is between you and the Light.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Poison is just a quicker way to win an unfair fight.", next = "BACK", reply = "That's the Duskwood way of seeing it, and it's why the Watch pretends not to see me. Keep your voice down when you say it, though.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Why sell back here?", next = "why" },
        { text = "Do poisons work on the undead?", next = "undead" },
        { text = "Who taught you the trade?", next = "teacher" },
        { text = "Who buys from you, besides rogues?", next = "buyers" },
        { text = "Teach me something the trainers in Stormwind don't.", next = "trick", when = { class = "ROGUE" } },
        { text = "You must find me a strange customer.", next = "strange", when = { race = { "Dwarf", "Gnome", "NightElf" } } },
        { text = "You keep your old teacher's scales?", next = "e3_scales" },
        { text = "Goodbye, Malissa.", next = "END" },
      },
    },

    why = {
      big = true,
      lines = { { id = "wh_default", text = "Because the commander tolerates me and the councilman doesn't, and a corner behind a building keeps everyone's conscience clean. Poison is a coward's weapon, some say, and I've noticed the ones who say it rarely come back from Raven Hill." } },
      choices = {
        { text = "Poison is dishonorable. I'd rather fight fair.", next = "BACK", reply = "Then fight fair, and I hope Duskwood returns the courtesy. Should you change your mind after a night on the Raven Hill road, my corner will still be here.", fx = { align = { honor = 1 } } },
        { text = "Fair fights are for people who like losing.", next = "BACK", reply = "You'd be surprised how few people in Darkshire will say that aloud, though plenty of them buy as if they believed it. Mind the vials; they don't care whose hands they're in.", fx = { align = { honor = -1 } } },
        { text = "Why does the councilman object?", next = "wh_council" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wh_council = {
      lines = { { id = "whc_default", text = "Councilman Millstipe thinks a town that sells poison will be poisoned, which is a pretty sentiment from a man who's never had a worgen at his window. Commander Ebonlocke has buried enough of her Watch to be less particular." } },
      choices = {
        { text = "Does the commander buy from you herself?", next = "wh_commander" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wh_commander = {
      lines = { { id = "whcm_default", text = "That's a question I won't answer, friend, and you'll notice I didn't say no. Let's leave it that some of the Watch's arrows bite harder than they look." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } } },
    },

    teacher = {
      lines = { { id = "te_default", text = "A man called himself an apothecary and kept a shop on the square, back before the Brightwood went dark. He taught me to measure, to label, and never to breathe over an open vial, and then one night he went out to gather nightshade and didn't come back." } },
      choices = {
        { text = "Worgen?", next = "te_fate" },
        { text = "I'm sorry. That's a hard way to lose a teacher.", next = "BACK", fx = { affinity = 1 },
          reply = "It's Duskwood. Everyone here has a story that ends the same way. Thank you, though." },
      },
    },
    te_fate = {
      lines = { { id = "tef_default", text = "That's what the Watch wrote in their book, and I've never found a reason to argue with it. I still keep his scales, though, and I weigh every dose on them, so in a way he's still minding the shop." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    buyers = {
      lines = { { id = "bu_default", text = "Hunters who want their arrows to finish what they start, farmers with rats in the grain, and now and then a lady from Stormwind who says she's only curious. I sell to all of them and remember none of them, which is the whole of my reputation." } },
      choices = {
        { text = "The Stormwind ladies worry me.", next = "BACK", fx = { trait = { skeptical = 1 } },
          reply = "They should, friend, but they're not my concern once they've paid." },
        { text = "Something else.", next = "BACK" },
      },
    },

    trick = {
      lines = { { id = "tr_default", text = "Coat the blade thin and often rather than thick and once, because a heavy coat flakes off in the first parry. And keep your vials in a padded belt; I've seen a rogue break one against his own hip and spend the evening regretting it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { practical = 1 } } } },
    },

    strange = {
      lines = { { id = "st_default", text = "Not strange, just far from home. Your folk don't come to Duskwood unless the Alliance sends them or the coin's good, and either way you'll want something in a vial before you go into those woods." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    undead = {
      lines = { { id = "un_default", text = "Not as well as on the living, since there's not much blood left to carry it. For the walking dead, fire and a heavy mace; for the worgen, though, a good poison slows them down nicely." } },
      choices = {
        { text = "Good to know.", next = "BACK", fx = { trait = { practical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    e3_scales = {
      lines = {
        { id = "e3_scales_l0", text = "Brass, with a feather weight that's lighter than a sigh, and I weigh every dose on them because he did. He used to say a poison is a medicine measured wrong, and a medicine is a poison measured right." },
      },
      choices = {
        { text = "Do you sell medicines too?", next = "e3_scales2" },
        { text = "A dangerous saying.", next = "BACK" },
      },
    },
    e3_scales2 = {
      lines = {
        { id = "e3_scales2_l0", text = "Now and then, quietly, to the Watch's wives for their children's fevers, at the same weight and half the price. The priest in town would be shocked to learn how much of Darkshire's healing comes from my corner." },
        { id = "e3_scales2_l1", when = { class = { "PRIEST", "PALADIN" } }, text = "Now and then, quietly, to the Watch's wives for their children's fevers. Your sort might be shocked to hear how much of Darkshire's healing comes from a poisoner's corner, but the Light and I share the work, I think." },
      },
      choices = {
        { text = "Your secret's safe. Something else.", next = "BACK" },
        { text = "The priest should know.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Vials, venoms, and who in town buys them. The last I keep to myself." } },
    background = { { id = "tp_bg", text = "Darkshire born. I learned the trade from a man who's no longer with us." } },
    advice = { { id = "tp_ad", text = "Wash your hands before you eat. Every time." } },
    worgen = { { id = "tp_worgen", text = "They bleed like anything else, and poison follows the blood." } },
    millstipe = { { id = "tp_mill", text = "The councilman thinks a town that sells poison will be poisoned. He's never had a worgen at his window." } },
    night_watch = { { id = "tp_watch", text = "Some of their arrows bite harder than they look. I'll say no more." } },
    _none = { { id = "tp_none", text = "I wouldn't know, and I wouldn't say." } },
  },
}
