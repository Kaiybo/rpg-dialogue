-- Strangers at the edges of Azshara: Joy Ar'nareth and Rayan Dawnrisen (high elves at the top of Xylem's Tower)
-- and Gatekeeper Rageroar (the Timbermaw who watches the mountain tunnel's Azshara mouth).
-- Voice: bibles/azshara_wayfarers.md
local P = RPGDialogueAPI:Pack("rpgd.azshara")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Joy Ar'nareth
---------------------------------------------------------------------------
P:NPC {
  key = "joy_arnareth", id = TODO_NPC("Joy Ar'nareth"), name = "Joy Ar'nareth",
  bible = "bibles/azshara_wayfarers.md", role = "scholar", tier = "service",
  communities = { "xylems_tower" }, temper = { "proud", "sharp" }, values = { "curious", "proud" },
  notices = { "nightelf" },

  impression = {
    first = "She has opinions on everything and shares them freely.",
    third = "{name} met Joy Ar'nareth, a high elf scholar at the top of Xylem's Tower.",
  },

  greetings = {
    { id = "g_default", text = "Oh. You came up. The Archmage doesn't usually let visitors past Sanath at the door." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Mind the books, they're older than your kingdom." },
  },

  notice = {
    { id = "n_ne", cat = "nightelf", when = { race = "NightElf" },
      text = "A kaldorei. Your people and mine haven't been on speaking terms for ten thousand years, so I'll try to be polite if you will." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Joy Ar'nareth, of Quel'Thalas, and I'm here because Azshara is the only place in the world where you can walk through what our ancestors built before they left these shores. Rayan and I came to study under the Archmage, or at least near him; he rarely notices we're here." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "A mage! Then you'll understand why I put up with this drafty tower. The Highborne worked magic here that the Kirin Tor can't even describe, and some of it is still humming in the stones." },
        { id = "h_morphaz", when = { questDone = TODO_QUEST("Destroy Morphaz") },
          text = "You're the one who went down into that drowned temple for the Archmage's shard. He hasn't stopped humming since, which is almost worse than the sulking." },
      },
      again = {
        { id = "h_again", text = "Something else? I've notes to finish before the light goes." },
        { id = "h_again2", text = "Go on, then. Rayan won't argue with me, so you may as well." },
      },
      choices = {
        { text = "Your ancestors lived here?", next = "ancestors" },
        { text = "What's Archmage Xylem like to study under?", next = "xylem" },
        { text = "Who's Rayan?", next = "rayan" },
        { text = "What have you found out in the ruins?", next = "ruins" },
        { text = "My people remember the Highborne very differently.", next = "kaldorei", when = { race = "NightElf" } },
        { text = "What magic still hums in the stones?", next = "stones", when = { class = { "MAGE", "WARLOCK", "PRIEST" } } },
        { text = "Goodbye.", next = "END" },
      },
    },
    ancestors = {
      big = true,
      lines = { { id = "an_default", text = "Before they crossed the sea to found Quel'Thalas, yes. The kaldorei call them exiles and the Highborne call them fools, and I call them the reason I exist. Some of my people would rather forget this place, and I think forgetting is how you lose things." } },
      choices = {
        { text = "Some history is best left buried.", next = "BACK", reply = "Spoken like a kaldorei, and I've heard it a hundred times. My ancestors were buried quite enough by everyone else, thank you.", fx = { align = { order = 1 } } },
        { text = "Dig it all up. Knowledge belongs to everyone.", next = "BACK", reply = "At last, someone with sense, and you're not even one of us. I'll dig, and I'll write it all down, and Quel'Thalas can thank me later.", fx = { align = { order = -1 }, learn = { "highborne" } } },
        { text = "Why did they cross the sea at all?", next = "exile" },
        { text = "Something else.", next = "BACK" },
      },
    },
    exile = {
      lines = { { id = "ex_default", text = "After the Well was gone, a handful of the old Highborne went on working magic in secret, and when it went badly wrong the kaldorei put them on ships and told them never to come back. They sailed east and built Quel'Thalas around a new font of power, and they were not, I'm told, especially sorry." } },
      choices = {
        { text = "And how is Quel'Thalas now?", next = "home" },
        { text = "The kaldorei were right to send them away.", next = "exile_right" },
        { text = "Something else.", next = "BACK", fx = { learn = { "queen_azshara" } } },
      },
    },
    exile_right = {
      lines = { { id = "er_default", text = "Perhaps they were, and I'd never say so in Silvermoon. But you don't have to agree with a banishment to be grateful for where it put you, and I'd rather have a forest of golden trees than a moonwell and a lecture." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    home = {
      lines = {
        { id = "ho_default", text = "Wounded. The Scourge marched straight through the forests on their way to the Sunwell, and the letters I get from home are short and come rarely. My family lived, which is more than many can say, and I would much rather talk about old ruins than new ones." },
        { id = "ho_human", when = { race = "Human" }, text = "Wounded, and your Alliance was busy elsewhere when it happened, though I don't blame you personally. The Scourge marched straight through on their way to the Sunwell, and the letters from home are short now. My family lived, and I'd rather talk about older ruins." },
      },
      choices = {
        { text = "I'm sorry. That's a heavy thing to carry here.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xylem = {
      lines = { { id = "xy_default", text = "Brilliant, vain and very busy, which is the usual combination for an archmage. He lets us use his library and his tower, and in return we keep quiet and occasionally carry things, and I've learned more in a season here than in ten years at home." } },
      choices = {
        { text = "Does he ever actually teach you?", next = "xylem_lessons" },
        { text = "Something else.", next = "BACK", fx = { learn = { "xylem" } } },
      },
    },
    xylem_lessons = {
      lines = { { id = "xl_default", text = "Only by accident, when he mutters at a relic loudly enough for me to write it down. He keeps his real lessons for apprentices, and he sends his apprentices on errands into the ruins, and I've noticed the apprentices don't tend to come back." } },
      choices = {
        { text = "What happened to them?", next = "xylem_apprentice" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xylem_apprentice = {
      lines = { { id = "xa_default", text = "One went to the cliffs for arcane dust and was killed for it, and another was eaten by a drake called Morphaz, along with a shard the Archmage wanted far more than the boy. That's why Rayan and I carry books and never volunteer for anything." } },
      choices = {
        { text = "That's a cold way to treat a student.", next = "BACK", fx = { learn = { "morphaz" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "morphaz" } } },
      },
    },
    rayan = {
      lines = { { id = "ra_default", key = true, text = "My fellow student, and the most careful elf I've ever met, which makes him wonderful to travel with and maddening to argue with. If you want the dull facts, ask him; if you want the interesting ones, ask me." } },
      choices = {
        { text = "What do the two of you argue about?", next = "rayan_argue" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rayan_argue = {
      lines = { { id = "rar_default", text = "Eldarath, mostly. There's a whole quarter of the old city further in that nobody has drawn, and I want to go and see it before the naga pull it into the sea. Rayan wants to go home with what we have, as if what we have were enough." } },
      choices = {
        { text = "Is it worth the risk, really?", next = "eldarath" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eldarath = {
      lines = { { id = "el_default", text = "Every stone of it. The Spitelash have the shore and the satyrs have the courts, I know, but a ruin doesn't wait politely to be studied; it crumbles, and then it's gone. I'll go with a guard if I can find one, and alone if I can't." } },
      choices = {
        { text = "Then go with care. Don't go alone.", next = "BACK", fx = { affinity = 1, learn = { "eldarath" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "eldarath" } } },
      },
    },
    ruins = {
      lines = { { id = "ru_default", text = "Doorways that open onto nothing, fountains that still run without water, and inscriptions to a queen who thought she was the sun. Rayan copies the words and I try to work out what the rooms were for, which is the harder and more interesting job." } },
      choices = {
        { text = "What do you think the rooms were for?", next = "ruins_rooms" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ruins_rooms = {
      lines = { { id = "rr_default", text = "Pleasure, mostly, and display. The Highborne built galleries for nothing but the sound of the sea, and courts for nothing but to be looked at, and when the satyrs moved in they kept the galleries and smashed the fountains, which tells you something about satyrs." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "satyrs" } } } },
    },
    kaldorei = {
      lines = { { id = "ka_default", text = "I imagine you do, and I imagine your version has more burning and fewer libraries in it. I'll make you a scholar's bargain: tell me one thing your elders say about this coast, and I'll tell you one thing the Highborne wrote about yours." } },
      choices = {
        { text = "They say the Highborne nearly ended the world.", next = "kaldorei_world" },
        { text = "I'd rather not trade stories with a quel'dorei.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    kaldorei_world = {
      lines = { { id = "kw_default", text = "Nearly, yes, and they wrote that they were saving it, which is the trouble with keeping your own records. Here is mine: the Highborne called your ancestors 'the forest folk', and they did not mean it kindly. I suppose we're even." } },
      choices = { { text = "I suppose we are. Something else.", next = "BACK", fx = { trait = { witty = 1 }, learn = { "highborne" } } } },
    },
    stones = {
      lines = { { id = "st_default", text = "Wards, mostly, set to keep out whoever the Highborne didn't like, which was nearly everyone. Some of them still work, and the Archmage walks past them as if they were furniture, and one day one of them is going to disagree with him." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The Highborne, the ruins, and the Archmage's library." } },
    highborne = { { id = "tp_hb", text = "Our ancestors, or their cousins. It depends who's telling the story." } },
    eldarath = { { id = "tp_eld", text = "The finest ruin on this coast, and nobody will let me study the best part of it." } },
    xylem = { { id = "tp_xy", text = "A genius who keeps forgetting we exist, which is exactly how I like it." } },
    queen_azshara = { { id = "tp_qa", text = "Every inscription out there praises her, and every one of them was written by somebody frightened." } },
    _none = { { id = "tp_none", text = "That's not in any book up here, I'm afraid." } },
  },
}

---------------------------------------------------------------------------
-- Rayan Dawnrisen
---------------------------------------------------------------------------
P:NPC {
  key = "rayan_dawnrisen", id = TODO_NPC("Rayan Dawnrisen"), name = "Rayan Dawnrisen",
  bible = "bibles/azshara_wayfarers.md", role = "scholar", tier = "service",
  communities = { "xylems_tower" }, temper = { "calm", "precise" }, values = { "careful", "wise" },

  impression = {
    first = "He corrects himself whenever he gets a detail wrong.",
    third = "{name} met Rayan Dawnrisen, a careful high elf scholar at the top of Xylem's Tower.",
  },

  greetings = {
    { id = "g_default", text = "Good evening, or good day; it's hard to tell up here. How can I help you?" },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Joy is out on the balcony, if it's her you want." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Rayan Dawnrisen, of Quel'Thalas. I copy the inscriptions Joy finds in the ruins, so that if the naga or the satyrs destroy them, something will remain. It's slow work, and the Archmage thinks it's beneath him, which is exactly why someone has to do it." },
        { id = "h_scholar", when = { class = { "MAGE", "PRIEST" } },
          text = "Rayan Dawnrisen, of Quel'Thalas, and you have the look of someone who has read a book all the way to the end, which is rarer up here than you'd think. I copy the inscriptions Joy finds, so that something survives the naga and the satyrs." },
      },
      again = {
        { id = "h_again", text = "Anything else? I can talk and copy at the same time." },
        { id = "h_again2", text = "Go on. I've only just refilled the ink." },
      },
      choices = {
        { text = "What do the inscriptions say?", next = "inscriptions" },
        { text = "Is it dangerous out in the ruins?", next = "danger" },
        { text = "How do you copy something that old?", next = "craft" },
        { text = "You and Joy don't seem much alike.", next = "joy" },
        { text = "Do you miss Quel'Thalas?", next = "home", when = { faction = "Alliance" } },
        { text = "A dwarf would carve those copies in stone.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    inscriptions = {
      lines = { { id = "in_default", text = "Mostly the names of rooms and the people who owned them, and a few prayers to a queen whose name I'd rather not write too often. Every so often there's a line of verse, and I copy those very carefully, because they're the only parts that sound like people." } },
      choices = {
        { text = "Can you recite one of the verses?", next = "verse" },
        { text = "Something else.", next = "BACK", fx = { learn = { "queen_azshara" } } },
      },
    },
    verse = {
      lines = { { id = "ve_default", text = "Roughly, and my translation is clumsy: 'The tide comes in to kiss the stair, and goes again, and leaves us here.' It was carved under a window that looks out to sea, by someone, I think, who was waiting for a ship that didn't come." } },
      choices = {
        { text = "That's sadder than I expected.", next = "verse_sad" },
        { text = "Something else.", next = "BACK" },
      },
    },
    verse_sad = {
      lines = { { id = "vs_default", text = "The Highborne were proud and cruel and very nearly destroyed the world, and some of them still wrote poems about missing someone. I find that I can't copy one without the other, which is why the work goes so slowly." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 }, learn = { "highborne" } } } },
    },
    danger = {
      big = true,
      lines = { { id = "da_default", text = "Very. The Spitelash on the coast, the satyrs in the old courts, and the blue dragon in the south, though he mostly ignores us. Joy wants to go deeper into Eldarath next month, and I want to go home with what we have." } },
      choices = {
        { text = "Go home. Your copies are worth more than a risk.", next = "BACK", reply = "They are, and I've told her the same a dozen times. Perhaps she'll listen if it comes from someone else.", fx = { align = { order = 1 } } },
        { text = "Go deeper. You came all this way.", next = "BACK", reply = "That's what Joy says, and she'll be delighted to hear it from you. I'll be the one packing the bandages.", fx = { align = { order = -1 } } },
        { text = "A blue dragon ignores you?", next = "dragon" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dragon = {
      lines = { { id = "dr_default", text = "Azuregos, the hunters call him, and he walks the southern ruins as if he's looking for something he's mislaid. He looked at me once, for perhaps a heartbeat, and decided I was not it, and I have never been so glad to be thought unimportant." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    craft = {
      lines = { { id = "cr_default", text = "Slowly. Charcoal rubbing first, where the stone will bear it, then a fair copy by lamplight, then a second fair copy, because the first one always has a mistake I find a week later. Joy says I'm wasting ink, and I say ink is cheaper than walls." } },
      choices = {
        { text = "Where do the copies go?", next = "craft_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    craft_where = {
      lines = { { id = "cw_default", text = "One set stays with the Archmage, as rent, and one set goes home to Silvermoon, if a ship can be found that will carry it. I keep a third in my pack, because I have seen what happens to libraries, and I don't trust any building to stand forever." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    joy = {
      lines = { { id = "jo_default", text = "No, and thank the Light for that, because two of me would never leave the tower, and two of her would already be dead. She finds the doors and I write down what's behind them, and we argue about everything in between." } },
      choices = {
        { text = "She says you're maddening to argue with.", next = "joy_said", when = { heardLine = "joy_arnareth.ra_default" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    joy_said = {
      lines = { { id = "js_default", text = "Did she? That's generous of her; she usually says worse. I'm maddening because I'm usually right, and she's wonderful because she's usually braver, and between the two of us we've stayed alive this long." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    home = {
      lines = { { id = "ho_default", text = "Every day, and more since the Scourge passed through it. I tell myself that the copies are a kind of homecoming, that whatever happens to Silvermoon, a little of what our people came from will be written down somewhere. It doesn't always work." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "And I'd envy you the patience, though not the weight. Stone lasts, I grant you, but it doesn't travel, and the whole point of my work is that someone far away can read what was written here. Perhaps I'll ask the Explorers' League for advice." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Highborne script, and how to copy it without smudging." } },
    eldarath = { { id = "tp_eld", text = "A city that thought it would last forever. I copy its walls so something of it will." } },
    highborne = { { id = "tp_hb", text = "Proud, cruel and sometimes very lonely, if their verses are honest." } },
    _none = { { id = "tp_none", text = "I'm sorry, I don't know. Joy might; she reads faster than I do." } },
  },
}

---------------------------------------------------------------------------
-- Gatekeeper Rageroar
---------------------------------------------------------------------------
P:NPC {
  key = "rageroar", id = TODO_NPC("Gatekeeper Rageroar"), name = "Gatekeeper Rageroar",
  bible = "bibles/azshara_wayfarers.md", role = "guard", tier = "service",
  communities = { "timbermaw_azshara" }, temper = { "gruff", "watchful" }, values = { "protective", "loyal" },
  notices = { "timbermaw" },

  impression = {
    first = "His name is a warning, and he likes it that way.",
    third = "{name} met Gatekeeper Rageroar, the Timbermaw furbolg who guards the tunnel into Azshara.",
  },

  greetings = {
    { id = "g_default", text = "Rageroar watches this gate. Stand still and let him smell you." },
    { id = "g_friend", when = { reputation = { faction = "Timbermaw Hold", min = "friendly" } }, text = "Friend of the Timbermaw. Rageroar lets you pass, and he does not growl." },
    { id = "g_foe", when = { reputation = { faction = "Timbermaw Hold", max = "unfriendly" } }, text = "Rageroar knows your smell, and it is the smell of dead Timbermaw. Go back the way you came." },
  },

  notice = {
    { id = "n_timbermaw", cat = "timbermaw", when = { reputation = { faction = "Timbermaw Hold", min = "honored" } },
      text = "The elders speak of you in the hold. Rageroar did not believe them, but now he smells you and believes." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Rageroar is gatekeeper of this tunnel, where Timbermaw Hold opens into Azshara. The Timbermaw do not like strangers walking through the mountain, but strangers who are friends may pass, and strangers who are not will learn why Rageroar has his name." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "You smell of leaves and of Moonglade, little shapechanger. Rageroar is gatekeeper of this tunnel, and he lets druids come closer than most, because the Timbermaw remember who taught them to listen to the trees." },
      },
      again = {
        { id = "h_again", text = "What else? Rageroar is listening, and watching." },
        { id = "h_again2", text = "Speak. The gate is quiet, so Rageroar has time." },
      },
      choices = {
        { text = "Why guard this end so closely?", next = "why" },
        { text = "What lies in Azshara for the Timbermaw?", next = "azshara" },
        { text = "What happened to the other furbolgs?", next = "others" },
        { text = "How do I earn the Timbermaw's trust?", next = "trust" },
        { text = "You speak of yourself by name. Why?", next = "name" },
        { text = "I've killed Deadwood for your people.", next = "deadwood", when = { reputation = { faction = "Timbermaw Hold", min = "friendly" } } },
        { text = "I'll pass through, then.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "Because the satyrs of Azshara would walk into the hold if Rageroar let them, and the Deadwood would walk out. A tunnel is a road, and a road goes both ways, so Rageroar stands in the middle of it." } },
      choices = {
        { text = "Have the satyrs ever tried?", next = "why_satyrs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_satyrs = {
      lines = { { id = "ws_default", text = "Twice since the last snow. The first one tried to talk, with a sweet voice and a smell like a rotten fruit, and Rageroar did not listen. The second one did not talk at all, and Rageroar buried it on the Azshara side, so the mountain would not have to hold it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "satyrs" } } } },
    },
    azshara = {
      big = true,
      lines = { { id = "az_default", text = "Old forests and bad magic, and satyrs where elves once lived. Some Timbermaw want to close this gate forever with stone, so nothing from Azshara can come in. Rageroar thinks a closed gate is a weak gate, because nobody watches it." } },
      choices = {
        { text = "Seal it. Some doors should stay shut.", next = "BACK", reply = "Rageroar hears you, and some of the elders would agree. But a sealed door forgets what's behind it, and Rageroar does not want to forget.", fx = { align = { order = 1 } } },
        { text = "Keep it open and watched. Rageroar is right.", next = "BACK", reply = "Rageroar thanks you, outsider, and the elders will hear of it. They grumble less when a stranger agrees with Rageroar.", fx = { align = { order = -1 } } },
        { text = "Who wants to seal it?", next = "azshara_elders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    azshara_elders = {
      lines = { { id = "ae_default", text = "The old ones in the hold, who remember when every furbolg was a friend and every tunnel was safe. They are wise, and they are tired, and tired furbolgs want walls. Rageroar is not tired yet." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    others = {
      lines = { { id = "ot_default", text = "Sickness. The Deadwood in Felwood and the Winterfall in the snow drank something foul and forgot themselves, and now they fight anything that moves, even their own blood. Only the Timbermaw still remember who they are." } },
      choices = {
        { text = "Can they be cured?", next = "others_cure" },
        { text = "Something else.", next = "BACK", fx = { learn = { "furbolgs" } } },
      },
    },
    others_cure = {
      lines = { { id = "oc_default", text = "The shamans in the hold say no, and the shamans have tried for a long time. Rageroar hopes they are wrong. But when a Deadwood comes snarling down this tunnel, Rageroar does not hope; he does what a gatekeeper does." } },
      choices = {
        { text = "Then they're lost. Strike them down.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Never stop looking for a cure.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trust = {
      lines = { { id = "tr_default", text = "Kill Deadwood in Felwood and Winterfall in the snows, and bring back their feathers and beads, so the elders know the deed is real. Words are wind to the Timbermaw. Rageroar trusts paws that have done work." } },
      choices = {
        { text = "Who in the hold should I see?", next = "trust_who" },
        { text = "Something else.", next = "BACK", fx = { learn = { "timbermaw" } } },
      },
    },
    trust_who = {
      lines = { { id = "tw_default", text = "Nafien by the Felwood door takes the Deadwood feathers, and Salfa by the Winterspring door takes the Winterfall beads, and Gorn One Eye in the hold has harder work for the trusted. Tell them Rageroar sent you, and if they laugh, it is because Rageroar never sends anyone." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "timbermaw" } } } },
    },
    name = {
      lines = { { id = "na_default", text = "Because a name is a thing you carry, and Rageroar carries his where everyone can see it. When strangers hear it, they think about it before they do something foolish, and the thinking is half of the guarding." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    deadwood = {
      lines = { { id = "dw_default", text = "Rageroar smells it on you, the old blood of the sick ones. It is a sad thing to be thanked for, but Rageroar thanks you anyway, because somebody has to do it and it should not always be furbolgs." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "Rageroar knows this gate and every smell that has passed it." } },
    furbolgs = { { id = "tp_furb", text = "The Timbermaw remember who they are. Rageroar helps them remember." } },
    satyrs = { { id = "tp_sat", text = "They smell of rot and old magic. Rageroar does not let them pass." } },
    timbermaw = { { id = "tp_tim", text = "The last furbolgs who are still themselves. Rageroar is one, and proud of it." } },
    _none = { { id = "tp_none", text = "Rageroar does not know. Rageroar knows the gate." } },
  },
}
