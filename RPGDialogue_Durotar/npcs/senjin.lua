-- Sen'jin Village: the Darkspear's shore, within sight of the isles they lost. Voice: bibles/durotar.md
local P = RPGDialogueAPI:Pack("rpgd.durotar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gadrin", id = TODO_NPC("Master Gadrin"), name = "Master Gadrin",
  bible = "bibles/durotar.md", role = "priest", tier = "major",
  communities = { "senjin" }, temper = { "folksy" }, values = { "wise", "proud" },
  notices = { "race", "class", "origin" },
  impression = {
    first = "Master Gadrin taught Vol'jin and Zalazane both, and only one of them makes him proud. He jokes about his old teeth, but the shame of Zalazane plainly keeps him from sleeping through the night.",
    third = "{name} met Master Gadrin at Sen'jin Village, the old Darkspear witch doctor who once taught both Vol'jin and Zalazane.",
  },

  greetings = {
    { id = "g_hut", text = "Come, come, Gadrin don't bite. Not anymore, anyway; the teeth be too old." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you visit the old man again. Sit; the fire be warm." },
    { id = "g_away", when = { away = 14 }, text = "Ah, you been gone {away}, and the old man worried a little, though he won't tell you how much. Sit by the fire, mon." },
    { id = "g_away_long", when = { away = 60 }, text = "You been away {away}, mon, and Gadrin started to fear he lost another student. Sit, and let the old man have a look at you." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You got stronger since we last talk, mon, and Gadrin can see it in how you stand. A teacher likes that, even when it's not his teaching." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "The village say somebody caught you in a lie. Gadrin had a student once who lied with a smile, so forgive him if he watches your face a while." },
    { id = "g_apprentice", when = { origin = "troll_witch_doctor_apprentice" }, text = "Ah, the root-grinder! You still got the green under your nails, mon, and the old witch doctor you served still tell me you was the only apprentice who never let the pot boil over." },
  },

  notice = {
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear child! Let me look at you, so strong. You going to do the tribe proud, I can tell." },
    { id = "n_shaman", cat = "class", when = { class = { "SHAMAN", "PRIEST", "MAGE" } },
      text = "You got the spark, eh? Careful with it. I teach two boys with the spark once, and only one of them listen." },
    { id = "n_sailed", cat = "origin", when = { origin = "troll_sailed_with_thrall" },
      text = "You was on the boats when the Warchief come, eh? I see it in how you stand by the water, never with your back to it. Sen'jin swear our debt to the Horde that day, and you and me both hear him do it." },
  },

  start = "hello",
  nodes = {
    xcl_zf = {
      big = true,
      lines = { { id = "xcl_zf_default", text = "Then you see what Zalazane be wantin' to make of the Echo Isles. The Sandfury witch doctors drag their dead back up to guard the walls and call it devotion, but a spirit pulled back into rotten flesh never be grateful for it. I teach my students that the dead deserve rest, and Zul'Farrak be a whole city that forget it." } },
      choices = {
        { text = "The dead deserve their rest, whoever raised them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If the dead can still fight, it's a waste not to use them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "You must have known the Sandfury witch doctors.", next = "xcl_zf2" },
      },
    },
    xcl_zf2 = {
      lines = { { id = "xcl_zf2_default", text = "No, mon, and Gadrin be glad of it. The Darkspear and the Sandfury both learn the old voodoo, but they learn different lessons from it, and the Sandfury lesson be that power over the dead be power enough. That be the same lesson Zalazane learn, and look where it take him." } },
      choices = { { text = "Then I'll remember the right lesson, Master Gadrin.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Fear? No. Watch? Yes. Zalazane twist the dead on the Echo Isles into his slaves, and you be dead with a power he never touch. Maybe that make you safe, maybe not. The loa decide, and I listen." } },
      choices = {
        { text = "I'll prove I'm no one's slave, Master.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I serve the Dark Lady and the Horde. Ask no more.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "He take what the loa give for healin' and turn it to bindin' his own people, mon. Now the Echo Isles be full of Darkspear with his hex on them, and I wake up some nights thinkin' I should have seen it in him when he was small." } },
      choices = {
        { text = "Then I'll use the loa's gifts as they were meant.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power given is power to use as you see fit.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Gently, if you can, and that be what a warrior find hardest. Zalazane's voodoo turn our own people against us, and when the hex break they wake up confused and ashamed, so knock them down if you must, but don't kill a troll who can still come home." } },
      choices = {
        { text = "I'll spare the hexed ones, Master Gadrin.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A spear in my face is a spear. I'll do what I must.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Maybe, though Zalazane hides on the Echo Isles behind his voodoo and his hexed Darkspear, and they be our own people under the spell. Cut the witch doctor if you can reach him, but spare the hexed ones, because they be family still." },
      },
      choices = {
        { text = "I'll spare the hexed. They're Darkspear, after all.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "In a fight, I can't stop to ask who's hexed.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "The spirits, yes, once Zalazane be dead and his voodoo with him. The trolls he twisted, I don't know, and I pray to the loa every night that I find out." } },
      choices = {
        { text = "Then save every troll you can.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "His slaves are lost. End them cleanly.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead one wieldin' the Light. I teach witch doctors, and I tell them always to watch the dead careful. You be the strangest dead I ever see." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, mon, and one I didn't teach. That be good, because the last few I taught don't make me proud." },
        { id = "h_default", key = true,
          text = "I be Master Gadrin, and I teach the Darkspear witch doctors. I teach Vol'jin once, and Zalazane, and one of them I be proud of." },
        { id = "h_skull", when = { questActive = TODO_QUEST("Minshina's Skull") },
          text = "Minshina's skull sit on the isles in bad hands. Bring it to me, because she deserve better." },
        { id = "h_cl_zf", tags = { "news" }, when = { cleared = "Zul'Farrak", faction = "Horde" }, text = "You been to Zul'Farrak and back, eh? The Sandfury be cousins of a sort, mon, but cousins who raise their own dead to guard the gates, so Gadrin won't weep for them." },
        { id = "h_zalazane", tags = { "news" }, when = { questActive = TODO_QUEST("Zalazane") },
          text = "Zalazane be my student once, and now he be the shame of my years. End him, and maybe this old man sleep through the night." },
        { id = "h_orgnil", when = { questActive = TODO_QUEST("Report to Orgnil") },
          text = "Orgnil in Razor Hill need strong arms against the Burning Blade. Go to him, and tell him Gadrin say you be useful." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid come to Sen'jin! The loa of the islands and your Earth Mother be old friends, I think, but Zalazane be twisting the spirits on the Echo Isles so bad that they barely know each other now." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "You move quiet as a raptor in the grass, mon. Zalazane's hexed ones never hear you coming, I bet." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, mon. Good, because the hexed Darkspear on the Echo Isles still swing their spears, even when Zalazane be the one pullin' the strings." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Hexed", min = 20 } }, text = "Fewer of the hexed trolls stagger about the Echo Isles now, and my people say a stranger has been giving them rest. Zalazane will feel that, and he'll not like it." },
        { id = "h_echo", when = { origin = "troll_echo_isles" }, text = "You born on the isles, child, I remember, and you cry the whole way across the water when we leave. Now you come back with a weapon on your back, and Gadrin think maybe the isles be crying for you instead." },
      },
      choices = {
        { text = "What did Zalazane do with the loa's gifts, Master Gadrin?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Can Zalazane's corruption be undone, Master Gadrin?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What happened on the Echo Isles?", next = "isles" },
        { text = "So Vol'jin was your student.", next = "voljin" },
        { text = "The loa been talking to me again, Master. Loudly.", next = "xloa", when = { origin = "troll_loa_speaker" } },
        { text = "What does the loa want from me, Master? I never asked.", next = "xwant", when = { origin = "troll_witch_doctor_apprentice" } },
        { text = "I hear a voice, Master, and it isn't a loa.", next = "warlock", when = { race = "Troll", class = "WARLOCK" } },
        { text = "The spirits answer me now. Teach me to listen better.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "I studied the arcane, Master. Is that so strange?", next = "mage", when = { race = "Troll", class = "MAGE" } },
        { text = "I hunt heads for the tribe, the old way.", next = "headhunter", when = { race = "Troll", class = "HUNTER" } },
        { text = "A rogue could help you against Zalazane.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "How do I fight the hexed Darkspear, Master Gadrin?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Should a troll fear a Forsaken paladin, Master?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I've been to the heart of Zul'Farrak, Master Gadrin.", next = "xcl_zf", when = { cleared = "Zul'Farrak", faction = "Horde" } },
        { text = "Thank you, Master.", next = "END" },
      },
      again = {
        { id = "h_again", text = "What else, child? Old Gadrin got nothing but time and a warm fire." },
        { id = "h_again2", text = "Ask, ask. The questions keep this old head from rusting." },
      },
    },
    warlock = {
      big = true,
      lines = {
        { id = "wl_default", text = "Ah, child, sit down, because now I be afraid for you. Zalazane hear a voice that wasn't a loa too, and he tell me it was only power, and look at the isles now." },
        { id = "wl_other", when = { origin = "troll_other_voice" },
          text = "You hear it since you was small, eh? Zalazane too, and I tell him it be nothing. I don't make that mistake twice, so you tell me every time it speak." },
      },
      choices = {
        { text = "I'm not Zalazane. I command it, not the other way.", next = "warlock_command" },
        { text = "Then I'll come to you whenever it speaks.", next = "BACK", fx = { affinity = 3, align = { light = 1 } } },
        { text = "The power's mine to use, Master, voice or no voice.", next = "BACK", fx = { affinity = -2, align = { light = -1 } } },
      },
    },
    warlock_command = {
      lines = { { id = "wc_default", text = "He say that too, in this same hut, sitting where you sit. I believe you mean it, child, and I believe he meant it, and that be what keep me up at night." } },
      choices = { { text = "Then watch me, Master. I'll prove it.", next = "BACK", fx = { affinity = 1 } } },
    },
    shaman = {
      lines = {
        { id = "sh_default", text = "Good, good! The Warchief bring the old ways back to the orcs, and now they come back to us too. You listen to the water first, because on this shore the sea always talk loudest." },
        { id = "sh_orc", when = { race = "Orc" },
          text = "An orc shaman, coming to an old troll for listening lessons, eh? The Warchief's teachers be good, but the sea here, it speak troll, and I translate." },
      },
      choices = {
        { text = "What does the sea say about the isles?", next = "shaman_sea" },
        { text = "I'll listen to the water.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    shaman_sea = {
      lines = { { id = "ss_default", text = "It say the isles be sick, and the sickness spread a little every tide. Zalazane's magic poison the water spirits too, so a shaman who help free the isles heal more than the Darkspear." } },
      choices = { { text = "Then I'll help free them.", next = "BACK", fx = { affinity = 2, learn = { "echo_isles" } } } },
    },
    mage = {
      lines = { { id = "ma_default", text = "Strange? A little, yes, because the Darkspear got the loa and the witch doctors and never need human books. But a sharp mind be a sharp mind, and Zalazane prove a witch doctor can go wrong too, so I judge the student and not the school." } },
      choices = {
        { text = "The tribe needs every kind of power it can get.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll keep the old ways close, beside the new.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
      },
    },
    headhunter = {
      lines = { { id = "hd_default", text = "The old way, eh? That be good to hear, child, so bring the tribe's enemies down clean and give their spirits to the loa proper, and never take a head for pride, because that be how a hunter turns into something else." } },
      choices = { { text = "Clean, and never for pride.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "A head taken for pride still scares the enemy.", next = "BACK", fx = { align = { honor = -1 } } } },
    },
    isles = {
      big = true,
      lines = {
        { id = "i_default", text = "Zalazane drink deep of power he shouldn't touch, and it drown him. He curse the isles and make our own people his puppets. We leave our home to save the rest." },
      },
      choices = {
        { text = "We'll take it back.", next = "END", fx = { affinity = 2, align = { honor = 1 }, learn = { "echo_isles" } } },
        { text = "Your people matter more than the isles, so let Zalazane keep them.", next = "END", fx = { align = { honor = -1 }, learn = { "echo_isles" } } },
        { text = "I'm sorry.", next = "END", fx = { affinity = 2, trait = { kind = 1 }, learn = { "echo_isles" } } },
      },
    },
    voljin = {
      lines = {
        { id = "vj_default", text = "The best I ever have. Zalazane listen too, but to the wrong voices. Now Vol'jin stand by the Warchief, and I watch the isles for him." },
      },
      choices = {
        { text = "He chose well.", next = "END", fx = { affinity = 2 } },
        { text = "And the student you aren't proud of?", tag = "Persuade", next = "zalazane_blame",
          check = { pass = { any = { { disposition = { min = 65 } }, { race = "Troll" }, { trait = "kind" } } } },
          fail = { next = "zalazane_shame", fx = { affinity = -1 } } },
      },
    },
    zalazane_blame = {
      lines = {
        { id = "zb_default", text = "Zalazane be the quicker of the two boys, quicker than Vol'jin even. I see the hunger in him early, and I teach him anyway, because I be proud to have such a clever student. So when you hear the isles be cursed, you remember an old fool help it happen." },
        { id = "zb_troll", when = { race = "Troll" },
          text = "You be Darkspear, so I tell you what I don't tell the chief. I see Zalazane reach too far and I say nothing, because he make me proud. Every puppet on those isles, I count as partly mine." },
      },
      choices = {
        { text = "You couldn't have known, Master.", next = "BACK", fx = { affinity = 2 } },
        { text = "Then help us undo it.", next = "BACK", fx = { affinity = 1, learn = { "echo_isles" } } },
      },
    },
    zalazane_shame = {
      lines = {
        { id = "zs_default", text = "That be an old man's business, and an old man's shame, and not for a stranger to pick at." },
        { id = "zs_easy", text = "Ha, you ask the hard question first, eh? Gadrin answer only the easy ones today." },
      },
      choices = { { text = "Another time, then.", next = "BACK" } },
    },
    xloa = {
      big = true,
      lines = {
        { id = "xl_default", text = "Loudly, eh? Then they be laughing at something, because the loa only shout when the joke be on somebody. You tell people what they say, sometimes, and I tell you this as an old man who did the same: the loa's truth be sharp, so you choose who you cut with it." },
      },
      choices = {
        { text = "I tell what the loa say. Softening it is lying.", next = "BACK", fx = { affinity = -1, align = { order = -1 }, trait = { stern = 1 } } },
        { text = "I keep most of it to myself, Master, like you taught.", next = "BACK", fx = { affinity = 2, align = { order = 1 }, trait = { cautious = 1 } } },
        { text = "Who are they laughing at this time?", next = "xloa_who" },
      },
    },
    xloa_who = {
      lines = {
        { id = "xlw_default", text = "Zalazane, I hope, because he think the spirits on the isles belong to him now, and no loa ever belong to anybody. Maybe they laugh at old Gadrin too, for waiting so long, and that be fair, mon, so Gadrin laugh along." },
      },
      choices = {
        { text = "Then I'll listen for the end of the joke.", next = "BACK", fx = { affinity = 1, learn = { "echo_isles" } } },
        { text = "Something else, Master.", next = "BACK" },
      },
    },
    xwant = {
      lines = {
        { id = "xw_default", text = "Ha! Your old master teach you to ask before you ask, and now you ask about yourself, eh? Every loa want something, child, and the ones who come to you without being called usually want you to finish something somebody else start, so think hard about what in your life be unfinished." },
      },
      choices = {
        { text = "The isles. That's unfinished for all of us.", next = "BACK", fx = { affinity = 2, learn = { "echo_isles" }, trait = { brave = 1 } } },
        { text = "I'll think on it before I answer, Master.", next = "BACK", fx = { affinity = 1, trait = { patient = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Old Gadrin hear everything eventually, because everybody come to the witch doctor sooner or later. Ask me about these, child." },
      { id = "tp_knows_warm", when = { disposition = { min = 65 } }, text = "You be good to this old man, so sit, and I tell you all of it, the long way round." },
    },
    echo_isles = { { id = "tp_isles", text = "Every morning I look at them, and every morning they still there, waiting for us." } },
    burning_blade = { { id = "tp_blade", text = "Orcs playing with demons, eh? Bad magic be bad magic, whoever play with it, and Orgnil know that." } },
    _none = { { id = "tp_none", text = "Even an old witch doctor don't know everything, though he know most things, yes." } },
  },
}
