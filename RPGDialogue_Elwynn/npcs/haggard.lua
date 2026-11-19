-- Marshal Haggard, outside his manor south-east of Eastvale. Voice: bibles/haggard.md
-- Retired from the Guard, half blind, and still sore about his badge.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "haggard", id = TODO_NPC("Marshal Haggard"), name = "Marshal Haggard",
  bible = "bibles/haggard.md", role = "questgiver", tier = "quest",
  communities = { "eastvale" }, temper = { "proud" }, values = { "lawful", "brave" },
  notices = { "kit", "lock_shadow" },
  impression = {
    first = "Nearly blind, he listens to the path better than most men watch.",
    third = "{name} met old Marshal Haggard, once of the Stormwind Guard, who sits at home listening to the loggers swear.",
  },

  greetings = {
    { id = "g_squint", text = "Who's that there? Come a little closer, no, closer still... ah, I don't know you at all." },
    { id = "g_back", when = { metBefore = true }, text = "That voice I know! Come up, come up and sit." },
    { id = "g_badge", when = { questDone = TODO_QUEST("Dead-Tooth Jack") }, text = "There's the one who brought my badge home. Stand straight; I'm told I'm wearing it." },
    { id = "g_away", when = { away = 14 }, text = "That step on my stair sounds familiar, though I've not heard it for {away}. Come up and let an old man hear what you've been about." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You walk heavier than you used to, and I mean that kindly. That's the step of someone who's been in real fights since we last spoke." },
    { id = "g_word_intim", when = { word = "intimidated" }, text = "I've heard you've been putting the fear into folk around Eastvale. I ran the Guard long enough to know that's no way to win a town." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The lads at the camp tell me you've been doing good work round the vale. I can't see you, but I'll stand straighter for hearing it." },
  },

  notice = {
    { id = "n_shine", cat = "kit", when = { durability = { min = 0.9 } },
      text = "Something on you's catching the light, which means it's been kept clean. Good; a soldier who keeps his kit keeps his life." },
    { id = "n_rags", cat = "kit", when = { durability = { max = 0.25 } },
      text = "I can't see much, but I can hear that armor rattle from here. Those are loose rivets, so get them seen to before they get you killed." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "I smelled sulphur like that in the old war, when the orcs' warlocks walked ahead of the Horde and the sky went green over the forest, and it hasn't changed in all these years. Stand downwind, if you'd be so kind." },
  },

  start = "hello",
  nodes = {
    dd_haggard_def = {
      lines = {
        { id = "dd_haggard_def_a", text = "I'd guessed. Thirty years I wore the badge, and I've seen how it starts: a man isn't paid, so he takes, and then he's taking from the farmer next door. It's the nobles who should be answering for it, not just the men with bandanas." },
      },
      choices = {
        { text = "They chose to rob honest farmers. They answer for that.", next = "dd_haggard_def2", fx = { align = { order = 1 } } },
        { text = "The nobles cheated them. I'd have done the same, maybe.", next = "dd_haggard_def2", fx = { align = { order = -1 } } },
      },
    },
    dd_haggard_def2 = {
      lines = {
        { id = "dd_haggard_def2a", text = "Maybe so, and maybe not, and it's all the same to the farmer who's lost his barn. Keep your blade sharp and your head clear, and you'll do better than most who've come through Eastvale." },
      },
      choices = { { text = "I'll keep that in mind. Something else.", next = "BACK" } },
    },

    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Their lightning took good men, and I've not forgotten it. But you walk steady and honest, and I'll judge you on that." } },
      choices = {
        { text = "Judge me by my deeds, Marshal. That's all I ask.", next = "BACK", reply = "Fair enough, and that's how I'd judge any man. Sit, if you've a moment.", fx = { align = { order = 1 } } },
        { text = "The war's long past. Let the old fears go.", next = "BACK", reply = "Easy for you to say, friend, you weren't there. Old fears keep old soldiers alive.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "In the old war, when the orcs brought their warlocks over the Black Morass and burned the kingdom. I don't hold the trade against a human who learned it after, but I'll ask you to remember that the last ones to use it came here to kill us." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "In the old war, when the orcs brought their warlocks over the Black Morass and burned the kingdom, and their servants had the same eyes as the one at your heel. I don't hold the trade against a human who learned it after, but I'll ask you to remember that the last ones to use it came here to kill us." },
      },
      choices = {
        { text = "I'll remember it, Marshal, and use it against our enemies.", next = "BACK", reply = "Good, that's what I'd hoped you'd say. Turn it on the orcs if they ever come back.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Power isn't to blame for who used it.", next = "BACK", reply = "Maybe not, but I watched what it did in careless hands the year Goldshire burned, so be careful with yours.", fx = { align = { honor = -1 } } },
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Every winter, when the wolves came down hungry, and I lost more men to frostbite than to fangs. We never thought to ask the forest why, and maybe we should have, but soldiers don't ask questions of trees." } },
      choices = {
        { text = "A guard keeps the people safe first. You did right.", next = "BACK", reply = "I like to think so, though the frostbite took more than I'd like. Thank you for saying it.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "You should have asked. Fighting the forest only feeds the wolves.", next = "BACK", reply = "Maybe so, and I've thought on it more than once since. Too late now, for my lads.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Showing up, mostly, every watch and every bad night, without being asked twice. The ones who wanted glory didn't last, and the ones who wanted their mates to come home lasted forever, near enough." } },
      choices = {
        { text = "I'll fight for the ones beside me, not for glory.", next = "BACK", reply = "That's the right reason, and you'll last longer for it. I had a sergeant who said the same, and he outlived three captains.", fx = { align = { honor = 1 } } },
        { text = "Glory's what a soldier's remembered for, Marshal.", next = "BACK", reply = "Remembered by whom, though? The ones who came home remember the men who stood beside them.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "When we could get them, aye; a dwarf with a rifle found more Riverpaw camps in a month than my lads did in a year. One of you could find Dead-tooth Jack, the Defias who took my badge, in about an afternoon, I'd guess." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "When we could get them, aye; a dwarf with a rifle found more Riverpaw camps in a month than my lads did in a year. Your {pet} has the look of a tracker, so point it at Dead-tooth Jack's camp and it'll do my old badge proud." },
      },
      choices = {
        { text = "I'd track for the Guard gladly.", next = "BACK", reply = "The Guard would be glad of you, and so would I. Dughan's always short.", fx = { align = { honor = 1 } } },
        { text = "I'd track for whoever paid most.", next = "BACK", reply = "That's honest, at least, and I'd still hire you. Times are tight.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Forty years in the Guard teaches you that honest men make noise, and the ones who don't are either rogues or Defias. You'd better be the first sort, because I've still a sword under this blanket." } },
      choices = {
        { text = "I'm no Defias, Marshal. You have my word on that.", next = "BACK", reply = "Good, and I'll keep my sword where it is, then. Sit down.", fx = { align = { honor = 1 } } },
        { text = "Honest men make noise, and they die young, Marshal.", next = "BACK", reply = "Some do, aye, and I've buried plenty. But I'd still take a noisy honest man over a quiet thief.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "In the Second War, aye, and a mage from Dalaran saved my company in the Hillsbrad foothills by setting a whole hillside on fire. She set half my tents on fire as well, mind, and we never let her forget it." } },
      choices = {
        { text = "She saved your company. The tents were a fair price.", next = "BACK", reply = "It was, and I'd say so to her face if I could find her. We still laugh about it.", fx = { align = { honor = 1 } } },
        { text = "She should have been more careful. Mistakes cost lives.", next = "BACK", reply = "She was, after, and I'll not argue it. But she saved more than she cost.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The lads I served with in the Guard, the ones who aren't sitting in the sun like me, and my eyes, if you've a prayer that does that. The Brothers tried once, and it helped a little, though the dark still comes in at the edges." } },
      choices = {
        { text = "I'll pray for them, and for you, Marshal.", next = "BACK", reply = "Thank you, friend, and I'll take every word. The lads would be glad of it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Eyes fail with age, Haggard. Prayer won't change that.", next = "BACK", reply = "No, I suppose it won't, and I've made my peace with it, mostly. Kind of you to be honest.", fx = { align = { light = -1 } } },
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Knowing when to look away and when not to, and most of the young ones get those backward. I let a lot of small things go in my day, but never a man who preyed on the weak, and I'd tell you the same, whatever oath you've sworn." } },
      choices = {
        { text = "The law must be kept in small things too.", next = "BACK", reply = "Spoken like a young one with a new oath. Wait till you've held a badge for forty years.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some small sins aren't worth the chain. Mercy keeps the peace.", next = "BACK", reply = "That's the lesson, and you've learned it faster than most. You'd have made a good marshal.", fx = { align = { order = -1 } } },
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "dd_defias_haggard", when = { killed = { name = "Defias", min = 40 } },
          text = "You've put a fair few Defias in the ground, by the talk on the road. I've no love for them, but mind they were stonemasons once, and their wives still live in Stormwind." },
        { id = "dd_hogger_haggard", when = { questDone = TODO_QUEST("WANTED: \"Hogger\"") },
          text = "Dughan's finally got Hogger's claw on his wall, and they say it was you who brought it in. I chased that gnoll for two summers when I was younger and never got near him, so you've my respect for it." },

        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest? My eyes aren't what they were, but I know the smell of incense, so sit down; you're the first one up here in a month who isn't swearing." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. I served beside a few of your sort in the Second War, and they were the only ones who didn't sing on the march." },
        { id = "h_default", text = "I'm Haggard, and I ran the Stormwind Guard once, back when I could read a duty roster. Now I sit here and listen to the loggers swear, and lately I can't even keep hold of my own badge." },
        { id = "h_jack_before", when = { questBefore = TODO_QUEST("Dead-Tooth Jack") },
          text = "A fellow came up the path in the dark wearing a Stormwind tabard. I took him for Marshal Dughan and handed him my old badge. A lifetime in uniform, and I fell for that." },
        { id = "h_jack_active", tags = { "news" }, when = { questActive = TODO_QUEST("Dead-Tooth Jack") },
          text = "Dead-tooth Jack, the loggers call him, a Defias who camps out south like a badger in a hole. Get my badge back and I'll not ask how you did it." },
        { id = "h_jack_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Dead-Tooth Jack"), days = 3 } },
          text = "That's mine. I can feel the dent in the corner where a gnoll bit it, year of the bad winter. Don't tell anyone at the Keep how I lost it." },
        { id = "h_raven", key = true, when = { visited = "Darkshire" },
          text = "Darkshire, eh? Then you've seen the Scarlet Raven, where my lads and I drank for years. Does Smitts still pour?" },
        { id = "h_smitts", when = { heardLine = "smitts.m_default" },
          text = "Smitts told you about that business? Then you know more than my eyes ever will again. It never sat right with any of us." },
        { id = "h_soldier", when = { class = { "WARRIOR", "PALADIN" } },
          text = "You've a soldier's stance, but you're heavy on the back foot. Shift forward a touch... there, now you're harder to knock down." },
        { id = "h_burlguard", tags = { "news" }, when = { questActive = TODO_QUEST("Marshal Haggard") },
          text = "Is that Burlguard? No, it isn't, and walking up like that, I nearly took you for a gnoll. So Burlguard sent you, did he? Come closer." },
        { id = "h_woodsman", when = { origin = "human_eastvale_woodsman" },
          text = "That voice. You're one of the Eastvale woodsfolk who used to bring wolf pelts to the logging camp, aren't you? Grown, and with a bow; my eyes can't see you, but my ears remember." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "I can't see you, but I can't hear you either, which tells me plenty. You're one of the quiet ones, aren't you?" },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "There's a hum in the air when you're near, like a hive. That'll be a mage, then, or else my ears are going the way of my eyes." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. We had a few in the Guard, back when, for tracking deserters and gnolls. Handy folk, and quiet." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A night elf, by the sound of you, or rather by the lack of it. You walk quieter than any soldier I ever commanded." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I can't see well any more, but I can smell sulphur, and I've smelled it before." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, I hear, by the step. I ran the Stormwind Guard once, and I fought orc shamans in the Second War. Forgive an old man if he's wary." },
      },
      again = {
        { id = "h_again", text = "If you're still there, speak up, will you?" },
        { id = "h_again2", text = "Go on. My ears work, even if nothing else does." },
      },
      choices = {
        { text = "I've fought a good many Defias, Marshal.", next = "dd_haggard_def", when = { killed = { name = "Defias", min = 40 } } },

        { text = "What happened to your badge?", next = "jack" },
        { text = "Whose house was this before you, Marshal?", next = "manor" },
        { text = "Tell me about the Guard.", next = "guard" },
        { text = "Your eyes seem to be failing you, Marshal.", next = "eyes" },
        { text = "I've been to Darkshire.", next = "darkshire", when = { visited = "Darkshire" } },
        { text = "Who was Stalvan Mistmantle?", next = "stalvan", when = { topicKnown = "stalvan" } },
        { text = "My family's name opens doors at the Keep.", next = "noble", when = { origin = "human_minor_noble" } },
        { text = "You knew I was a rogue before I spoke, Marshal.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "You must have fought beside mages in the Guard.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What made a good soldier, back when you led the Guard?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "I hear the Guard used hunters for tracking.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Is there anyone you'd like remembered in prayer, Haggard?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What makes a good guardsman, Marshal Haggard?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Did the Guard ever have to fight the beasts of this forest?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Where did you smell it before, Marshal?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Were the orc shamans you fought really that fearsome, Marshal?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Rest easy, Marshal.", next = "END" },
      },
    },

    jack = {
      lines = {
        { id = "j_default", text = "A Defias called Dead-tooth Jack came up in the dark in a Stormwind tabard. I took him for Marshal Dughan and gave him the badge, and he laughed all the way down the path." },
        { id = "j_done", when = { questDone = TODO_QUEST("Dead-Tooth Jack") },
          text = "It's back where it belongs, and the Defias are short one disguise because of you. I'll not forget it." },
      },
      choices = {
        { text = "A retired badge seems a small thing to lose.", next = "jack_matter" },
        { text = "You should tell the Keep.", next = "jack_keep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jack_matter = {
      big = true,
      lines = {
        { id = "jm_default", text = "Pride, some of it. Mostly it's what a Defias can do with a marshal's badge: walk into places and give orders, because people believe a badge before they believe their own eyes." },
      },
      choices = {
        { text = "I'll get it back.", next = "BUSINESS", when = { class = "WARRIOR" }, fx = { affinity = 2, align = { order = 1 } } },
        { text = "Then it's a danger to everyone.", next = "BACK", reply = "It is, and that's why I want it back. Find Jack, friend, and the badge with him.", fx = { align = { order = 1 }, learn = { "defias" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jack_keep = {
      lines = {
        { id = "jk_default", text = "And have Marshal Dughan hear I took a thief for him? I'd sooner eat the badge when it's back." },
      },
      choices = {
        { text = "Your secret's safe.", next = "BACK", reply = "Thank you, and I'll not forget it. Dughan doesn't need to know everything.", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "Pride's a poor reason to keep quiet.", next = "BACK", reply = "Maybe it is, but it's the only pride I've got left. Leave an old man that much.", fx = { affinity = -1, align = { order = 1 } } },
      },
    },

    manor = {
      lines = {
        { id = "mn_default", text = "It was the Flintridges' old summer cottage, and it came with papers in a dead man's hand. Mistmantle, I think the name was, but my eyes won't give me the rest." },
      },
      choices = {
        { text = "I could read them for you.", next = "manor_papers", fx = { trait = { curious = 1 } } },
        { text = "Some papers are best left alone.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    manor_papers = {
      lines = {
        { id = "mp_default", text = "There's a chest upstairs full of parchments, and I looked once, before the fog came over my eyes. The handwriting looked familiar." },
        { id = "mp_low", when = { maxLevel = 21 },
          text = "Not today. That chest's been shut since I moved in, and something about it makes the back of my neck itch. Come back when you've more years on you." },
      },
      choices = {
        { text = "Familiar how?", next = "stalvan", fx = { learn = { "stalvan" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    guard = {
      lines = {
        { id = "gd_default", text = "Good men, mostly, and some fools. I kept every piece of kit I was ever issued, oiled and hung on the wall, and though I can't see it now, I know where every piece is." },
      },
      choices = {
        { text = "Where did you serve?", next = "guard_where" },
        { text = "Any advice for a new soldier?", next = "advice" },
        { text = "You must miss it.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    guard_where = {
      lines = {
        { id = "gw_default", text = "Wherever the Guard was sent, and Darkshire a good deal of the time. We drank at the Scarlet Raven after the long nights; Smitts poured and I paid, mostly." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } } },
    },
    advice = {
      lines = {
        { id = "a_default", text = "Never hand your badge to a man you can't see. There's my advice, free of charge, and I paid dear for it." },
      },
      choices = {
        { text = "I'll remember.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Anything a little less personal?", next = "advice_more" },
      },
    },
    advice_more = {
      lines = {
        { id = "am_default", text = "Oil your blade every night, even when you're tired, and especially then, because the night you skip it is the night you'll need it." },
      },
      choices = {
        { text = "Yes, Marshal.", next = "BACK", reply = "Good, and see you do. It's the only advice I'll give for free.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll care for my blade my own way, Marshal.", next = "BACK", reply = "Your way, then, so long as you do it every night. Don't let it rust.", fx = { align = { order = -1 } } },
      },
    },

    eyes = {
      lines = {
        { id = "ey_default", text = "Bad enough that I took a Defias for a marshal, but good enough that I can tell you're probably not a gnoll." },
      },
      choices = {
        { text = "Let me lay hands on them.", next = "eyes_priest", when = { class = "PRIEST" } },
        { text = "I'll describe things for you.", next = "eyes_describe" },
        { text = "I'm sorry, Marshal.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    eyes_priest = {
      lines = {
        { id = "ep_default", text = "Priests have tried before, and the Light eased the ache but never the fog. Age isn't a wound, one of them told me, but you're welcome to try if it pleases you." },
      },
      choices = {
        { text = "It pleases me. Hold still.", next = "BACK", reply = "Holding still, and go gently with an old soldier. The ache's eased already.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "If the Light can't clear the fog, I won't waste it.", next = "BACK", reply = "Fair enough, and I'll not hold it against you. The Brothers said the same thing, kinder.", fx = { align = { light = -1 } } },
        { text = "Then I'll pray for patience instead.", next = "BACK", fx = { trait = { pious = 1 } } },
      },
    },
    eyes_describe = {
      lines = {
        { id = "ed_default", text = "Ha! Go on, then: is there still a woodpile by the gate? The loggers swear there's a bear asleep behind it." },
      },
      choices = {
        { text = "No bear. Just a very fat dog.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "There's a bear.", next = "BACK", fx = { affinity = 1 } },
      },
    },

    darkshire = {
      lines = {
        { id = "dk_default", text = "So the Raven's still standing; that's good. Tell Smitts old Haggard owes him nothing, and he'll know it for a lie." },
      },
      choices = { { text = "I'll tell him.", next = "BACK", fx = { affinity = 1 } } },
    },
    stalvan = {
      lines = {
        { id = "st_default", text = "It's a name on a page in my chest, and I can't read it now. Smitts in Darkshire knows that story better than any man living, so ask him, not me." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "stalvan" } } } },
    },
    noble = {
      lines = {
        { id = "nb_default", text = "Then use it to open Marshal Dughan's door, and say nothing whatever about my badge. That's the best use of a noble name I've heard in years." },
      },
      choices = {
        { text = "Not a word.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I may not see much these days, but there's nothing wrong with my ears. Ask me about any of this, and speak up." },
    },
    background = { { id = "tp_bg", text = "I served in the Stormwind Guard all my working life, and when my eyes went, I came out here to let the loggers do the shouting." } },
    advice = {
      { id = "tp_ad", text = "Never hand your badge to a man you can't see, and keep your kit oiled.", next = "advice" },
      { id = "tp_ad2", text = "Stand with your weight forward, because a man on his back foot is a man halfway to the ground." },
    },
    defias = { { id = "tp_defias", text = "The Defias dress as officials now, when in my day they had the courtesy to look like thieves." } },
    eastvale = { { id = "tp_eastvale", text = "Quiet, mostly, with wolves at night and Supervisor Raelen shouting by day. I prefer the wolves." } },
    stalvan = {
      { id = "tp_stalvan", text = "Ask Smitts at the Raven. I've only a page, and I can't read it.", next = "stalvan" },
      { id = "tp_stalvan2", text = "That name again. I'd sooner the chest stayed shut." },
    },
    _none = { { id = "tp_none", text = "Eh? Speak up! No, I don't know, and I didn't know before you spoke up, either." } },
    second_war = { { id = "tp_second_war", text = "I led the city watch through the Second War, when every night was fire and every morning was a list of names. I can't see the old faces now, but I can still hear them." } },
    varian = { { id = "tp_varian", text = "I knew Varian when he first wore the crown, a good lad with a temper, and he listened when old soldiers spoke. Wherever he's gone, he didn't go without a reason, and I'd stake my badge on that if I still had it." } },
    bolvar = { { id = "tp_bolvar", text = "Bolvar Fordragon was a squire when I was already going grey, and he's a better man than most who've worn plate. If anyone can hold that city together for the boy, it's him." } },
    prestor = { { id = "tp_prestor", text = "My eyes are going, but I hear well enough, and I've heard Lady Prestor speak. Hers is a voice that makes men agree before they've thought about it, and I've never trusted voices like that." } },
    lost_footmen = { { id = "tp_lost_footmen", text = "Rolf and Malakai went up the river on Guard Thomas's orders and haven't come back. Thomas is a good lad, but he's carrying it, and you can hear it every time he speaks." } },
    the_stockade = { { id = "tp_the_stockade", text = "In my day we filled the Stockade with pickpockets and drunks. Now it's full of masked men from Westfall, and I'm told the walls are none too sound." } },
    heroes_vigil = { { id = "tp_heroes_vigil", text = "The Stone of Remembrance on Stone Cairn Lake was raised for the dead of the First War, and I stood guard at its dedication. Rogue wizards hold it now, I hear, and I'd throw them in the lake myself if I could see them." } },
  },
}
