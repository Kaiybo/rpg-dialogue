-- Salma Saldean, Saldean's Farm. Voice: bibles/salma.md
-- Feeds anyone who needs a meal and someone to listen.
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "salma", id = TODO_NPC("Salma Saldean"), name = "Salma Saldean",
  bible = "bibles/salma.md", role = "farmer", tier = "quest",
  communities = { "westfall_farms" }, temper = { "steady" }, values = { "kind", "generous" },
  notices = { "hunger", "craft" },
  impression = {
    first = "Nobody leaves her door hungry, even if it takes murloc eyes.",
    third = "{name} met Salma Saldean, a Westfall cook who believes no visitor should leave her kitchen hungry.",
  },

  greetings = {
    { id = "g_op_leave_go", when = { opinion = { topic = "westfall_leave", stance = "go" } }, text = "There you are! I told Theodore you said go while there's a road, and he looked so relieved I gave him a second bowl." },
    { id = "g_welcome", text = "Come in, come in! There's always a pot on." },
    { id = "g_stew", when = { questActive = TODO_QUEST("Westfall Stew") }, text = "Here on stew business? Good, because the pot's getting impatient." },
    { id = "g_after", when = { questDone = TODO_QUEST("Westfall Stew") }, text = "There's my stew-gatherer! Sit down and eat something, you're far too thin." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and you look like you've not had a proper meal the whole time! Sit down, because the pot's on." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "My, you've grown broad since you were fetching murloc eyes for my stew. It must have been the stew, whatever you tell me." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "One of the neighbours has been saying lovely things about you, and I told them you've always eaten your stew without complaining." },
    { id = "g_word_helped", when = { word = "helped" }, text = "I hear you've been helping folk round the farms, and that warms me better than any stove. Come in and let me feed you for it." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! I can tell by how you looked at the pot. Taste that and tell me it needs nothing. Go on, lie to me." },
    { id = "n_hungry", cat = "hunger", when = { resSick = true },
      text = "You look like death warmed over, and I think you've met death recently. Sit by the stove. Death doesn't like my kitchen." },
    { id = "n_thin", cat = "hunger", when = { nearlyNaked = true },
      text = "Where are your clothes? And when did you last eat? Those two questions usually go together." },
  },

  start = "hello",
  nodes = {
    dd_fields_salma = {
      lines = {
        { id = "dd_fields_salma_a", text = "Not the ones you broke, anyway, though I'd swear there are more out by Moonbrook. Somebody's building those things, and building them on purpose, and Saldean won't say what he thinks about that in front of the little ones." },
      },
      choices = {
        { text = "Then I'll find who's building them and stop them.", next = "dd_fields_salma2", fx = { align = { order = 1 } } },
        { text = "Let the militia worry about that. Keep your children close.", next = "dd_fields_salma2", fx = { align = { order = -1 } } },
      },
    },
    dd_fields_salma2 = {
      lines = {
        { id = "dd_fields_salma2a", text = "Either way, I'll sleep better tonight than I have in a month, and that's your gift to this house. Come back for supper some evening, and bring an appetite, because there's always enough stew for one more." },
      },
      choices = { { text = "I might just do that. Something else.", next = "BACK" } },
    },

    op_leave = {
      lines = {
        { id = "op_leave_a", text = "Oh, you've asked the question that's ruined more suppers out here than any burnt stew. Theodore says go while there's a road, Saldean says stay till they bury him, and I stand in the middle with a ladle. What do you say, dear?" },
      },
      choices = {
        { text = "Stay. If the farmers leave, the Defias win for good.", next = "op_leave_1", fx = { opinion = { westfall_leave = "stay", westfall = "patience" }, align = { honor = 1 }, trait = { brave = 1 } } },
        { text = "Go. No field is worth a knife in the dark.", next = "op_leave_2", fx = { opinion = { westfall_leave = "go", westfall = "abandoned" }, align = { honor = -1 }, trait = { cautious = 1 } } },
        { text = "Stay or go, everyone should eat first.", next = "op_leave_3", fx = { opinion = { westfall_leave = "undecided" }, trait = { kind = 1 }, affinity = 2 } },
        { text = "I left once. I'm back now, and I'm staying.", next = "op_leave_4", when = { origin = "human_westfall_farmhand" }, fx = { opinion = { westfall_leave = "stay" }, affinity = 3 } },
        { text = "That's not my place to say, Salma.", next = "BACK" },
      },
    },
    op_leave_1 = {
      lines = { { id = "op_leave_r1", text = "That's Saldean's answer, and I'll tell him a stranger agrees with him, which will make him unbearable for a week. Still, staying's easier for those with a pitchfork and a full larder." } },
      choices = { { text = "Something else, Salma.", next = "BACK" } },
    },
    op_leave_2 = {
      lines = { { id = "op_leave_r2", text = "Theodore will be glad to hear it, and Verna will cry, and I'll pretend I'm not. There's no shame in going, dear; there's only shame in what drove them out." } },
      choices = { { text = "Something else, Salma.", next = "BACK" } },
    },
    op_leave_3 = {
      lines = { { id = "op_leave_r3", text = "Now that's an answer I can cook to. Sit down, then, because the pot's on and nobody leaves my kitchen hungry, staying or going." } },
      choices = { { text = "Something else, Salma.", next = "BACK" } },
    },
    op_leave_4 = {
      lines = { { id = "op_leave_r4", text = "Are you, now? Then you'll eat here every night you're near, and I'll hear no argument. A Westfall child coming home is the best news this kitchen's had all year." } },
      choices = { { text = "Something else, Salma.", next = "BACK" } },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Whatever's to hand, dear: goretusk, onions, and maybe a murloc eye if I'm short, and your spirits needn't fret, because it's filling." } },
      choices = {
        { text = "A full pot for anyone hungry is a blessing, Salma.", next = "BACK", reply = "It's no more than my mother taught me, dear, but I'll take the kind word. Sit and eat, if you're hungry.", fx = { align = { light = 1 } } },
        { text = "Murloc eyes? You should feed your own first.", next = "BACK", reply = "Saldean eats first, dear, and he grumbles about it, and then the rest of the pot goes out. Nobody in my house goes hungry.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Maybe it does, and I'd be lying if I said I've never wondered about some of the thin young men who come to my door at dusk. But a hungry boy is a hungry boy, and I'll fill him with stew before I let him fill his pockets from my larder." },
        { id = "xrogue_more1", text = "If you're asking whether I'd feed you, the answer's the same, and I'll not ask where you've been." },
      },
      choices = {
        { text = "Then your rule is a good one, and I'll respect it.", next = "BACK", reply = "Thank you, dear, and I can tell you mean it. Mind you wipe your feet on the way in.", fx = { align = { honor = 1 } } },
        { text = "Fill them up, then. It makes them easier to rob.", next = "BACK", reply = "Oh, you cheeky thing, I've a wooden spoon for talk like that. Eat your stew and behave.", fx = { align = { honor = -1 } } },
        { text = "Something else, Salma.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every one that comes by, and some twice a day, and they never say no to seconds. A fighter on an empty belly is no use to anyone, so I feed them, and they keep the thieves off my doorstep." } },
      choices = {
        { text = "I'll eat, and I'll keep the thieves away.", next = "BACK", reply = "That's a fair trade, and you'll get the best of it. Seconds are on the stove, dear.", fx = { align = { honor = 1 } } },
        { text = "I'll eat, but the thieves aren't my problem.", next = "BACK", reply = "Then eat, dear, and I'll feed the ones who do care. A full belly might change your mind.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Bless you, but conjured bread fills a belly for an hour and leaves a body hungrier after. My pot's got real murloc in it and real carrots, and that'll keep a militia man walking till supper." } },
      choices = {
        { text = "A proper kitchen beats any spell. You're right.", next = "BACK", reply = "It does, dear, and I'm glad someone in this house agrees. Saldean only eats what's in front of him.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Bread is bread, Salma. Take what magic gives.", next = "BACK", reply = "Your bread's very nice, I'm sure, dear, but it won't feed a farmer through a harvest. I'll stick with my pot.", fx = { align = { order = -1 } } },
        { text = "What's in the pot today?", next = "pot" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "I've fed Defias boys and Stormwind soldiers at the same table, so I'll not turn you away for whatever's following at your heel. Only keep it out of my kitchen, because I've a feeling it would sour the milk." } },
      choices = {
        { text = "Kindness is its own power, Salma. Keep giving it.", next = "BACK", reply = "It is, dear, and it's the only one I've got. Keep yours outside, and you're welcome to the stew.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Kindness gets farmers killed out here.", next = "BACK", reply = "Maybe, but cruelty gets them killed faster. I'll keep my rule, and the Light can sort the rest.", fx = { align = { light = -1 } } },
        { text = "Why do you feed everyone?", next = "fed" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Never, not even the Defias boys, who come down thin and ashamed and eat with their masks in their laps. A full belly keeps a lad off the road better than any sword, in my experience." } },
      choices = {
        { text = "Defias at your table should still answer to the law.", next = "BACK", reply = "They will answer, dear, someday, to someone. But they'll answer on a full belly in my house.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Your house, your rules. The law can wait outside.", next = "BACK", reply = "That's right, and the law can have a bowl too, if it knocks politely.", fx = { align = { order = -1 } } },
        { text = "Something else, Salma.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "A few onions and a row of okra behind the house, and they come up small and bitter in this dust. Saldean says the earth's given up, but I tell him it's only tired, the same as the rest of us." } },
      choices = {
        { text = "Keep sowing your rows. Steady work brings the soil back.", next = "BACK", reply = "That's what I tell Saldean, and he never listens. Steady and patient, like a pot on the boil.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the wild herbs take that plot. They know this dust better.", next = "BACK", reply = "Herbs would be nice, dear, but you can't make a stew of herbs alone. I'll keep my onions.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "dd_fields_salma", when = { questDone = TODO_QUEST("The Killing Fields") },
          text = "My husband tells me you broke up those harvest watchers in our fields, and he's been whistling at supper ever since. I don't know how you did it, but I'll thank you, because I'd stopped letting the children out after dark." },

        { id = "h_alt_any", when = { alt = true, metBefore = false },
          text = "Come in and sit, because you've the same hungry look {alt} had when that one came to my door, and I fed that {altclass} until the pot was scraped clean." },
        { id = "h_alt_kin", when = { alt = { kin = true }, metBefore = true }, cooldown = "5d",
          text = "{alt} was by again with a bag of goretusk livers, and I said to Saldean that you two must be kin, the way you both turn up just when I'm short of something." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Goretusk", min = 20 } }, text = "I've heard you've been thinning out the goretusks, and Saldean says the fields are quieter for it. Bring me a liver or two while you're at it, because nothing goes to waste in this kitchen." },
        { id = "h_default", key = true, text = "I'm Salma. My husband farms and I cook, and anyone who comes to that door hungry leaves full. That's the rule of this house." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Westfall Stew") },
          text = "In the lean years, Westfall cooks made do with murloc eyes and buzzard meat, and these are lean years, so don't make that face." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Westfall Stew") },
          text = "Whatever the list says, bring it. Murloc eyes are better than they sound. Most things are, in a stew." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Westfall Stew"), days = 3 } },
          text = "Three pots were gone by sundown, and half the hill came down for it. One of them cried into his bowl, and I didn't ask why." },
        { id = "h_pie", when = { questActive = TODO_QUEST("Goretusk Liver Pie") },
          text = "Goretusk liver, and fresh this morning. A pie's only as good as what's in it, and that's a fact Verna will argue with." },
        { id = "h_furlbrows", when = { topicKnown = "old_blanchy" },
          text = "Verna and Theodore are up at the old Jansen place, poor dears, since their wagon broke. Theodore's pride broke worse than the wheel did." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "You're thin as a rake, even for an elf, so sit down. Sky or no sky, everyone eats at my table." },
        { id = "h_thin", when = { metBefore = true }, text = "Sit down, sit, you're thinner than last time. Everyone's thinner in Westfall these days, and I won't have it at my table." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Himself's asleep in the chair again, snoring like a harvest golem. Don't you dare tell him I said so." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "Oh, it's you! I've been keeping a bowl warm in case you came by, and don't you dare say you've already eaten." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior at my door! You'll eat, then, because that's the rule, and you'll eat twice because you look like you need it." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin at my table! Sit down, and take off those gauntlets, because nobody eats my stew in steel." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf at my door, and thin as a willow switch! Sit down, druid, because I don't care what shape you came in, you'll leave fed." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "You came up to my door so quiet I nearly hit you with the ladle. Sit down, you'll eat like everyone else." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! There's stew on the stove for anyone hungry, shaman or no. Sit down and eat." },
      },
      again = {
        { id = "h_again", text = "What else, then? Sit yourself down and ask while I stir." },
        { id = "h_again2", text = "Anything more? The pot won't mind waiting, or not much." },
      },
      choices = {
        { text = "The harvest watchers won't scare your children now.", next = "dd_fields_salma", when = { questDone = TODO_QUEST("The Killing Fields") } },

        { text = "What's cooking?", next = "pot" },
        { text = "I don't know how you keep going out here.", next = "going" },
        { text = "You look like you could use help around the farm.", next = "help" },
        { text = "Who are your neighbours out here?", next = "furlbrows" },
        { text = "You do a priest's work with that ladle.", next = "priest", when = { class = "PRIEST" } },
        { text = "Any tricks for a fellow cook?", next = "cook", when = { profession = "Cooking" } },
        { text = "Could you spare a scrap for {pet}?", next = "pet", when = { class = "HUNTER", pet = { type = "Beast" } } },
        { text = "I could conjure bread for your pot, Salma.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Does your kindness feed strays like me too?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do the militia warriors eat at your table, Salma?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "I'd guess you never turn anyone away from your table, Salma.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you grow anything yourself, Salma, or is it all gathered?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Doesn't feeding everyone mean feeding Defias too, Salma?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What's in today's stew, Salma?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I tended the Militia's wounded, Salma. You fed them.", next = "xorig_militiahealer", when = { origin = "human_sentinel_hill_healer" } },
        { text = "I'd best be off.", next = "END" },
      },
    },
    xorig_militiahealer = {
      lines = {
        { id = "xomilitiahealer_default", text = "Oh, I remember you! You'd come to my door at midnight with blood to your elbows and eat standing up, then go straight back up the hill. Do you still eat standing up, love, or has somebody finally taught you to sit?" },
      },
      choices = {
        { text = "I'm learning to sit, Salma.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Not while the Defias are still out there.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pot = {
      lines = {
        { id = "p_default", text = "Whatever Westfall gives me, and today it gave me a buzzard and some regret. It'll be lovely." },
      },
      choices = {
        { text = "Smells wonderful.", next = "BACK", fx = { affinity = 1 } },
        { text = "Buzzard?", next = "vulture", fx = { trait = { witty = 1 } } },
        { text = "Westfall stew must have a recipe of its own.", next = "recipe" },
      },
    },
    vulture = {
      lines = { { id = "v_default", text = "Buzzard, and a fat one, since they eat better out here than the farmers do." } },
      choices = { { text = "Fair point. Something else.", next = "BACK" } },
    },
    recipe = {
      lines = { { id = "re_default", text = "It takes vulture, goretusk snout, murloc eyes and okra to thicken the broth. It's Verna's recipe, and she wrote it out for me herself, so don't tell her I add salt." } },
      choices = {
        { text = "Verna's? I thought it was yours.", next = "recipe_verna" },
        { text = "Something else.", next = "BACK" },
      },
    },
    recipe_verna = {
      lines = { { id = "rv_default", text = "Hers, start to finish. She wanted it to stay in Westfall when they go. She was born for the city, whatever she tells you, and Elwynn will be the making of her." } },
      choices = {
        { text = "I'm not sure Verna wants to leave.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "You'll miss her.", next = "furlbrows_miss" },
      },
    },
    cook = {
      lines = { { id = "ck_default", text = "Never stir murloc eyes, because they look back at you, and always salt early. Then feed it to people hungry enough not to complain; that's the real secret." } },
      choices = { { text = "I'll remember that.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } } },
    },
    going = {
      big = true,
      lines = {
        { id = "g_default", text = "You feed people, and they come back. You listen to them, and they stay. Do that long enough and you've got a village again." },
      },
      choices = {
        { text = "That's a fine way to live.", next = "BACK", reply = "It's the only one I know, dear. Sit, eat, and tell me where you've come from.", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Feeding thieves only teaches them where the food is.", next = "BACK", reply = "Then they know where to find a kind word, too. I'll take that trade.", fx = { align = { light = -1 } } },
        { text = "It won't stop the Defias.", next = "defias", fx = { trait = { stern = 1 } } },
      },
    },
    defias = {
      lines = { { id = "d_default", text = "No, that's Gryan Stoutmantle's work, up on Sentinel Hill. Mine is making sure there's someone left to thank him." } },
      choices = {
        { text = "Have you ever fed a Defias at this door?", next = "fed" },
        { text = "I'll leave that be. Something else.", next = "BACK" },
      },
    },
    fed = {
      big = true,
      lines = { { id = "fe_default", text = "I have. A hungry boy in a red mask is still a hungry boy, and he said thank you, and he's left my hens alone ever since, and the fox could stand to learn from him." } },
      choices = {
        { text = "That's real kindness.", next = "BACK", reply = "It's just stew and manners, dear, but thank you. He's a good boy underneath it.", fx = { affinity = 2, align = { light = 2 }, trait = { kind = 1 } } },
        { text = "He'll rob someone else tomorrow.", next = "BACK", reply = "Maybe he will, dear, and maybe he won't, and I've no way to know. But he'll not rob me, and that's a start.", fx = { align = { light = -1 }, affinity = -1, trait = { stern = 1 }, opinion = { defias = "hardline" } } },
        { text = "Did that boy ever tell you anything, Salma?", tag = "Persuade", next = "fed_boy",
          check = { pass = { any = { { disposition = { min = 62 } }, { class = "PRIEST" }, { questDone = TODO_QUEST("Westfall Stew") } } } },
          fail = { next = "fed_pot", fx = { affinity = -1 } } },
      },
    },
    help = {
      lines = {
        { id = "he_default", text = "Always! Most of the able folk left, and my husband's back isn't what it was, so bring me what the pot needs and you'll eat first." },
        { id = "he_pie", when = { questBefore = TODO_QUEST("Goretusk Liver Pie") },
          text = "Always! My meat pie's ready but for the filling, so bring me goretusk livers, fresh, and there's pie for supper, with a slice for you too." },
      },
      choices = {
        { text = "What does the pie need?", next = "pie" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pie = {
      lines = { { id = "pi_default", text = "The crust's baked and the gravy's on. All it wants is eight goretusk livers, fresh. The boars out past the Molsen farm will do." } },
      choices = {
        { text = "I'll go boar hunting.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    furlbrows = {
      lines = { { id = "fu_default", text = "The Furlbrows, up at the old Jansen place. Verna's my dearest friend out here. Theodore's a good man who lost his nerve with his farm. They'll be off to Elwynn the minute that wagon rolls." } },
      choices = {
        { text = "Should folk leave Westfall, or stay and see it through?", next = "op_leave" },
        { text = "Will you miss them?", next = "furlbrows_miss" },
        { text = "Something else.", next = "BACK", fx = { learn = { "old_blanchy" } } },
      },
    },
    furlbrows_miss = {
      lines = { { id = "fm_default", text = "Like my right arm, but don't tell Verna. She'll cry, then I'll cry, and then the pot burns." } },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 2 } } },
    },
    priest = {
      lines = { { id = "pr_default", text = "Oh, go on with you! Say a word over the pot, then. The militia lads eat better when it's blessed, or they think they do, which comes to the same thing." } },
      choices = {
        { text = "Gladly. Light bless this house and all it feeds.", next = "BACK", reply = "Oh, that's lovely, dear, you'll make the lads smile. Now go on, have a bowl.", fx = { affinity = 3, align = { light = 1 }, standing = { westfall_farms = 1 } } },
        { text = "I'd rather not bless a soup pot, Salma.", next = "BACK", reply = "Oh, suit yourself, dear, the soup won't mind. The lads might notice, though.", fx = { align = { light = -1 } } },
        { text = "Do you ever get to a church?", next = "priest_church" },
      },
    },
    priest_church = {
      lines = { { id = "pc_default", text = "Not since the roads went bad, so I pray at the stove. The Light knows where to find me; it's always warm here." } },
      choices = {
        { text = "It does, and the Light always finds the warm places first.", next = "BACK", reply = "That's a sweet thing to say, dear, and I'll believe it. The stove's always on.", fx = { align = { light = 1 } } },
        { text = "Warm or not, I doubt the Light looks in kitchens.", next = "BACK", reply = "Well, I doubt you've looked in many kitchens, dear. The Light's been in mine every morning.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fed_boy = {
      lines = {
        { id = "fb_default", text = "Only once, and quietly, with his mouth full. He said to keep the lamp dark and the door barred on the nights the gnolls come up from the river, because the masks ride behind them and they don't ask whose house it is." },
        { id = "fb_after", text = "So I do, and I've told Himself it's to save oil, and I've told nobody else at all until now. He wasn't a bad boy, you know; he just ate like one who'd forgotten what a table was for." },
      },
      choices = {
        { text = "That warning might save lives. Tell Gryan.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Your kindness bought you that.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    fed_pot = {
      lines = {
        { id = "fp_default", text = "Tell me? He told me the stew was good, which it was, and then he went. Now, have you eaten, because you're changing the subject on an empty stomach." },
        { id = "fp_default2", text = "What's said at my table stays at my table, dear, whoever says it. That's the other rule of this house, and it's older than the first." },
      },
      choices = {
        { text = "Suits me, Salma.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pet = {
      lines = { { id = "pet_l", text = "Oh, look at the poor thing, ribs like a fence. Here, the end of the stew bone; nobody goes hungry at my fire, and that includes the four-legged." } },
      choices = {
        { text = "Thank you, Salma. {pet} won't forget.", next = "pet2", fx = { affinity = 2 } },
        { text = "{pet} hunts for itself, but thank you.", next = "pet2", fx = { trait = { stern = 1 } } },
      },
    },
    pet2 = {
      lines = { { id = "pet2_l", text = "Hunting out here? There's nothing left to hunt but vultures and the Furlbrows' poor old horse. Take the bone." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    holy_light = { { id = "tp_holy_light", text = "I say grace over every pot I cook, and I don't ask whether the guest at my table says it too. The Light feeds us both, and it may as well find us both thankful." } },
    deadmines = { { id = "tp_deadmines", text = "The Defias are hiding in the mines under Moonbrook, they say, and they're eating our grain while they're down there. I hope they choke on it, though I'd feed them myself if they came to my door hungry." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "I bought a recipe at the Darkmoon Faire once from a dwarf who swore it would make even murloc palatable. He wasn't lying, and that's why there's murloc in tonight's stew." } },
    booty_bay = { { id = "tp_booty_bay", text = "A sailor from Booty Bay stopped here once and told me the goblins eat crocolisk tail fried in butter. I've never seen a crocolisk, but I've got butter, and I've thought about it a good deal since." } },
    second_war = { { id = "tp_second_war", text = "My mother fed soldiers on this farm during the Second War, and she said a hungry man is more dangerous than an orc. I've kept her pot on the stove ever since." } },
    knows = {
      { id = "tp_knows", text = "Half of Westfall eats at my table sooner or later, and they all talk with their mouths full. Ask me about any of this while I stir." },
    },
    background = { { id = "tp_bg", text = "I'm a farmer's wife with a big pot and a long table. That's all anyone needs to know about me." } },
    advice = { { id = "tp_ad", text = "Eat before you fight, not after. And never trust a cook who won't taste her own stew." } },
    trade = { { id = "tp_tr", text = "I cook for whoever comes, and they can pay me in boar livers and stories.", next = "help" } },
    defias = { { id = "tp_defias", text = "Some of them have come to my door, you know, hungry, and I fed them. I'd do it again." } },
    people_militia = { { id = "tp_militia", text = "Good boys and girls, every one, and they all eat at my table before patrol." } },
    westfall = { { id = "tp_westfall", text = "It'll come back. Land always comes back if there's people who love it." } },
    old_blanchy = { { id = "tp_blanchy", text = "That horse has more years than sense. Verna loves her like a daughter." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know about that. More stew?" } },
  },
}
