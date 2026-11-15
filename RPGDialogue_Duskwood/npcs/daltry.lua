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
    { id = "g_records", text = "Records, permits and deeds, all in order. Which form are you here to fill in wrong?" },
    { id = "g_stalvan", when = { questActive = TODO_QUEST("The Legend of Stalvan") }, text = "The Mistmantle file again, is it? Mind the dust, because I'm fairly sure it's load-bearing." },
    { id = "g_back", when = { metBefore = true }, text = "You again! I've given you a line in the register, several lines, actually." },
  },

  notice = {
    { id = "n_reader", cat = "lore", when = { bookRead = "The Seven Kingdoms" },
      text = "A reader! You've no idea how rare that is; most people here think a book is something you burn for warmth." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Daltry, the town clerk, and I keep the records of Darkshire: births, deaths, and lately a great many entries that say 'missing, presumed wolf'." },
        { id = "h_stalvan", tags = { "news" }, when = { questActive = TODO_QUEST("The Legend of Stalvan") },
          text = "Mistmantle, yes, a tutor to a noble family years back, before it all went wrong. The papers are old and some of them are wrong, but I'll find you what I can." },
        { id = "h_book", when = { questActive = TODO_QUEST("The Shadowy Search Continues") },
          text = "A blank book? I sold one about a month ago, to a nervous fellow who kept looking over his shoulder. I write down every sale, you see, being a clerk." },
        { id = "h_old", text = "Half these files are out of date, because the people in them moved, or died, or both. I keep them anyway, since someone should remember who lived here." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest! Does your Church keep a register of deaths? Ours has fallen behind, and some of the entries have, ah, stopped being accurate." },
        { id = "h_files", when = { metBefore = true }, text = "I've re-filed the Night Watch reports by date, then by street, then by date again. I find it calming, so please don't judge me." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a drawer open, so I may as well help." },
        { id = "h_again2", text = "Yes? Do mind the ink, though." },
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
        { id = "r_default", text = "You may look, but you may not touch, and you most certainly may not sneeze, because some of these are older than the fog." },
      },
      choices = {
        { text = "I'll be careful.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "What's in them, mostly?", next = "records_missing" },
      },
    },
    records_missing = {
      lines = {
        { id = "rm_default", text = "Deaths, mostly, and then the deaths that walked off before the burial, which need a different form. I had to invent that form myself, and it's a good form." },
      },
      choices = {
        { text = "A form for the walking dead?", next = "records_form" },
        { text = "Something else.", next = "BACK" },
      },
    },
    records_form = {
      lines = {
        { id = "rf_default", text = "It has two columns, the date buried and the date seen again, and the second column is longer than I'd like." },
      },
      choices = {
        { text = "That's horrible, Daltry.", next = "BACK", fx = { affinity = 1 } },
        { text = "That's very thorough.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
      },
    },

    strangers = {
      lines = {
        { id = "s_default", text = "With all the strange business of the last few years, I note every stranger I can, with name, purpose and road. Most give a false name, and I write that down too." },
      },
      choices = {
        { text = "Am I in there?", next = "strangers_me" },
        { text = "Do you sell books as well?", next = "strangers_book" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strangers_me = {
      lines = {
        { id = "sm_default", text = "You are now: purpose 'asking questions', road 'unclear'. Don't worry, you're in very good company, because it's a very full column." },
        { id = "sm_hero", when = { townStanding = { town = "darkshire", min = 30 } },
          text = "You're in the other book now, the short one, for people the Watch speaks well of. It's mostly blank pages, I'm afraid." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    strangers_book = {
      lines = {
        { id = "sb_default", text = "Blank ones, to scholars, mages and anyone keeping a journal, and I remember every buyer for months back. It isn't a gift, mind you; it's a ledger." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    census = {
      lines = {
        { id = "cn_default", text = "Fewer than the register says, and more than the graveyard says. Somewhere in between, which is where Darkshire lives." },
      },
      choices = {
        { text = "Where did the rest go?", next = "census_gone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    census_gone = {
      lines = {
        { id = "cg_default", text = "To Stormwind, the ones who could, and to Raven Hill, the ones who couldn't. The cemetery, I mean, since nobody's lived in the village for years." },
      },
      choices = {
        { text = "I'm sorry.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "raven_hill" } } },
      },
    },

    stalvan = {
      lines = {
        { id = "st_default", text = "Mistmantle, Stalvan: last recorded address, the Moonbrook schoolhouse in Westfall, which tells you how old the entry is. I like my records clean, and that one isn't." },
      },
      choices = {
        { text = "Could you match his handwriting?", next = "stalvan_hand" },
        { text = "Something else.", next = "BACK", fx = { learn = { "moonbrook" } } },
      },
    },
    stalvan_hand = {
      lines = {
        { id = "sh_default", text = "Against the registry signatures? Certainly, since everyone who ever lived here signed that book once. Bring me a page and I'll tell you if it's his." },
      },
      choices = {
        { text = "I'll bring you one.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    priest = {
      lines = {
        { id = "pr_default", text = "Do they? I'd give a great deal for a Church register, because half my deaths have no date, and some of my dead keep moving about." },
      },
      choices = {
        { text = "I'll ask at the Cathedral for you.", next = "BACK", fx = { affinity = 2, standing = { darkshire = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm the clerk, and I write things down. I'm in the register under 'clerk', and that's all it says about me, which I find restful." } },
    advice = { { id = "tp_ad", text = "Sign your name clearly when you come through Darkshire, because if the worst happens, it helps enormously." } },
    stalvan = { { id = "tp_stalvan", text = "There's a file on him, but it's thin, and that's the strangest thing about it." } },
    night_watch = { { id = "tp_watch", text = "Their roster changes so often that I've stopped using ink and gone over to pencil." } },
    ladimore = { { id = "tp_ladimore", text = "Ladimore, Morgan: status deceased, and then a note in Sirra's hand that says 'not entirely'. I haven't found a form for that yet." } },
    _none = { { id = "tp_none", text = "There's no file on that; I checked, as I always check." } },
  },
}
