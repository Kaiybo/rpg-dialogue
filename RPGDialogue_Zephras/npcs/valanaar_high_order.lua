-- Valanaar, Zephras Isle: the High Order's people at the southern tip. Elaadrin Evengale
-- (Supreme Magister), Dondallion Whisperwind, Iaadaria Bitterwind (alchemist), Othesia
-- Evengale (tailor), Gelia Shardsong and the High Order Dockmaster on the Dalaran pier.
-- Voice and sources: bibles/zep_high_order.md.
local P = RPGDialogueAPI:Pack("rpgd.zephras")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Elaadrin Evengale: Supreme Magister of the High Order. Highborne magic can
-- do what the spirits did; he sent Belathaan to talk peace and lost him.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_elaadrin", id = TODO_NPC("Elaadrin Evengale"), name = "Elaadrin Evengale", title = "Supreme Magister of The High Order",
  bible = "bibles/zep_high_order.md", role = "noble", tier = "major",
  communities = { "zephras_isle" }, temper = { "proud", "sharp" }, values = { "ambitious", "curious" },
  notices = { "kin", "race", "class", "origin" },

  impression = {
    first = "Elaadrin Evengale, Supreme Magister of the High Order, talks of Highborne magic as if it were a debt the world still owes his people. He is proud and quick, and under it he is angrier about the dead than he lets his face show.",
    third = "{name} met Elaadrin Evengale, Supreme Magister of the High Order, who means to save Zephras with the lost arcane knowledge of the Highborne.",
  },

  greetings = {
    { id = "g_default", text = "Elaadrin Evengale, Supreme Magister of the High Order. You have my attention." },
    { id = "g_ho", when = { race = "Skyborne", faction = "Alliance" }, text = "Ah, one of ours. Come in, and tell me what you've learned." },
    { id = "g_horde", when = { faction = "Horde" }, text = "You walk with the Windshapers' friends. Say your piece quickly." },
    { id = "g_mage", when = { class = "MAGE" }, text = "A mage. Good; I've had enough of people who only want to talk about the weather." },
  },

  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "A human, and of the Alliance. The Kirin Tor have been better friends to us than we had any right to expect, so you'll find the High Order's doors open to you." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Ansirem's letters spoke of gnomish scholars in Dalaran, and I took it for a joke at my expense. I'm glad to be wrong." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Kaldorei. Our ancestors left yours ten thousand years ago in the middle of a quarrel, and I'd like to think we can both be more civil about it now." },
    { id = "n_enclave", cat = "origin", when = { origin = "skyborne_sky_enclave_student" },
      text = "You've been to the Sky Enclave already, I can see the Violet Citadel's dust on your hem. I expect every one of you to bring something useful home, and I haven't forgotten that I said so." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "Fel. Prince Tortheldrin reached for the same power, and our people have been paying for it for ten thousand years, so you'll forgive me if I keep my eyes on your hands." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "The High Order's powers have weakened in our long years in Skywall, and I'll admit as much to anyone. But Highborne magic can do everything the elementals once did to keep our settlements alive, and I mean to recover what we've lost and save Zephras without begging any outside power to do it for us." },
        { id = "h_catch", tags = { "news" }, when = { questActive = TODO_QUEST("Catching Wind") },
          text = "The Index Esoteria needs its readings from the Overlook Standing Stones, and the Windshapers will complain whatever you do, so do it quickly. Without those numbers no skycutter can cross between the planes safely, and I'll not gamble our people on guesswork." },
        { id = "h_avenge", tags = { "news" }, when = { questActive = TODO_QUEST("Avenged Tenfold") },
          text = "Belathaan went out to talk of peace, and they killed him for it. See that his death is answered, and don't come back to me with excuses." },
        { id = "h_lorthuna", tags = { "news" }, when = { questDone = TODO_QUEST("Confront Lorthuna") },
          text = "We stood on the Rohashi Spires and watched Rohash strike Lorthuna into the sky like a child knocking a cup from a table. The cult's broken, but the Windlord knows where we are now, and that's a price I'll be paying for the rest of my life." },
        { id = "h_next", tags = { "news" }, when = { questDone = TODO_QUEST("What Comes Next") },
          text = "So it's decided: the High Order goes to the Kirin Tor and the Sky Enclave in Dalaran. Go below, find what our ancestors lost, and bring it home, because Zephras is counting on it whether it knows so or not." },
      },
      again = {
        { id = "h_again", text = "What else? I've letters to answer, but ask." },
        { id = "h_again2", text = "Go on. I'd rather answer questions than write another report for the Council." },
        { id = "h_again3", when = { faction = "Horde" }, text = "Is there more? Be brief." },
      },
      choices = {
        { text = "What exactly does the High Order mean to do?", next = "purpose" },
        { text = "What happened at the Shrine of Akir?", next = "shrine" },
        { text = "How did you find the Kirin Tor?", next = "kirintor" },
        { text = "What do you make of the Windshapers?", next = "windshapers" },
        { text = "Who was Belathaan Brightwish?", next = "belathaan" },
        { text = "What can a mage of the Alliance learn from you?", next = "xmage", when = { class = "MAGE", ["not"] = { race = "Skyborne" } } },
        { text = "My people are glad to have the High Order with us.", next = "xalliance", when = { faction = "Alliance", ["not"] = { race = "Skyborne" } } },
        { text = "I've studied at the Sky Enclave, Supreme Magister.", next = "xenclave", when = { origin = "skyborne_sky_enclave_student" } },
        { text = "I carried messages between the orders.", next = "xgobetween", when = { origin = "skyborne_go_between" } },
        { text = "Winds' tidings, Supreme Magister.", next = "END" },
      },
    },
    purpose = {
      lines = {
        { id = "pu_default", text = "To recover the arcane knowledge our Highborne ancestors carried out of Eldre'Thalas, most of which ten thousand years in Skywall have worn away. Our people need explorers to go down to Azeroth, find what was lost, and bring it home before our settlements fail entirely." },
      },
      choices = {
        { text = "Can spells really do what the spirits did?", next = "weakened" },
        { text = "How will skycutters reach Azeroth safely?", next = "catching" },
        { text = "Something else.", next = "BACK" },
      },
    },
    weakened = {
      lines = {
        { id = "we_default", text = "The spirits held our islands in the sky and kept our pylons burning, and none of that was a miracle. It was power, used well, and power can be learned. The Windshapers call that arrogance, but what I call arrogance is sitting on a crumbling island waiting for someone else to save you." },
      },
      choices = {
        { text = "So you'd have us stand alone?", next = "selfreliance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    selfreliance = {
      big = true,
      lines = {
        { id = "sr_default", text = "I'd have us stand on our own feet, which isn't the same thing. We'll take the Kirin Tor's friendship gladly, but I'll not hand our survival to any power that might vanish one morning the way the spirits did." },
      },
      choices = {
        { text = "Agreed. A people that depends on patrons is a people in danger.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Nobody survives alone. Pride could sink us faster than the pylons.", next = "BACK", fx = { affinity = -2, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    catching = {
      lines = {
        { id = "ca_default", text = "Carefully. Navigating the elemental plane takes calculations based on how the elemental energies flow, and we built a device, the Index Esoteria, to take those readings at the Overlook Standing Stones. With enough of them, our skycutters can find safe routes between Skywall and Azeroth." },
      },
      choices = {
        { text = "Aren't those stones sacred to the Windshapers?", next = "stones" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stones = {
      big = true,
      lines = {
        { id = "so_default", text = "They are, and they've made sure everyone knows it. I'm sorry to tread on their feelings, but the stones sit where the energies converge, and I can't move the energies to suit a Windshaper's sense of reverence. Which matters more to you, their ground or our people's road home?" },
      },
      choices = {
        { text = "Our people's road. The stones will survive a few readings.", next = "BACK", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "Their ground. Respect it, or we're no better than the cult.", next = "BACK", fx = { affinity = -2, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shrine = {
      lines = {
        { id = "sh_default", text = "A broken recall crystal told us Lorthuna had ordered her cult to march, and the High Elder worked out that she meant to bring down the wards and let the Windlord in. So the High Order, the Windshapers and the Peacekeepers all went to the Shrine of Akir together, and many elves on both sides didn't come back." },
      },
      choices = {
        { text = "And Lorthuna?", next = "shrine2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shrine2 = {
      lines = {
        { id = "s2_default", text = "Ayessa and I faced her on the Rohashi Spires, and she told us the wards had been down for days and she'd lit a beacon for Al'Akir's followers. Rohash of the Conclave answered it, struck her away into the sky, and promised us the Windlord's judgement, and if Ansirem hadn't brought the Kirin Tor through when he did, I wouldn't be here to tell you so." },
      },
      choices = {
        { text = "So the orders fought side by side.", next = "ceasefire" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ceasefire = {
      big = true,
      lines = {
        { id = "cf_default", text = "For a day, and I told Ayessa to her face that it was a truce and nothing more. There's blood between our orders that a single battle doesn't wash away, and I'll not paper over it because the cult happened to be worse than both of us." },
      },
      choices = {
        { text = "Then make it more than a truce. The isle can't afford this.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Some blood has to be answered. You're right to hold to that.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kirintor = {
      lines = {
        { id = "kt_default", text = "Our magisters learned to open a sort of keyhole between the planes, a spell for looking in on Azeroth from Skywall. Some of the Kirin Tor noticed us looking and looked back, and that was the most astonishing conversation of my life." },
      },
      choices = {
        { text = "And they agreed to help?", next = "keyhole" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keyhole = {
      lines = {
        { id = "kh_default", text = "They agreed to receive us as guests, and we've learned a great deal from them already, more than we've taught them, I suspect. Ansirem Runeweaver persuaded Rhonin himself to help open the portal that brought their magi to the Shrine, and the High Order won't forget that." },
      },
      choices = {
        { text = "Where will the High Order go?", next = "dalaran" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dalaran = {
      lines = {
        { id = "da_default", text = "To Dalaran, in the Alterac Mountains, where the Kirin Tor have given us rooms in the Violet Citadel that we're calling the Sky Enclave. A skycutter runs there from the eastern dock, and from the Citadel there's a portal on to Stormwind, so the whole of the Alliance is a short walk from our door." },
        { id = "da_horde", when = { faction = "Horde" },
          text = "To Dalaran, in the Alterac Mountains, with the Kirin Tor. You'll have no business there, I expect; your skycutter leaves from the western dock for Mulgore." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "two_orders" } } },
      },
    },
    windshapers = {
      lines = {
        { id = "ws_default", text = "Earnest people, most of them, and I wish they'd spend that earnestness on something that answers. Ayessa means well, but she'd have us chase silent spirits across Kalimdor while our island falls into the sky, and she sends her people to frighten mine on the roads." },
        { id = "ws_ho", when = { race = "Skyborne", faction = "Alliance" },
          text = "You know what they are as well as I do. Ayessa means well, but she'd have us chase silent spirits across Kalimdor while our island falls into the sky, and she sends her people to frighten ours on the roads." },
      },
      choices = {
        { text = "Frighten them how?", next = "belathaan" },
        { text = "Something else.", next = "BACK", fx = { learn = { "two_orders" } } },
      },
    },
    belathaan = {
      lines = {
        { id = "bt_default", text = "A magister of my order, and a cousin of Valennia Stormfist's, whose mother was a Windshaper, so he of all people should have been safe from that quarrel. He took parts from one of their old constructs, Ayessa sent someone to put a scare into him on the road, and then he was dead." },
      },
      choices = {
        { text = "How did he die?", next = "belathaan2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    belathaan2 = {
      lines = {
        { id = "b2_default", text = "Lorthuna had him killed at a meeting on the road to the Shrine of Akir. The Windshapers would like everyone to forget that their own people were there to frighten him, and I'll not let anyone forget it." },
      },
      choices = {
        { text = "Why was he meeting Lorthuna at all?", tag = "Persuade", next = "blame",
          check = { pass = { any = { { disposition = { min = 65 } }, { origin = "skyborne_high_order" }, { origin = "skyborne_sky_enclave_student" }, { trait = "kind" } } } },
          fail = { next = "belathaan_fail", fx = { affinity = -1 } } },
        { text = "I'm sorry for your loss, Supreme Magister.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    blame = {
      lines = {
        { id = "bl_default", key = true, text = "Because I sent him. I thought Lorthuna might be bargained with, that peace with the cult might buy us time the orders couldn't buy each other, and he went because I asked. The Windshapers frightened him, but it was my errand that put him in front of her, and I think of that every night." },
      },
      choices = {
        { text = "You couldn't have known what she'd do.", next = "BACK", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "Then answer for it by finishing what he started.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    belathaan_fail = {
      lines = {
        { id = "bf_default", text = "That's a question for the High Order, and you'll forgive me if I don't answer it to every passing stranger. Belathaan's dead, and the reasons are mine to carry." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xm_default", text = "Very little yet, I suspect, since the Kirin Tor have taught us more in a season than we've taught them. But the Highborne knew things your Kirin Tor have never written down, and some of it survived with us, so ask me again in a year when we've sorted our own libraries." },
      },
      choices = {
        { text = "I'll hold you to that.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xalliance = {
      lines = {
        { id = "xa_default", text = "And we're glad of it, though I'll confess most of us had never seen anyone who wasn't an elf until a few months ago. Be patient with my people if they stare, and be patient with me if I ask you questions you think are foolish." },
        { id = "xa_dwarf", when = { race = "Dwarf" },
          text = "And we're glad of it. I'm told your people live under mountains and dig up the past for a living, which makes you the closest thing to a High Order scholar the Alliance has, so be patient with me if I ask you foolish questions." },
      },
      choices = {
        { text = "Ask anything you like.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xenclave = {
      lines = {
        { id = "xe_default", text = "Then you've seen what the Kirin Tor have that we don't, and you've seen what we have that they don't, which is rarer. Tell me honestly: did you bring anything useful home, or only a sore neck from staring at the ceilings?" },
      },
      choices = {
        { text = "Notes, and a good deal of them.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Mostly a sore neck, Supreme Magister.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    xgobetween = {
      big = true,
      lines = {
        { id = "xg_default", text = "I know the type, and I've used the type, and I've never been sure whose secrets you were really keeping. Tell me now, while it's just the two of us: when the orders quarrelled, whose side were you on?" },
      },
      choices = {
        { text = "The High Order's, always.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "My own. Both orders paid me, and both lied.", next = "BACK", fx = { affinity = -2, align = { honor = -1 }, trait = { skeptical = 1 } } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know a good deal about the High Order, the Kirin Tor and the cult that nearly finished us all. Ask what you need to." } },
    advice = { { id = "tp_ad", text = "Learn everything you can, and bring it home. Knowledge is the one thing nobody can take from us." } },
    two_orders = { { id = "tp_orders", text = "We would save Zephras ourselves; they would wait for the spirits to do it. I know which I'd rather stake my people on.", next = "windshapers" } },
    al_aketh = { { id = "tp_aketh", text = "They tore down the wards that hid us and lit a beacon for the Windlord. Whatever comes for Zephras now, the cult invited it." } },
    shal_nan = { { id = "tp_shal", text = "He brought us out of Eldre'Thalas and then gave up his crown, and then he left without a word. I've wished more than once that he'd left us his reasons." } },
    windstones = { { id = "tp_stones", text = "Concentrated power, and our people spend them like coin. One day I hope we'll understand them well enough to make more." } },
    _none = { { id = "tp_none", text = "That's outside my study, I'm afraid. Ask one of the scholars; they'll be delighted to bore you." } },
  },
}

---------------------------------------------------------------------------
-- Dondallion Whisperwind: High Order scholar at the order's hall. One of the
-- order's scholars has gone missing, and he'd like to know why.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_dondallion", id = TODO_NPC("Dondallion Whisperwind"), name = "Dondallion Whisperwind", title = "High Order",
  bible = "bibles/zep_high_order.md", role = "scholar", tier = "quest",
  communities = { "zephras_isle" }, temper = { "anxious", "gentle" }, values = { "curious", "loyal" },
  notices = { "race", "class", "kin" },

  impression = {
    first = "Dondallion Whisperwind of the High Order keeps his ink close and his worry closer. One of the order's scholars has gone missing, and he talks about it as if he had misplaced a friend.",
    third = "{name} met Dondallion Whisperwind, a High Order scholar in Valanaar troubled by a colleague who never came home.",
  },

  greetings = {
    { id = "g_default", text = "Oh! Forgive me, I was miles away. Winds' tidings." },
    { id = "g_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Missing Scholar") }, text = "Any word? Anything at all? Even a page would help." },
    { id = "g_done", when = { questDone = TODO_QUEST("The Missing Scholar") }, text = "Ah, it's you. Thank you again, for everything you found." },
  },

  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Kaldorei! I'm told your High Priestess is a Whisperwind too. Whether we share a family, nobody can say, and I've decided I like not knowing." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "You've ink on your fingers and a spellbook under your arm. A fellow scholar, then, and you have my sympathies." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Dondallion Whisperwind, of the High Order. I keep notes for the order, mostly, and lately I'm also keeping track of who has gone out to study and hasn't come back, which is not a list I ever wanted to keep." },
        { id = "h_before", when = { questBefore = TODO_QUEST("The Missing Scholar") },
          text = "If you're heading out past Valanaar, I may have a favor to ask of you. One of our scholars went out to study and hasn't come home, and I'm running out of people to send." },
        { id = "h_after", tags = { "news" }, when = { questDone = TODO_QUEST("The Missing Scholar") },
          text = "I've written up what you found and put it in the order's records, which is what we do with everything, even the things that hurt. Thank you for going when nobody else would." },
      },
      again = {
        { id = "h_again", text = "Was there something more? I've a moment between pages." },
        { id = "h_again2", text = "Go on, please. Talking helps me think." },
      },
      choices = {
        { text = "Tell me about the missing scholar.", next = "missing" },
        { text = "What sort of notes do you keep?", next = "work" },
        { text = "What do you think of the Supreme Magister?", next = "elaadrin" },
        { text = "Whisperwind is an old name.", next = "name" },
        { text = "How does a scholar end up on the road?", next = "xmage", when = { class = "MAGE" } },
        { text = "Our High Priestess is a Whisperwind too.", next = "xnelf", when = { race = "NightElf" } },
        { text = "Winds' tidings, Dondallion.", next = "END" },
      },
    },
    missing = {
      lines = {
        { id = "mi_default", text = "A good scholar, careful and much braver than me, who went out to study the island and simply stopped writing back. On this isle there are a dozen ways for that to happen: the cult, the bandits, the beasts, or the ground falling out from underneath." },
        { id = "mi_done", when = { questDone = TODO_QUEST("The Missing Scholar") },
          text = "You know the story better than I do now, since you were the one who went. I've put it all in the records, and I still read it over sometimes, hoping it will end differently." },
      },
      choices = {
        { text = "Who do you think is to blame?", next = "blame" },
        { text = "Why not send the Peacekeepers?", next = "peacekeepers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    blame = {
      big = true,
      lines = {
        { id = "bl_default", text = "Some in the hall are already saying it was the Windshapers, because a High Order magister died on the road not long ago and nobody's forgotten who was waiting for him. I don't know, and I'd rather not name an enemy until I'm sure, but I'm in the minority." },
      },
      choices = {
        { text = "Don't blame the Windshapers without proof.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The Windshapers have earned the suspicion.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    peacekeepers = {
      lines = {
        { id = "pk_default", text = "I asked, and they were very polite, and they told me they had cultists on every road and refugees in every barn. They can't go looking for one scholar who might only be late, and I can't blame them for it, though I'd like to." },
      },
      choices = {
        { text = "Then I'll keep an eye out.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = {
        { id = "wo_default", text = "Everything the order learns, written down twice so one copy survives if the other doesn't. The ley lines breaking through, what the old books say, what the Kirin Tor tell us, what our explorers bring back: it all comes across my desk eventually." },
      },
      choices = {
        { text = "What's the most interesting thing you've recorded?", next = "leylines" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leylines = {
      lines = {
        { id = "ll_default", text = "The ley lines, without question. They used to lie deep in the ground, out of reach, and now they're breaking through the surface all over Zephras, and nobody can tell me why. The Windshapers call them scars, and I write that down too, because a good record keeps the arguments as well as the answers." },
      },
      choices = {
        { text = "What do you call them?", next = "leylines2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    leylines2 = {
      lines = {
        { id = "l2_default", text = "A question I can't answer yet, which is the best kind. My order calls them treasure, and I'll admit they're beautiful, but something is pushing them up out of the earth, and I would very much like to know what before we start pulling on them." },
      },
      choices = {
        { text = "That's a cautious view for the High Order.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xnelf = {
      lines = {
        { id = "xn_default", text = "So I've been told, and I've been dying to ask one of you: is it a common name among your people, or a grand one? If it's grand, I'll have to start standing up straighter." },
      },
      choices = {
        { text = "It's a very grand name, I'm afraid.", next = "xnelf2", fx = { trait = { witty = 1 } } },
        { text = "Common enough. Don't let it go to your head.", next = "xnelf2", fx = { affinity = 1 } },
      },
    },
    xnelf2 = {
      lines = {
        { id = "x2_default", text = "Well, I'll write it down either way, and some scholar a thousand years from now can decide what it means. That's the comfort of keeping records: you never have to be right, only careful." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    elaadrin = {
      lines = {
        { id = "el_default", text = "Brilliant, tireless, and harder on himself than he lets anyone see. He works in the next room, so I'll not say anything I wouldn't want him to hear, but he took Belathaan's death very badly, and he hasn't been sleeping." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = {
        { id = "na_default", text = "It is, and I've been told some of the kaldorei below the clouds carry it too, including someone rather important. Whether that makes us family, nobody can say, and I've decided I'd rather wonder than be disappointed." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xm_default", text = "Usually by asking one question too many and being told to go and find the answer themselves. That's how I came to keep the records, actually: I went out once, got thoroughly lost, and decided the order would be better served by my handwriting." },
      },
      choices = {
        { text = "There's no shame in that.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I've read most of what the order has written down, and written a fair bit of it myself. Ask." } },
    two_orders = { { id = "tp_orders", text = "I keep both sides of the argument in the records. It's the only place they sit quietly together." } },
    al_aketh = { { id = "tp_aketh", text = "I have a whole shelf on the Al'Aketh now, and I wish I didn't." } },
    advice = { { id = "tp_ad", text = "Write things down. Memory is generous to us, and records aren't." } },
    _none = { { id = "tp_none", text = "I don't have anything on that, I'm afraid. I'll make a note to look." } },
  },
}

---------------------------------------------------------------------------
-- Iaadaria Bitterwind: High Order alchemist and trainer. Sells vials; busy,
-- exact, impatient with interruptions; has a problem with some visitors.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_iaadaria", id = TODO_NPC("Iaadaria Bitterwind"), name = "Iaadaria Bitterwind", title = "Alchemist",
  bible = "bibles/zep_high_order.md", role = "trainer", tier = "quest",
  communities = { "zephras_isle" }, temper = { "sharp", "proud" }, values = { "craft", "curious" },
  notices = { "craft", "class", "race" },

  impression = {
    first = "Iaadaria Bitterwind of the High Order teaches alchemy and resents every minute spent away from her vials. She's exact, short with fools, and secretly delighted when someone asks a good question.",
    third = "{name} met Iaadaria Bitterwind, the High Order's alchemist in Valanaar, who sells vials and teaches the craft.",
  },

  greetings = {
    { id = "g_default", text = "Yes? Make it worth stopping for; this tincture won't stir itself." },
    { id = "g_alch", when = { profession = { "Alchemy" } }, text = "Ah, an alchemist. You may interrupt me; you'll know why it matters." },
    { id = "g_visitors", tags = { "news" }, when = { questActive = TODO_QUEST("Unwelcome Visitors") }, text = "Have you dealt with them yet? I can't work with them about." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = { "Alchemy" } },
      text = "Your fingertips are stained the way only alchemists' are, that particular shade of regret. Welcome." },
    { id = "n_herb", cat = "craft", when = { profession = { "Herbalism" } },
      text = "You smell of crushed leaves. An herbalist? Then you and I may be very useful to each other." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "Don't touch anything on the bench. I don't know what fel does to a tincture, and I don't want to find out in my own workroom." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Iaadaria Bitterwind. I teach alchemy to the High Order and sell vials to anyone with coin, and I'd rather be doing the first than talking about it. What is it you need?" },
        { id = "h_before", when = { questBefore = TODO_QUEST("Unwelcome Visitors") },
          text = "If you're looking for work, I have a problem with some visitors I didn't invite and can't get rid of. I'd deal with them myself, but I've a batch on the flame that won't wait for anyone." },
        { id = "h_done", tags = { "news" }, when = { questDone = TODO_QUEST("Unwelcome Visitors") },
          text = "It's quiet again, thanks to you, and I've had three good days of work in a row. That's a record on this isle lately." },
      },
      again = {
        { id = "h_again", text = "Anything else? Quickly, please." },
        { id = "h_again2", text = "Ask, and I'll answer while I stir." },
      },
      choices = {
        { text = "I'd like to train in alchemy.", next = "BUSINESS" },
        { text = "What can alchemy do for Zephras?", next = "alchemy" },
        { text = "Why are some of your vials so costly?", next = "vials" },
        { text = "Who are these unwelcome visitors?", next = "visitors" },
        { text = "What did the Highborne know that you don't?", next = "highborne" },
        { text = "What do you need from an herbalist?", next = "xherb", when = { profession = { "Herbalism" } } },
        { text = "What should an alchemist look for below the clouds?", next = "xalch", when = { profession = { "Alchemy" } } },
        { text = "Farewell, Iaadaria.", next = "END" },
      },
    },
    alchemy = {
      lines = {
        { id = "al_default", text = "More than most people think. The Highborne could coax power out of a leaf or a stone that the rest of us would walk past, and we lost most of that knowing in Skywall. I mean to win some of it back, one recipe at a time." },
      },
      choices = {
        { text = "What's stopping you?", next = "alchemy2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alchemy2 = {
      lines = {
        { id = "a2_default", text = "Ingredients, mostly. The old recipes ask for herbs that only grow in Kalimdor, if they grow anywhere at all now, and island substitutes behave differently under heat. I'm told the alchemists below the clouds have whole markets full of what I've only read about." },
      },
      choices = {
        { text = "Should we keep the old recipes or make new ones?", next = "recipes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    recipes = {
      big = true,
      lines = {
        { id = "re_default", text = "That's the argument in every workroom in Valanaar. Some of us want the Highborne formulas exactly as written, and some of us would rather invent our own and stop chasing ghosts, and I change my mind about it roughly once a week." },
      },
      choices = {
        { text = "Recover the old formulas exactly. That's our inheritance.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Invent new ones. The Highborne didn't have our problems.", next = "BACK", fx = { affinity = 1, align = { order = -1 }, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    vials = {
      lines = {
        { id = "vi_default", text = "A plain vial is glass, and glass is cheap. An imbued vial has been worked so it holds power without cracking, and that takes hours I could have spent on anything else, so I charge for the hours and not the glass." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    visitors = {
      lines = {
        { id = "vs_default", text = "The sort that don't knock, don't pay and won't leave, and that's all I care to say about them while I'm trying to concentrate. If you want to be useful, come back when you're ready to do something about them." },
        { id = "vs_done", when = { questDone = TODO_QUEST("Unwelcome Visitors") },
          text = "Gone, thanks to you, and I'd rather not think about them again. I've already scrubbed the bench twice." },
      },
      choices = {
        { text = "Should I drive them off or finish them?", next = "visitors2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    visitors2 = {
      big = true,
      lines = {
        { id = "v2_default", text = "I don't much care how, so long as they're gone, though I suppose you'll want me to say something wise about it. Some would say drive them off and give them a chance, and some would say anything that comes back twice should be made not to come back at all." },
      },
      choices = {
        { text = "Drive them off. They're only doing what they must.", next = "BACK", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Finish them. Mercy just means they come back.", next = "BACK", fx = { affinity = 1, align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    highborne = {
      lines = {
        { id = "hb_default", text = "Draughts that let a magister work for three days without sleep, salves that closed a wound while you watched, things our books only describe in a line or two because everyone at the time already knew how. We brought the descriptions out of Eldre'Thalas and lost the knowing somewhere along the way." },
      },
      choices = {
        { text = "Could any of it be recovered?", next = "highborne2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    highborne2 = {
      lines = {
        { id = "h2_default", text = "Some, if the Kirin Tor's libraries are half what Ansirem claims, and if whoever goes down to read them has the sense to copy recipes and not only spells. Will you be going below? Because if you are, I'd like you to keep your eyes open on my behalf." },
      },
      choices = {
        { text = "I'll copy any old recipe I find.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "I'll have more pressing things to read.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    xalch = {
      lines = {
        { id = "xa_default", text = "Anything that grows where nothing grows up here: swamp plants, desert plants, whatever lives under trees thicker than our whole grove. And write down what the local alchemists call things, because I'd wager half our old recipes use names nobody below remembers either." },
      },
      choices = {
        { text = "I'll keep a list for you.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xherb = {
      lines = {
        { id = "xh_default", text = "Everything, and promptly. Bring me what grows wild on Zephras and on the mainland both, and tell me where you found it, because a leaf from a windy cliff and a leaf from a sheltered hollow are not the same leaf, whatever the books say." },
      },
      choices = {
        { text = "I'll keep notes on where I gather.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Label everything. I've seen apprentices drink a reagent they mistook for tea, and it is not a pretty sight." } },
    two_orders = { { id = "tp_orders", text = "The Windshapers ask the leaf's permission. I ask the leaf what it's made of. Draw your own conclusions." } },
    windstones = { { id = "tp_stones", text = "I've tried distilling one, and I've a scar on my wrist to show for it. Don't." } },
    _none = { { id = "tp_none", text = "I don't know, and I've a batch on the flame. Ask someone with less to do." } },
  },
}

---------------------------------------------------------------------------
-- Othesia Evengale: tailor in her home in Valanaar. Thread and dye; cloth
-- that moves like the wind; tired of people asking about her surname.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_othesia", id = TODO_NPC("Othesia Evengale"), name = "Othesia Evengale", title = "Tailor",
  bible = "bibles/zep_high_order.md", role = "trainer", tier = "service",
  communities = { "zephras_isle" }, temper = { "warm", "sharp" }, values = { "craft", "kind" },
  notices = { "craft", "kit" },

  impression = {
    first = "Othesia Evengale teaches tailoring from her own home in Valanaar, with thread and dye on every surface. She makes cloth that moves like the wind and gets visibly tired whenever anyone mentions her surname.",
    third = "{name} met Othesia Evengale, a tailor of Valanaar who works out of her home.",
  },

  greetings = {
    { id = "g_default", text = "Gale's greetings, friend. Mind the dye pots, they're everywhere." },
    { id = "g_tailor", when = { profession = { "Tailoring" } }, text = "A fellow tailor! Come in; you'll forgive the mess, you'll have one just like it." },
  },

  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = { "Tailoring" } },
      text = "Your seams are good, I can tell from here. Tight stitches, and you've not skimped on the thread." },
    { id = "n_ragged", cat = "kit", when = { nearlyNaked = true },
      text = "Winds above, you're barely dressed! Sit down before you catch your death, and let me see what I can find." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Othesia Evengale, tailor, and yes, this is my house, and yes, I teach here, because a workshop costs windstones I'd rather spend on thread. What can I do for you?" },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm only hemming." },
        { id = "h_again2", text = "Go on; my needle can listen." },
      },
      choices = {
        { text = "Train me, or show me your thread and dye.", next = "BUSINESS" },
        { text = "What makes Skyborne cloth different?", next = "cloth" },
        { text = "Are you related to the Supreme Magister?", next = "name" },
        { text = "Who designed the Al'Aketh's robes?", next = "robes" },
        { text = "Why do so many people wear feathers in their hair?", next = "feathers" },
        { text = "Winds be with you, Othesia.", next = "END" },
      },
    },
    cloth = {
      lines = {
        { id = "cl_default", text = "We cut it to move the way the wind moves, loose where it should be and caught where it should be, so it flows when you walk. Since the spirits left, people have told me that wearing it feels a little like having them close again, and that's why I keep making it." },
      },
      choices = {
        { text = "Does it really comfort people?", next = "cloth2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cloth2 = {
      big = true,
      lines = {
        { id = "c2_default", text = "It does, and the High Order thinks that's sentimental nonsense from someone who should be studying runes. I think a people that's lost as much as we have needs small comforts as much as it needs spells." },
      },
      choices = {
        { text = "Small comforts matter. Keep making it.", next = "BACK", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Comfort won't hold the island up. The order's right.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = {
        { id = "na_default", text = "You and half of Valanaar. If you want to know whose family is whose, go and ask him, and when he gives you a straight answer, come and tell me, because I'd like to hear one too." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    feathers = {
      lines = {
        { id = "fe_default", text = "Hippogryph feathers, and because they're beautiful, and because we need beautiful things just now. Half my customers want one braided in with whatever I've made them, and I've stopped pretending I mind; it's the nicest part of the job." },
        { id = "fe_out", when = { ["not"] = { race = "Skyborne" } },
          text = "Hippogryph feathers, and because they're beautiful, and we need beautiful things just now. I could braid one in for you, if your people wouldn't laugh at you for it when you go home." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    robes = {
      lines = {
        { id = "ro_default", text = "Some tailor from Falaath Village, they say, who put on the grey robes to save his own neck and then had the nerve to improve the cut. I'd like a word with him about those hems, and possibly about everything else." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    windstones = { { id = "tp_stones", text = "A bolt of good cloth costs a windstone or two now. It used to cost a smile and a promise." } },
    _none = { { id = "tp_none", text = "I sew, friend. Ask the scholars next door; they'll tell you more than you wanted." } },
  },
}

---------------------------------------------------------------------------
-- Gelia Shardsong: a Valanaar townswoman near the High Order's hall who
-- watches the comings and goings and has opinions on all of them.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_gelia", id = TODO_NPC("Gelia Shardsong"), name = "Gelia Shardsong",
  bible = "bibles/zep_high_order.md", role = "citizen", tier = "service",
  communities = { "zephras_isle" }, temper = { "cheerful", "curious" }, values = { "curious", "kind" },
  notices = { "race", "stranger" },

  impression = {
    first = "Gelia Shardsong spends her days on a step near the High Order's hall in Valanaar, watching everyone who passes and asking the strangers more questions than they can answer.",
    third = "{name} met Gelia Shardsong, a curious woman of Valanaar who keeps an eye on everything that happens near the High Order's hall.",
  },

  greetings = {
    { id = "g_default", text = "Oh, hello! You're new, aren't you? I'd remember that face." },
    { id = "g_stranger", when = { ["not"] = { race = "Skyborne" } }, text = "Another one from below the clouds! Come here, I've questions." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "You're the first orc I've seen up close. You're greener than I expected, and you smile more than the stories said you would." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "You're so small! I mean that kindly; I only wonder how you keep from blowing away up here." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Gelia. I sit here most days because you see everyone from this step: magisters going in and out of the hall, the dockhands coming up from the skycutters, and now mainlanders, which is the best thing that's happened to this town in years." },
      },
      again = {
        { id = "h_again", text = "What else? I've all day, honestly." },
        { id = "h_again2", text = "Go on, I love a good question." },
      },
      choices = {
        { text = "What have you seen lately?", next = "seen" },
        { text = "What do people in Valanaar make of the mainlanders?", next = "mainlanders" },
        { text = "Will you go below the clouds yourself?", next = "below" },
        { text = "What's Valanaar like, for someone who lives here?", next = "town" },
        { text = "Farewell, Gelia.", next = "END" },
      },
    },
    seen = {
      lines = {
        { id = "se_default", text = "The lamps in the High Order's hall burning all night, every night, since the business at the Shrine. Peacekeepers marching bandits down to the cells, which never used to happen here. And refugees from the fallen places, more of them every week, carrying everything they own." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    mainlanders = {
      lines = {
        { id = "ma_default", text = "Half of us are thrilled, and half of us are hiding in our houses, and my grandmother's both at once. Tell me, what do your people think of us? Be honest, I can take it." },
        { id = "ma_skyborne", when = { race = "Skyborne" },
          text = "Half of us are thrilled, and half of us are hiding in our houses, and my grandmother's both at once. You'll be going below soon yourself, won't you? Will you write and tell me what it's like?" },
      },
      choices = {
        { text = "They're curious about you, mostly.", next = "BACK", fx = { affinity = 2 } },
        { text = "Most of them have never heard of you.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    town = {
      lines = {
        { id = "to_default", text = "Busy, and windy, and a little frightened under all the busyness. Donaal's inn is full of refugees, Nyalah's kitchen smells better than anything has a right to, and the two orders each have a dock and pretend the other one isn't there." },
      },
      choices = {
        { text = "Which order do you side with?", next = "town2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    town2 = {
      lines = {
        { id = "t2_default", text = "Neither, and I'm not ashamed to say it. My cousin's a Windshaper and my neighbor's High Order, and they both bring me bread when I'm ill, so I've decided I'm on the side of bread." },
      },
      choices = {
        { text = "That's the wisest answer I've heard on this isle.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    below = {
      big = true,
      lines = {
        { id = "be_default", text = "I keep meaning to, and then I look over the edge of the dock and think better of it. Someone has to stay and keep the town going, I tell myself, but I can't decide whether that's wisdom or only fear." },
      },
      choices = {
        { text = "Go. The world below is worth seeing.", next = "BACK", fx = { affinity = 1, align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Stay. Valanaar needs people who stay.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "No idea, but if you find out, come back and tell me. I'll be right here." } },
  },
}

---------------------------------------------------------------------------
-- High Order Dockmaster: the eastern skydock, for the skycutter to Dalaran
-- in the Alterac Mountains.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_dockmaster", id = TODO_NPC("High Order Dockmaster"), name = "High Order Dockmaster",
  bible = "bibles/zep_high_order.md", role = "worker", tier = "service",
  communities = { "zephras_isle" }, temper = { "steady", "proud" }, values = { "duty", "order" },
  notices = { "race", "kin" },

  impression = {
    first = "The High Order's dockmaster keeps the eastern skydock in Valanaar and talks about the Dalaran skycutter the way a proud father talks about a clever child.",
    third = "{name} met the High Order Dockmaster on Valanaar's eastern skydock, where the skycutter leaves for Dalaran.",
  },

  greetings = {
    { id = "g_default", text = "Eastern dock, for Dalaran. The next skycutter isn't far off." },
    { id = "g_horde", when = { faction = "Horde" }, text = "This is the Dalaran pier, friend. Yours is the western dock." },
  },

  notice = {
    { id = "n_leaving", cat = "kin", when = { race = "Skyborne", faction = "Alliance", minLevel = 10 },
      text = "You'll be one of the ones going below for good, then. Keep your feet planted when the ship crosses over; it lurches." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Back to Dalaran, is it? Your Kirin Tor built the portal half of this journey, so I'll say thank you on their behalf, since they never stay long enough to hear it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "This is the High Order's dock. The skycutter that comes in here will take you straight to Dalaran, at the northern end of the city, and from there the Kirin Tor can see you on to Stormwind if you've the need." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "This is the High Order's dock, and the ship here goes to Dalaran, which won't suit you. The Windshapers run their own skycutter from the western dock to Mulgore, so go and ask them for passage." },
      },
      again = {
        { id = "h_again", text = "Anything else before the ship comes in?" },
        { id = "h_again2", text = "Ask. I'll keep one eye on the sky." },
      },
      choices = {
        { text = "How does a skycutter cross between worlds?", next = "crossing" },
        { text = "What's Dalaran like?", next = "dalaran" },
        { text = "What about the western dock?", next = "west" },
        { text = "Do many mainlanders come up on your ship?", next = "visitors" },
        { text = "Thank you, Dockmaster.", next = "END" },
      },
    },
    crossing = {
      lines = {
        { id = "cr_default", text = "Carefully, and by the numbers. The magisters worked out the safe routes from readings of how the elemental energies flow, and the pilots follow them to the letter, because a skycutter that strays off the route in the Plane of Air doesn't come back." },
      },
      choices = {
        { text = "Has one ever strayed?", next = "crossing2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crossing2 = {
      lines = {
        { id = "c2_default", text = "Not on my dock, and not while I'm dockmaster. Skycutters used to run between all the isles before the skystreams closed, and I've heard of ships from those last days that nobody's seen since, so I check every reading twice." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    dalaran = {
      lines = {
        { id = "da_default", text = "A city of mages in the mountains, full of violet towers and humans in robes, and the Kirin Tor have given our order rooms in their citadel. I've only seen it from the deck, but I've never seen so many people in one place in my life." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    visitors = {
      lines = {
        { id = "vi_default", text = "More every week: humans in robes, dwarves who grip the rail the whole crossing, now and then a gnome who wants to know how the ship works and won't take no for an answer. Most of them step off, look over the edge of the dock, and go very quiet for a moment." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    west = {
      lines = {
        { id = "we_default", text = "The Windshapers' dock, with their skycutter to Mulgore and the tauren. We nod to each other across the water every morning, the western dockmaster and I, and that's about as warm as it gets between our orders these days." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "two_orders" } } },
      },
    },
  },

  topics = {
    two_orders = { { id = "tp_orders", text = "Two docks, two ships, two orders, and both of us pretend the other dock isn't there." } },
    _none = { { id = "tp_none", text = "I know ships and routes, friend. Ask up in the town for the rest." } },
  },
}
