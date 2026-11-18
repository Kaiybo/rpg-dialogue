-- Hana'zua, bleeding on his mat in the Valley of Trials after his fight with Sarkoth. Voice: bibles/hanazua.md
-- A young Darkspear hunter who is more afraid of dying unremembered than of dying.
local P = RPGDialogueAPI:Pack("rpgd.durotar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "hanazua", id = TODO_NPC("Hana'zua"), name = "Hana'zua",
  bible = "bibles/hanazua.md", role = "questgiver", tier = "quest",
  communities = { "valley_of_trials" }, temper = { "proud" }, values = { "proud", "brave" },
  notices = { "class", "weary" },
  impression = {
    first = "Hana'zua lies bleeding in the Valley of Trials after a scorpid named Sarkoth caught him on the plateau. He cares less about his wound than about dying before he has done anything worth a song.",
    third = "{name} met Hana'zua, a wounded Darkspear hunter in the Valley of Trials who wanted the scorpid Sarkoth dead for the sake of his honor.",
  },

  greetings = {
    { id = "g_mat", text = "Mind the blood on the mat, mon. Most of it be mine, and I'd like to keep the rest." },
    { id = "g_active", when = { questActive = TODO_QUEST("Sarkoth") }, text = "The plateau be south of here, and Sarkoth be the big one with the cracked claw. You can't miss him, mon." },
    { id = "g_done", when = { questDone = TODO_QUEST("Sarkoth") }, text = "Sarkoth's claw hang by my mat now, and I look at it every time the wound ache." },
    { id = "g_away", when = { away = 14 }, text = "You been gone {away}, mon, and Hana'zua still be here, which surprise both of us. Come sit a moment." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 6 }, text = "Look at you now, mon. You walked into this valley the same as me, and you be walking out of it a hunter of something bigger than scorpids." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "The recruits say good things about you around the fire, mon. Hana'zua be glad, because the valley need more names worth saying." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I hear somebody in the valley be angry with you, mon. Mend it if you can, because the trials be hard enough with friends." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, eh? Then you know better than I did that you watch the tail, not the claw." },
    { id = "n_weary", cat = "weary", when = { resSick = true },
      text = "You look like the spirit healer just sent you back, mon. Sit by me, then, and we be two fools together." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I be Hana'zua of the Darkspear, and a scorpid on the plateau taught me a lesson I didn't ask for. I hit him hard, but he hit me harder, and now I lie here waiting to see which of us the loa favor." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Sarkoth") },
          text = "You there, {class}! I thought I would die out here with nobody to know it. A scorpid called Sarkoth did this to me on the plateau to the south, and he still be walking around with my honor on his claw." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Sarkoth") },
          text = "You still hunting Sarkoth, mon? Look for the cracked claw, because that be my mark on him. Bring me that claw and I can die with something to show for my life." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Sarkoth"), days = 3 } },
          text = "You killed him, and you brought me the claw with my mark still in it. It be a small thing to be proud of, but it be mine, and I thank you for it." },
        { id = "h_later", when = { questLater = { TODO_QUEST("Sarkoth"), days = 7 } },
          text = "The wound be closing, slow, and Gornek say I might hunt again before the rains. I tell him the next scorpid get a fair warning, mon." },
        { id = "h_troll", when = { race = "Troll" }, text = "A Darkspear face! Good, mon, because if I die here I'd rather a cousin be the one to tell the tribe how it went." },
      },
      again = {
        { id = "h_again", text = "What else, mon? I not be going anywhere." },
        { id = "h_again2", text = "Talk, talk. It keep my mind off the hole in my chest." },
      },
      choices = {
        { text = "What happened up on the plateau?", next = "fight" },
        { text = "Why does a scorpid matter so much to you?", next = "honor" },
        { text = "Why did the Darkspear come to the valley?", next = "darkspear" },
        { text = "Nobody seems to look after the wounded here.", next = "gornek" },
        { text = "Let me look at that wound, Hana'zua.", next = "heal", when = { class = { "PRIEST", "SHAMAN", "DRUID", "PALADIN" } } },
        { text = "I hunt too. How did a hunter get caught like that?", next = "hunter", when = { class = "HUNTER" } },
        { text = "I'll see what needs doing.", next = "BUSINESS" },
        { text = "Rest, Hana'zua.", next = "END" },
      },
    },
    fight = {
      lines = { { id = "f_default", text = "I see him on the plateau, bigger than any scorpid in the valley, and I think he be my first great kill. I throw myself at him and crack his claw, but the claw close on my leg, and then the stinger come down into my chest before I even see it move." } },
      choices = {
        { text = "You were brave to face it alone.", next = "BACK", reply = "Brave, ya, and alone, and that be the part I keep thinkin' about at night. Next time I bring a friend, mon, and we both come home.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "You were foolish to rush it.", next = "BACK", reply = "Foolish, sure, the loa been laughing at me ever since. A scar on the chest be a loud teacher, and I be listening now.", fx = { align = { honor = -1 } } },
        { text = "Where exactly did you leave him?", next = "plateau" },
      },
    },
    plateau = {
      lines = { { id = "pl_default", text = "South, mon, up on the high ground past the scorpid nests. He sit there like he own the valley, and maybe he do, until somebody take it from him." } },
      choices = { { text = "Then somebody will. Something else.", next = "BACK" } },
    },
    honor = {
      big = true,
      lines = { { id = "ho_default", text = "Because if I die here, mon, what be the list of my life? A few boars, a few scorpids, a lot of talk around the fire. That claw with my mark on it be the only thing I done that anybody will remember." } },
      choices = {
        { text = "A life isn't measured in kills.", next = "list" },
        { text = "Then let's make sure the claw comes back.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    list = {
      lines = { { id = "li_default", text = "Easy to say when you still be walking, mon. My father hunt raptors in Stranglethorn before the Darkspear lose everything there, and I be lying in the dirt because of a bug." } },
      choices = {
        { text = "Your father would be proud you fought at all.", next = "list_end" },
        { text = "Then get up and do better next time.", next = "list_end", fx = { trait = { brave = 1 } } },
      },
    },
    list_end = {
      lines = { { id = "le_default", text = "Maybe so, mon. If the loa give me a next time, I be watching the tail first, and I be telling the young ones to do the same, because a tail in the face kill more young fools than any claw." } },
      choices = {
        { text = "Teaching them would be a fine thing to be remembered for.", next = "BACK", reply = "You think so, mon? Then maybe this scar be good for somethin' after all, if it keep some young fool breathin'.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Only the kill is remembered. Get the next one.", next = "BACK", reply = "You sound like me before the stinger, mon. I'll get the next one, sure, but I be watching the tail this time.", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    darkspear = {
      lines = {
        { id = "d_default", text = "The Warchief give us this land when the Darkspear had nowhere to go, mon, and Sen'jin give his life so we could get here. Now the young trolls train beside the young orcs, and most days it work, even if the orcs snore louder." },
        { id = "d_orc", when = { race = "Orc" }, text = "Your Warchief give us this land when we had nothing, mon, and the Darkspear don't forget a thing like that. Even if you orcs snore louder than a kodo in the barracks." },
      },
      choices = {
        { text = "The Horde is stronger with the Darkspear in it.", next = "BACK", fx = { affinity = 1, learn = { "echo_isles" } } },
        { text = "Something must have happened to the Echo Isles.", next = "isles" },
      },
    },
    isles = {
      lines = { { id = "i_default", text = "Zalazane, mon, a witch doctor gone bad, and now the isles be full of our own people under his hex. Master Gadrin in Sen'jin Village can tell it better, because he teach Zalazane once." } },
      choices = { { text = "I'll ask Master Gadrin. Something else.", next = "BACK", fx = { learn = { "echo_isles" } } } },
    },
    gornek = {
      lines = { { id = "g_default", text = "Gornek send the recruits out and count who come back, and he come by to grunt at my wound every morning. He don't say much, but he leave water, and that be how an orc say he worry." } },
      choices = {
        { text = "Then he's a good leader.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Hana'zua.", next = "BACK" },
      },
    },
    heal = {
      lines = { { id = "he_default", text = "You would do that for a troll who rush a scorpid like a fool? Go on, then, mon, but leave a scar, because I want to show it around the fire." } },
      choices = {
        { text = "You'll have your scar, and your life with it.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Bragging about wounds is how you got this one.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Pride, mon, the same way every young hunter get caught. I watch the claw because the claw be the big thing, and I forget a scorpid got a second weapon over its back." } },
      choices = {
        { text = "Patience wins the hunt. Pride loses it.", next = "BACK", reply = "Dat be the truth, and I learn it the hard way. Next hunt, I be the patient one, and the scorpid be the proud one.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Pride got you a mark on the beast. That counts.", next = "BACK", reply = "Ha! A mark on the beast and a bigger one on me, mon. I don't think the loa be counting it my way.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A Darkspear hunter, mon, a young one, and right now a bleeding one. Ask me again when I got a better story." } },
    advice = { { id = "tp_ad", text = "Watch the tail, mon, not the claw. I got the scar to prove it, and I limp when it rain." } },
    echo_isles = { { id = "tp_isles", text = "Our home, across the water, and Zalazane sit in it like a tick. One day the Darkspear go back." } },
    burning_blade = { { id = "tp_blade", text = "The recruits say there be cultists in the caves with demon imps, mon. I stay away from demons and stick to scorpids, and look how well that go." } },
    thrall = { { id = "tp_thrall", text = "The Warchief walked out of a human camp and freed us all, and nobody will ever sing a bigger song than that. I only want a small one, and I'd settle for a verse." } },
    internment = { { id = "tp_internment", text = "My father died in the camps, and my mother never talks about them. That is why I want a song, so that something in our family is remembered for more than chains." } },
    second_war = { { id = "tp_second_war", text = "The old ones talk about the Second War like it was a feast, and then they stop talking all at once. I think they lost more than they say." } },
    centaur = { { id = "tp_centaur", text = "The Kolkar ride along the western ridge, and Lar Prowltusk says they are planning something. If I live through this scorpid, I'd like to be there when he stops them." } },
    _none = { { id = "tp_none", text = "I don't know that one, mon. Ask me about scorpids, because now I be an expert." } },
  },
}
