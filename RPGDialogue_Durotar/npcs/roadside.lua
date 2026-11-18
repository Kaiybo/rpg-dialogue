-- Durotar between the towns, and Razor Hill's trainers. Voice: bibles/durotar.md
-- Misha Tor'kren keeps a lonely hut in the north; Margoz watches Skull Rock from his.
local P = RPGDialogueAPI:Pack("rpgd.durotar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "misha", id = TODO_NPC("Misha Tor'kren"), name = "Misha Tor'kren",
  bible = "bibles/durotar.md", role = "questgiver", tier = "quest",
  temper = { "grieving" }, values = { "loyal", "proud" },
  notices = { "race" },
  impression = {
    first = "Misha Tor'kren lives alone in a hut in Durotar's north, and the grief for her son Kron sits on her like a second skin. She asks for his amulet back from the beasts that took him, and she does not ask twice.",
    third = "{name} met Misha Tor'kren, a widowed orc keeping a lonely hut in northern Durotar.",
  },
  greetings = {
    { id = "g_hut", text = "Few walk this far north, and fewer stop at my door. Say what brings you, young one, and say it plainly." },
    { id = "g_back", when = { metBefore = true }, text = "You came back to this old hut, then. Sit, if you can stand the smell of goat." },
  },
  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "You have the look of the camps about you, young one, the way my Kron did before he grew into his shoulders." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "The humans' priests prayed over my people in the camps, and nothing came of it but more chains. My son is gone, and no Light will bring him back. If you want to help, bring me his amulet, and keep your prayers for someone who wants them." } },
      choices = {
        { text = "Then I'll bring the amulet and keep my prayers.", next = "BACK", reply = "Thank you, and forgive an old woman her bitterness. Bring it home, and that will be prayer enough for me.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayer would comfort you, Misha, if you let it.", next = "BACK", reply = "Maybe it would, but I've no room left in me for it. Keep it for someone whose hands aren't so tired, priest.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "I'd like his amulet back more than any prayer, but I'll not turn one away. Pray that he went quickly, and that he wasn't afraid, because those are the things I think about when the hut is quiet." } },
      choices = {
        { text = "I'll pray for him, and bring his amulet home.", next = "BACK", reply = "Thank you, priest, from the bottom of what's left of my heart. Pray that he wasn't afraid, and I'll try to believe it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers won't help him. Vengeance on the beasts will.", next = "BACK", reply = "Vengeance, then, if you must, but bring me his amulet first. The beasts don't know what they took.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Guard it from what? The beasts already took the only thing I had worth losing. But if you go out among them, go carefully, because a strong arm didn't save my son, and I'd not have another mother waiting by her door for nothing." } },
      choices = {
        { text = "I'll find his amulet, and I'll go carefully.", next = "BACK", reply = "Thank you, and walk softly on that hill. I'll leave a light by the door until you're back.", fx = { align = { honor = 1 } } },
        { text = "Kron should have been stronger. These hills don't forgive weakness.", next = "BACK", reply = "Don't you dare speak of my son like that in front of me. He was stronger than you'll ever know, and the hills took him anyway.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Whatever the hills gave him, boar mostly, and the odd scorpid for its shell. He went out alone because he was proud, and I've thought every day since that if he'd had a beast beside him, someone would have come home to tell me what happened." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Whatever the hills gave him, boar mostly, and the odd scorpid for its shell. Keep your {pet} close, {class}. A beast at your side is a friend who won't let you walk out into the hills alone." },
      },
      choices = {
        { text = "Kron was brave. There's no shame in how he fell.", next = "BACK", reply = "No, there isn't, and it's kind of you to say it. He went down fighting, and that's how he'd have wanted it.", fx = { align = { honor = 1 } } },
        { text = "Pride killed him. A hunter should know better.", next = "BACK", reply = "Maybe, but he was young, and the young are always proud. Don't tell me what he should have known, hunter.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "No one took him, only the beasts of this hill, and I've made my peace with that, or most of it. If you find his amulet, bring it home to me, and walk softly for him while you look." },
      },
      choices = {
        { text = "I'll find it, and bring it straight to you.", next = "BACK", reply = "Thank you, and may the ancestors guide your feet. I'll be waiting.", fx = { align = { light = 1 } } },
        { text = "If I find it, we'll talk about what it's worth.", next = "BACK", reply = "Worth? It's worth my son's name to the spirits, and that's all you'll get from me. Bring it, or don't.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "That they promised us strength and gave us the blood curse, and that it took Thrall and Hellscream to free us from it. I won't turn you from my door, because my clan is gone and I can't be choosy, but I'll ask you not to call that thing near my hut." },
      },
      choices = {
        { text = "Of course. I won't bring it near your home.", next = "BACK", reply = "Thank you, and that's more courtesy than I expected. Leave it at the edge of the hill, and you're welcome inside.", fx = { align = { order = 1 } } },
        { text = "The old warlocks were weak. I'm not them.", next = "BACK", reply = "Every one of them said that, and every one of them was wrong. Prove it by keeping that thing away from my door.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Gornek of the Den says the ancestors keep the ones who die well, and Kron died with his axe in his hand, so perhaps they have him. I don't want a ghost, shaman. I only want to know that he isn't lost out in those hills alone." } },
      choices = {
        { text = "He died fighting, Misha, so the ancestors will have kept him.", next = "BACK", reply = "I hope so, with all my heart. Thank you, shaman, for saying it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead are gone, and the spirits won't change that.", next = "BACK", reply = "Then I'll keep hoping anyway, because hope is all I have. Go, shaman, and leave me to my quiet.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "I did at first, and I hunted them until my arms gave out. Now I think they did only what beasts do, and I'm the one who let a boy go hunting alone." } },
      choices = {
        { text = "The beasts did only what they must. Forgive them.", next = "BACK", reply = "Maybe I have, slowly. The beasts were only hungry, and I was only careless.", fx = { align = { light = 1 } } },
        { text = "They took your son. They deserve no forgiveness.", next = "BACK", reply = "That's what I told myself for a year, and it didn't bring him back. Forgiveness is harder, but it's quieter.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Spells won't bring my Kron back, so don't offer, because I've heard every kind word there is and none of them dug a grave. If you want to help, go and take his amulet back from the beasts on the hill, and use whatever fire you like while you do it." },
      },
      choices = {
        { text = "I'll bring his amulet home, Misha, whatever it takes.", next = "BACK", reply = "Thank you, and forgive me for being sharp with you. Bring it home, and use your fire as you like.", fx = { align = { light = 1 } } },
        { text = "I'm sorry for your loss, but I have my own road.", next = "BACK", reply = "Then go your road, and may it be kinder to you than mine was to my son. I'll find another to help.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "The dead, carrying the Light. I have no prayers left for anyone since my Kron, so don't offer me yours." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Then you'll know how to speak to a mother who's lost her son, and you'll know not to say it was meant to be." },
        { id = "h_default", key = true,
          text = "I am Misha Tor'kren, and this hut is all the clan I have left. My son Kron went out hunting and never came home, and the beasts of this hill have his amulet still." },
        { id = "h_amulet", when = { questActive = TODO_QUEST("Lost But Not Forgotten") },
          text = "The beasts that killed my Kron roam the hills nearby. Bring me back his amulet, so that I have something of him to bury." },
        { id = "h_done", when = { questDone = TODO_QUEST("Lost But Not Forgotten") },
          text = "His amulet hangs by my door now, and I touch it every morning. You did a kindness for an old woman, and I have not forgotten it." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "You're a druid, then. Kron used to say the tauren could speak with beasts, and I laughed at him, but now I'd give anything to know whether it's true." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "You speak with the spirits, shaman. Then tell me true, do the dead walk among them, and would my Kron still know his mother's voice?" },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "You walk like Kron did, all quiet steps and quick eyes. He'd have liked you, I think." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "I can smell the fel on you, warlock. I remember that smell from before the camps, when our warlocks still walked among us." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. The grunts used to pass my hut when Kron was small, and he'd watch them go by and swing a stick like an axe." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, with a beast at your heel. Kron hunted too, and he'd have loved a companion like that." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. Can your spells find a dead boy's amulet? No, I thought not." },
      },
      choices = {
        { text = "Would you like me to say a prayer for Kron?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Shall I listen for Kron among the spirits, Misha?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "You must blame the beasts for Kron, Misha.", next = "druid_q", when = { class = "DRUID" } },
        { text = "Tell me about Kron.", next = "kron" },
        { text = "You live a long way from Razor Hill.", next = "alone" },
        { text = "Who else lives out here?", next = "neighbours" },
        { text = "I lost my kin to the camps as well.", next = "camps", when = { race = "Orc" } },
        { text = "Would you want me to find whoever took Kron?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "This hut could use a warrior to guard it, Misha.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What did Kron hunt, Misha?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What do you remember of the old warlocks, Misha?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "My spells might help you somehow, Misha.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Would you have me pray for Kron, Misha?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll leave you in peace.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Ask what you will, then. The wind does most of my talking these days." },
        { id = "h_again2", text = "Something more? I have time, if nothing else." },
      },
    },
    kron = {
      lines = { { id = "k_default", text = "He was born in the internment camps, and he never once complained about it. When the Warchief freed us, Kron wanted only open land and something to hunt, and Durotar gave him both." } },
      choices = {
        { text = "How did he die?", next = "kron_death" },
        { text = "Do you hate the humans who kept you in the camps?", next = "camps_op" },
      },
    },
    kron_death = {
      lines = { { id = "kd_default", text = "He tracked something bigger than he should have, alone, because he was proud like his father. The hunters who found him brought back his spear but not his amulet, and that is the part I cannot let rest." } },
      choices = { { text = "What was the amulet?", next = "kron_amulet" } },
    },
    kron_amulet = {
      lines = { { id = "ka_default", text = "A plain thing of bone and cord that I made him when he was small, so that the spirits would know him. Without it, I fear they wander looking for a name they cannot find." } },
      choices = {
        { text = "I'll bring it back to you, mother.", next = "BACK", reply = "Thank you, child, more than I can say. Bring it home, so he can find his way.", fx = { affinity = 3, align = { light = 1 } } },
        { text = "The dead don't need trinkets. You should let him go.", next = "BACK", reply = "Let him go? I'll let him go when the spirits know his name. Until then, I keep looking.", fx = { affinity = -2, align = { light = -1 } } },
        { text = "Something else, if you'll allow it.", next = "BACK" },
      },
    },
    camps_op = {
      lines = {
        { id = "co_default", text = "I did, for years, and the hate fed me better than their gruel ever did. But Kron never hated anything, not even the guards, and I wonder now which of us was right, so tell me, child, what do you think we owe the humans?" },
        { id = "co_undead", when = { race = "Scourge" }, text = "You were one of them, so perhaps you'll know. I hated them for years, and Kron never hated anything, and I wonder now which of us was right. What do we owe them, you think?" },
      },
      choices = {
        { text = "Nothing but the axe. They earned it.", next = "co_hate", fx = { align = { light = -1 }, opinion = { humans = "hate", peace = "against" } } },
        { text = "The Warchief made peace. Hate only poisons us.", next = "co_forgive", fx = { affinity = 1, align = { light = 1 }, opinion = { humans = "forgive", peace = "for" } } },
        { text = "I don't trust them, but war would cost more sons.", next = "co_wary", fx = { affinity = 2, opinion = { humans = "distrust", peace = "for" } } },
        { text = "I was human once. Not all of them were camp guards.", next = "co_mixed", when = { race = "Scourge" }, fx = { opinion = { humans = "mixed" } } },
        { text = "I can't answer that for you, Misha.", next = "BACK" },
      },
    },
    co_hate = {
      lines = { { id = "coh_default", text = "That is what I said, once, with my whole heart. It kept me alive, child, but it never once kept me warm." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    co_forgive = {
      lines = { { id = "cof_default", text = "Kron would have said that, and he would have said it with his mouth full and his feet on my table. Thank you for saying it for him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    co_wary = {
      lines = { { id = "cow_default", text = "More sons, yes, and I have none left to give, so I'll take your answer and keep it by the door with his amulet." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    co_mixed = {
      lines = { { id = "com_default", text = "Then you are kinder to them than I could ever be, and you have more reason not to be. Strange, the things the dead teach the living." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    alone = {
      lines = { { id = "a_default", text = "Razor Hill is full of young warriors shouting about glory, and I have heard enough of that for one life. Out here the hills are quiet, and quiet is what a grieving woman wants." } },
      choices = {
        { text = "The Horde should care for its widows better.", next = "BACK", reply = "It should, and maybe one day it will. Until then, I have my hill and my quiet.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Quiet is your right. Nobody should drag you back.", next = "BACK", reply = "Thank you for that. Most only want to drag me back to Razor Hill's shouting.", fx = { affinity = 1, align = { order = -1 } } },
      },
    },
    neighbours = {
      lines = { { id = "nb_default", text = "There is Margoz, who sits by Skull Rock and watches the cultists come and go, and he is no better company than I am. South are the soldiers at Razor Hill, and past them only scorpids." } },
      choices = { { text = "I'll look in on Margoz.", next = "BACK" } },
    },
    camps = {
      lines = { { id = "c_default", text = "Then you know why I will not forget, because the camps took years from us and the hills took the rest. Carry them with you, child, but do not let them make you bitter." } },
      choices = { { text = "I'll try. Thank you.", next = "BACK", fx = { affinity = 2 } } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I know this hut and these hills, and the ancestors know the rest. Little else matters to me now." } },
    thrall = { { id = "tp_thrall", text = "The Warchief told us this land would be our home, and so I came, and I brought my son. I don't blame Thrall, but I think of it every day." } },
    centaur = { { id = "tp_centaur", text = "The Kolkar raid from the west, and the beasts hunt in the north, and Durotar has room for all of them to hurt you. My son learned that, and I wish he'd learned it slower." } },
    second_war = { { id = "tp_second_war", text = "Kron's father fought in the Second War and came home broken, and Kron was born in the camps. He was meant to have a better life here, and for a while, he did." } },
    internment = { { id = "tp_internment", text = "We were in a camp near the old human roads, and Kron grew up behind a fence. He used to say the first thing he'd do when he was free was run, and he did." } },
  },
}

P:NPC {
  key = "margoz", id = TODO_NPC("Margoz"), name = "Margoz",
  bible = "bibles/durotar.md", role = "questgiver", tier = "quest",
  temper = { "watchful" }, values = { "dutiful", "patient" },
  notices = { "class" },
  impression = {
    first = "Margoz keeps a hut within sight of Skull Rock and counts the Burning Blade cultists who slip in and out of it. He is patient and sour about it, and he would rather you did the killing than him.",
    third = "{name} met Margoz, an orc keeping watch over Skull Rock from a hut in the hills.",
  },
  greetings = {
    { id = "g_watch", text = "Keep your voice down, because the rock has ears. What do you want?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again? The cultists haven't gone anywhere, if that's what you're wondering." },
  },
  notice = {
    { id = "n_warlock", cat = "class", when = { class = "WARLOCK" },
      text = "You smell of the same fel as the ones in that cave, and I will be watching your hands while we talk." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I don't know, and I'd like to. The Silver Hand burned my people with it when we were already beaten, which tells me it burns whoever it's pointed at. Point it at Skull Rock, and I'll count the cultists who come out." } },
      choices = {
        { text = "I'll burn the cultists, and gladly, for the Horde.", next = "BACK", reply = "Good, and I'll count every one that falls. For the Horde, and for Durotar.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll burn whoever pays best, Margoz.", next = "BACK", reply = "Then you'll find Orgnil pays fair, and I'll count your cultists either way. Just burn them well.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Maybe, after they're all dead and gone, and not a moment before. Whatever they call up in there fouls the air for days, and I've seen grunts walk out coughing black, so if you go in, go in with someone who can swing an axe." } },
      choices = {
        { text = "Then I'll go in, and cleanse it when it's done.", next = "BACK", reply = "Gadrin would thank you for that, and so would the land. Go in strong, and come out clean.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let the cave rot. Cleansing it is wasted effort.", next = "BACK", reply = "Wasted, maybe, but the cave will keep spitting out evil until someone does it. Leave it for the shamans, then.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More every week, and I stopped counting at forty, because counting doesn't kill them. They've got apprentices and fanatics and the imps they call up between them, so go in with your shield first and your axe second, and back out the way you came if they swarm." } },
      choices = {
        { text = "I'll hold the cave mouth while the others get clear.", next = "BACK", reply = "That's the grunt I'd want beside me, and the one I'd follow out. Hold it well.", fx = { align = { honor = 1 } } },
        { text = "I'll go in alone and take all the glory.", next = "BACK", reply = "Then you'll be the forty-first I count, and the first I bury. Go with someone, or don't go.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Imps, mostly, running errands for the cultists at night, and they burn the scrub wherever they stop to squabble. Follow them and you'll find the ways into the caves, and once I know every way in, Orgnil can send enough grunts to block every way out." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Imps, mostly, running errands for the cultists at night, and they burn the scrub wherever they stop to squabble. Your {pet} doesn't like the smell up here either, does it? Good beast; it knows trouble when it smells it." },
      },
      choices = {
        { text = "I'll map every way in and let Orgnil plan.", next = "BACK", reply = "Good, that's the right way. Orgnil will be glad, and so will I.", fx = { align = { order = 1 } } },
        { text = "Why wait for Orgnil? I'll hunt the imps myself.", next = "BACK", reply = "Because one hunter is one hunter, and the Blade has forty. Map it first, and let Orgnil send an army.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "I'd be grateful, and so would Orgnil, though he'll want to know where you learned to move like that. Count heads, mark the imps and get out, and don't go making a name for yourself in there." },
      },
      choices = {
        { text = "Count heads and get out. I'll do it right.", next = "BACK", reply = "That's the way, and you'll make Orgnil proud. Get out clean, and I'll buy you an ale.", fx = { align = { order = 1 } } },
        { text = "If I see a chance to strike, I'll take it.", next = "BACK", reply = "Then make it count, and make sure you get out. A dead rogue counts nothing.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Maybe, if you can see through stone, which I doubt. Mostly I need someone to burn the Blade's imps when they come sniffing at my camp after dark, so if you're staying, stand where I can see you." },
      },
      choices = {
        { text = "I'll stand watch with you, then. Gladly.", next = "BACK", reply = "Gladly, and I'll be glad of the company. Stand where I can see you, and keep your fire ready.", fx = { align = { honor = 1 } } },
        { text = "I'll burn the imps, then leave you to your watching.", next = "BACK", reply = "Fair enough, and I'll thank you for the imps. The watching's my job anyway.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Nothing grows by that cave mouth, not even the thorns, and the stones at the entrance are warm at midnight. I'm no shaman, but I know a wound when I see one, and Skull Rock is bleeding something that isn't blood." } },
      choices = {
        { text = "Then I'll go in and close that wound myself.", next = "BACK", reply = "Then you're braver than me, and maybe wiser. The earth will thank you, if you live through it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let them fester, and pick them off as they come out.", next = "BACK", reply = "That's how I've been doing it, and it's slow work. Maybe you'll have better luck.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Nothing grows within a stone's throw of the cave mouth now, and even the scorpids out there have turned mean and strange. I count cultists because that's my job, but I'd count it a kindness if someone mended the ground once they're gone." } },
      choices = {
        { text = "The cultists come first. The land can wait until they're dead.", next = "BACK", reply = "That's how Orgnil sees it, and he's usually right. Kill them first, and we'll see what's left.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The land comes first. Let the grunts worry about the cultists.", next = "BACK", reply = "You sound like a tauren, but maybe you're right. The grunts can worry about the cultists, and you can worry about the ground.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_darkstorm", tags = { "news" }, when = { questDone = TODO_QUEST("Dark Storms") },
          text = "Orgnil tells me Fizzle Darkstorm is dead at Thunder Ridge, and that you did the killing. The cultists in Skull Rock have been shouting at each other ever since, which suits me, because frightened cultists make mistakes." },
        { id = "h_dd_blade", when = { killed = { name = "Burning Blade", min = 40 } },
          text = "I've been counting the Burning Blade in Skull Rock for a long time, {class}, and the count keeps going down whenever you pass this way. I like a falling count." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. Good. The Burning Blade at Skull Rock serve demons, and I'd like to see what your Light does to them." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. You won't change Skull Rock with prayers, but you can keep my scouts alive while they count the cultists, which is more use than most." },
        { id = "h_default", key = true,
          text = "I'm Margoz, and I watch Skull Rock for the Horde. The Burning Blade have dug themselves into that cave like ticks, and someone has to count them." },
        { id = "h_op_demons", when = { opinion = { topic = "demons", stance = "useful" } },
          text = "You're the one going about saying demons are only tools. Every cultist in Skull Rock said the same thing once, so I'll keep one eye on you and one on the rock." },
        { id = "h_skull", when = { questActive = TODO_QUEST("Skull Rock") },
          text = "Down into Skull Rock with you, then, and bring me back what the cultists carry. Proof is what Orgrimmar wants, and proof is what I'll send them." },
        { id = "h_neeru", when = { questActive = TODO_QUEST("Margoz") },
          text = "So Orgrimmar sent you to old Margoz. Good, because I've been waiting for someone with more sword than sense." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, good. The Burning Blade down in Skull Rock spit on everything your kind keeps, so I expect you'll enjoy this work." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. You'll smell the fel on the wind from Skull Rock before you're halfway down the path, and I'm told your kind feel it in the ground as well." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. You could get closer to Skull Rock than I ever could, and count the cultists without being counted yourself." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A spellcaster, out here? I thought Un'Thuwa kept all of his students in Sen'jin, reading." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Good, you're built to stand in a cave mouth while the imps pour out, and that's the job I need doing." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll have seen the tracks around Skull Rock, then, the scorched ones that no honest beast leaves." },
      },
      choices = {
        { text = "Can a priest cleanse what the Burning Blade did to Skull Rock?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "The cultists have done something to the earth around Skull Rock.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What has the Blade's magic done to the land near Skull Rock?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Who are the Burning Blade?", next = "blade" },
        { text = "This hut is an odd place to watch from.", next = "watch" },
        { text = "Who sends you your orders?", next = "orders" },
        { text = "I study the fel too, but I'm no cultist.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "Shall I scout the Burning Blade for you?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Could arcane magic help you watch Skull Rock?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "There must be a good many cultists in Skull Rock.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What leaves the scorched tracks near Skull Rock, Margoz?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Does the Light work on demon-worshippers, Margoz?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll get to it.", next = "END" },
      },
      again = {
        { id = "h_again", text = "More questions? Fine, but keep one eye on the rock while you ask them." },
        { id = "h_again2", text = "Go on. I'm not going anywhere, and neither are they." },
      },
    },
    blade = {
      lines = { { id = "b_default", text = "Orcs who never let go of the demons, even after the demons ruined us. They meet in caves and whisper to things the Warchief swore we'd never bow to again." } },
      choices = { { text = "They can't be many.", next = "blade_count" } },
    },
    blade_count = {
      lines = { { id = "bc_default", text = "More every season, and that's what worries me. Some of them walk out of Orgrimmar in daylight, which means someone inside the city is feeding them." } },
      choices = { { text = "Someone in Orgrimmar, then.", next = "blade_who" } },
    },
    blade_who = {
      lines = { { id = "bw_default", text = "If I knew a name, I'd have sent it to Thrall already. I only know the cultists go north with full packs and come back with empty ones, and that the Cleft of Shadow in the city is dark enough to hide anything." } },
      choices = {
        { text = "Traitors deserve to be dragged into the light.", next = "BACK", reply = "They do, and I'll drag them out myself if I find them. Thrall will want to see their faces.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Every orc chooses his own masters. That's freedom.", next = "BACK", reply = "Freedom, is it? We had our freedom once, and we chose demons. I'd rather have masters who don't want my soul.", fx = { affinity = -2, align = { order = -1 } } },
        { text = "Let's talk of something else.", next = "BACK" },
      },
    },
    watch = {
      lines = { { id = "w_default", text = "A hut makes a poor fortress, but it makes a fine blind. They think I'm an old hermit, and old hermits see everything." } },
      choices = { { text = "Clever.", next = "BACK" } },
    },
    orders = {
      lines = { { id = "o_default", text = "They come from Orgrimmar, by way of whoever they send. Gar'Thok at Razor Hill knows I'm here, and Orgnil Soulscar hunts the same cultists from his end." } },
      choices = {
        { text = "I'll tell them you're still watching.", next = "BACK", fx = { affinity = 1 } },
        { text = "Does Orgrimmar take the Blade seriously enough?", next = "purge_op" },
      },
    },
    purge_op = {
      lines = { { id = "po_default", text = "Thrall swore we'd never bow to demons again, and I believe he means it. But he's a patient one, and patience gives cultists time to dig, so what do you make of the Warchief's way with them?" } },
      choices = {
        { text = "He's right to wait. Patience catches the ones inside.", next = "po_trust", fx = { align = { order = 1 }, opinion = { warchief = "trust" } } },
        { text = "Too patient. Someone should tear the Cleft of Shadow open.", next = "po_purge", fx = { affinity = 2, align = { order = -1 }, opinion = { warchief = "soft" } } },
        { text = "Demons broke us once. Anyone who touches them should hang.", next = "po_hang", fx = { affinity = 1, opinion = { demons = "hate" } } },
        { text = "Not every warlock is a cultist, Margoz.", next = "po_lock", when = { class = "WARLOCK" }, fx = { affinity = -1, opinion = { demons = "control" } } },
        { text = "I'll leave that to the Warchief.", next = "BACK" },
      },
    },
    po_trust = {
      lines = { { id = "pot_default", text = "Maybe. I'm an old hermit, and old hermits have no patience left, so I'll keep counting and let wiser heads do the waiting." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    po_purge = {
      lines = { { id = "pop_default", text = "Say that too loudly in Orgrimmar and you'll have the Blade's friends asking who you are. Say it quietly, though, and keep saying it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    po_hang = {
      lines = { { id = "poh_default", text = "That's the sort of thing I like to hear on a long night. Zureetha down in the Valley might argue it with you, though, and she's earned the right." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    po_lock = {
      lines = { { id = "pol_default", text = "No, only most of them, eventually. Show me the one who isn't, and I'll buy him a drink at Grosk's." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    warlock = {
      lines = { { id = "wl_default", text = "So they all say, right up until the day they don't. Prove it in that cave, and maybe I'll stop watching your hands." } },
      choices = {
        { text = "I'll prove it on their skulls.", next = "BACK", reply = "Then prove it, and I'll be counting the skulls. I hope I'm wrong about you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I owe you no proof, old man.", next = "BACK", reply = "Then I'll keep watching, and you'll keep being watched. That's how it works out here.", fx = { affinity = -1, align = { honor = -1 } } },
      },
    },
  },
  topics = {
    burning_blade = { { id = "tp_blade", text = "The Burning Blade are cultists, fools and worse. Kill them where you find them, and look hard at who mourns them." } },
    burning_legion = { { id = "tp_burning_legion", text = "The Burning Blade still pray to the things that cursed us, and they think the demons will make them strong again. They'll make them food." } },
    thrall = { { id = "tp_thrall", text = "The Warchief knows about Skull Rock, and he's let Orgnil and the rest handle it. I'm content, so long as somebody does the killing besides me." } },
    centaur = { { id = "tp_centaur", text = "The Kolkar and the Burning Blade both want something in Durotar, and I hope they find each other first. That would save us all some trouble." } },
    _none = { { id = "tp_none", text = "I watch a rock for a living, grunt, so ask someone who gets out more." } },
  },
}

P:NPC {
  key = "swart", id = TODO_NPC("Swart"), name = "Swart",
  bible = "bibles/durotar.md", role = "trainer", tier = "service",
  communities = { "razor_hill" }, temper = { "calm" }, values = { "wise" },
  notices = { "class" },
  impression = {
    first = "Swart trains the shaman of Razor Hill, a calm Darkspear troll who speaks of the elements the way other trolls speak of the loa.",
    third = "{name} met Swart, the shaman trainer at Razor Hill.",
  },
  greetings = {
    { id = "g_hi", text = "Welcome, mon. The wind be dry today, and it blew you in with de Barrens' red dust all over your boots." },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "The elements trust no one at first, mon; trust be earned. When the orcs lost them, it was demons who came, and when they were caged, it was the Light that kept the doors shut. I'd like to believe the Light can mean something else in your hands." } },
      choices = {
        { text = "It can, and I'll show the spirits that.", next = "BACK", reply = "Then show them, mon, and they'll listen. The spirits be patient with those who try.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The spirits can believe what they like.", next = "BACK", reply = "They will, mon, and they'll keep their distance from you too. Trust be a two-way road.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Not resent, no, though they keep their distance from it the way water keeps its distance from fire. A priest who uses the shadow to heal is welcome among us, but one who uses it to hurt will find the earth less friendly under his feet." } },
      choices = {
        { text = "Then I'll heal with it, and the earth may judge me.", next = "BACK", reply = "Good, mon, and the earth will be kinder for it. Heal with the shadow, and the spirits will see.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The shadow is mine. The earth can keep its distance.", next = "BACK", reply = "Then the earth will keep its distance, mon, and you'll feel it under your feet. Careful how you walk.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They say the land be tired of blood, and the Kul Tirans at Tiragarde Keep spill more of it every season. But the earth also say it gave itself to the Horde when Thrall asked, so a warrior who defends this land does the spirits' work, if he fights only as long as he must." } },
      choices = {
        { text = "I'll fight only as long as I must.", next = "BACK", reply = "That be the wisdom of the spirits, mon. Fight when you must, and rest when you can.", fx = { align = { light = 1 } } },
        { text = "I'll fight until every enemy is dead.", next = "BACK", reply = "Then the earth will grow tired of you too, mon. Fight for the land, not just for the killing.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They do, quietly, and they tell me which hunters thank them and which only take. The scorpids and raptors of this land are hard and hungry because the land made them so, and a hunter who kills only what the camp needs keeps the balance the elements ask of us." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "They do, quietly, and they tell me which hunters thank them and which only take. Your {pet} walks easily beside you. The spirits like that, and so do I." },
      },
      choices = {
        { text = "I'll give thanks for every beast I take, Swart.", next = "BACK", reply = "That be the way, mon, and the spirits will remember you. Thank them, and they thank you back.", fx = { align = { light = 1 } } },
        { text = "Beasts don't care for thanks. Only the kill matters.", next = "BACK", reply = "The beasts don't, but the land does, mon. A hunter who forgets that runs out of beasts.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They resent being forced, and the arcane forces where a shaman asks. Your power isn't evil, but it takes without thanks, and I'd ask you to learn a little gratitude for the land you're standing on." },
      },
      choices = {
        { text = "I'll give thanks, then. The land deserves it.", next = "BACK", reply = "Good, mon, that be all the spirits ask. The land will treat you better for it.", fx = { align = { order = 1 } } },
        { text = "Asking is slow. My way gets the job done.", next = "BACK", reply = "It gets the job done, sure, but the land remembers who thanks it. Careful, mon.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "The orc shamans became warlocks once, on Draenor, when Ner'zhul and Gul'dan led them away from the spirits, and the whole Horde paid for it. I trust you as far as I can see you, mon, and I be watching you close." },
      },
      choices = {
        { text = "Watch, then. I'll prove I'm not Gul'dan.", next = "BACK", reply = "Then prove it, mon, and the spirits will watch with me. I hope you be what you say.", fx = { align = { light = 1 } } },
        { text = "The spirits failed us first. I chose stronger allies.", next = "BACK", reply = "The spirits never failed us, mon; we walked away from them. Choose your allies careful, because some of them don't let you go.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "That this land was hard long before the orcs and the Darkspear came, and that it respects those who don't try to soften it. Your people would plant a grove here, I think, and the land would let it die just to make its point." } },
      choices = {
        { text = "Respect the land as it is.", next = "BACK", reply = "That be the way, mon, and the land will respect you for it. Hard and honest, like us.", fx = { align = { order = 1 } } },
        { text = "Plant anyway. Even hard land can change.", next = "BACK", reply = "Try it, mon, but don't be surprised when the land says no. It be stubborn, like the orcs.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "They watch everyone, and they've no quarrel with a quiet step, because the wind itself moves without being seen. What they mind is a blade that strikes without cause, so keep yours for the Horde's enemies and the elements will leave you be." },
      },
      choices = {
        { text = "My blade strikes only when it must.", next = "BACK", reply = "Good, mon, and the elements will leave you be. A quiet blade be welcome anywhere.", fx = { align = { honor = 1 } } },
        { text = "A blade strikes where it's paid to strike.", next = "BACK", reply = "Then the elements will watch you, mon, and they won't be pleased. Be careful who pays you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken who call on the Light. The elements around you be very still, mon, as though they listen for what you will do. So do I." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. The elements don't answer you, I think, but something does, and I'll not pretend I can't feel it." },
        { id = "h_default", key = true, text = "I be Swart of the Darkspear, and I teach those the elements will answer. If you got the gift, I help you hear it; if not, I can still tell you what the spirits say of this land, mon." },
        { id = "h_shaman", when = { class = "SHAMAN" }, text = "A shaman, good. Sit, mon, and let us see what the earth has taught you since we last spoke." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid of the tauren! The spirits of Durotar be dry and harsh, but they speak plainly, and I suspect you hear them as well as any of my students." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "The elements don't answer you, mage, though they notice when you pull at them. The fire spirits around Razor Hill grumble whenever you pass." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "The spirits go quiet when you near, warlock, the way birds go quiet when a hawk be overhead. I don't need the loa to tell me what you carry." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. The elements notice you, though you don't notice them, because the earth feels every step you take toward a fight." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. The spirits of the beasts walk with you, and I can hear them complaining about the heat, as everyone does in Durotar." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue, come to a shaman's fire. The spirits don't mind you, but they always notice you, however quietly you walk." },
      },
      choices = {
        { text = "The elements must resent the shadow a priest draws on.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What do the spirits of Durotar say, Swart?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What do the spirits say of Durotar?", next = "land" },
        { text = "How did the orcs regain the old ways?", next = "ways" },
        { text = "The spirits seem to resent a mage's magic.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What do the spirits say of Durotar's wars, Swart?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "I'd guess the spirits of the beasts speak to you.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "A shaman can never trust a warlock, I'd guess.", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do the spirits watch rogues, Swart?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do the elements trust a Forsaken paladin, Swart?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell, Swart.", next = "END" },
      },
      again = { { id = "h_again", text = "Something more? The elements be patient, mon, and so be I." } },
    },
    land = {
      lines = { { id = "l_default", text = "That it be hard and honest, like the people who chose it. On the Echo Isles the rain came every day; here the fire sit close to the surface and the water be scarce, so we learn to give thanks for every rain." } },
      choices = {
        { text = "A hard land makes a strong people.", next = "BACK", reply = "It does, mon, and we be strong because of it. Give thanks for every rain.", fx = { align = { honor = 1 } } },
        { text = "Strong or not, we deserved better land.", next = "BACK", reply = "Maybe, but we got what we got, mon, and we make it home. The isles be gone for now.", fx = { align = { honor = -1 } } },
      },
    },
    ways = {
      lines = { { id = "w_default", text = "The Warchief learned them from Drek'Thar, who kept them alive through the dark years. My own people kept their spirits too, with the loa, and now every shaman Thrall trains carries a little of both, mon." } },
      choices = { { text = "Tell me more of Drek'Thar.", next = "ways_drek" } },
    },
    ways_drek = {
      lines = { { id = "wd_default", text = "He is old and blind, and he still leads the Frostwolves in Alterac far to the north. I never met him, but every shaman owes him something." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "The spirits told me nothing of that, mon, and I won't guess for them." } },
    the_elements = { { id = "tp_the_elements", text = "The elements are not servants, and they are not gods. They are old and proud, and they answer best to those who ask politely and listen carefully." } },
    thrall = { { id = "tp_thrall", text = "The Warchief is a shaman before he is a warlord, and that is the best thing about him. He knows the land must agree to be lived on." } },
    earth_mother = { { id = "tp_earth_mother", text = "The tauren call the land their mother, and I find that easy to understand. The spirits of earth in Durotar are hard and dry, but they are not unkind." } },
    burning_legion = { { id = "tp_burning_legion", text = "Our warlocks called on the demons and the spirits fell silent for a generation. Thrall brought them back, and I will not see us lose them again." } },
  },
}

P:NPC {
  key = "tarshaw", id = TODO_NPC("Tarshaw Jaggedscar"), name = "Tarshaw Jaggedscar",
  bible = "bibles/durotar.md", role = "trainer", tier = "service",
  communities = { "razor_hill" }, temper = { "gruff" }, values = { "brave" },
  notices = { "class" },
  impression = {
    first = "Tarshaw Jaggedscar trains Razor Hill's warriors, a scarred veteran who judges a recruit by the way they stand before they ever swing.",
    third = "{name} met Tarshaw Jaggedscar, the warrior trainer at Razor Hill.",
  },
  greetings = {
    { id = "g_hi", text = "Stand straight when you come to my yard, recruit. An orc earns respect on his feet. Now, what is it?" },
  },
  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I'll teach anyone to stay alive, and you've had more practice dying than most. The marks on my hide came from human knights with hammers like yours, so if you want my respect, earn it out there, not in here." } },
      choices = {
        { text = "Then I'll earn it on the field, not with words.", next = "BACK", reply = "That's the only way I'll give it. Show me on the field, and we'll talk.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'm dead already. Respect is a luxury.", next = "BACK", reply = "Luxury or not, it's what keeps you in the line. Earn it, dead man, or get out of my yard.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Not mid-lesson, no, because a recruit who knows he'll be healed stops being careful. Heal them after, when they've felt it and remembered it, and they'll live longer for both of us." } },
      choices = {
        { text = "Hit me, then. I'll heal after.", next = "BACK", reply = "Ha! Now you're talking like a soldier, priest. I'll hit you once, and you'll remember it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I won't make anyone suffer to teach them, Tarshaw.", next = "BACK", reply = "Then they'll learn slower, and some of them will die learning. Heal them after, at least, and leave the lesson in.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Keep your shield up when you're tired, because that's when everybody drops it. The quilboar at Razormane Grounds fight dirty and the Kul Tirans fight in lines, so learn both, and never charge a musket line across open ground unless you want a scar like mine." } },
      choices = {
        { text = "Scars are lessons, not trophies. I'll learn discipline.", next = "BACK", reply = "Good, now you're thinking like a warrior who'll live. Discipline keeps you breathing.", fx = { align = { order = 1 } } },
        { text = "Scars are trophies, and I want plenty of them.", next = "BACK", reply = "You'll get plenty, don't worry, and some of them will be the last. Keep your shield up.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Then the hunter finds out how good he is with an axe, usually in a hurry. I lost a friend that way in the Barrens, a good tracker with a fine wolf, and he'd never once practised holding off a raptor with steel, so practise here, where the only thing biting you is me." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Then the hunter finds out how good he is with an axe, usually in a hurry. Your {pet} looks sturdy, and I'd still rather you learned to fight without it, because nothing in Durotar stays sturdy forever." },
      },
      choices = {
        { text = "I'll practise with steel. I won't lean on my beast alone.", next = "BACK", reply = "Good, then you'll live longer than my friend did. Practise every day.", fx = { align = { order = 1 } } },
        { text = "My beast won't go down. I trust it completely.", next = "BACK", reply = "So did he, right up until it did. Practise anyway, hunter.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Well enough, if the rogue remembers who's taking the hits. I'll hold their eyes while you go round the back, but I'll expect you there when I need you, not halfway to Orgrimmar with the loot." },
      },
      choices = {
        { text = "I'll be there when you need me. You have my word.", next = "BACK", reply = "Good, because I'll hold you to it. Stand by me, and we both get home.", fx = { align = { honor = 1 } } },
        { text = "I'll be there if the fight's worth winning.", next = "BACK", reply = "Then I'll make every fight worth winning, rogue. Just be there.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Stay close enough to hear a warning, and don't throw fire at whatever's tangled with my grunts. I teach them to stay alive long enough to be useful, and you'd do well to learn the same lesson." },
      },
      choices = {
        { text = "Close and careful. I'll mind your grunts.", next = "BACK", reply = "Good, that's all I ask. My grunts will thank you for it.", fx = { align = { honor = 1 } } },
        { text = "Your grunts should mind my fire, not the reverse.", next = "BACK", reply = "Then my grunts will be watching your fire instead of the enemy, and that gets everyone killed. Mind them.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "If you can take a hit and give one back, yes, and a shaman with a shield can do both. The ones who hang back calling lightning are useful too, but they're the ones I end up dragging out of the scrub when the quilboar get behind them." } },
      choices = {
        { text = "My place is in the line beside the grunts.", next = "BACK", reply = "Then you're welcome in my line, shaman. Shield up, and lightning ready.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll fight where the elements need me, not where I'm told.", next = "BACK", reply = "The elements need you in one piece, and that means in the line. I'll teach you why.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "In bear shape you'd hold it better than half my recruits, because a bear doesn't flinch and doesn't drop its shield. But you'll need to learn when to stay put, because a line with a hole in it is worse than no line at all." } },
      choices = {
        { text = "I'll hold my place in the line, whatever comes at it.", next = "BACK", reply = "Then you'll be the best recruit I've had this season. Hold it, and they'll break against you.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll go wherever the fight needs me, line or no line.", next = "BACK", reply = "A line with a bear running loose in it is worse than no line. Learn to stay put first.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "How to stand, because a warlock who falls the first time a boar reaches them never learned to brace their feet. Watch my recruits for a morning, and you'll know where a blow is going to land before it does." },
      },
      choices = {
        { text = "I'll watch and learn. No shame in learning from a warrior.", next = "BACK", reply = "Good, and no, there isn't. Watch closely, warlock, and you'll learn something.", fx = { align = { honor = 1 } } },
        { text = "My demon takes the blows, so I needn't bother.", next = "BACK", reply = "Until your demon gets sent home, and then you'll wish you'd bothered. Watch my recruits anyway.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin. You stand like a knight of Lordaeron, recruit, and I learned in the camps what those knights stood like. Show me how you fight." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Good, because my recruits learn faster when they know someone will pick them back up." },
        { id = "h_default", key = true, text = "I'm Tarshaw Jaggedscar, and I teach the warriors of Razor Hill how to stay alive long enough to be useful. Most of these scars came from the ones who taught me, and one from a boar." },
        { id = "h_warrior", when = { class = "WARRIOR" }, text = "Back for more lessons, warrior? Good, because the scorpids out there won't wait for you to get better." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman wearing mail, good. Thrall fights in plate with a hammer in his hand, and I've never once seen him wait for the spirits to swing it for him." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid in my yard. I've seen your kind turn into a bear in the middle of a fight, and the quilboar on the other end never saw it coming." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue in my training yard, standing where the shadow's longest. You'll find no tricks to learn here, only scars." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "Mages always stand behind my warriors and act surprised when the quilboar get round them. Will you be any different?" },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "Back again? Good. Show me where you got hit since I last saw you, because every bruise is a lesson you paid for." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Your beast takes the hits for you, which is clever, but I've seen what happens when the beast goes down first." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock in my yard. You think you won't need my lessons, but you'll need to know how to stand when your demon goes down." },
      },
      choices = {
        { text = "Do you want a priest to heal your recruits mid-lesson?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "A shaman can stand in the front line, Tarshaw.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Could a druid hold a line beside your warriors, Tarshaw?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Those scars have a story behind them.", next = "scars" },
        { text = "What makes a good warrior?", next = "good" },
        { text = "Warriors and rogues can't fight well together.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "How should a mage fight beside your warriors?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "How do I stay alive longer, Tarshaw?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What happens when the beast goes down first, Tarshaw?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What can a warrior teach a warlock, Tarshaw?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Will you train a paladin, Tarshaw?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll be going.", next = "END" },
      },
      again = { { id = "h_again", text = "You're still here, so ask your question and let me get back to watching the road." } },
    },
    scars = {
      lines = { { id = "s_default", text = "The Second War, mostly, and a few from the camps' guards when I was too stubborn to sit down. Each scar taught me something, and I learned more from them than from any trainer." } },
      choices = { { text = "Which one taught you most?", next = "scars_best" } },
    },
    scars_best = {
      lines = { { id = "sb_default", text = "The one I got running from a fight I could have won. I've never run since, and I've never let a recruit of mine run either." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    good = {
      lines = { { id = "g_default", text = "Feet first, then shield, then blade, and the head over all of them. A warrior who only knows how to swing dies young and loud." } },
      choices = {
        { text = "Discipline wins more fights than rage.", next = "BACK", reply = "It does, and you'll learn it faster than most. Rage is good, but discipline keeps you alive.", fx = { align = { order = 1 } } },
        { text = "Rage won the orcs plenty of fights.", next = "BACK", reply = "Plenty, and lost plenty too. Rage with discipline is the warrior's way.", fx = { align = { order = -1 } } },
      },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I teach fighting, recruit, not gossip, so ask Grosk at the inn if you want talk." } },
    second_war = { { id = "tp_second_war", text = "I fought in the Second War and I have the scars to prove it. We lost, and the reason we lost is that we didn't know what we were fighting for." } },
    thrall = { { id = "tp_thrall", text = "The Warchief fought in an arena before he ever fought in a war, and that's where he learned to stand. I watch every recruit for that same thing." } },
    centaur = { { id = "tp_centaur", text = "A centaur charges with its whole weight, so set your feet and take the blow on a shield. Then it's just a horse with an angry face." } },
    internment = { { id = "tp_internment", text = "The camps took our will, but not our strength. I trained in a cell with nothing but my fists, and I came out ready." } },
  },
}
