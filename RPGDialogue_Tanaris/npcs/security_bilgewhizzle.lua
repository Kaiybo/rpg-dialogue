-- Security Chief Bilgewhizzle, Water Co. Security at Steamwheedle Port (0.72.0). Voice: bibles/security_bilgewhizzle.md
-- Overworked, underpaid, squeezed by the Cartel above and the Southsea pirates below.
local P = RPGDialogueAPI:Pack("rpgd.tanaris")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "security_bilgewhizzle", id = TODO_NPC("Security Chief Bilgewhizzle"), name = "Security Chief Bilgewhizzle",
  title = "Water Co. Security",
  bible = "bibles/security_bilgewhizzle.md", role = "soldier", tier = "quest",
  communities = { "steamwheedle_port" }, temper = { "harried", "sharp" }, values = { "profit", "dutiful" },
  notices = { "stealth", "trophy" },
  impression = {
    first = "Security Chief Bilgewhizzle keeps the peace at Steamwheedle Port and complains that the Cartel wants him in two places at once. He deputizes anyone who'll stand still and never lets them read the small print.",
    third = "{name} met Security Chief Bilgewhizzle, the harried goblin in charge of Water Company security at Steamwheedle Port.",
  },

  greetings = {
    { id = "g_default", text = "We're here to make a profit, pal, and having our goods stolen is no way to make one. What do you want, and is it going to cost me?" },
    { id = "g_shake", when = { questActive = TODO_QUEST("Southsea Shakedown") }, text = "Back so soon? I hope you taught those Southsea hoodlums something they won't forget, like the price of crossing the Cartel." },
    { id = "g_shake_done", when = { questDone = TODO_QUEST("Southsea Shakedown") }, text = "My favourite deputy! The Cartel's been off my back for days, and I've been sleeping like a baby, a baby with a cudgel under the pillow." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the pirates haven't, and every day they're here costs me a crate. Glad you're back, deputy." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Word on the dock is you've been helpful, pal. I like helpful; it's cheaper than hiring, and you don't need a pension." },
    { id = "g_word_intimidated", when = { word = "intimidated" }, text = "Folks on the dock say you've been leaning on people around the port. Leaning is my job, so leave some for me." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", when = { class = "ROGUE" },
      text = "I know a cutpurse's walk when I see it, buddy, so keep your hands where I can see them on my dock, because everything on it's inventoried." },
    { id = "n_pirates", cat = "trophy", when = { killed = { name = "Southsea", min = 30 } },
      text = "You've got Southsea blood on your boots, and plenty of it, pal. You've just become my favourite person in Tanaris, and I don't hand that title out for free." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Security Chief Bilgewhizzle, Water Company security, and the only thing between this port and every thief on the coast, on a budget you wouldn't believe. The Cartel wants the impossible from me, and they want it by Tuesday." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Southsea Shakedown") },
          text = "The Southsea pirates have stopped honouring the protection money the Cartel pays them, which is a breach of contract if I ever saw one. I can't be in two places at once, so how would you like to be temporarily deputized, pal?" },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Southsea Shakedown") },
          text = "Lost Rigger Cove, just down the coast to the south. Pirates, freebooters, dock workers and swashbucklers, and show them what for, and if anything blows up down there, it's on their account, not ours." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Southsea Shakedown"), days = 3 } },
          text = "You're the best, pal! I'm sure the Cartel will ease up on me now that you've dealt with those Southsea scum, or at least ease up until next quarter." },
        { id = "h_andre", tags = { "news" }, when = { questRecent = { TODO_QUEST("WANTED: Andre Firebeard"), days = 3 } },
          text = "So Andre makes his trial after all, in a manner of speaking. Sign here, and don't worry about the small print, it's perfectly harmless." },
        { id = "h_goblin", when = { race = "Goblin" },
          text = "Ah, one of ours. Then you know a contract's only as good as the fellow holding the cudgel, and on this dock that's me." },
      },
      again = {
        { id = "h_again", text = "What else? Talk fast, pal; I'm being paid by the hour and you aren't." },
        { id = "h_again2", text = "Go on, buddy, I can watch the dock and listen at the same time. It's a skill, and they don't pay me extra for it." },
      },
      choices = {
        { text = "Why does the Cartel pay the pirates?", next = "protection" },
        { text = "What's in the small print?", next = "smallprint" },
        { text = "Who is Andre Firebeard?", next = "andre" },
        { text = "Any relation to the Chief Engineer?", next = "cousin" },
        { text = "I know a thing or two about pirates' habits.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Some of those pirates were just dock workers.", next = "dockers", when = { questDone = TODO_QUEST("Southsea Shakedown") } },
        { text = "What do you need, Chief?", next = "BUSINESS" },
        { text = "I'll let you get back to it.", next = "END" },
      },
    },
    protection = {
      lines = { { id = "p_default", text = "Because it's cheaper to pay a pirate to stay home than to lose a cargo, and goblins can count, pal. Only now the Southsea are taking the money and the cargo, which is frankly unprofessional and a clear breach of terms." } },
      choices = {
        { text = "Paying pirates only feeds them.", next = "protection_stance" },
        { text = "So what happens now?", next = "protection_stance" },
      },
    },
    protection_stance = {
      big = true,
      lines = { { id = "ps_default", text = "Now we teach them a lesson, so they remember who's the customer here. Then we go back to paying them, because the arrangement worked fine until they got greedy, and fine is all I ask for on my wage." } },
      choices = {
        { text = "A deal's a deal. Make them keep it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Stop paying them. Hang a few instead.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    smallprint = {
      lines = { { id = "sp_default", text = "Nothing that would interest you, I promise. I don't think there's a magnifying glass small enough to read it anyway, and believe me, the lawyers tried." } },
      choices = {
        { text = "That's exactly what worries me.", next = "smallprint_worry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    smallprint_worry = {
      lines = { { id = "sw_default", text = "Ha! A careful one, I like you. Fine, it mostly says the Cartel isn't liable if you get stabbed, which you'd have assumed anyway, being a sensible sort." } },
      choices = { { text = "I'll stay sensible, then.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    andre = {
      lines = { { id = "a_default", text = "A vile pirate wanted for crimes against Steamwheedle and Gadgetzan, and there's a poster with his face on it right over there, reward and all. The council decreed that if he's indisposed at his hearing, his head may stand in for him." } },
      choices = {
        { text = "His head?", next = "andre_head" },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    andre_head = {
      lines = { { id = "ah_default", text = "It's all perfectly legal, binding and tenderable, you can read it yourself if you've got an afternoon. Bring me the head and I'll see you paid for services rendered." } },
      choices = { { text = "Something else, Chief.", next = "BACK" } },
    },
    cousin = {
      lines = { { id = "c_default", text = "Everybody asks that, pal, and neither of us is admitting anything. He fixes pumps in Gadgetzan and I keep thieves off a dock, and the family's proud of exactly one of us, and it's whoever sent money home last." } },
      choices = {
        { text = "Which one?", next = "cousin_which" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cousin_which = {
      lines = { { id = "cw_default", text = "Depends which of us you ask, doesn't it? Next question." } },
      choices = { { text = "Then I'll ask the other one.", next = "BACK", fx = { affinity = 1 } } },
    },
    rogue = {
      lines = { { id = "r_default", text = "I'll bet you do, and I'd rather not ask how. If you know where they stash the stolen crates, tell me, pal, and I'll forget I ever saw you near my warehouse, which is a better deal than most get." } },
      choices = { { text = "Lost Rigger Cove keeps its secrets well.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    dockers = {
      big = true,
      lines = { { id = "d_default", text = "Dock workers who unload stolen cargo for pirates are pirates, deputy, whatever they call themselves and whatever they're paid. The Cartel doesn't pay me to split hairs, and it barely pays me to split heads." } },
      choices = {
        { text = "You're right. They chose their side.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Not every hired hand is a criminal.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Water Company security, posted to the port because somebody upstairs thinks I'm good at it, at the same wage. I'd ask for a raise, but I'd have to read my own contract." } },
    advice = { { id = "tp_ad", text = "Never sign anything you can't read, pal, unless I'm the one handing it to you." } },
    steamwheedle = { { id = "tp_sw", text = "The Cartel's the best employer in the world, and I'm saying that in case anybody important is listening." } },
    _none = { { id = "tp_none", text = "Not my department, buddy. Ask at the warehouse, and tell them I sent you, which they'll hate, and that's worth the price of admission." } },
  },
}
