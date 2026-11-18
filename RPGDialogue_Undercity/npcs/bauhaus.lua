-- Royal Overseer Bauhaus, the Undercity census, near guild and tabard registration. Voice: bibles/bauhaus.md
-- A clerk of the dead with a magnificent vocabulary and no patience for people asking if their friends are dead.
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "bauhaus", id = TODO_NPC("Royal Overseer Bauhaus"), name = "Royal Overseer Bauhaus",
  prejudice = { race = { "Orc", "Tauren", "Troll" }, amount = 6, why = "He finds the living careless with names and records; his disdain is clerical, not cruel, and the living are bad at filling forms." },
  bible = "bibles/bauhaus.md", role = "questgiver", tier = "quest",
  communities = { "undercity" }, temper = { "dry" }, values = { "orderly", "proud" },
  notices = { "race", "status" },
  impression = {
    first = "Royal Overseer Bauhaus keeps the Undercity's census and treats every request as an imposition on a very great work. Beneath the sarcasm, he takes the names of the dead more seriously than anyone I've met.",
    third = "{name} met Royal Overseer Bauhaus, keeper of the Undercity census and its records of the living and the formerly living.",
  },

  greetings = {
    { id = "g_prej", when = { prejudiced = true }, text = "One of the living. How wonderful. You'll want to tell me your name, and then you'll spell it three different ways, and then you'll ask me why the census is so slow." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "Ah, my favourite living visitor. You spelled your name the same way twice, which in my office counts as a kind of friendship." },
    { id = "g_census", text = "The census office. Do state your business, preferably in fewer words than I would use." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I trust this isn't another inquiry about whether somebody's dead." },
    { id = "g_jeremiah", when = { questActive = TODO_QUEST("The Jeremiah Blues") }, text = "If it's Payson you want with that parcel, he's near the bank, under one of the walkways. Follow the smell of cockroaches, which in this city narrows it down very little." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and the census has grown by forty-three names in your absence. Not that you asked." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Your reputation has preceded you into my office, and few people's ever reach it before they do. I've made a note of it." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "You're not in my census, being both alive and from elsewhere. I mention it only because people keep asking to be added, and I keep having to disappoint them." },
    { id = "n_guild", cat = "status", when = { guild = true },
      text = "I see you wear a company's colors. Guild and tabard registration is just over there, in case you'd like to make it official and give me more paperwork." },
  },

  start = "hello",
  nodes = {
    prej_bauhaus = {
      big = true,
      lines = { { id = "prej_bauhaus_default", text = "I think the living are careless with what matters. You have names and lose them, family trees you can't recite, and you die and leave no record of where you were buried. My work is remembering the dead of Lordaeron by name, and the living make it very hard to do." } },
      choices = {
        { text = "Records are for the dead. The living have better things to do.", next = "BACK", reply = "Better things, they say, and then they die without anyone writing down where. You'll forgive me if I keep my ledgers.", fx = { align = { order = -1 }, affinity = -1 } },
        { text = "You're right. Names matter, and I'll keep mine straight.", next = "BACK", reply = "Good, and spell it properly when you sign my register. You'd be astonished how many corpses misspell their own names.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Then let me help. Whose names are missing?", next = "prej_bauhaus_calm", fx = { affinity = 1 } },
        { text = "How many names are in the census now?", next = "prej_bauhaus_why" },
      },
    },
    prej_bauhaus_why = {
      lines = { { id = "prej_bauhaus_why_default", text = "Forty thousand, more or less, and a good third of them are guesses from tombstones in Brill. Each was somebody, and I won't let them become nobody just because the Scourge was faster than the scribes." } },
      choices = { { text = "I see. Let me answer you, then.", next = "prej_bauhaus" }, { text = "Something else.", next = "BACK" } },
    },
    prej_bauhaus_calm = {
      lines = { { id = "prej_bauhaus_calm_default", text = "Now there's a question nobody asks. Most of the missing are from Andorhal and Stratholme, and I'll want them in triplicate, but the thought is very nearly touching." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_forsaken = {
      big = true,
      lines = {
        { id = "opfk_default", text = "My records sort the dead into those who serve the Dark Lady and those who serve the Lich King, and the living sort us all into one pile. You've walked among both, so tell me: are the Forsaken still Lordaeron's people, or something new?" },
      },
      choices = {
        { text = "Still Lordaeron's people. The plague didn't erase who they were.", next = "op_forsaken_r1", fx = { align = { light = 1 }, opinion = { forsaken = "people" } } },
        { text = "Something new. Lordaeron died, and good riddance to it.", next = "op_forsaken_r2", fx = { affinity = 1, align = { light = -1 }, opinion = { forsaken = "new" } } },
        { text = "They're the Horde's allies. That's all I need to know.", next = "op_forsaken_r3", fx = { trait = { practical = 1 }, opinion = { forsaken = "allies" } }, when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "I'll leave that to your ledgers, Overseer.", next = "BACK" },
      },
    },
    op_forsaken_r1 = {
      lines = { { id = "opfk_r1", text = "That is the view my ledgers take as well, since I keep the old names beside the new ones. Not everyone in the Royal Quarter thanks me for it." } },
      choices = { { text = "Something else, Overseer.", next = "BACK" } },
    },
    op_forsaken_r2 = {
      lines = { { id = "opfk_r2", text = "A clean break makes for tidy records, I'll allow, and the Dark Lady would agree with you. I still keep the old names, though, in case anyone comes asking." } },
      choices = { { text = "Something else, Overseer.", next = "BACK" } },
    },
    op_forsaken_r3 = {
      lines = { { id = "opfk_r3", text = "Then you'll find yourself on the right side of the census, which is where everyone ought to want to be." } },
      choices = { { text = "Something else, Overseer.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "o_fknew", tags = { "news" }, when = { gossip = { topic = "forsaken", stance = "people" } }, text = "Someone in the Royal Quarter mentioned you think we're still Lordaeron's people. I've made a note of it, in the margin, where I keep the kind remarks." },
        { id = "h_default", key = true, text = "Royal Overseer Bauhaus, of the Undercity census. Since our liberation from the Scourge, we have tried to keep an accurate account of the city's populace, and through a certain arcane discipline, I can reach those records." },
        { id = "h_parcel", tags = { "news" }, when = { questActive = TODO_QUEST("Better Late Than Never") },
          text = "A parcel for one Jeremiah Felstone of Lordaeron, posted more than four years ago? Are you here for the census, or to ask me if someone you knew is dead? I am asked that several times a day." },
        { id = "h_found", tags = { "news" }, when = { questRecent = { TODO_QUEST("Better Late Than Never"), days = 3 } },
          text = "Felstone, Jeremiah: before the plague, a resident of the city, and now going by Payson, as a number of us have changed our names to be rid of what we were. Wait a moment... isn't he the cockroach vendor?" },
        { id = "h_delivered", when = { questDone = TODO_QUEST("The Jeremiah Blues") },
          text = "I heard Payson received his sister's parcel and was rude to the messenger. That's the closest thing to gratitude a cockroach vendor can manage, and I've entered it in the record as such." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "You're one of the city's own, which means you're somewhere in my records under a name you may or may not still answer to. The census does not judge, {class}, it merely remembers." },
      },
      again = {
        { id = "h_again", text = "Something further? The records are patient, though I am somewhat less so." },
        { id = "h_again2", text = "Proceed. I'm keeping a tally of your questions, purely from habit." },
      },
      choices = {
        { text = "You don't think much of the living, Overseer.", next = "prej_bauhaus", when = { prejudiced = true } },
        { text = "Why keep a census of the dead?", next = "census" },
        { text = "I'd not have thought people would change their names.", next = "names" },
        { text = "Who asks you if people are dead?", next = "asks" },
        { text = "Am I in your records?", next = "me", when = { race = "Scourge" } },
        { text = "Tell me about Jeremiah Payson.", next = "payson", when = { questDone = TODO_QUEST("Better Late Than Never") } },
        { text = "I have business with the census.", next = "BUSINESS" },
        { text = "I won't keep you.", next = "END" },
      },
    },

    census = {
      lines = { { id = "ce_default", text = "Because a city that doesn't know who lives in it, in whatever sense, is not a city but a crowd. The Dark Lady wishes to rule a people, and a people must first be counted." } },
      choices = {
        { text = "How do you count people who don't want to be found?", next = "census_hidden" },
        { text = "Something else.", next = "BACK" },
      },
    },
    census_hidden = {
      lines = { { id = "ch_default", text = "With considerable patience and the occasional deathstalker. Most of them turn up eventually, usually at the bank, because even the dead like to know where their money is." } },
      choices = {
        { text = "So your records serve the Deathstalkers too.", next = "census_serve" },
        { text = "Something else.", next = "BACK" },
      },
    },
    census_serve = {
      big = true,
      lines = { { id = "cs_default", text = "My records serve the Dark Lady, and she lends them to whomever she pleases. I keep them accurate and I keep them safe, and what is done with them afterward is above my office." } },
      choices = {
        { text = "Accurate records protect the city. Good work.", next = "BACK", reply = "They do, and it is gratifying to hear someone outside this office say so. Accuracy is the only kindness a ledger can offer.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A list of names is a dangerous thing to keep.", next = "BACK", reply = "Every list is, in the wrong hands, which is why mine stay in the right ones. I'll thank you not to suggest otherwise.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    names = {
      lines = { { id = "na_default", text = "Oh, they do, and often. Some can't bear to answer to the name their mothers used, and some would rather their old debts not find them. The census records both names and judges neither." } },
      choices = {
        { text = "Did you change yours?", next = "names_own" },
        { text = "Do you count the Forsaken as Lordaeron's people, Overseer?", next = "op_forsaken" },
        { text = "Something else.", next = "BACK" },
      },
    },
    names_own = {
      lines = { { id = "no_default", text = "I did not, and that is all I intend to say on the matter. A clerk who keeps everyone else's secrets is entitled to one or two of his own." } },
      choices = {
        { text = "Understood, Overseer.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    asks = {
      lines = { { id = "as_default", text = "Everyone, sooner or later. Widows, brothers, old soldiers looking for their sergeants, and they all ask it the same way, as though the answer might be different if they're polite enough." } },
      choices = {
        { text = "What do you tell them?", next = "asks_tell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    asks_tell = {
      lines = { { id = "at_default", text = "The truth, which in this city is seldom simple. Dead is not the end of the entry anymore; there's dead, and risen, and Scourge, and missing, and I've a column for each." } },
      choices = {
        { text = "That must be hard to say aloud.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    me = {
      lines = {
        { id = "me_default", text = "Almost certainly, under the name you had when you died and possibly the one you have now. Whether you want to know what else the record says is your own decision, and I'd counsel you to think about it first." },
        { id = "me_soldier", when = { origin = "forsaken_lordaeron_soldier" }, text = "Lordaeron's army kept excellent rolls, and so do I. You'll be listed with your company, and your company will be listed as lost, which I suppose is accurate in its way." },
      },
      choices = {
        { text = "Leave it buried. I'm someone else now.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Perhaps one day I'll want to read it.", next = "BACK", fx = { trait = { curious = 1 } } },
      },
    },

    payson = {
      lines = { { id = "pa_default", text = "Jeremiah Payson sells cockroaches near the bank, and it takes a special gift to sell cockroaches. He was Felstone once, of a farming family out in the Plaguelands, and he'd sooner you didn't remind him." } },
      choices = {
        { text = "His sister wanted him to have that parcel.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A clerk, before and after. The plague changed my circumstances but not my profession, and I've chosen to see that as a kind of stability." } },
    advice = { { id = "tp_ad", text = "Write things down. Memory is unreliable in the living and positively treacherous in the dead." } },
    forsaken = { { id = "tp_forsaken", text = "Every Forsaken has a name, and every name goes into my census, whether its owner remembers it or not. It is a very great work, and nobody appreciates it, and I've learned to live with that, so to speak." } },
    lordaeron = { { id = "tp_lordaeron", text = "Lordaeron kept excellent records, and the plague burned half of them. I'm rebuilding the rest from gravestones, tax rolls and the memories of people who'd rather forget." } },
    scourge = { { id = "tp_scourge", text = "The Scourge never kept a single record of whom it took. I consider that its most unforgivable crime, though I'm told I'm in the minority. Each of them had a name." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady commissioned the census herself, and I like to think she reads it, though I suspect she has more pressing concerns. I'll keep it accurate either way." } },
    stratholme = { { id = "tp_stratholme", text = "Stratholme's rolls are the hardest to complete, because the prince killed so many in a single day. I'm still adding names, and I expect to be adding them for years." } },
    _none = { { id = "tp_none", text = "That falls outside the census, and therefore outside my interest, though not, I fear, outside your curiosity." } },
  },
}
