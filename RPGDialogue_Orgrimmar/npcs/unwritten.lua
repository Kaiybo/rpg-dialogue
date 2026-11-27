-- Orgrimmar folk with no conversation yet: the orphanage in the Drag, the war-effort collectors and the
-- Alliance ambassador in the Valley of Spirits, holiday merchants, Broken Tusk regulars, and a few
-- shopkeepers and quest-givers the roster scan missed.
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Orphan Matron Battlewail: keeps the orphanage in the Drag with Tosamina.
P:NPC {
  key = "og_matron_battlewail", id = TODO_NPC("Orphan Matron Battlewail"), name = "Orphan Matron Battlewail", gender = "female",
  role = "matron", tier = "quest",
  communities = { "orgrimmar" }, temper = { "stern", "warm" }, values = { "family", "duty" },
  notices = { "race", "class" },
  impression = {
    first = "Orphan Matron Battlewail stands in the orphanage doorway in the Drag with her arms folded and a wooden spoon tucked into her belt like a war axe. Children's voices clatter behind her, and she hears every one of them.",
    third = "{name} met Orphan Matron Battlewail, who keeps the orphanage in Orgrimmar's Drag.",
  },
  greetings = {
    { id = "g_default", text = "Wipe your boots before you come any closer, {class}. I have scrubbed this step twice today already." },
    { id = "g_back", when = { metBefore = true }, text = "You again. The little ones still ask about the warrior who stood in my doorway, so you made an impression on somebody." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" }, text = "An orc grown and armed. Half the children in here want to be you, and the other half want to be the Warchief, so mind how you behave in front of them." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" }, text = "A warrior. Every child in here lost a warrior, so do not be surprised if they stare at you." },
  },
  start = "hello",
  nodes = {
    w2spoon = {
      lines = { { id = "w2sp_default", text = "Stirring the stew, and pointing at children, and once, only once, for rapping a grunt across the knuckles when he tried to recruit one of my boys at the door. Word went round the barracks, and I have not had to raise it since." } },
      choices = {
        { text = "The grunt let you strike him?", next = "w2spoon2" },
        { text = "A spoon is a fine weapon in the right hands.", next = "w2spoon2" },
        { text = "Something else, Matron.", next = "BACK" },
      },
    },
    w2spoon2 = {
      lines = {
        { id = "w2sp2_orc", when = { race = "Orc" }, text = "He was raised by an orc mother like you were, {class}, so he knew better than to argue with a spoon. He came back the next week with a sack of turnips and an apology, and the children named him Turnip until he left for the Barrens." },
        { id = "w2sp2_default", text = "He had an orc mother once, so he knew better than to argue with a spoon. He came back the next week with a sack of turnips and an apology, and the children called him Turnip until he left for the Barrens." },
      },
      choices = { { text = "Turnip. I like that.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    mb_tosamina = {
      lines = { { id = "mb_tosamina_l", text = "She is, and she is younger than I am, which helps more than she knows. Tosamina chases them over the rooftops while I chase them through their lessons, and between us we lose one child a week for an hour, which is a good record." } },
      choices = {
        { text = "Only for an hour, thankfully.", next = "mb_tosamina2" },
        { text = "Where do they usually end up?", next = "mb_tosamina2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mb_tosamina2 = {
      lines = { { id = "mb_tosamina2_l", text = "At the wolf kennels, most often, where Ogunaro lets them pet the pups until I come for them. He pretends to be angry with them, but he saves the gentlest pup for the smallest child, every time." } },
      choices = {
        { text = "Ogunaro has a soft heart, then.", next = "BACK" },
        { text = "Something else, Matron.", next = "BACK" },
      },
    },
    mb_fear = {
      lines = { { id = "mb_fear_l", text = "Being forgotten, more than any monster. A child who has lost her parents is afraid that no one will remember she was ever here, and so I keep a book with every name in it." } },
      choices = {
        { text = "That's a good thing you do.", next = "mb_fear2" },
        { text = "Every orc should be remembered.", next = "mb_fear2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mb_fear2 = {
      lines = { { id = "mb_fear2_l", text = "I read the names aloud on the first night of the children's week, every one of them, the living and the dead. It takes most of the evening, and the little ones fall asleep before the end, but they wake up knowing their name is in there." } },
      choices = {
        { text = "Children need strength more than comfort.", next = "BACK", reply = "They need both, {class}, and they'll get strength from the world soon enough. In this house, they get the comfort first.", fx = { align = { honor = -1 } } },
        { text = "Remembering them is the Horde's duty.", next = "BACK", reply = "It is, and I'm glad to hear a warrior say so. Come and listen on the first night, if you're in the city.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "childrens_week" } } },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "I am Matron Battlewail, and this house is for the children the wars left behind. Tosamina and I feed them, mend them and teach them to be orcs, which is three jobs and none of them easy." } },
      again = {
        { id = "h_again", text = "What else? Speak quickly, before someone climbs onto the roof again." },
        { id = "h_again2", text = "I am listening, {class}, though I am also counting heads." },
      },
      choices = {
        { text = "How did these children come to be here?", next = "how" },
        { text = "Is there anything I could do for them?", next = "help" },
        { text = "You must have fought once yourself.", next = "fought" },
        { text = "I was raised without parents too.", next = "orphan", when = { race = "Orc" } },
        { text = "Tosamina seems tireless with the children.", next = "mb_tosamina" },
        { text = "What do the children fear most?", next = "mb_fear" },
        { text = "What's the wooden spoon in your belt for?", next = "w2spoon" },
        { text = "Farewell, Matron.", next = "END" },
      },
    },
    how = {
      lines = { { id = "w_default", text = "Some lost their parents in the camps, some in the fighting at Hyjal, and some to the centaur and the quilboar since we came to this land. The Horde made a home of Durotar, but a home still costs blood to keep." } },
      choices = {
        { text = "What becomes of them when they're grown?", next = "grown" },
        { text = "Something else, Matron.", next = "BACK" },
      },
    },
    grown = {
      lines = { { id = "gr_default", text = "Most take up the axe, because the Horde needs them and they know nothing else. I try to teach a few of them other trades as well, so that not every one of my children goes the way their parents went." } },
      choices = {
        { text = "The Horde needs warriors. Let them fight.", next = "fightpath" },
        { text = "They deserve a life beyond the battlefield.", next = "otherpath" },
      },
    },
    fightpath = {
      lines = { { id = "fp_default", text = "It does, and I will not pretend otherwise. But I have buried too many of my old charges already, so forgive me if I hope a few of them grow up to be smiths." } },
      choices = {
        { text = "A strong Horde keeps them safe.", next = "BACK", reply = "Strength keeps them alive, aye, but it is love that makes them worth keeping alive.", fx = { align = { honor = 1 } } },
        { text = "A child should choose their own road.", next = "BACK", reply = "Spoken like someone who had a choice. I am glad you did.", fx = { align = { honor = -1 } } },
      },
    },
    otherpath = {
      lines = { { id = "op_default", text = "So I say, though not too loudly in this city. A smith or a cook or a shaman serves the Horde as well as any grunt, and lives a good deal longer doing it." } },
      choices = { { text = "Something else, Matron.", next = "BACK", fx = { affinity = 1 } } },
    },
    help = {
      lines = { { id = "hp_default", text = "In the week of the children, when the city honors its orphans, I let grown warriors take one of my little ones out to see the world. Come back then and I will find you a child who needs showing it.", fx = { learn = { "childrens_week" } } } },
      choices = {
        { text = "I'll come back for that week.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fought = {
      lines = { { id = "f_default", text = "I carried an axe in the Second War, and I carried the demon blood in me like the rest. When Thrall freed us, I found I had no more stomach for killing and a great deal of it for raising, so here I am." } },
      choices = { { text = "Something else, Matron.", next = "BACK" } },
    },
    orphan = {
      lines = { { id = "o_default", text = "Then you know what these little ones carry, and you know they can carry it a long way. Grow strong and come back to show them so, {class}, because that is worth more to them than coin." } },
      choices = { { text = "I will. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I fought, I was caged, and now I mind other orcs' children. Of the three, the minding is the hardest work." } },
    _none = { { id = "tp_none", text = "I have forty children to think about, {class}. That question will have to wait its turn behind all of them." } },
  },
}

-- Horde Orphan: one of Matron Battlewail's charges in the Drag.
P:NPC {
  key = "og_horde_orphan", id = TODO_NPC("Horde Orphan"), name = "Horde Orphan",
  role = "child", tier = "service",
  communities = { "orgrimmar" }, temper = { "curious", "bold" }, values = { "family" },
  impression = {
    first = "A small orc child in a patched tunic stares up at you with frank interest, mostly in your weapon.",
    third = "{name} talked with one of the orphans of Orgrimmar.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Hey, it's you! Matron says you're nice! Can I touch your axe? Just once?" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Is that a real axe? Matron says I can't touch real axes, or talk to strangers like you." },
    { id = "g_default", text = "Is that a real axe? Matron says I can't touch real axes until I'm bigger, but I'm bigger than I was last week." },
  },
  start = "hello",
  nodes = {
    w2thrall = {
      lines = { { id = "w2th_default", text = "Once! I climbed on a crate outside Grommash Hold and he walked right past, and he's bigger than the door, nearly. He looked at me and nodded, like I was a grunt, and I didn't wash that side of my face for a week." } },
      choices = {
        { text = "Did he say anything to you?", next = "w2thrall2" },
        { text = "You should wash your face, little one.", next = "w2thrall2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2thrall2 = {
      lines = { { id = "w2th2_default", text = "He said, 'Get down before you fall,' which Matron says is the most sensible thing anybody important has ever said. But he said it to me, and nobody else, so it counts." } },
      choices = { { text = "It certainly counts.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "I live at the orphanage with Matron Battlewail and about a hundred other kids, or maybe forty, I always lose count. When I grow up I'm going to be a warrior like the Warchief, and nobody's going to cage me ever." } },
      again = { { id = "h_again", text = "Are you still here? Tell me about a fight you won, please!" } },
      choices = {
        { text = "What happened to your parents?", next = "parents" },
        { text = "Tell me about the Matron.", next = "matron" },
        { text = "What do you want to be when you grow up?", next = "xgrow" },
        { text = "What do you do all day?", next = "xday" },
        { text = "I was an orphan too, little one.", when = { race = "Orc" }, next = "xme" },
        { text = "Who's your best friend here?", next = "y_friend" },
        { text = "What scares you?", next = "y_scared" },
        { text = "Do you know any trolls?", next = "y_trolls" },
        { text = "Have you ever seen the Warchief?", next = "w2thrall" },
        { text = "Run along now.", next = "END" },
      },
    },
    parents = {
      lines = { { id = "p_default", text = "My father fought at Mount Hyjal and didn't come back, and Matron says that makes him a hero. I would rather he was here, though, even if he wasn't a hero at all." } },
      choices = {
        { text = "He died with honor. Be proud of him.", next = "BACK", reply = "I am proud. I'm going to be a hero too, but I'm going to come back after.", fx = { align = { honor = 1 } } },
        { text = "It's all right to just miss him.", next = "BACK", reply = "Matron says that too, when nobody else is listening.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    matron = {
      lines = { { id = "m_default", text = "She's scary when you climb on the roof, but she makes the best stew in Orgrimmar and she knows everybody's name. Tosamina helps her, and Tosamina lets us stay up late sometimes." } },
      choices = { { text = "Sounds like a good home. Something else.", next = "BACK" } },
    },
    xgrow = {
      lines = {
        { id = "xgrow_default", text = "A grunt like the ones at the gate, with big shoulders and an axe, and I'll stand very still and nobody will get past me ever. Or a wolf rider, because the wolves are faster." },
      },
      choices = {
        { text = "Why a wolf rider?", next = "xwolf" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwolf = {
      lines = {
        { id = "xwolf_default", text = "Because they go everywhere, all over Durotar and the Barrens, and they never have to walk. Matron says the wolves bite, but the wolf at the gate let me pat him once and only growled a little." },
      },
      choices = {
        { text = "Be careful with the wolves.", next = "xcareful" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcareful = {
      lines = {
        { id = "xcareful_default", text = "I am careful! Mostly. Do you think it's better to be brave or to be careful?" },
      },
      choices = {
        { text = "Brave. A warrior never backs down.", next = "BACK", reply = "I knew it! I'm going to tell Matron you said so.", fx = { align = { order = -1 } } },
        { text = "Careful. Listen to the Matron.", next = "BACK", reply = "That's what everybody says. Grown-ups all say the same things.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xday = {
      lines = {
        { id = "xday_default", text = "Chores, mostly, and Matron makes us learn our letters, which is boring. Then I sneak out to watch the grunts train in the Valley of Honor until somebody sends me back." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xme = {
      lines = {
        { id = "xme_default", text = "Really? And you grew up big and strong anyway? Then maybe I will too, if I eat everything Matron gives me, even the grey stuff." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_friend = {
      lines = {
        { id = "y_friend_d", text = "Grukk, but he's not my friend this week because he took my wooden axe. Before that it was Grukk, and I think next week it'll be Grukk again, because he always gives it back." },
        { id = "y_friend_orc", when = { race = "Orc" }, text = "Grukk! He's an orc like you, but smaller, and he took my wooden axe. He always gives it back, so we'll be friends again soon." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_scared = {
      lines = { { id = "y_scared_d", text = "Nothing! Except maybe the dark in the big room after Matron puts out the lamp, and the noises the wind makes on the cliffs. And the man in the shadows in the Cleft who looks at you funny." } },
      choices = {
        { text = "Which man in the shadows?", next = "y_cleft" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_cleft = {
      lines = { { id = "y_cleft_d", text = "The ones in the Cleft of Shadow with the purple robes. Matron says never go down there. I went down there once anyway, but only a little bit. Should I tell Matron I did?" } },
      choices = {
        { text = "Yes. Tell her the truth.", next = "BACK", reply = "Fine, but she's going to be really cross.", fx = { align = { order = 1 } } },
        { text = "It can be our secret.", next = "BACK", reply = "Really? You're the best grown-up I ever met!", fx = { align = { order = -1 } } },
      },
    },
    y_trolls = {
      lines = { { id = "y_trolls_d", text = "A troll lady sells fish in the Drag and she gives me the heads for free. She says the eyes are the best part. I don't think the eyes are the best part." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    thrall = { { id = "tp_x_thrall", text = "The Warchief came to the orphanage once! He was so big, and he said we were the Horde's future, and I didn't say anything because I forgot how." } },
    matron = { { id = "y_tp_matron", text = "Matron Battlewail knows when you're lying. She can tell from your ears." } },
    hyjal = { { id = "y_tp_hyjal", text = "My father went to Hyjal. Matron says it's a mountain with a tree on top. I want to see it one day." } },
    grunts = { { id = "y_tp_grunts", text = "The grunts at the gate let me hold a spear once. It was really heavy, but I didn't drop it, mostly." } },
    _none = { { id = "tp_none", text = "I don't know that one. Ask the Matron, she knows everything." } },
  },
}

-- Apothecary Jezel: Forsaken collecting purple lotus for the war effort.
P:NPC {
  key = "og_apothecary_jezel", id = TODO_NPC("Apothecary Jezel"), name = "Apothecary Jezel", gender = "female",
  role = "collector", tier = "quest",
  communities = { "orgrimmar" }, temper = { "dry", "precise" }, values = { "duty", "craft" },
  notices = { "race", "profession" },
  impression = {
    first = "Apothecary Jezel stands among the war effort's crates in the Valley of Spirits with a ledger and a cracked vial of something faintly violet. She has the stillness of the dead and the impatience of a chemist.",
    third = "{name} met Apothecary Jezel, a Forsaken collecting purple lotus for the Horde's war effort.",
  },
  greetings = {
    { id = "g_default", text = "You have come to the war effort, or else you are lost. Either way, I could use purple lotus, {class}." },
    { id = "g_quest", when = { questActive = TODO_QUEST("The Horde Needs Purple Lotus!") }, text = "The lotus does not pick itself, I am sorry to say. Bring it soon, while the war still has a use for it." },
  },
  notice = {
    { id = "n_undead", cat = "race", when = { race = "Scourge" }, text = "Ah, one of our own. You will understand that I find Orgrimmar's sun insufferably cheerful." },
    { id = "n_herb", cat = "profession", when = { profession = "Herbalism" }, text = "Your hands smell of herbs. Good, because I have work for exactly those hands." },
  },
  start = "hello",
  nodes = {
    w2fresh = {
      lines = { { id = "w2fr_default", text = "In packed salt, in sealed jars, out of the sun, as one would keep any specimen of value. The orcs laughed at the jars until a crate left in the open rotted to brown slime in two days, and now they carry the jars for me." } },
      choices = {
        { text = "Do you lose many shipments?", next = "w2fresh2" },
        { text = "Salt for flowers? Unusual.", next = "w2fresh2" },
        { text = "Something else, Apothecary.", next = "BACK" },
      },
    },
    w2fresh2 = {
      lines = {
        { id = "w2fr2_herb", when = { profession = "Herbalism" }, text = "Fewer than the Society expected, which irritates them. You pick, so take this advice for free: cut the lotus at the stem, never pull it, and it will keep a week longer than anyone believes possible." },
        { id = "w2fr2_default", text = "Fewer than the Society expected, which irritates them, since they expected to blame the orcs. My ledger says one crate in thirty, and my ledger has never once lied to me." },
      },
      choices = { { text = "A careful method.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "I am Apothecary Jezel of the Royal Apothecary Society, lent to the war effort by the Dark Lady herself. The Horde is gathering supplies for a war in Silithus, and my part of it is purple lotus." } },
      again = { { id = "h_again", text = "Something further? I have a ledger to keep." }, { id = "h_again2", text = "Speak. The dead have patience, but not unlimited amounts of it." } },
      choices = {
        { text = "What war in Silithus?", next = "war" },
        { text = "Why purple lotus?", next = "lotus" },
        { text = "I'll gather lotus for you.", next = "BUSINESS" },
        { text = "A Forsaken in Orgrimmar seems out of place.", next = "place" },
        { text = "I serve the Dark Lady too, Apothecary.", next = "kin", when = { race = "Scourge" } },
        { text = "Who were you before the plague?", next = "y_past" },
        { text = "What worries you about this war?", next = "y_worry" },
        { text = "How do you keep the lotus fresh in this heat?", next = "w2fresh" },
        { text = "Good day, Apothecary.", next = "END" },
      },
    },
    war = {
      lines = { { id = "w_default", text = "Something stirs behind the great scarab wall in Silithus, and both the Horde and the Alliance mean to be ready when the gates open. Every race of the Horde is asked to give, and I am told the Alliance does the same in Ironforge." } },
      choices = {
        { text = "What's behind the wall?", next = "wall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wall = {
      lines = { { id = "wl_default", text = "The silithid, and whatever commands them, and the night elves have been unusually quiet about the rest. I do not trust a secret ten thousand years old, and I trust one kept by elves still less." } },
      choices = {
        { text = "Then we should strike first and hard.", next = "BACK", reply = "Exactly my view. Bring me lotus and you will have helped strike.", fx = { align = { order = 1 } } },
        { text = "Let the elves fight their own old wars.", next = "BACK", reply = "A tempting thought, but the insects will not stop at the elves' borders.", fx = { align = { order = -1 } } },
      },
    },
    lotus = {
      lines = { { id = "l_default", text = "It goes into elixirs and draughts that will keep soldiers standing in the heat of the desert. You will find it in Feralas and the Hinterlands and other green places that I would not visit by choice." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    place = {
      lines = { { id = "p_default", text = "It is, and the orcs remind me of it with their eyes every day. But the Warchief keeps his word to the Dark Lady, and I keep mine to the war effort, so we tolerate each other well enough." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kin = {
      lines = { { id = "kin_default", text = "Then you know that our place in this Horde is bought with work like this. The orcs will never love us, so let them at least owe us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_past = {
      lines = { { id = "y_past_d", text = "An apothecary's apprentice in Brill, weighing powders for a man who drank too much. I was good at it, and I was better at it dead, because the dead do not tremble when they pour." } },
      choices = {
        { text = "Do you remember dying?", next = "y_dying" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_dying = {
      lines = {
        { id = "y_dying_d", text = "I remember a fever, and then a long dark, and then the Dark Lady's voice telling me to rise. Everything between is a page someone tore out, and I have stopped trying to read it." },
        { id = "y_dying_sc", when = { race = "Scourge" }, text = "You will know the torn page I mean, I think. A fever, a long dark, then her voice. I do not ask the others what they remember, and I would thank you not to ask me." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_worry = {
      lines = { { id = "y_worry_d", text = "That the Society will send someone to see whether my lotus goes into elixirs or into something less wholesome. They do not trust anything done far from Undercity, and some of the orcs here would welcome an excuse to blame us." } },
      choices = {
        { text = "Does it go into something less wholesome?", next = "y_secret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_secret = {
      lines = { { id = "y_secret_d", text = "Every drop goes into the elixirs, which I can prove with my ledger. But I keep a little residue back for my own study, and I have not told the Warchief's quartermasters. Would you?" } },
      choices = {
        { text = "Tell them. Allies should hide nothing.", next = "BACK", reply = "How refreshingly naive. Very well, I will consider it.", fx = { align = { order = 1 } } },
        { text = "Your study is your own business.", next = "BACK", reply = "Thank you. Few in this city would say so.", fx = { align = { order = -1 } } },
      },
    },
  },
  topics = {
    undercity = { { id = "y_tp_uc", text = "Undercity is cool, quiet and dark, and every one of those is a kindness Orgrimmar refuses to offer." } },
    silithus = { { id = "y_tp_sil", text = "Sand, insects and a wall older than any kingdom. I am told the heat there is worse than here, which I did not think possible." } },
    background = { { id = "tp_bg", text = "I mixed medicines in Lordaeron when I was alive. Now I mix them for the Horde, which pays less and argues more." } },
    _none = { { id = "tp_none", text = "That is outside my field, {class}, and my field is wide enough already." } },
  },
}

-- Bloodguard Rawtar: orc collecting lean wolf steaks for the war effort.
P:NPC {
  key = "og_bloodguard_rawtar", id = TODO_NPC("Bloodguard Rawtar"), name = "Bloodguard Rawtar", gender = "female",
  role = "collector", tier = "quest",
  communities = { "orgrimmar" }, temper = { "blunt", "hearty" }, values = { "duty", "honor" },
  notices = { "race", "profession" },
  impression = {
    first = "Bloodguard Rawtar stands by a cook-fire in the Valley of Spirits, a broad orc with a soldier's scars and a cook's apron tied over her mail.",
    third = "{name} met Bloodguard Rawtar, who collects lean wolf steaks for the war effort.",
  },
  greetings = {
    { id = "g_default", text = "You there, {class}! An army marches on its stomach, and right now its stomach is empty." },
    { id = "g_quest", when = { questActive = TODO_QUEST("The Horde Needs Lean Wolf Steaks!") }, text = "Where are my steaks? The grunts are already eating their boots." },
  },
  notice = {
    { id = "n_cook", cat = "profession", when = { profession = "Cooking" }, text = "You have a cook's burns on your fingers. Good, I need someone who can tell a steak from a sandal." },
  },
  start = "hello",
  nodes = {
    w2meal = {
      lines = { { id = "w2ml_default", text = "Boiled kodo, on my first week with the pot, before anyone told me that kodo wants a day of smoke and not an hour of water. The grunts ate it, because grunts eat anything, and they chewed it for the rest of the march." } },
      choices = {
        { text = "Did they forgive you?", next = "w2meal2" },
        { text = "I've eaten worse in the field.", next = "w2meal2" },
        { text = "Something else, Bloodguard.", next = "BACK" },
      },
    },
    w2meal2 = {
      lines = {
        { id = "w2ml2_cook", when = { profession = "Cooking" }, text = "Never, and you'll know why if you've fed soldiers: they remember a bad stew longer than a good battle. I still hear about that kodo, and it was three years ago." },
        { id = "w2ml2_default", text = "Never. Soldiers remember a bad stew longer than a good battle, and they still call it Rawtar's boots at the Valley of Honor fires, three years on." },
      },
      choices = { { text = "Your steaks will make up for it.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "I am Bloodguard Rawtar, and I feed the soldiers who will march to Silithus. Lean wolf steaks keep well in the heat and make a grunt strong, so that is what I collect." } },
      again = { { id = "h_again", text = "What else? The fire needs tending." } },
      choices = {
        { text = "Why does a bloodguard cook?", next = "cook" },
        { text = "Where do I find good wolves?", next = "wolves" },
        { text = "I'll bring you steaks.", next = "BUSINESS" },
        { text = "I cook too, Bloodguard. Any advice?", next = "tips", when = { profession = "Cooking" } },
        { text = "Who eats your cooking, then?", next = "grunts" },
        { text = "Were you at Hyjal with Grom's Warsong?", next = "hyjal", when = { race = "Orc" } },
        { text = "I am a warrior. What should I eat before battle?", next = "warfood", when = { class = "WARRIOR" } },
        { text = "What's the worst meal you've ever served?", next = "w2meal" },
        { text = "Farewell, Bloodguard.", next = "END" },
      },
    },
    cook = {
      lines = { { id = "c_default", text = "Because a demigod's hoof broke my leg at Mount Hyjal and it never set straight, so I cannot charge any longer. I could sulk about it, or I could make sure the orcs who still can charge go into battle with full bellies." } },
      choices = {
        { text = "That's still a warrior's work.", next = "pride" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pride = {
      lines = { { id = "pr_default", text = "I tell myself that every morning. Some days I even believe it, mostly the days when the stew comes out right." } },
      choices = {
        { text = "Every orc serves the Horde. That is enough.", next = "BACK", reply = "Aye, that is what Thrall says, and he would know.", fx = { align = { honor = 1 } } },
        { text = "Glory is overrated. Good food isn't.", next = "BACK", reply = "Ha! Say that to a grunt and watch him choke on his bread.", fx = { align = { honor = -1 } } },
      },
    },
    wolves = {
      lines = { { id = "w_default", text = "The big gray wolves of Alterac and the Hinterlands give the leanest meat. Cook it over a hot fire, not a slow one, or you will be bringing me leather." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tips = {
      lines = { { id = "tips_default", text = "Salt it the night before and never trust a troll near your spice box. That is all the wisdom I have, and it has served me well." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    grunts = {
      lines = { { id = "gr_default", text = "The grunts of the Valley of Honor, mostly, and soon the ones who will march to Silithus. They eat like starving wolves and thank me like wolves too, which is to say with a grunt and an empty bowl." } },
      choices = {
        { text = "Do they ever complain?", next = "complain" },
        { text = "Something else.", next = "BACK" },
      },
    },
    complain = {
      lines = { { id = "cp_default", text = "Every day, about the salt, the gristle and the cook. I let them, because an orc who still has breath to complain still has breath to fight." } },
      choices = {
        { text = "A soldier eats what he is given.", next = "BACK", reply = "Spoken like a sergeant. I will tell them you said so.", fx = { align = { order = 1 } } },
        { text = "Let them grumble. They have earned it.", next = "BACK", reply = "Aye, they have, and they will earn more before this is done.", fx = { align = { order = -1 } } },
      },
    },
    hyjal = {
      lines = { { id = "hy_default", text = "I was, and I saw the Warsong charge into the demon's shadow with Grom roaring at their head. He bought our freedom with his own blood that day, and I have never once eaten a meal without remembering it." } },
      choices = {
        { text = "Grom died well.", next = "gromdeath" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gromdeath = {
      lines = { { id = "gd_default", text = "He died the only way he could have forgiven himself, with Mannoroth dead at his feet. I limp because of that battle, and I would limp twice over to have stood near him again." } },
      choices = {
        { text = "Then honor him by feeding his warriors.", next = "BACK", reply = "That is exactly what I mean to do, {class}.", fx = { align = { honor = 1 } } },
        { text = "He should never have drunk the blood again.", next = "BACK", reply = "Hm. You are not wrong, but say it softly in this city.", fx = { align = { honor = -1 } } },
      },
    },
    warfood = {
      lines = { { id = "wf_default", text = "Meat and bread, a little salt, and nothing that sits heavy in the gut when the horns sound. A warrior who charges on a full belly charges slower, but he does not faint halfway there either." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a bloodguard of the Warchief's own guard, once. Now I am a cook, and I am still guarding the Horde, after a fashion." } },
    _none = { { id = "tp_none", text = "I know steaks and battle, {class}. That is neither." } },
  },
}

-- Chief Sharpclaw: tauren collecting baked salmon for the war effort.
P:NPC {
  key = "og_chief_sharpclaw", id = TODO_NPC("Chief Sharpclaw"), name = "Chief Sharpclaw", gender = "male",
  role = "collector", tier = "quest",
  communities = { "orgrimmar" }, temper = { "calm", "patient" }, values = { "honor", "tradition" },
  notices = { "race", "profession" },
  impression = {
    first = "Chief Sharpclaw is an old tauren with a fishing net slung over one horn, standing among the war effort's crates as patiently as if he were waiting for a fish to bite.",
    third = "{name} met Chief Sharpclaw, a tauren collecting baked salmon for the war effort.",
  },
  greetings = {
    { id = "g_default", text = "May the Earth Mother guide your steps, {class}. If she guides them toward a river, all the better." },
    { id = "g_quest", when = { questActive = TODO_QUEST("The Horde Needs Baked Salmon!") }, text = "The salmon swim where they will, young one. Take your time, but do not take too much of it." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" }, text = "One of the shu'halo, and far from the plains. It is good to see a familiar face among all this stone." },
    { id = "n_fish", cat = "profession", when = { profession = "Fishing" }, text = "You carry a fishing pole. Then we shall understand each other well." },
  },
  start = "hello",
  nodes = {
    w2fish = {
      lines = {
        { id = "w2fs_tauren", when = { race = "Tauren" }, text = "You will have heard my tribe's elders tell it, I think, and make it larger every winter. A great old salmon in the cold river below the Alterac hills, longer than a brave lying down, and it pulled me into the water before I pulled it out." },
        { id = "w2fs_default", text = "A great old salmon in a cold river below the Alterac hills, longer than a brave lying down. It pulled me into the water before I pulled it out, and the young ones of my tribe still laugh about it." },
      },
      choices = {
        { text = "Did you land it in the end?", next = "w2fish2" },
        { text = "I think the elders made it larger.", next = "w2fish2" },
        { text = "Something else, Chief.", next = "BACK" },
      },
    },
    w2fish2 = {
      lines = { { id = "w2fs2_default", text = "No. I let it go, because a fish that old has earned its river, and my net was torn besides. The Earth Mother gives a fisher many small fish, young one, and one great one that he should leave for the story." } },
      choices = { { text = "A fine story to keep.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "I am Sharpclaw, chief of a small tribe of fishers, and Cairne asked me to gather food for the Horde's march into Silithus. Baked salmon keeps well and feeds a warrior through a long day, and so salmon is what I ask for." } },
      again = { { id = "h_again", text = "What else would you ask? There is no hurry, the river runs on regardless." } },
      choices = {
        { text = "Where do the best salmon run?", next = "salmon" },
        { text = "Why did Cairne choose you?", next = "chosen" },
        { text = "I'll bring you salmon.", next = "BUSINESS" },
        { text = "Which tribe do you hail from, Chief?", next = "tribe", when = { race = "Tauren" } },
        { text = "Tell me of the Horde's march.", next = "march" },
        { text = "I fish too. Where do you cast your line?", next = "cast", when = { profession = "Fishing" } },
        { text = "Do you have family among the young ones?", next = "y_kin" },
        { text = "Are orc rivers good for fishing?", next = "y_orcs" },
        { text = "What's the largest fish you ever caught?", next = "w2fish" },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
    },
    salmon = {
      lines = { { id = "s_default", text = "In the cold rivers of the north, in the Alterac foothills and the Hinterlands and the Eastern Plaguelands, where they leap the falls. Catch them, bake them, and bring them to me." } },
      choices = {
        { text = "The Plaguelands? Is the fish safe to eat?", next = "plague" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plague = {
      lines = { { id = "pl_default", text = "The water runs down from the mountains, and the fish do not seem sick, though I would not drink from that river myself. The Forsaken apothecaries have tested them, or so they say." } },
      choices = {
        { text = "Then I'll trust the Forsaken on this.", next = "BACK", reply = "Trust is a gift, young one. Give it carefully, but do give it.", fx = { align = { light = 1 } } },
        { text = "I wouldn't trust a Forsaken with my supper.", next = "BACK", reply = "Many of my people feel as you do. Still, they are our allies, and the fish is good.", fx = { align = { light = -1 } } },
      },
    },
    chosen = {
      lines = { { id = "c_default", text = "Because I am too old to fight and too stubborn to stay at home. Cairne knows that an idle tauren is a sad thing, so he gave me work." } },
      choices = { { text = "Something else, Chief.", next = "BACK" } },
    },
    tribe = {
      lines = { { id = "tribe_default", text = "A small tribe of fishers who joined Cairne in the long walk to Mulgore. We were never many, but we were never hungry either, so long as there was a river." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    march = {
      lines = { { id = "mr_default", text = "The Warchief gathers food, cloth and arms for the day the gates of Ahn'Qiraj open in Silithus. Many young ones will walk that road, and I would see them walk it fed." } },
      choices = {
        { text = "Do you fear for the young ones?", next = "fear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fear = {
      lines = { { id = "fe_default", text = "I fear for them as the herd fears for its calves, though the herd still walks on to the next grazing ground. Some will not come home, and the Earth Mother will take them back gently." } },
      choices = {
        { text = "They know the price. It is their choice.", next = "BACK", reply = "It is, and I honor them for it, though my heart still aches.", fx = { align = { order = -1 } } },
        { text = "The Warchief must not waste them.", next = "BACK", reply = "Thrall is wise, young one, and I believe he knows the weight of each life.", fx = { align = { order = 1 } } },
      },
    },
    cast = {
      lines = { { id = "ca_default", text = "Where the water slows below a fall, and in the morning before An'she has warmed the stones. The salmon rest there before they leap, and a patient fisher takes them there." } },
      choices = {
        { text = "I'll try that. Something else.", next = "BACK" },
      },
    },
    y_kin = {
      lines = {
        { id = "y_kin_d", text = "My granddaughter, Tawna, carries a spear in the Warchief's army now. She tells me the bugs are no worse than centaur, and I pretend to believe her, as grandfathers must." },
        { id = "y_kin_ta", when = { race = "Tauren" }, text = "My granddaughter Tawna carries a spear now, as some daughter of your own clan surely does. She says the bugs are no worse than centaur, and I pretend to believe her." },
      },
      choices = {
        { text = "Would you keep her home if you could?", next = "y_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_home = {
      lines = { { id = "y_home_d", text = "Every night I think of a reason, and every morning I let it go. A tauren who will not let her calves walk their own path raises only sorrow." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_orcs = {
      lines = { { id = "y_orcs_d", text = "Durotar's rivers are thin and bitter, young one, and the orcs fish mostly with spears. I showed a grunt how to use a net once, and he looked at me as if I had offered him a dress." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    cairne = { { id = "y_tp_cairne", text = "Cairne is the strongest of us and the gentlest, and I am proud to call him chieftain." } },
    thunder_bluff = { { id = "y_tp_tb", text = "Thunder Bluff is high and windy, and there is no river at the top. I visit, but I do not stay." } },
    background = { { id = "tp_bg", text = "My tribe fished the Stonebull Lake before we came to Thunder Bluff. The fish there were small, but the water was sweet." } },
    _none = { { id = "tp_none", text = "I am only an old fisher, young one, and old fishers know only a few things well." } },
  },
}

-- Doctor Serratus: Forsaken collecting rugged leather for the war effort.
P:NPC {
  key = "og_doctor_serratus", id = TODO_NPC("Doctor Serratus"), name = "Doctor Serratus", gender = "male",
  role = "collector", tier = "quest",
  communities = { "orgrimmar" }, temper = { "cold", "sardonic" }, values = { "duty", "craft" },
  notices = { "race", "profession" },
  impression = {
    first = "Doctor Serratus examines a stack of hides in the Valley of Spirits with the detached care of a surgeon, his own skin stitched in places that no living patient would tolerate.",
    third = "{name} met Doctor Serratus, a Forsaken collecting rugged leather for the war effort.",
  },
  greetings = {
    { id = "g_default", text = "Ah, a fresh pair of hands. Do try to keep them attached while you work for me, {class}." },
    { id = "g_quest", when = { questActive = TODO_QUEST("The Horde Needs Rugged Leather!") }, text = "Rugged leather, if you please, not the flimsy rubbish you find on rabbits." },
  },
  notice = {
    { id = "n_skin", cat = "profession", when = { profession = "Skinning" }, text = "A skinner. I appreciate a professional who knows where the knife should go." },
  },
  start = "hello",
  nodes = {
    w2patient = {
      lines = { { id = "w2pt_default", text = "Favourite is a strong word for something I find mildly less tedious. There is an orc grunt who returns to me every month with a new wound in a new place, and he describes each injury with such pride that I have begun to keep a chart." } },
      choices = {
        { text = "What's on the chart so far?", next = "w2patient2" },
        { text = "Do you worry about him?", next = "w2patient2" },
        { text = "Something else, Doctor.", next = "BACK" },
      },
    },
    w2patient2 = {
      lines = { { id = "w2pt2_default", text = "Eleven stitches, three arrowheads, and a bite from something he insists was a crocolisk and I suspect was a goblin. I do not worry, {class}; worry is for the living. But I keep the chart beside my bench, and I would notice if it stopped." } },
      choices = { { text = "That sounds like caring, Doctor.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "I am Doctor Serratus, physician to the Royal Apothecary Society and, for my sins, collector of hides for the war effort. Armor and bandages and stretchers all need rugged leather, and soldiers need all three." } },
      again = { { id = "h_again", text = "Is there more? I am counting hides." } },
      choices = {
        { text = "A doctor collecting leather?", next = "doctor" },
        { text = "Where do I find rugged leather?", next = "where" },
        { text = "I'll bring leather.", next = "BUSINESS" },
        { text = "Were you a doctor in Lordaeron too?", next = "lordaeron", when = { race = "Scourge" } },
        { text = "What do you make of the orcs?", next = "orcs" },
        { text = "I'm a priest. Could the Light mend you?", next = "priest", when = { class = "PRIEST" } },
        { text = "I skin hides myself. Any advice?", next = "skin", when = { profession = "Skinning" } },
        { text = "Who stitched your own skin?", next = "y_stitch" },
        { text = "Do you still treat the plague?", next = "y_plague" },
        { text = "Do you have a favourite patient here?", next = "w2patient" },
        { text = "Good day, Doctor.", next = "END" },
      },
    },
    doctor = {
      lines = { { id = "d_default", text = "I was a surgeon in Lordaeron, back when I had a pulse. Now I patch soldiers living and dead alike, and I have found that leather makes a better stretcher than most things." } },
      choices = {
        { text = "Do you miss being alive?", next = "alive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alive = {
      lines = { { id = "a_default", text = "I miss sleep, and I miss the taste of wine, but I do not miss the fear of dying. That one fear is gone, and I find the rest of them much easier to bear." } },
      choices = {
        { text = "Death was a mercy for you, then.", next = "BACK", reply = "An unusual view. I shall make a note of it, though I doubt the Lich King intended mercy.", fx = { align = { light = -1 } } },
        { text = "No one should have to live like that.", next = "BACK", reply = "Perhaps not, but we do, and so I would rather be useful.", fx = { align = { light = 1 } } },
      },
    },
    where = {
      lines = { { id = "w_default", text = "From the larger beasts of Felwood, Winterspring and the Eastern Plaguelands. Thin hides are worthless to me, so skin the big ones." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lordaeron = {
      lines = { { id = "lordaeron_default", text = "In Stratholme, before Arthas put it to the torch. I treated the first plague victims, and I learned too late that nothing I had would help them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    orcs = {
      lines = { { id = "or_default", text = "They are excellent patients, because they bleed a great deal and complain very little. They do flinch when I come near, though, and I cannot entirely blame them." } },
      choices = {
        { text = "And the tauren?", next = "tauren" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = { { id = "ta_default", text = "The tauren treat me with a courtesy I do not deserve and a little pity I do not want. Their healers mend with herbs and prayer, and I mend with needles, and somehow we both save lives." } },
      choices = {
        { text = "The Horde holds together because of such courtesy.", next = "BACK", reply = "Perhaps so. I shall endure it gracefully, then.", fx = { align = { honor = 1 } } },
        { text = "Pity is wasted on the dead.", next = "BACK", reply = "Precisely what I keep telling them, to no effect at all.", fx = { align = { honor = -1 } } },
      },
    },
    priest = {
      lines = { { id = "pr_default", text = "The Light burns me, {class}, as it burns all of the Dark Lady's children, and so I would thank you to keep it in your pocket. Some of our priests have found a shadow that answers instead, and it suits us better." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    skin = {
      lines = { { id = "sk_default", text = "Cut along the belly, never across it, and work the hide free while the beast is still warm. A cold hide tears, and I have no use for torn leather or for skinners who hurry." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_stitch = {
      lines = { { id = "y_stitch_d", text = "I did, with a mirror and a steady hand, the week after I rose. A surgeon who will not operate on himself has no business asking it of anyone else." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_plague = {
      lines = {
        { id = "y_plague_d", text = "I study it, which is not the same thing. The Society's work in the Undercity keeps me awake, insofar as I sleep, because I treated its first victims and I have no wish to see it brewed again." },
        { id = "y_plague_sc", when = { race = "Scourge" }, text = "I study it, as you might guess. Some of our colleagues below the Undercity would like to see it brewed anew, and I treated its first victims, so you may imagine how I feel about that." },
      },
      choices = {
        { text = "Should the Society be stopped?", next = "y_stop" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_stop = {
      lines = { { id = "y_stop_d", text = "Stopped? By whom? The Dark Lady wants weapons against the Scourge, and a plague that kills only the Scourge would be a fine weapon. A plague that kills everyone would be a finer one. That is what troubles me." } },
      choices = {
        { text = "Any weapon against the Scourge is worth it.", next = "BACK", reply = "Spoken like someone who never saw Stratholme.", fx = { align = { light = -1 } } },
        { text = "Some weapons should never be made.", next = "BACK", reply = "I agree, though I will deny saying so.", fx = { align = { light = 1 } } },
      },
    },
  },
  topics = {
    stratholme = { { id = "y_tp_strat", text = "I was a surgeon there, and then I was a corpse there. Neither left me fond of the place." } },
    plague = { { id = "y_tp_plague", text = "The plague is a disease, a weapon and a religion, depending on who you ask. I treat it as all three." } },
    background = { { id = "tp_bg", text = "Surgeon, corpse, physician. In that order." } },
    _none = { { id = "tp_none", text = "I cannot diagnose that, {class}, and I will not pretend to." } },
  },
}

-- Healer Longrunner: tauren collecting wool bandages for the war effort.
P:NPC {
  key = "og_healer_longrunner", id = TODO_NPC("Healer Longrunner"), name = "Healer Longrunner", gender = "male",
  role = "collector", tier = "quest",
  communities = { "orgrimmar" }, temper = { "gentle", "earnest" }, values = { "mercy", "duty" },
  notices = { "race", "profession" },
  impression = {
    first = "Healer Longrunner rolls bandages among the war effort's crates, a lean young tauren whose hands are never still and whose voice is always soft.",
    third = "{name} met Healer Longrunner, a tauren collecting wool bandages for the war effort.",
  },
  greetings = {
    { id = "g_default", text = "Peace to you, {class}. Are you wounded? No? Good, then perhaps you can help me tend the ones who will be." },
    { id = "g_quest", when = { questActive = TODO_QUEST("The Horde Needs Wool Bandages!") }, text = "The bandages will save lives, friend. Every one you bring is a warrior who comes home." },
  },
  notice = {
    { id = "n_aid", cat = "profession", when = { profession = "First Aid" }, text = "You know first aid! Then you know how fast a bandage runs out on a battlefield." },
  },
  start = "hello",
  nodes = {
    w2pouch = {
      lines = {
        { id = "w2pc_tauren", when = { race = "Tauren" }, text = "Bandages, a bone needle, a little earthroot, and a smooth red stone from beside Stonebull Lake. You may carry something like it yourself, friend; my mother put it in my hand when I left Mulgore so that I would never be far from home." },
        { id = "w2pc_default", text = "Bandages, a bone needle, a little earthroot, and a smooth red stone from beside Stonebull Lake in Mulgore. My mother put it in my hand when I left home, so that I would never be far from it." },
      },
      choices = {
        { text = "Does the stone help with healing?", next = "w2pouch2" },
        { text = "A stone is a heavy thing to carry for comfort.", next = "w2pouch2" },
        { text = "Something else, Healer.", next = "BACK" },
      },
    },
    w2pouch2 = {
      lines = { { id = "w2pc2_default", text = "Not the wounds, but it helps the healer. When a grunt is dying under my hands, I hold the stone in the other one, and I remember the lake, and my hands stop shaking long enough to finish the work." } },
      choices = { { text = "Then it's worth its weight.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "I am Longrunner, a healer of Thunder Bluff, and I gather wool bandages for the Horde's army. When the gates in Silithus open, our warriors will bleed, and I would rather they bled into clean wool." } },
      again = { { id = "h_again", text = "What else, friend? I can listen and roll bandages at once." } },
      choices = {
        { text = "How did you become a healer?", next = "healer" },
        { text = "Do you think the war is worth it?", next = "worth" },
        { text = "I'll make wool bandages for you.", next = "BUSINESS" },
        { text = "I know first aid as well.", next = "aid", when = { profession = "First Aid" } },
        { text = "What do the wounded say to you?", next = "wounded" },
        { text = "I'm a shaman. The spirits mend wounds too.", next = "spirits", when = { class = "SHAMAN" } },
        { text = "Who taught you to heal?", next = "y_teach" },
        { text = "Are you afraid of Silithus?", next = "y_fear" },
        { text = "What do you carry in your healer's pouch?", next = "w2pouch" },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
    },
    healer = {
      lines = { { id = "h2_default", text = "My mother was a runner who carried messages across the Barrens, and she taught me that the fastest feet are useless if you cannot mend what you find at the end of the road. I chose mending." } },
      choices = {
        { text = "Is your mother still running?", next = "mother" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mother = {
      lines = { { id = "m_default", text = "She runs between Camp Taurajo and the Crossroads still, though her knees complain. If you see a tauren running faster than she ought to, it is likely her." } },
      choices = { { text = "Something else, Healer.", next = "BACK" } },
    },
    worth = {
      lines = { { id = "w_default", text = "I do not know, friend, and that is the truth. I only know that the wounded will come whether it is worth it or not, and I will be ready for them." } },
      choices = {
        { text = "Some wars must be fought, healer.", next = "BACK", reply = "Perhaps, and those who fight them deserve clean bandages.", fx = { align = { order = 1 } } },
        { text = "Every war is a waste of good lives.", next = "BACK", reply = "Then we agree, though I will not say so to an orc.", fx = { align = { order = -1 } } },
      },
    },
    aid = {
      lines = { { id = "aid_default", text = "Then you know the most important lesson, friend, which is to keep your hands steady even when your heart is not. The old healers of Thunder Bluff teach it before anything else." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    wounded = {
      lines = { { id = "wo_default", text = "Most of them ask whether they will fight again, and a few ask for their mothers. I answer the first truthfully and the second kindly, and I hold their hands either way." } },
      choices = {
        { text = "Does it weigh on you?", next = "weigh" },
        { text = "Something else.", next = "BACK" },
      },
    },
    weigh = {
      lines = { { id = "we_default", text = "It does, friend, every evening when the work is done and the camp is quiet. I sing to the Earth Mother then, and she takes a little of the weight from me so I can carry the rest." } },
      choices = {
        { text = "Mercy is a strength, healer.", next = "BACK", reply = "Thank you. Not every warrior believes that, and I am glad you do.", fx = { align = { light = 1 } } },
        { text = "You must harden your heart to do this work.", next = "BACK", reply = "Perhaps, but a hard heart makes for rough hands, and I need gentle ones.", fx = { align = { light = -1 } } },
      },
    },
    spirits = {
      lines = { { id = "sp_default", text = "They do, and gladly. A shaman's healing wave closes a wound faster than any bandage, but the spirits tire and the wool does not, so we need both." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_teach = {
      lines = {
        { id = "y_teach_d", text = "An old healer of the Bloodhoof named Grandmother Stillwater, who could stitch a wound by firelight with her eyes half closed. She said a healer's first tool is patience, and her second is a sharp knife." },
        { id = "y_teach_ta", when = { race = "Tauren" }, text = "Grandmother Stillwater of the Bloodhoof, as you may have heard of her yourself. She said a healer's first tool is patience, and her second is a sharp knife." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_fear = {
      lines = { { id = "y_fear_d", text = "I am, friend, and I will not pretend otherwise. They say the insects there carry poisons no healer has seen, and I lie awake wondering what I will not know how to mend." } },
      choices = {
        { text = "Will you march with the army?", next = "y_march" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_march = {
      lines = { { id = "y_march_d", text = "I have asked to, and they have not answered. Some say a young healer is more use in the city, rolling bandages, than dead in the sand. Should I go, or should I stay?" } },
      choices = {
        { text = "Go. The wounded need you there.", next = "BACK", reply = "Then I will ask again tomorrow, and louder.", fx = { align = { honor = 1 } } },
        { text = "Stay. A live healer saves more lives.", next = "BACK", reply = "That is wise, though it sits badly with me.", fx = { align = { honor = -1 } } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I learned healing in Thunder Bluff and practice it wherever I am needed. Today that is Orgrimmar." } },
    silithus = { { id = "y_tp_sil", text = "Silithus is far, hot and full of insects. I hope my bandages arrive before the wounded do." } },
    thunder_bluff = { { id = "y_tp_tb", text = "Thunder Bluff is where I learned everything I know. The winds there are cleaner than this smoke." } },
    _none = { { id = "tp_none", text = "I am sorry, friend, but I do not know about that. I know about wounds." } },
  },
}

-- Herbalist Proudfeather: tauren collecting peacebloom for the war effort.
P:NPC {
  key = "og_herbalist_proudfeather", id = TODO_NPC("Herbalist Proudfeather"), name = "Herbalist Proudfeather", gender = "female",
  role = "collector", tier = "quest",
  communities = { "orgrimmar" }, temper = { "warm", "wistful" }, values = { "land", "duty" },
  notices = { "race", "profession" },
  impression = {
    first = "Herbalist Proudfeather sorts bundles of pale peacebloom among the war effort's crates, a feather braided into her mane and a dusting of pollen on her sleeves.",
    third = "{name} met Herbalist Proudfeather, a tauren collecting peacebloom for the war effort.",
  },
  greetings = {
    { id = "g_default", text = "An'she's light on you, {class}. Do you have a moment for an herbalist far from her meadows?" },
    { id = "g_quest", when = { questActive = TODO_QUEST("The Horde Needs Peacebloom!") }, text = "The peacebloom grows nearly everywhere, friend, so do not let me keep you from it." },
  },
  notice = {
    { id = "n_herb", cat = "profession", when = { profession = "Herbalism" }, text = "You have an herbalist's eye. You must have noticed the peacebloom along every road from here to the Barrens." },
  },
  start = "hello",
  nodes = {
    w2flower = {
      lines = { { id = "w2fw_default", text = "The little white ones that grow on the mesa tops above Bloodhoof, too small and too bitter to be any use to an alchemist. Nobody gathers them, and so they cover the stone every spring like a fall of snow." } },
      choices = {
        { text = "Why love a flower that's no use?", next = "w2flower2" },
        { text = "I'd like to see that.", next = "w2flower2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2flower2 = {
      lines = {
        { id = "w2fw2_herb", when = { profession = "Herbalism" }, text = "Because everything else I touch is picked for someone's wound, friend, as you will know. Those are the only flowers I have ever been allowed simply to look at, and I keep one pressed between the pages of my ledger." },
        { id = "w2fw2_default", text = "Because everything else I touch is picked for someone's wound. Those are the only flowers I have ever been allowed simply to look at, and I keep one pressed between the pages of my ledger." },
      },
      choices = { { text = "Everyone needs one of those.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "I am Proudfeather, and I gather peacebloom for the Horde's healing draughts. It is a humble flower, but a thousand humble flowers will keep an army on its feet." } },
      again = { { id = "h_again", text = "What else? The flowers will keep a moment longer." } },
      choices = {
        { text = "Why peacebloom, of all things?", next = "why" },
        { text = "You seem homesick.", next = "home" },
        { text = "I'll gather peacebloom.", next = "BUSINESS" },
        { text = "I miss Mulgore too.", next = "mulgore", when = { race = "Tauren" } },
        { text = "Do the orcs value your work?", next = "value" },
        { text = "I gather herbs as well.", next = "herbs", when = { profession = "Herbalism" } },
        { text = "Who taught you herbs?", next = "y_teach" },
        { text = "Have you ever failed a patient?", next = "y_fail" },
        { text = "Which flower do you love most?", next = "w2flower" },
        { text = "May the Earth Mother keep you.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because it is the root of nearly every healing draught the alchemists make. You find it in Mulgore, in Durotar and in the Barrens, wherever the ground is kind enough to let something grow." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    home = {
      lines = { { id = "hm_default", text = "I am. Orgrimmar is all red stone and smoke, and I miss the green grass of Mulgore more than I thought I would." } },
      choices = {
        { text = "Why not go home, then?", next = "stay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stay = {
      lines = { { id = "st_default", text = "Because the work is here, and the Horde has asked it of us. Cairne says that a tribe which does not answer its friends will one day have no friends to answer it." } },
      choices = {
        { text = "Cairne is right. We stand together.", next = "BACK", reply = "Yes, and that is why I am here among the orcs and their smoke.", fx = { align = { honor = 1 } } },
        { text = "Your own home should come first.", next = "BACK", reply = "Perhaps, but I would feel ashamed going home before the work is finished.", fx = { align = { honor = -1 } } },
      },
    },
    mulgore = {
      lines = { { id = "mulgore_default", text = "Then you know how the grass sounds at dusk, when the wind runs through it like water. Hold onto that sound, friend, it will carry you home." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    value = {
      lines = { { id = "va_default", text = "The shamans do, and the alchemists in the Drag pay well enough. The grunts think a flower is a flower, until one of my draughts drags them back from the edge." } },
      choices = {
        { text = "And then?", next = "after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      lines = { { id = "af_default", text = "And then they bring me flowers, crushed in their great fists, as thanks. I keep every one of them pressed in a book, even the ones that are mostly weeds." } },
      choices = {
        { text = "Every warrior owes the healers a debt.", next = "BACK", reply = "That is kind, though I would settle for them watching where they step.", fx = { align = { order = -1 } } },
        { text = "Gratitude matters less than discipline.", next = "BACK", reply = "Spoken like an orc, friend, but I will keep my pressed flowers all the same.", fx = { align = { order = 1 } } },
      },
    },
    herbs = {
      lines = { { id = "hb_default", text = "Then look for earthroot beneath the peacebloom where the soil is red, and silverleaf where the trees grow thick. The land hides her gifts in pairs, if you know how to look." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_teach = {
      lines = {
        { id = "y_teach_d", text = "My grandmother, on the slopes below Thunder Bluff. She could name every plant in Mulgore by smell alone, and she said a herb picked in anger heals nobody." },
        { id = "y_teach_ta", when = { race = "Tauren" }, text = "My grandmother taught me, as yours may have taught you. She said a herb picked in anger heals nobody, and I still pick slowly because of her." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_fail = {
      lines = { { id = "y_fail_d", text = "Once, a young grunt with a wound gone black. I gave him peacebloom and earthroot, and he needed something stronger that I did not have. I think of him every time I bundle these flowers." } },
      choices = {
        { text = "Do you blame yourself?", next = "y_blame" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_blame = {
      lines = { { id = "y_blame_d", text = "Some nights. The shaman said the land gives what she gives, and the rest is not ours to carry. Do you think a healer should carry her failures, or set them down?" } },
      choices = {
        { text = "Carry them. They make you better.", next = "BACK", reply = "Perhaps. They are heavy, but they teach.", fx = { align = { order = 1 } } },
        { text = "Set them down. The land decides.", next = "BACK", reply = "That is what the shaman said. I am trying.", fx = { align = { order = -1 } } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I grew up gathering herbs on the slopes below Thunder Bluff. I would like to go back to them one day." } },
    mulgore = { { id = "y_tp_mulgore", text = "Mulgore's grass sings at dusk. Orgrimmar only crackles." } },
    peacebloom = { { id = "y_tp_peace", text = "A humble flower, but it grows everywhere, and that is its strength." } },
    _none = { { id = "tp_none", text = "I am only an herbalist, friend, and that is a question for someone wiser than me." } },
  },
}

-- Lady Callow: Forsaken collecting mageweave bandages for the war effort.
P:NPC {
  key = "og_lady_callow", id = TODO_NPC("Lady Callow"), name = "Lady Callow", gender = "female",
  role = "collector", tier = "quest",
  communities = { "orgrimmar" }, temper = { "haughty", "cold" }, values = { "duty", "pride" },
  notices = { "race", "profession" },
  impression = {
    first = "Lady Callow stands in the Valley of Spirits in the remains of a fine Lordaeron gown, holding a roll of mageweave as though it were a lady's glove.",
    third = "{name} met Lady Callow, a Forsaken noblewoman collecting mageweave bandages for the war effort.",
  },
  greetings = {
    { id = "g_default", text = "You may approach, {class}. I trust you have something useful to offer the war effort." },
    { id = "g_quest", when = { questActive = TODO_QUEST("The Horde Needs Mageweave Bandages!") }, text = "I am still waiting on those bandages, and I am not accustomed to waiting." },
  },
  notice = {
    { id = "n_undead", cat = "race", when = { race = "Scourge" }, text = "One of the Dark Lady's children. At least you know how to stand still and listen." },
  },
  start = "hello",
  nodes = {
    w2gown = {
      lines = { { id = "w2gn_default", text = "With a needle, nightly, as any lady's maid would have done for me once. It is Lordaeron silk, the last of my wardrobe, and the Durotar dust is a war I fight every evening and lose every morning." } },
      choices = {
        { text = "Why not wear something more practical?", next = "w2gown2" },
        { text = "You mend it yourself? I'm surprised.", next = "w2gown2" },
        { text = "Something else, my lady.", next = "BACK" },
      },
    },
    w2gown2 = {
      lines = {
        { id = "w2gn2_scourge", when = { race = "Scourge" }, text = "You know the answer, I think. We lost our faces and our names and our families; I will not lose my gown as well. It is the last thing that still remembers who I was." },
        { id = "w2gn2_default", text = "Because I lost my face and my name and my family, and I will not lose my gown as well. It is the last thing in this world that still remembers who I was." },
      },
      choices = { { text = "Then keep mending it.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "I am Lady Callow, once of a house in Lordaeron whose name no longer matters. I collect mageweave bandages for the Horde's march on Silithus, because the Dark Lady asked it and because I have nothing better to do with eternity." } },
      again = { { id = "h_again", text = "Is there more you wish to say? Be brief." } },
      choices = {
        { text = "You were a noble in Lordaeron?", next = "noble" },
        { text = "Why mageweave bandages?", next = "mageweave" },
        { text = "I'll bring you bandages.", next = "BUSINESS" },
        { text = "Did you know the Dark Lady in life?", next = "sylvanas", when = { race = "Scourge" } },
        { text = "What became of your roses?", next = "roses" },
        { text = "I'm a tailor. I can stitch mageweave.", next = "tailor", when = { profession = "Tailoring" } },
        { text = "Did you love anyone, in life?", next = "y_love" },
        { text = "Do the orcs treat you as a lady?", next = "y_orcs" },
        { text = "How do you keep that gown so well?", next = "w2gown" },
        { text = "Good day, my lady.", next = "END" },
      },
    },
    noble = {
      lines = { { id = "n_default", text = "I had a manor near Andorhal, with gardens and servants and a husband who bored me. The plague took the gardens, the servants and the husband, and in truth I miss the gardens most." } },
      choices = {
        { text = "That's cold, even for the dead.", next = "cold" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cold = {
      lines = { { id = "c_default", text = "Perhaps it is, but the dead have little use for pretense. I loved my roses more honestly than I ever loved Lord Callow, and he knew it." } },
      choices = {
        { text = "Honesty is a kind of virtue.", next = "BACK", reply = "How charming of you to say so. I shall try to remember it.", fx = { align = { light = 1 } } },
        { text = "Some things are better left unsaid.", next = "BACK", reply = "You would have done well at court, then.", fx = { align = { light = -1 } } },
      },
    },
    mageweave = {
      lines = { { id = "m_default", text = "Because it holds better than wool and the Horde's tailors have more mageweave than they know what to do with. Bandages are the one luxury a soldier truly needs." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sylvanas = {
      lines = { { id = "sylvanas_default", text = "Only by name, as the Ranger-General of Quel'Thalas. Now she is our queen, and I find I serve her more gladly than I ever served King Terenas." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    roses = {
      lines = { { id = "ro_default", text = "They went black with the rest of Andorhal, and the beds are full of ghouls now. I went back once, after I rose, and found a single white rose growing through the ribs of a footman." } },
      choices = {
        { text = "Did you take it?", next = "took" },
        { text = "Something else.", next = "BACK" },
      },
    },
    took = {
      lines = { { id = "tk_default", text = "I did, and it died in my hand within the hour, as everything does now. I have not tried to grow anything since, and I do not intend to." } },
      choices = {
        { text = "Perhaps the soil of Tirisfal would take one.", next = "BACK", reply = "How tiresomely hopeful of you. Still, I may consider it.", fx = { align = { light = 1 } } },
        { text = "Then leave the past buried, my lady.", next = "BACK", reply = "At last, someone who understands me.", fx = { align = { light = -1 } } },
      },
    },
    tailor = {
      lines = { { id = "tl_default", text = "Then you are worth more to me than half the soldiers in this valley. Bring me mageweave bandages, stitched tightly, and I shall think rather well of you." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_love = {
      lines = {
        { id = "y_love_d", text = "A sister, Elinor, who married a merchant in Stratholme against our father's wishes. I did not speak to her for twelve years. Then Stratholme burned, and the silence became permanent." },
        { id = "y_love_hu", when = { race = "Scourge" }, text = "A sister in Stratholme whom I refused to speak to for twelve years over a marriage. Then the city burned. You will have your own silences, I expect. We all do." },
      },
      choices = {
        { text = "Do you regret it?", next = "y_regret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_regret = {
      lines = { { id = "y_regret_d", text = "Regret is a luxury for the living. Still, I sometimes wonder whether she rose, and whether she would look at me. Should one seek out the past, do you think, or leave it buried?" } },
      choices = {
        { text = "Seek her out. You may find peace.", next = "BACK", reply = "Peace. What a quaint word. I shall think on it.", fx = { align = { light = 1 } } },
        { text = "Leave it. Some doors stay closed.", next = "BACK", reply = "Yes. That is the sensible answer, and I despise it.", fx = { align = { light = -1 } } },
      },
    },
    y_orcs = {
      lines = { { id = "y_orcs_d", text = "They treat me as a curiosity, which is worse. A grunt asked whether my gown was armor. I told him it was, of a sort, and he has saluted me ever since." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a lady of Lordaeron, and now I am a lady of the Forsaken. The title survived better than I did." } },
    andorhal = { { id = "y_tp_andor", text = "Andorhal was the breadbasket of Lordaeron. Now it is a graveyard with fields attached." } },
    sylvanas = { { id = "y_tp_syl", text = "The Dark Lady freed us. I shall not hear a word against her, {class}." } },
    _none = { { id = "tp_none", text = "I do not concern myself with such things, {class}." } },
  },
}

-- Miner Cromwell: Forsaken collecting copper bars for the war effort.
P:NPC {
  key = "og_miner_cromwell", id = TODO_NPC("Miner Cromwell"), name = "Miner Cromwell", gender = "male",
  role = "collector", tier = "quest",
  communities = { "orgrimmar" }, temper = { "dour", "plain" }, values = { "work", "duty" },
  notices = { "race", "profession" },
  impression = {
    first = "Miner Cromwell sits on a crate of copper bars in the Valley of Spirits, a stooped Forsaken with a pick across his knees and dust in the seams of his rotting coat.",
    third = "{name} met Miner Cromwell, a Forsaken collecting copper bars for the war effort.",
  },
  greetings = {
    { id = "g_default", text = "Copper, {class}. That is what I want, and I expect you know where to find it." },
    { id = "g_quest", when = { questActive = TODO_QUEST("The Horde Needs Copper Bars!") }, text = "No copper yet? The hills are full of it, so go and dig." },
  },
  notice = {
    { id = "n_mine", cat = "profession", when = { profession = "Mining" }, text = "A miner, by your shoulders. Good, I can talk to you without explaining what a seam is." },
  },
  start = "hello",
  nodes = {
    w2vein = {
      lines = { { id = "w2vn_default", text = "Silver, in the Alterac foothills, a seam as wide as my hand running straight down into the dark. The lord took every ounce of it and gave each of us an extra loaf that week, and I thought that was generous, then." } },
      choices = {
        { text = "And now?", next = "w2vein2" },
        { text = "A loaf for a fortune. That stings.", next = "w2vein2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2vein2 = {
      lines = {
        { id = "w2vn2_miner", when = { profession = "Mining" }, text = "Now I dig for the Horde, and every bar I collect goes where I can see it go. You mine, so you'll know the feeling of a good seam under the pick. It is the same alive or dead, and it is still the best feeling I have left." },
        { id = "w2vn2_default", text = "Now I dig for the Horde, and every bar I collect goes where I can see it go. That is worth more to me than any silver ever was, though I would not refuse the loaf." },
      },
      choices = { { text = "A fair trade at last.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "I am Cromwell, and I was a miner before I died and I am a miner still. The war effort needs copper bars for arrowheads and fittings and a hundred other things, so I collect them." } },
      again = { { id = "h_again", text = "What else? Talk is cheap, copper is not." } },
      choices = {
        { text = "Where did you mine in life?", next = "past" },
        { text = "Where should I look for copper?", next = "where" },
        { text = "I'll bring you copper bars.", next = "BUSINESS" },
        { text = "I mine too. Any tips?", next = "tips", when = { profession = "Mining" } },
        { text = "Do you get on with the orcs?", next = "orcs" },
        { text = "Did you rise there, in the shafts?", next = "rose", when = { race = "Scourge" } },
        { text = "Was there anyone with you in the shaft?", next = "y_crew" },
        { text = "Does the work still mean anything to you?", next = "y_mean" },
        { text = "What's the best vein you ever struck?", next = "w2vein" },
        { text = "Farewell.", next = "END" },
      },
    },
    past = {
      lines = { { id = "p_default", text = "In the hills above Hillsbrad, for a lord who paid us in bread and promises. When the plague came he fled to Stormwind, and I stayed and died in the shafts." } },
      choices = {
        { text = "Do you resent the living for that?", next = "resent" },
        { text = "Something else.", next = "BACK" },
      },
    },
    resent = {
      lines = { { id = "r_default", text = "I resent him, and lords like him. The common living folk never did me any harm, but I would not cry if that lord's manor burned with him in it." } },
      choices = {
        { text = "Then he deserves to burn.", next = "BACK", reply = "Aye, and I would hold the torch.", fx = { align = { light = -1 } } },
        { text = "Vengeance won't bring back your life.", next = "BACK", reply = "No, but it might warm the cold a little.", fx = { align = { light = 1 } } },
      },
    },
    where = {
      lines = { { id = "w_default", text = "Everywhere, nearly. The hills of Durotar and the Barrens are thick with it, and so are the slopes of Silverpine, if you can stand the worgen." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tips = {
      lines = { { id = "tips_default", text = "Follow the dark veins in the rock and listen for the hollow sound, and you will find ore where others walk past it. Also, never mine near kobolds, they take it personally." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    orcs = {
      lines = { { id = "or_default", text = "Well enough, because they work hard and say little, which suits me. It is the goblins I cannot abide, with their prices and their talk." } },
      choices = {
        { text = "What's wrong with the goblins?", next = "goblins" },
        { text = "Something else.", next = "BACK" },
      },
    },
    goblins = {
      lines = { { id = "gb_default", text = "They would sell a mine out from under the miners and charge them rent for the dark. The Venture Company strips the Barrens bare and calls it trade." } },
      choices = {
        { text = "A mine should belong to those who work it.", next = "BACK", reply = "Aye, and that is the first sensible thing I have heard all week.", fx = { align = { order = -1 } } },
        { text = "Someone has to own the land.", next = "BACK", reply = "That is what my lord said too, before he ran.", fx = { align = { order = 1 } } },
      },
    },
    rose = {
      lines = { { id = "rs_default", text = "I did, in the dark at the bottom of the Hillsbrad shaft, with my pick still in my hand. I dug my own way out, and I have not stopped digging since." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_crew = {
      lines = {
        { id = "y_crew_d", text = "Eleven of us. Four rose with me, and the rest rose for the Scourge, or did not rise at all. I buried the ones that stayed down, with my own pick, before I climbed out." },
        { id = "y_crew_sc", when = { race = "Scourge" }, text = "Eleven of us. Four rose free, like you and me, and the rest belonged to the Scourge or the dark. I buried those that stayed down before I climbed out." },
      },
      choices = {
        { text = "Where are the other four?", next = "y_four" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_four = {
      lines = { { id = "y_four_d", text = "Two dig for the Society in the Undercity, one went to the Barrens for the Venture Company's coin, and one walked into the Plaguelands and never came back. I don't speak of the third one." } },
      choices = {
        { text = "Working for goblins betrays your kind.", next = "BACK", reply = "Aye, that's how I see it too.", fx = { align = { honor = 1 } } },
        { text = "A miner goes where the pay is.", next = "BACK", reply = "Maybe. Still sits sour with me.", fx = { align = { honor = -1 } } },
      },
    },
    y_mean = {
      lines = { { id = "y_mean_d", text = "It means my hands still know something, {class}. When I swing the pick, I am a miner and not a corpse. That is enough reason to swing it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I dug copper in life and I dig it in death. Not much changed, except the pay." } },
    hillsbrad = { { id = "y_tp_hb", text = "Hillsbrad had good copper and bad lords. Now the copper is all that's left worth having." } },
    venture_company = { { id = "y_tp_vc", text = "The Venture Company would sell your bones as ore if they could smelt them." } },
    _none = { { id = "tp_none", text = "Never heard of it, {class}. I spend my days underground." } },
  },
}

-- Sergeant Umala: orc collecting thick leather for the war effort.
P:NPC {
  key = "og_sergeant_umala", id = TODO_NPC("Sergeant Umala"), name = "Sergeant Umala", gender = "female",
  role = "collector", tier = "quest",
  communities = { "orgrimmar" }, temper = { "brisk", "proud" }, values = { "duty", "honor" },
  notices = { "race", "profession" },
  impression = {
    first = "Sergeant Umala inspects every hide brought to her in the Valley of Spirits as if it were a recruit, pulling at the edges and scowling at the thin spots.",
    third = "{name} met Sergeant Umala, an orc collecting thick leather for the war effort.",
  },
  greetings = {
    { id = "g_default", text = "Stand straight when you speak to me, {class}. I have no time for slouches or thin hides." },
    { id = "g_quest", when = { questActive = TODO_QUEST("The Horde Needs Thick Leather!") }, text = "Thick leather, I said, and I meant thick. Bring it soon." },
  },
  notice = {
    { id = "n_lw", cat = "profession", when = { profession = "Leatherworking" }, text = "A leatherworker. Good, then you know quality when you see it." },
  },
  start = "hello",
  nodes = {
    w2hide = {
      lines = { { id = "w2hd_default", text = "Pinch it at the edge and pull. A good thick hide fights your fingers like a stubborn recruit, and a bad one gives way and stretches like a coward. I can tell a Badlands hide from a Barrens one with my eyes shut." } },
      choices = {
        { text = "Prove it, then.", next = "w2hide2" },
        { text = "You make it sound like drill.", next = "w2hide2" },
        { text = "Something else, Sergeant.", next = "BACK" },
      },
    },
    w2hide2 = {
      lines = {
        { id = "w2hd2_lw", when = { profession = { "Leatherworking", "Skinning" } }, text = "Hand me one, then, and close your own eyes while you're at it, since you work hides yourself. The Badlands ones smell of dust and heat; the Barrens ones smell of grass. A good leatherworker uses every sense the spirits gave her." },
        { id = "w2hd2_default", text = "Some other day, when I've the time to humiliate you properly. The Badlands hides smell of dust and heat, and the Barrens ones of grass, and a good sergeant uses every sense she has." },
      },
      choices = { { text = "I'll take your word for it.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "I am Sergeant Umala, and I gather thick leather for the armor of the Horde's soldiers. When the gates of Ahn'Qiraj open, our grunts will need every hide we can stitch together." } },
      again = { { id = "h_again", text = "Well? What else?" } },
      choices = {
        { text = "What is Ahn'Qiraj?", next = "aq" },
        { text = "Where should I hunt for thick hides?", next = "where" },
        { text = "I'll bring thick leather.", next = "BUSINESS" },
        { text = "I fought in the Second War too.", next = "war2", when = { race = "Orc" } },
        { text = "You look at those hides like recruits.", next = "recruits" },
        { text = "What armor would you trust in battle?", next = "armor", when = { class = "WARRIOR" } },
        { text = "Which recruit do you remember most?", next = "y_recruit" },
        { text = "Tell me about your tribe.", next = "y_tribe" },
        { text = "How do you judge a hide by touch?", next = "w2hide" },
        { text = "Farewell, Sergeant.", next = "END" },
      },
    },
    aq = {
      lines = { { id = "a_default", text = "An old city of the silithid behind a great wall in Silithus. The scouts say the insects are stirring, and the Warchief means for us to be ready when they come." } },
      choices = {
        { text = "Will the Alliance fight beside us?", next = "alliance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alliance = {
      lines = { { id = "al_default", text = "They gather their own supplies in Ironforge, and there is even a dwarf ambassador here to count ours. I do not like it, but I like the bugs even less." } },
      choices = {
        { text = "Fighting beside them is necessary.", next = "BACK", reply = "Necessary, aye, but I will keep my back to a wall.", fx = { align = { order = 1 } } },
        { text = "The Horde needs no help from them.", next = "BACK", reply = "That is the orc in you talking, and I agree.", fx = { align = { order = -1 } } },
      },
    },
    where = {
      lines = { { id = "w_default", text = "In the Hinterlands, Feralas and the Badlands. Big animals with thick hides, not the scrawny things around here." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    war2 = {
      lines = { { id = "war2_default", text = "Then we have both seen what the demon blood did to us. I am glad we are free of it, and I am glad we fight for a better reason now." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    recruits = {
      lines = { { id = "rc_default", text = "Because I trained recruits for twenty years, and a weak hide and a weak recruit fail in the same place. They split at the edges when the pressure comes." } },
      choices = {
        { text = "Were you hard on them?", next = "hard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hard = {
      lines = { { id = "hd_default", text = "Harder than they liked and softer than the Alliance would have been. Most of the ones I trained are still alive, and that is the only measure I care about." } },
      choices = {
        { text = "Discipline keeps soldiers alive.", next = "BACK", reply = "It does. Remember that when your own sergeant shouts at you.", fx = { align = { order = 1 } } },
        { text = "Fear makes poor soldiers.", next = "BACK", reply = "Hm. Some of them told me so, years later, and some of them were right.", fx = { align = { order = -1 } } },
      },
    },
    armor = {
      lines = { { id = "ar_default", text = "Thick leather under mail, and mail under plate if you can afford it, warrior. A blade that slips past the steel still has to cut through hide, and that is often enough to save you." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_recruit = {
      lines = {
        { id = "y_recruit_d", text = "A thin orc named Durgak who could not hold a shield. I shouted at him for a month, and he wept in the barracks every night. He saved my life at the Crossroads, years later." },
        { id = "y_recruit_orc", when = { race = "Orc" }, text = "A thin orc named Durgak, younger than you. I shouted at him for a month and he wept every night. He saved my life years later. Remember that when your own sergeant shouts." },
      },
      choices = {
        { text = "Did you ever thank him?", next = "y_thank" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_thank = {
      lines = { { id = "y_thank_d", text = "I never did. He fell soon after, and I told myself that a sergeant should not thank her recruits. Was I wrong?" } },
      choices = {
        { text = "Yes. Thanks costs nothing.", next = "BACK", reply = "Hm. I will thank the next one, then, before it is too late.", fx = { align = { order = -1 } } },
        { text = "No. A sergeant must stay apart.", next = "BACK", reply = "That is what I told myself. Thank you.", fx = { align = { order = 1 } } },
      },
    },
    y_tribe = {
      lines = { { id = "y_tribe_d", text = "I am Blackrock by birth, and I am not proud of what Rend made of the clan. I left before the end and joined the Warchief. Do not ask me more than that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a sergeant in the Second War and I am a sergeant now. I will be one until I die, most likely." } },
    blackrock = { { id = "y_tp_br", text = "Blackrock was a proud clan once. Now it is Rend's, and I spit on it." } },
    ahnqiraj = { { id = "y_tp_aq", text = "Ahn'Qiraj will need thick armor and thicker skin. I am supplying the first." } },
    _none = { { id = "tp_none", text = "Not my concern, {class}. Ask someone who has time to wonder." } },
  },
}

-- Stoneguard Clayhoof: tauren collecting runecloth bandages for the war effort.
P:NPC {
  key = "og_stoneguard_clayhoof", id = TODO_NPC("Stoneguard Clayhoof"), name = "Stoneguard Clayhoof", gender = "female",
  role = "collector", tier = "quest",
  communities = { "orgrimmar" }, temper = { "solid", "calm" }, values = { "duty", "loyal" },
  notices = { "race", "profession" },
  impression = {
    first = "Stoneguard Clayhoof stands among the war effort's crates like a menhir, broad and still, with a stack of runecloth bandages at her hooves.",
    third = "{name} met Stoneguard Clayhoof, a tauren collecting runecloth bandages for the war effort.",
  },
  greetings = {
    { id = "g_default", text = "Be welcome, {class}. I guard these supplies and I gather more of them, so if you bring bandages, you are a friend." },
    { id = "g_quest", when = { questActive = TODO_QUEST("The Horde Needs Runecloth Bandages!") }, text = "The runecloth bandages, friend. Do not forget them." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" }, text = "Ah, a shu'halo. The stoneguard of Thunder Bluff are glad to see our people doing their part." },
  },
  start = "hello",
  nodes = {
    w2carve = {
      lines = { { id = "w2cv_default", text = "I carve little kodo from the soft stone the peons throw away, and I give them to the orphans who come through the valley. Matron Battlewail says I am spoiling them, but she keeps one on her own windowsill." } },
      choices = {
        { text = "May I see one?", next = "w2carve2" },
        { text = "A guard should keep her hands free.", next = "w2carve2" },
        { text = "Something else, Stoneguard.", next = "BACK" },
      },
    },
    w2carve2 = {
      lines = {
        { id = "w2cv2_tauren", when = { race = "Tauren" }, text = "Here, shu'halo, take this one, the one with the broken horn. Every calf on the bluffs is given a carved kodo, as you surely were, and it seemed wrong that these little ones should have none." },
        { id = "w2cv2_default", text = "Here, take this one, the one with the broken horn. Every calf on the bluffs of Thunder Bluff is given a carved kodo, and it seemed wrong that these little ones should have none." },
      },
      choices = { { text = "Thank you, Clayhoof.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "I am Clayhoof of the stoneguard, and I gather runecloth bandages for the march on Ahn'Qiraj. Runecloth holds best of all, and the best is what our warriors deserve." } },
      again = { { id = "h_again", text = "What else? I am in no hurry." } },
      choices = {
        { text = "What is a stoneguard?", next = "stoneguard" },
        { text = "Where do I find runecloth?", next = "runecloth" },
        { text = "I'll bring bandages.", next = "BUSINESS" },
        { text = "Does Cairne still guard the bluffs himself?", next = "cairne", when = { race = "Tauren" } },
        { text = "What do you make of Orgrimmar?", next = "city" },
        { text = "I'm a shaman. Do the stoneguard know the earth spirits?", next = "earth", when = { class = "SHAMAN" } },
        { text = "Have you ever left your post?", next = "y_post" },
        { text = "What do you fear?", next = "y_fear" },
        { text = "Is there trouble in Thunder Bluff?", next = "y_magatha" },
        { text = "What do you do when the crates are quiet?", next = "w2carve" },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
    },
    stoneguard = {
      lines = { { id = "s_default", text = "We are the guards of Thunder Bluff's high places, sworn to stand like stone when everything else falls. Cairne sent a few of us here to guard the war effort's supplies." } },
      choices = {
        { text = "Do you trust the orcs to guard their own?", next = "trust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust = {
      lines = { { id = "t_default", text = "I trust them to fight, and to fight well. Guarding a stack of crates takes patience, though, and that is not something every orc has." } },
      choices = {
        { text = "The orcs are our brothers. Trust them.", next = "BACK", reply = "I do, friend, but I also watch the crates.", fx = { align = { honor = 1 } } },
        { text = "Trust is earned, even between allies.", next = "BACK", reply = "Wise words, and stoneguard words.", fx = { align = { honor = -1 } } },
      },
    },
    runecloth = {
      lines = { { id = "r_default", text = "From the satyrs of Felwood and the trolls of Zul'Farrak and the dead of the Plaguelands. Wherever the enemies of the Horde are strongest, there you will find runecloth." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cairne = {
      lines = { { id = "cairne_default", text = "He walks them every morning before the sun is fully risen, old as he is. We stoneguard try to keep up, and we rarely do." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    city = {
      lines = { { id = "ci_default", text = "It is loud and hot and made of stone that someone else carved, which is strange to me. Still, the orcs built it with their own hands after years in chains, and that I respect." } },
      choices = {
        { text = "Would you ever live here?", next = "live" },
        { text = "Something else.", next = "BACK" },
      },
    },
    live = {
      lines = { { id = "lv_default", text = "No, friend, I would miss the wind on the bluffs too much. But I am glad the orcs have a home, because a people without one grows bitter, and bitterness spreads." } },
      choices = {
        { text = "Every people deserves its own home.", next = "BACK", reply = "Yes, and every people should guard it well.", fx = { align = { light = 1 } } },
        { text = "Homes are won by strength, not deserved.", next = "BACK", reply = "There is truth in that, though it is a hard truth.", fx = { align = { light = -1 } } },
      },
    },
    earth = {
      lines = { { id = "ea_default", text = "We stand with them, which is close to knowing them. The earth spirits like a patient creature, and no one is more patient than a stoneguard on watch." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_post = {
      lines = {
        { id = "y_post_d", text = "Once, friend. A child fell from the bluffs, and I ran to catch her. I caught her, and while I was away, a thief took a bundle of spears from my watch. Magatha's people were not kind about it." },
        { id = "y_post_ta", when = { race = "Tauren" }, text = "Once, shu'halo. A calf fell from the bluffs and I ran to catch her, and a thief took the spears I guarded. Magatha's people still speak of it. You may have heard the tale." },
      },
      choices = {
        { text = "You did right to save the child.", next = "BACK", reply = "I think so too. The spears were replaced. She was not.", fx = { align = { order = -1 } } },
        { text = "A guard must never leave her post.", next = "BACK", reply = "That is the stoneguard oath. I broke it, and I would break it again.", fx = { align = { order = 1 } } },
      },
    },
    y_fear = {
      lines = { { id = "y_fear_d", text = "That the young ones who go to Silithus will forget the bluffs. War changes a tauren, friend, and not always back." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_magatha = {
      lines = { { id = "y_magatha_d", text = "Magatha Grimtotem sits on the Elder Rise and watches Cairne the way a hawk watches a field. I do not trust her, friend, and I am not alone." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have guarded the bluffs of Thunder Bluff all my life. These crates are smaller, but I guard them just as well." } },
    thunder_bluff = { { id = "y_tp_tb", text = "Thunder Bluff stands on four mesas, and the stoneguard stand at every lift. It is a good place to grow old." } },
    grimtotem = { { id = "y_tp_gt", text = "The Grimtotem keep their own counsel. I keep my eye on them." } },
    _none = { { id = "tp_none", text = "I do not know that, friend. Stone does not need to know much." } },
  },
}

-- Commander Stronghammer: dwarf ambassador counting the Horde's war effort.
P:NPC {
  key = "og_commander_stronghammer", id = TODO_NPC("Commander Stronghammer"), name = "Commander Stronghammer", gender = "male",
  role = "ambassador", tier = "service",
  communities = { "orgrimmar" }, temper = { "gruff", "wary" }, values = { "duty", "honor" },
  notices = { "race" },
  impression = {
    first = "Commander Stronghammer is a dwarf in Orgrimmar, which is remarkable enough, standing among the Horde's war-effort crates with a ledger and a stare that dares anyone to say so.",
    third = "{name} met Commander Stronghammer, the Alliance ambassador who watches the Horde's war effort in Orgrimmar.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Ah, friend. Aye, I'm still a dwarf in Orgrimmar, but ye make it a sight easier." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Aye, I'm a dwarf, and aye, I'm in Orgrimmar. Ye can stop starin' now." },
    { id = "g_default", text = "Aye, aye, I'm a dwarf, and aye, I'm in Orgrimmar. Ye can stop starin' now, {class}." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" }, text = "An orc. Well, I suppose that's to be expected around here, isn't it?" },
  },
  start = "hello",
  nodes = {
    w2count = {
      lines = { { id = "w2cn_default", text = "Orcs don't count, lad, they heap. Ask a grunt how much copper's in the crate an' he'll say 'a lot', an' ask a troll an' he'll say 'enough', an' the tauren just look at ye kindly an' say the Earth Mother provides." } },
      choices = {
        { text = "So how do you get a number?", next = "w2count2" },
        { text = "Maybe 'a lot' is good enough.", next = "w2count2" },
        { text = "Something else, Commander.", next = "BACK" },
      },
    },
    w2count2 = {
      lines = { { id = "w2cn2_default", text = "I count it meself, every bar, while they stand there watchin' me like I'm mad. Funny thing is, the heaps are always bigger than Ironforge expected, an' I've had to write that down more than once, which pains me." } },
      choices = { { text = "Honest of you to write it.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "I'm Commander Stronghammer of Ironforge, sent to see that the Horde pulls its weight for the war in Silithus. Ye've got yer collectors, we've got ours, an' I'm here to make sure nobody's cheatin'." } },
      again = { { id = "h_again", text = "Anythin' else? I've numbers to check." } },
      choices = {
        { text = "Do you trust the Horde?", next = "trust" },
        { text = "How do you like Orgrimmar?", next = "orgrimmar" },
        { text = "What brings a dwarf into the Horde's capital?", next = "xwhy" },
        { text = "What's in the ledger?", next = "xledger" },
        { text = "An orc and a dwarf, talking peacefully. Strange days.", when = { race = "Orc" }, next = "xorc" },
        { text = "Who counts the Horde's effort in Ironforge?", next = "y_other" },
        { text = "Do the orcs give you trouble?", next = "y_trouble" },
        { text = "I'm a dwarf too, Commander.", next = "y_dwarf", when = { race = "Dwarf" } },
        { text = "What's hardest about counting for the Horde?", next = "w2count" },
        { text = "Good day, dwarf.", next = "END" },
      },
    },
    trust = {
      lines = { { id = "t_default", text = "Trust is a strong word, {g:lad|lass}. I trust that the bugs in Silithus'll eat us all if we don't work together, an' that'll have to do for now." } },
      choices = {
        { text = "A truce with the Alliance makes us stronger.", next = "BACK", reply = "Aye, it does, though I'll not say it too loud in Ironforge.", fx = { align = { order = 1 } } },
        { text = "This truce won't last past the war.", next = "BACK", reply = "Likely not, but let's not be the first to break it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orgrimmar = {
      lines = { { id = "o_default", text = "It's hot, it's red, an' nobody serves a proper ale. But I'll grant ye this, the orcs built it fast an' built it strong, an' a dwarf can respect good stonework." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xwhy = {
      lines = {
        { id = "xwhy_default", text = "The Alliance sends me to count what the Horde puts toward the war effort, and the Horde sends someone to count ours in Ironforge. Neither of us trusts the other's numbers, so we both count twice." },
      },
      choices = {
        { text = "What war effort?", next = "xeffort" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xeffort = {
      lines = {
        { id = "xeffort_default", text = "Somethin' nasty's stirrin' in the far south of Kalimdor, and the kings and the Warchief agree it'll take both sides to meet it. I don't like sharin' a ledger with orcs, but I like what's stirrin' less." },
      },
      choices = {
        { text = "And if the Horde falls short?", next = "xshort" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xshort = {
      lines = {
        { id = "xshort_default", text = "Then I'll write it down, plain and fair, and I'll do the same when Ironforge falls short. A count's no good if ye cook it for yer friends." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xledger = {
      lines = {
        { id = "xledger_default", text = "Copper bars, linen, peacebloom, arrows, the lot. Yer orcs are generous with the bandages, I'll give 'em that, though their handwritin' is a disgrace." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xorc = {
      lines = {
        { id = "xorc_default", text = "Strange days indeed, lad. My grandda fought yer kind at Grim Batol, and here I am countin' yer arrows for ye. He'd have had words, and so would I, a few years back." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_other = {
      lines = { { id = "y_other_d", text = "Some Horde general or other, sat among the Commons with his own ledger. I hear he complains about the cold and the beer the way I complain about the heat, so at least we're even." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_trouble = {
      lines = {
        { id = "y_trouble_d", text = "A grunt spat at my boots on the first day, and his officer made him scrub the stones. Since then they mostly glare, which I can live with. I glare back, and I'm better at it." },
        { id = "y_trouble_orc", when = { race = "Orc" }, text = "One of yer lot spat at my boots on the first day, and his officer made him scrub the stones. Since then they mostly glare. No offence, but I'm better at glarin'." },
      },
      choices = {
        { text = "Has anyone threatened you?", next = "y_threat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_threat = {
      lines = { { id = "y_threat_d", text = "There's a note under my bedroll most mornings, unsigned and badly spelled. I've nae told the Warchief's people, because I'll not be the dwarf who whined. What would ye do?" } },
      choices = {
        { text = "Report it. The truce needs protecting.", next = "BACK", reply = "Aye, maybe so. I'll think on it over a bad ale.", fx = { align = { order = 1 } } },
        { text = "Handle it yourself, like a dwarf.", next = "BACK", reply = "Now that's advice I like the sound of.", fx = { align = { order = -1 } } },
      },
    },
    y_dwarf = {
      lines = { { id = "y_dwarf_d", text = "So ye are, and walkin' about Orgrimmar bold as brass. Mind yerself, {g:lad|lass}. The Warchief's word protects me, but I'm nae sure how far it stretches for a dwarf who's only visitin'." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    ironforge = { { id = "y_tp_if", text = "Ironforge has proper ale and proper stone and nae a single orc. I miss it every hour." } },
    ahnqiraj = { { id = "y_tp_aq", text = "Whatever's behind that wall in Silithus, it frightens the night elves, and that's enough to frighten me." } },
    alterac = { { id = "tp_x_alterac", text = "Alterac's a cold place to bleed, and both sides do plenty of it. I don't count those numbers, thank the stone." } },
    _none = { { id = "tp_none", text = "Nae idea, {class}. I'm here to count crates, not answer riddles." } },
  },
}

-- Bounty Hunter Kolark: a well-travelled tauren who trades in thorium-headed arrows.
P:NPC {
  key = "og_bounty_hunter_kolark", id = TODO_NPC("Bounty Hunter Kolark"), name = "Bounty Hunter Kolark", gender = "male",
  role = "bounty_hunter", tier = "quest",
  communities = { "orgrimmar" }, temper = { "laconic", "shrewd" }, values = { "practical", "honor" },
  notices = { "race", "class" },
  impression = {
    first = "Bounty Hunter Kolark leans against a pillar in the Valley of Honor, a tauren with a salt-stained cloak and a quiver of arrows whose heads catch the light like dark silver.",
    third = "{name} met Bounty Hunter Kolark, a tauren tracker who has hunted bounties across the South Seas.",
  },
  greetings = {
    { id = "g_default", text = "You have the look of someone who hunts, {class}. Sit, if you like, and we shall talk of quarry." },
    { id = "g_back", when = { metBefore = true }, text = "Back from the hunt? Then tell me what you caught, or show me." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" }, text = "A hunter. Then you will know good arrows when you see them." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" }, text = "A brother of the plains, far from home like me. The Earth Mother sends us all over her lands, it seems." },
  },
  start = "hello",
  nodes = {
    w2bow = {
      lines = { { id = "w2bw_default", text = "Because a gun tells everyone in the jungle where you are, and an arrow tells only the one it finds. The goblins in Booty Bay offered me a fine rifle once, and I traded it for a crate of thorium before it was dark." } },
      choices = {
        { text = "Do the goblins think you're mad?", next = "w2bow2" },
        { text = "Guns hit harder, though.", next = "w2bow2" },
        { text = "Something else, Kolark.", next = "BACK" },
      },
    },
    w2bow2 = {
      lines = {
        { id = "w2bw2_hunter", when = { class = "HUNTER" }, text = "They think every tauren is mad, so I am in good company. You hunt, so you know: what matters is the quarry never hearing you, and the bow is the quietest way the Earth Mother gave us to ask a life of the world." },
        { id = "w2bw2_default", text = "They think every tauren is mad, so I am in good company. A gun hits harder, yes, but the quarry that never hears you coming does not need to be hit hard." },
      },
      choices = { { text = "A patient way to hunt.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "I am Kolark, and I hunt for bounties wherever the Horde will pay for them. I have travelled to the South Seas and back, and there I learned to make arrows tipped with thorium that will pierce a dragon's scale." } },
      again = { { id = "h_again", text = "What else, friend? I am patient as a stalking cat." } },
      choices = {
        { text = "Tell me about the South Seas.", next = "seas" },
        { text = "Could you trade me those arrows?", next = "trade" },
        { text = "Why does a tauren hunt bounties?", next = "why" },
        { text = "Show me those arrows, hunter.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "Any bounties worth taking now?", next = "bounties" },
        { text = "Do you miss Mulgore, brother?", next = "mulgore", when = { race = "Tauren" } },
        { text = "Who hires you, Kolark?", next = "y_who" },
        { text = "What did you do with the Bloodsail captain?", next = "y_captain" },
        { text = "Why arrows, and not a gun?", next = "w2bow" },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
    },
    seas = {
      lines = { { id = "s_default", text = "Warm water, endless islands and pirates who will cut your throat for a copper. The Bloodsail buccaneers hold many of those islands, and I have collected more than one bounty on their captains." } },
      choices = {
        { text = "Did you ever get caught?", next = "caught" },
        { text = "Something else.", next = "BACK" },
      },
    },
    caught = {
      lines = { { id = "c_default", text = "Once, on a ship bound for Booty Bay. They chained me in the hold and forgot that tauren are stronger than chains, and that was the last mistake that crew made." } },
      choices = {
        { text = "Pirates deserve no mercy.", next = "BACK", reply = "They gave none to me, so I returned the favor.", fx = { align = { light = -1 } } },
        { text = "You could have just escaped.", next = "BACK", reply = "I could have. But they would have chained the next tauren too.", fx = { align = { light = 1 } } },
      },
    },
    trade = {
      lines = { { id = "t_default", text = "Not for gold, but for a fair trade. Bring me what I ask, and I will give you thorium-headed arrows, as fair a bargain as you will find in this city." } },
      choices = {
        { text = "I'll make that trade.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because I was never good at sitting still, and the Horde has many enemies who need finding. Some tauren hunt kodo, and I hunt worse things." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bounties = {
      lines = { { id = "bo_default", text = "There are always bounties, friend, posted on the boards in the Valley of Honor and at the Crossroads. Centaur raiders, quilboar chieftains and the occasional deserter all fetch a price." } },
      choices = {
        { text = "Who was your hardest quarry?", next = "hardest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hardest = {
      lines = { { id = "hq_default", text = "A Bloodsail captain who swam better than he fought, and he swam a long way. I caught him on the beaches of Stranglethorn after three days, and I let the bounty office decide his fate." } },
      choices = {
        { text = "You did right to bring him in alive.", next = "BACK", reply = "Justice is for the Horde to give, not for me.", fx = { align = { honor = 1 } } },
        { text = "I'd have ended it on the beach.", next = "BACK", reply = "Many would have, and the pay is the same either way.", fx = { align = { honor = -1 } } },
      },
    },
    mulgore = {
      lines = { { id = "mu_default", text = "I miss the smell of the grass after rain, and the kodo calling at dusk. One day I will lay down my bow by Bloodhoof Village, but the sea still has a few more stories for me first." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_who = {
      lines = { { id = "y_who_d", text = "Grunts who lost a brother to centaur, merchants who lost a caravan, and once a Darkspear elder who lost a son to the sea. The Horde's own boards pay little, so most of my work comes from folk who have no one else to ask." } },
      choices = {
        { text = "Do you ever refuse a bounty?", next = "y_refuse" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_refuse = {
      lines = {
        { id = "y_refuse_d", text = "I refuse any bounty on a member of the Horde, whatever the price. A goblin offered me a fortune once to find a grunt who owed him money, and I told him the Earth Mother does not hunt her own herd." },
        { id = "y_refuse_gob", when = { race = "Goblin" }, text = "I refuse any bounty on a member of the Horde. One of your cartel offered me a fortune once to find a grunt who owed him, and I sent him away. No offence to you, friend." },
      },
      choices = {
        { text = "A debt is a debt. You should have taken it.", next = "BACK", reply = "Then you and the goblin may hunt together. I will not.", fx = { align = { honor = -1 } } },
        { text = "Good. Kin is not quarry.", next = "BACK", reply = "Well said. We understand each other.", fx = { align = { honor = 1 } } },
      },
    },
    y_captain = {
      lines = { { id = "y_captain_d", text = "I delivered him to the goblins of Booty Bay, who had the bounty on him, and I did not stay to see what they did. I have wondered since whether I should have." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    bloodsail = { { id = "y_tp_bs", text = "The Bloodsail are many, and cruel, and they sail better than any orc. I have taken six of their captains and there are always more." } },
    booty_bay = { { id = "y_tp_bb", text = "Booty Bay pays well and asks nothing. That is why I do not trust it." } },
    background = { { id = "tp_bg", text = "I was born in Mulgore and I have hunted on every shore since. One day I will go home, but not yet." } },
    _none = { { id = "tp_none", text = "I have not heard of that, friend. Perhaps it is not worth a bounty." } },
  },
}

-- Kruban Darkblade: Darkmoon Faire barker who wanders the Valley of Strength.
P:NPC {
  key = "og_kruban_darkblade", id = TODO_NPC("Kruban Darkblade"), name = "Kruban Darkblade", gender = "male",
  role = "barker", tier = "quest",
  communities = { "orgrimmar" }, temper = { "loud", "jovial" }, values = { "fun" },
  notices = { "race" },
  impression = {
    first = "Kruban Darkblade strides through the Valley of Strength in a coat of Darkmoon purple, an orc with a voice built for a battlefield and put to use selling tickets.",
    third = "{name} met Kruban Darkblade, an orc barker for the Darkmoon Faire.",
  },
  greetings = {
    { id = "g_default", text = "Hear me, Orgrimmar! The Darkmoon Faire is coming, and you do not want to miss it, {class}!" },
  },
  start = "hello",
  nodes = {
    w2sayge = {
      lines = { { id = "w2sy_default", text = "Their fortunes, friend, in the form of hard questions! He asks you what you would do if your village were burning, and the answer you give decides the blessing you leave with. Half the grunts I send him come back very quiet." } },
      choices = {
        { text = "Is he a true seer?", next = "w2sayge2" },
        { text = "A tent full of questions sounds like a trick.", next = "w2sayge2" },
        { text = "Something else, Kruban.", next = "BACK" },
      },
    },
    w2sayge2 = {
      lines = { { id = "w2sy2_default", text = "I have worked for the Faire for nine years and I still cannot say. But he asked me once what I would do if I could leave the camps, and I said I would go wherever there was laughter, and here I am, shouting about it." } },
      choices = { { text = "Then he was right about you.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "I am Kruban Darkblade, and I cry the news of the Darkmoon Faire to every orc, troll and tauren who will listen. Silas Darkmoon's wonders come to Mulgore and Elwynn in turn, and I make sure the Horde knows when." } },
      again = { { id = "h_again", text = "More questions? Good, curiosity sells tickets!" } },
      choices = {
        { text = "What is the Darkmoon Faire?", next = "faire" },
        { text = "How did an orc become a barker?", next = "orc" },
        { text = "Who is Silas Darkmoon?", next = "silas" },
        { text = "What games does the Faire have?", next = "games" },
        { text = "I remember the camps too.", next = "camps", when = { race = "Orc" } },
        { text = "It comes near Mulgore? Near my home?", next = "mulgore", when = { race = "Tauren" } },
        { text = "Do you ever miss the soldier's life?", next = "y_miss" },
        { text = "Is there a darker side to the Faire?", next = "y_dark" },
        { text = "What does Sayge tell the people who visit him?", next = "w2sayge" },
        { text = "Some other time.", next = "END" },
      },
    },
    faire = {
      lines = { { id = "f_default", text = "Games, wonders, prizes and the strangest folk in all of Azeroth, gathered in one field. You can win tickets, trade them for treasures and see a gnome shot from a cannon, if you are lucky." } },
      choices = {
        { text = "Where does it set up?", next = "where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where = {
      lines = { { id = "wh_default", text = "Near Mulgore, by Thunder Bluff, when it comes to Horde lands, and near Goldshire in Elwynn when it visits the Alliance. Both sides come, and nobody fights, because Silas will not have it." } },
      choices = {
        { text = "A place without war sounds good.", next = "BACK", reply = "It is, and it is good for business too.", fx = { align = { order = -1 } } },
        { text = "I don't share a field with the Alliance.", next = "BACK", reply = "Then you will miss the best fun in Azeroth, friend.", fx = { align = { order = 1 } } },
      },
    },
    orc = {
      lines = { { id = "o_default", text = "I fought in the Second War and I hated every day of it. When the Faire came by the camp where I was held, I asked Silas if he needed a loud voice, and he did." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    silas = {
      lines = { { id = "s_default", text = "The master of the Faire, and the richest showman in the world. Nobody knows where he came from, and I do not ask." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    games = {
      lines = { { id = "ga_default", text = "There is the ring toss, the shooting gallery and a tonk you can drive about and crash into other folk's tonks. The gnome cannon is the favorite, though, and nobody minds being the gnome except the gnome." } },
      choices = {
        { text = "Which game do you like best?", next = "best" },
        { text = "Something else.", next = "BACK" },
      },
    },
    best = {
      lines = { { id = "be_default", text = "The strength test, because I still hold the record among the Faire's own folk. Silas says it is unseemly for a barker to win his own prizes, so I give the tickets to the children." } },
      choices = {
        { text = "Games are a waste of a warrior's time.", next = "BACK", reply = "Then you have never seen an orc lose to a goblin at ring toss!", fx = { align = { order = 1 } } },
        { text = "A little foolishness is good for anyone.", next = "BACK", reply = "Now that is the Faire's spirit, friend!", fx = { align = { order = -1 } } },
      },
    },
    camps = {
      lines = { { id = "cm_default", text = "Then you know how long the days were behind those fences, and how little there was to laugh about. The day the Faire stopped outside our camp, I laughed until I wept, and I swore I would never stop again." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    mulgore = {
      lines = { { id = "ml_default", text = "Right below Thunder Bluff, on the plains by the lake, where the kodo come to drink. The tauren children follow the wagons for miles when they arrive, and the elders pretend not to." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_miss = {
      lines = {
        { id = "y_miss_d", text = "Not the killing, friend. I miss the songs at night, and the comrades. The Faire has its own songs now, and its own comrades, and fewer of them die before morning." },
        { id = "y_miss_orc", when = { race = "Orc" }, text = "Not the killing, brother, and you will understand that. I miss the songs at night, and the comrades. The Faire gave me both back, without the dying." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_dark = {
      lines = { { id = "y_dark_d", text = "You have sharp ears. Some say Silas trades in things stranger than tickets, and there are cards in his tent that nobody may touch. I have seen a grown troll weep after a reading from Sayge." } },
      choices = {
        { text = "Does that trouble you?", next = "y_trouble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_trouble = {
      lines = { { id = "y_trouble_d", text = "Sometimes. But the Faire took me from a camp when no one else would. Should a debt like that keep me loyal, or should I ask the questions nobody asks?" } },
      choices = {
        { text = "Loyalty. Silas earned it.", next = "BACK", reply = "That is what my heart says. Thank you, friend.", fx = { align = { honor = 1 } } },
        { text = "Ask. A debt doesn't buy silence.", next = "BACK", reply = "Hm. Perhaps one question, quietly, after the next show.", fx = { align = { honor = -1 } } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Soldier once, showman now. I prefer the showman." } },
    darkmoon_faire = { { id = "y_tp_dmf", text = "The Darkmoon Faire is the only place in Azeroth where an orc and a human can lose to a gnome at the same game." } },
    sayge = { { id = "y_tp_sayge", text = "Sayge reads fortunes, and they come true more often than I like. I do not let him read mine." } },
    internment = { { id = "y_tp_camps", text = "The camps taught me to be grateful for a laugh. The Faire taught me to sell one." } },
    _none = { { id = "tp_none", text = "I don't know that one, friend, but ask me about the Faire." } },
  },
}

-- Rilli Greasygob: ex-Venture Company goblin at Nogg's Machine Shop.
P:NPC {
  key = "og_rilli_greasygob", id = TODO_NPC("Rilli Greasygob"), name = "Rilli Greasygob", gender = "male",
  role = "engineer", tier = "quest",
  communities = { "orgrimmar" }, temper = { "nervous", "chatty" }, values = { "profit" },
  notices = { "profession" },
  impression = {
    first = "Rilli Greasygob hunches over a workbench in Nogg's Machine Shop, glancing up whenever the door opens as if he expects a debt collector to come through it.",
    third = "{name} met Rilli Greasygob, a goblin who left the Venture Company for Nogg's shop in the Drag.",
  },
  greetings = {
    { id = "g_default", text = "Oh, it's you! I mean, not you, just somebody, and I'm glad it's not somebody else, if you follow me." },
  },
  notice = {
    { id = "n_eng", cat = "profession", when = { profession = "Engineering" }, text = "An engineer, eh? Don't touch the red wires, pal, I'm still figurin' out what they do." },
  },
  start = "hello",
  nodes = {
    w2miss = {
      lines = { { id = "w2ms_default", text = "The workshop, pal, I'll admit it. Big as a barn, every tool you ever dreamed of, and a furnace that could melt a shredder in an afternoon. Nogg's got a bench and a stool and a hole in the roof I keep meanin' to fix." } },
      choices = {
        { text = "Would you ever go back?", next = "w2miss2" },
        { text = "A good workshop isn't worth a bad boss.", next = "w2miss2" },
        { text = "Something else, Rilli.", next = "BACK" },
      },
    },
    w2miss2 = {
      lines = {
        { id = "w2ms2_eng", when = { profession = "Engineering" }, text = "Not for all the tools in Kalimdor! You build things, pal, so you get it: what's the point of a great furnace if the fella next to it owns everything you make in it? Here, at least, the bombs are mine." },
        { id = "w2ms2_default", text = "Not for all the tools in Kalimdor. Here I own what I build, and nobody pours oil in a creek because of something I drew on a napkin, and that's worth a hole in the roof." },
      },
      choices = { { text = "A good trade.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "Name's Rilli, and I work for Nogg now, which is a lot better than workin' for the Venture Company, believe you me. Over there it was all shouting and quotas, and Boss Copperplug never once said thank you." } },
      again = { { id = "h_again", text = "Somethin' else? Talk fast, I got a bomb in the oven." } },
      choices = {
        { text = "Why did you leave the Venture Company?", next = "left" },
        { text = "Who is Boss Copperplug?", next = "copperplug" },
        { text = "I hear you have a job for me.", next = "BUSINESS" },
        { text = "What are you building for Nogg?", next = "build" },
        { text = "I'm an engineer. Show me your work.", next = "eng", when = { profession = "Engineering" } },
        { text = "What did you invent for the Venture Company?", next = "y_invent" },
        { text = "How did Nogg take you in?", next = "y_nogg" },
        { text = "Where do you sleep, with thugs after you?", next = "y_sleep" },
        { text = "Do you miss anything about the Venture Company?", next = "w2miss" },
        { text = "Never mind.", next = "END" },
      },
    },
    left = {
      lines = { { id = "l_default", text = "I had a disagreement with the boss about who owned my inventions, and the boss had a lot of thugs on his side. So I took my tools and ran, and Nogg was kind enough to hire me." } },
      choices = {
        { text = "Are they still after you?", next = "after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    after = {
      lines = { { id = "a_default", text = "Probably! The Venture Company don't forget a debt, and they figure I owe them for every bolt I took. That's why I jump every time the door opens." } },
      choices = {
        { text = "Let them come. I'll deal with them.", next = "BACK", reply = "You would? Pal, you just became my favorite customer.", fx = { align = { order = -1 } } },
        { text = "Maybe pay them what you owe.", next = "BACK", reply = "Pay them? With what? You see any gold on me?", fx = { align = { order = 1 } } },
      },
    },
    copperplug = {
      lines = { { id = "c_default", text = "The Venture Company's boss down in the Barrens, runs the operations near the Sludge Fen and the drill sites. Mean as a snake and twice as greasy." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    build = {
      lines = { { id = "bu_default", text = "Right now? A clockwork boot that kicks the bombs back out the door before they go off, which Nogg says is the stupidest thing he ever paid for. I say it's an investment in keepin' all ten fingers." } },
      choices = {
        { text = "Does it work?", next = "works" },
        { text = "Something else.", next = "BACK" },
      },
    },
    works = {
      lines = { { id = "wk_default", text = "Mostly! It kicked one bomb out the door just fine, and then it kicked Nogg, which cost me a week's wages and a very long apology." } },
      choices = {
        { text = "Invention needs risk. Keep at it.", next = "BACK", reply = "See, that's what I tell Nogg, and he never listens!", fx = { align = { order = -1 } } },
        { text = "Maybe test it away from your boss.", next = "BACK", reply = "Yeah, yeah, real sensible, pal. Sensible don't get patents.", fx = { align = { order = 1 } } },
      },
    },
    eng = {
      lines = { { id = "en_default", text = "Sure, sure, take a look, just don't touch the coil on the left, it bites. That's a Venture Company shredder valve, by the way, and I may or may not have borrowed it on my way out." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_invent = {
      lines = {
        { id = "y_invent_d", text = "A drill head that cuts through rock twice as fast and makes half as much noise, pal. The Company used it to tear into the Barrens, and I didn't see a single copper for it. Worse, I saw what they did with it." },
        { id = "y_invent_ta", when = { race = "Tauren" }, text = "A drill head, pal, the one they used in the Barrens. I... look, I'm sorry about what they did to your land with it. I didn't know, and then I did, and then I left." },
      },
      choices = {
        { text = "What did they do with it?", next = "y_did" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_did = {
      lines = { { id = "y_did_d", text = "Pumped oil out of the ground and poured the leavings into the creeks. The tauren's kodo got sick. I could sell the plans to someone else for a fortune, or burn 'em. What would you do?" } },
      choices = {
        { text = "Burn them. Nobody should have that drill.", next = "BACK", reply = "Yeah. Yeah, I figured you'd say that.", fx = { align = { light = 1 } } },
        { text = "Sell them. It's your work.", next = "BACK", reply = "That's what my wallet says, pal. My conscience is louder.", fx = { align = { light = -1 } } },
      },
    },
    y_nogg = {
      lines = { { id = "y_nogg_d", text = "I showed up at his door with a sack of parts and a Venture Company thug chasin' me. Nogg looked at the parts, looked at the thug, and hit the thug with a wrench. Hired me that afternoon." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_sleep = {
      lines = { { id = "y_sleep_d", text = "Sleep? Under the workbench, pal, with one eye open and a wrench in my hand. Nogg says I snore, but it's probably the steam pipes." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Used to build drills for the Venture Company. Now I build whatever Nogg tells me to." } },
    venture_company = { { id = "y_tp_vc", text = "Venture Company? Keep your voice down, pal. They have ears everywhere, and some of 'em are mechanical." } },
    nogg = { { id = "y_tp_nogg", text = "Nogg's the best boss I ever had. He only yells when something explodes, which is only most days." } },
    boss_copperplug = { { id = "y_tp_cp", text = "Copperplug? He's got a price on my head, pal. A small one, which is honestly more insultin'." } },
    _none = { { id = "tp_none", text = "Don't know nothin' about that, pal, and I'd keep it that way if I were you." } },
  },
}

-- Zando'zan: Darkspear rogue in the Cleft of Shadow; sends rogues to Wrenix in Ratchet.
P:NPC {
  key = "og_zandozan", id = TODO_NPC("Zando'zan"), name = "Zando'zan", gender = "male",
  role = "rogue", tier = "quest",
  communities = { "orgrimmar" }, temper = { "sly", "amused" }, values = { "cunning" },
  notices = { "class", "race" },
  impression = {
    first = "Zando'zan lounges in the shadows of the Cleft, a lean Darkspear with a knife he keeps turning over in his fingers just to watch the light run along it.",
    third = "{name} met Zando'zan, a Darkspear rogue in the Cleft of Shadow.",
  },
  greetings = {
    { id = "g_default", text = "Ya walk loud for someone in de Cleft, {class}. De shadows be hearin' every step." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" }, text = "Ah, one of de quiet ones. Maybe I got somethin' for you." },
  },
  start = "hello",
  nodes = {
    w2trust = {
      lines = { { id = "w2tr_default", text = "De one dat works too fast, mon. A slow poison you can steer, but a fast one be a wild raptor in a bottle, an' I seen it splash back on de rogue who threw it more times dan I like to remember." } },
      choices = {
        { text = "So you avoid fast poisons altogether?", next = "w2trust2" },
        { text = "A fast poison ends a fight quickly.", next = "w2trust2" },
        { text = "Something else, Zando'zan.", next = "BACK" },
      },
    },
    w2trust2 = {
      lines = {
        { id = "w2tr2_rogue", when = { class = "ROGUE" }, text = "No, cousin, I just respect dem. You be one of us, so learn dis: coat your blade in de open air, never in a closed room, an' keep your mouth shut while you do it, because de fumes like to go where de breath goes." },
        { id = "w2tr2_default", text = "No, mon, I just respect dem. Coat de blade in de open air, never in a closed room, an' keep your mouth shut while you do it, because de fumes like to go where de breath goes." },
      },
      choices = { { text = "Good advice for anyone.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "I be Zando'zan, and I deal in de quiet arts, mon. Poisons, knives, secrets, whatever de Horde needs done in de dark." } },
      again = { { id = "h_again", text = "Still here, mon? De shadows be waitin'." } },
      choices = {
        { text = "What sort of poisons?", next = "poisons" },
        { text = "Do you know Wrenix in Ratchet?", next = "wrenix" },
        { text = "I'm ready to learn poisons.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "Tell me about the Echo Isles.", next = "isles" },
        { text = "Darkspear to Darkspear, what news?", next = "news", when = { race = "Troll" } },
        { text = "How did you come to the Cleft?", next = "y_how" },
        { text = "What troubles you in the shadows?", next = "y_trouble" },
        { text = "How do you learn a poison's taste?", next = "y_poison_test" },
        { text = "Which poison do you trust least?", next = "w2trust" },
        { text = "Leave me out of your dark business.", next = "END" },
      },
    },
    poisons = {
      lines = { { id = "p_default", text = "De kind dat makes a man slow, or sick, or dead, dependin' on how much you like him. Every good rogue learns dem, sooner or later." } },
      choices = {
        { text = "Poison is a coward's weapon.", next = "coward" },
        { text = "Something else.", next = "BACK" },
      },
    },
    coward = {
      lines = { { id = "c_default", text = "Ha! Tell dat to a Kul Tiran marine with a blade in his belly and nothin' in his veins but fire. De dead don't care how dey died, mon." } },
      choices = {
        { text = "Winning is what matters.", next = "BACK", reply = "Now you be talkin' like a troll.", fx = { align = { honor = -1 } } },
        { text = "How you win matters too.", next = "BACK", reply = "Dat be a nice thought, and nice thoughts get a lot of folk killed.", fx = { align = { honor = 1 } } },
      },
    },
    wrenix = {
      lines = { { id = "w_default", text = "De goblin with de clever machine for brewin' poisons, ya. I send my students to him when dey be ready, because he got de tools I don't." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    isles = {
      lines = { { id = "is_default", text = "De Echo Isles be our home, mon, off de coast of Durotar, but Zalazane holds dem now with his voodoo. He turned our own people into his puppets, and de rest of us moved to Sen'jin." } },
      choices = {
        { text = "What do you think of Zalazane?", next = "zalazane" },
        { text = "Something else.", next = "BACK" },
      },
    },
    zalazane = {
      lines = { { id = "zz_default", text = "I think a witch doctor dat binds his own kin deserves a quiet knife in de night. Vol'jin says patience, and Vol'jin be wiser dan me, so I wait." } },
      choices = {
        { text = "Then use that knife. Zalazane deserves it.", next = "BACK", reply = "Ha! Maybe one day, mon, if Vol'jin looks de other way.", fx = { align = { light = -1 } } },
        { text = "Vol'jin is right. Free the isles properly.", next = "BACK", reply = "Properly, ya, which means slower. I be patient, mostly.", fx = { align = { light = 1 } } },
      },
    },
    news = {
      lines = { { id = "nw_default", text = "De Cleft be quiet, and de quiet be good for business. Keep your eyes on de Burning Blade cultists in de shadows, cousin, because dey be gettin' bold." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_how = {
      lines = {
        { id = "y_how_d", text = "I was a scout for Sen'jin, mon, watchin' de Kul Tiran ships off de coast. When Thrall came, he needed eyes in de dark, and I had de best eyes in de tribe. So he gave me de Cleft." },
        { id = "y_how_tr", when = { race = "Troll" }, text = "Same as you, cousin, I came from Sen'jin with sharp eyes and quiet feet. Thrall needed somebody in de dark, and de Cleft needed a troll who wasn't afraid of it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_trouble = {
      lines = { { id = "y_trouble_d", text = "De Burning Blade be closer than de grunts think, mon. Dey wear robes like de warlocks who live here legal, and I can't always tell which be which. Some nights I think about cuttin' all of dem." } },
      choices = {
        { text = "Then cut them all. Better safe.", next = "y_cut" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_cut = {
      lines = { { id = "y_cut_d", text = "Dat be easy, mon, and fast. But de Warchief allows de warlocks, and if I kill de wrong ones, de Cleft turns on itself. What do you say, quiet one?" } },
      choices = {
        { text = "Patience. Find the guilty ones first.", next = "BACK", reply = "Ya, mon. Slower, but cleaner.", fx = { align = { light = 1 } } },
        { text = "Strike now. Warlocks are all dangerous.", next = "BACK", reply = "Ha! Maybe you be right, but de Warchief won't like it.", fx = { align = { light = -1 } } },
      },
    },
    y_poison_test = {
      lines = { { id = "y_pt_d", text = "Every rogue tests de poison on himself first, mon, in small doses. Dat be how you learn de taste of it, and dat be how you live when somebody else tries it on you." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I grew up on de Echo Isles, mon, and I learned to be quiet before I learned to walk." } },
    burning_blade = { { id = "y_tp_bb", text = "Burning Blade be de cultists in de Cleft, mon. I know their faces, and they be knowin' mine." } },
    cleft_of_shadow = { { id = "y_tp_cos", text = "De Cleft be where de Horde keeps its sharp and dark things, mon. Includin' me." } },
    zalazane = { { id = "y_tp_zal", text = "Zalazane be a dead man walkin', mon. He just don't know it yet." } },
    _none = { { id = "tp_none", text = "I don't know dat, and if I did, I wouldn't tell ya for free." } },
  },
}

-- Mokvar: in Grommash Hold, he sets heroes on the path to rebuilding their dungeon armor.
P:NPC {
  key = "og_mokvar", id = TODO_NPC("Mokvar"), name = "Mokvar", gender = "male",
  role = "agent", tier = "quest",
  communities = { "orgrimmar" }, temper = { "shrewd", "formal" }, values = { "ambition", "craft" },
  notices = { "level", "class" },
  impression = {
    first = "Mokvar stands in a corner of Grommash Hold, an orc in good clothes rather than mail, who studies the armor of every passing hero as a jeweler studies stones.",
    third = "{name} met Mokvar, an orc in Grommash Hold who takes an interest in heroes and their armor.",
  },
  greetings = {
    { id = "g_default", text = "A moment, {class}. I have a proposition for someone who has seen the inside of Blackrock Spire." },
  },
  notice = {
    { id = "n_young", cat = "level", when = { maxLevel = 55 }, text = "You are young yet. Come back to me when your armor has more scars than you do." },
  },
  start = "hello",
  nodes = {
    w2heroes = {
      lines = { { id = "w2hr_default", text = "Most of them are hungry, which is what I look for. A hero who is satisfied stops at the gates of Stratholme, and a hungry one walks through them. I keep their names in a book, and I watch which ones keep climbing." } },
      choices = {
        { text = "And what do you do with the names?", next = "w2heroes2" },
        { text = "Keeping a book of names sounds like a spy.", next = "w2heroes2" },
        { text = "Something else, Mokvar.", next = "BACK" },
      },
    },
    w2heroes2 = {
      lines = { { id = "w2hr2_default", text = "Nothing, yet. But one day the Warchief will need a hundred champions at once, and on that day I will be the orc who already knows where every one of them sleeps. That is not spying, {class}; it is preparation." } },
      choices = { { text = "Preparation, then.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "I am Mokvar, and I serve those who serve the Horde best. There are heroes whose armor was won in Stratholme and Scholomance, and I know of a way to make it stronger still." } },
      again = { { id = "h_again", text = "What else? My proposition stands." } },
      choices = {
        { text = "What's this proposition?", next = "proposition" },
        { text = "Who do you work for?", next = "who" },
        { text = "I'm ready for your proposition.", next = "BUSINESS", when = { minLevel = 58 } },
        { text = "What does Grommash Hold mean to you?", next = "hold" },
        { text = "I'm a shaman. Is there armor for me?", next = "shaman", when = { class = "SHAMAN" } },
        { text = "How did you come to this work?", next = "y_how" },
        { text = "What do you gain from this?", next = "y_gain" },
        { text = "Tell me about Anthion Harmon.", next = "y_harmon" },
        { text = "What do you make of the heroes who come to you?", next = "w2heroes" },
        { text = "Farewell.", next = "END" },
      },
    },
    proposition = {
      lines = { { id = "p_default", text = "There is a ghost at the gates of Stratholme, a man named Anthion Harmon, who knows how to reforge the armor of heroes. I will send you to him, if you have the gold and the courage." } },
      choices = {
        { text = "A ghost? Can he be trusted?", next = "ghost" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ghost = {
      lines = { { id = "g2_default", text = "He was human, and an ally of no one, and he has nothing left to lose. That makes him more trustworthy than most living men I know." } },
      choices = {
        { text = "I'll take the risk. Power is power.", next = "BACK", reply = "That is the right answer, and the hard road starts there.", fx = { align = { light = -1 } } },
        { text = "Dealing with the dead feels wrong.", next = "BACK", reply = "We are allied with the Forsaken, {class}. The line has already been crossed.", fx = { align = { light = 1 } } },
      },
    },
    who = {
      lines = { { id = "w_default", text = "For the Warchief, and for myself, and for any hero with ambition. Grommash Hold is full of warriors, and some of them need more than a sword." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hold = {
      lines = { { id = "ho_default", text = "It bears Grom Hellscream's name, and every hero who walks under its roof walks in his shadow. I am no warrior, but I can help those who are rise as high as he did." } },
      choices = {
        { text = "Did you know Grom?", next = "grom" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grom = {
      lines = { { id = "gm_default", text = "I saw him once, before Hyjal, when he passed through the camps shouting that the Horde would rise again. He was terrible and glorious, and I have not stopped measuring heroes against him since." } },
      choices = {
        { text = "Grom's courage is the measure of a hero.", next = "BACK", reply = "Then may you measure up, {class}.", fx = { align = { honor = 1 } } },
        { text = "Grom's rage nearly doomed us all.", next = "BACK", reply = "It did, and he paid for it. Do not forget the paying.", fx = { align = { honor = -1 } } },
      },
    },
    shaman = {
      lines = { { id = "sh_default", text = "There is, the mail of the Ten Storms, which the old shamans wore against the dark. Harmon knows how to make it greater still, if you are willing to bleed for it." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_how = {
      lines = {
        { id = "y_how_d", text = "I was a quartermaster in the camps, keeping count of the scraps the humans gave us. When Thrall broke the camps, I kept counting, and now I count the deeds of heroes instead of crusts of bread." },
        { id = "y_how_orc", when = { race = "Orc" }, text = "You know the camps. I was the orc who counted the crusts the guards threw us. When Thrall freed us, I kept counting, only now I count the deeds of heroes." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_gain = {
      lines = { { id = "y_gain_d", text = "Standing. Every hero who walks out of Stratholme in Harmon's armor remembers who sent them. One day the Warchief will need someone who knows every champion's name and debt, and I will be there." } },
      choices = {
        { text = "That sounds like plotting.", next = "y_plot" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_plot = {
      lines = { { id = "y_plot_d", text = "It is planning, {class}. The Horde was nearly destroyed by orcs who plotted with demons. I plot with heroes. Is ambition dangerous to the Horde, or does the Horde need it?" } },
      choices = {
        { text = "The Horde needs ambitious orcs.", next = "BACK", reply = "Then you and I will get along, {class}. Grommash Hold was built by orcs who wanted more.", fx = { align = { order = -1 } } },
        { text = "Ambition nearly destroyed us once.", next = "BACK", reply = "True. I watch my own as closely as I watch yours.", fx = { align = { order = 1 } } },
      },
    },
    y_harmon = {
      lines = { { id = "y_harmon_d", text = "Anthion Harmon waits by Stratholme's gate, looking for his wife. Help him and he will help you. That is the only bargain the dead ever really make." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    stratholme = { { id = "y_tp_strat", text = "Stratholme is a tomb with walls. Heroes go in and armor comes out, if the heroes come out at all." } },
    grommash_hold = { { id = "y_tp_gh", text = "Grommash Hold is the Warchief's seat. I keep my corner of it quiet and useful." } },
    thrall = { { id = "y_tp_thrall", text = "The Warchief freed us from the camps. I count that as the first debt any orc owes him." } },
    internment = { { id = "y_tp_camps", text = "I counted crusts in the camps. I do not waste a single one now." } },
    _none = { { id = "tp_none", text = "That is not my business, {class}, and I am particular about my business." } },
  },
}

-- Great-father Winter: an orc actor hired by Smokywood Pastures for the Feast of Winter Veil.
P:NPC {
  key = "og_greatfather_winter", id = TODO_NPC("Great-father Winter"), name = "Great-father Winter", gender = "male",
  role = "holiday", tier = "quest",
  communities = { "orgrimmar" }, temper = { "jolly", "theatrical" }, values = { "generosity" },
  notices = { "race" },
  impression = {
    first = "Great-father Winter sits outside Grommash Hold in a great red coat and a white beard that does not quite hide his tusks, booming greetings at everyone in sight.",
    third = "{name} met Great-father Winter, who brings the Feast of Winter Veil to Orgrimmar.",
  },
  greetings = {
    { id = "g_default", text = "Ho ho! Greetings of the season, {class}! Have you been a good member of the Horde this year?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Great-father Winter, and I bring cheer and gifts to all of Orgrimmar for the Feast of Winter Veil. Smokywood Pastures has been kind enough to help me with the gifts, of course." } },
      again = { { id = "h_again", text = "More to say? Speak up, little one!" } },
      choices = {
        { text = "Aren't you just an orc in a beard?", next = "actor" },
        { text = "What is Winter Veil?", next = "veil" },
        { text = "Do you have a gift for me?", next = "BUSINESS" },
        { text = "Where do all the gifts come from?", next = "gifts" },
        { text = "Orcs had no feasts in the camps.", next = "camps", when = { race = "Orc" } },
        { text = "My people mark the winter differently.", next = "tauren", when = { race = "Tauren" } },
        { text = "Who are you under the beard?", next = "y_who" },
        { text = "What do the children ask you for?", next = "y_kids" },
        { text = "Will I get coal this year?", next = "y_coal" },
        { text = "Happy Winter Veil.", next = "END" },
      },
    },
    actor = {
      lines = { { id = "a_default", text = "Hush, not so loud! There are children about, and they believe in Great-father Winter. Smokywood Pastures pays me well, and I would like to keep the job." } },
      choices = {
        { text = "Your secret is safe.", next = "BACK", reply = "Good, good. You will get a fine gift for that.", fx = { align = { light = 1 } } },
        { text = "The children should know the truth.", next = "BACK", reply = "Bah! They will learn the truth soon enough without your help.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    veil = {
      lines = { { id = "v_default", text = "A festival of the deepest winter, when friends exchange gifts and eat too much. The dwarves started it, I am told, but the Horde has taken to it well." } },
      choices = {
        { text = "The dwarves? Why do we celebrate it?", next = "dwarves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarves = {
      lines = { { id = "d_default", text = "Because gifts and feasting are good no matter who thought of them first, and because Smokywood Pastures sells to both sides. Do not tell the grunts that, though." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gifts = {
      lines = { { id = "gf_default", text = "Ho ho! From my workshop at the top of the world, little one, and from the Smokywood stalls by the wagonload. The children like the first answer and the goblins prefer the second." } },
      choices = {
        { text = "Who pays for them all?", next = "pays" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pays = {
      lines = { { id = "pa_default", text = "Smokywood Pastures, who make it all back on fruitcake and wrapping paper and then some. Still, a gift is a gift, whoever's ledger it came out of." } },
      choices = {
        { text = "Generosity is never wasted.", next = "BACK", reply = "Ho ho! That is the spirit of the season!", fx = { align = { light = 1 } } },
        { text = "It's just goblin business in a red coat.", next = "BACK", reply = "Shh! You will get coal for that, mark my words.", fx = { align = { light = -1 } } },
      },
    },
    camps = {
      lines = { { id = "cp_default", text = "No, we did not, and that is exactly why I put on this beard. Every orc child in this city deserves the winter feast I never had, and I will boom and laugh until my voice gives out." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = { { id = "tr_default", text = "Then mark it your way and mine both, friend, for the Earth Mother will not mind an extra feast. Sing your winter songs and eat my gingerbread, and nobody will be the poorer for it." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_who = {
      lines = {
        { id = "y_who_d", text = "Ho ho, a bold question! Between you and me, I keep wolves for the Frostwolf clan's trade in the rest of the year. Smokywood found me because I have the loudest laugh in the Drag." },
        { id = "y_who_orc", when = { race = "Orc" }, text = "Ho ho, between orcs, then. The rest of the year I keep wolves in the Drag, and Smokywood found me because I have the loudest laugh in the city. Tell no children." },
      },
      choices = {
        { text = "Do you enjoy it?", next = "y_enjoy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_enjoy = {
      lines = { { id = "y_enjoy_d", text = "More than anything I have done since the camps, little one. A child's face when the gift comes out of the sack is worth more than all of Smokywood's gold, though I do take the gold as well." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_kids = {
      lines = { { id = "y_kids_d", text = "Wooden axes, mostly, and toy wolves, and once a little girl from the orphanage asked me to bring her father home from Hyjal. I had nothing in my sack for that, little one." } },
      choices = {
        { text = "What did you tell her?", next = "y_told" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_told = {
      lines = { { id = "y_told_d", text = "I told her that her father had already sent her a gift, and I gave her my best wooden axe and said it was from him. Was that a kindness or a lie, do you think?" } },
      choices = {
        { text = "A kindness. She needed hope.", next = "BACK", reply = "Ho ho. Then I will sleep well tonight, and so, I hope, will she.", fx = { align = { light = 1 } } },
        { text = "A lie. Children deserve the truth.", next = "BACK", reply = "Perhaps. But the truth was not mine to give her on Winter Veil.", fx = { align = { light = -1 } } },
      },
    },
    y_coal = {
      lines = { { id = "y_coal_d", text = "Coal is for the wicked, little one, and for the smiths in the Drag, who are always grateful for it. Mind your manners and you will have nothing to fear from my sack." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    smokywood = { { id = "y_tp_smoky", text = "Smokywood Pastures pays my wages and fills my sack. Ho ho, I will say no more than that!" } },
    winter_veil = { { id = "y_tp_veil", text = "The Feast of Winter Veil is the best night of the year, little one. Even the grunts at the gate smile." } },
    orphanage = { { id = "y_tp_orph", text = "The orphanage gets the first sack every year, little one. Matron Battlewail makes sure of it." } },
    _none = { { id = "tp_none", text = "Ho ho! That is not the sort of thing Great-father Winter knows about." } },
  },
}

-- Kaymard Copperpinch: Smokywood Pastures goblin selling Winter Veil goods.
P:NPC {
  key = "og_kaymard_copperpinch", id = TODO_NPC("Kaymard Copperpinch"), name = "Kaymard Copperpinch", gender = "male",
  role = "vendor", tier = "quest",
  communities = { "orgrimmar" }, temper = { "pushy", "cheerful" }, values = { "profit" },
  notices = { "purse" },
  impression = {
    first = "Kaymard Copperpinch stands behind a stall heaped with Smokywood Pastures wares, a goblin in a red scarf who smiles like a man counting coins in his head.",
    third = "{name} met Kaymard Copperpinch, a Smokywood Pastures goblin selling Winter Veil goods.",
  },
  greetings = {
    { id = "g_default", text = "Happy Winter Veil, friend! Smokywood Pastures has the finest goods for the season, and I have the finest prices." },
  },
  start = "hello",
  nodes = {
    w2pricey = {
      lines = { { id = "w2pr_default", text = "You'd never guess, pal: the big warlords from Grommash Hold. They come down here grumbling about goblin nonsense, and then they buy the gilded snowglobe with the little Orgrimmar inside it, the one that costs a month's pay." } },
      choices = {
        { text = "Who do they buy it for?", next = "w2pricey2" },
        { text = "A snowglobe for a warlord? Unlikely.", next = "w2pricey2" },
        { text = "Something else, Kaymard.", next = "BACK" },
      },
    },
    w2pricey2 = {
      lines = { { id = "w2pr2_default", text = "Their mothers, every time, and they make me wrap it so nobody can see. Gold says one thing and a sad face says another, pal, but I've never met an orc who could resist a gift for his mother." } },
      choices = { { text = "That's sweet, actually.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "Kaymard Copperpinch, at your service! I handle the fancy goods for Smokywood Pastures, while my cousin Penney handles the cheap stuff, and between us we sell Winter Veil to the whole Horde." } },
      again = { { id = "h_again", text = "Anything else, pal? Fancy goods don't sell themselves, and Penney's stall is stealin' my foot traffic as we speak." } },
      choices = {
        { text = "What do you sell?", next = "BUSINESS" },
        { text = "What's Smokywood Pastures?", next = "smokywood" },
        { text = "I heard someone is stealing Winter Veil.", next = "stolen" },
        { text = "How's business this year?", next = "biz" },
        { text = "I could acquire some goods for you, quietly.", next = "rogue", when = { class = "ROGUE" } },
        { text = "How did you get into the holiday trade?", next = "y_how" },
        { text = "What's the worst season you've had?", next = "y_worst" },
        { text = "I'm a goblin too. What's the real margin?", next = "y_gob", when = { race = "Goblin" } },
        { text = "Who buys your most expensive gifts?", next = "w2pricey" },
        { text = "Not interested.", next = "END" },
      },
    },
    smokywood = {
      lines = { { id = "s_default", text = "The biggest holiday outfit in Azeroth, friend! We sell gifts, treats and cheer to Horde and Alliance alike, and we hire Great-father Winter to make it all official." } },
      choices = {
        { text = "You sell to the Alliance too?", next = "alliance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alliance = {
      lines = { { id = "a_default", text = "Of course! Gold doesn't care who spends it. There's a Smokywood stall in Ironforge too, run by my other cousin." } },
      choices = {
        { text = "That's just smart business.", next = "BACK", reply = "See? You've got a head for numbers, pal. The Cartel could use you.", fx = { align = { honor = -1 } } },
        { text = "Selling to our enemies is treachery.", next = "BACK", reply = "Treachery? It's commerce, friend!", fx = { align = { honor = 1 } } },
      },
    },
    stolen = {
      lines = { { id = "st_default", text = "Ugh, don't remind me. Some green thief keeps sneakin' off with the holiday treats, and Smokywood would be very grateful if somebody did somethin' about it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    biz = {
      lines = { { id = "bz_default", text = "Business is booming, pal, booming! The orcs took to Winter Veil like a kobold to candles, and every grunt with a sweetheart needs a gift, so my margins are lookin' festive." } },
      choices = {
        { text = "Penney says she outsells you.", next = "penney" },
        { text = "Something else.", next = "BACK" },
      },
    },
    penney = {
      lines = { { id = "pn_default", text = "Penney sells more units, sure, but I sell more gold, and gold's the only figure the trade princes read. Cheap moves fast, but quality moves up, ya see." } },
      choices = {
        { text = "Quality is worth paying for.", next = "BACK", reply = "A customer of taste! I'll remember you, friend.", fx = { align = { order = 1 } } },
        { text = "Penney's right. Cheap and fast wins.", next = "BACK", reply = "Ugh, don't you start too, she's insufferable enough.", fx = { align = { order = -1 } } },
      },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Whoa, whoa, keep your voice down, pal! Smokywood runs a clean ledger, at least where the guards can see it, so let's call that conversation a hypothetical." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_how = {
      lines = {
        { id = "y_how_d", text = "My uncle sold fruitcake out of a barrel in Booty Bay, pal, and nobody ever bought it. I took over the barrel, put a ribbon on it, called it seasonal, and sold the lot in a week." },
        { id = "y_how_orc", when = { race = "Orc" }, text = "My uncle sold fruitcake from a barrel in Booty Bay, and nobody bought it. I put a ribbon on it and called it seasonal, and orcs like you bought the lot in a week. No offence, pal." },
      },
      choices = {
        { text = "That's just tricking people.", next = "y_trick" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_trick = {
      lines = { { id = "y_trick_d", text = "Trickin'? Pal, it was the same fruitcake, and folk were happier eatin' it with a ribbon on. Is it trickery if the customer smiles?" } },
      choices = {
        { text = "Yes. Honesty matters more than smiles.", next = "BACK", reply = "Spoken like someone who's never had to sell fruitcake.", fx = { align = { honor = 1 } } },
        { text = "No. A happy customer is fair trade.", next = "BACK", reply = "Exactly! You'd make a fine Smokywood rep.", fx = { align = { honor = -1 } } },
      },
    },
    y_worst = {
      lines = { { id = "y_worst_d", text = "Two years back a crate of snowballs melted on the zeppelin from Grom'gol. I arrived with forty gallons of water and a very angry trade prince's letter. I still have the letter, framed, as a warnin'." } },
      choices = {
        { text = "Who was the letter from?", next = "y_letter" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_letter = {
      lines = { { id = "y_letter_d", text = "A Smokywood manager, pal, whose name I won't say in case he's listenin'. It said one more melted season and I'd be sellin' snowballs in Tanaris. That's a goblin joke, and it isn't funny." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_gob = {
      lines = { { id = "y_gob_d", text = "Between us? Three hundred percent on the fruitcake, and the ribbons cost more than the cake. Don't tell Penney, she thinks she's the clever one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    penney = { { id = "y_tp_penney", text = "Penney's my cousin. She's clever, I'll grant her that, but she's got no feel for a ribbon." } },
    winter_veil = { { id = "y_tp_veil", text = "Winter Veil's the best time of year, pal, and the most profitable. That's the same thing, really." } },
    booty_bay = { { id = "y_tp_bb", text = "Booty Bay's where the Copperpinch family started, pal. We left, but we still send money home, when we feel like it." } },
    greatfather_winter = { { id = "y_tp_gw", text = "Great-father Winter's on the Smokywood payroll, pal, but you didn't hear that from me." } },
    _none = { { id = "tp_none", text = "No idea, pal, but I've got a nice fruitcake if you're interested." } },
  },
}

-- Penney Copperpinch: Smokywood Pastures goblin selling cheaper Winter Veil goods.
P:NPC {
  key = "og_penney_copperpinch", id = TODO_NPC("Penney Copperpinch"), name = "Penney Copperpinch", gender = "female",
  role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "bright", "pushy" }, values = { "profit" },
  impression = {
    first = "Penney Copperpinch runs the cheaper Smokywood stall, all ribbons and candy canes, and she talks twice as fast as her cousin Kaymard.",
    third = "{name} met Penney Copperpinch, who sells Smokywood Pastures' budget Winter Veil goods.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Hey there, sweetheart! Winter Veil treats for my favorite customer, and cheap!" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Hey there. Winter Veil treats at Winter Veil prices. Holiday markup, for you." },
    { id = "g_default", text = "Hey there, sweetheart! Winter Veil treats at Winter Veil prices, and that's a bargain, believe me." },
  },
  start = "hello",
  nodes = {
    w2odd = {
      lines = { { id = "w2od_default", text = "A tauren who wanted a Winter Veil gift for his kodo, sweetheart! I sold him a red ribbon and a bag of candied apples, and he tied the ribbon round the beast's horn right there in the street." } },
      choices = {
        { text = "Did the kodo like it?", next = "w2odd2" },
        { text = "A gift for a kodo seems a waste.", next = "w2odd2" },
        { text = "Something else, Penney.", next = "BACK" },
      },
    },
    w2odd2 = {
      lines = { { id = "w2od2_default", text = "It ate the apples and the bag and then the ribbon, sweetheart, so I'd say yes. Now I keep a kodo bundle on the shelf every year, and Kaymard's furious he didn't think of it." } },
      choices = { { text = "Good business.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "Penney Copperpinch, Smokywood Pastures, best deals in Orgrimmar! My cousin Kaymard sells the fancy stuff, but I sell what folks actually buy." } },
      again = { { id = "h_again", text = "What else, sweetheart?" } },
      choices = {
        { text = "What do you have?", next = "BUSINESS" },
        { text = "Do you and Kaymard get along?", next = "kaymard" },
        { text = "How did you get into this trade?", next = "trade" },
        { text = "Who buys Winter Veil treats in Orgrimmar?", next = "xbuyers" },
        { text = "Is the holiday the same for the Horde?", next = "xsame" },
        { text = "A goblin selling to the Horde. Business good?", when = { race = "Orc" }, next = "xbiz" },
        { text = "What do you do when it's not Winter Veil?", next = "y_off" },
        { text = "Any secrets about Smokywood?", next = "y_secret" },
        { text = "Do you have family in Booty Bay?", next = "y_booty" },
        { text = "What's the strangest request you've had?", next = "w2odd" },
        { text = "Bye, Penney.", next = "END" },
      },
    },
    kaymard = {
      lines = { { id = "k_default", text = "Sure, so long as I sell more than he does, which I do every year. He thinks fancy sells, but I know cheap sells faster." } },
      choices = {
        { text = "Quality always wins in the end.", next = "BACK", reply = "Tell that to my ledger, sweetheart.", fx = { align = { order = 1 } } },
        { text = "Cheap and quick is the goblin way.", next = "BACK", reply = "You get it! Kaymard never does.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade = {
      lines = { { id = "td_default", text = "My mother ran a candy cart in Booty Bay, and I was haggling with pirates before I could see over the counter. Smokywood hired me the year I sold a whole crate of stale fruitcake to a Bloodsail quartermaster." } },
      choices = {
        { text = "Stale fruitcake? To pirates?", next = "pirates" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pirates = {
      lines = { { id = "pi_default", text = "Pirates'll eat anything, sweetheart, and they paid in good coin, which is more than I can say for some customers. Never ask where the coin came from, that's the first rule of the trade." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xbuyers = {
      lines = {
        { id = "xbuyers_default", text = "Grunts, sweetheart, more than you'd think. The biggest orc at the gate bought six candy canes yesterday and told me they were for his nephew, and he hasn't got a nephew, I asked around." },
      },
      choices = {
        { text = "Your secret's safe, and his.", next = "BACK", reply = "Course it is, sweetheart. Discretion's included in the price.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsame = {
      lines = {
        { id = "xsame_default", text = "Same snow, same songs, different accent. The orcs sing louder and the trolls dance more, and nobody throws snowballs at the Forsaken twice, I can tell you that much." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xbiz = {
      lines = {
        { id = "xbiz_default", text = "Good as it gets, pal, and orcs pay in solid coin, no haggling. A goblin could get used to customers who just hand over the gold and grunt." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_off = {
      lines = {
        { id = "y_off_d", text = "Hallow's End candy, Lunar Festival fireworks, Love is in the Air perfume, sweetheart. There's always a holiday somewhere, and a goblin who waits for one is a goblin who starves." },
        { id = "y_off_gob", when = { race = "Goblin" }, text = "You know how it is, sweetheart. Candy, then fireworks, then perfume, then candy again. A goblin who waits for a holiday is a goblin who starves." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_secret = {
      lines = { { id = "y_secret_d", text = "Between you and me, sweetheart, somebody's been stealin' from the Smokywood stores all season, and the managers think it's an inside job. I think it's that green fella in the hills, but nobody listens to the cheap stall." } },
      choices = {
        { text = "Could it be Kaymard?", next = "y_kay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_kay = {
      lines = { { id = "y_kay_d", text = "Kaymard? He's a show-off, not a thief, sweetheart. Though if I told the managers he was, I'd get his stall. Should I?" } },
      choices = {
        { text = "No. Lying about family is low.", next = "BACK", reply = "Fine, fine. You're no fun, but you're right.", fx = { align = { honor = 1 } } },
        { text = "Business is business. Take the stall.", next = "BACK", reply = "Ooh, tempting. Don't tell him I was thinkin' about it.", fx = { align = { honor = -1 } } },
      },
    },
    y_booty = {
      lines = { { id = "y_booty_d", text = "My mother still runs her cart on the docks in Booty Bay. I send her a crate every year, and she sends back a list of everything I priced wrong." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    steamwheedle = { { id = "tp_x_steamwheedle", text = "Smokywood's a Steamwheedle outfit, sweetheart, so we sell to everybody and nobody gets cross. Mostly." } },
    kaymard = { { id = "y_tp_kay", text = "Kaymard's my cousin and my rival. Mostly my rival, sweetheart." } },
    booty_bay = { { id = "y_tp_bb", text = "Booty Bay's where I learned to haggle. Pirates are tough customers, but fair, when they're sober." } },
    winter_veil = { { id = "y_tp_veil", text = "Winter Veil pays my rent for half the year, sweetheart. I love it more than I love Kaymard." } },
    steamwheedle_cartel = { { id = "y_tp_swc", text = "The cartel takes its cut, sweetheart, and so do I. That's how a fair market works." } },
    _none = { { id = "tp_none", text = "Don't know, don't care, but have you seen my candy canes?" } },
  },
}

-- Rachelle Gothena: Forsaken selling Hallow's End treats in the Valley of Strength.
P:NPC {
  key = "og_rachelle_gothena", id = TODO_NPC("Rachelle Gothena"), name = "Rachelle Gothena", gender = "female",
  role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "dry", "playful" }, values = { "remembrance" },
  impression = {
    first = "Rachelle Gothena stands in the Valley of Strength with a tray of Hallow's End sweets and a smile that would be pleasant if half of it were not bone.",
    third = "{name} met Rachelle Gothena, a Forsaken who sells Hallow's End treats in Orgrimmar.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Happy Hallow's End, friend. For you, a treat, and no trick at all." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Happy Hallow's End, {class}. Would you care for a treat? Or perhaps a trick?" },
    { id = "g_default", text = "Happy Hallow's End, {class}. Would you care for a treat, or would you prefer a trick?" },
  },
  start = "hello",
  nodes = {
    w2treats = {
      lines = { { id = "w2tt_default", text = "Sugar, flour, a little cinnamon from the goblins, and the recipe from my old bakery in Brill, my dear. I cannot taste them anymore, so I make them by memory and watch the faces of those who eat them." } },
      choices = {
        { text = "How do you know they're good?", next = "w2treats2" },
        { text = "Treats from the dead feel risky.", next = "w2treats2" },
        { text = "Something else, Rachelle.", next = "BACK" },
      },
    },
    w2treats2 = {
      lines = {
        { id = "w2tt2_scourge", when = { race = "Scourge" }, text = "The same way you know a joke has landed, dear, by the faces. We cannot taste, but we can watch, and I have watched an orc grunt close his eyes over my honey cake. That is enough to bake for." },
        { id = "w2tt2_default", text = "By the faces, dear. I watched an orc grunt close his eyes over my honey cake last year, and a dead woman can live on that sort of thing for a good long while." },
      },
      choices = { { text = "I'll take one, then.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "I am Rachelle, and I bring the Forsaken's own holiday to the orcs. Hallow's End is the day we celebrate our freedom from the Lich King, and the candy is a lovely bonus." } },
      again = { { id = "h_again", text = "Something else, my dear? Do take a treat while you think; I baked them myself, mostly." } },
      choices = {
        { text = "What is Hallow's End?", next = "hallow" },
        { text = "Show me your treats.", next = "BUSINESS" },
        { text = "What were you in life?", next = "life" },
        { text = "What do the orcs make of Hallow's End?", next = "xorcs" },
        { text = "Who is the Headless Horseman?", next = "xhorse" },
        { text = "We Forsaken have earned this feast.", when = { race = "Scourge" }, next = "xkin" },
        { text = "What happened to your husband?", next = "y_husband" },
        { text = "Does anyone disapprove of Hallow's End?", next = "y_dis" },
        { text = "What's really in your treats?", next = "w2treats" },
        { text = "Goodbye.", next = "END" },
      },
    },
    hallow = {
      lines = { { id = "h2_default", text = "It is the day the Forsaken broke free of the Scourge, and we celebrate it with masks, sweets and the burning of a wicker man. The living find it a little unsettling, which is half the fun." } },
      choices = {
        { text = "Freedom is worth celebrating.", next = "BACK", reply = "It is, and I celebrate it every day I wake.", fx = { align = { order = -1 } } },
        { text = "Burning effigies sounds dangerous.", next = "BACK", reply = "Only for the wicker man, dear.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    life = {
      lines = { { id = "lf_default", text = "A baker's wife in Brill, if you can believe it, and I made the best sweet buns in Tirisfal. The plague took the bakery and the baker, but it left me the recipes." } },
      choices = {
        { text = "Do you miss that life?", next = "miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    miss = {
      lines = { { id = "ms_default", text = "I miss the smell of the ovens, dear, though I can barely smell anything now. Making sweets for the living is the closest I come to it, and I find I do not mind that as much as I ought to." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xorcs = {
      lines = {
        { id = "xorcs_default", text = "They are learning, dear. They like the bonfires and the candy and the frightening masks, and they are less sure about why the dead are so cheerful, which is half the fun for me." },
      },
      choices = {
        { text = "Do you think they'll ever trust the Forsaken?", next = "xtrust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtrust = {
      lines = {
        { id = "xtrust_default", text = "Trust is a large word for a festival, dear. They share their city and their wars with us, and tonight they share our candy, and I find that a start." },
      },
      choices = {
        { text = "The Horde should embrace all its people.", next = "BACK", reply = "How very warm of you, dear. I shall try to remember warm.", fx = { align = { light = 1 } } },
        { text = "Trust must be earned. The Forsaken haven't yet.", next = "BACK", reply = "Then we shall keep earning it, dear, one sweet at a time.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhorse = {
      lines = {
        { id = "xhorse_default", text = "A tale from the old human villages of Lordaeron, a headless rider who comes at the end of harvest. In life I told it to children to frighten them, and now I am rather more frightening than he is." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xkin = {
      lines = {
        { id = "xkin_default", text = "We have, dear, every last one of us who clawed out of a grave and chose to think for ourselves. Take a sweet, and let the orcs wonder why we are smiling." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_husband = {
      lines = {
        { id = "y_husband_d", text = "He rose too, dear, but for the Scourge. I saw him once, after, shambling through the fields near Brill. I did not stop him, and I did not follow him. I made buns the next day, as usual." },
        { id = "y_husband_sc", when = { race = "Scourge" }, text = "He rose for the Scourge, dear, as some of ours did. You will know that feeling, I think, of seeing a face you loved with nothing behind it. I made buns the next day." },
      },
      choices = {
        { text = "Should you have put him to rest?", next = "y_rest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_rest = {
      lines = { { id = "y_rest_d", text = "The Deathguard would say so. A mercy, they call it. I could not lift the blade, dear. Was that weakness, or was it love?" } },
      choices = {
        { text = "Love. Some things can't be asked of us.", next = "BACK", reply = "How kind. I shall remember you said that.", fx = { align = { light = 1 } } },
        { text = "Weakness. He deserved release.", next = "BACK", reply = "Perhaps. The Deathguard would agree with you.", fx = { align = { light = -1 } } },
      },
    },
    y_dis = {
      lines = { { id = "y_dis_d", text = "The Scarlet Crusade, of course, who think we should all be ashes. And some of the shamans here, who say the dead should not dance. I tell them we have earned it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    forsaken = { { id = "tp_x_forsaken", text = "We are free, dear, and Hallow's End reminds us of the day we stopped taking orders from a crown of ice." } },
    brill = { { id = "y_tp_brill", text = "Brill was a cosy village with a good inn. Now it is a cosy village of the dead with a good inn." } },
    scarlet_crusade = { { id = "y_tp_sc", text = "The Scarlet Crusade would burn me at Hallow's End without the wicker man. Charming people." } },
    hallows_end = { { id = "y_tp_he", text = "Hallow's End is our day, dear. The day we remember that we chose ourselves." } },
    headless_horseman = { { id = "y_tp_hh", text = "Just a story to frighten children, dear. Mostly a story, anyway." } },
    _none = { { id = "tp_none", text = "I have no idea, dear, but I do have candy." } },
  },
}

-- Alowicious Czervik: goblin sweets seller outside the inn in the Valley of Strength.
P:NPC {
  key = "og_alowicious_czervik", id = TODO_NPC("Alowicious Czervik"), name = "Alowicious Czervik", gender = "male",
  role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "eager", "talkative" }, values = { "profit" },
  impression = {
    first = "Alowicious Czervik stands by a cart outside the inn, a goblin with sticky fingers and a tray of sweets he insists are the finest in Kalimdor.",
    third = "{name} met Alowicious Czervik, a goblin selling sweets in the Valley of Strength.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Hey, pal! You need somethin' sweet, and I got the sweetest for you!" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Hey, pal. You look like you need somethin' sweet. It'll cost ya." },
    { id = "g_default", text = "Hey, pal, you look like you need somethin' sweet! I got treats that'll make an ogre weep." },
  },
  start = "hello",
  nodes = {
    w2seller = {
      lines = { { id = "w2sl_default", text = "Ogre Weepers, pal! Black toffee so hard you suck on it for an hour, and so sweet it makes your eyes water. The grunts on the gate buy 'em by the bag for the long watch, and the dentists in Ratchet send me thank-you notes." } },
      choices = {
        { text = "Do ogres really weep at them?", next = "w2seller2" },
        { text = "Toffee that hard sounds dangerous.", next = "w2seller2" },
        { text = "Something else, Alowicious.", next = "BACK" },
      },
    },
    w2seller2 = {
      lines = { { id = "w2sl2_default", text = "Never met an ogre who'd try one, pal, but it's a great name, and that's half of candy. The other half is sugar, and the third half is standin' outside the inn when the grunts come out happy." } },
      choices = { { text = "That's three halves.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "Alowicious Czervik, purveyor of sweets and treats! Orcs got a sweet tooth under all that grumbling, and I'm here to feed it." } },
      again = { { id = "h_again", text = "Somethin' else, pal? The candy's not gettin' any fresher." } },
      choices = {
        { text = "Let me see your sweets.", next = "BUSINESS" },
        { text = "Orcs really buy candy?", next = "orcs" },
        { text = "Where do you get your sweets?", next = "source" },
        { text = "Why sell candy outside the inn?", next = "xinn" },
        { text = "Do trolls like sweets?", next = "xtrolls" },
        { text = "I'm a cook. What's your secret ingredient?", when = { profession = "Cooking" }, next = "xcook" },
        { text = "How'd a goblin end up selling in Orgrimmar?", next = "y_how" },
        { text = "Got any competition?", next = "y_rival" },
        { text = "What's your best-selling sweet?", next = "w2seller" },
        { text = "No thanks.", next = "END" },
      },
    },
    orcs = {
      lines = { { id = "o_default", text = "You'd be surprised! The grunts come off a shift and buy a whole bag, and then they glare at me like I'm gonna tell somebody. I never do, of course." } },
      choices = {
        { text = "Every warrior deserves a little sweetness.", next = "BACK", reply = "That's what I always say, pal!", fx = { align = { honor = -1 } } },
        { text = "A grunt should be eating meat, not candy.", next = "BACK", reply = "Hey, meat's fine, but it don't come in a pretty wrapper.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    source = {
      lines = { { id = "so_default", text = "Half from a baker in Ratchet and half from my own kitchen, which used to be a still, so don't ask what's in the toffee. The margins on toffee are beautiful, pal, absolutely beautiful." } },
      choices = {
        { text = "Is the toffee safe to eat?", next = "safe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe = {
      lines = { { id = "sa_default", text = "Safe as anything in Orgrimmar, which is to say mostly! Nobody's complained yet, and a couple of grunts swear it's the only thing that gets 'em through a night watch." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xinn = {
      lines = {
        { id = "xinn_default", text = "Location, pal! A grunt walks out of the inn after three grogs, and suddenly he's real interested in candy. That's just good business sense, and I didn't even have to pay a consultant." },
      },
      choices = {
        { text = "Selling to drunks seems a bit low.", next = "xlow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlow = {
      lines = {
        { id = "xlow_default", text = "Low? Pal, I'm a goblin, low's where the margins are. Nobody's forcin' anybody, and the sugar sobers 'em up, so I'm practically a public service." },
      },
      choices = {
        { text = "Business is business. No shame in it.", next = "BACK", reply = "See, you get it! I'll put you on the valued customer list.", fx = { align = { order = -1 } } },
        { text = "Somebody ought to put limits on that kind of trade.", next = "BACK", reply = "Somebody ought to, pal, but nobody here's volunteered.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtrolls = {
      lines = {
        { id = "xtrolls_default", text = "Trolls love 'em, pal, especially the sour ones. Some troll from the Echo Isles bought a whole sack and said it was for the spirits, and I don't ask what spirits do with taffy." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xcook = {
      lines = {
        { id = "xcook_default", text = "Secret ingredient? Sugar, pal, and then more sugar, and a little more sugar on top. Anybody who tells you different is sellin' somethin'." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_how = {
      lines = {
        { id = "y_how_d", text = "Took a zeppelin from Grom'gol with three crates of fudge and a big dream, pal. Two crates melted, one crate sold, and the dream's been payin' rent ever since." },
        { id = "y_how_gob", when = { race = "Goblin" }, text = "Same way you did, pal, by smellin' coin on the wind. The orcs had gold and no sweets, and I had sweets and no gold." },
      },
      choices = {
        { text = "Do the guards bother you?", next = "y_guards" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_guards = {
      lines = { { id = "y_guards_d", text = "Bother me? Pal, the guards are my best customers! I slip the night shift a free peppermint and they somehow never notice my cart sits a little too close to the inn door." } },
      choices = {
        { text = "Bribing the city watch is wrong.", next = "BACK", reply = "Bribe's an ugly word, pal. I call it customer appreciation.", fx = { align = { order = 1 } } },
        { text = "Smart. Everybody wins.", next = "BACK", reply = "Exactly! You got a goblin's head on those shoulders.", fx = { align = { order = -1 } } },
      },
    },
    y_rival = {
      lines = { { id = "y_rival_d", text = "There's a troll down by the Drag sellin' candied beetles, and I'll admit they're catchin' on. I don't sleep well, pal, not with beetles threatenin' my market share." } },
      choices = {
        { text = "Why not sell beetles yourself?", next = "y_beetles" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_beetles = {
      lines = {
        { id = "y_beetles_d", text = "Because I tried one, pal, and it tried me back. A goblin's got to have standards, even if they're low ones." },
        { id = "y_beetles_tr", when = { race = "Troll" }, text = "No offence to your people, pal, but I tried one and it was still wigglin'. A goblin's got to have standards, even if they're low ones." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    ratchet = { { id = "y_tp_ratchet", text = "Ratchet's where my baker lives, pal. Best ovens in the Barrens, and only one of 'em has exploded this year." } },
    grommgol = { { id = "y_tp_gg", text = "Grom'gol's a jungle camp with a zeppelin tower and too many tigers. I left there fast and I don't go back." } },
    booty_bay = { { id = "tp_x_booty_bay", text = "Best sugar in Kalimdor comes through Booty Bay, pal, though it's technically Stranglethorn. Don't ask how it gets here." } },
    _none = { { id = "tp_none", text = "No clue, pal, but have a lollipop." } },
  },
}

-- Kizzak Sparks: goblin fireworks vendor in the Drag.
P:NPC {
  key = "og_kizzak_sparks", id = TODO_NPC("Kizzak Sparks"), name = "Kizzak Sparks", gender = "male",
  role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "excitable", "reckless" }, values = { "profit", "craft" },
  impression = {
    first = "Kizzak Sparks has singed eyebrows, a crate of rockets and a grin that suggests he has never once regretted lighting a fuse.",
    third = "{name} met Kizzak Sparks, a goblin who sells fireworks in the Drag.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Fireworks, friend! The brightest ones, for you, at the best price!" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Fireworks. Bright, loud, dangerous. Don't light 'em near me." },
    { id = "g_default", text = "Fireworks, pal! Bright ones, loud ones, ones that only sometimes explode early!" },
  },
  start = "hello",
  nodes = {
    w2colour = {
      lines = { { id = "w2cl_default", text = "Blue, pal, every time! Red's easy, gold's easy, green just needs a little copper, but blue burns out before it gets high enough to see. I've been chasin' a proper blue rocket since before I lost my first eyebrow." } },
      choices = {
        { text = "Have you ever got close?", next = "w2colour2" },
        { text = "Nobody would notice a missing blue.", next = "w2colour2" },
        { text = "Something else, Kizzak.", next = "BACK" },
      },
    },
    w2colour2 = {
      lines = {
        { id = "w2cl2_eng", when = { profession = "Engineering" }, text = "Once, for about a heartbeat, over the Southfury, and then it went purple and set fire to a fishing boat. You build things, pal, so you know: the one that nearly works is the one that keeps you up at night." },
        { id = "w2cl2_default", text = "Once, for about a heartbeat, over the Southfury, and then it went purple and set fire to a fishing boat. I paid for the boat. I'd pay for ten more to see that blue again." },
      },
      choices = { { text = "I hope you find your blue.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "Kizzak Sparks, fireworks specialist and part-time eyebrow donor! When there's a holiday in Orgrimmar, I'm the one makin' the sky go boom." } },
      again = { { id = "h_again", text = "Still here? Careful, that crate's a little warm." } },
      choices = {
        { text = "Show me the fireworks.", next = "BUSINESS" },
        { text = "What happened to your eyebrows?", next = "eyebrows" },
        { text = "What's the biggest show you ever put on?", next = "show" },
        { text = "Who buys fireworks in a city of warriors?", next = "xbuyers" },
        { text = "Where do you make these?", next = "xwhere" },
        { text = "I'm an engineer. Let's talk powder.", when = { profession = "Engineering" }, next = "xeng" },
        { text = "Has a show ever gone really wrong?", next = "y_wrong" },
        { text = "Why fireworks, of all things?", next = "y_why" },
        { text = "Which colour is hardest to make in the sky?", next = "w2colour" },
        { text = "I'll keep my distance.", next = "END" },
      },
    },
    eyebrows = {
      lines = { { id = "e_default", text = "A little experiment with a double-stage rocket, nothin' serious. They grow back, mostly, and my cousin says I look more distinguished without 'em." } },
      choices = {
        { text = "Safety should come first, Kizzak.", next = "BACK", reply = "Safety? Pal, safety's never sold a single rocket.", fx = { align = { order = 1 } } },
        { text = "Some risks are worth a good show.", next = "BACK", reply = "A goblin after my own heart!", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    show = {
      lines = { { id = "sw_default", text = "The Lunar Festival two years back, when I lit three hundred rockets over the Valley of Strength at once. The sky went red and gold, the wyverns went somewhere else entirely, and I went deaf for a week." } },
      choices = {
        { text = "Did anyone get hurt?", next = "hurt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hurt = {
      lines = { { id = "ht_default", text = "Just one hut and a goblin, and the goblin was me, so it hardly counts. The hut belonged to a peon who said it was the best night of his life, so I figure we're square." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xbuyers = {
      lines = {
        { id = "xbuyers_default", text = "Everybody, pal! The orcs like 'em loud, the trolls like 'em pretty, and the tauren pretend they don't like 'em at all and then stand there with their mouths open." },
      },
      choices = {
        { text = "Do the guards mind?", next = "xguards" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xguards = {
      lines = {
        { id = "xguards_default", text = "They minded a lot after the rocket went through the inn's awning, but I paid for the awning, and the grunts got a good laugh. Now they mostly just stand a little further away." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xwhere = {
      lines = {
        { id = "xwhere_default", text = "Down in Ratchet, at my cousin's place, where nobody complains about the noise. We lost a shed last month, but the shed was insured, so really it was a profitable shed." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xeng = {
      lines = {
        { id = "xeng_default", text = "Now you're talkin'! Coarse powder for the lift, fine powder for the bang, and never, ever pack 'em in the same crate. My cousin learned that one the hard way, and he wasn't using his eyebrows anyway." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_wrong = {
      lines = { { id = "y_wrong_d", text = "Once, pal, and I don't joke about it. A rocket went sideways into the crowd in Ratchet and burned a little troll kid's arm. She's fine now, but I check every fuse three times since, and that's three times more than I used to." } },
      choices = {
        { text = "Maybe you should stop altogether.", next = "y_stop" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_stop = {
      lines = { { id = "y_stop_d", text = "Stop? And never see a sky full of colour again? I paid her family and I swore I'd do better. Is that enough, pal, or should a goblin know when to quit?" } },
      choices = {
        { text = "You made it right. Keep going.", next = "BACK", reply = "Thanks, pal. I needed somebody to say it.", fx = { align = { light = 1 } } },
        { text = "Some mistakes can't be paid off.", next = "BACK", reply = "Yeah. I think about that too, more than I let on.", fx = { align = { light = -1 } } },
      },
    },
    y_why = {
      lines = {
        { id = "y_why_d", text = "Because for one second, pal, everybody looks up at the same time, orc and troll and tauren and goblin alike. Nobody's fightin' while they're lookin' up. Then it's back to business." },
        { id = "y_why_ta", when = { race = "Tauren" }, text = "Because for one second everybody looks up, even you tauren pretendin' you don't care. Nobody's fightin' while they're lookin' up, pal." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    ratchet = { { id = "tp_x_ratchet", text = "Ratchet's home, pal. Best port on the coast, and the loudest, mostly because of me." } },
    lunar_festival = { { id = "y_tp_lunar", text = "The Lunar Festival's my biggest night, pal. The elders like it quiet, and I don't." } },
    steamwheedle = { { id = "y_tp_steam", text = "The Steamwheedle Cartel taxes everything, even gunpowder. Especially gunpowder." } },
    goblins = { { id = "y_tp_gob", text = "Goblins invented fireworks, pal, or at least we invented sellin' them, and that's the part that matters." } },
    darkspear = { { id = "y_tp_ds", text = "Trolls love my green rockets. The Darkspear say they scare off bad spirits, and I'm not gonna argue with a paying customer." } },
    _none = { { id = "tp_none", text = "Dunno, pal, but I bet it'd look great with fireworks." } },
  },
}

-- Ukra'nor: orc staff merchant at Skyfury Staves.
P:NPC {
  key = "og_ukranor", id = TODO_NPC("Ukra'nor"), name = "Ukra'nor", gender = "male",
  role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "proud", "gruff" }, values = { "craft" },
  notices = { "class" },
  impression = {
    first = "Ukra'nor stands among racks of carved staves in Skyfury Staves, an orc with a carver's knife on his belt and wood shavings in his beard.",
    third = "{name} met Ukra'nor, who sells staves at Skyfury Staves in Orgrimmar.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Welcome to Skyfury Staves, friend. For you, a staff worthy of the Horde." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Welcome to Skyfury Staves, {class}. Every staff here was made with care. Handle them carefully." },
    { id = "g_default", text = "Welcome to Skyfury Staves, {class}. Every staff here was carved by hands that know the wood." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" }, text = "A shaman. My staves carry the spirits well, if you treat them with respect." },
  },
  start = "hello",
  nodes = {
    w2long = {
      lines = { { id = "w2lg_default", text = "One for an old far seer, half a year in the making, from a single length of Mulgore ash. He wanted the spirits of all four elements carved along it, and he wanted each one to look as though it disagreed with the others." } },
      choices = {
        { text = "Did you manage it?", next = "w2long2" },
        { text = "Half a year for one staff seems slow.", next = "w2long2" },
        { text = "Something else, Ukra'nor.", next = "BACK" },
      },
    },
    w2long2 = {
      lines = {
        { id = "w2lg2_shaman", when = { class = "SHAMAN" }, text = "He said I did, shaman, and he would know better than I. The fire looks angry at the water and the earth looks tired of the wind, which is how he told me they behave. You may have noticed the same." },
        { id = "w2lg2_default", text = "He said I did. The fire looks angry at the water and the earth looks tired of the wind, which is how he told me the spirits behave, and I took him at his word." },
      },
      choices = { { text = "It sounds like a fine staff.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "I am Ukra'nor, and I sell staves to shamans, mages and anyone who would rather hit from a distance. The wood comes from Ashenvale and Mulgore, and I carve it myself." } },
      again = { { id = "h_again", text = "What else? A good staff waits for no one." } },
      choices = {
        { text = "Show me your staves.", next = "BUSINESS" },
        { text = "Where does the wood come from?", next = "wood" },
        { text = "How did you learn to carve?", next = "learn" },
        { text = "Can an orc be a mage?", next = "xmage" },
        { text = "What makes a staff good?", next = "xgood" },
        { text = "I'm a mage. What staff would you choose for me?", when = { class = "MAGE" }, next = "xmagestaff" },
        { text = "Do you carve anything besides staves?", next = "y_other" },
        { text = "Is the Ashenvale wood hard to come by?", next = "y_ashen" },
        { text = "Why call the shop Skyfury Staves?", next = "y_skyfury" },
        { text = "Which staff took you longest to carve?", next = "w2long" },
        { text = "Farewell.", next = "END" },
      },
    },
    wood = {
      lines = { { id = "w_default", text = "Mulgore's wood is strong but slow to carve, and Ashenvale's is fine and sings when the spirits pass through it. The elves do not like us taking it, of course." } },
      choices = {
        { text = "The Horde must take what it needs.", next = "BACK", reply = "That is how the Warsong see it, and their axes agree.", fx = { align = { honor = -1 } } },
        { text = "We should honor the elves' claim.", next = "BACK", reply = "A gentle thought, but my staves do not carve themselves.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    learn = {
      lines = { { id = "le_default", text = "From an old tauren carver who took pity on me in the Barrens, after the camps. He said my hands were made for breaking things and he would teach them to make something instead." } },
      choices = {
        { text = "Is he still carving?", next = "teacher" },
        { text = "Something else.", next = "BACK" },
      },
    },
    teacher = {
      lines = { { id = "te_default", text = "He went back to the earth three winters ago, and I carved his totem myself. Every staff I sell carries a little of what he taught me, so he is still working, in a way." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xmage_default", text = "A few, though most of our people still remember the warlocks and do not trust any magic but the shaman's. I sell to all who want a staff, and I do not ask what they put into it." },
      },
      choices = {
        { text = "Should the Horde allow any magic at all?", next = "xallow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xallow = {
      lines = {
        { id = "xallow_default", text = "That is a question for the Warchief, but I have my own thoughts. Magic brought us the demon blood, and yet the warlocks in the Cleft still swear it can serve the Horde." },
      },
      choices = {
        { text = "Only the shaman's way is safe for orcs.", next = "BACK", reply = "The old shamans would agree, and they are seldom wrong.", fx = { align = { order = 1 } } },
        { text = "Any power that serves the Horde should be used.", next = "BACK", reply = "So the warlocks say, and that is what worries me.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgood = {
      lines = {
        { id = "xgood_default", text = "Straight grain, no knots in the grip, and a head that balances the length. A staff should feel like an extension of your arm, not like a branch you picked up in the road." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xmagestaff = {
      lines = {
        { id = "xmagestaff_default", text = "Ashenvale oak, long and light, with a crystal set in the head if you can afford it. Mages swing a staff less and channel through it more, so the wood must be fine." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_other = {
      lines = {
        { id = "y_other_d", text = "Totems, for those who have lost someone. I carve them without pay. My teacher said a carver who charges for grief has forgotten why his hands work." },
        { id = "y_other_sh", when = { class = "SHAMAN" }, text = "Totems, shaman, for the grieving, and sometimes for your kind when an old one cracks. I carve them without pay. My teacher said a carver should never charge for grief." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_ashen = {
      lines = { { id = "y_ashen_d", text = "The Warsong bring it from Ashenvale, and the elves kill them for it. Every staff of Ashenvale oak in this shop cost someone blood, {class}. I try not to think about that." } },
      choices = {
        { text = "Then stop buying Ashenvale wood.", next = "y_stop" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_stop = {
      lines = { { id = "y_stop_d", text = "And sell only Mulgore wood, that cracks in the Durotar heat? The shamans want Ashenvale oak. Should a carver serve his customers, or his conscience?" } },
      choices = {
        { text = "His conscience. Use Mulgore wood.", next = "BACK", reply = "My teacher would have said the same. I will try.", fx = { align = { light = 1 } } },
        { text = "His customers. The Horde needs staves.", next = "BACK", reply = "That is what I tell myself each morning.", fx = { align = { light = -1 } } },
      },
    },
    y_skyfury = {
      lines = { { id = "y_skyfury_d", text = "Skyfury Staves is named for the storm that blew the day I opened. The roof leaked, the wind took my sign, and I sold three staves anyway. I took it as a good omen." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_x_advice", text = "Oil your staff every season, {class}. Wood dries in Durotar faster than anywhere I know." } },
    ashenvale = { { id = "y_tp_ashen", text = "Ashenvale is green and full of angry elves. The wood is worth it, or so the Warsong say." } },
    warsong = { { id = "y_tp_warsong", text = "The Warsong cut the trees and fight the elves. Grom's clan was always the boldest." } },
    _none = { { id = "tp_none", text = "I know wood and carving, {class}, and little else." } },
  },
}

-- Shim'la: Darkspear troll in the Valley of Honor.
P:NPC {
  key = "og_shimla", id = TODO_NPC("Shim'la"), name = "Shim'la", gender = "female",
  role = "townsfolk", tier = "service",
  communities = { "orgrimmar" }, temper = { "easy", "wry" }, values = { "loyal" },
  impression = {
    first = "Shim'la leans against a wall in the Valley of Honor, a Darkspear troll who watches the training yards with amused eyes.",
    third = "{name} met Shim'la, a Darkspear troll in the Valley of Honor.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Hey, friend! You come to train, or just to watch de orcs? Either way, sit with me." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Hey, mon. You come to train, or to watch? Either way, keep it quiet." },
    { id = "g_default", text = "Hey, mon. You come to train, or you come to watch de orcs sweat like I do?" },
  },
  start = "hello",
  nodes = {
    w2bet = {
      lines = { { id = "w2bt_default", text = "Every day, mon, wit' de off-duty grunts, a copper a bout. I always bet on de small ones, 'cause de orcs always bet on de big ones, an' de small ones win more dan you think." } },
      choices = {
        { text = "Are you winning overall?", next = "w2bet2" },
        { text = "Betting on the underdog is a fool's game.", next = "w2bet2" },
        { text = "Something else, Shim'la.", next = "BACK" },
      },
    },
    w2bet2 = {
      lines = {
        { id = "w2bt2_troll", when = { race = "Troll" }, text = "Ahead by forty coppers, cousin, an' de grunts can't work out how. You know how: de small ones dodge, like we Darkspear do, an' de big ones swing until dey get tired." },
        { id = "w2bt2_default", text = "Ahead by forty coppers, mon, an' de grunts can't work out how. De small ones dodge an' wait, an' de big ones swing until dey be tired, an' den it be over." },
      },
      choices = { { text = "I'll remember that.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "I be Shim'la of de Darkspear, and I like to watch de warriors train in dis valley. De orcs be fierce, but dey don't know how to have fun with it." } },
      again = { { id = "h_again", text = "Somethin' else, mon? Talk while we watch dat big one fall over, he does it every hour." } },
      choices = {
        { text = "Do trolls train differently?", next = "trolls" },
        { text = "Why are you in Orgrimmar?", next = "why" },
        { text = "Who's the best fighter in the valley?", next = "xbest" },
        { text = "Have you seen Vol'jin in the city?", next = "xvoljin" },
        { text = "Darkspear here too. What brings you to the city?", when = { race = "Troll" }, next = "xtroll" },
        { text = "Do you fight, Shim'la?", next = "y_fight" },
        { text = "What do you worry about?", next = "y_worry" },
        { text = "Do you like Orgrimmar?", next = "y_city" },
        { text = "Do you ever bet on the sparring?", next = "w2bet" },
        { text = "See you, Shim'la.", next = "END" },
      },
    },
    trolls = {
      lines = { { id = "t_default", text = "We dance, mon, we laugh, and den we kill. De orcs just grunt and swing, and dey think dat be de same thing." } },
      choices = {
        { text = "Discipline is better than dancing.", next = "BACK", reply = "Maybe, but de dancer lives longer, mon.", fx = { align = { order = 1 } } },
        { text = "A little joy makes a fighter better.", next = "BACK", reply = "You get it! Come dance with de Darkspear sometime.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because Sen'jin Village be small, and Orgrimmar be big and loud and full of trouble. A troll needs a little trouble, mon." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xbest = {
      lines = {
        { id = "xbest_default", text = "Today? Dat big orc with the scars on his back who never smile, mon. But yesterday it was a tauren girl who knock him flat, and he still not speak about it." },
      },
      choices = {
        { text = "Who trains them?", next = "xtrain" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtrain = {
      lines = {
        { id = "xtrain_default", text = "The warrior trainers in the valley, mon, Sorek and his kind. Dey shout a lot and dey make the young ones run around de valley until dey fall down." },
      },
      choices = {
        { text = "Hard training makes hard warriors.", next = "BACK", reply = "Ya, maybe, but it make tired ones too, mon.", fx = { align = { light = -1 } } },
        { text = "They should teach with patience, not shouting.", next = "BACK", reply = "You should tell dem, mon. Dey won't listen, but you should tell dem.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xvoljin = {
      lines = {
        { id = "xvoljin_default", text = "Sometimes, ya, he come to see the Warchief in Grommash Hold. Every troll stands a little taller when he walk by, and de orcs pretend not to notice." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xtroll = {
      lines = {
        { id = "xtroll_default", text = "Same thing as you, mon: Sen'jin be quiet and dis city be loud. We gotta show de orcs how de Darkspear do it, ya?" },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_fight = {
      lines = {
        { id = "y_fight_d", text = "Ya, mon, with two short axes, de way my mother taught me. I fought de murlocs on de Echo Isles when I was young, and I fought Zalazane's slaves when he went bad. Now I just watch." },
        { id = "y_fight_tr", when = { race = "Troll" }, text = "Ya, mon, same as you. Two axes, my mother's way. I fought Zalazane's slaves on de isles before I came here, and I still see their faces sometimes." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_worry = {
      lines = { { id = "y_worry_d", text = "Zalazane, mon. He still be on de Echo Isles with his mind-slaved trolls, and Vol'jin won't send de whole tribe to take dem back. Some say we should just go ourselves." } },
      choices = {
        { text = "Wait for Vol'jin. He knows best.", next = "y_wait" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_wait = {
      lines = { { id = "y_wait_d", text = "Dat be what de elders say, mon. But my cousin be one of de slaves. Should I wait for Vol'jin, or go now with my axes?" } },
      choices = {
        { text = "Wait. Going alone would waste your life.", next = "BACK", reply = "Ya, ya. Patience be a troll's hardest skill.", fx = { align = { order = 1 } } },
        { text = "Go. Your cousin can't wait.", next = "BACK", reply = "Dat be what my heart say too, mon.", fx = { align = { order = -1 } } },
      },
    },
    y_city = {
      lines = { { id = "y_city_d", text = "Orgrimmar be loud and red and too dry, mon. But de orcs here be good to de Darkspear, and dey don't forget we fought with dem. Dat be worth somethin'." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    darkspear = { { id = "tp_x_darkspear", text = "De Darkspear be small, mon, but we be clever. De orcs got size, we got sense." } },
    voljin = { { id = "tp_x_voljin", text = "Vol'jin be our chief, and he be wise. De loa speak to him, and he listen." } },
    zalazane = { { id = "y_tp_zal", text = "Zalazane be a witch doctor who went bad, mon. One day de Darkspear will take him down." } },
    echo_isles = { { id = "y_tp_ei", text = "De Echo Isles be home, mon. Just not right now." } },
    valley_of_honor = { { id = "y_tp_voh", text = "De Valley of Honor be where de orcs sweat, mon. Best show in de city, and it be free." } },
    _none = { { id = "tp_none", text = "I don't know dat one, mon. Ask a shaman." } },
  },
}

-- Doyo'da: jungle troll who drinks at the inn in the Valley of Strength.
P:NPC {
  key = "og_doyoda", id = TODO_NPC("Doyo'da"), name = "Doyo'da", gender = "male",
  role = "patron", tier = "service",
  communities = { "orgrimmar" }, temper = { "lazy", "friendly" }, values = { "comfort" },
  impression = {
    first = "Doyo'da sprawls on a bench at the inn with a mug in one hand, a troll who looks like he has not moved since the city was built.",
    third = "{name} met Doyo'da, a troll who drinks at the Valley of Strength inn.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Ey, friend! Sit, de drinks be cold and de stories be better with you here." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Ey, mon. Sit, if you want. De drinks be cold, and so be de company." },
    { id = "g_default", text = "Ey, mon. Sit down, de drinks be cold and de stories be warm." },
  },
  start = "hello",
  nodes = {
    w2mug = {
      lines = { { id = "w2mg_default", text = "Cactus wine from Sen'jin, mon, sour as a witch doctor an' twice as strong. De innkeeper keeps one barrel just for me, an' de orcs who try it come back down de stairs on deir hands." } },
      choices = {
        { text = "Could I try some?", next = "w2mug2" },
        { text = "That sounds like poison.", next = "w2mug2" },
        { text = "Something else, Doyo'da.", next = "BACK" },
      },
    },
    w2mug2 = {
      lines = { { id = "w2mg2_default", text = "Small sip, mon, an' sit down first. Dis be what we drank de night after Hyjal, all of us dat were left, an' every time I drink it I remember dem, so it be a good wine for restin' wit'." } },
      choices = { { text = "To those who didn't come back.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "I be Doyo'da, and I be restin', mon. I fought at Mount Hyjal and I been restin' ever since, and nobody's told me to stop yet." } },
      again = { { id = "h_again", text = "Somethin' else, mon? Don't make me sit up." } },
      choices = {
        { text = "You fought at Hyjal?", next = "hyjal" },
        { text = "Who else drinks here?", next = "others" },
        { text = "What happened at Hyjal?", next = "xhyjal2" },
        { text = "Don't you miss the Echo Isles?", next = "xisles" },
        { text = "Trolls don't drink like orcs.", next = "xdrink" },
        { text = "What did you do before Hyjal?", next = "y_before" },
        { text = "What's the innkeeper think of you?", next = "y_inn" },
        { text = "What's in that mug of yours?", next = "w2mug" },
        { text = "Enjoy your rest.", next = "END" },
      },
    },
    hyjal = {
      lines = { { id = "h2_default", text = "Ya, against de demons, beside orcs and elves and humans all together. Strangest day of my life, and de last time I want to fight anybody." } },
      choices = {
        { text = "You've earned your rest, then.", next = "BACK", reply = "Dat's what I keep tellin' de innkeeper!", fx = { align = { order = -1 } } },
        { text = "The Horde still needs fighters.", next = "BACK", reply = "Den let de young ones fight, mon. I did my part.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = { { id = "o_default", text = "Kozish de goblin, who sells anythin' to anybody, and some orcs like Goma, Sarok and little Zazo. Good company, mostly, if you don't mind de shoutin'." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhyjal2 = {
      lines = {
        { id = "xhyjal2_default", text = "De demon came, mon, Archimonde himself, with a whole army behind him. We fought, we held, and de elves did something with de great tree, and den it was all over, just like dat." },
      },
      choices = {
        { text = "You were lucky to survive.", next = "xlucky" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlucky = {
      lines = {
        { id = "xlucky_default", text = "Lucky? Ya, very lucky, mon. I lost friends, though, and I still drink to dem every night, which is why I be here every night." },
      },
      choices = {
        { text = "A fallen friend should be honoured with deeds.", next = "BACK", reply = "Maybe, mon, but my deeds be done. Dis is how I honour dem now.", fx = { align = { light = -1 } } },
        { text = "Remembering them is honour enough.", next = "BACK", reply = "Ya, mon. You understand dat. Sit and drink with me.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xisles = {
      lines = {
        { id = "xisles_default", text = "Sometimes, ya, de sea and de sand and de warm nights. But Zalazane be causing trouble out dere, and I be too old to fight witch doctors anymore." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xdrink = {
      lines = {
        { id = "xdrink_default", text = "No, mon, we drink better. De orcs drink to fight, and de trolls drink to forget, and I know which one I prefer." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_before = {
      lines = {
        { id = "y_before_d", text = "Hunted raptors in Stranglethorn, mon, back when de Darkspear lived dere. Den de murlocs and de Gurubashi push us out, and Thrall find us, and suddenly I be in Kalimdor fighting demons." },
        { id = "y_before_tr", when = { race = "Troll" }, text = "Same as your family, I bet, mon. Raptors in Stranglethorn, den de long run from de Gurubashi, den Thrall, den Hyjal. Dat be a lot of runnin' for one troll." },
      },
      choices = {
        { text = "Do you miss the jungle?", next = "y_jungle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_jungle = {
      lines = { { id = "y_jungle_d", text = "I miss de rain, mon. Durotar be so dry, my skin be crackin' like old bark. But de jungle be full of Gurubashi now, and dey not be friendly to Darkspear." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_inn = {
      lines = { { id = "y_inn_d", text = "She say I be bad for business, mon, and also her best customer, so she don't know whether to kick me out or give me a medal. I tell her de medal, and she not laugh." } },
      choices = {
        { text = "She should kick you out. Get back to work.", next = "y_work" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_work = {
      lines = { { id = "y_work_d", text = "Work, mon? De Horde still need hands, true, and dey be marching for Silithus soon. But I give my legs at Hyjal, and I think dat be enough. You think a troll owe more?" } },
      choices = {
        { text = "Everyone owes the Horde while it fights.", next = "BACK", reply = "Ya, ya. Maybe tomorrow, mon. Maybe.", fx = { align = { honor = 1 } } },
        { text = "You've paid. Drink in peace.", next = "BACK", reply = "Now you be talkin' sense, mon!", fx = { align = { honor = -1 } } },
      },
    },
  },
  topics = {
    hyjal = { { id = "y_tp_hyjal", text = "Hyjal be a big mountain with a bigger tree, mon, and I never want to see either again." } },
    stranglethorn = { { id = "y_tp_stv", text = "Stranglethorn be home once, mon, before de Gurubashi and de murlocs. Now it be full of humans and goblins." } },
    echo_isles = { { id = "tp_x_echo_isles", text = "De Echo Isles be home, mon, but Zalazane be making trouble dere now. Maybe I go back when he gone." } },
    darkspear = { { id = "y_tp_ds", text = "Darkspear be my tribe, mon. Small, stubborn, and still here, which be more than de Gurubashi can say." } },
    voljin = { { id = "y_tp_vj", text = "Vol'jin be a good leader, mon. He let me rest, which make him de best leader I ever had." } },
    _none = { { id = "tp_none", text = "I don't know, mon, and I be too comfortable to find out." } },
  },
}

-- Kozish: goblin who hangs about the inn in the Valley of Strength.
P:NPC {
  key = "og_kozish", id = TODO_NPC("Kozish"), name = "Kozish", gender = "male",
  role = "patron", tier = "service",
  communities = { "orgrimmar" }, temper = { "slick", "chatty" }, values = { "profit" },
  impression = {
    first = "Kozish sits at a corner table in the inn with a ledger and a drink, a goblin who seems to be doing business with half the room.",
    third = "{name} met Kozish, a goblin who does his business at the inn.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Hey, my friend! Pull up a chair. For you, the best deals in Orgrimmar!" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Hey. Pull up a chair, if you want. I'm open for business, sort of." },
    { id = "g_default", text = "Hey, friend! Pull up a chair, I'm always open for business." },
  },
  start = "hello",
  nodes = {
    w2odd = {
      lines = { { id = "w2od_default", text = "A kodo skull, pal, with a map scratched on the inside of it, sold to me by a tauren who swore it showed the way to the Kolkar treasure. I sold it to a Forsaken collector, he sold it back to me, and I've now sold it four times." } },
      choices = {
        { text = "Did anyone ever follow the map?", next = "w2odd2" },
        { text = "Selling the same skull four times is a swindle.", next = "w2odd2" },
        { text = "Something else, Kozish.", next = "BACK" },
      },
    },
    w2odd2 = {
      lines = { { id = "w2od2_default", text = "One fella did, and came back with a centaur arrow in his hat and nothin' else. He sold me the hat. I've learned that a good story is worth more than any treasure, pal, because a story sells again and again." } },
      choices = { { text = "Spoken like a broker.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "Name's Kozish, and I buy, I sell and I broker, mostly from this table. You need somethin' found, I know a guy, and if I don't, I know a guy who knows a guy." } },
      again = { { id = "h_again", text = "Anything else, friend? Make it worth my while, or at least make it interesting; this table's rented by the hour." } },
      choices = {
        { text = "What kind of business?", next = "business" },
        { text = "Why do business in an inn?", next = "inn" },
        { text = "What do you trade, exactly?", next = "xtrade" },
        { text = "Who are your best customers?", next = "xcustomers" },
        { text = "I'm a rogue. Got any work for me?", when = { class = "ROGUE" }, next = "xrogue" },
        { text = "How did you start out, Kozish?", next = "y_start" },
        { text = "Ever had a deal go bad?", next = "y_bad" },
        { text = "What's the oddest thing you've ever brokered?", next = "w2odd" },
        { text = "Not interested.", next = "END" },
      },
    },
    business = {
      lines = { { id = "b_default", text = "All kinds, friend, all kinds. Ore, cloth, information, the occasional favor, and nothin' that would bother the Warchief, mostly." } },
      choices = {
        { text = "That sounds like smuggling.", next = "BACK", reply = "Smuggling? I prefer 'creative trade'.", fx = { align = { order = 1 } } },
        { text = "A little bending of the rules is fine.", next = "BACK", reply = "Now there's somebody I can do business with!", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    inn = {
      lines = { { id = "i_default", text = "Because everybody comes through here eventually, and a goblin who's sittin' still is a goblin who's not payin' rent. Smart, huh?" } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xtrade = {
      lines = {
        { id = "xtrade_default", text = "Bit of this, bit of that, pal. Spices from Booty Bay, cloth from Ratchet, the odd crate of who-knows-what from who-knows-where. Everything's for sale if you know the right goblin." },
      },
      choices = {
        { text = "And the guards don't mind?", next = "xguards" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xguards = {
      lines = {
        { id = "xguards_default", text = "The guards mind a lot, but they mind less when I sell 'em good ale at a fair price. Everybody's happy, everybody wins, and nobody's out a copper they didn't want to spend." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xcustomers = {
      lines = {
        { id = "xcustomers_default", text = "Orcs who want something exotic, trolls who want something for their rituals, and the odd Forsaken who wants something I don't ask about. Good coin from all of 'em." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xrogue_default", text = "Work? Pal, I'm a simple trader. Though if you happen to find any crates fallin' off any carts in the Barrens, you know where I sit." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_start = {
      lines = {
        { id = "y_start_d", text = "Runnin' messages for a Venture Company foreman in the Barrens, pal. I read every message before I delivered it, and in a year I knew more about the Company's business than the foreman did." },
        { id = "y_start_gob", when = { race = "Goblin" }, text = "Same as you, probably, runnin' messages for some foreman and readin' every one. The Venture Company never figured out why their prices leaked, pal." },
      },
      choices = {
        { text = "Why did you leave the Company?", next = "y_leave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_leave = {
      lines = { { id = "y_leave_d", text = "They started cuttin' down the Barrens and shootin' tauren who complained. I'm a goblin, pal, not a monster. Also, the tauren stopped buyin', which was bad for business." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_bad = {
      lines = { { id = "y_bad_d", text = "Just one, pal. I sold a crate of 'medicinal herbs' to a troll, and it turned out to be somethin' the Burning Blade wanted, and a grunt nearly lost his head over it. I don't sell crates I haven't opened anymore." } },
      choices = {
        { text = "You should tell the guards everything.", next = "y_tell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_tell = {
      lines = { { id = "y_tell_d", text = "Tell 'em everything? Pal, a broker who talks is a broker with no customers. I fixed it quiet, and nobody's the worse. You think I owe the city a confession?" } },
      choices = {
        { text = "Yes. The city's safety comes first.", next = "BACK", reply = "Fine, fine, maybe a small confession. Don't hold your breath.", fx = { align = { order = 1 } } },
        { text = "No. You fixed it. That's enough.", next = "BACK", reply = "That's what I keep tellin' myself, pal.", fx = { align = { order = -1 } } },
      },
    },
  },
  topics = {
    booty_bay = { { id = "tp_x_booty_bay", text = "Booty Bay's the best port in the world, pal, if you like your trade quick and your questions few." } },
    venture_company = { { id = "y_tp_vc", text = "The Venture Company'd strip-mine their own mothers if the ore was good. I don't work for 'em anymore, pal." } },
    burning_blade = { { id = "y_tp_bb", text = "The Burning Blade? I don't sell to them, pal, and I don't say their name too loud either." } },
    goblins = { { id = "y_tp_gob", text = "Goblins run half the trade in Kalimdor, pal, and the other half just doesn't know it yet." } },
    orgrimmar = { { id = "y_tp_og", text = "Orgrimmar's loud, hot and honest, which makes it terrible for business and great for sleepin'." } },
    _none = { { id = "tp_none", text = "Don't know, friend, but for a price I can find out." } },
  },
}

-- Goma: orc regular at the inn in the Valley of Strength.
P:NPC {
  key = "og_goma", id = TODO_NPC("Goma"), name = "Goma", gender = "male",
  role = "patron", tier = "service",
  communities = { "orgrimmar" }, temper = { "loud", "boastful" }, values = { "honor" },
  impression = {
    first = "Goma is a big orc at the inn with a mug of grog and a story he is telling loud enough for everyone, whether they want to hear it or not.",
    third = "{name} met Goma, a boastful orc at the inn.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Ha! My favorite listener! Sit, and hear how I killed a quilboar, again!" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Ha. Another one. Sit, and listen, or don't. I'll talk anyway." },
    { id = "g_default", text = "Ha! Another one! Sit down and hear how I killed a quilboar with my bare hands!" },
  },
  start = "hello",
  nodes = {
    w2sarok = {
      lines = { { id = "w2sk_default", text = "Ha! Sarok tells no stories, which is why I must tell them for both of us! But if he did, he would tell about the Crossroads, when the centaur came over the wall and I stood in the gate and roared until they ran." } },
      choices = {
        { text = "Is that really what happened?", next = "w2sarok2" },
        { text = "I think Sarok might remember it differently.", next = "w2sarok2" },
        { text = "Something else, Goma.", next = "BACK" },
      },
    },
    w2sarok2 = {
      lines = { { id = "w2sk2_default", text = "Hm. I roared, yes. And Sarok stood behind me and did all the killing while I roared, and when it was over he said nothing, and he has said nothing since. That is why I talk so much, if you must know; somebody should." } },
      choices = { { text = "That's a good friend to have.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "I am Goma, and I have killed more quilboar than any orc in this inn. Ask anyone, they will tell you, unless they were lying about their own." } },
      again = { { id = "h_again", text = "More? I have more stories than you have ears!" } },
      choices = {
        { text = "Tell me about the quilboar.", next = "quilboar" },
        { text = "Do you ever stop boasting?", next = "boast" },
        { text = "Where did you fight?", next = "xwhere" },
        { text = "Tell me another story.", next = "xstory" },
        { text = "I'm a warrior. Try me with a real tale.", when = { class = "WARRIOR" }, next = "xwarrior" },
        { text = "What did you do before the inn?", next = "y_before" },
        { text = "Is there a fight you don't talk about?", next = "y_quiet" },
        { text = "What's the best story Sarok could tell about you?", next = "w2sarok" },
        { text = "I'll leave you to your grog.", next = "END" },
      },
    },
    quilboar = {
      lines = { { id = "q_default", text = "It was in the Barrens, near Razorfen, and it charged me with a spear the size of a tree. I broke the spear over my knee and its neck over the other one." } },
      choices = {
        { text = "An impressive feat.", next = "BACK", reply = "It was! Buy me another grog and I will tell it again.", fx = { align = { light = 1 } } },
        { text = "I don't believe a word of it.", next = "BACK", reply = "Bah! Come to Razorfen and I will prove it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    boast = {
      lines = { { id = "b_default", text = "Why would I? An orc who does not boast is an orc who has done nothing worth boasting about. Sarok and Zazo know that well." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xwhere = {
      lines = {
        { id = "xwhere_default", text = "Everywhere! The Barrens, Ashenvale, the Stonetalon Mountains, and once I went all the way to the Thousand Needles. That's where I wrestled the kodo." },
      },
      choices = {
        { text = "You wrestled a kodo?", next = "xkodo" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xkodo = {
      lines = {
        { id = "xkodo_default", text = "A great white kodo, as big as the inn! I held him by the horns for an hour, and then he fell asleep from exhaustion. Sarok says it was a cow, but Sarok wasn't there." },
      },
      choices = {
        { text = "Strength like that deserves a song.", next = "BACK", reply = "It does! Somebody write it down!", fx = { align = { honor = 1 } } },
        { text = "Tall tales do no honour to real warriors.", next = "BACK", reply = "Bah! Real warriors know a good story when they hear one.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xstory = {
      lines = {
        { id = "xstory_default", text = "Once I fought a centaur who was so big he had two heads, and I cut off both of them with one swing! Zazo, tell them, you were there." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarrior = {
      lines = {
        { id = "xwarrior_default", text = "Ha! A real warrior. Then you know there is no such thing as a real tale, only a tale told well. Buy me a grog and we will compare scars." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_before = {
      lines = {
        { id = "y_before_d", text = "I was a grunt in the Warchief's army! I marched from Durotar to the Barrens and killed centaur all the way. Then a centaur arrow went through my knee, and the healers said I should rest, so I rest here." },
        { id = "y_before_orc", when = { race = "Orc" }, text = "Same as any orc, I was a grunt! I marched to the Barrens and killed centaur all the way, until an arrow went through my knee. You know how it is, brother." },
      },
      choices = {
        { text = "Do you miss the fighting?", next = "y_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_miss = {
      lines = { { id = "y_miss_d", text = "Every day! But my knee does not miss it, and my knee is louder than I am, which nobody believes. So I tell stories, and the young grunts listen, and maybe they fight better for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_quiet = {
      lines = { { id = "y_quiet_d", text = "Hm. You are sharper than you look. There was a camp, before Thrall, and a human guard who gave me bread when the others did not. I do not tell that one, because orcs do not want to hear it." } },
      choices = {
        { text = "What happened to that guard?", next = "y_guard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_guard = {
      lines = { { id = "y_guard_d", text = "When Thrall broke the camp, I found him hiding in the grain store. I let him run. Sarok knows, and nobody else. Tell me, was that weak, or was it honour?" } },
      choices = {
        { text = "Honour. He showed you mercy first.", next = "BACK", reply = "That is what I tell myself. Good. Drink with me.", fx = { align = { honor = 1 } } },
        { text = "Weak. He was still a jailer.", next = "BACK", reply = "Maybe. Then keep it quiet, and I will keep boasting.", fx = { align = { honor = -1 } } },
      },
    },
  },
  topics = {
    centaur = { { id = "tp_x_centaur", text = "Centaur! Big, ugly, and they run fast. I killed a hundred of them, maybe two hundred." } },
    internment = { { id = "y_tp_camps", text = "The camps? Bah. We were all there, and now we are not. That is the only story worth telling about them." } },
    crossroads = { { id = "y_tp_xr", text = "The Crossroads! I held the wall there once against fifty centaur, or maybe twenty. It was a long night." } },
    razorfen = { { id = "y_tp_rf", text = "Razorfen is a nest of thorns and quilboar. I went in with an axe and came out with a story, which is better." } },
    sarok = { { id = "y_tp_sarok", text = "Sarok is my oldest friend and my worst audience. He has heard every story twice and believes none of them." } },
    _none = { { id = "tp_none", text = "Never heard of it, but I bet I could kill it." } },
  },
}

-- Sarok: orc regular at the inn in the Valley of Strength.
P:NPC {
  key = "og_sarok", id = TODO_NPC("Sarok"), name = "Sarok", gender = "male",
  role = "patron", tier = "service",
  communities = { "orgrimmar" }, temper = { "quiet", "dry" }, values = { "loyal" },
  impression = {
    first = "Sarok sits beside Goma at the inn, an orc of few words who rolls his eyes every time his friend begins another story.",
    third = "{name} met Sarok, a quiet orc at the inn.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "If Goma's been talking, friend, I'm sorry. But I'm glad you're here." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "If Goma has been talking to you, I'm sorry. For both of us." },
    { id = "g_default", text = "If Goma has been talking to you, I am sorry. He does not know when to stop." },
  },
  start = "hello",
  nodes = {
    w2story = {
      lines = { { id = "w2st_default", text = "One, once a year, on the night we left the camp. I tell it to Goma, and he is quiet for the whole of it, which is the only time each year that he is." } },
      choices = {
        { text = "Will you tell it to me?", next = "w2story2" },
        { text = "What does Goma say when it ends?", next = "w2story2" },
        { text = "Something else, Sarok.", next = "BACK" },
      },
    },
    w2story2 = {
      lines = { { id = "w2st2_default", text = "No. It is his story as much as mine, and it is the one story he has never told in this inn. When it ends, he says 'Again next year', and we drink, and then he starts lying about a quilboar." } },
      choices = { { text = "Keep that one between you.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "I am Sarok, and I fought beside Goma for six years. Half his stories are true, and I will not tell you which half." } },
      again = { { id = "h_again", text = "What else? Speak before Goma starts again." } },
      choices = {
        { text = "Which half is true?", next = "half" },
        { text = "Why do you drink with him?", next = "why" },
        { text = "Where did you and Goma meet?", next = "xmet" },
        { text = "Have you ever stopped him from telling a lie?", next = "xstop" },
        { text = "I'm a shaman. Do you know your ancestors?", when = { class = "SHAMAN" }, next = "xshaman" },
        { text = "What did you do after the camps?", next = "y_after" },
        { text = "Goma told me about a human guard.", next = "y_guard" },
        { text = "Where do you go when Goma sleeps?", next = "y_quiet" },
        { text = "Do you ever tell a story of your own?", next = "w2story" },
        { text = "Farewell.", next = "END" },
      },
    },
    half = {
      lines = { { id = "hf_default", text = "The quilboar was real, but it was a small one, and I was the one who killed it. Goma fell into the mud and has never forgiven me." } },
      choices = {
        { text = "You should set the record straight.", next = "BACK", reply = "And ruin his favorite story? No, let him have it.", fx = { align = { light = 1 } } },
        { text = "Let him have his glory.", next = "BACK", reply = "That is what friends are for.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because he saved my life at the Crossroads, and because the grog is cheap. Mostly the first one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xmet = {
      lines = {
        { id = "xmet_default", text = "In the camps, as boys. He told tall tales to the guards to make them laugh, and once it saved us from a beating. Since then I have not had the heart to make him stop." },
      },
      choices = {
        { text = "So the stories have a purpose.", next = "xpurpose" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpurpose = {
      lines = {
        { id = "xpurpose_default", text = "They did once. Now they are only noise, but it is good noise, and in a city of soldiers someone should make the others laugh." },
      },
      choices = {
        { text = "Laughter is the best medicine after war.", next = "BACK", reply = "Goma would agree, and I suppose I do too.", fx = { align = { light = 1 } } },
        { text = "Warriors should be stern, not foolish.", next = "BACK", reply = "Stern? Look at the grunts who never laugh, and tell me they are better for it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xstop = {
      lines = {
        { id = "xstop_default", text = "Once, when he told a Darkspear his grandfather was a murloc. The troll took it badly, and I had to step in before the inn was broken." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xshaman = {
      lines = {
        { id = "xshaman_default", text = "My grandmother was a shaman of the Frostwolf clan, and she said the spirits liked a quiet orc. Perhaps that is why I am quiet, and Goma is not." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_after = {
      lines = {
        { id = "y_after_d", text = "We followed Thrall. We fought at the Crossroads and in the Barrens, and Goma talked the whole way. Then his knee went, and I came with him to Orgrimmar. Someone had to." },
        { id = "y_after_orc", when = { race = "Orc" }, text = "What every freed orc did, brother. We followed Thrall. Goma talked, I fought, and when his knee went, I came here with him. Someone had to." },
      },
      choices = {
        { text = "You gave up the fight for a friend?", next = "y_gave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_gave = {
      lines = { { id = "y_gave_d", text = "The Horde has many axes. Goma has one friend. A grunt told me I was a coward for it. What do you say?" } },
      choices = {
        { text = "Loyalty to a friend is honour.", next = "BACK", reply = "Good. Then the grunt can say what he likes.", fx = { align = { honor = 1 } } },
        { text = "The Horde needed you more.", next = "BACK", reply = "Perhaps. I still sleep well.", fx = { align = { honor = -1 } } },
      },
    },
    y_guard = {
      lines = { { id = "y_guard_d", text = "He told you that? Then he trusts you. Do not repeat it. There are orcs in this city who would not understand mercy given to a jailer, and Goma has enough troubles." } },
      choices = { { text = "Your secret is safe.", next = "BACK" } },
    },
    y_quiet = {
      lines = { { id = "y_quiet_d", text = "The inn is too loud for thinking. I go to the Valley of Spirits when Goma sleeps, and I listen to the drums. That is my only story, and it is not a good one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    internment = { { id = "tp_x_internment", text = "Goma and I were boys in the camps. He talked, I listened. That has not changed." } },
    goma = { { id = "y_tp_goma", text = "Goma is loud and foolish and the bravest orc I know. Do not tell him I said the last part." } },
    crossroads = { { id = "y_tp_xr", text = "The Crossroads is where Goma saved my life. He tells it differently, but he is right about that part." } },
    frostwolf = { { id = "y_tp_fw", text = "My grandmother was Frostwolf. I have never seen Alterac, but I dream of the snow sometimes." } },
    zazo = { { id = "y_tp_zazo", text = "Zazo believes every word Goma says. Someone should look after that boy, so I do." } },
    _none = { { id = "tp_none", text = "I do not know. Ask Goma, he will pretend he does." } },
  },
}

-- Zazo: young orc who hangs around the inn in the Valley of Strength.
P:NPC {
  key = "og_zazo", id = TODO_NPC("Zazo"), name = "Zazo", gender = "male",
  role = "patron", tier = "service",
  communities = { "orgrimmar" }, temper = { "eager", "naive" }, values = { "honor" },
  impression = {
    first = "Zazo is a young orc at the inn who hangs on every word Goma says, his eyes shining with the hope of glory.",
    third = "{name} met Zazo, a young orc at the inn.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Oh, it's you! Tell me more stories! You're the best adventurer I know!" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Are you an adventurer? I've heard things. Maybe not good things." },
    { id = "g_default", text = "Are you an adventurer? Have you killed anything big? Tell me everything!" },
  },
  start = "hello",
  nodes = {
    w2axe = {
      lines = { { id = "w2ax_default", text = "Quilboar-Ender! Or Centaur-Splitter. Or maybe Grom, because Gorehowl is already taken, and Goma says you shouldn't name an axe after a living orc in case he wants it back." } },
      choices = {
        { text = "Why does an axe need a name?", next = "w2axe2" },
        { text = "Name it after your father.", next = "w2axe2" },
        { text = "Something else, Zazo.", next = "BACK" },
      },
    },
    w2axe2 = {
      lines = {
        { id = "w2ax2_warrior", when = { class = "WARRIOR" }, text = "Because then it's yours, and nobody else's! What did you name yours? Does it have a name? Tell me, and I'll tell Goma, and he'll pretend he knew already." },
        { id = "w2ax2_default", text = "Because then it's yours, and nobody else's, and when you die it gets told with your story. Sarok says his axe has no name, but I heard him call it something once when he thought nobody was listening." },
      },
      choices = { { text = "A good name will come to you.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "I am Zazo, and I am going to be the greatest warrior in the Horde, just like Goma. I am only waiting until I am old enough to join the army." } },
      again = { { id = "h_again", text = "Tell me more! Please!" } },
      choices = {
        { text = "Goma exaggerates, you know.", next = "goma" },
        { text = "Why do you want to be a warrior?", next = "warrior" },
        { text = "Who do you look up to?", next = "xidol" },
        { text = "Have you ever left Orgrimmar?", next = "xleave" },
        { text = "I'm a warrior. Want some advice?", when = { class = "WARRIOR" }, next = "xadvice" },
        { text = "What does your mother think of this?", next = "y_mother" },
        { text = "Have you ever been in a fight?", next = "y_fight" },
        { text = "Where would you go first, as a warrior?", next = "y_first" },
        { text = "What will you name your first axe?", next = "w2axe" },
        { text = "Good luck, Zazo.", next = "END" },
      },
    },
    goma = {
      lines = { { id = "g2_default", text = "No he doesn't! Well, maybe a little, but Sarok says even half a Goma story is better than most orcs' whole stories." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    warrior = {
      lines = { { id = "w_default", text = "Because the Horde needs warriors, and because I want my name sung in Grommash Hold. My father was a peon, and I want to be more than that." } },
      choices = {
        { text = "Glory is a worthy goal.", next = "BACK", reply = "Yes! You understand!", fx = { align = { honor = 1 } } },
        { text = "A peon's work is honest too.", next = "BACK", reply = "I suppose, but nobody sings songs about peons.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xidol = {
      lines = {
        { id = "xidol_default", text = "Goma, of course! And the Warchief, and Overlord Saurfang, and the grunts at the gate, and anyone who has fought a centaur." },
      },
      choices = {
        { text = "Goma's stories might not be true.", next = "xtrue" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtrue = {
      lines = {
        { id = "xtrue_default", text = "Sarok says that too, but I don't care. Even if they're not true, they make me want to go out and make them true myself." },
      },
      choices = {
        { text = "Then go and make your own stories.", next = "BACK", reply = "I will! As soon as my mother lets me.", fx = { align = { order = -1 } } },
        { text = "Stay safe. Learn from the trainers first.", next = "BACK", reply = "The trainers are boring, but I suppose you are right.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xleave = {
      lines = {
        { id = "xleave_default", text = "Once, to Razor Hill with my uncle. I saw a scorpid as big as a dog, and I wanted to fight it, but my uncle said no." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xadvice = {
      lines = {
        { id = "xadvice_default", text = "Yes! Tell me everything! How do you hold your axe? How many enemies have you killed? Do you ever get scared?" },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_mother = {
      lines = {
        { id = "y_mother_d", text = "She says the Horde already took my father, and it can wait for me. She works in the Drag mending tents. She doesn't like Goma very much." },
        { id = "y_mother_orc", when = { race = "Orc" }, text = "She says the Horde took my father, and it can wait for me. You know how mothers are. She mends tents in the Drag and she does not like Goma very much." },
      },
      choices = {
        { text = "Your father died in battle?", next = "y_father" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_father = {
      lines = { { id = "y_father_d", text = "No, he was a peon, and he died when a wall fell on him building this city. Nobody sings about him. That is why I want to be a warrior, so somebody sings about one of us." } },
      choices = {
        { text = "Your father built Orgrimmar. That's honour.", next = "BACK", reply = "I... never thought of it like that.", fx = { align = { honor = 1 } } },
        { text = "Then go and earn the songs yourself.", next = "BACK", reply = "I will! You'll see!", fx = { align = { honor = -1 } } },
      },
    },
    y_fight = {
      lines = { { id = "y_fight_d", text = "Once, with a goblin boy who said orcs smelled like wet wolves. I won, but Matron... I mean my mother... made me apologise. Goma says it still counts as a victory." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_first = {
      lines = { { id = "y_first_d", text = "The Crossroads! Goma says that is where real warriors are made, holding the wall against the centaur. Then Ashenvale, and then everywhere!" } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    advice = { { id = "tp_x_advice", text = "Goma says always attack first, before they know you're there! Sarok says always look first, which is much less fun." } },
    goma = { { id = "y_tp_goma", text = "Goma is the greatest warrior I know. Well, the greatest one who tells stories." } },
    saurfang = { { id = "y_tp_saur", text = "Overlord Saurfang is the bravest orc alive! I saw him once at Grommash Hold. He did not look at me." } },
    crossroads = { { id = "y_tp_xr", text = "The Crossroads is where Goma fought fifty centaur. Or twenty. Sarok says six." } },
    razor_hill = { { id = "y_tp_rh", text = "Razor Hill has scorpids as big as dogs! My uncle would not let me fight one." } },
    _none = { { id = "tp_none", text = "I don't know! But I will find out when I'm a warrior!" } },
  },
}

-- Elder Darkhorn: a tauren ancestor-spirit in the Valley of Wisdom, outside Grommash Hold, at the Lunar Festival.
P:NPC {
  key = "og_elder_darkhorn", id = 15579, name = "Elder Darkhorn", gender = "female",
  role = "elder", tier = "quest",
  temper = { "stern", "kind" }, values = { "memory", "honour" },
  notices = { "race" },
  impression = {
    first = "The spirit of an old tauren matron stands beside Grommash Hold, unbothered by the orcs hurrying past.",
    third = "{name} honoured Elder Darkhorn, a tauren spirit who returns to Orgrimmar at the Lunar Festival.",
  },
  greetings = {
    { id = "g_default", text = "Peace to you, child. Even in a city of iron and smoke, the ancestors find a place to stand." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The new moon has turned, child, and an old matron has walked back across the long plains to stand by the Warchief's door. Come, sit with me while the city lights its lanterns." },
    { id = "g_back", when = { metBefore = true }, text = "You return to me. Good. A spirit is only as strong as those who remember her." },
    { id = "g_quest", when = { questActive = TODO_QUEST("Darkhorn the Elder") }, text = "You seek the elders this year. Come, and take the blessing I have to give." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" }, text = "A shu'halo of the plains. Walk tall in this orc city, child, for our people stood beside them by choice." },
    { id = "n_orc", cat = "race", when = { race = "Orc" }, text = "An orc who stops to speak with a tauren ghost. Thrall has taught his people well." },
  },
  start = "hello",
  nodes = {
    w2elders = {
      lines = {
        { id = "w2el_tauren", when = { race = "Tauren" }, text = "Some, child, and you would know their names from the fireside tellings. Old ones stand at the Crossroads, and in Thunder Bluff, and out on the edge of the Barrens where the herds once ran, and we feel one another the way a herd feels its far edge." },
        { id = "w2el_default", text = "Some of them. Old ones stand at the Crossroads, and in Thunder Bluff, and out on the edge of the Barrens where the herds once ran, and we feel one another the way a herd feels its far edge." },
      },
      choices = {
        { text = "Do you ever speak to one another?", next = "w2elders2" },
        { text = "It must be lonely, standing apart.", next = "w2elders2" },
        { text = "Something else, Elder.", next = "BACK" },
      },
    },
    w2elders2 = {
      lines = { { id = "w2el2_default", text = "Through the living who walk between us, child, carrying our blessings from place to place. When you go to the next elder, you carry a little of me with you, and that is how the dead keep company." } },
      choices = { { text = "Then I'll carry it gladly.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    ed_orcs = {
      lines = { { id = "ed_orcs_l", text = "Most do, child, for they are busy with the living, as they should be. But every festival one or two stop and ask who I was, and those are the ones I came back for." } },
      choices = {
        { text = "What do you tell them?", next = "ed_orcs2" },
        { text = "I stopped, at least.", next = "ed_orcs2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ed_orcs2 = {
      lines = { { id = "ed_orcs2_l", text = "That I was a tauren like any other, who loved her herd and buried too many of them. The orcs understand that better than they let on, for they too have buried more than they can count." } },
      choices = {
        { text = "The orcs and tauren have more in common than it seems.", next = "BACK" },
        { text = "Something else, Elder.", next = "BACK" },
      },
    },
    ed_young = {
      lines = { { id = "ed_young_l", text = "The young bulls and cows of my clan, who had never seen a winter on the open plains. I taught them to find water under snow and to keep the kodo moving when the wind wanted them to stop." } },
      choices = {
        { text = "What happened if the kodo stopped?", next = "ed_young2" },
        { text = "That sounds like hard teaching.", next = "ed_young2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ed_young2 = {
      lines = { { id = "ed_young2_l", text = "Then the cold came for them, and for us after. Cairne brought the tribes to Mulgore so that no tauren need walk the plains in winter again, and I am glad the young ones today know only the stories." } },
      choices = {
        { text = "Mulgore is a blessing, then.", next = "BACK" },
        { text = "Do you miss the open plains?", next = "ed_young3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ed_young3 = {
      lines = { { id = "ed_young3_l", text = "I miss the sky over them, child, which was wider than any I have seen since. But a spirit does not miss things as the living do, and when the festival ends, I go back to the wind, and the wind remembers the plains for me." } },
      choices = {
        { text = "May the wind carry you gently, Elder.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = { { id = "h_default", text = "I am Darkhorn, and in life I led my clan's young through hard winters on the plains. Now the Lunar Festival calls me back, and I stand where the Horde's chieftains gather." } },
      again = {
        { id = "h_again", text = "What more would you ask, child?" },
        { id = "h_again2", text = "Speak. The Warchief's guards will not mind an old ghost's chatter." },
      },
      choices = {
        { text = "Why stand beside Grommash Hold?", next = "hold" },
        { text = "What is the Lunar Festival for?", next = "festival" },
        { text = "What were the plains like in your day?", next = "plains" },
        { text = "I am of the Bloodhoof's people, Elder.", next = "kin", when = { race = "Tauren" } },
        { text = "The orcs walk past you without a second look.", next = "ed_orcs" },
        { text = "Who did you lead through those winters?", next = "ed_young" },
        { text = "Do you know the other elders who return?", next = "w2elders" },
        { text = "Rest well, Elder.", next = "END" },
      },
    },
    hold = {
      lines = { { id = "hd_default", text = "Because here the Horde decides its future, and the future should hear from the past now and then. Thrall listens to his elders, and that is rare in a young chieftain." } },
      choices = {
        { text = "What would you tell the Warchief?", next = "advice" },
        { text = "Something else, Elder.", next = "BACK" },
      },
    },
    advice = {
      lines = { { id = "a_default", text = "That a home is harder to keep than to take. The orcs fought for this land, and now they must learn to grow old in it." } },
      choices = {
        { text = "The Horde must stay strong and ready for war.", next = "BACK", reply = "Strength, yes. But a spear held too long makes the arm ache.", fx = { align = { honor = 1 } } },
        { text = "Peace is what the Horde needs now.", next = "BACK", reply = "Then guard that peace well, child. It breaks easier than bone.", fx = { align = { honor = -1 } } },
      },
    },
    festival = {
      lines = { { id = "f_default", text = "It is the turning of the year, when the living remember the dead and the dead bless the living. Druids gather in Moonglade, and elders like me wander the world for any who seek us." } },
      choices = {
        { text = "How do I reach Moonglade?", next = "moonglade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    moonglade = {
      lines = { { id = "m_default", text = "Ask the festival's heralds in the Valley of Wisdom; the druids there will send you by the moon's own path. Look for my kin too, for many elders wait beside the old places of Kalimdor." } },
      choices = { { text = "I'll seek them out. Something else.", next = "BACK" } },
    },
    plains = {
      lines = { { id = "p_default", text = "Wide and gold, and hunted by centaur on every side. We moved with the kodo, and every winter we buried someone dear, and every spring we sang for them." } },
      choices = { { text = "Mulgore is safer now, thanks to Cairne.", next = "BACK" } },
    },
    kin = {
      lines = { { id = "k_default", text = "Then you carry the Earth Mother's blessing in your hooves already. Remember us at the festival fires, and tell the little ones our names." } },
      choices = { { text = "I will, Elder. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "A tauren elder of long ago, who returns each year at the Lunar Festival." } },
    _none = { { id = "tp_none", text = "That is a matter for the living, child. Ask them." } },
  },
}

-- Lunar Festival Herald: a tauren herald by the bank who sends Horde folk to the festival in the Valley of Wisdom.
P:NPC {
  key = "og_lunar_herald", id = 15891, name = "Lunar Festival Herald", gender = "male",
  role = "herald", tier = "quest",
  temper = { "cheerful", "earnest" }, values = { "tradition", "community" },
  notices = { "race" },
  impression = {
    first = "A tauren in festival colours calls out to anyone passing the bank.",
    third = "{name} heard the Lunar Festival Herald's call in Orgrimmar.",
  },
  greetings = {
    { id = "g_default", text = "Hail, friend! The Lunar Festival has come, and all are welcome to celebrate it." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The Lunar Festival is here at last! The elders have returned, and the Valley of Wisdom is full of light." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back! Have you visited the Valley of Wisdom yet?" },
    { id = "g_quest", when = { questActive = TODO_QUEST("The Lunar Festival") }, text = "Off to the Valley of Wisdom with you! The festival harbinger waits there." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" }, text = "A child of Mulgore! You know the elders' ways already; go and honour them." },
  },
  start = "hello",
  nodes = {
    w2dress = {
      lines = { { id = "w2dr_default", text = "In your brightest colours, friend, and something that catches the moonlight! The elders say they see us better when we shine, and I have stitched little silver beads into my own mane for the purpose." } },
      choices = {
        { text = "Where would I find something festive?", next = "w2dress2" },
        { text = "I'd rather go as I am.", next = "w2dress2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2dress2 = {
      lines = { { id = "w2dr2_default", text = "The festival vendors in Moonglade sell fine robes for the purpose, and lanterns too. But truly, friend, the elders care that you came and not what you wore, so come as you are if you must." } },
      choices = { { text = "I'll come either way.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "Each year at the new moon, the spirits of our elders return, and the druids of Moonglade open their glade to all. Go to the Valley of Wisdom and speak with the festival's harbinger there." } },
      again = { { id = "h_again", text = "Anything else, friend? There are more to greet today." } },
      choices = {
        { text = "Who are these elders?", next = "elders" },
        { text = "Moonglade is a night elf place, isn't it?", next = "moonglade" },
        { text = "Do the orcs keep this festival too?", next = "orcs" },
        { text = "My people have always honoured the ancestors.", next = "tauren", when = { race = "Tauren" } },
        { text = "Who is the elder you remember most?", next = "y_elder" },
        { text = "Do you ever wish the elders would stay?", next = "y_stay" },
        { text = "Do the orcs honour the elders?", next = "y_orcs2" },
        { text = "How should I dress for the festival?", next = "w2dress" },
        { text = "I'll go to the valley.", next = "END" },
      },
    },
    elders = {
      lines = { { id = "e_default", text = "The honoured dead of every people, who walk among us while the festival lasts. They wait in cities, ruins and lonely hills, and each will give a coin of blessing to one who seeks them." } },
      choices = {
        { text = "Where can I find them?", next = "where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where = {
      lines = { { id = "w_default", text = "One stands right here in Orgrimmar, Elder Darkhorn, beside Grommash Hold. Others wait in Thunder Bluff, the Undercity and across both continents." } },
      choices = {
        { text = "I'll find every one of them.", next = "BACK", reply = "That is the spirit! The ancestors will smile on you.", fx = { align = { order = 1 } } },
        { text = "Chasing ghosts for coins seems pointless.", next = "BACK", reply = "Then go for the feasting, friend. The elders will forgive you.", fx = { align = { order = -1 } } },
      },
    },
    moonglade = {
      lines = { { id = "m_default", text = "It is a druid's place, and druids of every people share it, tauren and kaldorei alike. During the festival, the Cenarion Circle keeps the peace there for all." } },
      choices = { { text = "Then I'll go in peace. Something else.", next = "BACK" } },
    },
    orcs = {
      lines = { { id = "o_default", text = "Many do now, the ones who follow the shamans' path and honour their own ancestors. The orcs know better than most what it is to lose their elders." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tauren = {
      lines = { { id = "t_default", text = "So we have, and so this festival is ours as much as anyone's. Wear your best and greet the elders proudly." } },
      choices = { { text = "I will. Something else.", next = "BACK" } },
    },
    y_elder = {
      lines = {
        { id = "y_elder_d", text = "My own grandfather, who rode with Cairne on the long walk to Mulgore and died before he saw Thunder Bluff finished. I do not know whether he is among the elders, but I look for him every year." },
        { id = "y_elder_ta", when = { race = "Tauren" }, text = "My grandfather, who walked with Cairne to Mulgore as your own kin surely did. I look for him among the elders every year, friend, and every year I do not find him." },
      },
      choices = {
        { text = "Maybe this year you will.", next = "y_hope" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_hope = {
      lines = { { id = "y_hope_d", text = "Perhaps. The druids say the elders come to those who honour them, not those who search. I keep searching all the same, which is very tauren of me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_stay = {
      lines = { { id = "y_stay_d", text = "Every year, friend, when the moon grows full and they fade. Some of the young ones say we should find a way to keep them, through magic or shamanism. What do you think?" } },
      choices = {
        { text = "Let them go. That is the natural way.", next = "BACK", reply = "Yes. The Earth Mother would agree with you.", fx = { align = { order = 1 } } },
        { text = "If there's a way, why not try?", next = "BACK", reply = "A bold thought. Be careful the Forsaken do not hear it.", fx = { align = { order = -1 } } },
      },
    },
    y_orcs2 = {
      lines = { { id = "y_orcs2_d", text = "Elder Darkhorn waits near Grommash Hold. The orcs pass him with their heads lowered, and some of them weep. I have never seen an orc weep anywhere else." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    moonglade = { { id = "y_tp_mg", text = "Moonglade is a place of peace. Even the Horde and the kaldorei keep their weapons sheathed there." } },
    lunar_festival = { { id = "y_tp_lf", text = "The festival honours the elders and the turning of the year. Wear red and bring coins for the elders." } },
    _none = { { id = "tp_none", text = "I only know the festival, friend. Ask in the Valley of Wisdom." } },
  },
}

-- Festival Talespinner: a Forsaken storyteller in Orgrimmar during the Midsummer Fire Festival.
P:NPC {
  key = "og_festival_talespinner", id = 16818, name = "Festival Talespinner", gender = "male",
  role = "storyteller", tier = "quest",
  temper = { "theatrical", "sly" }, values = { "stories", "the Horde" },
  notices = { "race" },
  impression = {
    first = "A Forsaken storyteller in festival finery gestures grandly beside the bonfire.",
    third = "{name} listened to the Festival Talespinner at Orgrimmar's Midsummer fires.",
  },
  greetings = {
    { id = "g_default", text = "Ah, an audience! Gather close, friend, the fire is warm and my tales are warmer." },
    { id = "g_festival", when = { holiday = "midsummer" }, text = "The Midsummer fires burn high tonight, friend. Even a dead man feels their warmth, and that is a tale in itself." },
    { id = "g_back", when = { metBefore = true }, text = "You return for another tale? You flatter a dead man's vanity." },
    { id = "g_quest", when = { questActive = TODO_QUEST("Stealing Stormwind's Flame") }, text = "Have you the Alliance's flame yet? Oh, the tale we will tell when you bring it home." },
  },
  notice = {
    { id = "n_undead", cat = "race", when = { race = "Scourge" }, text = "One of the Dark Lady's children, warm by an orc's fire. Isn't it strange how we still enjoy the heat?" },
  },
  start = "hello",
  nodes = {
    w2city = {
      lines = { { id = "w2ct_default", text = "Gladly. When the young Warchief first stood in this canyon, he did not name the city for himself, as a human king would. He named it for his old master, Orgrim Doomhammer, who died freeing him, so that every orc who says the city's name says a dead friend's name too." } },
      choices = {
        { text = "Is that tale true?", next = "w2city2" },
        { text = "A grim thing, naming a city for the dead.", next = "w2city2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2city2 = {
      lines = { { id = "w2ct2_default", text = "True enough that the orcs never correct me, friend. And grim, perhaps, but I am dead myself, and I find it a comfort: a city that speaks a dead man's name every day has not forgotten that the dead were once loved." } },
      choices = { { text = "A good tale, well told.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "The Midsummer Fire Festival, friend, when every city lights its great flame against the dark. And I am here to tell the tales that go with it, the bolder the better." } },
      again = {
        { id = "h_again", text = "Another question? I live for them. Well, in a manner of speaking." },
        { id = "h_again2", text = "Speak up. The fire crackles loud tonight." },
      },
      choices = {
        { text = "Why does a Forsaken celebrate a fire festival?", next = "forsaken" },
        { text = "Tell me a tale, then.", next = "tale" },
        { text = "I hear the Alliance cities have flames too.", next = "flames" },
        { text = "I'm Forsaken too. The fire troubles me.", next = "fear", when = { race = "Scourge" } },
        { text = "Who were you, before you died?", next = "y_life" },
        { text = "Do the orcs like your tales?", next = "y_orcs" },
        { text = "Tell me a tale of Orgrimmar itself.", next = "w2city" },
        { text = "Some other time.", next = "END" },
      },
    },
    forsaken = {
      lines = { { id = "fs_default", text = "Because I remember summers, friend, and I see no reason death should take that too. The Horde lights its fires, and the Forsaken stand among them as allies." } },
      choices = { { text = "A fair answer. Something else.", next = "BACK" } },
    },
    tale = {
      lines = { { id = "t_default", text = "Here is a short one. Once a frost lord came down from the north to snuff the summer fires, and the people beat him back with nothing but torches and stubbornness. Every year since, they light the fires to remind him." } },
      choices = {
        { text = "Is any of that true?", next = "truth" },
        { text = "A fine tale. Something else.", next = "BACK" },
      },
    },
    truth = {
      lines = { { id = "tr_default", text = "Every good tale is true somewhere, and this one is truer than most. Ask the shamans about the lords of fire and frost, and see how quickly they stop smiling." } },
      choices = { { text = "Then I'll keep my torch lit.", next = "BACK" } },
    },
    flames = {
      lines = { { id = "fl_default", text = "They do, burning proudly in Stormwind, Ironforge and Darnassus. A daring Horde hero might slip in and bring a little of that flame home to Orgrimmar." } },
      choices = {
        { text = "Stealing their flame would shame them. I'll do it.", next = "BACK", reply = "That's the spirit! Come back with fire in your hands.", fx = { align = { honor = 1 } } },
        { text = "Let them keep their fire. It's a holiday.", next = "BACK", reply = "How generous of you. The Alliance would never return the favour.", fx = { align = { honor = -1 } } },
      },
    },
    fear = {
      lines = { { id = "fe_default", text = "It troubles us all, friend; fire was made to burn dead things. That is why I stand close to it. A tale is no good if the teller is afraid of it." } },
      choices = { { text = "I'll try to stand a little closer.", next = "BACK" } },
    },
    y_life = {
      lines = {
        { id = "y_life_d", text = "A player in a travelling troupe out of Lordaeron, friend, and not a very good one. I played the third soldier in every war play, and I died on stage a hundred times before I did it for real." },
        { id = "y_life_sc", when = { race = "Scourge" }, text = "A player in a Lordaeron troupe, as you might have been a baker or a guard. I died on stage a hundred times before the plague taught me how it is really done. You understand." },
      },
      choices = {
        { text = "What happened to the troupe?", next = "y_troupe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_troupe = {
      lines = { { id = "y_troupe_d", text = "We were playing in Andorhal when the grain came in. Some of them rose with me, and some rose for the Scourge, and I have not looked for the rest. A storyteller learns which endings he can bear to know." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_orcs = {
      lines = { { id = "y_orcs_d", text = "They love a battle and a good death, and they hate a tale where the hero runs. I have learned to end every story with an axe, whatever it was about when it began." } },
      choices = {
        { text = "Shouldn't a tale tell the truth?", next = "y_truth2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_truth2 = {
      lines = { { id = "y_truth2_d", text = "A tale should be heard, friend, or it is only a dead man muttering by a fire. Still, I wonder sometimes whether I flatter them too much. What do you think a storyteller owes his audience?" } },
      choices = {
        { text = "The truth, even when it stings.", next = "BACK", reply = "Then you would empty my audience by midnight. But you may be right.", fx = { align = { light = 1 } } },
        { text = "Whatever keeps them by the fire.", next = "BACK", reply = "A practical soul. We'll get along famously.", fx = { align = { light = -1 } } },
      },
    },
  },
  topics = {
    midsummer = { { id = "y_tp_mid", text = "Midsummer is when the world remembers it is warm. Even the dead deserve one night of that." } },
    lordaeron = { { id = "y_tp_lord", text = "Lordaeron was a kingdom of stages and bonfires once. Now it is a stage with only one play left." } },
    _none = { { id = "tp_none", text = "I know no tale of that, friend, but give me an hour and I will make one up." } },
  },
}

-- Great-father Winter's Helper: a goblin Little Helper beside Great-father Winter in the Valley of Strength.
P:NPC {
  key = "og_winter_helper", id = 15746, name = "Great-father Winter's Helper", gender = "male",
  role = "helper", tier = "service",
  temper = { "busy", "chipper" }, values = { "holiday", "coin" },
  impression = {
    first = "A goblin in a red and green suit, juggling ribbons and a long list.",
    third = "{name} met Great-father Winter's Helper in the Valley of Strength during the Feast of Winter Veil.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Happy Winter Veil, friend! Smokywood Pastures wishes you joy, and a little extra!" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Happy Winter Veil. Smokywood Pastures wishes you joy. Some joy, anyway." },
    { id = "g_default", text = "Happy Winter Veil! Smokywood Pastures wishes you joy, cheer, and reasonable prices!" },
    { id = "g_festival", when = { holiday = "winterveil" }, text = "Winter Veil is here at last! Great-father Winter is in fine spirits, and so is Smokywood Pastures." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Are you on the nice list? Don't answer that; it's above my pay grade." },
  },
  start = "hello",
  nodes = {
    w2pocket = {
      lines = { { id = "w2pk_default", text = "This? Emergency candy canes, pal. When an orc child starts cryin' in the line, you hand one over quick, and when a grunt starts growlin' in the line, you hand him two. I go through a pocketful an hour." } },
      choices = {
        { text = "Does Smokywood pay for those?", next = "w2pocket2" },
        { text = "Bribing grunts with candy seems unwise.", next = "w2pocket2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2pocket2 = {
      lines = { { id = "w2pk2_default", text = "Ha! They come out of my wages, pal, which is the worst deal I ever made. But I tell myself it's an investment in a quiet line, and a quiet line means the Great-father keeps smilin', and his smile is the only thing in this job that's free." } },
      choices = { { text = "Here's to a quiet line.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "I help Great-father Winter with the gifts and the crowds and the occasional angry grunt. It's a busy season, but the tips are good!" } },
      again = { { id = "h_again", text = "What else? Quick, the Great-father is waving at me." } },
      choices = {
        { text = "Who is Great-father Winter?", next = "greatfather" },
        { text = "What does Smokywood Pastures have to do with it?", next = "smokywood" },
        { text = "What's on your list?", next = "xlist" },
        { text = "Do orcs celebrate Winter Veil?", next = "xorcs" },
        { text = "I'm a goblin's best customer, you know.", when = { profession = "Engineering" }, next = "xgoblin" },
        { text = "How did you get this job?", next = "y_job" },
        { text = "What's the hardest part of the season?", next = "y_hard" },
        { text = "What's that sticking out of your pocket?", next = "w2pocket" },
        { text = "Happy Winter Veil.", next = "END" },
      },
    },
    greatfather = {
      lines = { { id = "gf_default", text = "The jolly old fellow who brings gifts at the Winter Veil, of course! The Horde calls him Great-father, and the Alliance has some other name for him." } },
      choices = {
        { text = "Is he real?", next = "real" },
        { text = "Something else.", next = "BACK" },
      },
    },
    real = {
      lines = { { id = "r_default", text = "Real enough to hand out presents, pal, and that's what counts. I don't ask questions while the gifts keep coming." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
    smokywood = {
      lines = { { id = "s_default", text = "Everything! They supply the treats, the trimmings and the trees, and they pay me to smile. Their stall's right over there, if you've coin to spend." } },
      choices = {
        { text = "So the holiday is just a goblin sales pitch.", next = "BACK", reply = "Hey, a goblin's gotta eat too! But the cheer's free.", fx = { align = { order = 1 } } },
        { text = "Good business is good cheer, I say.", next = "BACK", reply = "Now there's someone who understands the season!", fx = { align = { order = -1 } } },
      },
    },
    xlist = {
      lines = {
        { id = "xlist_default", text = "Everything! Gifts, deliveries, candy canes, snowballs, and who's been naughty and nice. Mostly I just write down who paid and who didn't." },
      },
      choices = {
        { text = "Who's on the naughty list?", next = "xnaughty" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xnaughty = {
      lines = {
        { id = "xnaughty_default", text = "Can't say, it's confidential. But between you and me, there's a lot of orcs on it, mostly for snowball fights that got out of hand." },
      },
      choices = {
        { text = "Rules are rules, even for a holiday.", next = "BACK", reply = "Exactly what Smokywood says!", fx = { align = { order = 1 } } },
        { text = "A holiday should be a time to bend rules.", next = "BACK", reply = "Hey, I like your thinking, but don't tell my boss.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorcs = {
      lines = {
        { id = "xorcs_default", text = "More than you'd think! They like the feasts and the gifts, and the grunts at the gate love snowball fights, though they throw them a bit too hard." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xgoblin = {
      lines = {
        { id = "xgoblin_default", text = "An engineer! Then you know a good toy when you see one. Smokywood's got wind-up machines this year that only explode on purpose." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_job = {
      lines = {
        { id = "y_job_d", text = "I lost a bet with a Smokywood manager in Ratchet, pal. The stakes were a season in this suit. That was four seasons ago, and the tips turned out good enough that I stopped complainin'." },
        { id = "y_job_gob", when = { race = "Goblin" }, text = "Lost a bet, pal, same as half the goblins in a funny hat. Four seasons later the tips are good enough that I stopped complainin'. You know how it goes." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_hard = {
      lines = { { id = "y_hard_d", text = "The orphans, pal. They come every year with their hands out, and Smokywood says every gift has to be paid for. I sneak a few extra into the sack when nobody's countin'." } },
      choices = {
        { text = "Does Smokywood know?", next = "y_know" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_know = {
      lines = { { id = "y_know_d", text = "Not yet, and if they find out, I'm sellin' snowballs in Tanaris. You think I should keep doin' it, or play by the ledger?" } },
      choices = {
        { text = "Keep doing it. The kids matter more.", next = "BACK", reply = "That's what I figured. Don't tell anybody, pal.", fx = { align = { order = -1 } } },
        { text = "Play by the ledger. It's their gold.", next = "BACK", reply = "Yeah, yeah. You sound just like my boss.", fx = { align = { order = 1 } } },
      },
    },
  },
  topics = {
    steamwheedle = { { id = "tp_x_steamwheedle", text = "Smokywood Pastures is good Steamwheedle business! Neutral, cheerful, and always open." } },
    greatfather_winter = { { id = "y_tp_gw", text = "Great-father Winter's the best boss I ever had, pal. He laughs at everything, even my jokes." } },
    orphanage = { { id = "y_tp_orph", text = "The orphanage gets visited first. That's the one rule I never bend." } },
    _none = { { id = "tp_none", text = "No idea! But I'll put it on the list for the Great-father." } },
  },
}

-- Raider Bork: the orc war mount quartermaster outside the Hall of Legends.
P:NPC {
  key = "og_raider_bork", id = 12796, name = "Raider Bork", gender = "male",
  role = "quartermaster", tier = "service",
  temper = { "gruff", "proud" }, values = { "honour", "victory" },
  notices = { "race" },
  impression = {
    first = "A scarred orc raider stands by the Hall of Legends with the look of a man who has ridden hard.",
    third = "{name} spoke with Raider Bork, war mount quartermaster of the Hall of Legends.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "You stand before the Hall of Legends, warrior, and you belong here." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "You stand before the Hall of Legends. Only the worthy enter. I'm not sure that's you." },
    { id = "g_default", text = "You stand before the Hall of Legends, warrior. Only those who have proven themselves in battle may buy from me." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Have you earned a better rank since we last spoke?" },
  },
  start = "hello",
  nodes = {
    w2feed = {
      lines = { { id = "w2fd_default", text = "Raw meat for the wolves, grain and hay for the kodo, and the raptors eat whatever they can catch, which some days includes the stable boys. I keep the raptors' pen furthest from the door, and I don't turn my back on it." } },
      choices = {
        { text = "Have they ever caught a stable boy?", next = "w2feed2" },
        { text = "A raptor knows only hunger.", next = "w2feed2" },
        { text = "Something else, Raider.", next = "BACK" },
      },
    },
    w2feed2 = {
      lines = {
        { id = "w2fd2_hunter", when = { class = "HUNTER" }, text = "Nipped, not caught, brother, and the boy deserved it for turning his back. You keep a beast, so you know: a raptor respects the hand that feeds it only as long as the hand stays in front of it." },
        { id = "w2fd2_default", text = "Nipped, not caught, and the boy deserved it for turning his back. A raptor respects the hand that feeds it only as long as that hand stays in front of its eyes." },
      },
      choices = { { text = "I'll keep my hands in front.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "I am Raider Bork, and I keep the war mounts for the Horde's greatest champions. Wolves, kodo and raptors, all bred for battle against the Alliance." } },
      again = { { id = "h_again", text = "What else, warrior? Speak quickly." } },
      choices = {
        { text = "How does one earn a war mount?", next = "earn" },
        { text = "What is the Hall of Legends?", next = "hall" },
        { text = "Where did you ride as a raider?", next = "xride" },
        { text = "What became of your wolf?", next = "xwolf" },
        { text = "I have earned an officer's rank.", when = { pvpRank = 6 }, next = "xrank" },
        { text = "Does the Hall of Legends honor the fallen?", next = "y_fallen" },
        { text = "Do you still raid?", next = "y_raid" },
        { text = "What do you feed the war mounts?", next = "w2feed" },
        { text = "Lok'tar, Raider.", next = "END" },
      },
    },
    earn = {
      lines = { { id = "e_default", text = "Through blood and honour on the battlefield. Rise high enough in the Horde's ranks, and I will gladly sell you a steed fit for a legend." } },
      choices = {
        { text = "What makes a war mount better than a common one?", next = "mount" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mount = {
      lines = { { id = "m_default", text = "Armour, training and temper. A war wolf will charge into a line of spears without flinching, and it will not run even when its rider falls." } },
      choices = {
        { text = "Glory in war is worth any cost.", next = "BACK", reply = "Spoken like a true raider. Go and earn it.", fx = { align = { honor = 1 } } },
        { text = "I'd rather a mount that brings me home alive.", next = "BACK", reply = "Hmph. Wisdom, perhaps. But legends are not made that way.", fx = { align = { honor = -1 } } },
      },
    },
    hall = {
      lines = { { id = "h2_default", text = "It honours the Horde's finest in the war against the Alliance. Those of high rank may enter, and the rest may only look and hope." } },
      choices = { { text = "I'll earn my place. Something else.", next = "BACK" } },
    },
    xride = {
      lines = {
        { id = "xride_default", text = "Across the Barrens and into Ashenvale, burning Alliance camps and chasing elves through the trees. Before that, in the Second War, I rode with the Blackrock." },
      },
      choices = {
        { text = "You rode in the Second War?", next = "xwar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwar = {
      lines = {
        { id = "xwar_default", text = "I did, and we lost, and the humans put me in a camp. When Thrall freed us, the first thing I did was steal a wolf. The second thing was to burn the camp." },
      },
      choices = {
        { text = "Revenge is a warrior's right.", next = "BACK", reply = "It is. Some call it hatred, but I call it justice.", fx = { align = { light = -1 } } },
        { text = "Freedom matters more than revenge.", next = "BACK", reply = "Spoken like the Warchief. I suppose he is right, but I still enjoyed the fire.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwolf = {
      lines = {
        { id = "xwolf_default", text = "She is old now and sleeps in the kennels. I ride younger wolves, but none are as fast as she was, and none know the Barrens as she did." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xrank = {
      lines = {
        { id = "xrank_default", text = "Then you may choose from my finest mounts. Wear your rank proudly, and remember those who died to give you the chance to earn it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_fallen = {
      lines = {
        { id = "y_fallen_d", text = "It honours rank, and rank is won by those who live. The fallen get a name on a stone in the Valley of Honor, if someone remembers to carve it. I carve some myself, at night." },
        { id = "y_fallen_orc", when = { race = "Orc" }, text = "It honours rank, brother, and rank goes to the living. The dead get a stone in the Valley of Honor if someone carves it. I carve some myself, at night, when the hall is empty." },
      },
      choices = {
        { text = "Whose names do you carve?", next = "y_names" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_names = {
      lines = { { id = "y_names_d", text = "Riders from my old pack. Gorza, who rode beside me out of the camps. Tharg, who laughed at arrows. Twelve names so far. I will need more stone before this war is done." } },
      choices = {
        { text = "The Hall should honor them, not just rank.", next = "BACK", reply = "Say that to the Warlords. They might even listen to you.", fx = { align = { order = -1 } } },
        { text = "Rank keeps order. The stones are enough.", next = "BACK", reply = "Perhaps. Order keeps the living alive.", fx = { align = { order = 1 } } },
      },
    },
    y_raid = {
      lines = { { id = "y_raid_d", text = "My knees say no and my heart says yes. I ride out to Warsong Gulch when the Warlords allow it, and I come back aching and grinning. That is enough raiding for an old orc." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    internment = { { id = "tp_x_internment", text = "The camps were a cage. I left mine on the back of a stolen wolf, and I have not stopped riding since." } },
    warsong_gulch = { { id = "y_tp_wsg", text = "Warsong Gulch is where the young ones earn their names. Ride hard there and you will see me again." } },
    wolves = { { id = "y_tp_wolf", text = "A wolf is a raider's brother. Feed it before yourself, and it will carry you through fire." } },
    hall_of_legends = { { id = "y_tp_hol", text = "The Hall of Legends is for those who bleed the most for the Horde. Earn your way inside." } },
    _none = { { id = "tp_none", text = "Not my concern, warrior. I deal in mounts and glory." } },
  },
}

-- Sergeant Thunderhorn: a tauren quartermaster in the Hall of Legends who outfits the Horde's ranked warriors.
P:NPC {
  key = "og_sergeant_thunderhorn", id = 14581, name = "Sergeant Thunderhorn", gender = "male",
  role = "quartermaster", tier = "service",
  temper = { "steady", "dutiful" }, values = { "duty", "honour" },
  notices = { "race" },
  impression = {
    first = "A broad tauren sergeant stands among racks of fine armour, calm and watchful.",
    third = "{name} met Sergeant Thunderhorn, quartermaster in the Hall of Legends.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Welcome, warrior. The Horde rewards those who fight for it, and you have." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Welcome, warrior. The Horde rewards those who fight for it. Prove you have." },
    { id = "g_default", text = "Welcome, warrior. The Horde rewards those who fight for it, and I see that the rewards reach the right hands." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Your name grows on the battlefield, I hear." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" }, text = "A child of Mulgore among the Horde's champions. The Earth Mother is proud, I think." },
  },
  start = "hello",
  nodes = {
    w2fit = {
      lines = { { id = "w2ft_default", text = "With patience and a great deal of leather. The orc smiths forge for orc shoulders, so every tauren piece must be let out at the seams and given a higher collar, and a helm that leaves room for horns is a craft of its own." } },
      choices = {
        { text = "Who does that work?", next = "w2fit2" },
        { text = "Why not have tauren smiths make it?", next = "w2fit2" },
        { text = "Something else, Sergeant.", next = "BACK" },
      },
    },
    w2fit2 = {
      lines = {
        { id = "w2ft2_tauren", when = { race = "Tauren" }, text = "I do, young one, with these hands, in the evenings. When you earn your rank, come to me and I will fit it myself, so that you go into Warsong Gulch in armour made for a child of Mulgore and not a borrowed orc's shell." },
        { id = "w2ft2_default", text = "I do, with these hands, in the evenings. Taruk taught me, and it is a small way to keep him near, so I have never asked anyone else to do it." },
      },
      choices = { { text = "That is good work.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "I am Sergeant Thunderhorn, and I keep the arms and armour granted to the Horde's ranked warriors. Your rank decides what you may claim." } },
      again = { { id = "h_again", text = "Ask what more you would, warrior. These racks will stand a while yet, and so will I." } },
      choices = {
        { text = "What kind of equipment do you keep?", next = "gear" },
        { text = "A tauren in an orc hall. How did you end up here?", next = "tauren" },
        { text = "What does the Earth Mother think of war?", next = "xearth" },
        { text = "How did you earn your rank?", next = "xrank" },
        { text = "Walk with the Earth Mother, Sergeant.", when = { race = "Tauren" }, next = "xtauren" },
        { text = "Have you lost anyone to this war?", next = "y_lost" },
        { text = "Do you approve of the Warlords' ranks?", next = "y_ranks" },
        { text = "Tell me of the Thunderhorn tribe.", next = "y_thunderhorn" },
        { text = "How do you fit armour for a tauren champion?", next = "w2fit" },
        { text = "Farewell, Sergeant.", next = "END" },
      },
    },
    gear = {
      lines = { { id = "gr_default", text = "Armour forged for each calling, from warrior's plate to shaman's mail, and weapons fit for a warlord. Each piece is earned in battle, not bought with gold." } },
      choices = {
        { text = "Why not sell it to any who can pay?", next = "pay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pay = {
      lines = { { id = "p_default", text = "Because gold can be stolen, but honour must be won. A warrior who wears this armour has bled for the Horde." } },
      choices = {
        { text = "That's how it should be.", next = "BACK", reply = "Then go and earn it, warrior.", fx = { align = { order = 1 } } },
        { text = "Seems like a waste of good steel.", next = "BACK", reply = "Perhaps to a merchant. Not to a soldier.", fx = { align = { order = -1 } } },
      },
    },
    tauren = {
      lines = { { id = "t_default", text = "The Thunderhorn have fought beside the orcs since Thrall came to Mulgore. Where the Horde fights, my people fight too." } },
      choices = { { text = "The Horde is stronger for it. Something else.", next = "BACK" } },
    },
    xearth = {
      lines = {
        { id = "xearth_default", text = "She does not love it, but she knows it is sometimes needed to protect the herd. We fight to defend what is ours, not to take what is not." },
      },
      choices = {
        { text = "Do the orcs share that view?", next = "xorcs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorcs = {
      lines = {
        { id = "xorcs_default", text = "Some do, and the Warchief does. But some of the younger orcs still hunger for conquest, and I see it in their eyes when they come for armour." },
      },
      choices = {
        { text = "Conquest is how the Horde grows strong.", next = "BACK", reply = "So the old Horde thought, and look where that led them.", fx = { align = { light = -1 } } },
        { text = "We fight to protect, not to conquer.", next = "BACK", reply = "That is the tauren way, and I hope it becomes the Horde's way too.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrank = {
      lines = {
        { id = "xrank_default", text = "By standing in the line when others ran, in Warsong Gulch and in the Barrens. A tauren is slow to anger, but once he stands, he does not move." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xtauren = {
      lines = {
        { id = "xtauren_default", text = "And with you, young one. It is good to see a child of Mulgore among the Horde's champions. Make our people proud." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_lost = {
      lines = {
        { id = "y_lost_d", text = "My brother, Taruk, at Warsong Gulch two summers ago. He held a flag that no one else would carry. I keep his horn on my belt, and I sound it once each dawn." },
        { id = "y_lost_ta", when = { race = "Tauren" }, text = "My brother Taruk fell at Warsong Gulch, shu'halo, holding a flag. You may hear his horn on my belt at dawn. I sound it so the Earth Mother knows where he went." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_ranks = {
      lines = { { id = "y_ranks_d", text = "The ranks reward those who kill the most, and that troubles me. Taruk saved six of ours that day and killed no one. The ranks did not count him. Should they reward the killing, or the saving?" } },
      choices = {
        { text = "The saving. Protecting the herd matters most.", next = "BACK", reply = "That is the tauren way. Thank you for saying it.", fx = { align = { light = 1 } } },
        { text = "The killing. That's how wars are won.", next = "BACK", reply = "Perhaps. But wars are survived another way.", fx = { align = { light = -1 } } },
      },
    },
    y_thunderhorn = {
      lines = { { id = "y_th_d", text = "The Thunderhorn are a small tribe of Mulgore who hunted the high plains. We were slow to join Cairne, and quick to fight once we had. My father says that is how all good tribes behave." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    thrall = { { id = "tp_x_thrall", text = "A wise leader, who knows the value of peace as well as war. I am glad to serve him." } },
    warsong_gulch = { { id = "y_tp_wsg", text = "Warsong Gulch is where my brother fell. I hope you return from it." } },
    cairne = { { id = "y_tp_cairne", text = "Cairne is the strongest of us, and the kindest. Every tauren would follow him into fire." } },
    _none = { { id = "tp_none", text = "I cannot help you with that, warrior." } },
  },
}

---------------------------------------------------------------------------
-- Orgrimmar Grunt: the city guard. Light entry; World guard pool covers the rest.
---------------------------------------------------------------------------
P:NPC {
  key = "org_grunt", id = 3296, name = "Orgrimmar Grunt", gender = "male",
  role = "guard", tier = "service",
  communities = { "orgrimmar" }, temper = { "gruff" }, values = { "honor", "duty" },
  impression = {
    first = "An Orgrimmar Grunt in spiked pauldrons blocks half the path without trying, axe resting on his shoulder, watching you with flat professional interest.",
    third = "{name} spoke with a grunt of Orgrimmar.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Lok'tar, friend. The Warchief's city is glad of you." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Lok'tar. Speak your business. The Warchief's city is busy." }, { id = "g_default", text = "Lok'tar. Speak your business; the Warchief's city is busy." } },
  start = "hello",
  nodes = {
    w2ogre = {
      lines = { { id = "w2og_default", text = "Wandered in from the Barrens with a caravan, drank three barrels of grog at the inn and tried to marry the bank. Took six of us to talk him out of it, and he cried the whole way to the gate." } },
      choices = {
        { text = "Marry the bank?", next = "w2ogre2" },
        { text = "Six grunts against one ogre is fair odds.", next = "w2ogre2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w2ogre2 = {
      lines = { { id = "w2og2_default", text = "He said it was the most beautiful building he'd ever seen, and that it held all the gold, and that was what he wanted in a wife. Koma stood in the doorway the whole time telling him about Hyjal, which didn't help." } },
      choices = { { text = "Orgrimmar is never dull.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = { { id = "h_default", text = "I keep the peace in Orgrimmar, by the Warchief's order. Brawlers, thieves, and the odd drunk ogre; I've seen all of them on these streets before noon." } },
      again = { { id = "h_again", text = "Anything else? Keep it short." } },
      choices = {
        { text = "What does the Warchief ask of his grunts?", next = "thrall" },
        { text = "Where's the Valley of Strength?", next = "dir" },
        { text = "Where can I find the Warchief?", next = "xthrall" },
        { text = "Any trouble in the city lately?", next = "xtrouble" },
        { text = "I'm Forsaken. Will I be welcome here?", when = { race = "Scourge" }, next = "xforsaken" },
        { text = "How long have you been a grunt?", next = "y_long" },
        { text = "What's the worst part of the job?", next = "y_worst" },
        { text = "What's the Drag like for a grunt?", next = "y_drag" },
        { text = "What did the drunk ogre do?", next = "w2ogre" },
        { text = "For the Horde.", next = "END" },
      },
    },
    thrall = {
      lines = { { id = "t_default", text = "Discipline. Thrall broke the chains of the camps, and he won't see us become brutes again. A grunt who strikes without cause answers to his captain, and then to the Warchief." } },
      choices = {
        { text = "That discipline is what makes us strong.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "An orc needs his fury, not more rules.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dir = {
      lines = { { id = "d_default", text = "Through the main gate and you're standing in it. The bank, the auction house, and the inn are all there. Ask any grunt, we all know the way." } },
      choices = { { text = "Thanks. Something else.", next = "BACK" } },
    },
    xthrall = {
      lines = {
        { id = "xthrall_default", text = "Grommash Hold, in the Valley of Wisdom. Mind your manners in there, because the Kor'kron do not have my patience." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xtrouble = {
      lines = {
        { id = "xtrouble_default", text = "Cultists in the Cleft of Shadow, and the odd fight in the Drag when goblins cheat. Nothing a grunt cannot handle." },
      },
      choices = {
        { text = "Who's behind the cultists?", next = "xcult" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcult = {
      lines = {
        { id = "xcult_default", text = "The Burning Blade, demon worshippers who refuse to give up the old ways. The Warchief wants them rooted out, and we do it one at a time." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xforsaken = {
      lines = {
        { id = "xforsaken_default", text = "The Warchief says you are allies, so you are welcome. Keep your plagues to yourself and we will get along fine." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_long = {
      lines = {
        { id = "y_long_d", text = "Since the walls went up. Before that I fought with the Warchief at the Crossroads and in Ashenvale. I asked for city duty when my shoulder stopped healing right. No shame in it." },
        { id = "y_long_orc", when = { race = "Orc" }, text = "Since the walls went up, brother. Before that, the Crossroads and Ashenvale. My shoulder asked for city duty before I did. You know how it goes." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_worst = {
      lines = { { id = "y_worst_d", text = "Arresting orcs I fought beside. Last week I took an old comrade to the cells for beating a goblin merchant who cheated him. The goblin did cheat him. The law is the law." } },
      choices = {
        { text = "The law must hold, even for friends.", next = "BACK", reply = "Aye. That is why the Warchief trusts grunts with it.", fx = { align = { order = 1 } } },
        { text = "The goblin had it coming.", next = "BACK", reply = "Maybe. Say that to the Warchief and see what he says.", fx = { align = { order = -1 } } },
      },
    },
    y_drag = {
      lines = { { id = "y_drag_d", text = "The Drag is where the trouble lives. Goblins, tanners, cheap grog and cheaper tempers. I would rather face a centaur charge than a Drag brawl on a hot night." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    burning_blade = { { id = "tp_x_burning_blade", text = "Cultists. We find them, we kill them, and more crawl out of the Cleft." } },
    thrall = { { id = "y_tp_thrall", text = "The Warchief freed us. A grunt who forgets that has no business wearing these pauldrons." } },
    the_drag = { { id = "y_tp_drag", text = "The Drag never sleeps, and neither do the grunts who watch it." } },
    kor_kron = { { id = "y_tp_kk", text = "The Kor'kron guard the Warchief. They are chosen from the best, and they let you know it." } },
    cleft_of_shadow = { { id = "y_tp_cos", text = "The Cleft of Shadow. Warlocks live there by the Warchief's leave, and cultists hide among them. I keep my axe close." } },
    valley_of_strength = { { id = "y_tp_vos", text = "The Valley of Strength is through the gate. Bank, auction house, inn. Try not to get lost." } },
    _none = { { id = "tp_none", text = "Not my concern. Ask in the Valley of Wisdom." } } },
}
