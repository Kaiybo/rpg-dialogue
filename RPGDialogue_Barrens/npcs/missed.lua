-- Barrens folk the roster scan found missing, part one: Camp Taurajo's Gahroot (butcher), Kelsuwa (stable
-- master) and Sanuye Runetotem (leather armor); Brine (Call of Water) in the southern hills; Takar the Seer
-- (the Alliance warlocks' seer, camped east of Taurajo); Vrang Wildgore (smith and trapper north-west of
-- Dreadmist Peak); Lanti'gah at Regthar's bunker; Jorb, Lizzarik's ogre; and Pilot Wizzlecrank of the
-- Sludge Fen shredder. Voices: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Brine: orc shaman alone in the southern Barrens hills; Call of Water.
P:NPC {
  key = "brine", id = TODO_NPC("Brine"), name = "Brine", gender = "female",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "taurajo" }, temper = { "still", "searching" }, values = { "water", "hope" },
  notices = { "class" },
  impression = {
    first = "Brine is an orc shaman who lives by herself on a hill in the south of the Barrens, with quilboar country all around her. She studies water in a land that has almost none, and she asks every visitor why they have come before she tells them anything.",
    third = "{name} met Brine, an orc shaman of the southern Barrens who guides young shaman toward the spirit of water.",
  },
  greetings = {
    { id = "g_default", text = "You climbed a long way to find one orc on a hill, {class}. Tell me why, and tell it truly, because I'll know if you don't." },
    { id = "g_shaman", when = { class = "SHAMAN" }, text = "A shaman on my hill, and thirsty for more than drink. Islen sends them to me when they're ready, so we'll see whether she judged you well." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back up the hill. The water said you would, though it doesn't always say when." },
  },
  notice = {
    { id = "n_troll", cat = "class", when = { race = "Troll" },
      text = "A Darkspear, born with the sea on every side. You'll find it strange that I look for water here, and some days so do I." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_call", when = { questActive = TODO_QUEST("Call of Water") },
          text = "Islen Waterseer sent you from her shore, so you already know that water gives life back and that fouled water takes it. What you don't know yet is how far you'll walk to learn the rest." },
        { id = "h_default", text = "I am Brine. I came to the driest place I could find to learn about water, because you only understand a thing properly when you've had to go without it." },
      },
      again = {
        { id = "h_again", text = "Ask what else you carried up the hill with you." },
        { id = "h_again2", text = "Go on. I've nothing but time and a little water." },
      },
      choices = {
        { text = "Why study water where there is none?", next = "dry" },
        { text = "Aren't you afraid, alone among the quilboar?", next = "alone" },
        { text = "You said hope. What do you hope for?", next = "hope" },
        { text = "What must I do to hear the water?", next = "task", when = { class = "SHAMAN" } },
        { text = "I'll go back down the hill.", next = "END" },
      },
    },
    dry = {
      lines = { { id = "d_default", text = "There is some, and that's the lesson. The oases north of here are green in the middle of dust, and every beast in the Barrens knows the way to them, so tell me which is stronger, the dust or the water.", fx = { learn = { "oases" } } } },
      choices = {
        { text = "The water, since everything walks to it.", next = "dry2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dry2 = {
      lines = { { id = "d2_default", text = "Good, and you answered without stopping to think, which is how I know you believe it. Fire and earth announce themselves, {class}, but water wins by being needed, and that's a quieter sort of power than most orcs are taught to respect." } },
      choices = {
        { text = "Is that why so few orcs follow it?", next = "dry3" },
        { text = "Something else, Brine.", next = "BACK" },
      },
    },
    dry3 = {
      lines = { { id = "d3_default", text = "Our people chose fire once, the worst sort, and it burned us hollow. I think the Horde needs shaman who know how to mend more than it needs ones who know how to scorch, though I wouldn't say so in front of Kranal Fiss." } },
      choices = { { text = "I won't repeat it to him. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    alone = {
      lines = { { id = "a_default", text = "The Bristlebacks know I'm here, and they leave me be, for the most part. A quilboar respects a shaman even when it's the wrong sort of shaman, and I've made it plain that this hill would be costly to take.", fx = { learn = { "quilboar" } } } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hope = {
      lines = { { id = "ho_default", text = "When I was small, someone told me that even in the worst pain there is a sliver of hope, some small thing a person can rally to. I've come to think that for our people the small thing was water, the first clean drink after the camps." } },
      choices = { { text = "That's worth climbing a hill for. Something else.", next = "BACK" } },
    },
    task = {
      lines = { { id = "t_default", text = "You'll carry water for me, from three places that are a long way apart. The first is the old well below this hill, and after that the spirits will send you north to Ashenvale and then across the sea to Tarren Mill." } },
      choices = {
        { text = "Why those three, and not any water?", next = "task2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    task2 = {
      lines = { { id = "t2_default", text = "Because each has kept itself pure with ruin all around it, and you need to taste what that's like before Islen sends you to water that hasn't. Bring them all back to her, and don't spill any on the road." } },
      choices = { { text = "I'll carry them carefully. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I left Orgrimmar to learn the one element nobody there had time for. That's all there is to tell, and the rest is water." } },
    oases = { { id = "tp_oa", text = "The oases are the Barrens' heart, and something has been troubling them lately. The water tastes of it." } },
    quilboar = { { id = "tp_qb", text = "They pray to their own spirits in the thorns below me. I don't love them, but I'd be lying if I said they had no faith." } },
    _none = { { id = "tp_none", text = "The water hasn't told me anything of that, {class}, and I don't hear much else up here." } },
  },
}

-- Takar the Seer: human seer camped east of Camp Taurajo; Alliance warlocks' succubus quest.
P:NPC {
  key = "takar", id = TODO_NPC("Takar the Seer"), name = "Takar the Seer", gender = "male",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = {}, temper = { "serene", "odd" }, values = { "sight", "solitude" },
  notices = { "class" },
  impression = {
    first = "Takar the Seer is a human who keeps a small camp alone in the grass east of Camp Taurajo, a long way from any Alliance wall. He speaks to visitors as though he had already had the conversation once, and is being polite about hearing it again.",
    third = "{name} met Takar the Seer, a human hermit in the southern Barrens who looks through time for those who ask.",
  },
  greetings = {
    { id = "g_default", text = "There you are, {class}. I put the kettle on a little early, I'm afraid, but you've made good time across the grass." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "Was the crossing hard, warlock? You've come a long way from the cellar under the Slaughtered Lamb, and I know who sent you and what you're after." },
    { id = "g_horde", when = { faction = "Horde" }, text = "You may stand by the fire, but I'll ask you to keep your hands where I can see them. I've watched what your people do to lone travellers, and I'd rather not watch it twice." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, just as I thought you'd be. Do sit down, since the hyenas rarely trouble this fire." },
  },
  notice = {
    { id = "n_nelf", cat = "class", when = { race = "NightElf" },
      text = "One of the kaldorei, out here in the open sun. I've looked at a great deal of your people's past, and I hope you'll forgive the intrusion." },
    { id = "n_succ", cat = "class", when = { class = "WARLOCK", pet = { family = "Succubus" } },
      text = "So you bound her after all, and she's watching me as if I were a door she hasn't found the key to yet. Keep her on your side of the fire, if you would." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_devourer", when = { questActive = TODO_QUEST("Devourer of Souls") },
          text = "Gakin was wise to send you to me, and don't fear, because I can help. You need a symbol of love to tempt the creature you mean to bind, and I've looked across the world for one on your behalf." },
        { id = "h_heartswood", tags = { "news" }, when = { questActive = TODO_QUEST("Heartswood") },
          text = "You haven't been to Ordil'Aran yet, I can see it on your boots. The heartswood is waiting where the two lovers fell, in the north-west of Ashenvale, and it has been waiting a good deal longer than you have." },
        { id = "h_love", tags = { "news" }, when = { questActive = TODO_QUEST("What Is Love?") },
          text = "You have the heartswood, and it's warm in your pack, isn't it? It will stay warm for a long while yet, and that is the very thing the demon will want from it." },
        { id = "h_bound", when = { class = "WARLOCK", pet = { family = "Succubus" } },
          text = "I watched you bind her a dozen times before you ever came to me, and in most of those you kept your head. I'm glad to see this was one of them." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "I am Takar, and I am no use to the Horde, I'm afraid. The water shows me more of your people's past than I'd like, so say what you came to say and I'll answer what I can." },
        { id = "h_default", text = "I am Takar, and people call me a seer, which is near enough. I look over the world and back through the mists of its years, and now and then somebody crosses an ocean to ask me what I saw." },
      },
      again = {
        { id = "h_again", text = "Yes, I thought you'd ask something more. Go on, the kettle's barely warm." },
        { id = "h_again2", text = "Ask away, {class}, and I'll try to look surprised at the question." },
        { id = "h_again3", when = { class = "WARLOCK" }, text = "There's more you want to know about her, I expect. Every one of Gakin's students asks the same three things, though not always in the same order." },
      },
      choices = {
        { text = "Why would a seer live out here, among the Horde?", next = "why" },
        { text = "What do you see when you look?", next = "see" },
        { text = "The tauren camp is close. Do they trouble you?", next = "tauren" },
        { text = "Where is this symbol of love?", next = "heart", when = { questActive = TODO_QUEST("Devourer of Souls") } },
        { text = "What do you know of my craft, Seer? Speak plainly.", next = "craft", when = { class = "WARLOCK" } },
        { text = "What has love to do with binding a demon?", next = "love", when = { class = "WARLOCK" } },
        { text = "My voidwalker won't come near your fire.", next = "void", when = { class = "WARLOCK", pet = { family = "Voidwalker" } } },
        { text = "You help warlocks call up demons, seer?", next = "light", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "You're a long way from your own people, human.", next = "horde", when = { faction = "Horde" } },
        { text = "I'll leave you to your fire.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because a city is terribly loud to a man with my sort of ears. In Stormwind I saw every stone's whole history every time I crossed the street, and here there's only grass, which remembers very little and says less." } },
      choices = {
        { text = "Don't your friends want you back?", next = "why2" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    why2 = {
      lines = { { id = "w2_default", text = "Gakin writes now and then to say I ought to come back to civilisation, as he puts it. I always mean to answer, and then I look ahead and see that I didn't, so I save myself the ink." } },
      choices = {
        { text = "That's one way to keep up a friendship.", next = "BACK", fx = { affinity = 1 } },
        { text = "You could still surprise yourself and write.", next = "BACK", reply = "I could, and once or twice I've seen myself do it. He never writes back about those letters, which tells me something about my handwriting." },
      },
    },
    see = {
      lines = { { id = "s_default", text = "Whatever I turn toward, though the old things are clearest, because they've stopped moving. I've watched the War of the Ancients more times than I'd like, and it doesn't get any easier to see how it ends for most of them." } },
      choices = {
        { text = "And the future?", next = "see2" },
        { text = "Back to the matter at hand, then.", next = "BACK" },
      },
    },
    see2 = {
      lines = { { id = "s2_default", text = "The future is mist with shapes in it, and I've learned not to describe the shapes. A man who is told what's coming walks straight into it trying to get out of the way, and I've enough on my conscience already." } },
      choices = {
        { text = "You must have seen something of mine.", next = "see3" },
        { text = "Then I won't ask. Something else, Takar.", next = "BACK" },
      },
    },
    see3 = {
      lines = {
        { id = "s3_default", text = "I saw you arrive, and I saw you leave again on your own feet, which is more than I see for many who come this way. You'll have to be content with that, {class}, and so will I." },
        { id = "s3_lock", when = { class = "WARLOCK" }, text = "I saw you leave on your own feet, and something walking a step behind you that wasn't there when you came. You'll have to be content with that, warlock, because I've said more than I meant to already." },
      },
      choices = { { text = "On my own feet will do. What else is there?", next = "BACK" } },
    },
    tauren = {
      lines = { { id = "t_default", text = "They come to the edge of the firelight, look at me for a while, and go away again. I think they've decided a lone old man talking to the air is more likely holy than dangerous, and I've done nothing to correct them." } },
      choices = {
        { text = "Are you holy, or dangerous?", next = "tauren2" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    tauren2 = {
      lines = { { id = "t2_default", text = "Neither, I'm afraid, only old and a little tired of looking. Their seers on the mesa at Thunder Bluff would understand me better than mine ever did, but I've never quite worked up the courage to walk there." } },
      choices = { { text = "Perhaps one day you'll see yourself go.", next = "BACK", fx = { affinity = 1 } } },
    },
    heart = {
      narr = "He tips the kettle and watches the steam as if it were writing something.",
      lines = { { id = "h2_default", text = "Long ago two elven lovers fought the Legion side by side, and they died within a breath of each other on the same ground. A tree grew where they fell, which the elves call the heartswood, and you'll find it in the ruins of Ordil'Aran in the north-west of Ashenvale." } },
      choices = {
        { text = "It seems a poor use for such a thing.", next = "heart2" },
        { text = "Ashenvale's a long walk. What guards the ruins?", next = "heart3" },
        { text = "I'll find it. Let me ask something else first.", next = "BACK" },
      },
    },
    heart2 = {
      big = true,
      lines = { { id = "h3_default", text = "It is, and I'm glad that it troubles you, because a warlock it didn't trouble is one I'd not have helped. The demon you're after feeds on exactly this, so see that you remain the one holding the bait." } },
      choices = {
        { text = "The lovers are long dead. Their tree can serve the living.", next = "BACK", reply = "That's very nearly what Gakin said, and he's lived a long while on that sort of sense. I only hope the tree sees it the same way.", fx = { align = { light = -1 } } },
        { text = "I'll take only what I need, and leave the rest of the tree.", next = "BACK", reply = "Then you'll come back from Ordil'Aran a little better than you went, which is rare for that errand. I've watched worse students take an axe to the whole trunk.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll remember who holds the bait. Something else.", next = "BACK" },
      },
    },
    heart3 = {
      lines = { { id = "h4_default", text = "Nothing that loves you, I'm afraid, because the Legion left more than a tree behind in that part of the forest. Go carefully among the stones, and if the night elves ask your business, tell them the truth, since they'll know if you don't." } },
      choices = { { text = "The truth, then. What else should I know?", next = "BACK" } },
    },
    love = {
      lines = {
        { id = "lv_default", text = "Everything, which is why it works. A succubus doesn't want your blood or your soul to begin with; she wants to be wanted, and she'll take whatever you give her and call it her due." },
        { id = "lv_low", when = { class = "WARLOCK", maxLevel = 17 }, text = "Everything, though you'll not need to know it for a little while yet. A succubus wants to be wanted, and Gakin won't send you to me until he thinks you can be wanted and still say no." },
      },
      choices = {
        { text = "So the heartswood is a lure.", next = "love2" },
        { text = "I've no plans to be tempted by a demon.", next = "love2", fx = { trait = { proud = 1 } } },
        { text = "Back to the lessons, then.", next = "BACK" },
      },
    },
    love2 = {
      lines = { { id = "lv2_default", text = "It's a lure, and it's also a mirror, because she'll show you what you most want to see in it. I've watched a hundred students bind her, and the ones who fail aren't the weak ones, they're the lonely ones." } },
      choices = {
        { text = "And which am I, Takar?", next = "love3" },
        { text = "I'll keep that in mind. Something else.", next = "BACK" },
      },
    },
    love3 = {
      big = true,
      lines = {
        { id = "lv3_default", text = "That's for you to say, not me, and I'd rather you said it to me here than to her later. So tell me, what do you think you'll do when she asks for something you'd like to give?" },
        { id = "lv3_human", when = { race = "Human" }, text = "You're from Stormwind, and you've likely left someone there who doesn't write either. Tell me, what will you do when she wears that someone's face and asks you nicely?" },
      },
      choices = {
        { text = "Refuse her, every time, and make her hate me for it.", next = "BACK", reply = "Good, though she'll hate you either way, and it's better to be hated for the right reason. Gakin will be pleased, and you may tell him I said so.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Give her a little, so she works harder for more.", next = "BACK", reply = "Some do it that way, and a few even last. I've seen how it ends for the rest, though, so forgive me if I don't wish you luck with it.", fx = { align = { order = -1 } } },
        { text = "I don't know yet. That's honest, at least.", next = "BACK", reply = "It's honest, and it's the best answer I've heard this year. Keep not knowing a while longer, and keep looking hard at her.", fx = { trait = { cautious = 1 } } },
      },
    },
    craft = {
      lines = { { id = "c_default", text = "Enough to know that those who practise it rarely grow old, and that Gakin has managed to, which is why I trust his students more than most. He teaches them to be afraid at the proper moments." } },
      choices = {
        { text = "You've seen warlocks in the past, too.", next = "craft2" },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    craft2 = {
      lines = {
        { id = "c2_default", text = "I've seen Gul'dan in the water more than once, bent over his books while the orc clans burned for him, and I'd rather not see him again. Your art is the same art, and the only difference I can find is what each of you is willing to burn." },
        { id = "c2_orc", when = { race = "Orc" }, text = "I've seen Gul'dan in the water more than once, bent over his books while your clans burned for him, and I'd rather not see him again. I won't pretend to know what it's like to carry that blood, {class}, but I've seen what it cost." },
      },
      choices = {
        { text = "I'll burn nothing that isn't mine to burn.", next = "BACK", fx = { affinity = 1 } },
        { text = "Gul'dan was a fool. I'm not.", next = "BACK", reply = "He thought the same of the warlocks before him, I'm sorry to say. I've watched him think it.", fx = { trait = { proud = 1 } } },
      },
    },
    void = {
      lines = { { id = "vd_default", text = "No, it won't, because it can feel me looking at where it came from, and nothing out of the Void likes to be looked at. Give it a moment and it will drift back to you, sulking in the way they do." } },
      choices = { { text = "It sulks often enough. What else is there?", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    light = {
      big = true,
      lines = { { id = "li_default", text = "I help Gakin's students go about it carefully, which isn't quite the same thing. They'd do it anyway, you understand, and a warlock who knows what he's reaching for comes home more often than one who guesses." } },
      choices = {
        { text = "Then you're as guilty as they are.", next = "BACK", reply = "Perhaps I am, and I've seen the reckoning for it more than once, though I'll not tell you how it goes. I find I can live with it, which may be the worst thing about me.", fx = { align = { light = 1 } } },
        { text = "Better a careful warlock than a reckless one.", next = "BACK", reply = "That's my whole defence, and I'm relieved to hear it from someone with the Light on them. I'll sleep a little easier tonight.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, seer.", next = "BACK" },
      },
    },
    horde = {
      lines = { { id = "ho_default", text = "I am, and I chose to be, so there's no need to remind me. Your braves haven't harmed me yet, and I haven't given them a reason, and I'd like us both to go on that way." } },
      choices = {
        { text = "No one here will harm you, old man.", next = "BACK", fx = { affinity = 1 } },
        { text = "Then I'll leave you to your fire.", next = "END" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was a man of Stormwind once, and I left when the seeing grew too loud. I'd rather not say more, and I know already that you won't press me." } },
    burning_legion = { { id = "tp_legion", text = "I've watched it come to this world in the water, once at the Well of Eternity and once at Hyjal, and either time was more than enough. Ask Gakin about it, since he looks at it from much closer than I'd care to." } },
    _none = { { id = "tp_none", text = "I haven't looked that way, {class}, and I'd rather not guess. Guessing is how seers get a bad name." } },
  },
}

-- Vrang Wildgore: weaponsmith, armorcrafter and trapper camped north-west of Dreadmist Peak; a bad leg.
P:NPC {
  key = "vrang", id = TODO_NPC("Vrang Wildgore"), name = "Vrang Wildgore", title = "Weaponsmith & Armorcrafter", gender = "male",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = {}, temper = { "proud", "sore" }, values = { "self_reliance", "word" },
  notices = { "soldier" },
  impression = {
    first = "Vrang Wildgore keeps a camp north-west of Dreadmist Peak, where he sells arms and armor and sets his own traps for supper. His leg is bound and stiff, and it clearly galls him to ask anyone for anything.",
    third = "{name} met Vrang Wildgore, a smith and trapper camped north-west of Dreadmist Peak, laid up with a wounded leg.",
  },
  greetings = {
    { id = "g_default", text = "Hail, {class}. I'd stand to greet you properly, but this cursed leg has other ideas today." },
    { id = "g_war", when = { class = "WARRIOR" }, text = "A warrior, and with a sword arm that looks as if it's been used. I may have steel worth your coin, and I may have work for you as well." },
    { id = "g_back", when = { metBefore = true }, text = "You again. The leg is no better, since I can see you looking at it." },
  },
  notice = {
    { id = "n_hunter", cat = "soldier", when = { class = "HUNTER" },
      text = "A hunter, and one who knows a snare from a deadfall, I'd wager. My traps are strewn all over the valley below, so mind you don't step in them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_tanner_done", when = { questDone = TODO_QUEST("The Hermit Tanner") },
          text = "The hides reached the ridge, so I've kept my word for another season, and I owe that to you. It doesn't sit easily with me, {class}, but I'll say it plainly all the same." },
        { id = "h_hides", when = { questActive = TODO_QUEST("Bruised Pride and Lion Hides") },
          text = "How goes the hunt? The matriarchs and patriarchs carry the best hides, and I need six of them without a spear hole through the middle." },
        { id = "h_default", text = "I'm Vrang Wildgore. I forge what I sell, I trap what I eat, and I've never owed anyone a thing, until a savannah lion opened my leg and made a liar of me." },
      },
      again = {
        { id = "h_again", text = "What else? Sit, if you're staying, so I needn't look up." },
        { id = "h_again2", text = "Go on, {class}." },
      },
      choices = {
        { text = "What happened to your leg?", next = "leg" },
        { text = "Why camp out here, away from the Crossroads?", next = "camp" },
        { text = "Who are the lion hides for?", next = "tanner" },
        { text = "What steel would you put in a warrior's hand?", next = "steel", when = { class = "WARRIOR" } },
        { text = "Rest that leg, Vrang.", next = "END" },
      },
    },
    leg = {
      lines = { { id = "l_default", text = "I went after a patriarch for his hide, and I was thinking about the hide and not about his mate. She came out of the grass on my blind side, and I got the worst of it before I got my axe round." } },
      choices = {
        { text = "It stings to ask a stranger for help, I'd guess.", next = "pride" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pride = {
      lines = { { id = "p_default", text = "More than the leg does. But I have obligations, and an orc who lets his word fail to spare his pride has kept the wrong one of the two." } },
      choices = { { text = "That's the right one to keep. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    camp = {
      lines = { { id = "c_default", text = "The Crossroads has smiths enough, and walls, and too many people telling each other what to do. Out here there's game in the valley and nobody to answer to, though I'll grant the warlocks up on Dreadmist Peak are poor neighbours.", fx = { learn = { "burning_blade" } } } },
      choices = {
        { text = "What do you catch in your traps?", next = "traps" },
        { text = "Something else.", next = "BACK" },
      },
    },
    traps = {
      lines = { { id = "t_default", text = "Hares and prairie fowl, and now and then a young strider that should have known better. I can't walk the line with this leg, so whatever's been caught is sitting there for the hyenas unless somebody fetches it in." } },
      choices = { { text = "Something else, Vrang.", next = "BACK" } },
    },
    tanner = {
      lines = { { id = "ta_default", text = "They go to a tanner I trade with, who cures them and sends me finished leather for my armor work. He's a hermit, and he lives alone on top of the ridge behind my camp, looking out over the Dry Hills." } },
      choices = {
        { text = "What sort of hermit?", next = "tanner2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tanner2 = {
      lines = { { id = "ta2_default", text = "The sort whose looks will give you a start, so I'll warn you now and you needn't reach for your weapon. Whatever he seems to be, he's dealt honestly with me for years and he's a threat to nobody, and I'll swear to that." } },
      choices = {
        { text = "You trust him that far?", next = "tanner3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tanner3 = {
      lines = { { id = "ta3_default", text = "I trust anyone who has never come up short on a bargain, whatever face he wears. There are orcs in Orgrimmar I couldn't say as much for." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    steel = {
      lines = { { id = "s_default", text = "For this country, a broadsword and a good coat of scale. The quilboar jab low and the centaur strike from above, so you want something quick in the hand and something solid over the hips and thighs." } },
      choices = { { text = "Sound counsel. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I learned the forge young and the snare younger. Between them I've never needed a village, and I mean to keep it so once this leg knits." } },
    burning_blade = { { id = "tp_bb", text = "Robed fools on Dreadmist Peak, chanting at night. They leave my camp alone, and I've an axe by the bed in case they stop." } },
    _none = { { id = "tp_none", text = "News doesn't climb up to my camp, {class}. Ask at the Crossroads, where they have more of it than they need." } },
  },
}

-- Lanti'gah: keeps Regthar Deathgate's bunker west of the Crossroads. (Orc peon per the wiki and the vanilla archive.)
P:NPC {
  key = "lantigah", id = TODO_NPC("Lanti'gah"), name = "Lanti'gah", gender = "male",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "crossroads" }, temper = { "sharp", "grumbling" }, values = { "watchfulness", "mercy" },
  notices = { "soldier" },
  impression = {
    first = "Lanti'gah keeps Regthar Deathgate's bunker in order, a lean orc peon with a sharp tongue who walks the perimeter and complains about the pigs. No centaur has ever reached the door on his watch, and he will tell you so.",
    third = "{name} met Lanti'gah, the orc peon who keeps Regthar Deathgate's bunker and watches the Kolkar.",
  },
  greetings = {
    { id = "g_default", text = "Wipe your feet, {class}. This is a bunker, I know, but somebody has to sweep it, and that somebody is me." },
    { id = "g_counter", when = { questActive = TODO_QUEST("Counterattack!") }, text = "Keep counting, {class}, you're only halfway there. The Kolkar got plenty more where those came from." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Regthar's in a mood, so nothing has changed since you left." },
  },
  notice = {
    { id = "n_troll", cat = "soldier", when = { race = "Troll" },
      text = "A Darkspear, good. You lot laugh at my jokes, which is more than Regthar's grunts ever do." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Lanti'gah, and I keep this hole in the ground standing while Regthar goes out and shouts at centaur. I mind the stores, I walk the line at night, and I feed those pigs, which nobody thanks me for." } },
      again = {
        { id = "h_again", text = "What else? I've a perimeter to walk." },
        { id = "h_again2", text = "Go on, I'm listening with one ear." },
      },
      choices = {
        { text = "What's wrong with the pigs?", next = "pigs" },
        { text = "How close do the Kolkar come?", next = "kolkar" },
        { text = "Regthar says you'd spare the centaur who run.", next = "spare" },
        { text = "Why do you stay with Regthar?", next = "ystay" },
        { text = "Which pig opens the gate?", next = "ypig" },
        { text = "What do you think of the Kolkar khans?", next = "ykhans" },
        { text = "What do the Darkspear here do for fun?", next = "ytroll" },
        { text = "Keep the door shut, Lanti'gah.", next = "END" },
      },
    },
    pigs = {
      lines = { { id = "p_default", text = "They scream at dawn, they eat the stores if I turn my back, and one of them has learned to open the gate. Regthar says they feed his scouts, and that's true, but he don't have to sleep downwind." } },
      choices = { { text = "A pig that opens gates? Something else.", next = "BACK" } },
    },
    kolkar = {
      lines = { { id = "k_default", text = "Close enough that I hear their hooves when the wind is from the west. They come in out of the Forgotten Pools and down from the hills, and their khans keep sending them because a centaur would sooner die than be called slow.", fx = { learn = { "centaur" } } } },
      choices = {
        { text = "And none has reached the bunker?", next = "kolkar2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kolkar2 = {
      lines = { { id = "k2_default", text = "Not one, and I'd like that written down somewhere. Regthar gets the songs because he kills them in daylight, but it's the night watch that keeps his bed from being trampled." } },
      choices = { { text = "I'll remember who keeps the night. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    spare = {
      lines = { { id = "s_default", text = "I said a beaten enemy who runs home tells the others what it cost, and a dead one tells nobody. Regthar calls that soft, but I spent my youth in a human camp, and I know what being beaten teaches you." } },
      choices = { { text = "It's a hard-won sort of soft. Something else.", next = "BACK" } },
    },
    ystay = {
      lines = {
        { id = "yystay_d", text = "He saved my life in the camps, when a guard had his boot on my neck. Regthar broke the man's arm and never once mentioned it afterwards. So I sweep his bunker and let him shout." },
      },
      choices = {
        { text = "That's a debt worth paying.", next = "BACK", reply = "It is, though I'd not say it within his hearing.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ypig = {
      lines = {
        { id = "yypig_d", text = "The spotted one, Grunta, and she's smarter than half the grunts. I've tried three locks and a rope, and every morning she's out among the stores, chewing the bread and looking proud." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ykhans = {
      lines = {
        { id = "yykhans_d", text = "The khans of the Kolkar fight each other as much as us, and their warriors die for whichever khan is loudest. I'd talk to them, if Regthar let me. A centaur who isn't fighting us is one less spear at the door." },
      },
      choices = {
        { text = "Talk to them. Peace is cheaper than war.", next = "BACK", reply = "Cheaper, aye, and quieter, which suits a sweeper.", fx = { align = { honor = 1 } } },
        { text = "Centaur only understand strength.", next = "BACK", reply = "Regthar says the same, and he's got the scars to prove it.", fx = { align = { honor = -1 } } },
      },
    },
    ytroll = {
      lines = {
        { id = "yytroll_v0", when = { race = "Troll" }, text = "Laughing at Regthar behind his back, mostly, which you'll do too once you've met him. Your lot have the right idea, mon, as you'd say." },
        { id = "yytroll_d", text = "Laughing at Regthar behind his back, mostly. You lot have the right idea about life, which is that it's short, so you might as well enjoy the joke." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    regthar = { { id = "ytp_regthar", text = "Regthar Deathgate is loud, proud and right more often than I'd like." } },
    pigs = { { id = "ytp_pigs", text = "They are the curse of my life, and they taste wonderful." } },
    background = { { id = "tp_bg", text = "I hauled stone in a human camp for years, and now I haul it for Regthar in a burrow. The work is the same, but at least the master is my own." } },
    centaur = { { id = "tp_ce", text = "Kolkar, all hooves and pride. They hate us for being here, and they'd hate each other if we left." } },
    _none = { { id = "tp_none", text = "That hasn't come past my door, and everything comes past my door. Ask Regthar, if you like being shouted at." } },
  },
}

-- Jorb: ogre bodyguard walking beside Lizzarik's cart, Crossroads to Ratchet.
P:NPC {
  key = "jorb", id = TODO_NPC("Jorb"), name = "Jorb", title = "Lizzarik's Bodyguard", gender = "male",
  bible = "bibles/missed.md", role = "guard", tier = "service",
  communities = { "ratchet" }, temper = { "slow", "placid" }, values = { "pay", "food" },
  notices = { "soldier" },
  impression = {
    first = "Jorb is the ogre who walks beside Lizzarik's cart on the road between the Crossroads and Ratchet. He carries no weapon because he has never needed one, and he watches the goblin's customers with the patience of a boulder.",
    third = "{name} met Jorb, the ogre who guards the weapon merchant Lizzarik on the Ratchet road.",
  },
  greetings = {
    { id = "g_default", text = "You talk to little boss if you want to buy. Jorb only stands here and looks at you." },
    { id = "g_back", when = { metBefore = true }, text = "Jorb knows your face now. You did not steal last time, so Jorb likes you a little." },
    { id = "g_big", when = { race = { "Tauren", "Orc" } }, text = "You are big, for a small one. Jorb is still bigger, so you be nice to little boss." },
  },
  notice = {
    { id = "n_rogue", cat = "soldier", when = { class = "ROGUE" },
      text = "Jorb sees your hands, sneaky one. Keep them where Jorb sees them and nobody gets sat on." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Me Jorb. Little boss Lizzarik sells the swords, and Jorb makes sure nobody takes a sword without giving the shiny first. It is easy work, because Jorb only has to stand close." } },
      again = {
        { id = "h_again", text = "You want to ask Jorb more? Jorb has time while the cart goes slow." },
        { id = "h_again2", text = "Ask. Jorb listens and walks." },
      },
      choices = {
        { text = "Why does an ogre work for a goblin?", next = "why" },
        { text = "Have you ever had to fight for him?", next = "fight" },
        { text = "Where does an ogre come from, out here?", next = "from" },
        { text = "Is Jorb happy, walking the road?", next = "yhappy" },
        { text = "Do ogres ever come for you?", next = "yogres" },
        { text = "Does little boss ever cheat people?", next = "ycheat" },
        { text = "What do you do with thieves, Jorb?", next = "ysneaky" },
        { text = "Walk well, Jorb.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Little boss pays every week and never hits Jorb, and there is meat at the end of the road. Ogre bosses hit a lot and pay nothing, so Jorb thinks the goblin way is smarter." } },
      choices = {
        { text = "Does he pay you fairly?", next = "pay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pay = {
      lines = { { id = "p_default", text = "Little boss says it is fair, and he says it very fast with a lot of numbers. Jorb cannot follow the numbers, but Jorb counts the coins after, and it is the same count every week, so maybe it is fair." } },
      choices = { { text = "Keep counting them, Jorb. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    fight = {
      lines = { { id = "f_default", text = "One time the horse-men came at the cart, and Jorb picked one up and threw him at the others. After that they went away, and little boss was happy until he saw the dent in his cart.", fx = { learn = { "centaur" } } } },
      choices = { { text = "A dent seems a fair price. Something else.", next = "BACK" } },
    },
    from = {
      lines = { { id = "fr_default", text = "Jorb came up from the hot sand in the south, where the goblins have a town with a wall around it. A goblin there told Jorb there was work on the Ratchet road, and Jorb walked until he found the cart." } },
      choices = { { text = "That's a long walk. Something else.", next = "BACK" } },
    },
    yhappy = {
      lines = {
        { id = "yyhappy_d", text = "Jorb is happy when the road is long and the sun is soft. Jorb is sad when it rains, because little boss shouts at the wheels, and the wheels do not listen." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yogres = {
      lines = {
        { id = "yyogres_d", text = "Sometimes big ones from the south. They say Jorb is a goblin's dog. Jorb says Jorb eats better than them, and that makes them quiet and thinking." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ycheat = {
      lines = {
        { id = "yycheat_d", text = "Little boss says nobody is cheated if nobody is sad after. Jorb does not know. A small one came back sad once and little boss gave him a coin. Jorb thinks that was good." },
      },
      choices = {
        { text = "Fair dealing matters. You should tell him so.", next = "BACK", reply = "Jorb will say it slow, so little boss hears it.", fx = { align = { honor = 1 } } },
        { text = "A trader's job is to make money, Jorb.", next = "BACK", reply = "Jorb hears this a lot. Jorb is not sure it is right.", fx = { align = { honor = -1 } } },
      },
    },
    ysneaky = {
      lines = {
        { id = "yysneaky_v0", when = { class = "ROGUE" }, text = "Jorb sees your hands, sneaky one. Jorb is slow to walk but fast to grab. Last sneaky one walks funny now." },
        { id = "yysneaky_d", text = "Jorb sees all the hands. Jorb is slow to walk but fast to grab. One sneaky one tried, and now that one walks funny. Jorb was not sorry." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    lizzarik = { { id = "ytp_lizzarik", text = "Little boss is small and loud and never hits Jorb. Jorb likes little boss." } },
    ratchet = { { id = "ytp_ratchet", text = "Ratchet has a lot of goblins and a lot of fish. Jorb likes the fish." } },
    background = { { id = "tp_bg", text = "Jorb was in the sand, and now Jorb is on the road. Jorb likes the road better because it has more shade and more meat." } },
    _none = { { id = "tp_none", text = "Jorb does not know that. Ask little boss, he knows everything and tells it fast." } },
  },
}

-- Pilot Wizzlecrank: climbs out of his shredder at the end of The Escape.
P:NPC {
  key = "pilot_wizzlecrank", id = TODO_NPC("Pilot Wizzlecrank"), name = "Pilot Wizzlecrank", gender = "male",
  bible = "bibles/missed.md", role = "worker", tier = "service",
  communities = { "ratchet" }, temper = { "jumpy", "fast" }, values = { "profit", "survival" },
  notices = { "craft" },
  impression = {
    first = "Pilot Wizzlecrank is a goblin who drove a Venture Company shredder at the Sludge Fen until he decided the company's secrets were worth more in Ratchet. He is out of the machine now and talking very quickly, with one eye on the road behind him.",
    third = "{name} met Pilot Wizzlecrank, a goblin shredder pilot who ran from the Venture Company with their plans.",
  },
  greetings = {
    { id = "g_default", text = "Whoa, whoa, easy, pal, I'm one of the good ones now, or good-adjacent anyway. Keep your voice down and we'll both live to see a payday." },
    { id = "g_escape", when = { questDone = TODO_QUEST("The Escape") }, text = "There's my escort! Listen, that was the best protection I never paid for, and I mean that as the highest compliment a goblin's got." },
    { id = "g_back", when = { metBefore = true }, text = "You again, good, good. You see anybody in Venture Company colors behind you on the way here?" },
  },
  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Then you know what that shredder cost, and you know it about killed me to walk away from the thing." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Wizzlecrank's the name, formerly of the Venture Company, shredder division, and currently between employers. I walked out of the Sludge Fen with their shredder plans in my head, and that's the kind of severance package they send people after you for.", fx = { learn = { "venture_company" } } } },
      again = {
        { id = "h_again", text = "Make it quick, friend, I'm on a schedule and the schedule is don't get caught." },
        { id = "h_again2", text = "Yeah, yeah, go on, I'm listening and watching the road." },
      },
      choices = {
        { text = "Why turn on the Venture Company?", next = "why" },
        { text = "What happens to the shredder?", next = "shredder" },
        { text = "Where do the plans go now?", next = "plans" },
        { text = "A shredder's a fine machine. Who built yours?", next = "built", when = { profession = "Engineering" } },
        { text = "What do they pour into the fen?", next = "ypour" },
        { text = "Will the Venture Company come after you?", next = "yafter" },
        { text = "What will you do now?", next = "ynext" },
        { text = "Should I join the Venture Company?", next = "ygob" },
        { text = "Good luck, pilot.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because I ran the numbers, pal, and the numbers stank. The company pays a pilot in scrip, bills him for the fuel, and docks him for every tree he doesn't cut, so I figured the plans were worth more to somebody else than my whole career was to them." } },
      choices = {
        { text = "So it's only about the money.", next = "why2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why2 = {
      lines = { { id = "w2_default", text = "It's always about the money, that's just honest bookkeeping. But I'll tell you for free that I've seen what they pour into that fen, and I wouldn't drink downstream of it for all the gold in Undermine." } },
      choices = { { text = "That's nearly a conscience. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    shredder = {
      lines = { { id = "s_default", text = "She stays where she stopped, sparks and sprockets, and it breaks my heart. The boiler's cooked and the left saw arm was never right, so I shut her down for good before the company could tow her home and put some other sap in the seat." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    plans = {
      lines = { { id = "p_default", text = "Straight to Sputtervalve in Ratchet, who's with the Tinkers' Union and pays cash on delivery. The Union's wanted a look inside a Venture Company shredder for years, and I'm about to become their favorite person, at very reasonable rates.", fx = { learn = { "steamwheedle" } } } },
      choices = { { text = "Something else, Wizzlecrank.", next = "BACK" } },
    },
    built = {
      lines = { { id = "b_default", text = "Company shop, lowest bidder, and you could tell. I rebuilt the pressure valves myself on my own time, which the company called unauthorized modification, and which I called not blowing up." } },
      choices = { { text = "I'd have done the same. Something else.", next = "BACK" } },
    },
    ypour = {
      lines = {
        { id = "yypour_d", text = "Sludge, pal, real sludge, from the drill pumps, all black and stinking. Fish float belly up for a mile, and the plants turn grey. The company calls it waste disposal. I call it a crime against the bottom line of the planet." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yafter = {
      lines = {
        { id = "yyafter_d", text = "Sure they will, they'll send a contract killer with a clipboard. That's why I'm going to Ratchet and then onto the first boat to anywhere. I'd rather be poor and breathing than rich and floating in the fen." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ynext = {
      lines = {
        { id = "yynext_d", text = "Find honest work, if there's such a thing. Maybe flying, maybe fixing, maybe running a little stall in Ratchet. Gazlowe might hire me, though he'll want a cut of my future." },
      },
      choices = {
        { text = "You did right exposing them. Be proud.", next = "BACK", reply = "Proud? I'm alive and solvent. That's the same thing for a goblin.", fx = { align = { honor = 1 } } },
        { text = "You sold secrets. That's just another kind of greed.", next = "BACK", reply = "Sure, pal, but it's greed with a conscience, and that's rare.", fx = { align = { honor = -1 } } },
      },
    },
    ygob = {
      lines = {
        { id = "yygob_v0", when = { race = "Goblin" }, text = "Goblin to goblin, pal, the Venture Company has the real money, sure. But they spend workers like coins, and one day you'd be the change." },
        { id = "yygob_d", text = "Goblin to goblin? I know you, pal. You're thinking the Venture Company's the only outfit with real money, and you're right. But they spend people like coins, and someday they'll spend you." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    sludge_fen = { { id = "ytp_sludge_fen", text = "The Sludge Fen used to be a pond. Now it's a crime scene with frogs." } },
    sputtervalve = { { id = "ytp_sputtervalve", text = "Sputtervalve pays cash, asks questions, and keeps his mouth shut. Rare combination." } },
    background = { { id = "tp_bg", text = "Six years cutting timber for the Venture Company and nothing to show for it but a cough. I'm in business for myself now, as of about an hour ago." } },
    venture_company = { { id = "tp_vc", text = "Worst outfit I ever worked for, and I've worked for my uncle. They'd strip the Barrens to bedrock and bill the bedrock." } },
    _none = { { id = "tp_none", text = "No idea, pal, and I'm not sticking around to find out. Ask in Ratchet, everybody there knows somethin'." } },
  },
}
