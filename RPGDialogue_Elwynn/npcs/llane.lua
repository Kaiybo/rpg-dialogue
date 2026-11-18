-- Llane Beshere, warrior trainer, Hall of Arms, Northshire Abbey. Voice: bibles/llane.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "llane", id = TODO_NPC("Llane Beshere"), name = "Llane Beshere",
  bible = "bibles/llane.md", role = "trainer", tier = "service",
  communities = { "northshire" }, temper = { "steady" },
  notices = { "fitness", "stance" },
  impression = {
    first = "Llane Beshere corrected my stance before he asked what I wanted, which says everything about him. He believes warriors are made by being knocked down and getting back up.",
    third = "{name} met Llane Beshere, Northshire's warrior trainer, who teaches a proper stance as if it were scripture.",
  },

  greetings = {
    { id = "g_feet", text = "Feet apart, recruit. Now, what do you need?" },
    { id = "g_drills", when = { class = "WARRIOR" }, text = "Back for more drills?" },
  },

  notice = {
    { id = "n_ressick", cat = "fitness", place = "before", when = { resSick = true },
      text = "You died recently; I can see it in how you stand. Sit down before you fall down." },
    { id = "n_naked", cat = "fitness", when = { nearlyNaked = true, class = "WARRIOR" },
      text = "A warrior without armor is a target with opinions." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Anyone can, if they get back up. Your spirits might lift you, but your legs still have to stand." } },
      choices = {
        { text = "I'll get back up every time, Llane. That's a promise.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "My spirits will carry me. I'll skip the knocks.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "He could learn everything, if he's paying attention, because a bear never fights with half its weight and never stops until the fight's done. I tell the recruits to fight like that, and then they go out and fight like scarecrows." } },
      choices = {
        { text = "A bear lets a beaten foe go, too. Teach them that.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A bear finishes what it starts. Teach them that instead.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "That you win fights before they start, and I'll grant you that's smart. But one day the wolf gets past the beast and the arrow, and then you'll wish you'd stood in my yard a week and learned to take a hit." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That you win fights before they start, and I'll grant you that's smart. That {pet} of yours takes the hits for you, I see, so look after it, because it's doing my job." },
      },
      choices = {
        { text = "I'll learn to stand my ground when it comes to that.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If it comes to that, I've already lost. I'll stay back.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I'd train anyone who can stand up again after I knock them down, and rogues get knocked down a lot, by my reckoning. You'll never block like a warrior, but you'll learn when to run, and that's won more fights than any parry." } },
      choices = {
        { text = "I'll stand and take your drills like anyone else.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll learn to run, Llane. Standing's for fools.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They respect what a mage can do, but not that you can't take a punch, and I've told them that's exactly why you need them. Learn to stand behind a shield wall and you'll live long enough to burn whatever's in front of it." } },
      choices = {
        { text = "I'll respect your shield wall, Llane, and stand where I'm told.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Your warriors should be grateful for what I can do.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "It's happened twice, and once it was an imp that set the straw alight while the recruit beside it was still swinging. I'd sooner my warriors learn to fight on dummies than on whatever Drusilla La Salle lets out of the graveyard." } },
      choices = {
        { text = "I'll keep my imp leashed and away from your recruits.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Your recruits could do with a real fight now and then.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "To stay standing when the Light goes quiet, because one day it will, and you'll still have a gnoll in front of you. Brother Sammuel teaches you to pray and I teach you to take a hit, and you'll need both before you're through." } },
      choices = {
        { text = "I'll learn both. Duty asks it of me.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Light won't go quiet for me. I'll trust it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin in my hall. You've a priest's heart and a warrior's arms, so let's see if you've a warrior's legs." },
        { id = "h_default", text = "Warriors are made, not born. Mostly by getting knocked down and standing back up." },
        { id = "h_letter", tags = { "news" }, when = { questRecent = { TODO_QUEST("Simple Letter"), days = 1 } },
          text = "So you read the letter and found your way to me. Good; now let's see if you can stand." },
        { id = "h_warrior_blooded", when = { class = "WARRIOR", band = "Blooded" },
          text = "You've put on some muscle, but you're still dropping your guard on the left." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, always trying to win a fight from across the field." },
        { id = "h_other", when = { ["not"] = { class = { "WARRIOR", "HUNTER" } } },
          text = "You're not my student, but the drills wouldn't kill you. Probably." },
        { id = "h_bruise", when = { metBefore = true, class = "WARRIOR" }, text = "You're standing straighter, and the bruises are in better places. That's progress, recruit." },
        { id = "h_dawn", when = { metBefore = true }, text = "The recruits ran the yard twice this morning. One cried and one laughed, and the one who laughed is the one I'm worried about." },
        { id = "h_veteran", when = { class = "WARRIOR", minLevel = 20 },
          text = "Look at the scars on you. Somebody's been earning them properly, so stand there and let me see if the left guard ever got fixed." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue in my yard. You'll want to run the drills with my recruits, I expect, or else you're here to steal the practice swords." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage in the practice yard. Stand at the back, recruit, because my warriors swing wide." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock, here in the yard. Keep that creature off my training dummies, because they're hard enough to replace as it is." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid, and you stand like someone who's never been knocked down by anything but weather. We'll see about that." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Your stance is wrong; spirits or not, you'll be knocked down. Then you'll get back up, and that's the lesson." },
      },
      again = {
        { id = "h_again", text = "Anything else, recruit? Ask while you stretch; you'll want the breath later." },
        { id = "h_again2", text = "Go on, and quickly; the yard doesn't run itself." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "Any advice?", next = "advice" },
        { text = "How do I stop getting knocked down?", next = "stance", when = { class = "WARRIOR", maxLevel = 12 } },
        { text = "I've fought a long way from this hall since.", next = "veteran", when = { class = "WARRIOR", minLevel = 20 } },
        { text = "Anything for a priest to learn in here?", next = "priest", when = { class = "PRIEST" } },
        { text = "Do you train dwarves the same as humans?", next = "dwarf", when = { race = "Dwarf", class = "WARRIOR" } },
        { text = "I doubt a gnome can learn your stance.", next = "gnome", when = { race = "Gnome", class = "WARRIOR" } },
        { text = "What do you think of the other trainers here?", next = "trainers" },
        { text = "Would you train a rogue alongside your warriors?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Your warriors don't seem to respect the mages here.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Your dummies look like a warlock's pet has been at them.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What does a warrior trainer think of hunters?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "What can a warrior teach a paladin, Llane?", next = "xapala", when = { class = "PALADIN" } },
        { text = "A warrior could learn a lot from watching a bear fight.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Can a shaman learn to fight like a warrior, Llane?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Later.", next = "END" },
      },
    },
    advice = {
      lines = {
        { id = "a_default", text = "Hit first and hit hard, and don't stop until it stops moving." },
        { id = "a_green", when = { class = "WARRIOR", band = "Greenhorn" },
          text = "Charge in, then keep them close. A warrior at range is a corpse with good intentions." },
      },
      choices = {
        { text = "And if it doesn't stop moving?", next = "advice_more" },
        { text = "Understood.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Sounds simple enough.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    advice_more = {
      lines = {
        { id = "am_default", text = "Then you were fighting the wrong thing, or fighting it wrong. Walk away, find out which, and come back, because pride makes a poor shield." },
      },
      choices = { { text = "Walk away. Noted.", next = "BACK", fx = { trait = { cautious = 1 }, affinity = 1 } } },
    },
    stance = {
      lines = {
        { id = "s_default", text = "Keep your weight low and your feet wider than you like, and your shield arm doesn't drop just because you're tired. Everyone's tired, kobolds especially." },
      },
      choices = {
        { text = "Show me.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "Standing wider seems too simple.", next = "stance_more" },
      },
    },
    stance_more = {
      lines = {
        { id = "sm_default", text = "It is that simple, and you do it a thousand times until you do it asleep. Then I'll show you the second thing, though most never get that far." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },
    veteran = {
      lines = {
        { id = "v_default", text = "I can tell. You walked in here like the door owed you something. Tell me one thing the road taught you that I didn't." },
      },
      choices = {
        { text = "That nobody fights fair.", next = "veteran_fair", fx = { affinity = 1 } },
        { text = "When to run.", next = "veteran_run", fx = { trait = { cautious = 1 }, affinity = 2 } },
      },
    },
    veteran_fair = {
      lines = { { id = "vf_default", text = "I told you that, and you didn't believe me. Nobody does until it costs them a tooth." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    veteran_run = {
      lines = { { id = "vr_default", text = "Good answer, better than mine. I'll be telling the new ones that, and taking the credit." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest = {
      lines = {
        { id = "p_default", text = "One thing: stand behind me, not beside me and not in front of me. If you're ever in front, I've failed, and so have you." },
      },
      choices = {
        { text = "Behind you, then, and I'll keep you standing.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'll stand where I'm needed, not where I'm told.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "And if I'd rather fight?", next = "priest_fight" },
      },
    },
    priest_fight = {
      lines = { { id = "pf_default", text = "Then you'll fight and heal yourself, and nobody will heal me. Pick a job and do it well." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },
    dwarf = {
      lines = { { id = "dwarf_l", text = "No. I train humans to plant their feet, and I train dwarves to lift theirs now and then, because a dwarf who never steps gets surrounded. Different mistakes, same bruises." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    gnome = {
      lines = { { id = "gnome_l", text = "Learn it? I've changed it for you. Lower, wider and angry, because a kobold your size is a fair fight, and you'll get in under anything bigger." } },
      choices = { { text = "Lower, wider, angry. Got it.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } } },
    },
    trainers = {
      lines = { { id = "trainers_l", text = "Priestess Anetta mends what I break, Khelden Bremen keeps his mages out of my yard, and Jorik Kerridan behind the stables thinks I can't hear him laughing at my drills. I can, and I'm keeping count." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I train recruits in the Hall of Arms. Before that I was one. That's all the story you need." } },
    advice = { { id = "tp_ad", text = "Your shield arm will want to drop, and you mustn't let it. That's the whole lesson, and nobody learns it the first time." } },
    northshire_abbey = { { id = "tp_abbey", text = "The brothers have the halls with books. I have the one with the dents in the floor." } },
    kobolds = { { id = "t_kobolds", text = "Small, fast and cowardly, which makes them perfect practice." } },
    _none = { { id = "t_none", text = "Do I look like a librarian?" } },
    echo_ridge = { { id = "tp_echo_ridge", text = "I send recruits to Echo Ridge when they think they're ready, and the kobolds tell them otherwise. The ones who come back humble are the ones worth training." } },
    second_war = { { id = "tp_second_war", text = "My father fought at Blackrock Spire in the Second War, and he said the orcs hit like falling trees. I teach shields because of him." } },
    brotherhood_northshire = { { id = "tp_brotherhood_northshire", text = "The brothers pray and I drill, and between us the recruits leave here able to stand up in a fight and kneel after one. It's a good arrangement." } },
    scourge = { { id = "tp_scourge", text = "If you're ever sent north against the dead, keep your shield up even after they stop moving, because sometimes they don't stay stopped." } },
  },
}
