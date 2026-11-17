-- Andron Gant, at his shop by the Apothecarium. Voice: bibles/andron.md
-- A cheerful drunk who deals in curiosities, talks too much, and has friends outside the city he shouldn't.
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "andron", id = TODO_NPC("Andron Gant"), name = "Andron Gant",
  bible = "bibles/andron.md", role = "vendor", tier = "quest",
  communities = { "undercity" }, temper = { "jovial" }, values = { "greedy", "generous" },
  notices = { "drink", "purse" },
  impression = {
    first = "Andron Gant is drunk, friendly and far too pleased to have company. He deals in old curiosities for the Apothecarium's scholars and talks about his business partners with a carelessness that made me uneasy.",
    third = "{name} met Andron Gant, a tipsy dealer in curiosities near the Undercity's Apothecarium.",
  },

  greetings = {
    { id = "g_hic", text = "Well, isn't this a surprise? Come in, come in, and pardon the... hic... the smell." },
    { id = "g_back", when = { metBefore = true }, text = "My friend! I remember you, I think, or someone with your face. Sit down, there's a stool somewhere." },
    { id = "g_tablet", when = { questActive = TODO_QUEST("Delivery to Andron Gant") }, text = "Is that the tablet? From Jediga? Oh, the scholars upstairs will weep, if they still can." },
    { id = "g_away", when = { away = 14 }, text = "Where've you been these {away}? I've had nobody to drink at but the rats, and they never buy a round." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've come up in the world since I saw you last, haven't you? I can always tell a rising star, it's my one talent." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "People are saying nice things about you around the quarter, which is more than they say about me. Drink to that?" },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 1 } },
      text = "You've had a few too! Oh, that's lovely, I hate drinking alone, and I do so much of it." },
    { id = "n_purse", cat = "purse", when = { money = { min = 50000 } },
      text = "You jingle when you walk, friend. Careful, because in this city that's the loudest sound there is." },
  },

  start = "hello",
  nodes = {
    op_alterac = {
      big = true,
      lines = {
        { id = "opal_default", text = "I deal with everyone, friend, though I don't paint the Syndicate's name on my sign. Some say Alterac's old lords had a fair grievance when Terenas took their lands, and some say Perenolde sold his allies to the orcs and his heirs ought to hang. Where do you stand?" },
      },
      choices = {
        { text = "Perenolde betrayed his allies. His heirs deserve nothing.", next = "op_alterac_r1", fx = { align = { honor = 1 }, opinion = { alterac = "traitors" } } },
        { text = "Lords lose their lands. Taking them back is only sensible.", next = "op_alterac_r2", fx = { affinity = 1, align = { honor = -1 }, opinion = { alterac = "sympathy", syndicate = "sympathy" } } },
        { text = "Alterac stood with the Horde once. I won't spit on them.", next = "op_alterac_r3", fx = { opinion = { alterac = "useful" } }, when = { race = "Orc" } },
        { text = "Dead kingdoms don't interest me, Andron.", next = "BACK" },
      },
    },
    op_alterac_r1 = {
      lines = { { id = "opal_r1", text = "Spoken like a soldier, and soldiers are terrible customers. I'll keep my friends' names to myself, then." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_alterac_r2 = {
      lines = { { id = "opal_r2", text = "Now there's a reasonable sort of person, and I know people who like reasonable sorts. Keep that thought, friend, and keep it quiet." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_alterac_r3 = {
      lines = { { id = "opal_r3", text = "Ha! You know your history, and so do my acquaintances, though they'd much rather you didn't mention it in company." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Andron Gant, dealer in old and interesting things, at your service. The apothecaries upstairs pay very well for curiosities, and I know some people who know where curiosities are." },
        { id = "h_tablet_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Delivery to Andron Gant"), days = 3 } },
          text = "The Tablet of Markri, in my own hands! Take this note to Jediga, and the payment with it. I think I counted it right; I usually do, mostly." },
        { id = "h_messenger", when = { questActive = TODO_QUEST("The Deathstalkers"), class = "ROGUE" },
          text = "Ah, yes, I've been expecting you. I trust our mutual acquaintances are pleased with what I've sent them so far, though I don't suppose they'd tell the messenger, would they?" },
        { id = "h_after", when = { questDone = TODO_QUEST("The Deathstalkers"), class = "ROGUE" },
          text = "My favorite messenger! I told them I'd rather they kept sending you, and here you are. Somebody's finally listening to me." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "A mage! You'll like my stock, or the bits I'm allowed to show you. Old highborne stuff, mostly, and some of it still hums." },
      },
      again = {
        { id = "h_again", text = "What else, friend? I'm in no hurry, and the bottle isn't either." },
        { id = "h_again2", text = "Go on, go on, I'm listening. Mostly." },
      },
      choices = {
        { text = "What sort of things do you deal in?", next = "trade" },
        { text = "Who are these people you know?", next = "friends" },
        { text = "You drink a lot for a dead man.", next = "drink" },
        { text = "Tell me about the Tablet of Markri.", next = "markri", when = { questDone = TODO_QUEST("Delivery to Andron Gant") } },
        { text = "Our acquaintances want more from you, Andron.", next = "ledger", when = { questActive = TODO_QUEST("The Deathstalkers"), class = "ROGUE" } },
        { text = "Let's do business.", next = "BUSINESS" },
        { text = "I'll leave you to your bottle.", next = "END" },
      },
    },

    trade = {
      lines = { { id = "tr_default", text = "Old books, old stones, old anything, really, as long as some scholar upstairs thinks it'll tell him how the world works. I don't ask what they do with it, because the answers are always longer than the questions." } },
      choices = {
        { text = "Where do you find these things?", next = "trade_find" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade_find = {
      lines = { { id = "tf_default", text = "I don't find anything, friend, I hardly leave the city! People bring them to me, goblins and travelers and sorts like you, and I pay them, and the apothecaries pay me a little more." } },
      choices = {
        { text = "A good business, if it's honest.", next = "trade_honest" },
        { text = "Do you ever deal with the Syndicate?", next = "op_alterac" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade_honest = {
      big = true,
      lines = { { id = "th_default", text = "Honest enough, honest enough. Everyone gets paid, nobody gets hurt, and if a few of my friends are people the Dark Lady wouldn't invite to dinner, well, she doesn't invite me either." } },
      choices = {
        { text = "Careful, Andron. Somebody might be listening.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Who's to know? Keep your friends quiet and rich.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    friends = {
      lines = { { id = "fr_default", text = "Oh, all sorts! There's Jediga out in Azshara, who's very sharp, and some gentlemen up in the Alterac hills who like to know what goes on in the city. They're very generous for gentlemen in the hills." } },
      choices = {
        { text = "What do they want to know?", next = "friends_know" },
        { text = "Something else.", next = "BACK" },
      },
    },
    friends_know = {
      lines = { { id = "fk_default", text = "Little things, nothing important! Who's coming and going, what the Apothecarium's buying, that sort of gossip. I write it all down in a book so I don't forget, because I do forget, terribly." } },
      choices = {
        { text = "You write it down? That seems unwise.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    drink = {
      lines = { { id = "dr_default", text = "I can't taste a thing, friend, not since the plague, but I remember that it used to make the room warm. I keep drinking in case it remembers too." } },
      choices = {
        { text = "That's sad, Andron.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Then pour me one.", next = "BACK", fx = { affinity = 2 } },
      },
    },

    markri = {
      lines = { { id = "ma_default", text = "A highborne tablet, and Markri was very good at calling things up, elementals especially. Some of the mages upstairs want to learn the old spells, and they'll pay a fortune to be the first to try them." } },
      choices = {
        { text = "Is that safe?", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ledger = {
      lines = { { id = "le_default", text = "Of course they do. The ledger's on the bookshelf behind me; take it with my regards, and tell them I'd like it to be you who comes next time, because you've a trustworthy face." } },
      choices = {
        { text = "I'll be sure to tell them.", next = "BACK", fx = { trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A merchant before the plague, and a merchant after, only now I can't taste the wine. That's the whole tragedy, really." } },
    advice = { { id = "tp_ad", text = "Always count the coin twice, friend, and if you can't, find someone sober to do it." } },
    syndicate = { { id = "tp_syndicate", text = "The Syndicate? Never heard of them, no, not at all. Is that the time?" } },
    _none = { { id = "tp_none", text = "No idea, friend, but I know someone who might, for a price. Everybody knows someone." } },
  },
}
