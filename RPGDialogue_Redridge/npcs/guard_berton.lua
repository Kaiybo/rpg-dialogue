-- Guard Berton, outside the Lakeshire Inn. Voice: bibles/guard_berton.md
-- Wants Targorr the Dread dead in the Stockade: sentenced to die, kept alive as some noble's pawn.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "guard_berton", id = TODO_NPC("Guard Berton"), name = "Guard Berton",
  bible = "bibles/guard_berton.md", role = "guard", tier = "quest",
  communities = { "lakeshire" }, temper = { "sharp" }, values = { "justice", "stern" },
  notices = { "soldier", "stealth" },

  impression = {
    first = "Guard Berton wants a condemned orc dead and doesn't much care whether a court agrees. He spoke of justice like a man who has watched it bought and sold.",
    third = "{name} met Guard Berton of Lakeshire, who wants Targorr the Dread killed in the Stockade before politics sets him free.",
  },

  greetings = {
    { id = "g_inn", text = "Move along, unless you've business in Lakeshire. If you have, state it." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Have you been to the Stockade in Stormwind yet, to see about Targorr?" },
    { id = "g_active", when = { questActive = TODO_QUEST("What Comes Around...") }, text = "Targorr still breathes, then. Every day he does is a day the wrong people are winning." },
    { id = "g_done", when = { questDone = TODO_QUEST("What Comes Around...") }, text = "I sleep better since Targorr's head came back to Lakeshire, and I don't care who knows it." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}. The Blackrock weren't, and neither was I." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've hardened since you first stood here. Good; Redridge does that to the ones it doesn't bury." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The town says you've done right by it. I don't hand out thanks lightly, so take that as one." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "Word is you lied to somebody in town. Don't try it with me; I've heard better liars at a hanging." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You carry yourself like you've stood a line. Then you'll know what it is to watch a guilty man walk." },
    { id = "n_rogue", cat = "stealth", when = { class = "ROGUE" },
      text = "One of the quiet ones. I don't trust your sort as a rule, but the Stockade might need exactly your sort." },
  },

  start = "hello",
  nodes = {
    dd_berton_f = {
      lines = {
        { id = "dd_berton_f_a", text = "No trial, and no waiting for letters from Stormwind, and no clever talk about who's paying whom. That's the kind of justice I understand, and I'll not pretend I'm sorry about it." },
      },
      choices = {
        { text = "A beast like that deserved no better.", next = "dd_berton_f2", fx = { align = { order = -1 } } },
        { text = "I'd still rather the law had done it.", next = "dd_berton_f2", fx = { align = { order = 1 } } },
      },
    },
    dd_berton_f2 = {
      lines = {
        { id = "dd_berton_f2a", text = "Aye, well, the law in Lakeshire is one tired magistrate and a stack of paper, and the gnolls can't read. I'll take results, and you've brought me one." },
      },
      choices = { { text = "Something else, Berton.", next = "BACK" } },
    },

    hello = {
      lines = {
        { id = "dd_fangore_b", when = { killed = { name = "Fangore" } },
          text = "Lieutenant Fangore's dead, they tell me, and that mangy gnoll had it coming three times over. Justice doesn't always come from a magistrate's bench, and this time I'm glad it came from your blade." },

        { id = "h_default", key = true, text = "Guard Berton, Lakeshire watch. There's an orc in the Stormwind Stockade named Targorr the Dread, sentenced to die for what he did, and somebody keeps putting his execution off." },
        { id = "h_before", when = { questBefore = TODO_QUEST("What Comes Around...") },
          text = "Put an end to Targorr the Dread, {name}. Go to the Stockade and take his head before whatever trickery keeps him alive sets him loose." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("What Comes Around...") },
          text = "He was sentenced to die, not to sit in a cell as a pawn for some noble's whims. Bring me his head, and Lakeshire will know it's done." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("What Comes Around..."), days = 3 } },
          text = "So Targorr's met his end, and now he knows what it's like on the other side of the axe. I'll not lose any sleep over the trial he never got." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf. Your king hangs his traitors, I've heard, and doesn't keep them as bargaining chips. I envy you that." },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick, because the sergeant owes me four silver and he's off duty within the hour." },
        { id = "h_again2", text = "Go on. I'm on watch, not deaf." },
      },
      choices = {
        { text = "I killed Fangore myself. No trial needed.", next = "dd_berton_f", when = { killed = { name = "Fangore" } } },

        { text = "What did Targorr do?", next = "targorr" },
        { text = "I'm surprised he hasn't been executed already.", next = "delay" },
        { text = "Isn't killing him a matter for the courts?", next = "courts" },
        { text = "I've been in the Stockade. I know the cells.", next = "stockade", when = { questDone = TODO_QUEST("What Comes Around...") } },
        { text = "I'll deal with him.", next = "BUSINESS" },
        { text = "Carry on, Guard.", next = "END" },
      },
    },
    targorr = {
      lines = { { id = "t_default", text = "He was a Blackrock, and a cruel one even for them. He came down on these mountains with the rest, and the folk he caught didn't die quickly." },
      },
      choices = {
        { text = "Did you know any of them?", next = "targorr_known" },
        { text = "Something else.", next = "BACK" },
      },
    },
    targorr_known = {
      lines = { { id = "tk_default", text = "Everyone in Lakeshire knew someone. I'll leave it there, if it's all the same to you." },
      },
      choices = { { text = "Of course. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    delay = {
      lines = { { id = "d_default", text = "Ask the House of Nobles. They say he has information, or he's worth something to someone, or it isn't the right time, and every month there's a new reason." },
      },
      choices = {
        { text = "You think he'll be freed?", next = "delay_freed" },
        { text = "Something else.", next = "BACK" },
      },
    },
    delay_freed = {
      lines = { { id = "df_default", text = "I think a man kept alive for politics is a man who'll be traded for politics. And when he walks, he'll walk straight back up this valley." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    courts = {
      big = true,
      lines = { { id = "c_default", text = "The court already decided; he was sentenced. All I'm asking is that someone carries out what the law already said, since the law won't do it itself." },
      },
      choices = {
        { text = "Justice delayed is still justice. Let the crown decide.", next = "BACK", reply = "The crown has had years to decide, and Targorr still eats three meals a day in the Stockade. I'll wait for justice when justice stops waiting on a noble's say-so.", fx = { align = { order = 1 } } },
        { text = "If the law won't act, someone must.", next = "BACK", reply = "That's all I've been saying, and it's good to hear it from someone who isn't me. Most folk nod along and then find somewhere else to be.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stockade = {
      lines = { { id = "s_default", text = "Then you saw what passes for justice in there: killers fed and housed while the families in Lakeshire bury what's left. I hope you didn't stay long." },
      },
      choices = { { text = "Not long. Something else.", next = "BACK" } },
    },
  },

  topics = {
    the_stockade = {
      { id = "tp_the_stockade", text = "Targorr the Dread was sentenced to die and sent to the Stockade to wait, and now I hear the prisoners have taken the place over. I'd go in myself if the Marshal could spare me, and I'd see the sentence carried out." },
    },
    prestor = { { id = "tp_prestor", text = "Some noble with a soft voice is said to be the reason condemned orcs keep breathing in the Stockade. I don't know which one, and that's how they like it, I suppose." } },
    bolvar = { { id = "tp_bolvar", text = "The Regent's an honest man, I'm told, but the court around him is a nest of favours. A sentence of death oughtn't to need a friend at court to be carried out." } },
    internment = { { id = "tp_internment", text = "Every orc that was ever in a camp got out sooner or later, and half of them came here. If the kingdoms had hanged the worst of them, I'd have a quieter post." } },
    thrall = { { id = "tp_thrall", text = "The new warchief's name is Thrall, so they say, and he was raised in a human fortress. That hasn't made his orcs any gentler where I stand." } },
    background = { { id = "tp_bg", text = "Lakeshire born, Lakeshire watch. I've stood outside this inn through two winters of Blackrock raids." } },
    advice = { { id = "tp_ad", text = "Don't trust a sentence until you've seen it carried out." } },
    blackrock = { { id = "tp_blackrock", text = "Targorr was one of theirs, and there's plenty more up the valley.", next = "targorr" } },
    _none = { { id = "tp_none", text = "Not my concern. Ask the Magistrate; he's paid to know things." } },
  },
}
