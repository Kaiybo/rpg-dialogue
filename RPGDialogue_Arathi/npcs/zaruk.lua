-- Zaruk: an orc of the Twilight's Hammer living quietly in Hammerfall, waiting on "the Lady" Myzrael.
-- Voice: bibles/zaruk.md
local P = RPGDialogueAPI:Pack("rpgd.arathi")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "ar_zaruk", id = TODO_NPC("Zaruk"), name = "Zaruk",
  bible = "bibles/zaruk.md", role = "questgiver", tier = "quest",
  communities = { "hammerfall" }, temper = { "calm", "shrewd" }, values = { "devout", "cunning", "patient" },
  notices = { "class", "lore" },

  impression = {
    first = "Zaruk keeps to himself in Hammerfall and speaks of someone he calls the Lady with a calm that makes the skin crawl. He says he serves a higher cause, and he plainly believes it.",
    third = "{name} met Zaruk, a quiet orc of Hammerfall who serves the Twilight's Hammer and the buried princess Myzrael.",
  },

  greetings = {
    { id = "g_default", text = "Welcome, {class}. Sit, if you like; few in Hammerfall do." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The Lady said you might." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and the stones beneath Arathi have not stopped whispering. Did you hear them, where you went?" },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You have grown strong, {class}. Strength is what the Lady asks of her allies." },
    { id = "g_theldurin", when = { questActive = TODO_QUEST("Theldurin the Lost") }, text = "The Badlands, and a mad dwarf hiding in them with what is ours. Find him." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. The earth speaks to you, then, as it speaks to me, though I think it tells us very different things." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "A warlock. You understand, I think, that power answers to those who are willing to call it by name." },
    { id = "n_lore", cat = "lore", when = { questDone = TODO_QUEST("Summoning the Princess") },
      text = "You smell of the shards, and of something broken there. I will not ask what you did, for I think I already know." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Zaruk, and I keep a quiet corner of Hammerfall while others shout about Stromgarde. I serve a higher cause than this camp, though Drum Fel has no need to hear that from either of us." },
        { id = "h_allies", tags = { "news" }, when = { questActive = TODO_QUEST("Myzrael's Allies") },
          text = "The Lady has informed me of your coming. If we are to bring her back to the surface, then we have much to discuss." },
        { id = "h_theldurin_done", tags = { "news" }, when = { questDone = TODO_QUEST("Theldurin the Lost") },
          text = "You found Theldurin, and he still breathes, I suppose. He was one of us once, until his mind cracked and he ran with the Lady's scroll in his teeth." },
        { id = "h_betrayed", when = { questDone = TODO_QUEST("Summoning the Princess") },
          text = "The shards have gone quiet, and I no longer hear her. Whatever you have done, do not speak of it to me, for I would rather keep my peace than take it from you by force." },
        { id = "h_dragonmaw", when = { questActive = TODO_QUEST("Dragonmaw Rumors") },
          text = "The Dragonmaw bind dragons with old magic, and old magic leaves marks on the world. Go to the deathstalker in the Wetlands hills, and see what she has found." },
        { id = "h_orc", when = { race = "Orc" },
          text = "An orc of the new Horde. Your Warchief speaks of spirits and honour, and some of us remember when the clans served stronger masters than that." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "You should not be here, and I have nothing to say to you. Leave Hammerfall before someone louder than I notices." },
      },
      again = {
        { id = "h_again", text = "What else would you know? Ask quietly." },
        { id = "h_again2", text = "I am listening, {class}. The stones are, too." },
      },
      choices = {
        { text = "Who is the Lady?", next = "lady" },
        { text = "What higher cause do you serve?", next = "hammer" },
        { text = "Who is Theldurin?", next = "theldurin" },
        { text = "I doubt Drum Fel knows what you are.", next = "drum" },
        { text = "What does the earth tell you?", next = "shaman", when = { class = "SHAMAN" } },
        { text = "I'll leave you to your stones, Zaruk.", next = "END" },
      },
    },

    lady = {
      lines = {
        { id = "la_default", text = "Myzrael, a princess of the earth, chained deep beneath these highlands by the giants who fear her. She speaks through the crystal shards to those who will listen, and she rewards those who help her." },
      },
      choices = {
        { text = "Why did the giants chain her?", next = "lady_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lady_why = {
      big = true,
      lines = {
        { id = "lw_default", text = "Because she is greater than they are, and the lesser always chain the greater when they can. When she is free, she will confront her captors, and they will regret their wardship of her." },
      },
      choices = {
        { text = "Some prisons exist for good reason, Zaruk.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "No power should stay chained. Free her.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "And what happens to us when she's free?", next = "lady_after" },
      },
    },
    lady_after = {
      lines = {
        { id = "la2_default", text = "Those who helped her will stand beside her, and those who did not will learn what the earth can do when it is angry. I know which side I prefer." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    hammer = {
      lines = {
        { id = "ha_default", text = "The Twilight's Hammer, though I would not shout the name in a Horde camp. We were a clan once, before the Horde forgot what it was, and now we are an order of those who see the end coming and mean to welcome it." },
      },
      choices = {
        { text = "Welcome the end? Why?", next = "hammer_end" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hammer_end = {
      big = true,
      lines = {
        { id = "he_default", text = "Because it is coming whether we welcome it or not, and the old powers under the world are stirring. Better to kneel before them early than be crushed when they wake." },
      },
      choices = {
        { text = "I'd rather fight the end than kneel to it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "There's sense in choosing the winning side.", next = "BACK", fx = { align = { light = -1 }, learn = { "twilights_hammer" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    theldurin = {
      lines = {
        { id = "th_default", text = "Theldurin the Lost, a dwarf, and once a member of our order. He lost his mind, scorned our teachings and fled with the Scroll of Myzrael, and rumour says he hides in the Badlands, gibbering." },
      },
      choices = {
        { text = "Why does the scroll matter?", next = "theldurin_scroll" },
        { text = "Something else.", next = "BACK" },
      },
    },
    theldurin_scroll = {
      lines = {
        { id = "ts_default", text = "Its magic can summon the Lady to the surface, once she has the strength to come. Without it, she waits in the dark, and so do we." },
      },
      choices = { { text = "Something else, Zaruk.", next = "BACK" } },
    },

    drum = {
      lines = {
        { id = "dr_default", text = "Drum Fel knows I am quiet and that I do my share, and he has a war to win against the humans. A commander with that much on his mind does not ask what an old orc prays to at night." },
        { id = "dr_warm", when = { disposition = { min = 65 } },
          text = "He suspects, I think, and Korin Fel suspects more. But Hammerfall needs every blade it has, and so they let me be, and I let them be, and the Lady waits." },
      },
      choices = {
        { text = "I should tell him.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Your prayers are your own business.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    shaman = {
      lines = {
        { id = "sh_default", text = "That something vast is bound beneath us, and that it is angry. Your spirits call that a warning, I expect, and I call it a promise." },
      },
      choices = {
        { text = "The spirits are right. Leave her buried.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Perhaps the spirits fear what they can't control.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I listen to the stones and to the camp, and both say more than they mean to. Ask." } },
    background = { { id = "tp_bg", text = "I fought for the old Horde, and when it fell I found a truer master. That is all you need to know." } },
    advice = { { id = "tp_ad", text = "Listen to what lies beneath, {class}. The surface is always the last to know." } },
    twilights_hammer = { { id = "tp_th", text = "An order, now, not a clan. We see what is coming.", next = "hammer" } },
    forsaken = { { id = "tp_forsaken", text = "The dead who walk in Tarren Mill serve their own queen, and they do not understand the greater cause. The Lady will show them, in time." } },
    thrall = { { id = "tp_thrall", text = "The Warchief of the Horde is a small chief in a small world, and the Lady sees far beyond him. I serve the Horde here, for now, because it serves her." } },
    the_elements = { { id = "tp_the_elements", text = "The elements of this land are angry, and the Lady is the source of that anger. She will set them free, and the world will see true power." } },
    _none = { { id = "tp_none", text = "That does not concern the Lady, and so it does not concern me." } },
  },
}
