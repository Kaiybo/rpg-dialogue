-- Orgrimmar folk the roster scan found unwritten, part one: the armor and weapon sellers of the
-- Valley of Strength (Morgum, Ollanus, Urtharo) and the quieter hands of the Drag (Tamar, Whuut,
-- Zeal'aya, Sarlek and Tamaro, Tosamina). Voice: bibles/missed_b.md
local P = RPGDialogueAPI:Pack("rpgd.orgrimmar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Morgum: leather armor, Soran's Leather and Steel Armory, Valley of Strength.
P:NPC {
  key = "morgum", id = TODO_NPC("Morgum"), name = "Morgum", title = "Leather Armor Merchant", gender = "male",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "gruff" }, values = { "practical", "proud" },
  notices = { "class" },
  impression = {
    first = "Morgum sells leather armor in Soran's armory, and he looks a customer over the way a hunter looks over a hide. He has no patience for anyone who buys armor by how it shines.",
    third = "{name} met Morgum, who sells leather armor in Soran's Leather and Steel Armory.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Leather on this wall, friend, and for you, the softest hide I've got." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Leather's on the wall, {class}. Steel's next door. You're welcome to both, I suppose." },
    { id = "g_default", text = "Leather is on this wall, {class}, and the steel is Soran's business. Tell me what you fight and I'll tell you what to wear." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and still in one piece, so the last hide I pointed you at did its work." },
  },
  notice = {
    { id = "n_stalker", cat = "class", when = { class = { "ROGUE", "HUNTER" } },
      text = "You move quietly, and that tells me you already know why leather is worth more than plate to some of us." },
    { id = "n_plate", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior at my wall is usually lost, because the mail and the plate are across the room with Soran." },
  },
  start = "hello",
  nodes = {
    w2elf = {
      lines = { { id = "w2e_default", text = "The Warsong bring back Sentinel jerkins now and then, cut off the dead, and sell them to me for the hide. I hate to say it, but the stitching is finer than anything in this city, every seam doubled and waxed and not one of them gaping." } },
      choices = {
        { text = "Do you sell them on?", next = "w2elf2" },
        { text = "Stripping the dead seems a poor trade.", next = "w2elf2" },
        { text = "Something else, Morgum.", next = "BACK" },
      },
    },
    w2elf2 = {
      lines = {
        { id = "w2e2_hunter", when = { class = "HUNTER" }, text = "Never whole, hunter, because no grunt wants to walk about in an elf's coat. I cut them apart and study the seams, and the best of what I learn goes into jerkins like the ones a hunter of yours would wear." },
        { id = "w2e2_default", text = "Never whole, because no grunt wants to walk about in an elf's coat. I cut them apart and study how the seams are made, and I put what I learn into my own work, and I tell nobody where I learned it." },
      },
      choices = { { text = "Learning from the enemy is wise.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Morgum, and I sell leather that was cut for fighting and stitched by orcs who have worn it themselves. A jerkin that binds your shoulders will kill you as surely as an axe, so I fit before I sell." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? The hides will keep, but my patience is thinner." },
        { id = "h_again2", text = "Speak, then, and I will answer what I can." },
      },
      choices = {
        { text = "Where do your hides come from?", next = "hides" },
        { text = "Who else works this armory?", next = "armory" },
        { text = "Leather won't stop an axe.", next = "axe" },
        { text = "I move unseen. What suits me?", next = "quiet", when = { class = { "ROGUE", "DRUID" } } },
        { text = "Did you wear leather in the old wars?", next = "y_wars" },
        { text = "What troubles a leather seller?", next = "y_worry" },
        { text = "I skin my own hides. Will you buy?", next = "y_skin", when = { profession = "Skinning" } },
        { text = "Have you ever seen elven leather from Ashenvale?", next = "w2elf" },
        { text = "Strength to you, Morgum.", next = "END" },
      },
    },
    hides = {
      lines = { { id = "hd_default", text = "Most of it is kodo and thunder lizard from the Barrens, skinned by hunters who sell to the tanners in the Drag. Durotar boar makes a poor jerkin, though it will do for a peon's apron." } },
      choices = {
        { text = "Who tans it for you?", next = "tanners" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tanners = {
      lines = { { id = "tn_default", text = "Karolek's people at the Kodohide shop do the tanning and most of the stitching, and I will not hear a word against their work. If you skin your own kills, {class}, they are the ones to learn from." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
    armory = {
      lines = { { id = "ar_default", text = "Soran owns the place and sells the heavier goods, and Ollanus beside me sells the light armor to those who throw spells instead of fists. Thatog keeps the stock and the fitting orders upstairs, and he keeps them well." } },
      choices = { { text = "A full house. Something else.", next = "BACK" } },
    },
    axe = {
      lines = { { id = "ax_default", text = "No, it will not, and I have never told a customer it would. Leather lets you be somewhere else when the axe comes down, and for a hunter or a stalker that is the better bargain." } },
      choices = {
        { text = "Fairly said. I'd rather not be hit at all.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'd sooner take the blow. Something else.", next = "BACK" },
      },
    },
    quiet = {
      lines = { { id = "q_default", text = "Then you want it soft at the joints and dark all over, and you want every buckle wrapped so it makes no sound. Oil it often, because dry leather creaks, and a creak has ended more ambushes than any sentry." } },
      choices = { { text = "Good counsel. Something else.", next = "BACK" } },
    },
    y_wars = {
      lines = {
        { id = "y_wars_d", text = "I wore it in the Second War, when the Horde still marched for the Shadow Council and none of us knew it. I was a scout for the Blackrock, and the leather on my back was the only thing I owned that I had chosen for myself." },
        { id = "y_wars_orc", when = { race = "Orc" }, text = "You are young enough that the camps raised you, I think. I wore leather before the camps, as a Blackrock scout, and I wore it again the day Thrall broke us out." },
      },
      choices = {
        { text = "What did you do after the camps?", next = "y_after" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_after = {
      lines = { { id = "y_after_d", text = "I followed the Warchief across the sea and I cut hides in Durotar while the walls went up around me. I could have stayed a scout, but I found I liked dressing hunters better than being hunted." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_worry = {
      lines = { { id = "y_worry_d", text = "Young grunts who buy the cheapest jerkin on the wall because they mean to buy better after their first pay. Some of them never see their first pay, and I sold them the jerkin." } },
      choices = {
        { text = "Then refuse them the cheap ones.", next = "y_refuse" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_refuse = {
      lines = { { id = "y_refuse_d", text = "And send them out in nothing at all? Soran says a seller sells and a grunt chooses, and that the Horde does not need me to be its mother. Tell me which of us is right." } },
      choices = {
        { text = "A grunt chooses for himself. Respect that.", next = "BACK", reply = "That is Soran's way, and the Horde's. I will keep selling, then.", fx = { align = { order = 1 } } },
        { text = "Turn them away. A bad sale is a bad sale.", next = "BACK", reply = "Soran will curse me for it, but I think you are right.", fx = { align = { order = -1 } } },
      },
    },
    y_skin = {
      lines = { { id = "y_skin_d", text = "Not here, for I buy only from Karolek's tanners. Sell your raw hides in the Drag, and if they are good, they will come back to my wall as armor." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    blackrock = { { id = "y_tp_br", text = "I was Blackrock once, and so were half the orcs in this city. We do not speak of what the clan became under Rend." } },
    drag = { { id = "y_tp_drag", text = "The tanners in the Drag smell worse than the hides, but nobody in Orgrimmar does better work." } },
    background = { { id = "tp_bg", text = "I sell leather in Soran's armory, as I have since the city's walls went up. There is not much more to tell than that." } },
    _none = { { id = "tp_none", text = "That is no business of a leather seller. Ask a grunt, or ask Thatog upstairs, who hears more than I do." } },
  },
}

-- Ollanus: light armor, Soran's Leather and Steel Armory, Valley of Strength.
P:NPC {
  key = "ollanus", id = TODO_NPC("Ollanus"), name = "Ollanus", title = "Light Armor Merchant", gender = "male",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "patient" }, values = { "practical" },
  notices = { "class" },
  impression = {
    first = "Ollanus sells light armor from the quiet corner of Soran's armory, between the leather and the steel. He speaks more softly than most orcs, as a merchant learns to when his customers are shamans and sorcerers.",
    third = "{name} met Ollanus, who sells light armor in Soran's Leather and Steel Armory.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Throm-ka, friend. Let me find you something that fits like a second skin." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Throm-ka, {class}. Pick what fits, pay what's marked, and don't try to haggle." },
    { id = "g_default", text = "Throm-ka, {class}. If plate drags at you and leather chafes, then mine is the wall you want." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back to the light wall. Has the last robe held together, or did the Barrens thorns get it?" },
  },
  notice = {
    { id = "n_caster", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK", "SHAMAN" } },
      text = "You are one who fights with more than your arms. I keep cloth cut loose in the sleeve for hands that need to move." },
  },
  start = "hello",
  nodes = {
    w2dye = {
      lines = {
        { id = "w2d_shaman", when = { class = "SHAMAN" }, text = "Your colours, shaman, the browns and greens of the earth and the deep blue of rain. The warlocks want black and red, as you might guess, and the trolls want everything at once, as loud as I can make it." },
        { id = "w2d_default", text = "The shamans want the colours of the earth, brown and green and rain blue. The warlocks want black and red, as you might guess, and the trolls want every colour at once, as bright as I can make it." },
      },
      choices = {
        { text = "Do you dye the cloth yourself?", next = "w2dye2" },
        { text = "I'd never have guessed robes came in so many colours.", next = "w2dye2" },
        { text = "Something else, Ollanus.", next = "BACK" },
      },
    },
    w2dye2 = {
      lines = { { id = "w2d2_default", text = "In a back room, in three old pots I bought from Tamar at the Kodohide shop. My hands have been blue to the wrist for a week now, and Morgum asks every morning whether I have been strangling a murloc." } },
      choices = { { text = "Blue hands suit a robe seller.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Ollanus, and I sell the light goods in this armory: robes, wraps, padded vests and the like. Morgum and Soran laugh at it, but the far seers do not go to war in plate, and somebody must dress them." },
      },
      again = {
        { id = "h_again", text = "Is there more you would ask, {class}?" },
        { id = "h_again2", text = "Speak as softly as you like, {class}. I have spent years learning to hear a customer over Soran's hammering." },
      },
      choices = {
        { text = "Do orcs really buy robes?", next = "robes" },
        { text = "Morgum and Soran laugh at you?", next = "laugh" },
        { text = "Cloth seems a poor shield.", next = "shield" },
        { text = "What would you put on a spellcaster?", next = "caster", when = { class = { "MAGE", "PRIEST", "WARLOCK" } } },
        { text = "What were you, before the camps?", next = "y_before" },
        { text = "Does anything worry you, Ollanus?", next = "y_worry" },
        { text = "I wear cloth myself. Why do orcs mock it?", next = "y_mock", when = { class = { "MAGE", "PRIEST", "WARLOCK" } } },
        { text = "Which colours sell best on your wall?", next = "w2dye" },
        { text = "Be well, Ollanus.", next = "END" },
      },
    },
    robes = {
      lines = { { id = "r_default", text = "More every season, {class}. The shamans came back to us with Thrall, and now trolls and Forsaken walk these streets, and none of them want a breastplate between themselves and their magic." } },
      choices = {
        { text = "Who buys the most?", next = "buyers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = {
        { id = "by_troll", when = { race = "Troll" }, text = "Your own people, friend, and they haggle over every copper and laugh while they do it. I have come to enjoy it, though I would not tell them so." },
        { id = "by_default", text = "The Darkspear, by a long way, since their witch doctors and priests live just up the path in the Valley of Spirits. They haggle like goblins and laugh like children, and they always pay in the end." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    laugh = {
      lines = { { id = "l_default", text = "They are old soldiers, and to an old soldier anything lighter than mail is a nightshirt. I let them laugh, because I sell as much as either of them and my stock is easier to carry up the stairs." } },
      choices = { { text = "A fair revenge. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    shield = {
      lines = { { id = "s_default", text = "It is no shield at all, and it is not meant to be. It keeps the sun and the dust of Durotar off you, and it leaves your arms free, and for some that is all the armor their work allows." } },
      choices = { { text = "I see the sense in it. Something else.", next = "BACK" } },
    },
    caster = {
      lines = { { id = "c_default", text = "Something loose at the wrist and short enough that you will not trip when you must run, because you will have to run. Take a second set as well, since fire and frost are harder on cloth than any blade." } },
      choices = { { text = "I will keep that in mind. Something else.", next = "BACK" } },
    },
    y_before = {
      lines = {
        { id = "y_before_d", text = "A child, {class}. I was born in the camps and knew nothing else until Thrall broke them. I learned to sew mending the guards' uniforms, and I swore I would sew for orcs once I was free." },
        { id = "y_before_orc", when = { race = "Orc" }, text = "A child of the camps, as so many of us were. I learned to sew mending the guards' uniforms, and I swore I would sew only for orcs once we were free." },
      },
      choices = {
        { text = "Do you hate the humans?", next = "y_hate" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_hate = {
      lines = { { id = "y_hate_d", text = "One guard was cruel and one was kind, and the rest did not care at all. It is hard to hate a whole people when you have seen all three. Some orcs say I am too soft." } },
      choices = {
        { text = "You're not soft. You're fair.", next = "BACK", reply = "Thank you. Fairness is a quiet thing, and I prefer quiet.", fx = { align = { light = 1 } } },
        { text = "They kept you in chains. Hate them.", next = "BACK", reply = "Perhaps. But hate is heavy, and I already carry enough cloth.", fx = { align = { light = -1 } } },
      },
    },
    y_worry = {
      lines = { { id = "y_worry_d", text = "The warlocks in the Cleft buy my robes, and so do the shamans, and I do not ask which ones serve the Warchief and which serve the Burning Blade. One day I may have to." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_mock = {
      lines = { { id = "y_mock_d", text = "Because their fathers were warriors and their grandfathers were warriors, and a robe reminds them of the warlocks who led us into demon blood. Wear yours proudly. It is not the robe that chose the demons." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I have sold light armor here since Soran opened his doors. It is quiet work, and after the camps I do not mind quiet." } },
    internment = { { id = "y_tp_camps", text = "I learned to sew in the camps. It is the one thing I took from them that I kept." } },
    cleft_of_shadow = { { id = "y_tp_cos", text = "The Cleft of Shadow buys more of my robes than anyone. I try not to wonder why." } },
    _none = { { id = "tp_none", text = "I could not tell you, {class}. I know cloth and stitching, and little else worth your time." } },
  },
}

-- Urtharo: weapon merchant at the Shattered Axe, Valley of Strength.
P:NPC {
  key = "urtharo", id = TODO_NPC("Urtharo"), name = "Urtharo", title = "Weapon Merchant", gender = "male",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "loud" }, values = { "proud", "martial" },
  notices = { "class" },
  impression = {
    first = "Urtharo sells weapons at the Shattered Axe, close enough to the front gate that every new arrival in Orgrimmar passes his racks. He sizes up each one by the weapon they carry before he looks at the face above it.",
    third = "{name} met Urtharo, the weapon merchant at the Shattered Axe in the Valley of Strength.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Lok'tar, friend! The gates of Orgrimmar are always open to you, and so is my stall!" },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Lok'tar, {class}. You walked through the gates. Walk through my stall quickly." },
    { id = "g_default", text = "Lok'tar, {class}! You have walked through the gates of Orgrimmar, and now you should carry a blade that is worthy of them." },
    { id = "g_back", when = { metBefore = true }, text = "I know that face, and I know that weapon, and one of them has seen hard use since you were last here." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior, and one who keeps the edge clean. I will show you the good steel and not the peon knives." },
  },
  start = "hello",
  nodes = {
    w2maker = {
      lines = { { id = "w2m_default", text = "The axes come from Kelgruk and Borgosh in the Valley of Honor, the spears from Darkspear smiths in Sen'jin, and the daggers from whoever is hungry enough to sell me a box of them cheap. I put my own edge on every one before it goes on the rack." } },
      choices = {
        { text = "So you charge more for what they made?", next = "w2maker2" },
        { text = "Your own edge? Show me.", next = "w2maker2" },
        { text = "Something else, Urtharo.", next = "BACK" },
      },
    },
    w2maker2 = {
      lines = {
        { id = "w2m2_warrior", when = { class = "WARRIOR" }, text = "A little more, warrior, for standing at the gate where you need me, and for an edge that will shave the hair off your arm. Run your thumb along that axe there and tell me it was not worth the extra copper." },
        { id = "w2m2_default", text = "A little more, for standing at the gate where you need me and for an edge that will shave the hair off your arm. Kelgruk knows it, and he grumbles, and he still sells me his axes." },
      },
      choices = { { text = "Fair enough, for a good edge.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Urtharo of the Shattered Axe, and do not let the name worry you, because it was someone else's axe that shattered. I sell blades, axes and the odd spear to anyone the Warchief calls a friend." },
      },
      again = {
        { id = "h_again", text = "What more, {class}? Ask, and then buy something." },
        { id = "h_again2", text = "Speak up, the square is loud today." },
      },
      choices = {
        { text = "Whose axe was it that shattered?", next = "name" },
        { text = "You must see everyone who comes through the gate.", next = "gate" },
        { text = "What should a warrior carry?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I fight without steel.", next = "nosteel", when = { class = { "MAGE", "PRIEST", "WARLOCK" } } },
        { text = "What really happened to your knees?", next = "y_knees" },
        { text = "Do you ever refuse a buyer?", next = "y_refuse" },
        { text = "Tell me about the trainers.", next = "y_sayoc" },
        { text = "Who makes the weapons on your racks?", next = "w2maker" },
        { text = "Lok'tar, Urtharo.", next = "END" },
      },
    },
    name = {
      lines = { { id = "nm_default", text = "The tale I tell is that a human knight broke his axe on an orc shield in the Second War, and the orc kept the pieces. Whether that is true I cannot swear, but it sells weapons, and nobody has come to claim the axe." } },
      choices = {
        { text = "A good tale beats a true one.", next = "tale" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tale = {
      lines = { { id = "tl_default", text = "Ha! Do not say that where a shaman can hear you, because they will lecture you until sundown about the honor of the ancestors. Between us, though, a weapon with a story swings a little harder, and every grunt knows it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    gate = {
      lines = { { id = "gt_default", text = "Every one of them, and I can tell where they have come from by what hangs at their belt. The young ones from the Valley of Trials carry training blades that would not cut cheese, and they are the customers I like best." } },
      choices = {
        { text = "Because they need you most?", next = "young" },
        { text = "Something else.", next = "BACK" },
      },
    },
    young = {
      lines = { { id = "yg_default", text = "Because a young one who buys a first true blade from me will remember where it came from. Some of them come back years later with scars and stories, and that is worth more to me than the silver." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    warrior = {
      lines = { { id = "w_default", text = "Carry whatever you have trained with until your arm knows it without thinking, and then go and see Sayoc or Hanashi in the Valley of Honor about the rest. A warrior with one weapon is only half armed, and the Alliance will not fight you the same way twice." } },
      choices = { { text = "Wise words. Something else.", next = "BACK" } },
    },
    nosteel = {
      lines = { { id = "ns_default", text = "So do the warlocks in the Cleft, and I have noticed that every one of them still carries a knife. Spells run dry, {class}, and when they do, you will be glad of a hand's length of iron." } },
      choices = { { text = "You may be right. Something else.", next = "BACK" } },
    },
    y_knees = {
      lines = {
        { id = "y_knees_d", text = "A kodo sat on them, {class}, in the Barrens, during a centaur raid on the Crossroads. I tell young ones it was a warlord's hammer. The kodo was very apologetic, for a kodo." },
        { id = "y_knees_ta", when = { race = "Tauren" }, text = "One of your kodo sat on them, friend, during a centaur raid. I tell the young ones it was a warlord's hammer. Please do not correct me in front of them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_refuse = {
      lines = { { id = "y_refuse_d", text = "Once, an orc in a red robe who wanted ten daggers and paid in demon-stamped gold. I sold him nothing and told a grunt. The grunt said I should have sold them and followed him. Was I wrong?" } },
      choices = {
        { text = "You did right. Never arm the Blade.", next = "BACK", reply = "Good. My conscience agrees with you.", fx = { align = { honor = 1 } } },
        { text = "The grunt was right. Bait the trap.", next = "BACK", reply = "Hm. Cunning. Not my way, but cunning.", fx = { align = { honor = -1 } } },
      },
    },
    y_sayoc = {
      lines = {
        { id = "y_sayoc_d", text = "Sayoc and Hanashi train warriors in the Valley of Honor. They are harder than any blade I sell. Go to them after you buy, not before, or you will have nothing left to spend." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I carried an axe for the Horde before I sold them, and my knees ended that. Now I arm the ones who still can march." } },
    valley_of_trials = { { id = "y_tp_vot", text = "The young ones from the Valley of Trials come with peon knives. They leave with real steel, if they have coin." } },
    crossroads = { { id = "y_tp_xr", text = "The Crossroads is where I held the line. And where the kodo sat on me." } },
    _none = { { id = "tp_none", text = "You are asking a weapon seller, {class}. If it has no edge and no haft, I know nothing about it." } },
  },
}

-- Tamar: leatherworking supplies, Kodohide Leatherworkers, the Drag.
P:NPC {
  key = "tamar", id = TODO_NPC("Tamar"), name = "Tamar", title = "Leatherworking Supplies", gender = "male",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "steady" }, values = { "diligent" },
  notices = { "profession" },
  impression = {
    first = "Tamar keeps the supply shelves at the Kodohide Leatherworkers: thread, salt, dyes and needles, all counted and in their places. He works with the smell of the tanning vats around him and no longer seems to notice it.",
    third = "{name} met Tamar, who sells leatherworking supplies at the Kodohide shop in the Drag.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Thread, salt and dye, friend, and the best of it saved for those I trust." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Thread, salt and dye. Pay for what you take, and take nothing you haven't paid for." },
    { id = "g_default", text = "Thread, salt and dye, {class}. If you work hides, I have what the hide cannot give you." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more thread already? Then you are either working hard or stitching badly." },
  },
  notice = {
    { id = "n_lw", cat = "profession", when = { profession = "Leatherworking" },
      text = "Those are a stitcher's fingers, pricked and stained. Good, because I would rather sell to someone who will use it." },
  },
  start = "hello",
  nodes = {
    w2salt = {
      lines = {
        { id = "w2sa_lw", when = { profession = { "Leatherworking", "Skinning" } }, text = "You will know the start of it already: flesh side up, laid flat, salted thick as frost. What most forget is to fold it after the second day and salt it again, because the edges dry first and the middle rots in secret." },
        { id = "w2sa_default", text = "Flesh side up, laid flat, and salted as thick as frost on a Winterspring morning. Then you fold it after the second day and salt it again, because the edges dry first and the middle rots in secret." },
      },
      choices = {
        { text = "Where does all that salt come from?", next = "w2salt2" },
        { text = "It sounds like a great deal of salt.", next = "w2salt2" },
        { text = "Something else, Tamar.", next = "BACK" },
      },
    },
    w2salt2 = {
      lines = { { id = "w2sa2_default", text = "From the pans on the coast south of Razor Hill, where the Darkspear boil seawater down in the sun. I pay them in thread and needles, which they prefer to coin, and nobody has ever cheated me in that trade yet." } },
      choices = { { text = "A good trade for both sides.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Tamar. Karolek teaches the craft and Thuwd teaches the knife, and I sell the small things both of them forget they need until the work is half done." },
      },
      again = {
        { id = "h_again", text = "What else, {class}? Ask before the vats start bubbling again and I have to shout over them." },
        { id = "h_again2", text = "Ask it, {class}, while the vats are quiet." },
      },
      choices = {
        { text = "What do leatherworkers run out of most?", next = "runout" },
        { text = "It smells strong in here.", next = "smell" },
        { text = "What is Karolek like to work for?", next = "karolek" },
        { text = "I work leather myself. Any advice?", next = "advice", when = { profession = "Leatherworking" } },
        { text = "How did you end up keeping shelves?", next = "y_how" },
        { text = "Does anything trouble the shop?", next = "y_trouble" },
        { text = "What is Thuwd like?", next = "y_thuwd" },
        { text = "How do you salt a hide properly?", next = "w2salt" },
        { text = "Good trading, Tamar.", next = "END" },
      },
    },
    runout = {
      lines = { { id = "ro_default", text = "Salt, always salt, because a hide that is not salted on the day it is skinned will rot before it reaches the Drag. After that it is coarse thread, since the young ones pull it too hard and snap it." } },
      choices = {
        { text = "And the dyes?", next = "dyes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dyes = {
      lines = { { id = "dy_default", text = "Black and grey sell best, because the scouts and the stalkers of the Cleft want to vanish in the dark. Red sells to grunts who want the Alliance to see them coming, and I respect that just as much." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    smell = {
      lines = { { id = "sm_default", text = "That is the tanning, and you stop smelling it after the first winter. The Drag sits in shadow and the air does not move much, which is bad for noses and very good for curing hides slowly." } },
      choices = { { text = "A fair trade, I suppose. Something else.", next = "BACK" } },
    },
    karolek = {
      lines = { { id = "k_default", text = "He is hard to please and fair when he is pleased, which is all I ask of any orc. He will make an apprentice unpick a whole seam for one crooked stitch, and their work is better for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    advice = {
      lines = { { id = "ad_default", text = "Buy more thread than you think you need, and wax it before you use it. And cure your own hides when you can, {class}, because you learn more about leather from one ruined kodo skin than from ten bought ones." } },
      choices = { { text = "I'll do that. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    y_how = {
      lines = {
        { id = "y_how_d", text = "I lost two fingers to a centaur blade in the Barrens, {class}, and a stitcher needs all ten. Karolek gave me the shelves instead. I count better than I ever stitched." },
        { id = "y_how_orc", when = { race = "Orc" }, text = "A centaur blade took two fingers in the Barrens. You know what that means to a stitcher. Karolek gave me the shelves instead, and I count better than I ever stitched." },
      },
      choices = {
        { text = "Do you miss stitching?", next = "y_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_miss = {
      lines = { { id = "y_miss_d", text = "Every day I watch Karolek work. But I keep the shop alive, and without salt and thread he would be stitching nothing. That is a kind of craft too." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_trouble = {
      lines = { { id = "y_trouble_d", text = "Salt goes missing, a sack at a time. I think one of the apprentices sells it in the Drag. I have not told Karolek, because he would throw the boy out." } },
      choices = {
        { text = "Tell Karolek. Theft can't go unpunished.", next = "y_tell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_tell = {
      lines = { { id = "y_tell_d", text = "The boy's mother is sick, and the salt pays for her healer. If I speak, the boy is ruined. If I do not, the shop bleeds. Which would you choose?" } },
      choices = {
        { text = "Speak. The shop's trust matters.", next = "BACK", reply = "Hm. You may be right, though I do not like it.", fx = { align = { order = 1 } } },
        { text = "Stay quiet. Help the boy instead.", next = "BACK", reply = "That is what my heart says. I will find him other work.", fx = { align = { order = -1 } } },
      },
    },
    y_thuwd = {
      lines = { { id = "y_thuwd_d", text = "Thuwd teaches skinning, and he speaks less than I do. When he and Karolek argue, it is all silence and glaring. The apprentices hide in the vats." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I keep the shelves for the Kodohide shop. I count what comes in and what goes out, and the craft goes on around me." } },
    karolek = { { id = "y_tp_karolek", text = "Karolek is the best leatherworker in Orgrimmar. Ask him and he will tell you so, at length." } },
    the_drag = { { id = "y_tp_drag", text = "The Drag is all tanners and smoke. You stop noticing after a winter." } },
    _none = { { id = "tp_none", text = "I do not know about that. Ask Karolek, if he will stop working long enough to answer." } },
  },
}

-- Whuut: apprentice alchemist, Yelmak's Alchemy and Potions, the Drag.
P:NPC {
  key = "whuut", id = TODO_NPC("Whuut"), name = "Whuut", title = "Apprentice Alchemist", gender = "male",
  bible = "bibles/missed_b.md", role = "apprentice", tier = "quest",
  communities = { "orgrimmar" }, temper = { "eager", "hurried" }, values = { "diligent", "curious" },
  notices = { "profession" },
  impression = {
    first = "Whuut is Yelmak's apprentice, a young orc with stained fingers and a singed eyebrow who is always in the middle of three tasks at once. He talks quickly and keeps one eye on whatever is bubbling behind him.",
    third = "{name} met Whuut, the apprentice alchemist at Yelmak's shop in the Drag.",
  },
  greetings = {
    { id = "g_default", text = "Mind the bench, {class}, and do not breathe too deeply over the green flask. I am Whuut, and I will be with you as soon as this stops smoking." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Good, because I can talk and stir at the same time now, and last time I could not." },
  },
  notice = {
    { id = "n_alch", cat = "profession", when = { profession = "Alchemy" },
      text = "You have the stains on your thumb, the same as mine. Peacebloom, or is that swiftthistle?" },
  },
  start = "hello",
  nodes = {
    w2away = {
      lines = { { id = "w2a_default", text = "I try the recipes he will not let me try, of course! Last time I made an elixir of giant growth, or something close to it, and the rat that drank it is still living under the bench and is now the size of a small boar." } },
      choices = {
        { text = "Does Yelmak know about the rat?", next = "w2away2" },
        { text = "You should be more careful.", next = "w2away2" },
        { text = "Something else, Whuut.", next = "BACK" },
      },
    },
    w2away2 = {
      lines = {
        { id = "w2a2_alch", when = { profession = "Alchemy" }, text = "Not yet, and you will not tell him, because you know how it is with the first batch that goes wrong. I feed the rat every morning so it stays friendly, and Kor'geld thinks it is a very large dog." },
        { id = "w2a2_default", text = "Not yet, and please do not tell him. I feed the rat every morning so it stays friendly, and Kor'geld across the way thinks it is a very large dog." },
      },
      choices = { { text = "Your secret is safe with me.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_camp", when = { questActive = TODO_QUEST("Camping 101: Alchemy") }, text = "You have the list, so you know what I need, and I need it soon. Bring the herbs here and I will show you what a camp alchemist does with them." },
        { id = "h_rush", when = { questActive = TODO_QUEST("Whuut's the Rush") }, text = "There is no time to talk properly, {class}, because Master Yelmak wants this batch finished and I am still short. Go quickly, and I will thank you when my hands are free." },
        { id = "h_default", text = "I am Whuut, and I am apprenticed to Master Yelmak, which means I grind, I wash flasks and I carry the blame when something catches fire. I am learning, though, and faster than he says." },
      },
      again = {
        { id = "h_again", text = "What else? Ask quickly, the flame is rising." },
        { id = "h_again2", text = "Go on, I can listen while I stir." },
        { id = "h_again3", when = { questDone = TODO_QUEST("Whuut's the Rush") }, text = "Ask what you like, {name}. I have time for you since that batch." },
      },
      choices = {
        { text = "What does Yelmak have you doing?", next = "work" },
        { text = "Why are you always in a hurry?", next = "hurry" },
        { text = "Something has singed your eyebrow.", next = "eyebrow" },
        { text = "What use is alchemy on the march?", next = "camp" },
        { text = "I brew potions too. What are you learning?", next = "fellow", when = { profession = "Alchemy" } },
        { text = "What do you do when Yelmak is away?", next = "w2away" },
        { text = "I'll leave you to your flasks.", next = "END" },
      },
    },
    work = {
      lines = { { id = "wk_default", text = "Grinding earthroot until my arm aches, mostly, and washing every flask twice because he can smell a dirty one from across the room. He lets me brew the simple healing draughts now, and the grunts at the gate drink them without complaint." } },
      choices = {
        { text = "Is he a hard master?", next = "master" },
        { text = "Something else.", next = "BACK" },
      },
    },
    master = {
      lines = { { id = "ms_default", text = "He is hard about measures and gentle about everything else, and I have come to see why. An orc who pours carelessly in this trade does not get a scar to boast of, because there is nothing left to scar." } },
      choices = {
        { text = "Has it ever gone that badly?", next = "badly" },
        { text = "Something else.", next = "BACK" },
      },
    },
    badly = {
      lines = { { id = "bd_default", text = "Not in this shop, and Master Yelmak means to keep it so. He tells a story about a goblin in Ratchet who sneezed over a firepowder bench, and he tells it every time I reach for a flask without looking." } },
      choices = { { text = "A useful story. Something else.", next = "BACK" } },
    },
    hurry = {
      lines = { { id = "hr_default", text = "Because a potion does not wait for you, {class}. If the pot boils a breath too long the batch is spoiled, and then I must begin again, and Master Yelmak counts every herb I waste." } },
      choices = {
        { text = "Slow hands make fewer mistakes.", next = "BACK", reply = "That is what he says too, and then he asks why the order is late. I will find the middle of it someday." },
        { text = "Then I won't keep you long. Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    eyebrow = {
      lines = { { id = "eb_default", text = "It was the fire oil, and it was my own fault, because I leaned in to see whether it had turned. It had turned. Kor'geld, who sells our supplies, laughed so hard that he had to sit down." } },
      choices = { { text = "It will grow back. Something else.", next = "BACK" } },
    },
    camp = {
      lines = { { id = "cp_default", text = "More than most warriors think. A war band three days from any city has no healer's hall, so somebody at the fire must know which root closes a wound and which one only looks like it." } },
      choices = {
        { text = "And you mean to be that somebody?", next = "camp2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp2 = {
      lines = { { id = "cp2_default", text = "I do. I was too young to fight when the Horde crossed the sea, and I will not be a warrior anyone sings about, but I can be the one who sends them back to the fight on their feet." } },
      choices = { { text = "That is honorable work. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    fellow = {
      lines = { { id = "fl_default", text = "Swiftness draughts this month, and I have spoiled four of them. Tell me, do you crush the swiftthistle or tear it? Master Yelmak says tear, and Kor'geld says it makes no difference at all." } },
      choices = {
        { text = "I tear it, as your master does.", next = "BACK", reply = "Then that is two against one, and I will stop arguing with him about it." },
        { text = "I crush it, and it brews well enough.", next = "BACK", reply = "Ha! I will tell Kor'geld, though I will not tell Master Yelmak who said so." },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am Yelmak's apprentice, here in the Drag. I grew up in this city, and I mean to brew for its war bands." } },
    _none = { { id = "tp_none", text = "I do not know, and I should not guess, because guessing is how eyebrows are lost. Ask Master Yelmak." } },
  },
}

-- Zeal'aya: herbalism supplier at Jandi's Arboretum, the Drag.
P:NPC {
  key = "zealaya", id = TODO_NPC("Zeal'aya"), name = "Zeal'aya", title = "Herbalism Supplier", gender = "female",
  bible = "bibles/missed_b.md", role = "vendor", tier = "service",
  communities = { "orgrimmar" }, temper = { "sly", "easy" }, values = { "patient" },
  notices = { "profession", "race" },
  impression = {
    first = "Zeal'aya sells herbs and gathering goods at Jandi's Arboretum, among pots of green things that have no business growing in a canyon this dark. She handles every leaf as if it could hear her.",
    third = "{name} met Zeal'aya, the troll herb seller at Jandi's Arboretum in the Drag.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Come in out of de dust, friend! Zeal'aya got de freshest green things for you today." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Come in out of de dust, {class}. Zeal'aya be watchin' you near de green things." },
    { id = "g_default", text = "Come in out of de dust, {class}. Everything green in dis shop be alive, so mind where ya put your elbows." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you be back, and the little ones in the pots remember ya. They leaned a bit when you came in." },
    { id = "g_troll", when = { race = "Troll" }, text = "A Darkspear face in the Drag, and a welcome one. Sit a moment, cousin, and smell something dat isn't orc cooking." },
  },
  notice = {
    { id = "n_herb", cat = "profession", when = { profession = "Herbalism" },
      text = "Ya got soil under the nails, and dat's the right kind of dirty. You pick your own, don't you?" },
  },
  start = "hello",
  nodes = {
    w2fav = {
      lines = { { id = "w2fv_default", text = "Dat little mageroyal in de cracked pot, mon. It never flowered once in two years down here, an' Jandi tell me to throw it out, but last week it put out one tiny yellow bud an' Zeal'aya danced around de shop like a fool." } },
      choices = {
        { text = "Why keep a plant that won't bloom?", next = "w2fav2" },
        { text = "One bud seems worth the wait.", next = "w2fav2" },
        { text = "Something else, Zeal'aya.", next = "BACK" },
      },
    },
    w2fav2 = {
      lines = {
        { id = "w2fv2_troll", when = { race = "Troll" }, text = "Because it be stubborn, cousin, like us Darkspear. We got pushed off de islands an' put down in hard red dirt, an' here we be still, puttin' out one little bud at a time." },
        { id = "w2fv2_default", text = "Because it be stubborn, mon, an' Zeal'aya respect stubborn. A thing dat keeps tryin' in a dark place like dis deserves a little water an' a lot of patience." },
      },
      choices = { { text = "I hope it blooms fully.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    za_jandi = {
      lines = { { id = "za_jandi_l", text = "Patient, mon, more patient dan me, and she can name every herb in Kalimdor by de smell of its root. She teaches de picking and I sell de pickers deir tools, and we argue every evening about which one of us does de harder work." } },
      choices = {
        { text = "And who wins the argument?", next = "za_jandi2" },
        { text = "Picking sounds like the harder work.", next = "za_jandi2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    za_jandi2 = {
      lines = { { id = "za_jandi2_l", text = "Nobody, because we both stop when de tea is ready. Jandi brews it from silverleaf and a little mageroyal, and it be de best thing in dis whole city, mon, though she won't sell it." } },
      choices = {
        { text = "Perhaps she'll share a cup one day.", next = "BACK" },
        { text = "Something else, Zeal'aya.", next = "BACK" },
      },
    },
    za_buy = {
      lines = { { id = "za_buy_l", text = "De alchemists of de Drag, mostly, who send dere students with long lists and short purses. Yelmak buys more dan anybody, and he pays in potions as often as coin, which I don't mind." } },
      choices = {
        { text = "Potions instead of coin?", next = "za_buy2" },
        { text = "Yelmak must brew a great deal.", next = "za_buy2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    za_buy2 = {
      lines = { { id = "za_buy2_l", text = "A healin' potion be worth more dan coin to a troll who picks in de Barrens, mon. I keep a few on de shelf for de pickers who come back bitten, and Yelmak pretends he doesn't know where his potions go." } },
      choices = {
        { text = "That's a kind arrangement.", next = "BACK" },
        { text = "Where do the pickers get bitten most?", next = "za_buy3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    za_buy3 = {
      lines = { { id = "za_buy3_l", text = "In de Barrens, by de oases, where de herbs grow thick and de snakes and crocolisks wait for dem. I tell every picker to look at de water before dey look at de leaves, mon, because de leaves don't bite." } },
      choices = {
        { text = "Water first, then leaves. Noted.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I be Zeal'aya. Jandi teaches the picking and I sell what the pickers need, and between us we keep a bit of green alive in the middle of all dis red rock." },
      },
      again = {
        { id = "h_again", text = "Somethin' else, mon? Ask while I water de little ones, dey like to hear a voice." },
        { id = "h_again2", text = "Ask away. The plants aren't in any hurry, and neither am I." },
      },
      choices = {
        { text = "Keeping green alive in this place is a kindness.", next = "BACK", reply = "Ah, you understand, mon. It be small, but it be good.", fx = { align = { light = 1 } } },
        { text = "Herbs are for selling, not for coddling.", next = "BACK", reply = "Ya sell what ya coddle, mon, or ya sell nothin' worth havin'.", fx = { align = { light = -1 } } },
        { text = "How does anything grow down here?", next = "grow" },
        { text = "Do the herbs really remember people?", next = "remember" },
        { text = "You must miss the islands.", next = "isles" },
        { text = "I gather herbs. Where should I look?", next = "where", when = { profession = "Herbalism" } },
        { text = "What is Jandi like as a teacher?", next = "za_jandi" },
        { text = "Who buys the most from you?", next = "za_buy" },
        { text = "Which of these plants is your favourite?", next = "w2fav" },
        { text = "Stay well, Zeal'aya.", next = "END" },
      },
    },
    grow = {
      lines = { { id = "gr_default", text = "With patience and a lot of carried water. The Drag gets no sun worth the name, so we grow the shade-lovers here and Jandi hauls the rest out to the light every morning like a mother with too many children." } },
      choices = {
        { text = "That sounds like hard work for a few pots.", next = "pots" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pots = {
      lines = { { id = "pt_default", text = "It is, and it be worth every bucket. An orc who has only ever seen Durotar thinks the whole world is rock and boar, and then he walks in here and stands very quiet for a while." } },
      choices = { { text = "I can believe it. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    remember = {
      lines = { { id = "rm_default", text = "Everything has a spirit in it, {class}, even a weed, and a spirit knows who watered it and who stepped on it. You don't have to believe me, but be polite to the earthroot anyway and see how ya get on." } },
      choices = { { text = "I'll mind my manners. Something else.", next = "BACK" } },
    },
    isles = {
      lines = {
        { id = "is_troll", when = { race = "Troll" }, text = "Every day, same as you do. The Echo Isles had more green on one beach than dis whole land, and Zalazane sits in the middle of it now, spoiling it." },
        { id = "is_default", text = "Every day, mon. The Echo Isles had flowers the size of your head and vines dat would climb you if you stood still, and now Zalazane's hexed fools be trampling all of it.", fx = { learn = { "echo_isles" } } },
      },
      choices = {
        { text = "Would you go back?", next = "goback" },
        { text = "Something else.", next = "BACK" },
      },
    },
    goback = {
      lines = { { id = "gb_default", text = "When Vol'jin says the isles are ours again, I'll be on the first boat with a sack of seeds. Until then I grow what I can here, and I owe the orcs dat much for taking us in." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    where = {
      lines = { { id = "wh_default", text = "Start close, in the Barrens, where the earthroot hides on the hillsides and the mageroyal likes the open grass. Cut the stem and leave the root, and the same patch will feed ya again next moon." } },
      choices = { { text = "I'll leave the roots. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Darkspear, off the Echo Isles, and now I sell herbs in an orc canyon. The spirits have a funny way of walking us about." } },
    echo_isles = { { id = "tp_ei", text = "Home, mon, till Zalazane turned half our kin against us. Vol'jin will take it back one day." } },
    _none = { { id = "tp_none", text = "Dat's not something that grows in my pots, mon. Ask someone who knows more than leaves." } },
  },
}

-- Sarlek: upstairs in the Drag with Tamaro, forever arguing.
P:NPC {
  key = "sarlek", id = TODO_NPC("Sarlek"), name = "Sarlek", gender = "male",
  bible = "bibles/missed_b.md", role = "citizen", tier = "service",
  communities = { "orgrimmar" }, temper = { "stubborn", "loud" }, values = { "proud" },
  notices = { "class" },
  impression = {
    first = "Sarlek stands upstairs above the Drag, deep in an argument with his friend Tamaro that has plainly been going on for years. He turns to any newcomer as a fresh judge for it.",
    third = "{name} met Sarlek, who argues with his friend Tamaro in an upstairs room in the Drag.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "You! Friend! Come here, settle this, because Tamaro won't listen and you're the only one with sense." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "You, {class}. I'd ask you to settle something, but I don't trust your judgment." },
    { id = "g_default", text = "You, {class}, come here and settle something, because Tamaro will not listen to sense from me." },
    { id = "g_back", when = { metBefore = true }, text = "Good, you have returned. He is still wrong, and I still need a witness." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior! Then you will take my side, because you know what an axe is for." },
  },
  start = "hello",
  nodes = {
    w2win = {
      lines = { { id = "w2w_default", text = "I do, every time, and Tamaro says it is a draw, which is how he loses without having to say so. We have been keeping count since the boat out of Lordaeron, and by my tally I am ahead by four hundred and some." } },
      choices = {
        { text = "And by Tamaro's tally?", next = "w2win2" },
        { text = "Four hundred wins seems a lot of shouting.", next = "w2win2" },
        { text = "Something else, Sarlek.", next = "BACK" },
      },
    },
    w2win2 = {
      lines = {
        { id = "w2w2_orc", when = { race = "Orc" }, text = "He says we are even, the stubborn boar, and he will not show me his marks. You are an orc, so you understand that an argument is not for winning; it is for proving you are still alive enough to have one." },
        { id = "w2w2_default", text = "He says we are even, the stubborn boar, and he will not show me his marks. Between you and me, an argument is not for winning, it is for proving you are still alive enough to have one." },
      },
      choices = { { text = "Then keep arguing for years.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Sarlek, and that stubborn boar beside me is Tamaro. We came up here for the quiet, away from the noise of the Drag, and we have not had a moment of quiet since." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick, before he starts again." },
        { id = "h_again2", text = "Ask, {class}, and pay no mind to what he mutters." },
      },
      choices = {
        { text = "What are you two arguing about?", next = "argue" },
        { text = "You sound like old friends.", next = "friends" },
        { text = "Why come up here at all?", next = "upstairs" },
        { text = "Where did you two fight?", next = "xwar" },
        { text = "You'd be bored in the Valley of Honor too.", next = "xbored" },
        { text = "I am a warrior. Ask me who is right.", when = { class = "WARRIOR" }, next = "xjudge" },
        { text = "Who usually wins your arguments?", next = "w2win" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    argue = {
      lines = { { id = "a_default", text = "Whether an orc should make his home in the Valley of Honor or here in the Drag. I say Honor, where you wake to the sound of hammers and wolves, and he says the Drag, where you wake to nothing at all because the sun never finds you." } },
      choices = {
        { text = "The Valley of Honor, plainly.", next = "side_s" },
        { text = "The Drag has its uses.", next = "side_t" },
        { text = "You are both wrong. Something else.", next = "BACK", reply = "Ha! That is the first thing Tamaro and I have agreed to dislike in a month." },
      },
    },
    side_s = {
      lines = { { id = "ss_default", text = "There, Tamaro, do you hear? This one has travelled and fought, and this one says Honor. He will pretend he did not hear, {class}, but I will remind him of it until the snows come to Durotar." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    side_t = {
      lines = { { id = "st_default", text = "Bah, he has paid you, or else the shade has gone to your head already. I will grant that the Drag is cool at midday, and that is all I will grant, and you may tell him I said no more than that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    friends = {
      lines = { { id = "f_default", text = "We shared a pen in the camps and a boat across the sea, and after that an orc is either your brother or your enemy. I chose brother, though some mornings I wonder at it.", fx = { learn = { "internment" } } } },
      choices = { { text = "That is a long road together. Something else.", next = "BACK" } },
    },
    upstairs = {
      lines = { { id = "u_default", text = "Because the scholars below do not shout, and neither of us can read well enough to be bothered by what they write. It is the one place in Orgrimmar where nobody tries to sell us anything." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xwar = {
      lines = {
        { id = "xwar_default", text = "In the Second War, both of us, under the Blackrock banner until the Alliance broke it. Tamaro carried me out of a burning field near Blackrock Mountain, and I have been paying for it ever since by listening to him." },
      },
      choices = {
        { text = "And after the war?", next = "xcamps" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcamps = {
      lines = {
        { id = "xcamps_default", text = "After the war came the camps, and I will not talk long about them. We sat in the mud together for years, and when the Warchief opened the gates, Tamaro said he wanted shade and quiet, and I said he was a fool." },
      },
      choices = {
        { text = "And here you are, in shade and quiet.", next = "xshade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xshade = {
      lines = {
        { id = "xshade_default", text = "Here we are, and do not tell him I like it. An orc who admits he likes the quiet is one step from tending turnips, and I have seen what that did to the camps." },
      },
      choices = {
        { text = "Peace is earned. There is no shame in enjoying it.", next = "BACK", reply = "Hmph. You talk like him, and he is never right, so be careful.", fx = { align = { honor = -1 } } },
        { text = "A warrior should die fighting, not sitting.", next = "BACK", reply = "Ha! Tell him that, and see if he answers louder than a sigh.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xbored = {
      lines = {
        { id = "xbored_default", text = "Bored? I would be teaching the young ones how to swing properly, and they would be thanking me for it. Tamaro says they would be laughing at an old orc who forgot his knees." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xjudge = {
      lines = {
        { id = "xjudge_default", text = "Good. A warrior knows an orc belongs where the axes ring, in the Valley of Honor, and not up a staircase watching goblins haggle. Tell him so, and say it louder than I do." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am an old soldier with time on his hands, and Tamaro is the same. We earned the right to waste a day." } },
    internment = { { id = "tp_in", text = "We sat behind human walls and forgot what we were. Thrall reminded us, and I do not forget twice." } },
    second_war = { { id = "tp_x_second_war", text = "We lost the Second War, and nobody needs to remind me. Tamaro carried me out of it, which he reminds me of instead." } },
    _none = { { id = "tp_none", text = "I do not know, and Tamaro knows less, whatever he tells you." } },
  },
}

-- Tamaro: upstairs in the Drag with Sarlek.
P:NPC {
  key = "tamaro", id = TODO_NPC("Tamaro"), name = "Tamaro", gender = "male",
  bible = "bibles/missed_b.md", role = "citizen", tier = "service",
  communities = { "orgrimmar" }, temper = { "dry", "calm" }, values = { "patient" },
  notices = { "class" },
  impression = {
    first = "Tamaro leans against the wall of an upstairs room in the Drag and lets his friend Sarlek shout at him. He answers rarely and quietly, and each answer makes Sarlek louder.",
    third = "{name} met Tamaro, the quieter half of an old argument upstairs in the Drag.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Welcome, friend. Whatever Sarlek has said, I'll trust you to see the truth of it." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Welcome, {class}. If Sarlek has spoken to you, I'll assume you agree with him. Most fools do." },
    { id = "g_default", text = "Welcome, {class}. If Sarlek has already told you I am wrong, then you have heard his half, and you may as well hear mine." },
    { id = "g_back", when = { metBefore = true }, text = "You came back up the stairs, so either you like us or you are lost." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. Then you know the worth of a quiet place, which is more than my friend does." },
  },
  start = "hello",
  nodes = {
    w2game = {
      lines = { { id = "w2g_default", text = "We play knucklebones, with a set of bones we carved in the camps from the guards' leftover dinner. Sarlek cheats, and I let him, because a game he wins keeps him quiet for almost half an hour." } },
      choices = {
        { text = "You let him cheat?", next = "w2game2" },
        { text = "Half an hour of quiet is worth a few losses.", next = "w2game2" },
        { text = "Something else, Tamaro.", next = "BACK" },
      },
    },
    w2game2 = {
      lines = { { id = "w2g2_default", text = "He cheated in the camps too, and it was the only thing in that place that made me laugh. When an old friend gives you a reason to laugh, you do not count the bones too carefully." } },
      choices = { { text = "That is a good friendship.", next = "BACK" }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Tamaro. Sarlek and I come up here most days, and he argues while I rest, which suits both of us better than he would ever admit." },
      },
      again = {
        { id = "h_again", text = "Something more, {class}? Say it before Sarlek draws breath again, or you will wait a while." },
        { id = "h_again2", text = "Ask it quietly, and he may not notice." },
      },
      choices = {
        { text = "What is your half of the argument?", next = "half" },
        { text = "Doesn't his shouting wear on you?", next = "shout" },
        { text = "You both look like old soldiers.", next = "soldiers" },
        { text = "Sarlek says you carried him out of a battle.", next = "xcarry" },
        { text = "What do you see from up here?", next = "xview" },
        { text = "A shaman values quiet. What do the spirits say here?", when = { class = "SHAMAN" }, next = "xspirits" },
        { text = "What else do you two do, besides argue?", next = "w2game" },
        { text = "Rest well, Tamaro.", next = "END" },
      },
    },
    half = {
      lines = { { id = "hf_default", text = "That the Drag is the best of Orgrimmar. It is cool when Durotar is burning, the craftsmen are all within a short walk, and nobody blows a war horn under your window at dawn." } },
      choices = {
        { text = "And the Valley of Honor?", next = "honor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    honor = {
      lines = { { id = "hn_default", text = "It is a fine place for the young, who still need to be seen with a weapon in their hands. I have been seen enough, {class}, and I would sooner sit in the shade and hear the tanners curse." } },
      choices = {
        { text = "You have earned your shade.", next = "BACK", fx = { affinity = 1 } },
        { text = "Sarlek would call that going soft. Something else.", next = "BACK", reply = "He does, daily. Then he sits down beside me in the same shade." },
      },
    },
    shout = {
      lines = { { id = "sh_default", text = "After the camps, I would rather hear an orc shout about nothing than hear him say nothing at all. Sarlek was silent for two years behind those walls, so I let him make up for it." } },
      choices = { { text = "That is a kind way to hear it. Something else.", next = "BACK" } },
    },
    soldiers = {
      lines = { { id = "so_default", text = "We were, once. We followed the Warchief out of the camps and over the sea, and we carried stone for these walls when our fighting was done, which I count as the better work of the two." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xcarry = {
      lines = {
        { id = "xcarry_default", text = "I did, near Blackrock Mountain, with his leg broken and his mouth still working. He has never once thanked me, which is how I know he is grateful." },
      },
      choices = {
        { text = "Why carry him? The battle was lost.", next = "xwhy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwhy = {
      lines = {
        { id = "xwhy_default", text = "Because he was there, and I was standing, and that was all the reason an orc of the Horde needed. We had very little honour left in those days, so we kept what we could find." },
      },
      choices = {
        { text = "Then you kept the best of it.", next = "xkept" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xkept = {
      lines = {
        { id = "xkept_default", text = "Perhaps. The demon blood took a great deal from us, and the camps took more, but nobody could take a friend you had carried. Sarlek would never say that, so I say it for both of us." },
      },
      choices = {
        { text = "Loyalty to a friend matters more than any war.", next = "BACK", reply = "So I think, though Sarlek would call it soft and then agree with me later.", fx = { align = { honor = -1 } } },
        { text = "Loyalty to the Horde comes first, friends after.", next = "BACK", reply = "That was the Horde's creed under Doomhammer, and it cost us dear. I keep it differently now.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xview = {
      lines = {
        { id = "xview_default", text = "The Drag, and every goblin and trader who passes through it. I like to watch them buy and sell, because none of them are trying to kill anyone, and I spent too many years where everyone was." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xspirits = {
      lines = {
        { id = "xspirits_default", text = "I am no shaman, but I feel what you mean. The stone holds the sound of the drums below, and it is a calm sound from up here, like rain heard from under a good roof." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "An old soldier, and now an old builder with nothing left to build. Sarlek keeps me from growing bored." } },
    internment = { { id = "tp_x_internment", text = "We waited out the camps together, Sarlek and I. He talked and I listened, and I think the talking kept him alive." } },
    thrall = { { id = "tp_x_thrall", text = "The Warchief gave us our freedom and then a city to keep it in. I am content to sit in a corner of it." } },
    _none = { { id = "tp_none", text = "I could not say. Ask Sarlek, and he will give you an answer whether he has one or not." } },
  },
}

-- Tosamina: helps Orphan Matron Battlewail at the orphanage in the Drag.
P:NPC {
  key = "tosamina", id = TODO_NPC("Tosamina"), name = "Tosamina", gender = "female",
  bible = "bibles/missed_b.md", role = "caretaker", tier = "service",
  communities = { "orgrimmar" }, temper = { "warm", "firm" }, values = { "loyal", "protective" },
  notices = { "class", "race" },
  impression = {
    first = "Tosamina helps keep the orphanage in the Drag, and she counts heads without seeming to while she talks. Her voice is gentle and her arms are a warrior's, and the children mind both.",
    third = "{name} met Tosamina, who helps care for the war orphans in the Drag.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 60 } }, text = "Oh, it's you. The little ones love it when you visit. Come in, and keep your voice soft." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Keep your voice down, {class}. The small ones are resting, and I'd rather you didn't wake them." },
    { id = "g_default", text = "Keep your voice down a little, {class}, because the small ones have only just settled. You are welcome here, so long as your weapons stay sheathed." },
    { id = "g_back", when = { metBefore = true }, text = "The children asked whether you would come back. I told them heroes are busy, and here you are making a liar of me." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren! Stand still a moment and they will try to climb you, I warn you now." },
  },
  start = "hello",
  nodes = {
    w2play = {
      lines = { { id = "w2p_default", text = "Warchief and humans, mostly, where one child is Thrall breaking out of Durnholde and the rest are the guards. The trouble is that nobody ever wants to be a human, so I end up playing the whole garrison myself and losing every time." } },
      choices = {
        { text = "Do you ever let yourself win?", next = "w2play2" },
        { text = "That sounds like hard work.", next = "w2play2" },
        { text = "Something else, Tosamina.", next = "BACK" },
      },
    },
    w2play2 = {
      lines = {
        { id = "w2p2_orc", when = { race = "Orc" }, text = "Never, and you would not either. These little ones lost their parents to the Horde's wars, and if a game lets them break their chains a hundred times over, I will lie in the dust for them as long as they need." },
        { id = "w2p2_default", text = "Never. These little ones lost their parents to the Horde's wars, and if a game lets them break their chains a hundred times over, then I will lie in the dust for them as long as they need it." },
      },
      choices = { { text = "They're lucky to have you.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Tosamina. Matron Battlewail keeps this house and I help her with it, and between us we feed, wash and chase more children than two orcs should have to." },
      },
      again = {
        { id = "h_again", text = "What else would you ask? I have one ear for you and one for them." },
        { id = "h_again2", text = "Go on, {class}, while they are quiet." },
      },
      choices = {
        { text = "Whose children are these?", next = "whose" },
        { text = "What becomes of them when they're grown?", next = "grown" },
        { text = "You carry yourself like a fighter.", next = "fighter" },
        { text = "Earth Mother watch over them.", next = "blessing", when = { race = "Tauren" } },
        { text = "Where did you fight?", next = "y_fought" },
        { text = "What worries you about the children?", next = "y_worry" },
        { text = "Tell me about Matron Battlewail.", next = "y_matron" },
        { text = "What games do the children play?", next = "w2play" },
        { text = "I won't wake them. Farewell.", next = "END" },
      },
    },
    whose = {
      lines = { { id = "w_default", text = "The Horde's, now. Their mothers and fathers fell at Hyjal, or in Ashenvale, or on some road in the Barrens with a quilboar spear in them, and no child of the Horde is left to the wolves while this house stands." } },
      choices = {
        { text = "Do they ask about their parents?", next = "ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ask = {
      lines = { { id = "a_default", text = "The little ones ask when, and the older ones ask how. I tell them the truth as far as I know it, because an orc child should know that a parent died with a weapon in hand and no chains on the wrist." } },
      choices = { { text = "That is the right way. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    grown = {
      lines = { { id = "gr_default", text = "Some go to the Valley of Trials when they are of an age, and some are taken as apprentices by the smiths and tanners here in the Drag. A few come back to visit, and those are the days the Matron pretends she has dust in her eye." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    fighter = {
      lines = { { id = "f_default", text = "I was one, and I can still swing an axe if anyone is fool enough to come through that door meaning harm. But somebody has to raise the ones the fighting leaves behind, and I found I had the patience for it." } },
      choices = {
        { text = "That takes more courage than battle.", next = "BACK", reply = "It takes more sleep than battle, {class}, and I get less of it. But I thank you." },
        { text = "Something else.", next = "BACK" },
      },
    },
    blessing = {
      lines = { { id = "b_default", text = "They will take that blessing gladly, and so will I. Your people sent us blankets from Thunder Bluff in the first winter, and the Matron has not forgotten it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_fought = {
      lines = {
        { id = "y_fought_d", text = "At the Crossroads, and later in Ashenvale with the Warsong. I lost my mate at Hyjal and came home to find his sister's children with nobody. That is how I came to this house." },
        { id = "y_fought_orc", when = { race = "Orc" }, text = "The Crossroads, and Ashenvale with the Warsong. I lost my mate at Hyjal, as many orcs lost someone there. I came home to his sister's orphans, and so to this house." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    y_worry = {
      lines = { { id = "y_worry_d", text = "The older boys sneak to the Valley of Honor to watch the training, and some sneak to the Cleft. There are things in the Cleft that should not see children." } },
      choices = {
        { text = "Forbid it. Lock the doors.", next = "y_lock" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_lock = {
      lines = { { id = "y_lock_d", text = "Matron would lock them in. I think a locked door only makes a bold child bolder. Should I guard them like prisoners, or trust them to choose?" } },
      choices = {
        { text = "Trust them. Teach them, then let go.", next = "BACK", reply = "Yes. That is how I was raised, before the camps.", fx = { align = { order = -1 } } },
        { text = "Guard them. They're too young to choose.", next = "BACK", reply = "Matron would thank you for that answer.", fx = { align = { order = 1 } } },
      },
    },
    y_matron = {
      lines = { { id = "y_matron_d", text = "Matron Battlewail is the hardest orc I know and the softest, depending on the hour. She has buried more children than she will say, and she still knows every living one by name." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I fought for the Horde, and now I mind its orphans with Matron Battlewail. I think the second is the harder duty." } },
    matron_battlewail = { { id = "y_tp_matron", text = "Matron Battlewail runs this house. I only help, and I am glad to." } },
    hyjal = { { id = "y_tp_hyjal", text = "Hyjal took my mate and gave the Horde a future. I try to remember the second part." } },
    _none = { { id = "tp_none", text = "I have no time to know such things, {class}. Ask me about children and I can tell you plenty." } },
  },
}
