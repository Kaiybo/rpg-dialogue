-- Quinn Yorick, wounded upstairs in a farmhouse at the Ivar Patch. Voice: bibles/quinn.md
-- Rane's brother: laid up, dry as dust, and politely doubtful of every potion he's handed.
local P = RPGDialogueAPI:Pack("rpgd.silverpine")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "quinn", id = TODO_NPC("Quinn Yorick"), name = "Quinn Yorick",
  bible = "bibles/quinn.md", role = "soldier", tier = "quest",
  communities = { "sepulcher" }, temper = { "dry" }, values = { "loyal", "skeptical" },
  notices = { "wounds", "class" },
  impression = {
    first = "Quinn Yorick lies wounded in a ghoul-haunted farmhouse and jokes about it as if he'd only twisted an ankle. He doubts the apothecary's cures, trusts his sister completely, and is bored nearly to a second death.",
    third = "{name} met Quinn Yorick, a wounded deathstalker and Rane Yorick's brother, laid up at the Ivar Patch.",
  },

  greetings = {
    { id = "g_bed", text = "Forgive me if I don't get up. Ivar left me with fewer working parts than I started with." },
    { id = "g_back", when = { metBefore = true }, text = "Oh. You're back? Good, because the ceiling and I ran out of things to say to each other." },
    { id = "g_potion", when = { questActive = TODO_QUEST("Return to Quinn") }, text = "Rane said someone was coming with a potion. If it has hearts in it, please don't tell me which kind." },
    { id = "g_eyes", when = { questActive = TODO_QUEST("Wild Eyes") }, text = "Murloc eyes, along the lakeshore. Renferrel will grumble, but he'll grumble with something new to try." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and I've moved exactly once in that time, to throw a boot at a ghoul. I missed." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown up since you brought me that potion. I'd say I'm proud, but I've no right to it; I've spent the whole time lying down." },
  },

  notice = {
    { id = "n_wounds", cat = "wounds", when = { resSick = true },
      text = "You've died recently, I can see it on you. Lie down a moment, it's very restful, take it from an expert." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest! I don't suppose the Light does anything for us these days, but if your shadow can knit a leg, I'm not proud." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Quinn Yorick, deathstalker, currently a deathstalker who can't stalk anything. Ivar the Foul and his farmhands caught me in the yard, and I crawled up here to wait for Rane." },
        { id = "h_drank", tags = { "news" }, when = { questRecent = { TODO_QUEST("Return to Quinn"), days = 2 } },
          text = "I can feel the potion working, or I can feel something, at least. I'll soon be able to travel, and I'm told that's progress." },
        { id = "h_wild", when = { questDone = TODO_QUEST("Return to Quinn"), questBefore = TODO_QUEST("Wild Eyes") },
          text = "I wouldn't dare question Renferrel's formulae, but I'd be lying if I said that potion did very much. He's obsessed with hearts lately, and I think murlocs might offer him a fresh perspective, since they have eyes." },
        { id = "h_again_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Return to Quinn (Again)"), days = 3 } },
          text = "That one worked, and I don't care what was in it. I can stand, and I can almost walk, and Ivar had better start worrying." },
        { id = "h_ivar_done", tags = { "news" }, when = { questDone = TODO_QUEST("Ivar the Foul") },
          text = "Rane told me about Ivar. I'd hoped to do it myself, but I'll admit I sleep better knowing his head is somewhere other than on his shoulders." },
        { id = "h_rogue", when = { class = "ROGUE", race = "Scourge" },
          text = "A fellow deathstalker, or near enough. Take a lesson from me, and never cross a farmyard in daylight because you're in a hurry." },
      },
      again = {
        { id = "h_again", text = "What else? I'm not going anywhere, which you'll have gathered." },
        { id = "h_again2", text = "Please, go on. Talking is the only exercise I'm allowed." },
      },
      choices = {
        { text = "What happened with Ivar?", next = "ivar" },
        { text = "You don't seem to trust Renferrel's potions.", next = "renferrel", when = { questDone = TODO_QUEST("Return to Quinn") } },
        { text = "Who is Rane?", next = "rane" },
        { text = "Let me look at that wound.", next = "wound", when = { class = { "PRIEST", "SHAMAN", "DRUID", "PALADIN" } } },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "Rest well, Quinn.", next = "END" },
      },
    },

    ivar = {
      lines = { { id = "iv_default", text = "Ivar owned this farm before the plague, and when it took him, it took his family and his farmhands too. They still work the patch, after a fashion, and they didn't like a stranger in their yard." } },
      choices = {
        { text = "So they're still working the farm.", next = "ivar_farm" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ivar_farm = {
      lines = { { id = "if_default", text = "Shambling up and down the rows, hoeing nothing, and eating anything that wanders in. It would be funny if one of them hadn't bitten through my leg." } },
      choices = {
        { text = "Is there anything of Ivar left in there?", next = "ivar_left" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ivar_left = {
      big = true,
      lines = { { id = "il_default", text = "Enough to know it's his farm, and not enough to know he's dead. Some nights I wonder how close I came to the same, and then I stop wondering, because it doesn't help my leg." } },
      choices = {
        { text = "He deserves to be put to rest, not hunted.", next = "BACK", reply = "Put to rest, yes, that's the kinder word for it. I'd like to think someone would do the same for me.", fx = { align = { light = 1 } } },
        { text = "He's a ghoul. Hunt him and be done.", next = "BACK", reply = "Hunt him, then, and don't tell me how it went. I knew him when he still had a face.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    renferrel = {
      lines = { { id = "re_default", text = "I trust that he means well, and that his potions are very interesting to him. Whether they're interesting to my leg is another question." } },
      choices = {
        { text = "Why does he keep using hearts?", next = "renferrel_hearts" },
        { text = "Something else.", next = "BACK" },
      },
    },
    renferrel_hearts = {
      lines = { { id = "rh_default", text = "You'd have to ask him, and I'd advise against it unless you've an hour spare. If my choice is a second death or Renferrel killing me for doubting him, I know which one I'd pick." } },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "He's trying to help you, Quinn.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },

    rane = {
      lines = { { id = "ra_default", text = "Rane's the clever one, and the patient one, and the one who isn't lying in a farmhouse with a chewed leg. She sent you, I expect, and she'll pretend she wasn't worried." } },
      choices = {
        { text = "She was worried. She hid it well.", next = "rane_worry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rane_worry = {
      lines = { { id = "rw_default", text = "She always does. We woke up in the same field, the two of us, and she took my hand before either of us knew our own names, and she's been minding me ever since." } },
      choices = {
        { text = "Then mind her back, once you're up.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    wound = {
      lines = {
        { id = "wo_default", text = "If you must, but it's not a pretty sight, even for a dead man. The bite went to the bone, and the bone's been complaining ever since." },
        { id = "wo_priest", when = { class = "PRIEST", race = "Scourge" }, text = "One of the Forgotten Shadow? Then you'll know what our flesh does and doesn't like. Go gently, and if it falls off, we'll both pretend it didn't." },
      },
      choices = {
        { text = "It's clean. It will hold until the potion works.", next = "BACK", fx = { affinity = 2 } },
        { text = "It's ugly, Quinn. Stay off it.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Deathstalker, Rane's brother, and lately a piece of furniture. That's about the shape of it." } },
    advice = { { id = "tp_ad", text = "Never cross a farmyard in daylight because you're in a hurry. It's the only advice I'm qualified to give." } },
    forsaken = { { id = "tp_forsaken", text = "I'm Forsaken, and I'm stuck in a farmhouse with a bad leg and a ghoul for a neighbor. The Dark Lady doesn't come to visit much, but my sister does, and that's worth more." } },
    scourge = { { id = "tp_scourge", text = "The Scourge's ghouls are thick around here, and they're not much for conversation. I keep telling them so, but they never listen." } },
    shadowfang = { { id = "tp_shadowfang", text = "I've heard the worgen howling from Shadowfang Keep since I got here. My sister says I shouldn't listen, but what else am I meant to do in this bed?" } },
    _none = { { id = "tp_none", text = "Ask Rane. She knows everything, and I just lie here and agree with her, which saves my stitches the strain." } },
  },
}
