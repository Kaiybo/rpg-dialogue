-- Verna Furlbrow, by the broken wagon at the Jansen Stead. Voice: bibles/verna.md
-- Practical, warm, and devoted to one exhausted horse.
local P = RPGDialogueAPI:Pack("rpgd.westfall")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "verna", id = TODO_NPC("Verna Furlbrow"), name = "Verna Furlbrow",
  bible = "bibles/verna.md", role = "farmer", tier = "quest",
  communities = { "westfall_farms" }, temper = { "steady" }, values = { "kind", "honest" },
  notices = { "animal", "craft" },
  impression = {
    first = "Verna Furlbrow holds her family together with kind words and a wagon held up by string and prayer. She worries more for their tired horse Blanchy than for herself.",
    third = "{name} met Verna Furlbrow, who cares for her husband and their weary horse Blanchy beside a broken wagon.",
  },

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
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every morning, and I'll not pretend otherwise. But if a warrior could take it back from the thieves, I'd want to go home, and Theodore would want to go home, and Blanchy would want her stall back." } },
      choices = {
        { text = "I'll help you take your farm back.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The farm's gone, Verna. Make a home here.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "That's sweet of you, though Theodore will grumble that he's watching it himself, and he'll be asleep before the moon's up. If you sit out there in the dark, mind Blanchy, because she'll kick at anything she can't see." } },
      choices = {
        { text = "I'll guard your family, Verna. You have my word.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If anyone comes, they won't be leaving.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Is there anything else you need?", next = "BACK" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Oh, she'd like that, she's been shivering since the fog came off the sea. Only go gently, because she's old and frightened of sparks, the poor dear." } },
      choices = {
        { text = "Gently, then. Slow and steady.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A little fire never hurt a horse.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "How is Blanchy holding up?", next = "blanchy" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "Bless you, if you think there is any to find. The verges have been picked clean by everyone fleeing the farms, and the Defias take the rest. If you know a root that will stretch a stew, I will gladly learn it." } },
      choices = {
        { text = "Thank you. Let me ask something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "By counting what's left, dear, which is Theodore and Blanchy and a good stew. The Light didn't take our farm, the thieves did, and I'll not blame the one for what the other did." } },
      choices = {
        { text = "That's wise faith, Verna. Hold on to it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Your Light let it happen. I'd blame it a little.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Verna.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Oh, you're sweet to say it, but there's a dozen of them in our house and only one of you. If you do go up there, mind you bring out Theodore's pocket watch first, because he'd sooner have that than the walls." } },
      choices = {
        { text = "I'll bring back what's yours, Verna. That's a promise.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Some things are better left lost, Verna.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Verna.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_druidx", when = { class = "DRUID" },
          text = "Well, aren't you a tall one, and smelling of moss besides. Sit down if you like; the stew's nearly done." },
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
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and a weary one, I'd guess. Sit and eat; the stew's for anyone, and you look like you've earned it." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Sit down, dear, because I've been saying prayers for Blanchy and I'm not sure I'm saying them right." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Theodore will stand up straighter just looking at you, bless him." },
      },
      again = {
        { id = "h_again", text = "Anything else, dear?" },
        { id = "h_again2", text = "Go on. Blanchy's not going anywhere, and neither am I." },
      },
      choices = {
        { text = "You have been on this road a long while. Shall I find you forage?", next = "druid_talk", when = { class = "DRUID" } },
        { text = "Tell me about Blanchy.", next = "blanchy" },
        { text = "You look tired, Verna.", next = "luck" },
        { text = "Salma says the stew's your recipe.", next = "stew" },
        { text = "How's Theodore holding up?", next = "theodore" },
        { text = "I know animals. Let me look at her.", next = "blanchy_look", when = { class = { "HUNTER", "DRUID" } } },
        { text = "Shall I say a prayer for Blanchy?", next = "pray", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Can I help?", next = "BUSINESS" },
        { text = "I'll watch your wagon tonight. Nobody will see me.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "I could warm Blanchy with a little spell.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Do you miss the farm, Verna?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "How do you keep your faith, Verna, after losing so much?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Shall I take your farm back from the thieves, Verna?", next = "xapala", when = { class = "PALADIN" } },
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
        { text = "Luck like that doesn't turn. Get to Elwynn quickly.", next = "BACK", fx = { align = { light = -1 } } },
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
        { text = "Perhaps oats would serve her better.", next = "BACK", fx = { align = { light = -1 }, trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "You hear all sorts when you're stuck by the road waiting on a wagon wheel, dear. Ask me about any of this." },
    },
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
