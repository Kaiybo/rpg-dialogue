-- More of Thousand Needles: Myriam Moonsinger, the night elf watching the Razorfen Downs from a hill
-- outside its gate (A Host of Evil). Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.thousandneedles")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "myriam", id = TODO_NPC("Myriam Moonsinger"), name = "Myriam Moonsinger",
  bible = "bibles/more_folk.md", role = "scholar", tier = "quest",
  communities = {}, temper = { "watchful", "grave" }, values = { "duty", "balance" },
  notices = { "race", "class" },
  impression = {
    first = "She is certain the Scourge has reached the Barrens' edge.",
    third = "{name} met Myriam Moonsinger, a night elf watching the Razorfen Downs for signs of the Scourge.",
  },
  greetings = {
    { id = "g_hi", text = "Keep your voice low. The quilboar below have sharp ears, and sharper spears." },
    { id = "g_back", when = { metBefore = true }, text = "You came back up the hill. Good; I have been alone with what I've seen for too long." },
    { id = "g_host", when = { questActive = TODO_QUEST("A Host of Evil") }, text = "How goes the hunt? Every one of them you put down is one fewer kneeling to that diplomat." },
    { id = "g_hostdone", when = { questDone = TODO_QUEST("A Host of Evil") }, text = "The camps below are thinner since you went among them. I will keep watching, but I watch with more hope now." },
  },
  notice = {
    { id = "n_nightelf", cat = "race", when = { race = "NightElf" },
      text = "Ishnu-alah, {g:brother|sister}. It is good to see one of our own this far from Ashenvale, though I wish it were somewhere kinder." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "One of the Forsaken. You will understand better than most what I fear is growing down there, and you will not like it." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. If what I suspect is true, your prayers will be needed below more than anywhere else in Kalimdor." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Myriam Moonsinger. I came to study the quilboar of the Razorfen, but what I found below this hill is something far older and colder than any quilboar." },
        { id = "h_host", when = { questActive = TODO_QUEST("A Host of Evil") }, text = "The battleguards, the thornweavers and the cultists of the Death's Head grow in number every day. I cannot fight them alone, but with your help we may thin their ranks before they spill out into the Needles." },
        { id = "h_hostdone", when = { questDone = TODO_QUEST("A Host of Evil") }, text = "Thank you again for your hunting. If you seek greater danger, gather friends and go into the great maw below; you will find the source of this sickness inside." },
      },
      again = {
        { id = "h_again", text = "What else would you know? Speak quietly." },
        { id = "h_again2", text = "Ask. I will keep one eye on the camps while I answer." },
      },
      choices = {
        { text = "What did you find below?", next = "found" },
        { text = "Who is this diplomat you mentioned?", next = "diplomat" },
        { text = "A night elf alone this far south is unusual.", next = "alone" },
        { text = "I know the Scourge well. I was one of them.", next = "forsaken", when = { race = "Scourge" } },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },
    found = {
      lines = { { id = "fo_default", text = "The quilboar have always been a fierce people, but these are something else. Some of them now walk with the stiff gait of the dead, and the Death's Head cultists burn strange fires in the camps at night." } },
      choices = {
        { text = "The Death's Head?", next = "found_cult" },
        { text = "Something else.", next = "BACK" },
      },
    },
    found_cult = {
      lines = { { id = "fc_default", text = "Quilboar who have turned from their old gods to a new master. They come to him daily, almost begging for more power, and he grants them undeath as if it were a gift." } },
      choices = {
        { text = "Then they must be stopped.", next = "found_stop" },
        { text = "Something else.", next = "BACK" },
      },
    },
    found_stop = {
      big = true,
      lines = { { id = "fs_default", text = "They must, and I am not strong enough to do it alone. Would you hunt them with me, or at least for me, while I keep watch here?" } },
      choices = {
        { text = "I'll hunt them. This sickness can't spread.", next = "BACK", reply = "Then Elune guide your arrows and your blade. Return when it is done.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let the quilboar rot. It's not my fight.", next = "BACK", reply = "It will be your fight, when they come out of the Downs and into your lands. I hope you are ready then.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    diplomat = {
      lines = { { id = "di_default", text = "That is what the quilboar call him, an envoy from far away who came to their thorny halls bearing gifts of cold power. The Forsaken do not pass on their condition, from what I have seen, but this one grants undeath to those who ask." } },
      choices = {
        { text = "Then he's one of the Scourge.", next = "diplomat_scourge" },
        { text = "Something else.", next = "BACK" },
      },
    },
    diplomat_scourge = {
      lines = { { id = "ds_default", text = "I am beginning to think so, and if I am right, the Lich King's reach is longer than any of us feared. The Scourge in Kalimdor was thought broken at Hyjal, and yet here it is, quietly gathering an army out of quilboar." } },
      choices = {
        { text = "Someone must warn the Sentinels.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    alone = {
      lines = {
        { id = "al_default", text = "It is, and I would rather have companions, but the Sentinels have their hands full in Ashenvale. A scholar can go where a warband cannot, and quilboar pay little mind to a single figure sitting very still on a hill." },
        { id = "al_horde", when = { race = { "Orc", "Troll", "Tauren", "Scourge" } }, text = "It is, and I will admit I did not expect to share my hill with the Horde. But the Scourge is everyone's enemy, so sit, and we will speak of it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    forsaken = {
      big = true,
      lines = { { id = "fk_default", text = "Then tell me, since you know it better than I ever will: does the diplomat's gift look to you like the Plague that made your people? I would trust your eyes in this more than my own." } },
      choices = {
        { text = "It's the same chill. You're right to fear it.", next = "BACK", reply = "Then I was not imagining it. Thank you; that helps more than you know.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Undeath is no gift, but you overrate it.", next = "BACK", reply = "Perhaps, but I would rather fear it too much than too little. I will keep watching.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I study the creatures of Kalimdor, and lately I study the things that are killing them." } },
    razorfen_downs = { { id = "tp_rfd", text = "The great maw below is the way in. I have not gone inside, and I do not plan to without many friends." } },
    _none = { { id = "tp_none", text = "I cannot say. My attention has been on the Downs for many weeks now." } },
  },
}
