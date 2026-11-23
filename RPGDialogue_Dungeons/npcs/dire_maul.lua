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
-- Prince Tortheldrin: last prince of Eldre'Thalas, cold and proud before he fights.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_tortheldrin", id = TODO_NPC("Prince Tortheldrin"), name = "Prince Tortheldrin",
  bible = "bibles/dg_tortheldrin.md", role = "boss", tier = "quest", gender = "male",
  temper = { "haughty", "cold" }, values = { "proud", "ruthless" },
  notices = { "race" },
  impression = {
    first = "He looks at you the way a jeweller looks at a cracked stone.",
    third = "{name} stood before Prince Tortheldrin, last prince of the Highborne of Eldre'Thalas.",
  },

  greetings = {
    { id = "g_default", text = "You walk into my court unannounced, with blood on your boots. Speak quickly, because I am deciding how you will die." },
    { id = "g_immol", when = { killed = { name = "Immol'thar" } }, text = "You killed the beast. Do you have any idea what you have done to my people? We are starving now, by your hand." },
  },

  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Kaldorei. Your ancestors exiled mine for loving magic. Now you crawl into our halls to steal it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Tortheldrin, prince of Eldre'Thalas, and of the Shen'dralar who remain. Everything you see was built by my ancestors when the world was young and your kind was mud." },
      },
      again = {
        { id = "h_again", text = "Have you more to say before the end?" },
        { id = "h_again2", text = "Go on. I find your impertinence briefly amusing." },
      },
      choices = {
        { text = "Why bind a demon to your city?", next = "immol" },
        { text = "Your own lorekeeper died for your power.", next = "lydros" },
        { text = "What became of the Highborne?", next = "highborne" },
        { text = "Enough talk. Defend yourself.", next = "END" },
      },
    },
    immol = {
      lines = { { id = "i_default", text = "Because the night elves cast us out with nothing, and the pylons needed a fire to burn. Immol'thar burns very well. That it eats the weak among us is a price I have paid gladly." } },
      choices = {
        { text = "Survival justifies hard choices.", next = "BACK", reply = "At last, a visitor with some sense. It will not save you, but I appreciate it.", fx = { align = { light = -1 } } },
        { text = "You sacrificed your people for your throne.", next = "BACK", reply = "My people are my throne, and the throne endures. Spare me your peasant morality.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lydros = {
      lines = { { id = "l_default", text = "Lydros served. Everyone in this city served, living or not. He is still serving, which is more loyalty than most courts ever see." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    highborne = {
      lines = { { id = "hb_default", text = "Some of us sailed east and became the quel'dorei. Some of us stayed and built this. The ones who stayed kept the true art alive, and the world has forgotten it owes us anything." } },
      choices = {
        { text = "The world owes you nothing.", next = "highborne2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    highborne2 = {
      lines = { { id = "hb2_default", text = "Every spell your mages cast was first spoken in a hall like this one. You owe us your fire, your wards, your clever little portals. You simply do not have the manners to say so." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}
