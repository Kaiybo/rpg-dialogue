-- Thendal Village, Zephras Isle: the first faces a young Skyborne meets. Ailee Farheart
-- (Coming of Age), Windshaper Boro (shaman trainer), Blademaster Ren, Tai'ree Farsight
-- and Destin Thriceforged. Voice and sources: bibles/zep_thendal_village.md.
local P = RPGDialogueAPI:Pack("rpgd.zephras")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Ailee Farheart: Ranger of Thendal Grove who sends the newly come-of-age
-- to Rorian for their relic. Brisk, warm, glad of every new face.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_ailee", id = TODO_NPC("Ailee Farheart"), name = "Ailee Farheart", title = "Rangers of Thendal Grove",
  bible = "bibles/zep_thendal_village.md", role = "questgiver", tier = "quest",
  communities = { "zephras_isle" }, temper = { "cheerful", "steady" }, values = { "loyal", "kind" },
  notices = { "kin", "class", "race", "origin" },

  impression = {
    first = "She talks of coming of age as the best day anyone has.",
    third = "{name} met Ailee Farheart, a ranger of Thendal Grove who welcomes the young on the day they come of age.",
  },

  greetings = {
    { id = "g_default", text = "Hello there, {class}! Gale's greetings, and welcome to Thendal Village." },
    { id = "g_again", when = { metBefore = true }, text = "Back again! You're getting to be a regular face in the village, {name}." },
    { id = "g_active", tags = { "news" }, when = { questActive = TODO_QUEST("Coming of Age") }, text = "Rorian's waiting at the greatfather tree, just west of here. Go on, don't keep him!" },
    { id = "g_stranger", when = { ["not"] = { race = "Skyborne" } }, text = "Oh! You're not from the isle at all, are you? Hello, and welcome to Thendal." },
  },

  notice = {
    { id = "n_young", cat = "kin", when = { race = "Skyborne", maxLevel = 3 },
      text = "Look at you, so bright-eyed I could read by you. You only come of age once, so try to remember how today feels." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter! Tai'ree, our hunter trainer, will want you before the day's out, and the Rangers will want you after that, so you'll be a busy one." },
    { id = "n_ranger", cat = "origin", when = { origin = "skyborne_thendal_ranger" },
      text = "I'd know a Ranger's walk anywhere: heel down, quiet, and always looking past whoever you're talking to." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Winds above, you're tall! I hope our doorways haven't given you too much trouble yet." },
  },

  start = "hello",
  nodes = {
    -- Deeds pass: the player killed Urs'anah, Aetheen's test.
    dd_matriarch = {
      lines = { { id = "dm_default", text = "Then the den will scatter, and the young ones will go hungry or go elsewhere, and either way the boy by the elder tree can sleep. I'm glad of it, and a little sorry, because she was old when my grandmother was a girl." } },
      choices = {
        { text = "She was a beast. Thendal comes first.", next = "BACK", reply = "It does, and that's what the Rangers are for. I only like to remember what it cost, so I don't start finding it easy.", fx = { align = { order = 1 } } },
        { text = "I'm sorry too. She was only hungry, like the rest of the isle.", next = "BACK", reply = "She was. The pylons fail and the land gives less, and the beasts feel it before we do. Thank you for saying so.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_matriarch", tags = { "news" }, when = { killed = { name = "Urs'anah" } },
          text = "The rangers are saying Urs'anah is dead, and that it was you who walked into her den. Aetheen won't say so aloud, but she's been smiling at the wind all morning, and she doesn't smile at anything." },
        { id = "h_default", key = true, text = "I'm Ailee Farheart, of the Rangers of Thendal Grove. We need all the help we can get around here, so every new face that walks into the village is a welcome one, yours included." },
        { id = "h_before", when = { race = "Skyborne", questBefore = TODO_QUEST("Coming of Age") },
          text = "Look at you, ready for adventure and trying very hard not to show your nerves! It's your coming of age, and Rorian the Dayseeker has your relic waiting at the greatfather tree just west of here." },
        { id = "h_done", tags = { "news" }, when = { questDone = TODO_QUEST("Coming of Age") },
          text = "You've got your relic, I see! Somebody carried that before you, and somebody will carry it after, so look after it well while it's yours." },
        { id = "h_outsider", when = { ["not"] = { race = "Skyborne" } },
          text = "You must have come up on a skycutter from below the clouds, which makes you the strangest thing I've seen all week, and I've seen a cirrusfly the size of my hand. Welcome to Thendal Village." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you? Ask away." },
        { id = "h_again2", text = "Go on, I've time. The grove can spare me for a little while." },
      },
      choices = {
        { text = "I killed the ursera matriarch in the southern caves.", next = "dd_matriarch", when = { killed = { name = "Urs'anah" } } },
        { text = "What does coming of age mean here?", next = "coming" },
        { text = "Who is Rorian the Dayseeker?", next = "rorian" },
        { text = "What do the Rangers of Thendal Grove do?", next = "rangers" },
        { text = "How do things stand on the isle?", next = "trouble" },
        { text = "I'm not one of your people. Can I still help?", next = "xoutsider", when = { ["not"] = { race = "Skyborne" } } },
        { text = "Which order should I trust, Ailee?", next = "xorders", when = { race = "Skyborne" } },
        { text = "I'm a hunter too. Any advice for the grove?", next = "xhunter", when = { class = "HUNTER" } },
        { text = "I walked these paths with the Rangers once.", next = "xranger", when = { origin = "skyborne_thendal_ranger" } },
        { text = "Winds be with you, Ailee.", next = "END" },
      },
    },
    coming = {
      lines = {
        { id = "co_default", text = "When one of our young is ready, the village leader gives them a relic that once belonged to someone who came before. When that person's ashes went to the winds, the relic came back to be passed on, and one day yours will be passed on too." },
        { id = "co_outsider", when = { ["not"] = { race = "Skyborne" } },
          text = "It's our oldest custom. A youth who comes of age is given a relic that belonged to one of our dead, and when they die in turn, their ashes go to the winds and the relic goes to someone new. Do your people do anything like it?" },
      },
      choices = {
        { text = "Whose relic will I be given?", next = "relic" },
        { text = "You make it sound like a happy day.", next = "nerves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    relic = {
      lines = {
        { id = "re_default", text = "Nobody knows until it's in your hand, and sometimes not even then, because a good many relics have passed through so many hands that the first owner's name is lost. Rorian says that doesn't matter, since they're all shen'dorei who carried it as far as they could." },
      },
      choices = {
        { text = "Then what does carrying it mean?", next = "heirloom" },
        { text = "Something else.", next = "BACK" },
      },
    },
    heirloom = {
      big = true,
      lines = {
        { id = "hl_default", text = "It means that wherever you go, the winds of home and everyone who held it before you go with you. Some people find that a comfort and some find it a weight, and I've never been able to decide which it is for me." },
      },
      choices = {
        { text = "I'll carry it with honor, for everyone who held it.", next = "BACK", reply = "Then it's in good hands, and the winds of home will know it. Go to Rorian now.", fx = { affinity = 2, align = { honor = 1 }, trait = { kind = 1 } } },
        { text = "It's a trinket. What I do with my own hands matters more.", next = "BACK", reply = "Your hands matter, aye, but they're not the only ones in this. The relic remembers even when you forget.", fx = { affinity = -1, align = { honor = -1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    nerves = {
      lines = {
        { id = "ne_default", text = "It is a happy day, mostly! Our people have had a hard time of it, so we hold on to the good days with both hands. So tell me, are you nervous, or are you hiding it very well?" },
      },
      choices = {
        { text = "Terrified, if I'm honest.", next = "nerves_yes", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Not a bit. I've been ready for years.", next = "nerves_no", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    nerves_yes = {
      lines = {
        { id = "ny_default", text = "Good, because the ones who aren't nervous worry me far more than the ones who are. Being a little afraid keeps you looking where you put your feet, and on this isle, where the edges crumble, that's a fine habit to have." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Then I'll go and see Rorian.", next = "END" },
      },
    },
    nerves_no = {
      lines = {
        { id = "nn_default", text = "Then you're braver than I was, because I couldn't keep my hands still through the whole thing and nearly dropped my relic at Rorian's feet. Do keep a little caution about you, though, since the grove isn't as gentle as it looks." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Then I'll go and see Rorian.", next = "END" },
      },
    },
    rorian = {
      lines = {
        { id = "ro_default", text = "Our village leader, and he keeps watch from the entrance to the greatfather tree, just west of here. He's solemn and a little stern, but there's nobody on the isle who cares more about the young ones of Thendal." },
      },
      choices = {
        { text = "Stern how?", next = "rorian2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rorian2 = {
      lines = {
        { id = "r2_default", text = "He doesn't like to see the gifts of our people wasted on games, and he'll tell you so, at length, if you're caught using them for fun. Myriaal, up on the watchtower, gets that speech about once a week, and I'm fairly sure she's started to enjoy it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    rangers = {
      lines = {
        { id = "ra_default", text = "We walk the paths around the village and keep the grove safe for everyone in it. That used to mean a lost child or a sprained ankle now and then, but lately it means far more than that." },
      },
      choices = {
        { text = "What's changed?", next = "pests" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pests = {
      lines = {
        { id = "pe_default", text = "The vuldren were always docile, and now some of them are turning on people, and the cirrusflies are swarming in the east of the grove like nothing I've ever seen. Elatrell, who's been fighting the cirrusflies, says it's the magic out of balance, and I've no better answer than his." },
      },
      choices = {
        { text = "So what do the Rangers do about it?", next = "wildstance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wildstance = {
      big = true,
      lines = {
        { id = "ws_default", text = "We cull what we must and leave the rest be, though there are arguments every night about where that line ought to fall. Some of us want the grove kept neat and safe, and some say the wild was here before the village and we ought to make room for it." },
      },
      choices = {
        { text = "Keep the grove safe. Cull whatever threatens the village.", next = "BACK", reply = "That's one side of it, and a fair one with children in the village. I'll pass it along.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The wild was here first. Give it room.", next = "BACK", reply = "That's the other side, and it gets louder every night. The wild is listening, I think.", fx = { affinity = 1, align = { order = -1 }, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble = {
      lines = {
        { id = "tr_default", text = "Not well, I'm afraid. The wind spirits left us years ago, the magic that holds the isle up is fading, and we've lost word from the other islands entirely, so the elders look more worried every time I see them." },
      },
      choices = {
        { text = "What will happen to Zephras?", next = "trouble2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble2 = {
      lines = {
        { id = "t2_default", text = "Nobody knows, which is the worst of it. The orders each have their own ideas, and young ones like you are going to be asked to help with all of them, so tell me, when the time comes, do you think you'll stay on the isle or go below the clouds?" },
      },
      choices = {
        { text = "I'll stay. Someone has to look after Zephras.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "I'll go below and bring back whatever can save us.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "I haven't decided yet.", next = "BACK" },
      },
    },
    xoutsider = {
      lines = {
        { id = "xo_default", text = "Of course you can! We need every pair of hands we can get, and the vuldren and the cirrusflies won't ask where you were born before they bite you. Speak to Elatrell or Rorian, and they'll find you something useful." },
        { id = "xo_tauren", when = { race = "Tauren" },
          text = "Of course you can, and the Windshapers say your people welcomed ours in Mulgore, so you've a head start on friendship here. Speak to Elatrell or Rorian, and mind the low branches." },
        { id = "xo_dwarf", when = { race = "Dwarf" },
          text = "Of course you can! I've never met a dwarf before, and I confess I thought you'd be taller from the stories, but you look as though you could hold a door against a whole herd of vuldren. Speak to Elatrell or Rorian." },
      },
      choices = {
        { text = "Then I'll find them.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorders = {
      big = true,
      lines = {
        { id = "xor_default", text = "That's not a question for a ranger, and it's not one I'll answer for you either, because both orders have good people in them and both have done things I'd rather forget. The grove is the one place they don't fight, so I suppose my answer is to trust the grove." },
        { id = "xor_ho", when = { faction = "Alliance" },
          text = "You're High Order, so you'll hear plenty about the Windshapers' faults from Falorne, your order's teacher here, and Ventaari of the Windshapers will tell you all about yours. Both orders have good people and both have done things I'd rather forget, so I'll only say this: the grove is the one place they don't fight." },
        { id = "xor_ws", when = { faction = "Horde" },
          text = "You're with the Windshapers, so Ventaari will tell you all about the High Order's faults, and Falorne of the High Order will tell you all about yours. Both orders have good people and both have done things I'd rather forget, so I'll only say this: the grove is the one place they don't fight." },
      },
      choices = {
        { text = "Then I'll keep the grove's peace, whatever my order says.", next = "BACK", reply = "Good, and the grove will be grateful. Keep that in mind when your order calls.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "My order first. The grove can look after itself.", next = "BACK", reply = "Then you'll learn the hard way, I suppose. The grove is the only thing they share.", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunter = {
      lines = {
        { id = "xh_default", text = "Keep your eyes on the vuldren, because a docile one can turn in a heartbeat these days, and don't let your pet chase the cirrusflies into a swarm. Tai'ree will teach you the rest, and she's a better teacher than I'll ever be." },
        { id = "xh_pet", when = { pet = { type = "Beast" } },
          text = "Keep {pet} close in the eastern grove, because the cirrusflies swarm there and a curious beast will run straight into the middle of them. Tai'ree will teach you the rest, and she's a better teacher than I'll ever be." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xranger = {
      lines = {
        { id = "xra_default", text = "I thought I knew your face! You'll find the paths you walked aren't the same as they were, since half the old markers have fallen and the vuldren have moved into the southern thickets. Will you walk with us again, before you go?" },
      },
      choices = {
        { text = "Whenever the Rangers need me.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "My path leads elsewhere now, Ailee.", next = "BACK", fx = { affinity = -1 } },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the grove's paths and most of the faces in the village, so ask and I'll help if I can." } },
    advice = { { id = "tp_ad", text = "Watch the edges of the paths, because they crumble, and never turn your back on a vuldren that's stopped eating." } },
    windstones = { { id = "tp_stones", text = "Dalia the Collector is the one to ask about windstones. She knows where to look, and she'll tell you how precious they've become." } },
    two_orders = { { id = "tp_orders", text = "The orders don't fight in the grove, and that's the most I'll say about them.", next = "xorders" } },
    al_aketh = { { id = "tp_aketh", text = "If you see grey robes and shaved heads near the village, tell Rorian or a Peacekeeper, and don't try anything clever on your own." } },
    _none = { { id = "tp_none", text = "Oh, that's beyond me, I'm afraid. Ask Rorian; he's forgotten more than I'll ever know." } },
  },
}

---------------------------------------------------------------------------
-- Windshaper Boro: shaman trainer near the village center. The spirits went
-- quiet; the four elements may open the way to the four winds again.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_boro", id = TODO_NPC("Windshaper Boro"), name = "Windshaper Boro", title = "Shaman Trainer",
  bible = "bibles/zep_thendal_village.md", role = "trainer", tier = "quest",
  communities = { "zephras_isle" }, temper = { "patient", "gentle" }, values = { "devout", "loyal" },
  notices = { "class", "race", "kin", "origin" },

  impression = {
    first = "He listens to the silence the way other men listen to music.",
    third = "{name} met Windshaper Boro, Thendal Village's shaman trainer, who hopes the four elements will lead his people back to the spirits of the four winds.",
  },

  greetings = {
    { id = "g_default", text = "Winds guide you. Sit a moment, if you can spare it." },
    { id = "g_shaman", when = { class = "SHAMAN" }, text = "Winds guide you, initiate. Shall we see how far you've come?" },
    { id = "g_ho", when = { race = "Skyborne", faction = "Alliance" }, text = "High Order, and still you come to a Windshaper. Winds guide you all the same." },
  },

  notice = {
    { id = "n_shaman_out", cat = "class", when = { class = "SHAMAN", ["not"] = { race = "Skyborne" } },
      text = "The elements answer you, don't they? I can feel it from here, and I confess it makes me envious and glad in the same breath." },
    { id = "n_totem", cat = "origin", when = { origin = "skyborne_gevrek_totem_keeper" },
      text = "You've the look of someone who tends totems for a living, careful with your hands and always glancing at the sky. Grand Skyseer Ayessa chose well." },
    { id = "n_alaketh", cat = "origin", when = { origin = "skyborne_former_alaketh" },
      text = "Your hair's still short at the roots, and I think I know why. You're among Windshapers now, and nobody here will hold the grey robes against you if you've really set them down." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "Whatever you carry, it frightens what little is left of the wind around you. Please keep it leashed while you're in the village." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Boro, of the Windshapers, and I teach the ways of the shaman here in Thendal. The wind spirits went quiet years ago, but earth and fire and water are still there for anyone with the patience to seek them, and I'll help you find them if you've been initiated." },
        { id = "h_crystal", tags = { "news" }, when = { questActive = TODO_QUEST("Embracing the Elements") },
          text = "You heard my crystal, then. The Windshapers have been watching you, initiate, and it's time you took your first steps on this path, because there's no more sacred duty than bringing the spirits home." },
        { id = "h_earth", tags = { "news" }, when = { questActive = TODO_QUEST("Call of Earth") },
          text = "Go and answer the call of earth, initiate. The stone is slow to speak, so don't hurry it, and don't you dare give up on it either." },
        { id = "h_earthdone", tags = { "news" }, when = { questDone = TODO_QUEST("Call of Earth") },
          text = "Earth has spoken to you, and that's one voice back out of the silence. It isn't the wind, I know, but it's a beginning, and I'll take any beginning we can get." },
        { id = "h_orc", when = { race = "Orc" },
          text = "An orc, and a shaman's people, I'm told. The Earthen Ring speaks to the elements and they speak back, so if you ever learned how they do it, I'd sit at your feet like a child to hear it." },
      },
      again = {
        { id = "h_again", text = "What else is on your mind? Ask; the silence will keep." },
        { id = "h_again2", text = "Go on. I've grown used to waiting for answers." },
      },
      choices = {
        { text = "Why learn the other elements, if the wind is gone?", next = "fourwinds" },
        { text = "What was it like when the spirits spoke?", next = "before" },
        { text = "What happens on the call of earth?", next = "callearth" },
        { text = "What do you make of the High Order?", next = "orders" },
        { text = "Train me, Windshaper.", next = "BUSINESS", when = { class = "SHAMAN" } },
        { text = "My people still hear the elements answer.", next = "xmainland", when = { class = "SHAMAN", ["not"] = { race = "Skyborne" } } },
        { text = "I wore the grey robes once.", next = "xalaketh", when = { origin = "skyborne_former_alaketh" } },
        { text = "Why would a Windshaper help the High Order?", next = "xho", when = { race = "Skyborne", faction = "Alliance" } },
        { text = "Winds guide you, Boro.", next = "END" },
      },
    },
    fourwinds = {
      lines = {
        { id = "fw_default", text = "Because the wind doesn't stand alone and never did. Those of us who would seek an audience with the spirits of the four winds again study earth and fire and water too, and the natural world besides, hoping that understanding the whole will open the door the wind closed behind it." },
      },
      choices = {
        { text = "And if the door stays shut?", next = "fourwinds2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fourwinds2 = {
      big = true,
      lines = {
        { id = "f2_default", text = "Then we go to the door ourselves. The burden falls to us to brave the elemental plane and bring the spirits home, and our survival depends on it, whatever the High Order says about standing on our own feet." },
      },
      choices = {
        { text = "We owe them that. I'll go to the door with you.", next = "BACK", reply = "Then you'll go with me, and the spirits will know you when we find them. Thank you.", fx = { affinity = 2, align = { honor = 1 }, trait = { pious = 1 } } },
        { text = "We should learn to live without them, not chase them.", next = "BACK", reply = "Some days I wonder if that's wisdom, and then I remember what we owe them. I'll keep going.", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    before = {
      lines = {
        { id = "be_default", text = "Like walking with a friend at your shoulder who always knew which way the weather was turning. You'd feel a breath of air on your cheek and know you'd been heard, and I didn't know how much I leaned on that until it was gone." },
      },
      choices = {
        { text = "Do you still listen for it?", next = "silence" },
        { text = "Something else.", next = "BACK" },
      },
    },
    silence = {
      lines = {
        { id = "si_default", text = "Every morning, before anyone else is awake. Tell me, initiate, can you hear the whispers of the winds yourself, or is it as quiet for you as it is for me?" },
        { id = "si_shaman", when = { class = "SHAMAN", ["not"] = { race = "Skyborne" } },
          text = "Every morning, before anyone else is awake. Tell me, since you come from below the clouds, are the winds on Azeroth chatty, or do they keep their own counsel too?" },
      },
      choices = {
        { text = "Sometimes I think I hear something.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } },
        { text = "Nothing at all. I don't think anyone's there.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    callearth = {
      lines = {
        { id = "ce_default", text = "An initiate goes to a sacred place and asks the earth to know them. Our trials ask you to drink an enchanted sapta there first, so that your spirit is quiet enough for the stone to notice it." },
        { id = "ce_notshaman", when = { ["not"] = { class = "SHAMAN" } },
          text = "It's a trial for our initiates, so you needn't worry about it yourself. They go to a sacred place, drink an enchanted sapta to quiet their spirits, and ask the earth to know them." },
      },
      choices = {
        { text = "What does the earth say back?", next = "sapta" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sapta = {
      lines = {
        { id = "sa_default", text = "Earth is slow, and it doesn't say much, but it remembers. The last initiate I sent out came back saying a small manifestation of earth had called her a child of the four winds, and I've been turning those words over ever since." },
      },
      choices = {
        { text = "Why do those words matter to you?", next = "sapta2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sapta2 = {
      lines = {
        { id = "s2_default", text = "Because the earth remembers what we were, even if the wind's gone quiet. If the stone still knows us as children of the four winds, then perhaps the winds haven't forgotten us either, and only can't, or won't, say so yet." },
      },
      choices = {
        { text = "That's a hopeful way to read it.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    orders = {
      big = true,
      lines = {
        { id = "or_default", text = "They mean well, most of them, and they're clever, which is the trouble. They think the spirits can be replaced by spells, but I've lived beside both, and a spell has never once asked how I was." },
        { id = "or_ho", when = { race = "Skyborne", faction = "Alliance" },
          text = "Your order means well, most of you, and you're clever, which is the trouble. You think the spirits can be replaced by spells, but I've lived beside both, and a spell has never once asked how I was." },
      },
      choices = {
        { text = "You're right. Spells are tools, and the spirits were kin.", next = "BACK", reply = "Thank you, child. It's good to hear it from someone so young.", fx = { affinity = 2, align = { order = -1 }, learn = { "two_orders" } } },
        { text = "Spells answer when called. Your spirits stopped answering.", next = "BACK", reply = "They stopped, aye, but they never once lied to us. Give them time.", fx = { affinity = -2, align = { order = 1 }, learn = { "two_orders" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "two_orders" } } },
      },
    },
    xmainland = {
      lines = {
        { id = "xm_default", text = "Then you're luckier than any of us, and I hope you never learn what the silence is like. Is it true that your elements simply answer when you call, without any bargaining or pleading?" },
        { id = "xm_tauren", when = { race = "Tauren" },
          text = "Then you're luckier than any of us, and I hope your Earth Mother keeps it that way. Grand Skyseer Ayessa says the tauren of Mulgore welcomed our people as if we'd always been neighbors, so tell me, do your elements answer when you call, or must you plead?" },
      },
      choices = {
        { text = "They answer, but only when I respect them.", next = "xmainland2", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "They answer because I make them.", next = "xmainland2", fx = { affinity = -2, trait = { stern = 1 } } },
      },
    },
    xmainland2 = {
      lines = {
        { id = "x2_default", text = "Thank you for telling me. The Earthen Ring will have more to teach my people than I ever could, and I hope some of it reaches back here before I'm too old to learn it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xalaketh = {
      big = true,
      lines = {
        { id = "xa_default", text = "Many did, when the spirits left and fear walked the isle looking for somewhere to live. I won't ask what you did in them, but I will ask whether you came to us because you believe, or only because the cult lost." },
      },
      choices = {
        { text = "Because I believe. Al'Akir was never going to save us.", next = "BACK", reply = "Good, and the spirits will know it when they come home. Welcome back to the grove.", fx = { affinity = 3, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "Because the cult lost. I go where I'll live longest.", next = "BACK", reply = "Honest, at least, and that's a start. Prove it to me over time.", fx = { affinity = -2, align = { light = -1 }, trait = { cautious = 1 } } },
      },
    },
    xho = {
      lines = {
        { id = "xh_default", text = "Because you're a child of Zephras before you're anything else, and I'll not turn a child of Zephras away for the colour of their robes. Mind what you say near the standing stones, though, because not every Windshaper is as forgiving as I am." },
      },
      choices = {
        { text = "Thank you, Boro.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the elements, and the silence where the wind used to be. Ask, and I'll tell you what I can." } },
    advice = { { id = "tp_ad", text = "Be patient with the elements, because they owe you nothing, and be grateful when they answer anyway." } },
    two_orders = { { id = "tp_orders", text = "They'd build a new house; we'd call the old family home. I know which one I'd rather live in.", next = "orders" } },
    al_aketh = { { id = "tp_aketh", text = "They looked at the silence and decided the loudest voice in Skywall must be the right one. Al'Akir doesn't care for us, and never did." } },
    shal_nan = { { id = "tp_shal", text = "He tended the bond with the spirits long after he gave up his crown, and then he was gone too. I don't think that's a coincidence, though I couldn't tell you what it means." } },
    _none = { { id = "tp_none", text = "The elements haven't told me anything about that, and I don't like to guess." } },
  },
}

---------------------------------------------------------------------------
-- Blademaster Ren: warrior trainer in the village watchtower. Teaches the
-- young not to flinch; the isle needs people who can lead and protect.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_ren", id = TODO_NPC("Blademaster Ren"), name = "Blademaster Ren", title = "Warrior Trainer",
  bible = "bibles/zep_thendal_village.md", role = "trainer", tier = "service",
  communities = { "zephras_isle" }, temper = { "stern", "steady" }, values = { "duty", "strength" },
  notices = { "class", "origin", "kit" },

  impression = {
    first = "She looks at you as if measuring where you'd break.",
    third = "{name} met Blademaster Ren, the warrior trainer in the Thendal Village watchtower, who teaches the young never to flinch.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There you are, and standing straight for once. Come in; you've earned your lesson today." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. Train if you must, but keep your mouth shut while you do it." },
    { id = "g_default", text = "Stand up straight when you come into my watchtower." },
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "Here for training? Good; you're late." },
  },

  notice = {
    { id = "n_blade", cat = "origin", when = { origin = "skyborne_empyrean_recruit" },
      text = "You hold your weapon the way the Empyrean Blades drill their recruits, point low and elbow in. Whoever started you knew their business." },
    { id = "n_repair", cat = "kit", when = { durability = { max = 0.30 } },
      text = "Your gear's half falling off you. Go and see Destin, the weapon merchant, before you come to me, because I won't teach someone whose straps are about to give way." },
  },

  start = "hello",
  nodes = {
    w8_hab = {
      lines = { { id = "w8_hab_a", text = "Watching their own blade instead of their enemy's shoulders, because they think a sword is the interesting part. The shoulders tell you everything, and the sword only tells you what you should have seen a heartbeat earlier." } },
      choices = {
        { text = "How do you break them of it?", next = "w8_hab2" },
        { text = "That sounds like an old soldier's lesson.", next = "w8_hab2" },
        { text = "I'm a warrior. I watch the hips, not the shoulders.", next = "w8_hab2", when = { class = "WARRIOR" } },
        { text = "Something else, Blademaster.", next = "BACK" },
      },
    },
    w8_hab2 = {
      lines = {
        { id = "w8_hab2_a", text = "With a wooden blade on the knuckles every time their eyes drop, and by the end of the first week their eyes stop dropping. It's not kind, but it's kinder than what a cultist will do to them on the road." },
        { id = "w8_hab2_war", when = { class = "WARRIOR" }, text = "Hips, then, if you'd rather, and against a Skyborne who fights on a ledge you might even be right. Come to the drill yard tomorrow and prove it, and if you're right I'll teach it that way myself." },
      },
      choices = {
        { text = "I'll keep my eyes up.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    ren_ak1 = {
      lines = {
        { id = "ren_ak1_1", text = "It is, and Akeri keeps it that way, because the quieter arts need shadow to practise in. We disagree about almost everything, but we agree that a young fighter should learn to see what the other is teaching." },
      },
      choices = {
        { text = "What do you disagree about?", next = "ren_ak2" },
        { text = "Something else, Blademaster.", next = "BACK" },
      },
    },
    ren_ak2 = {
      lines = {
        { id = "ren_ak2_1", text = "Whether a fight should be won quickly or won well. Akeri says the best fight is one the enemy never knew was happening, and I say a fight nobody sees teaches nobody anything." },
      },
      choices = {
        { text = "Both have their uses.", next = "ren_ak3" },
        { text = "I'm a rogue. Akeri's way suits me.", next = "ren_ak3", when = { class = "ROGUE" } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    ren_ak3 = {
      lines = {
        { id = "ren_ak3_1", text = "They do, and that's the annoying part of it. When I'm old I'll admit Akeri was right half the time, and Akeri will admit nothing at all, which is the only way a rogue ever wins an argument." },
      },
      choices = {
        { text = "Something else, then.", next = "BACK" },
      },
    },
    ren_emp1 = {
      lines = {
        { id = "ren_emp1_1", text = "They guarded the Shal'nan for centuries and never had to draw their blades in earnest, which made them proud and slow. Now the isle needs fighters again, and the Blades are learning what it means to bleed." },
      },
      choices = {
        { text = "Do you count yourself among them?", next = "ren_emp2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ren_emp2 = {
      lines = {
        { id = "ren_emp2_1", text = "I never wore their colours, though I've crossed blades with a few of them in the drill yard. They think a trainer in a village watchtower is playing at war, and I think they forgot what the guarding was for, so we're both stubborn about it." },
      },
      choices = {
        { text = "Then teach well. That's your post.", next = "BACK" },
        { text = "Back to other matters, Ren.", next = "BACK" },
      },
    },
    -- Deeds pass: the player keeps dying.
    dd_deaths = {
      lines = { { id = "dd_default", text = "Pride, most likely. The young ones who fall here fall because they won't step back from a fight they've already lost. Learn when to give ground, and you'll live long enough to learn the rest of what I teach." } },
      choices = {
        { text = "A blade is mastered by sweat, not by shortcuts.", next = "BACK", reply = "Good. Then you'll not complain when I make you sweat.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Strike from behind if it wins; nobody remembers how.", next = "BACK", reply = "The dead remember, and so do the ones who saw you do it.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "I'd rather fall than run from a fight.", next = "BACK", reply = "Then you'll fall, and often, and I'll admire it each time. Just know that the isle needs living warriors more than brave ones.", fx = { align = { honor = 1 } } },
        { text = "Then I'll give ground, and come back when it suits me.", next = "BACK", reply = "Good. A fight you walk away from is a fight you can win tomorrow, with friends at your back.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_deaths", when = { deaths = { min = 5 } },
          text = "You've been to the spirit healer, by the look of you, and more than once. There's no shame in that, only in coming back without learning why." },
        { id = "h_default", key = true, text = "I'm Ren, and I teach the blade here. Our world is changing, and it will need people with the will to lead and protect the others if our people are going to survive it, so I don't waste my time on anyone who isn't serious." },
        { id = "h_path", tags = { "news" }, when = { questDone = TODO_QUEST("The Warrior's Path") },
          text = "You found me, then, and you read my note. Come back to me as you grow, because you'll need guidance more than you think, and better you get it from me than from your mistakes." },
        { id = "h_outsider", when = { class = "WARRIOR", ["not"] = { race = "Skyborne" } },
          text = "A warrior from below the clouds. I'd like to see how your people fight, because ours have had ten thousand years to grow comfortable, and comfortable warriors are dead ones." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick, and stand straight while you ask it." },
        { id = "h_again2", text = "Ask, then. I've drills to run." },
      },
      choices = {
        { text = "I've died more than once already. What am I doing wrong?", next = "dd_deaths", when = { deaths = { min = 5 } } },
        { text = "What do you teach first?", next = "flinch" },
        { text = "Why does the isle need warriors now?", next = "protect" },
        { text = "Who else trains in this watchtower?", next = "tower" },
        { text = "Train me, Blademaster.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "I trained to join the Empyrean Blades.", next = "xblade", when = { origin = "skyborne_empyrean_recruit" } },
        { text = "Akeri's corner is very dark.", next = "ren_ak1" },
        { text = "What became of the Empyrean Blades?", next = "ren_emp1" },
        { text = "What's the worst habit your students bring in?", next = "w8_hab" },
        { text = "Farewell, Blademaster.", next = "END" },
      },
    },
    flinch = {
      lines = {
        { id = "fl_default", text = "Not to flinch. Anyone can swing a sword, but a fighter who blinks when steel comes at their face doesn't get a second chance to learn better, so I'll teach you to watch the blade all the way in and keep your feet." },
      },
      choices = {
        { text = "Isn't fear useful, sometimes?", next = "flinch2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    flinch2 = {
      big = true,
      lines = {
        { id = "f2_default", text = "Fear's useful before the fight, when it tells you to sharpen your blade and check your straps. Once the fight's begun, it's only a hand on your arm, pulling you the wrong way at the worst moment, so which of those are you going to listen to?" },
      },
      choices = {
        { text = "I'll keep my fear and use it. It keeps me alive.", next = "BACK", reply = "Then you'll do, and you'll live to see a few battles yet. Use it well.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "I'll train it out of me. Discipline first.", next = "BACK", reply = "Discipline's good, but don't train out what makes you duck. I've buried two recruits who stopped ducking.", fx = { affinity = 2, align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    protect = {
      lines = {
        { id = "pr_default", text = "Because the beasts have turned strange, refugees have turned bandit, and there are grey robes on the roads who'd happily see us all on our knees before the Windlord. The Peacekeepers can't be everywhere, so somebody has to stand between the village and all of that." },
      },
      choices = {
        { text = "Then I'll stand there.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tower = {
      lines = {
        { id = "to_default", text = "Akeri, who teaches the quieter arts in the corner where the light's worst, which I'm told is on purpose. We don't agree about much, but we agree that a fight you walk away from is better than one you win slowly." },
        { id = "to_rogue", when = { class = "ROGUE" },
          text = "Akeri, whom you'll have met, since you've the same way of standing where the light's worst. We don't agree about much, but we agree that a fight you walk away from is better than one you win slowly." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xblade = {
      lines = {
        { id = "xb_default", text = "Then you know what discipline costs, and you know the Blades guarded the Shal'nan for longer than most of us have been alive. They guard all of us now, which means they need more recruits than they've ever had, so don't let anyone tell you that dream's finished." },
      },
      choices = {
        { text = "I'll be worthy of them.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Keep your feet under you, your blade sharp and your eyes open, and don't flinch." } },
    al_aketh = { { id = "tp_aketh", text = "They fight like people who think the sky's on their side. It isn't, so cut them down like anyone else." } },
    _none = { { id = "tp_none", text = "That's not a matter for the blade. Ask someone with more time for talking." } },
  },
}

---------------------------------------------------------------------------
-- Tai'ree Farsight: hunter trainer near the village center. The wilds have
-- never been wilder; hunters and rangers have never been more needed.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_tairee", id = TODO_NPC("Tai'ree Farsight"), name = "Tai'ree Farsight", title = "Hunter Trainer",
  bible = "bibles/zep_thendal_village.md", role = "trainer", tier = "service",
  communities = { "zephras_isle" }, temper = { "sharp", "steady" }, values = { "duty", "craft" },
  notices = { "class", "pet", "race", "origin" },

  impression = {
    first = "She says the wilds have never been wilder.",
    third = "{name} met Tai'ree Farsight, Thendal Village's hunter trainer, who believes the isle's hunters have never been more needed.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There you are. The wilds have been busy, and I'm glad to see you came back out of them." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Train, then go. I've no wish to talk with you longer than the lesson takes." },
    { id = "g_default", text = "<Tai'ree gives you a short nod and a long, measuring look.>" },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "There you are. Ready to work?" },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "{pet} has a good stance, weight on the back legs and ready to spring. Feed it well tonight; it's earned it." },
    { id = "n_human", cat = "race", when = { race = "Human", class = "HUNTER" },
      text = "A human with a bow and a beast at heel. I was told your people mostly left that to the elves and the dwarves, so somebody's been teaching you new tricks." },
    { id = "n_cliff", cat = "origin", when = { origin = "skyborne_siroccas_cliff_hunter" },
      text = "You aim high and to the left, as if you're waiting for a cliff wind to carry the arrow. Siroccas, is it? You'll have to unlearn that down below." },
  },

  start = "hello",
  nodes = {
    w8_trk = {
      lines = { { id = "w8_trk_a", text = "The vuldren, because they don't leave tracks; they glide, and the wind takes their scent away the moment they lift. You track a vuldren by watching what the smaller birds do, and that takes patience most young hunters haven't got." } },
      choices = {
        { text = "What do the smaller birds do?", next = "w8_trk2" },
        { text = "Patience is the hunter's real weapon.", next = "w8_trk2" },
        { text = "Something else, Tai'ree.", next = "BACK" },
      },
    },
    w8_trk2 = {
      lines = { { id = "w8_trk2_a", text = "They go quiet, all at once, a few breaths before a vuldren passes over. Learn that silence, and you'll learn the isle, and you'll be a better hunter below the clouds than most who've hunted there all their lives." } },
      choices = {
        { text = "I'll listen for the silence.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- Deeds pass: the player has been culling the ursera.
    dd_ursera = {
      lines = { { id = "du_default", text = "Hunger and desperation, the same as drives any of us. The isle's magic thins and the land gives less, and a beast doesn't understand pylons, only that the berries are gone. So we hunt them, and if we're any good, we take no pleasure in it." } },
      choices = {
        { text = "A hunter should earn every kill by patience and skill.", next = "BACK", reply = "Then you understand the wilds better than most who come to my door.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Poison the waterhole and the beasts come to you.", next = "BACK", reply = "They do, and so does everything else that drinks there. That's no hunt; that's a blight.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Then cull them cleanly and keep the village safe.", next = "BACK", reply = "That's the hunter's answer, and it's mine too, most days. Clean kills, and nothing wasted.", fx = { align = { order = 1 } } },
        { text = "Then we should leave them be and let the wild sort itself out.", next = "BACK", reply = "The wild will sort itself out, aye, and some of what it sorts will be children. Still, I'd rather you felt that way than not.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_ursera", when = { killed = { name = "Ursera", min = 20 } },
          text = "You've been thinning the ursera to the south, and thinning them cleanly; the dens are quieter than they've been all season. Hunt them for need and not for sport, though, because they were here long before Thendal was." },
        { id = "h_default", key = true, text = "I'm Tai'ree, and I train the hunters of Thendal. There's more work for us now than there's been in my lifetime, because the winds are getting rougher, the isle's magic is thinning out, and the beasts have gone stranger than anyone here can remember." },
        { id = "h_way", tags = { "news" }, when = { questDone = TODO_QUEST("The Way of the Hunter") },
          text = "You read my note and you came, which is the first test passed. You remind me of how I looked to my own teacher once, all elbows and nerve, but whether you've got what this work needs is something only you can show me." },
      },
      again = {
        { id = "h_again", text = "Anything else? Say it before the light goes; I like to see a student's face when I answer." },
        { id = "h_again2", text = "Ask. I'm listening." },
      },
      choices = {
        { text = "The ursera seem half starved. Is that why they attack?", next = "dd_ursera", when = { killed = { name = "Ursera", min = 20 } } },
        { text = "Wilder how?", next = "wilds" },
        { text = "Who was your mentor?", next = "mentor" },
        { text = "Train me, Tai'ree.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How should I look after my companion?", next = "xpet", when = { class = "HUNTER" } },
        { text = "Nobody at home expected a human hunter.", next = "xhuman", when = { race = "Human", class = "HUNTER" } },
        { text = "What should a hunter learn before leaving the isle?", next = "hp", when = { class = "HUNTER" } },
        { text = "I'm a dwarf, and dwarves hunt with rifles.", next = "hp_dwarf", when = { race = "Dwarf", class = "HUNTER" } },
        { text = "My people are elves of the forest, like yours once were.", next = "hp_elf", when = { race = "NightElf" } },
        { text = "What's the hardest beast to track on Zephras?", next = "w8_trk" },
        { text = "Farewell, Tai'ree.", next = "END" },
      },
    },
    hp = {
      hub = true,
      lines = {
        { id = "hp_default", text = "Everything I can teach you before you leave the isle, and then everything the world below can teach you after. The Monkey, the Serpent Sting, how to track the vuldren in the grass, and a beast of your own when you're ready, and after that you'll keep learning until someone better tells you to stop." },
      },
      again = { { id = "hp_again", text = "Anything else?" } },
      choices = {
        { text = "Why the Serpent Sting first?", next = "hp_sting" },
        { text = "What makes a good hunter, in your eyes?", next = "hp_good" },
        { text = "Something else, Tai'ree.", next = "hello" },
      },
    },
    hp_sting = {
      lines = { { id = "hps_default", text = "Because it keeps working while you don't, and on Zephras you'll always be doing three things at once. Put it on the vuldren, then shoot, then step back, and by the time it reaches you, it's half dead from the sting alone." } },
      choices = {
        { text = "Let the poison do the work. Smart.", next = "BACK", reply = "Smart is the only kind of hunter that grows old here.", fx = { align = { honor = -1 } } },
        { text = "Poison feels like a coward's weapon.", next = "BACK", reply = "The vuldren don't care how you feel, and neither will the ones waiting below.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_good = {
      lines = { { id = "hpg_default", text = "Nerve, and not wasting it. My teacher said a good hunter has as much courage as anyone else and spends it more carefully, and I didn't understand her until I'd been bitten enough times to agree." } },
      choices = {
        { text = "I'll spend my courage carefully.", next = "BACK", reply = "Good. Start now, and stop looking at the ursera dens like you mean to go in.", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_dwarf = {
      lines = { { id = "hpd_default", text = "So I've heard, and so I heard, from the docks, the first time one of you fired one. I can't teach you the rifle, but I can teach you where to stand and when to shoot, and that holds for a bow or a thunderbolt." } },
      choices = {
        { text = "That's all I need from you.", next = "BACK", reply = "Then stand still and listen, if a dwarf can do either.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hp_elf = {
      lines = { { id = "hpe_default", text = "So the elders tell us, and I'd like to know what that means some day. For now, I'll tell you the beasts of this isle don't know your people any better than they know mine, and you'll find the wind here hunts with you or against you, never neither." } },
      choices = {
        { text = "Then I'll learn the wind.", next = "BACK", reply = "Good. It'll teach you faster than I can.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wilds = {
      lines = {
        { id = "wi_default", text = "The vuldren were docile when I was young, and now some of them bite. The ursera are hungry enough to come right up to the elder tree, and the cirrusflies swarm in the east of the grove, so every season brings us something new that wants to eat us." },
      },
      choices = {
        { text = "So what's a hunter for, here?", next = "wilds2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wilds2 = {
      big = true,
      lines = {
        { id = "w2_default", text = "To keep our people safe, first and last. Some hunters out there think it's their job to put the wild back the way it was, but I don't think anyone can, so I spend my arrows on what's in front of me." },
      },
      choices = {
        { text = "Protect the people first. The wild can fend for itself.", next = "BACK", reply = "Good, that's my thinking. The ursera came within a stone's throw of the well last week, and I'll not wait for closer.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "We should try to heal the wild, not just shoot it.", next = "BACK", reply = "Maybe we should, and I'll not stop you trying. But keep your bow ready while you do.", fx = { affinity = -1, align = { order = -1 }, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mentor = {
      lines = {
        { id = "me_default", text = "Someone who walked these paths long before the spirits left, and whose ashes went to the winds a while ago now. I won't say the name; that's mine to keep. What matters is that I stood where you're standing, and I was every bit as green as you." },
      },
      choices = {
        { text = "I'll try to do you credit.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpet = {
      lines = {
        { id = "xp_default", text = "Feed it before you feed yourself, keep it out of swarms, and never let it chase a vuldren into the long grass, because there's always another one waiting there. A beast that trusts you will die for you, so be worth it." },
        { id = "xp_named", when = { pet = { type = "Beast" } },
          text = "Feed {pet} before you feed yourself, keep it out of swarms, and never let it chase a vuldren into the long grass. A beast that trusts you will die for you, so be worth it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman = {
      lines = {
        { id = "xhu_default", text = "Nobody here expected a human at all, so you're ahead of the game. The bow doesn't care who draws it, and neither do the vuldren, so draw it well and they'll have no complaints." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Keen senses and quick reflexes keep you alive out there. Everything else is just equipment." } },
    _none = { { id = "tp_none", text = "Not my business. Ask Rorian, or Halaan if you've an afternoon to spare." } },
  },
}

---------------------------------------------------------------------------
-- Destin Thriceforged: weapon merchant in Thendal Village. Sells plain steel
-- in the old Luminarian style; repairs; takes windstones or coin.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_destin", id = TODO_NPC("Destin Thriceforged"), name = "Destin Thriceforged", title = "Weapon Merchant",
  bible = "bibles/zep_thendal_village.md", role = "vendor", tier = "service",
  communities = { "zephras_isle" }, temper = { "warm", "proud" }, values = { "craft", "honest" },
  notices = { "kit", "class", "race" },

  impression = {
    first = "He takes windstones or coin, and he'd rather have the windstones.",
    third = "{name} met Destin Thriceforged, Thendal Village's weapon merchant, who sells plain steel made in the old style.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Winds above, it's you! Come and see what I've finished since; I think you'll like the balance on it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Look, don't touch, and pay before you go, windstones or coin." },
    { id = "g_default", text = "Blades, mending, an honest opinion. Which will it be?" },
    { id = "g_broken", when = { durability = { max = 0.30 } }, text = "Winds above, what have you been hitting? Let me see that." },
  },

  notice = {
    { id = "n_repair", cat = "kit", when = { durability = { max = 0.30 } },
      text = "That edge has more nicks than a cirrusfly has legs. I can mend it, and you should let me before it fails you." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! I've heard your people are the finest smiths below the clouds. Would you look at one of my blades and tell me straight what you think?" },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You've been eyeing the dirks. They're good dirks, so I don't blame you, but I count them every evening." },
  },

  start = "hello",
  nodes = {
    w8_buy = {
      lines = { { id = "w8_buy_a", text = "The rangers, the Peacekeepers, and young ones leaving for the mainland who want a piece of home at their hip. I've started carving a small feather into the pommel of every blade that goes below the clouds, so they don't forget where it came from." } },
      choices = {
        { text = "That's a fine tradition.", next = "w8_buy2" },
        { text = "Do the refugees buy from you?", next = "w8_buy2" },
        { text = "I smith. Your balance is unlike anything below.", next = "w8_buy2", when = { profession = "Blacksmithing" } },
        { text = "Something else, Destin.", next = "BACK" },
      },
    },
    w8_buy2 = {
      lines = {
        { id = "w8_buy2_a", text = "The refugees mostly bring me blades to sell, the last thing of value they carried off the fallen places, and I give them more than they're worth, because what else would I do. Fevrath calls me soft, and then he does the same with shields." },
        { id = "w8_buy2_bs", when = { profession = "Blacksmithing" }, text = "So I've been told, and I'd love to see what a smith from below would make of it. Hold one at the third finger, not the first, and you'll feel why Luminarian set the weight so far forward." },
      },
      choices = {
        { text = "Keep carving those feathers.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    des_forge1 = {
      lines = {
        { id = "des_forge1_1", text = "I do, at the back of the house, in plain steel with no enchantment in it at all. Luminarian's patterns are the shape of the old blades, and I keep the shape faithfully, even though I can't put the magic in." },
      },
      choices = {
        { text = "Does the shape matter without the magic?", next = "des_forge2" },
        { text = "Something else, Destin.", next = "BACK" },
      },
    },
    des_forge2 = {
      lines = {
        { id = "des_forge2_1", text = "It does, because the old blades were balanced to move the way a Skyborne fights, light and quick and turning on the wind. A heavy mainland sword in our hands feels like swinging a fence post, or so the Blademaster tells me." },
      },
      choices = {
        { text = "Ren buys your blades, then?", next = "des_forge3" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    des_forge3 = {
      lines = {
        { id = "des_forge3_1", text = "He tests every one I make, and he sends half of them back with a note about the balance. I grumble, and then I fix them, and the ones he keeps are the best things I've ever made." },
      },
      choices = {
        { text = "A hard critic is a good one. Something else.", next = "BACK" },
      },
    },
    des_fev1 = {
      lines = {
        { id = "des_fev1_1", text = "He does, and he's loud about it, with the hammer going from dawn till dusk. We send customers to each other, because a sword without a shield is half a fighter, and he makes the other half." },
      },
      choices = {
        { text = "Do you ever work together?", next = "des_fev2" },
        { text = "I'd rather have two swords than a shield.", next = "des_fev2", when = { class = { "ROGUE", "WARRIOR" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    des_fev2 = {
      lines = {
        { id = "des_fev2_1", text = "Once a year, for the coming-of-age, we make a blade and a buckler that match, and give them to the young one who's trained hardest. It's not much, but the young ones talk about it all year, and that's worth the iron." },
      },
      choices = {
        { text = "That's a fine tradition. Back to other matters.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_encroach", when = { questDone = TODO_QUEST("Aggressive Encroachment") },
          text = "Valreaa says the children are playing by the elder tree again, and that you're the reason. A blade's only worth what it protects, so I hope whatever you carried out there did its work well." },
        { id = "h_default", key = true, text = "Destin Thriceforged, and these are my blades. Nothing fancy, just shortswords, axes and clubs, but they're made in the old style that Luminarian set down, and they'll hold an edge longer than you'll hold your nerve." },
      },
      again = {
        { id = "h_again", text = "What else? I'm listening, though my hands are busy." },
        { id = "h_again2", text = "Go on, ask. Steel doesn't mind waiting." },
      },
      choices = {
        { text = "A good blade deserves an honest price, paid in full.", next = "BACK", reply = "Spoken like someone who's swung a cheap one and learned the hard way.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "I'll call your blades rubbish if it drops the price.", next = "BACK", reply = "Then call them rubbish, and see whose word Thendal trusts. It won't be yours.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your blades.", next = "BUSINESS" },
        { text = "What is the old style?", next = "style" },
        { text = "Where does a name like Thriceforged come from?", next = "name" },
        { text = "Do you take windstones?", next = "stones" },
        { text = "Who forges these, if the magesmiths are gone?", next = "des_forge1" },
        { text = "Fevrath Skyhammer works the shields nearby.", next = "des_fev1" },
        { text = "Who buys your blades these days?", next = "w8_buy" },
        { text = "Farewell, Destin.", next = "END" },
      },
    },
    style = {
      lines = {
        { id = "st_default", text = "Luminarian was a magesmith who came with our ancestors out of Kalimdor and worked for centuries after, and nearly every weapon on Zephras is shaped after his. I can't put the magic in them that he did, but I can get the balance right, and that's half of it." },
      },
      choices = {
        { text = "Who could put the magic in?", next = "style2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    style2 = {
      lines = {
        { id = "s2_default", text = "The magesmiths of Ban'aethal, once, and they were the finest anywhere in the isles. Then Ban'aethal began to fall into the sky, and whoever got out got out with their lives and not much else, so now the rest of us make do with good steel." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = {
        { id = "na_default", text = "From my grandfather, who swore that he folded every blade three times, no more and no less, and wouldn't sell one that hadn't been. I do the same, mostly because I'd hear about it from his ghost otherwise." },
      },
      choices = {
        { text = "Does three folds make a better blade?", next = "name2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name2 = {
      big = true,
      lines = {
        { id = "n2_default", text = "I couldn't tell you, but people buy from a man called Thriceforged, and they don't buy from a man called Twice-If-I-Have-Time. Some say a tradition's worth keeping for its own sake, and some say it's only habit with a fancy name." },
      },
      choices = {
        { text = "Keep the tradition. It's what makes the blade yours.", next = "BACK", reply = "Good, because I'd hate to change the sign. People like a name.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "If it doesn't help the blade, drop it.", next = "BACK", reply = "Honest advice, and my wallet disagrees. The name stays.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stones = {
      lines = {
        { id = "ws_default", text = "Windstones or coin, both are good here, though I'll admit I'd rather have the stones. Coin is only metal, and a windstone has the winds in it, and these days the winds are getting scarce." },
      },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "windstones" } } },
      },
    },
  },

  topics = {
    windstones = { { id = "tp_stones", text = "Windstones or coin. I like the stones better, and so does everyone, so they keep getting dearer." } },
    advice = { { id = "tp_ad", text = "Keep your edge oiled and your grip dry, and come and see me before it breaks, not after." } },
    _none = { { id = "tp_none", text = "I know steel, friend, and not much else. Ask in the grove." } },
  },
}

---------------------------------------------------------------------------
-- Jolee Brightmeadows: cloth and leather armor, Thendal Village. Sells the
-- young their first proper clothes for the road. (Wiki: vendor only.)
---------------------------------------------------------------------------
P:NPC {
  key = "zep_jolee", id = TODO_NPC("Jolee Brightmeadows"), name = "Jolee Brightmeadows", title = "Cloth & Leather Armor",
  role = "vendor", tier = "service",
  communities = { "zephras_isle" }, temper = { "cheerful", "practical" }, values = { "craft", "kind" },
  notices = { "class", "race" },

  impression = {
    first = "She sizes you up for a jerkin before you've said a word.",
    third = "{name} met Jolee Brightmeadows, who sells cloth and leather armor in Thendal Village.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Gale's greetings, {name}! Come in out of the wind and show me how my stitching's held up." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Look if you must, but keep your hands off the jerkins." },
    { id = "g_default", text = "Gale's greetings! Come in out of the wind and let me look at what you're wearing." },
    { id = "g_again", when = { metBefore = true }, text = "Back again, {name}? Don't tell me you've torn it already." },
  },

  notice = {
    { id = "n_young", cat = "race", when = { race = "Skyborne", maxLevel = 3 },
      text = "Still in your coming-of-age clothes, I see. They're lovely, and they'll last about one afternoon in the grove." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! The High Order folk always want the finest cloth, and then they set the hems alight practising." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Jolee Brightmeadows, and I keep the young of Thendal in cloth and leather. Nothing grand, but it's stitched to take a fall, and on this isle you'll take a few." },
        { id = "h_outsider", when = { ["not"] = { race = "Skyborne" } },
          text = "Oh, you're from below the clouds! I've never fitted anyone your shape before, so forgive me if I stare at your shoulders. Jolee Brightmeadows, cloth and leather." },
      },
      again = {
        { id = "h_again", text = "Anything else? I can talk and stitch at once." },
        { id = "h_again2", text = "Go on, ask. The needle doesn't mind." },
      },
      choices = {
        { text = "A crafter's hours should be paid for honestly.", next = "BACK", reply = "Oh, I could hug you for that, but I've pins all over my apron.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "I'll wear it once and bring it back for my coin.", next = "BACK", reply = "You'll bring it back with my pins still in it, I expect, and you'll not get a copper.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Where does your leather come from?", next = "leather" },
        { text = "Business must be good, with so many coming of age.", next = "trade" },
        { text = "I'm a mage. What should I wear?", next = "xmage", when = { class = "MAGE" } },
        { text = "Those are hippogryph feathers sewn in your hems, aren't they?", next = "feathers" },
        { text = "What do the young wear when they come of age?", next = "heirloom" },
        { text = "I'm sailing for Dalaran with the High Order soon.", next = "xdal", when = { race = "Skyborne", faction = "Alliance" } },
        { text = "I'm bound for Mulgore with the Windshapers.", next = "xmul", when = { race = "Skyborne", faction = "Horde" } },
        { text = "Surely leather suits a rogue better than cloth?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Your people stitch finer than anyone where I come from.", next = "xout", when = { ["not"] = { race = "Skyborne" } } },
        { text = "Winds be with you, Jolee.", next = "END" },
      },
    },
    leather = {
      lines = { { id = "le_default", text = "From the hunters and the Rangers, mostly, and from Emerii Tallgust in Valanaar when they can't keep up. He cures it beautifully, but he charges in windstones, and windstones are dear these days." } },
      choices = {
        { text = "Why are windstones so dear?", next = "stones" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stones = {
      big = true,
      lines = { { id = "st_default", text = "Everyone wants them for everything, from lamps to the pylons, and nobody's finding new ones fast enough. Some say we should save every stone for the pylons and trade in coin instead, and some say that's the elders' worry and not a tailor's." } },
      choices = {
        { text = "Save the stones for the pylons. The isle comes first.", next = "BACK", reply = "You sound like an elder already. You may be right, though my purse doesn't like it.", fx = { align = { order = 1 } } },
        { text = "Folk need to trade. Let them spend what they find.", next = "BACK", reply = "That's what I say over supper, and my sister says I'll sink us all. Maybe we're both right.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade = {
      lines = { { id = "tr_default", text = "It is, and it isn't. More young ones need clothes, but more of them are going below the clouds on the skycutters, and they don't come back to have their hems let down." } },
      choices = {
        { text = "That must be hard to watch.", next = "trade2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade2 = {
      lines = { { id = "t2_default", text = "I try not to think of it like that. I'd rather think that somewhere in Dalaran or Mulgore there's a shen'dorei walking about in a jerkin I stitched, telling strangers where it was made." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xmage = {
      lines = { { id = "xm_default", text = "Cloth, and plenty of it, because leather fights you when you move your hands. Anathamaas Aetherwind in Valanaar will teach you the spells, but I'd rather you came to me before you go, so you don't look like a vagrant in front of the High Order." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    feathers = {
      lines = { { id = "fe_default", text = "They are, and you'll see them in half the hair in Thendal too. We only use the feathers they shed, never plucked ones, because a hippogryph remembers who pulled its tail, and so does its rider." } },
      choices = {
        { text = "Who taught you the craft?", next = "feathers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    feathers2 = {
      lines = { { id = "f2_default", text = "My mother, at a loom by the window where the wind came in. She used to say clothcraft was the one art we never asked the spirits to help with, so it was the one we could be proudest of." } },
      choices = {
        { text = "Do you still have her loom?", next = "feathers3" },
        { text = "Good. We should learn to stand without the spirits.", next = "BACK", reply = "She'd have liked you, I think. She never had much patience for waiting on the wind.", fx = { align = { order = 1 } } },
        { text = "We were wrong to ever think we didn't need them.", next = "BACK", reply = "My grandmother would have said the same, and the two of them argued about it for forty years.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    feathers3 = {
      lines = { { id = "f3_default", text = "Not the loom, but her shuttle came to me as my heirloom when I came of age, and I use it every morning. Some days I think the cloth comes out better for it, and some days I think I only miss her talking while I work." } },
      choices = { { text = "Then she's still stitching with you.", next = "BACK", reply = "That's a sweet thing to say. Go on before I get sentimental on the good wool.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    heirloom = {
      lines = { { id = "he_default", text = "New clothes, stitched for them, and whatever heirloom their family passes down from someone who's gone. I always leave a little pocket in the sleeve so they can carry it close, and nobody's noticed yet that I do it for every one." } },
      choices = {
        { text = "And then most of them leave the isle.", next = "heirloom2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    heirloom2 = {
      big = true,
      lines = { { id = "h2_default", text = "More every season, on the skycutters, with my pockets full of their grandparents' rings. Some families say a young one ought to serve Zephras first, and some say the world below needs us more now, and I hear both sides at every fitting." } },
      choices = {
        { text = "Serve the isle first. Zephras is still falling apart.", next = "BACK", reply = "That's what the elders say, and it sounds right when the pylons flicker. My customers don't always agree.", fx = { align = { order = 1 } } },
        { text = "Let them go. They can't help anyone if they never leave.", next = "BACK", reply = "Maybe so. I'd only like them to write now and then, so I know the stitching held.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdal = {
      lines = { { id = "xd_default", text = "Dalaran! Then you'll want something that won't look plain beside the Kirin Tor's robes. A cousin of mine says they wear purple to the elbow, though he's prone to exaggeration, so take that with a pinch of salt." } },
      choices = {
        { text = "What else does your cousin say?", next = "xdal2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdal2 = {
      lines = { { id = "x2_default", text = "That their city floats too, by magic instead of wind, and that nobody there had heard of us until the High Order came knocking. I'd love to see their faces when one of my jerkins walks through the gate." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xmul = {
      lines = { { id = "xu_default", text = "Mulgore! Then leather, and plenty of it, because I'm told the wind on those plains carries dust instead of cloud. The tauren have been good to our Windshapers at Camp Gev'rek, I hear, so mind you're good back." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xrogue = {
      lines = { { id = "xr_default", text = "Leather, soft-soled boots, and nothing that jingles. Eltheen Nightbreeze sends her students to me for fittings and then complains I've made them too handsome to hide, which I choose to take as praise." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xout = {
      lines = { { id = "xo_default", text = "That's kind of you, though we've had a very long time and very little else to do on the windy evenings. What do folk wear where you come from, then?" } },
      choices = {
        { text = "Mail and road dust, mostly.", next = "BACK", reply = "Then come back when the dust wears through, and I'll make you something that breathes.", fx = { affinity = 1 } },
        { text = "Wool and furs. It's cold where I'm from.", next = "BACK", reply = "Furs! I'd give a windstone to get my hands on a good bolt of something warm.", when = { race = { "Dwarf", "Gnome", "Human" } }, fx = { affinity = 1 } },
        { text = "Whatever I took off the last thing I killed.", next = "BACK", reply = "Oh, my. Well, it shows, if you don't mind my saying.", fx = { trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    windstones = { { id = "tp_stones", text = "I'll take them, gladly, but I'll take coin too. Everyone should, the way things are." } },
    two_orders = { { id = "tp_orders", text = "I dress both orders, and I don't take sides with a needle in my hand. Ask me again over supper." } },
    al_aketh = { { id = "tp_aketh", text = "Grey robes, badly stitched. I'd be ashamed to be seen in them, never mind worship in them." } },
    _none = { { id = "tp_none", text = "I couldn't say. If it isn't cloth or leather, I'm not much use to you." } },
  },
}

---------------------------------------------------------------------------
-- Fevrath Skyhammer: armorer and shieldcrafter, Thendal Village. (Wiki:
-- vendor only.) Plain, proud of good shields.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_fevrath", id = TODO_NPC("Fevrath Skyhammer"), name = "Fevrath Skyhammer", title = "Armorer & Shieldcrafter",
  role = "vendor", tier = "service",
  communities = { "zephras_isle" }, temper = { "gruff", "steady" }, values = { "craft", "duty" },
  notices = { "class" },

  impression = {
    first = "He raps a knuckle on every shield he talks about, as if to prove it.",
    third = "{name} met Fevrath Skyhammer, the armorer and shieldcrafter of Thendal Village.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're back, and still in one piece, so my shields must be doing their job. Come and look." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'll sell you a shield, since that's my trade, but I'll not stand here and chat with you." },
    { id = "g_default", text = "Gale's greetings. Mail, plate or a shield? I've all three, and none of them are pretty." },
    { id = "g_again", when = { metBefore = true }, text = "Back, are you? Let's see the dents, then." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior. Good, because half the young ones who come in here want something light and shiny, and you look like you want something that works." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Fevrath Skyhammer. I make armor and shields for anyone in Thendal who means to stand between the village and whatever's coming for it, and lately that's more people than it used to be." },
      },
      again = {
        { id = "h_again", text = "What else? Speak up, because I'm not putting this hammer down for anyone." },
        { id = "h_again2", text = "Ask, if you must. I'll keep working." },
      },
      choices = {
        { text = "A shield's worth what it stops, and I'll pay that.", next = "BACK", reply = "Now there's somebody who's been hit properly at least once in their life.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell cheap tin as good steel; nobody will know.", next = "BACK", reply = "They'd know the first time an axe came down on it, and so would I.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Let me see your wares.", next = "BUSINESS" },
        { text = "What makes a good shield?", next = "shield" },
        { text = "Who's buying armor these days?", next = "buyers" },
        { text = "I need something that takes a beating.", next = "xwarrior", when = { class = "WARRIOR" } },
        { text = "Skyhammer. Is that a smith's name, or a family one?", next = "name" },
        { text = "You work the bellows yourself, I see.", next = "forge" },
        { text = "What do you make of the Al'Aketh?", next = "cult" },
        { text = "I fight in bear's shape. I've little need of armor.", next = "xdruid", when = { class = "DRUID" } },
        { text = "A dwarven smith could teach you a trick or two.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "My people beat steel for war, not for show.", next = "xhorde", when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "Winds be with you, Fevrath.", next = "END" },
      },
    },
    shield = {
      lines = { { id = "sh_default", text = "Weight in the right place, a rim that won't split, and straps you trust with your life, because you'll be trusting them with exactly that. Seena Skybreaker in Valanaar sends her warriors to me for shields, and I take that as the best praise there is." } },
      choices = {
        { text = "And a bad one?", next = "shield2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shield2 = {
      lines = { { id = "s2_default", text = "Anything made to be looked at instead of hit. The High Order folk sometimes ask me to work little sigils into the face, and I do it, but I tell them each time that a vuldren won't stop to read it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    buyers = {
      big = true,
      lines = { { id = "bu_default", text = "Rangers, peacekeepers, and young ones going out after the Al'Aketh with more courage than sense. I'd sooner arm a child than send them out bare, but I'd sooner still nobody needed arming at all." } },
      choices = {
        { text = "Arm them well. Thendal has to defend itself.", next = "BACK", reply = "That's the sense of it, and I'll keep hammering. I only wish I liked it more.", fx = { align = { order = 1 } } },
        { text = "Then talk them out of going. Fighting isn't the answer.", next = "BACK", reply = "I try, and they nod, and then they buy a shield anyway. Talk to them yourself, if you think you'd do better.", fx = { align = { order = -1 }, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarrior = {
      lines = { { id = "xw_default", text = "Then take mail over leather and a shield over a second blade, and come back to me before the straps go, not after. I've stitched up a few warriors who waited too long, and I'd rather mend the gear than the person." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    name = {
      lines = { { id = "na_default", text = "A family name, and older than this forge, though nobody remembers who first swung the hammer. My grandmother swore one of us made shields for the Empyrean Blades when they still guarded the Shal'nan, and I never had the heart to ask her for proof." } },
      choices = {
        { text = "Would you make shields for the Blades today?", next = "name2", fx = { learn = { "shal_nan" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    name2 = {
      lines = { { id = "n2_default", text = "I'd drop everything else on the bench if they asked, though they have their own smiths in Valanaar and good ones. I'll settle for the young ones I arm here growing up to join them one day." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forge = {
      lines = { { id = "fo_default", text = "I do, and my arms will tell you so by evening. My father swore the wind used to come down the flue on its own in his day and keep the fire hot, and since the spirits left I've worked these bellows myself." } },
      choices = {
        { text = "The wind just stopped helping?", next = "forge2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forge2 = {
      lines = { { id = "f2_default", text = "Bit by bit, then all at once, the way everything has. I can't tell you whether it was the spirits leaving or just an old man's memory, and I've stopped wondering, because the iron doesn't care either way." } },
      choices = {
        { text = "Some say we should never have relied on the wind.", next = "forge3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forge3 = {
      big = true,
      lines = { { id = "f3_default", text = "Some say that, and some say we ought to be finding out why it left instead of pumping bellows and grumbling. I'm a smith, so I pump and grumble, but I'll hear what you think." } },
      choices = {
        { text = "We work with our own hands now. That's no shame.", next = "BACK", reply = "No shame at all, and my arms are the proof. Good answer.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "We should be asking why the wind left, not shrugging.", next = "BACK", reply = "Then ask it, and if it answers, tell it Fevrath wants his flue back.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult = {
      lines = { { id = "cu_default", text = "Grey robes, shaved heads and no fear of a blade, which makes them the worst kind of foe. I've mended plenty of shields that met their daggers, and they go for the straps, which tells me somebody taught them how." } },
      choices = {
        { text = "How should we fight them, then?", next = "cult2", fx = { learn = { "al_aketh" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cult2 = {
      big = true,
      lines = { { id = "c2_default", text = "That's the argument down at the ranger camp every night. Half of them want to meet the cult in the open and shame them, and the other half want to catch them sleeping and be done with it." } },
      choices = {
        { text = "Face them openly. We won't become what they are.", next = "BACK", reply = "Then carry a good shield, because they won't return the courtesy.", fx = { align = { honor = 1 } } },
        { text = "Catch them sleeping. They'd do the same to us.", next = "BACK", reply = "Hard words, but I've seen what they did to the straps. I won't argue.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      lines = { { id = "xd_default", text = "So I've heard, and I've heard the bear wears whatever you had on when you changed back. A good leather jerkin under the fur won't hurt you, and it'll save you some blushes in the village square." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdwarf = {
      lines = { { id = "xw_default", text = "I don't doubt it for a moment, and I'd listen to every word. Tell me, do your smiths really temper steel in a mountain's own heat, or is that a story the High Order brought back to impress us?" } },
      choices = {
        { text = "Aye, in Ironforge the Great Forge never goes cold.", next = "BACK", reply = "A forge that never goes cold. I'd give my best anvil to stand in front of it for an hour.", fx = { affinity = 1 } },
        { text = "Mostly it's ale and stubbornness.", next = "BACK", reply = "Ha! Then we're closer kin than I thought.", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
    xhorde = {
      lines = { { id = "xh_default", text = "Then we'll get along, because I've no time for show either. The Windshapers who've come back from your lands say your warriors wear their scars proudly, and I'd like to see what armor survives that kind of fighting." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    al_aketh = { { id = "tp_aketh", text = "They aim for the straps. Check yours before you go anywhere near them." } },
    shal_nan = { { id = "tp_shal", text = "Before my time, and my grandmother's too, whatever she claimed. Ask the elders." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. Ask me about rivets." } },
  },
}

---------------------------------------------------------------------------
-- Haal and Meeri: two Skyborne children atop the tree in Thendal Village,
-- watching a spirit. (Wiki: that's all.) Short, childlike, excited.
---------------------------------------------------------------------------
P:NPC {
  key = "zep_haal", id = TODO_NPC("Haal"), name = "Haal",
  role = "child", tier = "service",
  communities = { "zephras_isle" }, temper = { "curious", "bold" }, values = { "family" },
  notices = { "race" },

  impression = {
    first = "A small boy perched high in the tree, staring at something you can barely see.",
    third = "{name} met Haal, a child of Thendal Village watching a spirit from the treetop with Meeri.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You came back! It's still here, and I didn't tell Meeri you were coming, so it's a surprise." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Shh, and go away. You'll scare it off, and I don't want you up here anyway." },
    { id = "g_default", text = "Shh! You'll scare it off, and Meeri will never let me hear the end of it." },
    { id = "g_again", when = { metBefore = true }, text = "It's still here! Come and look, but quietly." },
  },

  start = "hello",
  nodes = {
    w8_brv = {
      lines = { { id = "w8_brv_a", text = "I walked all the way to the edge of the isle by the elder tree and looked over, right over, where the land stops and there's only clouds! Meeri held the back of my cloak the whole time, but I did the looking." } },
      choices = {
        { text = "What did you see?", next = "w8_brv2" },
        { text = "That's not brave, that's foolish.", next = "w8_brv2" },
        { text = "Something else, Haal.", next = "BACK" },
      },
    },
    w8_brv2 = {
      lines = { { id = "w8_brv2_a", text = "Clouds, mostly, and a bit of another island far away, and a bird flying underneath us, which was the strangest thing I ever saw. Don't tell my mum, because she thinks I was at Meeri's grandmother's the whole day." } },
      choices = {
        { text = "I won't tell, but stay back from the edge.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    hello = {
      narr = "He doesn't take his eyes off the shimmer in the air beyond the branches.",
      lines = {
        { id = "h_default", key = true, text = "I'm Haal, and that's a spirit, a real one, right there where the air goes all wobbly. Everyone says the spirits left before I was born, but this one didn't, or it came back, and we saw it first." },
      },
      again = { { id = "h_again", text = "What? I'm watching, but you can still ask things." } },
      choices = {
        { text = "What kind of spirit is it?", next = "kind" },
        { text = "Do your parents know you're up here?", next = "parents" },
        { text = "How did you even spot it?", next = "spot" },
        { text = "What do you want to be when you're grown?", next = "grow" },
        { text = "Is Meeri your sister?", next = "meeri" },
        { text = "I come from below the clouds, you know.", next = "xout", when = { ["not"] = { race = "Skyborne" } } },
        { text = "I'm leaving the isle on a skycutter soon.", next = "xleave", when = { race = "Skyborne" } },
        { text = "What's the bravest thing you've ever done?", next = "w8_brv" },
        { text = "Be careful up there, Haal.", next = "END" },
      },
    },
    kind = {
      lines = { { id = "ki_default", text = "A wind one, I think, because it moves when there's no breeze. Meeri says it's lonely, and I say it's just shy, and we're going to keep watching till one of us is right." } },
      choices = {
        { text = "Maybe it's come back to stay.", next = "BACK", reply = "That's what I said! Wait till I tell Windshaper Boro.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    parents = {
      lines = { { id = "pa_default", text = "They know we climb, they just don't know how high, so please don't tell them. Anyway, Meeri's littler than me and she got up first." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    spot = {
      lines = { { id = "sp_default", text = "I was up here pretending to be a ranger, watching for cultists, and the leaves started moving the wrong way. I thought it was a bird, but it wasn't anything, it was just air being alive." } },
      choices = {
        { text = "What did you do then?", next = "spot2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spot2 = {
      lines = { { id = "s2_default", text = "I tried to catch it in my cloak, and it went straight through and messed up my hair, and Meeri was so cross with me she didn't talk to me all afternoon. She says you don't grab spirits, you wait for them." } },
      choices = {
        { text = "Why did you want to catch it?", next = "spot3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spot3 = {
      big = true,
      lines = { { id = "s3_default", text = "So it couldn't go away again, like the others did! If we kept one, maybe it would hold the isle up, and nobody would have to leave. Meeri says that's like keeping a bird in a jar, but birds don't hold up islands." } },
      choices = {
        { text = "Meeri's right. You can't keep a spirit in a jar.", next = "BACK", reply = "Everybody always says Meeri's right. It's not fair.", fx = { align = { order = -1 } } },
        { text = "If it would save the isle, it's worth trying.", next = "BACK", reply = "See? I knew a grown-up would get it. I'm going to need a bigger cloak.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grow = {
      lines = { { id = "gr_default", text = "An Empyrean Blade, like in the stories, with a shining sword and a cloak that snaps in the wind. Or a ranger, because rangers get to climb things and nobody tells them off for it. What are you?" } },
      choices = {
        { text = "A warrior.", next = "grow2", when = { class = "WARRIOR" } },
        { text = "A rogue. I'm good at climbing too.", next = "grow2", when = { class = "ROGUE" } },
        { text = "A hunter, like the rangers.", next = "grow2", when = { class = "HUNTER" } },
        { text = "A mage of the High Order.", next = "grow2", when = { class = "MAGE" } },
        { text = "A shaman. I listen to spirits like that one.", next = "grow2", when = { class = "SHAMAN" } },
        { text = "A druid. I can turn into a bear.", next = "grow2", when = { class = "DRUID" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grow2 = {
      lines = {
        { id = "g2_default", text = "That's brilliant! When I'm bigger I'm going to be one too, unless I'm a Blade, and you'll have to teach me everything." },
        { id = "g2_shaman", when = { class = "SHAMAN" }, text = "Then you can hear it? What's it saying? Is it saying I'm right and Meeri's wrong? You can tell me, I won't tell her." },
        { id = "g2_druid", when = { class = "DRUID" }, text = "A bear! Do it, do it now, please! No, wait, you'll break the branch, and then we'll both be in trouble." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    meeri = {
      lines = { { id = "me_default", text = "No! She lives two houses down, and she follows me everywhere, except today she got up here first, which doesn't count because I showed her the best branch. She talks to the spirit. I mostly just look at it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xout = {
      lines = { { id = "xo_default", text = "Really? Is it true the ground down there doesn't move at all, not even a little, and you can't fall off the edge? I don't think I'd like that, it sounds boring." } },
      choices = {
        { text = "It's true. The ground just stays put.", next = "BACK", reply = "How do you know where you are, then? Never mind, I'll find out when I'm grown.", fx = { affinity = 1 } },
        { text = "Oh, there are plenty of places to fall off.", next = "BACK", reply = "Good! I'd hate for it to be boring.", fx = { trait = { witty = 1 } } },
      },
    },
    xleave = {
      lines = { { id = "xl_default", text = "Everybody's leaving! My cousin went last spring and he didn't even say goodbye to me, only to my mum. Will you write and tell me what it's like? You can send it to the tree; everyone knows it's ours." } },
      choices = {
        { text = "I'll write, Haal. I promise.", next = "BACK", reply = "You have to, now. A promise in front of a spirit counts double.", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    al_aketh = { { id = "tp_aketh", text = "The grey men? Mum says if I ever see one I have to run home and not stop. I'd be fast, too." } },
    _none = { { id = "tp_none", text = "I don't know. Ask a grown-up, they know everything boring." } },
  },
}

P:NPC {
  key = "zep_meeri", id = TODO_NPC("Meeri"), name = "Meeri",
  role = "child", tier = "service",
  communities = { "zephras_isle" }, temper = { "gentle", "dreamy" }, values = { "kind" },
  notices = { "race" },

  impression = {
    first = "A tiny girl in the treetop, whispering to the empty air.",
    third = "{name} met Meeri, a little girl of Thendal Village who watches a spirit from the treetop with Haal.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hello again. The spirit remembers you, I think, because it got a little brighter when you came." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Please go. The spirit goes quiet when you're here, and so do I." },
    { id = "g_default", text = "Hello. Please whisper, because it doesn't like loud voices." },
    { id = "g_outsider", when = { ["not"] = { race = "Skyborne" } }, text = "Oh! You're not one of us. Did you come to see the spirit too?" },
  },

  start = "hello",
  nodes = {
    w8_ans = {
      lines = { { id = "w8_ans_a", text = "Not with words, but sometimes the leaves turn over when I say something nice, and once a feather fell right in my lap. I keep it in a box with my grandfather's comb, and I'm not telling Haal where the box is." } },
      choices = {
        { text = "That sounds like an answer to me.", next = "w8_ans2" },
        { text = "Feathers fall all the time, Meeri.", next = "w8_ans2" },
        { text = "Something else, Meeri.", next = "BACK" },
      },
    },
    w8_ans2 = {
      lines = { { id = "w8_ans2_a", text = "Grandmother says the same, that if you want it to be an answer then maybe it is. I'm going to keep talking to it every day, so if it ever does say something, I'll be the one who hears it." } },
      choices = {
        { text = "Keep talking to it.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Meeri. The spirit comes every day when the sun is on the leaves, and I tell it things, because Grandmother says the spirits went away because nobody talked to them anymore." },
      },
      again = { { id = "h_again", text = "Do you want to say something to it? It's listening, I think." } },
      choices = {
        { text = "What do you tell it?", next = "tell" },
        { text = "Why did the spirits go away?", next = "why" },
        { text = "Your grandmother sounds wise.", next = "gran" },
        { text = "May I say something to the spirit?", next = "speak" },
        { text = "Haal thinks it's only shy.", next = "haal" },
        { text = "Do spirits live where I come from too?", next = "xout", when = { ["not"] = { race = "Skyborne" } } },
        { text = "I hear the wild a little. Shall I listen too?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Does the spirit ever answer you?", next = "w8_ans" },
        { text = "I'll leave you two to it.", next = "END" },
      },
    },
    tell = {
      lines = { { id = "te_default", text = "Everything, like who came of age, and that Haal fell out of the tree last week, and that we're sorry. Grandmother says saying sorry is the most important part." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      big = true,
      lines = { { id = "wh_default", text = "Grandmother says our people asked them for too much and never gave anything back. Haal says the spirits were just being mean, and we argue about it every single day." } },
      choices = {
        { text = "Your grandmother's right. We owe them an apology.", next = "BACK", reply = "Then you can say sorry too! It will like that, I think.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Haal has a point. They left you on your own.", next = "BACK", reply = "Don't tell him that, he'll be unbearable.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gran = {
      lines = { { id = "gr_default", text = "She is, she's the wisest person in Thendal, only she's old, so she can't climb up here. I come down and tell her what the spirit did, and she tells me what it means." } },
      choices = {
        { text = "What does she say it means?", next = "gran2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gran2 = {
      lines = { { id = "g2_default", text = "She says maybe it's Grandfather, because when he died we gave his ashes to the wind from this very hill. I don't think spirits work like that, but I don't tell her, because it makes her happy." } },
      choices = {
        { text = "That's a kind thing to keep from her.", next = "gran3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gran3 = {
      big = true,
      lines = { { id = "g3_default", text = "Mum says the old ways are all we have left now the spirits are gone, so we have to keep every one. But Grandmother's friend says the old ways are why everything broke. Which one is true?" } },
      choices = {
        { text = "Keep the old ways, Meeri. They hold your people together.", next = "BACK", reply = "Then I'll keep giving the spirit Grandfather's news. Every single day.", fx = { align = { order = -1 } } },
        { text = "Sometimes new ways are needed when old ones fail.", next = "BACK", reply = "That sounds like something the High Order would say. Haal would like you.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    speak = {
      lines = { { id = "sp_default", text = "Yes, but you have to say it softly, and you have to mean it, or it can tell. What do you want to say?" } },
      choices = {
        { text = "Thank you for staying.", next = "speak2", fx = { affinity = 1 } },
        { text = "We're sorry. All of us.", next = "speak2", fx = { trait = { kind = 1 } } },
        { text = "Spirit of the air, be at peace here.", next = "speak2", when = { class = "SHAMAN" }, fx = { trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    speak2 = {
      narr = "For a moment the leaves around you stir, though there is no breeze at all.",
      lines = {
        { id = "s2_default", text = "Did you see that? It moved! It never moves for Haal. I think it liked you, and I'm going to tell Grandmother the moment I get down." },
        { id = "s2_shaman", when = { class = "SHAMAN" }, text = "It came closer! You must be a real Windshaper. Is it lonely? Please tell me it isn't lonely." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    haal = {
      lines = { { id = "ha_default", text = "Haal thinks everything is shy or mean or stupid, because he's a boy. He tried to catch it in his cloak once, and it went right through him, and it served him right." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xout = {
      lines = { { id = "xo_default", text = "I don't know. Maybe they do, and nobody there talks to them either. You'll have to listen when you go home and tell me, but you have to be very quiet, like this." } },
      choices = {
        { text = "My people listen to the spirits. We have shamans too.", next = "BACK", reply = "Then they're lucky. Say hello to them from Meeri.", when = { race = { "Orc", "Troll", "Tauren" } }, fx = { affinity = 1 } },
        { text = "I'll listen, Meeri. Quietly.", next = "BACK", reply = "Good. And don't let anyone grab them.", fx = { affinity = 1 } },
      },
    },
    xdruid = {
      lines = { { id = "xd_default", text = "Oh, would you? Grandmother says the druids hear things the rest of us can't. Only don't turn into anything big, because the branch is very thin up here." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    shal_nan = { { id = "tp_shal", text = "Grandmother says the Shal'nan went away with the spirits. Maybe they'll come back together." } },
    _none = { { id = "tp_none", text = "I don't know that one. I could ask the spirit, but it doesn't answer much." } },
  },
}

---------------------------------------------------------------------------
-- Peeps: a pepe, one of the small round birds of the isle, who hops about Thendal Village.
-- Animals don't speak, so every line is narration in asterisks (the Dalaran cats' pattern).
---------------------------------------------------------------------------
local function Critter(t)
  t.role = t.role or "citizen"
  t.tier = t.tier or "service"
  t.start = "hello"
  P:NPC(t)
end

Critter {
  key = "zep_critter_peeps", id = TODO_NPC("Peeps"), name = "Peeps",
  temper = { "cheerful" }, values = { "curious" },
  impression = {
    first = "A round little pepe who hops about Thendal Village as if every doorstep belonged to it.",
    third = "{name} met Peeps, a small round pepe bird who keeps Thendal Village company.",
  },
  greetings = {
    { id = "g_default", text = "*A fat little pepe bird hops across the path in front of you, stops, and tilts its head so one shiny black eye can take you in.*" },
    { id = "g_back", when = { metBefore = true }, text = "*Peeps flutters up onto a fence post at your approach and fluffs out its feathers until it is very nearly a perfect ball.*" },
  },
  nodes = {
    w8_dust = {
      lines = { { id = "w8_dust_a", text = "*Peeps finds a patch of dry earth between two houses, settles into it, and begins to wriggle with enormous energy, flinging dust in every direction until it has nearly vanished in its own little cloud.*" } },
      choices = {
        { text = "Wait for the dust to settle.", next = "w8_dust2" },
        { text = "Step back before it reaches you.", next = "BACK" },
      },
    },
    w8_dust2 = {
      lines = { { id = "w8_dust2_a", text = "*When the cloud clears, Peeps stands up, shakes once from beak to tail, and is exactly as round and fluffy as before, only slightly browner. It looks enormously pleased with itself.*" } },
      choices = {
        { text = "Very thorough, Peeps.", next = "BACK" },
      },
    },
    w8_gust = {
      lines = { { id = "w8_gust_a", text = "*A gust sweeps through Thendal Village, rattling the shutters, and Peeps fluffs out its feathers until it is a perfect ball and simply rolls along the path with the wind.*" } },
      choices = {
        { text = "Catch it before it rolls too far.", next = "w8_gust2" },
        { text = "Watch where it ends up.", next = "w8_gust2" },
      },
    },
    w8_gust2 = {
      lines = { { id = "w8_gust2_a", text = "*Peeps comes to rest against a fence post, unrolls, and hops back toward you as if nothing at all has happened, though it gives the wind a long, offended look over its shoulder.*" } },
      choices = {
        { text = "The wind doesn't scare you, does it?", next = "BACK" },
      },
    },

    pee_st1 = {
      lines = {
        { id = "pee_st1_1", text = "*Peeps hops ahead of you down the path to the stalls of Thendal Village, stopping every few hops to make sure you're still following.*" },
      },
      choices = {
        { text = "Wait beside it under a stall.", next = "pee_st2" },
        { text = "Let it go on alone.", next = "BACK" },
      },
    },
    pee_st2 = {
      lines = {
        { id = "pee_st2_1", text = "*A merchant drops a crust, and Peeps is on it before it touches the ground. It carries the prize to a fence post, eats half, and drops the rest at your feet as though settling a debt.*" },
      },
      choices = {
        { text = "Thank you, Peeps. Very generous.", next = "BACK" },
      },
    },
    pee_roof1 = {
      lines = {
        { id = "pee_roof1_1", text = "*Three more pepes sit in a row along the roof above, round and still as stones, watching Peeps with what looks like disapproval.*" },
      },
      choices = {
        { text = "Is Peeps in trouble with them?", next = "pee_roof2" },
        { text = "Leave the birds to their quarrel.", next = "BACK" },
      },
    },
    pee_roof2 = {
      lines = {
        { id = "pee_roof2_1", text = "*Peeps flutters up to join them, bumps into the nearest one so that it wobbles, and settles into the row, and all four of them fluff up at once until the roof is lined with feathered balls.*" },
      },
      choices = {
        { text = "Peace in the flock, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "*Peeps pecks at the dust between the village houses, finds nothing worth eating, and pecks again with undiminished hope.*" },
        { id = "h_skyborne", when = { race = "Skyborne" }, text = "*Peeps eyes the feathers in your hair with deep suspicion, as if you might be a very large and very rude relative.*" },
        { id = "h_night", when = { timeOfDay = "night" }, text = "*Peeps is tucked into a nook under the eaves with its head buried in its feathers, and one sleepy eye cracks open at the sound of you.*" },
      },
      again = { { id = "a_again", text = "*Peeps is still here, hopping in a small and busy circle.*" } },
      choices = {
        { text = "Hello, Peeps. Find anything good today?", next = "BACK", reply = "*Peeps answers with a single high chirp and a hop toward the merchants' stalls, where crumbs are known to fall.*" },
        { text = "Scatter a few crumbs for it.", next = "BACK", reply = "*Peeps descends on the crumbs with tremendous seriousness, eats every last one, and then looks at your hands for more.*" },
        { text = "Follow Peeps toward the merchants' stalls.", next = "pee_st1" },
        { text = "Notice the other pepes on the rooftops.", next = "pee_roof1" },
        { text = "Watch Peeps take a dust bath.", next = "w8_dust" },
        { text = "See what happens when the wind gusts.", next = "w8_gust" },
        { text = "Hold out a finger for it to perch on.", next = "END", reply = "*Peeps considers your finger, hops onto it for one wobbling moment, then takes off in a flurry of feathers toward the rooftops.*" },
      },
    },
  },
}
