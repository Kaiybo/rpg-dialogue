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
    { id = "g_roost", text = "Mind the roost, {g:lad|lass}, it's slick. Everything on this island is slick, the birds included, and my beard's no' been dry since I got here." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the isle in one piece? Good, that's what I like to see from my passengers, aye." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A proper mountain face, out here in the bog! You'll know a gryphon when you see one, which saves me a speech." },
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look like the marsh chewed you and spat you out. Sit a while before you climb on, or you'll fall off over the Barrens." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They mind everythin' about the marsh, an' the spirits most of all, I'd wager. Gryphons are mountain birds, same as us, an' a swamp's no place for either." } },
      choices = {
        { text = "Mountain or marsh, every land has spirits worth respecting.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Aye. A dwarf belongs in stone, not this mud.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not these, not since the Lady made her peace, though I'd wager their grandsires flew against the Horde. They carry officers and post now, and I'd like it to stay that way, because a gryphon shot down over Brackenwall is a gryphon I don't get back." } },
      choices = {
        { text = "Good. The Lady's peace is worth keeping your birds home.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A war gryphon carrying the post. That's a waste.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They'd like to, and they'd come back covered in mud and stinking of crocolisk, so I feed them fish off the boats instead. A gryphon that learns to hunt the shallows starts diving at every log, and some of those logs bite back." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They'd like to, and they'd come back covered in mud and stinking of crocolisk, so I feed them fish off the boats instead. A gryphon that learns to hunt the shallows starts diving at every log, and some of those logs bite back. {pet} had better keep its head down near the roost, because my old hen has snatched a hare out of a man's arms before now." },
      },
      choices = {
        { text = "Keep them fed and disciplined. That's how a roost runs.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let them hunt. A gryphon ought to be wild.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Their feathers rot if I'm not careful, and their tempers rot faster. I lost an old bird last winter to a cough that wouldnae quit, and I'll tell ye, I buried him proper, behind the roost, an' I'm not ashamed of it." } },
      choices = {
        { text = "He served well. A proper burial was right.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It was only a beast, Baldruc. Don't grieve too long.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior, so you'll be heavy, and you'll want to ride with your shield, and the bird will hate both. Strap it down properly or walk." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter. Keep your beast away from the roost, because gryphons don't care how well trained it is, they only care whether it looks like food." },
        { id = "h_default", key = true,
          text = "Baldruc, and these are the Lady's gryphons, so treat them better than ye'd treat yerself. They carry the post, the officers and anyone with coin, and they hate the damp near as much as a dwarf from the dry tunnels of Ironforge does." },
        { id = "h_rain", when = { timeOfDay = "night" },
          text = "Night flights over the marsh are cold and black as a mine shaft. The birds know the way, so you just keep your head down and hold on." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, is it? If you can talk to beasts, tell my gryphons the damp won't kill them, because they won't believe it from me." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "Don't even think about borrowing a gryphon after dark, because they'll bite whoever's sitting on them and then come straight back to me." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage, and you'll be wanting to teleport home instead of using my gryphons, I suppose. That's fine, but don't come crying to me when you land somewhere damp." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Bless the birds if you like, because they've earned it, flyin' through this rain day in and day out without one word o' complaint, unlike me." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman. If ye can talk the marsh out o' bein' damp, the Lady's gryphons will build ye a statue, an' so will I." },
      },
      again = {
        { id = "h_again", text = "Something else, or shall I saddle one for ye?" },
        { id = "h_again2", text = "Ask away; the birds aren't going anywhere till I say so." },
      },
      choices = {
        { text = "Do your gryphons sense the dragons to the south?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Show me where they fly.", next = "BUSINESS" },
        { text = "Gryphons can't take kindly to a swamp.", next = "birds" },
        { text = "Do you ever fly over Brackenwall?", next = "horde" },
        { text = "The dragons in the south must bother your birds.", next = "dragons" },
        { text = "My people fly the winds too, after a fashion.", next = "x_skyborne", when = { race = "Skyborne" } },
        { text = "I'd rather ride my own mount, thanks.", next = "x_mount", when = { class = { "PALADIN", "WARLOCK" } } },
        { text = "Has anyone ever tried to steal one of your gryphons, Baldruc?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do mages really never use your gryphons, Baldruc?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do your gryphons ever carry soldiers into battle, Baldruc?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do your gryphons hunt in the marsh, Baldruc?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Your gryphons look miserable in this weather, Baldruc.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do your gryphons mind the marsh spirits, Baldruc?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Not today.", next = "END" },
      },
    },
    birds = {
      lines = {
        { id = "b_default", text = "They take it badly, and they'll tell you so at the top of their lungs. Gryphons are mountain birds, and every morning I'm out here oiling feathers and scraping mold off the perches so they don't take sick." },
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
    background = { { id = "tp_bg", text = "I came with the Lady's fleet and brought the birds with me from the Wildhammer roosts, and I've been drying them out ever since." } },
    advice = { { id = "tp_ad", text = "Never ride a wet gryphon into a cold wind. The bird won't forgive you, and neither will your knees." } },
    onyxia = { { id = "tp_onyxia", text = "The whelps out of the south marsh harry my gryphons something terrible, and a gryphon that's been chased by fire won't fly straight for a week. Nobody in Theramore wants that dragon gone more than I do." } },
    theramore = { { id = "tp_theramore", text = "Theramore's the dampest posting I've had, and I've been posted to Wetlands. The gryphons hate it, I hate it, and we're both still here." } },
    wildhammer = { { id = "tp_wildhammer", text = "The Wildhammer would laugh at me for fussing over feathers, but they don't have to fly gryphons through a swamp. Their birds are a fine breed, I'll say that much." } },
    ratchet = { { id = "tp_ratchet", text = "There's a boat to Ratchet and a gryphon to everywhere else, and I'd take the gryphon, though I'm hardly the one to ask." } },
    _none = { { id = "tp_none", text = "I know birds and weather and very little else, {g:lad|lass}. Try the citadel; they know everything there, or say they do." } },
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
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "It couldn't hurt, and it might help. The marsh feeds this whole island, so if the spirits want a word of thanks before supper, I'll put a bowl aside." } },
      choices = {
        { text = "Thank the land that feeds you. Always.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The marsh feeds us because we take from it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Ask any sergeant in Theramore whether he'd rather have a full company or a fed one, and he'll tell you they're the same thing. A man on hard bread fights for an hour, but a man on tortoise soup fights till supper, and then he wants seconds." } },
      choices = {
        { text = "Feed the line and it holds. You're right, Morgan.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A real warrior fights the same hungry or full.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Along the shore south of the island, where the mudrocks haul out to sun themselves, though they've grown wise to the soldiers I send. It takes a hunter's patience to catch one, because a tortoise with its head in its shell can wait you out till nightfall." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Along the shore south of the island, where the mudrocks haul out to sun themselves, though they've grown wise to the soldiers I send. It takes a hunter's patience to catch one, because a tortoise with its head in its shell can wait you out till nightfall. Don't let {pet} near the shell pile out back, or it'll crack a tooth, and then you'll be in here asking me for a soup it can drink." },
      },
      choices = {
        { text = "Take only what the kitchen needs. Leave the rest be.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Hunt them out. There are plenty more where those came from.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Every week, and they're always soldiers who've worked a double watch and can't wait for supper. I don't report them, I just feed them, because a man who steals bread is a man who's hungry, and hunger I can fix." } },
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
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Crab and crocolisk, mostly, and tubers from the wet ground north of the city that taste like dirt until you boil them twice. When the boats are late, it's the marsh that feeds this island, and I don't let anyone forget it." } },
      choices = {
        { text = "Take only what you need. The marsh must last.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Feed the city first. The marsh has plenty.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Nobody, if I can help it, though the boats come late and the marsh only gives so much. The refugees from Lordaeron eat first in my kitchen, and the officers grumble about it, but they grumble about everything, so I don't mind." } },
      choices = {
        { text = "Feeding the refugees first is right.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Officers keep this city safe. They should eat first.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Once, and it ate a whole wheel of cheese before its master noticed, and then it tried to blame the cat. I made the warlock pay for the cheese and wash every pot, and he came back the next week to say sorry, which was nice of him." } },
      choices = {
        { text = "I'll keep my imp out of your kitchen, Morgan.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If he's hungry, he eats. That's how it works.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior! You look like someone who's been living on hard bread, and that's no way to hold a wall, so come and have some soup." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter! If you've got mudrock tortoise in your pack, you and I are about to become very good friends." },
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
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf druid! The marsh gives us plenty, if you know where to look, and I imagine you know better than I do." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Sit, sit, you'll have soup before anything else, because I've never seen a holy warrior yet who couldn't do with a second bowl." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock in my kitchen! You can stay, but if that imp of yours puts so much as a claw in my soup pot, I'll ladle him straight back to wherever he came from." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Mudrock", min = 30 } }, text = "You've been thinning out the Mudrock tortoises, I can tell, because the fishermen say the shore's safe to walk again. If any of those came home in a sack, my soup pot's waiting." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, and a dwarf at that! I've cooked turtle for envoys and sailors alike, but never for someone who might thank the turtle." },
      },
      again = {
        { id = "h_again", text = "What else, while it simmers?" },
        { id = "h_again2", text = "Go on, I can stir and listen both." },
      },
      choices = {
        { text = "What does the marsh give that feeds Theramore?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Why tortoise soup?", next = "soup" },
        { text = "Who eats your cooking?", next = "eaters" },
        { text = "The marsh can't be easy on a cook.", next = "marsh" },
        { text = "I know a thing or two about stews.", next = "x_cook", when = { profession = "Cooking" } },
        { text = "Troll cooking would put fire in that pot.", next = "x_troll", when = { race = "Troll" } },
        { text = "Does feeding the soldiers feel like holy work, Morgan?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Who goes hungry in Theramore, Morgan?", next = "xapala", when = { class = "PALADIN" } },
        { text = "You sound as if a demon's been in your kitchen before, Morgan.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "I'll bring you what the pot needs.", next = "END", fx = { affinity = 2, standing = { theramore = 1 } } },
        { text = "I'd guess thieves raid your kitchen now and then, Morgan.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do you resent conjured food, Morgan?", next = "xmage", when = { class = "MAGE" } },
        { text = "Does soup really make a better soldier, Morgan?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Where do you find your tortoises, Morgan?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Should I thank the turtle, Morgan?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    soup = {
      lines = {
        { id = "s_default", text = "Because it's hot, it's filling and it keeps, and on an island in a swamp that's everything you want. Mudrock tongue's tough as leather until it's stewed half a day, and then it melts." },
      },
      choices = {
        { text = "Is it true you put bugs in it?", next = "soup_bugs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    soup_bugs = {
      lines = {
        { id = "sb_default", text = "Ah, you've heard. Don't make that face; a good crunch is a fine thing in a soup, and half the guards eat worse on patrol without knowing it." },
      },
      choices = {
        { text = "I'll try anything once.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "I'll take mine without, thanks.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    eaters = {
      lines = {
        { id = "e_default", text = "The Guard, mostly, and the sailors off the Kul Tiras ships who swear nothing tastes right after salt pork. Janene feeds the inn, and I feed the soldiers on the walls, and we argue about bread." },
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
        { id = "m_default", text = "Generous, if you've got a strong stomach and a stronger sword. There's crocolisk, there's tortoise, there's fish the size of a dinghy, and all of it wants to eat you before you eat it." },
      },
      choices = {
        { text = "A cook with a sword, then.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_cook = {
      lines = {
        { id = "xc_default", text = "Do you now? Then you'll know it wants patience and a lid that fits, and no amount of seasoning will save a stew you rushed. Bring me a better recipe than mine and I'll cook it for the whole Guard." },
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
    theramore = { { id = "tp_theramore", text = "Theramore is a hungry city, friend, all those soldiers and refugees, and they eat whatever the boats bring. I make the turtle stretch." } },
    jaina = { { id = "tp_jaina", text = "The Lady likes my chowder, or she's too polite to say otherwise, and either way I count it as a victory. She needs feeding more than anyone here." } },
    booty_bay = { { id = "tp_booty_bay", text = "The cooks in Booty Bay do things with sea salt and pepper that'd make a priest swear. I'd go back for a month and learn, if the place weren't full of pirates." } },
    lordaeron = { { id = "tp_lordaeron", text = "I cooked in a Lordaeron manor before the plague, roast and pudding every night. Now it's tortoise and marsh greens, and I'll confess the tortoise is growing on me." } },
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
    xpt_vanhowzen = {
      big = true,
      lines = { { id = "xpt_vanhowzen_default", text = "Sometimes, and I've seen a priest close a wound I'd given up on, so I don't scoff at it. But prayer won't tell you why a whole patrol came back from the Wyrmbog with the same rash, and a good physician will, so I'd want both of us in the room." } },
      choices = {
        { text = "The Light should come first, Doctor. Medicine is only a crutch.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Trust what you can test, Doctor. Faith can come second.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "What's ailing the soldiers now, Doctor?", next = "xpt_vanhowzen2" },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xpt_vanhowzen2 = {
      lines = { { id = "xpt_vanhowzen2_default", text = "Swamp fever, mostly, and the bites of things that crawl out of the water at night. I've written to Stormwind for supplies twice this season, and the second letter was considerably less polite than the first." } },
      choices = {
        { text = "I see. Let me ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "In speed, certainly. But spirits can fall silent and priests tire, and a bandage never does, so I'd have every healer in Theramore learn both." } },
      choices = {
        { text = "You're right. Discipline and bandages should back up every spell.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The spirits heal better than any bandage, Doctor.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Raptor bites to the forearm, mostly, from soldiers who raise a shield too late, and arrow wounds when the patrols run into whoever's camped out in the fens that week. I can close nearly all of them, provided the soldier walks in on his own feet and doesn't wait three days out of pride." } },
      choices = {
        { text = "I'll come in early. Pride's no use to a dead soldier.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A soldier fights on wounded. Pride is what keeps you standing.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "More often than my training ever prepared me for, because the scouts bring their wolves and cats to me when the marsh fever takes them. A bite is a bite and a fever is a fever, and I've found the stitches hold just as well in fur." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "More often than my training ever prepared me for, because the scouts bring their wolves and cats to me when the marsh fever takes them. A bite is a bite and a fever is a fever, and I've found the stitches hold just as well in fur. Let me see {pet}'s paws a moment." },
      },
      choices = {
        { text = "Every creature that's hurt deserves your care, Doctor.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Your time should go to soldiers, not animals.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { text = "A weapon wounds. Blame whoever holds it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "More than the Archmage would like me to say. A misjudged fireball burns the caster as easily as the target, and a frost spell held too long will take a finger. I bandage them, I tell them to be careful, and they come back the next month with the other hand." } },
      choices = {
        { text = "I'll practice with care. Recklessness helps no one.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Power has a price. A few burns are part of learning.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_vanhowzen", tags = { "news" }, when = { party = { class = "PRIEST" }, faction = "Alliance" },
          text = "You've a priest with you, I see. Good, because {companion} will save me a good many bandages, and the marsh fevers don't care how strong your sword arm is." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior. You'll be the one I see most of, then, so let me tell you now: come in when it's a scratch, not when it's a stump." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter. If you bring an animal in here, I'd ask you to wash its paws first, because I've only just scrubbed this floor." },
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
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. The tower sends me apprentices now and then with burns on their hands from spells gone wrong, and I'd be glad if you weren't the next." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. I teach field medicine, and I'd like to see how a shaman's healing compares with a clean bandage." },
      },
      again = {
        { id = "h_again", text = "Anything else? Quickly, I've dressings to change." },
        { id = "h_again2", text = "Ask, but keep washing while you do." },
      },
      choices = {
        { text = "I'd like to train.", next = "BUSINESS" },
        { text = "What's triage?", next = "triage", when = { any = { { profession = "First Aid" }, { questActive = TODO_QUEST("Triage") }, { questDone = TODO_QUEST("Triage") } } } },
        { text = "Where do your wounded come from?", next = "wounded" },
        { text = "You seem very calm for a surgeon here.", next = "calm" },
        { text = "I heal with the Light. Why bother with bandages?", next = "x_healer", when = { class = { "PRIEST", "PALADIN", "SHAMAN", "DRUID" } } },
        { text = "Do you treat the dead who walk, Doctor?", next = "x_scourge", when = { race = "Scourge" } },
        { text = "You must see a lot of poisoned wounds, Doctor.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Have you treated fel wounds before, Doctor?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What wounds do you see most from the soldiers, Doctor?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "I'd guess you treat beasts as well as soldiers, Doctor.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do mages often come to you hurt, Doctor?", next = "xmage", when = { class = "MAGE" } },
        { text = "Is a shaman's healing so different from yours, Doctor?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Could the Light do more for the sick than your medicines, Doctor?", next = "xpt_vanhowzen", when = { party = { class = "PRIEST" }, faction = "Alliance" } },
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
        { id = "ww_default", text = "Black ones, small and vicious, and their burns go deep. I treat them as I would any burn and pray, and I've begged the patrols to stay north of the old road altogether." },
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
        { text = "I'll wait outside the tent, Doctor.", next = "BACK", fx = { affinity = 1 } },
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
    scourge = { { id = "tp_scourge", text = "I treated plague victims in Lordaeron until there was no one left to treat, and then I treated the people fleeing it. I learned to keep a calm face, because there was nothing else I could give them." } },
    onyxia = { { id = "tp_onyxia", text = "I've treated dragonfire burns from the south marsh, and they don't heal like ordinary ones. There's something in the black flame that sits in the wound, and I've no name for it." } },
    holy_light = { { id = "tp_holy_light", text = "I'm a surgeon, not a priest, but I'll take the Light's help over bandages when a priest is to hand. Neither of us wins every time." } },
    theramore = { { id = "tp_theramore", text = "Theramore keeps me busy with fevers, crocolisk bites and soldiers who think a raptor wound will heal on its own. None of them heal on their own." } },
    jaina = { { id = "tp_jaina", text = "The Lady visits the infirmary every week and remembers every patient's name, which does more for them than half my medicines." } },
    _none = { { id = "tp_none", text = "Not a medical question, so not my concern. Ask someone without blood on their apron." } },
  },
}
