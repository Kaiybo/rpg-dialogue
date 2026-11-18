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
    background = { { id = "tp_bg", text = "I was a grunt once, and a prisoner after that. Now I am what the Horde needs here, and that is enough." } },
    _none = { { id = "tp_none", text = "I do not know. Ask Krog; he is the one who sends reports." } },
  },
}

-- Zanara: bowyer.
P:NPC {
  key = "zanara", id = TODO_NPC("Zanara"), name = "Zanara", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "brackenwall" }, temper = { "sharp", "proud" }, values = { "the_hunt", "skill" },
  notices = { "class", "pet" },
  impression = {
    first = "Zanara makes bows in Brackenwall Village, and she tests each one herself on whatever crawls out of the bog. She looked at how I carried my weapon and had an opinion about it before I'd spoken.",
    third = "{name} met Zanara, the orc bowyer of Brackenwall Village.",
  },
  greetings = {
    { id = "g_default", text = "Lok'tar, {class}. If you want a bow, show me your draw arm first, because I do not sell a strong bow to a weak shoulder." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Tell me what you killed with my arrows, and I will tell you if it was worth the shafts." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Good, I am tired of selling bows to grunts who hold them like clubs." },
    { id = "n_pet", cat = "pet", when = { pet = { named = true } },
      text = "Your beast watches my hands, and that is a well-trained animal. {pet} would do well in this marsh, where everything hunts everything." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Zanara, and every bow on this rack was made by my hands and proven by my eye. In a marsh you cannot always reach your enemy with an axe, and the Horde is slowly learning that from me." },
      },
      again = {
        { id = "h_again", text = "What else, {class}?" },
        { id = "h_again2", text = "Ask. I can string and talk." },
      },
      choices = {
        { text = "What do you hunt out here?", next = "hunt" },
        { text = "Do the ogres use your bows?", next = "ogres" },
        { text = "I hunt. What would you warn me of?", next = "warn", when = { class = "HUNTER" } },
        { text = "Good hunting, Zanara.", next = "END" },
      },
    },
    hunt = {
      lines = { { id = "h2_default", text = "Raptors, for the challenge, and crocolisks, for the hide. The spiders I shoot on sight and do not count as hunting, because there is no honor in it and no end to them." } },
      choices = {
        { text = "What makes the raptors a challenge?", next = "raptors" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raptors = {
      lines = { { id = "r_default", text = "They hunt in packs, and they think. You shoot the one in front of you and two more are already behind you, and I have a scar on my leg from the day I learned that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ogres = {
      lines = { { id = "o_default", text = "Ha! An ogre draws a bow once and it is kindling. They throw rocks, and I will say this for them, a Stonemaul rock arrives harder than most arrows." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    warn = {
      lines = { { id = "w_default", text = "Wax your string every dawn, and never loose from standing water, because the crocolisks feel the ripple. A hunter who forgets either will not need a second warning." } },
      choices = { { text = "I'll remember both. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I hunted the Barrens before I came north to this bog. The game here is harder, so I stayed." } },
    _none = { { id = "tp_none", text = "That is outside my range. Ask Krog or Nazeer Bloodpike." } },
  },
}

-- Krak: ogre armorer.
P:NPC {
  key = "krak_armorer", id = TODO_NPC("Krak"), name = "Krak", gender = "male",
  bible = "bibles/missed.md", role = "blacksmith", tier = "service",
  communities = { "brackenwall" }, temper = { "slow", "proud" }, values = { "strong_things" },
  notices = { "kit", "race" },
  impression = {
    first = "Krak is the Stonemaul ogre who sells armor in Brackenwall Village, and he tests each piece by hitting it. What survives goes on the rack, and he considers that all the craftsmanship anybody needs.",
    third = "{name} met Krak, the ogre armorer of Brackenwall Village.",
  },
  greetings = {
    { id = "g_default", text = "You want armor? Krak has armor, and Krak hit all of it already, so you know it is good." },
    { id = "g_back", when = { metBefore = true }, text = "Krak remembers you. You are not dead, so Krak's armor works." },
  },
  notice = {
    { id = "n_broken", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armor is all dents and holes, like something chewed it. Krak thinks you need new armor before you need anything else." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You are almost big enough for ogre armor, big friend. Krak says almost, because your head has horns and Krak's helmets do not have holes." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Krak is the armorer for the Stonemaul and for the Horde now too. The orcs showed Krak how to make armor small, and Krak showed the orcs how to make armor thick, so everybody learned something." },
      },
      again = {
        { id = "h_again", text = "You want to ask Krak more?" },
        { id = "h_again2", text = "Krak is listening, and hammering, both." },
      },
      choices = {
        { text = "How do you test your armor?", next = "test" },
        { text = "Does armor stop dragon fire?", next = "dragon" },
        { text = "Making small armor must be hard for you.", next = "small" },
        { text = "Good hammering, Krak.", next = "END" },
      },
    },
    test = {
      lines = { { id = "t_default", text = "Krak puts it on a stump and hits it with the big club. If the armor breaks, it was bad armor, and if the stump breaks, it is good armor and Krak needs a new stump." } },
      choices = {
        { text = "And if the club breaks?", next = "club" },
        { text = "Something else.", next = "BACK" },
      },
    },
    club = {
      lines = { { id = "c_default", text = "That happened one time only. Krak kept that armor for Krak, and nobody is allowed to buy it." } },
      choices = { { text = "A wise keepsake. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    dragon = {
      lines = { { id = "d_default", text = "No, and Krak is sad to say it. Good Stonemaul warriors had Krak's armor on when the black dragons came to the old village, and the armor is still there, but the warriors are not." } },
      choices = { { text = "I'm sorry for them. Something else.", next = "BACK" } },
    },
    small = {
      lines = { { id = "s_default", text = "Very hard! Orc gloves have five little fingers, and Krak's thumb is bigger than the whole glove. Krak uses the tiny hammer for it, the one the orcs call a normal hammer." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Krak made armor in the old village in the south, before the dragons. Krak will make it there again when the dragons are dead." } },
    _none = { { id = "tp_none", text = "Krak does not know that. Ask Draz'Zilb, who has two heads full of knowing." } },
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
      lines = { { id = "g_default", text = "It was a goose! It had a beak, and it had feet, and it made a noise before Ogg'marr caught it. If it also had a few more legs than a goose, that is extra meat and Logok should say thank you." } },
      choices = { { text = "I'll tell him to be grateful. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    most = {
      lines = { { id = "m_default", text = "Overlord Mok'Morokk, because he is the boss and the boss eats first and longest. Old Tharg eats almost nothing since the dragons came, and Ogg'marr saves him the soft pieces anyway." } },
      choices = { { text = "That's kind of you. Something else.", next = "BACK" } },
    },
  },
  topics = {
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
    { id = "g_default", text = "Speak quickly, {class}. Krog has given me a trail, and mud does not hold a print for long." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I have not left yet, but I will not be here much longer." },
  },
  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You read the ground as you walk, as I do. Then you saw those prints for what they were, and I thank you for not trampling them." },
  },
  start = "hello",
  nodes = {
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
        { text = "Why did you desert?", next = "why" },
        { text = "The men at Lost Point threw you out.", next = "lost_point" },
        { text = "How did your badge end up at the inn?", next = "badge", when = { any = { { questActive = TODO_QUEST("Lieutenant Paval Reethe") }, { questDone = TODO_QUEST("Lieutenant Paval Reethe") } } } },
        { text = "You can't hide out here forever.", next = "forever" },
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
  },
  topics = {
    background = { { id = "tp_bg", text = "Kul Tiras born, a marine at sixteen and a lieutenant under the Lady. You can see for yourself what I am now." } },
    _none = { { id = "tp_none", text = "I don't know, and out here I don't hear much. Ask someone who still has a roof." } },
  },
}
