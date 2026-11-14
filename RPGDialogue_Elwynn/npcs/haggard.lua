-- Marshal Haggard, outside his manor south-east of Eastvale. Voice: bibles/haggard.md
-- Retired from the Guard, half blind, and still sore about his badge.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "haggard", id = TODO_NPC("Marshal Haggard"), name = "Marshal Haggard",
  bible = "bibles/haggard.md", role = "questgiver", tier = "quest",
  communities = { "eastvale" }, temper = { "proud" }, values = { "lawful", "brave" },
  notices = { "kit" },

  greetings = {
    { id = "g_squint", text = "Who's that? Come closer. No, closer. Ah. Don't know you." },
    { id = "g_back", when = { metBefore = true }, text = "That voice I know. Come up, come up." },
    { id = "g_badge", when = { questDone = TODO_QUEST("Dead-Tooth Jack") }, text = "There's the one who brought my badge home. Stand straight; I'm told I'm wearing it." },
  },

  notice = {
    { id = "n_shine", cat = "kit", when = { durability = { min = 0.9 } },
      text = "Something on you's catching the light. Good. Kept clean. A soldier who keeps his kit keeps his life." },
    { id = "n_rags", cat = "kit", when = { durability = { max = 0.25 } },
      text = "I can't see much, but I can hear that armor rattle. Loose rivets. Get them seen to before they get you killed." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Haggard. I ran the Stormwind Guard once, back when I could read a duty roster. Now I sit here and listen to the loggers swear." },
        { id = "h_jack_before", when = { questBefore = TODO_QUEST("Dead-Tooth Jack") },
          text = "Some fellow came up the path in the dark, said he was from the Keep, wanted my old badge for an inspection. I handed it over. A lifetime in uniform, and I fell for that." },
        { id = "h_jack_active", tags = { "news" }, when = { questActive = TODO_QUEST("Dead-Tooth Jack") },
          text = "Dead-Tooth Jack, the loggers call him. Defias. Lives out in the woods like a badger. Get my badge back and I'll not ask how." },
        { id = "h_jack_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Dead-Tooth Jack"), days = 3 } },
          text = "That's mine. I can feel the dent in the corner where a gnoll bit it, year of the bad winter. Don't tell anyone at the Keep how I lost it." },
        { id = "h_raven", key = true, when = { visited = "Darkshire" },
          text = "Darkshire, eh? Then you've seen the Scarlet Raven. My lads and I drank there for years. Smitts still pours?" },
        { id = "h_smitts", when = { heardLine = "smitts.m_default" },
          text = "Smitts told you about that business? We never caught him. A whole season on it, and some muddy pages. I still see that mud when I close my eyes. Not that my eyes are much use open." },
        { id = "h_soldier", when = { class = { "WARRIOR", "PALADIN" } },
          text = "Soldier's stance, you've got. Heavy on the back foot. Shift forward a touch. There. Now you're harder to knock down." },
      },
      choices = {
        { text = "What's in the manor?", next = "manor" },
        { text = "Tell me about the Guard.", next = "guard" },
        { text = "Rest easy, Marshal.", next = "END" },
      },
    },
    manor = {
      lines = {
        { id = "mn_default", text = "The Flintridges' old summer cottage. Came with papers in a dead man's hand. Mistmantle, I think. My eyes won't give me the rest." },
      },
      choices = {
        { text = "I could read them for you.", next = "END", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Some papers are best left alone.", next = "END", fx = { trait = { skeptical = 1 } } },
      },
    },
    guard = {
      lines = {
        { id = "gd_default", text = "Good men, mostly. Some fools. I kept every piece of kit I was ever issued, oiled and hung on the wall. Can't see it now. I know where it is." },
      },
      choices = {
        { text = "You must miss it.", next = "END", fx = { affinity = 1 } },
        { text = "Any advice for a new soldier?", next = "advice" },
      },
    },
    advice = {
      lines = {
        { id = "a_default", text = "Never hand your badge to a man you can't see. There. Free of charge, and I paid dear for it." },
      },
      choices = { { text = "I'll remember.", next = "END", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    defias = { { id = "tp_defias", text = "Thieves dressed as officials, now. In my day they had the courtesy to look like thieves." } },
    eastvale = { { id = "tp_eastvale", text = "Quiet, mostly. Wolves at night. Raelen shouting by day. I prefer the wolves." } },
    _none = { { id = "tp_none", text = "Eh? Speak up. No, I don't know. I didn't know before you spoke up, either." } },
  },
}
