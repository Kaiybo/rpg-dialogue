-- The Atal'ai Exile: a jungle troll priest cast out for doubting Jammal'an's prophecy, sheltering with the Witherbark.
-- Voice: bibles/exile.md
local P = RPGDialogueAPI:Pack("rpgd.hinterlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "hl_exile", id = TODO_NPC("Atal'ai Exile"), name = "Atal'ai Exile",
  bible = "bibles/exile.md", role = "priest", tier = "quest",
  communities = { "shadra_alor" }, temper = { "calm", "bitter" }, values = { "wise", "careful", "devout" },
  notices = { "class", "race" },

  impression = {
    first = "The Atal'ai Exile was cast out of his tribe for doubting a prophecy, and now he lives among the Witherbark as a guest they barely tolerate. He speaks of Jammal'an with the cold anger of someone who was right too early.",
    third = "{name} met the Atal'ai Exile, a troll priest banished from the Sunken Temple for doubting Jammal'an the Prophet.",
  },

  greetings = {
    { id = "g_default", text = "You are brave to come here, or foolish, and in Shadra'Alor the loa do not trouble to tell the two apart." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and the Witherbark have not killed you yet. Speak quickly, before they reconsider." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and I am still here, still an exile. Time passes differently for those with nowhere to go, and the spirits of my fathers do not visit an outcast's fire." },
    { id = "g_head", when = { questActive = TODO_QUEST("Jammal'an the Prophet") }, text = "Once Jammal'an has been removed, I stand a chance of returning to my people. Remember that, inside the temple." },
  },

  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest. Then you know what it is to serve something you cannot see, and to wonder some nights whether it is listening." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A Darkspear, so far from the islands. Your people also know what it is to be driven from home by those who should have been kin." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I was a priest of the Atal'ai, the great tribe of the Swamp of Sorrows, until Jammal'an named me an infidel for doubting his prophecy of Hakkar's return and drove me from the temple. Now I live here with the Witherbark, who do not take kindly to strangers, or to me." },
        { id = "h_bundle", tags = { "news" }, when = { questActive = TODO_QUEST("The Atal'ai Exile") },
          text = "You bring me the summoning artifacts of the Atal'ai? So Jammal'an is leading the disciples of the Chamber of Blood toward their chosen fate, and I wonder whether Hakkar has returned to the temple." },
        { id = "h_bundle_done", when = { questActive = TODO_QUEST("Return to Fel'Zerul") },
          text = "Those artifacts are harmless, and you may tell Fel'Zerul in Stonard so. But if Jammal'an has found the proper fetish enchantment for the ritual, the whole world lies in great peril." },
        { id = "h_head_done", tags = { "news" }, when = { questDone = TODO_QUEST("Jammal'an the Prophet") },
          text = "Jammal'an's reckless trust in false visions led my people to their doom, and now he has joined them. I thought revenge would taste of more than ashes." },
        { id = "h_sunken", tags = { "news" }, when = { cleared = "The Temple of Atal'Hakkar" },
          text = "You have been inside the temple, I can see it in your eyes. Tell me nothing of who you found there; I will not sleep if you do." },
        { id = "h_troll", when = { race = "Troll" },
          text = "A troll who walks with the Horde. My people would call you lost, and perhaps I would have, once, but now I am the lost one." },
      },
      again = {
        { id = "h_again", text = "What else? The Witherbark are watching us, and their witch doctors are watching hardest." },
        { id = "h_again2", text = "Ask, if you must. I have time, and nothing else." },
      },
      choices = {
        { text = "Why were you exiled?", next = "exile" },
        { text = "What is Jammal'an's prophecy?", next = "prophecy" },
        { text = "Who is Hakkar?", next = "hakkar" },
        { text = "Living among the Witherbark can't be easy.", next = "witherbark" },
        { text = "I'd guess the loa still answer you.", next = "loa", when = { race = "Troll" } },
        { text = "I'll leave you in peace.", next = "END" },
      },
    },

    exile = {
      lines = {
        { id = "ex_default", text = "I urged caution. I asked what would happen if the prophecy were nothing but manipulation, a trap laid by something that wanted to be summoned, and for that question I was named an infidel." },
      },
      choices = {
        { text = "Did anyone else share your doubts?", next = "exile_others" },
        { text = "Something else.", next = "BACK" },
      },
    },
    exile_others = {
      lines = {
        { id = "eo_default", text = "Some, in whispers, and they whispered more quietly once they saw what was done to me. Fear is a strong mortar, stranger, and Jammal'an builds his temple with it." },
      },
      choices = {
        { text = "Do you want to go home?", next = "exile_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    exile_home = {
      big = true,
      lines = {
        { id = "eh_default", text = "If Jammal'an were gone, I might stand a chance of returning, and of freeing my people from Hakkar's grip. If not, then I have made my peace with being Atal'ai no longer, though the peace is thin." },
      },
      choices = {
        { text = "Then let me end Jammal'an. Vengeance is owed.", next = "BACK", reply = "You would do this for a stranger, for an exile? Then the loa have not forgotten me entirely, and I will pray they guide your blade.", fx = { align = { light = -1 } } },
        { text = "Go back and reason with them. Blood won't free them.", next = "BACK", reply = "Reason with them? They would feed me to the Soulflayer before I finished my first word. You do not know the Atal'ai.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    prophecy = {
      lines = {
        { id = "pr_default", text = "That the summoning of Hakkar the Soulflayer will grant the Atal'ai immortality, and return the glory of the old empire. Jammal'an believes it utterly, and a man who believes utterly cannot be warned." },
      },
      choices = {
        { text = "Why not believe it?", next = "prophecy_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    prophecy_why = {
      lines = {
        { id = "pw_default", text = "Because gods who demand blood rarely pay what they promise, and Hakkar has demanded a great deal of blood. My ancestors learned that once before, and it cost them their place in the empire." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    hakkar = {
      big = true,
      lines = {
        { id = "ha_default", text = "The Soulflayer, the blood god, whom the Atal'ai worshipped long ago until his hunger nearly devoured them. The other tribes drove them out for it, and when they raised a temple in the swamp to call him back, the green dragons drowned it, and still they pray." },
      },
      choices = {
        { text = "Some gods should stay drowned.", next = "BACK", reply = "Yes, drowned and forgotten, as the other tribes wished. If only my people had listened.", fx = { align = { order = 1 } } },
        { text = "Power is power. Perhaps they'll master him.", next = "BACK", reply = "Master him? No one masters Hakkar, stranger; he masters you, and then he eats you. Do not wish for it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    witherbark = {
      lines = {
        { id = "wi_default", text = "As a guest they do not want and will not kill, because a priest is a priest, even an outcast one. I tend their sick, and they let me sleep at the edge of their fires." },
      },
      choices = {
        { text = "They must be dangerous to you.", next = "witherbark_danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    witherbark_danger = {
      lines = {
        { id = "wd_default", text = "To me, less than to you. They hate the Wildhammer for taking their lands and the Revantusk for leaving their ways, and a stranger is easier to hate than either." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    loa = {
      lines = {
        { id = "lo_default", text = "Some do, quietly, as if they too fear Jammal'an's ears. The loa remember older bargains than Hakkar's, and I pray to them now and hope they will forgive me the god I served." },
      },
      choices = {
        { text = "The loa forgive those who turn back.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know the Atal'ai, their temple and their god, more than I would wish to, for I sang his hymns with blood on my hands. Ask, stranger." } },
    background = { { id = "tp_bg", text = "A priest of the Atal'ai, once. Now only an exile, and the Witherbark do not let me forget it." } },
    advice = { { id = "tp_ad", text = "If you enter the temple, do not listen to the singing. Some of it is meant for you." } },
    sunken_temple = { { id = "tp_sunken_temple", text = "The Atal'ai sank their own temple to hide their god, and they still worship him in the swamp. Jammal'an leads them now, and he is mad, and I said so, and that is why I am here." } },
    zul_gurub = { { id = "tp_zul_gurub", text = "The Gurubashi have woken Hakkar in Zul'Gurub, and his priests are spreading his blood through every tribe that will listen. The Witherbark are listening, and I am trying to make them stop." } },
    darkspear = { { id = "tp_darkspear", text = "The Darkspear are traitors, the Atal'ai say, for siding with the orcs. I think they are the only trolls with any sense left in them." } },
    _none = { { id = "tp_none", text = "That is not a thing an exile would know. Ask someone with a home, and loa who still answer." } },
  },
}
