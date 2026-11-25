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
    first = "He talks about taking Chol'aruk's head the way orcs talk about supper.",
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
      text = "A warrior, and you hold your weapon like you've been taught, not like a peon with a pick. Chol'aruk's cave is narrow, so you'll fit in there nicely." },
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
        { id = "ea_default", text = "Enemies, friends, their own wounded if they're hungry enough. We lost a peon on the Thorn Hill road last month, and what we found of him wasn't worth burying, so don't ask me to talk about it." },
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
    first = "He seems to find living bodies endlessly interesting.",
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
    advice = { { id = "tp_ad", text = "Keep your knees bent when you land and your head tucked when you fall. Most of the breaks I see come from forgetting one or the other." } },
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
    first = "She climbed a tree to escape the beasts and is stuck there.",
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
    background = { { id = "tp_bg", text = "I'm from Taurajo, and I walk the plains looking for good grazing, usually from the ground." } },
    advice = { { id = "tp_ad", text = "Never walk through long grass alone. Trust me on this one." } },
    _none = { { id = "tp_none", text = "I don't know, friend. I've been up a tree; the news hasn't reached me." } },
  },
}

---------------------------------------------------------------------------
-- Durotar Supply and Logistics: the Forever supply camp outside the Crossroads.
-- Crafters who sell patterns to those in good standing with the camp, a kodo handler,
-- two off-duty pack kodo, and the Steamwheedle goblins who handle the auctions and the mail.
---------------------------------------------------------------------------

