-- Security Chief Bilgewhizzle, Water Co. Security at Steamwheedle Port (0.72.0). Voice: bibles/security_bilgewhizzle.md
-- Overworked, underpaid, squeezed by the Cartel above and the Southsea pirates below.
local P = RPGDialogueAPI:Pack("rpgd.tanaris")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "security_bilgewhizzle", id = TODO_NPC("Security Chief Bilgewhizzle"), name = "Security Chief Bilgewhizzle",
  title = "Water Co. Security",
  bible = "bibles/security_bilgewhizzle.md", role = "soldier", tier = "quest",
  prejudice = { class = "ROGUE", amount = 10, why = "a dock security chief who reads every light-footed visitor as a crate thief" },
  communities = { "steamwheedle_port" }, temper = { "harried", "sharp" }, values = { "profit", "dutiful" },
  notices = { "stealth", "trophy" },
  impression = {
    first = "Security Chief Bilgewhizzle keeps the peace at Steamwheedle Port and complains that the Cartel wants him in two places at once. He deputizes anyone who'll stand still and never lets them read the small print.",
    third = "{name} met Security Chief Bilgewhizzle, the harried goblin in charge of Water Company security at Steamwheedle Port.",
  },

  greetings = {
    { id = "g_pj_rogue", when = { prejudiced = true }, text = "Hold it right there, pal, and keep your hands out of your sleeves. I know a pickpocket's walk when I see one, and the Water Company doesn't pay me to give anybody the benefit of the doubt." },
    { id = "g_pj_over", when = { prejudiced = "overcome" }, text = "Oh, it's you, and I didn't even check my coin purse, which tells you somethin'. I had you down in the book as a liability, buddy, and I've moved you over to assets." },
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
    pj_bilge = {
      lines = { { id = "pj_bilge_default", text = "That's the job, buddy. Every crate that goes missing comes out of my budget, and nine times in ten the fellow who took it walked just like you, light on the feet and looking at everything but me. I'm not sayin' you're a thief; I'm sayin' I can't afford to guess." } },
      choices = {
        { text = "And the tenth time?", next = "pj_bilge2" },
        { text = "Then watch me. I've nothing to hide on your dock.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Smart. A good thief never looks like a thief, Chief.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'd do the same in your boots, Chief.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    pj_bilge2 = {
      lines = { { id = "pj_bilge2_default", text = "My brother-in-law, sorry to say, and he didn't walk light at all, he walked like a fellow carrying two crates of Noggenfogger, which he was. Family's a liability too, pal, and I've got the invoices to prove it." } },
      choices = {
        { text = "So rogues aren't your only problem. Good to know.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    op_pirates = {
      lines = {
        { id = "opp_q", text = "Look, look, I've got to file a report to the Cartel on public sentiment, which is a thing they make me do now, on top of everythin' else. What's your take on the Southsea pirates, pal?" },
      },
      choices = {
        { text = "Hang every one of them from the port cranes.", next = "op_pirates_r1", fx = { affinity = 1, align = { light = -1 }, opinion = { pirates = "hate" } } },
        { text = "Some are just sailors out of work. Offer them honest jobs.", next = "op_pirates_r2", fx = { align = { light = 1 }, trait = { kind = 1 }, opinion = { pirates = "pity" } } },
        { text = "Pay them less and hire more Bruisers.", next = "op_pirates_r3", fx = { trait = { practical = 1 }, opinion = { pirates = "contain" } } },
        { text = "A pirate's life sounds better than guarding a dock.", next = "op_pirates_r4", fx = { affinity = -1, trait = { witty = 1 }, opinion = { pirates = "admire" } }, when = { class = "ROGUE" } },
        { text = "I'd rather stay out of your report, chief.", next = "BACK" },
      },
    },
    op_pirates_r1 = {
      lines = {
        { id = "op_pirates_r1", text = "Okay, wow, I'll write 'strongly opposed' in the box, and I'll leave out the cranes, because the crane guy is my cousin." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_pirates_r2 = {
      lines = {
        { id = "op_pirates_r2", text = "Honest jobs! I'll pitch it to the Cartel, and they'll laugh, and then they'll ask what it costs. Still, I like you." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_pirates_r3 = {
      lines = {
        { id = "op_pirates_r3", text = "Now that's a line item I can get behind, pal! I'll put it in the report and take the credit, if it's all the same to you." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_pirates_r4 = {
      lines = {
        { id = "op_pirates_r4", text = "I'm gonna pretend I didn't hear that, and I'm also gonna keep an eye on you, because that's my actual job." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { text = "Who's been robbing the Cartel?", next = "protection" },
        { text = "Is there a catch to working for the Cartel?", next = "smallprint" },
        { text = "Whose face is on that wanted poster?", next = "andre" },
        { text = "Any relation to the Chief Engineer?", next = "cousin" },
        { text = "I know a thing or two about pirates' habits.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Some of those pirates were just dock workers.", next = "dockers", when = { questDone = TODO_QUEST("Southsea Shakedown") } },
        { text = "What do you need, Chief?", next = "BUSINESS" },
        { text = "You watch me like I'm about to rob the dock, Chief.", next = "pj_bilge", when = { prejudiced = true } },
        { text = "I'll let you get back to it.", next = "END" },
      },
    },
    protection = {
      lines = { { id = "p_default", text = "The Southsea pirates, pal. The Cartel pays them to stay home, because that's cheaper than losing a cargo, and goblins can count. Only now the Southsea are taking the money and the cargo, which is frankly unprofessional and a clear breach of terms." } },
      choices = {
        { text = "What do people say about the pirates?", next = "op_pirates" },
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
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's the Cartel's crown jewel in Tanaris, pal, and the port's just the doorstep. I keep the doorstep clean, mostly." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's got pirates, and Steamwheedle Port's got pirates, so I don't see why they get all the attention. Ours have worse manners." } },
    bloodsail = { { id = "tp_bloodsail", text = "The pirates down the coast aren't Bloodsail, pal, but they're no better. I deputize anybody who'll stand still and send them after them." } },
    zul_farrak = { { id = "tp_zul_farrak", text = "The trolls of Zul'Farrak raid the caravans from time to time, pal, and I'm supposed to stop them from the port. I'd like to see the Cartel try." } },
    _none = { { id = "tp_none", text = "Not my department, buddy. Ask at the warehouse, and tell them I sent you, which they'll hate, and that's worth the price of admission." } },
  },
}
