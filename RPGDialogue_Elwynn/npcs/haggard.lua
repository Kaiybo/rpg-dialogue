-- Marshal Haggard, outside his manor south-east of Eastvale. Voice: bibles/haggard.md
-- Retired from the Guard, half blind, and still sore about his badge.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "haggard", id = TODO_NPC("Marshal Haggard"), name = "Marshal Haggard",
  bible = "bibles/haggard.md", role = "questgiver", tier = "quest",
  communities = { "eastvale" }, temper = { "proud" }, values = { "lawful", "brave" },
  notices = { "kit" },

  greetings = {
    { id = "g_squint", text = "Who's that? Come closer. No, closer. Ah. Don't know you." },
    { id = "g_back", when = { metBefore = true }, text = "That voice I know. Come up, come up." },
    { id = "g_badge", when = { questDone = TODO_QUEST("Dead-Tooth Jack") }, text = "There's the one who brought my badge home. Stand straight; I'm told I'm wearing it." },
  },

  notice = {
    { id = "n_shine", cat = "kit", when = { durability = { min = 0.9 } },
      text = "Something on you's catching the light. Good. Kept clean. A soldier who keeps his kit keeps his life." },
    { id = "n_rags", cat = "kit", when = { durability = { max = 0.25 } },
      text = "I can't see much, but I can hear that armor rattle. Loose rivets. Get them seen to before they get you killed." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Haggard. I ran the Stormwind Guard once, back when I could read a duty roster. Now I sit here and listen to the loggers swear." },
        { id = "h_jack_before", when = { questBefore = TODO_QUEST("Dead-Tooth Jack") },
          text = "A fellow came up the path in the dark wearing a Stormwind tabard. I took him for Dughan and handed him my old badge. A lifetime in uniform, and I fell for that." },
        { id = "h_jack_active", tags = { "news" }, when = { questActive = TODO_QUEST("Dead-Tooth Jack") },
          text = "Dead-tooth Jack, the loggers call him. Defias. Camps out south like a badger. Get my badge back and I'll not ask how." },
        { id = "h_jack_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Dead-Tooth Jack"), days = 3 } },
          text = "That's mine. I can feel the dent in the corner where a gnoll bit it, year of the bad winter. Don't tell anyone at the Keep how I lost it." },
        { id = "h_raven", key = true, when = { visited = "Darkshire" },
          text = "Darkshire, eh? Then you've seen the Scarlet Raven. My lads and I drank there for years. Smitts still pours?" },
        { id = "h_smitts", when = { heardLine = "smitts.m_default" },
          text = "Smitts told you about that business? Then you know more than my eyes ever will again. It never sat right with any of us." },
        { id = "h_soldier", when = { class = { "WARRIOR", "PALADIN" } },
          text = "Soldier's stance, you've got. Heavy on the back foot. Shift forward a touch. There. Now you're harder to knock down." },
        { id = "h_burlguard", tags = { "news" }, when = { questActive = TODO_QUEST("Marshal Haggard") },
          text = "Burlguard? Is that you? No. Walking up like that, I took you for a gnoll. Burlguard sent you, then. Come closer." },
      },
      again = {
        { id = "h_again", text = "Still there? Good. Speak up." },
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
        { text = "Rest easy, Marshal.", next = "END" },
      },
    },

    jack = {
      lines = {
        { id = "j_default", text = "Dead-tooth Jack. Came up in the dark in a Stormwind tabard. I took him for Dughan, gave him the badge, and he laughed all the way down the path." },
        { id = "j_done", when = { questDone = TODO_QUEST("Dead-Tooth Jack") },
          text = "It's back where it belongs, and the Defias are short one disguise. You did that. I'll not forget it." },
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
        { id = "jm_default", text = "Pride, some. Mostly what a Defias can do with a marshal's badge. Walk into places. Give orders. People believe a badge before they believe their eyes." },
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
        { text = "Your secret's safe.", next = "BACK", fx = { affinity = 2 } },
        { text = "Pride's a poor reason to keep quiet.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
      },
    },

    manor = {
      lines = {
        { id = "mn_default", text = "The Flintridges' old summer cottage. Came with papers in a dead man's hand. Mistmantle, I think. My eyes won't give me the rest." },
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
        { id = "gd_default", text = "Good men, mostly. Some fools. I kept every piece of kit I was ever issued, oiled and hung on the wall. Can't see it now. I know where it is." },
      },
      choices = {
        { text = "Where did you serve?", next = "guard_where" },
        { text = "Any advice for a new soldier?", next = "advice" },
        { text = "You must miss it.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    guard_where = {
      lines = {
        { id = "gw_default", text = "Wherever the Guard was sent. Darkshire, a good deal. We drank at the Scarlet Raven after long nights. Smitts poured; I paid. Mostly." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "night_watch" } } } },
    },
    advice = {
      lines = {
        { id = "a_default", text = "Never hand your badge to a man you can't see. There. Free of charge, and I paid dear for it." },
      },
      choices = {
        { text = "I'll remember.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Anything a little less personal?", next = "advice_more" },
      },
    },
    advice_more = {
      lines = {
        { id = "am_default", text = "Oil your blade every night, even when you're tired. Especially then. The night you skip it is the night you need it." },
      },
      choices = { { text = "Yes, Marshal.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } } },
    },

    eyes = {
      lines = {
        { id = "ey_default", text = "Bad enough I took a Defias for a marshal. Good enough I can tell you're not a gnoll. Probably." },
      },
      choices = {
        { text = "Let me lay hands on them.", next = "eyes_priest", when = { class = "PRIEST" } },
        { text = "I'll describe things for you.", next = "eyes_describe" },
        { text = "I'm sorry, Marshal.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    eyes_priest = {
      lines = {
        { id = "ep_default", text = "Priests have tried. The Light eased the ache but not the fog. Age isn't a wound, one told me. Try, if it pleases you." },
      },
      choices = {
        { text = "It pleases me. Hold still.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Then I'll pray for patience instead.", next = "BACK", fx = { trait = { pious = 1 } } },
      },
    },
    eyes_describe = {
      lines = {
        { id = "ed_default", text = "Ha! Go on, then. Is there still a woodpile by the gate? The loggers swear a bear sleeps behind it." },
      },
      choices = {
        { text = "No bear. Just a very fat dog.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "There's a bear.", next = "BACK", fx = { affinity = 1 } },
      },
    },

    darkshire = {
      lines = {
        { id = "dk_default", text = "The Raven still standing? Good. Tell Smitts old Haggard owes him nothing, and he'll know it's a lie." },
      },
      choices = { { text = "I'll tell him.", next = "BACK", fx = { affinity = 1 } } },
    },
    stalvan = {
      lines = {
        { id = "st_default", text = "A name on a page in my chest. I can't read it now. Smitts in Darkshire knows that story better than any man living. Ask him, not me." },
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
    background = { { id = "tp_bg", text = "Stormwind Guard, all my working life. Then my eyes went, so I came out here to let the loggers do the shouting." } },
    advice = {
      { id = "tp_ad", text = "Never hand your badge to a man you can't see. And keep your kit oiled.", next = "advice" },
      { id = "tp_ad2", text = "Stand with your weight forward. A man on his back foot is a man halfway to the ground." },
    },
    defias = { { id = "tp_defias", text = "Thieves dressed as officials, now. In my day they had the courtesy to look like thieves." } },
    eastvale = { { id = "tp_eastvale", text = "Quiet, mostly. Wolves at night. Raelen shouting by day. I prefer the wolves." } },
    stalvan = {
      { id = "tp_stalvan", text = "Ask Smitts at the Raven. I've only a page, and I can't read it.", next = "stalvan" },
      { id = "tp_stalvan2", text = "That name again. I'd sooner the chest stayed shut." },
    },
    _none = { { id = "tp_none", text = "Eh? Speak up. No, I don't know. I didn't know before you spoke up, either." } },
  },
}
