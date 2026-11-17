-- Royal Overseer Bauhaus, the Undercity census, near guild and tabard registration. Voice: bibles/bauhaus.md
-- A clerk of the dead with a magnificent vocabulary and no patience for people asking if their friends are dead.
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "bauhaus", id = TODO_NPC("Royal Overseer Bauhaus"), name = "Royal Overseer Bauhaus",
  bible = "bibles/bauhaus.md", role = "questgiver", tier = "quest",
  communities = { "undercity" }, temper = { "dry" }, values = { "orderly", "proud" },
  notices = { "race", "status" },
  impression = {
    first = "Royal Overseer Bauhaus keeps the Undercity's census and treats every request as an imposition on a very great work. Beneath the sarcasm, he takes the names of the dead more seriously than anyone I've met.",
    third = "{name} met Royal Overseer Bauhaus, keeper of the Undercity census and its records of the living and the formerly living.",
  },

  greetings = {
    { id = "g_census", text = "The census office. Do state your business, preferably in fewer words than I would use." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I trust this isn't another inquiry about whether somebody's dead." },
    { id = "g_jeremiah", when = { questActive = TODO_QUEST("The Jeremiah Blues") }, text = "Payson, near the bank, under one of the walkways. Follow the smell of cockroaches, which in this city narrows it down very little." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and the census has grown by forty-three names in your absence. Not that you asked." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Your reputation has preceded you into my office, which is more than most people's do. I've made a note of it." },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "You're not in my census, being both alive and from elsewhere. I mention it only because people keep asking to be added, and I keep having to disappoint them." },
    { id = "n_guild", cat = "status", when = { guild = true },
      text = "I see you wear a company's colors. Guild and tabard registration is just over there, in case you'd like to make it official and give me more paperwork." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Royal Overseer Bauhaus, of the Undercity census. Since our liberation from the Scourge, we have tried to keep an accurate account of the city's populace, and through a certain arcane discipline, I can reach those records." },
        { id = "h_parcel", tags = { "news" }, when = { questActive = TODO_QUEST("Better Late Than Never") },
          text = "A parcel for one Jeremiah Felstone of Lordaeron, posted more than four years ago? Are you here for the census, or to ask me if someone you knew is dead? I get asked that a great deal." },
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
        { text = "Why keep a census of the dead?", next = "census" },
        { text = "People really change their names?", next = "names" },
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
        { text = "So your records serve the Deathstalkers too?", next = "census_serve" },
        { text = "Something else.", next = "BACK" },
      },
    },
    census_serve = {
      big = true,
      lines = { { id = "cs_default", text = "My records serve the Dark Lady, and she lends them to whomever she pleases. I keep them accurate and I keep them safe, and what is done with them afterward is above my office." } },
      choices = {
        { text = "Accurate records protect the city. Good work.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A list of names is a dangerous thing to keep.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    names = {
      lines = { { id = "na_default", text = "Often. Some can't bear to answer to the name their mothers used, and some would rather their old debts not find them. The census records both names and judges neither." } },
      choices = {
        { text = "Did you change yours?", next = "names_own" },
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
    _none = { { id = "tp_none", text = "That falls outside the census, and therefore outside my interest, though not, I fear, outside your curiosity." } },
  },
}
