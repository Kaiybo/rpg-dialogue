-- The rest of the Stonefield farm, and the Maclure boy across the field.
-- Voices: bibles/bernice.md, bibles/ma_stonefield.md, bibles/billy.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- "Auntie" Bernice Stonefield: a lost necklace, a suspected Maclure, and a pie she resents baking.
P:NPC {
  key = "bernice", id = TODO_NPC("\"Auntie\" Bernice Stonefield"), name = "\"Auntie\" Bernice Stonefield",
  bible = "bibles/bernice.md", role = "questgiver", tier = "quest",
  communities = { "goldshire" }, temper = { "proud" }, values = { "honest", "stern" },
  notices = { "craft" },

  greetings = {
    { id = "g_pie", text = "Mind the sill, there's pies cooling. Hands off." },
    { id = "g_necklace", when = { questActive = TODO_QUEST("Lost Necklace") }, text = "Well? Did that Maclure boy confess?" },
    { id = "g_after", when = { questDone = TODO_QUEST("Goldtooth") }, text = "My necklace, safe round my neck where it belongs. You're welcome in this kitchen any time." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Then you know a pork belly pie wants patience and good boar. Most folk rush the crust. Don't rush the crust." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Bernice Stonefield. Everyone calls me Auntie, whether they're kin or not. I bake, I mend, and I keep an eye on that vineyard." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Lost Necklace") },
          text = "My necklace is gone. And the Maclure boy's been hanging round the fence all week. You do the arithmetic." },
        { id = "h_pie", tags = { "news" }, when = { questActive = TODO_QUEST("Pie for Billy") },
          text = "He wants a pie. The thief wants a pie, before he'll talk. Fine. Bring me good boar meat and I'll bake it. I'll hate every minute." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("Goldtooth"), days = 3 } },
          text = "So the boy didn't take it. Hm. I suppose I'll have to bake him another pie. An apology pie. Don't tell Ma." },
      },
      choices = {
        { text = "What about the Maclures?", next = "maclures" },
        { text = "I'll leave you to your baking.", next = "END" },
      },
    },
    maclures = {
      lines = { { id = "m_default", text = "We don't speak to them. They don't speak to us. It's worked for years. Ask Gramma if you want a sermon on it." } },
      choices = { { text = "Gramma doesn't seem to agree.", next = "END", fx = { trait = { witty = 1 }, learn = { "maybell_tommy" } } } },
    },
  },

  topics = {
    maybell_tommy = { { id = "tp_lovers", text = "What about them? Nothing about them. Why? What have you heard?" } },
    kobolds = { { id = "tp_kobolds", text = "Thieving little candle-heads. Worse than Maclures. Nearly." } },
    _none = { { id = "tp_none", text = "No idea. Ask me about pie." } },
  },
}

