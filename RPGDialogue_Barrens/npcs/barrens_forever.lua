-- The Barrens' Forever-only people: Gur'ak, who wants the Razormane butcher Chol'aruk dead,
-- Pallwick Boneset, the Crossroads' Forsaken bonesetter, and Sulhasa, a tauren treed by beasts
-- in the south. Voices: bibles/barrens_forever.md
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

local QGA = TODO_QUEST("Chol'aruk the Ravener")
local QSU = TODO_QUEST("Field to Clear")

---------------------------------------------------------------------------
-- The Crossroads
---------------------------------------------------------------------------

-- Gur'ak: veteran at the Crossroads; Chol'aruk the Ravener.
P:NPC {
  key = "gurak", id = TODO_NPC("Gur'ak"), name = "Gur'ak",
  bible = "bibles/barrens_forever.md", role = "questgiver", tier = "quest",
  communities = { "crossroads" }, temper = { "grim" }, values = { "brave", "vengeful" },
  notices = { "class", "trophy", "race" },
  impression = {
    first = "Gur'ak is a scarred old orc at the Crossroads who has fought the Razormane longer than most grunts have been alive. He wants the head of the quilboar Chol'aruk, and he talks about it the way other orcs talk about supper.",
    third = "{name} met Gur'ak, a grim veteran of the Crossroads who wants Chol'aruk the Ravener dead.",
  },
  greetings = {
    { id = "g_default", text = "Another one off the road. Can you fight, or are you just passing through?" },
    { id = "g_active", when = { questActive = QGA }, text = "Chol'aruk's still breathing, I can smell it from here. Go and fix that." },
    { id = "g_ready", when = { questReady = QGA }, text = "Is that his head in your pack? Bring it here, and let me look at him." },
    { id = "g_done", when = { questDone = QGA }, text = "The one who took Chol'aruk's head. Sit down, and nobody at this fire will say a word against you." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown teeth since I saw you last. Good, because the Barrens has plenty more that need killing." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior, and you hold your weapon right, which is more than most grunts manage. Chol'aruk's cave is narrow, so you'll fit in there nicely." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Tauren. The Razormane hate your kind more than they hate us, and that's saying something, so they'll come at you screaming." },
    { id = "n_trophy", cat = "trophy", when = { killed = { name = "Razormane", min = 30 } },
      text = "You've been killing Razormane, I can smell them on you. Keep at it, because there's no shortage." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Gur'ak. I've held this crossroads against the quilboar since before the walls were finished, and I'll hold it till they bury me under it. You want to be useful, I've a pig that needs killing." },
        { id = "h_before", when = { questBefore = QGA },
          text = "There's a Razormane butcher called Chol'aruk who lairs in a cave up on Thorn Hill, east of here, and he eats what he kills. I want his head on a spike, and I'm too old to crawl into his hole and fetch it myself." },
        { id = "h_active", tags = { "news" }, when = { questActive = QGA },
          text = "The cave mouth is on the far side of Thorn Hill, and he's at the bottom of it. You'll hear his berserkers yelling his name before you see him, so be ready." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { QGA, days = 3 } },
          text = "Chol'aruk's head is on the spike by the gate, and the Razormane scouts have been giving the road a wide berth ever since. Thork says it's the quietest the hill's been all season." },
        { id = "h_done", when = { questDone = QGA },
          text = "They'll find another butcher, the Razormane always do, but that one's gone, and I sleep better for it. Remember that, if I ever ask you for another head." },
      },
      again = {
        { id = "h_again", text = "What else? Talk, I'm listening." },
        { id = "h_again2", text = "Go on. Make it quick, the sun's hot." },
      },
      choices = {
        { text = "Who is Chol'aruk?", next = "cholaruk" },
        { text = "Tell me about the Razormane.", next = "razormane" },
        { text = "How long have you been here?", next = "long" },
        { text = "What's life like at the Crossroads?", next = "crossroads" },
        { text = "I'm a tauren. The quilboar are an old enemy of ours.", next = "xtauren", when = { race = "Tauren" } },
        { text = "Chol'aruk is dead. I took his head myself.", next = "xdone", when = { questDone = QGA } },
        { text = "I'll get his head.", next = "BUSINESS" },
        { text = "I'll be on my way.", next = "END" },
      },
    },
    cholaruk = {
      lines = {
        { id = "c_default", text = "A quilboar war-chief, if you could call him a chief, with tusks like daggers and an appetite for flesh, any flesh. His berserkers scream 'blood and bones' when they charge, and they mean it, because they eat whatever doesn't run fast enough." },
      },
      choices = {
        { text = "They eat their enemies?", next = "eat" },
        { text = "Why does he matter now?", next = "why_now" },
        { text = "How do I kill him?", next = "kill" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_now = {
      lines = {
        { id = "wn_default", text = "Because he's getting bold. His berserkers used to stay on the hill, and now they come down on the road at dusk, howling his name, and every caravan from Orgrimmar has to run the gauntlet past them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    eat = {
      lines = {
        { id = "ea_default", text = "Enemies, friends, their own wounded if they're hungry enough. We lost a peon on the Thorn Hill road last month, and what we found of him wasn't worth burying, so you'll forgive me if I don't want to talk about it." },
      },
      choices = {
        { text = "Then he deserves no mercy.", next = "vengeance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    vengeance = {
      big = true,
      lines = {
        { id = "v_default", text = "No mercy, and no clean death either, if I had my way. But a dead pig is a dead pig, and the head will do. What do you say, should I want more than that?" },
      },
      choices = {
        { text = "Kill him cleanly. We're better than he is.", next = "BACK", reply = "Cleanly, then, because you're right that I'd shame that peon by becoming the beast that ate him. Bring me the head, and I'll bury the rest of my anger with it.", fx = { align = { light = 1 } } },
        { text = "Make him suffer the way that peon did.", next = "BACK", reply = "That's the blood talking, and I know it well, because it's been talking to me every night since. Bring me his head, then, and let the Ravener's last hour be a long one.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    kill = {
      lines = {
        { id = "k_default", text = "Hard and fast, before he gets angry, because angry he hits like a kodo and quicker. He'll go for your legs to slow you down and then cut you to bleed, so don't stand still, and bring friends if you have any." },
        { id = "k_lowlevel", when = { maxLevel = 17 }, text = "Not alone, not yet, and not at your size. He's a brute even among quilboar, so bring two or three friends and keep moving, or you'll be the next thing on his plate." },
      },
      choices = {
        { text = "Friends make it easier.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    razormane = {
      lines = {
        { id = "r_default", text = "Quilboar of the Barrens, thick as fleas on a dog. They have their kraals all over the hills, and they hate the orcs for building here and the tauren for being alive, so they raid the road whenever they think we're not looking." },
      },
      choices = {
        { text = "Why do they hate the tauren?", next = "tauren_hate" },
        { text = "Where do they live?", next = "kraals" },
        { text = "Can't we make peace with them?", next = "peace" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kraals = {
      lines = {
        { id = "kr_default", text = "In thorny mounds they call kraals, all bramble and dung, on Thorn Hill east of here and scattered south across the plains. The biggest are far to the south, where the thorns grow taller than a tauren, and you don't want to go there yet." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren_hate = {
      lines = {
        { id = "th_default", text = "Old business, before the Horde came, over land and over the bones of some boar god they worship. Ask a tauren if you want the whole story, but don't expect it to be a happy one." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    peace = {
      big = true,
      lines = {
        { id = "pe_default", text = "Peace? With a thing that eats peons? Thrall made peace with the tauren and the trolls, and that was wise, but the quilboar have never asked, and I'd not believe them if they did." },
      },
      choices = {
        { text = "Some of them might listen, if anyone tried.", next = "BACK", reply = "Maybe, and maybe the Ravener will take up farming. I've seen what they leave in their pens, and I'd sooner talk peace with the wind.", fx = { align = { honor = 1 } } },
        { text = "Some foes can't be reasoned with. Kill them all.", next = "BACK", reply = "Now you speak like a soldier of the Horde. Some beasts only understand the axe, and the quilboar have taught every grunt at the Crossroads that lesson.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    long = {
      lines = {
        { id = "l_default", text = "Since the first stakes went into the ground, when the Warchief wanted a post where the roads meet. Before that I fought in Thrall's war, and before that I sat in the human camps, which I don't talk about." },
      },
      choices = {
        { text = "The internment camps? What were they like?", next = "camps" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camps = {
      lines = {
        { id = "ca_default", text = "I said I don't talk about them, and I meant it. Thrall broke the walls and we walked out, and that's all you need to know." },
      },
      choices = {
        { text = "I'm sorry I asked.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    crossroads = {
      lines = {
        { id = "cr_default", text = "Busy and loud and hot, with the caravans coming through from Orgrimmar and Ratchet. Sergra runs it, and Thork guards it, and I sit at the gate and glare at quilboar, which is what I'm good at." },
      },
      choices = {
        { text = "You sound content.", next = "content" },
        { text = "Something else.", next = "BACK" },
      },
    },
    content = {
      lines = {
        { id = "co_default", text = "Content's a big word, but I'm fed, I'm armed, and the enemy is close enough to see. An old orc could ask for worse." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xtauren = {
      lines = {
        { id = "xt_default", text = "So I hear, and I'll take any tauren who wants a quilboar head on a spike. Chol'aruk's raiders have hit your herds too, coming down off the hill, so this is your fight as much as mine." },
      },
      choices = {
        { text = "Then I'll take his head for both of us.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdone = {
      lines = {
        { id = "xd_default", text = "So you did, and I looked at that ugly head a long while before I spiked it. Take the sword he had, if you haven't already, because a trophy from a monster is still a good blade." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I fought for Thrall, and now I fight for this post. That's all the story anybody needs." } },
    advice = { { id = "tp_ad", text = "Never turn your back on a quilboar, even a dead one. Sometimes they're not finished." } },
    _none = { { id = "tp_none", text = "I don't know and I don't care. Ask Thork, he likes talking." } },
  },
}

-- Pallwick Boneset: Forsaken bonesetter at the Crossroads.
P:NPC {
  key = "pallwick", id = TODO_NPC("Pallwick Boneset"), name = "Pallwick Boneset",
  bible = "bibles/barrens_forever.md", role = "citizen", tier = "service",
  communities = { "crossroads" }, temper = { "dry" }, values = { "practical", "curious" },
  notices = { "wounds", "race" },
  impression = {
    first = "Pallwick Boneset is a Forsaken at the Crossroads who straightens broken limbs for orcs who would rather not look at him. He has a dry, cold humor and seems to find living bodies endlessly interesting.",
    third = "{name} met Pallwick Boneset, a Forsaken who sets broken bones at the Crossroads.",
  },
  greetings = {
    { id = "g_default", text = "Something broken? No? Pity. I'm always looking for practice." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still in one piece. How disappointing for me." },
  },
  notice = {
    { id = "n_wounds", cat = "wounds", when = { durability = { max = 0.3 } },
      text = "Your armor is in ruins, and I'd wager what's underneath isn't much better. Sit down and let me look at your ribs." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "One of us. Tell me, how are your joints holding up in this heat? Mine creak like a gallows." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Pallwick Boneset, and yes, it's an apt name. I set bones for the Crossroads, which means I spend my days with my hands inside orcs who are trying very hard not to look at me." },
        { id = "h_orc", when = { race = "Orc" }, text = "An orc who's actually looking me in the eye. Refreshing. Most of your kind would rather limp than let a corpse touch them, so you're a pleasant surprise." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "A tauren. Your bones are magnificent, do you know that? I set a brave's thigh last week, and it was like mending a tree trunk." },
      },
      again = {
        { id = "h_again", text = "Anything else? My patients are waiting, though not patiently." },
        { id = "h_again2", text = "Ask what you like. I've nowhere to be; I've been dead for years." },
      },
      choices = {
        { text = "Why does a Forsaken set bones for orcs?", next = "why" },
        { text = "Do the orcs trust you?", next = "trust" },
        { text = "What's the worst you've seen?", next = "worst" },
        { text = "Can you set your own bones?", next = "own" },
        { text = "I'll leave you to your work.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "w_default", text = "Because the Dark Lady sent some of us to show the Horde we're worth keeping, and I'm useful. I knew this work when I was alive, and the dead remember their trades better than their names." },
      },
      choices = {
        { text = "What was your name, in life?", next = "name" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = {
        { id = "n_default", text = "Pallwick, I think, though it may have been someone else's. Boneset I chose myself, because it's honest, and I find honesty rather easier now that I've nothing to lose by it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    trust = {
      lines = {
        { id = "t_default", text = "Trust is a strong word. They let me work because a grunt with a broken arm can't hold a shield, and they watch my hands the whole time, which I suppose is wise." },
      },
      choices = {
        { text = "They should be grateful.", next = "grateful" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grateful = {
      big = true,
      lines = {
        { id = "g_default2", text = "Should they? Most of them have good reason to fear the dead, and I'm not going to argue them out of it. I'd rather they learned slowly, and I'm in no hurry." },
      },
      choices = {
        { text = "Fear is fair. Earn their trust, and they'll give it.", next = "BACK", reply = "That's the way of it, and it's kinder advice than I usually get from the living. I have time, which is the one thing the grave gave me in plenty, so I'll mend their bones and let them decide.", fx = { align = { order = 1 } } },
        { text = "They're allies. They should treat you like one.", next = "BACK", reply = "Allies, yes, on parchment signed in Orgrimmar and Undercity. A grunt who's watched the dead rise against him doesn't read parchment, though, and I'd rather he trusted my hands than a treaty.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    worst = {
      lines = {
        { id = "wo_default", text = "A grunt who'd been chewed on by a quilboar, half his leg gone and still swearing at me. I put what was left of him back together, and he limps now, but he walks, and he spat at me afterward, which I took as thanks." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    own = {
      lines = {
        { id = "o_default", text = "Some of them, with a mirror and a good deal of patience. The real trouble is that the dead don't heal, so every bone I set in myself is set for good, and I've made a few mistakes I'll be walking with forever." },
        { id = "o_forsaken", when = { race = "Scourge" }, text = "As you'll discover, yes, with a mirror and some patience. The dead don't heal, so take care of your knees, because they're the first to go." },
      },
      choices = {
        { text = "That's a grim way to live.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I set bones in life and I set them in death. The work hasn't changed much; the patients have." } },
    advice = { { id = "tp_ad", text = "Keep your knees bent and your head down. That's what most breaks come from." } },
    _none = { { id = "tp_none", text = "I don't know, I'm afraid. Bones I understand; most other things baffle me." } },
  },
}

---------------------------------------------------------------------------
-- The southern Barrens
---------------------------------------------------------------------------

-- Sulhasa: tauren stuck in a tree near the Dustwallow border; Field to Clear.
P:NPC {
  key = "sulhasa", id = TODO_NPC("Sulhasa"), name = "Sulhasa",
  bible = "bibles/barrens_forever.md", role = "questgiver", tier = "quest",
  temper = { "warm" }, values = { "practical", "brave" },
  notices = { "race", "form" },
  impression = {
    first = "Sulhasa is a tauren from Camp Taurajo who climbed a tree to get away from the beasts in the field below and has been stuck there since. She takes it with good humor, mostly.",
    third = "{name} met Sulhasa, a tauren treed by beasts on the southern edge of the Barrens.",
  },
  greetings = {
    { id = "g_default", text = "Hey! Up here!" },
    { id = "g_active", when = { questActive = QSU }, text = "I can still see them down there, friend. Keep at it, and I'll keep my hooves off the ground." },
    { id = "g_done", when = { questDone = QSU }, text = "I'm still up here out of habit, friend, but it's quieter now, and that's your doing." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Another tauren! Please, {g:brother|sister}, don't tell anyone in Taurajo you found me in a tree." },
    { id = "n_bear", cat = "form", when = { form = { "bear", "cat" } },
      text = "Oh! You gave me a fright, druid, I thought you were one of them. Stay like that, though, because they might run from you." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Hey, up here! I'm Sulhasa, from Camp Taurajo, and I've been sitting in this tree since yesterday morning. The beasts in that field won't let me down, and I'm starting to talk to the leaves." },
        { id = "h_before", when = { questBefore = QSU },
          text = "Up here! Thank the Earth Mother, somebody with a weapon. The field below is crawling with beasts, and if you could clear it, I could get down and get home before my legs turn to wood." },
        { id = "h_active", tags = { "news" }, when = { questActive = QSU },
          text = "You're doing it, I can see it from here! There are still a few lurking in the grass, though, so watch your back and don't let them circle you." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { QSU, days = 3 } },
          text = "It's quiet down there now, and I can hear the wind again instead of growling. I'll climb down in a moment, friend, once my legs remember how to be legs." },
        { id = "h_druid", when = { class = "DRUID" }, text = "A druid! Maybe you could ask the beasts nicely to leave? No? I didn't think so, but it was worth asking." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm not going anywhere, as you can see." },
        { id = "h_again2", text = "Go on, I've got all day. All week, maybe." },
      },
      choices = {
        { text = "How did you end up in a tree?", next = "how" },
        { text = "What were you doing out here?", next = "why" },
        { text = "What's in the field?", next = "beasts" },
        { text = "Tell me about Camp Taurajo.", next = "taurajo" },
        { text = "Shall I tell Taurajo where you are?", next = "xtell", when = { race = "Tauren" } },
        { text = "I could carry you down, in bear form.", next = "xbear", when = { class = "DRUID" } },
        { text = "What happens to the field now?", next = "field_after", when = { questDone = QSU } },
        { text = "I'll clear the field.", next = "BUSINESS" },
        { text = "Stay safe up there.", next = "END" },
      },
    },
    how = {
      lines = {
        { id = "ho_default", text = "Quickly, friend, very quickly, and I didn't know a tauren could climb that fast. One moment I was walking through the grass, and the next there were teeth snapping at my tail, so up I went." },
      },
      choices = {
        { text = "Couldn't you have fought them?", next = "fight" },
        { text = "I didn't know tauren could climb trees.", next = "climb" },
        { text = "Something else.", next = "BACK" },
      },
    },
    climb = {
      lines = {
        { id = "cl_climb", text = "Neither did I, friend, and neither did the tree, judging by the way it creaked. Fear is a wonderful teacher, and I learned very quickly that day." },
      },
      choices = {
        { text = "How long can you stay up there?", next = "food" },
        { text = "Something else.", next = "BACK" },
      },
    },
    food = {
      lines = {
        { id = "fo_default", text = "Longer than I'd like. I've eaten the last of my bread and tried a few of the leaves, and I'll tell you now, friend, the leaves are not worth it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    fight = {
      big = true,
      lines = {
        { id = "fi_default", text = "One, maybe, or two. But there were more than two, and a brave who dies alone in a field doesn't help anyone, so I climbed. Was that cowardly, do you think?" },
      },
      choices = {
        { text = "No. Living to fight again is wise.", next = "BACK", reply = "Thank you, because I've been asking myself that every hour I've hung up here. The Earth Mother didn't make me to die in a field for nothing, and I'd like to prove it once I'm down.", fx = { align = { honor = -1 } } },
        { text = "A tauren should face the beasts, whatever the odds.", next = "BACK", reply = "You're right, and I knew it when I started climbing, which is the worst part. When I'm on the ground again, I'll face them properly, though perhaps not all at once.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = {
        { id = "wy_default", text = "Taurajo needs more grazing land for the kodos, and this field has good grass and water close by. I came to look at it, and the beasts that live here made it very clear they weren't interested in sharing." },
      },
      choices = {
        { text = "So you want the field cleared for grazing.", next = "clear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    clear = {
      big = true,
      lines = {
        { id = "cl_default", text = "For grazing, and so the next tauren who walks through here doesn't end up where I am. I don't like killing beasts that are only defending their ground, but the herds have to eat. Does that sound wrong to you?" },
      },
      choices = {
        { text = "The land should be shared. Drive them off, don't slaughter them.", next = "BACK", reply = "That's what my heart says too, and the Earth Mother would like it better, I think. Drive them east toward Dustwallow, then, and let them keep their lives somewhere the kodo don't graze.", fx = { align = { order = -1 } } },
        { text = "The herds come first. The tribe needs that field.", next = "BACK", reply = "You speak like an elder, and they'd agree with you, though it sits heavy on me. The tribe must eat, so I'll clear the field, but I'll thank each beast's spirit as I do.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts = {
      lines = {
        { id = "b_default", text = "Hungry things with sharp teeth, and too many of them, all lurking in the long grass. They hunt together, so if you see one, there are three more you can't see." },
      },
      choices = {
        { text = "How many are there?", next = "pack" },
        { text = "Then I'll watch the grass.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pack = {
      lines = {
        { id = "pa_default", text = "I counted six from up here before I lost count, and there are more in the grass that I can't see. They take turns watching my tree, friend, which is very rude of them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xtell = {
      big = true,
      lines = {
        { id = "xt_default", text = "Oh, Earth Mother, please don't. They'll be telling the story at the fire for the rest of my life. What would you tell them, if they asked?" },
      },
      choices = {
        { text = "The truth. They'll laugh, but they'll stop worrying.", next = "BACK", reply = "They'll laugh until the moon rises, and then they'll be glad I'm home. I suppose that's the better trade, though I'd still rather you told it gently.", fx = { align = { honor = 1 } } },
        { text = "That you were scouting. Nobody needs to know the rest.", next = "BACK", reply = "Scouting, yes, from a very good height, with an excellent view of the boars. You're a kind friend, and I'll owe you a story of your own one day.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xbear = {
      lines = {
        { id = "xb_default", text = "Carry me? Friend, I'm a tauren, and you'd be a very flat bear. Clear the field instead, and I'll walk down on my own hooves with what dignity I have left." },
      },
      choices = {
        { text = "Fair point.", next = "BACK" },
      },
    },
    field_after = {
      lines = {
        { id = "fa_default", text = "Now I go back to Taurajo and tell them it's good grazing, and the herders bring the kodos down before the season turns. Some new beasts will wander in, of course, but the kodos can handle a few." },
      },
      choices = {
        { text = "Will you come with them?", next = "herds" },
        { text = "Something else.", next = "BACK" },
      },
    },
    herds = {
      lines = {
        { id = "he_default", text = "I will, friend, and I'll stay on the ground this time. Though I'll admit I've been eyeing this tree as a good lookout, now that I know I can climb it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    taurajo = {
      lines = {
        { id = "t_default", text = "Our camp in the southern Barrens, friend, where the herds rest on the way between Mulgore and the south. It's a good place, full of good people, and I'd very much like to be back there before supper." },
      },
      choices = {
        { text = "Who should I see there?", next = "who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who = {
      lines = {
        { id = "wh_default", text = "Everyone, really, but go to the fire first and they'll feed you. If anyone asks where I am, tell them I'm looking at grass, which is almost true." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "I'll keep your secret.", next = "END", fx = { affinity = 1 } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm from Taurajo, and I walk the plains looking for good grazing. Usually from the ground." } },
    advice = { { id = "tp_ad", text = "Never walk through long grass alone. Trust me on this one." } },
    _none = { { id = "tp_none", text = "I don't know, friend. I've been up a tree; the news hasn't reached me." } },
  },
}
