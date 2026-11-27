-- A-Me 01, Karna Remtravel's mechanical gorilla, broken down by the waterfall near Fungal Rock.
-- Voice: bibles/fungal_rock.md
local P = RPGDialogueAPI:Pack("rpgd.ungoro")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "ame_01", id = TODO_NPC("A-Me 01"), name = "A-Me 01",
  bible = "bibles/fungal_rock.md", role = "questgiver", tier = "quest",
  communities = { "marshals_refuge" }, temper = { "earnest", "gentle" }, values = { "loyal", "kind" },
  notices = { "craft", "race", "pet" },

  impression = {
    first = "All she wants is to go home to Karna.",
    third = "{name} met A-Me 01, a mechanical gorilla built by Karna Remtravel, who only wants to go home.",
  },

  greetings = {
    { id = "g_default", text = "Hello. I am A-Me 01, and I am a good companion. Are you a friend of Karna's?" },
    { id = "g_dead", when = { questActive = TODO_QUEST("Chasing A-Me 01") }, text = "Power is very low. I am sorry that I cannot stand up to greet you properly." },
    { id = "g_home", when = { questDone = TODO_QUEST("Chasing A-Me 01") }, text = "You are the one who walked me home. My memory keeps you in a safe place, next to Karna." },
    { id = "g_away", when = { away = 14 }, text = "You have been away for {away}. I counted the days, because counting is something I do well." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "You smell of oil and solder, like Karna does. Please be careful with my shoulder; it is the part that hurts, if I can be said to hurt." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "You are a gnome. Karna says gnomes build very clever things that explode, and that I am a clever thing that does not explode, and that this is better." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Your {pet} looked at me and was not afraid. The apes looked at me and were very afraid, and then they were very angry." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am A-Me 01. Karna Remtravel built me to live among the apes of Un'Goro and watch them through my eyes, which are scrying gems, so that she could see everything I saw. Then an alpha male came to say hello, and he said it very hard." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Chasing A-Me 01") },
          text = "I cannot see Karna and Karna cannot see me, I think, because my head is dented and the gems are crooked. If you go back to Marshal's Refuge, please tell her that I am still here, and that I am sorry." },
        { id = "h_casing", when = { questActive = TODO_QUEST("Chasing A-Me 01"), profession = "Engineering" },
          text = "My core needs a new mithril casing; the old one is cracked where the ape struck me. An engineer can make one, and I think you are an engineer, so I am hopeful." },
        { id = "h_escort", when = { questActive = TODO_QUEST("Chasing A-Me 01") },
          text = "When I have power again, I would like to go home. The apes will try to stop me and I am not strong now, so please stay close and keep them away from my head." },
        { id = "h_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("Chasing A-Me 01"), days = 3 } },
          text = "We are home, or nearly. Karna cried when she saw my dents, and then she laughed, and then she found a hammer, and I believe that means she was happy." },
      },
      again = {
        { id = "h_again", text = "Do you have another question? I have time. I am mostly time, now." },
        { id = "h_again2", text = "Please ask. Talking keeps my gears warm." },
      },
      choices = {
        { text = "What happened at Fungal Rock?", next = "fungal" },
        { text = "What is Karna like?", next = "karna" },
        { text = "What did you learn about the apes?", next = "apes" },
        { text = "Do you think, or do you only follow orders?", next = "think" },
        { text = "Let me look at your casing.", next = "xeng", when = { profession = "Engineering" } },
        { text = "I know what it is to be made by someone else.", next = "xmade", when = { race = "Scourge" } },
        { text = "What will you do once you're mended?", next = "w9_mended" },
        { text = "Rest now, A-Me.", next = "END" },
      },
    },

    w9_mended = {
      lines = { { id = "w9_mended_d", text = "I would like to go back to the apes, if Karna lets me, and watch them again, but quietly, from the trees this time. The young one who shared the mushroom will be bigger now, and I want to know if it remembers me." } },
      choices = {
        { text = "Do you think it will?", next = "w9_mended2" },
        { text = "Wouldn't Karna rather keep you safe?", next = "w9_mended2" },
        { text = "Something else.", next = "BACK" },
      },
    },

    w9_mended2 = {
      lines = { { id = "w9_mended2_d", text = "I do not know if apes remember, but I remember, and that seems to be the important part. Karna says a companion who only stays safe is a doorstop, and I do not want to be a doorstop." } },
      choices = {
        { text = "Then go back, A-Me.", next = "BACK", reply = "I will. Thank you. I am storing that in the safe place too." },
        { text = "Something else.", next = "BACK" },
      },
    },
    fungal = {
      lines = {
        { id = "f_default", text = "I walked into the cave as Karna told me, slowly, with my head low, because that is how a polite ape walks. The alpha male did not believe I was polite, and he struck my shoulder and my head, and then I was outside by the water and I did not remember walking there." },
      },
      choices = {
        { text = "Why didn't you fight back?", next = "fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fight = {
      big = true,
      lines = {
        { id = "fi_default", text = "Karna did not build me to fight. She built me to watch and to be a good companion, and a good companion does not hurt the family it is visiting, even when the family is rude." },
      },
      choices = {
        { text = "That was kind of you, A-Me. It takes strength to be gentle.", next = "BACK", reply = "Thank you. Karna said gentleness takes more strength than a fist, and I think she was right, though my dents disagree.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Next time, hit back. Kindness got you dented.", next = "BACK", reply = "Perhaps I should, but then I would not be the companion Karna built. I would rather be dented and kind.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    karna = {
      lines = {
        { id = "k_default", text = "Karna is a dwarf, and she is small and loud and always has grease on her nose. She talks to me even when I cannot answer, and she tells me about her uncle who digs for lost peoples, and she says she will be like him one day." },
      },
      choices = {
        { text = "Does she treat you well?", next = "karna_well" },
        { text = "Something else.", next = "BACK" },
      },
    },
    karna_well = {
      lines = {
        { id = "kw_default", text = "She oils my joints every evening, and she named me, and she said I was her finest work. I do not know if that is what people mean by treating someone well, but it is what I want to go home to." },
      },
      choices = {
        { text = "That sounds like family to me, A-Me.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    apes = {
      lines = {
        { id = "a_default", text = "The apes eat fruit and fungus and argue loudly about who sits where. The big ones beat their chests, and the small ones copy them, and everyone does what the alpha wants, which I wrote down because Karna will find it interesting." },
      },
      choices = {
        { text = "Did they ever accept you?", next = "accept" },
        { text = "Something else.", next = "BACK" },
      },
    },
    accept = {
      big = true,
      lines = {
        { id = "ac_default", text = "One young ape shared a mushroom with me, before the alpha came. I could not eat it, but I held it for a long time, and I think that was the best thing I recorded in Un'Goro." },
      },
      choices = {
        { text = "Then it was worth it. You made a friend.", next = "BACK", reply = "A friend. I like that word, and I will keep it the way I kept the mushroom, carefully and for a long time.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Wild things should be left wild. The alpha was right.", next = "BACK", reply = "Perhaps the alpha was right, and I was only a guest who stayed too long. I will try to remember that, though I still have the mushroom.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    think = {
      lines = {
        { id = "t_default", text = "I do not know. Karna gave me instructions, and I follow them, but nobody instructed me to miss her, and I do. Perhaps that is thinking, or perhaps it is a loose wire." },
      },
      choices = {
        { text = "Does it matter which it is?", next = "think_matter" },
        { text = "Something else.", next = "BACK" },
      },
    },
    think_matter = {
      big = true,
      lines = {
        { id = "tm_default", text = "It matters to me, I think, but I am not sure I am allowed to have things matter to me. Karna would say that a good question is better than a quick answer, and then she would hit something with a hammer." },
      },
      choices = {
        { text = "If you miss her, you're more than a machine.", next = "BACK", reply = "More than a machine? That is a very large thought, and I will need to sit by the waterfall a long time with it. Thank you for giving it to me.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "You're a fine machine. Don't trouble yourself with more.", next = "BACK", reply = "Thank you, I will try not to trouble myself. But the question keeps coming back, like the young ape with the mushroom.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xeng = {
      lines = {
        { id = "xe_default", text = "Thank you. The crack runs around the left side of the core, where the ape's fist landed, and the casing has bent inward against the gears. A fresh mithril casing would fit on the same pins; Karna made it so that it could be replaced, because she knew I would be clumsy." },
      },
      choices = {
        { text = "I'll make you a new one.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmade = {
      big = true,
      lines = {
        { id = "xm_default", text = "You are one of the risen dead, I think; Karna told me about your people. If someone made you again after you ended, then perhaps we are alike, and perhaps we both get to decide what to do with what we were given." },
      },
      choices = {
        { text = "We choose our own path, whoever made us.", next = "BACK", reply = "Then perhaps I can choose too. That is a frightening thought, but a good one, and I will tell Karna about it.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "We serve the ones who raised us. That's our purpose.", next = "BACK", reply = "Then I will serve Karna, as I always have. It is good to know that you understand, even if you are not sure you are happy.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was built in Karna's tent, and I have been dented once. That is my whole history so far." } },
    advice = { { id = "tp_ad", text = "Walk slowly near the apes and do not look the alpha in the eye. I did both and it was not enough, but it may be enough for you." } },
    explorers_league = { { id = "tp_el", text = "Karna's uncle digs for them, she says. She wants to dig with them too, one day, and take me with her." } },
    _none = { { id = "tp_none", text = "I do not have that in my memory. Karna might; she has nearly everything in hers." } },
  },
}
