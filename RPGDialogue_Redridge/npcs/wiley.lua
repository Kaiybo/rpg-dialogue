-- Wiley the Black, a corner of the Lakeshire Inn. Voice: bibles/wiley.md
-- Owes Gryan Stoutmantle his life, and pays in information. Blunt about it.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "wiley", id = TODO_NPC("Wiley the Black"), name = "Wiley the Black",
  bible = "bibles/wiley.md", role = "questgiver", tier = "quest",
  communities = { "lakeshire" }, temper = { "sharp" }, values = { "cunning", "honest" },
  notices = { "stealth", "watch" },

  greetings = {
    { id = "g_corner", text = "You're in my light." },
    { id = "g_gryan", when = { questActive = TODO_QUEST("The Defias Brotherhood") }, text = "Stoutmantle sent you. I can smell Westfall on you." },
    { id = "g_back", when = { metBefore = true }, text = "Back? Sit, if you're staying. Stand somewhere else if you're not." },
  },

  notice = {
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "One of us. You walked in like you were checking the exits. Good habit. Keep it." },
    { id = "n_stealth", cat = "stealth", place = "replace", when = { stealthed = true },
      text = "I heard you at the door. And at the bar. And just now. You want to work on that." },
    { id = "n_watch", cat = "watch", when = { questDone = TODO_QUEST("Red Leather Bandanas") },
      text = "You've been collecting bandanas for Galiaan. Folk who wear them have started asking who you are. Thought you'd want to know." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Wiley. Some say the Black. Some say worse. I sit in this corner and I know things, and I don't tell them to just anybody." },
        { id = "h_defias", key = true, tags = { "news" }, when = { questActive = TODO_QUEST("The Defias Brotherhood") },
          text = "Gryan did me a favor once, the kind you don't repay with coin. So I pay him in what I know about the Brotherhood. Listen close." },
        { id = "h_deadmines", when = { deed = "dungeon:The Deadmines" },
          text = "Under Moonbrook, and back out again. I've heard a lot of stories about that place. Yours is the first one I believe." },
        { id = "h_rude", when = { trait = "witty" },
          text = "Clever mouth. I like a clever mouth. Gryan doesn't. Gryan likes manners. That's why he needs me." },
        { id = "h_price", when = { metBefore = true }, text = "You're back. Good. I've heard three new things since yesterday. One of them's even true. Guess which." },
      },
      choices = {
        { text = "What do you know about the Defias?", next = "defias" },
        { text = "What favor did Gryan do you?", next = "favor" },
        { text = "Enjoy your corner.", next = "END" },
      },
    },
    defias = {
      lines = {
        { id = "d_default", text = "More than they'd like and less than I'd like. They're not thieves. Thieves don't drill. Thieves don't have a quartermaster." },
      },
      choices = {
        { text = "And their leader?", next = "leader" },
        { text = "Thanks, Wiley.", next = "END", fx = { learn = { "defias" } } },
      },
    },
    leader = {
      lines = {
        { id = "l_default", text = "Ask Gryan. He's paying for that one. You're not." },
      },
      choices = { { text = "Fair.", next = "END" } },
    },
    favor = {
      lines = {
        { id = "f_default", text = "The kind that kept me breathing. And he's never let me forget it, or let me thank him properly. He thinks I'm rude. I am rude." },
      },
      choices = {
        { text = "Sounds like you respect him.", next = "END", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Sounds like you owe him.", next = "END", fx = { trait = { stern = 1 } } },
      },
    },
  },

  topics = {
    defias = { { id = "tp_defias", text = "Organized. Paid. Patient. Whoever pays them has deeper pockets than any thief." } },
    westfall = { { id = "tp_westfall", text = "Gryan's war. I just supply the maps." } },
    blackrock = { { id = "tp_blackrock", text = "Not my business. Orcs don't drink in here." } },
    _none = { { id = "tp_none", text = "If I knew, it'd cost you. I don't, so it's free. Enjoy it." } },
  },
}