-- Aza'bek: jungle troll chef; feeds the camp and the caravans.
P:NPC {
  key = "azabek", id = TODO_NPC("Aza'bek"), name = "Aza'bek", title = "Chef", gender = "female",
  role = "vendor", tier = "service",
  communities = { "crossroads" }, temper = { "jolly" }, values = { "generous" },
  notices = { "craft", "race" },
  impression = {
    first = "She tastes everything twice and laughs at anyone who winces at the pepper.",
    third = "{name} met Aza'bek, the jungle troll who cooks for the Durotar Supply and Logistics camp outside the Crossroads.",
  },
  greetings = {
    { id = "g_default", text = "Come in close, {g:mon|sister}, de pot be on and nobody leave my fire hungry." },
    { id = "g_back", when = { metBefore = true }, text = "You be back! Either de stew be good or you got nowhere else to eat, and I be happy either way." },
  },
  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You smell like woodsmoke and onions, so you be a cook too. Sit down, and tell me what you put in your stew." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear at my fire! You know what real pepper taste like, so you can tell dese orcs dey be crying for nothin'." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Aza'bek, and I cook for de whole camp, from de crafters to de kodo drivers who come in off de road with dust in deir teeth. De Supply and Logistics feed de caravans, and somebody got to feed de Supply and Logistics, ya?" },
      },
      again = {
        { id = "h_again", text = "What else you want, while de pot be bubbling?" },
        { id = "h_again2", text = "Go on, I be listening with one ear and stirring with de other." },
      },
      choices = {
        { text = "What's in the pot today?", next = "pot" },
        { text = "What is this camp, exactly?", next = "camp" },
        { text = "You're a long way from the jungle.", next = "jungle" },
        { text = "Let me see what you're selling.", next = "BUSINESS" },
        { text = "I'll come back hungry.", next = "END" },
      },
    },
    pot = {
      lines = { { id = "p_default", text = "Zhevra, plainstrider, a little kodo dat Okamache swear died of old age, and enough pepper to make a grunt see his ancestors. De orcs complain every night and dey finish it every night, so I know I be doin' it right." } },
      choices = {
        { text = "Do you cook for the tauren too?", next = "tauren" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = { { id = "t_default", text = "Pawani eat only de greens and de bread when kodo be in de pot, and I don't blame her, because dose beasts carry everything we own. So I keep a second pot for her, and she pay me in good leather aprons." } },
      choices = {
        { text = "Then cook what the tauren can eat, and spare the kodo.", next = "BACK", reply = "Dat be a kind thought, and maybe I try it one night. De orcs will riot, but dey riot every night anyway.", fx = { align = { honor = 1 } } },
        { text = "Meat's meat. A kodo that dies old should feed the camp.", next = "BACK", reply = "Dat be what I tell myself, mon, and de stew agree with me. Just don't say it where Okamache can hear you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = { { id = "c_default", text = "De Durotar Supply and Logistics, and dey move everything de Horde need from Orgrimmar down de road and out to every camp in de Barrens. De crafters here sell deir best patterns only to folk who help de camp, so if you want de good stuff, you got to earn it first." } },
      choices = {
        { text = "Who should I talk to here?", next = "who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "Gor'mak at de anvil, Jim'bek wid his needles, and Pawani wid her hides. De Forsaken lady wid de bottles, Durelle, be smarter dan all of us, and de sky-elf, Beneris, be very polite and never eat my food, which I take personal." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    jungle = {
      lines = { { id = "j_default", text = "I be from de Echo Isles, mon, where de fish jump in de pot by demselves. De Barrens be dry and flat and full of bones, but de pay be steady, and here nobody try to put a spear in me while I cook." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I don't know dat, mon, but I know de stew be ready in an hour." } },
  },
}

-- Beneris: Skyborne (Windshaper) enchanter; new to the Horde, polite and careful.
P:NPC {
  key = "beneris", id = TODO_NPC("Beneris"), name = "Beneris", title = "Enchanter", gender = "male",
  role = "vendor", tier = "service",
  communities = { "crossroads" }, temper = { "calm" }, values = { "curious" },
  notices = { "craft", "race" },
  impression = {
    first = "He speaks softly, and his eyes keep drifting to the sky as if he's listening for something.",
    third = "{name} met Beneris, a Skyborne enchanter at the Durotar Supply and Logistics camp outside the Crossroads.",
  },
  greetings = {
    { id = "g_default", text = "Well met, traveller. The wind is quiet today, which suits my work, if not my mood." },
    { id = "g_back", when = { metBefore = true }, text = "You return. I hope the road was kind, or at least not unkind." },
  },
  notice = {
    { id = "n_ench", cat = "craft", when = { profession = "Enchanting" },
      text = "You carry dust and shards like an enchanter does, in every pocket at once. Then we speak the same language, whatever our tongues." },
    { id = "n_sky", cat = "race", when = { race = "Skyborne" },
      text = "One of our own, this far from Camp Gev'rek. The Barrens has little wind to speak of, but it is good to see a familiar face under it." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "I am Beneris, and I sell the formulae the camp trusts me with to those who have helped it. Thunder Bluff vouched for my people, so I came where the Horde had need of an enchanter, and here, it seems, is where the need was." },
      },
      again = {
        { id = "h_again", text = "Is there something more you wished to ask?" },
        { id = "h_again2", text = "Go on. I am in no hurry, and neither is the dust." },
      },
      choices = {
        { text = "Who are your people?", next = "people" },
        { text = "How does an enchanter serve a supply camp?", next = "work" },
        { text = "You keep looking at the sky.", next = "sky" },
        { text = "Show me your formulae.", next = "BUSINESS" },
        { text = "Farewell, Beneris.", next = "END" },
      },
    },
    people = {
      lines = { { id = "p_default", text = "We are the Skyborne, and the Windshapers among us came to the Horde through the Earthen Ring. We owe a debt to the spirits of the wind, and they have gone quiet, so we came down to a world our ancestors left a very long time ago." } },
      choices = {
        { text = "The Horde is glad to have you.", next = "BACK", reply = "That is generous, and more than some of the grunts have said. I will try to earn it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Strangers from the sky should prove themselves before they're trusted.", next = "BACK", reply = "That is fair, and it is what I would say in your place. I am trying, one enchanted bracer at a time.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    work = {
      lines = { { id = "w_default", text = "Every blade and boot that leaves this camp goes to someone who will fight with it, and a little enchantment can be the difference between a wound and a grave. Gor'mak makes the steel, and I make it remember it was meant to protect someone." } },
      choices = {
        { text = "What does Gor'mak think of you?", next = "gormak" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gormak = {
      lines = { { id = "g_default", text = "He thinks I am too thin and too quiet, and he says so every morning. But he brings me his best work before anyone else's, so I believe that is how an orc says he is pleased." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sky = {
      lines = { { id = "s_default", text = "Do I? It is a habit, I think, from a lifetime of listening for the wind to speak. Here it only carries dust and the smell of Aza'bek's pepper, but I have not quite stopped listening." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I am afraid I know little of that. I am still learning this world's names." } },
  },
}

-- Apothecary Durelle: Forsaken alchemist of the Royal Apothecary Society, lent to the camp.
P:NPC {
  key = "apothecary_durelle", id = TODO_NPC("Apothecary Durelle"), name = "Apothecary Durelle", title = "Alchemist", gender = "female",
  role = "vendor", tier = "service",
  communities = { "crossroads" }, temper = { "cold" }, values = { "clever" },
  notices = { "craft", "race" },
  impression = {
    first = "She measures you with the same flat look she gives her reagents.",
    third = "{name} met Apothecary Durelle, a Forsaken alchemist of the Royal Apothecary Society working at the Durotar Supply and Logistics camp.",
  },
  greetings = {
    { id = "g_default", text = "Mind the bench. Some of these bottles are medicine, and some are very much not." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and still breathing, I see. The Barrens hasn't finished with you yet." },
  },
  notice = {
    { id = "n_alch", cat = "craft", when = { profession = { "Alchemy", "Herbalism" } },
      text = "Herb stains under the nails. Good, then you'll know not to touch anything on this table without asking." },
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "One of the Dark Lady's own, out here in the sun. We both look worse for it, but at least we don't sweat." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Apothecary Durelle, of the Royal Apothecary Society, lent to this dusty camp to keep the Horde's caravans in elixirs. The recipes I sell are good ones, and I sell them only to those the camp has learned to trust." },
      },
      again = {
        { id = "h_again", text = "Something else? Be quick, the distillate won't wait." },
        { id = "h_again2", text = "Go on, then. I have all the time in the world, unfortunately." },
      },
      choices = {
        { text = "Why would the Society send you here?", next = "society" },
        { text = "What do the caravans need most?", next = "caravans" },
        { text = "You don't seem to like the living much.", next = "living" },
        { text = "Show me your recipes.", next = "BUSINESS" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    society = {
      lines = { { id = "s_default", text = "The Dark Lady keeps her promises to the Horde, and this is one of them, in a bottle. The Barrens also grows a few roots that don't grow in Tirisfal, and I am not too proud to study them while I'm here." } },
      choices = {
        { text = "The Forsaken should share their craft freely with the Horde.", next = "BACK", reply = "Freely? Nothing is free, but I sell at a fair price, and that is generous enough for one of us.", fx = { align = { order = 1 } } },
        { text = "I'd keep the best recipes for Undercity, myself.", next = "BACK", reply = "So would most of the Society, and so we do. What I sell here is good, not best, and the orcs needn't know the difference.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    caravans = {
      lines = { { id = "c_default", text = "Antivenom, chiefly, because every snake and scorpid between here and Ratchet seems to want a bite of a kodo driver. After that, healing draughts, and after that, something to keep the grunts awake on the night watch." } },
      choices = {
        { text = "Does Aza'bek's cooking count as poison?", next = "azabek" },
        { text = "Something else.", next = "BACK" },
      },
    },
    azabek = {
      lines = { { id = "a_default", text = "I have tested it, out of professional curiosity, and it isn't, though the pepper would strip rust. I have no sense of taste left, so she gives me a double helping to watch me not react, and we are both entertained." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    living = {
      lines = { { id = "l_default", text = "I like them well enough, as customers. I was one of them once, in a house in Lordaeron with a garden, and I don't miss it as much as you would expect, which is the most honest thing I'll tell you today." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I don't know, and I don't intend to find out. Was there anything else?" } },
  },
}

-- Gor'mak: orc blacksmith of the camp (not the Thunder Bluff Gor'mak).
P:NPC {
  key = "gormak_dsl", id = TODO_NPC("Gor'mak"), name = "Gor'mak", title = "Blacksmith", gender = "male",
  role = "blacksmith", tier = "service",
  communities = { "crossroads" }, temper = { "gruff" }, values = { "proud" },
  notices = { "craft", "class" },
  impression = {
    first = "He doesn't stop hammering to talk, and he doesn't need to.",
    third = "{name} met Gor'mak, the orc blacksmith at the Durotar Supply and Logistics camp outside the Crossroads.",
  },
  greetings = {
    { id = "g_default", text = "Stand back from the sparks, unless you want a new scar to brag about." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Is that blade still holding its edge, or did you come to tell me it broke?" },
  },
  notice = {
    { id = "n_bs", cat = "craft", when = { profession = "Blacksmithing" },
      text = "Those are smith's hands. Good, then you'll understand why I don't give my plans to just anyone." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior, and your armour's been hit hard and patched badly. Come back when you're ready to let a real smith look at it." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Gor'mak. I make the steel that goes out of this camp on the backs of kodo, to every grunt from the Crossroads to Camp Taurajo. My plans go to those who've helped the camp, because I won't have my work made badly by strangers." },
      },
      again = {
        { id = "h_again", text = "What else? Speak up over the hammer." },
        { id = "h_again2", text = "Still here. Ask, then." },
      },
      choices = {
        { text = "Where did you learn your trade?", next = "past" },
        { text = "Why guard your plans so closely?", next = "plans" },
        { text = "The enchanter says you're fond of him.", next = "beneris" },
        { text = "Let me see your plans.", next = "BUSINESS" },
        { text = "I'll go.", next = "END" },
      },
    },
    past = {
      lines = { { id = "p_default", text = "In the camps, under human guards, mending their chains because they'd let no orc near a real forge. When Thrall broke us out I swore I'd never make another chain, and I've kept that oath, so now I make the things that keep chains off us." } },
      choices = {
        { text = "Then forge well, and let no orc wear chains again.", next = "BACK", reply = "That's the oath, and every blade I make is a piece of it. Lok'tar.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The humans earned what's coming from your steel.", next = "BACK", reply = "Some of them did, and some are dead already. The Warchief says peace, and I make steel either way.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    plans = {
      lines = { { id = "pl_default", text = "Because a bad smith with a good plan still makes a bad sword, and a grunt dies holding it. Help the camp, haul its loads and guard its roads, and I'll know you're the kind who finishes what they start." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    beneris = {
      lines = { { id = "b_default", text = "Fond? He's thin as a reed and talks to the sky. But he puts a light on my steel that makes it hold, and he never wastes my time, so I give him my best work first." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Don't know. Ask someone who isn't busy." } },
  },
}

-- Jim'bek: jungle troll tailor; vain about his cloth, cheerful.
P:NPC {
  key = "jimbek", id = TODO_NPC("Jim'bek"), name = "Jim'bek", title = "Tailor", gender = "male",
  role = "vendor", tier = "service",
  communities = { "crossroads" }, temper = { "jolly" }, values = { "proud" },
  notices = { "craft", "race" },
  impression = {
    first = "He looks your clothes over before he looks at your face.",
    third = "{name} met Jim'bek, the jungle troll tailor at the Durotar Supply and Logistics camp outside the Crossroads.",
  },
  greetings = {
    { id = "g_default", text = "Ah, look at dat stitching on you, mon. We can do better, ya, much better." },
    { id = "g_back", when = { metBefore = true }, text = "Back to Jim'bek! You finally decide to dress like you mean it?" },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "Needle calluses on de thumb! A tailor, and you still wearing dat? Shame on you, mon." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear cousin! You tell Aza'bek her pepper burn holes in my cloth, and she don't believe me." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Jim'bek, tailor to de Horde's finest, or at least to de ones who stop by dis camp. My patterns be fire and shadow and moonlight, and I sell dem to de folk who help de camp, because good cloth be wasted on bad friends." },
      },
      again = {
        { id = "h_again", text = "What else, mon? Jim'bek got time and thread." },
        { id = "h_again2", text = "Go on, ask. I be sewing while you talk." },
      },
      choices = {
        { text = "Fire and shadow? In cloth?", next = "patterns" },
        { text = "Where did you learn to sew?", next = "learn" },
        { text = "Let me see your patterns.", next = "BUSINESS" },
        { text = "I'll be going.", next = "END" },
      },
    },
    patterns = {
      lines = { { id = "p_default", text = "Ya, mon, de flame patterns hold a little fire in de weave, and de black ones drink de light. A mage wear my work and every spell come out a little hotter, and dat be worth more dan any plate armour." } },
      choices = {
        { text = "Fine cloth should go to whoever needs it, not whoever earns it.", next = "BACK", reply = "Ha! You be soft-hearted, mon, and I like dat. But de camp make de rules, not Jim'bek.", fx = { align = { order = -1 } } },
        { text = "Right. Make them earn it.", next = "BACK", reply = "Dat be de way. A cloak you earn, you take care of.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    learn = {
      lines = { { id = "l_default", text = "My mother sew nets on de Echo Isles, and nets be just cloth with big holes. I sew smaller holes, and den no holes, and den Orgrimmar start payin' me, and here I be." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Dat I don't know, mon, but I know your hem be crooked." } },
  },
}

-- Okamache: tauren kodo handler; keeps the camp's pack kodo.
P:NPC {
  key = "okamache", id = TODO_NPC("Okamache"), name = "Okamache", title = "Kodo Handler", gender = "male",
  role = "vendor", tier = "service",
  communities = { "crossroads" }, temper = { "calm" }, values = { "kind" },
  notices = { "race", "class" },
  impression = {
    first = "He talks to the kodo more gently than he talks to you, and you don't mind.",
    third = "{name} met Okamache, the tauren who handles the pack kodo of the Durotar Supply and Logistics camp.",
  },
  greetings = {
    { id = "g_default", text = "Walk slowly near the kodo, friend. They are tired, and they remember rudeness." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. The herd is well, and I hope you are too." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Sister of the plains, or brother. You will understand why I don't let the orcs shout at my kodo." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, with a beast at your side. Then you know a creature works best for someone it trusts." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "I am Okamache, and I keep the kodo that carry this camp's goods down the long roads. Every crate of steel and cloth you see here went out on a kodo's back, and came back with a kodo grumbling under it." },
      },
      again = {
        { id = "h_again", text = "What else would you know, friend?" },
        { id = "h_again2", text = "Ask. The kodo are resting, and so am I." },
      },
      choices = {
        { text = "Those two over there look idle.", next = "offduty" },
        { text = "Is it hard work for them?", next = "hard" },
        { text = "What do you sell?", next = "BUSINESS" },
        { text = "Walk with the Earth Mother.", next = "END" },
      },
    },
    offduty = {
      lines = { { id = "o_default", text = "They have earned their rest, and I will not let anyone load them until it is over. The orcs grumble that a kodo standing still is a waste, but a kodo worked to death carries nothing at all." } },
      choices = {
        { text = "Good. A beast that's rested serves longer.", next = "BACK", reply = "You understand. The Earth Mother made them patient, not endless.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The Horde needs those loads moved now, though.", next = "BACK", reply = "The Horde always needs something now. The kodo will move it tomorrow, and the day after that, because I let them rest today.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hard = {
      lines = { { id = "h2_default", text = "The road is hot and the Barrens has thieves, quilboar and centaur both, who would rather take a load than carry one. A kodo does not fear them, but it does not like them, and I like them even less." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I do not know, friend. Ask the kodo; they hear more than you'd think." } },
  },
}

-- Pawani: tauren leatherworker; practical, warm.
P:NPC {
  key = "pawani", id = TODO_NPC("Pawani"), name = "Pawani", title = "Leatherworker", gender = "female",
  role = "vendor", tier = "service",
  communities = { "crossroads" }, temper = { "calm" }, values = { "honest" },
  notices = { "craft", "class" },
  impression = {
    first = "Her hands never stop working the hide, even while she looks you in the eye.",
    third = "{name} met Pawani, the tauren leatherworker at the Durotar Supply and Logistics camp outside the Crossroads.",
  },
  greetings = {
    { id = "g_default", text = "May the eternal sun shine upon you. Mind the drying racks; they lean." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back, and your boots still hold. Good, I hoped they would." },
  },
  notice = {
    { id = "n_lw", cat = "craft", when = { profession = { "Leatherworking", "Skinning" } },
      text = "You skin cleanly, I can tell by the hides on your pack. Not many outsiders bother to honour the beast that way." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. You must forgive the racks, then; I take only what the hunters bring me, and I waste none of it." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "I am Pawani, and I work the hides the hunters bring into this camp, so that the Horde's scouts have something to wear besides dust. My best patterns I keep for those who have helped the camp; the rest of my work I share with anyone." },
      },
      again = {
        { id = "h_again", text = "What else would you ask, traveller?" },
        { id = "h_again2", text = "Ask, then. The hide won't mind waiting." },
      },
      choices = {
        { text = "Whose hides do you work?", next = "hides" },
        { text = "Aza'bek says you won't eat her kodo stew.", next = "stew" },
        { text = "Show me your patterns.", next = "BUSINESS" },
        { text = "Earth Mother keep you.", next = "END" },
      },
    },
    hides = {
      lines = { { id = "hi_default", text = "Zhevra, thunder lizard and plainstrider, mostly, and the odd raptor when the hunters are brave. Every hide was a life, so I say a word for each before the blade goes in, and I make sure none of it is wasted." } },
      choices = {
        { text = "That's the right way to treat the hunt.", next = "BACK", reply = "It is the only way I know. Thank you for seeing it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A hide is a hide. The beast doesn't care anymore.", next = "BACK", reply = "Perhaps not, but I do, and the hide is better for it. Careless hands make careless leather.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stew = {
      lines = { { id = "s_default", text = "She speaks the truth. The kodo have carried my people since the first tauren walked the plains, and I cannot eat one, even an old one. Aza'bek keeps a pot of greens for me, and I make her aprons, and that is a fair trade between friends." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "That I cannot answer, traveller. Ask the wind; it travels farther than I do." } },
  },
}

-- Off-Duty Pack Kodo: a pair of resting kodo. Short.
P:NPC {
  key = "offduty_pack_kodo", id = TODO_NPC("Off-Duty Pack Kodo"), name = "Off-Duty Pack Kodo",
  role = "creature", tier = "service",
  communities = { "crossroads" },
  greetings = {
    { id = "g_default", text = "The kodo chews slowly and regards you with deep, unbothered patience." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "The kodo lets out a long, rumbling sigh and shifts its weight off one sore foot. There are pale marks on its back where the pack straps sit, and it clearly has no plans to wear them today." },
      },
      choices = {
        { text = "Scratch it behind the horn.", next = "scratch" },
        { text = "Leave it to its rest.", next = "END" },
      },
    },
    scratch = {
      lines = { { id = "s_default", text = "The kodo leans its enormous head into your hand until you nearly fall over, then rumbles contentedly. Across the camp, Okamache looks up, sees what you're doing and nods." } },
      choices = { { text = "Good kodo.", next = "END", fx = { affinity = 1 } } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "The kodo blinks at you, chews, and says nothing at all." } },
  },
}

-- Auctioneer Quickcoin (Crossroads): Booty Bay auctioneer, guarded by Bruisers; also at Three Corners.
P:NPC {
  key = "quickcoin_xroads", id = TODO_NPC("Auctioneer Quickcoin"), name = "Auctioneer Quickcoin", gender = "male",
  role = "vendor", tier = "service",
  communities = { "crossroads" }, temper = { "greedy" }, values = { "clever" },
  notices = { "race" },
  impression = {
    first = "He talks fast enough that you check your coin purse afterward.",
    third = "{name} met Auctioneer Quickcoin, the goblin who runs auctions at the Durotar Supply and Logistics camp and at Three Corners in Redridge.",
  },
  greetings = {
    { id = "g_default", text = "Buyin' or sellin', friend? Either way the house takes a little, and the house is me." },
    { id = "g_back", when = { metBefore = true }, text = "My favourite customer, or my fourth favourite, which is still very good, pal." },
  },
  notice = {
    { id = "n_goblin", cat = "race", when = { race = "Goblin" },
      text = "A fellow businessman! Don't even think about undercuttin' me, sweetheart, I know all the tricks because I invented half of 'em." },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Quickcoin, auctioneer, Booty Bay licensed and bonded, and the two big fellas behind me are Bruisers, so let's all keep it friendly. I run the bids here for the Horde and up at Three Corners in Redridge for the other lot, and coin's the same color in both places." },
      },
      again = {
        { id = "h_again", text = "What else, pal? Time is money, and you're spendin' mine." },
        { id = "h_again2", text = "Go on, go on, I'm listenin' and countin' at the same time." },
      },
      choices = {
        { text = "You sell to the Alliance too?", next = "both" },
        { text = "Why set up out here, of all places?", next = "why" },
        { text = "Let's see the auctions.", next = "BUSINESS" },
        { text = "Not today.", next = "END" },
      },
    },
    both = {
      lines = { { id = "b_default", text = "Sure I do, the Cartel's neutral, and neutral means everybody's money spends. The Bruisers make sure nobody settles their war on my counter, and the fee's the same no matter what color your tabard is." } },
      choices = {
        { text = "Profiting from both sides of a war is low, goblin.", next = "BACK", reply = "Low? It's a business model, pal, and it keeps the swords sharp on both sides. Nobody's complainin' when they win the bid.", fx = { align = { honor = 1 } } },
        { text = "Smart. Gold doesn't care who carried it.", next = "BACK", reply = "Now you're talkin' my language, friend! I'd hire you, if I paid anybody.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because the Supply and Logistics folks move a mountain of goods through here, and goods that move need prices. Everybody's comin' up from Ratchet and down from Orgrimmar anyway, so I'm just standin' where the money walks past." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "Don't know, don't care, unless there's a percentage in it." } },
  },
}

-- Steamwheedle Courier (Crossroads): Cartel mail-runner for the camp; also at Three Corners.
P:NPC {
  key = "sw_courier_xroads", id = TODO_NPC("Steamwheedle Courier"), name = "Steamwheedle Courier", gender = "male",
  role = "worker", tier = "service",
  communities = { "crossroads" }, temper = { "harried" }, values = { "diligent" },
  greetings = {
    { id = "g_default", text = "Mail's in, mail's out, sign here, no, there, the other there, thanks, pal." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Got somethin' to send, or are ya just makin' me nervous?" },
  },
  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "Steamwheedle Courier, and I carry the camp's letters and parcels for a reasonable fee, which is to say a fee. Your post goes out to anybody's mailbox, and if a parcel blows up on the way, that's covered in the small print, so read the small print." },
      },
      again = {
        { id = "h_again", text = "Anything else? I got a bag full of somebody's socks to deliver." },
      },
      choices = {
        { text = "Does the mail ever blow up?", next = "boom" },
        { text = "I'll send something.", next = "BUSINESS" },
        { text = "Never mind.", next = "END" },
      },
    },
    boom = {
      lines = { { id = "b_default", text = "Only the gnome stuff, mostly, and one time a crate of somebody's fireworks that my cousin was sittin' on. He's fine, his eyebrows came back, and the sender got billed for the eyebrows." } },
      choices = {
        { text = "Then charge them extra. Danger costs.", next = "BACK", reply = "Hazard surcharge, now that's a smart idea, friend! I'll pitch it to the boss and take the credit.", fx = { align = { order = -1 } } },
        { text = "The rules are the rules. Deliver it like any parcel.", next = "BACK", reply = "That's the Cartel way, sure, and the Cartel pays my wages. Fine, fine, but I'm holdin' it at arm's length.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "No idea, pal, I just carry the bags. Ask the auctioneer, he knows everything with a price on it." } },
  },
}
