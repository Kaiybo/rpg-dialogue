-- Rashona Straglash, Horde Cloth Quartermaster in Magar's Cloth Goods on the Drag. Voice: bibles/rashona.md
-- Brisk, practical and quietly fierce about who the cloth is for.
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "rashona", id = TODO_NPC("Rashona Straglash"), name = "Rashona Straglash", title = "Horde Cloth Quartermaster",
  bible = "bibles/rashona.md", role = "questgiver", tier = "quest",
  communities = { "orgrimmar" }, temper = { "brisk" }, values = { "practical", "generous" },
  notices = { "craft", "purse" },
  impression = {
    first = "Rashona Straglash collects cloth on the Drag for bandages and garments, and she keeps careful count of every bolt. She thinks of the wounded and the poor first and of the donors a distant second.",
    third = "{name} met Rashona Straglash, the Horde's cloth quartermaster on the Drag, who gathers cloth for bandages and for Orgrimmar's needy.",
  },

  greetings = {
    { id = "g_drag", text = "Mind the bolts on the floor, {class}. Every one of them is a bandage someday." },
    { id = "g_wool", when = { questActive = TODO_QUEST("A Donation of Wool") }, text = "Wool, is it? Set it on the table and I'll count it in front of you." },
    { id = "g_rune", when = { questDone = TODO_QUEST("A Donation of Runecloth") }, text = "Runecloth from you again, I hope. The healers never stop asking for it." },
    { id = "g_away", when = { away = 21 }, text = "You've been gone {away}, and the pile's gone down twice in that time. Bandages go fast in a city full of soldiers who think a sparring match isn't finished until somebody bleeds." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 10 }, text = "Look at you, carrying yourself like a veteran now. I hope you've been bleeding less than you used to, at least." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Folk on the Drag say you've been helping people out. I'd expect nothing less from someone who knows where the cloth goes." },
  },

  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = { name = "Tailoring", min = 150 } },
      text = "You've got a tailor's hands, I can see the calluses. You know what good cloth is worth, then." },
    { id = "n_firstaid", cat = "craft", when = { profession = { name = "First Aid", min = 150 } },
      text = "You wrap bandages yourself, don't you? Then you know exactly how much cloth a bad day eats." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Rashona Straglash, cloth quartermaster for the Horde. In the camps we bled through rags, so a simple donation of cloth goes a long way here; it makes garments and bandages, and the Horde never has enough of either." },
        { id = "h_lowlevel", when = { maxLevel = 40 }, text = "Rashona Straglash, cloth quartermaster. You're young for donating, {class}, but keep your scraps when you find them, and come back when your packs are heavy." },
        { id = "h_rune_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Donation of Runecloth"), days = 3 } },
          text = "The runecloth you brought went to the healers at the Valley of Honor this morning. They said it was the best weave they'd seen this season, and I didn't tell them where it came from, but I thought it." },
      },
      again = {
        { id = "h_again", text = "What else? I've got counting to do." },
        { id = "h_again2", text = "Go on, I'm listening while I fold." },
      },
      choices = {
        { text = "Who gets the cloth you collect?", next = "who" },
        { text = "Why not just buy cloth from the goblins?", next = "goblins" },
        { text = "What's in it for the donors?", next = "donors" },
        { text = "I'm a tailor. What do you need most?", next = "tailor", when = { profession = "Tailoring" } },
        { text = "I have cloth to give.", next = "BUSINESS" },
        { text = "For the Horde.", next = "END" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "Bandages go to the healers and the barracks, and garments go to whoever needs them most. There are orcs in this city who came out of the internment camps with nothing, and trolls who left the isles with less, and winter on the Drag is colder than people think." } },
      choices = {
        { text = "The camps? People still need help from that?", next = "camps" },
        { text = "Something else, Rashona.", next = "BACK" },
      },
    },
    camps = {
      lines = { { id = "c_default", text = "Some of them came out of those camps young and never learned a trade, so they've got their freedom and not much else. The Warchief freed them, and the rest is up to the rest of us." } },
      choices = {
        { text = "Then I'll give what I can.", next = "camps_end" },
        { text = "Shouldn't they learn to provide for themselves?", next = "camps_end" },
      },
    },
    camps_end = {
      big = true,
      lines = { { id = "ce_default", text = "They will, in time, and plenty already have. But you don't teach a cold orc to sew by leaving him cold, so I give him a shirt first and a needle second." } },
      choices = {
        { text = "A shirt first. That's the right order.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Charity makes people soft. A needle first.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    goblins = {
      lines = { { id = "g_default", text = "Because the goblins sell it at goblin prices, {class}, and the Horde's purse isn't bottomless. Every bolt you donate is a bolt the quartermasters don't have to haggle for." } },
      choices = { { text = "Goblin prices. Say no more. Something else.", next = "BACK", fx = { learn = { "steamwheedle" } } } },
    },
    donors = {
      lines = { { id = "d_default", text = "Recognition, mostly, and I make sure the city knows whose cloth it was. Orgrimmar remembers the ones who gave, and it remembers the ones who could have and didn't." } },
      choices = {
        { text = "I'd give without anyone knowing.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If I give, I want it known.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tailor = {
      lines = { { id = "ta_default", text = "Runecloth, always runecloth, because it holds a bandage tight and doesn't fray in the heat. But a tailor knows the scraps matter too, so don't throw away your wool just because you've moved on to finer things." } },
      choices = { { text = "I'll save my scraps for you.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I sew, I count, and I make sure the cloth goes where the Horde bleeds. That's all the story there is, and it's enough." } },
    advice = { { id = "tp_ad", text = "Carry spare bandages. The grunt bleeding next to you will never have brought his own." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, grunt. Ask me about cloth and I'll talk your ear off." } },
  },
}
