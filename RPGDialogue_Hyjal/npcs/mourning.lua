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
      text = "You are dead, and you are walking, and you are talking to me, which is three things I object to. At least you have the manners to talk." },
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
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Marrosis, and I clean up after death. That is the cycle: the dead fall, I eat, the ground grows green again. These undead are a blight on all of it, and I would be very glad to see them put to rest so the healing can begin." },
        { id = "h_food", when = { metBefore = true },
          text = "They are still moving, you will notice. It is a bit annoying to have my food get up and wander off; I am not in the habit of chasing down my meals." },
        { id = "h_grave", tags = { "news" }, when = { questActive = TODO_QUEST("Disturbed Grave") },
          text = "You have been digging among the graves. Mind what you turn up; not everything down there wants to be found, and some of it bites." },
        { id = "h_ring", tags = { "news" }, when = { questActive = TODO_QUEST("Belle's Ring") },
          text = "A ring, carried by one of those flayed things. Someone named on it loved someone else, and that is more than most rings can say." },
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
        { text = "It matters. Whoever did this must answer.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Put them down first. Blame can wait.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    cycle = {
      big = true,
      lines = {
        { id = "cy_default", text = "Everything, little meat. The wolf kills, the vulture eats, the bones go into the soil, and the soil feeds the grass that feeds the deer that feeds the wolf. Without me the world would drown in its own leftovers, and nobody thanks me for it." },
      },
      choices = {
        { text = "Then thank you. I mean that.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Death serves life. That's a cold comfort.", next = "BACK", fx = { align = { light = -1 } } },
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
        { id = "r_default", text = "A soldier's ring. There is a name worn half away inside it, a T and then Belle, and I expect it meant a great deal to someone who never knew where it ended up. I find rings sentimental, and inedible." },
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
        { text = "They deserve rest, and prayers.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They're corpses. I'll burn them down and move on.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuman = {
      big = true,
      lines = {
        { id = "xh_default", text = "Some of them, very likely. They came from Lordaeron, if I understood their shouting, and they fought hard, and many of them did not go home. If you know their names, say them while you work; they seemed to like hearing them, at the end." },
      },
      choices = {
        { text = "I'll give them the rites they never got.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "No rites. I'll just end it quickly.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xforsaken = {
      big = true,
      lines = {
        { id = "xf_default", text = "You are an exception I have not decided about. You walk, but you do not drink the life out of things, and you talk instead of moaning. I will say this: when you do finally lie down, I will be very polite about it." },
      },
      choices = {
        { text = "I chose this. The dead here didn't.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Don't hold your breath, bird.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
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
