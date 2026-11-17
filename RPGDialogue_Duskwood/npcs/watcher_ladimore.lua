-- Watcher Sarah Ladimore, of the Night Watch in Darkshire. Voice: bibles/watcher_ladimore.md
-- Morgan Ladimore's daughter, the only one of her family who lived. Serves the Watch that hunts what he became.
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "watcher_ladimore", id = TODO_NPC("Watcher Ladimore"), name = "Watcher Ladimore",
  title = "The Night Watch",
  bible = "bibles/watcher_ladimore.md", role = "soldier", tier = "quest",
  communities = { "darkshire" }, temper = { "steady" }, values = { "duty", "honest" },
  notices = { "paladin", "grief" },

  impression = {
    first = "Watcher Sarah Ladimore stands her post in Darkshire knowing that the thing her comrades fear most once tucked her into bed. She carries it more quietly than I could.",
    third = "{name} met Watcher Sarah Ladimore of the Night Watch, daughter of Morgan Ladimore and the only one of her family who survived him.",
  },

  greetings = {
    { id = "g_post", text = "Night Watch. Keep to the lit streets, and you'll be fine." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Stay safe out there; the woods are worse than they look." },
    { id = "g_ring", when = { questActive = TODO_QUEST("A Daughter's Love") }, text = "Please take it to him. I've wanted to for years, and I never could." },
    { id = "g_after", when = { questDone = TODO_QUEST("A Daughter's Love") }, text = "I sleep a little better now. I didn't think I would." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}. I'm glad you came back from wherever it was; not everyone does." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown stronger since we first spoke. Duskwood does that, or it does the other thing." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The Watch speaks well of you. Most outsiders don't stay long enough for that." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Somebody in town has a quarrel with you. Darkshire is small, and the dark is big, so we can't afford quarrels." },
  },

  notice = {
    { id = "n_paladin", cat = "paladin", when = { class = "PALADIN" },
      text = "A paladin. My father carried the Light once, before. Forgive me if I stare." },
    { id = "n_grief", cat = "grief", when = { deaths = { min = 15 } },
      text = "You've died out there more than once, haven't you? I can see it. Be careful near Raven Hill; the dead there don't always stay put." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Watcher Ladimore. Sarah, if you'd rather, though most people here don't use it, because of the name that comes after." },
        { id = "h_before", when = { questBefore = TODO_QUEST("The Daughter Who Lived") },
          text = "If you've heard my family's name in this town, you've heard the worst of it. I'd rather not talk about him unless you've a reason." },
        { id = "h_lived", tags = { "news" }, when = { questActive = TODO_QUEST("The Daughter Who Lived") },
          text = "Yes? My father... the Commander sent you, then. I wish there was something I could have done for him, if only I'd talked to him before he..." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("A Daughter's Love") },
          text = "Lay the ring on his grave, past the house on the hill. Maybe he'll know that I'm all right, and that none of us hold him responsible." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Daughter's Love"), days = 3 } },
          text = "You heard him say my name? Then he knows, and he can rest, and I can't thank you properly for that." },
        { id = "h_killed", when = { questDone = TODO_QUEST("Mor'Ladim"), questBefore = TODO_QUEST("The Daughter Who Lived") },
          text = "You're the one who put him down. I don't know whether to thank you or hate you, so I'll do neither for now." },
      },
      again = {
        { id = "h_again", text = "Something else? I'm on watch till dawn." },
        { id = "h_again2", text = "Go on. Talking helps the hours pass." },
      },
      choices = {
        { text = "What happened to your father?", next = "father" },
        { text = "Why join the Watch that hunts him?", next = "watch" },
        { text = "What's it like, keeping the Watch?", next = "duty" },
        { text = "He spoke your name at the grave.", next = "grave", when = { questDone = TODO_QUEST("A Daughter's Love") } },
        { text = "Can I help?", next = "BUSINESS" },
        { text = "Stay safe, Sarah.", next = "END" },
      },
    },
    father = {
      lines = { { id = "f_default", text = "He came home from the war a hero, and he wasn't himself, and one night it all went wrong. I was the only one of us who lived, and I've stopped asking why." },
      },
      choices = {
        { text = "Do you blame him?", next = "father_blame" },
        { text = "You don't have to say more.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    father_blame = {
      lines = { { id = "fb_default", text = "I did, for years. Then I joined the Watch and saw what these woods do to people, and I started to wonder how much of him was left that night." },
      },
      choices = {
        { text = "Some darkness out here takes people.", next = "father_dark" },
        { text = "Something else.", next = "BACK" },
      },
    },
    father_dark = {
      big = true,
      lines = { { id = "fd_default", text = "Some do say so, and Sirra has his books full of theories. But a man still swung the sword, and I can't decide whether to forgive the man or the darkness." },
      },
      choices = {
        { text = "Forgive him. The darkness did this, not your father.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "He chose. Don't excuse him because it's easier.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "That's yours to decide, not mine.", next = "BACK" },
      },
    },
    watch = {
      lines = { { id = "w_default", text = "Because somebody had to keep the town safe from what he became, and I'd rather it was someone who remembered him as he was. The Commander understood that." },
      },
      choices = {
        { text = "Commander Ebonlocke took you in?", next = "watch_althea" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch_althea = {
      lines = { { id = "wa_default", text = "She gave me a post and never once asked if I could handle it, which is the kindest thing anyone's done for me. She'd deny that, so don't tell her I said it." },
      },
      choices = { { text = "I won't. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    duty = {
      lines = { { id = "d_default", text = "Long nights and short sleeps, and too few of us for the woods. We walk the roads, we count who comes back, and we light the lamps again when something blows them out." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    grave = {
      lines = { { id = "g_default", text = "He said my name. All these years I thought he'd want to forget it, and he said it like he was glad." },
      },
      choices = {
        { text = "He was. He's at peace now.", next = "BACK", fx = { affinity = 2 } },
        { text = "I'll leave you with that.", next = "END" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A watcher of Darkshire, and the daughter who lived. People here use the second more than the first." } },
    advice = { { id = "tp_ad", text = "Talk to the people you love while you can. I didn't, and I've had years to regret it." } },
    ladimore = {
      { id = "tp_ladimore", text = "Morgan Ladimore was my father, before he was anything else.", next = "father" },
      { id = "tp_ladimore2", text = "You'll hear a dozen tellings of it in this town. Mine's the shortest, and I'll keep it that way." },
    },
    _none = { { id = "tp_none", text = "I couldn't say. Ask the Commander, or Sirra, if you can stand a long answer." } },
    raven_hill = { { id = "tp_raven_hill", text = "My father's grave is at Raven Hill, and I visit when the dead are quiet, which isn't often. I talk to him there, which I should have done more when he was alive." } },
    holy_light = { { id = "tp_holy_light", text = "My father kept the Light all his life, through the war and after, and I still keep his prayer book by my bed. I'm trying to believe enough for both of us now." } },
    dark_riders = { { id = "tp_dark_riders", text = "My watch hears word of them on the roads, and I report it, and nothing changes. I'll keep reporting until something does." } },
  },
}
