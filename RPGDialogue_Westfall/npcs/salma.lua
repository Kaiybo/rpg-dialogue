-- Salma Saldean, Saldean's Farm. Voice: bibles/salma.md
-- Feeds anyone who needs a meal and someone to listen.
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "salma", id = TODO_NPC("Salma Saldean"), name = "Salma Saldean",
  bible = "bibles/salma.md", role = "farmer", tier = "quest",
  communities = { "westfall_farms" }, temper = { "steady" }, values = { "kind", "generous" },
  notices = { "hunger", "craft" },

  greetings = {
    { id = "g_welcome", text = "Come in, come in! There's always a pot on." },
    { id = "g_stew", when = { questActive = TODO_QUEST("Westfall Stew") }, text = "Here on stew business? Good, because the pot's getting impatient." },
    { id = "g_after", when = { questDone = TODO_QUEST("Westfall Stew") }, text = "There's my stew-gatherer! Sit down and eat something, you're far too thin." },
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
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Salma. My husband farms and I cook, and anyone who comes to that door hungry leaves full. That's the rule of this house." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Westfall Stew") },
          text = "In the lean years, Westfall cooks made do with murloc eyes and buzzard meat, and these are lean years, so don't make that face." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Westfall Stew") },
          text = "Whatever the list says, bring it. Murloc eyes are better than they sound. Most things are, in a stew." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Westfall Stew"), days = 3 } },
          text = "Three pots were gone by sundown, and half the hill came down for it. One of them cried into his bowl, and I didn't ask why." },
        { id = "h_pie", when = { questActive = TODO_QUEST("Goretusk Liver Pie") },
          text = "Goretusk liver, and fresh, mind you. A pie's only as good as what's in it, and that's a fact Verna will argue with." },
        { id = "h_furlbrows", when = { topicKnown = "old_blanchy" },
          text = "Verna and Theodore are up at the old Jansen place, poor dears, since their wagon broke. Theodore's pride broke worse than the wheel did." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "You're thin as a rake, even for an elf, so sit down. Sky or no sky, everyone eats at my table." },
        { id = "h_thin", when = { metBefore = true }, text = "Sit down, sit, you're thinner than last time. Everyone's thinner in Westfall these days, and I won't have it at my table." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Himself's asleep in the chair again, snoring like a harvest golem. Don't you dare tell him I said so." },
      },
      again = {
        { id = "h_again", text = "What else, then? Sit yourself down and ask while I stir." },
        { id = "h_again2", text = "Anything more? The pot won't mind waiting, or not much." },
      },
      choices = {
        { text = "What's cooking?", next = "pot" },
        { text = "How do you keep going out here?", next = "going" },
        { text = "Do you need help around the farm?", next = "help" },
        { text = "Tell me about the Furlbrows.", next = "furlbrows" },
        { text = "You do a priest's work with that ladle.", next = "priest", when = { class = "PRIEST" } },
        { text = "Any tricks for a fellow cook?", next = "cook", when = { profession = "Cooking" } },
        { text = "I'd best be off.", next = "END" },
      },
    },
    pot = {
      lines = {
        { id = "p_default", text = "Whatever Westfall gives me. Today it gave me a buzzard and some regret. It'll be lovely." },
      },
      choices = {
        { text = "Smells wonderful.", next = "BACK", fx = { affinity = 1 } },
        { text = "Buzzard?", next = "vulture", fx = { trait = { witty = 1 } } },
        { text = "What goes in Westfall stew?", next = "recipe" },
      },
    },
    vulture = {
      lines = { { id = "v_default", text = "Buzzard. They eat well out here, which is more than I can say for the people." } },
      choices = { { text = "Fair point. Something else.", next = "BACK" } },
    },
    recipe = {
      lines = { { id = "re_default", text = "Vulture, goretusk snout, murloc eyes, and okra to thicken the broth. It's Verna's recipe, and she wrote it out for me herself, so don't tell her I add salt." } },
      choices = {
        { text = "Verna's? I thought it was yours.", next = "recipe_verna" },
        { text = "Something else.", next = "BACK" },
      },
    },
    recipe_verna = {
      lines = { { id = "rv_default", text = "Hers, start to finish. She wanted it to stay in Westfall when they go. Born for the city, that one, whatever she tells you. It'll be the making of her." } },
      choices = {
        { text = "Verna says she never wanted to leave.", next = "BACK", fx = { trait = { curious = 1 } } },
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
        { text = "That's a fine way to live.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Feeding thieves only teaches them where the food is.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "It won't stop the Defias.", next = "defias", fx = { trait = { stern = 1 } } },
      },
    },
    defias = {
      lines = { { id = "d_default", text = "No, that's Gryan's work. Mine is making sure there's someone left to thank him." } },
      choices = {
        { text = "They say you've fed Defias at this door.", next = "fed" },
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
    fed = {
      big = true,
      lines = { { id = "fe_default", text = "I have. A hungry boy in a red mask is still a hungry boy, and he said thank you, and he's left my hens alone ever since. That's a kind of peace." } },
      choices = {
        { text = "That's real kindness.", next = "BACK", fx = { affinity = 2, align = { light = 2 }, trait = { kind = 1 } } },
        { text = "He'll rob someone else tomorrow.", next = "BACK", fx = { align = { light = -1 }, affinity = -1, trait = { stern = 1 }, opinion = { defias = "hardline" } } },
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
      lines = { { id = "fu_default", text = "Verna's my dearest friend out here. Theodore's a good man who lost his nerve with his farm. They'll be off to Elwynn the minute that wagon rolls." } },
      choices = {
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
        { text = "Gladly. Light bless this house and all it feeds.", next = "BACK", fx = { affinity = 3, align = { light = 1 }, standing = { westfall_farms = 1 } } },
        { text = "I'd rather not bless a soup pot, Salma.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Do you ever get to a church?", next = "priest_church" },
      },
    },
    priest_church = {
      lines = { { id = "pc_default", text = "Not since the roads went bad, so I pray at the stove. The Light knows where to find me; it's always warm here." } },
      choices = {
        { text = "It does, and the Light always finds the warm places first.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Warm or not, I doubt the Light looks in kitchens.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A farmer's wife with a big pot and a long table. That's all anyone needs to know about me." } },
    advice = { { id = "tp_ad", text = "Eat before you fight, not after. And never trust a cook who won't taste her own stew." } },
    trade = { { id = "tp_tr", text = "Cooking for whoever comes. Pay me in boar livers and stories.", next = "help" } },
    defias = { { id = "tp_defias", text = "Some of them have come to my door, you know, hungry, and I fed them. I'd do it again." } },
    people_militia = { { id = "tp_militia", text = "Good boys and girls, every one, and every one of them hungry. I see to that." } },
    westfall = { { id = "tp_westfall", text = "It'll come back. Land always comes back if there's people who love it." } },
    old_blanchy = { { id = "tp_blanchy", text = "That horse has more years than sense. Verna loves her like a daughter." } },
    _none = { { id = "tp_none", text = "Oh, I wouldn't know about that. More stew?" } },
  },
}
