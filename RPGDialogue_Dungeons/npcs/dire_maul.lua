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
    w8_fire = {
      lines = { { id = "w8_fire_a", text = "Foror's Compendium, if it were here, but it is not, and so I would save the oldest catalogue of this library instead. A library that loses its books can gather them again, but a library that loses its catalogue no longer knows what it has lost." } },
      choices = {
        { text = "That's a librarian's answer.", next = "w8_fire2" },
        { text = "Can a ghost even carry a book?", next = "w8_fire2" },
        { text = "I'm a mage. I'd save the spellbooks.", next = "w8_fire2", when = { class = "MAGE" } },
        { text = "Something else, Lorekeeper.", next = "BACK" },
      },
    },
    w8_fire2 = {
      lines = {
        { id = "w8_fire2_a", text = "It is the only answer I have, and the ogres would use the catalogue to light the fire in any case. A ghost cannot carry a book, no, which is why I am so tiresome about where the living put them down." },
        { id = "w8_fire2_mage", when = { class = "MAGE" }, text = "Of course you would, and that is why your kind should never be left alone in a burning library. The spells will be rewritten by the next fool who thinks himself clever; the catalogue tells you which fool wrote them first." },
      },
      choices = {
        { text = "I'll mind where I put books down.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

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
        { text = "Which book here would you save first from a fire?", next = "w8_fire" },
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
    w8_see = {
      lines = { { id = "w8_see_a", text = "Hmm. Stone, where there was garden, and satyr dung, where there were flowers. A little sky, through the broken roof, and sometimes a bird, and the bird is the best part of the day." } },
      choices = {
        { text = "What kind of bird?", next = "w8_see2" },
        { text = "That's a sad view, old one.", next = "w8_see2" },
        { text = "Something else, Ironbark.", next = "BACK" },
      },
    },
    w8_see2 = {
      lines = { { id = "w8_see2_a", text = "A small brown one, very quick. It nests in my shoulder, and it does not mind that I am slow. Hmm. When the satyrs are gone, perhaps more birds will come." } },
      choices = {
        { text = "I'll make room for more birds.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

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
        { text = "What do you remember of the Highborne?", next = "yhigh" },
        { text = "What do you see from where you stand?", next = "w8_see" },
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
    yhigh = {
      narr = "Bark creaks as the great head turns, very slowly, toward the old walls.",
      lines = {
        { id = "yh_default", text = "Hmm. Tall, bright, singing elves, who planted my grandfathers along their avenues for shade and then forgot us. They drew magic from the earth as you draw water, and they never asked whether the earth minded." },
        { id = "yh_nelf", when = { race = "NightElf" }, text = "Hmm. Your cousins, small one, though you are wiser. They planted my grandfathers for shade and drew magic from the earth as you draw water, and never asked whether the earth minded. You ask. I can tell." },
      },
      choices = { { text = "The earth remembers. Something else.", next = "BACK" } },
    },
  },
  topics = {
    warpwood = { { id = "yt_warp", text = "The Warpwood were my brothers. Now they are hollow and angry, and they do not know me." } },
    satyrs = { { id = "yt_satyr", text = "Satyrs are elves who sold themselves to demons. They smell of burnt moss and lies." } },
    _none = { { id = "yt_none", text = "Hmm. I do not know that, small one. I have only stood here a thousand years, and that is not long enough to learn everything." } },
    alzzin = { { id = "yt_alz", text = "Alzzin the Wildshaper wears many shapes and loves none of them. He is the root of the rot here." } },
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
    w8_star = {
      lines = { { id = "w8_star_a", text = "The courses of the Wanderers and the slow turning of the great wheel, and once, a star that rose green over Zin-Azshari and was never seen again. The court thought it an omen of their glory, and I wrote it down as such, to my long shame." } },
      choices = {
        { text = "What was it, truly?", next = "w8_star2" },
        { text = "You couldn't have known.", next = "w8_star2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w8_star2 = {
      lines = { { id = "w8_star2_a", text = "The first light of the Legion's coming, I think now, though no one asked a stargazer's opinion then. Remember it, stranger: when the proud see an omen of their own greatness, someone else is usually opening the door." } },
      choices = {
        { text = "I'll remember it.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

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
        { text = "What were you, in life?", next = "ylife" },
        { text = "Do you remember the Well of Eternity?", next = "ywell" },
        { text = "What stars did you chart in Azshara's court?", next = "w8_star" },
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
    ylife = {
      narr = "The ghost's hands move as if turning the pages of a book no longer there.",
      lines = {
        { id = "yli_default", text = "A keeper of star charts, in Azshara's court and then here. I mapped the heavens for a people who looked only at themselves. When we came to these halls I mapped the ley lines instead, and that was how the prince found the place to bind his demon." },
        { id = "yli_mage", when = { class = "MAGE" }, text = "A keeper of star charts, and then of ley lines, which you will understand, mage. I found the place where the prince bound his demon. I have regretted the precision of my work for a very long time." },
      },
      choices = {
        { text = "You couldn't have known what he'd do.", next = "yknow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yknow = {
      lines = { { id = "ykn_default", text = "I knew he would do something, and I chose not to ask what. Is that ignorance, stranger, or the oldest kind of guilt? I have never settled it, and the dead have little else to do." } },
      choices = { { text = "Perhaps both. Something else.", next = "BACK" } },
    },
    ywell = {
      lines = {
        { id = "ywe_default", text = "As one remembers the sun after a lifetime underground. It shone with a light that made you feel you could unmake the stars. We thought it was ours. It was never ours, and the world paid for our mistake." },
        { id = "ywe_nelf", when = { race = "NightElf" }, text = "As your elders do, child, though they remember its fall and I remember its glory. It made us feel we could unmake the stars. Your druids were right to fear it, and I was wrong to love it." },
      },
      choices = { { text = "A hard lesson. Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "That is beyond my knowledge, stranger. The library holds many things, but not that." } } ,
    tortheldrin = { { id = "yt_tort", text = "The prince was brilliant once, and kind, in his way. Hunger changes everything it touches." } },
    immolthar = { { id = "yt_immol", text = "Immol'thar is the demon in the pylons' cage. Its hunger has no bottom, and we fed it anyway." } },
    eldre_thalas = { { id = "yt_et", text = "We built Eldre'Thalas to be a second Zin-Azshari. It became a mausoleum with a library attached." } },
  
},
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
    w8_dmg = {
      lines = { { id = "w8_dmg_a", text = "A history of the Highborne magisters, eleven volumes, used as a doorstop until the spine gave way and then as tinder until there was nothing left. I recovered the index, which now describes a library that no longer exists." } },
      choices = {
        { text = "Can the volumes be rewritten?", next = "w8_dmg2" },
        { text = "Ogres don't know any better.", next = "w8_dmg2" },
        { text = "A rogue might steal back what ogres took.", next = "w8_dmg2", when = { class = "ROGUE" } },
        { text = "Something else, Lorekeeper.", next = "BACK" },
      },
    },
    w8_dmg2 = {
      lines = {
        { id = "w8_dmg2_a", text = "From memory, perhaps, if anyone still remembers, and most of those who did are now bound to the pylons. Ignorance is not an excuse, outsider; it is merely an explanation, and a poor one." },
        { id = "w8_dmg2_rog", when = { class = "ROGUE" }, text = "Steal, recover, retrieve, the word matters less to me than the book in my hands. Bring me what the ogres have taken, and I will not ask how your fingers came by it." },
      },
      choices = {
        { text = "I'll look for your missing books.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Kildrath, a keeper of this library, and my charge is the lore of rogues, warriors and magi. Bring me the tomes that have scattered through these halls, and I will reward you with something of ours." },
      },
      again = {
        { id = "h_again", text = "Is there anything more? I have shelving to do." },
        { id = "xh_again2", text = "Back again? Then I trust you have something to show me, or something worth asking." },
      },
      choices = {
        { text = "What books are you looking for?", next = "books" },
        { text = "Why would the Shen'dralar trade with outsiders?", next = "trade" },
        { text = "I carry the Codex of Defense.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "A study of Garona? I'd read that.", next = "rogue", when = { class = "ROGUE" } },
        { text = "The Arcanist's Cookbook is mine to return.", next = "mage", when = { class = "MAGE" } },
        { text = "What was this library before the ogres came?", next = "xlib" },
        { text = "Where do the ogres keep the books?", next = "xogre" },
        { text = "Tell me about the pylons.", next = "xpylon" },
        { text = "What is the worst damage the ogres have done to a book?", next = "w8_dmg" },
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
    xlib = {
      narr = "He runs a long finger along an empty shelf, and it comes away grey.",
      lines = { { id = "xli_default", text = "The Athenaeum of Eldre'Thalas, the greatest library ever built east of the Well. Scholars came from every corner of the empire to read here, and now the gordok use our reading rooms as latrines." } },
      choices = {
        { text = "Could it be restored?", next = "xrestore" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrestore = {
      lines = { { id = "xrs_default", text = "Perhaps, if the ogres were driven out and the satyrs burned from the gardens. But a library needs readers as well as books, and we grow fewer every season." } },
      choices = {
        { text = "Open it to outsiders, then. Let others read.", next = "BACK", reply = "Outsiders, in the Athenaeum, reading freely? You have a strange idea of restoration.", fx = { align = { order = -1 } } },
        { text = "A library kept by its own keepers is safest.", next = "BACK", reply = "Just so. Better a small library well kept than a great one squandered.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xogre = {
      lines = { { id = "xog_default", text = "Wherever an ogre puts things, which is to say anywhere at all. I have found tomes propping up tables, wedged under doors, and once, I regret to say, cooked into a stew." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpylon = {
      lines = { { id = "xpy_default", text = "The pylons bind the demon Immol'thar, whose power keeps the Shen'dralar alive. Lately they falter, and when they fail entirely, we will have to find another way to live, or else stop living." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    immolthar = { { id = "xtp_immol", text = "The demon beneath our feet, bound by the pylons. We do not speak of what it costs to keep him." } },
    gordok = { { id = "xtp_gordok", text = "Ogres in the halls of the Highborne. If you want proof the world has a sense of humour, there it is." } },
    _none = { { id = "tp_none", text = "If it is not written down in this library, it is not my concern." } } },
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
    w8_read = {
      lines = { { id = "w8_read_a", text = "Mykos, who reads everything and remembers too much of it, and Lydros, who corrects my shelving in a voice he believes is quiet. The prince's court have not opened a book in a century, and the zealots read only the faces of strangers." } },
      choices = {
        { text = "That's a lonely library.", next = "w8_read2" },
        { text = "Perhaps outsiders will read them now.", next = "w8_read2" },
        { text = "Something else, Lorekeeper.", next = "BACK" },
      },
    },
    w8_read2 = {
      lines = { { id = "w8_read2_a", text = "Perhaps, and I find I do not mind the idea as much as I expected. A book unread is only paper and pride, and the Shen'dralar have had quite enough of both." } },
      choices = {
        { text = "Then I'll read one, someday.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    hello = {
      lines = { { id = "h_default", key = true, text = "I am Javon, and I keep the lore of priests, shamans and druids, though I confess some of it is shelved with a raised eyebrow. Bring me the lost tomes and the Shen'dralar will thank you properly." } },
      again = {
        { id = "h_again", text = "Something further? Ask it softly; the old bindings in this aisle are fragile." },
        { id = "xh_again2", text = "You return. Do lower your voice, though; the books have been through enough." },
      },
      choices = {
        { text = "Which tomes are you missing?", next = "books" },
        { text = "You don't trust druids, do you?", next = "druids" },
        { text = "Holy Bologna? Who wrote that?", next = "xbologna" },
        { text = "How long have the Shen'dralar been here?", next = "xlong" },
        { text = "What do you think of the prince?", next = "xprince" },
        { text = "I'm a druid. I'd like to see the Dream volume.", next = "xdruid", when = { class = "DRUID" } },
        { text = "I'm a shaman. What's Frost Shock and You?", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "Which tome do you love most?", next = "ylove" },
        { text = "Who reads these books, besides you?", next = "w8_read" },
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
    xbologna = {
      narr = "Javon closes his eyes for a long moment, as though in pain.",
      lines = { { id = "xbo_default", text = "A human priest of some talent and no taste, I suspect. The work itself is a sound treatise on the Light, and every time I shelve it, I pretend not to read the spine." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xlong = {
      lines = { { id = "xlo_default", text = "Since the Sundering, give or take, which is longer than your kind has kept records. Eldre'Thalas was a great city once, and we have been shrinking inside it ever since, room by room." } },
      choices = {
        { text = "Why not leave and rejoin the other elves?", next = "xrejoin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrejoin = {
      lines = { { id = "xre_default", text = "Because the kaldorei of Darnassus would remember who we are and what we did, and so would we. Some here say pride keeps us in these halls, and some say shame, and I have never been sure which." } },
      choices = {
        { text = "Pride. You should swallow it and go home.", next = "BACK", reply = "Bluntly put, and perhaps true. I will not repeat it to the prince.", fx = { align = { order = -1 } } },
        { text = "You keep your vows to this place. That's honourable.", next = "BACK", reply = "Honourable, or merely stubborn. I suppose they look much the same from outside.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xprince = {
      lines = { { id = "xpr_default", text = "Prince Tortheldrin is our lord, and I am a lorekeeper, so my opinion of him is shelved in a place I do not visit. Ask Lydros, if you must ask someone, for he is braver than I am." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdruid = {
      lines = { { id = "xdr_default", text = "A druid, in my aisle. The volume is not mine to lend, but if you bring back the lost copy, you may read every page of it, and I will try very hard not to stand over your shoulder." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xshaman = {
      lines = { { id = "xsh_default", text = "A practical manual on the spirits of the elements, written by an orc, I believe, with more enthusiasm than grammar. It is surprisingly good, and I tell no one I think so." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ylove = {
      lines = {
        { id = "ylo_default", text = "A small book of Highborne lullabies, written in a hand that shook with age. It holds no power at all, which is why the prince lets me keep it, and why I value it above every grimoire in this library." },
        { id = "ylo_priest", when = { class = "PRIEST" }, text = "A small book of Highborne lullabies, with no power in it at all. You priests understand, I think, that a thing can be holy without being useful. I value it above every grimoire on these shelves." },
      },
      choices = { { text = "A worthy treasure. Something else.", next = "BACK" } },
    },
  },
  topics = {
    tortheldrin = { { id = "yt_tort", text = "Prince Tortheldrin rules the Shen'dralar. I keep my opinion of him in the restricted section." } },
    druids = { { id = "yt_druid", text = "The druids drove us out after the Sundering. Their scholarship on the Dream is excellent, and I resent it." } },
    emerald_dream = { { id = "yt_dream", text = "The Emerald Dream is the world as it might have been. I have read of it far more than I would like to visit it." } },
    tomes = { { id = "yt_tomes", text = "Every class has its lost tome, scattered through these halls by ogres who could not read them. I would like them back." } },
    eldre_thalas = { { id = "xtp_et", text = "Our city, which the outside world calls Dire Maul. I prefer the old name, and so would you, if you had seen it whole." } },
    highborne = { { id = "xtp_hb", text = "We were the Highborne, once. Now we are librarians, and I am not certain it was a fall." } },
    _none = { { id = "tp_none", text = "I could not say. Try the shelves, or better yet, try someone less busy." } } },
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
    w8_cat = {
      lines = { { id = "w8_cat_a", text = "A shelf of hunting journals, written by a Highborne lord who kept a pet bear and wrote about it with more feeling than he ever wrote about his wife. It is the most charming thing in this library, and it is filed under zoology, which is wrong." } },
      choices = {
        { text = "Where should it be filed?", next = "w8_cat2" },
        { text = "A Highborne with a pet bear?", next = "w8_cat2" },
        { text = "I'm a hunter. I'd like to read about that bear.", next = "w8_cat2", when = { class = "HUNTER" } },
        { text = "Something else, Lorekeeper.", next = "BACK" },
      },
    },
    w8_cat2 = {
      lines = {
        { id = "w8_cat2_a", text = "Under friendship, if the Shen'dralar had such a shelf, which they do not. I have started one, quietly, behind the warlock texts where Lydros will not look, and it has three books on it so far." },
        { id = "w8_cat2_hu", when = { class = "HUNTER" }, text = "Then you will be the first reader it has had in ten thousand years, and the bear would have liked you, I think. Bring back The Greatest Race of Hunters and I will let you read the journal as well, as a small extra kindness." },
      },
      choices = {
        { text = "A shelf for friendship. I like that.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    hello = {
      lines = { { id = "h_default", key = true, text = "I am Mykos, and the lore of paladins, warlocks and hunters falls to me. An odd company of subjects, I know, but the Shen'dralar collect everything." } },
      again = {
        { id = "h_again", text = "What else can I tell you? Few come so far into the library, and fewer still ask good questions." },
        { id = "xh_again2", text = "Ah, you again. I was hoping someone would come and interrupt my cataloguing." },
      },
      choices = {
        { text = "Which tomes are you missing?", next = "books" },
        { text = "Warlock lore, here? Isn't that dangerous?", next = "warlock" },
        { text = "The Greatest Race of Hunters? Which race?", next = "xhunters" },
        { text = "You seem friendlier than the others.", next = "xfriendly" },
        { text = "I'm a paladin. What does your tome say of the Light?", next = "xpaladin", when = { class = "PALADIN" } },
        { text = "I'm a warlock. I'd like to read Harnessing Shadows.", next = "xwarlock", when = { class = "WARLOCK" } },
        { text = "I'm a hunter. Which race does the book favour?", next = "xhunter", when = { class = "HUNTER" } },
        { text = "Have you ever read a book that frightened you?", next = "yfright" },
        { text = "What are you cataloguing at the moment?", next = "w8_cat" },
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
    xhunters = {
      lines = { { id = "xhu_default", text = "The author never quite says, which is why every hunter who reads it assumes it means their own people. It is a very clever book, in that respect, and a very poor one in every other." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xfriendly = {
      narr = "He laughs quietly and sets down a quill.",
      lines = { { id = "xfr_default", text = "I have read too much to think we are better than everyone else, and that makes me poor company for the prince's court. Lydros calls it a weakness, and I call it the only thing that keeps me awake in this place." } },
      choices = {
        { text = "What would you do if you could leave?", next = "xleave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xleave = {
      lines = { { id = "xle_default", text = "Walk in the sun, for one, and visit a library I had not already read cover to cover. But leaving means leaving the others, and some of them would not survive the walk without the demon's gift." } },
      choices = {
        { text = "Then stay for them. That's what duty means.", next = "BACK", reply = "Duty, yes. I have done my duty for a very long time.", fx = { align = { order = 1 } } },
        { text = "Go anyway. You owe yourself that much.", next = "BACK", reply = "Perhaps I do. It is a dangerous thought, and I thank you for it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpaladin = {
      lines = { { id = "xpa_default", text = "That the Light rewards those who swing it with conviction, which is a fair summary, though the author repeats it for three hundred pages. Your order would like it, I think, and so might your arms." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xwarlock = {
      lines = { { id = "xwa_default", text = "You would, would you? Then read it carefully, and remember that my people wrote half of what is in it, and look at us now. The shadows keep very good accounts." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhunter = {
      lines = { { id = "xht_default", text = "Yours, of course, or so you will say once you have read it. Bring me the copy and you may judge for yourself, though I warn you the chapter on boar tracking is very long." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yfright = {
      narr = "His hand drifts, unbidden, toward a locked case behind him.",
      lines = {
        { id = "yfr_default", text = "One, and I keep it locked. It is a Highborne account of the night Queen Azshara's court first opened the way for the Legion, written by a scribe who thought it a glorious triumph. It is not the demons that frighten me, it is how proud he sounds." },
        { id = "yfr_warlock", when = { class = "WARLOCK" }, text = "One, and it stays locked, even from you. A Highborne scribe's account of the night Azshara's court opened the way for the Legion. He thought it a triumph. You should take that as a warning, friend." },
      },
      choices = { { text = "A warning worth heeding. Something else.", next = "BACK" } },
    },
  },
  topics = {
    javon = { { id = "yt_javon", text = "Javon pretends to hate the books he shelves. He reads every one of them twice." } },
    legion = { { id = "yt_legion", text = "My people opened the door for the Burning Legion once. We do not say so aloud, but every lorekeeper knows it." } },
    tortheldrin = { { id = "yt_tort", text = "The prince keeps us alive with a power I'd rather not name. I am grateful, and uneasy, in equal parts." } },
    eldre_thalas = { { id = "yt_et", text = "Eldre'Thalas was a jewel. Now ogres roast boars in its gardens, and the smoke gets into the parchment." } },
    lydros = { { id = "xtp_lydros", text = "Our eldest lorekeeper, and the sharpest mind in the library. He frightens me a little, and I think he enjoys it." } },
    shendralar = { { id = "xtp_shen", text = "What remains of the Highborne who kept the library after the Sundering. Fewer than you would think, and fewer every year." } },
    _none = { { id = "tp_none", text = "A fascinating question, but alas, not one my shelves can answer." } } },
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
    w8_tab = {
      lines = { { id = "w8_tab_a", text = "Moonberry wine from the vineyards of Eldre'Thalas, which no longer exist, and honeyed bread baked in arcane ovens that no longer burn. I serve the survivors dried fruit and water, and they eat it as if it were a feast, which is worse." } },
      choices = {
        { text = "Why is that worse?", next = "w8_tab2" },
        { text = "Survival is its own feast.", next = "w8_tab2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w8_tab2 = {
      lines = { { id = "w8_tab2_a", text = "Because it means they have forgotten what a feast was, outsider, and a people that forgets its feasts will soon forget its songs. I keep one bottle of the old wine in the cellar, for the day the demon is gone, and I do not know who I will pour it for." } },
      choices = {
        { text = "Perhaps for yourself.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    hello = {
      lines = { { id = "h_default", key = true, text = "I keep the Shen'dralar's stores, and lately I sell from them to those the lorekeepers favour. We are too few now to be proud about whom we trade with." } },
      again = {
        { id = "h_again", text = "Anything else? Speak plainly; the stores do not count themselves." },
        { id = "xh_again2", text = "You return. Something else, or are you merely browsing?" },
      },
      choices = {
        { text = "Too few?", next = "few" },
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "Who are these lorekeepers?", next = "lorekeepers" },
        { text = "Where do your provisions come from?", next = "xsource" },
        { text = "Do the ogres trouble your stores?", next = "xogres" },
        { text = "Is the demon's gift worth the cost?", next = "xdemon" },
        { text = "I'm a night elf. We share a people, once.", next = "xkaldorei", when = { race = "NightElf" } },
        { text = "Who were you, before the stores?", next = "ywho" },
        { text = "What do you miss from the prince's old table?", next = "w8_tab" },
        { text = "Farewell.", next = "END" },
      },
    },
    lorekeepers = {
      lines = { { id = "lk_default", text = "Lorekeeper Lydros and his like keep the library of Eldre'Thalas, and they decide which outsiders are useful. If they speak well of you, so will I, and my prices will say so." } },
      choices = {
        { text = "What do they want from outsiders?", next = "want" },
        { text = "Something else.", next = "BACK" },
      },
    },
    want = {
      lines = { { id = "wa_default", text = "Books, mostly, and the strength to fetch them from places we can no longer reach. The library was once whole, and they mean to make it so again before there is no one left to read it." } },
      choices = { { text = "Something else, then.", next = "BACK" } },
    },
    few = {
      lines = { { id = "f_default", text = "The pylons take their due, and so does the prince's demon. Every season there are fewer of us at the tables, and no one speaks of the empty chairs." } },
      choices = {
        { text = "Your prince should answer for that.", next = "BACK", reply = "Say that more softly, outsider. The zealots are always listening.", fx = { align = { order = -1 } } },
        { text = "Your people chose this path together.", next = "BACK", reply = "We did, long ago, and we have been choosing it every day since.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsource = {
      lines = { { id = "xso_default", text = "Some from the old gardens, where the satyrs have not yet trampled everything, and some brought in by outsiders who wish to stay in the lorekeepers' good graces. We are not proud, as I said." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xogres = {
      narr = "She glances toward the east wing, where distant ogre voices carry.",
      lines = { { id = "xog_default", text = "The gordok would eat the stores and the storekeeper if they could reach us. We keep our doors warded and our voices low, and we pay outsiders to thin their numbers, which seems to amuse the outsiders." } },
      choices = {
        { text = "Why not drive them out yourselves?", next = "xdrive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdrive = {
      lines = { { id = "xdr_default", text = "With what army? Our strength goes into the pylons and into staying alive. The ogres are a nuisance we can survive, while a war would finish us." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdemon = {
      lines = { { id = "xde_default", text = "I am a provisioner, and I know what everything costs. The demon's gift keeps us alive, and some of us pay for it with more than coin, and I have stopped adding up the account." } },
      choices = {
        { text = "No life is worth that price.", next = "BACK", reply = "Easily said by someone with a life of her own to keep.", fx = { align = { light = 1 } } },
        { text = "Survival comes first. Everything else after.", next = "BACK", reply = "That is the Shen'dralar creed, near enough, though we would never write it down.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xkaldorei = {
      lines = { { id = "xka_default", text = "Once, yes, before your druids drove us out. You will find no welcome in the prince's hall, but I will sell to you at the same price as anyone, and perhaps that is a kind of welcome." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ywho = {
      narr = "She straightens a row of jars that were already straight.",
      lines = {
        { id = "ywh_default", text = "A steward of the prince's own table, when there was a table worth the name. I served wine to archmages and summoners whose names your histories have lost. Now I count rations for a dozen lorekeepers and sell bread to strangers." },
        { id = "ywh_horde", when = { faction = "Horde" }, text = "A steward of the prince's table, serving wine to archmages your histories have forgotten. Now I sell bread to orcs and trolls, which my old masters would have called the end of the world. Perhaps it was." },
      },
      choices = { { text = "A long way to fall. Something else.", next = "BACK" } },
    },
  },
  topics = {
    lydros = { { id = "yt_lydros", text = "Lorekeeper Lydros decides who is welcome in the library. I decide who eats. We rarely disagree." } },
    pylons = { { id = "yt_pylons", text = "The pylons sustain us, and they take their due. I keep the stores and do not ask what the due is." } },
    highborne = { { id = "yt_high", text = "We were the Highborne. Now we are a pantry with a library attached, and the pantry is emptier." } },
    immolthar = { { id = "xtp_immol", text = "The prince's prisoner, and our larder, in a manner of speaking. I do not care for the manner." } },
    gordok = { { id = "xtp_gordok", text = "Hungry, loud and in the east wing. I keep my stores warded against them." } },
    _none = { { id = "tp_none", text = "I sell provisions. Questions are the lorekeepers' business." } } },
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
    w8_pyl = {
      lines = { { id = "w8_pyl_a", text = "Stand at this door until the end, outsider, and see who comes through it. If the demon is loosed, the prince will need guards, and if the prince falls, the library will need guards, and I will be both." } },
      choices = {
        { text = "That's loyalty, at least.", next = "w8_pyl2" },
        { text = "Loyalty to a prince who feeds you to a demon?", next = "w8_pyl2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    w8_pyl2 = {
      lines = { { id = "w8_pyl2_a", text = "Loyalty to the Shen'dralar, which is not the same as loyalty to the prince, though I would not say so where he could hear. Go, outsider, and do not mention to anyone that a zealot spoke so plainly." } },
      choices = {
        { text = "I heard nothing.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    hello = {
      lines = { { id = "h_default", key = true, text = "I guard the Athenaeum for Prince Tortheldrin and the house of the Shen'dralar. Outsiders come and go now, and I watch every one of them." } },
      again = {
        { id = "h_again", text = "Is there more you wish to say, outsider?" },
        { id = "xh_again2", text = "Speak quickly, outsider. I am watching the door as well as you." },
      },
      choices = {
        { text = "Why so suspicious?", next = "wary" },
        { text = "Your prince feeds your people to a demon.", next = "prince" },
        { text = "How long have you guarded this place?", next = "xlong" },
        { text = "What threatens the Athenaeum most?", next = "xthreat" },
        { text = "Do you trust the lorekeepers?", next = "xlore" },
        { text = "A kaldorei standing guard for exiles.", next = "xkaldorei", when = { race = "NightElf" } },
        { text = "Have you lost anyone to the demon?", next = "ylost" },
        { text = "What would you do if the pylons failed?", next = "w8_pyl" },
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
    xlong = {
      lines = { { id = "xlo_default", text = "Longer than your grandfather's grandfather drew breath. I stood here when the library was full and the halls were lit, and I will stand here when the last lamp goes out." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xthreat = {
      narr = "Her hand tightens on the haft of her glaive.",
      lines = { { id = "xth_default", text = "The satyrs in the warped gardens, the ogres in the east, and the outsiders the lorekeepers let in. The first two I can fight, and the third I am ordered to tolerate." } },
      choices = {
        { text = "Outsiders are helping you. Be grateful.", next = "xgrateful" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgrateful = {
      lines = { { id = "xgr_default", text = "Helping, and looting, and staring at our prince as if he were a beast in a cage. Gratitude is not a guard's duty, outsider, watchfulness is." } },
      choices = {
        { text = "Watchfulness is wise. Trust has to be earned.", next = "BACK", reply = "At last, an outsider who speaks sense. Do not make me regret hearing it.", fx = { align = { order = 1 } } },
        { text = "Without outsiders, your house dies alone.", next = "BACK", reply = "Then it dies on its own terms, and not on yours.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlore = {
      lines = { { id = "xlr_default", text = "I trust that they serve the prince, and that is enough. Lorekeeper Lydros would open every door to the outside if he could, and I am glad that he cannot." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xkaldorei = {
      lines = { { id = "xka_default", text = "Exiles, you call us, as if your people's ten thousand years of sleeping in trees were not its own exile. We kept the old ways when you abandoned them, and I will not apologise for that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ylost = {
      narr = "Her eyes do not leave the door, but her jaw tightens.",
      lines = {
        { id = "yl_default", text = "My sister. She was chosen for the pylons in the cold season, and I stood guard at this door while they took her down the stair. I did my duty. I have done it every day since. Do not ask me if I would do it again." },
        { id = "yl_nelf", when = { race = "NightElf" }, text = "My sister, chosen for the pylons, and I stood guard while they took her. Your Sentinels would have fought, I suppose. We have not the numbers to fight, kaldorei, only to stand. Do not ask me more." },
      },
      choices = { { text = "I won't. I'm sorry. Something else.", next = "BACK" } },
    },
  },
  topics = {
    athenaeum = { { id = "yt_athen", text = "The Athenaeum holds the oldest books of the Shen'dralar. Touch nothing without leave." } },
    ogres = { { id = "yt_ogres", text = "The gordok wallow in the east wing like pigs in a temple. One day we will clear them out." } },
    duty = { { id = "yt_duty", text = "A guard's duty is to stand where she is told. Whether the order is good is for princes to answer." } },
    lydros = { { id = "yt_lydros", text = "Lydros talks to outsiders too freely. I keep my glaive near when he does." } },
    tortheldrin = { { id = "xtp_tort", text = "Prince Tortheldrin rules the Shen'dralar, and I serve him. That is all an outsider needs to know." } },
    satyrs = { { id = "xtp_satyr", text = "Twisted things in our gardens, and the oldest shame of our people. I kill them gladly." } },
    _none = { { id = "tp_none", text = "Take your questions to the lorekeepers. I am not here to talk." } } },
}

---------------------------------------------------------------------------
-- Falrin Treeshaper: a bitter enchanter in the Dire Maul library, an old acquaintance of Anthion Harmon, who hates the ogres that killed his brother.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_falrin", id = 16032, name = "Falrin Treeshaper", role = "questgiver", tier = "quest",
  temper = { "surly", "bitter" }, values = { "vengeance", "craft" },
  notices = { "quest" },
  greetings = {
    { id = "g_default", text = "Speak up, stranger. Can't you see I'm busy?" },
    { id = "g_anthion", when = { questActive = TODO_QUEST("Anthion's Old Friend") }, text = "Anthion sent you, you say? I thought he was dead. Well, I've heard stranger things in my life." },
  },
  start = "hello",
  nodes = {
    w8_chm = {
      lines = { { id = "w8_chm_a", text = "Highborne enchantments for binding a spell into cloth and leather, the old way, before your trainers in the cities simplified everything into dust and runes. Half of it is nonsense and the other half could kill a man, and I am working out which half is which." } },
      choices = {
        { text = "That sounds dangerous.", next = "w8_chm2" },
        { text = "Why not take the books somewhere safer?", next = "w8_chm2" },
        { text = "I'm an enchanter. Show me one of these old charms.", next = "w8_chm2", when = { profession = "Enchanting" } },
        { text = "Something else, Falrin.", next = "BACK" },
      },
    },
    w8_chm2 = {
      lines = {
        { id = "w8_chm2_a", text = "Of course it is dangerous, which is why the books are still here and not in some tidy library in Stormwind. The Shen'dralar would not let me take one page out of this hall, and the ogres would eat me on the way, so I read here, and I swear a great deal." },
        { id = "w8_chm2_ench", when = { profession = "Enchanting" }, text = "Hmph, an enchanter who wants to learn rather than buy, that's rare enough to earn a look. See this? A binding rune worked into the weave itself, not laid over it, and it'll hold through fire that would strip any modern enchantment bare. Don't try it at home." },
      },
      choices = {
        { text = "I'll leave you to your swearing.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    hello = {
      lines = { { id = "h_default", key = true, text = "I'm Falrin Treeshaper, and I know a charm or two that most folk have long forgotten. I keep to this library because the books are here, and because the ogres who killed my brother are close enough to hate." } },
      again = {
        { id = "h_again", text = "What else? Ask it and be done, because I've ogres to hate and little patience to spare." },
        { id = "h_again2", text = "Go on, then, I'm listening, which is more than the Shen'dralar ever do." },
      },
      choices = {
        { text = "Who is your old friend?", next = "anthion" },
        { text = "Why do you hate the ogres?", next = "vendetta" },
        { text = "What is this challenge you speak of?", next = "challenge" },
        { text = "Treeshaper sounds like a druid's name.", next = "druid", when = { class = "DRUID" } },
        { text = "Tell me about your brother.", next = "ybrother" },
        { text = "How do you live here among ogres?", next = "ylive" },
        { text = "What charms are you studying here?", next = "w8_chm" },
        { text = "Goodbye.", next = "END" },
      },
    },
    anthion = {
      lines = { { id = "a_default", text = "Anthion Harmon, an old acquaintance of mine. Last I heard he'd gone into Stratholme after his wife Ysida and never come out, so if he's sending folk to me, he hasn't stopped being stubborn." } },
      choices = {
        { text = "Why would he send me to you?", next = "anthion2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    anthion2 = {
      lines = { { id = "a2_default", text = "Because I have a particular way of aggravating people, and his banner needs exactly that. Even so, I don't give out favours freely, not even to an old friend's errand runner." } },
      choices = {
        { text = "Name your price, then.", next = "vendetta" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vendetta = {
      lines = { { id = "v_default", text = "Ogres killed my brother, and I hate every brute of them, Gordok's lot here and Omokk's followers in Blackrock Spire alike. Kill them, lots of them, and bring me the beads they wear around their necks." } },
      choices = {
        { text = "Revenge won't bring your friends back.", next = "BACK", reply = "No, and I doubt I'll feel any better. Bring me the beads anyway.", fx = { align = { light = 1 } } },
        { text = "Some debts are only paid in blood.", next = "BACK", reply = "Aye, and I'll be glad to see this one settled.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    challenge = {
      lines = { { id = "c_default", text = "Anthion's banner bears Theldren's family colours, and I can charm it so he can't resist it. Bring me an Eldreth ghost's essence, Scholomance dark runes and large brilliant shards, then plant it in the Ring of Law." } },
      choices = {
        { text = "Who is Theldren?", next = "theldren" },
        { text = "Something else.", next = "BACK" },
      },
    },
    theldren = {
      lines = { { id = "t_default", text = "A champion who never willingly fights fair. Let High Justice Grimstone sentence you, plant the banner in defiance, and Theldren will charge in to fight you. Take what you need from him and go back to Anthion." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    druid = {
      lines = { { id = "d_default", text = "Treeshaper is an old family name, nothing more. My craft is enchantment, and my business is my own." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ybrother = {
      narr = "He closes the book in front of him without marking the page.",
      lines = { { id = "yb_default", text = "Talvash was the scholar of us two, and I the one with the charms. He came to study the Highborne libraries before the ogres were so many, and they caught him in the courtyard with an armful of scrolls. I found what was left of him a season later." } },
      choices = { { text = "I'm sorry for your loss. Something else.", next = "BACK" } },
    },
    ylive = {
      lines = {
        { id = "yl_default", text = "Carefully, and with a ward on the door that makes ogres forget why they came in. They are not clever, but there are a great many of them, and they are very hungry. I am not foolish enough to think the ward will last forever." },
        { id = "yl_mage", when = { class = "MAGE" }, text = "With a ward on the door that makes ogres forget why they came. You'll feel it, I expect, prickling at your sleeves. It's old Highborne work I've patched, and it won't last forever, but it lasts long enough for my reading." },
      },
      choices = {
        { text = "Why not leave?", next = "yleave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yleave = {
      lines = { { id = "ylv_default", text = "Because the books here hold more of the Highborne's lost charms than any library in Kalimdor, and the elves who might guard them would only lock them away. Should knowledge like that be kept safe, or put to use?" } },
      choices = {
        { text = "Lock it away. Highborne magic ruined the world.", next = "BACK", reply = "You sound like a Darnassian. I'll not argue, but I'll not stop.", fx = { align = { order = 1 } } },
        { text = "Use it. Knowledge locked up is wasted.", next = "BACK", reply = "Exactly what I tell myself, every night, in this damp room.", fx = { align = { order = -1 } } },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I don't know, friend, and I've read most of the books in here." } } ,
    enchanting = { { id = "yt_ench", text = "A charm is only a promise the world agrees to keep. Most of mine, the world keeps grudgingly." } },
    highborne = { { id = "yt_high", text = "The Highborne wrote down everything, which is the only thing I admire about them." } },
    anthion = { { id = "yt_anthion", text = "Anthion Harmon was always stubborn. Death hasn't changed that, from the sound of it." } },
    ogres = { { id = "yt_ogres", text = "The Gordok ogres hold Dire Maul now. They wear beads of their kills, and I collect them back." } },
  
},
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
    { id = "g_festival", when = { holiday = "lunar" }, text = "Mist and moonlight, and the Lunar Festival come round again. You walked past ogres and old magic to find an elder in these ruins, and that honor will be remembered." },
    { id = "g_done", when = { questDone = TODO_QUEST("Mistwalker the Elder") }, text = "Your coin of ancestry carries my blessing now. Go with it, and remember the elders who came before you." },
  },
  start = "hello",
  nodes = {
    w8_mist = {
      lines = { { id = "w8_mist_a", text = "The shapes of the Highborne walking their old avenues, child, which only the dead can see, and they walk without knowing they are gone. They do not see me either, and I think that is a mercy for both of us." } },
      choices = {
        { text = "Can they be laid to rest?", next = "w8_mist2" },
        { text = "That sounds like a haunting.", next = "w8_mist2" },
        { text = "Something else, Elder.", next = "BACK" },
      },
    },
    w8_mist2 = {
      lines = { { id = "w8_mist2_a", text = "When the demon in the pylons is gone, perhaps, for it holds the whole city between one breath and the next. Until then I honour them as ancestors, foolish ones, and wait for someone brave enough to set them free." } },
      choices = {
        { text = "I'll remember them too.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

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
        { text = "Who were you, before you were an elder?", next = "ywho" },
        { text = "Do the ogres trouble you here?", next = "yogres" },
        { text = "What do you see in the mists of this place?", next = "w8_mist" },
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
    ywho = {
      narr = "The spirit's light dims, then steadies, like a candle in a draught.",
      lines = {
        { id = "yw_default", text = "A walker of the misty places, a guide for those lost between the mountains. That was long ago, before even the ruin of this city. Now I am memory, and memory is enough for the festival." },
        { id = "yw_tauren", when = { race = "Tauren" }, text = "A walker of the misty places, as my name tells you, young one, a guide for herds lost in fog. That was long ago. Now I am memory, and the Earth Mother lets memory walk once each year." },
      },
      choices = {
        { text = "Do you miss being alive?", next = "ymiss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymiss = {
      lines = { { id = "ym_default", text = "I miss the warmth of a fire and the taste of water. But the dead who cling to life become something else, as the plagued north shows. Is it better to hold on, or to let go when your time is done?" } },
      choices = {
        { text = "Let go. Every life must end.", next = "BACK", reply = "Yes. That is the old wisdom, and I hold to it.", fx = { align = { light = 1 } } },
        { text = "Hold on. Fight death as long as you can.", next = "BACK", reply = "Many have said so, and the Scourge is the answer they got.", fx = { align = { light = -1 } } },
      },
    },
    yogres = {
      lines = { { id = "yo_default", text = "They do not see me, which suits us both. The Gordok squabble over a crown and a broken city, and they do not know that the elves who built it were ancestors once, and fell through the same pride." } },
      choices = {
        { text = "The Highborne were ancestors too?", next = "why" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I am an old spirit, child, and my memory reaches only to what matters." } } ,
    lunar_festival = { { id = "yt_lunar", text = "When the new moon of the year rises, the elders wake and wait. Find us all, and the ancestors will know your name." } },
    highborne = { { id = "yt_high", text = "Proud and brilliant, and their pride broke the world. Even so, I would not have them forgotten." } },
    dire_maul = { { id = "yt_dm", text = "Eldre'Thalas, the Highborne called it. Now ogres sleep in its libraries, and the books do not mind." } },
    ancestors = { { id = "yt_anc", text = "The ancestors are the roots of every tree. Honour them, and you will stand when the storm comes." } },
  
},
}
