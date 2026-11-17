-- Rhinag, stung by a venomtail at Rocktusk Farm and running out of time. Voice: bibles/rhinag.md
-- A Darkspear initiate who keeps his humor while the poison works, and grumbles once he lives.
local P = RPGDialogueAPI:Pack("rpgd.durotar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "rhinag", id = TODO_NPC("Rhinag"), name = "Rhinag",
  bible = "bibles/rhinag.md", role = "questgiver", tier = "quest",
  temper = { "dry" }, values = { "practical", "loyal" },
  notices = { "class", "weary" },
  impression = {
    first = "Rhinag was stung by a venomtail near Rocktusk Farm and joked about it while the poison worked on him. He trusts his teacher Kor'ghan to save him, and dreads the lessons that will follow if he does.",
    third = "{name} met Rhinag at Rocktusk Farm, a poisoned Darkspear who needed Kor'ghan's venomtail antidote within the hour.",
  },

  greetings = {
    { id = "g_sweat", text = "Don't mind the sweat, mon. The poison makes it, not the weather, though the weather helps." },
    { id = "g_active", when = { questActive = TODO_QUEST("Need for a Cure") }, text = "Kor'ghan, Cleft of Shadow, antidote. I be counting the minutes, so you count them too." },
    { id = "g_saved", when = { questDone = TODO_QUEST("Need for a Cure") }, text = "Still alive, mon, thanks to you. Kor'ghan say I owe him forty boars for being careless, and he be counting, mon, out loud, every morning." },
    { id = "g_away", when = { away = 14 }, text = "{away} gone, mon, and I still be breathing, which you can take some credit for. Sit, if the boars let you." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You got tougher since you ran to Orgrimmar for me, mon. I hope the venomtails noticed, because I sure did." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Folk say good things about you around here, mon. I tell them I knew you before you was famous, when you was just running errands for a dying troll." },
  },

  notice = {
    { id = "n_healer", cat = "class", when = { class = { "PRIEST", "SHAMAN", "DRUID" } },
      text = "You got a healer's look, mon. Don't waste it on me, because this poison only listen to Kor'ghan's brew." },
    { id = "n_weary", cat = "weary", when = { resSick = true },
      text = "You look worse than me, mon, and I be dying. What happened to you?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Rhinag, mon, of the Darkspear. I tend this hut by the farm and hunt what Kor'ghan tell me to hunt, and today it hunted me back." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Need for a Cure") },
          text = "{name}, your timing be perfect, and I hope your feet be as quick. A venomtail stung me deep out by the farm, and I got maybe an hour before the poison finish what it started." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Need for a Cure") },
          text = "Kor'ghan know how to make the antidote, mon, and he be in the Cleft of Shadow in Orgrimmar. Hurry, because my legs already stopped listening to me." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Need for a Cure"), days = 3 } },
          text = "You saved my life, mon, plain and simple. Now Kor'ghan gonna march me through more of his rituals until I prove myself, more boars and more scorpid tails, so maybe I owe you less than I thought." },
        { id = "h_later", when = { questLater = { TODO_QUEST("Need for a Cure"), days = 7 } },
          text = "I carry the antidote everywhere now, mon, a little flask on a cord. Kor'ghan never said I told you so, but he didn't have to." },
      },
      again = {
        { id = "h_again", text = "Something else, mon? Make it quick if I still be dying." },
        { id = "h_again2", text = "Talk to me, mon. It keep me awake." },
      },
      choices = {
        { text = "Are you hurt, Rhinag?", next = "sting" },
        { text = "Who is Kor'ghan to you?", next = "korghan" },
        { text = "What do you do out here?", next = "farm" },
        { text = "Let me see if I can slow the poison.", next = "heal", when = { class = { "PRIEST", "SHAMAN", "DRUID" } } },
        { text = "I'll see what needs doing.", next = "BUSINESS" },
        { text = "Hold on, Rhinag.", next = "END" },
      },
    },
    sting = {
      lines = {
        { id = "s_default", text = "Bad enough that I stopped feeling my toes, mon. Venomtails be the deadliest scorpids in Durotar, and I went out after them without the antidote because I thought I was faster than a tail." },
        { id = "s_saved", when = { questDone = TODO_QUEST("Need for a Cure") }, text = "It was bad, mon, the kind where you start saying goodbye to people in your head. The scar still itch when it rain, which be not often here, so I take it." },
      },
      choices = {
        { text = "Why go without the antidote?", next = "pride" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pride = {
      lines = { { id = "p_default", text = "Because Kor'ghan say study the creature first, and I thought I already knew it. A scorpid be a scorpid, I said, and the scorpid disagreed." } },
      choices = {
        { text = "Kor'ghan sounds like a wise teacher.", next = "korghan" },
        { text = "So what did you learn?", next = "lesson" },
      },
    },
    lesson = {
      big = true,
      lines = { { id = "l_default", text = "That knowing a thing and respecting it be two different kinds of knowing, mon. I'll study every beast I hunt from now on, even the ones that look easy, especially those." } },
      choices = {
        { text = "Respect for the prey keeps you alive.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Or strike faster next time. Study wastes time.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    korghan = {
      lines = { { id = "k_default", text = "My teacher, mon, and a hard one. He keep to the Cleft of Shadow and set me rituals to prove myself, killing boars, gathering tails, and every one of them come with a lecture about understanding what you hunt." } },
      choices = {
        { text = "He'll save you, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "He'll be angry you got stung.", next = "angry" },
      },
    },
    angry = {
      lines = { { id = "a_default", text = "Kor'ghan don't get angry, mon, he gets disappointed, and that be much worse. He'll make the antidote first and save the scolding for when I can stand up to hear it." } },
      choices = { { text = "Small mercies. Something else.", next = "BACK" } },
    },
    farm = {
      lines = { { id = "f_default", text = "Rocktusk Farm raise boars for Orgrimmar's tables, and the scorpids come up out of the rocks to steal the feed. I keep them back, mostly, and today mostly wasn't enough." } },
      choices = {
        { text = "Honest work. Somebody has to do it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    heal = {
      lines = { { id = "he_default", text = "You can try, mon, and bless you for it. It feel cooler where your hands are, but the poison be in deep, so I still need Kor'ghan's brew before the hour run out." } },
      choices = {
        { text = "Then I'll run for it.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "I've done what I can.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A Darkspear, a boar-keeper, and Kor'ghan's worst student this week. Ask me next week, mon, maybe it change." } },
    advice = { { id = "tp_ad", text = "Carry the antidote before you need it, mon, because by the time you need it, you can't walk to get it." } },
    thrall = { { id = "tp_thrall", text = "The Warchief's got the finest axe in Durotar, and he's never once been stung by a venomtail. That's the kind of leader I want, one who doesn't step on scorpids." } },
    darkspear = { { id = "tp_darkspear", text = "The trolls at Sen'jin know more about poisons than anybody in Durotar. I wish I'd asked one about venomtails before I got stung." } },
    centaur = { { id = "tp_centaur", text = "The Kolkar have their own poisons, and they're worse than a scorpid's. That's the only good news I've had all day." } },
    _none = { { id = "tp_none", text = "Don't know that one, mon. My head be full of poison and boars right now." } },
  },
}
