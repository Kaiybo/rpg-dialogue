-- Estelle Gendry of the Rogues' Quarter, moved here from the Orgrimmar roster (a later-era placement). Voice: bibles/missed_estelle.md
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Estelle Gendry: Forsaken rogue in the Rogues' Quarter, Undercity (her Classic post; filed here from the Orgrimmar roster).
P:NPC {
  key = "estelle_gendry", id = TODO_NPC("Estelle Gendry"), name = "Estelle Gendry", gender = "female",
  bible = "bibles/missed_estelle.md", role = "rogue", tier = "service",
  communities = { "undercity" }, temper = { "dry", "sly" }, values = { "cunning", "discreet" },
  notices = { "class", "race" },
  impression = {
    first = "Estelle Gendry leans in the Rogues' Quarter of the Undercity with a roll of fine picks at her belt, and she watches hands and never faces. She talks about locks with a collector's fondness, and about the living with rather less.",
    third = "{name} met Estelle Gendry, a Forsaken rogue with a fondness for other people's locks.",
  },
  greetings = {
    { id = "g_default", text = "Keep your hands where I can admire them, {class}. It is nothing personal, only a habit of the quarter." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back, and with the same number of fingers. Either you are careful or you have not been trying." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Soft boots and a wandering eye. You are one of ours, then, and you may stop pretending to look at the wall." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "You are very warm, and I can hear your heart from here. It is a dreadful handicap in my line of work, though I suppose you are attached to it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_rogue", when = { class = "ROGUE" }, text = "Estelle Gendry. A rogue without proper thieves' tools is only a pedestrian with ambitions, so I take an interest in whether the Dark Lady's blades are decently equipped." },
        { id = "h_default", text = "I am Estelle Gendry, and I have an interest in things that are meant to stay shut. The quarter finds me useful, and I find the quarter tolerant, which is all one can ask of a sewer." },
      },
      again = {
        { id = "h_again", text = "Was there something else? I do have a door to think about." },
        { id = "h_again2", text = "Go on, but do keep your voice down." },
      },
      choices = {
        { text = "Tell me about thieves' tools.", next = "tools", when = { class = "ROGUE" } },
        { text = "What is it you like about locks?", next = "locks" },
        { text = "What did you do before you died?", next = "before" },
        { text = "Who runs the Rogues' Quarter?", next = "quarter" },
        { text = "I'll leave you to your door.", next = "END" },
      },
    },
    tools = {
      lines = { { id = "t_default", text = "You want a tension bar, a set of picks in three weights and a steady wrist, and only the last cannot be bought. Practise on footlockers before you practise on anything with a guard attached, because a chest does not shout." } },
      choices = {
        { text = "What's the hardest lock you've opened?", next = "hardest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    locks = {
      lines = { { id = "l_default", text = "A lock is a small argument somebody made in iron, to the effect that you may not come in. I do enjoy winning an argument, and a lock never sulks about it afterwards." } },
      choices = {
        { text = "What's the hardest lock you've opened?", next = "hardest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hardest = {
      lines = { { id = "h_default2", text = "It was a dwarven strongbox with a false keyhole and a needle in the true one. The needle was poisoned, which would have mattered a great deal to me once, and I found that I rather pitied the craftsman for his wasted effort." } },
      choices = { { text = "Being dead has its uses. Something else.", next = "BACK" } },
    },
    before = {
      lines = {
        { id = "b_forsaken", when = { race = "Scourge" }, text = "You know better than to ask that of one of us, and you know why I shall answer anyway. I opened doors in Lordaeron for people who paid well, and then the Plague opened every door in the kingdom at once and put me out of business." },
        { id = "b_default", text = "I did much the same as I do now, in a prettier city and for worse people. The Plague took the city and the people both, so I count myself the only part of the arrangement that improved." },
      },
      choices = { { text = "Another matter.", next = "BACK" } },
    },
    quarter = {
      lines = { { id = "q_default", text = "The Deathstalkers do, in the Dark Lady's name, and Mennet Carkad decides who is worth their trouble. If he has a task for you then you should do it well, because he keeps a short list and a long memory." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a locksmith's daughter in Lordaeron, and a disappointment to him. I should like to think I have been consistent." } },
    _none = { { id = "tp_none", text = "I could not tell you, and I make a point of not guessing aloud. It is a bad habit in a thief." } },
  },
}
