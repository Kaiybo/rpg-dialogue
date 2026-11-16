-- More of Theramore Isle: the gryphon master, the cook and the trauma surgeon. Voice: bibles/dustwallow.md
local P = RPGDialogueAPI:Pack("rpgd.dustwallow")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "baldruc", id = TODO_NPC("Baldruc"), name = "Baldruc",
  title = "Gryphon Master",
  bible = "bibles/dustwallow.md", role = "flightmaster", tier = "service",
  communities = { "theramore" }, temper = { "gruff", "steady" }, values = { "practical", "loyal" },
  notices = { "race", "weary" },

  impression = {
    first = "Baldruc spends his days keeping damp out of gryphon feathers, and he talks about the marsh as if it were a personal enemy. He checked every strap on my saddle twice and grumbled through both checks.",
    third = "{name} met Baldruc, who keeps the gryphons of Theramore dry, fed and flying.",
  },

  greetings = {
    { id = "g_roost", text = "Mind the roost, it's slick. Everything on this island is slick, the birds included." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the isle in one piece? Good, that's what I like to see from my passengers." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A proper mountain face, out here in the bog! You'll know a gryphon when you see one, which saves me a speech." },
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look like the marsh chewed you and spat you out. Sit a while before you climb on, or you'll fall off over the Barrens." },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "They do, and they won't fly within a mile of the Wyrmbog no matter how I coax them. I don't blame them, mind; Onyxia's brood nests down there, and a gryphon knows a bigger predator when it smells one." } },
      choices = {
        { text = "Train them out of it. A mount must obey.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Trust their noses. They know the marsh better than we do.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Once, a deserter who thought he could fly south and disappear. The gryphon took him a mile out over the marsh, turned round and dropped him in the shallows by the docks, and the Guard collected him with a net." } },
      choices = {
        { text = "The gryphon did the right thing. Deserters should face justice.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "He was brave to try. I'd have picked a slower bird.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Baldruc.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "The older ones teleport and the younger ones haven't learned how yet, so it's mostly the young ones I fly. They spend the whole trip reading and complain about the wind turning their pages, and the gryphons don't care for them much either." } },
      choices = {
        { text = "I'll fly your gryphons. Some things shouldn't be skipped.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll teleport. Time matters more than the view.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Baldruc, and these are the Lady's gryphons, so treat them better than you'd treat yourself. They carry the post, the officers and anyone with coin, and they hate the damp more than I do." },
        { id = "h_rain", when = { timeOfDay = "night" },
          text = "Night flights over the marsh are cold and black as a mine shaft. The birds know the way, so you just keep your head down and hold on." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, is it? If you can talk to beasts, tell my gryphons the damp won't kill them, because they won't believe it from me." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Don't even think about borrowing a gryphon after dark, because they'll bite whoever's sitting on them and then come straight back to me." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage, and you'll be wanting to teleport home instead of using my gryphons, I suppose. That's fine, but don't come crying to me when you land somewhere damp." },
      },
      again = {
        { id = "h_again", text = "Something else, or shall I saddle one?" },
        { id = "h_again2", text = "Ask away; the birds aren't going anywhere till I say so." },
      },
      choices = {
        { text = "Do your gryphons sense the dragons to the south?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Show me where they fly.", next = "BUSINESS" },
        { text = "How do gryphons take to a swamp?", next = "birds" },
        { text = "Do you ever fly over Brackenwall?", next = "horde" },
        { text = "Do the dragons in the south bother you?", next = "dragons" },
        { text = "My people fly the winds too, after a fashion.", next = "x_skyborne", when = { race = "Skyborne" } },
        { text = "I'd rather ride my own mount, thanks.", next = "x_mount", when = { class = { "PALADIN", "WARLOCK" } } },
        { text = "Has anyone ever tried to steal one of your gryphons, Baldruc?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do mages really never use your gryphons, Baldruc?", next = "xmage", when = { class = "MAGE" } },
        { text = "Not today.", next = "END" },
      },
    },
    birds = {
      lines = {
        { id = "b_default", text = "Badly, and they'll tell you so at the top of their lungs. Gryphons are mountain birds, and every morning I'm out here oiling feathers and scraping mold off the perches so they don't take sick." },
      },
      choices = {
        { text = "Why keep them here at all?", next = "birds_why" },
        { text = "Hard work, and you do it well.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    birds_why = {
      lines = {
        { id = "bw_default", text = "Because a boat to Menethil takes days and a gryphon to safe roost takes hours, and the Lady sends a lot of letters. Theramore sits alone at the end of the world, and these birds are half of what keeps it tied to the rest." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    horde = {
      big = true,
      lines = {
        { id = "hr_default", text = "Never, and I'll not start. The Lady's peace with the orcs says we keep to our side, so I fly the long way round their village, though I'll admit a few of the lads would like a closer look." },
        { id = "hr_horde", when = { faction = "Horde" },
          text = "You'd know Brackenwall better than me, and you're welcome to it. I fly wide of it because the Lady's peace says so, and I'd thank your lot to do the same over my roost." },
      },
      choices = {
        { text = "The peace is worth flying the long way.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Someone should keep an eye on them from above.", next = "BACK", fx = { align = { order = -1 }, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dragons = {
      lines = {
        { id = "d_default", text = "Black ones, down in the south of the marsh, and my birds can smell them a mile off. They go stiff in the harness and won't fly south past the old road, and I don't argue with them." },
      },
      choices = {
        { text = "What do the soldiers say about them?", next = "dragons_talk" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dragons_talk = {
      lines = {
        { id = "dt_default", text = "That there's something big nesting down there and the small ones are just its servants. Soldiers say a lot after dark, mind, but my birds believe it, and I trust my birds over any soldier." },
      },
      choices = { { text = "So would I.", next = "BACK", fx = { affinity = 1 } } },
    },
    x_skyborne = {
      lines = {
        { id = "xs_default", text = "So I've heard, and my birds keep turning their heads when you walk past, as if they've caught a smell of open sky. I'll still have you strapped in proper, mind; wind's one thing, and a gryphon's temper is another." },
      },
      choices = {
        { text = "Strap me in, then.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_mount = {
      lines = {
        { id = "xm_default", text = "Your own beast will get you across the marsh in a week, if the crocolisks don't eat its legs off. Mine will get you over it before supper, and that's the end of that argument." },
      },
      choices = {
        { text = "Fair point. Saddle one up.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I came with the Lady's fleet and brought the birds with me, and I've been drying them out ever since." } },
    advice = { { id = "tp_ad", text = "Never ride a wet gryphon into a cold wind. The bird won't forgive you, and neither will your knees." } },
    _none = { { id = "tp_none", text = "I know birds and weather and very little else. Try the citadel; they know everything there, or say they do." } },
  },
}

P:NPC {
  key = "morgan_stern", id = TODO_NPC("Morgan Stern"), name = "Morgan Stern",
  bible = "bibles/dustwallow.md", role = "questgiver", tier = "quest",
  communities = { "theramore" }, temper = { "cheerful", "fussy" }, values = { "practical", "generous" },
  notices = { "craft", "hunger" },

  impression = {
    first = "Morgan Stern believes a soldier fed on good soup will hold a wall better than one fed on hard bread, and he may be right. He spoke of tortoise meat with real affection.",
    third = "{name} met Morgan Stern, a Theramore cook determined to make something good out of what the marsh offers.",
  },

  greetings = {
    { id = "g_pot", text = "Mind the pot, it's hot and it's precious. That's a week of tortoise hunting simmering in there." },
    { id = "g_back", when = { metBefore = true }, text = "There's my favorite supplier, or one of them, anyway, since the list is short!" },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You smell of a cookfire, and a good one. I can always tell a fellow cook by the singed sleeves." },
    { id = "n_hungry", cat = "hunger", when = { timeOfDay = "dusk" },
      text = "You've the look of someone who's skipped supper. Don't do that out here; the marsh eats the hungry first." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Every week, and they're always soldiers who've worked a double watch and can't wait for supper. I don't report them, I just feed them, because a man who steals bread is a man who's hungry, and I'd rather fix the hunger." } },
      choices = {
        { text = "That's kind. Hunger makes thieves of honest folk.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Feed them and they'll steal more. Report them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Morgan.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I resent that it's always on hand when the supply ships are late, and nobody ever asks me for tortoise soup when there's free bread to be had. It's good for a soldier in the field, I'll grant, but you can't build a garrison on it." } },
      choices = {
        { text = "You're right. Good food keeps morale up.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Free food is free food. A garrison should take what's easiest.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I'd never call it holy, but I've seen a lad come in shaking from a night on the walls and leave my table steady, and I can't think of a better use for a ladle. The Light can look after the souls, and I'll look after the bellies." } },
      choices = {
        { text = "Feeding the hungry is holy work, whatever you call it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Soup's soup. Leave the Light out of the kitchen.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Sit, sit, you'll have a bowl of tortoise soup before you bless anything, because I've never yet seen a prayer go down well on an empty stomach." },
        { id = "h_default", key = true,
          text = "Morgan Stern, and I feed whoever needs feeding on this island, which is everyone. Supplies come by boat when the boats come, so the rest has to come out of the marsh, one way or another." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Mudrock Soup and Bugs") },
          text = "There are tortoises all along the coast here, big mudrock brutes with tongues like a boot sole, and they make the best soup you'll ever taste. I just need someone brave enough to fetch the tongues." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Mudrock Soup and Bugs") },
          text = "Any luck with the mudrocks? Mind their jaws; they'll take a finger and look innocent about it afterward." },
        { id = "h_done", when = { questRecent = { TODO_QUEST("Mudrock Soup and Bugs"), days = 5 } },
          text = "The soup went down a treat! The Captain had two bowls and said nothing, which from Captain Vimes is a speech." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You smell of nothing at all, which in my kitchen is suspicious, because everyone else smells of tortoise and onions. Rogues and cooks both like to go unnoticed, I suppose." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! I'll make you a deal: you don't conjure any of that tasteless bread near my kitchen, and I won't sneer at your tea." },
      },
      again = {
        { id = "h_again", text = "What else, while it simmers?" },
        { id = "h_again2", text = "Go on, I can stir and listen both." },
      },
      choices = {
        { text = "Why tortoise soup?", next = "soup" },
        { text = "Who eats your cooking?", next = "eaters" },
        { text = "What's the marsh like for a cook?", next = "marsh" },
        { text = "I know a thing or two about stews.", next = "x_cook", when = { profession = "Cooking" } },
        { text = "Troll cooking would put fire in that pot.", next = "x_troll", when = { race = "Troll" } },
        { text = "Does feeding the soldiers feel like holy work, Morgan?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "I'll bring you those tongues.", next = "END", fx = { affinity = 2, standing = { theramore = 1 } } },
        { text = "Do you ever catch thieves in your kitchen, Morgan?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do you resent conjured food, Morgan?", next = "xmage", when = { class = "MAGE" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    soup = {
      lines = {
        { id = "s_default", text = "Because it's hot, it's filling and it keeps, and on an island in a swamp that's everything you want. Mudrock tongue's tough as leather until it's stewed half a day, and then it melts." },
      },
      choices = {
        { text = "And the bugs?", next = "soup_bugs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    soup_bugs = {
      lines = {
        { id = "sb_default", text = "Ah, you read the name. Don't make that face; a good crunch is a fine thing in a soup, and half the guards eat worse on patrol without knowing it." },
      },
      choices = {
        { text = "I'll try anything once.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "I'll take mine without, thanks.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    eaters = {
      lines = {
        { id = "e_default", text = "The Guard, mostly, and the sailors off the Kul Tiras ships who swear nothing tastes right after salt pork. Janene feeds the inn, and I feed the walls, and we argue about bread." },
      },
      choices = {
        { text = "Who wins the bread argument?", next = "eaters_bread" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eaters_bread = {
      lines = {
        { id = "eb_default", text = "She does, because the dwarves take her side, and nobody wins an argument against three dwarves and a bread oven. I've made my peace with it and kept my soup." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    marsh = {
      lines = {
        { id = "m_default", text = "Generous, if you've got a strong stomach and a stronger sword. There's crocolisk, there's tortoise, there's fish the size of a dinghy, and every one of them wants to eat you before you eat it." },
      },
      choices = {
        { text = "A cook with a sword, then.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_cook = {
      lines = {
        { id = "xc_default", text = "Do you now? Then you'll know the trick is patience and a lid that fits, and no amount of seasoning will save a stew you rushed. Bring me a better recipe than mine and I'll cook it for the whole Guard." },
      },
      choices = {
        { text = "A pinch of salt and a lot of time.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_troll = {
      lines = {
        { id = "xt_default", text = "Fire, is it? I had a troll sailor through here once who carried a pouch of red pepper that made the sergeants weep. I'd not mind a pinch of that, if you've any to spare and nobody tells the Captain." },
      },
      choices = {
        { text = "Hot food keeps a soldier awake.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "A cook hears everything, since everyone talks with their mouth full. Ask, and I'll stir while I answer." },
    },
    background = { { id = "tp_bg", text = "I cooked for the fleet on the way over, and when the ships went home I stayed with the pots." } },
    advice = { { id = "tp_ad", text = "Boil the marsh water twice, then boil it again. You'll thank me, and so will your stomach." } },
    _none = { { id = "tp_none", text = "Never heard of it, and I'd not know how to cook it if I had." } },
  },
}

P:NPC {
  key = "vanhowzen", id = TODO_NPC("Doctor Gustaf VanHowzen"), name = "Doctor Gustaf VanHowzen",
  title = "Trauma Surgeon",
  bible = "bibles/dustwallow.md", role = "trainer", tier = "quest",
  communities = { "theramore" }, temper = { "brisk", "exacting" }, values = { "kind", "dutiful" },
  notices = { "craft", "kit" },

  impression = {
    first = "Doctor Gustaf VanHowzen talks about wounds the way a quartermaster talks about stores, calmly and in order. I suspect the calm is something he decided on long ago, and keeps deciding every morning.",
    third = "{name} met Doctor Gustaf VanHowzen, the trauma surgeon who teaches field medicine in Theramore.",
  },

  greetings = {
    { id = "g_tent", text = "Wash your hands if you're coming in, and keep your voice level. Wounded men listen to tone before they listen to words." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's you again, and I hope you've washed your hands." },
  },

  notice = {
    { id = "n_aid", cat = "craft", when = { profession = "First Aid" },
      text = "Your bandages are tied with a field knot, so somebody taught you properly. Good; most people learn on themselves, and badly." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your armor's taken a beating, which usually means the body under it has too. Sit, and let me look at you before you go anywhere." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Spider bites from the marsh, mostly, and a few arrows that came back from the Bloodfen tipped with something nasty. I treat them in order of how soon they'll kill, and I write down every one, because a poison you've seen twice is half beaten." } },
      choices = {
        { text = "I'll bring you what I learn about the Bloodfen poisons.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Knowing poison is knowing how to use it. I keep mine.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Doctor.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "During the Second War, yes, and they don't heal the way a sword cut does, because the flesh around them keeps rotting long after the burn has closed. I learned to cut wide and pray hard, and I still don't know which of the two did more good." } },
      choices = {
        { text = "My craft is for demons, not soldiers. You have my word.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A weapon wounds. What matters is who holds it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Doctor VanHowzen. I teach field medicine to anyone with steady hands and a strong stomach, because the marsh makes more wounded than I can treat alone." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Triage"), profession = "First Aid" },
          text = "You know your bandages. Knowing them on a quiet afternoon is one thing; using them when a dozen soldiers are carried in at once is another, and that's the test I set." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Triage") },
          text = "The tent's full, so go in and decide who needs you first. The loudest patient is rarely the worst one, so remember that." },
        { id = "h_done", when = { questDone = TODO_QUEST("Triage") },
          text = "You came through triage with your head clear and your hands steady. There are surgeons with letters after their names who couldn't say the same." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You have the hands of someone who knows where to put a blade, and I'm glad to see they're steady. The marsh teaches me what poisons do to a body, and I suspect you've studied them from the other side." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. I'll be frank, I have bandaged too many soldiers who met the wrong end of the old Horde's warlocks to feel easy, but a patient is a patient, so tell me where it hurts." },
      },
      again = {
        { id = "h_again", text = "Anything else? Quickly, I've dressings to change." },
        { id = "h_again2", text = "Ask, but keep washing while you do." },
      },
      choices = {
        { text = "I'd like to train.", next = "BUSINESS" },
        { text = "What's triage?", next = "triage" },
        { text = "Where do your wounded come from?", next = "wounded" },
        { text = "How do you stay so calm?", next = "calm" },
        { text = "I heal with the Light. Why bother with bandages?", next = "x_healer", when = { class = { "PRIEST", "PALADIN", "SHAMAN", "DRUID" } } },
        { text = "Do you treat the dead who walk, Doctor?", next = "x_scourge", when = { race = "Scourge" } },
        { text = "Do you see many poisoned wounds in Theramore, Doctor?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Have you treated fel wounds before, Doctor?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Goodbye, Doctor.", next = "END" },
      },
    },
    triage = {
      lines = {
        { id = "t_default", text = "Choosing, when there are more wounded than hands. You look at each man, you decide who dies without you, who lives without you and who lives only with you, and you go to the third one first." },
      },
      choices = {
        { text = "That's a hard choice to make.", next = "triage_hard" },
        { text = "I could do that.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    triage_hard = {
      big = true,
      lines = {
        { id = "th_default", text = "It is, and it should be. The day it stops being hard is the day you should put the needle down, because you've stopped seeing them as men." },
      },
      choices = {
        { text = "Every life should be fought for, whatever the odds.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some can't be saved, and wasting time kills others.", next = "BACK", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wounded = {
      lines = {
        { id = "w_default", text = "Crocolisk bites, fever, the odd arrow from the bandits on the north road, and dragon whelps if a patrol strays too far south. The orcs keep to their peace, mostly, so it's the marsh that fills my cots." },
      },
      choices = {
        { text = "Dragon whelps?", next = "wounded_whelps" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wounded_whelps = {
      lines = {
        { id = "ww_default", text = "Black ones, small and vicious, and their burns go deep. I treat them as I would any burn and pray, and I'd rather patrols stayed north of the old road altogether." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    calm = {
      lines = {
        { id = "c_default", text = "I'm not calm; I only sound it. A frightened patient bleeds faster, so I keep my voice level and save the shaking for after, when I'm alone and it's dark." },
      },
      choices = {
        { text = "That takes courage.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_healer = {
      lines = {
        { id = "xh_default", text = "Because the Light is generous, but you are not endless, and on a bad day you'll run dry before the wounded do. A bandage asks nothing of your spirit, so learn both and use the cheaper one first." },
      },
      choices = {
        { text = "Wise advice, Doctor.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_scourge = {
      lines = {
        { id = "xs_default", text = "I've never been asked that, and I'll confess I don't know. Flesh is flesh, I suppose, and if you're torn I'll stitch you, though I'd ask you to stand outside the tent while my soldiers sleep." },
      },
      choices = {
        { text = "Fair enough, Doctor.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know wounds, and I know what causes them in this marsh, which turns out to be most things. Ask." },
    },
    background = { { id = "tp_bg", text = "I patched soldiers in Lordaeron, and then on the boats, and now here. The wounds change; the work doesn't." } },
    advice = { { id = "tp_ad", text = "Clean the wound before you close it. Every bad death I've seen in this marsh started with a dirty bandage." } },
    _none = { { id = "tp_none", text = "Not a medical question, so not my concern. Ask someone without blood on their apron." } },
  },
}
