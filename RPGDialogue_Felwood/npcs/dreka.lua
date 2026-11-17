-- Dreka'Sur, an orc widow at Bloodvenom Post. Voice: bibles/dreka.md
local P = RPGDialogueAPI:Pack("rpgd.felwood")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "dreka", id = TODO_NPC("Dreka'Sur"), name = "Dreka'Sur",
  bible = "bibles/dreka.md", role = "questgiver", tier = "quest",
  communities = { "bloodvenom_post" }, temper = { "fierce", "gruff" }, values = { "proud", "loyal" },
  notices = { "trophy", "race" },

  impression = {
    first = "Dreka'Sur lost her husband somewhere in the south of Felwood and wants the claw of the beast that took him. Her grief comes out as anger, and she isn't sorry for it.",
    third = "{name} met Dreka'Sur, an orc widow at Bloodvenom Post who wants her husband's killer to pay.",
  },

  greetings = {
    { id = "g_default", text = "If you've no business with me, find someone else to stare at." },
    { id = "g_ror", when = { questActive = TODO_QUEST("A Husband's Last Battle") }, text = "Does Ror still breathe? Then why are you standing here?" },
    { id = "g_done", when = { questDone = TODO_QUEST("A Husband's Last Battle") }, text = "You kept your word to me. I don't forget that, and neither will my clan." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and back again. Felwood doesn't let anyone go for long, it seems." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown stronger since you first stood here. Good, because this forest eats the weak." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Word at the post is that you've made enemies. Be careful whose throat you choose to step on here." },
    { id = "g_word_helped", when = { word = "helped" }, text = "They say at the post you've been useful to us. That earns you a word from me, at least." },
  },

  notice = {
    { id = "n_furbolg", cat = "trophy", when = { killed = { name = "Deadwood", min = 20 } },
      text = "You stink of corrupted furbolg, and I can't say the smell bothers me. Did any of them have a claw bigger than the rest?" },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Another orc, this far north. You'll understand why I can't go home until this is finished." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Dreka'Sur, and my husband fought his way across Felwood for the honor of our clan. He cheated death more times than I could count, and then a druid asked him for help against a befouled furbolg called Overlord Ror, and neither of them came back." },
        { id = "h_active", when = { questActive = TODO_QUEST("A Husband's Last Battle") },
          text = "Ror is to the south, near the Ashenvale border, where the Deadwood are thickest. Bring me its clawed hand, and I don't care how you get it." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Husband's Last Battle"), days = 3 } },
          text = "So the beast is dead, and its claw is in my hand. My husband died in battle, and he'd be proud of that, but I couldn't rest until the thing that left me alone had paid for it." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren. Your druids are always telling us the furbolgs are a sick people and not a wicked one, and maybe that's so, but sick or not, one of them killed my husband." },
      },
      again = {
        { id = "h_again", text = "What else? Speak plainly, as an orc should." },
        { id = "h_again2", text = "You're still here. Ask, then, and then go and earn some honor in that forest." },
      },
      choices = {
        { text = "Tell me about your husband.", next = "husband" },
        { text = "Who was the druid he went with?", next = "druid" },
        { text = "I've heard the name Overlord Ror.", next = "ror" },
        { text = "Why stay at Bloodvenom Post?", next = "post" },
        { text = "The furbolgs are sick, Dreka'Sur. Not evil.", next = "xtauren", when = { race = "Tauren" } },
        { text = "Do the spirits tell you where he fell?", next = "xshaman", when = { class = "SHAMAN" } },
        { text = "I'll take my leave.", next = "END" },
      },
    },
    husband = {
      lines = {
        { id = "hu_default", text = "He was a warrior who never learned to sit still, and he came north to fight the Shadow Council and anything else that stank of the old curse. Every letter he sent me had a new scar in it, and he laughed about every one." },
      },
      choices = {
        { text = "His last letter must have said something.", next = "letter" },
        { text = "Something else.", next = "BACK" },
      },
    },
    letter = {
      lines = {
        { id = "le_default", text = "It said that a druid had asked for his blade against a great furbolg gone foul, and that he'd said yes, because he always said yes. He wrote that he'd be home by the next moon, and the moon came and went, and nothing came after it." },
      },
      choices = {
        { text = "Do you keep the letter?", next = "letter_keep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    letter_keep = {
      big = true,
      lines = {
        { id = "lk_default", text = "I've read it so often the ink's going grey. Some nights I think I should burn it and be done, and other nights I think it's all I have left of him." },
      },
      choices = {
        { text = "Keep it. Remembering him is no weakness.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Burn it once Ror is dead. Then let him go.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid = {
      lines = {
        { id = "d_default", text = "He never wrote the name, only that it was a druid trying to heal this forest. I don't blame the druid; he chose to go, and it was a good cause, but it was the last thing he chose." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ror = {
      lines = {
        { id = "r_default", text = "An overlord of the Deadwood furbolgs, bigger and more twisted than the rest, the scouts say. It holds the ground in the south near Ashenvale, and no one from this post goes there without a reason." },
      },
      choices = {
        { text = "And you want its hand.", next = "ror_hand" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ror_hand = {
      big = true,
      lines = {
        { id = "rh_default", text = "I want its clawed hand on the table in front of me, so I can look at the thing that took him. I don't care whether it's corrupted or simply angry from living in this cursed place, because no furbolg kills my family and lives." },
      },
      choices = {
        { text = "Blood for blood. I'll bring you that claw.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Revenge won't fill the empty place, Dreka'Sur.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    post = {
      lines = {
        { id = "p_default", text = "Because it's the closest I can be to where he fell, and because the post needs every hand it has. Felwood doesn't care who's grieving, so I keep watch with the others and wait for news." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xtauren = {
      big = true,
      lines = {
        { id = "xt_default", text = "Maybe they are, and maybe the Earth Mother weeps for them, but I don't. A sick wolf that bites a child still gets put down, and Ror is a sick wolf." },
      },
      choices = {
        { text = "Then put it down cleanly, and mourn what it was.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You're right. Sick or not, it dies.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xshaman = {
      lines = {
        { id = "xs_default", text = "The spirits here are too sick to tell anyone anything, shaman. I asked the post's own shaman when I first came, and he told me Felwood screams so loudly he can't hear a single voice in it." },
      },
      choices = {
        { text = "Then I'll track him down myself.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was a warrior's wife. Now I'm a warrior's widow, and that's all you need to know." } },
    advice = { { id = "tp_ad", text = "If a druid asks you to go somewhere dangerous with them, ask how many came back the last time." } },
    furbolgs = { { id = "tp_furb", text = "The Deadwood are mad with the forest's poison, and the druids say they were a wise people once. I say one of them killed my husband." } },
    _none = { { id = "tp_none", text = "Don't know, and don't care. My husband's blood is in this forest, and that is all I think about." } },
  },
}
