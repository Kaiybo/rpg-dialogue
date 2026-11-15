-- Clerk Daltry, Darkshire Town Hall. Voice: bibles/daltry.md
-- Keeps the town's records. Some of them are even current.
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "daltry", id = TODO_NPC("Clerk Daltry"), name = "Clerk Daltry",
  bible = "bibles/daltry.md", role = "questgiver", tier = "quest",
  communities = { "darkshire" }, temper = { "cowardly" }, values = { "lawful", "curious" },
  notices = { "lore" },

  greetings = {
    { id = "g_records", text = "Records, permits, deeds. Which form are you here to fill in wrong?" },
    { id = "g_stalvan", when = { questActive = TODO_QUEST("The Legend of Stalvan") }, text = "The Mistmantle file. Again. Mind the dust; it's load-bearing." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I've given you a line in the register. Several, actually." },
  },

  notice = {
    { id = "n_reader", cat = "lore", when = { bookRead = "The Seven Kingdoms" },
      text = "A reader! You've no idea how rare. Most people here think a book is something you burn for warmth." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Daltry, town clerk. I keep the records of Darkshire. Births, deaths, and lately a great many entries that say 'missing, presumed wolf'." },
        { id = "h_stalvan", tags = { "news" }, when = { questActive = TODO_QUEST("The Legend of Stalvan") },
          text = "Mistmantle. Yes. Tutor to a noble family, years back, before it all went wrong. The papers are old and some are wrong. I'll find you what I can." },
        { id = "h_book", when = { questActive = TODO_QUEST("The Shadowy Search Continues") },
          text = "A blank book? I sold one about a month ago, to a nervous fellow who kept looking over his shoulder. I write down every sale. I'm a clerk." },
        { id = "h_old", text = "Half these files are out of date. The people in them moved, or died, or both. I keep them anyway. Someone should remember who lived here." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest! Does your Church keep a register of deaths? Ours is behind. Some of the entries have, ah, stopped being accurate." },
        { id = "h_files", when = { metBefore = true }, text = "I've re-filed the Night Watch reports by date. Then by street. Then by date again. It's calming. Don't judge me." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a drawer open, so I may as well." },
        { id = "h_again2", text = "Yes? Mind the ink." },
      },
      choices = {
        { text = "Can I see the records?", next = "records" },
        { text = "Do you record strangers too?", next = "strangers" },
        { text = "How many people live in Darkshire now?", next = "census" },
        { text = "What do you have on Stalvan Mistmantle?", next = "stalvan", when = { topicKnown = "stalvan" } },
        { text = "The Church keeps death registers too.", next = "priest", when = { class = "PRIEST" } },
        { text = "Thank you, Daltry.", next = "END" },
      },
    },

    records = {
      lines = {
        { id = "r_default", text = "You may look. You may not touch. You may certainly not sneeze. Some of these are older than the fog." },
      },
      choices = {
        { text = "I'll be careful.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "What's in them, mostly?", next = "records_missing" },
      },
    },
    records_missing = {
      lines = {
        { id = "rm_default", text = "Deaths. Then the deaths that walked off before the burial, which need a different form. I had to invent the form. It's a good form." },
      },
      choices = {
        { text = "A form for the walking dead?", next = "records_form" },
        { text = "Something else.", next = "BACK" },
      },
    },
    records_form = {
      lines = {
        { id = "rf_default", text = "Two columns. Date buried, and date seen again. The second column is longer than I'd like." },
      },
      choices = {
        { text = "That's horrible, Daltry.", next = "BACK", fx = { affinity = 1 } },
        { text = "That's very thorough.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
      },
    },

    strangers = {
      lines = {
        { id = "s_default", text = "With all the strange business of the last few years, I note every stranger I can. Name, purpose, road. Most give a false name. I write that down too." },
      },
      choices = {
        { text = "Am I in there?", next = "strangers_me" },
        { text = "Do you sell books as well?", next = "strangers_book" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strangers_me = {
      lines = {
        { id = "sm_default", text = "You are now. Purpose: 'asking questions'. Road: 'unclear'. Don't worry. It's a very full column." },
        { id = "sm_hero", when = { townStanding = { town = "darkshire", min = 30 } },
          text = "You're in the other book now. The short one. People the Watch speaks well of. It's mostly blank pages." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    strangers_book = {
      lines = {
        { id = "sb_default", text = "Blank ones, to scholars, mages, anyone keeping a journal. I remember every buyer for months back. It isn't a gift. It's a ledger." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    census = {
      lines = {
        { id = "cn_default", text = "Fewer than the register says. More than the graveyard says. Somewhere in between, which is where Darkshire lives." },
      },
      choices = {
        { text = "Where did the rest go?", next = "census_gone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    census_gone = {
      lines = {
        { id = "cg_default", text = "Stormwind, the ones who could. Raven Hill, the ones who couldn't. The cemetery, I mean. Nobody's lived in the village for years." },
      },
      choices = {
        { text = "I'm sorry.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "raven_hill" } } },
      },
    },

    stalvan = {
      lines = {
        { id = "st_default", text = "Mistmantle, Stalvan: last address the Moonbrook schoolhouse, in Westfall. That tells you how old the entry is. I like my records clean, and that one isn't." },
      },
      choices = {
        { text = "Could you match his handwriting?", next = "stalvan_hand" },
        { text = "Something else.", next = "BACK", fx = { learn = { "moonbrook" } } },
      },
    },
    stalvan_hand = {
      lines = {
        { id = "sh_default", text = "Against the registry signatures? Certainly. Everyone who ever lived here signed that book once. Bring me a page and I'll tell you if it's his." },
      },
      choices = {
        { text = "I'll bring you one.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    priest = {
      lines = {
        { id = "pr_default", text = "Do they? I'd give a great deal for a Church register. Half my deaths have no date, and some of my dead keep moving about." },
      },
      choices = {
        { text = "I'll ask at the Cathedral for you.", next = "BACK", fx = { affinity = 2, standing = { darkshire = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm the clerk. I write things down. I'm in the register under 'clerk', and that's all it says. I find that restful." } },
    advice = { { id = "tp_ad", text = "Sign your name clearly when you come through Darkshire. If the worst happens, it helps enormously." } },
    stalvan = { { id = "tp_stalvan", text = "There's a file. It's thin. That's the strangest thing about it." } },
    night_watch = { { id = "tp_watch", text = "Their roster changes weekly. I've stopped using ink. Pencil." } },
    ladimore = { { id = "tp_ladimore", text = "Ladimore, Morgan. Status: deceased. Then a note in Sirra's hand: 'not entirely'. I haven't found a form for that." } },
    _none = { { id = "tp_none", text = "There's no file on that. I checked. I always check." } },
  },
}
