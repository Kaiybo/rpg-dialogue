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
    { id = "g_gryan", when = { questActive = TODO_QUEST("The Defias Brotherhood") }, text = "Stoutmantle sent you; I can smell Westfall on you." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Sit, if you're staying, and stand somewhere else if you're not." },
  },

  notice = {
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "One of us, then. You walked in like you were checking the exits, and that's a good habit, so keep it." },
    { id = "n_stealth", cat = "stealth", place = "replace", when = { stealthed = true },
      text = "I heard you at the door, and at the bar, and just now. You want to work on that." },
    { id = "n_watch", cat = "watch", when = { questDone = TODO_QUEST("Red Leather Bandanas") },
      text = "You've been collecting bandanas for Galiaan. Folk who wear them have started asking who you are. Thought you'd want to know." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "They call me Wiley the Black, some of them, and some call me worse. I sit in this corner and I know things, and I don't tell them to just anybody." },
        { id = "h_defias", key = true, tags = { "news" }, when = { questActive = TODO_QUEST("The Defias Brotherhood") },
          text = "Gryan did me a favor once, the kind you don't repay with coin. So I pay him in what I know about the Brotherhood, and you'd best listen close." },
        { id = "h_deadmines", when = { deed = "dungeon:The Deadmines" },
          text = "Under Moonbrook, and back out again. I've heard a lot of stories about that place. Yours is the first one I believe." },
        { id = "h_rude", when = { trait = "witty" },
          text = "Clever mouth. I like a clever mouth, but Gryan doesn't; Gryan likes manners, and that's why he needs me." },
        { id = "h_price", when = { metBefore = true }, text = "You're back, good. I've heard three new things since yesterday, and one of them's even true; guess which." },
        { id = "h_cold", when = { disposition = { max = 34 } },
          text = "You again. I don't sell to people I don't like, and you've been working hard to make the list." },
      },
      again = {
        { id = "h_again", text = "Something else? Keep your voice down, the floor's thin." },
        { id = "h_again2", text = "Go on, quietly. Half this inn is ears, and the other half is Daniels." },
      },
      choices = {
        { text = "What do you know about the Defias?", next = "defias" },
        { text = "What favor did Gryan do you?", next = "favor" },
        { text = "Why this corner?", next = "corner" },
        { text = "I could use a man with your ears.", next = "rogue", when = { class = "ROGUE" } },
        { text = "VanCleef's dead. I was there.", next = "vancleef", when = { deed = "dungeon:The Deadmines" } },
        { text = "The Defias drove my family off our farm.", next = "farm", when = { origin = "human_westfall_farmhand" } },
        { text = "Enjoy your corner.", next = "END" },
      },
    },

    defias = {
      lines = {
        { id = "d_default", text = "More than they'd like and less than I'd like. They're not thieves, because thieves don't drill and thieves don't keep a quartermaster." },
      },
      choices = {
        { text = "And their leader?", next = "leader" },
        { text = "How big are they?", next = "network" },
        { text = "Thanks, Wiley.", next = "BACK", fx = { learn = { "defias" } } },
      },
    },
    leader = {
      lines = {
        { id = "l_default", text = "Ask Gryan. He's paying for that one, and you're not." },
      },
      choices = { { text = "Fair.", next = "BACK" } },
    },
    network = {
      big = true,
      lines = {
        { id = "nw_default", text = "Every mine from Westfall to Elwynn, with kobolds and gnolls doing the digging. Goblins build the metal scarecrows for the fields. And the tunnels run closer to the Keep than anyone likes.",
          fx = { learn = { "defias", "harvest_watchers" } } },
      },
      choices = {
        { text = "What are they building down there?", next = "building" },
        { text = "Something else.", next = "BACK" },
      },
    },
    building = {
      lines = { { id = "bu_default", text = "They were stonemasons, and masons build big. Ask yourself how big, and then stop asking in public." } },
      choices = {
        { text = "You talk like you knew them.", next = "building_more" },
        { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    building_more = {
      lines = { { id = "bm_default", text = "I talk like a man who listens. You want to keep guessing at my past, the drinks are on you." } },
      choices = {
        { text = "Keep your secrets.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll find out eventually.", next = "BACK", fx = { affinity = -1, trait = { curious = 1 } } },
      },
    },

    favor = {
      lines = {
        { id = "f_default", text = "The kind that kept me breathing, and he's never let me forget it, or let me thank him properly. He thinks I'm rude, and I am." },
      },
      choices = {
        { text = "Sounds like you respect him.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Sounds like you owe him.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Were you in some kind of trouble?", next = "favor_rot" },
      },
    },
    favor_rot = {
      lines = { { id = "fr_default", text = "Ask him. He'll say he should have left me to rot. He means it about half the time, which for Gryan is affection." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    corner = {
      lines = { { id = "c_default", text = "Sightlines: the door, the stairs, the window. And Daniels doesn't charge for the corner." } },
      choices = {
        { text = "Who's worth watching in here?", next = "watching" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watching = {
      lines = { { id = "wt_default", text = "The deputy who counts gnolls, the marshal who counts guards, the barkeep who counts bottles. Nobody counts the stranger who just came up the stairs, except me." } },
      choices = {
        { text = "And who counts you?", next = "BACK", fx = { trait = { witty = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    rogue = {
      lines = { { id = "ro_default", text = "Everyone could. Shaw's people already read what I write, and that's all the admirers I need. Watch the stairs, not the door; amateurs watch the door." } },
      choices = {
        { text = "Stairs. Noted.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    vancleef = {
      lines = { { id = "vc_default", text = "Then the masons lost their foreman. Doesn't mean they've stopped building. Check your exits for a while." } },
      choices = {
        { text = "I always do.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    farm = {
      lines = { { id = "fa_default", text = "Then you know more than my note does, and I'm sorry. I don't say that often, so take it while it's offered." } },
      choices = {
        { text = "Thank you, Wiley.", next = "BACK", fx = { affinity = 2 } },
        { text = "I don't want sorry. I want names.", next = "BACK", fx = { trait = { stern = 1 }, opinion = { defias = "hardline" } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I sit here and people talk, and what they say has a price. These, I might part with." },
    },
    background = { { id = "tp_bg", text = "I sit in a corner and know things. Before that, I sat in other corners." } },
    advice = { { id = "tp_ad", text = "Keep your back to the wall and your eyes on the stairs, and the rest is luck." } },
    defias = { { id = "tp_defias", text = "Organized, paid and patient. Whoever pays them has deeper pockets than any thief." } },
    westfall = { { id = "tp_westfall", text = "That's Gryan's war; I just supply the maps." } },
    blackrock = { { id = "tp_blackrock", text = "Not my business, friend. Orcs don't drink in here." } },
    _none = { { id = "tp_none", text = "If I knew, it'd cost you. I don't, so this one's free; enjoy it." } },
  },
}
