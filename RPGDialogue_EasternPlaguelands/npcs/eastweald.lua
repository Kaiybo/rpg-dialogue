-- The Eastweald beyond the chapel: Tirion's cottage by the river, and the Marris Stead. Voice: bibles/easternplaguelands.md
local P = RPGDialogueAPI:Pack("rpgd.easternplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "tirion", id = TODO_NPC("Tirion Fordring"), name = "Tirion Fordring",
  bible = "bibles/easternplaguelands.md", role = "noble", tier = "major",
  communities = { "eastweald" }, temper = { "weary" }, values = { "honorable", "loyal", "kind" },
  notices = { "race", "class" },

  impression = {
    first = "Tirion Fordring was a lord and a paladin once, and now he fishes by a river with an old horse for company. He carries his losses quietly, and his kindness hasn't soured in the slightest.",
    third = "{name} met Tirion Fordring, the exiled paladin who lives by a quiet stream in the Eastweald with his old horse Mirador.",
  },

  greetings = {
    { id = "g_river", text = "A visitor, out here? Mind Mirador; he's old, and he doesn't like strangers. Neither did I, once, but I've had time to change." },
    { id = "g_back", when = { metBefore = true }, text = "Back by the river? Sit with me; the fish don't bite, but the water's still pleasant to watch." },
    { id = "g_xsquire", when = { origin = "human_paladin_squire" }, text = "You carry yourself like a squire of the Silver Hand, though you can't have been very old when it broke. Sit a while, and let an old man hear that someone still keeps the oaths." },
    { id = "g_away", when = { away = { min = 14, max = 59 } }, text = "You've been away {away}, and the river hasn't changed a bit, nor have I. Sit a while, if you've the time." },
    { id = "g_away_long", when = { away = 60 }, text = "I'd begun to wonder if the Plaguelands had taken you, after {away} away. I'm glad they didn't, and glad you remembered an old man by the river." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown strong since we last talked, I can see it in how you stand. Use it gently, as well as bravely." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Even out here by the river I hear things, and I hear you've done good work for folk who needed it. The Light sees that, whatever any order says." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Word reached me that someone left a talk with you angry. I've done that myself, and it took me years to mend, so don't let it wait." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc. I knew one, long ago, a good one, and defending him cost me everything I had. I'd do it again." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin. I was one, before they took it from me. Tell me the order still teaches mercy, and lie, if you must." },
  },

  start = "hello",
  nodes = {
    xpt_pala = {
      big = true,
      lines = { { id = "xpt_pala_default", text = "I'd tell them the oath is to people and not to orders, because I broke an order to save an orc's life and the Light never left me for it. Lordaeron called me a traitor, but the Light judged differently, and it's the Light your friend should listen to." } },
      choices = {
        { text = "The oath is to the Light, even against one's king.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "An oath to the crown must be kept, or nothing holds.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Do you regret saving the orc?", next = "xpt_pala2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpt_pala2 = {
      lines = { { id = "xpt_pala2_default", text = "Not for a single day, though I've regretted a great deal else, my wife and my son most of all. Eitrigg was an old soldier tired of killing, and he saved my life before I saved his, and some debts are worth an exile." } },
      choices = {
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Once I'd have said the Light was the only true path, and then an orc showed me more honour than my own order did, and it cost me everything I had. I've learned to judge a soul by what it does, and if the spirits lead you against the Scourge, then we walk the same road, whatever we call the one who lit it." } },
      choices = {
        { text = "The Light and the spirits both guard this world, Tirion.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Faith is only a weapon, Tirion. Use whichever cuts.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Tirion.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Only fish these days, and those reluctantly, since the river runs grey and they taste of it. I hunted the hills round Hearthglen when I was young, and there were stags there with antlers like oak branches, before all this." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "So that's {pet}. Keep it close by the river, {class}, because the plagued things in the Eastweald have learned to hunt in packs, and they're fond of a lone beast at the water's edge." },
      },
      choices = {
        { text = "The land will heal one day, and I'll hunt clean woods again.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "These woods are lost, Tirion. Better to burn them and move on.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Tirion.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "I have to believe so, or there is little point in an old man fishing here. The Light can cleanse a soul, but the land wants something slower, and I think it wants us to stop fighting over it first." } },
      choices = {
        { text = "It will heal with patience and mercy.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It heals when every plague-thing is burned.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I do. He was an old warrior hiding from his own Horde, and he saved my life, and when my own people would have killed him for it, I couldn't stand by. They took my lands and my name, and they told my son I was a traitor, and I'd make the same choice again tomorrow, though I'd give a great deal to have Taelan understand it." } },
      choices = {
        { text = "You chose rightly, Tirion. Honour knows no colours.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Your own people came first. You should have remembered that.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Tirion.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_pala", tags = { "news" }, when = { party = { class = "PALADIN" } },
          text = "You travel with {companion}, and they carry themselves like one of the Silver Hand, though I'd guess they never knew Uther. I was one of the first to take that oath, and I've been out here long enough to wonder whether the order still remembers my name." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf who walks with the spirits, here by my river. I fought beside many dwarves in the Second War, {class}, stout friends every one, though none of them ever spoke to the wind the way you seem to." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, by the look of you. I've watched this river run grey with plague for a long while now, and I'd give a great deal to hear from someone who knows whether it will ever run clean." },
        { id = "h_default", key = true,
          text = "Tirion Fordring, once a knight of the Silver Hand and lord of Hearthglen, and now an old man by a river, with a horse and a fishing line. It's a quieter life, though I didn't choose it, and it keeps me far from my son." },
        { id = "h_food", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Demon Dogs") }, { questActive = TODO_QUEST("Blood Tinged Skies") }, { questActive = TODO_QUEST("Carrion Grubbage") } } },
          text = "The plague is in everything here: the beasts, the birds, the meat. Thin out the sick ones and bring me what's still clean; an old man has to eat." },
        { id = "h_redemption", when = { questActive = TODO_QUEST("Redemption") },
          text = "You've earned the story, then. Sit, and I'll tell you about my son." },
        { id = "h_memories", when = { any = { { questActive = TODO_QUEST("Of Forgotten Memories") }, { questActive = TODO_QUEST("Of Lost Honor") }, { questActive = TODO_QUEST("Of Love and Family") } } },
          text = "Pieces of a life I lost: a hammer, an honor, a painting. Bring them to me, and I'll find the courage to use them." },
        { id = "h_missing", once = true, when = { heardLine = "pool:spirithealer.z_plague" },
          text = "So the healer told you about the missing. Every soul the Scourge lifts from the ground is one the healer never sees, and that's why the Dawn burns what the plague leaves behind." },
        { id = "h_myranda", when = { questActive = TODO_QUEST("Find Myranda") },
          text = "Myranda can help you walk among the Crusade unseen. I don't trust her, but I don't need to; I only need her to be good at what she does." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "You keep coming back to an old man's riverbank, and I've stopped pretending I don't look forward to it. Sit, and tell me the world hasn't forgotten what mercy is." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "I can feel what you carry, {class}, and once I'd have drawn steel at the sight of you. I've learned to wait and see what a person does before I judge what they are." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage. I knew a few of the Kirin Tor in better days, {class}, when Dalaran's towers were the brightest thing in Lordaeron, and I miss the sight more than I'd have guessed." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "You came down the bank so quietly the fish never noticed, {class}, and neither did I until just now. That's a rare gift, and I hope you use it kindly." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. Mirador doesn't startle at you, {class}, which tells me you've a quiet way with beasts, and I've always trusted people the animals trust." },
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "A shaman of the Horde, here by my river. Sit, {class}, if you like; an orc once taught me more about honour than my own order ever did, and I've never been sorry I listened." },
      },
      again = { { id = "h_again", text = "Sit a while longer; the fish aren't biting anyway." } },
      choices = {
        { text = "Can these lands heal, Tirion?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What happened to you?", next = "story" },
        { text = "Tell me about your son.", next = "son" },
        { text = "Do the fish ever bite?", next = "fish" },
        { text = "Who's the horse?", next = "mirador" },
        { text = "Does the Light still hear you?", next = "paladin", when = { class = { "PALADIN", "PRIEST" } } },
        { text = "An orc saved your life?", next = "eitrigg", when = { race = { "Orc", "Human", "Dwarf" }, heardLine = "tirion.s_default" } },
        { text = "Would you show mercy to the dead, Tirion?", next = "x_forsaken", when = { race = "Scourge" } },
        { text = "What turns a soldier into a zealot?", next = "x_warrior", when = { class = "WARRIOR" } },
        { text = "And what do you see in me, Tirion?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do you blame Dalaran for not stopping the plague?", next = "xmage", when = { class = "MAGE" } },
        { text = "Does a paladin think less of someone who works unseen?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do you still hunt these woods, Tirion?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do you mean Eitrigg, Tirion?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "Does a paladin of the old Hand trust a shaman, Tirion?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "My companion is a paladin. What would you tell them?", next = "xpt_pala", when = { party = { class = "PALADIN" } } },
        { text = "I'll help you.", next = "END", fx = { affinity = 2, align = { light = 1, honor = 1 } } },
        { text = "You chose an orc over your own people, and I can't respect that.", next = "END", fx = { affinity = -1, align = { light = -1 } } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I was a paladin, and I'm not sure what I am now, but Hearthglen taught me that the ones doing right in the open aren't always the ones doing right. I showed an orc named Eitrigg mercy where no one could see it, and it cost me everything, and it was still worth it." } },
      choices = {
        { text = "Quiet mercy is still mercy.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Mercy got you exiled. I'll stick to the knife.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I blame no single city, for Lordaeron fell because too many of us looked away at once, my own order among them. Kel'Thuzad came out of Dalaran, true, but so did the mages who fought the Scourge while the rest of us were still arguing." } },
      choices = {
        { text = "Everyone shares the blame. That's the honest answer.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Some carry more blame than others, Tirion.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Someone who chose a dangerous road and is still walking it, which takes nerve, I'll grant. Turn that power on the Scourge and the Crusade will call you damned, but I'll be fishing here, and I'll think better of you than they do." } },
      choices = {
        { text = "I'll use it only against the dead. You have my word.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My power isn't for your approval, old man.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Tirion.", next = "BACK" },
      },
    },
    story = {
      big = true,
      lines = {
        { id = "s_default", text = "There was an orc, Eitrigg, living alone in the hills near Hearthglen, and he saved my life. When my people came to kill him, I stood between them, and for that they stripped me of the Light and of my lands and named me traitor. My wife told my son I'd died. Perhaps that was a kindness." },
      },
      choices = {
        { text = "Do you regret it?", next = "regret" },
        { text = "That's a cruel reward for mercy.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Hearthglen's people were only protecting their own.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
      },
    },
    regret = {
      lines = {
        { id = "r_default", text = "Not for a moment. I regret what it cost my family, but I'd never regret what I did. A paladin who only protects his own kind isn't a paladin; he's a sword with a prayer painted on it." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK", fx = { affinity = 3, align = { light = 2, honor = 1 }, trait = { kind = 1 } } },
        { text = "Your family paid for that mercy, and I'd call that too high a price.", next = "BACK", fx = { align = { light = -2 } } },
      },
    },
    son = {
      lines = { { id = "so_default", text = "Taelan was a boy when I lost him, and he's a man now, wearing the Crusade's red. He thinks his father died a traitor. I think of him every morning, and I fish, and I don't go to Hearthglen." } },
      choices = {
        { text = "You should go to him.", next = "son_go" },
        { text = "Something else.", next = "BACK" },
      },
    },
    son_go = {
      lines = { { id = "sg_default", text = "Perhaps, when I've found the courage to be his father again, instead of a story his mother told. Ask me another day." } },
      choices = {
        { text = "What are you afraid he'll say?", tag = "Persuade", next = "son_fear",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = { "PRIEST", "PALADIN" } }, { trait = "kind" } } } },
          fail = { next = "son_shut", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    fish = {
      lines = { { id = "f_default", text = "Rarely, because the river's sick, like everything here. I don't fish for the fish; I fish because a man has to sit still somewhere, or he goes to Hearthglen and does something foolish." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mirador = {
      lines = { { id = "m_default", text = "Mirador, the last thing I kept. He's older than he looks and wiser than I am; he knew to leave Hearthglen before I did." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    paladin = {
      big = true,
      lines = { { id = "p_default", text = "They took my right to call on it, but they couldn't take the habit of listening. Some mornings I think I hear it, and some mornings I'm only an old man by a river." } },
      choices = {
        { text = "It hears you. I'm sure of it.", next = "BACK", fx = { affinity = 3, align = { light = 2 } } },
        { text = "The Light let them strip you, so I'd stop listening for it.", next = "BACK", fx = { affinity = -1, align = { light = -2 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    eitrigg = {
      lines = { { id = "e_default", text = "He did. Old, tired of war, and living on his own, he pulled me out of a fight I'd have lost, and asked nothing for it. I've known few men, of any kind, better." } },
      choices = {
        { text = "Where is he now?", next = "eitrigg_now" },
        { text = "Something else.", next = "BACK", fx = { opinion = { peace = "for" } } },
      },
    },
    eitrigg_now = {
      lines = { { id = "en_default", text = "With his own people, in Orgrimmar, I'm told. I hope they treat him better than mine treated me, and I suspect they do." } },
      choices = { { text = "Something else.", next = "BACK", fx = { opinion = { peace = "for" } } } },
    },
    son_fear = {
      big = true,
      lines = {
        { id = "sf_default", text = "That he'll be right. He was raised to believe his father betrayed Lordaeron for an orc, and if I ride into Hearthglen and he looks at me the way the Crusade taught him to, I'll have lost him twice." },
        { id = "sf_priest", when = { class = "PRIEST" },
          text = "You'd hear this in a confessional, so I'll say it plainly: I'm not afraid of his sword, I'm afraid of his face. A dead father is a story he can live with, and a living traitor is one he'd have to answer for." },
      },
      choices = {
        { text = "He might surprise you.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then let him decide that, not you.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    son_shut = {
      lines = {
        { id = "ss_default", text = "That's between me and the river, friend, and the river doesn't ask. Forgive an old man for keeping a few things back." },
      },
      choices = {
        { text = "Of course. Forgive me.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_forsaken = {
      lines = {
        { id = "xf_default", text = "I defended an orc when my own people called him a monster, and I've had a long time by this river to wonder where mercy ought to end. You came here to talk with an old man instead of raising a hand to him, so I'll judge you by that, as I'd judge anyone." },
        { id = "xf_knight", when = { origin = "forsaken_risen_knight" }, text = "You were a knight once, before the plague; I can see it in the way you stand, even now. I may well have known your name, and I'm sorry that I can't recall it." },
        { id = "xf_paladin", when = { race = "Scourge", class = "PALADIN" }, text = "The Light answers you, and you a dead man. I'd have called that impossible once, but I've been wrong about a great many things, so tell me, child: does it burn?" },
      },
      choices = {
        { text = "It burns. I carry it anyway.", next = "BACK", when = { class = "PALADIN" }, fx = { affinity = 3, trait = { brave = 1 } } },
        { text = "Mercy is all the dead have left, Tirion.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I don't need anyone's mercy, old man.", next = "BACK", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_warrior = {
      lines = {
        { id = "xw_default", text = "Fear, mostly, and a commander who tells you that your fear is righteous. I watched good men of Hearthglen's garrison follow that voice into the Crusade, and I couldn't call them back, because by then they'd stopped listening to anything that sounded like doubt." },
      },
      choices = {
        { text = "A soldier follows orders. The blame is the commander's.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Every soldier answers for what their own hands do.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've been out of the world a long while, but an old knight remembers more than he lets on. Ask me about any of these and I'll tell you what I can." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "You've sat by this river with me often enough to ask me anything. These I can speak to, and honestly, which is the only way I still know how." },
    },
    background = { { id = "tp_ba", text = "A lord, a paladin, a traitor, a fisherman. Each of them was true for a while.", next = "story" } },
    advice = { { id = "tp_ad", text = "Do the right thing, and pay what it costs without complaining. That's the whole of the Light, as far as I can tell." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "Some of the finest people I knew joined them, to save Lordaeron, and now they burn what's left of it. My son is among them. I try not to think about that, and fail." } },
    argent_dawn = { { id = "tp_dawn", text = "Good people at the chapel, and they'd have me, I think. I'm not ready, but one day." } },
    _none = { { id = "tp_none", text = "I've been out of the world a long while, friend. Ask the chapel." } },
  },
}

P:NPC {
  key = "nathanos", id = TODO_NPC("Nathanos Blightcaller"), name = "Nathanos Blightcaller",
  bible = "bibles/easternplaguelands.md", role = "soldier", tier = "major",
  communities = { "marris_stead" }, temper = { "cold" }, values = { "loyal", "proud" },
  notices = { "race", "class" },

  impression = {
    first = "Nathanos Blightcaller stands on his family's old land and speaks of the Banshee Queen as the one who gave him back his mind. He measured me as a tool, and found me adequate, barely.",
    third = "{name} met Nathanos Blightcaller, the cold Forsaken ranger who serves as the Banshee Queen's champion at Marris Stead.",
  },

  greetings = {
    { id = "g_stead", text = "You stand on my land. It was my family's before the plague, and now it serves the Banshee Queen, as do I." },
    { id = "g_xremember", when = { origin = "forsaken_scourge_remembered" }, text = "You remember serving the Scourge, and I remember dying to it. Keep your memory sharp, as I keep mine, because the Banshee Queen is better served by the dead who never forget." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. I was the finest ranger in Lordaeron, once; the elves trained me, and hated that I was good at it. You may prove useful." },
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "One of the Queen's own. Then you know the debt we owe her, so repay it here." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Kill what I point you at, and leave the prayers for after. The Scarlets at Tyr's Hand call on the same Light you do, and the Banshee Queen wants them dead, so I'll be watching to see whether your hand shakes when you meet them." } },
      choices = {
        { text = "My hand won't shake. The Dark Lady's enemies are mine.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll judge the Scarlets myself, not on your word.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Advance, and keep advancing, through the Scarlet camps and the plaguebats alike, without waiting on orders from the Undercity. The Scourge has all the patience in the world, so the only way to beat it is to be faster." } },
      choices = {
        { text = "Then I'll press forward and give them no rest.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Without orders an army's only a mob. I'll wait for the plan.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else, Blightcaller.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "It troubles me that the Scourge made it and the Dark Lady did not. What the land does after we have won is your concern, druid, not mine." } },
      choices = {
        { text = "The land must be healed, whoever wins.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Win first. The trees can wait.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "I trust the ones who've stopped pretending the dead can be saved, and who mend a ranger's arm so he can draw a bow again. Out here a healer who stays back from the line is just another mouth, so if you mean to serve the Queen at Marris Stead, stand where the plaguebats can reach you." } },
      choices = {
        { text = "I'll stand at the line, Blightcaller. Where I'm needed.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll stand where I please. Healers don't take orders.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Blightcaller.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The land? Perhaps, given a hundred years and a great many fires. But I hunted these woods when I was living, and I'll tell you plainly that I don't care if a single tree grows here again, so long as nothing that killed me walks here either." } },
      choices = {
        { text = "The land needs healing, Blightcaller, as much as it needs vengeance.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Vengeance first. The trees can wait a hundred years.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, Blightcaller.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A tauren druid in the Plaguelands. Keep to the river, druid, and don't go embracing the trees out here, for half of them are rotten through and the other half are worse." },
        { id = "h_default", key = true,
          text = "Nathanos, Champion of the Banshee Queen; they call me the Blightcaller. The Scourge, the plaguebats and the Scarlet zealots all crawl over these fields, and I mean to clear them, and you'll help." },
        { id = "h_queen", when = { heardLine = "sylvanas.h_default" },
          text = "You've stood before my Queen, so you know why I serve. She gave me back my mind, and I'll give her everything else." },
        { id = "h_back", when = { metBefore = true },
          text = "Still alive? Adequate; most of those she sends me are not." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "A warlock. The Undercity has its own masters of shadow, {class}, and the Dark Lady keeps them close, for she knows how quickly a servant becomes a master." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage. Dalaran's people were scattered across this kingdom when the plague came, {class}, and a fair number of them now serve the Dark Lady in the Undercity." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "A rogue. The Banshee Queen's Deathstalkers move as you do, {class}, and I've found them far more useful than soldiers who announce themselves." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior. The Banshee Queen has soldiers enough to hold a line, {class}, so I'll want to see whether you can do more than stand where you're put." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. The Dark Lady's priests have found what the Light never gave us, {class}, and I trust you're not one of the soft ones who still pray to the old Cathedral's god." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Your spirits will find little to talk to out here, {class}, for the Scourge has killed the land as surely as it killed me." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = { "Plaguebat", "Plaguehound" }, min = 40 } }, text = "The plaguebats over Marris Stead are fewer, and the hounds no longer bay at my door. Adequate work. The Queen will hear of it, which is more praise than most get." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin of the Forsaken. I was a ranger-lord of Lordaeron when the Silver Hand still rode, and I never cared much for knights who prayed more than they fought, so show me you're different." },
      },
      again = {
        { id = "h_again", text = "More? Ask it quickly, because the plaguebats won't wait on your curiosity." },
        { id = "h_again2", text = "Go on, then, though I warn you my patience is thinner than these fields." },
      },
      choices = {
        { text = "Does the blight trouble you at all, Blightcaller?", next = "druid_q", when = { class = "DRUID" } },
        { text = "This was your home?", next = "home" },
        { text = "Teach me the ranger's craft, Blightcaller.", next = "x_hunter", when = { class = "HUNTER" } },
        { text = "We both woke in the dark, Blightcaller.", next = "x_forsaken", when = { race = "Scourge" } },
        { text = "I'm an elf, Blightcaller. Does that trouble you?", next = "x_skyborne", when = { race = "Skyborne" } },
        { text = "Does the Banshee Queen fear her warlocks?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do you trust mages, Blightcaller?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Would you set me on the Scarlet zealots, Blightcaller?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "What more would you have a warrior do, Blightcaller?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do you trust any priest, Blightcaller?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do you think the land can be brought back, Blightcaller?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What would you have a paladin do in these fields, Blightcaller?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll clear the fields.", next = "END", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll hunt where I please, Blightcaller, not where you point.", next = "END", fx = { align = { order = -1 } } },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "On anything that crawls across these fields, and the Crusade crawl more than most, preaching all the while. Get close enough to cut a throat before the prayer is finished, and I'll count you worth my time." } },
      choices = {
        { text = "Zealots get no fair fight from me.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll face them openly. Even zealots get that.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else, Blightcaller.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I trust no one, and the Dark Lady trusts less, which is why she rules. But the arcane burns plaguebats out of the sky better than any arrow I've loosed, so I'll put you where they swarm and see what you're worth." } },
      choices = {
        { text = "Trust is earned. I'll earn it in fire.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I don't need your trust, only your targets.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "She fears nothing, but she remembers, for she was a servant to a master once and it cost her everything. Learn from that, {class}, and keep your demons on a short chain, or one morning you'll wake to find yourself their pet." } },
      choices = {
        { text = "My demons serve me. That will never change.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Chains break. I'll be ready when they do.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Blightcaller.", next = "BACK" },
      },
    },
    home = {
      lines = {
        { id = "hm_default", text = "I was born in that house, and I was a ranger lord when there were still lords in Lordaeron. The Scourge took it, and me. The Queen returned me; the house, I'll take back myself." },
      },
      choices = { { text = "Then let's take it back.", next = "END", fx = { affinity = 2 } } },
    },
    x_hunter = {
      lines = {
        { id = "xh_default", text = "Teach you? The elves spent years teaching me, and every lesson came with a sneer for the human who dared to learn it. I'll tell you the one thing they never managed to: a ranger is measured by what he kills, not by the blood he was born with." },
      },
      choices = {
        { text = "Then measure me by my kills.", next = "BACK", fx = { affinity = 2, align = { light = -1 } } },
        { text = "A ranger's measured by what he protects.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_forsaken = {
      lines = {
        { id = "xf_default", text = "We did, and we both woke to her voice, which is the only reason either of us is more than a ghoul in a field. Remember that whenever you're tempted to think your will is your own; it is, now, because she made it so." },
        { id = "xf_soldier", when = { origin = "forsaken_lordaeron_soldier" }, text = "You wore Lordaeron's colors once, as I did. Then you know what this land was, and you'll fight for what it can be under her." },
      },
      choices = {
        { text = "My will is my own, Blightcaller. Nobody gave it to me.", next = "BACK", fx = { affinity = -2, align = { order = -1 } } },
        { text = "I owe her everything, and I'll repay it here.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_skyborne = {
      lines = {
        { id = "xs_default", text = "I don't know your people, elf, and I've no wish to, but I knew the ones who trained me, and I watched them smile while they called me a hound that had learned tricks. If you're different, prove it on the plaguebats, and I'll decide later whether your name is worth remembering." },
      },
      choices = {
        { text = "I'll prove it in the field.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Your grudge is with other elves, not with me.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know these fields and the vermin crawling over them better than any living soul. Ask about these, and be brief about it." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I owe you nothing, so you'll get the short list. Ask about these, or leave my land." },
    },
    scarlet_crusade = { { id = "tp_scarlet", text = "Living fanatics who think fire cures death. They'll learn, and some of them I'll teach personally." } },
    _none = { { id = "tp_none", text = "Irrelevant." } },
  },
}
