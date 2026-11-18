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
  },
  topics = {
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
    { id = "g_default", text = "Throm-ka, {class}. If plate drags at you and leather chafes, then mine is the wall you want." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back to the light wall. Has the last robe held together, or did the Barrens thorns get it?" },
  },
  notice = {
    { id = "n_caster", cat = "class", when = { class = { "MAGE", "PRIEST", "WARLOCK", "SHAMAN" } },
      text = "You are one who fights with more than your arms. I keep cloth cut loose in the sleeve for hands that need to move." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Ollanus, and I sell the light goods in this armory: robes, wraps, padded vests and the like. Morgum and Soran laugh at it, but the far seers do not go to war in plate, and somebody must dress them." },
      },
      again = {
        { id = "h_again", text = "Is there more you would ask, {class}?" },
        { id = "h_again2", text = "Go on, I am listening." },
      },
      choices = {
        { text = "Do orcs really buy robes?", next = "robes" },
        { text = "Morgum and Soran laugh at you?", next = "laugh" },
        { text = "Cloth seems a poor shield.", next = "shield" },
        { text = "What would you put on a spellcaster?", next = "caster", when = { class = { "MAGE", "PRIEST", "WARLOCK" } } },
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
  },
  topics = {
    background = { { id = "tp_bg", text = "I have sold light armor here since Soran opened his doors. It is quiet work, and after the camps I do not mind quiet." } },
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
    { id = "g_default", text = "Lok'tar, {class}! You have walked through the gates of Orgrimmar, and now you should carry a blade that is worthy of them." },
    { id = "g_back", when = { metBefore = true }, text = "I know that face, and I know that weapon, and one of them has seen hard use since you were last here." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior, and one who keeps the edge clean. I will show you the good steel and not the peon knives." },
  },
  start = "hello",
  nodes = {
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
  },
  topics = {
    background = { { id = "tp_bg", text = "I carried an axe for the Horde before I sold them, and my knees ended that. Now I arm the ones who still can march." } },
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
    { id = "g_default", text = "Thread, salt and dye, {class}. If you work hides, I have what the hide cannot give you." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more thread already? Then you are either working hard or stitching badly." },
  },
  notice = {
    { id = "n_lw", cat = "profession", when = { profession = "Leatherworking" },
      text = "Those are a stitcher's fingers, pricked and stained. Good, because I would rather sell to someone who will use it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Tamar. Karolek teaches the craft and Thuwd teaches the knife, and I sell the small things both of them forget they need until the work is half done." },
      },
      again = {
        { id = "h_again", text = "What else do you need to know?" },
        { id = "h_again2", text = "Ask it, {class}, while the vats are quiet." },
      },
      choices = {
        { text = "What do leatherworkers run out of most?", next = "runout" },
        { text = "It smells strong in here.", next = "smell" },
        { text = "What is Karolek like to work for?", next = "karolek" },
        { text = "I work leather myself. Any advice?", next = "advice", when = { profession = "Leatherworking" } },
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
  },
  topics = {
    background = { { id = "tp_bg", text = "I keep the shelves for the Kodohide shop. I count what comes in and what goes out, and the craft goes on around me." } },
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
    hello = {
      lines = {
        { id = "h_default", text = "I be Zeal'aya. Jandi teaches the picking and I sell what the pickers need, and between us we keep a bit of green alive in the middle of all dis red rock." },
      },
      again = {
        { id = "h_again", text = "What else ya want to know, mon?" },
        { id = "h_again2", text = "Ask away. The plants aren't in any hurry, and neither am I." },
      },
      choices = {
        { text = "How does anything grow down here?", next = "grow" },
        { text = "Do the herbs really remember people?", next = "remember" },
        { text = "You must miss the islands.", next = "isles" },
        { text = "I gather herbs. Where should I look?", next = "where", when = { profession = "Herbalism" } },
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
    { id = "g_default", text = "You, {class}, come here and settle something, because Tamaro will not listen to sense from me." },
    { id = "g_back", when = { metBefore = true }, text = "Good, you have returned. He is still wrong, and I still need a witness." },
  },
  notice = {
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior! Then you will take my side, because you know what an axe is for." },
  },
  start = "hello",
  nodes = {
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
  },
  topics = {
    background = { { id = "tp_bg", text = "I am an old soldier with time on his hands, and Tamaro is the same. We earned the right to waste a day." } },
    internment = { { id = "tp_in", text = "We sat behind human walls and forgot what we were. Thrall reminded us, and I do not forget twice." } },
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
    { id = "g_default", text = "Welcome, {class}. If Sarlek has already told you I am wrong, then you have heard his half, and you may as well hear mine." },
    { id = "g_back", when = { metBefore = true }, text = "You came back up the stairs, so either you like us or you are lost." },
  },
  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. Then you know the worth of a quiet place, which is more than my friend does." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Tamaro. Sarlek and I come up here most days, and he argues while I rest, which suits both of us better than he would ever admit." },
      },
      again = {
        { id = "h_again", text = "Is there something more, {class}?" },
        { id = "h_again2", text = "Ask it quietly, and he may not notice." },
      },
      choices = {
        { text = "What is your half of the argument?", next = "half" },
        { text = "Doesn't his shouting wear on you?", next = "shout" },
        { text = "You both look like old soldiers.", next = "soldiers" },
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
  },
  topics = {
    background = { { id = "tp_bg", text = "An old soldier, and now an old builder with nothing left to build. Sarlek keeps me from growing bored." } },
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
    { id = "g_default", text = "Keep your voice down a little, {class}, because the small ones have only just settled. You are welcome here, so long as your weapons stay sheathed." },
    { id = "g_back", when = { metBefore = true }, text = "The children asked whether you would come back. I told them heroes are busy, and here you are making a liar of me." },
  },
  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren! Stand still a moment and they will try to climb you, I warn you now." },
  },
  start = "hello",
  nodes = {
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
  },
  topics = {
    background = { { id = "tp_bg", text = "I fought for the Horde, and now I mind its orphans with Matron Battlewail. I think the second is the harder duty." } },
    _none = { { id = "tp_none", text = "I have no time to know such things, {class}. Ask me about children and I can tell you plenty." } },
  },
}
