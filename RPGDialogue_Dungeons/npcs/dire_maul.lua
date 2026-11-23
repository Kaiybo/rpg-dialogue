-- Dire Maul: Lorekeeper Lydros, the ghost librarian of the Athenaeum; Old Ironbark, the
-- treant held in the East wing who opens Pusillin's way; and Prince Tortheldrin, last
-- Highborne prince of Eldre'Thalas, who speaks before he fights.
-- Voices: bibles/dg_lydros.md, bibles/dg_ironbark.md, bibles/dg_tortheldrin.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Lorekeeper Lydros: Highborne scholar's ghost, keeper of the Athenaeum's books.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_lydros", id = TODO_NPC("Lorekeeper Lydros"), name = "Lorekeeper Lydros", title = "Lorekeeper",
  bible = "bibles/dg_lydros.md", role = "scholar", tier = "quest", gender = "male",
  temper = { "dry", "patient" }, values = { "learned", "proud" },
  notices = { "class", "race" },
  impression = {
    first = "Ten thousand years of shelving books, and still offended by a dog-eared page.",
    third = "{name} met Lorekeeper Lydros, the shade who still keeps the Athenaeum of Eldre'Thalas.",
  },

  greetings = {
    { id = "g_default", text = "Mind the shelves. Some of these volumes are older than your kingdom, and all of them are better company." },
    { id = "g_foror", when = { questActive = TODO_QUEST("The Forging of Quel'Serrar") }, text = "You carry the task I set you. A blade like Quel'Serrar is not forged by those who dawdle in libraries." },
  },

  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "A kaldorei in the Athenaeum. Your ancestors called mine arrogant, and they were right, but they never once returned a book late." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A wielder of the arcane. Then you know what that hunger costs, and you will understand why this city went quiet." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Lydros, lorekeeper of Eldre'Thalas. When the Highborne were cast out, we carried our learning here, and I have kept it ever since, though my body gave out long before my duty did." },
        { id = "h_mage", when = { class = "MAGE" }, text = "You have the look of someone who has read too late into the night. Welcome, then. Lydros keeps this library, and he forgives most sins except carelessness." },
      },
      again = {
        { id = "h_again", text = "Another question? Ask it precisely." },
        { id = "h_again2", text = "The books are patient. I am nearly so." },
      },
      choices = {
        { text = "What is this place?", next = "athenaeum" },
        { text = "How did you become a ghost?", next = "ghost" },
        { text = "What happened to the rest of the city?", next = "city" },
        { text = "Tell me about Quel'Serrar.", next = "quelserrar" },
        { text = "My people remember the Highborne's pride, Lorekeeper.", next = "kaldorei", when = { race = "NightElf" } },
        { text = "I've felt the arcane hunger you speak of.", next = "hunger", when = { class = "MAGE" } },
        { text = "What do you need done?", next = "BUSINESS" },
        { text = "I'll leave you to your shelves.", next = "END" },
      },
    },
    athenaeum = {
      lines = { { id = "a_default", text = "The Athenaeum held everything the Highborne thought worth saving: histories, spellcraft, the deeds of heroes long dead. Much of it burned or rotted, but what remains is still the finest collection on this side of the sea." } },
      choices = {
        { text = "Who reads it now?", next = "readers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    readers = {
      lines = { { id = "r_default", text = "Ogres who use the pages to start fires, satyrs who cannot read at all, and my own prince's court, who stopped reading the day they found a demon to feed on. You are the first real reader in a very long while." } },
      choices = {
        { text = "Knowledge should be shared with everyone.", next = "BACK", reply = "A generous thought, and a dangerous one. My people shared what they knew with the wrong guests once, and the Well swallowed half a continent for it.", fx = { align = { order = -1 } } },
        { text = "Some knowledge belongs under lock and key.", next = "BACK", reply = "Spoken like a librarian. The worst books in this place are kept where only I can find them, and I intend to keep it so.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ghost = {
      lines = { { id = "gh_default", text = "Prince Tortheldrin's magisters bound a demon, Immol'thar, to power the pylons that shield this city. The binding drained the living to keep it fed. I died among my shelves, and I simply did not leave." } },
      choices = {
        { text = "Why stay?", next = "stay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stay = {
      lines = { { id = "st_default", text = "Because a library without a keeper becomes a ruin with paper in it. Someone must remember where each book belongs, and why it was written, and who was foolish enough to ignore it." } },
      choices = {
        { text = "Then I'll help free the city from Immol'thar.", next = "BACK", reply = "Freeing it would end the prince's hold, and perhaps my watch with it. Do it anyway. I have kept these shelves long enough to want rest.", fx = { align = { light = 1 } } },
        { text = "The prince's power could serve better hands.", next = "BACK", reply = "That is exactly what the prince said before he bound the demon. I would think carefully about whose hands you mean.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    city = {
      lines = { { id = "c_default", text = "The east wing went to the satyrs and the wild things, the north to the Gordok ogres, and the west stayed with the prince and his Shen'dralar. Three kingdoms in one crumbling house, and none of them speak to the others." } },
      choices = {
        { text = "Do the Shen'dralar trust outsiders?", next = "shendralar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shendralar = {
      lines = { { id = "sh_default", text = "Some of them do now. With Immol'thar's hunger choking them, a few would rather bargain with strangers than wither. I am one of the few who never needed persuading." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    quelserrar = {
      lines = { { id = "q_default", text = "Quel'Serrar was a blade of the old kaldorei, quenched in dragonfire and lost to the ages. Foror's Compendium tells how to remake it, if you bring me the book and are brave enough to face a dragon's breath." } },
      choices = {
        { text = "Which dragon?", next = "dragon" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kaldorei = {
      lines = { { id = "kd_default", text = "As well they should, for we earned every word of it. Azshara's court thought itself above the world, and the world fell on our heads for it, so I will not quarrel with a kaldorei who keeps a long memory." } },
      choices = {
        { text = "Your people paid for their pride.", next = "BACK", reply = "We did, and we are paying still. Look around you; this library is the bill.", fx = { align = { order = 1 } } },
        { text = "Exile was a harsh price for curiosity.", next = "BACK", reply = "Kind of you to call it curiosity. Most of your people would not, and they would be right.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunger = {
      lines = { { id = "hu_default", text = "Then guard it closely. My prince felt it too, and when the Well was gone he could not bear to go without, so he chained a demon to the pylons and called it preservation." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dragon = {
      lines = { { id = "d_default", text = "One whose fire is hot enough and whose temper is short enough, which is to say Onyxia. The blade must be bathed in her flame while she lives, and it must be held by someone who does not flinch." } },
      choices = {
        { text = "I don't flinch.", next = "BACK", reply = "Everyone says so until the heat reaches them. Come back with an unscorched blade and I will believe you." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
}

---------------------------------------------------------------------------
-- Old Ironbark: an ancient treant kept from the Warpwood by the corruption of the east wing.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_ironbark", id = TODO_NPC("Old Ironbark"), name = "Old Ironbark",
  bible = "bibles/dg_ironbark.md", role = "story", tier = "quest", gender = "male",
  temper = { "slow", "weary" }, values = { "steadfast", "kind" },
  notices = { "class" },
  impression = {
    first = "He speaks as if each word took a season to grow.",
    third = "{name} met Old Ironbark, the ancient treant who still stands guard in the Warpwood Quarter of Dire Maul.",
  },

  greetings = {
    { id = "g_default", text = "Ahh. A small one, moving quickly. Everything moves quickly to me now." },
    { id = "g_zev", when = { killed = { name = "Zevrim Thornhoof" } }, text = "The satyr's hoofbeats have stopped. The roots feel lighter already, small one." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "One of Cenarius's children. I can smell the moonglade on you, and it is a sweet smell in this rotten place." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am called Ironbark. I grew here when the elves first raised these walls, and I have watched the satyrs twist my brothers into the Warpwood things you passed on your way in." },
      },
      again = {
        { id = "h_again", text = "Speak again, small one. I am listening, slowly." },
        { id = "h_again2", text = "Hmm. More words?" },
      },
      choices = {
        { text = "What happened to the other treants?", next = "brothers" },
        { text = "Who is Zevrim Thornhoof?", next = "zevrim" },
        { text = "Can you open the way deeper in?", next = "door" },
        { text = "How old are you?", next = "age" },
        { text = "Cenarius's children have not forgotten you, Ironbark.", next = "cenarius", when = { class = "DRUID" } },
        { text = "Rest well, old one.", next = "END" },
      },
    },
    brothers = {
      lines = { { id = "b_default", text = "The satyrs drank the wild magic that pools beneath this place and poured it into their roots. Now they creak and snarl and forget their own names. I remember mine only because I am too stubborn to let it go." } },
      choices = {
        { text = "Can they be healed?", next = "heal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    heal = {
      lines = { { id = "he_default", text = "Not the old ones. Their heartwood is black. Cut them down, and perhaps their acorns will grow clean, in a century or two." } },
      choices = {
        { text = "Then I'll put them to rest.", next = "BACK", reply = "Thank you. Strike true, and do not hate them. They did not choose what they became.", fx = { align = { order = 1 } } },
        { text = "Let the wild magic run its course.", next = "BACK", reply = "Hmm. That is what the satyrs said. The wild has a course, small one, but this is not it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    zevrim = {
      lines = { { id = "z_default", text = "A satyr lord, cruel even for his kind. He chains the spirits of this place and laughs while they suffer. While he lives, my roots are bound, and I cannot move a single branch." } },
      choices = {
        { text = "Where does his power come from?", next = "power" },
        { text = "Something else.", next = "BACK" },
      },
    },
    power = {
      lines = { { id = "p_default", text = "From the wild magic the elves left behind, and from the one who leads the satyrs here, Alzzin the Wildshaper. Zevrim is only his hound, small one, though a hound with very sharp teeth." } },
      choices = {
        { text = "Then Alzzin is the one to fear.", next = "alzzin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alzzin = {
      lines = { { id = "al_default", text = "Hmm. Fear him, yes, but do not run from him. He wears many shapes and loves none of them, and he has made the Warpwood into a garden of things that should not grow." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cenarius = {
      lines = { { id = "ce_default", text = "Hmm, that is good to hear. I have not felt the Moonglade's wind in a very long time, and I had begun to think the Cenarion Circle sang its songs without me." } },
      choices = {
        { text = "The Circle will hear of you, I promise.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    door = {
      lines = { { id = "d_default", text = "When Zevrim falls, I will be free enough to smash the gate that holds the way to Alzzin. It will be the first thing I have done quickly in a thousand years." } },
      choices = { { text = "I look forward to it.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    age = {
      lines = { { id = "a_default", text = "Older than the walls, younger than the hills. I saw the sky turn green the night the Well broke, though I was only a sapling then and did not understand it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Shen'dralar Ancient: a Highborne spirit who wants Immol'thar and the prince brought down.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_shendralar_ancient", id = 14358, name = "Shen'dralar Ancient", role = "questgiver", tier = "quest",
  temper = { "sorrowful", "formal" }, values = { "knowledge", "atonement" },
  notices = { "race", "quest" },
  impression = {
    first = "A Highborne ghost who has watched his own people feed a demon to stay alive.",
    third = "{name} heard the Shen'dralar Ancient's grief in the halls of Dire Maul.",
  },
  greetings = {
    { id = "g_default", text = "You walk where the living have not walked in a very long time, stranger. Stay, and hear what became of the Shen'dralar." },
    { id = "g_madness", when = { questActive = TODO_QUEST("The Madness Within") }, text = "The demon still feeds, and the prince still sits in his hall. I cannot rest while either is true." },
    { id = "g_done", when = { questDone = TODO_QUEST("The Madness Within") }, text = "You have done what my people could not do for themselves. Our treasure is yours, and so is my gratitude, for whatever a ghost's gratitude is worth." },
  },
  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Kaldorei. Your ancestors cast mine out over the sea of mist, and here you stand among our ruins. The years are strange." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am one of the eldest of the Shen'dralar, the Highborne who fled here when the Well of Eternity was lost. We built Eldre'Thalas to keep our magic alive, and we have paid for that magic ever since." },
        { id = "h_nelf", when = { race = "NightElf" }, text = "You know of my people, child of the moon, though your druids would rather you forgot us. I am one of the Shen'dralar, and I have watched this city wither from within." },
      },
      again = {
        { id = "h_again", text = "Ask what you will. I have had ten thousand years to think of the answers." },
        { id = "h_again2", text = "There is more, if you would hear it." },
      },
      choices = {
        { text = "What happened to the Shen'dralar?", next = "fall" },
        { text = "What do you want of me?", next = "madness" },
        { text = "These halls feel like a tomb.", next = "tomb" },
        { text = "My people banished yours for good reason.", next = "exile", when = { race = "NightElf" } },
        { text = "Rest easy, ancient one.", next = "END" },
      },
    },
    fall = {
      lines = { { id = "f_default", text = "Prince Tortheldrin bound the demon Immol'thar to fuel the pylons that sustain us. When the demon's hunger grew too great, he fed it the lives of our own people, one by one, and called it necessity." } },
      choices = {
        { text = "And you did nothing?", next = "fall2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fall2 = {
      lines = { { id = "f2_default", text = "I was a scholar, not a warrior, and by the time I understood, I was already among the dead. Now I have only the patience of a ghost, and the hope that someone braver will come." } },
      choices = {
        { text = "No one deserves to be fed to a demon.", next = "BACK", reply = "No. But we built the cage, and we cannot pretend we did not know what lived in it.", fx = { align = { light = 1 } } },
        { text = "Power always costs. Your prince paid the price.", next = "BACK", reply = "He paid it with other lives, stranger, and never once with his own.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    madness = {
      lines = { { id = "m_default", text = "Slay Immol'thar in his prison, and then go to the prince himself. Tortheldrin will not surrender what he has taken, so you must take it from him." } },
      choices = {
        { text = "What will you give for it?", next = "treasure" },
        { text = "I'll end the demon and the prince.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    treasure = {
      lines = { { id = "t_default", text = "The Shen'dralar hid a treasure beneath the library stair, set aside for a day we hoped would never come. If you free us, it is yours, for there will be no one left to guard it." } },
      choices = {
        { text = "I'd do it without reward.", next = "BACK", reply = "Then you are better than most who have come here, and better than many of us." },
        { text = "Something else.", next = "BACK" },
      },
    },
    tomb = {
      lines = { { id = "to_default", text = "It is one, though the living have not yet noticed. The Shen'dralar who remain trade with outsiders and keep the old books, but they are fewer each year, and the demon is never full." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    exile = {
      lines = { { id = "e_default", text = "Good reason, perhaps, but it was still exile, and exile breeds desperation. Your Malfurion was right about our magic, and I have had a long death to admit it." } },
      choices = {
        { text = "Then the druids were right to forbid it.", next = "BACK", reply = "They were. Say so to Tortheldrin, if you like, before you end him.", fx = { align = { order = 1 } } },
        { text = "Knowledge shouldn't be forbidden, whatever the cost.", next = "BACK", reply = "That is what we told ourselves, and look where it has brought us.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "That is beyond my knowledge, stranger. The library holds many things, but not that." } } },
}

---------------------------------------------------------------------------
-- Lorekeeper Kildrath: takes the rogue, warrior and mage tomes in exchange for the Shen'dralar's gifts.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_kildrath", id = 14383, name = "Lorekeeper Kildrath", title = "Lorekeeper", role = "questgiver", tier = "quest",
  temper = { "precise", "aloof" }, values = { "knowledge" },
  notices = { "class" },
  greetings = {
    { id = "g_default", text = "You bring a book, I trust, and not merely muddy boots. The Shen'dralar do not part with their gifts for nothing." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Kildrath, a keeper of this library, and my charge is the lore of rogues, warriors and magi. Bring me the tomes that have scattered through these halls, and I will reward you with something of ours." },
      },
      again = { { id = "h_again", text = "Is there anything more? I have shelving to do." } },
      choices = {
        { text = "What books are you looking for?", next = "books" },
        { text = "Why would the Shen'dralar trade with outsiders?", next = "trade" },
        { text = "I carry the Codex of Defense.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "A study of Garona? I'd read that.", next = "rogue", when = { class = "ROGUE" } },
        { text = "The Arcanist's Cookbook is mine to return.", next = "mage", when = { class = "MAGE" } },
        { text = "Farewell.", next = "END" },
      },
    },
    books = {
      lines = { { id = "b_default", text = "Garona's study on stealth and treachery, the Codex of Defense, and the Arcanist's Cookbook. The ogres and satyrs have strewn our collection across the city, and they have no idea what they carry." } },
      choices = {
        { text = "And in exchange?", next = "books2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    books2 = {
      lines = { { id = "b2_default", text = "A token of the Shen'dralar, shaped to the one who returns the book. It is a fair trade, and fairer than any you will get from the gordok in the east wing." } },
      choices = {
        { text = "Fair enough.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade = {
      lines = { { id = "t_default", text = "Because we are few, and the demon that feeds us is weakening the pylons. Outsiders bring back what we have lost, and in time, perhaps, they will free us from what we have made." } },
      choices = {
        { text = "Your knowledge should be shared freely.", next = "BACK", reply = "Freely given knowledge is freely squandered. That is a lesson my people learned at great cost.", fx = { align = { order = -1 } } },
        { text = "Some knowledge is best kept guarded.", next = "BACK", reply = "Just so. Perhaps you are wiser than your boots suggest.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warrior = {
      lines = { { id = "w_default", text = "The Codex of Defense, unharmed by the ogres, which is more than I expected. A warrior who reads is rare enough that I will not complain about the bloodstains on the binding." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rogue = {
      lines = { { id = "r_default", text = "Garona Halforcen was a half-breed assassin who killed a human king, and her methods were worth recording. Our scholars admire skill wherever they find it, even in such unpleasant places." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mage = {
      lines = { { id = "m_default", text = "The Cookbook is a frivolous title for a serious work on conjured sustenance. Even the Highborne had to eat, magus, and some of us ate very well indeed." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "If it is not written down in this library, it is not my concern." } } },
}

---------------------------------------------------------------------------
-- Lorekeeper Javon: keeper of the priestly, shamanic and druidic tomes.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_javon", id = 14381, name = "Lorekeeper Javon", title = "Lorekeeper", role = "scholar", tier = "service",
  temper = { "dry", "patient" }, values = { "knowledge" },
  greetings = { { id = "g_default", text = "Quietly, please. The books here are older than your kingdoms, and they do not care for shouting." } },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", key = true, text = "I am Javon, and I keep the lore of priests, shamans and druids, though I confess some of it is shelved with a raised eyebrow. Bring me the lost tomes and the Shen'dralar will thank you properly." } },
      again = { { id = "h_again", text = "Something further?" } },
      choices = {
        { text = "Which tomes are you missing?", next = "books" },
        { text = "You don't trust druids, do you?", next = "druids" },
        { text = "Farewell.", next = "END" },
      },
    },
    books = {
      lines = { { id = "b_default", text = "Holy Bologna, a priest's treatise with a title I did not choose, along with Frost Shock and You, and a volume on the Emerald Dream. The ogres use them as doorstops, I am told." } },
      choices = { { text = "I'll keep an eye out.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    druids = {
      lines = { { id = "d_default", text = "It was the druids who drove my people across the sea, so you will forgive me a little coolness. Still, their book on the Dream is a fine piece of scholarship, and I keep it as carefully as any other." } },
      choices = {
        { text = "The druids saved the world from your folly.", next = "BACK", reply = "They did, and they never let anyone forget it.", fx = { align = { order = 1 } } },
        { text = "Exile was too harsh a punishment.", next = "BACK", reply = "Kind of you to say. Few outsiders ever do.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I could not say. Try the shelves, or better yet, try someone less busy." } } },
}

---------------------------------------------------------------------------
-- Lorekeeper Mykos: keeper of the paladin, warlock and hunter tomes.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_mykos", id = 14382, name = "Lorekeeper Mykos", title = "Lorekeeper", role = "scholar", tier = "service",
  temper = { "curious", "courteous" }, values = { "knowledge" },
  greetings = { { id = "g_default", text = "Ah, a visitor. Come in, come in, and do mind the shelves on the left, they are older than they look." } },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", key = true, text = "I am Mykos, and the lore of paladins, warlocks and hunters falls to me. An odd company of subjects, I know, but the Shen'dralar collect everything." } },
      again = { { id = "h_again", text = "What else can I tell you?" } },
      choices = {
        { text = "Which tomes are you missing?", next = "books" },
        { text = "Warlock lore, here? Isn't that dangerous?", next = "warlock" },
        { text = "Farewell.", next = "END" },
      },
    },
    books = {
      lines = { { id = "b_default", text = "The Light and How to Swing It, Harnessing Shadows, and The Greatest Race of Hunters. Bring any of them back to me, and the Shen'dralar will reward you for it." } },
      choices = { { text = "I'll look for them.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    warlock = {
      lines = { { id = "w_default", text = "Dangerous, certainly, but my people summoned demons long before your warlocks learned the words. If we had not studied the shadows, we would not have known how badly we were failing." } },
      choices = {
        { text = "Some things should stay unstudied.", next = "BACK", reply = "Perhaps, though ignorance has killed more people than knowledge ever has.", fx = { align = { light = 1 } } },
        { text = "Every power is a tool to be used.", next = "BACK", reply = "A tool, yes, until it uses you. Ask the prince how that goes.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "A fascinating question, but alas, not one my shelves can answer." } } },
}

---------------------------------------------------------------------------
-- Shen'dralar Provisioner: sells to the few outsiders the Shen'dralar tolerate.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_shendralar_provisioner", id = 14371, name = "Shen'dralar Provisioner", role = "vendor", tier = "service",
  temper = { "cool", "businesslike" }, values = { "practical" },
  greetings = { { id = "g_default", text = "You are an outsider, but your coin is not. What do you require?" } },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", key = true, text = "I keep the Shen'dralar's stores, and lately I sell from them to those the lorekeepers favour. We are too few now to be proud about whom we trade with." } },
      again = { { id = "h_again", text = "Anything else?" } },
      choices = {
        { text = "Too few?", next = "few" },
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "Farewell.", next = "END" },
      },
    },
    few = {
      lines = { { id = "f_default", text = "The pylons take their due, and so does the prince's demon. Every season there are fewer of us at the tables, and no one speaks of the empty chairs." } },
      choices = {
        { text = "Your prince should answer for that.", next = "BACK", reply = "Say that more softly, outsider. The zealots are always listening.", fx = { align = { order = -1 } } },
        { text = "Your people chose this path together.", next = "BACK", reply = "We did, long ago, and we have been choosing it every day since.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I sell provisions. Questions are the lorekeepers' business." } } },
}

---------------------------------------------------------------------------
-- Shen'dralar Zealot: a guard of the Athenaeum, loyal to the prince and wary of outsiders.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_shendralar_zealot", id = 14369, name = "Shen'dralar Zealot", role = "guard", tier = "service",
  temper = { "cold", "vigilant" }, values = { "loyal", "tradition" },
  greetings = { { id = "g_default", text = "You are permitted in the Athenaeum because the lorekeepers will it. Do not mistake that for welcome." } },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", key = true, text = "I guard the Athenaeum for Prince Tortheldrin and the house of the Shen'dralar. Outsiders come and go now, and I watch every one of them." } },
      again = { { id = "h_again", text = "Is there more you wish to say, outsider?" } },
      choices = {
        { text = "Why so suspicious?", next = "wary" },
        { text = "Your prince feeds your people to a demon.", next = "prince" },
        { text = "I'll go.", next = "END" },
      },
    },
    wary = {
      lines = { { id = "w_default", text = "Because ogres sit in our gardens and satyrs foul our groves, and every outsider claims to come in peace. My people survived ten thousand years by trusting no one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    prince = {
      lines = { { id = "p_default", text = "The prince keeps us alive, and that is more than your kind ever did for us. Speak against him again within these walls and you will not leave them." } },
      choices = {
        { text = "Loyalty to a murderer is no virtue.", next = "BACK", reply = "Loyalty is all the Shen'dralar have left, outsider. Do not presume to judge it.", fx = { align = { order = -1 } } },
        { text = "A guard keeps his oath. I respect that.", next = "BACK", reply = "Then you understand more than most who pass through here.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Take your questions to the lorekeepers. I am not here to talk." } } },
}

---------------------------------------------------------------------------
-- Falrin Treeshaper: an old friend of Anthion Harmon, aiding the hunt for the 0.5 set's makers.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_falrin", id = 16032, name = "Falrin Treeshaper", role = "questgiver", tier = "quest",
  temper = { "wry", "earnest" }, values = { "loyal", "justice" },
  notices = { "quest" },
  greetings = {
    { id = "g_default", text = "A visitor in the library who isn't trying to kill me? That's a welcome change, friend." },
    { id = "g_anthion", when = { questActive = TODO_QUEST("Anthion's Old Friend") }, text = "Anthion sent you? Then he must still be wandering Stratholme, poor soul. Come, sit, and tell me what he said." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", key = true, text = "I'm Falrin Treeshaper, and I came to these ruins to study the Highborne's lore long before the ogres moved in. Now I stay because the work isn't done, and because I owe a debt to an old friend." } },
      again = {
        { id = "h_again", text = "What else would you like to know?" },
        { id = "h_again2", text = "Go on, I'm listening." },
      },
      choices = {
        { text = "Who is your old friend?", next = "anthion" },
        { text = "What is your vendetta?", next = "vendetta" },
        { text = "What is this challenge you speak of?", next = "challenge" },
        { text = "You're a druid, studying Highborne magic?", next = "druid", when = { class = "DRUID" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    anthion = {
      lines = { { id = "a_default", text = "Anthion Harmon, who died in Stratholme searching for his wife, Ysida. His spirit still walks those streets, and if he sent you to me, then he still trusts me to finish what we started together." } },
      choices = {
        { text = "What did you start together?", next = "anthion2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    anthion2 = {
      lines = { { id = "a2_default", text = "We meant to make armour worthy of the heroes who'd face the Scourge and the Dark Irons both. He gathered the craftsmen, and I gathered the lore, and then the plague came and took him." } },
      choices = {
        { text = "Then I'll finish his work.", next = "BACK", reply = "Good. He would have liked you, I think." },
        { text = "Something else.", next = "BACK" },
      },
    },
    vendetta = {
      lines = { { id = "v_default", text = "There are those in these ruins who did my friends a great wrong, and I'm too old and too slow to settle it myself. You aren't, and that makes you the answer to a long prayer." } },
      choices = {
        { text = "Revenge won't bring your friends back.", next = "BACK", reply = "No, but it will let me sleep, and that's something.", fx = { align = { light = 1 } } },
        { text = "Some debts are only paid in blood.", next = "BACK", reply = "Aye, and I'll be glad to see this one settled.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    challenge = {
      lines = { { id = "c_default", text = "In Blackrock Depths there's a Ring of Law, where the Dark Irons pit prisoners against their champions. Plant a banner of provocation there and you'll draw out Theldren and his band, who have something you'll need." } },
      choices = {
        { text = "Who is Theldren?", next = "theldren" },
        { text = "Something else.", next = "BACK" },
      },
    },
    theldren = {
      lines = { { id = "t_default", text = "A champion who fights for coin and glory, and he's very good at both. Don't underestimate him, friend, because the Dark Irons certainly don't." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "d_default", text = "Treeshaper is a druid's name, aye, and the Highborne were druids' enemies once. But you can't guard against a danger you refuse to understand, and the Cenarion Circle has never liked that argument." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I don't know, friend, and I've read most of the books in here." } } },
}

---------------------------------------------------------------------------
-- Elder Mistwalker: Lunar Festival elder honoured in Dire Maul.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_elder_mistwalker", id = 15587, name = "Elder Mistwalker", role = "questgiver", tier = "quest",
  temper = { "serene", "wise" }, values = { "tradition", "memory" },
  notices = { "race", "quest" },
  greetings = {
    { id = "g_default", text = "Welcome, traveller. You have come a long and dangerous way to honour an old spirit, and that is no small thing." },
    { id = "g_done", when = { questDone = TODO_QUEST("Mistwalker the Elder") }, text = "Your coin of ancestry carries my blessing now. Go with it, and remember the elders who came before you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Mistwalker, an elder of the ancient ways, and each year at the Lunar Festival I wait here to greet those who seek the wisdom of their ancestors. Few come so deep into these ruins, but those who do are always remembered." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "A child of the Earth Mother, so far from the plains. I am Mistwalker, and the ancestors watch you here as surely as they do in Mulgore." },
      },
      again = { { id = "h_again", text = "Ask, child. The festival lasts only a little while." } },
      choices = {
        { text = "What is the Lunar Festival?", next = "festival" },
        { text = "Why wait in a place like this?", next = "why" },
        { text = "I have come for your blessing, elder.", next = "coin" },
        { text = "The Earth Mother walks with you, elder.", next = "tauren", when = { race = "Tauren" } },
        { text = "Farewell, elder.", next = "END" },
      },
    },
    festival = {
      lines = { { id = "f_default", text = "It is the time when we honour the elders and the ancestors who guide us, and when the Moonglade opens to all who come in peace. Those who seek us out carry the blessings of their kin into the new year." } },
      choices = {
        { text = "What blessings do the elders give?", next = "festival2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    festival2 = {
      lines = { { id = "f2_default", text = "Wisdom, remembrance and the luck of the year to come. Each elder sees something different in those who visit, but every one of us asks only that you remember those who walked before you." } },
      choices = {
        { text = "The past should guide us.", next = "BACK", reply = "Yes. A tree without roots cannot stand against the wind.", fx = { align = { order = 1 } } },
        { text = "I'd rather make my own path.", next = "BACK", reply = "Then make it well, and the ancestors will be proud of you all the same.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because the Highborne of this city were ancestors too, foolish and proud as they were. Someone must remember them, and I would rather it be an elder than the ogres." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    coin = {
      lines = { { id = "c_default", text = "Then you have honoured me, and I will honour you in turn. Take this coin of ancestry with my blessing, and may it carry you safely out of these halls." } },
      choices = { { text = "Thank you, elder.", next = "BACK", fx = { affinity = 1 } } },
    },
    tauren = {
      lines = { { id = "t_default", text = "And with you, young one. Carry her warmth into this cold place, and do not let the ruins make you forget the open sky." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I am an old spirit, child, and my memory reaches only to what matters." } } },
}
