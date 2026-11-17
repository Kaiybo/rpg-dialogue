-- Terrordale: Augustus the Touched, the mad mushroom merchant who never left the inn, and Eris Havenfire,
-- the priestess's ghost on the mountain path who still counts the peasants she couldn't save. Voice: bibles/terrordale.md
local P = RPGDialogueAPI:Pack("rpgd.easternplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "augustus", id = TODO_NPC("Augustus the Touched"), name = "Augustus the Touched",
  bible = "bibles/terrordale.md", role = "vendor", tier = "quest",
  communities = { "terrordale" }, temper = { "eager", "chatty" }, values = { "profit", "friendly" },
  notices = { "race", "class", "craft", "hunger" },

  impression = {
    first = "Augustus the Touched is a dead man selling mushrooms in a dead town, and he is cheerfully, completely mad. Somewhere under the giggling he knows exactly what happened to Terrordale, and I think the madness is how he stands it.",
    third = "{name} met Augustus the Touched, an undead mushroom seller in Terrordale who never left the inn where the Scourge found him.",
  },

  greetings = {
    { id = "g_shop", text = "A customer, a real live customer, or at least a customer who's still walking about! Come in, come in, and mind the mold on the step, because it's for sale." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Nobody comes back, you know, they come once and look at me sideways and go, but you came back, and that makes you my favourite." },
    { id = "g_book", when = { questActive = TODO_QUEST("Augustus' Receipt Book") }, text = "Have you got it? My book, my lovely book, the one with all the numbers in it? Upstairs at the inn, I'm sure of it, or nearly sure." },
    { id = "g_open", when = { questDone = TODO_QUEST("Augustus' Receipt Book") }, text = "Open for business, open for business! Every price is written down now, and every one of them is perfectly insane." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, were you? I counted the days on the wall, but the wall ran out, so I counted the mushrooms instead, and some of them got eaten." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Night already? The ghouls are louder at night, but they never buy anything, so I don't mind them." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "Oh, you're like me! Not the mad part, I hope, though you never can tell from the outside." },
    { id = "n_hungry", cat = "hunger", when = { hp = { max = 0.5 } },
      text = "You look half eaten already, and I happen to have mushrooms, and isn't that the most marvellous coincidence?" },
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "An herbalist! Don't you go picking my stock off the walls, mind, because I counted it. Twice. Possibly three times." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Augustus, merchant of Terrordale, purveyor of the finest fungus in all of Lordaeron! My prices are insane, which is fitting, because so am I, or so the dwarf keeps telling me." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Augustus' Receipt Book") },
          text = "I'm ready for business, I really am, except that I can't find my receipt book, and a merchant without his receipts is just a man standing in a room full of mushrooms." },
        { id = "h_active", when = { questActive = TODO_QUEST("Augustus' Receipt Book") },
          text = "Upstairs at the inn, that's where I had my room, and that's where the book will be, unless the ghouls have learned to read, which would be very bad for business." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Augustus' Receipt Book"), days = 3 } },
          text = "Every page is full, every one, and I'd forgotten how much I used to sell! It's a glorious day, {name}, an insanely glorious day." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "Another free one! The Undercity sends people out now and then, and they always ask me to come home with them, and I always tell them this is home." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "A paladin, and you haven't hit me yet! That's a very good start, {class}, and I'd like it to continue, so let's talk about mushrooms instead." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest, a priest! Don't go praying at me too hard, {class}, because the last one who tried made my teeth itch for a week." },
      },
      again = {
        { id = "h_again", text = "What else, what else? I've got all day, and all night, and all of the next day as well." },
        { id = "h_again2", text = "Ask me something! Nobody asks me anything except the dwarf, and he only asks me to stop humming." },
      },
      choices = {
        { text = "What exactly are you selling?", next = "wares" },
        { text = "What happened to you here?", next = "inn" },
        { text = "Who's the dwarf in your house?", next = "egan" },
        { text = "Why do they call you the Touched?", next = "touched" },
        { text = "Where did you lose your receipt book?", next = "book", when = { questBefore = TODO_QUEST("Augustus' Receipt Book") } },
        { text = "You're free-willed like me. Why stay out here?", next = "xforsaken", when = { race = "Scourge" } },
        { text = "Could the Light ease your mind, Augustus?", next = "xlight", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Let's do business, Augustus.", next = "BUSINESS", when = { questDone = TODO_QUEST("Augustus' Receipt Book") } },
        { text = "I'll come back later.", next = "END" },
      },
    },

    wares = {
      lines = {
        { id = "wa_default", text = "Cave mold, dried bolete, and a grab bag that I won't tell you what's inside, because that would spoil the grab! Everything grows in Terrordale now, so long as it likes the dark and doesn't mind the smell." },
      },
      choices = {
        { text = "Who buys mushrooms in the Plaguelands?", next = "wares_who" },
        { text = "What's actually in the grab bag?", next = "wares_bag" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wares_who = {
      lines = {
        { id = "ww_default", text = "Adventurers, mostly, who get hungry on the way to Stratholme and find there's nothing else between here and the gates. The Argent folk from the chapel came once, but they bought one bolete and looked at it for a long time and never came back." },
      },
      choices = {
        { text = "Food is food out here. I'd buy from you.", next = "wares_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wares_stance = {
      big = true,
      lines = { { id = "ws_default", text = "You would? Oh, I could weep, if I still could! But the dwarf says I ought to charge less, because people here have so little, and I say a man who charges less is a man who doesn't respect his mushrooms." } },
      choices = {
        { text = "Charge what you like. It's your shop and your risk.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Egan's right. Folk out here deserve a fair price.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll leave the pricing to you two.", next = "BACK" },
      },
    },
    wares_bag = {
      lines = { { id = "wb_default", text = "Things! Wonderful things, or at least things, from the rooms nobody's living in any more, and I'll swear on my book that most of it is clean. I only have one bag left, so I'd make up my mind quickly." } },
      choices = {
        { text = "You're selling dead men's belongings?", next = "wares_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wares_dead = {
      big = true,
      lines = { { id = "wd_default", text = "I'm a dead man selling them, so I don't see the trouble! Nobody's coming back for their boots, {class}, and a pair of boots on a living traveller does more good than a pair under a bed in a town full of ghouls." } },
      choices = {
        { text = "The dead's things should be left with the dead.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Better used than rotting. You're right about that.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Let's talk about something less grim.", next = "BACK" },
      },
    },

    inn = {
      lines = { { id = "in_default", text = "I was stopping at the inn on my way to Stratholme with a cart of good things to sell, and the plague came up the road faster than I did. Everyone in the common room got sick, and then everyone got up again, and most of them went off with the Scourge, but I stayed for the bill." } },
      choices = {
        { text = "You stayed to pay your bill?", next = "inn_bill" },
        { text = "Do you remember the people at the inn?", next = "inn_people" },
        { text = "Something else.", next = "BACK" },
      },
    },
    inn_bill = {
      lines = { { id = "ib_default", text = "Somebody had to! The innkeeper walked off with the ghouls and never wrote me a receipt, and that's been troubling me ever since, because a debt that nobody can collect is still a debt." } },
      choices = {
        { text = "That's oddly honourable, Augustus.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    inn_people = {
      big = true,
      lines = { { id = "ip_default", text = "A tinker with a red scarf, two soldiers playing cards, and a girl who sang badly, and I can see their faces some days and not others. I think the Scourge took the part of me that held on to names, and left the part that holds on to prices, which seems a poor bargain." } },
      choices = {
        { text = "Then I'll remember them for you. That's a promise.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Forgetting might be a mercy. Let them go.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    egan = {
      lines = { { id = "eg_default", text = "Egan! He came looking for the dead and found me instead, and since I wasn't the sort of dead he was looking for, he moved into the back room. He builds machines that hum and I sell mushrooms that don't, and we get along famously." } },
      choices = {
        { text = "He's trying to free the Stratholme spirits, isn't he?", next = "egan_work" },
        { text = "Something else.", next = "BACK" },
      },
    },
    egan_work = {
      lines = { { id = "ew_default", text = "He is, and he's very serious about it, and he tells me it's compassion that keeps him going and not hate, though I've heard him swear at the Scourge in his sleep. Go and see him if you're brave; he's always wanting someone to carry his blaster into the city." } },
      choices = {
        { text = "I'll go and find him.", next = "BACK", fx = { learn = { "stratholme" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    touched = {
      lines = { { id = "to_default", text = "Because something touched me, and I don't remember what, and it left fingerprints on the inside of my head! The Scourge called to me once, a great cold voice that wanted me to walk north, and I said I had a shop to run, and it stopped calling." } },
      choices = {
        { text = "You refused the Lich King's call?", next = "touched_call" },
        { text = "Something else.", next = "BACK" },
      },
    },
    touched_call = {
      big = true,
      lines = { { id = "tc_default", text = "Is that whose it was? I thought it was the tax collector. Whoever it was, I told it no, and I think the no is the mad part of me, because a sensible man would have gone." } },
      choices = {
        { text = "Then your madness saved you. Hold on to it.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "That wasn't madness. That was your own will.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    book = {
      lines = { { id = "bk_default", text = "In my room at the inn, or under it, or behind it, but somewhere at the inn! The ghouls wander in and out of there all day, so you'll want a sword or a spell or a very good excuse." } },
      choices = {
        { text = "I'll fetch your book for you.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "Why does a receipt book matter so much?", next = "book_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    book_why = {
      lines = { { id = "bw_default", text = "Because it says who I was! Every sale I ever made is in there, every name and every copper, and when I read it I remember being a merchant instead of being whatever this is." } },
      choices = {
        { text = "Then I'll bring it back to you.", next = "BUSINESS", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xforsaken = {
      big = true,
      lines = { { id = "xf_default", text = "The Banshee Queen's people are very kind and very organised, and they wanted me to fill in forms in the Undercity and swear oaths. I've got a shop, {class}, and I don't think a shop needs a queen." } },
      choices = {
        { text = "The Dark Lady freed us. We owe her our oaths.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Good for you. Nobody owns a free mind.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlight = {
      big = true,
      lines = { { id = "xl_default", text = "It might, and it might shake the whole of me loose while it's at it, and then where would my customers be? I'll keep my mind the shape it is, {class}, cracks and all, if it's all the same to you." } },
      choices = {
        { text = "The Light would heal you, not unmake you.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Your mind, your choice. I'll not push the Light on you.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A merchant on the road to Stratholme, once, with a cart and a mule. The mule went north with the Scourge, and I've never forgiven him." } },
    advice = { { id = "tp_ad", text = "Always get a receipt! I didn't, once, and look at me now." } },
    stratholme = { { id = "tp_strat", text = "I was going there to sell, and now it's a city full of customers who only want to eat people. Very bad for trade." } },
    _none = { { id = "tp_none", text = "No idea, none at all, but I've got a mushroom that looks a bit like it, if that helps." } },
  },
}
