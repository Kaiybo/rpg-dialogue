-- Mourning's Rest: Marrosis, the vulture of the Wild Gods, and the restless dead. Voice: bibles/hyjal.md
local P = RPGDialogueAPI:Pack("rpgd.hyjal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "hyj_marrosis", id = TODO_NPC("Marrosis"), name = "Marrosis",
  bible = "bibles/hyjal.md", role = "questgiver", tier = "major",
  communities = { "hyjal", "wild_gods" }, temper = { "steady", "proud" }, values = { "stern", "curious" },
  notices = { "class", "race", "form", "status" },

  impression = {
    first = "Marrosis is a vulture of the Wild Gods, dry as old bone and offended, more than anything, that the dead of Mourning's Rest refuse to lie still. Under the grumbling, it seems to care a great deal about the cycle the dead are breaking.",
    third = "{name} met Marrosis, the vulture Wild God who keeps a hungry and impatient vigil over Mourning's Rest.",
  },

  greetings = {
    { id = "g_default", text = "Another living thing at Mourning's Rest. How refreshing, and how unlikely to last." },
    { id = "g_back", when = { metBefore = true }, text = "You again, still breathing. I do keep count, you know; it is a professional habit." },
    { id = "g_forsaken", when = { race = "Scourge" }, text = "Oh, wonderful. Another one that walks when it ought to be lying down." },
    { id = "g_away", when = { away = 14 }, text = "You again, and gone {away}, which by my count is long enough that I had begun to make plans for you, so this is a disappointment, though only a small one." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You have grown more formidable since you last bothered me, which means you will take longer to die and leave more behind, and I am, professionally speaking, conflicted." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Someone on the mountain was very cross with you, I hear, and cross people make careless ones, which makes more work for me, so do try to be less provoking." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "I am told someone on the mountain was delighted with you, which I find unusual, as nobody is ever delighted with me, though perhaps that is only because you are still breathing." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", place = "before", when = { race = "Scourge" },
      text = "You are dead, and you are walking, and you are talking to me, which is three things I object to. The talking I can forgive; the other two are a matter of principle." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest! Do you lay the dead to rest, or merely pray over them? I have heard both from your kind, and only one is any use to me." },
    { id = "n_shadow", cat = "form", when = { form = "shadow" },
      text = "You wrap yourself in darkness and come to a graveyard. I hope you know which side of the grave you mean to stand on." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. You leave carcasses behind you, I expect, and I thank you for it; those at least stay where they fall." },
    { id = "n_ghost", cat = "status", when = { ghost = true },
      text = "You are a spirit, wandering. Go and find your body before something here mistakes you for one of them." },
  },

  start = "hello",
  nodes = {
    dd_xarkul = {
      lines = {
        { id = "dd_xarkul_1",
          text = "Because a demon is not part of the cycle, mortal. It does not die the way a deer dies, or a soldier, or a tree; it only goes back to wherever the Legion keeps its rubbish, and what it leaves behind is poison to the ground." },
        { id = "dd_xarkul_2",
          text = "I eat what the mountain can grow back from. The fel things I leave to burn, and I am glad, very glad, when someone like you makes more of them to burn." },
      },
      choices = {
        { text = "Then I'll keep giving you demons to ignore.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Seems wasteful. A carcass is a carcass, vulture.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Marrosis.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_xarkul", when = { questDone = TODO_QUEST("Yashiro's Windwalk") },
          text = "The orc in Dae'gun tells everyone I would refuse to eat the demon you and he cut down. He's right, and I'm insulted he had to say it aloud, but you have my thanks for the killing all the same." },
        { id = "h_default", key = true,
          text = "I am Marrosis, and I clean up after death. That is the cycle: the dead fall, I eat, the ground grows green again. These undead are a blight on all of it, and I would be very glad to see them put to rest so the healing can begin." },
        { id = "h_food", when = { metBefore = true },
          text = "They are still moving, you will notice. Do you know how undignified it is to have your dinner get up and wander off? I am a vulture; I do not chase my meals." },
        { id = "h_grave", tags = { "news" }, when = { questActive = TODO_QUEST("Disturbed Grave") },
          text = "You have been digging among the graves. Mind what you turn up; not everything down there wants to be found, and some of it bites." },
        { id = "h_ring", tags = { "news" }, when = { questActive = TODO_QUEST("Belle's Ring") },
          text = "A ring, carried by one of those flayed things. Someone whose name is cut inside it was loved once, and the ring has outlasted both of them." },
        { id = "h_stolen", tags = { "news" }, when = { questActive = TODO_QUEST("Stolen Life") },
          text = "Gathering what they have stolen? Good. The life those creatures drank belongs to the ground, not to them." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = { "Forgotten Soldier", "Death Wailer", "Ravener" }, min = 20 } },
          text = "The field is quieter than it was. I have counted the bodies that stayed down, and a good many of them have your marks on them." },
        { id = "h_human", when = { race = "Human" },
          text = "A human. Some of those who walk here came from your lands, across the sea, to fight on this mountain. I am sorry, if you are the sort who minds." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Horde or Alliance, it is all the same to me in the end. You all taste of salt and iron." },
      },
      again = {
        { id = "h_again", text = "What else? Speak; the dead are not getting any fresher." },
        { id = "h_again2", text = "Another question. Very well, I have nothing else to eat at present." },
      },
      choices = {
        { text = "Why wouldn't you eat the demon?", next = "dd_xarkul", when = { questDone = TODO_QUEST("Yashiro's Windwalk") } },
        { text = "These dead were soldiers once, by the look of them.", next = "dead" },
        { text = "The dead here should not be walking.", next = "why" },
        { text = "What does a Wild God want with carrion?", next = "cycle" },
        { text = "What's this ring I found?", next = "ring", when = { any = { { questActive = TODO_QUEST("Belle's Ring") }, { questDone = TODO_QUEST("Belle's Ring") }, { questActive = TODO_QUEST("Disturbed Grave") } } } },
        { text = "I'm a priest. I can lay them to rest.", next = "xpriest", when = { class = "PRIEST" } },
        { text = "These might be my people.", next = "xhuman", when = { race = "Human" } },
        { text = "I walk too. Am I a blight?", next = "xforsaken", when = { race = "Scourge" } },
        { text = "I'll leave you to your vigil.", next = "END" },
      },
    },

    dead = {
      lines = {
        { id = "d_default", text = "Soldiers, mostly. When the Legion came up the mountain, the defenders camped here below the summit, and when the fighting reached them, they died here in great numbers. The living carried away the ones they could, and the ones they could not stayed with me." },
      },
      choices = {
        { text = "Whose soldiers?", next = "dead_whose" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead_whose = {
      lines = {
        { id = "dw_default", text = "Humans, many of them, who sailed across the sea with a sorceress at their head, and night elves, and some I could not name. They all looked much the same to me by the end, which is the one kindness death does anyone." },
      },
      choices = {
        { text = "That's a grim kind of kindness.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why = {
      lines = {
        { id = "w_default", text = "I do not know, and I am a vulture, not a scholar. The Legion's rot soaked into this ground, and the Scourge marched with the demons when they came, and either one might be to blame. I only know that the dead here are hungry, and the dead should not be hungry; that is my job. The flayed ones are the worst of them." },
      },
      choices = {
        { text = "Tell me about the flayed ones.", next = "why_raveners" },
        { text = "Does it matter who raised them?", next = "why_matter" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_raveners = {
      lines = {
        { id = "wr_default", text = "The raveners, yes, the ones with the skin peeled back. They drink the life out of whatever they catch and keep it, as though it were theirs to keep. Kill them and the life spills out again, and the ground drinks it up, and I approve." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why_matter = {
      big = true,
      lines = {
        { id = "wm_default", text = "To me? No. Dead is dead, and it should stay so, whoever stirred it. To you, perhaps; you two-legged things always want a name to blame, and you never stop at just one." },
      },
      choices = {
        { text = "It matters. Whoever did this must answer.", next = "BACK", reply = "Then go and find your name, little meat, and drag it here by the ankle if you like, but put the bodies down on your way so I can get on with my work.", fx = { align = { order = 1 } } },
        { text = "Put them down first. Blame can wait.", next = "BACK", reply = "Finally, a two-legged thing with sense, and I may even remember your smell kindly, which is the warmest thing a vulture has to give.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    cycle = {
      big = true,
      lines = {
        { id = "cy_default", text = "Everything, little meat. The wolf kills, the vulture eats, the bones go into the soil, and the soil feeds the grass that feeds the deer that feeds the wolf. Without me the world would drown in its own leftovers, and nobody thanks me for it." },
      },
      choices = {
        { text = "Then thank you. I mean that.", next = "BACK", reply = "You do, I can hear it, and it is so strange a sound that I do not know where to put it, so I will keep it with the bones I like best.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "So death feeds life. Forgive me if that's cold comfort.", next = "BACK", reply = "Cold? Nothing that feeds the grass is cold, little meat, it is only that you prefer to be on the eating end of the circle and not the eaten.", fx = { align = { light = -1 } } },
        { text = "Do the other Wild Gods respect you?", next = "cycle_gods" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cycle_gods = {
      lines = {
        { id = "cg_default", text = "The pretty ones, the stags and the birds of song, tolerate me the way you tolerate a gravedigger at a wedding. The raven at the Cradle understands me, and so do the wolves, and the rest can find their own dead." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    ring = {
      lines = {
        { id = "r_default", text = "A soldier's ring. There is a name worn half away inside it, a T and then Belle, and somebody wore it thin turning it on a finger before a battle. I find rings sentimental, and inedible." },
        { id = "r_done", when = { questDone = TODO_QUEST("Belle's Ring") }, text = "You saw the ring to wherever it needed to go. Good; one less thing on this field that remembers being loved and cannot do anything about it." },
      },
      choices = {
        { text = "Someone should know what became of him.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xpriest = {
      big = true,
      lines = {
        { id = "xp_default", text = "Then do it, and I will thank you, and I do not thank people. Your Light burns the hunger out of them, I have watched it, and what it leaves behind lies down like proper dead and waits for me." },
        { id = "xp_shadow", when = { form = "shadow" }, text = "In that shape? You will make them hungrier. Put the darkness away, priest, and bring the bright thing your kind usually carries." },
      },
      choices = {
        { text = "They deserve rest, and prayers.", next = "BACK", reply = "Pray if you must, priest, but pray quickly, because the hungry ones do not wait for the end of a hymn before they bite.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They're corpses. I'll burn them down and move on.", next = "BACK", reply = "Good, a priest who understands the work, and I will follow along behind you and tidy up what the fire leaves, which is the proper order of things.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman = {
      big = true,
      lines = {
        { id = "xh_default", text = "Some of them, very likely. They came from Lordaeron, if I understood their shouting, and they fought hard, and many of them did not go home. If you know their names, say them while you work; they seemed to like hearing them, at the end." },
      },
      choices = {
        { text = "I'll give them the rites they never got.", next = "BACK", reply = "They will like that, I think, and so will I, because the ones who are spoken for lie down much more quietly than the ones who are forgotten.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "No rites. I'll just end it quickly.", next = "BACK", reply = "Quick is kind enough, I suppose, though they shouted their names very loudly once, and it seems a pity that nobody will answer them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xforsaken = {
      big = true,
      lines = {
        { id = "xf_default", text = "You are an exception I have not decided about. You walk, but you do not drink the life out of things, and you talk instead of moaning. I will say this: when you do finally lie down, I will be very polite about it." },
      },
      choices = {
        { text = "I chose this. The dead here didn't.", next = "BACK", reply = "Chose it? Hm, that is a strange thing to choose, but I will grant you the difference, and I will keep the polite part of my promise either way.", fx = { align = { honor = 1 } } },
        { text = "Don't hold your breath, bird.", next = "BACK", reply = "Ha, I do not breathe the way you mean, bird or no bird, and I can wait far longer than you can stand, so we will see which of us is patient.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Well, now. Nobody compliments the vulture, little meat, because they save all that for the stag and the pretty birds, so I shall enjoy this for at least a century." },
        { id = "s2", text = "How very unexpected, and how agreeable. You have a kind word for the one who cleans up after everybody else, and I find my opinion of the living has improved by a feather." },
      },
      fail = {
        { id = "f1", text = "Flattery, at a graveyard, to a vulture. I have watched a great many creatures try to talk their way out of being eaten, little meat, and it has never once worked." },
        { id = "f2", text = "You needn't butter yourself on my account, because I shall get to you in the end whatever you say. Until then, I would prefer honest conversation." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! Rude, and still warm, which is a combination I rarely get to enjoy. You have more gristle in you than most who climb up here, and I mean that kindly." },
        { id = "s2", text = "Oh, I like that. The dead never answer back and the pretty gods never stoop to it, so you have no idea how long I have waited for a proper insult." },
      },
      fail = {
        { id = "f1", text = "I have been called a carrion bird since before your kingdoms had names, little meat, and it has always been true. You will have to find something that stings." },
        { id = "f2", text = "Mock away, and I shall wait. That is the whole of my craft, you see, and everything that has ever laughed at me has ended up as lunch." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "Now that is interesting. I am the thing that comes after the frightening is done, little meat, and yet you made my feathers lift, so I shall hop back a step and reconsider you." },
        { id = "s2", text = "You have the look of something that makes a great many corpses, and I have a professional respect for that. Very well, I'll mind my manners, since you are clearly good for business." },
      },
      fail = {
        { id = "f1", text = "You are threatening death's own housekeeper, little meat, and I find it rather sweet. What exactly do you imagine you could do to me that the mountain hasn't tried?" },
        { id = "f2", text = "I have perched over every battle this mountain ever saw, the last one included, and I ate well after all of them. Shout if you like, since I'm told it works up an appetite." },
      },
    },
  },

  topics = {
    _gated = {
      { id = "gt1", text = "No, little meat, I shan't tell you that. I keep some things in my crop for those I have grown fond of, and you aren't there yet." },
      { id = "gt2", text = "That is not for you, not yet. Go on breathing in my direction a while longer, and I may change my mind." },
    },
    knows = {
      { id = "tp_knows", text = "I know what dies on this mountain and where it falls. Ask me about that, and I will tell you more than you want." },
    },
    background = { { id = "tp_bg", text = "I have circled this mountain since before your kingdoms had names. My story is mostly lunch." } },
    advice = { { id = "tp_ad", text = "Do not let the wailers get close. Even I find their crying hard to bear, and I have heard every sound a dying thing can make." } },
    burning_legion = { { id = "tp_bl", text = "Demons rot badly. Even I will not touch them, and I will touch almost anything." } },
    scourge = {
      { id = "tp_scourge", text = "The Scourge are a blight on the cycle, little meat, things that should be lying down to feed the rest of us and refuse. I find them offensive on a professional level." },
      { id = "tp_scourge2", when = { race = "Scourge" }, text = "You know what I think of things that walk when they ought to be eaten, little meat. Keep your distance, and I'll keep my appetite to myself." },
    },
    forsaken = { { id = "tp_forsaken", text = "They call themselves free, and perhaps they are, but they still walk, and they still will not lie down and rot properly. I've no patience for meals with opinions." } },
    nordrassil = { { id = "tp_nordrassil", text = "The great tree has stood longer than I've circled, and I've circled a very long time. Everything dies eventually, little meat, but that one is taking its time." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "A necromancer who keeps the dead from dying properly. If I ever find him, little meat, I'll show him how the cycle is supposed to end." } },
    _none = { { id = "tp_none", text = "If it is not dead, I do not much care about it, little meat." } },
  },
}
