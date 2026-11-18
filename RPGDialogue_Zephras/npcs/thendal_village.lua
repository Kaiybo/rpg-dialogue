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
    first = "Ailee Farheart of the Rangers was the first to greet me in Thendal Village, bright as morning and already pointing me toward Rorian. She talks about coming of age as if it were the best day anyone could have.",
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
      text = "A hunter! Tai'ree will want you before the day's out, and the Rangers will want you after that, so you'll be a busy one." },
    { id = "n_ranger", cat = "origin", when = { origin = "skyborne_thendal_ranger" },
      text = "I'd know a Ranger's walk anywhere: heel down, quiet, and always looking past whoever you're talking to." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Winds above, you're tall! I hope our doorways haven't given you too much trouble yet." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
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
        { id = "ne_default", text = "It is a happy day, mostly! Our people have had a hard time of it, so we hold on to the good days with both hands. So tell me honestly, are you nervous, or are you hiding it very well?" },
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
        { id = "r2_default", text = "He doesn't like to see the gifts of our people wasted on games, and he'll tell you so, at length, if you're caught using them for fun. Myriaal gets that speech about once a week, and I'm fairly sure she's started to enjoy it." },
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
        { id = "pe_default", text = "The vuldren were always docile, and now some of them are turning on people, and the cirrusflies are swarming in the east of the grove like nothing I've ever seen. Elatrell says it's the magic out of balance, and I've no better answer than hers." },
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
          text = "You're High Order, so you'll hear plenty about the Windshapers' faults from Falorne, and Ventaari will tell you all about yours. Both orders have good people and both have done things I'd rather forget, so I'll only say this: the grove is the one place they don't fight." },
        { id = "xor_ws", when = { faction = "Horde" },
          text = "You're with the Windshapers, so Ventaari will tell you all about the High Order's faults, and Falorne will tell you all about yours. Both orders have good people and both have done things I'd rather forget, so I'll only say this: the grove is the one place they don't fight." },
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
    windstones = { { id = "tp_stones", text = "Dalia's the one to ask about windstones. She knows where to look, and she'll tell you how precious they've become." } },
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
    first = "Windshaper Boro teaches shamanism in a village where the spirits no longer answer, and he teaches it anyway, patiently, one element at a time. He listens to the silence the way other men listen to music.",
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
      text = "You've the look of someone who tends totems for a living, careful with your hands and always glancing at the sky. Ayessa chose well." },
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
          text = "Then you're luckier than any of us, and I hope your Earth Mother keeps it that way. Ayessa says the tauren of Mulgore welcomed our people as if we'd always been neighbors, so tell me, do your elements answer when you call, or must you plead?" },
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
    first = "Blademaster Ren teaches the blade from the Thendal watchtower and believes the warrior who flinches is the warrior who dies. She speaks like an officer and looks at you as if measuring where you'd break.",
    third = "{name} met Blademaster Ren, the warrior trainer in the Thendal Village watchtower, who teaches the young never to flinch.",
  },

  greetings = {
    { id = "g_default", text = "Stand up straight when you come into my watchtower." },
    { id = "g_warrior", when = { class = "WARRIOR" }, text = "Here for training? Good; you're late." },
  },

  notice = {
    { id = "n_blade", cat = "origin", when = { origin = "skyborne_empyrean_recruit" },
      text = "You hold your weapon the way the Empyrean Blades drill their recruits, point low and elbow in. Whoever started you knew their business." },
    { id = "n_repair", cat = "kit", when = { durability = { max = 30 } },
      text = "Your gear's half falling off you. Go and see Destin before you come to me, because I won't teach someone whose straps are about to give way." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Ren, and I teach the blade here. Our world is changing, and it will need people with the will to lead and protect the others if our people are going to survive it, so I don't waste my time on anyone who isn't serious." },
        { id = "h_path", tags = { "news" }, when = { questDone = TODO_QUEST("The Warrior's Path") },
          text = "You found me, then, and you read my note. Come back to me as you grow, because you'll need guidance more than you think, and I'd rather you got it from me than from your mistakes." },
        { id = "h_outsider", when = { class = "WARRIOR", ["not"] = { race = "Skyborne" } },
          text = "A warrior from below the clouds. I'd like to see how your people fight, because ours have had ten thousand years to grow comfortable, and comfortable warriors are dead ones." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick." },
        { id = "h_again2", text = "Ask, then. I've drills to run." },
      },
      choices = {
        { text = "What do you teach first?", next = "flinch" },
        { text = "Why does the isle need warriors now?", next = "protect" },
        { text = "Who else trains in this watchtower?", next = "tower" },
        { text = "Train me, Blademaster.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "I trained to join the Empyrean Blades.", next = "xblade", when = { origin = "skyborne_empyrean_recruit" } },
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
        { text = "I'll train it out of me. Discipline first.", next = "BACK", reply = "Discipline's good, but don't train out what keeps you careful. Fear's a tool too.", fx = { affinity = 2, align = { order = 1 }, trait = { stern = 1 } } },
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
    first = "Tai'ree Farsight trains Thendal's hunters and greets most people with a curt nod and a long look. She says the wilds have never been wilder, and she sounds as though she means to be ready for it.",
    third = "{name} met Tai'ree Farsight, Thendal Village's hunter trainer, who believes the isle's hunters have never been more needed.",
  },

  greetings = {
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
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Tai'ree, and I train the hunters of Thendal. There's more work for us now than there's been in my lifetime, because the winds are getting rougher, the isle's magic is thinning out, and the beasts have gone stranger than anyone here can remember." },
        { id = "h_way", tags = { "news" }, when = { questDone = TODO_QUEST("The Way of the Hunter") },
          text = "You read my note and you came, which is the first test passed. You remind me of how I looked to my own teacher once, all elbows and nerve, but whether you've got what this work needs is something only you can show me." },
      },
      again = {
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "Ask. I'm listening." },
      },
      choices = {
        { text = "Wilder how?", next = "wilds" },
        { text = "Who was your mentor?", next = "mentor" },
        { text = "Train me, Tai'ree.", next = "BUSINESS", when = { class = "HUNTER" } },
        { text = "How should I look after my companion?", next = "xpet", when = { class = "HUNTER" } },
        { text = "Nobody at home expected a human hunter.", next = "xhuman", when = { race = "Human", class = "HUNTER" } },
        { text = "Farewell, Tai'ree.", next = "END" },
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
        { id = "w2_default", text = "To keep our people safe, first and last. Some hunters out there think it's their job to put the wild back the way it was, but I don't think anyone can, and I'd rather spend my arrows on what's in front of me." },
      },
      choices = {
        { text = "Protect the people first. The wild can fend for itself.", next = "BACK", reply = "Good, that's my thinking. The wild can look after itself, most days.", fx = { affinity = 2, align = { order = 1 } } },
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
    first = "Destin Thriceforged sells blades and mends broken ones in Thendal Village, and he talks about the shape of a sword the way other men talk about a sunset. He takes windstones or coin, and he'd rather have the windstones.",
    third = "{name} met Destin Thriceforged, Thendal Village's weapon merchant, who sells plain steel made in the old style.",
  },

  greetings = {
    { id = "g_default", text = "Blades, mending, an honest opinion. Which will it be?" },
    { id = "g_broken", when = { durability = { max = 30 } }, text = "Winds above, what have you been hitting? Let me see that." },
  },

  notice = {
    { id = "n_repair", cat = "kit", when = { durability = { max = 30 } },
      text = "That edge has more nicks than a cirrusfly has legs. I can mend it, and you should let me before it fails you." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! I've heard your people are the finest smiths below the clouds. Would you look at one of my blades and tell me honestly what you think?" },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You've been eyeing the dirks. They're good dirks, so I don't blame you, but I count them every evening." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Destin Thriceforged, and these are my blades. Nothing fancy, just shortswords, axes and clubs, but they're made in the old style that Luminarian set down, and they'll hold an edge longer than you'll hold your nerve." },
      },
      again = {
        { id = "h_again", text = "What else? I'm listening, though my hands are busy." },
        { id = "h_again2", text = "Go on, ask. Steel doesn't mind waiting." },
      },
      choices = {
        { text = "Show me your blades.", next = "BUSINESS" },
        { text = "What is the old style?", next = "style" },
        { text = "Where does a name like Thriceforged come from?", next = "name" },
        { text = "Do you take windstones?", next = "stones" },
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
        { id = "n2_default", text = "Honestly? I couldn't tell you, but people buy from a man called Thriceforged, and they don't buy from a man called Twice-If-I-Have-Time. Some say a tradition's worth keeping for its own sake, and some say it's only habit with a fancy name." },
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
    windstones = { { id = "tp_stones", text = "Windstones or coin. I like the stones better, and so does everyone, which is why they keep getting dearer." } },
    advice = { { id = "tp_ad", text = "Keep your edge oiled and your grip dry, and come and see me before it breaks, not after." } },
    _none = { { id = "tp_none", text = "I know steel, friend, and not much else. Ask in the grove." } },
  },
}
