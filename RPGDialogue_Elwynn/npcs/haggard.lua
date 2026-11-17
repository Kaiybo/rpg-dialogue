-- Marshal Haggard, outside his manor south-east of Eastvale. Voice: bibles/haggard.md
-- Retired from the Guard, half blind, and still sore about his badge.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "haggard", id = TODO_NPC("Marshal Haggard"), name = "Marshal Haggard",
  bible = "bibles/haggard.md", role = "questgiver", tier = "quest",
  communities = { "eastvale" }, temper = { "proud" }, values = { "lawful", "brave" },
  notices = { "kit" },
  impression = {
    first = "Nearly blind and still every inch a soldier, Marshal Haggard listens to the path below his door more closely than most men watch one. He ran the Stormwind Guard once, and he hasn't forgotten it.",
    third = "{name} met old Marshal Haggard, once of the Stormwind Guard, who sits at home listening to the loggers swear.",
  },

  greetings = {
    { id = "g_squint", text = "Who's that there? Come a little closer, no, closer still... ah, I don't know you at all." },
    { id = "g_back", when = { metBefore = true }, text = "That voice I know! Come up, come up and sit." },
    { id = "g_badge", when = { questDone = TODO_QUEST("Dead-Tooth Jack") }, text = "There's the one who brought my badge home. Stand straight; I'm told I'm wearing it." },
  },

  notice = {
    { id = "n_shine", cat = "kit", when = { durability = { min = 0.9 } },
      text = "Something on you's catching the light, which means it's been kept clean. Good; a soldier who keeps his kit keeps his life." },
    { id = "n_rags", cat = "kit", when = { durability = { max = 0.25 } },
      text = "I can't see much, but I can hear that armor rattle from here. Those are loose rivets, so get them seen to before they get you killed." },
  },

  start = "hello",
  nodes = {
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Every winter, when the wolves came down hungry, and I lost more men to frostbite than to fangs. We never thought to ask the forest why, and maybe we should have, but soldiers don't ask questions of trees." } },
      choices = {
        { text = "A guard keeps the people safe first. You did right.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "You should have asked. Fighting the forest only feeds the wolves.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Showing up, mostly, every watch and every bad night, without being asked twice. The ones who wanted glory didn't last, and the ones who wanted their mates to come home lasted forever, near enough." } },
      choices = {
        { text = "I'll fight for the ones beside me, not for glory.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Glory's what a soldier's remembered for, Marshal.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "When we could get them, aye; a dwarf with a rifle found more Riverpaw camps in a month than my lads did in a year. Dead-tooth Jack's camp would take one about an afternoon, I'd guess." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has the look of a tracker. Point it at Jack's camp and it'll do my old badge proud." },
      },
      choices = {
        { text = "I'd track for the Guard gladly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'd track for whoever paid most.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Forty years in the Guard teaches you that honest men make noise, and the ones who don't are either rogues or Defias. You'd better be the first sort, because I've still a sword under this blanket." } },
      choices = {
        { text = "I'm no Defias, Marshal. You have my word on that.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Honest men make noise, and they die young, Marshal.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "In the Second War, aye, and a mage from Dalaran saved my company in the Hillsbrad foothills by setting a whole hillside on fire. Mind you, she set half my tents on fire as well, and we never let her forget it." } },
      choices = {
        { text = "She saved your company. The tents were a fair price.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "She should have been more careful. Mistakes cost lives.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The lads I served with in the Guard, the ones who aren't sitting in the sun like me, and my eyes, if you've a prayer that does that. The Brothers tried once, and it helped a little, though the dark still comes in at the edges." } },
      choices = {
        { text = "I'll pray for them, and for you, Captain.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Eyes fail with age, Haggard. Prayer won't change that.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Knowing when to look away and when not to, and most of the young ones get those backward. I let a lot of small things go in my day, but never a man who preyed on the weak, and I'd tell you the same, whatever oath you've sworn." } },
      choices = {
        { text = "The law must be kept in small things too.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some small sins aren't worth the chain. Mercy keeps the peace.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Captain.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest? My eyes aren't what they were, but I know the smell of incense, so sit down; you're the first one up here in a month who isn't swearing." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. I served beside a few of your sort in the Second War, and they were the only ones who didn't sing on the march." },
        { id = "h_default", text = "Haggard. I ran the Stormwind Guard once, back when I could read a duty roster. Now I sit here and listen to the loggers swear." },
        { id = "h_jack_before", when = { questBefore = TODO_QUEST("Dead-Tooth Jack") },
          text = "A fellow came up the path in the dark wearing a Stormwind tabard. I took him for Dughan and handed him my old badge. A lifetime in uniform, and I fell for that." },
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
          text = "Burlguard, is that you? No, it isn't; walking up like that, I took you for a gnoll. So Burlguard sent you, did he? Come closer." },
        { id = "h_woodsman", when = { origin = "human_eastvale_woodsman" },
          text = "That voice. You're one of the Eastvale woodsfolk who used to bring wolf pelts to the logging camp, aren't you? Grown, and with a bow; my eyes can't see you, but my ears remember." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "I can't see you, but I can't hear you either, which tells me plenty. You're one of the quiet ones, aren't you?" },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "There's a hum in the air when you're near, like a hive. That'll be a mage, then, or else my ears are going the way of my eyes." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. We had a few in the Guard, back when, for tracking deserters and gnolls. Handy folk, and quiet." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf, by the sound of you, or rather by the lack of it. You walk quieter than any soldier I ever commanded." },
      },
      again = {
        { id = "h_again", text = "If you're still there, speak up, will you?" },
        { id = "h_again2", text = "Go on. My ears work, even if nothing else does." },
      },
      choices = {
        { text = "What happened to your badge?", next = "jack" },
        { text = "What's in the manor?", next = "manor" },
        { text = "Tell me about the Guard.", next = "guard" },
        { text = "How bad are your eyes?", next = "eyes" },
        { text = "I've been to Darkshire.", next = "darkshire", when = { visited = "Darkshire" } },
        { text = "Who was Stalvan Mistmantle?", next = "stalvan", when = { topicKnown = "stalvan" } },
        { text = "My family's name opens doors at the Keep.", next = "noble", when = { origin = "human_minor_noble" } },
        { text = "How did you know I was a rogue, Marshal?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Did you ever fight beside mages in the Guard?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What made a good soldier, back when you led the Guard?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Did the Guard really use hunters for tracking?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Is there anyone you'd like remembered in prayer, Haggard?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What makes a good guardsman, Captain Haggard?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Did the Guard ever have to fight the beasts of this forest?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Rest easy, Marshal.", next = "END" },
      },
    },

    jack = {
      lines = {
        { id = "j_default", text = "Dead-tooth Jack. Came up in the dark in a Stormwind tabard. I took him for Dughan, gave him the badge, and he laughed all the way down the path." },
        { id = "j_done", when = { questDone = TODO_QUEST("Dead-Tooth Jack") },
          text = "It's back where it belongs, and the Defias are short one disguise because of you. I'll not forget it." },
      },
      choices = {
        { text = "Why does a retired badge matter so much?", next = "jack_matter" },
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
        { text = "Then it's a danger to everyone.", next = "BACK", fx = { align = { order = 1 }, learn = { "defias" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jack_keep = {
      lines = {
        { id = "jk_default", text = "And have Dughan hear I took a thief for him? I'd sooner eat the badge when it's back." },
      },
      choices = {
        { text = "Your secret's safe.", next = "BACK", fx = { align = { order = -1 }, affinity = 2 } },
        { text = "Pride's a poor reason to keep quiet.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
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
        { id = "mp_default", text = "There's a chest upstairs full of parchments. I looked once, before the fog came over my eyes. The hand looked familiar." },
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
        { text = "Yes, Marshal.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll care for my blade my own way, Marshal.", next = "BACK", fx = { align = { order = -1 } } },
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
        { text = "It pleases me. Hold still.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "If the Light can't clear the fog, I won't waste it.", next = "BACK", fx = { align = { light = -1 } } },
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
        { id = "nb_default", text = "Then knock on Dughan's and say nothing whatever about my badge. That's the best use of a noble name I've heard in years." },
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
    background = { { id = "tp_bg", text = "Stormwind Guard, all my working life. Then my eyes went, so I came out here to let the loggers do the shouting." } },
    advice = {
      { id = "tp_ad", text = "Never hand your badge to a man you can't see. And keep your kit oiled.", next = "advice" },
      { id = "tp_ad2", text = "Stand with your weight forward. A man on his back foot is a man halfway to the ground." },
    },
    defias = { { id = "tp_defias", text = "Thieves dressed as officials, now. In my day they had the courtesy to look like thieves." } },
    eastvale = { { id = "tp_eastvale", text = "Quiet, mostly, with wolves at night and Raelen shouting by day. I prefer the wolves." } },
    stalvan = {
      { id = "tp_stalvan", text = "Ask Smitts at the Raven. I've only a page, and I can't read it.", next = "stalvan" },
      { id = "tp_stalvan2", text = "That name again. I'd sooner the chest stayed shut." },
    },
    _none = { { id = "tp_none", text = "Eh? Speak up! No, I don't know, and I didn't know before you spoke up, either." } },
  },
}
