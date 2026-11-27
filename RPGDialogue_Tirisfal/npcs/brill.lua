-- Brill: a human town, a plague town, now the Forsaken's. Voice: bibles/tirisfal.md
local P = RPGDialogueAPI:Pack("rpgd.tirisfal")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Zygand's grudge against the kaldorei (authored, not canon): he blames the elves' long silence for Lordaeron.
P:Claim {
  id = "zygand_kaldorei_silence", by = "zygand", truth = "partly",
  text = "The night elves knew the Burning Legion for ten thousand years and warned no one, and Lordaeron died for their silence.",
  truthNote = "The kaldorei did fight the Legion in the War of the Ancients and then kept apart from the world (canon). But they knew nothing of the Scourge or of the human kingdoms; the warning to flee west came from the Prophet, and King Terenas would not hear it. Zygand blames the distant for what the near ignored.",
  tell = "true",
  open = true,
}

P:NPC {
  key = "zygand", id = TODO_NPC("Executor Zygand"), name = "Executor Zygand",
  prejudice = { origin = "forsaken_scarlet_turned", amount = 12, why = "He fights the Crusade daily; a Forsaken who once wore Scarlet is, to him, a spy until proven otherwise." },
  bible = "bibles/tirisfal.md", role = "soldier", tier = "major",
  communities = { "brill" }, temper = { "cold" }, values = { "loyal", "dutiful" },
  likesTone = "blunt",
  notices = { "kit", "race", "lock_shards", "lock_armor" },
  impression = {
    first = "I would not want to face the wrong end of his blade.",
    third = "{name} met Executor Zygand, commander of the Deathguard in Tirisfal, who means to see the Scarlet Crusade driven from the glades.",
  },

  greetings = {
    { id = "g_prej", when = { prejudiced = true }, text = "You wore the Crusade's red before you died. I can tell by the way you stand, and I have hanged Scarlet scouts who stood exactly like that. Speak carefully." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "I had you marked as a Scarlet spy when you first came to Brill. I was wrong, and I don't say that often, so remember it." },
    { id = "g_brill", text = "State your business. The Crusade keeps me busy, and I prefer to stay that way." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned, and with results, I hope; the Dark Lady has little patience for the other kind." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the Crusade did not take that time off. I trust you return with something worth reporting." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You were barely fit to hold a blade when I first sent you after the Scarlets, and now you look like someone they should fear. Good; make them fear you." },
    { id = "g_word_intimidated", when = { word = "intimidated" }, text = "I'm told you made someone in Brill back down without drawing steel. That is efficient, and I value efficiency." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The zealots marked you. Mend yourself, and then repay them in kind." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "One of our living allies. Tirisfal is not kind to the breathing, so watch the fields." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 10 } },
      text = "You carry souls in your bag the way a soldier carries rations, {class}. Spend them on the Crusade, and let the zealots learn what it means to be harvested." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "That demon-hide ward is exactly the sort of thing the Crusade points to when they call us all monsters. Wear it at the front, where it frightens them, and not in Brill, where it frightens my people." },
  },

  start = "hello",
  nodes = {
    prej_zygand = {
      big = true,
      lines = { { id = "prej_zygand_default", text = "I think the Crusade trained you to hate what you now are, and that kind of training doesn't rot away with the flesh. Their scouts come into Tirisfal wearing our faces more often than you'd like to know, and each of them swore they were done with the red." } },
      choices = {
        { text = "The Crusade burned me. I'll burn them back, every last one.", next = "BACK", reply = "That's the answer I want to hear, and you'll get your chance soon enough at Solliden. Burn them back, but burn them where I can see it.", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "I still think some of them were right about the Scourge.", next = "BACK", reply = "Right about the Scourge, perhaps, and wrong about everything else, including you. Say that a little more quietly in Brill, corpse.", fx = { align = { light = 1 }, affinity = -1 } },
        { text = "Give me orders against them and judge me by the results.", next = "prej_zygand_calm", fx = { affinity = 1 } },
        { text = "How many Scarlet spies have you caught here?", next = "prej_zygand_why" },
      },
    },
    prej_zygand_why = {
      lines = { { id = "prej_zygand_why_default", text = "Four this season, and two of them were Forsaken who had gone back to the Monastery to beg forgiveness. The Crusade burned them both and sent their ashes to Brill in a box, so they weren't spies for long." } },
      choices = { { text = "I see. Let me answer you, then.", next = "prej_zygand" }, { text = "Something else.", next = "BACK" } },
    },
    prej_zygand_calm = {
      lines = { { id = "prej_zygand_calm_default", text = "That is the only kind of answer I trust. Go to the Scarlet camps at Solliden and come back with their colours; then we'll see what you are." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_horde = {
      big = true,
      lines = {
        { id = "ophd_default", text = "The Deathguard trust whoever holds the line beside them, and so far the orcs have held it. I'd rather hear your answer than give mine, though, so tell me what you make of the Horde." },
      },
      choices = {
        { text = "They took us in when no one else would. That's loyalty.", next = "op_horde_r1", fx = { align = { honor = 1 }, opinion = { horde = "loyal" } } },
        { text = "They need our blades. The day they don't, we're alone.", next = "op_horde_r2", fx = { affinity = 1, align = { honor = -1 }, trait = { skeptical = 1 }, opinion = { horde = "wary" } } },
        { text = "I'm Horde, Executor. You'll find we keep our word.", next = "op_horde_r3", fx = { trait = { proud = 1 }, opinion = { horde = "proud" } }, when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "I'll keep my own counsel on that, Executor.", next = "BACK" },
      },
    },
    op_horde_r1 = {
      lines = { { id = "ophd_r1", text = "That's the answer the Dark Lady likes to hear, and I'll not say she's wrong. Hold the line, and they'll go on holding it with us." } },
      choices = { { text = "Something else, Executor.", next = "BACK" } },
    },
    op_horde_r2 = {
      lines = { { id = "ophd_r2", text = "Hard words, but I've thought them myself on a long night's watch. Keep them in Brill and out of Orgrimmar, and we'll get along." } },
      choices = { { text = "Something else, Executor.", next = "BACK" } },
    },
    op_horde_r3 = {
      lines = { { id = "ophd_r3", text = "Then keep it here in Tirisfal, where the Crusade can see it. I judge allies by where they stand when the arrows start to fly." } },
      choices = { { text = "Something else, Executor.", next = "BACK" } },
    },
    xcl_sm = {
      big = true,
      lines = { { id = "xcl_sm_default", text = "Then you've seen the Crusade at its proudest, with its great halls and banners and libraries and inquisitors. They built that place to be their answer to the plague, and it held more prisoners than prayers, and I knew some of the Forsaken they dragged inside." } },
      choices = {
        { text = "They fought hard for their halls. I'll grant them that much.", next = "BACK", reply = "So did the Scourge, and I grant it nothing either. Admire their halls if you must, but don't let it slow your blade.", fx = { align = { honor = 1 } } },
        { text = "They deserved no mercy, and I showed them none.", next = "BACK", reply = "Good, because they'd have shown you less. The Monastery will learn that its walls are only stone.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "What happened to the Forsaken they dragged inside?", next = "xcl_sm2" },
      },
    },
    xcl_sm2 = {
      lines = { { id = "xcl_sm2_default", text = "The inquisitors questioned them to learn how we were made, and when they were finished, they burned what was left in the courtyard. If you found the cells empty, that is why, and I keep a list of their names in my desk." } },
      choices = {
        { text = "Their names are owed more than a list, Executor.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Mend my Deathguard when the Crusade's arrows find them, because a corpse that cannot feel its wounds will walk until it falls apart. Beyond that, I want the zealots to see that faith did not die with Lordaeron, and that it answers to the Dark Lady now." } },
      choices = {
        { text = "I'll keep your Deathguard standing, Executor. That's duty enough.", next = "BACK", reply = "Duty is all I ask of anyone in Brill. Keep them walking and I'll keep them pointed at the Crusade.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My prayers serve me first, Executor, and your soldiers second.", next = "BACK", reply = "Then make sure there's enough left over for my soldiers, priest. I don't keep anyone in Brill who serves only themselves.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Track them, and bring them down before they reach their camps, because a scout who reports is worth a company to the Crusade. The beasts of the Tirisfal woods have grown fat on Scourge leavings, so mind them as you go." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has a good nose, and the Crusade's scouts reek of lamp oil and incense. Set it on their trail and they will not reach the monastery roads." },
      },
      choices = {
        { text = "I'll bring them down cleanly, and bring you their orders.", next = "BACK", reply = "Good. Bring me those orders unread, and I'll know what they're planning before their captains do.", fx = { align = { honor = 1 } } },
        { text = "I'll let one run, and follow him home to his camp.", next = "BACK", reply = "A clever plan, if he doesn't lead you into an ambush. Follow him, then, but don't come back to me missing pieces.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_zygand = {
      lines = {
        { id = "hu_default", key = true,
          text = "I make what the Scarlet Crusade makes of me: a target. They call themselves the last pure men of Lordaeron, and they ride out of the monastery to burn our farms in the name of a Light that never once troubled itself to save them from the plague." },
        { id = "hu_scourge", when = { race = "Scourge" },
          text = "You know the answer already, because they've tried to burn you too. They call themselves the last pure men of Lordaeron, and they'd put you on a pyre beside your own grandmother and sing hymns while she burned." },
      },
      choices = {
        { text = "Are all humans the Crusade, though?", next = "hu_zygand_2" },
        { text = "What about the humans who aren't Scarlet?", next = "hu_zygand_2" },
        { text = "Something else, Executor.", next = "BACK" },
      },
    },
    hu_zygand_2 = {
      big = true,
      lines = {
        { id = "hu2_default",
          text = "Southshore sets its dogs on us, Stormwind calls us Scourge, and Dalaran won't open its gates, so the Crusade is merely the honest version. The rest of them would like us burned just the same; they only want somebody else to carry the torch." },
      },
      choices = {
        { text = "The Crusade must be destroyed. All of it, without quarter.", next = "BACK",
          reply = "Without quarter, and without hymns. Report to the Deathguard if you mean it, because I've a long list of farms that need burning back.",
          fx = { affinity = 1, align = { honor = -1 }, opinion = { humans = "hate" } } },
        { text = "Fight the Crusade, Executor, but spare the ones who surrender.", next = "BACK",
          reply = "Spare them, so they can tell the monastery how many of us hold Brill? Your conscience is noted, and so is the cost of it.",
          fx = { affinity = -1, align = { honor = 1 }, opinion = { humans = "mixed" } } },
        { text = "Something else, Executor.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_kin", tags = { "news" }, when = { alt = { kin = true } },
          text = "Another of your look reported to me, {alt}, and fought the Scarlet Crusade across Tirisfal without being told twice. If you are of their blood, living or dead, I expect the same discipline." },
        { id = "h_alt_living", tags = { "news" }, when = { race = "Scourge", alt = { notKin = true } },
          text = "A living {altclass} called {alt} came through Brill before you and fought beside my Deathguard against the Crusade. I don't trust the living easily, but that one earned a measure of it." },
        { id = "o_sydistrust", tags = { "news" }, when = { gossip = { topic = "sylvanas", stance = { "distrust", "fear" } } }, text = "Innkeeper Renee says you've your doubts about the Dark Lady. I'll hear them once, here, and then I'll not hear them again." },
        { id = "h_default", key = true,
          text = "Executor Zygand, commander of the Deathguard in Tirisfal. The Crusade means to burn this land clean of us, and it will not go the way they hope." },
        { id = "h_war", tags = { "news" }, when = { questActive = TODO_QUEST("At War With The Scarlet Crusade") },
          text = "The Crusade masses in the fields and the monastery roads. Cut them down where you find them, and bring proof." },
        { id = "h_maggot", when = { questActive = TODO_QUEST("Wanted: Maggot Eye") },
          text = "Maggot Eye is a gnoll who robs our graves. Bring me his paw, and the dead of Brill can rest." },
        { id = "h_intel", when = { questActive = TODO_QUEST("Vital Intelligence") },
          text = "Executor Arren sent you from Deathknell with what the Crusade's runners carried? Let me see... yes, this will do nicely." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, out of the Warchief's lands and into my fields. The Crusade burns anything it can't explain, so they'll aim at you before they aim at me." },
        { id = "h_druidcl", when = { race = "Tauren", class = "DRUID" }, text = "A tauren druid, in Tirisfal. The Crusade calls us unnatural, and I expect they'll call you the same, in between the arrows." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. The Crusade's scouts creep through the woods north of Brill, and I would rather they were tracked than merely counted." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, then. The Crusade burns priests of every kind but their own, so you'll be high on their lists, and I'd sooner you were high on mine." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Scarlet", min = 40 } }, text = "The Scarlet patrols near Brill have grown thin and nervous, and my deathguards tell me you're the reason. The Dark Lady values that kind of work, and so do I." },
        { id = "h_cl_sm", tags = { "news" }, when = { cleared = "Scarlet Monastery", faction = "Horde" },
          text = "The Monastery's leaders are dead, and my deathguards report Scarlet patrols on the north road wandering without orders. That is your doing, I'm told, and it is good work." },
      },
      choices = {
        { text = "You think I still serve the Crusade, Executor.", next = "prej_zygand", when = { prejudiced = true } },
        { text = "What use does the Deathguard have for a priest, Executor?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Will the Deathguard fight beside the elements, Executor?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is there work here for a druid, Executor?", next = "druid_q", when = { class = "DRUID" } },
        { text = "The Scarlet Crusade seem to hate us above all others.", next = "crusade" },
        { text = "I can hold a line, Executor. Put me on yours.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I can reach their camps unseen, Executor.", next = "rogue", when = { class = "ROGUE" } },
        { text = "I carry the Light, Executor. That must trouble you.", next = "paladin", when = { race = "Scourge", class = "PALADIN" } },
        { text = "My spells are at the Deathguard's service.", next = "mage", when = { class = "MAGE" } },
        { text = "Let my demons loose on the Crusade, Executor. They're hungry.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Shall I track the Crusade's scouts through the woods, Executor?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "I've been through the Scarlet Monastery, Executor.", next = "xcl_sm", when = { cleared = "Scarlet Monastery", faction = "Horde" } },
        { text = "I marched with the Crusade once, Executor, before I died.", next = "xorig_scarlet", when = { origin = "forsaken_scarlet_turned" } },
        { text = "The night elves fought the Legion too, Executor.", next = "ne_zygand" },
        { text = "What do you make of humans, Executor?", next = "hu_zygand" },
        { text = "For the Dark Lady.", next = "END", fx = { affinity = 1, standing = { brill = 1 } } },
        { text = "Do the Deathguard trust the Horde, Executor?", next = "op_horde" },
      },
      again = {
        { id = "h_again", text = "Something further? Be brief; the Crusade is not." },
        { id = "h_again2", text = "Go on. I can spare a moment between reports." },
      },
    },
    xorig_scarlet = {
      lines = {
        { id = "xsc_default", text = "So did a few of my Deathguard, though they keep quiet about it. You know how the Crusade thinks, which makes you useful to me, and you know their faces, which may make you slow. Will you hesitate when it's someone you knew?" },
      },
      choices = {
        { text = "No. They chose the fire, and I'll give it back to them.", next = "BACK", reply = "Good. That's the only answer that keeps a Deathguard alive in these woods.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "I'll spare the ones who lay down their arms.", next = "BACK", reply = "Mercy, is it? The Crusade has never once laid down its arms in my sight, so I'll trust you to know the difference when it happens.", fx = { align = { light = 1 } } },
        { text = "I don't know yet, Executor.", next = "BACK" },
      },
    },
    warrior = {
      big = true,
      lines = {
        { id = "wa_default", text = "Every line Lordaeron held broke in the end, and its dead woke on the wrong side of them. The Deathguard is the line now, and it doesn't break, because there's nothing left in us that the Scourge can frighten." },
        { id = "wa_soldier", when = { origin = "forsaken_lordaeron_soldier" },
          text = "Lordaeron's army, then. Some of the Crusaders in those fields wore the same tabard you did, and they'll call you traitor before they swing. Answer them with steel, not words." },
      },
      choices = {
        { text = "Then I'll stand with the Deathguard, to the end.", next = "BACK", reply = "Then welcome to the line, and may it hold as long as you do.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I'll fight the Crusade my way, not in your ranks.", next = "BACK", reply = "Your way, then, so long as your way leaves Crusaders dead. I'll not have you getting in my soldiers' way.", fx = { align = { order = -1 } } },
      },
    },
    rogue = {
      lines = {
        { id = "ro_default", text = "Unseen is good, and dead is better. The Crusade's officers sleep in the farmhouse at Solliden; their sentries don't, so learn which windows they don't watch, and bring me their orders as well as their throats." },
        { id = "ro_deathstalker", when = { origin = "forsaken_deathstalker_recruit" },
          text = "A deathstalker. Then you answer to the Dark Lady's own, and I'll not presume to give you orders. Tell your masters the Crusade's runners use the mill road, and they're careless at dusk." },
      },
      choices = { { text = "Their orders, and their throats. Understood, Executor.", next = "BACK", fx = { affinity = 2, trait = { stern = 1 } } } },
    },
    paladin = {
      big = true,
      lines = { { id = "pa_default", text = "Trouble me? Every Crusader I've killed was glowing with that same light when he came at us. I'll judge you by where you point it, and I'll be watching, because I've yet to meet a paladin who didn't think the Light gave him the right to judge me." } },
      choices = {
        { text = "I'll point it at the Crusade, and gladly.", next = "BACK", reply = "Good. Then we'll have no trouble, you and I.", fx = { affinity = 2, align = { light = -1 } } },
        { text = "The Light isn't theirs. I'll show them mercy where I can.", next = "BACK", reply = "Mercy is a luxury the Crusade never offered us. Spare whom you like, but I'll be watching where that Light goes.", fx = { affinity = -1, align = { light = 1 } } },
      },
    },
    mage = {
      lines = {
        { id = "ma_default", text = "Good. Fire is the one thing the Crusade respects, since it's the one thing they like to use on us. Burn their fields before they burn ours, and don't waste it on the rattlecages; they don't feel it." },
        { id = "ma_dalaran", when = { origin = "forsaken_dalaran_apprentice" },
          text = "Dalaran-trained, and now on our side of the wall. Bethor Iceshard in the Undercity would want to know you; he was Kirin Tor too, before." },
      },
      choices = { { text = "Their fields, then, not ours.", next = "BACK", fx = { affinity = 2 } } },
    },
    ne_zygand = {
      lines = {
        { id = "ne_default", text = "Once, ten thousand years ago, and then they sat in their forests and told no one what was still out there. The Scourge was the Legion's plague, and Lordaeron burned while the kaldorei slept under their trees, so you'll forgive me if I light no candles for their sacrifice at Hyjal.",
          fx = { hear = "zygand_kaldorei_silence" } },
        { id = "ne_tauren", when = { race = "Tauren" },
          text = "Your Arch Druid's teachers, yes, and I'm sure they were very wise about it. They fought the Legion ten thousand years ago and then hid in their forests and told no one, and the Scourge, the Legion's own plague, came to Lordaeron while they slept under their trees.",
          fx = { hear = "zygand_kaldorei_silence" } },
      },
      choices = {
        { text = "They didn't even know Lordaeron existed, Executor.", next = "ne_zygand_knew" },
        { text = "Hindsight is cheap. They bled at Hyjal for everyone.", next = "BACK",
          reply = "They bled at Hyjal for their tree, and the rest of the world happened to be standing behind it. I'll grant you they bled, though, and the Deathguard respects anyone who holds a line.",
          fx = { align = { light = 1 }, opinion = { night_elves = "respect" } } },
        { text = "Then they share the blame for Lordaeron.", next = "BACK",
          reply = "They do, in my ledger, and the Dark Lady keeps a longer one than mine. Remember that if a Sentinel ever tells you how much the kaldorei have suffered.",
          fx = { affinity = 1, align = { light = -1 }, opinion = { night_elves = "hate" } } },
        { text = "Something else, Executor.", next = "BACK" },
      },
    },
    ne_zygand_knew = {
      lines = {
        { id = "nk_default", text = "Perhaps not, and perhaps a prophet did come to King Terenas and tell him to flee west, and the king had him turned out of court. I know that story as well as you do, and I also know where I was standing when the plague came to Brill." },
      },
      choices = {
        { text = "Blame the Lich King, Executor, and leave the elves be.", next = "BACK",
          reply = "The Lich King has my blade already, and he'll have it to the end. You're right that I've only so much hatred to spend, and I'd be a fool to waste it on a forest.",
          fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Blame them all. The living owe us for Lordaeron.", next = "BACK",
          reply = "They do, every one of them, and don't let anyone tell you the dead have short memories. We have nothing else left to keep.",
          fx = { align = { honor = -1 }, opinion = { night_elves = "distrust" } } },
        { text = "Something else, Executor.", next = "BACK" },
      },
    },
    crusade = {
      big = true,
      lines = {
        { id = "c_default", text = "They're the living who survived the plague and learned only hatred from it. They call us abominations and burn whatever they can't understand, and they mistake cruelty for purity." },
      },
      choices = {
        { text = "Then we'll end them.", next = "BACK", fx = { affinity = 2, trait = { stern = 1 }, learn = { "scarlet_crusade" } } },
        { text = "Do you ever recognize faces among the Crusaders?", tag = "Persuade", next = "faces",
          check = { pass = { any = { { disposition = { min = 65 } }, { race = "Scourge" }, { questDone = TODO_QUEST("At War With The Scarlet Crusade") } } } },
          fail = { next = "faces_no", fx = { affinity = -1 } } },
      },
    },
    faces = {
      lines = {
        { id = "fc_default", text = "Once. A young Crusader on the mill road, with the look of a family that farmed near Brill before the plague; I may have known his father. I cut him down without slowing, and I still can't tell whether that was the Dark Lady's freedom in me or something the Scourge left behind." },
        { id = "fc_forsaken", when = { race = "Scourge" },
          text = "You're one of us, so you know the question already. Yes. Some of them were born in these villages, and some of us buried their parents. I don't hesitate, and I keep count, and some nights the counting is the only thing that keeps the faces away." },
      },
      choices = {
        { text = "You did your duty.", next = "BACK", fx = { affinity = 1 } },
        { text = "That wasn't the Scourge in you.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    faces_no = {
      lines = {
        { id = "fn_default", text = "I recognize the enemy, and that is all I need to recognize." },
        { id = "fn_living", text = "Sentiment belongs to the living. Ask me something useful, or let me work." },
      },
      choices = { { text = "As you say, Executor.", next = "BACK" } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "The Deathguard will fight beside anything that kills Crusaders, and lightning kills them well enough. Only keep your spirits clear of my lines, because my soldiers have had their fill of voices in their heads." } },
      choices = {
        { text = "I'll fight inside your lines and keep to your orders.", next = "BACK", reply = "Then you'll be welcome among my soldiers, shaman. Order is what keeps them from becoming Scourge again.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The elements don't take orders, Executor, and neither do I.", next = "BACK", reply = "Then keep yourself and your spirits well clear of my lines, because I'll not have my soldiers frightened by anything except me.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "There's work for anyone who can stand the smell of the glades. The Crusade camps among the trees at Solliden and along the monastery road, and a bear loose in their camp at night would do more than a dozen of my soldiers at the gate." } },
      choices = {
        { text = "I'll go in at night, as you say, and break their camp.", next = "BACK", reply = "Good. I'll want a report from you by morning, and I'll want their camp in pieces.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll fight them in daylight, where they can see me coming.", next = "BACK", reply = "Brave, and foolish, but I've seen worse plans. If you fall, I'll make sure the Crusade doesn't keep your body.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Then loose them on the Crusade and keep them on a short leash, because the zealots already call us demons and I won't have you proving them right in front of my soldiers. Rupert Boch in the Gallows' End tells me most of his students survive their lessons, and in Tirisfal I'll take most." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "You died a subject of Lordaeron and came back binding demons, which is a stranger road than most of us walked. The Dark Lady has a use for it, so point your imp at Solliden and let the Crusade learn what their sermons are worth." },
        { id = "xwarlock_orc", when = { race = "Orc" }, text = "An orc warlock in Tirisfal, a long way from the Warchief's frown. The Dark Lady judges by results and so do I, so bring me burned Crusader camps and I'll not ask what did the burning." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "Then loose them on the Crusade, and keep that one on a shorter leash than it's on now, because my soldiers are watching it instead of the road. The zealots already call us demons and I won't have you proving them right, so walk it out past the gate and point it west." },
      },
      choices = {
        { text = "I'll loose the imp on their camps while they sleep.", next = "BACK", reply = "Excellent. Let them wake to fire and screaming, and let them wonder whose demon it was.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll face the Crusade myself and keep my demon on its chain.", next = "BACK", reply = "A sensible choice, and I'll respect it. Just make sure the imp doesn't chew through the leash when you're not looking.", fx = { align = { honor = 1 } } },
        { text = "Who are the Scarlet Crusade, exactly?", next = "crusade" },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "The Deathguard isn't accustomed to thanks, least of all from those passing through. I'll accept it on behalf of my soldiers, since they earned it in the fields." },
        { id = "s2", text = "You notice the work, which is more than the magistrate does. That's well said, and I'll remember who said it." },
      },
      fail = {
        { id = "f1", text = "I've no use for compliments, and less for those who think I can be bought with them. If you've a report, give it, and if you haven't, the road is behind you." },
        { id = "f2", text = "Flattery is how spies begin, and I've hanged enough Scarlet spies to know the tune. Speak plainly in Brill, or don't speak to me." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "You've a bold mouth for someone standing in a town full of my soldiers. I'd rather have that than the cringing sort, so I'll let it stand this once." },
        { id = "s2", text = "The last one who spoke to me that way was a sergeant I served under in life, and he was usually right. You've nerve, and Tirisfal needs nerve." },
      },
      fail = {
        { id = "f1", text = "I've put down Crusaders who showed me more respect while they were dying. Watch your tongue, or I'll find you a post at the Scarlet lines where you can exercise it." },
        { id = "f2", text = "Mock the Deathguard again and you'll discover how little humour the dead have left. Mine went into the grave with me, and it stayed there." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "You carry yourself like someone who has killed and expects to again. I respect that more than I respect manners, so you have my attention." },
        { id = "s2", text = "There are few who'd try to stare down an Executor at his own post, and you didn't flinch doing it. Very well; I'll be straight with you, and quick." },
      },
      fail = {
        { id = "f1", text = "The Lich King himself had his hand around my mind, and you believe a scowl will move me. Stand down, before I have you put in the cellar with the Scarlet prisoners." },
        { id = "f2", text = "You threaten a commander of the Deathguard in front of his own garrison, which is a poor grasp of tactics. Do it again and I'll treat it as an attack." },
      },
    },
  },
  confides = {
    { id = "cnf_1", text = "The Scarlet patrols change shift at the old bridge west of Brill at dusk, and for a short while nobody is watching the road." },
    { id = "cnf_2", text = "Two Forsaken went back to the Monastery this season hoping to be forgiven, and the Crusade burned them and sent their ashes to Brill as a message." },
    { id = "cnf_3", text = "Magistrate Sevren keeps a second ledger of the town's stores, and it never matches the one he sends to the Undercity." },
  },
  blurts = {
    { id = "bl1", text = "Devlin Agamand still walks the Agamand Mills with what's left of his family, mindless and dangerous. Put them down for good, and the farms around the mills might be safe again." },
    { id = "bl2", text = "The Crusade's patrols come down from the monastery road in the evening, and they hunt in small packs. Never assume you've seen the last of one." },
    { id = "bl3", text = "The Undercity sends me more orders than soldiers, and the court argues while Brill bleeds. Don't repeat that where the Dark Lady's people can hear it." },
  },
  topics = {
    regard = {
      { id = "rg_1", text = "I think you're useful, and you've proven it more than once in Tirisfal. I don't say that to many, so take it for what it's worth." },
      { id = "rg_earned", when = { fondness = "earned" }, text = "You've killed Scarlets for me without being asked twice and without asking for thanks. That puts you ahead of half the Deathguard I command." },
      { id = "rg_tone", when = { fondness = "tone" }, text = "You speak plainly and you don't waste my time with flattery. I've no patience left for anything else, and you seem to understand that." },
      { id = "rg_al_order", when = { alignment = { axis = "order", min = 30 } }, text = "You follow orders and you finish the work, which is the whole of a soldier's worth. I'd put you on the walls of Brill tomorrow." },
      { id = "rg_al_chaos", when = { alignment = { axis = "order", max = -30 } }, text = "You answer to nobody, and that would worry me in a soldier. In you it hasn't yet cost me anything, so I'll keep watching rather than judging." },
    },
    confide = {
      { id = "cf_1", text = "The Deathguard I command are fewer than the court believes, and the court believes what I tell it. If the Crusade ever learned the true count, they'd march on Brill the next morning." },
      { id = "cf_2", text = "I served in Lordaeron's army before the plague, and I was a sergeant, not an officer. The Dark Lady made me an Executor because I was still standing when the officers were not." },
    },
    trust = {
      { id = "tr_1", text = "Trust the Deathguard on the walls, because they've nothing left to lose and nowhere else to be. Trust the magistrate with the town's records and with nothing that has a blade." },
      { id = "tr_2", text = "Trust nobody who comes down the monastery road claiming to have left the Crusade. I've caught four Scarlet spies this season, and every one of them had a good story." },
    },
    watchout = {
      { id = "wo_1", text = "Watch the road past Agamand Mills at dusk, where the Crusade's patrols come down in small packs. Never assume you've seen the last of them." },
      { id = "wo_2", text = "Watch for Maggot Eye's lot near Garren's Haunt, gnolls with more spite than sense. They've killed better fighters than they had any right to." },
      { id = "wo_3", text = "Watch the lake shore north of Brill, where the murlocs come up after dark. They don't care what side you're on, only whether you can run." },
    },
    worries = {
      { id = "wy_1", text = "That the court will send me another letter full of orders and no soldiers, and that I'll lose Brill while I'm reading it. That's the only worry I allow myself." },
      { id = "wy_2", text = "The faces of the Crusaders I've cut down, some of whom I'd have known in life. I keep count so I don't have to look at them, and some nights the count isn't enough." },
    },
    hopes = {
      { id = "hp_1", text = "I hope to see the Scarlet Monastery empty and its banners burned in the yard. After that, I'll find out whether I'm good for anything besides this." },
      { id = "hp_2", text = "I hope the Dark Lady turns east one day with every soldier she has, and that Brill can spare me when she does." },
    },
    favor = {
      { id = "fv_1", text = "Kill Scarlets, and bring me what they carry, especially their orders. A dead zealot is worth something to me, but his letters are worth a great deal more." },
      { id = "fv_2", text = "If you hear the Deathguard grumbling about their posts, tell me before it turns into something worse. I'd rather hear it from you than from the Undercity." },
    },
    friendship = {
      { id = "fr_1", text = "I don't keep friends, because I lose them too easily out here. If I did, you'd be one, and that's as far as I'll go." },
      { id = "fr_earned", when = { fondness = { best = "earned" } }, text = "You've stood on my walls and bled for this town. In the Deathguard that makes you a comrade, and a comrade is worth more to me than any friend." },
      { id = "fr_al_order", when = { alignment = { axis = "order", min = 30 } }, text = "You keep your word and you hold the line, and I can count on you when it matters. Yes, I'd call you a friend, and I'd let the Deathguard hear me say it." },
    },
    never_told = {
      { id = "nt_1", text = "When I first woke as Forsaken, I walked to my old house in Brill before I reported to anyone. There was a Scarlet family living in it, and I left them there, and I never told the Dark Lady." },
      { id = "nt_2", text = "I'm not sure the freedom the Dark Lady gave us reached all of me. Some days I kill too easily, and I can't tell whether that's me or what the Scourge left behind." },
    },
    grievance = {
      { id = "gv1", text = "You've been more trouble in Tirisfal than you've been worth, and I keep careful count of both. That is my problem with you." },
      { id = "gv_prej", when = { grudge = "prejudice" }, text = "You wore the Crusade's red before you died, and I've hanged scouts who stood exactly the way you're standing now. Give me a reason to stop watching you." },
      { id = "gv_town", when = { grudge = "town" }, text = "Brill's Deathguard report everything to me, and your name keeps turning up in those reports. None of the mentions are flattering." },
      { id = "gv_enemy", when = { grudge = "enemy" }, text = "You're Alliance, in the heart of the Dark Lady's lands, and you expect me to answer you civilly. Count yourself lucky I'm answering at all." },
    },
    amends = {
      { id = "am1", text = "Kill Scarlets for the Deathguard and bring me proof of it. The Dark Lady's enemies are the only currency I accept." },
      { id = "am_prej", when = { grudge = "prejudice" }, text = "Spill enough Scarlet blood that nobody could mistake you for one of theirs. Then we'll talk about trust." },
    },
    spite = {
      { id = "sp1", text = "I think you're a liability walking about in good armor. If the Crusade takes you, I'll not waste a single Deathguard getting you back." },
      { id = "sp_prej", when = { grudge = "prejudice" }, text = "I think you never stopped being Scarlet, and one day you'll prove it. When you do, I'll be the one holding the rope." },
    },
    humans = { { id = "tp_humans", text = "The Scarlet Crusade calls itself the last pure men of Lordaeron, and the rest of humanity simply wants us burned by somebody else. I keep the Deathguard on the walls, and I don't take prisoners for conversation." } },
    knows = {
      { id = "tp_knows", text = "Reports reach me from every field and road in Tirisfal. Ask what you need, and keep it brief." },
      { id = "tp_knows_warm", when = { disposition = { min = 65 } }, text = "You've served Brill well, so I'll tell you what the reports actually say, rather than what we announce." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I'll answer, because the Dark Lady expects it of me. Do not mistake that for a welcome." },
    },
    scarlet_crusade = { { id = "tp_crusade", text = "Every Crusader we kill is one fewer torch at our door. I keep count." } },
    scourge = {
      { id = "tp_scourge", text = "The Scourge does not tire and does not despair, and neither does the Deathguard, which is the only reason we can hold this land. Every mindless corpse we put down in Tirisfal was a neighbor of ours once, and we remember that while we do it." },
      { id = "tp_scourge2", when = { race = "Scourge" }, text = "You wore their chains for a time, as we all did. Use that, because you know how they move, and they no longer know how you do." },
    },
    forsaken = { { id = "tp_forsaken", text = "We are the Dark Lady's people, freed from the Lich King's will and owing nothing to anyone else. The living call us monsters, and some of us have earned the name, and I don't lose sleep over either part, since I don't sleep." } },
    sylvanas = {
      { id = "tp_sylvanas", text = "The Dark Lady broke the Lich King's hold on us and gave us a city and a purpose, and she asks only loyalty in return. I give it to her without reservation." },
      { id = "tp_sylvanas2", when = { disposition = { min = 65 } }, text = "She is harder than any commander I served in life, and I've known a few cruel ones, but she has never once wasted the lives of her soldiers. That counts for a great deal with me." },
    },
    thrall = {
      { id = "tp_thrall", text = "The Warchief offered the Forsaken a place in his Horde when no one else would have us at their table. I respect the bargain, and I'll keep my side of it, whatever the orcs think of our smell." },
      { id = "tp_thrall2", when = { faction = "Horde" }, text = "Your Warchief's people fight well beside mine, though they make the sign of their spirits when they think we aren't looking. Tell him the Deathguard keeps its word." },
    },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad was a man of Dalaran who sold his own kingdom to the Scourge, and now he rules it from a floating necropolis over the east. When the Dark Lady turns her armies there, I mean to be at the front." } },
    arthas = { { id = "tp_arthas", text = "He is the prince who murdered his own father and gave Lordaeron to the plague. Every Forsaken in Tirisfal has a reason to want him dead, and the Dark Lady has more reasons than any of us." } },
    lordaeron = { { id = "tp_lordaeron", text = "The kingdom died, and its capital is a ruin above our heads. What lives beneath that ruin now belongs to the Dark Lady, and we will not hand it back to anyone." } },
    argent_dawn = { { id = "tp_argent_dawn", text = "The Argent Dawn fights the Scourge in the east and asks fewer questions about our flesh than I expected. I don't trust them, but I don't need to, as long as they keep killing the same enemy." } },
    stratholme = { { id = "tp_stratholme", text = "Stratholme is where the prince put his own people to the sword, and the Scourge holds the city still. The Crusade squabbles with the dead for its streets, which suits me, since each zealot who dies there is one I won't meet in Tirisfal." } },
    _none = { { id = "tp_none", text = "Ask the magistrate; administration is his burden, not mine." } },
    _gated = {
      { id = "gt1", text = "That stays within the Deathguard, and you haven't earned a place in its confidence. Serve Brill a while longer before you ask me again." },
      { id = "gt2", text = "I don't discuss that with those I haven't measured yet. You'll have to do more than walk into town before I tell you." },
    },
  },
}

P:NPC {
  key = "sevren", id = TODO_NPC("Magistrate Sevren"), name = "Magistrate Sevren",
  bible = "bibles/tirisfal.md", role = "noble", tier = "quest",
  communities = { "brill" }, temper = { "brisk" }, values = { "orderly", "proud" },
  notices = { "status" },
  impression = {
    first = "He is quietly proud of what Brill has become.",
    third = "{name} met Magistrate Sevren of Brill, who rebuilt the town one street at a time and keeps it running by the book.",
  },

  greetings = {
    { id = "g_hall", text = "Ah, you. There's work, and it's important, and it needs doing more than it needs discussing." },
    { id = "g_back", when = { metBefore = true }, text = "Back in the town hall? Excellent, because I've more for you." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and the work has piled up on my desk in the meantime. I'm glad you're back, since I'd rather you did it than discussed it." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The town has been telling me about the work you've done for Brill. It was a plague town once, and people like you are why it isn't now." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I hear one of your stories was found out in Brill. I keep a tidy town, so keep your lies tidy too, or better yet, keep them elsewhere." },
  },

  notice = {
    { id = "n_living", cat = "status", when = { faction = "Horde", race = { "Orc", "Troll", "Tauren" } },
      text = "A living face in my hall! The Warchief's allies are welcome in Brill, but do keep your breathing quiet." },
  },

  start = "hello",
  nodes = {
    dd_war = {
      lines = { { id = "dd_war_default", text = "Brill will feel it in the ledgers before it feels it anywhere else: fewer burned wagons on the Undercity road, fewer Deathguard to replace. The Crusade breeds faster than we fall, though, so don't expect a parade." } },
      choices = {
        { text = "Every Scarlet I kill is a debt paid. I want nothing for it.", next = "BACK", reply = "A rare sentiment, and an inexpensive one, which I appreciate. Go and pay a few more debts, then.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Next time I'll want more than a line in your ledger.", next = "BACK", reply = "Everyone does, eventually. Bring me a captain's head and we'll discuss what the town can afford, which is very little.", fx = { align = { honor = -1 } } },
        { text = "Something else, Magistrate.", next = "BACK" },
      },
    },

    op_humans = {
      big = true,
      lines = {
        { id = "ophu_default", text = "Brill was a human town before it was ours, and some of my clerks still set a place at table for neighbours who are never coming home. So tell me plainly, do you think the living ever belonged here more than we do?" },
      },
      choices = {
        { text = "The living built Brill. We should remember them kindly.", next = "op_humans_r1", fx = { align = { light = 1 }, opinion = { humans = "kin" } } },
        { text = "The living had their turn. Brill is ours now.", next = "op_humans_r2", fx = { affinity = 1, align = { light = -1 }, opinion = { humans = "rivals" } } },
        { text = "I was one of them. I still don't know what I am.", next = "op_humans_r3", fx = { trait = { kind = 1 }, opinion = { humans = "mixed" } }, when = { race = "Scourge" } },
        { text = "I'd rather not say, Magistrate.", next = "BACK" },
      },
    },
    op_humans_r1 = {
      lines = { { id = "ophu_r1", text = "Kindly, yes, and in the town ledgers, where I've kept every one of their names. Remembering is cheap, and forgetting costs more than people think." } },
      choices = { { text = "Something else, Magistrate.", next = "BACK" } },
    },
    op_humans_r2 = {
      lines = { { id = "ophu_r2", text = "I'd not put it so bluntly in front of Innkeeper Renee, but the deed to the town hall does carry my seal now, and not theirs." } },
      choices = { { text = "Something else, Magistrate.", next = "BACK" } },
    },
    op_humans_r3 = {
      lines = { { id = "ophu_r3", text = "Few of us do, and I've stopped asking it of my clerks, because the answers slow the paperwork. You're a citizen of Brill, and for now that will have to serve." } },
      choices = { { text = "Something else, Magistrate.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Brill has a place for anyone who's useful to it, and you'd be very useful against the Crusade's patrols, since they'll hesitate before striking at the Light. Just remember the town belongs to the Dark Lady, and the Light is a guest in it, however long it stays." } },
      choices = {
        { text = "I serve Brill and the Dark Lady. The Light serves with me.", next = "BACK", reply = "Good. Keep that order straight in your head and we'll get along nicely.", fx = { align = { order = 1 } } },
        { text = "The Light is no one's guest. It goes where it wills.", next = "BACK", reply = "Then I hope it wills to stay in Brill, paladin, because I've already written you into the accounts.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "We cleared the mindless out of it in the first week and stacked the pews against the windows, and it has been a storehouse ever since. Some of the townsfolk would like it blessed again, though none of them can agree on by whom, and I would rather keep the peace than settle that argument." } },
      choices = {
        { text = "Brill deserves a place to grieve, Magistrate. Give them the chapel back.", next = "BACK", reply = "I'd like to, and the paperwork alone would take me a month. Find me three townsfolk who agree on a blessing, and I'll see what can be done.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A storehouse feeds people. Leave the pews against the windows.", next = "BACK", reply = "A practical answer, and the one I gave the council. The grief can find another room; the grain can't.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The Darkhounds trouble the farms and the duskbats trouble everyone, though the gnolls at the graveyard trouble me most of all. Thin any of them and I'll note it in the town's accounts, which is more thanks than most people get from me." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The Darkhounds trouble our outlying farms, and if your {pet} could thin them out, I'd note it in the town's accounts. Do keep it on the far side of the ledgers, please." },
      },
      choices = {
        { text = "Then note it. Brill should know who keeps its roads.", next = "BACK", reply = "I shall, and I'll write it neatly, so the Undercity can read it. That's more than most heroes get.", fx = { align = { order = 1 } } },
        { text = "Keep your ledger, Magistrate. I hunt for my own reasons.", next = "BACK", reply = "Hunt for whatever reasons you like, so long as the duskbats end up dead. I'll write your name down regardless.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "o_hdwary", tags = { "news" }, when = { gossip = { topic = "horde", stance = "wary" } }, text = "Executor Zygand tells me you think the Horde will drop us once the Scourge is beaten. I've filed that under 'probably', which is where I keep most things." },
        { id = "h_default", key = true,
          text = "You're speaking to Magistrate Sevren. When we took Brill back it was a plague town full of the mindless; now it's a Forsaken town, and that's my doing." },
        { id = "h_grave", tags = { "news" }, when = { questActive = TODO_QUEST("Graverobbers") },
          text = "Gnolls are digging up our graveyard, and our dead are not their supper. Put a stop to it." },
        { id = "h_lich", when = { questActive = TODO_QUEST("The Prodigal Lich") },
          text = "Bethor Iceshard in the Undercity has asked after a lich who wears an old friend's name. Take him what we've learned." },
        { id = "h_ring", when = { questActive = TODO_QUEST("The Engraved Ring") },
          text = "Here's a ring with an engraving, and someone in this town knows whose it is. Find out who." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman in my town hall? Do mind the papers, because I've no wish to learn what lightning does to a ledger." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, is it? Brill had a grove once, before the plague, and I've the deeds to it somewhere, though I wouldn't call it a grove now." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, in my town hall. Do keep your beast off the rugs, {class}; they're the last good ones in Brill." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest in my town hall. Brill had a chapel once, before the plague, and I've not yet decided what it ought to be now, so perhaps you have an opinion." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin of the Forsaken, in my town. The last Light Brill saw was the Crusade's torches on the road from the monastery, so you'll forgive the townsfolk if they look at you twice." },
        { id = "h_dd_war", tags = { "news" }, when = { questDone = TODO_QUEST("At War With The Scarlet Crusade") },
          text = "Executor Zygand's report crossed my desk with your name beside a tally of dead Scarlets. I filed it twice, because good news is rare enough in Brill to keep a spare copy." },
        { id = "h_dd_maggot", when = { questDone = TODO_QUEST("Wanted: Maggot Eye") },
          text = "Maggot Eye's paw hangs by the Executor's door, I'm told, and the gnolls have kept well clear of our graveyard since. You've done more for Brill's dead than the Church ever managed." },
      },
      choices = {
        { text = "What became of Brill's old chapel, Magistrate?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Brill could use a shaman's totems, Magistrate. Where shall I plant them?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What happened to Brill's grove, Magistrate?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Brill needs a sword more than a magistrate, Sevren.", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Taking Brill can't have been easy.", next = "brill" },
        { text = "I lived near Brill, before.", next = "farmer", when = { race = "Scourge" } },
        { text = "Does Brill need the help of someone like me, Magistrate?", next = "warlock", when = { class = "WARLOCK" } },
        { text = "Who keeps Brill's secrets, Magistrate?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Does Brill have any use for a mage, Magistrate?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "I'd guess the beasts around Brill trouble the town, Magistrate.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Brill may have no place for a paladin, Magistrate.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll see to it.", next = "END", fx = { affinity = 1, standing = { brill = 1 } } },
        { text = "Do you miss the living who kept Brill, Magistrate?", next = "op_humans" },
        { text = "Will Brill feel the Scarlets I killed for Zygand?", next = "dd_war", when = { questDone = TODO_QUEST("At War With The Scarlet Crusade") } },
      },
      again = {
        { id = "h_again", text = "Something else? Quickly, please; the ledgers won't balance themselves, and the dead are terrible about paying their rates." },
      },
    },
    farmer = {
      lines = {
        { id = "fa_default", text = "Didn't we all, more or less. I keep a list of the old families, you know, for the records. If your name's on it, I'll strike the 'deceased', which is about all the dignity the town hall can offer." },
        { id = "fa_brill", when = { origin = "forsaken_brill_farmer" },
          text = "A farmer, from the fields south of here? Then your land is likely in my ledger as abandoned, and I'm afraid the Deathguard grows nightshade on it now. You're welcome to visit it, though I wouldn't expect to be recognized." },
      },
      choices = {
        { text = "Strike it from the record. I'm alive enough.", next = "BACK", fx = { affinity = 2 } },
        { text = "Leave the record be. That person died.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    warlock = {
      lines = { { id = "wl_default", text = "Brill needs everyone's help, and a warlock's imp is at least cheaper than a peon. Only keep your demons out of the town hall; the last one set fire to a filing cabinet, and I had those records arranged." } },
      choices = { { text = "No demons in the town hall. Your records are safe.", next = "BACK", fx = { affinity = 1 } } },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "Perhaps it does, {class}, but a sword with no ledger behind it is just a brigand with ambitions. Hold the road to the Bulwark and I'll see your name written somewhere that matters." } },
      choices = {
        { text = "Then write my name down. I'll hold the road.", next = "BACK", reply = "Then consider it written, {class}, and I'll see it read in the Undercity.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Keep your ledgers. I fight for the Forsaken, not for paper.", next = "BACK", reply = "Paper keeps soldiers fed, {class}, whether you like it or not. Hold the road all the same, and I'll write you down anyway.", fx = { align = { order = -1 } } },
      },
    },
    brill = {
      lines = { { id = "b_default", text = "One street at a time. The Deathguard cleared it, and I counted what was left and put it to work, because a town needs both sorts." } },
      choices = { { text = "Impressive.", next = "BACK", fx = { affinity = 2 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Outside the town limits, if you please, and well clear of the graveyard. I've spent two years teaching Brill to look like a town again, and a ring of totems by the well makes it look like a war camp." } },
      choices = {
        { text = "Outside the limits, then. Brill's order comes first.", next = "BACK", reply = "Thank you, and do tell the next shaman who comes through. I've had to pull up three totems this month.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Brill is a war camp, Magistrate, whatever your ledgers say.", next = "BACK", reply = "It's both, and I'd rather it looked like a town. Humour an old magistrate, and keep your totems outside the limits.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "The same thing that happened to everything else, I'm afraid: the plague got into the roots, and the trees came up grey. The Deathguard cut half of it for palisades and the apothecaries asked for the rest, so the deeds are worth rather less than the paper." } },
      choices = {
        { text = "Let me tend what's left. Something may still grow there.", next = "BACK", reply = "Tend it, then, with my blessing, though I'll warn you the deed's a mess. If anything green comes up, I'll put it in the accounts.", fx = { align = { light = 1 } } },
        { text = "The palisades were the better use. The town comes first.", next = "BACK", reply = "It was, and I'm glad someone sees it that way. Trees are lovely, but palisades keep the Scourge out.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "I keep most of them, because a magistrate who doesn't know what his town is whispering won't be magistrate for long. Marion Call trains your sort in the Gallows' End, and she tells me when something matters, which is more than the deathstalkers ever do." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "I dealt with cutpurses when Brill still had a harvest fair, and I'll tell you plainly that the Dark Lady's laws are no softer than the king's were. Keep your fingers out of Brill's pockets and in the Crusade's, and we'll get along." },
      },
      choices = {
        { text = "I'll keep my hands to myself in Brill, Magistrate.", next = "BACK", reply = "Splendid, and I'll be sure to mention it to Marion. She'll be very surprised.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Laws are for those too slow to avoid them.", next = "BACK", reply = "Then let's hope you're never slow, rogue, because the gallows are not.", fx = { align = { order = -1 } } },
        { text = "Brill must have been hard to take back.", next = "brill" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Brill has a use for anyone who can keep the lamps lit without setting the thatch alight, which is harder than it sounds with Crusade arrows coming over the fields. Cain Firesong teaches in the inn, and I'll thank you to practise anywhere but my square." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "Dalaran sent apprentices out to test the grain when the plague first came, and a good many of them died on these farms beside the people they meant to help. If you were one of them, you've earned your place in Brill twice over." },
      },
      choices = {
        { text = "I'll keep my spells off your square, Magistrate.", next = "BACK", reply = "Splendid. My thatch thanks you, and so do I.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll practise where I like, Magistrate.", next = "BACK", reply = "Then you'll practise in front of the Deathguard, and they're not known for their patience. Do keep it modest.", fx = { align = { order = -1 } } },
        { text = "How did you take Brill back, Magistrate?", next = "brill" },
      },
    },
  },

  topics = {
    scarlet_crusade = { { id = "tp_crusade", text = "That's Executor Zygand's department. I sign the orders, and he carries them out with alarming enthusiasm." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken are citizens of a nation now, with laws and a magistrate and all the dull business that keeps a town from falling down. You would be surprised how much of the Dark Lady's war is paperwork." } },
    lordaeron = { { id = "tp_lordaeron", text = "Brill was a market town of Lordaeron, with fairs in the autumn and quarrels over boundary stones. We took it back from the mindless dead, and I mean to make it a proper town again, even if it's a colder one." } },
    scourge = { { id = "tp_scourge", text = "When I came back to Brill, the Scourge's mindless filled every house and the inn, and we cleared them room by room. I keep the ledger of what we lost in my desk, and I don't care to open it often." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady appointed me, and she reads my reports, which is more than any magistrate in Lordaeron could say of King Terenas. I'd rather not disappoint her." } },
    thrall = { { id = "tp_thrall", text = "The orcish Warchief is an ally, by the Dark Lady's arrangement, and his envoys pass through Brill on their way to the zeppelin tower. They're polite enough, and they don't linger." } },
    _none = { { id = "tp_none", text = "That's not a matter for the town hall." } },
  },
}

P:NPC {
  key = "johaan", id = TODO_NPC("Apothecary Johaan"), name = "Apothecary Johaan",
  bible = "bibles/tirisfal.md", role = "scholar", tier = "quest",
  communities = { "brill" }, temper = { "intent" }, values = { "ambitious", "curious" },
  notices = { "craft" },
  impression = {
    first = "His new plague is meant for the Scourge, he says, and quickly.",
    third = "{name} met Apothecary Johaan of the Royal Apothecary Society, who labours over a new plague in Brill.",
  },

  greetings = {
    { id = "g_lab", text = "Careful where you put your hands. Some of these bottles are only mostly safe." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, my helper. Have you brought me something that still twitches?" },
    { id = "g_away", when = { away = 14 }, text = "Ah, my helper, back after {away}! I've been brewing all the while, and I have a great many new things for you to fetch." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown much stronger since I first sent you out for samples, and stronger helpers can bring back far more interesting ones. I'm thrilled." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "Someone in Brill swallowed one of your little tales, I hear. I do admire a good deception, since my whole profession depends on people not asking what's in the bottle." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = { "Alchemy", "Herbalism" } },
      text = "You've a feel for plants and potions. The Society could use people like you, so think on it." },
  },

  start = "hello",
  nodes = {
    dd_doom = {
      lines = { { id = "dd_doom_default", text = "On its own, very little; it is a weed, and a foul one. But it grows thickest where the plague soaked deepest into the soil, and a careful apothecary learns a great deal from what the land remembers." } },
      choices = {
        { text = "So the ground itself still carries the plague.", next = "dd_doom2" },
        { text = "Something else, Apothecary.", next = "BACK" },
      },
    },
    dd_doom2 = {
      lines = { { id = "dd_doom2_default", text = "The ground, the water, the beasts that drink it, yes. The living think the plague ended when Lordaeron fell, and the Society is very happy to let them go on thinking so." } },
      choices = {
        { text = "The Scourge should fear what you're brewing, then.", next = "BACK", reply = "The Scourge, among others. Mind the doom weed on your boots; I'd hate to lose a useful errand-runner.", fx = { align = { light = -1 } } },
        { text = "That sounds like a weapon aimed at more than the Scourge.", next = "BACK", reply = "Every weapon is aimed at more than one thing, {class}. I'd keep that observation out of the tavern, if I were you.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    op_new_plague = {
      big = true,
      lines = {
        { id = "opnp_default", text = "Some do, and they look at my bottles the way they used to look at the grain carts out of Andorhal. You've gathered half my reagents yourself, though, so I'm curious: should the Society be making this plague at all?" },
      },
      choices = {
        { text = "No. We of all people know what a plague does.", next = "op_new_plague_r1", fx = { affinity = -1, align = { light = 1 }, opinion = { new_plague = "wrong" } } },
        { text = "Yes, and faster. Every day we wait, the Scourge grows.", next = "op_new_plague_r2", fx = { affinity = 1, align = { light = -1 }, opinion = { new_plague = "necessary" } } },
        { text = "If it only touches the Scourge, I've no quarrel with it.", next = "op_new_plague_r3", fx = { trait = { cautious = 1 }, opinion = { new_plague = "conditional" } }, when = { race = "Scourge" } },
        { text = "I'll leave that question to the Society.", next = "BACK" },
      },
    },
    op_new_plague_r1 = {
      lines = { { id = "opnp_r1", text = "We do, and that's why we're the only ones who could make it properly. I'll note your concern, and then I'll go on working." } },
      choices = { { text = "Something else, Apothecary.", next = "BACK" } },
    },
    op_new_plague_r2 = {
      lines = { { id = "opnp_r2", text = "Faster, you say, as though the Scourge waited on my kettle! But I'll take the encouragement, since it's rarer than nightshade in Brill." } },
      choices = { { text = "Something else, Apothecary.", next = "BACK" } },
    },
    op_new_plague_r3 = {
      lines = { { id = "opnp_r3", text = "If, yes. Everything in my trade rests on an if, and I'm very good at the ifs, so you may rest easy, or as easy as anyone rests in Brill." } },
      choices = { { text = "Something else, Apothecary.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "It's meant for the Scourge, of course, and the Light hates the Scourge, so I'd think it would be delighted. I wouldn't ask it too closely about anything else the plague might be used for, but that's well above my station." } },
      choices = {
        { text = "If it's meant for anyone else, the Light won't stand for it.", next = "BACK", reply = "Oh, I'm sure it won't, and I'm sure it'll never come to that. I'll make a note to keep the Light well informed.", fx = { align = { light = 1 } } },
        { text = "The Light doesn't need to know everything we do.", next = "BACK", reply = "Precisely, and I'm glad you understand the delicacy of the thing. Discretion is a virtue, even in paladins.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Whether it can be poisoned, quite simply. The Scourge bound our souls once, and if a soul can be poisoned, perhaps it can be protected, which would be worth more than any plague. Bring me your thoughts on it, and perhaps a hair or two, and I'll write your name very small in the margin of my notes." } },
      choices = {
        { text = "A cure for binding souls is worth the work. I'll help.", next = "BACK", reply = "Splendid! I'll put you down as a willing contributor, and do try not to flinch when I take the hair.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Leave my soul out of your bottles, Johaan.", next = "BACK", reply = "As you like, though it's a terrible waste of a perfectly good subject. I'll find another priest with a less precious soul.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Escort my samples, mainly, because the Crusade burns whatever it can't understand, and it understands very little. And if a few of my test subjects should arrive bruised rather than dead, I'd be grateful, since corpses make poor results." } },
      choices = {
        { text = "I'll guard your samples. The Dark Lady needs that plague.", next = "BACK", reply = "Exactly so, and the Dark Lady will be very grateful, though perhaps not in any way you'll hear about.", fx = { align = { order = 1 } } },
        { text = "I won't play nursemaid to bottles, Apothecary.", next = "BACK", reply = "Nursemaid? These bottles are the future of the Forsaken, and they deserve better company than you, clearly.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_johaan = {
      lines = {
        { id = "hu_default", key = true,
          text = "I think they're very fragile, which is useful, and very loud about it, which isn't. I was a human apothecary once in this very town, mixing cough syrups for the Barovs' tenants, and I'm far better at my trade now that I've stopped caring who coughs." },
        { id = "hu_scourge", when = { race = "Scourge" },
          text = "The same thing you think, I imagine, when you see your old village through the trees. I mixed cough syrups for the Barovs' tenants in this very town, and now I study poisons in the same cellar, which has a certain tidiness." },
      },
      choices = {
        { text = "That's cold, even for the Society.", next = "hu_johaan_2" },
        { text = "Do you remember your old patients?", next = "hu_johaan_2" },
        { text = "Something else, Apothecary.", next = "BACK" },
      },
    },
    hu_johaan_2 = {
      big = true,
      lines = {
        { id = "hu2_default",
          text = "I remember every one of them, which is exactly the trouble. The miller's daughter with a fever the week the grain arrived, the plague in the bread, the way they looked at me when my own cures failed; and their kin in Southshore still say the apothecaries brought the sickness, when we only failed to stop it." },
      },
      choices = {
        { text = "They blame you because they can't blame the Lich King. Ignore them.", next = "BACK",
          reply = "I do ignore them, mostly, the way one ignores a draught in a cold room. And the Dark Lady has given us a much better use for our time than their good opinion.",
          fx = { affinity = 1, align = { order = -1 }, opinion = { humans = "rivals" } } },
        { text = "You failed your patients once. Don't make them your subjects now.", next = "BACK",
          reply = "Ah, a conscience, and a sharp one. I'll let it sit in the jar beside the others; I find they keep remarkably well in the dark.",
          fx = { align = { order = 1 }, opinion = { humans = "kin" } } },
        { text = "Something else, Apothecary.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "o_npkeen", tags = { "news" }, when = { opinion = { topic = "new_plague", stance = "necessary" } }, text = "Ah, the one who wants the plague finished yesterday! The Apothecarium has a long memory for its friends, and so do I." },
        { id = "h_default", key = true,
          text = "Apothecary Johaan, of the Royal Apothecary Society. Our work here matters more than you'd guess from the smell." },
        { id = "h_plague", tags = { "news" }, when = { questActive = TODO_QUEST("A New Plague") },
          text = "I'm making a new plague, ours this time, made by our own hands. I need ingredients from the creatures of the glades, so bring them to me." },
        { id = "h_grief", when = { questActive = TODO_QUEST("Fields of Grief") },
          text = "The pumpkins in the old fields grew in plague-soaked earth. That makes them very useful to me." },
        { id = "h_silverpine", when = { questActive = TODO_QUEST("Delivery to Silverpine Forest") },
          text = "This goes to the Society's apothecary at the Sepulcher, and you mustn't drop it. Really, don't drop it." },
        { id = "h_experiment", when = { questActive = TODO_QUEST("Johaan's Experiment") },
          text = "An experiment wants a subject, and the Crusade has kindly provided one. Fetch what I need." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! You speak to the elements, I'm told, and I would dearly like to know whether the elements have opinions about what I keep in these bottles." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, how useful! You'll know your herbs better than any errand-runner, and I do hope you won't trample the doom weed." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! Do stand still, {class}, and keep that blade well away from my bottles, because some of them are only mostly safe." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Splendid, because I have a question about the soul that no apothecary has ever answered to my satisfaction, and you may be just the subject." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin! Do keep your distance from the bench, please, because the Light and my reagents have never been properly introduced, and I'd hate for the first meeting to be in my laboratory." },
        { id = "h_dd_doom", when = { questDone = TODO_QUEST("Doom Weed") },
          text = "Junior Apothecary Holland tells me you gathered doom weed for him. My junior is slow, but he is grateful, and he has stopped pestering me for help, which I count as your doing." },
      },
      choices = {
        { text = "What do you want to know about the soul, Apothecary?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "The earth here is sick, Apothecary. Do your brews make it worse?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "You're growing something strange in these fields, Apothecary.", next = "druid_q", when = { class = "DRUID" } },
        { text = "My hunting takes me into the fields. Do you need samples?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "Who is all this brewing meant for?", next = "purpose" },
        { text = "I knew the Cult's work well. This smells like plague.", next = "warlock", when = { class = "WARLOCK" } },
        { text = "I studied in Dalaran. Can I help with the formulae?", next = "mage", when = { class = "MAGE" } },
        { text = "Could your bottles do a rogue's work, Apothecary?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "A warrior must be of some use to you here, Apothecary.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "I doubt the Light would approve of your brewing, Johaan.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "What does an apothecary think of living humans?", next = "hu_johaan" },
        { text = "I'll gather what you need.", next = "END", fx = { affinity = 1 } },
        { text = "Holland's doom weed. What does the Society want with it?", next = "dd_doom", when = { questDone = TODO_QUEST("Doom Weed") } },
      },
      again = {
        { id = "h_again", text = "Something else? Don't touch the green one while you think." },
      },
    },
    warlock = {
      big = true,
      lines = {
        { id = "wl_default", text = "Do you? Then you'll know this is nothing like theirs, and you'll stop looking at my bottles like that. The Cult made a plague to serve a master, and the Society makes one to destroy him, so the hands and the ends are both different." },
        { id = "wl_cult", when = { origin = "forsaken_cult_remnant" },
          text = "You were one of Kel'Thuzad's faithful, before? Then you've seen the grain wagons and the cauldrons. Help me, and you'll be undoing a little of what you helped do." },
      },
      choices = {
        { text = "Different ends. I'll carry your poison, Apothecary.", next = "BACK", reply = "Splendid. I'll find you something useful to carry, and nothing that leaks, I promise.", fx = { affinity = 2, align = { light = -1 } } },
        { text = "A plague is a plague. I've spread one already. Never again.", next = "BACK", reply = "A plague with a purpose is a cure, my dear warlock, and you'll thank us when it works. I'll find someone else to carry it.", fx = { affinity = -2, align = { light = 1 } } },
      },
    },
    mage = {
      lines = { { id = "ma_default", text = "Formulae? This is alchemy, not your ley lines and incantations, though I'll grant a mage is usually good at measuring things exactly. Fetch the ingredients for now, and if you prove careful, I'll let you read my notes." } },
      choices = { { text = "I'm very careful.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } } },
    },
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "A hunter who brings back what I ask for, intact and unchewed, is worth three of the usual errand-runners. The duskbats and the Darkhound packs both carry things the Royal Apothecaries want catalogued." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "I do, from the duskbats and the Darkhounds both, but keep {pet} from chewing on them, I beg you. They're no use to the Royal Apothecaries with bite marks in them, and I've had to explain that to hunters before." },
      },
      choices = {
        { text = "Write me a list. I'll bring back exactly that.", next = "BACK", reply = "A list, at last, a hunter after my own heart! Exactly what's written, and nothing chewed.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll bring what I kill. Sort it yourself.", next = "BACK", reply = "Then you'll get paid for what I can use and nothing more. I'm not running a butcher's.", fx = { align = { order = -1 } } },
      },
    },
    purpose = {
      big = true,
      lines = {
        { id = "f_default", text = "For the Scourge, of course. Who else would deserve it? Don't ask me again; the answer won't change, and I'm busy." },
      },
      choices = {
        { text = "Of course.", next = "BACK", fx = { affinity = 1 } },
        { text = "That's not quite an answer.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
        { text = "Do the people of Brill fear your work, Johaan?", next = "op_new_plague" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Worse? It was the Scourge's grain that poisoned these fields, and my work is meant to answer it, not add to it. If the earth complains to you about a little runoff, do tell it the Royal Apothecary Society is terribly sorry, and very busy." } },
      choices = {
        { text = "Then answer the Scourge, and let the fields heal.", next = "BACK", reply = "That's the plan, and the earth will thank us once the Scourge stops walking on it. Very sensible of you, shaman.", fx = { align = { light = 1 } } },
        { text = "The fields are already lost. Use them as you need.", next = "BACK", reply = "Excellent, because I've already got half the fields in my ledger. They're of no use to anyone else.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Reagents, only reagents, for a remedy against the Scourge. The plague-touched earth grows things nowhere else in Lordaeron will, and I'd be a poor apothecary if I let that go to waste, so could you gather a few for me, gently, roots and all?" } },
      choices = {
        { text = "Gently, then, roots and all, for the war on the Scourge.", next = "BACK", reply = "Gently, roots and all, and you'll be doing more for the war than any Deathguard. Splendid.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Not until I know what they're really for.", next = "BACK", reply = "They're for the Scourge, as I said, and the Society's other work is none of your concern. I'll find another gatherer.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Oh, a great many of them could, though I must insist the Society's formulae are meant for the Scourge and the Scourge alone. Still, a careful rogue with a vial and a steady hand could teach us much about the Crusade's constitution, and I would be fascinated by the results." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "You'll know already that our bodies shrug off what would kill a living man, which makes you an ideal courier for the Society's more volatile work. Do mind the stoppers all the same; I've lost two assistants that way, and they were dead already." },
      },
      choices = {
        { text = "Poison is a tool, Apothecary. I'll use it where it works.", next = "BACK", reply = "A practical rogue! Bring me back whatever the Crusade does when it drinks, and I'll be terribly grateful.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'd rather settle the Crusade with steel than vials.", next = "BACK", reply = "Steel's very old-fashioned, you know, and it leaves such a mess. Still, the Society doesn't mind how they die.", fx = { align = { honor = 1 } } },
        { text = "Who is your brewing really meant for?", next = "purpose" },
      },
    },
  },

  topics = {
    humans = { { id = "tp_humans", text = "I mixed cough syrups for this town's living once, and now I mix poisons in the same cellar. Their kin in Southshore still say we apothecaries brought the plague, when all we did was fail to stop it." } },
    forsaken = { { id = "tp_forsaken", text = "We are a people with graves still to settle and a kingdom to take back, and very little patience left for the living who stand in our way. The Royal Apothecary Society is doing its part." } },
    scourge = { { id = "tp_scourge", text = "The Scourge's plague is a crude and clumsy thing, and the Society means to make something better, purely for use against the Scourge, of course. I'll say no more than that, because Master Faranell prefers discretion." } },
    new_plague = { { id = "tp_new_plague", text = "Oh, it's coming along very nicely, and it's all in the service of the Dark Lady's war on the Scourge. Bring me the reagents I ask for, and don't stand quite so close to the green ones." } },
    stratholme = { { id = "tp_stratholme", text = "The plague first spread through the grain at Stratholme, carried in by the Cult of the Damned. From an alchemical point of view it was remarkably efficient, and I hope you'll forgive me for saying so." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran's alchemists never shared their notes with anyone outside their towers. Now their city is rebuilding and still won't open its gates, so I expect nothing has changed." } },
    _none = { { id = "tp_none", text = "Unless it can be distilled, I've no interest." } },
  },
}

P:NPC {
  key = "coleman", id = TODO_NPC("Coleman Farthing"), name = "Coleman Farthing",
  bible = "bibles/tirisfal.md", role = "questgiver", tier = "quest",
  communities = { "brill" }, temper = { "bitter" }, values = { "proud" },
  notices = { "drink", "lock_soulstone" },
  impression = {
    first = "He died defending the Agamands' mills and has not forgiven them.",
    third = "{name} met Coleman Farthing in the Gallows' End, a former mill hand who wants the risen Agamands put to rest for good.",
  },

  greetings = {
    { id = "g_tavern", text = "Good evening, friend, do sit. I'm just here thinking unkind thoughts about my former employers." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you've come back. Tell me something that'll ruin an Agamand's day." },
    { id = "g_xbrill", when = { origin = "forsaken_brill_farmer" }, text = "You farmed round Brill? Then you'll have tipped your cap to the Agamands on market day, same as me, and they never once tipped it back. Sit, and help me think unkind thoughts about them." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Drinking? I miss it, you know, the taste of it. Enjoy it for me, there's a good fellow." },
    { id = "n_lock_soulstone", cat = "lock_soulstone", when = { aura = { 20707, 20762, 20763, 20764, 20765 } },
      text = "Somebody's tucked your soul away in a stone, haven't they? I came back once without anyone asking my leave, and I'd have liked to choose, so I envy you a little." },
  },

  start = "hello",
  nodes = {
    w3_yvette = {
      lines = {
        { id = "w3_yvette_1", text = "She speaks to me plenty, friend, only none of it is warm, and I can't fault her for that. I worked her into the Agamands' household with my own hands, hoping she'd marry above us, and now she sits across the tavern from a father who got her killed." },
      },
      choices = {
        { text = "She doesn't blame you, surely.", next = "w3_blame" },
        { text = "She seems to have her own grief.", next = "BACK", reply = "She does, for Thurman, and she won't share it, and I've stopped asking. A girl's entitled to keep something to herself, even dead." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_blame = {
      lines = {
        { id = "w3_blame_1", text = "Not in words. But she sits with her back to the fire so she needn't look at me, and I sit with my face to it so I needn't look at her, and between us we keep that fire very well attended." },
      },
      choices = {
        { text = "Maybe one day you'll both turn round. Something else.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I blame the Agamands, mostly, since it was them who asked us to stay. But the Light was meant to watch over the faithful, and I was faithful enough, so I'd like to know where it was the night I died, and maybe you can tell me." } },
      choices = {
        { text = "It was there. It came back to me, and it can for you.", next = "BACK", reply = "Came back to you? Then perhaps it's only taking its time with me, and I've a great deal of time now.", fx = { align = { light = 1 } } },
        { text = "It wasn't there for either of us. I hold it anyway.", next = "BACK", reply = "That's an honest answer, and I respect you more for it than for any sermon. Hold it tight, then, and I'll see if I can do the same.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "I prayed for them every night I stood guard at their mills, and then the plague came in the grain and they asked me to die for them, so I did. I've stopped praying, but I find I still say their names before I sleep, or before I sit still, since I don't sleep anymore." } },
      choices = {
        { text = "Say their names, Coleman. Somebody ought to.", next = "BACK", reply = "I will, then, every night, and I'll feel a little less foolish for doing it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They used you. You owe them nothing, not even their names.", next = "BACK", reply = "Maybe I don't, but I'd still rather remember them than forget. Forgetting feels too much like what the Scourge did to me.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "If you like, though I'll admit I've a soft spot for them, since they've never once asked me to die for their property. They're lean and quick and they run in pairs out there, so watch the one you're not shooting at." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "If you like, and {pet} looks like it would give a Darkhound a fair fight, which is fairer than the Agamands ever gave us. They run in pairs near the mills, so watch the one you're not shooting at." },
      },
      choices = {
        { text = "I'll hunt them fairly, and let the ones that flee go.", next = "BACK", reply = "Fairly, and with pairs in mind, and you'll have no trouble. The ones that flee will keep the others honest.", fx = { align = { honor = 1 } } },
        { text = "A road's a road, Coleman. I'll clear every last one.", next = "BACK", reply = "Then clear them, and I'll keep my soft spot for the next pack. They'll be back, they always are.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Coleman Farthing, at your service. When the Scourge came, the Agamands asked us mill hands to stay and defend their property, and most of us died for it. I'd like to return the favor." },
        { id = "h_deaths", tags = { "news" }, when = { questActive = TODO_QUEST("Deaths in the Family") },
          text = "The Agamands walk the mills now, as undead as I am and twice as foul. Bring me what's left of them, and I'll see they rest, eventually." },
        { id = "h_mills", when = { questActive = TODO_QUEST("The Haunted Mills") },
          text = "The mills are haunted, and of course they're haunted; everyone who died there had a reason to stay angry." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, in the Gallows' End! Sit down, friend; the ale's thin, but I'm told the spirits are generous, and I mean the other kind." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, is it? The Agamands kept a little orchard behind the manor, and I'd dearly like to see you turn it into brambles out of spite." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, at the Gallows' End! The Darkhounds roam the fields by the Agamand Mills these days, and I'd say they make better neighbours than the Agamands ever did." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, at the Gallows' End. You may have come too late for the Agamands, I'm afraid, because I prayed for them in life and look how that turned out." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin, are you? The Agamands were great ones for blessings, and I can't say any of them did us mill hands much good when the Scourge came over the hill, so I'll be slow to be impressed." },
        { id = "h_dd_chill", when = { questDone = TODO_QUEST("The Chill of Death") },
          text = "Gretchen's been better company since you brought her what she asked for. I don't ask what she does with it, and you'd be wise not to ask either." },
        { id = "h_dd_maggot", when = { questDone = TODO_QUEST("Wanted: Maggot Eye") },
          text = "You took Maggot Eye's paw, I hear, which means the gnolls will think twice before digging in our graveyard. Some of my old friends are buried there, so I'm obliged to you." },
      },
      choices = {
        { text = "Do you still pray for the Agamands, Coleman?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Shall I ask the spirits about the Agamands, Coleman?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Shall I let the Agamands' orchard go wild, Coleman?", next = "druid_q", when = { class = "DRUID" } },
        { text = "That's a heavy grudge.", next = "grudge" },
        { text = "I could make the Agamands' rest a short one.", next = "rogue", when = { class = "ROGUE" } },
        { text = "You held the mills like soldiers. I respect that.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "A mage's fire could clear the Agamand Mills.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "I could set a demon loose in the Agamands' parlour, Coleman.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Should I hunt the Darkhounds near the mills, Coleman?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "You seem to blame the Light for what happened at the mills.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Yvette doesn't seem to speak to you much.", next = "w3_yvette" },
        { text = "I'll go to the mills.", next = "END", fx = { affinity = 2 } },
      },
      again = {
        { id = "h_again", text = "More? Splendid, I've nowhere to be, and nothing to drink." },
      },
    },
    rogue = {
      lines = { { id = "ro_default", text = "A short rest, quietly, from behind? Oh, I do like you. Old Gregor Agamand always sat with his back to the door, because he was certain nobody under him would dare. Prove him wrong for me, would you?" } },
      choices = {
        { text = "From behind, then, since he's earned it.", next = "BACK", reply = "Good, because it's what he'd have done to any of us, and it's what he did, in the end.", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "I'll face him, so he knows who sent me.", next = "BACK", reply = "Then tell him it was Coleman Farthing, the guard he left to die. I'd like him to hear my name once more.", fx = { affinity = 1, align = { honor = 1 } } },
      },
    },
    warrior = {
      lines = { { id = "wr_default", text = "Soldiers? We were millers with pitchforks, friend, and the Agamands had real swords locked in the manor the whole time. Respect the dead mill hands if you like, but don't call it soldiering; soldiers are at least given a chance." } },
      choices = { { text = "Then I'll give them justice.", next = "BACK", fx = { affinity = 2 } } },
    },
    grudge = {
      lines = { { id = "g_default", text = "It's the only thing I carried out of the grave. I find I'd rather not put it down." } },
      choices = { { text = "I understand.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Ask them if you like, friend, though the Agamands walk about the mills in their own rotten bodies, which is a good deal more than lingering. If your spirits can tell old Gregor his mill hands are still waiting on their wages, I'd be obliged, though I'd rather he heard it from an axe." } },
      choices = {
        { text = "I'll lay them to rest, and their spirits with them.", next = "BACK", reply = "That's kinder than they deserve, and kinder than they were to us. Let them rest, then, and I'll try to rest a little easier myself.", fx = { align = { light = 1 } } },
        { text = "I'll make Gregor pay first, and let the spirits wait.", next = "BACK", reply = "Make him pay, by all means, and tell him Coleman sends his regards. The spirits have waited this long; they'll wait a bit more.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Wild, and thorny, and full of crows, if you please. They kept that orchard better than they ever kept us mill hands, and I stood guard over it the night the Scourge came, while Gregor locked the manor door behind him." } },
      choices = {
        { text = "I'll leave the trees be. They never wronged you.", next = "BACK", reply = "They didn't, and I'm glad you see it. Some nights I fancy I can still smell the apples, though I know I can't.", fx = { align = { honor = 1 } } },
        { text = "Brambles it is, then. Let the manor choke on them.", next = "BACK", reply = "Let it choke, then, and let Gregor feel every thorn of it. That's a fine thought to sleep on.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Fire would clear them, and the thought does warm what's left of me, but the mills are dry as tinder and I bled for those mills. Burn the risen family if you must, and leave the millstones standing; I paid for them with my life." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "You were studying magic while I was hauling grain sacks for the Agamands, I expect, and both of us ended up in the same ground. It's a funny sort of fairness, and I mean to enjoy it while it lasts." },
      },
      choices = {
        { text = "I'll burn only what needs burning, Coleman.", next = "BACK", reply = "That's all I ask, and the millstones will thank you, even if they can't say so.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If the mills burn, they burn.", next = "BACK", reply = "Then they burn, and I'll pretend I didn't hear you say it. Mind you don't burn the road to Brill with them.", fx = { align = { order = -1 } } },
        { text = "You carry a heavy grudge.", next = "grudge" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "A demon in the Agamands' parlour would be a sight worth dying twice for, I admit. Only mind it doesn't follow you back to Brill, because the folk here have had enough of masters who smile first and devour after." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "We came back without any choice in it, and now you call things out of the Nether on purpose, though I'll not judge it. The Agamands called me to their mills on purpose too, and you can see how well that ended for all of us." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "A demon in the Agamands' parlour would be a sight worth dying twice for, and yours looks as though it would enjoy the visit. Only mind {pet} doesn't follow you back to Brill, because the folk here have had enough of masters who smile first and devour after." },
      },
      choices = {
        { text = "The demon goes where I send it, and no further.", next = "BACK", reply = "Good, because Brill has had enough of masters, and it doesn't need a demon for a new one.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Whatever it devours on the way is its own business.", next = "BACK", reply = "Then I hope it's hungry for Agamands and nothing else. I'd hate to have to explain it to Sevren.", fx = { align = { order = -1 } } },
        { text = "You carry a heavy grudge, Coleman.", next = "grudge" },
      },
    },
  },

  topics = {
    forsaken = { { id = "tp_forsaken", text = "I'm Forsaken, if you like, though I'd say I was forgotten first and then forsaken afterwards. The Dark Lady at least remembered we existed, which is more than the Agamands did." } },
    lordaeron = { { id = "tp_lordaeron", text = "I worked the Agamand mills when Lordaeron still bought flour, and the old family sat up on the hill and counted sacks. When the plague came they told us to stand and defend their mill, so we did, and here we are." } },
    scourge = { { id = "tp_scourge", text = "The Scourge got into the grain long before it got into us. You didn't see it coming because it came in the bread, and that's the wickedest thing I ever heard of." } },
    arthas = { { id = "tp_arthas", text = "My cousin served in the prince's company when it went north to Stratholme, and he wrote home that the prince had gone strange. We laughed, because we thought princes were always strange." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady keeps her word to her people, and I'll grant her that much freely. I could name a noble family on a hill above Brill that never did." } },
    _none = { { id = "tp_none", text = "I don't know, friend, but ask me about the Agamands; that I could talk about all night." } },
  },
}

P:NPC {
  key = "gretchen", id = TODO_NPC("Gretchen Dedmar"), name = "Gretchen Dedmar",
  bible = "bibles/tirisfal.md", role = "questgiver", tier = "quest",
  communities = { "brill" }, temper = { "chilly" }, values = { "practical" },
  notices = { "weary", "lock_pact" },
  impression = {
    first = "What she misses most is being cold.",
    third = "{name} met Gretchen Dedmar, a chilly regular of the Gallows' End who has found a way to keep death's cold at bay for a time.",
  },

  greetings = {
    { id = "g_tavern", text = "It's meant to be cold tonight, they tell me, though I can't feel it any more. You stop noticing, and then one day you notice that you've stopped." },
    { id = "g_xbrill", when = { origin = "forsaken_brill_farmer" }, text = "You farmed outside Brill, didn't you? I remember the barley carts coming in at harvest, and I remember the year the grain went grey, and I think about both more than I'd like." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, haven't you? I noticed, which surprised me, since I don't notice much any more." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Someone in the tavern said you were kind to them. It's been a long while since I heard anyone in Brill say that about anyone." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "Fresh from the spirit healer? You've a bit of the grave on you still, but it fades." },
    { id = "n_lock_pact", cat = "lock_pact", when = { aura = { 6307, 7804, 7805, 11766, 11767 } },
      text = "You're giving off heat like a hearth, and I can actually feel it, which is more than any fire in this tavern has managed since I woke. Stand there a moment longer, would you?" },
  },

  start = "hello",
  nodes = {
    w3_farm = {
      lines = {
        { id = "w3_farm_1", text = "Small, dear, on the edge of the Brightwater, with a cow called Patience and a kitchen garden I was very proud of. The beetles have it now, great black ones the size of loaves, and I hear they've dug the cellar out entirely." },
      },
      choices = {
        { text = "Would you go back, if they were gone?", next = "w3_back" },
        { text = "A cow called Patience?", next = "BACK", reply = "She had none at all, which was the joke. She kicked the pail over every morning for nine years, and I'd give anything to have her do it once more." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_back = {
      lines = {
        { id = "w3_back_1", text = "I've thought about it, by this fire, but I don't think I would. I'd stand in that kitchen and feel nothing, not the stove, not the draught under the door, and it would be worse than not knowing." },
      },
      choices = {
        { text = "I understand, Gretchen. Something else.", next = "BACK" },
      },
    },
    dd_family = {
      lines = { { id = "dd_family_default", text = "The Agamands owned the mills and half the fields around Brill, and everyone in this tavern knew them while we were all still breathing. Now they walk their own land with nothing behind their eyes, and Coleman couldn't bring himself to put them down." } },
      choices = {
        { text = "Somebody had to do it. Better a stranger than a neighbour.", next = "BACK", reply = "That's kindly put, and I think he knows it, somewhere under all the sulking. Leave him be for a day or two.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Sentiment is a living habit. He ought to let it go.", next = "BACK", reply = "Perhaps, dear, but I still order tea I can't taste. We all keep a habit or two from before.", fx = { align = { light = -1 } } },
        { text = "Something else, Gretchen.", next = "BACK" },
      },
    },

    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I think I would, yes, because burning is still feeling, and I've not felt a thing since I woke. You're luckier than you know, {class}, and I hope you don't waste it on being bitter." } },
      choices = {
        { text = "Then I'll hold it gladly, for both of us.", next = "BACK", reply = "That's sweet of you, dear, and I'll take it gladly. Hold it tight, because the rest of us are a little colder for not having it.", fx = { align = { light = 1 } } },
        { text = "It's no gift, Gretchen. Be glad you're spared it.", next = "BACK", reply = "Spared it, yes, and spared everything else besides. I'd trade a great deal for a little burning, dear.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "I'd ask it to let me feel something again, even the cold, because I can't feel its warmth and I can't feel the night's chill either. The old priest in Brill used to tell us the Light was a fire that never went out, and I sit here hoping some of it is in this hearth after all." } },
      choices = {
        { text = "Some warmth is still in you, Gretchen. Keep sitting by it.", next = "BACK", reply = "I'll try, dear, and perhaps one day it'll reach me. Until then, I'll sit by the hearth and pretend it already has.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Light lied to you, Gretchen. Find something truer.", next = "BACK", reply = "Something truer, he says, as though I've not looked. I'll keep the old lie by the fire, dear, because it's the only warm thing I have.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Oh, would you? I remember the first frost on Brightwater Lake and the way the reeds went stiff and white, but I can't remember the cold itself anymore. Tell it slowly, dear, and I'll hold my tea and pretend." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Oh, would you? And does {pet} like the cold, dear? Tell me how its breath steams on a frosty morning, because I've forgotten what that looks like, and I'd like to remember." },
      },
      choices = {
        { text = "I'll tell it true, Gretchen, cold and all.", next = "BACK", reply = "Oh, thank you, and don't leave out the bit where your fingers ache. I'll hold my tea and pretend I can feel every word.", fx = { align = { light = 1 } } },
        { text = "Some things are better forgotten, Gretchen. I'll spare you.", next = "BACK", reply = "That's thoughtful, dear, but I'd rather have the memory than the kindness. Perhaps another time, when you've less to carry.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Gretchen Dedmar. I sit in the tavern because it's warm, not because I can feel it; habit is a comfort, even dead." },
        { id = "h_chill", tags = { "news" }, when = { questActive = TODO_QUEST("The Chill of Death") },
          text = "Death leaves a numbness in you that never quite goes, but I've found a way to keep it at bay for a while, if you'll fetch what I asked for." },
        { id = "h_cup", when = { metBefore = true }, text = "I still order a cup of tea, though I can't taste it, and I hold it until it goes cold. Some habits are worth the coin." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, dear? I've heard your sort can call down frost, and I'd give a good deal to feel a shiver again." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, sitting with me by the fire? I'm told your sort can go about in a bear's fur, and I'll wager that's warm." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, dear? Come and sit, and tell me about the cold places you've tracked through, because I'd like to remember what a frost feels like." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "You're a priest, aren't you? I can tell by the way you look at the fire, as though you were asking it something." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin! Do you feel it when the Light comes, dear? I can't feel this fire at all anymore, so I'd quite like to know whether you feel anything, even if it hurts." },
        { id = "h_dd_family", tags = { "news" }, when = { questDone = TODO_QUEST("Deaths in the Family") },
          text = "Coleman went quiet as a grave when you came back from the mills, and for him that's saying something. Whatever you did to the Agamands out there, dear, he won't be thanking you aloud." },
      },
      choices = {
        { text = "What would you ask of the fire, Gretchen?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Shall I call the frost for you, Gretchen?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Shall I take bear form, Gretchen, so you can touch the fur?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Need anything guarded, Gretchen? I can swing an axe.", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "You must miss so much from before.", next = "miss" },
        { text = "Let me try something. A mage's fire is hotter.", next = "mage", when = { class = "MAGE" } },
        { text = "I'm good at going unseen, Gretchen. Does that help?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "A demon's fire burns hot, Gretchen. Shall I let you feel it?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "I've tracked through snow, Gretchen. Shall I tell you about it?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Would you want to feel the Light, even if it burned?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "What was your old farm like, Gretchen?", next = "w3_farm" },
        { text = "I'll be back with it.", next = "END", fx = { affinity = 1 } },
        { text = "Why would Coleman go quiet over the Agamands?", next = "dd_family", when = { questDone = TODO_QUEST("Deaths in the Family") } },
      },
      again = {
        { id = "h_again", text = "Something else, dear? I'll be in this chair until the tea goes cold, and it always does." },
      },
    },
    mage = {
      lines = {
        { id = "ma_default", text = "Oh, would you? Hold it closer, then, a little closer still. No, nothing, though I think I saw my fingers flinch, which they haven't done in a long while. Thank you for trying, dear; it was kind of you." },
      },
      choices = {
        { text = "I'll find a hotter spell one day.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Maybe flinching is a start.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "That's kind of you, though the trouble on my old farm comes on six legs, beetles mostly, and they don't fear an axe. Still, a warrior standing at the fence does wonders for my nerves." } },
      choices = {
        { text = "Then I'll stand there a while, for your nerves.", next = "BACK", reply = "That's very good of you, dear, and the beetles will think twice with you standing there. I'll bring you a cup of tea, though I can't promise it's hot.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll clear the beetles if the work's worth my time.", next = "BACK", reply = "It's worth exactly what Brill can pay, which isn't much, but the beetles aren't fussy about pay. I'd be very grateful all the same.", fx = { align = { honor = -1 } } },
      },
    },
    miss = {
      lines = {
        { id = "m_warm", text = "Being cold, isn't that strange? I sit by the fire because I remember wanting to, but now I don't feel either. I'd trade my last good tooth to shiver again." },
      },
      choices = { { text = "I'm sorry.", next = "BACK", fx = { affinity = 2 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Would you? Only a little, dear, by the hearth where nobody will mind. I won't feel it, I expect, but I'd like to see the frost creep over my teacup, and I'd like to pretend for a moment." } },
      choices = {
        { text = "I'll call it gently. Pretending is no sin.", next = "BACK", reply = "Thank you, dear, and I'll watch every bit of it. Pretending is all some of us have left.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It won't help, Gretchen. Better to let the cold go.", next = "BACK", reply = "Perhaps, but I've let go of so much already. I'd like to keep just one small thing, if you don't mind.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Oh, I couldn't feel it, dear, but I'd like to put my hands in it all the same. My father kept a great shaggy dog when I was small, and I'd sit with my hands buried in its coat until the frost went out of my fingers." } },
      choices = {
        { text = "Then put your hands in it, and remember the dog.", next = "BACK", reply = "I will, dear, and I'll think of him barking at the ducks on Brightwater Lake. That's the nicest thing anyone's said to me in weeks.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Memories won't warm you, Gretchen. Better to let them go.", next = "BACK", reply = "Perhaps not, dear, but they're very good company on a long night. I'll keep them anyway, if it's all the same to you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "It might, dear, because the Scarlet patrols near my old fields shoot at anything that walks upright and pale. Slip past them quietly and bring back what I asked for, and I'll sit here and pretend I can feel the fire while I wait." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "I used to bolt my door against folk like you, back when I had a door and something worth taking. Now I'd almost welcome a thief to worry about, because worrying was such a living sort of feeling." },
      },
      choices = {
        { text = "I'll keep out of sight and come back quietly.", next = "BACK", reply = "That's the way, dear, and do mind the archers by the fence. Come back in one piece and I'll pour you a tea.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "If the Crusade stops me, they'll see me coming.", next = "BACK", reply = "Then they'll see you coming and shoot you full of arrows, dear, and you'll have to explain that to Renee. Do try to be careful.", fx = { align = { honor = 1 } } },
        { text = "What do you miss most, Gretchen?", next = "miss" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "That's kind, but I've sat beside every fire in this tavern and none of them reach me, and I doubt a demon's would be any different. Keep your little friend away from the hearth, please; Innkeeper Renee has only just got the soot off the stones." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "I knew a girl from Brill who went off with the Cult and came back talking about the Nether as if it were a sweetheart, and then I never saw her again. You seem steadier than she was, so mind you stay that way." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "That's kind, and your demon is standing close enough that I ought to feel something, but I don't, and I doubt I ever will. Do move it away from the hearth, please; Innkeeper Renee has only just got the soot off the stones." },
      },
      choices = {
        { text = "I'll keep the demon well away from the hearth.", next = "BACK", reply = "Thank you, dear, and Renee will thank you too. She's very fond of that hearth.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The imp sits where it likes, Gretchen. I wouldn't argue with it.", next = "BACK", reply = "Then it can sit on the floor and keep its claws off my knitting. I'll be watching it, dear.", fx = { align = { order = -1 } } },
        { text = "What do you miss most, Gretchen?", next = "miss" },
      },
    },
  },

  topics = {
    forsaken = { { id = "tp_forsaken", text = "Being Forsaken means you can't feel the fire, dear, but you can still sit by it and remember. I find that's most of what any of us do in here." } },
    lordaeron = { { id = "tp_lordaeron", text = "I was a farmer's wife outside Brill, and we had a good, plain, cold-handed life. I'd give anything to feel that cold again, and that's the silly truth of it." } },
    scourge = { { id = "tp_scourge", text = "The Scourge took our village in a single week, and I don't remember much of the week, which is a mercy I suppose. Leave it there, dear." } },
    sylvanas = { { id = "tp_sylvanas", text = "She saved us from being nothing at all, and I'm grateful for it. I just wish she'd also found a way to keep us warm." } },
    everlook = { { id = "tp_everlook", text = "I've heard there's a goblin town up in the snow where folk have to bundle up against the cold. Imagine having the luxury of shivering." } },
    _none = { { id = "tp_none", text = "Couldn't say, dear. Ask Innkeeper Renee; she listens to everyone." } },
  },
}

P:NPC {
  key = "renee", id = TODO_NPC("Innkeeper Renee"), name = "Innkeeper Renee",
  gender = "female",
  bible = "bibles/tirisfal.md", role = "innkeeper", tier = "service",
  communities = { "brill" }, temper = { "gentle" }, values = { "kind", "generous" },
  notices = { "weary", "race", "lock_shadow" },
  impression = {
    first = "She once hurt people for a cause, and now she pours drinks.",
    third = "{name} met Innkeeper Renee of the Gallows' End, who left a harder life behind to look after Brill's guests, living and dead alike.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Welcome back to the Gallows' End! Your room's kept, the bats are quiet, and I'll pour yours before the others notice you've come in." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "There's a room upstairs if you want it, and a drink if you pay for it, but don't expect the Gallows' End to smile for you." },
    { id = "dp_pt_living", when = { party = { race = { "Orc", "Troll", "Tauren" } } }, text = "Your living friends will be cold in Brill. Tell them the fire's real, even if half the patrons aren't, strictly speaking." },
    { id = "dp_pt_any", when = { party = true }, text = "Company, how rare. Brill doesn't get many travellers who arrive together and stay together." },
    { id = "g_inn", text = "Welcome to the Gallows' End! Sit anywhere you like; nobody here bites. Well, nobody here bites guests." },
    { id = "g_home", when = { homeInn = { "Brill", "Gallows' End Tavern" } }, text = "Your room's kept. Don't mind the bats; they pay rent in silence." },
    { id = "g_xbrill", when = { origin = "forsaken_brill_farmer" }, text = "A Brill face come home! You'll have drunk in this room when everyone in it still breathed, I'd wager, so sit anywhere you like and pretend it's harvest night." },
    { id = "g_away", when = { away = 14 }, text = "Look who's back after {away}! Your room's kept, and the bats have been on their best behaviour, apart from what they did to the rug." },
    { id = "g_away_long", when = { away = 60 }, text = "You've been gone {away}, and I was starting to think you'd found yourself a better tavern. Sit down, and the first drink's on the house for coming home." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "One of my regulars couldn't stop talking about you last night, and they don't usually talk at all. Whatever you said to them, it did some good." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Somebody came in here last week muttering about you, and muttering's bad for business. Keep your quarrels out of the Gallows' End, if you please." },
    { id = "g_fl", when = { flirt = true, chance = 0.4, ["not"] = { npcFlagBefore = "ren_fl_no" } }, text = "Well, aren't you a welcome sight? Sit near the bar, love, where I can keep an eye on you, and I promise it's purely for your own safety." },
    { id = "g_fl_yes", when = { flirt = true, chance = 0.5, npcFlagBefore = "ren_fl_yes" }, text = "There's my favourite trouble. I kept your seat at the bar warm, which is quite a feat for someone with no warmth of her own." },
    { id = "g_fl_no", when = { flirt = true, chance = 0.3, npcFlagBefore = "ren_fl_no" }, text = "Just a room and a quiet drink, I remember, and no fuss from me. I'll behave myself, love, mostly." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look like you've been dug up twice. Sit down, love, and whatever you need, I'll bring it." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "A living guest! We keep food for your sort, and it's fresh, even. Mostly fresh, anyway." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "The lamps dipped when you came through the door, and the regulars all looked up, which they don't do for much. Sit by the window, love, and I'll bring your drink over there." },
  },

  start = "hello",
  nodes = {
    dd_maggot = {
      lines = { { id = "dd_maggot_default", text = "They were, and you'd think it was a wedding. Half the folk in that graveyard were somebody's mother before the plague, and the gnolls were dragging them off like mutton, so to Brill you did a kindness, not a chore." } },
      choices = {
        { text = "The dead deserve their rest, whatever they are now.", next = "BACK", reply = "That's a soft thing to say in Brill, love, and I'll not tell anyone you said it. Come back when you want a quiet corner.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "I did it for Zygand's bounty. Kindness didn't come into it.", next = "BACK", reply = "Well, the gravediggers needn't know that, and I won't spoil their evening by telling them. Coin's honest enough, I suppose.", fx = { align = { light = -1 } } },
        { text = "Something else, Renee.", next = "BACK" },
      },
    },

    fl = {
      lines = { { id = "fl_default", text = "Do I? Well, I've no pulse to give me away and no blush to hide behind, so I suppose my eyes have to do all the work. You've a kind face, love, and you'd be surprised how few of those come through Brill." } },
      choices = {
        { text = "Then look all you like, Renee.", next = "fl_yes", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "ren_fl_yes" }, clear = { "ren_fl_no" } } } },
        { text = "No pulse? Then how would I ever know you liked me?", next = "fl_pulse" },
        { text = "Doesn't a warm-blooded guest make you nervous?", next = "fl_warm", when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "You're sweet, but I'm not looking for company.", next = "BACK", fx = { trait = { reserved = 1 }, npcFlag = { set = { "ren_fl_no" }, clear = { "ren_fl_yes" } } }, reply = "Then you'll have a room and a quiet drink and no fuss from me, love. The friendly ear stays on offer, though." },
        { text = "I'd sooner not be stared at, Renee.", next = "BACK", fx = { trait = { stern = 1 }, npcFlag = { set = { "ren_fl_no", "ren_fl_rebuff" }, clear = { "ren_fl_yes" } } }, reply = "Fair enough, love. I'll stare at the glasses instead; they never complain." },
      },
    },
    fl_pulse = {
      lines = { { id = "flp_default", text = "You'd know because I'd remember how you take your drink, and I'd pour it before you'd sat down, and I'd laugh at your jokes even when they weren't funny. Down here, love, that's as close to a racing heart as any of us gets." } },
      choices = {
        { text = "I'd like to see that, Renee.", next = "fl_yes", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "ren_fl_yes" }, clear = { "ren_fl_no" } } } },
        { text = "Let's keep it to the drinks, Renee.", next = "BACK", fx = { trait = { reserved = 1 }, npcFlag = { set = { "ren_fl_no" }, clear = { "ren_fl_yes" } } }, reply = "The drinks it is. I'll still remember how you take it, mind; that's only good service." },
      },
    },
    fl_warm = {
      lines = { { id = "flw_default", text = "Nervous? Love, you're the warmest thing that's sat in this tavern in months, and I've half a mind to warm my hands on you like a hearth. Don't fret, I'll ask first, and I'll take no for an answer." } },
      choices = {
        { text = "Ask away, Renee. The answer's yes.", next = "fl_yes", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "ren_fl_yes" }, clear = { "ren_fl_no" } } } },
        { text = "No, I think, but thank you for asking.", next = "BACK", fx = { trait = { reserved = 1 }, npcFlag = { set = { "ren_fl_no" }, clear = { "ren_fl_yes" } } }, reply = "Then I'll warm them by the fire like a proper innkeeper. Thank you for being gentle about it." },
      },
    },
    fl_yes = {
      lines = { { id = "fly_default", text = "Careful, love, or I'll start remembering how to flirt properly, and I was dreadful at it the first time round. Come back when the tavern's quiet and I'll sit with you a while and tell you about the girl I was before all this." } },
      choices = {
        { text = "I'd like that, Renee.", next = "BACK", reply = "So would I. It's been a long while since anyone asked." },
        { text = "Something else.", next = "BACK" },
      },
    },
    op_sylvanas = {
      big = true,
      lines = {
        { id = "opsy_default", text = "They talk about her as though she were a saint or a storm, love, and never anything in between. You've seen more of the world than they have, so what do you think of her?" },
      },
      choices = {
        { text = "She saved us. I'd follow her into the Plaguelands.", next = "op_sylvanas_r1", fx = { align = { order = 1 }, opinion = { sylvanas = "admire" } } },
        { text = "She's cold, and I don't think she cares for any of us.", next = "op_sylvanas_r2", fx = { align = { order = -1 }, opinion = { sylvanas = "distrust" } } },
        { text = "Your queen frightens my people, Renee. I can see why.", next = "op_sylvanas_r3", fx = { trait = { cautious = 1 }, opinion = { sylvanas = "fear" } }, when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "I'd rather not talk about her, Renee.", next = "BACK" },
      },
    },
    op_sylvanas_r1 = {
      lines = { { id = "opsy_r1", text = "So would most of my guests, and some of them already have. I only hope she remembers which of them came back." } },
      choices = { { text = "Something else, Renee.", next = "BACK" } },
    },
    op_sylvanas_r2 = {
      lines = { { id = "opsy_r2", text = "Hush, love, the Deathguard drink here. I'll not say you're wrong, mind; I'll only say it quietly." } },
      choices = { { text = "Something else, Renee.", next = "BACK" } },
    },
    op_sylvanas_r3 = {
      lines = { { id = "opsy_r3", text = "She frightens her own too, sometimes, but fear's a poor reason to stop listening. Sit by the fire a while; nothing's quite so frightening by the fire." } },
      choices = { { text = "Something else, Renee.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Because sure people do terrible things and sleep fine afterwards, and I prefer pouring for someone who still wonders. You're dead and the Light still answers you, so I'd think you'd have more questions than anyone in this room." } },
      choices = {
        { text = "I'm sure of the Light. That certainty keeps me standing.", next = "BACK", reply = "Then I hope it keeps you standing a long while, love. Just don't be surprised if you meet someone just as sure on the other side of a Scarlet blade.", fx = { align = { order = 1 } } },
        { text = "I'm not sure of anything, and I think that's wiser.", next = "BACK", reply = "Oh, I like you better already. Sit down, love, and I'll pour you something you can't taste.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "More often than they ask for drinks, though they never call it praying. They sit at the bar and tell me who they lost, and I listen, which is what I'd want a priest to do, and I'll leave the shadows and the Light to you." } },
      choices = {
        { text = "Listening is holy work, Renee. You do it well.", next = "BACK", reply = "That's kind, love, though I'm only doing what any good barkeep would do. The dead have a lot of talking to catch up on.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Grief keeps them weak. They should let it go.", next = "BACK", reply = "Perhaps, but they'll do it here first, over a drink, and I'd rather they did it in company than alone in the dark. Grief doesn't keep forever.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hu_renee = {
      lines = {
        { id = "hu_default", key = true,
          text = "I think they're frightened, love, more than anything, and I know because I was one of the frightened ones. I carried a Scarlet tabard and a torch, and I burned barns with families inside them because a man in a red hood told me the Light wanted it." },
        { id = "hu_scourge", when = { race = "Scourge" },
          text = "I think they're frightened, love, and I'd know, because I was one of the people they're frightened for. I carried a Scarlet tabard and a torch in this very valley, and if you'd come stumbling out of a grave in front of me then, I'd have burned you without a second thought." },
      },
      choices = {
        { text = "How did you come to leave?", next = "hu_renee_2" },
        { text = "Do you hate them now?", next = "hu_renee_2" },
        { text = "Something else, Renee.", next = "BACK" },
      },
    },
    hu_renee_2 = {
      big = true,
      lines = {
        { id = "hu2_default",
          text = "I left the night a little girl walked out of a barn I'd set alight, and she was one of the dead, and she asked me why. I've no hate left for them, love, only a great tiredness, because every zealot who comes up the road was me once, and I don't know how to make the next one stop." },
      },
      choices = {
        { text = "They're frightened children. Some can still be turned, as you were.", next = "BACK",
          reply = "I hope so, love, because if I could be, anyone could. I keep a chair by the fire for the first one who walks in here asking.",
          fx = { affinity = 1, align = { light = 1 }, opinion = { humans = "forgive" } } },
        { text = "Fear doesn't excuse burning people. The Crusade should pay.", next = "BACK",
          reply = "It doesn't excuse it, and I paid for mine, and I'm still paying. Only I'd ask you not to drink to it at my bar, because some debts aren't for toasting.",
          fx = { align = { light = -1 }, opinion = { humans = "hate" } } },
        { text = "Something else, Renee.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_fors", tags = { "news" }, when = { race = "Scourge", alt = { kin = true } },
          text = "You've a look of {alt} about you, who sat by my fire and tried to remember a song from before. If you were neighbours in life, you might finish it for them, because the poor thing only had the first line." },
        { id = "h_alt_living", tags = { "news" }, when = { alt = { race = { "Orc", "Troll", "Tauren", "Skyborne" } } },
          text = "We had a {altrace} called {alt} in the tavern not long ago, warm-blooded and very polite about the smell. I hope you've the same good manners, because the regulars notice." },
        { id = "o_npwrong", tags = { "news" }, when = { gossip = { topic = "new_plague", stance = "wrong" } }, text = "Apothecary Johaan came in muttering that you don't trust his bottles. Neither do I, love, but I'd never say so where he can hear." },
        { id = "h_default", key = true,
          text = "I'm Renee, and I keep the tavern. Somebody has to look after people, even dead ones, and especially dead ones." },
        { id = "h_rogue", when = { questActive = TODO_QUEST("A Rogue's Deal") },
          text = "You're after the deal, are you? Quietly, then, because not every bargain in this town wants an audience." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman under my roof! Sit by the hearth, love, and if the fire starts talking to you, do tell me what it says." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, love? You've got leaves in your fur and I've only just swept, but sit down anyway." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest at my bar. Sit down, and I'll pour you something you can't taste, and you can tell me who you were praying for when you came in." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin. I followed a cause once, a long time ago, and I hurt people for it because I was sure I was right, so I always like to ask a paladin how sure they are." },
        { id = "h_dd_maggot", tags = { "news" }, when = { questDone = TODO_QUEST("Wanted: Maggot Eye") },
          text = "The gravediggers were in last night toasting Maggot Eye's paw, love, or toasting you, since you're the one who took it off him. They can't drink a drop, but they do like to hold the cups." },
        { id = "h_dd_mills", when = { questDone = TODO_QUEST("The Haunted Mills") },
          text = "Coleman told the whole tavern you went out to Agamand Mills and put old Devlin back in the ground. He told it three times, actually, and it grew a little longer each time." },
        { id = "h_dd_deaths", when = { deaths = { min = 10 } },
          text = "You've the look of someone the spirit healers know by name, love. Sit a while, because even the dead deserve a rest between dyings." },
      },
      choices = {
        { text = "Do the dead of Brill ever ask you for prayers, Renee?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do the Forsaken mind a shaman's spirits in here, Renee?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "There can't be much green left in Tirisfal, Renee.", next = "druid_q", when = { class = "DRUID" } },
        { text = "I'm a warrior, Renee. What should a fighter know about Brill?", next = "xhwar", when = { class = "WARRIOR", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "May I bring my beast inside, Renee?", next = "xhhunt", when = { class = "HUNTER", race = { "Orc", "Troll", "Tauren", "Scourge" } } },
        { text = "You don't seem the innkeeping sort.", next = "why" },
        { text = "I'm a rogue. Who in Brill should I know?", next = "rogue", when = { class = "ROGUE" } },
        { text = "I doubt many mages drink at the Gallows' End, Renee.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Will you serve someone with fire at their heel, Renee?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Why do you ask paladins how sure they are, Renee?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "You keep looking over here, Renee.", next = "fl", when = { flirt = true, ["not"] = { npcFlagBefore = "ren_fl_rebuff" } } },
        { text = "You were Scarlet once, Renee. What do you think of humans?", next = "hu_renee" },
        { text = "Just a room, thanks.", next = "END" },
        { text = "I hear the gravediggers were celebrating Maggot Eye's end.", next = "dd_maggot", when = { questDone = TODO_QUEST("Wanted: Maggot Eye") } },
      },
      again = {
        { id = "h_again", text = "Anything else, love? Pull your chair in, and mind the bat on the rafter above you." },
      },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Me, love, for a start, and then whoever I say. Keep your voice down in here and your knives in their sheaths, and I'll point you to the right people when you're ready for them." } },
      choices = { { text = "Quietly, then.", next = "BACK", fx = { affinity = 2 } } },
    },
    why = {
      lines = { { id = "w_default", text = "I spent too long on the other side of things, hurting people for a cause. Now I pour drinks and listen, and it suits me better." } },
      choices = {
        { text = "What do your guests say about the Dark Lady?", next = "op_sylvanas" },
        { text = "It does.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    xhwar = {
      big = true,
      lines = { { id = "xhwar_default", text = "Only that the fights worth having are out past the fields, love, against the Scarlets and the Scourge, and not in my tavern. I've seen what a warrior does to furniture, and I'd much rather see it done to them." } },
      choices = {
        { text = "Then I'll take my fights outside, to Brill's enemies.", next = "BACK", reply = "Bless you, love, and come back for a drink when you've done the furniture's work somewhere else.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I fight where the fight finds me, even in here.", next = "BACK", reply = "Then may it find you outside, love, because my tables have been through enough. The Deathguard will see you out if it doesn't.", fx = { align = { order = -1 } } },
      },
    },
    xhhunt = {
      big = true,
      lines = {
        { id = "xhhunt_default", text = "Bring it in, love, so long as it doesn't mind the bats and the bats don't mind it. We've had wolves and cats by the hearth before, and they behaved better than some of my living guests." },
        { id = "xhhunt_pet", when = { pet = { type = "Beast" } }, text = "Is that {pet}? Bring it in by the fire, love, and I'll find it a quiet corner away from the bats. It's got kinder eyes than most of the guests I've poured for tonight." },
      },
      choices = {
        { text = "It'll mind its manners, I promise you.", next = "BACK", reply = "Then it's welcome by the fire, love, and I'll find it a scrap or two. The bats may still sulk.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "It goes where I go, whether the bats like it or not.", next = "BACK", reply = "Fair enough, love, but if the bats start a fight, I'll be sending the bill to you. Mind it doesn't eat my guests.", fx = { align = { honor = -1 } } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Some do, love, because the last voice in their heads belonged to the Lich King. Keep your spirits quiet by the bar and nobody will mind them, and if a guest flinches, buy him a drink and let him be." } },
      choices = {
        { text = "I'll keep them quiet. Your guests have suffered enough.", next = "BACK", reply = "Thank you, love, and they'll thank you too, even if they don't know it. Some of them still wake up shaking.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My spirits aren't the Lich King. Your guests can learn that.", next = "BACK", reply = "They'll learn, I expect, but it'll take longer than a drink. Go gently with them, love, and they'll come round.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "There's some, love, up by Brightwater Lake, where the plague didn't settle so thick, and there are still a few apple trees behind the old farms that nobody's burned. I walk up there sometimes, though I can't smell the blossom anymore, because I like to know it's there." } },
      choices = {
        { text = "Then I'll guard those trees from the Crusade's torches.", next = "BACK", reply = "That's a good use of a sword, love, and a better one than most I see in here. I'll think of you next time I walk up there.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A few apple trees won't win this war, Renee.", next = "BACK", reply = "No, but they might make it worth winning, love. You'll forgive me if I keep walking up there anyway.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They drink, though most of them complain about it, since nothing tastes of much to the dead and mages like to have opinions. Cain Firesong keeps his students to the back of the room, and I keep a bucket of water by the door in case one of them forgets where he is." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "You've a Dalaran look about you, the way you watch the lamps as if you're judging how they were lit. Sit down and have something; whatever you were before, you're one of mine while you're under this roof." },
      },
      choices = {
        { text = "I'll mind the furniture and keep my spells quiet.", next = "BACK", reply = "Bless you, love, and Cain will owe you a drink for being the first mage who meant it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If a Crusader comes through that door, he burns.", next = "BACK", reply = "Then aim carefully, love, because the bar's oak and I'm fond of it. The bucket's by the door if you need it.", fx = { align = { order = -1 } } },
        { text = "Why keep an inn now, Renee?", next = "why" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "I'll serve anyone who pays and keeps their demons off the tables, and the students of Rupert Boch, who teaches warlocks here, are mostly good about that. I did worse things than summon imps when I was alive, so I'm not about to lecture you." },
        { id = "xwarlock_scourge", when = { race = "Scourge" }, text = "I served a cause once that told me any means were fine so long as the end was holy, and I hurt people for it. Whatever you call up out of the dark, make sure it's you doing the deciding, because nothing else ever should." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "I'll serve anyone who pays and keeps their demons off the tables, and I see yours is already eyeing the one by the window. I did worse things than summon imps when I was alive, so I'm not about to lecture you, but I'll charge you for anything it ruins." },
      },
      choices = {
        { text = "I decide, Renee. The demon only obeys.", next = "BACK", reply = "Then make sure it knows that before it gets near my tables, love. I've had to wipe up after a few demons in my time.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Power asks no one's permission, Renee. Neither do I.", next = "BACK", reply = "Perhaps it doesn't, love, but my barstools do. Keep your power out of my glassware and we'll get on fine.", fx = { align = { order = -1 } } },
        { text = "Why keep an inn now, Renee?", next = "why" },
      },
    },
  },

  topics = {
    humans = { { id = "tp_humans", text = "Humans are frightened, love, and fear makes them cruel; I know because I carried a Scarlet torch once. Every zealot who comes up the road was me, and I keep a chair by the fire in case one of them walks in." } },
    scarlet_crusade = { { id = "tp_crusade", text = "I know them better than I'd like. Let's leave it there, love." } },
    forsaken = { { id = "tp_forsaken", text = "Most of my regulars are Forsaken, love, and they're the best customers I've ever had, since they don't fall over drunk or start fights about the bill. They just sit and remember, and I let them." } },
    scourge = { { id = "tp_scourge", text = "The Scourge came through here before my time behind this bar. My guests talk about it some nights, quiet-like, and I don't make them stop." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady's people run Brill, and they run it fairly enough. I keep my head down and my glasses clean, and nobody bothers me." } },
    thrall = { { id = "tp_thrall", text = "Orcs come through on their way off the zeppelins, all big shoulders and good manners, and they tip in good silver without being asked. I like them, if you want to know." } },
    booty_bay = { { id = "tp_booty_bay", text = "I hear the drinking in Booty Bay is rough and the bouncers are rougher. I'd sooner a quiet tavern full of dead men than a loud one full of pirates." } },
    _none = { { id = "tp_none", text = "I hear everything in this tavern, love, and the dead gossip worse than the living ever did, but not that." } },
  },
}

P:NPC {
  key = "eleanor", id = TODO_NPC("Eleanor Shackleton"), name = "Eleanor Shackleton",
  bible = "bibles/tirisfal.md", role = "questgiver", tier = "quest",
  communities = { "brill" }, temper = { "composed" }, values = { "curious", "practical" },
  notices = { "craft", "lock_steed" },
  impression = {
    first = "She told me she was not with the Crusade before I asked.",
    third = "{name} met Eleanor Shackleton, a traveller camped on the road near Brill who teaches anyone willing how to make a proper camp.",
  },

  greetings = {
    { id = "g_camp", text = "Good day. Before you ask: no, I'm not with the Crusade. I'm only passing through, on my way to the next stretch of wilderness." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, my pupil! The fire's lit, so sit, if you like." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook? Then you can build a proper campfire already, or nearly, and everything else in a camp starts from that." },
    { id = "n_leather", cat = "craft", when = { profession = "Leatherworking" },
      text = "A leatherworker. You'll want to learn the tent. A good tent near a fire makes a night's rest worth twice as much." },
    { id = "n_lock_steed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 5784, 23161 } },
      text = "That horse of yours leaves fire in its hoofprints, and the Crusade's scouts could follow that trail all the way from the monastery. If you camp near me tonight, tether it a long way off." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Because anyone travelling these roads alive is taken for a Scarlet sooner or later, and I'd rather say it first than have it said for me. And a paladin of the Forsaken would know better than anyone what the Crusade does to the people it decides are unclean." } },
      choices = {
        { text = "I believe you, Eleanor. The road's hard enough without suspicion.", next = "BACK", reply = "Thank you, and I'll admit it's a relief to hear it from someone with a sword. Sit by the fire a while, if you like.", fx = { align = { light = 1 } } },
        { text = "Saying it first is exactly what a Scarlet spy would do.", next = "BACK", reply = "Then I suppose I can't win, can I? Watch me as long as you like, {class}, and you'll see nothing but a woman and her campfire.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Because I knelt in their chapels once, in Lordaeron, before they decided that every grieving face belonged to a spy. I keep my own small prayers now, by the fire and away from them, and I find the habit hard to break and harder to explain." } },
      choices = {
        { text = "Keep your prayers, Eleanor. The Crusade doesn't own them.", next = "BACK", reply = "No, they don't, and it's taken me years to believe it. Thank you for saying it aloud.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Every Crusader prays too. Your prayers prove nothing.", next = "BACK", reply = "They do, and I've heard them pray over pyres, so I know better than most. I'll keep mine quiet all the same, because they're mine.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Back to the fire and face to the dark, and never let the fire grow so bright that you can't see past it. A good camp is a small fort, {class}, and I've watched soldiers forget that the moment they sit down." } },
      choices = {
        { text = "Then I'll take the first watch tonight.", next = "BACK", reply = "Good, then I'll sleep easier than I have in weeks. Wake me if the fire burns down, or if anything with red tabards walks by.", fx = { align = { order = 1 } } },
        { text = "I'd rather the fire roared, and let whatever comes, come.", next = "BACK", reply = "Then you'll be the first thing they see, {class}, and the last thing you'll see is them. I'd rather you kept it small.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The deer by Brightwater Lake, if you can stomach them, though I've learned to look closely at the meat first, because the plague shows in the liver. The wolves aren't worth the trouble, but their pelts make a fine bedroll." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} would make a fine camp companion, because nothing creeps up on a fire that a beast can smell first. Feed it from the deer by Brightwater Lake, but look closely at the liver, because the plague shows there." },
      },
      choices = {
        { text = "I take only what I'll eat, and waste nothing.", next = "BACK", reply = "That's the hunter's way, and my father's too. He used to say the deer could tell the difference, and I never caught him wrong.", fx = { align = { honor = 1 } } },
        { text = "I take what I can carry, and sell the rest.", next = "BACK", reply = "Practical, and I can't fault it with prices what they are. Just check the livers first, before you sell anything that'll make someone sick.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Because the Scarlet Crusade patrols the roads past Brill, and they'd see a warlock's fire from the monastery and come looking. A small fire, well banked and out of the wind, is all you need, and it keeps both of us out of their sight." },
        { id = "xwarlock_demon", when = { pet = { type = "Demon" } }, text = "Because the Crusade patrols the roads past Brill, and they'd see a warlock's fire from the monastery, and they'd see that thing of yours even sooner. Keep it down behind a small fire, well banked and out of the wind, and it keeps all three of us out of their sight." },
      },
      choices = {
        { text = "Then I'll keep my fires small and hidden.", next = "BACK", reply = "Good, and you'll find it keeps you warmer than you'd think. The Crusade's scouts look for smoke, not warmth.", fx = { align = { order = 1 } } },
        { text = "Let the Crusade come. My fire wants feeding.", next = "BACK", reply = "Ready, perhaps, but they come in dozens and they don't tire. I'd much rather you lived to camp another night.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Eleanor Shackleton. I travel, and where I stop, I camp, and if you'd like to learn how, I'm a patient teacher." },
        { id = "h_adventurer", tags = { "news" }, when = { questActive = TODO_QUEST("The Adventurer") },
          text = "Executor Arren sent you to look me over, I expect. Look all you like, and then let me show you something useful." },
        { id = "h_outdoors", when = { questActive = TODO_QUEST("The Great Outdoors") },
          text = "Sit by the fire until you feel rested, properly rested; you'll know it when it comes." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, out on the Tirisfal road! You'll know more about fire than I do, I expect, though I'd still like to see how you build one." },
        { id = "h_druidcl", when = { race = "Tauren", class = "DRUID" }, text = "A tauren druid, a long way from Mulgore! You'll find Tirisfal's woods sadder than your plains, though I've learned to love them a little." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, on the Tirisfal road! You'll know how to stand a watch, I expect, and that's half of keeping a good camp." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter! Then you know the woods better than most who come down this road, and you'll have eaten well, which is more than I can say." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, and not one of the Crusade's, I can see that plainly. I'll say it before you ask: neither am I." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. You'll know a campfire draws attention, so I'll teach you to build one that doesn't." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin of the Forsaken. I'm not with the Crusade, before you ask, and I'll admit I've never been so relieved to see the Light in someone's hands as I am now that it isn't theirs." },
      },
      choices = {
        { text = "Why do you keep telling everyone you're not with the Crusade?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do you light your fires with flint, Eleanor, or ask them?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Why stay in a dead land, Eleanor, when the world is wide?", next = "druid_q", when = { class = "DRUID" } },
        { text = "You'd be warmer in an inn than out here.", next = "why" },
        { text = "I don't sleep, Eleanor. What's a camp for, then?", next = "forsaken", when = { race = "Scourge" } },
        { text = "I'm a long way from the Barrens, and this damp gets into everything.", next = "living", when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "You notice a lot for a traveller, Eleanor.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "I could light your fire with a word, Eleanor.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "How does a warrior keep a camp safe, Eleanor?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "There must be some game worth taking along this road, Eleanor.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Why would I need a campfire, Eleanor? I carry my own flame.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Why are you so quick to say you're not with the Crusade?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Safe travels.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Anything more? Tirisfal can wait while we talk; it has been waiting for years." },
      },
    },
    forsaken = {
      lines = { { id = "fk_default", text = "Company, mostly, and a place to set things down. I've shared a fire with a few of your people on this road, and they sit very still and watch the flames, and none of them has ever told me what they see there." } },
      choices = { { text = "Things we used to have.", next = "BACK", fx = { affinity = 2 } } },
    },
    living = {
      lines = { { id = "lv_default", text = "Then gather dry wood off the ground, and plenty of it, because Tirisfal never stops dripping, and sleep with your back to the fire, not to the trees; the things in these woods aren't all as friendly as the Forsaken." } },
      choices = { { text = "Back to the fire. Thank you.", next = "BACK", fx = { affinity = 1 } } },
    },
    why = {
      lines = { { id = "w_default", text = "Inns are where the roads end, and camps are where they keep going. Besides, anyone passing can share your fire, which is half the point." } },
      choices = { { text = "I'd like to learn.", next = "BACK", fx = { affinity = 2, learn = { "camping" } } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Flint and dry tinder, the way my mother taught me, and I've never once asked a fire's permission. I'd be curious to watch you do it, though, because a fire that comes when it's called would spare me a lot of cursing in this drizzle." } },
      choices = {
        { text = "Fire is a spirit. I ask, and I thank it after.", next = "BACK", reply = "That's a lovely way of doing it, and I think my mother would have liked you. Show me sometime, if you're willing.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I don't ask it. I tell it, and it burns.", next = "BACK", reply = "Then it's no different from my flint, really, and I'll take my flint. At least it doesn't argue.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      big = true,
      lines = { { id = "dq_default", text = "Because somebody ought to sit by a fire in it and call it a camp rather than a battlefield. The woods are sick, but they aren't dead, and I've watched a deer drink from Brightwater Lake at dawn as though nobody had told it about the plague." } },
      choices = {
        { text = "Then I'll help them heal, a little at a time.", next = "BACK", reply = "That's all any of us can do, and it's more than most bother with. I'll keep my fires small so I don't undo your work.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some of it is past healing, Eleanor. I've seen it.", next = "BACK", reply = "Some of it is, I know, but I've seen enough deer at dawn to keep hoping. Leave me my hope, if you would.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "A traveller who doesn't notice things soon stops travelling, and I don't intend to join the Forsaken just yet. I watch the road, the trees and the smoke on the horizon, and I watch the quiet ones like you closest of all." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "You walk like someone who was a thief before you died, all soft heels and an eye on the exits. I don't carry anything worth taking, so you may as well sit by the fire and learn something honest." },
      },
      choices = {
        { text = "Then I'll sit by the fire and learn.", next = "BACK", reply = "Good, sit close, and watch the road while you're at it. You'll learn more than you expect.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Firelight's bad for a rogue, Eleanor. People remember your face.", next = "BACK", reply = "They do, and that's half the reason I keep one. A face I've seen by firelight is a face I'll remember on the road.", fx = { align = { honor = -1 } } },
        { text = "You'd be warmer in an inn than out here.", next = "why" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "I'm sure you could, but a fire lit by magic teaches you nothing about wet wood and wind, and one day you'll be too tired to cast. Humour me and do it with flint first, and then you may show off as much as you like." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "Dalaran taught you a dozen ways to start a fire, I'd guess, and none of them involved kneeling in the mud. The mud is where the learning happens, so kneel down here beside me." },
      },
      choices = {
        { text = "Flint first, then. I'll learn it properly.", next = "BACK", reply = "Good. Wet wood and wind will teach you more than any spellbook, and you'll thank me on a cold night.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll use the spell; that's what it's for.", next = "BACK", reply = "It is, and you're welcome to it, but one day you'll be too tired to cast. Remember the flint then, and remember me.", fx = { align = { order = -1 } } },
        { text = "Why camp at all, when there are inns?", next = "why" },
      },
    },
  },

  topics = {
    camping = { { id = "tp_camping", text = "A camp starts with a fire, and then whatever your trade can add to it, whether you cook, work leather or fish. A camp is everyone's work." } },
    lordaeron = { { id = "tp_lordaeron", text = "I knew Lordaeron when it was green and the roads were safe for a woman walking alone. They aren't now, and that's why I teach people to build a fire properly." } },
    scourge = { { id = "tp_scourge", text = "The Scourge doesn't fear much, but it doesn't care for a good fire either. Keep one lit and keep your back to something solid, and you'll see more mornings than most." } },
    forsaken = { { id = "tp_forsaken", text = "I don't mind the Forsaken, so long as they don't mind me. We've reached an understanding here in Brill, and I won't spoil it by asking too many questions." } },
    scarlet_monastery = { { id = "tp_scarlet_monastery", text = "I've seen the Monastery from the road, all banners and bells, and I've no wish to see it any closer. I've told you already, I'm not one of them." } },
    _none = { { id = "tp_none", text = "I'm only passing through. Ask someone who lives here, if that's the word." } },
  },
}