-- Ma Stonefield: the Brackwells' prize pig has been eating her crop.
P:NPC {
  key = "ma_stonefield", id = TODO_NPC("Ma Stonefield"), name = "Ma Stonefield",
  bible = "bibles/ma_stonefield.md", role = "farmer", tier = "quest",
  communities = { "goldshire" }, temper = { "sharp" }, values = { "stern", "honest" },
  notices = { "trophy" },

  greetings = {
    { id = "g_field", text = "If you're here for the vegetables, there aren't many left. Ask the pig." },
    { id = "g_princess", when = { questActive = TODO_QUEST("Princess Must Die!") }, text = "Is she dead? Is that great sow dead yet?" },
    { id = "g_after", when = { questDone = TODO_QUEST("Princess Must Die!") }, text = "My cabbages thank you. I thank you. The Brackwells don't, but I've stopped caring." },
  },

  notice = {
    { id = "n_collar", cat = "trophy", place = "before", when = { questReady = TODO_QUEST("Princess Must Die!") },
      text = "Is that her collar? The brass one? Give it here. I'm hanging it over the door." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Ma Stonefield. This is my field. Was my field. Then the Brackwells' prize pig found it." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Princess Must Die!") },
          text = "Princess, they call her. Princess! She's the size of a cart and she eats like a regiment. She'll have the whole crop by harvest." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Princess Must Die!") },
          text = "Out in the fields, gorging herself. Bring me her collar so I know it's done." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Princess Must Die!"), days = 3 } },
          text = "First carrot I've pulled whole all season. I nearly cried. I'm not a crier." },
      },
      choices = {
        { text = "Couldn't you talk to the Brackwells?", next = "brackwells" },
        { text = "Good luck with the crop.", next = "END" },
      },
    },
    brackwells = {
      lines = { { id = "b_default", text = "I did. They said she's a prize-winner and I should be honoured. I'm honoured right out of cabbages." } },
      choices = { { text = "Ha.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    maybell_tommy = { { id = "tp_lovers", text = "Tommy Joe? He's mending the east fence. He's been mending it for months. It must be a very broken fence." } },
    _none = { { id = "tp_none", text = "Don't know, don't care, got a pig to worry about." } },
  },
}

-- Billy Maclure: accused, hungry, and he knows who really took it.
P:NPC {
  key = "billy", id = TODO_NPC("Billy Maclure"), name = "Billy Maclure",
  bible = "bibles/billy.md", role = "child", tier = "quest",
  communities = { "goldshire" }, temper = { "cowardly" }, values = { "witty" },
  notices = { "food", "wonder" },

  greetings = {
    { id = "g_kid", text = "I didn't do it. Whatever it is. I was here the whole time." },
    { id = "g_pie", when = { questActive = TODO_QUEST("Back to Billy") }, text = "Is that pie? Is that my pie? Gimme gimme." },
    { id = "g_after", when = { questDone = TODO_QUEST("Goldtooth") }, text = "Told you it wasn't me! Told everybody!" },
  },

  notice = {
    { id = "n_food", cat = "food", when = { profession = "Cooking" },
      text = "You smell like a kitchen. Got anything? A crust? I'm not fussy. I'm a growing boy. Ma says." },
    { id = "n_cat", cat = "wonder", place = "replace", when = { form = "cat" },
      text = "Kitty! A big kitty! Do you eat kobolds? You should eat kobolds." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Billy. Maclure. Everybody at the Stonefields thinks I'm a thief. I'm not. I just know things." },
        { id = "h_necklace", tags = { "news" }, when = { questActive = TODO_QUEST("Lost Necklace") },
          text = "Auntie Bernice thinks I took her necklace? I didn't! I might know who did. I can't remember properly. I'm too hungry to remember." },
        { id = "h_pie", when = { questActive = TODO_QUEST("Pie for Billy") },
          text = "Auntie Bernice makes the best pie in Elwynn. Don't tell my ma. Pork belly. Get boar meat. Good boar meat." },
        { id = "h_tell", tags = { "news" }, when = { questActive = TODO_QUEST("Goldtooth") },
          text = "Goldtooth's got it. I saw. He likes shiny things. Don't tell anyone I told. Don't tell anyone I was there." },
      },
      choices = {
        { text = "Are you sure you didn't take it?", next = "sure" },
        { text = "See you, Billy.", next = "END" },
      },
    },
    sure = {
      lines = { { id = "s_default", text = "I'm a Maclure. We don't steal from Stonefields. We just don't talk to them. That's different. Ma says." } },
      choices = { { text = "Fair enough.", next = "END", fx = { affinity = 1 } } },
    },
  },

  topics = {
    maybell_tommy = { { id = "tp_lovers", text = "Maybell goes to the river a LOT. I'm not saying anything. I'm just saying." } },
    kobolds = { { id = "tp_kobolds", text = "They live in the mines and they like shiny stuff. And candles. Weird." } },
    _none = { { id = "tp_none", text = "I don't know. I'm a kid. Ask a grown-up. Not Auntie Bernice." } },
  },
}
