-- The wastes: Kum'isha the Collector near the Rise of the Defiler, the bloodmages Drazial and Lynnore by the northern pass, and Daio the Decrepit in the Tainted Scar. Voice: bibles/blastedlands.md
local P = RPGDialogueAPI:Pack("rpgd.blastedlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "kumisha", id = TODO_NPC("Kum'isha the Collector"), name = "Kum'isha the Collector",
  bible = "bibles/blastedlands.md", role = "questgiver", tier = "major",
  communities = { "blasted_lands" }, temper = { "sharp", "proud" }, values = { "proud", "greedy" },
  notices = { "race", "money" },

  impression = {
    first = "Kum'isha the Collector is a broken draenei who sneers that every race smells of greed, then sends you looking for crystals. Under the contempt there is a homesickness so old it has gone hard.",
    third = "{name} met Kum'isha the Collector, a Lost One who searches the Blasted Lands for draenethyst to carry him home.",
  },

  greetings = {
    { id = "g_default", text = "Another one, come to stare at the broken draenei. Stare, then, and be quick about it." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and you still smell of it. They always do." },
    { id = "g_sphere", when = { questDone = TODO_QUEST("To Serve Kum'isha") }, text = "You. The one who brought Kum'isha the sphere. I have not decided yet whether to despise you less." },
  },

  notice = {
    { id = "n_rich", cat = "money", when = { money = { min = 1000000 } },
      text = "Your purse is heavy, and you carry it the way they all do, as if it were part of your body. I could smell it before I could see you." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc. Your people's axes knew mine long before either of us set foot on this world, and I have not forgotten, whatever your warchief tells you now." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome, all gears and greed in a very small parcel. Do not touch anything." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I have watched orcs come through that gate with axes, and humans meet them with swords, and every one of them was certain he fought for something noble. The fragments you bring me do not care which of you held the blade, and neither, I find, do I." } },
      choices = {
        { text = "I fight for those behind me, not for plunder.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Every war has its spoils. I won't pretend otherwise.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "We did, though not as you do, and I will not speak of the land we hunted. Here I hunt nothing but fragments in the dust, and the beasts of this place keep their distance from me, which is wise of them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "{pet} watches me with more honesty than you do, hunter. A beast wants its supper and makes no speeches about it, and I find I prefer that." },
      },
      choices = {
        { text = "I hunt to eat and nothing more. There's no greed in that.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I hunt for pelts and coin. Call it greed if you like.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "Because someone must remember what was here before. Every root and stone tells me something. Bring me what you find, and I will tell you what it once was, before the Portal took it." } },
      choices = {
        { text = "Thank you. Let me ask something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Draenethyst holds light the way water holds the shape of a cup, and your kind would burn it for a spell and forget it by morning. To me each one is a memory of home, and I would not trade one for all your learning." } },
      choices = {
        { text = "Then they should stay with you, not in a spellbook.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Memories won't help you. Power might.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Never mind that for now.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because a thief at least knows what a thing is worth, and does not throw it away. Bring me fragments, rogue, and we will both pretend that neither of us would steal from the other." } },
      choices = {
        { text = "I'd never steal from you, Kum'isha.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "We'll both pretend. That's an honest deal.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I knew the orcs when they were only shamans and hunters, before their warlocks taught them fel and before they turned it on us. You tell me the earth and wind answer you, but I remember when the elements of Draenor answered too, and they could not stop what came after." } },
      choices = {
        { text = "The Horde has turned from the fel. We remember our path.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "What was done is done, Kum'isha. I owe you nothing.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The orc shamans spoke to the elements on my world once, before they found darker teachers, and my people paid for that lesson." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, and you smell of iron and greed together, as all your kind do. You would cut down anything that stood between you and a prize." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. You carry the stink of greed like the rest, though a hunter's greed is at least the honest kind, and ends when the belly is full." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A thief, yes. You smell of greed more strongly than any of them, though at least you do not pretend otherwise." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. You smell of borrowed power, and of greed for more of it, like all the rest." },
        { id = "h_druidx", when = { class = "DRUID" },
          text = "A druid. You smell of earth that still lives. That is rare here, and precious to me." },
        { id = "h_default", key = true,
          text = "I have heard orcs call the stench of humans sickening, and humans call the stench of orcs wretched, yet to me every race of these lands gives off the same odour: the foul, dizzying scent of greed. I am Kum'isha, and I collect." },
        { id = "h_fragments", when = { questActive = TODO_QUEST("Everything Counts In Large Amounts") },
          text = "Fragments, flawed and cloudy, will not take Kum'isha home, but they may yet serve my people in other ways. Bring what you find, and spare me the drooling." },
        { id = "h_sphere_wait", when = { questActive = TODO_QUEST("To Serve Kum'isha") },
          text = "You want the flawless sphere, {race}? Draenei have spent whole lives searching for just one, and you think you will stumble on it on an afternoon's walk. We shall see." },
        { id = "h_sphere_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("To Serve Kum'isha"), days = 7 } },
          text = "I hold it still, the sphere you brought, and I have not slept. Perhaps a rift can be opened now; perhaps my people will go home after all this." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "At night the Portal is only a shadow against the stars, and I can almost pretend it leads somewhere I would want to go." },
      },
      again = {
        { id = "h_again", text = "More? Ask, then. I have walked these wastes long enough to have patience, if not manners." },
        { id = "h_again2", text = "You are still here. Speak, {race}, or go and dig." },
      },
      choices = {
        { text = "Why do you collect things from this blasted place?", next = "druid_talk", when = { class = "DRUID" } },
        { text = "Who are you, really?", next = "who" },
        { text = "What do you collect?", next = "draenethyst" },
        { text = "Why do you say everyone smells of greed?", next = "greed" },
        { text = "What do you give for the fragments?", next = "junk" },
        { text = "The Light could mend what was done to you.", next = "priest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Orcs came through that Portal too, draenei.", next = "orc", when = { race = "Orc" } },
        { text = "I deal in fel, collector. Does it smell of greed?", next = "k_lock", when = { class = "WARLOCK" } },
        { text = "My people dig crystals too, Kum'isha.", next = "k_dwarf", when = { race = "Dwarf" } },
        { text = "My people hoard nothing, Kum'isha.", next = "k_tauren", when = { race = "Tauren" } },
        { text = "What do your crystals have to do with magic?", next = "xmage", when = { class = "MAGE" } },
        { text = "If I'm greedy, why trust me with your crystals?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do you think every warrior fights for greed, Kum'isha?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Did your people hunt, before you came here?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Did you know shamans on your world, Kum'isha?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I'll keep my eyes open for crystals.", next = "END", fx = { affinity = 1 } },
      },
    },

    who = {
      lines = {
        { id = "w_default", text = "A draenei, once, as you would know if you had ever seen one whole. Now one of the broken ones, the lost, stranded on the wrong side of a door that will not open, with nothing but red dust and greedy strangers for company." },
      },
      choices = {
        { text = "Where is home?", next = "who_home" },
        { text = "How did you get here?", next = "who_how" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_home = {
      big = true,
      lines = { { id = "wh_default", fx = { learn = { "dark_portal" } },
        text = "Beyond that door, on the world the orcs called Draenor, if any of it still stands. It was greed that took me from my home, {race}, and it will be greed that takes me back." } },
      choices = {
        { text = "Whose greed took you from home?", tag = "Persuade", next = "greed_own",
          check = { pass = { any = { { disposition = { min = 65 } }, { questDone = TODO_QUEST("To Serve Kum'isha") }, { trait = "kind" } } } },
          fail = { next = "who_sneer", fx = { affinity = -1 } } },
        { text = "I hope you find your way back.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Some doors are better left shut.", next = "BACK", fx = { affinity = -1, trait = { cautious = 1 } } },
      },
    },
    who_how = {
      lines = { { id = "wo_default", text = "That is not a tale I tell to strangers in the dust. Kum'isha is here, Kum'isha cannot leave, and Kum'isha does not care to remember the road between." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    greed_own = {
      big = true,
      lines = {
        { id = "go_default", text = "It was my own greed, {race}. Before I smelled greed on every race of this world, I smelled it on myself every morning, and I followed it further than I should have, and it left me here. Now you know why I hate the smell so." },
      },
      choices = {
        { text = "Then you know it can be overcome.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "You still collect. Has anything changed?", next = "greed_still" },
      },
    },
    greed_still = {
      lines = { { id = "gs_default", text = "Everything and nothing. I collect so I can leave, which is the one greed I permit myself; whether that makes me better or only more honest, I leave for wiser heads." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    who_sneer = {
      lines = { { id = "ws_default", text = "You would like that, would you not, a sad story to carry home with the loot. Kum'isha gives you crystals to find, not his life." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    draenethyst = {
      lines = {
        { id = "d_default", fx = { learn = { "draenethyst" } },
          text = "Draenethyst, the crystal of my people, scattered across these lands in shards. The flawed fragments are common enough, but a flawless sphere is among the rarest things on this world, and with enough of them a rift might be opened." },
      },
      choices = {
        { text = "Where would I find a sphere?", next = "draenethyst_where" },
        { text = "A rift? To where?", next = "who_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    draenethyst_where = {
      lines = { { id = "dw_default", text = "Anywhere and nowhere: in the belly of a beast, in an ogre's pouch, in the hoard of the black drake that circles the Portal. Draenei have searched lifetimes for a single sphere and met horrible ends with their purpose unfulfilled." } },
      choices = {
        { text = "Then I'll be careful.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "I'll find one.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },

    greed = {
      big = true,
      lines = { { id = "gr_default", text = "Do you doubt it? Look at what runs your life, {race}: the gold you count, the land you fight over, the trinkets you strip from the dead. All of it is runoff from the greed that decides your every step." } },
      choices = {
        { text = "Is nobody free of it, then?", next = "greed_others" },
        { text = "Not everyone. Some fight for others.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "You're right. Coin decides everything.", next = "BACK", fx = { align = { honor = -1 }, trait = { greedy = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    greed_others = {
      lines = { { id = "go2_default", text = "Perhaps, somewhere, and yet you came to the broken draenei because you heard he pays. Bring me a sphere for nothing, then, and I will believe you." } },
      choices = {
        { text = "Fair point.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    junk = {
      lines = { { id = "j_default", text = "Clothes, mostly, and odds and ends I have gathered from the dead out here, and you will snatch them up like a starving dog. Bring a fragment, take your junk, and do not thank me." } },
      choices = {
        { text = "That's fair trade.", next = "BACK", fx = { trait = { greedy = 1 } } },
        { text = "I don't need a reward.", next = "BACK", fx = { affinity = 1, trait = { generous = 1 } } },
      },
    },

    priest = {
      lines = { { id = "pr_default", text = "Mend? You think a prayer will make me whole, little priest, when nothing short of home could. Keep your Light for those who still have a shape worth saving." } },
      choices = {
        { text = "Every shape is worth saving.", next = "BACK", fx = { align = { light = 2 }, affinity = 1 } },
        { text = "Perhaps you're right. Some things stay broken.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orc = {
      lines = { { id = "or_default", text = "They did, and before that they came to my people with axes, and before that they were something else entirely. You have changed, I am told; so have I, and neither of us for the better." } },
      choices = {
        { text = "My people are free now. We've changed.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "What's done is done. I won't apologise.", next = "BACK", fx = { align = { honor = -1 }, affinity = -2 } },
      },
    },
    k_lock = {
      big = true,
      lines = {
        { id = "xlk_default", text = "It smells of worse. Kum'isha knows that stink, warlock, from a long time ago, and the ones who carried it then wanted the same thing as you: more. Take your fragments and keep your little servant downwind of me." },
      },
      choices = {
        { text = "I wanted power. I'm not ashamed of it.", next = "BACK", fx = { align = { light = -1 }, affinity = -1 } },
        { text = "I carry it so others don't have to.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Who carried it before?", next = "who_how" },
      },
    },
    k_dwarf = {
      lines = {
        { id = "xdw_default", text = "Dwarf. Yes, your people dig, and they dig for the same reason as everyone in these lands: to hold the shiny thing and say it is theirs. Kum'isha's crystals are not shiny things to Kum'isha, so do not compare." },
      },
      choices = {
        { text = "Then tell me what they are to you.", next = "draenethyst" },
        { text = "Fair. I won't compare.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    k_tauren = {
      lines = {
        { id = "xta_default", text = "Hm. You smell less of it than most, tauren, I will grant you that, and more of grass and smoke. But you came to this dust for something, and Kum'isha wonders what." },
      },
      choices = {
        { text = "For the fragments. I won't pretend otherwise.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Nothing. I was only passing through.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Kum'isha has walked these wastes for a long time and listened to every fool who passed. Choose, then, and I will tell you what I have heard." } },
    background = {
      { id = "tp_bg", text = "Kum'isha the Collector, broken, lost, and far from home. That is all a stranger needs.", next = "who" },
      { id = "tp_bg2", text = "I was something once. Now I collect, and wait." },
    },
    advice = { { id = "tp_ad", text = "Count your coins less and watch the sky more, {race}. The drake over the Portal does not care how rich you are." } },
    draenethyst = { { id = "tp_draenethyst", text = "The crystal of my people. Find it, bring it, and take your junk.", next = "draenethyst" } },
    dark_portal = { { id = "tp_portal", text = "A door, and on the far side of it, everything I have lost. I look at it every day." } },
    burning_legion = { { id = "tp_legion", text = "Older than greed, and hungrier. Even I do not walk into the Scar." } },
    _none = { { id = "tp_none", text = "Kum'isha does not care, {race}, so bring crystals or leave." } },
  },
}

P:NPC {
  key = "drazial", id = TODO_NPC("Bloodmage Drazial"), name = "Bloodmage Drazial",
  bible = "bibles/blastedlands.md", role = "questgiver", tier = "quest",
  communities = { "blasted_lands" }, temper = { "eager" }, values = { "curious", "ambitious" },
  notices = { "class", "pet" },

  impression = {
    first = "Bloodmage Drazial studies the beasts of the Blasted Lands with the delight of a man unpacking presents, and he looks at people the same way. He called me a test subject and meant it as a compliment.",
    third = "{name} met Bloodmage Drazial, an elven bloodmage studying the strength of the Blasted Lands' beasts.",
  },

  greetings = {
    { id = "g_default", text = "Ah, a fresh specimen! Forgive me; I mean a fresh visitor, of course." },
    { id = "g_back", when = { metBefore = true }, text = "My favourite test subject returns. How is the constitution?" },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior! Look at the shoulders on you; my sister may keep her basilisk brains, I'd sooner study you." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "beast" } },
      text = "Your beast hasn't been changed by the Portal yet, which makes it a perfect control for my study. Don't let it eat anything out here." },
  },

  start = "hello",
  nodes = {
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Everything is, in the end, if you understand it well enough, though I'll grant your sort have been very poor at explaining it. The boars here heal from wounds that would kill an ogre, and I can't help wondering whether some trace of the Light touched them too." } },
      choices = {
        { text = "The Light isn't a reagent. It can't be bottled.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Perhaps it can. Study it, and share what you learn.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because the blood is where the secrets are, of course, the strength and speed of these beasts written in it like ink on a page. My sister reads the mind and I read the body, and between us we'll have the whole book before long, if nobody gets eaten." } },
      choices = {
        { text = "Some secrets should stay in the blood.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Read every page. Knowledge has no forbidden chapters.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "On to other things.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I'm nearly certain of it, because the beasts here drink water that's run past the Portal and eat grass that's grown in its shadow. If the fel can do that to a boar, imagine what it might do in a properly measured dose, which is exactly what I intend to find out." } },
      choices = {
        { text = "Fel in a bottle? That's madness, Drazial.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Measure carefully, and the fel will serve.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Drazial.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "That something in this land makes them grow larger, faster and angrier than any creature ought to be, and that their blood carries it. A druid would call it corruption, I imagine, but I call it a gift no one has had the courage to unwrap." } },
      choices = {
        { text = "It is corruption, Drazial, and bottling it will only spread it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If it can be studied, it can be understood. Carry on.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Because my sister thinks the strength of these beasts lives in their spirits and I think it lives in their blood, and you're the first person I've met who might settle it. If the spirits are sick here, then she's wrong, and I would dearly love to tell her so." } },
      choices = {
        { text = "The spirits here are in pain. That's not for sport.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll help you win the argument, Drazial.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Do the spirits of the beasts out here still speak to you, or has the fel drowned them out? Either answer would be fascinating, and I'll want notes." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Tell me honestly, do you think the fel in this soil is what makes the boars so strong? I've a theory, and you're the first person I've met who might confirm it." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A fellow student of the arcane! My sister calls my work alchemy with pretensions, but you'll appreciate the subtler parts, I'm sure." },
        { id = "h_default", key = true,
          text = "Bloodmage Drazial, at your service. The beasts of these lands show preternatural strength, speed and endurance, quite unlike anything in nature, and I mean to bottle every bit of it." },
        { id = "h_boar", when = { questActive = TODO_QUEST("A Boar's Vitality") },
          text = "Three boar lungs, two scorpok pincers and a basilisk brain, and you'll be my first test subject for the elixir. Try not to be eaten before then; it would spoil the data." },
        { id = "h_jowls", when = { questActive = TODO_QUEST("Snickerfang Jowls") },
          text = "The snickerfang hyenas have jaws that could crack an ogre's skull, and I want to know why. Bring me their jowls, please, and as fresh as you can." },
        { id = "h_drank", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Boar's Vitality"), days = 3 } },
          text = "Tell me honestly, do you feel invulnerable yet? The boars do, and nothing out here has managed to prove them wrong." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Now there's a subject I'd love to study, if you'd allow it, because I'm told the Light lets your kind mend flesh that should have stayed broken." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! How delightful, you turn into beasts, and I study beasts, so we are practically colleagues, though I suspect you won't see it that way." },
      },
      again = {
        { id = "h_again", text = "Another question? Splendid; curiosity is the first sign of a healthy subject." },
        { id = "h_again2", text = "Go on. My sister says I talk too much, so let's prove her right." },
      },
      choices = {
        { text = "What happened to the beasts here?", next = "beasts" },
        { text = "What do your elixirs do?", next = "elixirs" },
        { text = "Who's the other bloodmage?", next = "sister" },
        { text = "Strength in a bottle? I'm listening.", next = "warrior", when = { class = { "WARRIOR", "ROGUE", "PALADIN" } } },
        { text = "Would your elixirs work on my beast?", next = "k_hunter", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "Why call yourselves bloodmages, Drazial?", next = "xmage", when = { class = "MAGE" } },
        { text = "Does the fel make the beasts strong?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Is the Light just another strength to bottle, Drazial?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What have you learned from the beasts out here, Drazial?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Why do you care what the spirits say, Drazial?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Good luck with your studies.", next = "END" },
      },
    },
    beasts = {
      lines = {
        { id = "b_default", fx = { learn = { "dark_portal" } },
          text = "Our theory is that the energy released when the Dark Portal opened soaked into them, and forced them to change into what you see. The boars are so tough that nothing else bothers hunting them, and the scorpoks strike faster than the eye can follow." },
      },
      choices = {
        { text = "Is that energy dangerous to us?", next = "beasts_danger" },
        { text = "Fascinating.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },
    beasts_danger = {
      lines = { { id = "bd_default", text = "Probably, in time, and in large doses. That's why we distil it from the beasts first, rather than licking the rocks like some of the ogres seem to." } },
      choices = {
        { text = "Fel is fel. Bottling it doesn't make it clean.", next = "BACK", fx = { align = { light = 1 }, affinity = -1 } },
        { text = "Power is power. Use it while you can.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    elixirs = {
      lines = { { id = "e_default", text = "Each takes one gift from these beasts and lends it to you for an hour or so: the boar's endurance, the hyena's strength, the scorpok's quickness. The first is free, for science, and the rest you'll pay for in organs." } },
      choices = {
        { text = "Any side effects?", next = "elixirs_side" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elixirs_side = {
      lines = { { id = "es_default", text = "None that have lasted, so far, and the subjects have stopped complaining about the taste. Do keep a record of anything unusual, though; it all goes in the notes." } },
      choices = {
        { text = "I'll keep notes.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sister = {
      lines = { { id = "s_default", text = "Lynnore, my sister. She studies the mind and spirit of the beasts and leaves me the body, which she considers the lesser half of the work; I consider it the half that bites." } },
      choices = {
        { text = "Do you two get along?", next = "sister_along" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sister_along = {
      lines = { { id = "sa_default", text = "We've shared a camp in the Blasted Lands without killing each other, which in this place counts as devotion. Don't tell her I said that." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    warrior = {
      lines = { { id = "w_default", text = "I thought you might be. The snickerfang's strength in a single draught; you'll swing that weapon like you were born to it, at least until it wears off." } },
      choices = {
        { text = "Sign me up.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "I'd rather earn my strength.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    k_hunter = {
      lines = {
        { id = "xhu_default", text = "Oh, almost certainly, and what a fascinating trial that would be! I'd want it observed for a week, mind, because the basilisks here grew a second row of plates on the stuff and I'd hate to miss that." },
      },
      choices = {
        { text = "My beast is not your experiment.", next = "BACK", fx = { align = { light = 1 }, affinity = -1, trait = { kind = 1 } } },
        { text = "If it makes it stronger, I'll consider it.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A bloodmage, which means I study what's in the blood and the bone. The rest is footnotes.", next = "beasts" } },
    advice = { { id = "tp_ad", text = "Never fight a Blasted Lands boar fairly; they don't tire, and you will." } },
    dark_portal = { { id = "tp_portal", text = "The source of everything interesting in these lands. Also everything dangerous, but that's usually the same list." } },
    _none = { { id = "tp_none", text = "Not my field, I'm afraid. Ask my sister; she's better at abstractions." } },
  },
}

P:NPC {
  key = "lynnore", id = TODO_NPC("Bloodmage Lynnore"), name = "Bloodmage Lynnore",
  bible = "bibles/blastedlands.md", role = "questgiver", tier = "quest",
  communities = { "blasted_lands" }, temper = { "steady" }, values = { "curious", "wise" },
  notices = { "class" },

  impression = {
    first = "Bloodmage Lynnore speaks of basilisks with more respect than she shows most people. She is cold, clever and fond of her brother in a way she would never admit to his face.",
    third = "{name} met Bloodmage Lynnore, Drazial's sister, who studies how the basilisks and vultures of the Blasted Lands think and heal.",
  },

  greetings = {
    { id = "g_default", text = "Quietly, please. I'm observing." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Your mind's still in one piece, I trust?" },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. You'll understand my work better than my brother does; you also believe there's more to a creature than its meat." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, and a thinking one, I hope. My compounds sharpen the mind as well as any study, and far more quickly." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The same thing that keeps a wounded basilisk crawling toward its den: a spirit that refuses the body's verdict. You would call it rage, I suspect, or discipline, but I have watched the beasts here endure far worse than you, and they never needed a name for it." } },
      choices = {
        { text = "Discipline. Rage burns out, but training holds.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Rage. Discipline breaks long before fury does.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I could, and I would learn more from it than from a hundred basilisk brains, though I suspect you would not care for my methods. A beast that trusts its master endures pain that would kill a wild one, and I want to know why." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Look how {pet} watches me, weighing whether I'm prey or threat. Its mind is quicker than you give it credit for, and I'd wager it has already decided I'm neither." },
      },
      choices = {
        { text = "Our bond isn't something for your vials, Bloodmage.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Study away. Whatever makes us stronger is worth knowing.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Perhaps not, but you can't tell me how it works either, only that it does, and I find that a very poor argument from people who call my work blasphemy. I'll keep my brains in jars and you keep your prayers, and we'll see which of us learns more." } },
      choices = {
        { text = "The Light asks for faith, not proof. That's its strength.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fair enough. Let your results speak for you.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Patience, chiefly, because a basilisk can sit still for days and lose none of its sharpness, and I'd like to know how. If I can bottle that, a mage could study through the night without a single wandering thought." } },
      choices = {
        { text = "A mind should earn its sharpness, not drink it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Any shortcut to a sharper mind is worth taking.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let's leave that there.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "That is the question, and the answer is in their gizzards, I'm almost certain. They've learned to digest corruption the way a goat digests thorns, and if I can learn the trick, perhaps I can teach it to people who must live beside it, like you." } },
      choices = {
        { text = "A cure for corruption would save many lives.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Corruption is power. I don't want it cured.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Everything worth knowing, because a basilisk lies so still on the rocks that you step on it before you see it, and then you stop moving altogether. My brother bottles their strength, but I would rather understand their patience, which no elixir has ever captured." } },
      choices = {
        { text = "Patience is a discipline. I'll study it, Lynnore.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd sooner bottle the strength and be done with it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Its instinct and its will to live, the thing that makes a basilisk freeze and a vulture wait, and it can be drawn out and studied if one is careful. You would call it sacred and I would call it data, but we both agree it is real, which already puts us ahead of my brother." } },
      choices = {
        { text = "A spirit isn't data, Lynnore. It deserves respect.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Study it as you like. Knowledge is knowledge.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You claim to hear the spirits of beasts and I study them, so we may be the only two people in this wasteland who believe they exist." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You move like a basilisk, slow until it matters, and I'd find that admirable if I thought you'd learned it from watching basilisks." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. My brother would want to bottle your strength, but I would rather know what keeps you standing after the strength has run out." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. You would make a better study than my brother's vials, because you and your animals learn each other's minds, and that interests me far more than muscle." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. You'll have noticed the taint in the vultures, then, and how they feed on it rather than die of it." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. Perhaps you'll understand my work better than my brother does, since you spend your life training the mind to hold more than it should." },
        { id = "h_default", key = true,
          text = "Bloodmage Lynnore. My brother Drazial studies the strength of the beasts here, and I study what he overlooks: their minds, and the spirit that lets them heal and endure beyond anything their bodies should allow." },
        { id = "h_brains", when = { questActive = TODO_QUEST("The Basilisk's Bite") },
          text = "Ten basilisk brains and two vulture gizzards, as fresh as you can manage. The brains are the point; the gizzards are only there to hold the solution together." },
        { id = "h_vulture", when = { questActive = TODO_QUEST("Vulture's Vigor") },
          text = "The vultures here should have died of the taint years ago, and instead they thrive on it. Their gizzards hold the secret, and I'd like ten of them." },
        { id = "h_tasted", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Basilisk's Bite"), days = 3 } },
          text = "You've had a taste of the redstone basilisk's mind now. Did you notice how much quicker your thoughts ran?" },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin. Your order claims the Light heals what the body cannot, and I've watched basilisks here do the same with nothing but their own will, so perhaps we're studying the same thing." },
      },
      again = {
        { id = "h_again", text = "Something else? Ask precisely, please; I find vague questions tiring." },
        { id = "h_again2", text = "Go on, then; the basilisks will keep for a little while." },
      },
      choices = {
        { text = "What's special about the basilisks?", next = "basilisks" },
        { text = "What do you mean by the spirit of a beast?", next = "spirit" },
        { text = "Your brother says you look down on his work.", next = "brother" },
        { text = "A beast's spirit is the Light's work, not yours.", next = "priest", when = { class = "PRIEST" } },
        { text = "A druid feels a beast's spirit, Lynnore. Not in bottles.", next = "k_druid", when = { class = "DRUID" } },
        { text = "What do basilisk minds teach you, Lynnore?", next = "xmage", when = { class = "MAGE" } },
        { text = "Why don't the vultures die of the taint?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "The Light isn't a beast's instinct, Lynnore.", next = "xapala", when = { class = "PALADIN" } },
        { text = "What keeps a warrior standing, then, Lynnore?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Could you study the bond between a hunter and a beast?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What do basilisks know about moving quietly, Lynnore?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What do you think a beast's spirit is, Lynnore?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I'll leave you to observe.", next = "END" },
      },
    },
    basilisks = {
      lines = { { id = "b_default", text = "The redstone basilisks have flourished here more than any other creature, and I've watched them hunt: they plan, they wait, they lay traps. Their thinking is more complex than that of some humanoids I could name." } },
      choices = {
        { text = "Some humanoids like ogres?", next = "basilisks_ogres" },
        { text = "And you want their brains.", next = "basilisks_brains" },
        { text = "Something else.", next = "BACK" },
      },
    },
    basilisks_ogres = {
      lines = { { id = "bo_default", text = "Ogres, yes, and a good many adventurers. I didn't say which; you may draw your own conclusions." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    basilisks_brains = {
      lines = { { id = "bb_default", text = "I must study them, and I can't study them while they're attached to a basilisk that wants to eat me. The compound I make from them is my thanks; more of it can always be made, for a price." } },
      choices = {
        { text = "Science is a bloody business.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirit = {
      lines = { { id = "s_default", text = "Some of these creatures recover from wounds faster than flesh should allow, as if something untied to their bodies were mending them. Call it spirit, call it will; the vultures have more of it than anything I've ever seen." } },
      choices = {
        { text = "Can it be bottled for us?", next = "spirit_bottle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spirit_bottle = {
      lines = { { id = "sb_default", text = "For a while, yes; that's what the vulture's gizzard compound does. It won't make you a better person, only a quicker-mending one, which in the Blasted Lands is the more useful of the two." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brother = {
      lines = { { id = "br_default", text = "Drazial says a great many things, most of them loudly. I don't look down on his work; I only think it's the easy half, which is a different thing entirely." } },
      choices = {
        { text = "He's fond of you, you know.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest = {
      lines = { { id = "pr_default", text = "Perhaps. If it is, the Light has been very generous to vultures and very stingy with the people out here. I only measure what I find, priest; the theology I leave to you." } },
      choices = {
        { text = "Then measure carefully. Some things shouldn't be tampered with.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Measure away. The Light can take care of itself.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },
    k_druid = {
      lines = {
        { id = "xdr_default", text = "Then tell me what you feel in them, because I have only my notes and my brother's bottles, and neither of them can tell me why a starving boar here heals faster than a fed one in Elwynn. Is it pain, or is it something else?" },
      },
      choices = {
        { text = "It's rage. They heal because they can't stop.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "It's sickness. Your study should end.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "An elf of Quel'Thalas who would rather watch a basilisk think than listen to most people talk. You may take that personally.", next = "basilisks" } },
    advice = { { id = "tp_ad", text = "Don't meet a basilisk's eyes, and don't assume it's stupid because it's scaly." } },
    dark_portal = { { id = "tp_portal", text = "Whatever came out of it changed everything living here. I'd like to know what it would do to a thinking creature, and I'm afraid I already do." } },
    _none = { { id = "tp_none", text = "That's outside my study. My brother will happily guess, if you want a guess." } },
  },
}

P:NPC {
  key = "daio", id = TODO_NPC("Daio the Decrepit"), name = "Daio the Decrepit",
  bible = "bibles/blastedlands.md", role = "questgiver", tier = "quest",
  communities = { "tainted_scar" }, temper = { "steady" }, values = { "patient", "cunning" },
  notices = { "class", "race" },

  impression = {
    first = "Daio the Decrepit is an old man at a demon altar in the Tainted Scar, smiling as if the place were a garden. He speaks plainly about the price of power, and I believe he has paid it.",
    third = "{name} met Daio the Decrepit, an old warlock who teaches the binding of demons from an altar in the Tainted Scar.",
  },

  greetings = {
    { id = "g_default", text = "You are certainly a long way from home, {race}. Come closer; the demons won't bite while I'm watching." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still alive. The Scar hasn't had you yet, then." },
  },

  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "Ah, one of us. I can see what you've already paid for your power in your eyes, and it isn't nearly enough yet." },
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "The Light, here? You must be very brave or very lost. The demons in the Scar can smell it on you, so mind yourself." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The same as any of us, only paid slower: your knees, your sleep, and the friends who stood beside you and didn't get up. My students pay with their souls, all at once, and I sometimes think yours is the crueller bargain." } },
      choices = {
        { text = "What I pay is mine to give. No demon takes it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Any price is worth it, if the strength is real.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Only in that both of them would turn on you if they could, though your beast has the decency to forget the urge. A demon remembers every command it ever resented, and it waits, which is the first thing I teach and the last thing anyone believes." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "{pet} won't come near my altar, and that's wisdom, not cowardice. Animals know the smell of the Twisting Nether long before men do." },
      },
      choices = {
        { text = "My beast follows me by trust. That's nothing like your chains.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fear or love, obedience is obedience, old man.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "You call a bear out of yourself and command it, and I call a demon out of the Nether and command it, and the price of losing control is about the same. I have paid my price, and you can see it on me, and I wonder sometimes what yours will look like." } },
      choices = {
        { text = "A druid's bond is with nature, given freely. Yours is theft.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Perhaps you're right, Daio. All power has a price.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because a demon always knows what it gave you, child, and it comes back for payment at a time of its choosing, usually the worst one. I have lived beside this altar long enough to watch many clever thieves try, and you can see by my face how the cleverest bargain went." } },
      choices = {
        { text = "A bargain should be honored, even with a demon.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then the trick is never to be found, old man.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I know better than anyone, since I helped in my small way. Every bargain struck at this altar leaves a little rot in the soil, and the Scar has been taking bargains since the first orcs came through the Portal, so weep for it if you like, but don't expect it to weep back." } },
      choices = {
        { text = "Then I'll stand against those who bargain here, Daio.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Rot or not, power is power. Teach me, Daio.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, at my altar? The elements will not follow you here, I'm afraid, because the Tainted Scar has fed on demons so long that the earth itself has gone sour." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You take what you want and leave before anyone can name the price, which is a fine way to live, though it never works with demons." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior comes to Daio's altar. You've no use for demons, I know, but I'd guess you know a thing or two about the price of power." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, come to an old man's altar. My students keep their creatures by chains and fear, and I'd be curious to know whether yours obey you from love." },
        { id = "h_default", key = true,
          text = "Daio, they call me, and the Decrepit, which I've earned. I teach suppression and control to those who would master demons rather than serve them, and I teach them sacrifice, which is the lesson nobody wants." },
        { id = "h_bindings", when = { questActive = TODO_QUEST("The Prison's Bindings") },
          text = "The blood of the Wildspawn satyr, from Dire Maul's Warpwood Quarter, fifteen measures of it. Once it clots, it will bind the shards and power the prison." },
        { id = "h_suppression", when = { questActive = TODO_QUEST("Suppression") },
          text = "The prison is ready, and now the hard part: find a Doomguard Commander in the Scar and take it. Bring friends who can keep you alive, because it will want nobody dead but you." },
        { id = "h_bound", tags = { "news" }, when = { questRecent = { TODO_QUEST("Suppression"), days = 7 } },
          text = "You've a Doomguard in your keeping now, and the knowledge to call it. Remember what it costs every time you do, and never assume it has forgiven you." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, at my altar. Your kind and mine both bind something wild to our will, friend, though you'd never admit the likeness, and I'd never ask you to." },
      },
      again = {
        { id = "h_again", text = "More questions? Good; the ones who stop asking are the ones the demons keep." },
        { id = "h_again2", text = "Speak. I've nowhere to be, and the Scar is very quiet company." },
      },
      choices = {
        { text = "What would I have to sacrifice?", next = "sacrifice" },
        { text = "How do you conjure a demon?", next = "conjure" },
        { text = "Why live here, of all places?", next = "scar" },
        { text = "I have come to learn, Daio.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "You trade in damnation, old man.", next = "priest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Mages bind things too, old man.", next = "k_mage", when = { class = "MAGE" } },
        { text = "What price does a warrior pay for strength, Daio?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Is a demon anything like a hunter's beast, Daio?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "How is a druid anything like a demon-binder, Daio?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Why doesn't stealing work with demons, Daio?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What has the fel done to this earth, Daio?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I'll leave you to your altar.", next = "END" },
      },
    },
    sacrifice = {
      big = true,
      lines = { { id = "s_default", text = "That is for the demon you wish to conjure and enslave to decide, not me. We wield dark powers and we pay grossly for them, and the only warlocks who last are the ones who know the price before they open the book." } },
      choices = {
        { text = "What did you pay?", tag = "Intimidate", next = "daio_price",
          check = { pass = { any = { { class = "WARLOCK" }, { disposition = { min = 65 } }, { questDone = TODO_QUEST("Suppression") } } } },
          fail = { next = "daio_grin", fx = { affinity = -1 } } },
        { text = "No power is worth that.", next = "BACK", fx = { align = { light = 1 }, affinity = -1 } },
        { text = "Any price is worth paying for real power.", next = "BACK", fx = { align = { light = -1 }, affinity = 1, taint = 2 } },
      },
    },
    daio_price = {
      big = true,
      lines = { { id = "dp_default", text = "My name, among decent people, and every friend who knew it. I live at a demon's altar in a scar in the earth because nowhere else would have me, and I'd tell you it was worth it, but I've stopped lying to students." } },
      choices = {
        { text = "Then why teach it?", next = "daio_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    daio_why = {
      lines = { { id = "dw_default", text = "Because you'll learn it anyway, from a book or a cultist or a voice in the dark, and I'd rather you learned it from someone who'll tell you the price." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    daio_grin = {
      lines = { { id = "dg_default", text = "Ask me that again when you've paid something of your own, and perhaps I'll answer. Until then, mind your tongue in my Scar." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    conjure = {
      lines = { { id = "c_default", text = "First you build a prison to confine the beast, because a demon called without one is a demon loose. The bindings, the casing, the crystal; only when all three are ready do you go looking for what you mean to put inside." } },
      choices = {
        { text = "And then?", next = "conjure_then" },
        { text = "Something else.", next = "BACK" },
      },
    },
    conjure_then = {
      lines = { { id = "ct_default", fx = { learn = { "burning_legion" } },
        text = "Then you go into the Scar and find a Doomguard, one of the Legion's commanders, and you hold the prison steady while it tries to tear you in half. Most fail at that part, and most of those don't come back to complain." } },
      choices = {
        { text = "I'll bring friends.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scar = {
      lines = { { id = "sc_default", fx = { learn = { "tainted_scar" } },
        text = "Because the demons are here, and the lessons are here, and nobody from Nethergarde will come this far to tell me to stop. The Scar has a lord, and the lord leaves an old man alone as long as he's no trouble." } },
      choices = {
        { text = "Who is its lord?", next = "scar_lord" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scar_lord = {
      lines = { { id = "sl_default", text = "Kazzak, a great doomlord of the Legion, who walks the Scar as if he owned the world, and perhaps one day he will. I don't stand in his way, and I'd advise you to follow my example." } },
      choices = {
        { text = "Someone should stand in his way.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Wise advice.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    warlock = {
      lines = { { id = "w_default", text = "So you have found me, and you've come to learn suppression and control. I will teach you much more than that, and you'll curse me for some of it, which is how you'll know it was worth learning." } },
      choices = {
        { text = "Teach me, then.", next = "conjure", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest = {
      lines = { { id = "pr_default", text = "I trade in honesty, which looks like damnation to people who'd rather not know the price of things. Go back to your temple, if you like; the demons won't be any fewer for your disapproval." } },
      choices = {
        { text = "The Light will see them banished, and you with them.", next = "BACK", fx = { align = { light = 2 }, affinity = -2 } },
        { text = "Perhaps knowing the enemy is no sin.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },
    k_mage = {
      lines = {
        { id = "xmg_default", text = "Bind? You conjure water and call it mastery, child. I bind what would eat you, and I pay for every hold I keep on it, and so would you, if you ever reached for anything that could reach back." },
      },
      choices = {
        { text = "Some of us know where to stop.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then teach me to reach further.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "An old man with older habits. What I was before the Scar doesn't matter now, and it wouldn't help you." } },
    advice = { { id = "tp_ad", text = "Never call anything you can't send back. Write that inside your eyelids." } },
    burning_legion = { { id = "tp_legion", text = "Masters to some, enemies to most, and teachers to a few of us. They don't care which, which is the first thing to understand about them." } },
    tainted_scar = { { id = "tp_scar", text = "My home, my classroom, and very probably my grave. It suits me better than you'd think.", next = "scar" } },
    _none = { { id = "tp_none", text = "Ask the demons. They know everything, and they lie about all of it." } },
  },
}
