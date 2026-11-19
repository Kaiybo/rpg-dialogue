-- Deathknell: where the Forsaken wake. Voice: bibles/tirisfal.md
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "mordo", id = TODO_NPC("Undertaker Mordo"), name = "Undertaker Mordo",
  bible = "bibles/tirisfal.md", role = "worker", tier = "quest",
  communities = { "deathknell" }, temper = { "matter_of_fact" }, values = { "practical" },
  notices = { "greenness", "lock_shards" },
  impression = {
    first = "He buries things, he says, and leaves the explaining to others.",
    third = "{name} met Undertaker Mordo, who tends the graves of Deathknell and welcomes those who rise from them.",
  },

  greetings = {
    { id = "g_grave", text = "Ah, you're up. Sit a moment if you need to; the first few minutes are the strangest." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and still yourself. That's a fine sign; not everyone I dig up stays that way." },
    { id = "g_xremember", when = { origin = "forsaken_scourge_remembered" }, text = "You remember it, don't you, the time under the Lich King's hand? I can see it in how you look at your own fingers. Sit with it as long as you need, because the graves here don't hurry anyone." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and still yourself, by the look of you. That's a fine sign, and the graves are none the worse for missing you." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8, race = "Scourge" }, text = "I remember you sitting on the edge of your own grave, wondering what had happened, and now look at you. You've grown into this second life better than most." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The others tell me you've been helping around Deathknell. I only bury things, but I know good work when I see it." },
  },

  notice = {
    { id = "n_green", cat = "greenness", when = { maxLevel = 2 },
      text = "Go on, look at your hands. Yes, they're yours, and no, they won't get better, but you'll stop minding." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 5 } },
      text = "Those shards hold the ones who'll never rise, who never even got the choice. I bury what's left of the bodies and you carry what's left of the rest, so I suppose we're in the same trade." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "A few, in the plague years, and the Scourge dug most of them up again before I could finish the prayers. I never thought I'd see one stand up and still mean the words, but here you are, so perhaps the prayers took better than I knew." } },
      choices = {
        { text = "They took, Mordo. The Light remembered me.", next = "BACK", reply = "Did it, now? Then I'll say those prayers a little louder over the next ones, in case it wasn't a fluke.", fx = { align = { light = 1 } } },
        { text = "Prayers didn't bring me back. My own will did.", next = "BACK", reply = "Well, I'll not argue with a corpse who climbed out of my own ground, but I'll keep saying them anyway. Habit's a hard thing to bury.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "None, mostly, because I never knew the right ones and Sarvis says there aren't any. I just lay them in straight and shovel gently, and if a priest wants to say something, the dead won't mind and I'd quite like to hear it." } },
      choices = {
        { text = "I'll say the words, Mordo. They deserve that much.", next = "BACK", reply = "That'd be kind, and I'll lean on my shovel and listen properly. Say them slow, if you don't mind, because I'd like to learn a few.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Sarvis is right. Words are wasted on the dead.", next = "BACK", reply = "He usually is, and it's a dreary thing about him. Still, I'll keep my mouth shut over the graves and let them have the quiet instead.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The duskbats nest in the old houses, and the spiders come down out of Night Web Hollow when they're hungry, though they don't care much for what they find. I'd be glad of fewer of both, because a grave that's been dug twice is a grave I have to fill twice." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They do, so keep {pet} out of the fresh graves, if you'd be so kind. The spiders from Night Web Hollow come sniffing as it is, and a grave that's been dug twice is a grave I have to fill twice." },
      },
      choices = {
        { text = "I'll keep them off your graves. The dead deserve their rest.", next = "BACK", reply = "Bless you for that, and mind the big spiders by the old barn. A grave's a small thing to ask for, but it's the last thing most folk get.", fx = { align = { light = 1 } } },
        { text = "Let the beasts dig, Mordo. The dead don't mind anymore.", next = "BACK", reply = "Perhaps they don't, but I do, and my back minds a great deal. If you'll not hunt them for the dead, hunt them for an old undertaker.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_fors", tags = { "news" }, when = { race = "Scourge", alt = { kin = true } },
          text = "I raised one called {alt} from these same graves, and you came up with the same twist at the corner of the mouth. Perhaps you were family in life, or perhaps the grave just likes a pattern, and I've stopped trying to tell which." },
        { id = "h_alt_living", tags = { "news" }, when = { alt = { notKin = true, race = { "Orc", "Troll", "Tauren", "Skyborne" } } },
          text = "A {altrace} came through Deathknell a while ago, {alt} by name, and asked me what it felt like to dig up the dead for a living. I told them it pays about as well as you'd expect, but the company's quieter than most." },
        { id = "h_alt_risen", tags = { "news" }, when = { alt = { race = "Scourge", notKin = true } },
          text = "You've a look of {alt}, one of the risen I dug out of this churchyard myself. If you're kin of theirs from before, go gently, because most of mine don't remember the families they had." },
        { id = "o_tlaband", tags = { "news" }, when = { gossip = { topic = "the_light", stance = "abandoned" } }, text = "Sarvis says you've given up on the Light already. Quick work, for someone I stitched together so recently." },
        { id = "h_default", key = true,
          text = "I'm Undertaker Mordo. I tend the graves here, and sometimes the graves tend to stir, as you did. Welcome back." },
        { id = "h_rude", tags = { "news" }, when = { questActive = TODO_QUEST("Rude Awakening") },
          text = "Shadow Priest Sarvis will explain the rest. He's in the chapel. Try not to stare at the others; they're new too." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, in Deathknell? The earth here's been dug over so often it's half graves, so mind where you set those totems down." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You'll want to see the old yew by the chapel, I expect; it's the only thing in Deathknell that died and didn't get back up." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, risen with an eye for tracks still in your head. The only beasts around Deathknell are the ones that come sniffing at the graves, I'm afraid." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, risen like the rest. I bury those who don't wake, and I'd be glad of someone to say a word over them, whatever the word is." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin, back from the grave. You're not the first I've seen wake with the Light still in their hands, though there aren't many, and Aramis Hammerhand will want to see you." },
        { id = "h_dd_deaths", when = { deaths = { min = 5 } },
          text = "Back from the dark again, are you? I stitched you together well enough the first time, so I'll thank you not to undo all my work out there." },
      },
      choices = {
        { text = "What words do you say over the ones who don't wake?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Does the earth mind holding so many dead, Mordo?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Could the old yew be brought back, Mordo?", next = "druid_q", when = { class = "DRUID" } },
        { text = "My hands still know a sword, though I don't remember learning.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I remember the Scourge's voice, Mordo.", next = "remember", when = { origin = "forsaken_scourge_remembered" } },
        { text = "What happened to me?", next = "what" },
        { text = "My hands itch for locks and pockets, Mordo.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Where do the dead learn their magic, Mordo?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do the risen often turn to darker pacts, Mordo?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "I'd guess beasts dig at your graves, Mordo.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "You must have buried paladins here too, Mordo.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "You were there when I woke, Mordo. Remember what I asked?", next = "xorig_binder", when = { origin = "forsaken_vengeful_binder" } },
        { text = "I'll find Sarvis.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Something else? Take your time; the graves aren't going anywhere." },
      },
    },
    xorig_binder = {
      lines = {
        { id = "xbd_default", text = "You asked how to hurt him back. Not where you were, or who you'd been, only that, and I've buried enough of the fresh ones to know it's rare. Has the asking done you any good since?" },
      },
      choices = {
        { text = "Every demon I bind is a debt the Lich King will pay.", next = "BACK", reply = "Then I hope he pays it in full and pays it slowly. Mind the bill doesn't come back to you first, though; demons keep poor accounts.", fx = { align = { light = -1 } } },
        { text = "I've started to wonder if there's more than revenge.", next = "BACK", reply = "That's the best thing I've heard from a fresh one in a long while. Revenge is a fine shovel, but you can't dig forever.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Less than I hoped, Mordo.", next = "BACK" },
      },
    },
    warrior = {
      lines = { { id = "wa_default", text = "Perfectly normal. The hands remember longer than the head does, and I've watched a fellow who couldn't recall his own name pick up a shovel and dig a perfect grave. Executor Arren will be glad of whatever your hands remember." } },
      choices = { { text = "Then I'll go to Executor Arren.", next = "BACK", fx = { affinity = 1 } } },
    },
    remember = {
      lines = { { id = "re_default", text = "Some do, and those ones dig the deepest when I hand them a shovel, I notice. It's quiet in your head now, isn't it? Hold on to that quiet, and don't go looking for the voice again." } },
      choices = {
        { text = "I'll never answer it again.", next = "BACK", reply = "Good, and I'll hold you to it every time you pass my graves. The quiet's worth more than any orders he ever gave you.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Sometimes I miss knowing what to do.", next = "BACK", reply = "Most of them do, at first, and it passes if you let it. Find something to do with your hands, and the wanting goes quieter.", fx = { affinity = -1, align = { order = -1 } } },
      },
    },
    what = {
      big = true,
      lines = {
        { id = "w_default", text = "The plague took you, and the Scourge raised you, and then the Dark Lady broke their hold, so now you're your own again, mostly." },
      },
      choices = { { text = "Mostly?", next = "BACK", fx = { affinity = 1, trait = { skeptical = 1 } } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I've wondered that myself, though I've never had anyone to ask. I dig a grave and somebody climbs out of it a week later, and if your spirits have any complaint about that, I'd rather they took it up with Sarvis." } },
      choices = {
        { text = "Then I'll ask the earth to be patient with you.", next = "BACK", reply = "That's kindly done, and I hope the earth's in a listening mood. I've given it a great deal to hold these last years.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The earth's opinion doesn't matter. The Forsaken need soldiers.", next = "BACK", reply = "Soldiers, aye, and I've buried plenty of those twice. Still, I'd sooner not have the ground angry at me, if it's all the same.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "I couldn't say, since I bury things and don't grow them. It was planted when the chapel was built, and it went grey the same season the plague came through, and I've left it standing because a graveyard looks wrong without a yew." } },
      choices = {
        { text = "Then I'll try, and if it wakes, it wakes.", next = "BACK", reply = "Try away, and if it does wake, I'll be the first to fetch a bucket for it. A green yew would be a fine thing in this yard.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Leave it dead. Deathknell has enough things climbing out.", next = "BACK", reply = "You've a point there, and it'd be the only thing in Deathknell that stayed in the ground. I'll leave it be, then.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Every rogue's hands want something, living or dead, and I've learned not to ask what. David Trias trains your sort by the chapel, and he'll tell you which habits to keep and which will earn you a Deathguard's bolt." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "The body keeps its habits even after the heart stops keeping time, and I buried a good many cutpurses in this yard before the plague. Perhaps you were one of them, but the Dark Lady doesn't ask, and neither do I." },
      },
      choices = {
        { text = "I'll keep my habits for the Dark Lady's enemies.", next = "BACK", reply = "That's the answer Trias likes, and it'll keep you out of my graves a while longer. Off you go, then, and mind your fingers.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My habits are my own business, Mordo.", next = "BACK", reply = "So they are, until they land you in front of a Deathguard's crossbow. Then they become my business, shovel and all.", fx = { align = { order = -1 } } },
        { text = "What happened to all of us, Mordo?", next = "what" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "A troll mage in Deathknell is a rare sight, and you'll find our dead mages a dry and scholarly lot. Isabella teaches by the chapel, if you can stand a few lectures about Dalaran with your lessons." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "Much of it they never forgot, since the mind keeps what it used most, and you must have used magic every day of your life. Isabella teaches by the chapel and will help you find the rest, though I'd not hope for names and faces to come back as easily." },
      },
      choices = {
        { text = "I'll learn what I can, as the Dark Lady wills.", next = "BACK", reply = "Spoken like a proper student, and Isabella will like you for it. Bring her a question about Dalaran and she'll talk till dawn.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll find my own way through the arcane.", next = "BACK", reply = "Many do, and some of them I end up burying with their spellbooks. Find your way, but find it slowly, if you please.", fx = { align = { order = -1 } } },
        { text = "What happened to all of us, Mordo?", next = "what" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "A fair few, because a mind that has heard the Lich King's voice isn't easily frightened by an imp's. Maximillion teaches it here, and I bury the ones who fail his lessons, so I'd ask you to study hard for both our sakes." },
        { id = "xwarlock_orc", when = { race = "Orc" }, text = "An orc asking me about warlocks, when your people knew the demons long before ours did. Maximillion teaches it here, and I expect he'd be glad of a student who can tell him what the old Horde paid for that knowledge." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "A fair few, because a mind that has heard the Lich King's voice isn't easily frightened by a demon's, and yours hasn't frightened me yet. Maximillion teaches it here and I bury the ones who fail his lessons, so study hard, and tell your servant I've no interest in its opinion of my graves." },
      },
      choices = {
        { text = "I'll master it slowly, and keep to the rules.", next = "BACK", reply = "That's what they all say on their first day, but I'll believe you a little more than most. Study hard, and I'll keep my shovel dry.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rules are for the ones who end up in your graves, Mordo.", next = "BACK", reply = "That's what the last three said, and I buried every one of them. I'll dig your hole a little deeper, just in case.", fx = { align = { order = -1 } } },
        { text = "What happened to all of us, Mordo?", next = "what" },
      },
    },
  },

  topics = {
    forsaken = { { id = "tp_forsaken", text = "You're Forsaken now, which means you're one of us, and one of us is better than one of the mindless. Welcome back, and mind your step." } },
    scourge = { { id = "tp_scourge", text = "The Scourge keeps the dead walking without a thought in their heads, and I spend my days putting them back in the ground where they belong. It's honest work, and the pay never changes, since there isn't any." } },
    lordaeron = { { id = "tp_lordaeron", text = "Deathknell was a village before the plague, with a church and a well and a churchyard I kept tidy. I keep it tidy still, though the residents are less patient than they used to be." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady freed us, so I bury what she tells me to and leave the thinking to her. That suits an undertaker." } },
    _none = { { id = "tp_none", text = "I bury things; I don't explain them. Ask Shadow Priest Sarvis in the chapel." } },
  },
}

P:NPC {
  key = "sarvis", id = TODO_NPC("Shadow Priest Sarvis"), name = "Shadow Priest Sarvis",
  bible = "bibles/tirisfal.md", role = "priest", tier = "major",
  communities = { "deathknell" }, temper = { "sardonic" }, values = { "loyal", "sharp" },
  notices = { "class" },
  impression = {
    first = "Having died once already, he finds it hard to take death seriously.",
    third = "{name} met Shadow Priest Sarvis, the sardonic voice of the Forsaken in Deathknell, who serves the Dark Lady alone.",
  },

  greetings = {
    { id = "g_chapel", text = "Another one walks in under their own power. Splendid. Death couldn't keep you, so let's see what you're good for." },
    { id = "g_back", when = { metBefore = true }, text = "Back so soon? Death seems to suit you." },
    { id = "g_xchapel", when = { origin = "forsaken_chapel_priest" }, text = "A chapel priest, risen and still praying to the Light, I'd wager. Splendid, because the Forgotten Shadow will teach you to pray to something that doesn't flinch when it looks at you." },
    { id = "g_away", when = { away = 14 }, text = "Back after {away}, and still walking. Death didn't keep you before, so I suppose it was foolish of me to expect the road would." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8, race = "Scourge" }, text = "You climbed out of the ground a fumbling thing, and now you look properly dangerous. Death really does suit you." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "I hear someone here believed a tale you told them, which I find rather charming. The living had the Light to keep them honest, and look where that got them." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin. I'll admit the Light makes me uneasy, though it used to make me feel safe, so step back a little while you're glowing, if you don't mind." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. Whatever you prayed to before, it didn't save you, and it was the dark that was waiting when you clawed out of the grave. Think about that." },
  },

  start = "hello",
  nodes = {
    dd_deaths = {
      lines = { { id = "dd_deaths_default", text = "Then you become what you see shambling through the fields, mindless and hungry, held up by nothing but the Scourge's leftover will. That is why I teach the newly risen to guard their minds, and why I would rather you died less often." } },
      choices = {
        { text = "I'll die as often as it takes. The cause is worth it.", next = "BACK", reply = "Brave words, and the Dark Lady will gladly spend them. Only make sure there is still a mind in there to hear her thanks.", fx = { align = { order = -1 } } },
        { text = "Then I'll be more careful. My mind is all I have left.", next = "BACK", reply = "Wise, and rarer than it should be among the newly risen. Guard it as you'd guard a blade.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    op_the_light = {
      big = true,
      lines = {
        { id = "optl_default", text = "All of them, sooner or later, usually while they're still picking grave dirt out of their teeth. So I'll ask you what they ask me: did the Light abandon us, or did we never matter to it?" },
      },
      choices = {
        { text = "It never left. Some of us can still feel it.", next = "op_the_light_r1", fx = { affinity = -1, align = { light = 1 }, opinion = { the_light = "faith" } } },
        { text = "It abandoned us. The shadow asks less and gives more.", next = "op_the_light_r2", fx = { affinity = 1, align = { light = -1 }, opinion = { the_light = "abandoned" } } },
        { text = "I don't know. I keep praying and waiting for an answer.", next = "op_the_light_r3", fx = { trait = { pious = 1 }, opinion = { the_light = "doubt" } }, when = { class = "PRIEST" } },
        { text = "I'll keep my faith to myself, Sarvis.", next = "BACK" },
      },
    },
    op_the_light_r1 = {
      lines = { { id = "optl_r1", text = "Then hold it close, and see whether it holds you back. I've watched a great many hands reach for it, and very few come back warm." } },
      choices = { { text = "Something else, Sarvis.", next = "BACK" } },
    },
    op_the_light_r2 = {
      lines = { { id = "optl_r2", text = "Good. You'll learn faster than most, and you'll waste less of your second life on your knees." } },
      choices = { { text = "Something else, Sarvis.", next = "BACK" } },
    },
    op_the_light_r3 = {
      lines = { { id = "optl_r3", text = "That's an honest answer, and honesty is where the Forgotten Shadow begins. Come back to me when the waiting tires you." } },
      choices = { { text = "Something else, Sarvis.", next = "BACK" } },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Will, more than anything, because the shadow isn't a god and it won't carry you the way the Light pretended to. Learn to make your own faith out of what you've got, and you'll find it's harder to lose than the old kind." } },
      choices = {
        { text = "Faith I make myself is faith no one can take back.", next = "BACK", reply = "Exactly, and you've learned in one sentence what took me a year of grieving. Build it well and lean on it hard.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "The Light still answers me, Sarvis, whatever you say.", next = "BACK", reply = "It burns you every time it answers, doesn't it? Keep it if you like, but don't expect me to call that kindness.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The Scourge's leftovers, mostly, and the spiders in Night Web Hollow, which have grown fat on things I'd rather not name. Hunt them if you like, because nothing out there is going to be mourned, least of all by me." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The spiders in Night Web Hollow, mostly, and you've a beast at your heel already. {pet} won't be troubled by what lives there, I expect, and the spiders there could do with a fright." },
      },
      choices = {
        { text = "I'll clear the Hollow. Deathknell needs safe paths.", next = "BACK", reply = "Safe is a strong word for anywhere in Tirisfal, but fewer spiders would be a start. Burn the webs while you're at it.", fx = { align = { order = 1 } } },
        { text = "I'll hunt where I please, Sarvis, not where I'm sent.", next = "BACK", reply = "Do as you please, then, and I'll not mourn you either. The Hollow doesn't care who sent you, only how fresh you are.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Shadow Priest Sarvis. We Forsaken have already died once, and it's hard to take death seriously after that." },
        { id = "h_mindless", tags = { "news" }, when = { questActive = TODO_QUEST("The Mindless Ones") },
          text = "Not everyone wakes as themselves, and the mindless ones shamble about the graves. Put them back down, because they're past helping." },
        { id = "h_rattle", when = { questActive = TODO_QUEST("Rattling the Rattlecages") },
          text = "Rattlecage skeletons, the Scourge's leftovers, still wander the fields. Break them; they won't mind." },
        { id = "h_path", when = { questActive = TODO_QUEST("A Difficult Path") },
          text = "A scroll came for you, and it reeks of the Light. Read it over there, please, not here, and then go to Aramis Hammerhand in the church." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, here. You talk to spirits, I'm told, and the spirits talk back, which is more than the Light ever did for me." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, in my chapel. You serve the land, I gather, and the land around here has been rather busy serving the Scourge." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, risen and still looking for tracks. The Light never taught anyone to read a trail, so you've kept the more useful habit." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "Another priest, with a new voice answering your prayers, I hope. Whatever you called on before let you die, so I trust you noticed who was waiting when you crawled out of the dirt." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Mindless", min = 20 } }, text = "You've laid a good many of the mindless ones to rest, and Deathknell is quieter for it. They were lost long before you found them, so don't let it trouble you." },
        { id = "h_dd_deaths", when = { deaths = { min = 5 } },
          text = "Your spirit has made the walk back from the graveyard more than once, and I can feel the wear on it. The Dark Lady's gift does not fray easily, but it does fray." },
      },
      choices = {
        { text = "What does the shadow ask of a priest, Sarvis?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "You trust the shadow, Sarvis. Why not the spirits?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "This land needs cleansing, Sarvis.", next = "druid_q", when = { class = "DRUID" } },
        { text = "I woke with a sword arm and no prayers, Sarvis.", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Who are the Forsaken?", next = "forsaken" },
        { text = "The Light still answers me, Sarvis.", next = "paladin", when = { class = "PALADIN" } },
        { text = "I deal in shadow too, Sarvis, and in worse things.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "I studied magic in life. I doubt it matters now.", next = "mage", when = { class = "MAGE" } },
        { text = "I'd rather work where nobody's looking.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Is there anything worth hunting near Deathknell, Sarvis?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "I'll get to work.", next = "END" },
        { text = "What happens to us if the gift frays, Sarvis?", next = "dd_deaths", when = { deaths = { min = 5 } } },
      },
      again = {
        { id = "h_again", text = "More questions? Death has made you chatty. Go on." },
        { id = "h_again2", text = "Yes? I have eternity, more or less, so I suppose I can spare a minute." },
      },
    },
    paladin = {
      big = true,
      lines = {
        { id = "pa_default", text = "So I've noticed, and so has my skin. I prayed to that Light my whole life, and it let the plague take me anyway; then it lets you keep it after death. You'll understand if I find the Light's sense of humor harder to love than mine." },
        { id = "pa_knight", when = { origin = "forsaken_risen_knight" },
          text = "A knight of the Silver Hand, risen. Uther's own order, and the prince who killed him is the one who made you. If the Light can stomach that irony, I suppose I can." },
      },
      choices = {
        { text = "It never left. We left it, and I came back.", next = "BACK", reply = "Came back to it, did you? Then you're more forgiving than I'll ever be, and I'm not sure whether that makes you a saint or a fool.", fx = { affinity = -1, align = { light = 1 } } },
        { text = "I use it because it hurts the living. Nothing more.", next = "BACK", reply = "Now that's a use for the Light I can admire. Let the Crusade feel what their god has become in our hands.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Who taught you the shadow, then?", next = "paladin_shadow" },
      },
    },
    paladin_shadow = {
      lines = { { id = "ps_default", text = "Nobody. I woke in the dark, and it was there, and it answered when I called. The Light had to be begged; the shadow simply listened, and I'm too tired to beg anymore. Go to Aramis; he still has the patience for begging." } },
      choices = { { text = "I'll go to Aramis.", next = "BACK" } },
    },
    warlock = {
      lines = {
        { id = "wl_default", text = "Like me? Not at all, friend. I listen to the dark; you make bargains with things that live in it, and they always want something back. Keep your contracts short and your imp on a leash." },
        { id = "wl_cult", when = { origin = "forsaken_cult_remnant" },
          text = "You knelt to the Cult before you died, didn't you? I can always tell; the Cult's people stand a little too comfortably near the Scourge's leftovers. Don't let the old habits drag you back." },
      },
      choices = {
        { text = "My bargains serve the Dark Lady, and no one else.", next = "BACK", reply = "Good, keep it that way, and keep your demon in front of you. The Dark Lady rewards loyalty, and the Nether rewards nothing at all.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My bargains serve me. That is what freedom tastes like.", next = "BACK", reply = "Freedom, is it? The Lich King called it something similar, and look where his bargains got us. Keep your contracts short, at least.", fx = { align = { order = -1 } } },
      },
    },
    mage = {
      lines = {
        { id = "ma_default", text = "It matters more than ever. The mind is the one thing the plague didn't rot, and a mage is mostly mind. The Kirin Tor won't have you back, of course, so you'll have to find your books in the Undercity now." },
        { id = "ma_dalaran", when = { origin = "forsaken_dalaran_apprentice" },
          text = "Dalaran's apprentices took the plague as badly as anyone, and better than most, since they at least had the sense to read about it first. Go to Bethor Iceshard in the Undercity when you're ready; he'll remember your masters." },
      },
      choices = { { text = "Then I'll find my books.", next = "BACK", fx = { affinity = 1 } } },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Most of us would, now; the sunlight is unkind to our complexions. The Dark Lady's deathstalkers will want to see you, eventually. Until then, practice on the mindless; they never notice anything." } },
      choices = { { text = "I'll practice on the mindless.", next = "BACK", fx = { affinity = 1 } } },
    },
    forsaken = {
      big = true,
      lines = {
        { id = "f_default", text = "We're what the Scourge made and the Dark Lady freed. The living fear us; the Lich King wants us back. We serve Lady Sylvanas, and we answer to no one else." },
      },
      choices = {
        { text = "For the Dark Lady.", next = "BACK", reply = "For the Dark Lady, and may every one of us remember who broke our chains.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I serve myself now, not the Dark Lady.", next = "BACK", reply = "Then you're freer than most of us dare to be, and you'll find it a cold road. Just don't let the Lich King mistake it for an invitation.", fx = { align = { order = -1 } } },
        { text = "And what do we want?", next = "want" },
        { text = "Do the new risen ask you about the Light?", next = "op_the_light" },
      },
    },
    want = {
      lines = { { id = "wa_default", text = "To exist without asking anyone's permission. It's a modest ambition, and the world finds it outrageous." } },
      choices = { { text = "...", next = "BACK", fx = { affinity = 1 } } },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "Then you woke with what the Dark Lady needs most, warrior. Prayers can come later, or not at all; the Scarlets won't wait for you to find your faith." } },
      choices = {
        { text = "Maybe I'll find the Light again, someday.", next = "BACK", reply = "Perhaps you will, and perhaps it'll burn you like it burns Aramis. Fight first, and look for gods afterward if you still want them.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll fight for her, and leave the gods out of it.", next = "BACK", reply = "Wisely chosen, warrior, because the gods were never much help on the walls. The Dark Lady at least shows up for her soldiers.", fx = { align = { light = -1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Because spirits have opinions, and I've had enough of things with opinions about me. The shadow asks nothing and judges nothing, and after the Light I find that restful; your elements may be kinder, but I'd rather not wait to find out." } },
      choices = {
        { text = "The spirits judge fairly. You might be surprised, Sarvis.", next = "BACK", reply = "Surprised is the one thing I'd rather not be again. Still, if they're fair, you'll tell me, and I'll think about it.", fx = { align = { light = 1 } } },
        { text = "Suits me. I'll take power that asks nothing back.", next = "BACK", reply = "Spoken like a true convert to the shadow. It asks nothing now, mind, but it keeps very good accounts.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Cleansed of what, exactly? Everything that grows in Tirisfal grows in plague, and the rest of it is walking about in us, and I'm not sure I care to be weeded. Do your work, druid, but remember that some of the rot has opinions." } },
      choices = {
        { text = "I'll heal what I can, and the Forsaken with it.", next = "BACK", reply = "Then do your healing, and I'll be grateful for whatever stays mended. Just don't try weeding me, druid.", fx = { align = { light = 1 } } },
        { text = "The Forsaken are what's left. I'll fight for you, not the soil.", next = "BACK", reply = "Now that's a druid I could almost like. The soil can look after itself; it's been doing so since long before the plague.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Praise, in a graveyard chapel, and from someone with a working jaw. I'd blush if I still had the blood for it, so do consider yourself thanked." },
        { id = "s2", text = "How pleasant. Most of my congregation crawls out of the ground too confused to say anything nice, so you've rather stood out." },
      },
      fail = {
        { id = "f1", text = "Flattery is wasted on the dead, I'm afraid, because we've been lied to by experts, some of them wearing crowns. Try honesty, since it's cheaper and I see it less often." },
        { id = "f2", text = "That was very nearly sincere, and I applaud the effort. Now tell me what you actually want, and spare us both the sermon." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Oh, well done, there's some wit left in that skull after all. Mock away, because I've been dead long enough to enjoy a joke at my own funeral." },
        { id = "s2", text = "I haven't been needled that neatly since the seminary, and the man who did it is still in the ground out there. You'll do well among us, I think." },
      },
      fail = {
        { id = "f1", text = "I've heard better jibes from the mindless ones, and they only know the one groan. If you must be rude, at least have the decency to be amusing." },
        { id = "f2", text = "How very brave of you, to sneer at a priest in his own chapel. The Forgotten Shadow keeps a long memory, and so, unfortunately for you, do I." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "My, there's something unpleasant behind your eyes, and I say that with a professional's respect. I'll mind my tone, since I've grown rather attached to this second go at things." },
        { id = "s2", text = "You needn't loom quite so close, because I take your point entirely. Death seems to have left you the useful parts, and I'm not fool enough to test them." },
      },
      fail = {
        { id = "f1", text = "You are threatening a dead man, which shows a touching optimism. I've already had the worst day I'm ever going to have, so do try something else." },
        { id = "f2", text = "Ah, menace. I woke in a grave with a stranger's voice in my head, and you'll find I've been hard to rattle ever since." },
      },
    },
  },
  topics = {
    knows = {
      { id = "tp_knows", text = "People tell a shadow priest all sorts of things, usually right before or right after they die. Ask about these; I've heard plenty." },
    },
    scarlet_crusade = { { id = "tp_crusade", text = "They burn what they don't understand, and they don't understand very much." } },
    forsaken = { { id = "tp_forsaken", text = "We are the Forsaken, risen from the Lich King's army with our minds our own again, and a little bitter about how we spent the interval. You'll find the bitterness is useful, since it keeps you moving." } },
    scourge = {
      { id = "tp_scourge", text = "The Scourge is a great machine of the dead with a cold will at its heart, and you were one of its parts until the Dark Lady pulled you out. Don't feel guilty about it, because guilt is a habit for the living." },
      { id = "tp_scourge2", when = { race = "Scourge" }, text = "You remember the voice in your head, I expect, the one that told you what to do. That silence you hear now is freedom, and you'll grow to like it." },
    },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady was a ranger-general of Quel'Thalas, and Arthas killed her and made her serve him. She broke free and took us with her, so you could say we owe her our afterlives, and she certainly would say so." } },
    holy_light = {
      { id = "tp_holy_light", text = "The Light burns those of us who've died, which I always thought a bit petty of it. We get by on will and shadow now, and I find both far more dependable." },
      { id = "tp_holy_light2", when = { class = "PALADIN" }, text = "You hold the Light in dead hands, and I expect it hurts. Aramis would tell you that's the point, and I'd tell you Aramis has always been a little odd." },
    },
    arthas = { { id = "tp_arthas", text = "Arthas is the prince who killed his father and gave Lordaeron to the plague, and then he went north to serve his master. I hope he finds the weather there as unpleasant as I find him." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad founded the Cult of the Damned, and the plague in your blood was his gift to Lordaeron. He rules the Scourge in the east now from a floating necropolis, and I'm told he's very pleased with himself." } },
    lordaeron = { { id = "tp_lordaeron", text = "This was the greatest kingdom of men, and now it's a graveyard with a few of us walking about in it. I find there are worse places to be dead." } },
    thrall = { { id = "tp_thrall", text = "The Warchief of the Horde took us in when the living would only burn us. The orcs are wary of us and they're right to be, but an alliance doesn't need affection to work." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran was the city of the Kirin Tor, and Archimonde knocked it flat. They say they're rebuilding behind their shields now, and I'd wager they'll be very sorry they didn't let more of us in." } },
    _none = { { id = "tp_none", text = "A good question for someone with more patience than I have." } },
    _gated = {
      { id = "gt1", text = "That's a subject I keep for those I've some reason to trust, and you haven't given me one yet. Ask me again when you've done something worth the telling." },
      { id = "gt2", text = "I think not, though it was charming of you to ask. A shadow priest keeps confidences, and he's choosy about who he shares his own with." },
    },
  },
}

P:NPC {
  key = "arren", id = TODO_NPC("Executor Arren"), name = "Executor Arren",
  bible = "bibles/tirisfal.md", role = "soldier", tier = "quest",
  communities = { "deathknell" }, temper = { "clipped" }, values = { "dutiful", "loyal" },
  notices = { "kit", "lock_armor" },
  impression = {
    first = "He wants the Scarlet Crusade gone, whether or not they understand why.",
    third = "{name} met Executor Arren, who keeps Deathknell against the Scarlet Crusade camped to its southeast.",
  },

  greetings = {
    { id = "g_post", text = "You there, can you hold a weapon? Then Deathknell needs every pair of hands that still works." },
    { id = "g_back", when = { metBefore = true }, text = "Report." },
    { id = "g_xremember", when = { origin = "forsaken_scourge_remembered" }, text = "You remember what the Scourge made you do; most of the fresh ones do, for a while. Put it to use against the Scarlets, because they certainly remember you." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the Scarlets have been busy while you were. Report, and then get back to work." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You came to me barely able to hold a weapon, and now you look like you've used one often. Good, because the Crusade hasn't gone anywhere." },
    { id = "g_word_intimidated", when = { word = "intimidated" }, text = "Word is you made someone back down without a fight. That will serve you well against the Scarlets, who are cowards under all that red." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The Crusade did that? They'll do worse if you let them, so get it fixed." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "You're wearing demon hide, and it suits Deathknell well enough, since my sentries could use something besides the Crusade to be frightened of. Just keep it away from the fresh graves." },
  },

  start = "hello",
  nodes = {
    dd_war = {
      lines = { { id = "dd_war_default", text = "Then you've seen what they are when there are more than a handful of them, all hymns and fire. Tell me, did any of them say anything to you before the end?" } },
      choices = {
        { text = "They called me an abomination. I made them regret it.", next = "BACK", reply = "Good. Let them learn that the abomination answers back, and that it remembers every word.", fx = { align = { light = -1 } } },
        { text = "They begged the Light for help. Part of me pitied them.", next = "BACK", reply = "Pity is a living habit, and a dangerous one in Tirisfal. Keep it if you must, but keep it well away from the field.", fx = { align = { light = 1 } } },
        { text = "Something else, Executor.", next = "BACK" },
      },
    },

    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I want them dead, but I'll take shamed first if it unsettles their ranks. Report what they do when they see you, because a Crusade that doubts itself is easier to break." } },
      choices = {
        { text = "I'll report it all, Executor, as ordered.", next = "BACK", reply = "Good, and leave nothing out, because their faces will tell me more than their prayers ever would.", fx = { align = { order = 1 } } },
        { text = "I'll fight them my way. The Light isn't a trick.", next = "BACK", reply = "The Light is a weapon here, paladin, and every weapon is a trick to the man it kills. Fight how you like, but bring me results.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "At Solliden Farmstead, where the Crusade's scouts shoot from the hedges and run before we can answer them. Keep my soldiers on their feet out there, and leave the sermons for Sarvis, who seems to enjoy them." } },
      choices = {
        { text = "Your soldiers will stand, Executor. I'll see to it.", next = "BACK", reply = "See that they do, and I'll forgive you the occasional prayer. Dead soldiers are no use to the Dark Lady.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll mend who I choose, Executor, and preach as I please.", next = "BACK", reply = "Mend whoever you like, but if my Deathguard fall while you're preaching, you'll answer to me.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Watch it, count them, and shoot the ones who wander off alone. The Crusaders patrol in pairs and talk loudly about the Light, so you'll hear them well before you see them." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Watch it from the trees, and keep {pet} low in the grass. The Crusaders patrol in pairs and talk loudly about the Light, so you'll hear them long before your beast has to." },
      },
      choices = {
        { text = "I'll report what I see, and shoot on your word.", next = "BACK", reply = "Good, then we understand each other, and I'll have a target for you by nightfall.", fx = { align = { order = 1 } } },
        { text = "I'll shoot first, Executor, and report what's left.", next = "BACK", reply = "As long as there's something left to report, hunter. Don't make me send anyone after you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Executor Arren, and I keep Deathknell. The Scarlet Crusade has a camp to the southeast, and they're bold enough to come for us here." },
        { id = "h_crusade", tags = { "news" }, when = { questActive = TODO_QUEST("The Scarlet Crusade") },
          text = "Their camp is too close for my liking. Thin them out, and bring back proof." },
        { id = "h_messenger", when = { any = { { questActive = TODO_QUEST("The Red Messenger") }, { questActive = TODO_QUEST("Vital Intelligence") } } },
          text = "They send runners between their camps. Whatever those runners carry, I want it, and so will Brill." },
        { id = "h_adventurer", when = { questActive = TODO_QUEST("The Adventurer") },
          text = "You've earned a breath. There's a traveler camped on the road by Brill who claims she's not one of the Crusade, so see what she's about." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Good, because the Crusade's camp burns well, and I'm told you can call fire." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, is it? If you can fight, then Deathknell has a use for you." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Good, because the Crusade's camp sits in open ground, and I want eyes on it from the treeline." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. I'll want you mending my Deathguard, not preaching to them, so keep that in mind when you speak." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin of the Forsaken. The Scarlets camped to the southeast think they hold the Light by right, and I'd like to see their faces when you walk in carrying it." },
        { id = "h_dd_war", tags = { "news" }, when = { questDone = TODO_QUEST("At War With The Scarlet Crusade") },
          text = "Word reaches Deathknell from Brill that you took the fight to the Crusade for Executor Zygand. I sent you out of here half-made, so I'll allow myself a measure of pride." },
        { id = "h_dd_deaths", when = { deaths = { min = 10 } },
          text = "You've fallen more than a few times since you rose in this village, I hear. The second death is no more final than the first, but do try not to make a habit of it." },
      },
      choices = {
        { text = "Where do your Deathguard need mending most, Executor?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Where do you want the lightning, Executor?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I fight in claw and fur, Executor. Will that do?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Why do the Crusaders hate us?", next = "hate" },
        { text = "Give me a post, Executor. I can fight.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Point me at a Crusade camp, Executor. They won't see me.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "My fire is yours to aim, Executor.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Would you take help from something with claws, Executor?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Shall I watch the Crusade's camp from the trees, Executor?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "I could shame the Crusade with the Light, Executor.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Understood, Executor.", next = "END", fx = { affinity = 1, standing = { deathknell = 1 } } },
        { text = "I fought the Crusade near Brill, Executor, as you trained me.", next = "dd_war", when = { questDone = TODO_QUEST("At War With The Scarlet Crusade") } },
      },
      again = {
        { id = "h_again", text = "Anything else? Keep it brief, because the Crusade won't wait on us." },
      },
    },
    warrior = {
      lines = {
        { id = "wa_default", text = "Good. Hold the gate first, then take the fight to their camp to the southeast. You'll hit harder than the living Crusaders expect, and you won't flinch when they scream, so use both." },
        { id = "wa_soldier", when = { origin = "forsaken_lordaeron_soldier" },
          text = "I see Lordaeron drill in your stance, and that is good. It is the same drill on a different side, so hold the gate." },
      },
      choices = {
        { text = "I'll hold it, Executor.", next = "BACK", reply = "Then hold it until nothing living stands at that gate.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Holding is for the dead. I'll hunt them down.", next = "BACK", reply = "Hunt them, then, but keep your head, because the Crusade is fond of ambushes. A dead hero is just another body for Mordo.", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
    hate = {
      lines = { { id = "ha_default", text = "Because we remind them what the plague did, and it's easier to burn us than to look at us. I don't need them to understand; I need them gone." } },
      choices = { { text = "Then they'll be gone.", next = "BACK", fx = { affinity = 2, trait = { stern = 1 }, learn = { "scarlet_crusade" } } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "On the camp to the southeast, on their tents and their wagons. Their runners carry orders between the camps and I want those orders whole, so keep your fire off the runners." } },
      choices = {
        { text = "Off the runners, then. Your orders, Executor.", next = "BACK", reply = "Good, and make sure the tents burn bright enough for the next camp to see. I want the next camp watching the sky all night.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Fire spreads where it likes. I won't promise anything.", next = "BACK", reply = "Then learn to control it, or keep it away from my orders. I'll not lose a dispatch to a careless spark.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "If it kills Crusaders, it will do. Go at their camp from the trees, where the sentries never watch, and leave nothing they can carry back to Brill." } },
      choices = {
        { text = "From the trees, then. They won't see me coming.", next = "BACK", reply = "Good, let them wonder what lurks in their own woods, and leave the sentries for last.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll come at them openly. Let them see what's coming.", next = "BACK", reply = "Brave, and foolish, but I'll take results however they come. If it goes badly, Mordo will see to you.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Then go to Solliden Farmstead and count their sentries, and come back with the number and nothing else. I don't want stories; I want to know how many swords stand between my Deathguard and their converts." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "You'd have learned that skill in the capital's alleys, I suppose, and now the Dark Lady has better use for it. Solliden is crawling with converts, so count them, cut down what you can, and report." },
      },
      choices = {
        { text = "You'll have your count, and nothing more.", next = "BACK", reply = "That's all I ask, and it's more than most bring back. Go quietly.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll cut their throats first and count after.", next = "BACK", reply = "Do it and you'll alert the whole farmstead, rogue. Count first, and I'll give you all the throats you want afterward.", fx = { align = { order = -1 } } },
        { text = "Why do the Crusaders hate us so?", next = "hate" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Aim it at Solliden, then, since the Crusade's converts wear more cloth than steel and burn accordingly. Report back when the farm is quiet; I've no use for the details." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "The Crusade calls every spell we cast necromancy and burns its own people for less. Show them what Dalaran's arts look like in a Forsaken hand, and come back when they've stopped preaching about it." },
      },
      choices = {
        { text = "Understood, Executor. Solliden burns on your order.", next = "BACK", reply = "Good, and don't waste your fire on the barns, because the Deathguard may want them later.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll pick my own targets, Executor.", next = "BACK", reply = "Pick them, then, but if you set fire to my scouts, the Society will hear about it. Results, rogue, not fireworks.", fx = { align = { order = -1 } } },
        { text = "Why do the Crusaders hate us so?", next = "hate" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "I take any help that kills Crusaders and doesn't eat my sentries. Keep your demon in front of you when you go to Solliden, and if it turns, you'll be the one to put it down." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "The converts at Solliden are farm boys who still believe the Light will save them, and a demon at their door will teach them otherwise. It isn't pretty work, but it's work, and you seem made for it." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "I take any help that kills Crusaders and doesn't eat my sentries, and two of them have stopped watching Solliden to watch your demon instead. Keep it in front of you when you go, and if it turns, you'll be the one to put it down." },
      },
      choices = {
        { text = "If it turns, I'll unmake it myself.", next = "BACK", reply = "See that you do, warlock, because my sentries won't be so polite about it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My demon answers to me, Executor. Not to the Deathguard.", next = "BACK", reply = "Then it had better behave around the Deathguard, or it'll answer to my blade before it answers to you.", fx = { align = { order = -1 } } },
        { text = "Why do the Crusaders hate us so?", next = "hate" },
      },
    },
  },

  topics = {
    scarlet_crusade = { { id = "tp_crusade", text = "They're zealots in red. Ask Executor Zygand in Brill; he's been fighting them longer than I have." } },
    forsaken = { { id = "tp_forsaken", text = "We are what the Dark Lady made of the Lich King's leavings, and we serve her alone. That's all you need to know on your first day." } },
    scourge = { { id = "tp_scourge", text = "The mindless dead still wander these fields, and they'll come at you without a thought. Put them down, and don't mistake them for your old neighbors, because your neighbors are gone." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady gives the orders, and I carry them out. If you want to know her mind, prove yourself useful and you may live long enough to hear it." } },
    lordaeron = { { id = "tp_lordaeron", text = "Lordaeron is dead, and the Crusade hasn't noticed. We have, and we're building on its bones." } },
    _none = { { id = "tp_none", text = "That is no concern of Deathknell's, nor of mine." } },
  },
}

P:NPC {
  key = "aramis", id = TODO_NPC("Aramis Hammerhand"), name = "Aramis Hammerhand",
  bible = "bibles/tirisfal.md", role = "trainer", tier = "quest",
  communities = { "deathknell" }, temper = { "steadfast" }, values = { "devout", "patient" },
  notices = { "class", "lock_shadow" },
  impression = {
    first = "It hurts him to hold the Light, and he won't let go.",
    third = "{name} met Aramis Hammerhand in the Deathknell church, who teaches those Forsaken who woke still holding the Light.",
  },

  greetings = {
    { id = "g_church", text = "Come in. The church still remembers what it was for, even if the town has forgotten." },
    { id = "g_paladin", when = { class = "PALADIN" }, text = "You came. I wondered whether you would, because many don't." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN", race = "Scourge" },
      text = "It hurts, doesn't it, the Light in this body? It hurts me too, but don't let go of it." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "The Light in my hands just went dim, the way it does when I'm tired, only I'm not tired. It's you, I think, and I'd rather know that than wonder." },
  },

  start = "hello",
  nodes = {
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Because the pain is how I know it's still there, and I'd sooner burn than feel nothing at all. Sarvis thinks I'm a fool, and perhaps I am, but a forge hurts the iron too, and nobody calls the blade foolish afterward." } },
      choices = {
        { text = "Then burn, Aramis. The Light is worth the pain.", next = "BACK", reply = "It is, and you understand it better than most of the priests in this chapel. Burn with me, then, and let the forge make something of us both.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Light abandoned us. Let it go and stop burning.", next = "BACK", reply = "Perhaps it did, but I didn't abandon it, and that's all I've got left to give. I'll keep burning, thank you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "It has room for anyone who'll bear it, though it burns every one of us like a brand. A soldier who stands firm while it burns is learning the same lesson I am, and the pain is a forge whether you pray or not." } },
      choices = {
        { text = "Then I'll stand in it, and let it burn.", next = "BACK", reply = "Good, then the Light will teach you as surely as it teaches me. Every time it burns, you'll find your feet planted a little deeper.", fx = { align = { light = 1 } } },
        { text = "I'll stand on my own feet, Aramis, not the Light's.", next = "BACK", reply = "Stand on whatever holds you, soldier. The forge doesn't care whose feet are in it, only that they stay.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Patience, I'd say, and the willingness to wait through discomfort for something you can't yet see. I don't hunt, {class}, but I've watched good hunters, and they pray the way I wish more priests did, in silence and without demands." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Patience, I'd say, and loyalty, which your {pet} plainly has in plenty. A beast that stays beside a dead master teaches the rest of us something about faith, whether you meant it to or not." },
      },
      choices = {
        { text = "Then I'll keep that faith, and keep my beast close.", next = "BACK", reply = "Then you'll be the most faithful creature in this graveyard, and your beast the second. Go well, {class}.", fx = { align = { light = 1 } } },
        { text = "Faith is for priests, Aramis. I hunt to eat.", next = "BACK", reply = "That's honest, and I'll not argue with an empty stomach. But I'll pray for good hunting anyway, whether you like it or not.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "The Light condemns nothing, as far as I can tell, though it burns me every time I touch it, so perhaps I'm the wrong one to ask. Turn your blades on the Scourge and I'll count you an ally, whatever the priests of Stormwind would think." },
      },
      choices = {
        { text = "My blades are for the Scourge, Aramis.", next = "BACK", reply = "Then I'll pray for them to stay sharp. That's as much blessing as the Light will let me give a rogue.", fx = { align = { light = 1 } } },
        { text = "My blades are for whoever pays.", next = "BACK", reply = "Then may whoever pays you be on the side of the angels, and may the Scourge be the one who comes to collect.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Aramis Hammerhand, and I teach those of us who woke still holding the Light. There aren't many, and I'd like there to be more." },
        { id = "h_path", tags = { "news" }, when = { questActive = TODO_QUEST("A Difficult Path") },
          text = "You read the scroll, so your training can begin. Whatever you do, don't turn away from the Light; it hasn't turned away from you." },
        { id = "h_rediscover", when = { any = { { questActive = TODO_QUEST("Rediscovering the Light") }, { questActive = TODO_QUEST("Coming to Terms") } } },
          text = "The pain is a forge: it burns, and what's left is stronger. That's the whole of the lesson, and it takes years to learn." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You keep your own faith in the spirits, and I won't try to turn you from it, because I know what it is to hold to something while others mock it." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, come into the church. Your people have been kinder to mine than we had any right to expect, so sit, and be welcome." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. I can still tell a soldier by how they stand, {class}, and you stand like someone who means to stay standing." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You walk softly, which is a kindness in a church where most of the risen still stumble into the pews." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. You'll have felt the Light sting, as I have, or you'll have turned away from it, and either way you'll know what I mean when I say it burns." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. I doubt the Light approves of your trade, but I've learned not to speak for it." },
      },
      choices = {
        { text = "Why do you hold on to the Light, Aramis, when it hurts?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Does the Light ever speak to you, Aramis, as the spirits speak to me?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Your Light and my Earth Mother, Aramis. Are they so different?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Why does the Light still answer us?", next = "why" },
        { text = "Does the pain ever ease, Aramis?", next = "pain", when = { class = "PALADIN" } },
        { text = "I was a knight of the Silver Hand, before.", next = "knight", when = { class = "PALADIN", origin = "forsaken_risen_knight" } },
        { text = "The Crusade calls on the same Light against us.", next = "crusade", when = { class = "PALADIN" } },
        { text = "What does the Dark Lady think of us?", next = "sylvanas", when = { class = "PALADIN" } },
        { text = "A dead man in the Light. I can't think how you stand it.", next = "other", when = { ["not"] = { class = "PALADIN" } } },
        { text = "The arcane doesn't burn me the way your Light burns you.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "You hold the Light and I hold demons. We're both mad, Aramis.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "I'll keep training.", next = "END", reply = "Then go and train, and may your spirits keep you better than the Light kept me. I'll be here if you need someone to listen.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Light may have no room for a plain soldier, Aramis.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do the Light and the hunt have anything in common, Aramis?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "I'd guess the Light condemns rogues, Aramis.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "The Light left me when I died, and I'm done with it.", next = "END", reply = "Then go your way, and I'll not hold it against you. I only hope you find something else that answers as faithfully.", fx = { align = { light = -1 } } },
      },
      again = {
        { id = "h_again", text = "What else would you ask? The church is quiet, and I've learned to like quiet." },
        { id = "h_again2", text = "Go on. Questions are the only prayer some of us can manage now." },
      },
    },
    pain = {
      big = true,
      lines = {
        { id = "pn_default", text = "No, it doesn't ease, but you learn its shape. In the first month I couldn't lay on hands without falling to my knees; now I fall to one knee, and I count that as progress. The day it stops hurting, I'll worry that I've stopped feeling the Light at all." },
      },
      choices = {
        { text = "Then I'll bear it, and keep faith.", next = "BACK", reply = "Then you'll be a stronger paladin than I am, and I'll be glad to see it. Kneel when you must, and stand when you can.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "If it hurts this much, maybe it's telling us to stop.", next = "BACK", reply = "Maybe it is, and maybe it's telling us we're still alive enough to feel it. I've chosen to hear it the second way.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "What helps, when it's worst?", next = "pain_helps" },
      },
    },
    pain_helps = {
      lines = { { id = "ph_default", text = "Remembering who it's for. I don't heal myself with it, because I can't, really; I heal the ones beside me, and their faces when the wound closes are worth every burn. A paladin's Light was never meant to be kept." } },
      choices = { { text = "Then I'll give it away.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    knight = {
      lines = { { id = "kn_default", text = "Then you carry more than the rest of us. You took vows to protect Lordaeron, and Lordaeron is gone, and so are most of the brothers who heard you swear them. I'd say your vows outlived the kingdom, if you choose to keep them." } },
      choices = {
        { text = "Then I'll keep them too.", next = "BACK", reply = "Then you're my brother in more than the Light, and I'm glad of it. We'll guard what's left of Lordaeron together.", fx = { affinity = 3, align = { honor = 1 } } },
        { text = "The vows died with the kingdom, Aramis.", next = "BACK", reply = "Then you're freer than I am, and I don't envy you. Some promises are worth keeping after there's nobody left to hold you to them.", fx = { affinity = -1, align = { honor = -1 } } },
      },
    },
    crusade = {
      lines = { { id = "cr_default", text = "They do, and it answers them as it answers us. That's the hardest lesson in this church: the Light doesn't take sides, and it will heal a Crusader who'd burn you as gladly as it heals you. What you do with it is the only thing that's yours." } },
      choices = {
        { text = "Then I'll use it better than they do.", next = "BACK", fx = { affinity = 2 } },
        { text = "A Light that serves both sides is no friend of mine.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    sylvanas = {
      lines = { { id = "sy_default", text = "That we're useful, I think, and that's all she's ever said of it. The deathguards in Brill watch us with something between respect and fear. I don't mind; a paladin who's feared a little by his own side behaves himself." } },
      choices = { { text = "Useful is enough for now.", next = "BACK", fx = { affinity = 1 } } },
    },
    other = {
      lines = { { id = "ot_default", text = "Badly, some days. But I woke up, and the Light was still there, hurting, and I decided it would be a poor kind of faith that only held while it was comfortable. You needn't share it, friend; just don't mock the ones who try." } },
      choices = { { text = "I won't mock it.", next = "BACK", fx = { affinity = 2 } } },
    },
    why = {
      big = true,
      lines = {
        { id = "y_default", text = "I don't know, and I've stopped needing to know. It answers, and it hurts, and it answers again, and I've stopped asking it for more than that." },
      },
      choices = {
        { text = "It's enough for me too.", next = "BACK", reply = "Then we'll be content together, and keep each other company in the burning.", fx = { affinity = 2, align = { light = 2 } } },
        { text = "It isn't enough for me, and I need more than pain.", next = "BACK", reply = "Then I hope you find it, though I doubt the Light will hand it over easily. Ask carefully, and expect only the burning in reply.", fx = { align = { light = -2 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Speak? No, it never speaks; it burns, and then it answers, and I take the answer as I find it. I envy you a little, shaman, because your spirits tell you what they want, and the Light has never once told me why it stayed." } },
      choices = {
        { text = "Faith without answers is still faith, Aramis. Keep it.", next = "BACK", reply = "Thank you, shaman, and coming from someone who hears answers, that means more than you'd know.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If it won't explain itself, I see no reason to serve it.", next = "BACK", reply = "That's an honest answer, and I've thought it myself on the long nights. I keep serving anyway, and I couldn't tell you why.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "I don't know your Earth Mother, but I've heard your elders mean to find a cure for the Forsaken and ask nothing for it. If she bids you mend what's broken without asking what shape it's in, then I think she and the Light would understand each other." } },
      choices = {
        { text = "Then we serve the same mercy under different names.", next = "BACK", reply = "I like that thought very much, and I'll carry it with me to the next poor soul I tend. Walk well, druid.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Mercy is a luxury. I mend what serves the Horde.", next = "BACK", reply = "Then you're more of a soldier than a healer, and I suppose the Horde needs both. Just don't forget the mending, when the fighting's done.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "No, it wouldn't, because the arcane never asked anything of you but study. The Light asks for faith, and faith in a dead body hurts, so I suppose I envy you a little and pity you a little, in about equal measure." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "You and I both came back from the grave holding what we held in life, though yours doesn't scald the hand that grips it. I was a soldier in the capital when Dalaran's mages walked its streets, and I never imagined we'd share a graveyard." },
      },
      choices = {
        { text = "Study is a steadier path than faith, Aramis.", next = "BACK", reply = "Steadier, perhaps, and quieter on the knees. But I've never found anything worth having on a steady road.", fx = { align = { light = -1 } } },
        { text = "Your faith takes more courage than my spells.", next = "BACK", reply = "That's very kind, and very generous from someone who can throw fire. I'll remember it the next time the Light knocks me flat.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A dead man in the Light. I can't think how you stand it.", next = "other" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Perhaps, though I'd say the Light hurts me because it is good and I am not, while your demons don't hurt you because they are exactly what they seem. I know which of us is lying to himself less, and I'm not sure it's me." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "The Cult of the Damned trafficked with dark powers too, and I watched them call it freedom right up until they knelt to the Scourge. You're Forsaken now and not a cultist, so mind that you stay the master and not the meal." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "Perhaps, though I'd say the Light hurts me because it is good and I am not, while your demon stands there at ease because it is exactly what it seems. Look at it watching the two of us, and tell me which of us is lying to himself less, because I'm not sure it's me." },
      },
      choices = {
        { text = "Power is power. I'll take whatever answers my call.", next = "BACK", reply = "Power is power, until it asks for something back. Mind what your demons are writing down while you're not watching.", fx = { align = { light = -1 } } },
        { text = "Perhaps I'll crawl back to the Light someday.", next = "BACK", reply = "Then I'll keep the door open for you, warlock, and the Light will burn us both when you come through it. That's what welcome looks like now.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Why does the Light still answer any of us?", next = "why" },
      },
    },
  },

  topics = {
    holy_light = {
      { id = "tp_holy_light", text = "The Light burns me every time I call it, and I call it anyway. It never asked whether I was alive, only whether I was willing." },
      { id = "tp_holy_light2", when = { class = "PALADIN" }, text = "You feel it too, the heat at the edges of your hands when you pray. Don't let go of it, because the burning is how you know it hasn't let go of you." },
    },
    silver_hand = { { id = "tp_silver_hand", text = "I was never one of Uther's knights, though I prayed beside some of them. The order is broken now, and the Crusade wears its colors and does it no honor." } },
    forsaken = { { id = "tp_forsaken", text = "Most of the Forsaken have turned their backs on the Light, and I understand why. I simply couldn't, and I've stopped apologizing for it." } },
    scourge = { { id = "tp_scourge", text = "The Scourge has no faith at all, only hunger. If I must choose between a painful faith and an easy hunger, I'll choose the pain." } },
    _none = { { id = "tp_none", text = "I can't say. Ask me about the Light; I've thought about little else." } },
  },
}
