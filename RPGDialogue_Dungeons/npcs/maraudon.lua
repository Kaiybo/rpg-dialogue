-- Maraudon: the caverns beneath Desolace where Zaetar and Theradras' children are entombed.
-- Celebras the Redeemed, Zaetar's son, freed of his curse and waiting by the Scepter's making.
-- Voices: bibles/dg_celebras.md
local P = RPGDialogueAPI:Pack("rpgd.dungeons")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Celebras the Redeemed: son of Zaetar, freed from his curse, forges the Scepter of Celebras.
---------------------------------------------------------------------------
P:NPC {
  key = "dg_celebras", id = TODO_NPC("Celebras the Redeemed"), name = "Celebras the Redeemed", title = "Son of Zaetar",
  bible = "bibles/dg_celebras.md", role = "questgiver", tier = "major",
  temper = { "gentle", "melancholy" }, values = { "faithful", "wise" },
  notices = { "class", "race" },
  impression = {
    first = "Gratitude, and a weariness older than the caverns themselves.",
    third = "{name} freed Celebras, son of Zaetar, from the curse that bound him in Maraudon.",
  },
  greetings = {
    { id = "g_default", text = "You broke the curse that held me. I thank you, though there is little I can offer in this dark place." },
    { id = "g_scepter", when = { questActive = TODO_QUEST("The Scepter of Celebras") }, text = "You bear the rod and the gem. Stand back, and I will join them, as my father would have." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" }, text = "You walk the path of Cenarius, my grandsire. Then you are kin of a sort, and welcome." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" }, text = "Your people knew my father in the days when the forests were young. Few of them remember him kindly, I think." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Celebras, son of Zaetar, who was the son of Cenarius. When my father fell, the earth-mother's hate came down upon all his children, and I lost myself in it for longer than I can measure." },
      },
      again = { { id = "h_again", text = "Ask what you will. I have had a long silence." } },
      choices = {
        { text = "Who was Zaetar?", next = "zaetar" },
        { text = "Who is Princess Theradras?", next = "theradras" },
        { text = "What is the Scepter of Celebras?", next = "scepter" },
        { text = "What became of your kin here?", next = "kin" },
        { text = "You said you lost yourself. What was the curse?", next = "curse" },
        { text = "I walk with Cenarius too. What do you remember of him?", next = "cenarius", when = { class = "DRUID" } },
        { text = "My people still speak of the centaur's cruelty.", next = "tauren", when = { race = "Tauren" } },
        { text = "Rest now. I'll go on.", next = "END" },
      },
    },
    zaetar = {
      lines = { { id = "z_default", text = "My father was the son of Cenarius, a keeper of the grove. He loved Theradras, the earth elemental princess, and from that love came the centaur. When the centaur grew strong and savage, they turned on him and slew him." } },
      choices = {
        { text = "A father killed by his own children.", next = "BACK", reply = "Yes. The centaur still roam Desolace with his blood in them and none of his peace. I do not know whether to pity them or fear them." },
        { text = "Something else.", next = "BACK" },
      },
    },
    theradras = {
      lines = { { id = "t_default", text = "She is the princess of the earth, and her grief became rage. She buried my father deep and keeps his spirit with her. Her corruption seeps into the land, and that is why Desolace withers above you." } },
      choices = {
        { text = "Then she must be destroyed.", next = "BACK", reply = "Perhaps it is the only way. But remember that she loved him once, and that even ending her is a sorrow.", fx = { align = { light = -1 } } },
        { text = "Surely her grief could be eased instead.", next = "BACK", reply = "You have a kind heart. I tried, in my own way, and it made me into something cursed. Be careful where kindness leads you here.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    scepter = {
      lines = { { id = "s_default", text = "A staff made from the rod of Celebras and the Celebrian Diamond, given to those who would reach my father's resting place without crawling the long way through Theradras' halls. With it, you can open the portal at the cavern's mouth." } },
      choices = {
        { text = "Then I'll bring you the pieces.", next = "BUSINESS" },
        { text = "Where would I find the rod and the diamond?", next = "scepter_parts" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scepter_parts = {
      lines = { { id = "sp_default", text = "The rod lies with my own remains, in the place where the curse first took me, and the diamond was carried off by the Khans of the Gelkis and Magram long ago. Veng and the other Khans guard my father's spirit-gems as if they were trophies." } },
      choices = {
        { text = "Why make a shortcut at all, if the way is known?", next = "scepter_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    scepter_why = {
      lines = { { id = "sw_default", text = "Because the long way runs through rot and spore and Theradras' children, and every friend who walks it alone comes back less than they went in. My father would not want his tomb to cost so much to visit." } },
      choices = {
        { text = "That's a gift few would think to give.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    curse = {
      narr = "He looks down at his own hands as though they still belonged to someone else.",
      lines = { { id = "cu_default", text = "When Theradras' rage came down on my father's line, it found me grieving and filled the space where my grief had been. I wandered these halls as a shade with no name, and I struck at anyone who came near the grave." } },
      choices = {
        { text = "How did breaking it free you?", next = "curse_free" },
        { text = "You weren't to blame for what the curse made you do.", next = "curse_blame", fx = { align = { light = 1 } } },
        { text = "Grief or not, you still struck those people down.", next = "curse_blame_hard", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    curse_free = {
      lines = { { id = "cf_default", text = "The curse lived in the shape it gave me, and when that shape was cut down, there was nothing left for it to hold. What remains is only me, and the memory of everything I did while I was not." } },
      choices = {
        { text = "Can you leave this place now?", next = "curse_leave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    curse_leave = {
      lines = { { id = "cl_default", text = "I could, I think, but my father is still down there in Theradras' grip, and a son does not walk away from that. I will stay until the earth gives him back, or until someone ends her." } },
      choices = {
        { text = "Then I'll see that it ends.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    curse_blame = {
      lines = { { id = "cb_default", text = "You are generous, and I will try to believe you. But the ones I struck down do not get to forgive me, and so I carry it for them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    curse_blame_hard = {
      lines = { { id = "ch_default", text = "I did, and I will not argue with you. Saying it plainly is a kind of honesty, and I have had little enough of that from myself." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cenarius = {
      lines = { { id = "ce_default", text = "I remember antlers against the moon and a voice like wind through old oaks. He came to Maraudon once, when it was still green, and he wept over my father's grave, though he would not go below to face Theradras." } },
      choices = {
        { text = "Why wouldn't he face her?", next = "cenarius_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cenarius_why = {
      lines = { { id = "cw_default", text = "Because she was grieving too, and a demigod who wars on grief only makes more of it. He chose to mourn instead of strike, and I have never decided whether that was wisdom or weakness." } },
      choices = {
        { text = "Wisdom, I think.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = { { id = "ta_default", text = "They have reason to. The centaur drove your herds off the plains for generations, and every raid was my father's blood turned against a people who never wronged him. I am sorry for it, though my sorrow mends nothing." } },
      choices = { { text = "It isn't yours to carry.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    kin = {
      lines = { { id = "k_default", text = "The Khans who carry my father's spirit-gems roam the caverns, and the keepers of the grove sleep in green rot. Noxxion and the others were born of the poison here. They are not kin, only scars." } },
      choices = {
        { text = "I'm sorry for all you've lost.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  blurts = {
    { id = "bl1", text = "Theradras keeps my father's body in the deepest part of Maraudon, beneath the falls of Earth Song, and she will not give it up while she lives." },
    { id = "bl2", text = "The scepter I made can open the way to the inner halls, if you would rather not wade through every corridor of my father's tomb again." },
  },
  alignment = { light = 1 },
  confides = {
    { id = "cnf_1", text = "Theradras rises from the falls of Earth Song when her house is threatened. Clear the halls behind you before you face her, for you will want an easy road out." },
    { id = "cnf_2", text = "The orange halls belong to Noxxion's foul spawn and the purple halls to Lord Vyletongue. Either road leads deeper, but the purple road leaves you less sick at the end of it." },
  },
  topics = {
    grievance = {
      { id = "gv1", text = "I owe you my freedom, and still you have made me regret owing you anything. That is a sorrow I did not expect." },
      { id = "gv_values", when = { grudge = "values" }, text = "You walk through my father's tomb as if it were a mine. Maraudon was holy once, and you treat it as plunder." },
      { id = "gv_wronge", when = { grudge = "wronged" }, text = "I spoke to you of my father and my grief, and you answered with scorn. The curse was gentler than that." },
    },
    amends = {
      { id = "am1", text = "Carry Zaetar's memory gently, and leave his tomb in peace when you are done. That would be enough." },
      { id = "am_values", when = { grudge = "values" }, text = "Take only what you need from Maraudon, and do not mock the dead there. I will know if you do." },
    },
    spite = {
      { id = "sp1", text = "I think you are as hard as Theradras' stone, and as blind to what grows around you." },
      { id = "sp_values", when = { grudge = "values" }, text = "I think you would rob my father's grave if the gems were large enough, and the earth-mother would welcome you as one of her own." },
    },
    maraudon = { { id = "tp_mar", text = "Maraudon is my father's tomb and Theradras' house. It was holy once." } },
    _none = { { id = "tp_none", text = "I have been lost a long while. I do not know that." } },
    regard = {
      { id = "rg_1", text = "I think you are kind, though you carry yourself as if you would rather no one noticed. You freed me, and you have never once asked what it cost me." },
      { id = "rg_2", text = "You walk through my father's tomb with care now, and the earth notices that, even here. So do I." },
      { id = "rg_druid", when = { class = "DRUID" }, text = "You walk the path my grandsire taught, and you walk it well. Cenarius would know you for one of his own, as I do." },
      { id = "rg_light", when = { alignment = { axis = "light", min = 30 } }, text = "There is a gentleness in you that the curse would have torn out of me, had you not come. I feel it whenever you speak, and it heals something." },
    },
    confide = {
      { id = "cf_1", text = "I remember the curse more than I let you see. I remember what I said and did as Celebras the Cursed, and some days I cannot be sure which of us is speaking." },
      { id = "cf_2", text = "I do not know whether Theradras ever truly loved my father, or whether he was only another stone in her house. I hope she did, and I fear she did not." },
    },
    trust = {
      { id = "tr_1", text = "Trust the druids of the Circle, who have tried to mend Desolace for longer than you have been alive. They are patient, and patience is what this land needs most." },
      { id = "tr_2", text = "Not the centaur, though they are my kin and I love them as a brother must. The Khans have never kept a promise they could break." },
    },
    watchout = {
      { id = "wo_1", text = "Beware the water in the deeper halls, for it is fouled by what lives there, and it does not wash clean as ordinary water does." },
      { id = "wo_2", text = "Beware the earth itself near Theradras' throne. She is the stone, and she knows where you stand before you take each step." },
    },
    worries = {
      { id = "wy_1", text = "That the curse is not wholly gone, only sleeping. Some nights I feel the old bitterness stir, and I wonder how long I will remain myself." },
      { id = "wy_2", text = "That my father's tomb will never be at peace, however many times it is cleansed. Too many have died in these halls for them to sleep easily." },
    },
    hopes = {
      { id = "hp_1", text = "To lay my father to rest beneath open sky, where the grass can grow over him as he would have wished. I do not know if it will ever be possible." },
      { id = "hp_2", text = "That the Khans will one day remember they are Zaetar's children as well as Theradras', and lay down their spears." },
    },
    favor = {
      { id = "fv_1", text = "Bring peace to Maraudon's halls when you pass through them, and do it gently where you can. My father would want his tomb cleansed, not plundered." },
      { id = "fv_2", text = "If you speak with any druid of the Circle, tell them that Zaetar's son is himself again. I would like someone beyond these caverns to know it." },
    },
    friendship = {
      { id = "fr_1", text = "You are my friend, {name}, the first I have had since the curse took me. I did not think I would ever have another." },
      { id = "fr_2", text = "I count you a friend, and more than a friend, for you gave me back myself. There is no debt deeper than that, and no friendship truer." },
      { id = "fr_earned", when = { fondness = { best = "earned" } }, text = "You came back into the dark for me, again and again, when you had what you needed long ago. That is what a friend does, and I will not forget it." },
    },
    never_told = {
      { id = "nt_1", text = "I let you believe the curse took my memory of what I did in these halls. It did not, and I remember every hour of it." },
      { id = "nt_2", text = "Sometimes I wish you had not freed me. The curse kept me from grieving, and now there is nothing between me and the grief." },
    },
  },
}
