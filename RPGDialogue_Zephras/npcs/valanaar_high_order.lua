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
  likesTone = "polite",
  notices = { "kin", "race", "class", "origin" },

  impression = {
    first = "He is angrier about the dead than he lets his face show.",
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
      text = "A gnome! Archmage Ansirem's letters spoke of gnomish scholars in Dalaran, and I took it for a joke at my expense. I'm glad to be wrong." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Kaldorei. Our ancestors left yours ten thousand years ago in the middle of a quarrel, and I'd like to think we can both be more civil about it now." },
    { id = "n_enclave", cat = "origin", when = { origin = "skyborne_sky_enclave_student" },
      text = "You've been to the Sky Enclave already, I can see the Violet Citadel's dust on your hem. I expect every one of you to bring something useful home, and I haven't forgotten that I said so." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "I know that cold. Prince Tortheldrin reached for the same power, and our people have been paying for it for ten thousand years, so my eyes stay on your hands." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "The High Order's powers have weakened in our long years in Skywall, and I'll admit as much to anyone. But Highborne magic can do everything the elementals once did to keep our settlements alive, and I mean to recover what we've lost and save Zephras without begging any outside power to do it for us." },
        { id = "h_catch", tags = { "news" }, when = { questActive = TODO_QUEST("Catching Wind") },
          text = "The Index Esoteria needs its readings from the Overlook Standing Stones, and the Windshapers will complain whatever you do, so do it quickly. Without those numbers no skycutter can cross between the planes safely, and I'll not gamble our people on guesswork." },
        { id = "h_avenge", tags = { "news" }, when = { questActive = TODO_QUEST("Avenged Tenfold") },
          text = "Belathaan Brightwish, one of my magisters, went out to talk of peace, and the cult killed him for it. See that his death is answered, and don't come back to me with excuses." },
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
        { text = "Agreed. Leaning on patrons is how a people gets dropped.", next = "BACK", reply = "Exactly, and I'm glad someone outside my order sees it. Valanaar could use more voices like yours.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Nobody survives alone. Pride could sink us faster than the pylons.", next = "BACK", reply = "Pride hasn't sunk us yet, and dependence nearly did. I'll take my chances with the first.", fx = { affinity = -2, align = { order = -1 } } },
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
        { text = "Our people's road. The stones will survive a few readings.", next = "BACK", reply = "Good, that's the answer I'd hoped for. The stones will be no worse for a little reading.", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "Their ground. Respect it, or we're no better than the cult.", next = "BACK", reply = "No better than the cult, is it? Strong words, and I'll remember them. Choose your friends carefully.", fx = { affinity = -2, align = { honor = 1 } } },
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
        { id = "s2_default", text = "Ayessa Dawnsinger of the Windshapers and I faced her on the Rohashi Spires, where she told us the wards had been down for days and she'd lit a beacon for Al'Akir's followers. Rohash of the Conclave answered, struck her into the sky and promised us the Windlord's judgement, and without Ansirem's Kirin Tor I wouldn't be here." },
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
        { text = "Then make it more than a truce. The isle can't afford this.", next = "BACK", reply = "Ayessa would say the same, and I'll tell her you're on her side. I'll not promise more than that.", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Some blood has to be answered. You're right to hold to that.", next = "BACK", reply = "I'm glad someone understands. I'll keep the truce, but I'll not pretend to like the faces across the table.", fx = { affinity = 2, align = { light = -1 } } },
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
        { id = "kh_default", text = "They agreed to receive us as guests, and we've learned more from them already than we've taught them, I suspect. Ansirem Runeweaver persuaded Rhonin himself to help open the portal that brought their magi to the Shrine, and the High Order won't forget that." },
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
        { id = "bt_default", text = "A magister of my order and a cousin of Valennia Stormfist's, and his own mother was a Windshaper, so he of all people should have been safe from that quarrel. He took parts from one of their old constructs, Ayessa sent someone to put a scare into him on the road, and then he was dead." },
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
        { id = "bf_default", text = "That's a question for the High Order, and I don't answer it for passing strangers. Belathaan's dead, and the reasons are mine to carry." },
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
        { id = "xe_default", text = "Then you've seen what the Kirin Tor have that we don't, and you've seen what we have that they don't, which is rarer. So tell me: did you bring anything useful home, or only a sore neck from staring at the ceilings?" },
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
        { text = "The High Order's, always.", next = "BACK", reply = "Good, that's what I'd hoped. Keep it that way.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "My own. Both orders paid me, and both lied.", next = "BACK", reply = "Honest, at least, and that's rarer than loyalty. I'll be watching you all the same.", fx = { affinity = -2, align = { honor = -1 }, trait = { skeptical = 1 } } },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "You have a clear eye, and I'll not be falsely modest about it. The High Order has waited a very long time for anyone to notice what it kept alive, so I thank you for noticing." },
        { id = "s2", text = "Well said, and better said than I hear it in my own hall. If more people on this isle thought as you do, I'd have saved Zephras by now." },
        { id = "s3", when = { class = "MAGE" }, text = "From one who knows the arcane, that is praise worth having. You understand what it costs to hold a spell together when the whole world would rather it failed." },
      },
      fail = {
        { id = "f1", text = "I am Supreme Magister, and I'm flattered daily by scholars who want a larger study. You'll have to bring me something more useful than compliments." },
        { id = "f2", text = "That is the sort of thing people say before they ask for the Order's secrets. I'd advise you to save your breath and earn them instead." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Hm. You've a sharper tongue than most of my magisters, and a good deal more nerve. I can use people who aren't afraid to tell me I'm wrong, though I rarely am." },
        { id = "s2", text = "Insolent, and quick about it. I was much the same before they hung a title on me, so I'll let it pass, and I may even enjoy it." },
      },
      fail = {
        { id = "f1", text = "I have buried one of my own magisters, and I've no patience left for being baited. Mind how you speak in the High Order's hall." },
        { id = "f2", text = "You mistake my attention for tolerance. I gave you the first freely, and you are spending the second very fast." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "You make yourself plain, and I'm not fool enough to pretend I didn't feel it. Our powers aren't what they were, as I've admitted before, so I'll hear you out with care." },
        { id = "s2", text = "I've seen what happens to those who misjudge a threat, and I'll not misjudge yours. Speak, and you'll find me more accommodating than my pride would like." },
      },
      fail = {
        { id = "f1", text = "The Windlord's own servants have threatened this isle, and I have not given them an inch. You are a good deal smaller than they are, and you won't move me by glowering." },
        { id = "f2", text = "You threaten the Supreme Magister in his own hall, with every ward in Valanaar listening. I suggest you think again, and think quickly." },
      },
    },
  },

  blurts = {
    { id = "bl1", text = "The Windshapers sent their own people to frighten Belathaan on the road, before Lorthuna's cult ever laid a hand on him. They'd like the whole isle to forget that, and I never will." },
    { id = "bl2", text = "The Index Esoteria at the Overlook Standing Stones shows safe paths between the planes, and the Windshapers call those stones sacred so that we can't touch them. That is the real quarrel between the orders, whatever anyone tells you." },
  },
  confides = {
    { id = "cnf_1", text = "Our skycutter sets down at the north end of Dalaran, and the Sky Enclave keeps a portal to Stormwind in the Violet Citadel. It's the quickest road off this isle to anywhere that matters." },
    { id = "cnf_2", text = "Iaadaria Bitterwind has a scar from trying to distil a windstone, and she knows more about their insides than anyone in Valanaar. If one of yours behaves oddly, take it to her before it behaves worse." },
    { id = "cnf_3", text = "Not every Al'Aketh was broken at the Shrine of Akir. I'm certain a few slipped away with their robes in their packs, and I'd watch any grey-robed stranger on the outer islands." },
  },
  topics = {
    grievance = {
      { id = "gv1", text = "You've wasted my time, and time is the one thing the High Order cannot replace. I don't forgive that easily, and I see no reason to start with you." },
      { id = "gv_enemy", when = { grudge = "enemy" }, text = "You come to Valanaar under the Horde's banner, the same banner the Windshapers have run off to join in Mulgore. Forgive me if I'm not delighted." },
      { id = "gv_wronged", when = { grudge = "wronged" }, text = "You spoke of Belathaan as though his death were a story to pass the time. He was one of mine, and I'll not hear him spoken of so lightly again." },
      { id = "gv_pers", when = { grudge = "persuade" }, text = "You tried to argue me into a corner, as though the Supreme Magister had never been argued with. I've outlasted far better debaters in council." },
    },
    amends = {
      { id = "am1", text = "Bring the High Order something it has lost, whether knowledge, relics or plain loyalty. Any of the three would begin to change my mind." },
      { id = "am_wronged", when = { grudge = "wronged" }, text = "Honour Belathaan's name, and see his death answered. That is the only apology I'll accept for it." },
    },
    spite = {
      { id = "sp1", text = "I think you're a tourist in a dying land, gawking at our ruins and calling it adventure. When the isles fall you'll have a fine story, and we'll have nothing." },
      { id = "sp_enemy", when = { grudge = "enemy" }, text = "I think the Windshapers chose their friends badly, and you're the proof of it. Tell them I said so, if you see them in Mulgore." },
    },
    _gated = {
      { id = "gt1", text = "The Order's business is not for every visitor who walks into my hall. Prove your worth to Zephras, and I may speak more freely." },
      { id = "gt2", text = "I'll not discuss that with you yet. Knowledge is the one treasure we have left, and I'm careful whom I hand it to." },
    },
    knows = { { id = "tp_knows", text = "I know a good deal about the High Order, the Kirin Tor and the cult that nearly finished us all. Ask what you need to." } },
    advice = { { id = "tp_ad", text = "Learn everything you can, and bring it home. Knowledge is the one thing nobody can take from us." } },
    two_orders = { { id = "tp_orders", text = "We would save Zephras ourselves; they would wait for the spirits to do it. I know which I'd rather stake my people on.", next = "windshapers" } },
    al_aketh = { { id = "tp_aketh", text = "They tore down the wards that hid us and lit a beacon for the Windlord. Whatever comes for Zephras now, the cult invited it." } },
    shal_nan = { { id = "tp_shal", text = "He brought us out of Eldre'Thalas and then gave up his crown, and then he left without a word. I've wished more than once that he'd left us his reasons." } },
    windstones = { { id = "tp_stones", text = "Concentrated power, and our people spend them like coin. One day I hope we'll understand them well enough to make more." } },
    _none = { { id = "tp_none", text = "That's outside my study, I'm afraid. Ask one of the scholars; they'll be delighted to bore you." } },
    regard = {
      { id = "rg_1", text = "I think you have a mind worth training, {name}, and I don't say that to many outside the Order. Don't let it go to waste on swordplay." },
      { id = "rg_2", text = "You've served Zephras without asking what it would pay, and I've watched you do it. The High Order remembers its friends, whatever the Windshapers say of us." },
      { id = "rg_mage", when = { class = "MAGE" }, text = "A mage who actually studies, rather than merely throwing fire about. If you were Skyborne, I'd have you in the Sky Enclave by spring." },
      { id = "rg_order", when = { alignment = { axis = "order", min = 30 } }, text = "You respect discipline and you keep your word, which is more than I can say for half the Council. I find that very restful." },
    },
    confide = {
      { id = "cf_1", text = "I haven't slept a whole night since Belathaan died, and Dondallion has noticed, though he's too polite to say so. I work by lamplight because the dark is full of things I should have said." },
      { id = "cf_2", text = "Ansirem's letters from Dalaran are mostly jokes about gnomes, and I read every one of them twice. Don't tell the Order; they believe I only read his formulae." },
    },
    trust = {
      { id = "tr_1", text = "Dondallion, who keeps our records twice over and has never lost a page. And Archmage Ansirem, who came when we called and hasn't yet asked for anything in return." },
      { id = "tr_2", text = "Trust the Peacekeepers to keep the peace, and expect nothing else of them. They're stretched so thin they couldn't search for a lost scholar if the Council begged them." },
    },
    watchout = {
      { id = "wo_1", text = "Be wary of anyone at the Overlook Standing Stones who tells you they're only praying. The Windshapers guard those stones more jealously than any vault, and they're not gentle with trespassers." },
      { id = "wo_2", text = "Don't carry High Order papers through Windshaper country, and don't wear our colours in Mulgore. The ceasefire is a truce and not a peace, whatever the Council tells you." },
    },
    worries = {
      { id = "wy_1", text = "That the Windshapers are right, and we've been reaching for power that was never meant for us. I don't believe it, but I think about it far more often than I'd like." },
      { id = "wy_2", text = "That Rohash will come back for Zephras before the Order is ready, and that I'll have to choose between the isle and the Order's pride. I know which I'd choose, and I'm not sure the Order does." },
    },
    hopes = {
      { id = "hp_1", text = "To make a windstone with our own hands, from Highborne knowledge and nothing else. The day we can, Zephras stops begging the spirits for its lamplight." },
      { id = "hp_2", text = "That Belathaan's death is answered, and that his is the last. I'd settle for the first, but I'd give a great deal for the second." },
    },
    favor = {
      { id = "fv_1", text = "If you find any Highborne writing out in the world, even a scrap, bring it to Valanaar before you sell it. Knowledge is the one thing we can't afford to let slip a second time." },
      { id = "fv_2", text = "Visit Belathaan's family, if you pass them. His mother was a Windshaper, and she won't want to hear his name from me." },
    },
    friendship = {
      { id = "fr_1", text = "I do, {name}, and you'd be astonished how few people the Supreme Magister can say that of. Most want something from this chair; you've only ever wanted to help." },
      { id = "fr_2", text = "Yes, a friend, and one I'd trust in my own hall with the wards down. That's rarer on this isle than any windstone." },
      { id = "fr_horde", when = { faction = "Horde" }, text = "You wear the Horde's colours, and I count you a friend anyway, which I'd have sworn was impossible a year ago. Don't tell the Order I said so." },
    },
    never_told = {
      { id = "nt_1", text = "I was afraid of the arcane as a child, truly terrified of it, and I joined the Order to prove to myself I wasn't. I'm still not certain I've proved it." },
      { id = "nt_2", text = "I envy the Windshapers sometimes, for their certainty that someone is listening. When I speak to the empty air at night, I'm never sure anything hears." },
    },
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
    first = "He talks of the missing scholar as if he'd misplaced a friend.",
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
        { id = "bl_default", text = "Some in the hall are already saying it was the Windshapers, because a High Order magister died on the road not long ago and nobody's forgotten who was waiting for him. I don't know, and I won't name an enemy until I'm sure, but I'm in the minority." },
      },
      choices = {
        { text = "Don't blame the Windshapers without proof.", next = "BACK", reply = "Thank you, and I'll keep saying it in the hall, for whatever it's worth. Proof first.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The Windshapers have earned the suspicion.", next = "BACK", reply = "Perhaps they have, and I'll not pretend they're innocent. But suspicion isn't proof.", fx = { affinity = -1, align = { honor = -1 } } },
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
    first = "She is secretly delighted when someone asks a good question.",
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
      text = "Don't touch anything on the bench. I don't know what that cold you carry does to a tincture, and I don't want to find out in my own workroom." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Iaadaria Bitterwind. I teach alchemy to the High Order and sell vials to anyone with coin, and I'm happier doing the first than talking about it. What is it you need?" },
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
        { id = "al_default", text = "Far more than people suppose. The Highborne could coax power out of a leaf or a stone that the rest of us would walk past, and we lost most of that knowing in Skywall. I mean to win some of it back, one recipe at a time." },
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
        { text = "Recover the old formulas exactly. That's our inheritance.", next = "BACK", reply = "That's the High Order's view, and some weeks it's mine too. This week, perhaps.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Invent new ones. The Highborne didn't have our problems.", next = "BACK", reply = "That's the other side, and some weeks I'd agree. Leave me to my vials, please.", fx = { affinity = 1, align = { order = -1 }, trait = { curious = 1 } } },
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
          text = "Gone, thanks to you, and I've no wish to think about them again. I've already scrubbed the bench twice." },
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
        { text = "Drive them off. They're only doing what they must.", next = "BACK", reply = "That's the gentler answer, and I suppose I'll try it. They'd better not come back three times.", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Finish them. Mercy just means they come back.", next = "BACK", reply = "Practical, and I'll not argue. I've vials to finish.", fx = { affinity = 1, align = { light = -1 }, trait = { stern = 1 } } },
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
    first = "She gets visibly tired whenever anyone mentions her surname.",
    third = "{name} met Othesia Evengale, a tailor of Valanaar who works out of her home.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Gale's greetings! Come in and mind the dye pots; you're one of the few students who ever does." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Speak your business, and leave my surname out of it. My patience with you is thin today." },
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
    -- Deeds pass: Belathaan Brightwish, avenged for Elaadrin.
    dd_belathaan = {
      lines = { { id = "db_default", text = "A little. He bought his robes from me, plain blue-grey and never anything showy, because he said a man going to talk of peace shouldn't look as though he'd come to win. I made the last one he wore, and I've wondered since whether they buried him in it." } },
      choices = {
        { text = "A tailor's skill comes from honest hours at the loom.", next = "BACK", reply = "Hours and pricked fingers, yes, and you'll have plenty of both with me.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Copy a master's pattern and sell it as your own.", next = "BACK", reply = "People do, and the master always knows, believe me, because I've been that master.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "He was brave to go. Someone had to try for peace.", next = "BACK", reply = "That's what I tell myself when I pass his empty chair at the hall. It helps, a little.", fx = { align = { light = 1 } } },
        { text = "Talking to Lorthuna was folly, and he paid for it.", next = "BACK", reply = "Perhaps, but don't say it where the Supreme Magister can hear. He sent him, and he hasn't forgiven himself.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_avenged", tags = { "news" }, when = { questDone = TODO_QUEST("Avenged Tenfold") },
          text = "The Supreme Magister came by for a new collar yesterday and actually stood still for the fitting, which he hasn't done since Belathaan died. I gather you're the one who answered for him, so thank you." },
        { id = "h_default", key = true, text = "Othesia Evengale, tailor, and yes, this is my house, and yes, I teach here, because a workshop costs windstones I'd rather spend on thread. What can I do for you?" },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm only hemming." },
        { id = "h_again2", text = "Go on; my needle can listen." },
      },
      choices = {
        { text = "Did you know Belathaan Brightwish?", next = "dd_belathaan", when = { questDone = TODO_QUEST("Avenged Tenfold") } },
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
        { text = "Keep making it. A warm cloak matters on a cold island.", next = "BACK", reply = "Thank you, and I will, whatever the High Order says. Feel the cloth before you go.", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Comfort won't hold the island up. The order's right.", next = "BACK", reply = "It won't, no, but it'll keep a few spirits up, and that's not nothing. Off you go, then.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = {
        { id = "na_default", text = "You and half of Valanaar ask me that. If you want to know whose family is whose, go and ask him, and when he gives you a straight answer, come and tell me, because I'd like to hear one too." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    feathers = {
      lines = {
        { id = "fe_default", text = "They're hippogryph feathers, and people wear them because they're beautiful, and we need beautiful things just now. Half my customers want one braided in with whatever I've made them, and I've stopped pretending I mind; it's the nicest part of the job." },
        { id = "fe_out", when = { ["not"] = { race = "Skyborne" } },
          text = "They're hippogryph feathers, and people wear them because they're beautiful, and we need beautiful things just now. I could braid one in for you, if your people wouldn't laugh at you for it when you go home." },
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
    first = "She asks strangers more questions than they can answer.",
    third = "{name} met Gelia Shardsong, a curious woman of Valanaar who keeps an eye on everything that happens near the High Order's hall.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Oh, it's you again! Come here, because I've saved up a whole list of new questions for you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. I've no questions for you today, and I'd rather you didn't ask me any." },
    { id = "g_default", text = "Oh, hello! You're new, aren't you? I'd remember that face." },
    { id = "g_stranger", when = { ["not"] = { race = "Skyborne" } }, text = "Another one from below the clouds! Come here, I've questions." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! The dockmaster says your people hold the rail the whole way up, and I can't say I blame you." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You came by the western dock, then, with the Windshapers. I've wanted to meet a tauren since my cousin first told me about you." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "You're the first orc I've seen up close. You're greener than I expected, and you smile more than the stories said you would." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "You're so small! I mean that kindly; I only wonder how you keep from blowing away up here." },
  },

  start = "hello",
  nodes = {
    people = {
      lines = {
        { id = "pe_default", text = "Nearly everyone, and what I don't know I ask. Othesia the tailor waves when she passes, Iaadaria the alchemist never does, and poor Dondallion always looks as if he's lost a book and is afraid to say which one." },
      },
      choices = {
        { text = "And the Supreme Magister?", next = "people_magister" },
        { text = "Something else.", next = "BACK" },
      },
    },
    people_magister = {
      lines = {
        { id = "pm_default", text = "He walks past quickly, with his jaw set, and he hasn't smiled since the business at the Shrine. I say good morning anyway, and now and then he says it back, so I shall keep at it." },
      },
      choices = {
        { text = "A good morning costs nothing. Keep at it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    refugees = {
      lines = {
        { id = "re_default", text = "They come with whatever they could carry, and Donaal finds them floor when he's out of beds. Nyalah feeds them whether they can pay or not, and half the street has taken to leaving blankets at the inn door." },
      },
      choices = {
        { text = "Do you leave blankets too?", next = "refugees_help" },
        { text = "A town shows what it is at times like these.", next = "refugees_help" },
        { text = "Something else.", next = "BACK" },
      },
    },
    refugees_help = {
      lines = {
        { id = "rh_default", text = "Blankets, and I sit with the children so their parents can sleep, which is the one useful thing a nosy woman on a step can do. They ask me if the town is safe, and I tell them it's safer than where they were." },
      },
      choices = {
        { text = "That's more useful than you make it sound.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsky = {
      lines = {
        { id = "xk_default", text = "Between neighbours? We're frightened, and we're pretending it's only excitement. But I watch our people walk down to those docks every day and step onto the ships anyway, and I think that's rather fine of us." },
      },
      choices = {
        { text = "It is fine of us. I'll remember it below.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xg_default", text = "The young ones do, when they want to complain about the old ones. I'm told there are whole towers of your kind in Dalaran, so perhaps you can tell me whether mages below are as bad at sleeping as ours." },
      },
      choices = {
        { text = "Worse, if anything.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Gelia. I sit here most days because you see everyone from this step: magisters going in and out of the hall, the dockhands coming up from the skycutters, and now mainlanders, which is the best thing that's happened to this town in years." },
      },
      again = {
        { id = "h_again", text = "What else? I've the whole day free." },
        { id = "h_again2", text = "Go on, I love a good question." },
        { id = "h_again3", text = "Yes? Sit, if you like, the step's wide enough for two." },
      },
      choices = {
        { text = "What have you seen lately?", next = "seen" },
        { text = "What do people in Valanaar make of the mainlanders?", next = "mainlanders" },
        { text = "Will you go below the clouds yourself?", next = "below" },
        { text = "What's Valanaar like, for someone who lives here?", next = "town" },
        { text = "You must know everyone who climbs these steps.", next = "people" },
        { text = "You mentioned refugees from the fallen places.", next = "refugees" },
        { text = "Tell me what a neighbour says of all this, Gelia.", next = "xsky", when = { race = "Skyborne" } },
        { text = "Do the magisters ever stop to talk to you?", next = "xmage", when = { class = "MAGE" } },
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
        { text = "Go. You'd love the world below the clouds.", next = "BACK", reply = "Maybe I will, one day, and I'll blame you if I fall. Winds guide you.", fx = { affinity = 1, align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Stay. Valanaar needs people who stay.", next = "BACK", reply = "That's what I tell myself, and it's nice to hear somebody agree. I'll stay a while longer.", fx = { affinity = 1, align = { order = 1 } } },
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
    first = "The Dalaran skycutter is spoken of here like a clever child.",
    third = "{name} met the High Order Dockmaster on Valanaar's eastern skydock, where the skycutter leaves for Dalaran.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you back on my pier. The skycutter's running to time, and I'm glad you'll be aboard." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. The skycutter leaves when it leaves, and I'd thank you not to trouble my crew." },
    { id = "g_default", text = "Eastern dock, for Dalaran. The next skycutter isn't far off." },
    { id = "g_horde", when = { faction = "Horde" }, text = "This is the Dalaran pier, friend. Yours is the western dock." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "You'll want the rail on the starboard side, master dwarf. Your people favour it, and it's the sturdier of the two." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Before you ask: no, you may not see the workings, and yes, the pilot has been asked already today." },
    { id = "n_leaving", cat = "kin", when = { race = "Skyborne", faction = "Alliance", minLevel = 10 },
      text = "You'll be one of the ones going below for good, then. Keep your feet planted when the ship crosses over; it lurches." },
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "Back to Dalaran, is it? Your Kirin Tor built the portal half of this journey, so I'll say thank you on their behalf, since they never stay long enough to hear it." },
  },

  start = "hello",
  nodes = {
    crew = {
      lines = {
        { id = "cw_default", text = "It does. The pilot holds the route, the riggers hold the ship, and I hold the dock, and none of us does the others' work. I check the readings before she casts off, and she doesn't cast off until I've signed for them." },
      },
      choices = {
        { text = "Has a pilot ever argued with your readings?", next = "crew_argue" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crew_argue = {
      lines = {
        { id = "cg_default", text = "Once, a young one, in a hurry to make Dalaran before dark. I kept the lines fast until he had read the figures aloud to me twice. He thanked me the next morning, though not gracefully." },
      },
      choices = {
        { text = "A grudging thanks still counts.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    before = {
      lines = {
        { id = "bf_default", text = "Very quiet. For a long time after the skystreams closed there was nowhere for a skycutter to go, and I kept the planks oiled for ships that never sailed. Now she's out and back every day, and I find I'd missed the noise." },
      },
      choices = {
        { text = "You kept the dock ready all that time?", next = "before_ready" },
        { text = "Something else.", next = "BACK" },
      },
    },
    before_ready = {
      lines = {
        { id = "br_default", text = "A dock that isn't kept is only a ledge. Some in the town called it wasted work, and I let them, and when the order needed a ship in the air the dock was fit to send her. I'll own that I enjoyed that morning." },
      },
      choices = {
        { text = "Duty kept in the quiet years is still duty.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsky = {
      lines = {
        { id = "xs_default", text = "Then stand amidships and watch the horizon, not the drop, and you'll keep your breakfast. Everyone goes quiet when the ground first comes up through the cloud, and there's no shame in it. Come back and tell us what it's like." },
      },
      choices = {
        { text = "I'll come back with stories, Dockmaster.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xm_default", text = "I can tell you how I read them, which is as columns of figures that must agree with yesterday's. How the magisters come by the figures is their craft and not mine, and you'd do better to ask in the hall than on the planks." },
      },
      choices = {
        { text = "I'll ask in the hall, then.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "This is the High Order's dock. The skycutter that comes in here will take you straight to Dalaran, and from there the Kirin Tor can see you on to Stormwind if you've the need." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "This is the High Order's dock, and the ship here goes to Dalaran, which won't suit you. The Windshapers run their own skycutter from the western dock to Mulgore, so go and ask them for passage." },
      },
      again = {
        { id = "h_again", text = "Anything else before the ship comes in?" },
        { id = "h_again2", text = "Ask. I'll keep one eye on the sky." },
        { id = "h_again3", text = "Go on. She's not due for a while yet." },
      },
      choices = {
        { text = "How does a skycutter cross between worlds?", next = "crossing" },
        { text = "What's Dalaran like?", next = "dalaran" },
        { text = "What about the western dock?", next = "west" },
        { text = "Do many mainlanders come up on your ship?", next = "visitors" },
        { text = "It must take a steady crew to fly her.", next = "crew" },
        { text = "This dock was quiet before the mainlanders, I'd guess.", next = "before" },
        { text = "I'm bound below for the first time, Dockmaster.", next = "xsky", when = { race = "Skyborne" } },
        { text = "How do your magisters read the safe routes?", next = "xmage", when = { class = "MAGE" } },
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
