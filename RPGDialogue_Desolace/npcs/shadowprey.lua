-- Shadowprey Village, the Horde's fishing village on the Desolace coast: Taiga Wisemane (Hand of Iruxos),
-- Vark Battlescar (Vyletongue Corruption), Drulzegar Skraghook (Other Fish to Fry), Jinar'Zillen (Fish in a Bucket),
-- Innkeeper Sikewa. Voice: bibles/shadowprey.md
local P = RPGDialogueAPI:Pack("rpgd.desolace")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Jinar'Zillen
---------------------------------------------------------------------------
P:NPC {
  key = "jinarzillen", id = TODO_NPC("Jinar'Zillen"), name = "Jinar'Zillen",
  bible = "bibles/shadowprey.md", role = "questgiver", tier = "quest",
  communities = { "shadowprey" }, temper = { "lazy", "cheerful" }, values = { "comfort", "trade" },
  notices = { "race", "class" },

  impression = {
    first = "He has arranged his whole life around doing as little as possible.",
    third = "{name} met Jinar'Zillen, a lazy troll at Shadowprey Village who trades fish for the shellfish in his traps.",
  },

  greetings = {
    { id = "g_hello", text = "Ey, mon! You look like somebody who likes to swim. I got just the thing for you." },
    { id = "g_back", when = { metBefore = true }, text = "My favorite swimmer comes back! The traps be full, mon, they always be full." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman! You got water spirits that let you breathe down there? Then you be the perfect friend for me, mon." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I be Jinar'Zillen, mon, and I'll tell you my philosophy: do as little as you can, and pay somebody else to do the rest. Under these docks be my shellfish traps, and every five shellfish you bring me get you a nice fat Bloodbelly fish." },
        { id = "h_active", when = { questActive = TODO_QUEST("Fish in a Bucket") },
          text = "The traps be right under the docks, mon, down in the water. Bring me five and I'll find you a fish, and if you bring me ten I'll find you two." },
        { id = "h_done", when = { questDone = TODO_QUEST("Fish in a Bucket") },
          text = "You came back for more work! That be the most beautiful thing a lazy troll ever saw, mon." },
      },
      again = {
        { id = "h_again", text = "What else, mon? Talking be the only work I enjoy." },
        { id = "h_again2", text = "Go on, mon, I'm not going anywhere. I'm never going anywhere." },
      },
      choices = {
        { text = "Why don't you check your own traps?", next = "lazy" },
        { text = "How can I breathe that deep?", next = "secret" },
        { text = "What's a Bloodbelly fish?", next = "fish" },
        { text = "Is the water dangerous?", next = "danger" },
        { text = "I'll get your shellfish.", next = "BUSINESS" },
        { text = "Farewell, Jinar'Zillen.", next = "END" },
      },
    },

    lazy = {
      lines = { { id = "la_default", text = "Because the water be cold, mon, and the hammock be warm, and I already worked hard once when I was young. It didn't agree with me." } },
      choices = {
        { text = "That's no way to live.", next = "lazy_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lazy_stance = {
      big = true,
      lines = { { id = "ls_default", text = "It be the best way to live, mon! Everybody gets what they want: you get fish, I get shellfish, and nobody gets wet that don't want to. Drulzegar down the dock says I be shameful, but Drulzegar don't smile." } },
      choices = {
        { text = "A man should earn his own bread.", next = "BACK", reply = "Earn it? Mon, I do earn it, by bein' smart enough not to work, and dat takes a lot of thinkin'.", fx = { align = { order = 1 } } },
        { text = "You've got it figured out, Jinar.", next = "BACK", reply = "Ya, mon, finally somebody sees it, and you can tell Drulzegar dat next time he frowns at me.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    secret = {
      lines = { { id = "se_default", text = "I'll let you in on a little secret, mon, but keep it between us. Deep in the water there be bubbly cracks in the sand, and you can breathe at them as long as you like." } },
      choices = {
        { text = "Why keep it secret?", next = "secret_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    secret_why = {
      lines = { { id = "sw_default", text = "Because if everybody knows, mon, everybody puts down shellfish traps, and then where am I? Working, that be where, and we already talked about how I feel about that." } },
      choices = {
        { text = "I won't tell a soul.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "Drulzegar already told me.", next = "BACK", fx = { trait = { witty = 1 } }, when = { heardLine = "drulzegar.bu_default" } },
        { text = "Something else.", next = "BACK" },
      },
    },

    fish = {
      lines = { { id = "fi_default", text = "Red in the belly, sweet in the meat, and they make you breathe better under water for a while. Very useful, mon, for somebody going down to collect shellfish, if you see where I'm going." } },
      choices = {
        { text = "That's clever.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    danger = {
      lines = { { id = "da_default", text = "Under the docks? Some crabs, mon, and they pinch, but they don't hate you personally. Up north be the naga, and they hate everybody, so stay here where it be friendly." } },
      choices = {
        { text = "Good to know.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know traps, fish, hammocks, and how to make other people do the swimming. That be a lot of wisdom, mon." } },
    advice = { { id = "tp_ad", text = "Never stand when you can sit, mon, and never sit when you can lie down." } },
    _none = { { id = "tp_none", text = "That sounds like work to know about, mon, so I don't." } },
  },
}
