-- Clerk Daltry, Darkshire Town Hall. Voice: bibles/daltry.md
-- Keeps the town's records. Some of them are even current.
local P = RPGDialogueAPI:Pack("rpgd.duskwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "daltry", id = TODO_NPC("Clerk Daltry"), name = "Clerk Daltry",
  bible = "bibles/daltry.md", role = "questgiver", tier = "quest",
  communities = { "darkshire" }, temper = { "cowardly" }, values = { "lawful", "curious" },
  notices = { "lore" },

  impression = {
    first = "Clerk Daltry keeps Darkshire's records with a dry wit and too many entries marked missing, presumed wolf. He made the joke because the alternative is weeping into the ledgers.",
    third = "{name} met Clerk Daltry, who keeps the records of Darkshire, including far too many names marked missing.",
  },

  greetings = {
    { id = "g_records", text = "Records, permits and deeds, all in order. Which form are you here to fill in wrong?" },
    { id = "g_stalvan", when = { questActive = TODO_QUEST("The Legend of Stalvan") }, text = "The Mistmantle file again, is it? Mind the dust, because I'm fairly sure it's load-bearing." },
    { id = "g_back", when = { metBefore = true }, text = "You again! I've given you a line in the register, several lines, actually." },
    { id = "g_away", when = { away = 14 }, text = "Oh! You've been gone {away}, and I very nearly filed you under missing, presumed wolf. I'm delighted to have to cross it out." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown rather formidable since I last wrote you into the register. I'll need a new line for that, possibly a new column." },
    { id = "g_word_helped", when = { word = "helped" }, text = "I've recorded that you've been helping folk in town, and it's the nicest entry I've written all week. Most of mine are about wolves." },
  },

  notice = {
    { id = "n_reader", cat = "lore", when = { bookRead = "The Seven Kingdoms" },
      text = "A reader! You've no idea how rare that is; most people here think a book is something you burn for warmth." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Too many, and most of them say presumed wolf. I joke because the alternative is weeping into the ledgers. If your spirits know names, I'd take them." } },
      choices = {
        { text = "Keep the records true, Daltry. Every one of them had a family.", next = "BACK", reply = "I will, then, every name I can find, even the ones nobody comes asking after. Somebody ought to remember them besides the wolves.", fx = { align = { order = 1 } } },
        { text = "Burn the ledger. Counting the dead won't bring them back.", next = "BACK", reply = "Burn it? I'd sooner burn my own fingers, which given my luck with candles is not out of the question. Somebody has to know who's gone.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "It does, and I keep it, and every week I strike a few names off for reasons I'd rather not write. The Night Watch is mostly farmers with borrowed swords, so a trained arm on the roll would be a fine change." } },
      choices = {
        { text = "Put my name on it. I'll stand with the Watch.", next = "BACK", reply = "Gladly, and I'll write it neatly, which is the closest thing to bravery I possess. The commander will be very pleased to have a real fighter on the roll.", fx = { align = { order = 1 } } },
        { text = "Keep my name off it. I fight for my own reasons.", next = "BACK", reply = "As you like; I'll leave the line blank and say nothing. Just don't end up in my other ledger, the one with the wolves in it.", fx = { align = { order = -1 } } },
        { text = "Something else, Daltry.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "More than I care to count, and I'm paid to count. The Nightbane worgs come down from the east of the wood, and they're cleverer than wolves have any right to be, so watch your back trail." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "More than I care to count, and the Nightbane worgs from the east of the wood are cleverer than wolves have any right to be. Keep your {pet} close, {class}, because the worgs out there don't take kindly to rivals." },
      },
      choices = {
        { text = "I'll hunt the worgs down and balance your ledger.", next = "BACK", reply = "That's the finest offer my ledger's had in a year, and I mean that as a clerk and a coward both. Do mind the eastern trails, though.", fx = { align = { honor = 1 } } },
        { text = "The worgs are the wood's business. I hunt what pays.", next = "BACK", reply = "Practical of you, and practicality is something I respect, from behind a nice thick door. I'll keep counting, then, and hoping.", fx = { align = { honor = -1 } } },
        { text = "Something else, Daltry.", next = "BACK" },
      },
    },
    xrogue = {
      lines = { { id = "xro_default", text = "Moved, stolen or borrowed by Councilman Millstipe for one of his letters, it's all the same to my ledger. I'll thank you not to move any more of them, because I've only one good quill left." } },
      choices = {
        { text = "Your records are safe from me, clerk.", next = "BACK", reply = "That's very kind of you, though it's exactly what someone planning to move them would say. I'll keep my good quill in my pocket anyway.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A ledger's only paper, and paper can be changed.", next = "BACK", reply = "Please don't say that within earshot of the council, because half of them would agree with you. I'll be counting my pages twice tonight.", fx = { align = { honor = -1 } } },
        { text = "Which records are missing?", next = "records_missing" },
      },
    },
    xmage = {
      lines = { { id = "xma_default", text = "Would they? Then they'd outlast the people they're about, which in Darkshire isn't much of a feat. The fog gets into everything, mage, so I'd not say no to anything that keeps the damp off." } },
      choices = {
        { text = "Records deserve care. They should be kept properly.", next = "BACK", reply = "Thank you; it's a rare day someone takes ink and paper as seriously as I do. If you find a spell for the mildew, I'd be grateful to the end of my days.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the damp take them. The dead won't mind.", next = "BACK", reply = "The dead won't, perhaps, but their widows come asking, and I'd rather have an answer than a damp smudge. I'll keep them dry myself, then.", fx = { align = { order = -1 } } },
        { text = "What do your records hold?", next = "records" },
      },
    },
    xlock = {
      lines = { { id = "xlo_default", text = "That's either the most comforting thing anyone's said to me this month or the worst, and I can't decide which. I write missing, presumed wolf, because nobody in this town wants me to write what you just said." } },
      choices = {
        { text = "Write the truth, Daltry, even if it frightens them.", next = "BACK", reply = "Write it in my own hand, and sign my name below it? You're braver than I am, though I suppose that's not a very high wall to climb.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Keep writing wolf, Daltry. The truth would only frighten them.", next = "BACK", reply = "Wolf it is, then, and may the Light forgive me for the tidy lie. It's the only word in my ledger that lets people sleep.", fx = { align = { honor = -1 } } },
        { text = "Who are the strangers in your book?", next = "strangers" },
      },
    },
    druid_talk = {
      lines = { { id = "dt_default", text = "That it was called Brightwood before the Worgen, and that every year since, the treeline creeps darker by about a field's width. I keep the numbers. Nobody in Stormwind has asked to see them." } },
      choices = {
        { text = "Thank you. Let me ask something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I suspect they were filed, which I can hardly fault them for, being a clerk myself. But the dead at Raven Hill don't wait for a reply, so I've started writing 'urgent' across the top in red ink, which feels terribly bold of me." } },
      choices = {
        { text = "Keep writing. Proper channels matter, even slow ones.", next = "BACK", reply = "I will, though my red ink is running low and my patience lower. Someone in Stormwind must read them eventually, if only to complain about the color.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Stop writing, Daltry. I'll deal with Raven Hill myself.", next = "BACK", reply = "You'd do that? I'll make a note of it, and I'll make a note of you, in the good ledger, which is very short. Do come back to be counted.", fx = { align = { order = -1 } } },
        { text = "Something else, Daltry.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I've a whole drawer of letters to the Cathedral asking for one of you, every one stamped received and none of them answered." },
        { id = "h_druidx", when = { class = "DRUID" },
          text = "A druid. I've been filing reports about the forest rotting for eight years. Perhaps you'll be the first to read one." },
        { id = "h_default", text = "I'm Daltry, the town clerk, and I keep the records of Darkshire: births, deaths, and lately a great many entries that say 'missing, presumed wolf'." },
        { id = "h_stalvan", tags = { "news" }, when = { questActive = TODO_QUEST("The Legend of Stalvan") },
          text = "Mistmantle, yes, a tutor to a noble family years back, before it all went wrong. The papers are old and some of them are wrong, but I'll find you what I can." },
        { id = "h_book", when = { questActive = TODO_QUEST("The Shadowy Search Continues") },
          text = "A blank book? I sold one about a month ago, to a nervous fellow who kept looking over his shoulder. I write down every sale, you see, being a clerk." },
        { id = "h_old", text = "Half these files are out of date, because the people in them moved, or died, or both. I keep them anyway, since someone should remember who lived here." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest! Does your Church keep a register of deaths? Ours has fallen behind, and some of the entries have, ah, stopped being accurate." },
        { id = "h_files", when = { metBefore = true }, text = "I've re-filed the Night Watch reports by date, then by street, then by date again. I find it calming, so please don't judge me." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Good; the Watch keeps a list of those too, and it's the only list in my office that ever gets shorter for good reasons." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, is it? Then you'll be adding to my wolf entries, though for once on the right side of the ledger." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman. Let me guess: you've come to tell me the spirits know where my missing persons went. I'd mark them found, presumed spirit, if it helped." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a drawer open, so I may as well help." },
        { id = "h_again2", text = "Yes? Do mind the ink, though." },
      },
      choices = {
        { text = "What do your records say about the forest?", next = "druid_talk", when = { class = "DRUID" } },
        { text = "Can I see the records?", next = "records" },
        { text = "I'd guess you keep a record of strangers too.", next = "strangers" },
        { text = "How many people live in Darkshire now?", next = "census" },
        { text = "What do you have on Stalvan Mistmantle?", next = "stalvan", when = { topicKnown = "stalvan" } },
        { text = "The Church keeps death registers too.", next = "priest", when = { class = "PRIEST" } },
        { text = "Your ledgers need a proper cross-index.", next = "gnome", when = { race = "Gnome" } },
        { text = "Some of your missing records were probably just moved.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Your records would last longer with a preserving charm.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Darkshire must keep a roll of its fighters, Clerk.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "The worgs must account for a good many of your missing.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Some of your missing folk may not be dead, Daltry.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "The Cathedral never answered your letters, it seems.", next = "xapala", when = { class = "PALADIN" } },
        { text = "How many entries are marked missing, Daltry?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
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
        { text = "A form for the walking dead. Only in Darkshire.", next = "records_form" },
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
        { text = "I suppose I'm in there now.", next = "strangers_me" },
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
        { id = "sb_default", text = "Blank ones, to scholars, mages and anyone keeping a journal, and I remember every buyer for months back. It isn't a gift, just a ledger I keep in my head." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    census = {
      lines = {
        { id = "cn_default", text = "Fewer than the register says, and more than the graveyard says. I've stopped trying to make the two agree." },
      },
      choices = {
        { text = "Where did the rest go?", next = "census_gone" },
        { text = "Something else.", next = "BACK" },
        { text = "Stormwind sent me to check your register against the Crown's.", tag = "Deceive", next = "census_padded",
          check = { pass = { any = { { disposition = { min = 55 } }, { class = "PRIEST" }, { origin = "human_minor_noble" } } } },
          fail = { next = "census_papers", fx = { affinity = -1 } } },
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
        { id = "st_default", text = "Mistmantle, Stalvan: last recorded address, the Moonbrook schoolhouse in Westfall, an address that hasn't meant anything in years. I like my records clean, and that one isn't." },
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
        { id = "pr_default", text = "Do they? I'd give a month's wages for a Church register, because half my deaths have no date, and some of my dead keep moving about." },
      },
      choices = {
        { text = "I'll ask at the Cathedral for you.", next = "BACK", fx = { affinity = 2, standing = { darkshire = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    census_padded = {
      lines = {
        { id = "cp_default", text = "Against the Crown's? Oh, oh dear, I did wonder when someone would come. Yes, all right, there are names on the register that ought to be in the other column, and I've, ah, not quite got round to moving them." },
        { id = "cp_after", text = "On purpose, I'm afraid, because the Crown counts heads before it counts letters, and a town of four hundred gets an answer where a town of two hundred gets two lines and a seal. Please don't strike them off; it's the only thing I can do for Darkshire with a pen." },
      },
      choices = {
        { text = "Your secret's safe. I lied; Stormwind didn't send me.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll leave the register as it is.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    census_papers = {
      lines = {
        { id = "cpp_default", text = "From Stormwind? Then you'll have papers, with a seal, and a clerk's countersignature, because they always send those. No? Then I'm afraid the register stays in its drawer." },
        { id = "cpp_default2", text = "The Crown hasn't sent anyone to look at Darkshire in four years, and it certainly wouldn't send someone who didn't know the form number. Nice try, though." },
      },
      choices = {
        { text = "Worth a try.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnome = {
      lines = { { id = "gn_default", text = "They need a great many things, starting with fewer entries in the missing column. But if you'd like to draw me up a cross-index, I'll happily pretend I understand it." } },
      choices = {
        { text = "Index the dead by where they were last seen.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everything in Darkshire is written down somewhere, and most of it's written down by me. Ask me about any of this, and mind the ink." },
    },
    background = { { id = "tp_bg", text = "I'm the clerk, and I write things down. I'm in the register under 'clerk', and that's all it says about me, which I find restful." } },
    advice = { { id = "tp_ad", text = "Sign your name clearly when you come through Darkshire, because if the worst happens, it helps enormously." } },
    stalvan = { { id = "tp_stalvan", text = "There's a file on him, but it's thin, and that's the strangest thing about it." } },
    night_watch = { { id = "tp_watch", text = "Their roster changes so often that I've stopped using ink and gone over to pencil." } },
    ladimore = { { id = "tp_ladimore", text = "Ladimore, Morgan: status deceased, and then a note in Sirra's hand that says 'not entirely'. I haven't found a form for that yet." } },
    _none = { { id = "tp_none", text = "There's no file on that; I checked, as I always check." } },
    raven_hill = { { id = "tp_raven_hill", text = "The Raven Hill registers are the saddest papers in my office, because half the names have a second date beside them now. I keep them up to date anyway; somebody has to." } },
    dark_riders = { { id = "tp_dark_riders", text = "I've a file on the Dark Riders, and it's very thin, because nobody who's seen them up close has come back to make a statement. Make of that what you will." } },
    scourge = { { id = "tp_scourge", text = "I've copied letters from Lordaeron's survivors for the council's records, and I had to stop twice to take a walk. They're the only papers in my office I've never re-read." } },
    varian = { { id = "tp_varian", text = "The council's letters to the king are filed in triplicate, and since he went missing they're addressed to the Highlord instead. The replies fit in one folder, and it's a thin one." } },
  },
}
