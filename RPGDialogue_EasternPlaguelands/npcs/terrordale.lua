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

P:NPC {
  key = "eris", id = TODO_NPC("Eris Havenfire"), name = "Eris Havenfire",
  bible = "bibles/terrordale.md", role = "priest", tier = "quest",
  communities = { "terrordale" }, temper = { "grim", "gentle" }, values = { "devout", "duty" },
  notices = { "class", "race" },

  impression = {
    first = "Eris Havenfire is a priestess's ghost on the mountain path above Stratholme, still counting the peasants she couldn't save on the road. She spoke softly and never once looked away from the city.",
    third = "{name} met the spirit of Eris Havenfire, a priestess who failed the refugees of Stratholme and cannot rest until they are saved.",
  },

  greetings = {
    { id = "g_ghost", text = "You can see me, then. Most who pass this way see only the mist and hurry on." },
    { id = "g_priest", when = { class = "PRIEST" }, text = "You carry the Light, and the shadow too, as every true priest must. Come closer; I have waited a long time for one of us." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back up the mountain. The road below is just as it was; it is always just as it was." },
    { id = "g_active", when = { questActive = TODO_QUEST("The Balance of Light and Shadow") }, text = "They are walking again, toward the light. Go, and do not let them fall." },
    { id = "g_done", when = { questDone = TODO_QUEST("The Balance of Light and Shadow") }, text = "The road is quiet. For the first time since the plague, it is quiet, and I owe that silence to you." },
  },

  notice = {
    { id = "n_shadow", cat = "class", when = { class = "PRIEST", form = "shadow" },
      text = "You wear the shadow openly. Good; there is no shame in it, so long as you remember why you took it up." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "You died as they died, and you came back as yourself. I wonder if any of them would have, given the chance." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Eris Havenfire, or what remains of her. When the plague came to Stratholme, the people fled along this road, and I was meant to see them safely away, and I did not." },
        { id = "h_notpriest", when = { class = { "WARRIOR", "ROGUE", "HUNTER", "MAGE", "WARLOCK", "DRUID", "SHAMAN", "PALADIN" } },
          text = "What I need cannot come from you, {class}, though I don't hold it against you. Still, you may ask what you like; it has been a long time since anyone spoke to me." },
        { id = "h_priest_before", when = { class = "PRIEST", questBefore = TODO_QUEST("The Balance of Light and Shadow") },
          text = "There is a staff that can only be made whole by one who holds both Light and shadow in balance, and the work it asks of you is the work I failed. When you are ready, I will be here, as I am always here." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Balance of Light and Shadow") },
          text = "Save them, all of them that you can, before too many fall. Every prayer and every spell you know will be tested on that road." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Balance of Light and Shadow"), days = 3 } },
          text = "You held them, priest, every soul that needed holding, and the curse on this road is lifting. Take the splinter, and finish what you began." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "A paladin of the Silver Hand, or one who walks its path. Your order was meant to guard this road, {class}, and I don't blame them, but I remember they weren't here." },
      },
      again = {
        { id = "h_again", text = "What else would you know? The mist isn't going anywhere, and neither am I." },
        { id = "h_again2", text = "Ask, if you wish. Speaking keeps the screaming further off." },
      },
      choices = {
        { text = "What happened on this road?", next = "road" },
        { text = "Why are you bound here?", next = "bound" },
        { text = "What do you want from me?", next = "task" },
        { text = "What do you make of the Argent Dawn?", next = "dawn" },
        { text = "Why does a priest need the shadow at all?", next = "xshadow", when = { class = "PRIEST" } },
        { text = "Do you think the Forsaken are damned?", next = "xforsaken", when = { race = "Scourge" } },
        { text = "Where was the Silver Hand that day?", next = "xpaladin", when = { class = "PALADIN" } },
        { text = "Rest easy, Eris.", next = "END" },
      },
    },

    road = {
      lines = { { id = "rd_default", text = "They came out of Stratholme by the hundred, farmers and bakers and children, and some were already sick and didn't know it yet. The Scourge followed them up the road, and the sick turned on the well, and I prayed until my voice failed and it wasn't enough." } },
      choices = {
        { text = "How many did you lose?", next = "road_count" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_count = {
      lines = { { id = "rc_default", text = "I stopped counting at fifty, because after fifty I was counting with the Light gone out of me. There is a post by the road where their names would be, if anyone had lived to carve them." } },
      choices = {
        { text = "No one person could have saved them all.", next = "road_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_stance = {
      big = true,
      lines = { { id = "rs_default", text = "That's what the living tell each other, and perhaps it's true. But I was the one standing on the road, and so it was mine to carry, and I carried it badly." } },
      choices = {
        { text = "Then put it down. Guilt won't bring them back.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "You carried it. That counts for something before the Light.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    bound = {
      lines = { { id = "bo_default", text = "The failure binds me, and binds them, so that the road plays itself over and over and none of us can leave it. I think the Scourge would have liked that, if it noticed us at all." } },
      choices = {
        { text = "Can the curse be broken?", next = "bound_break" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bound_break = {
      lines = { { id = "bb_default", text = "Only by doing what I could not: walking them to the light, every one who can be saved, before too many fall again. It must be a priest, one who keeps the Light and the shadow in balance, because the task needs both." } },
      choices = {
        { text = "Then I'll find you a priest.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    task = {
      lines = {
        { id = "tk_default", text = "From you, perhaps nothing more than a kind word, and it is welcome. From a priest, I would ask a great deal, but only when they have proven they can hold both halves of themselves." },
        { id = "tk_priest", when = { class = "PRIEST" }, text = "When you are ready, I will ask you to stand on that road and save the peasants that I lost. In return there is a splinter of something very old, and from it you may make a staff worthy of the work." },
      },
      choices = {
        { text = "What's this staff you speak of?", next = "task_staff", when = { class = "PRIEST" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    task_staff = {
      big = true,
      lines = { { id = "ts_default", text = "A staff that can be turned toward the Light or toward the shadow, as its bearer needs. Some priests would sooner keep only one face of it, and I won't tell you which to choose." } },
      choices = {
        { text = "I'd keep it turned to the Light, always.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'd turn it whichever way the fight needed.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    dawn = {
      big = true,
      lines = { { id = "dw_default", text = "They come up the mountain sometimes, to burn the walking dead and say a prayer for the rest. They mean well, and some of them see me, but they have Stratholme to think of and I'm only one more ghost." } },
      choices = {
        { text = "The Dawn should tend every ghost, not just the useful ones.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They're right to choose their battles. Stratholme comes first.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "argent_dawn" } } },
      },
    },

    xshadow = {
      big = true,
      lines = { { id = "xs_default", text = "Because grief and anger are real, priest, and a faith that pretends they aren't will break the first time it meets them. I had the Light without the shadow, and when the shadow came up the road, I didn't know what to do with it." } },
      choices = {
        { text = "The shadow is a tool. I'll use it without fear.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "The Light must always lead. The shadow only follows.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xforsaken = {
      big = true,
      lines = { { id = "xfo_default", text = "I don't know, and I would be a poor priestess if I pretended to. You remember who you were, and you chose to speak to a ghost rather than pass her by, and that seems to me a very undamned thing to do." } },
      choices = {
        { text = "Damned or not, I'll answer to no god for it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'd like to believe the Light hasn't left us.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpaladin = {
      lines = { { id = "xp_default", text = "Riding with the prince, I suppose, or burying their own, or already dead themselves. I've had a long time to be angry about it, {class}, and I've found it doesn't warm a ghost at all." } },
      choices = {
        { text = "I'm sorry we weren't there.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A priestess of the Church in Stratholme, set to see the refugees safely down the road. You know how that ended." } },
    advice = { { id = "tp_ad", text = "Learn your shadow before it learns you. I learned that too late." } },
    argent_dawn = { { id = "tp_ad2", text = "The Dawn fights for the living and buries the dead, and I wish them well at both." } },
    _none = { { id = "tp_none", text = "I know the road and little else now. Ask the living; they still get news." } },
  },
}
