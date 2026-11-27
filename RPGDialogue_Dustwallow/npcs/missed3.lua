-- Dustwallow, the missed folk (3 of 3): Brackenwall Village's traders (Ghok'kah, Zanara, Krak the ogre
-- armorer, Ogg'marr the ogre butcher), Kagoro the tracker, and the deserter Paval Reethe out in the marsh.
-- Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.dustwallow")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Ghok'kah: tailoring supplies.
P:NPC {
  key = "ghokkah", id = TODO_NPC("Ghok'kah"), name = "Ghok'kah", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "brackenwall" }, temper = { "gruff", "practical" }, values = { "usefulness" },
  notices = { "craft", "class" },
  impression = {
    first = "Ghok'kah sells thread, dye and needles in Brackenwall Village, and he does it with the scowl of an orc who has heard every joke there is about a warrior with a sewing kit. He told me the ogres are his best customers, and his worst.",
    third = "{name} met Ghok'kah, the orc who sells tailoring supplies in Brackenwall Village.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Throm-ka, friend. I saved the good thread for you. Don't tell the others." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Throm-ka. Thread and dye. Buy or go." },
    { id = "g_default", text = "Throm-ka, {class}. I sell thread and dye, and if that makes you smile, go and smile somewhere else." },
    { id = "g_back", when = { metBefore = true }, text = "You are back. The swamp has rotted your stitching, as I said it would." },
  },
  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "You have needle marks on your fingers. Good, then I do not have to explain to you why thread matters to an army." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You wear plate, warrior, and it sits on padding that someone had to sew. Remember that the next time a tailor asks you for a little respect." },
  },
  start = "hello",
  nodes = {
    ybrack = {
      lines = {
        { id = "ybghokkah1", text = "A camp of mud and ogres, with a few orcs to keep order. It smells of wet fur and crocolisk, and the ogres sing at night. I have lived in worse places, and none of them sang." },
        { id = "ybghokkah2", when = { race = "Orc" }, text = "You will know how it is, to live among strangers in a strange land. We are Horde, and we make it home anyway." },
      },
      choices = {
        { text = "Brackenwall needs good supplies to keep order.", next = "BACK", reply = "It does. Ogres break everything.", fx = { align = { order = 1 } } },
        { text = "The ogres should look after themselves.", next = "BACK", reply = "They do. Badly. Buy or go.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ycamps = {
      lines = {
        { id = "yghokkah1", text = "Near Durnholde, for years. The humans fed us and watched us and waited for us to die of the sickness in our blood. I sewed with stolen thread and hid the work in my bedding." },
      },
      choices = {
        { text = "Do you hate the humans for it?", next = "yhate" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yhate = {
      lines = {
        { id = "yghokkah2", text = "I did. Theramore is close, and they keep Thrall's peace. Some here say we should trade with them, and some say spit at them." },
      },
      choices = {
        { text = "Trade with them. A Horde that keeps its word is strong.", next = "BACK", reply = "That is what Thrall would say. I will think on it, and sew either way.", fx = { align = { honor = 1 } } },
        { text = "Remember the camps. Trust is for fools.", next = "BACK", reply = "I remember them every night. You are not wrong, and that troubles me.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yneed = {
      lines = {
        { id = "yghokkah3", text = "Cloth, oil and an end to the dragon raids. The black dragons fly over the village and the ogres hide, and the hides on my racks rot faster than I can stitch them. Krog asks the Warchief for help, and we wait." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Ghok'kah. A Horde that cannot mend its own tents and banners is not an army, it is a mob in the rain, and so I keep this village in thread." },
      },
      again = {
        { id = "h_again", text = "What else do you want to know?" },
        { id = "h_again2", text = "Speak, I am only sorting needles." },
      },
      choices = {
        { text = "Who buys thread in an ogre village?", next = "who" },
        { text = "How did a warrior come to sell needles?", next = "how" },
        { text = "This swamp must be hard on cloth.", next = "swamp" },
        { text = "You were in the internment camps?", next = "ycamps" },
        { text = "What does Brackenwall need most?", next = "yneed" },
        { text = "Did the camps make you weak, as some say?", next = "BACK", when = { race = "Orc" }, reply = "Some say that. They were not there. Lethargy is a sickness, not a choice, and I cured mine with a needle." },
        { text = "What do you think of Brackenwall?", next = "ybrack" },
        { text = "Strength and honor, Ghok'kah.", next = "END" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "The ogres, more than anyone. A Stonemaul loincloth takes as much cloth as an orc's tent, and they tear one a week, and not one of them can thread a needle with those fingers." } },
      choices = {
        { text = "So who does their sewing?", next = "sewing" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sewing = {
      lines = { { id = "s_default", text = "I do, more often than I will admit in Orgrimmar. They pay in meat from Ogg'marr's block, and I have learned not to ask what the meat was." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    how = {
      lines = { { id = "h2_default", text = "I learned in the internment camps, where there was nothing to do but rot or make something. I chose to make something, and when Thrall freed us I found the Horde needed that as much as it needed axes." } },
      choices = { { text = "There's honor in that.", next = "BACK", reply = "There is. Few say it aloud, so I will remember that you did.", fx = { affinity = 1 } } },
    },
    swamp = {
      lines = { { id = "sw_default", text = "It eats everything that is not oiled or waxed, and some things that are. I sell twice the thread here that I would in Durotar, because everything a warrior owns comes apart twice as fast." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    camps = { { id = "yghokkah4", text = "I will not forget them, but I will not live in them either." } },
    stonemaul = { { id = "yghokkah5", text = "The ogres. Loud, strong and very hard on their loincloths." } },
    background = { { id = "tp_bg", text = "I was a grunt once, and a prisoner after that. Now I am what the Horde needs here, and that is enough." } },
    _none = { { id = "tp_none", text = "I do not know. Ask Krog; he is the one who sends reports." } },
  },
}

-- Ogg'marr: ogre butcher (meat and drink).
P:NPC {
  key = "oggmarr", id = TODO_NPC("Ogg'marr"), name = "Ogg'marr", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "brackenwall" }, temper = { "jolly", "evasive" }, values = { "meat" },
  notices = { "craft", "race" },
  impression = {
    first = "Ogg'marr is the butcher of Brackenwall Village, a cheerful ogre with a very large cleaver and a very loose idea of what counts as a goose. Everything on his block is fresh, and I thought it best not to ask fresh what.",
    third = "{name} met Ogg'marr, the ogre butcher of Brackenwall Village.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Ha! Friend! Ogg'marr saved the good meat for you, the kind Ogg'marr knows." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Ha. Hungry? Ogg'marr has meat. Pay first." },
    { id = "g_default", text = "Ha, a hungry one! Ogg'marr has meat, lots of meat, and some of it Ogg'marr even knows the name of." },
    { id = "g_back", when = { metBefore = true }, text = "You came back for more, so the last meat did not make you sick. Ogg'marr is happy and a little surprised." },
  },
  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You smell like a cook fire, little friend. You and Ogg'marr are the same, only Ogg'marr does the part with the cleaver." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "Troll! The trolls never ask Ogg'marr what the meat is, they only ask how much. Ogg'marr likes trolls best." },
  },
  start = "hello",
  nodes = {
    ybest = {
      lines = {
        { id = "yboggmarr1", text = "Crocolisk tail, slow cooked, with mud mushrooms. Ogg'marr makes it for Krog when Krog is sad, and Krog stops being sad for a little while. Meat fixes most things, Ogg'marr thinks." },
        { id = "yboggmarr2", when = { race = "Orc" }, text = "Orcs like it with blood still in. Ogg'marr makes it like that for orcs, with a sauce of the red mushrooms." },
      },
      choices = {
        { text = "Crocolisk tail is a fine meal.", next = "BACK", reply = "Yes! Krog likes it too. You have good taste.", fx = { align = { light = 1 } } },
        { text = "Ogre food is disgusting.", next = "BACK", reply = "Ogg'marr is sad now. Pay and go.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yold = {
      lines = {
        { id = "yoggmarr1", text = "Ogg'marr misses it, yes. It was dry, and the meat stood still for Ogg'marr. Then the black dragons came and burned it, and the old chief died, and now Mok'Morokk is boss and we live in this mud." },
      },
      choices = {
        { text = "Do you like Mok'Morokk?", next = "ymok" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymok = {
      lines = {
        { id = "yoggmarr2", text = "Ogg'marr is not supposed to say. Mok'Morokk eats the best meat and does not fight the dragons, and some ogres whisper about Tharg instead. What would you do, little friend?" },
      },
      choices = {
        { text = "Follow your boss. A village needs one chief.", next = "BACK", reply = "That is what Ogg'marr does. Ogg'marr is very good at following, and at chopping.", fx = { align = { order = 1 } } },
        { text = "Follow the one who fights the dragons.", next = "BACK", reply = "Shh! Not so loud. But Ogg'marr is thinking it too.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yorcs = {
      lines = {
        { id = "yoggmarr3", text = "The orcs are small and grumpy, but they bring tools and do not run from dragons. Krog shares his fire with ogres, which nobody ever did before. Ogg'marr cuts him the good parts, always." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Ogg'marr cuts the meat for all of Brackenwall, ogres and orcs and anybody with teeth. If it walks in the swamp or swims in it, Ogg'marr can make it fit on a plate." },
      },
      again = {
        { id = "h_again", text = "What else? Ask while Ogg'marr chops." },
        { id = "h_again2", text = "Ogg'marr is listening, mostly." },
      },
      choices = {
        { text = "What meat is that on the block?", next = "what" },
        { text = "Logok says you sold him a goose.", next = "goose" },
        { text = "Who eats the most in Brackenwall?", next = "most" },
        { text = "Do you miss the old Stonemaul village?", next = "yold" },
        { text = "What do ogres think of the orcs here?", next = "yorcs" },
        { text = "What's the meat trolls like best?", next = "BACK", when = { race = "Troll" }, reply = "Raptor, with the bones in! Trolls crunch them, and Ogg'marr likes the sound. It sounds like happy." },
        { text = "What's the best meat in the swamp?", next = "ybest" },
        { text = "Keep your cleaver sharp.", next = "END" },
      },
    },
    what = {
      lines = { { id = "w_default", text = "That one is crocolisk, and that one is raptor, and that one in the corner is a surprise. Ogg'marr found it already dead, so it is a surprise for Ogg'marr too." } },
      choices = {
        { text = "Is the surprise safe to eat?", next = "safe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe = {
      lines = { { id = "s_default", text = "Ogg'marr ate some this morning and Ogg'marr is still standing here. For a little one like you, Ogg'marr would say cook it longer, and maybe have the crocolisk." } },
      choices = { { text = "The crocolisk, then. Something else.", next = "BACK" } },
    },
    goose = {
      lines = { { id = "goose_default", text = "It was a goose! It had a beak, and it had feet, and it made a noise before Ogg'marr caught it. If it also had a few more legs than a goose, that is extra meat and Logok should say thank you." } },
      choices = { { text = "I'll tell him to be grateful. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    most = {
      lines = { { id = "m_default", text = "Overlord Mok'Morokk, because he is the boss and the boss eats first and longest. Old Tharg eats almost nothing since the dragons came, and Ogg'marr saves him the soft pieces anyway." } },
      choices = { { text = "That's kind of you. Something else.", next = "BACK" } },
    },
  },
  topics = {
    mok_morokk = { { id = "yoggmarr4", text = "The boss. Big belly, big voice, not big on dragons." } },
    dragons = { { id = "yoggmarr5", text = "They burned the old village. Ogg'marr does not like dragons, unless they are on the block." } },
    background = { { id = "tp_bg", text = "Ogg'marr was butcher in the old Stonemaul village too. The meat was better there, and nobody had to chase it through mud." } },
    _none = { { id = "tp_none", text = "Ogg'marr only knows meat. If you cannot eat it, ask somebody else." } },
  },
}

-- Kagoro: Krog's tracker; appears in Brackenwall once the hoofprints are reported.
P:NPC {
  key = "kagoro", id = TODO_NPC("Kagoro"), name = "Kagoro", gender = "male",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = { "brackenwall" }, temper = { "quiet", "intent" }, values = { "the_trail", "honor" },
  notices = { "class" },
  impression = {
    first = "Kagoro is the tracker Krog sends when he wants a trail followed to its end. He had his pack on his shoulder already when I met him, and he spoke like someone whose mind had gone on ahead down the road.",
    third = "{name} met Kagoro, the orc tracker of Brackenwall Village, as he set out to follow the hoofprints from the Shady Rest Inn.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Speak, friend. Krog's trail can wait a moment for you." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Speak quickly. Mud does not hold a print for long." },
    { id = "g_default", text = "Speak quickly, {class}. Krog has given me a trail, and mud does not hold a print for long." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I have not left yet, but I will not be here much longer." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You read the ground as you walk, as I do. Then you saw those prints for what they were, and I thank you for not trampling them." },
  },
  start = "hello",
  nodes = {
    yends = {
      lines = {
        { id = "ybkagoro1", text = "I sit, and I wait, and I let the swamp speak. There is always another sign, if you have patience. Most do not, and they come back with nothing and a story about how the ground lied." },
        { id = "ybkagoro2", when = { class = "HUNTER" }, text = "You know this already. The beast that hides is still a beast, and it must breathe and eat and leave a sign." },
      },
      choices = {
        { text = "Patience finds every trail.", next = "BACK", reply = "It does. The swamp always speaks.", fx = { align = { order = 1 } } },
        { text = "Rushing finds the trail faster.", next = "BACK", reply = "Rushing loses it. Speak quickly.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ythink = {
      lines = {
        { id = "ykagoro1", text = "I think someone wanted it to look like the Horde. Those who did it left more marks than raiders ever do. A raider wants to be gone, but this one wanted to be seen." },
      },
      choices = {
        { text = "Who would want that?", next = "ywho" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywho = {
      lines = {
        { id = "ykagoro2", text = "Those who want the peace broken. There are some in Theramore, and some in Brackenwall, and some under the mountains to the south. When I find the trail's end, I must decide whom to tell." },
      },
      choices = {
        { text = "Tell both Krog and the humans. Truth belongs to all.", next = "BACK", reply = "That is dangerous honesty. Thrall would approve, and Krog may not.", fx = { align = { honor = 1 } } },
        { text = "Tell Krog alone. Protect the Horde first.", next = "BACK", reply = "That is what a scout should do. I will think on it as I walk.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ybarrens = {
      lines = {
        { id = "ykagoro3", text = "Open land, where a print lasts a week and the wind is the only thief. I tracked centaur and quilboar there for the Warchief's scouts. This swamp is harder, but the ground still speaks." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Kagoro. You found hoofprints in the ash of the human inn, and Krog wants to know whose hooves made them, so I am going to ask the ground." },
      },
      again = {
        { id = "h_again", text = "What else? The light is going." },
        { id = "h_again2", text = "Ask, but ask it walking." },
      },
      choices = {
        { text = "Whose prints do you think they are?", next = "whose" },
        { text = "Can you follow a trail through a swamp?", next = "swamp" },
        { text = "Why does Brackenwall care about a human inn?", next = "care" },
        { text = "What do you think really happened at the inn?", next = "ythink" },
        { text = "You suspect my people?", next = "BACK", when = { race = "Tauren" }, reply = "I suspect no one yet. If the hooves were tauren, they were not Thrall's tauren, and I will say so to Krog." },
        { text = "Tell me about the Barrens.", next = "ybarrens" },
        { text = "What do you do when the trail ends?", next = "yends" },
        { text = "Good hunting, Kagoro.", next = "END" },
      },
    },
    whose = {
      lines = { { id = "w_default", text = "Krog guesses quilboar or centaur, and he may be right. I do not guess, because a tracker who decides before he looks will find the tracks he expects and miss the ones that are there." } },
      choices = {
        { text = "What did the prints tell you so far?", next = "prints" },
        { text = "Something else.", next = "BACK" },
      },
    },
    prints = {
      lines = { { id = "p_default", text = "That they were made by something heavy that was in no hurry to leave. That is all the ash will say, and the rest is waiting in the mud to the west." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    swamp = {
      lines = { { id = "s_default", text = "Water hides a print, but the reeds beside it do not lie. A bent stalk or a stone turned wet side up is enough, and I have followed less across the Barrens in a dust storm." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    care = {
      lines = { { id = "c_default", text = "Because the humans of Theramore will blame the Horde for those deaths, and we did not do it. There is no honor in burning a mother and her child, and I will find who did so that the shame falls where it belongs." } },
      choices = { { text = "Then I hope you find them.", next = "BACK", reply = "I will. The ground has never lied to me yet.", fx = { affinity = 1 } } },
    },
  },
  topics = {
    tracking = { { id = "ybkagoro3", text = "The ground never lies, but it whispers. You must learn to listen." } },
    shady_rest = { { id = "ykagoro4", text = "A human inn, burned with its family inside. Someone wants us blamed." } },
    krog = { { id = "ykagoro5", text = "Krog leads Brackenwall. He is wise enough to doubt, which is rare." } },
    background = { { id = "tp_bg", text = "I tracked for the Warchief's scouts in the Barrens. Krog asked for me by name when he came to this marsh." } },
    _none = { { id = "tp_none", text = "I know trails, and that is not one. Ask Krog." } },
  },
}

-- Paval Reethe: Theramore lieutenant turned deserter, hiding in the marsh.
P:NPC {
  key = "paval_reethe", id = TODO_NPC("Paval Reethe"), name = "Paval Reethe", gender = "male",
  bible = "bibles/missed.md", role = "soldier", tier = "service",
  communities = {}, temper = { "jumpy", "bitter" }, values = { "his_own_skin" },
  notices = { "class", "race" },
  impression = {
    first = "Paval Reethe was a lieutenant of the Theramore Guard, and now he is a thin, unshaven man hiding in Dustwallow Marsh with his hand never far from his sword. He has run from Theramore and been thrown out by the other deserters, and he talks like a man with nowhere left to run to.",
    third = "{name} met Paval Reethe, a deserter from the Theramore Guard hiding in Dustwallow Marsh.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "You. All right. You're one of the few I trust. Come closer." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "That's close enough! Who sent you? Speak quickly." },
    { id = "g_default", text = "That's close enough, {class}! Tell me who sent you, and tell me quickly, because I've had a bad month and I'm not in a trusting mood." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Nobody followed you this time either, I hope, or we'll both regret it." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde! Easy, now, easy. I've no love for Theramore either these days, so there's no call for either of us to do anything hasty." },
  },
  notice = {
    { id = "n_guard", cat = "class", when = { faction = "Alliance", class = { "WARRIOR", "PALADIN" } },
      text = "You've the look of one of Vimes' errand-runners. If he wants me, he can wade out here and ask me himself." },
    { id = "n_ogre", cat = "race", when = { faction = "Horde" },
      text = "If this is about the stores at Brackenwall, I took a sack of meal and a side of something I couldn't name. A starving man's hardly a raider." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Paval Reethe, and I used to put Lieutenant in front of it. Now I'm a man with a wet bedroll and enemies on every side of this marsh, and I'd like to know which of them you belong to." },
        { id = "h_badge", when = { any = { { questActive = TODO_QUEST("Lieutenant Paval Reethe") }, { questDone = TODO_QUEST("Lieutenant Paval Reethe") } } },
          text = "My badge, in the ashes of the Shady Rest? So that's where it went. I can see what you're thinking, and you can stop, because I'm a deserter and a thief and I am no burner of children." },
      },
      again = {
        { id = "h_again", text = "What else? Keep your voice down." },
        { id = "h_again2", text = "Go on, but I'm watching the reeds while you talk." },
      },
      choices = {
        { text = "Every man deserves a chance to clear his name.", next = "BACK", reply = "Thank you. That means more than you know.", fx = { align = { honor = 1 } } },
        { text = "Deserters deserve what they get.", next = "BACK", reply = "Then leave me be, and go tell Theramore where I am.", fx = { align = { honor = -1 } } },
        { text = "Why did you desert?", next = "why" },
        { text = "The men at Lost Point threw you out.", next = "lost_point" },
        { text = "How did your badge end up at the inn?", next = "badge", when = { any = { { questActive = TODO_QUEST("Lieutenant Paval Reethe") }, { questDone = TODO_QUEST("Lieutenant Paval Reethe") } } } },
        { text = "You can't hide out here forever.", next = "forever" },
        { text = "What do you think of Lady Proudmoore now?", next = "kt_jaina" },
        { text = "I never saw you, Reethe.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "I enlisted with the marines of Kul Tiras at sixteen, and I swore my oath to Admiral Proudmoore. Then his own daughter stood aside while the orcs cut him down, and I was expected to salute her the next morning as if nothing had happened." } },
      choices = {
        { text = "So you ran.", next = "ran" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ran = {
      lines = { { id = "r_default", text = "I stayed longer than you'd think, and hated every watch of it. In the end a good many of us went over the wall together, and I've had plenty of cold nights since to wonder whether it was honor or only sulking." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lost_point = {
      lines = { { id = "l_default", text = "Balos Jacken did, the sanctimonious cur. I went to the ogres' stores because we were hungry, and he was so afraid of the Stonemaul finding out that he put me out to starve by myself." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    badge = {
      lines = { { id = "b_default", text = "I drank at the Shady Rest more nights than I can count, and I left a good deal there besides coin. A badge on the floor of an inn proves a man had a thirst, and I'll swear to that and to nothing else." } },
      choices = {
        { text = "Then who burned it?", next = "who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who = {
      lines = { { id = "wh_default", text = "If I knew that, I'd have something to sell, and I wouldn't be sleeping in a bog. I liked Hyal, and his wife fed me when I couldn't pay, so whoever did it had better hope Vimes finds them before I do." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forever = {
      lines = { { id = "f_default", text = "No, I can't, and I know it better than you do. Theramore would hang me, Lost Point won't have me, and the ogres would do worse than either, so I'm open to suggestions, friend." } },
      choices = { { text = "I've none to give. Something else.", next = "BACK" } },
    },
    kt_jaina = {
      big = true,
      lines = { { id = "ktj_default", text = "I think she's the reason I'm sleeping in a bog. Her father crossed an ocean to avenge Lordaeron, and she let the Warchief's orcs butcher him at her gates, and then she shook hands with the beasts over his body. Every marine who stayed in her colors is a saint or a fool, and I never met a saint." } },
      choices = {
        { text = "She betrayed her father and her people.", next = "BACK", reply = "There, you see it too, and you never even wore the tabard. Say that in Theramore and see how long you keep your post.", fx = { align = { light = -1 }, opinion = { jaina = "traitor" } } },
        { text = "You deserted. Don't blame her for your choices.", next = "BACK", reply = "Easy for you to say with dry boots. Maybe you're right, but it changes nothing out here.", fx = { align = { light = 1 }, opinion = { jaina = "admire" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    jaina = { { id = "tp_ktjaina", text = "She sold her father to the orcs, and she calls it peace. Don't ask me again." } },
    background = { { id = "tp_bg", text = "Kul Tiras born, a marine at sixteen and a lieutenant under the Lady. You can see for yourself what I am now." } },
    _none = { { id = "tp_none", text = "I don't know, and out here I don't hear much. Ask someone who still has a roof." } },
  },
}
