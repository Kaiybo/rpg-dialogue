-- Verna Furlbrow, by the broken wagon at the Jansen Stead. Voice: bibles/verna.md
-- Practical, warm, and devoted to one exhausted horse.
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "verna", id = TODO_NPC("Verna Furlbrow"), name = "Verna Furlbrow",
  bible = "bibles/verna.md", role = "farmer", tier = "quest",
  communities = { "westfall_farms" }, temper = { "steady" }, values = { "kind", "honest" },
  notices = { "animal", "craft" },

  greetings = {
    { id = "g_wagon", text = "Careful round the wagon, dear. It's held up with string and prayer." },
    { id = "g_oats", when = { questActive = TODO_QUEST("Poor Old Blanchy") }, text = "Any oats? She's been looking at me like I've forgotten her." },
    { id = "g_after", when = { questDone = TODO_QUEST("Poor Old Blanchy") }, text = "Blanchy's put on a little weight, thanks to you. Don't tell her I said." },
  },

  notice = {
    { id = "n_pet", cat = "animal", when = { pet = { type = "Beast" } },
      text = "Oh, what a sweet thing. Is {pet} eating properly? Animals out here go thin so fast." },
    { id = "n_horse", cat = "animal", when = { mounted = true },
      text = "Get down and let that poor creature breathe a minute. Blanchy, look, company." },
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You cook? Then you'll know a goretusk liver's no good past a day. Folk never believe me." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Verna Furlbrow. That's Theodore on the porch, pretending he isn't worried, and that's Blanchy, who's the only one of us honest about being tired." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Poor Old Blanchy") },
          text = "I fed her before we left the farm. Then the wagon broke, and we've been here since, and she's eaten everything that's grass, so now she needs oats." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Poor Old Blanchy") },
          text = "There are sacks of oats lying about the old farms. The thieves don't bother with them. Bring me a few handfuls, dear." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Poor Old Blanchy"), days = 3 } },
          text = "Look at her eat! That's the first time she's lifted her head properly in a week. Thank you, truly." },
        { id = "h_stew", when = { questActive = TODO_QUEST("Westfall Stew") },
          text = "Stew for Salma, is it? Good, because that woman could feed an army on a turnip, and some days she has to." },
        { id = "h_pie_done", when = { questDone = TODO_QUEST("Goretusk Liver Pie") },
          text = "So there was pie after all, and good. Whoever made it, don't tell the other one it was better; that's how friendships last out here." },
        { id = "h_pie", when = { metBefore = true }, text = "I made a pumpkin pie from memory last night, dear, with no pumpkins in it at all, just the memory. Theodore ate two slices anyway, bless him." },
      },
      again = {
        { id = "h_again", text = "Anything else, dear?" },
        { id = "h_again2", text = "Go on. Blanchy's not going anywhere, and neither am I." },
      },
      choices = {
        { text = "Tell me about Blanchy.", next = "blanchy" },
        { text = "You look tired, Verna.", next = "luck" },
        { text = "Salma says the stew's your recipe.", next = "stew" },
        { text = "How's Theodore holding up?", next = "theodore" },
        { text = "I know animals. Let me look at her.", next = "blanchy_look", when = { class = { "HUNTER", "DRUID" } } },
        { text = "Shall I say a prayer for Blanchy?", next = "pray", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Can I help?", next = "BUSINESS" },
        { text = "Goodbye, Verna.", next = "END" },
      },
    },
    blanchy = {
      lines = {
        { id = "b_default", key = true, text = "She's pulled our cart since Theodore had all his hair. She's slow and stubborn and the best thing on four legs in Westfall." },
      },
      choices = {
        { text = "She's lucky to have you.", next = "BACK", fx = { affinity = 2, learn = { "old_blanchy" }, trait = { kind = 1 } } },
        { text = "Maybe it's time to let her rest.", next = "rest", fx = { learn = { "old_blanchy" } } },
      },
    },
    rest = {
      lines = { { id = "r_default", text = "She'll rest when we're home. All three of us will." } },
      choices = { { text = "I hope that's soon.", next = "BACK", fx = { affinity = 1 } } },
    },
    luck = {
      lines = { { id = "lu_default", text = "Bad luck follows us like a stray dog, dear. First the farm, then the wagon. I keep waiting to find out what's third." } },
      choices = {
        { text = "What will you do in Elwynn?", next = "elwynn" },
        { text = "Maybe your luck's turning.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
      },
    },
    elwynn = {
      big = true,
      lines = { { id = "el_default", text = "Start over, Theodore says. As if a farm were a coat you could take off. Elwynn isn't what I want, dear. It's what's left." } },
      choices = {
        { text = "Salma thinks you'll love the city.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Then don't give up on the farm.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
      },
    },
    stew = {
      lines = { { id = "st_default", text = "It's mine, whatever she tells you! I wrote it out so it wouldn't leave Westfall with us, because a recipe belongs where its ingredients are." } },
      choices = {
        { text = "Murloc eyes, though?", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Do you two always argue about food?", next = "bicker" },
      },
    },
    bicker = {
      lines = { { id = "bi_default", text = "As long as I've known her, dear. We'd neither of us know what to do without it. Don't let her win the pie argument." } },
      choices = { { text = "I'll stay out of it.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } } },
    },
    theodore = {
      lines = { { id = "th_default", text = "He's ashamed, and he's frightened, and he's sure the one makes the other worse. Be gentle with him, dear; he was brave once, and he'll remember how." } },
      choices = {
        { text = "Brave once? When?", next = "theodore_brave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    theodore_brave = {
      big = true,
      lines = { { id = "tb_default", text = "The night they came, he had me out the back door before he'd his own boots on. He's forgotten that part, but I haven't." } },
      choices = {
        { text = "You should tell him.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    blanchy_look = {
      lines = { { id = "bl_default", text = "Would you? She's not lame, I think, just worn to the bone, so mind her back legs." } },
      choices = {
        { text = "She's old and tired, nothing worse. Oats will help.", next = "BACK", fx = { affinity = 2, learn = { "old_blanchy" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pray = {
      lines = { { id = "pr_default", text = "For a horse? Oh, dear, yes, please do. She's carried us this far, and she's earned a prayer more than most people I know." } },
      choices = {
        { text = "Light keep you, Blanchy.", next = "BACK", fx = { affinity = 3, align = { light = 1 }, learn = { "old_blanchy" } } },
        { text = "Perhaps oats would serve her better.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A pumpkin farmer's wife, a horse's nursemaid, and the one in this family who remembers where things are." } },
    advice = { { id = "tp_ad", text = "Feed the animal first, dear, because it can't ask and you can." } },
    old_blanchy = {
      { id = "tp_blanchy", text = "She's over by the wagon, dear, but mind her back legs. She kicks when she's hungry, and she's always hungry." },
      { id = "tp_blanchy2", text = "My Blanchy? Ask away, dear.", next = "blanchy" },
    },
    defias = { { id = "tp_defias", text = "They took our farm and Theodore's nerve. I've decided they'll not have mine." } },
    harvest_watchers = { { id = "tp_watchers", text = "Nasty things, and they're stuffed with oats, you know. It's a waste of good oats." } },
    westfall = { { id = "tp_westfall", text = "It's home, dear, even now. Especially now." } },
    _none = { { id = "tp_none", text = "Couldn't say, dear. Ask Salma; she hears everything over that stove." } },
  },
}
