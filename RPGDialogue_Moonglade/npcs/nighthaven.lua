-- Nighthaven and the Shrine of Remulos. Voice: bibles/nighthaven.md
-- Moonglade is neutral: nothing here assumes the player's faction.
local P = RPGDialogueAPI:Pack("rpgd.moonglade")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "remulos", id = TODO_NPC("Keeper Remulos"), name = "Keeper Remulos",
  bible = "bibles/nighthaven.md", role = "noble", tier = "major",
  communities = { "nighthaven" }, temper = { "serene" }, values = { "protective", "firm" },
  spiritSensitive = true,
  notices = { "form", "fel", "race" },
  impression = {
    first = "Keeper Remulos speaks to every visitor as if they were a guest in his own grove, which I suppose they are. When he asks about the new tree on Teldrassil, a quiet sadness creeps into his voice.",
    third = "{name} met Keeper Remulos, son of Cenarius, who guards Moonglade for every druid whatever banner they fly.",
  },

  greetings = {
    { id = "g_glade", text = "Be welcome in Moonglade, little one. Every creature that comes in peace may rest here." },
    { id = "g_druid", when = { class = "DRUID" }, text = "A child of the Circle. Come, walk with me a little, for the glade is glad of you." },
    { id = "g_initiate", when = { origin = "nightelf_druid_initiate" }, text = "One of the Circle's sleepers, newly woken, and still rubbing the Dream from your eyes. Come, little one, for the glade is the one place in this world that stayed as you left it." },
    { id = "g_back", when = { metBefore = true }, text = "You return. The trees remember your step, and so do I." },
    { id = "g_away", when = { away = 14 }, text = "You have been away {away}, little one, and Moonglade has waited as it waits for everything, patiently. Rest here, and tell me what the world has done to you." },
    { id = "g_away_long", when = { away = { min = 60, levels = 10 } }, text = "You have been gone {away} and grown much in that time, little one, and I can see the long roads in your step. Rest awhile, for Moonglade is patient with all who return to it." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You have grown since we last spoke, as a sapling grows between one spring and the next, so take care that you grow straight, little one, for strength bends easily." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I am told that one of the glade's folk parted from you in anger, little one, and Moonglade is a place of peace. I trust you will remember that, as all who walk here must." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "One of the glade's folk spoke warmly of you to me today, and such words carry far in Moonglade, so the trees are glad of you, little one, and so am I." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "The dead walk into Moonglade, and the glade lets them. I have never seen it before, and I find I am more curious than afraid." },
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "You wear the bear well: heavy, patient, slow to anger. Let the shape teach you while you wear it." },
    { id = "n_cat", cat = "form", when = { form = "cat" },
      text = "Swift and quiet, I see. The cat's is a sharp lesson, so mind it doesn't teach you only how to hunt." },
    { id = "n_warlock", cat = "fel", place = "before", when = { class = "WARLOCK" },
      text = "The fel clings to you like smoke to a cloak. You may stand here, but you may not call upon it here. Do we understand each other?" },
    { id = "n_skyborne_druid", cat = "race", when = { race = "Skyborne", class = "DRUID" },
      text = "You honour the winds first, and the moon after, if at all; I know it. The Circle has never asked every druid to kneel to the same sky." },
  },

  start = "hello",
  nodes = {
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "In this glade, orc and kaldorei sleep under the same moon and draw no blade, and outside it they kill one another over trees. You walk in both worlds, mortal. Do you think the peace of Moonglade could ever spread beyond it?" },
      },
      choices = {
        { text = "Yes, if leaders like Thrall and Tyrande met here.", next = "op_r1", fx = { affinity = 1, align = { honor = 1 }, opinion = { peace = "peace" } } },
        { text = "No. The war is older than any truce.", next = "op_r2", fx = { align = { honor = -1 }, trait = { skeptical = 1 }, opinion = { peace = "war" } } },
        { text = "It holds because the Circle enforces it, nothing more.", next = "op_r3", fx = { trait = { practical = 1 }, opinion = { cenarion_circle = "respect" } } },
        { text = "The balance asks for war and peace both, Keeper.", next = "op_r4", fx = { trait = { curious = 1 }, opinion = { druidism = "balance" } }, when = { class = "DRUID" } },
        { text = "I don't know, Keeper.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "My father would have liked to see that meeting. I would like to see it too, though I have learned to want things patiently." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "Older than you, mortal, though not older than me. I have seen wars end that everyone swore would never end." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "It holds because those who come here want it to hold. The Circle only reminds them, gently at first, and then less gently." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r4 = {
      lines = { { id = "op_r4_default", text = "Well said, young druid, and dangerously said. Be sure the balance you speak of is the forest's, and not merely your own convenience." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpt_remulos = {
      big = true,
      lines = { { id = "xpt_remulos_default", text = "Because a company of adventurers moves through the world like a storm, and a druid among them is the one who remembers that the world has to recover afterward. I have seen many heroes leave scorched ground behind their victories, and it is usually the druids who come back to replant it." } },
      choices = {
        { text = "We'll tread lightly, Keeper. The land matters as much as the battle.", next = "BACK", reply = "Then the land will remember your company kindly, little one, and so will I. A storm that knows where it treads is closer to rain.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Victory comes first. The land can recover later.", next = "BACK", reply = "It will recover, perhaps, but slowly, and long after your victory is a story. I have seen too many later springs that never came.", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xcl_st = {
      big = true,
      lines = { { id = "xcl_st_default", text = "Ysera set him to guard the temple she drowned, and he was her consort, so she trusted him with it above all others. But the Atal'ai's hunger seeped into his sleep, and the watcher became something that hates what it watches, and the shade below is only the part of him that could not stay away." } },
      choices = {
        { text = "He can still be saved. Even a dragon may find his way back.", next = "BACK", reply = "I hope so with all that I am, little one, for he was noble once and Ysera loved him. Go gently with him, if you can.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If he's lost, he must be put down before it spreads.", next = "BACK", reply = "It may come to that, and if it does, I will grieve it as Ysera will. But be very sure before you raise your blade against a green dragon.", fx = { align = { light = -1 } } },
        { text = "Does Ysera know what became of him?", next = "xcl_st2" },
      },
    },
    xcl_st2 = {
      lines = { { id = "xcl_st2_default", text = "She knows, as a mother knows a fever in the next room, and it grieves her. The Aspect of Dreams sleeps for the world's sake, little one, so she must watch the one she loves suffer in a dream she cannot wake him from." } },
      choices = {
        { text = "That is a heavy grief. Thank you for telling me.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Because your people have long listened to the stone, and the stone is slow to speak. If the spirits have found a new voice among the dwarves, perhaps the world is mending in ways even I did not foresee." } },
      choices = {
        { text = "The old ways of Ironforge will learn from this.", next = "BACK", reply = "They may, in time, and the stone will be glad of it. Slow learning is still learning.", fx = { align = { order = 1 } } },
        { text = "Ironforge's old ways are too slow. The spirits are freer.", next = "BACK", reply = "Freer, perhaps, but the stone is patient for a reason, little one. Do not scorn the slow ways too quickly.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Because my father fell in Ashenvale to warriors of the Horde, in the days when the demons' blood still ran in their veins. I do not hold their children to account for it, and the spirits plainly do not either, so I choose to see what you are rather than what came before you." } },
      choices = {
        { text = "Thank you, Keeper. I'll honour that trust in your glade.", next = "BACK", reply = "And I will honour yours, little one, as I have honoured every shaman who came in peace. The glade remembers kindness.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The Horde owes no one an apology for its past.", next = "BACK", reply = "Nor did I ask for one, little one. I only told you why the trees grow quiet when an orc walks among them.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Moonglade has room for anyone who comes to it in peace, and your Light, I think, is mostly peace dressed in armour. The druids sleep here and walk in the Emerald Dream, and all I ask is that you keep your voice low by the lake, and your hammer lower still." } },
      choices = {
        { text = "I'll walk gently here, Keeper. This is your father's place.", next = "BACK", reply = "You may walk any way you like, little one, as long as it is in peace. But I am glad you thought of him.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Light needs no one's leave, not even here.", next = "BACK", reply = "It needs no leave, and none is asked of it. But even the Light may choose to be quiet among the sleeping.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "There is a place for anyone who comes in peace, little one, and many warriors find a stillness here they never knew in battle. The Sentinels guard our borders and the Circle guards the land, but within these hills, your strength may rest." } },
      choices = {
        { text = "Then I'll rest my blade here and honour the glade's peace.", next = "BACK", reply = "Then you will find the glade a kind host, and perhaps the stillness will follow you a while. Rest well, little one.", fx = { align = { order = 1 } } },
        { text = "A warrior's blade never rests. Peace is only a pause between fights.", next = "BACK", reply = "Then I hope your pause is long and kind, little one. Even the fiercest wolf sleeps somewhere.", fx = { align = { order = -1 } } },
        { text = "Something else, Keeper.", next = "BACK" },
      },
    },
    orc_re = {
      big = true,
      lines = {
        { id = "ore_default", text = "You are. Grom Hellscream slew my father with demon blood in his veins, and then he spent his life to kill the demon who gave it to him; I have had a long time to weigh those two deeds, and I find I cannot hate a people for the first without honouring the second." },
        { id = "ore_warsong", when = { origin = "orc_warsong_kin" },
          text = "Warsong, are you? Then you carry Grom's name closer than most. Carry it well in this glade, child of his clan, and remember that the forest his axe fell in is still bleeding." },
      },
      choices = {
        { text = "Grom freed us. I won't apologise for him.", next = "BACK", reply = "Nor do I ask you to, little one. Grom paid his debt in his own blood, and the Circle has weighed it with the rest.", fx = { align = { honor = 1 } } },
        { text = "His axe cost you dearly. I'm sorry for it.", next = "BACK", reply = "Thank you, little one, though the sorrow is not yours to carry. Grom carried it for you, and he carried it well at the end.", fx = { align = { honor = -1 }, affinity = 2 } },
        { text = "You seem to forgive very easily.", next = "orc_re2" },
      },
    },
    orc_re2 = {
      lines = {
        { id = "ore2_default", text = "Easily? No, not easily, and not quickly either. But I am a keeper of the Dream as well as a son, and the Dream does not hold grudges; it only remembers, and I try to do the same." },
      },
      choices = { { text = "Something else, Keeper.", next = "BACK" } },
    },
    warlock_re = {
      big = true,
      lines = {
        { id = "wre_default", text = "I would not turn anyone from Moonglade who comes in peace, for the glade is protected and you cannot harm it here. But the fel you carry is the same that rots Felwood beyond these hills, and I would ask you to look at that forest before you call on it again." },
      },
      choices = {
        { text = "I've looked. I use it anyway, and carefully.", next = "BACK", reply = "Then you are honest, at least, and honesty is a beginning. Use it carefully, and remember what it did to my father's forest.", fx = { align = { light = -1 } } },
        { text = "I'll look, Keeper. Maybe it will change me.", next = "BACK", reply = "I hope it does, little one, and that the change is gentle. Felwood would welcome one less hand that harms it.", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunter_re = {
      lines = {
        { id = "hre_default", text = "Not here, within the glade, where every creature is under the Circle's protection. Beyond the hills the forest has its own laws, and a hunter who keeps them is no enemy of mine; my father hunted too, in his way." },
        { id = "hre_pet", when = { class = "HUNTER", pet = { named = true } },
          text = "{pet} knows the rule already; look how it walks, as if the grass might wake. The beasts understand the glade better than most of the druids who visit it." },
      },
      choices = {
        { text = "I'll keep the peace here.", next = "BACK", fx = { affinity = 1 } },
        { text = "How did Cenarius hunt?", next = "family" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The glade turns away no one who comes in peace, and shadow is part of the night as surely as the moon is. But shadow fed too long forgets it was ever part of anything, and devours what it touches, so hold it as the night holds it, lightly, and give it back to the dawn." } },
      choices = {
        { text = "I'll hold it lightly, Keeper, and give it back.", next = "BACK", reply = "Then you understand the night, little one, and the night will understand you. Give it back before it forgets to leave.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Shadow is mine to hold as tightly as I need.", next = "BACK", reply = "Then hold it well, for it will try to hold you back. I have seen shadow keep those who thought they kept it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Nothing within these hills, for the glade is warded and no blade is drawn here. The world outside is another matter, and I know your craft keeps many alive out there, but I would ask you to remember how it felt to walk here unafraid." } },
      choices = {
        { text = "I'll remember, and walk openly while I'm here.", next = "BACK", reply = "Thank you, little one, and the glade will notice. Walking openly here costs you nothing.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Old habits keep me alive. I'll keep to the dark.", next = "BACK", reply = "Then keep to it, but keep to the paths as well, and harm nothing here. The glade will forgive the dark if not the blade.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They remember it, which is not quite the same thing. Queen Azshara's Highborne drew on the Well until the Legion heard them, and the whole world paid, so the druids forswore that power, but I do not judge every mage for the sins of the Highborne." } },
      choices = {
        { text = "Power needs restraint, and the Highborne had none.", next = "BACK", reply = "They had none, and they called it greatness, and the world broke. You understand more than most, little one.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Power is neutral, Keeper. Fearing it helps no one.", next = "BACK", reply = "Neutral, perhaps, but those who hold it rarely are. The druids' fear was earned, little one, and it was earned with ash.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xalt_remulos = {
      lines = {
        { id = "xalt_remulos_default", text = "{alt} came by the long road, as you did, rested by the water and asked me very little, which I thought wise. I do not keep accounts of my guests as Rabine does, little one, but I remember faces, and yours is very like." },
        { id = "xalt_remulos_other", when = { alt = { faction = "other" } }, text = "{alt} wore the other banner, and still sat where you are sitting and watched the moonwell the same way. Your peoples are at war, little one, but when I see faces like yours and {alt}'s, I think the war runs shallower than it looks." },
      },
      choices = {
        { text = "I'd welcome a day when both sides rest here together.", next = "BACK", reply = "As would I, little one, and perhaps one day the glade will see it. Rest by the water and dream of it.", fx = { align = { light = 1 } } },
        { text = "The war is real, Keeper. A shared look won't end it.", next = "BACK", reply = "It is, and I know it better than most. But a shared look is how every peace begins, little one.", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_other", when = { alt = { faction = "other" } },
          text = "You remind me of {alt}, little one, a {altrace} who came to my glade under the other banner and sat a long while by the moonwell. The glade does not keep your wars, and I confess I like to see the same quiet look on faces from both sides of them." },
        { id = "h_alt_kin", when = { alt = { kin = true }, metBefore = false },
          text = "Another of your people walked here before you, little one, a {altclass} named {alt}, and the trees still speak of the visit. I wonder whether you know one another, or whether the world is simply smaller than it looks from Moonglade." },
        { id = "h_alt_druid", when = { alt = { class = "DRUID" }, ["not"] = { class = "DRUID" } },
          text = "{alt} studied in my glade, as every druid does in time, and I see something of the same patience in you. Perhaps the Circle will call to you as well one day, little one, whatever path you walk now." },
        { id = "o_ashenvale_wrong", tags = { "news" }, when = { opinion = { topic = "ashenvale", stance = "wrong" } },
          text = "I am told you think the felling of Ashenvale is wrong. Many say so in this glade, and fewer say it where the axes can hear." },
        { id = "o_cenarion_circle_distrust", tags = { "news" }, when = { opinion = { topic = "cenarion_circle", stance = "distrust" } },
          text = "There are those who call the Circle's neutrality cowardice, and I am told you are among them. Sit, then, and I will tell you what our neutrality has cost us." },
        { id = "h_pt_remulos", tags = { "news" }, when = { party = { class = "DRUID" } },
          text = "{companion} wears the Circle's teaching lightly, but I can see it, and I'm glad you travel with a druid. Moonglade is quieter when a sister or brother of the Circle walks in it." },
        { id = "h_cl_st", tags = { "news" }, when = { cleared = "The Temple of Atal'Hakkar" }, text = "Something in the Dream eased tonight, little one, and I think it was your doing. You have walked to the bottom of the Sunken Temple, where Eranikus's green children keep their long and unhappy watch." },
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" },
          text = "A shaman of the Horde, in my father's glade. The spirits walk with you, little one, and they are welcome here, as you are, though I will not pretend it is a simple thing for me to say." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, in my father's glade. The Light you carry is not the light of Elune or of the moon, little one, but it is a kind and steady thing, and the glade does not object to it." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, in my father's glade. You carry your weapon lightly here, little one, and I thank you for it, for Moonglade has long been a place where blades rest." },
        { id = "h_default", key = true,
          text = "I am Remulos, son of Cenarius, keeper of this glade. Moonglade has been the heart of the druids' craft since Malfurion first learned it here, and I guard it for all of them, whatever banners they fly beyond its hills." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "The tauren came to the Circle late and were made welcome. Not everyone in Darnassus wished it, but I did, and I do still." },
        { id = "h_nightelf", when = { race = "NightElf" },
          text = "Child of the forest, tell me, does the new tree on Teldrassil sing to you? I listen for it, and I do not hear what I hoped to." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Shen'dorei, the hidden people, come out of hiding. The winds kept you a long while, and I hope they taught you gently." },
        { id = "h_nightclaw", when = { origin = "skyborne_nightclaw" },
          text = "You were taught by the Nightclaw of your isle, I think, though you will not say so, and I will not ask what they asked you to keep. The Circle has kept a few secrets of its own, little one, and Moonglade does not pry." },
        { id = "h_hyjal", when = { origin = "nightelf_hyjal_survivor" },
          text = "You were at Hyjal, little one, when the Tree gave up its gifts. I felt it here, as the whole glade did, like a breath let out after ten thousand years, and I have wondered ever since what it felt like to those who stood beneath it." },
        { id = "h_seed", tags = { "news" }, when = { questActive = TODO_QUEST("Seed of Life") },
          text = "You smell of Maraudon's rot, little one, and yet there is something about you I almost know. Tell me why you have come to the shrine." },
        { id = "h_seed_done", when = { questDone = TODO_QUEST("Seed of Life") },
          text = "My brother's seed sleeps in good soil now. I thought Zaetar lost to us for good, and you brought me word that he was only waiting to be reborn." },
        { id = "h_warm", when = { disposition = { min = 75 } },
          text = "You walk gently in my glade, little one, and the trees have noticed it as well as I. Come, sit, and ask what you will." },
        { id = "h_visitor", when = { ["not"] = { class = "DRUID" } },
          text = "Few who are not druids find the road to Moonglade, for it runs through the furbolgs' tunnels and over the cold of Winterspring. You are welcome all the same." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde, in my father's glade. The trolls speak to their loa and the Forsaken to whatever answers them, and either way you are welcome here, little one, so long as you come in peace." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A shadow-walker, in my father's glade. There is nothing to steal in Moonglade, little one, and nobody to hide from, so you may walk in the open here." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage, in Moonglade. The kaldorei learned the price of the arcane when the Well of Eternity tore the world apart, little one, so forgive my druids if they watch your hands." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock, in my father's glade. You may rest here in peace, as any guest may, but the fel you carry is the very thing my druids give their lives to cleanse." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman, in my father's glade. The spirits walk with you, little one, and I am curious what led a child of the mountain to them." },
      },
      again = {
        { id = "h_again", text = "The glade is patient, and so am I. What else would you ask?" },
        { id = "h_again2", text = "Ask, little one. The trees are listening too, so ask kindly." },
      },
      choices = {
        { text = "Could the peace of this glade ever spread beyond it?", next = "op_ask" },
        { text = "What is the Cenarion Circle?", next = "circle" },
        { text = "Something seems to trouble you, Keeper.", next = "troubles" },
        { text = "You are Cenarius's son. Tell me of your family.", next = "family" },
        { text = "What is this place to the druids?", next = "glade" },
        { text = "I carry a seed from Zaetar's spirit.", next = "seed", when = { questActive = TODO_QUEST("Seed of Life") } },
        { text = "I'm a druid. What does the glade ask of me?", next = "druid", when = { class = "DRUID" } },
        { text = "I woke into a world the Circle slept through, Keeper.", next = "xinitiate", when = { origin = "nightelf_druid_initiate" } },
        { text = "I serve the Light. Is a priest welcome here?", next = "priest", when = { class = "PRIEST" } },
        { text = "A human, this far north. Do you see many of us?", next = "human", when = { race = "Human" } },
        { text = "You welcomed my people when others wouldn't.", next = "tauren", when = { race = "Tauren" } },
        { text = "An orc killed your father. Yet I'm welcome here?", next = "orc_re", when = { race = "Orc" } },
        { text = "I bind demons, Keeper. Will you turn me away?", next = "warlock_re", when = { class = "WARLOCK" } },
        { text = "I hunt, Keeper. Does the glade allow it?", next = "hunter_re", when = { class = "HUNTER" } },
        { text = "Is shadow welcome in Moonglade, Keeper?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Is there really nothing to hide from here, Keeper?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do your druids still blame the arcane for the Sundering, Keeper?", next = "xmage", when = { class = "MAGE" } },
        { text = "Is there a place for warriors in Moonglade, Keeper?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Does the Light have a place in Moonglade, Keeper?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why is it not simple to welcome a shaman, Keeper?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "Why should a dwarf's spirits interest you, Keeper?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "What happened to Eranikus, Keeper?", next = "xcl_st", when = { cleared = "The Temple of Atal'Hakkar" } },
        { text = "Why does a druid in our company matter to you, Keeper?", next = "xpt_remulos", when = { party = { class = "DRUID" } } },
        { text = "You spoke of someone who came here before me, Keeper.", next = "xalt_remulos", when = { alt = true } },
        { text = "The Circle sent me to Felwood, Keeper. The sickness has spread.", next = "xorig_grove", when = { origin = "nightelf_moonglade_keeper" } },
        { text = "I'll leave you to the glade.", next = "END", fx = { affinity = 1 } },
      },
    },
    xorig_grove = {
      lines = {
        { id = "xgr_default", text = "I know, little one, for I feel every league of it the way you would feel a bruise spreading under the skin. You raked these paths for years and never once complained, so tell me plainly, as you always did: how far south has it reached?" },
      },
      choices = {
        { text = "The streams run green as far as the Emerald Sanctuary.", next = "BACK", fx = { affinity = 1 } },
        { text = "Too far, Keeper. I don't know if it can be stopped.", next = "BACK" },
        { text = "Something else, Keeper.", next = "BACK" },
      },
    },
    xinitiate = {
      big = true,
      lines = {
        { id = "xin_default", text = "Slept through, yes, and you cannot sleep it back. While the Circle dreamed, the orcs came and my father fell in Ashenvale, and the kaldorei you woke beside must now share their forests with humans and tauren both. What will you make of that, little one, a loss or a beginning?" },
      },
      choices = {
        { text = "A beginning. The world grew while we slept, and that's good.", next = "BACK", reply = "A gracious answer, little one, and a wise one. The world did grow, and some of what it grew is worth keeping.", fx = { affinity = 2, align = { order = -1 }, trait = { curious = 1 } } },
        { text = "A loss. We should have been awake to guard it.", next = "BACK", reply = "Perhaps we should have, and I have asked myself the same. But we cannot sleep it back, so we must wake well now.", fx = { affinity = 1, align = { order = 1 }, trait = { stern = 1 } } },
        { text = "Do you blame the Circle for sleeping, Keeper?", next = "xinitiate_blame" },
      },
    },
    xinitiate_blame = {
      lines = {
        { id = "xib_default", text = "No, though I have wished, on the worst nights, that someone had woken a little sooner. The Dream asks much of those who walk it, and it gave back Malfurion and the rest of you when the world needed you most, so I count that a fair trade, little one, if not a kind one." },
      },
      choices = {
        { text = "Then I'll try to be worth the trade.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else, Keeper.", next = "BACK" },
      },
    },
    circle = {
      lines = {
        { id = "c_default", text = "Druids of every people who will hear the wild: elves, tauren, others now. We keep the balance where we can, and grieve it where we can't." },
      },
      choices = {
        { text = "Do all of you agree?", next = "staghelm" },
        { text = "I'd like to help keep it.", next = "BACK", fx = { affinity = 2, learn = { "cenarion_circle" }, align = { order = 1 } } },
        { text = "Balance is for the wild to keep, not a circle of druids.", next = "BACK", reply = "Perhaps the wild could keep it alone, once, before the Legion came and the Well shattered. Now it needs hands to help it, and the Circle's are some of the gentlest.", fx = { align = { order = -1 } } },
      },
    },
    staghelm = {
      lines = {
        { id = "st_default", text = "No, and the Archdruid and I agree least of all. He did not want the tauren taught our secrets, and I taught them. He raised a new World Tree without the Aspects' blessing, and I told him it was a selfish thing, done to win back what we lost." },
      },
      choices = {
        { text = "That's a hard thing to say to an Archdruid.", next = "BACK", fx = { trait = { curious = 1 }, learn = { "teldrassil" } } },
        { text = "Maybe he meant well.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else, Keeper.", next = "BACK" },
      },
    },
    troubles = {
      big = true,
      lines = {
        { id = "t_default", key = true,
          text = "The Emerald Dream was the purest of places, and something has crept into it. Druids who walk there come back changed, or not at all, and I watch, and I do not like what I see." },
      },
      choices = {
        { text = "Can it be stopped?", next = "stopped", fx = { learn = { "cenarion_circle" } } },
        { text = "Someone must still walk there.", next = "sleepers" },
        { text = "I'll be careful in my dreams.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    stopped = {
      lines = { { id = "s_default", text = "Everything can be stopped, little one, if enough hands hold it back. When you are strong, come and lend me yours." } },
      choices = {
        { text = "I will.", next = "BACK", reply = "Then I will hold you to it, little one, and I will be glad of your hands. The Dream has waited long enough.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The Dream's a druid problem, Keeper, and not mine.", next = "BACK", reply = "It may not seem so, little one, but the Dream touches every sleeper in this world. One day it will be your problem too.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    sleepers = {
      lines = {
        { id = "sl_default", text = "Those who gave up their waking lives to go into the Dream and guard it. Malfurion Stormrage himself walks there, and his body sleeps while his spirit wanders. I worry for them more each season, because the Dream has grown dangerous even for its friends." },
      },
      choices = {
        { text = "Then they need someone watching over them.", next = "BACK", fx = { affinity = 2, learn = { "malfurion" }, align = { light = 1 } } },
        { text = "They chose to sleep, and the waking world has troubles enough.", next = "BACK", reply = "Some chose it, and some were chosen, and all of them carry the waking world on their backs. Be gentle when you speak of them.", fx = { align = { light = -1 } } },
        { text = "What else should I know?", next = "BACK", fx = { learn = { "malfurion" } } },
      },
    },
    family = {
      lines = {
        { id = "f_default", text = "My father fell in the war, when the demons' servants came into the forests, and his children carry on as best we can. My brother Ordanus keeps the great tree at Raynewood in Ashenvale. My son Celebras is a keeper like me and his sisters are dryads, and I have not seen them in far too long." },
      },
      choices = {
        { text = "Did Cenarius have other sons?", next = "zaetar" },
        { text = "You haven't said where Celebras is now.", next = "celebras" },
        { text = "Something else.", next = "BACK" },
      },
    },
    zaetar = {
      big = true,
      lines = {
        { id = "z_default", text = "Zaetar, the cunning one, who always thought the world looked at me first. He loved Princess Theradras of the earth, and I told him the union was cursed. He would not hear me, and their children were the centaur, who murdered their father almost the moment they knew him." },
      },
      choices = {
        { text = "I'm sorry for your loss.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "The centaur killed their own father?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "You blame yourself for Zaetar, Keeper.", tag = "Persuade", next = "zaetar_regret",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "DRUID" }, { questDone = TODO_QUEST("Seed of Life") } } } },
          fail = { next = "zaetar_no", fx = { affinity = -1 } } },
      },
    },
    celebras = {
      lines = {
        { id = "ce_default", text = "He went into Maraudon in Desolace with his sisters to free Zaetar's spirit from Theradras, and the poison of that place took them instead. If you go down into those caves, look upon him gently, for he did not choose what he has become." },
      },
      choices = {
        { text = "I'll remember him, if I go there.", next = "BACK", reply = "Thank you, little one, and he will feel it, I think, even through the poison. He was a good son once.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Whatever he's become, I'll cut him down if he stands in my way.", next = "BACK", reply = "If you must, little one, then do it quickly and do it well. But remember he is my brother's son, and I will grieve him.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    seed = {
      big = true,
      lines = {
        { id = "sd_default", text = "Zaetar's spirit gave you this, the first seed from the life his body fed? Then my brother has found his place in nature at last, as was always his duty. I feared his pride and his rage had cost us him forever, and he was only waiting to grow again." },
      },
      choices = {
        { text = "He said to tell you his spirit lives on.", next = "BACK", reply = "Then I believe it, little one, and I am glad you were the one who carried it. My brother has come home at last.", fx = { affinity = 3, align = { light = 1 } } },
        { text = "A seed seems a small thing to show for a whole life.", next = "BACK", reply = "To you, perhaps, but a seed is how every forest begins. My brother has given more than you can see.", fx = { align = { light = -1 } } },
        { text = "Something else, Keeper.", next = "BACK" },
      },
    },
    glade = {
      lines = {
        { id = "gl_default", text = "It is the sacred centre of every druid's study, and it belongs to no kingdom and no warchief. Alliance and Horde druids sleep under the same trees here, and my wardens stop any quarrel before it is a fight." },
      },
      choices = {
        { text = "Who are your wardens?", next = "shrine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shrine = {
      lines = {
        { id = "sh_default", text = "Night elves and tauren alike, sworn to keep the peace in Nighthaven and at my shrine by the lake. Tajarri watches the shrine itself, and young druids take their Trial of the Lake under her eye." },
      },
      choices = {
        { text = "I'll keep the peace while I'm here.", next = "BACK", fx = { affinity = 1, standing = { nighthaven = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid = {
      lines = {
        { id = "d_default", text = "Only that you listen, and that you come home to it when the world is loud. Dendrite will set your trials, and the Great Bear Spirit will teach you what strength is for. The rest you will learn by walking." },
      },
      choices = {
        { text = "I'll listen, Keeper.", next = "BACK", fx = { affinity = 2, standing = { nighthaven = 1 }, align = { order = 1 } } },
        { text = "I'll learn by walking, Keeper, and find my own way.", next = "BACK", reply = "That is the best way, little one, and the only way the Circle truly teaches. The glade will be here when you return.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest = {
      lines = {
        { id = "p_default", text = "You are welcome, little one, and so is your Light, as long as it keeps its voice low among my trees. I have watched healers of many faiths kneel beside the same wounded beast, and I have never seen the beast ask whose prayer saved it." },
      },
      choices = {
        { text = "Then I'll heal what I can, and keep my voice low.", next = "BACK", reply = "Then you are welcome, and the wounded will bless you. Healing speaks softly and still reaches everyone.", fx = { affinity = 2, align = { light = 1 }, trait = { pious = 1 } } },
        { text = "My faith goes where I go, and I won't whisper it.", next = "BACK", reply = "You need not whisper, little one, only speak gently. The trees have heard louder prayers, and they have outlasted them.", fx = { align = { order = -1 } } },
        { text = "The Light answers anyone who asks.", next = "priest_light" },
      },
    },
    priest_light = {
      lines = {
        { id = "pl_default", text = "So does the wild, if they ask humbly enough, and few do. Perhaps your Light and my father's forest are not so far apart as your temples think." },
      },
      choices = {
        { text = "Perhaps not.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    human = {
      lines = {
        { id = "hu_default", text = "Few, and those few come with questions. There is one human who lives in Nighthaven, Umber, who keeps the Circle's archives and loses his books daily, and the druids think him brilliant. Ask Rabine where to find him, if you like your answers with a great many footnotes." },
      },
      choices = {
        { text = "I'll look for him.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = {
        { id = "ta_default", text = "I did, and I taught them secrets the Circle had guarded closely, because they had listened to the land all that while without being taught. Some in Darnassus have not forgiven me for it, and I find I do not need them to." },
      },
      choices = {
        { text = "My people remember it.", next = "BACK", fx = { affinity = 3, standing = { nighthaven = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    zaetar_regret = {
      lines = {
        { id = "zr_default", text = "I warned him that Theradras would be his ruin, and I was right, and being right has never once comforted me. I spoke to him as the son our father favored, little one, and I think that is all he heard." },
        { id = "zr_seed", when = { questDone = TODO_QUEST("Seed of Life") },
          text = "You carried his seed to me, so you have earned this. I warned Zaetar that Theradras would ruin him, and I was right, but I spoke as the son our father favored, and I think he heard only that before he went to her anyway." },
      },
      choices = {
        { text = "He chose her himself, Keeper. That was never your doing.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    zaetar_no = {
      lines = {
        { id = "zn_default", text = "Blame is a heavy word to carry into a glade this quiet, little one. Let it rest, and ask me something else." },
        { id = "zn_tauren", when = { race = "Tauren" },
          text = "Your people taught me that grief is shared, not handed over, and still this one I keep. Ask me something else, child of the plains." },
      },
      choices = {
        { text = "Of course, Keeper.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The glade hears much, and the trees tell me what they hear. Ask, little one, and I will answer as I can." },
      { id = "tp_knows_warm", when = { disposition = { min = 75 } },
        text = "You have always walked gently here, so ask what you will. I will keep little from you." },
    },
    background = { { id = "tp_bg", text = "I am a son of Cenarius, and Moonglade has been mine to keep since before your kingdoms had names.", next = "family" } },
    advice = { { id = "tp_ad", text = "Sleep lightly, little one, and do not go looking for the Dream. If it wants you, it will find you soon enough." } },
    cenarion_circle = { { id = "tp_circle", text = "My father's children, in a way, and not all of them agree with one another. That is how I know it lives." } },
    malfurion = { { id = "tp_malf", text = "He walks the Dream while his body sleeps, and I keep the glade for him until he wakes." } },
    worgen = { { id = "tp_worgen", text = "Wolves that are not wolves, in the human forests. I have heard of them, and I am troubled, for such things do not happen without a cause." } },
    emerald_dream = {
      { id = "tp_emerald_dream", text = "The Dream is the world as it was meant to be, before the Well and the Sundering, and Ysera keeps it. Lately something stirs at its edges that I do not like, little one, and I watch the glade more closely for it." },
      { id = "tp_emerald_dream2", when = { class = "DRUID" }, text = "You have walked the Dream's edges yourself, I think. If you see shadow where there should be green, come to me at once and tell me plainly." },
    },
    green_dragons = { { id = "tp_green_dragons", text = "Ysera's children are my old friends, and they have kept the Dream's gates since before the Sundering. Of late they speak less and watch more, and that is not their way." } },
    nordrassil = { { id = "tp_nordrassil", text = "Nordrassil is the oldest of the World Trees, and it bears the wounds of Hyjal still. I would sooner the Circle tended it than raise new trees in its place, but I am not asked." } },
    burning_legion = { { id = "tp_burning_legion", text = "My father fell to the orcs the Legion drove against him, and the Legion itself fell at Hyjal. It will come again one day, for it always does, and the glade will be ready." } },
    thrall = {
      { id = "tp_thrall", text = "The young warchief broke his people's chains, and his orcs fought beside the night elves at Hyjal. My father died at an orc's hand, and still I will not hate a people for the demon's blood they were made to drink." },
      { id = "tp_thrall2", when = { faction = "Horde" }, text = "Your warchief is welcome in Moonglade's peace, as you are. Tell him that his Warsong would honour my father's memory better by leaving Ashenvale's trees." },
    },
    tyrande = { { id = "tp_tyrande", text = "Tyrande Whisperwind has led her people since the Well, and she is the steadiest heart I know. She and Malfurion have waited for one another a long time, and I pray she does not wait much longer." } },
    cairne = { { id = "tp_cairne", text = "Cairne Bloodhoof understands the land as few mortals do, and his people honour the Circle. I am glad the tauren walk in Moonglade." } },
    elune = { { id = "tp_elune", text = "My father honoured Elune above all, and her light falls on this glade more gently than anywhere I know. Those who come here under her moon are always welcome." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw guard the passes to this glade, and they kept their minds when their cousins lost theirs. Treat them well, little one, because without them Moonglade would be harder to reach." } },
    highborne = { { id = "tp_highborne", text = "Azshara's court nearly ended the world, and my father fought to stop them. I remember, and so does every tree in this glade." } },
    _none = { { id = "tp_none", text = "That is beyond the glade, little one, and I have listened to the glade alone for ten thousand years. Rabine keeps better track of the world than I do." } },
  },
}

P:NPC {
  key = "rabine", id = TODO_NPC("Rabine Saturna"), name = "Rabine Saturna",
  bible = "bibles/nighthaven.md", role = "questgiver", tier = "quest",
  communities = { "nighthaven" }, temper = { "grave" }, values = { "careful", "loyal" },
  notices = { "lore", "form" },
  impression = {
    first = "Rabine Saturna keeps the Keeper's house in order so the Keeper need not think about it. He does not believe in chance, and he looked at me as though weighing what my coming here meant.",
    third = "{name} met Rabine Saturna, majordomo to Keeper Remulos, who watches over everything in Nighthaven the Keeper does not.",
  },

  greetings = {
    { id = "g_house", text = "Be at ease here. I keep the Keeper's house in order, and the Keeper's visitors. Speak, please." },
    { id = "g_back", when = { metBefore = true }, text = "Again you come to Nighthaven, and I don't think that's chance. I don't believe in chance." },
    { id = "g_away", when = { away = 14 }, text = "You return to Nighthaven after {away}, and again I don't think it is chance. Speak, please, and tell me what has drawn you back." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I am told that one of Nighthaven's people saw through a falsehood of yours, and the Keeper's house hears such things. Speak plainly here, please, for the peace of this glade rests on it." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The village speaks of the help you gave it, and I don't believe that was chance either, and the Keeper will hear of it if he hasn't already." },
    { id = "g_hyjal", when = { origin = "nightelf_hyjal_survivor" }, text = "You were at Hyjal; the Keeper told me so before you'd reached the door. Sit, please, and don't apologise for the gray at your temples, because half of Nighthaven has it now and the other half is merely lying about it." },
  },

  notice = {
    { id = "n_book", cat = "lore", when = { bookRead = "The Seven Kingdoms" },
      text = "A reader, good. The world remembers less than it thinks it does, and readers keep the rest." },
    { id = "n_form", cat = "form", when = { form = "travel" },
      text = "You came in at a run on four legs, so rest them. Nighthaven isn't going anywhere, and neither are its troubles." },
  },

  start = "hello",
  nodes = {
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "Their cultists turn up in Blackfathom and in Silithus with the same strange words on their lips, and the Circle is divided on how much to fear them. How do you see the Twilight's Hammer?" },
      },
      choices = {
        { text = "Madmen in robes. A few blades will end them.", next = "op_r1", fx = { align = { light = -1 }, trait = { brave = 1 }, opinion = { twilights_hammer = "contempt" } } },
        { text = "They're dangerous. Someone is giving them their orders.", next = "op_r2", fx = { affinity = 1, trait = { cautious = 1 }, opinion = { twilights_hammer = "dangerous" } } },
        { text = "Every cult is a cry for help. Talk to them.", next = "op_r3", fx = { align = { light = 1 }, trait = { kind = 1 }, opinion = { twilights_hammer = "pity" } } },
        { text = "I'll leave that to the Circle.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "I hope so. I've seen madmen end a great many blades, though, when they had enough of them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "That is my fear too, and I don't like whoever I imagine at the end of that chain. Tell Umber; he'll find you a book that frightens you properly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "You are kind, {class}, and I hope kindness keeps you alive in Blackfathom, because the cultists there are not kind at all." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpt_rabine = {
      big = true,
      lines = { { id = "xpt_rabine_default", text = "It is, because the Keeper wills it and the Circle keeps it, and nobody who has broken that peace has been welcomed back. I've watched sworn enemies share the same bridge here without a word between them, and it is the most hopeful thing I know." } },
      choices = {
        { text = "Neutral ground matters. Some places should stand above war.", next = "BACK", reply = "It does, and Moonglade is one of very few. I'm glad you understand what it costs to keep it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Peace by decree only lasts while someone's watching.", next = "BACK", reply = "That's true, and someone is always watching. The Keeper never sleeps through a broken peace.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "More than most of the Circle would admit. The spirits of this glade are old and patient, and if they've drawn a dwarf all the way from Ironforge, I'd look for their reason by the lake." } },
      choices = {
        { text = "The spirits guide me. I go where they send.", next = "BACK", reply = "Then they've chosen well in you, I think. I'd still keep a note of where they send you, for the Circle's sake.", fx = { align = { order = -1 } } },
        { text = "I choose my own road. The spirits only advise.", next = "BACK", reply = "A sensible answer, and one the spirits will likely respect. They seldom force anyone.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "More than most of the Circle would admit. The tauren druids among us hear the Earth Mother as you do, and the spirits of this glade are old and patient, so if they've drawn you here, there's something they wish you to see, and I'd look for it by the lake." } },
      choices = {
        { text = "I'll listen to them, and do what they ask.", next = "BACK", reply = "Then they'll be pleased with you, and so will the tauren druids. The Earth Mother keeps careful company.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I go where I choose. The spirits can follow if they like.", next = "BACK", reply = "They might, or they might find someone more willing. The spirits here are patient, but not endlessly.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I couldn't say yet, but nobody finds the road through Timbermaw Hold by accident. Perhaps you've come to learn that strength can be gentle, which the Keeper teaches, or perhaps you've come to find something you didn't know was missing, and either way I'll be watching to see which." } },
      choices = {
        { text = "I came because I was meant to. I'll trust that.", next = "BACK", reply = "Then you'll likely learn why soon enough. Moonglade has a way of showing people what they came for.", fx = { align = { order = 1 } } },
        { text = "I came because I chose to. Nothing sent me.", next = "BACK", reply = "Perhaps, and choice is no bad reason. But I'll be curious to see whether you leave the same way.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Rarely, because there is nothing here to fight, and that unsettles some of them more than a battle would. They pace the paths and polish their armour, and then they leave, and I write down that they were here and nothing happened." } },
      choices = {
        { text = "Then I'll see to it nothing happens. That's the right way here.", next = "BACK", reply = "Good, and the Keeper would be glad to hear it. Nothing happening is the whole point of Moonglade.", fx = { align = { order = 1 } } },
        { text = "A warrior without a fight is wasted. I'll find one beyond the hills.", next = "BACK", reply = "Then go and find it, and come back when you need the rest. The glade will still be here.", fx = { align = { order = -1 } } },
        { text = "Something else, Rabine.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because nothing in the glade is prey while the Keeper watches it, and the deer here have never learned to fear an arrow. Hunting them would be like robbing a sleeping man, and the Keeper would know, and so, eventually, would I." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I'll note {pet} in the ledger as well, if you don't mind. The Keeper likes to know who has been in his glade, beasts included." },
      },
      choices = {
        { text = "Then I'll hunt nothing here. Anything else would be dishonourable.", next = "BACK", reply = "That's the right answer, and the deer will never know it. The Keeper will, though.", fx = { align = { honor = 1 } } },
        { text = "Deer that don't fear arrows would be easy pickings.", next = "BACK", reply = "They would be, and that's why nobody here would dare. The Keeper would see to it, and so would I.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    forsaken_rb = {
      lines = {
        { id = "frb_default", text = "Welcome is a large word, and I'm a careful man with large words. You're permitted, as all are permitted who keep the peace; whether the druids will meet your eye is their business, though I'd note that most of them have been dead in all but body for centuries, asleep in the Dream." },
      },
      choices = {
        { text = "Permitted is enough. I'll keep the peace.", next = "BACK", reply = "It is, and I'll note that you kept it. A careful man notices who keeps the peace.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "I go where I like, permitted or not.", next = "BACK", reply = "Not in Moonglade, you won't, and I'll write that in the ledger too. The Keeper's patience has limits.", fx = { align = { order = -1 }, affinity = -1 } },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Perhaps to rest, or to be reminded that faith grows in more soil than one. The Circle has kept the balance in this glade since long before your people's grandmothers were born, and those who come asking questions usually leave carrying an answer they didn't expect." } },
      choices = {
        { text = "Then I'll listen, and see what the glade intends.", next = "BACK", reply = "That's all the glade asks, and you may find it intends kindness. It often does.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Nothing sent me, Rabine. I came because I chose to.", next = "BACK", reply = "Then you chose a quiet place, and I'm glad of it. Whatever brought you, the glade will make use of it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "On everyone who matters, and on many who think they don't. I don't believe in chance, and a rogue who wanders into Moonglade has a reason, even if you haven't told it to yourself yet." } },
      choices = {
        { text = "No reason but rest. You can close the ledger.", next = "BACK", reply = "I'll not close it, but I'll write rest beside your name. That's the best entry most visitors ever get.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Write what you like. You'll never read my reasons.", next = "BACK", reply = "I never expected to, rogue. I write down what you do, and that says enough.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because some of the eldest of the Circle were alive when the Highborne's magic drew the Legion into this world, and ten thousand years is not so long to an elf. They don't expect you to answer for it, but they will notice whether you've learned from it." } },
      choices = {
        { text = "Then I'll show them a mage can practise restraint.", next = "BACK", reply = "Do, and the elders will see it, though they'll be slow to say so. Ten thousand years makes for slow trust.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll study as I please. The Highborne aren't my burden.", next = "BACK", reply = "They are not your burden, I'll grant you, but they are the Circle's memory. You'll find the welcome cooler for it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Every sapling the fel has killed in Felwood is a debt someone owes, and your kind have run up a long account. I don't send collectors, mind; I simply wait, and sooner or later warlocks come here to pay it, whether they meant to or not." } },
      choices = {
        { text = "Then I'll pay some of it back in Felwood.", next = "BACK", reply = "Then you'll find the ledger a little lighter, and the Circle a little warmer. Felwood will notice too.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I owe the Circle nothing. The fel was there before me.", next = "BACK", reply = "It was, and someone summoned it. I'll leave the debt where it lies, but the druids won't forget.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Lists, mostly, and a good memory. The druids arrive from Darnassus and Thunder Bluff and expect the moonwell clean and the beds ready, and they are, because I see to it. Druids are wise about the forest and hopeless about laundry, I'm afraid, and someone has to be the opposite." } },
      choices = {
        { text = "You do good work, Rabine. Moonglade would be lost without you.", next = "BACK", reply = "Kind of you to say, and I won't pretend it's untrue. Someone has to keep the beds made while they dream.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Druids should tend themselves. Let them do their own laundry.", next = "BACK", reply = "Ha! I've said that to myself more than once, but don't tell them. They'd never manage it.", fx = { align = { order = -1 } } },
        { text = "Something else, Rabine.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_other", when = { alt = { faction = "other" }, metBefore = false },
          text = "Your name isn't in my ledger yet, but I've a {altrace} written down called {alt}, from the other side of the war, and the likeness nearly had me writing you beside it. I don't believe in chance, so I'll assume the resemblance means something." },
        { id = "h_alt_kin", when = { alt = { kin = true, faction = "same" }, metBefore = false },
          text = "Another of your people, and the ledger says {alt} came before you, a {altclass}, quiet, polite and no trouble at all. I don't believe in chance, so I'll assume you'll be the same." },
        { id = "o_peace_war", tags = { "news" }, when = { gossip = { topic = "peace", stance = "war" } },
          text = "The Keeper says you don't believe the glade's peace could ever travel. A little advice from the den mother: keep that thought outside the village." },
        { id = "h_pt_rabine", tags = { "news" }, when = { party = { size = 4 } },
          text = "Five of you, all at once, in the Keeper's own glade. Keep your voices low and your weapons sheathed, because Moonglade has been at peace since long before any of your kingdoms were born." },
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" },
          text = "A shaman of the Horde. I don't believe in chance, so I'll assume the spirits sent you here for a reason, and I'd very much like to learn what it is." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, in Nighthaven. I don't believe in chance, so I'll assume the Light had some reason for sending you here, though I can't for the life of me imagine what it is." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, in Nighthaven. I'll write your name in the ledger, as I do everyone's, and I'll note that you carried a weapon and kept it sheathed, which I hope you will." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. Your beast is welcome in Nighthaven, provided it hunts nothing within the hills, because the Keeper is particular about that." },
        { id = "h_default", text = "I am Rabine Saturna, majordomo to Keeper Remulos. He watches the glade, and I watch everything else so that he needn't, which is a quieter task than it sounds, most centuries." },
        { id = "h_locket", tags = { "news" }, when = { questActive = TODO_QUEST("A Reliquary of Purity") },
          text = "Southwind's ruins are deep in Silithus, and I've known for a while that a Reliquary of Purity lay there. I kept it quiet so as not to stir our enemies, but Eldre'Thalas leaves me no more time for quiet." },
        { id = "h_locket_done", when = { questDone = TODO_QUEST("Shards of the Felvine") },
          text = "The Felvine is sealed and in our keeping, and Milli's work is no longer a demon's plaything. You're welcome in this house as a hero of the Circle, and I don't say that lightly." },
        { id = "h_felvine", tags = { "news" }, when = { questActive = TODO_QUEST("Shards of the Felvine") },
          text = "Alzzin the Wildshaper holds the eastern halls of Eldre'Thalas, and the Felvine grows close to him. When he falls, seal what you can of it in the Reliquary and bring it here, with all the care you've got." },
        { id = "h_wasteland", when = { questActive = TODO_QUEST("Wasteland") },
          text = "Layo Starstrike waits at Valor's Rest, where Silithus buries its dead. Show him my letter and he'll trust you as I do." },
        { id = "h_remulos", when = { heardLine = "remulos.t_default" },
          text = "The Keeper spoke to you of the Dream? He doesn't tell many, so take it as a sign of trust, and a warning, both." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. I don't believe in chance, so I'll assume you were meant to come here, and I'll be curious to learn why." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue, in Nighthaven. I keep the Circle's ledger, so I'll know if anything goes missing, and I'll know who was standing near it." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. The Keeper is patient with your kind, and so am I, but the druids remember the Highborne better than most, so I'd keep any spellwork modest while you're here." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. I'll write your name down, as I do everyone's, and I'll be watching to see what you owe the Circle by the time you leave." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, home to Moonglade. Welcome back; Keeper Remulos may not say it himself, but he likes to see the Circle's children return, and I like to see them fed." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman. I don't believe in chance, so I'll assume the spirits sent you here for a reason, and I'd very much like to learn what it is." },
      },
      again = {
        { id = "h_again", text = "Go on, then. I've a ledger to finish, but it can wait for a good question." },
        { id = "h_again2", text = "What else? I'm listening, and I don't forget what I hear." },
      },
      choices = {
        { text = "What happens in Nighthaven?", next = "village" },
        { text = "I've always believed in chance myself.", next = "chance" },
        { text = "The Circle seems worried about something.", next = "silithus" },
        { text = "Another human lives here, I'm told?", next = "umber", when = { race = "Human" } },
        { text = "My people came from Eldre'Thalas, long ago.", next = "skyborne", when = { race = "Skyborne" } },
        { text = "The Keeper told me about the Dream.", next = "dream", when = { heardLine = "remulos.t_default" } },
        { text = "Is one of the Forsaken welcome in Moonglade?", next = "forsaken_rb", when = { race = "Scourge" } },
        { text = "Why would a priest be meant to come here, Rabine?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do you keep a ledger on everyone, Rabine?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why do the druids remember the Highborne so keenly, Rabine?", next = "xmage", when = { class = "MAGE" } },
        { text = "What would a warlock owe the Circle, Rabine?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do warriors cause trouble in Nighthaven, Rabine?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Why can't my beast hunt in Moonglade, Rabine?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What keeps Nighthaven running so smoothly, Rabine?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Why do you think I was sent here, Rabine?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the spirits and the Circle work together, Rabine?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "Do the spirits and the Circle work together, Rabine?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Is Moonglade really safe for both Horde and Alliance, Rabine?", next = "xpt_rabine", when = { party = { size = 4 } } },
        { text = "Goodbye, Rabine.", next = "END" },
      },
    },
    village = {
      lines = { { id = "v_default", text = "Druids come to learn and rest. Wardens keep the peace between peoples who'd otherwise not share a road. And I keep the ledger of who owes the Circle what." } },
      choices = {
        { text = "Who owes the Circle what?", next = "ledger" },
        { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } },
      },
    },
    ledger = {
      lines = { { id = "l_default", text = "Everyone who's been helped and hasn't yet helped back, which is nearly everyone. I don't send collectors, mind. I simply remember, and sooner or later the world brings them to my door." } },
      choices = {
        { text = "Then put my name down on the helping side.", next = "BACK", fx = { affinity = 2, standing = { nighthaven = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    chance = {
      big = true,
      lines = {
        { id = "c_default", text = "I've lived long enough to see the same patterns come round twice. When something seems like chance, it's usually a thread we haven't followed yet." },
      },
      choices = {
        { text = "Then I'll follow it.", next = "eldre", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Sometimes chance is just chance.", next = "just" },
      },
    },
    just = {
      lines = { { id = "j_default", text = "Perhaps. Come back in a few hundred years and tell me if you still think so." } },
      choices = {
        { text = "You must be following some thread yourself.", next = "eldre" },
        { text = "Something else.", next = "BACK" },
      },
    },
    eldre = {
      lines = {
        { id = "e_default", text = "Dire Maul, as most folk call it now, though I know it by its true name of Eldre'Thalas. It was a bastion of our magic long ago, and our agents have found something there that should have died in the War of the Ancients." },
      },
      choices = {
        { text = "What should have died?", next = "milli" },
        { text = "Something else.", next = "BACK" },
      },
    },
    milli = {
      big = true,
      lines = {
        { id = "m_default", text = "The Fruit of Fertility, the finest work of a naturalist named Millicent Serene, grown from a moonwell to protect and nourish the whole city. We thought it destroyed, and instead it lives on as the Felvine, rotting under a demon called Alzzin the Wildshaper. I won't let it be corrupted to the end, if only for Milli's memory." },
      },
      choices = {
        { text = "Then I'll help when I'm strong enough.", next = "BACK", reply = "Then I'll keep your name on the list, and send word when you're ready. The Felvine won't wait forever.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Burn the Felvine, then, because memories won't save anyone.", next = "BACK", reply = "Burn it if you can, and I'll not stop you. But Millicent's work deserves remembering, all the same.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    silithus = {
      lines = {
        { id = "si_default", text = "Silithus, west of Un'Goro, where our people fought a war long ago against something alien and terrible. It was sealed away, and now we suspect someone is trying to stir it." },
      },
      choices = {
        { text = "How much should the Circle fear the Twilight's Hammer?", next = "op_ask" },
        { text = "Who watches it for you?", next = "layo" },
        { text = "Something else.", next = "BACK" },
      },
    },
    layo = {
      lines = {
        { id = "la_default", text = "Layo Starstrike, at Valor's Rest, by the graves of those who fell in the wastes. When you're seasoned enough to survive Silithus, come to me and I'll give you a letter for him." },
      },
      choices = {
        { text = "I'll come when I'm ready.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    umber = {
      lines = {
        { id = "u_default", text = "Umber, our archivist, who is brilliant and knows it and can never find the book he had a moment ago. He calls me the den mother of this bear camp. I let him, because he's the only one who'd dare." },
      },
      choices = {
        { text = "He sounds good company.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    skyborne = {
      lines = {
        { id = "sk_default", text = "From Eldre'Thalas? Then it's no coincidence at all that you're standing in my house while I worry about that city, and you know I don't believe in those. Tell me one day what your people remember of it, and I'll tell you what mine do." },
      },
      choices = {
        { text = "I will, one day.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dream = {
      lines = {
        { id = "d_default", text = "Then you know more than most of Nighthaven does, so keep it close. The Keeper carries that worry so the rest of us can sleep, and I'd rather it stayed that way." },
      },
      choices = {
        { text = "I'll keep it close.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I keep track of everything that passes through Nighthaven, so the Keeper needn't. Ask, and I'll tell you what I've noted." },
    },
    background = { { id = "tp_bg", text = "I've served the Keeper as majordomo for longer than I'll admit, and I keep his house and the Circle's ledgers." } },
    advice = { { id = "tp_ad", text = "Don't go listening to the hearts of the world for answers. The answer is usually in you, and you already know it." } },
    cenarion_circle = { { id = "tp_circle", text = "The Keeper's charge, the Archdruid's pride, and my paperwork, though not in that order, some days." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw guard the tunnels into Moonglade, and they guard them jealously. I keep a gift of honey in the ledger every season, and it's money well spent." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The Keeper worries over the Dream, and when the Keeper worries, I keep the ledgers in better order. It's my way of praying." } },
    thrall = { { id = "tp_thrall", text = "The Horde sends its druids to the Circle, and Thrall's envoys are always courteous. I keep their names in the ledger alongside the elves', and the Keeper insists on that." } },
    tyrande = { { id = "tp_tyrande", text = "The High Priestess writes to the Keeper twice a year, and he reads every line twice. I file them both times." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "Every year someone asks to bring the Darkmoon Faire to Moonglade, and every year I decline on the Keeper's behalf. We have our own festival, and it is quieter." } },
    _none = { { id = "tp_none", text = "I'd have to look into it, and I do look into things. Give me time; Nighthaven has never lacked for that." } },
  },
}

P:NPC {
  key = "dendrite", id = TODO_NPC("Dendrite Starblaze"), name = "Dendrite Starblaze",
  bible = "bibles/nighthaven.md", role = "questgiver", tier = "quest",
  communities = { "nighthaven" }, temper = { "formal" }, values = { "balance", "dutiful" },
  notices = { "form", "class" },
  impression = {
    first = "Formal as Dendrite Starblaze is about the Circle's trials, there is a dry humour hiding under it. Anyone not here for the trials is told the village is lovely this time of year.",
    third = "{name} met Dendrite Starblaze, who guides young druids through the Cenarion Circle's first trials in Moonglade.",
  },

  greetings = {
    { id = "g_trial", text = "Balance be with you. If you've come for the trials, you've come to the right elf. If not, the village is lovely this time of year." },
    { id = "g_druid", when = { class = "DRUID", maxLevel = 12 }, text = "A young druid, fresh from the trainer? Good. The Circle has been expecting you, even if you didn't know it." },
    { id = "g_away", when = { away = 14 }, text = "Balance be with you, and welcome back after {away}. The village is still lovely this time of year, I'm pleased to report, though it was lovely when you left as well." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown a good deal since your last visit, and I'd ask whether the trials did it, except I suspect you found harder ones on your own." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear you talked someone in the village round, which is impressive, since most of them have been arguing with each other for a few thousand years, so do let me know your secret." },
  },

  notice = {
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "Ah, the Great Bear Spirit's gift sits well on you. Remember where you learned it." },
    { id = "n_not", cat = "class", when = { ["not"] = { class = "DRUID" } },
      text = "Not a druid, are you? You're welcome all the same, though the trials are another matter." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Closer than either side likes to admit, I think, though I'd not say it too loudly at a Circle gathering. You ask the spirits for their help, and we ask to borrow their shapes, and both of us end up with very muddy boots, which is how you can always tell a real practitioner." } },
      choices = {
        { text = "We're kin in spirit. The Circle should see that.", next = "BACK", reply = "Kin, yes, though the Circle is slow to say it. I'll mention it at the next gathering, quietly.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Druids and shamans walk different paths. Better to keep them apart.", next = "BACK", reply = "Perhaps, though I think the spirits would disagree. Still, every path is its own, and I'll respect yours.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The druids' trials, to learn their forms, and they go off to the Great Bear Spirit or the sea or wherever they're sent, and come back changed, in more ways than one. You'd find them very dull, I imagine, since the Light doesn't ask you to swim with the turtles, but I do enjoy watching your sort try to keep up." } },
      choices = {
        { text = "Every path has its trials. I respect theirs.", next = "BACK", reply = "They do, and theirs are as hard as any knight's vigil. I'm glad you see it.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll stick to my hammer. Turtles hold no wisdom for me.", next = "BACK", reply = "As you like, though the turtle would be offended, if it cared. Every teacher has something to offer.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "That strength which cannot wait is only noise, which young druids hate hearing almost as much as young warriors do. I've seen a few of your kind sit with the Bear for an afternoon and come back very quiet, and I've never known whether that was good." } },
      choices = {
        { text = "Patience is a warrior's strength too. The Bear is right.", next = "BACK", reply = "It is, and I'm glad to hear a warrior say so. The Bear will be pleased, in his slow way.", fx = { align = { order = 1 } } },
        { text = "Strength that waits loses the fight. The Bear isn't a warrior.", next = "BACK", reply = "Some fights, yes, but not all of them. The Bear has outlasted more warriors than you've met.", fx = { align = { order = -1 } } },
        { text = "Something else, Dendrite.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The bear's, certainly, since it's mostly about patience and watching, and hunters watch for a living. The lake's trial would be harder, because hunters like to keep their feet dry, and the lake prefers students who don't." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And {pet} is very well behaved, which is more than I can say for the druid in bear form who knocked over my reading table this morning." },
      },
      choices = {
        { text = "The trials belong to your students. I'll leave them be.", next = "BACK", reply = "Thank you, they'll be glad of it, even if they don't say so. Students hate an audience.", fx = { align = { order = 1 } } },
        { text = "I'd take your trials for the sport of it, Circle or not.", next = "BACK", reply = "For the sport of it, the Bear would send you home before sunset, I suspect. He has very little patience for anyone who has a great deal of it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren_dn = {
      lines = {
        { id = "tdn_default", text = "The same trials, the same spirits, the same cold water, and I mark them the same way. Some in Darnassus would rather I didn't, but Moonglade answers to Remulos and to the Circle as a whole, and the Great Bear has never once asked which city you came from." },
        { id = "tdn_pupil", when = { origin = "tauren_hamuul_pupil" },
          text = "Hamuul's own student! He was one of the first of your people Malfurion taught, and he sends me the most stubborn ones, which I've come to take as a compliment." },
      },
      choices = {
        { text = "Then I'll pass them as any druid would.", next = "BACK", fx = { affinity = 2 } },
        { text = "Darnassus can think what it likes.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Patience, mostly, and that the world doesn't need you to fix it all at once. Our young druids learn to cure poison like any traveller with a satchel, because a druid who can only heal with grand magic hasn't learned to heal at all." } },
      choices = {
        { text = "Humble work keeps a healer honest. I'll remember that.", next = "BACK", reply = "Then you've learned in a sentence what takes our young ones a season. Humble work is where most healing really happens.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll heal with whatever power gets it done.", next = "BACK", reply = "And the world will be grateful, mostly, though some power costs more than it saves. Choose your tools with care, healer.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Because the bear's way is to stand where it can be seen and dare the world to move it. Stealth has its uses, I'm sure, but you'll find nobody in Nighthaven who'll teach it, and the spirit would only yawn at you." } },
      choices = {
        { text = "Standing in the open has its own courage.", next = "BACK", reply = "It has, and the bear has worn it for longer than any of us. I'm glad you can see it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Courage in the open gets you killed. I'll keep to shadows.", next = "BACK", reply = "Perhaps it does, and I'll not argue with your survival. But the bear will never understand you, I'm afraid.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Fear is a strong word, though fire in a grove does make us twitchy. The arcane takes from the world without asking, and our trials teach young druids the opposite, which is why I'd rather you practised down by the lake, well away from the trees." } },
      choices = {
        { text = "Down by the lake, then. Your trees are safe from me.", next = "BACK", reply = "Thank you, and the trees will be glad, I'm sure. The lake is very forgiving of sparks.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The arcane is a craft like any other. I won't apologise.", next = "BACK", reply = "Nor should you, for a craft is a craft. But you'll understand if the druids keep their buckets close.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "A druid asks the bear for its strength and gives thanks, and a warlock binds a demon and gives orders. Both are power, I'll grant you, but one leaves the world as it found it, and the other leaves Felwood." } },
      choices = {
        { text = "Fair. I'll keep my demons well away from the grove.", next = "BACK", reply = "That's all we ask, and the grove will thank you for it. Some power is best kept at a distance.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Thanks or orders, the power's the same. Mine just obeys.", next = "BACK", reply = "Perhaps it does obey, for now. The bear has seen many obedient things turn on their masters.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman! You aren't here for the trials either, I suspect, but you'll understand them better than most, since your spirits and our forms are not such distant cousins." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! You aren't here for the trials, I expect, so I'll tell you what I tell everyone: the village is lovely this time of year, and nobody will ask you to turn into a bear." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! You aren't here for the trials, I assume, so I'll tell you the village is lovely this time of year, and that the Great Bear Spirit has opinions about strength you might enjoy." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! You aren't here for the trials, I'd guess, though you'd do better at some of them than my students, since you already know how to listen to a beast." },
        { id = "h_default", key = true,
          text = "I am Dendrite Starblaze, and I guide young druids through the Circle's first trials: the bear, the cleansing, the water. Each one teaches you something your trainer couldn't, as they taught me when Malfurion was still among us." },
        { id = "h_bear", tags = { "news" }, when = { questActive = TODO_QUEST("Great Bear Spirit") },
          text = "West along the mountains, you'll find the Great Bear Spirit, so listen to it. It doesn't say much, which makes what it says worth hearing." },
        { id = "h_bear_done", when = { questDone = TODO_QUEST("Great Bear Spirit"), maxLevel = 15 },
          text = "The Bear has seen you; I can tell by how you stand, rooted. Go back to your trainer now and claim what you've earned." },
        { id = "h_poison", when = { questActive = TODO_QUEST("Power over Poison") },
          text = "Poison is only nature turned the wrong way, so learn to turn it back. That's a druid's whole art, in small." },
        { id = "h_lake", tags = { "news" }, when = { questActive = TODO_QUEST("Trial of the Lake") },
          text = "The lake holds what you need. Dive, and keep diving until the water feels like a friend rather than a threat." },
        { id = "h_sealion", when = { questActive = TODO_QUEST("Trial of the Sea Lion") },
          text = "The pendant's two halves lie far from here, in deep water. Ask the folk of Moonglade where; our flight masters, Silva and Bunthen, know more than they let on." },
        { id = "h_aquatic", when = { questDone = TODO_QUEST("Aquatic Form") },
          text = "The sea's yours now, as much as the forest. Few druids feel at home in both, so try to be one of the few." },
        { id = "h_skyborne", when = { race = "Skyborne", class = "DRUID" },
          text = "A druid of the shen'dorei! There are few of you, I'm told, and you look to the winds before the moon, but the trials don't mind which. Balance is balance." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. You aren't here for the trials, I suspect, so I'll tell you what I tell everyone: the village is lovely this time of year." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue! You aren't here for the trials, I take it, which is just as well, because the Great Bear Spirit finds sneaking rather rude." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage. I'll tell you what I tell everyone who isn't a druid: the village is lovely this time of year, and please don't set any of it on fire." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock, in Nighthaven. I'm obliged to be polite and I will be, but I'd be lying if I said the Circle's trials and your craft had anything in common." },
      },
      again = {
        { id = "h_again", text = "Ask what you like. A student who asks nothing learns nothing, in my experience." },
        { id = "h_again2", text = "Go on, then; the trials will keep a moment longer." },
      },
      choices = {
        { text = "What are the trials for?", next = "trials" },
        { text = "Tell me about the trial of the water.", next = "water" },
        { text = "Why do young druids need a trial of cleansing at all?", next = "poison" },
        { text = "I'm no druid. May I watch the trials?", next = "nondruid", when = { ["not"] = { class = "DRUID" } } },
        { text = "I'll need to find the pendant halves somehow.", next = "pendant", when = { questActive = TODO_QUEST("Trial of the Sea Lion") } },
        { text = "My faith leans to the winds. Does that matter?", next = "winds", when = { race = "Skyborne", class = "DRUID" } },
        { text = "Hamuul taught me. Are the trials the same for tauren?", next = "tauren_dn", when = { race = "Tauren", class = "DRUID" } },
        { text = "Could a priest learn anything from the druids' trials, Dendrite?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Why would the Great Bear Spirit mind a little stealth?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Does the Circle really fear a mage's fire, Dendrite?", next = "xmage", when = { class = "MAGE" } },
        { text = "Is a warlock's craft really so unlike a druid's, Dendrite?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What does the Great Bear Spirit say about strength?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Which trials would a hunter do well at, Dendrite?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What are the trials you mentioned, Dendrite?", next = "xapala", when = { class = "PALADIN" } },
        { text = "How alike are shamans and druids, Dendrite?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Thank you, Dendrite.", next = "END" },
      },
    },
    trials = {
      big = true,
      lines = {
        { id = "t_default", text = "A druid who can wear a shape but doesn't understand it is just a person in a costume. The trials teach the understanding. The shapes come after." },
      },
      choices = {
        { text = "I understand.", next = "BACK", fx = { affinity = 2, learn = { "cenarion_circle" } } },
        { text = "The shapes seem like the fun part.", next = "fun" },
      },
    },
    fun = {
      lines = { { id = "f_default", text = "They are, and I'd never say otherwise. But a bear that doesn't know why it's a bear makes a very poor bear." } },
      choices = {
        { text = "Then the bear must be for something else.", next = "bear" },
        { text = "I'll take your word on bears.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    bear = {
      lines = {
        { id = "b_default", text = "Strength of body and strength of heart, as the Great Bear Spirit puts it, and the second matters more. A mother bear guarding her cubs isn't strong because she's large; she's strong because she will not move." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    water = {
      lines = {
        { id = "w_default", text = "Two trials. First you dive Lake Elune'ara for a shrine bauble that crumbles if you dawdle, and carry it to the Shrine of Remulos, where Tajarri waits. Then you find the two halves of the Pendant of the Sea Lion and join them at the shrine." },
      },
      choices = {
        { text = "Why a pendant in two halves?", next = "water2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    water2 = {
      lines = {
        { id = "w2_default", text = "One half holds the sea lion's agility and the other its endurance, and a druid in the water needs both in equal measure. Swim fast and tire early, and you drown; swim slow and never tire, and you never arrive." },
      },
      choices = {
        { text = "Balance again.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    poison = {
      lines = {
        { id = "p_default", text = "Because Cenarius gave us the power to purge poison with a word, and a gift that easy is easily misused. So we send our students to Auberdine's sick deer, or the Crossroads' sick gazelles, with nothing but salve and their own two hands." },
      },
      choices = {
        { text = "What was poisoning them?", next = "poison2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    poison2 = {
      lines = {
        { id = "p2_default", text = "Water, in both places: the falls of Cliffspring in Darkshore, and the pools atop Dreadmist Peak, which we think the Burning Blade fouled. Those animals are victims of a greater taint, and there are those in Darnassus who'd rather not see it." },
      },
      choices = {
        { text = "I'll keep my eyes open.", next = "BACK", reply = "Do, and send word if you find anything. The Circle in Darnassus may not listen, but I always will.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "If Darnassus won't look, I'll go and see for myself.", next = "BACK", reply = "Then go carefully, for those waters have poisoned stronger things than you. Bring back what you learn, if you can.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    nondruid = {
      lines = {
        { id = "n_default", text = "Watch, by all means, though most of the trials happen underwater or a long way off, so there isn't much to see. Moonglade welcomes anyone who respects nature, and our wardens will stop anyone who doesn't." },
      },
      choices = {
        { text = "I'll respect it.", next = "BACK", fx = { affinity = 1, standing = { nighthaven = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pendant = {
      lines = {
        { id = "pe_default", text = "Ask Silva and Bunthen by the flight perches; between them they know where both halves were hidden. Then bring the halves back to the shrine and join them there, for they won't join anywhere else." },
      },
      choices = {
        { text = "I'll ask them.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    winds = {
      lines = {
        { id = "wi_default", text = "Not to me, and not to the Keeper, I think. The Circle has druids who pray to Elune and druids who pray to the Earth Mother, and the bears never seem to notice the difference." },
      },
      choices = {
        { text = "Good to know.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've guided many young druids through their trials, and they ask me a great many things. Ask what you need." },
    },
    background = { { id = "tp_bg", text = "I'm the Circle's guide for young druids in Nighthaven, and I've watched more bears take their first clumsy steps than I can count." } },
    advice = { { id = "tp_ad", text = "Learn the lesson before you learn the spell. I once had a student turn into a bear before he knew why, and he spent a week in the Keeper's honey." } },
    cenarion_circle = { { id = "tp_circle", text = "Our order and our duty, and Nighthaven is its hearth." } },
    emerald_dream = {
      { id = "tp_emerald_dream", text = "Every young druid who comes here dreams green for the first time sooner or later. I tell them not to chase it, and to come back and tell me when it happens." },
      { id = "tp_emerald_dream2", when = { class = "DRUID" }, text = "You've felt the Dream already, haven't you, at the edge of sleep. Don't be frightened, and don't be greedy, and it'll show you more when you're ready." },
    },
    nordrassil = { { id = "tp_nordrassil", text = "Nordrassil is where our long lives come from, and every druid should see it once. Even the tauren ones go home quieter after." } },
    earth_mother = { { id = "tp_earth_mother", text = "The tauren druids here speak of the Earth Mother as we speak of Cenarius, and I've stopped thinking they mean different things. It's all the same green." } },
    timbermaw = { { id = "tp_timbermaw", text = "The young druids sometimes come through the Timbermaw tunnels and get chased out again. Be polite to the furbolgs, and bring something sweet." } },
    _none = { { id = "tp_none", text = "That's not my trial to teach, but Loganaar might know, or Rabine, who forgets nothing in all his long years." } },
  },
}

P:NPC {
  key = "loganaar", id = TODO_NPC("Loganaar"), name = "Loganaar",
  bible = "bibles/nighthaven.md", role = "trainer", tier = "service",
  prejudice = { race = "Scourge", amount = 12, why = "a druid of balance who feels the Forsaken as a crack in the cycle of life and death" },
  communities = { "nighthaven" }, temper = { "calm" }, values = { "balance", "kind" },
  notices = { "class" },
  impression = {
    first = "Balance, says Loganaar, is something you carry, not somewhere you go. He suggested I sit a while for no reason at all, and it was better advice than it sounded.",
    third = "{name} met Loganaar, the calm druid trainer of Nighthaven, who teaches that balance begins within.",
  },

  greetings = {
    { id = "g_pj_dead", when = { prejudiced = true }, text = "One of the Forsaken, in Nighthaven. Honesty sits easier here than politeness, so I'll say it: everything that lives goes back to the soil, and you didn't, and I can't look at you without feeling the cycle has a crack in it." },
    { id = "g_pj_over", when = { prejudiced = "overcome" }, text = "I was unkind to you once, in my head if not aloud. I've thought about it since, and I think the crack in the cycle was never yours to mend, so sit, if you like." },
    { id = "g_calm", text = "Peace, friend. Even inside these stone walls it's there, if you stop long enough to find it." },
    { id = "g_druid", when = { class = "DRUID" }, text = "{g:Brother|Sister}, come in. If you're ready to learn, then I'm ready to teach." },
    { id = "g_initiate", when = { origin = "nightelf_druid_initiate" }, text = "Peace, initiate. You still move like someone half in the Dream, careful of a world that might change while you blink, and that's no bad thing, but sit, because Moonglade at least will stay put while you learn it." },
    { id = "g_away", when = { away = 14 }, text = "Peace, friend, and welcome back after {away}. I hope you found a little stillness on the road, because I suspect you needed it." },
    { id = "g_word_threat", when = { word = "intimidated" }, text = "I hear you frightened someone in the village, and fear is a storm that leaves the one who raised it shaking too, if you notice, so sit a while and see whether it's true." },
  },

  notice = {
    { id = "n_not", cat = "class", when = { ["not"] = { class = "DRUID" } },
      text = "You're no druid, but sit if you like. The bench is free, and so is the birdsong." },
  },

  start = "hello",
  nodes = {
    pj_logan = {
      lines = { { id = "pj_logan_default", text = "Do I? Then I'm worse at hiding it than I'd hoped. Balance means a thing is born, lives and goes back to the earth, and a druid feels it go back, but with you I feel nothing go anywhere, and that frightens me more than any beast." } },
      choices = {
        { text = "Is it me you fear, or what was done to me?", next = "pj_logan2" },
        { text = "Then teach me what the cycle asks of the dead.", next = "BACK", reply = "That's a brave request, and I'm not sure I know the answer. But I'll try, if you're willing to sit with me a while.", fx = { align = { order = 1 } } },
        { text = "The cycle broke. I'll make my own way outside it.", next = "BACK", reply = "Then I hope your way is kind to you. The cycle doesn't hate you, only misses you, I think.", fx = { align = { order = -1 } } },
        { text = "I don't blame you. I flinch at mirrors myself.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    pj_logan2 = {
      lines = { { id = "pj_logan2_default", text = "What was done to you, I think, though the two are hard to pull apart from where I sit. The plague was made by someone, and someone meant it, and I suppose I look at you and see their work instead of your face." } },
      choices = {
        { text = "My face is the one you'll be dealing with, druid.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "It means knowing when to be the storm and when to be the still water, and accepting that you won't always choose right. You shamans speak to the elements, and we become a part of them, but both of us have to listen far more than we speak, and that's the hardest lesson there is." } },
      choices = {
        { text = "Listening first is the shaman's way too. I agree.", next = "BACK", reply = "It is, and I'm glad our paths meet in that. The elements and the beasts both reward a patient ear.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The elements answer strength, not patience.", next = "BACK", reply = "Sometimes, but even strength has to know when to wait. The storm that never rests blows itself out.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because balance is something you carry, and a man who's sure of everything carries it all on one side. I don't ask you to doubt your Light, only to wonder now and then whether the moon and the spirits might see something it doesn't, and that wondering is what keeps a person upright." } },
      choices = {
        { text = "There's wisdom in that. I'll keep some room for doubt.", next = "BACK", reply = "Thank you, and I think your Light will grow the stronger for it. Doubt is a kind of humility.", fx = { align = { order = -1 } } },
        { text = "My faith is my balance. I need nothing more.", next = "BACK", reply = "Then it's a steady faith, and I hope it holds. Only remember, the heaviest stone tips the scale in the end.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The same way a druid does, by knowing when to fight and when not to, and most warriors only practise the first half. Sit a while in the glade, and you'll find the second half is harder, and worth more." } },
      choices = {
        { text = "Then I'll practise the second half. Knowing when to stop matters.", next = "BACK", reply = "Then you'll be a rarer warrior than most, and a better one. The glade is a good place to learn it.", fx = { align = { order = 1 } } },
        { text = "My balance is in the fight. Stillness is for druids.", next = "BACK", reply = "For some, perhaps, and you may be one of them. But even the bear sleeps through winter.", fx = { align = { order = -1 } } },
        { text = "Something else, Loganaar.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "More than either will admit, because both of us listen to the wild and take only what it gives. The difference is that a druid becomes the beast and a hunter walks beside it, and I've never been sure which is harder." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And {pet} looks very settled here. Beasts always do in Moonglade, as if they know how close the grove sits to the Dream." },
      },
      choices = {
        { text = "A hunter keeps the beast and the wild in balance. That's the way.", next = "BACK", reply = "It is, and I'd be glad to walk beside you on that path. We have more in common than either side admits.", fx = { align = { order = 1 } } },
        { text = "I take what the wild gives, and sometimes more. That's the hunt.", next = "BACK", reply = "Sometimes more is how the wild grows thin, hunter. I'd ask you to watch the herds before you take.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    darnassus_lg = {
      lines = {
        { id = "dlg_default", text = "The Archdruid does, I know, and he says it loudly enough to be heard from here. I came to Moonglade because I wanted to teach where the Circle is whole, Horde and Alliance both, and if that makes me a fool then I'm a contented one." },
      },
      choices = {
        { text = "Fandral built our home. He's earned his say.", next = "BACK", reply = "He did, and I'll not take that from him. But a home can be built by one hand and kept by many.", fx = { align = { order = 1 } } },
        { text = "The Circle should be whole. You're right.", next = "BACK", reply = "Thank you, and I'll keep teaching that way as long as I'm able. The Circle is stronger whole.", fx = { align = { order = -1 }, affinity = 2 } },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Better than you'd think, since the night needs the dark half as much as the bright. It's only when a healer forgets that shadow is half of a whole and starts treating it as the whole that the scale tips, and I've seen it tip in priests and druids alike." } },
      choices = {
        { text = "Then I'll mind the other half, and not let it tip.", next = "BACK", reply = "Then you'll keep your balance, and your night will be the better for it. That's all I ask of any healer.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let it tip, then. Shadow gets results.", next = "BACK", reply = "Results, yes, but at what cost to you? I've seen healers who tipped and never came back up.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "You can try, which is more than most rogues ever do. Your craft is always leaning one way or another, toward the knife in the dark or away from it, and balance is learning when to stop leaning." } },
      choices = {
        { text = "Then I'll learn to sit still, at least here.", next = "BACK", reply = "That's a start, and a good one, and the glade will help you. Stillness is a craft like any other.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Leaning keeps me alive. Balance can wait.", next = "BACK", reply = "It may, and I won't pretend otherwise. But balance doesn't wait forever, rogue.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "By remembering that the arcane isn't the whole world, only a very loud part of it. The Highborne forgot that and the sea took their cities, so I'd say a quiet hour by the lake is worth more to you than another tome." } },
      choices = {
        { text = "Then I'll take the quiet hour and set down the tome.", next = "BACK", reply = "Then you'll find the lake a patient teacher, and quieter than any library. I'm glad of it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The tome teaches more than any lake, Loganaar.", next = "BACK", reply = "It teaches much, I'm sure, but not everything. The Highborne read all their tomes and drowned anyway.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Perhaps, if the warlock is honest about the weight on the scale. Most aren't, and that's how a little fel in a satchel becomes a forest like Felwood, one excuse at a time." } },
      choices = {
        { text = "Then I'll be honest about my demons.", next = "BACK", reply = "Then you'll be rarer than most, and I'll be glad to know you. Honesty is the start of balance.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Balance is for druids. I carry what I must.", next = "BACK", reply = "Everyone carries something, warlock, and I'll not argue that. Only be careful how much.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman. You know balance better than most, I think, because the elements are never still, and a shaman who tries to make them so soon learns how foolish that is." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, in Nighthaven. You carry a great deal of armour and a great deal of certainty, and I'd wager the certainty is the heavier of the two, so sit a while, if you'd like to set it down." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, in Nighthaven. You carry your balance in your shoulders, I see, which is good for a shield and poor for sitting still." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, in Nighthaven. You carry your balance between you and your beast, I think, and that's a wise way to carry it." },
        { id = "h_default", text = "I am Loganaar, and I train the druids who find their way to Nighthaven. Balance isn't somewhere you go but something you carry, as Cenarius taught us, and I help you pack." },
        { id = "h_dream", when = { minLevel = 20, class = "DRUID" },
          text = "One day the Dream will call you, and you'll sleep a long while among the purest of things. Learn all you can awake, first." },
        { id = "h_tea", when = { metBefore = true }, text = "Sit, if you have a moment, not for training but only to sit. Most druids forget to, and it shows in their bears." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde, in Nighthaven. Balance is something you carry, priest, and yours looks heavier than most, so sit, if you'd like to set it down for a moment." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue, in Nighthaven. You carry your balance on the balls of your feet, I see, which is good for a quick exit and poor for sitting still." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage, in Nighthaven. You carry a great deal of power, I can tell, and power is the heaviest thing there is to keep in balance." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. Balance is something you carry, and yours has a demon sitting on one side of the scale, so I'd guess it's hard going." },
      },
      again = {
        { id = "h_again", text = "Something more? There's no hurry in Nighthaven, whatever they tell you in the cities." },
        { id = "h_again2", text = "Go on. I've packed a great many druids' questions, and there's always room for another." },
      },
      choices = {
        { text = "What brought you to Nighthaven?", next = "why" },
        { text = "Train me.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "Balance seems hard to find these days.", next = "balance" },
        { text = "In Darnassus they call Moonglade's druids fools.", next = "darnassus_lg", when = { race = "NightElf", class = "DRUID" } },
        { text = "Can a priest of shadow keep the balance, Loganaar?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Can someone like me find balance by sitting still, Loganaar?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "How does a mage keep their power in balance, Loganaar?", next = "xmage", when = { class = "MAGE" } },
        { text = "Can a warlock ever be in balance, Loganaar?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "How does a warrior keep balance, Loganaar?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do hunters and druids share any of the same wisdom?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Why would I want to set down my certainty, Loganaar?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What does balance mean to a druid, Loganaar?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "You flinch when you look at me, Loganaar.", next = "pj_logan", when = { prejudiced = true } },
        { text = "Farewell.", next = "END" },
      },
    },
    balance = {
      lines = { { id = "b_default", text = "Look inward before you look outward. Most of what's out of balance in the world started out of balance in someone." } },
      choices = { { text = "Thank you.", next = "END", fx = { affinity = 1 } } },
    },
    why = {
      lines = {
        { id = "w_quiet", text = "The stillness. Everywhere else the world kept asking something of me, but here it only asks that I listen, and my old knees are grateful for the rest." },
      },
      choices = { { text = "I'll try to listen.", next = "END", fx = { affinity = 2, trait = { patient = 1 } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Balance comes from knowing a little of everything. Ask, and I'll share what I've learned." },
    },
    cenarion_circle = { { id = "tp_circle", text = "Home, for those of us who've no other, and for some who have." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The Dream is stillness itself, and that's why the young druids find it so hard to reach. They try too hard, and it slips away from them." } },
    earth_mother = { { id = "tp_earth_mother", text = "The tauren call her the Earth Mother, and I've learned a great deal about stillness from the way they speak of her. Peace, friend, by any name." } },
    elune = { { id = "tp_elune", text = "Elune's moon over the lake is the best teacher of stillness I know. Sit, and watch it, and let it teach you." } },
    nordrassil = { { id = "tp_nordrassil", text = "Nordrassil's roots go deeper than any of us can feel, and I find that comforting. Some things are steady whatever happens." } },
    _none = { { id = "tp_none", text = "Ask Rabine. He keeps a ledger of everything, including, I suspect, how often I nap." } },
  },
}

P:NPC {
  key = "great_bear", id = TODO_NPC("Great Bear Spirit"), name = "Great Bear Spirit",
  bible = "bibles/nighthaven.md", role = "questgiver", tier = "quest",
  communities = { "nighthaven" }, temper = { "patient" }, values = { "strength", "patience" },
  spiritSensitive = true,
  notices = { "form" },
  impression = {
    first = "The Great Bear Spirit speaks in a voice felt in the chest more than heard with the ears. It told me that strength that cannot wait is only noise, and I keep turning that over.",
    third = "{name} sat before the Great Bear Spirit in Moonglade, an ancient presence that teaches patience as the root of strength.",
  },

  greetings = {
    { id = "g_calm", text = "The great bear looks at you, calm and unhurried. Its voice, when it comes, is in your chest more than your ears." },
  },

  notice = {
    { id = "n_bear", cat = "form", place = "replace", when = { form = "bear" },
      text = "The spirit's gaze softens. You wear its shape, and it seems to know you, the way kin know kin." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "That you hear the earth and the wind and do not always answer them. That is good, little one, because the one who answers every whisper is pulled in every direction, and the bear has seen many shamans grow thin from trying to please all of them at once." } },
      choices = {
        { text = "I'll choose which voices to answer, as you say.", next = "BACK", reply = "Good, little one, and you will find the world quieter for it. The wise one listens to many and answers few.", fx = { align = { order = -1 } } },
        { text = "The spirits deserve an answer, every one of them.", next = "BACK", reply = "Then you will be pulled in every direction, little one, and you will tire. Even the mountain does not answer every wind.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Strength that waits. A bear does not charge at every noise in the woods; it waits, and it watches, and it rises only when it must. Your armour is strong, little one, but if you charge at every shadow, you will grow tired before the true enemy comes." } },
      choices = {
        { text = "I'll learn to wait, Great Bear. That is wisdom.", next = "BACK", reply = "It is, little one, and the waiting will make your strength truer. You will rise when you must.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Waiting lets evil grow. I'll strike when I see it.", next = "BACK", reply = "Sometimes it does, and the bear rises then. But the one who strikes at every shadow strikes his friends as well.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "It knows what all beasts know, little one, that the wild was here before the hunter and will be here after. A hunter who forgets that hunts poorly, and a hunter who remembers it hunts as the bear does, slowly and only for need." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "{pet} sits easy before me, as few mortals do. It does not hurry, little one, so learn from it." },
      },
      choices = {
        { text = "Then I'll hunt only for need, as the bear does.", next = "BACK", reply = "Then you will hunt well, little one, and the wild will feed you gladly. That is the old way.", fx = { align = { light = 1 } } },
        { text = "The wild doesn't care why I hunt. I'll hunt as I please.", next = "BACK", reply = "The wild does not care, little one, but it remembers. Those who forget it grow hungry in the end.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warrior_gb = {
      lines = {
        { id = "wgb_default", text = "Strength. You use the word as if it were a weapon, little one, but the bear's strength is mostly standing still, and sleeping through winters, and not being moved. Can a warrior stand still?" },
      },
      choices = {
        { text = "When it matters, I won't be moved.", next = "BACK", reply = "Good, little one, and the mountain will see it when it does. That is the strength of the bear.", fx = { align = { order = 1 }, affinity = 2 } },
        { text = "A warrior who stands still dies.", next = "BACK", reply = "Some do, little one, and some live because they did. Learn which is which, and you will be wiser than most.", fx = { align = { order = -1 } } },
        { text = "(Sit quietly with the spirit.)", next = "sit" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The strength to stand between the wounded and what would finish them, and not be moved. A mother bear does not ask whether her cub deserves protecting, and a true healer does not ask it of the wounded either." } },
      choices = {
        { text = "Then I'll heal without asking who deserves it.", next = "BACK", reply = "Then you have the strength of the mother bear, little one, and it is a great strength. The wounded will bless you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Some don't deserve healing. I choose who I save.", next = "BACK", reply = "You may, little one, and the bear will not stop you. But the mother bear would never choose.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "When there is something behind you that cannot run, and nowhere left for it to go. Stealth serves you well in the forest, but a day will come when hiding is not enough, and you must decide what you are willing to stand for." } },
      choices = {
        { text = "Then I'll stand when it matters, spirit.", next = "BACK", reply = "Good, little one, and when that day comes, the bear will stand beside you. That is all it asks.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Standing is for bears. I'll find another way.", next = "BACK", reply = "Perhaps you will, little one, and perhaps there will be none. Remember the bear when you find yourself cornered.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "That power used in haste is only noise, as loud and as quickly gone. The Highborne were quick and clever and very sure of themselves, and the bear watched them drown, and slept, and woke, and is here still." } },
      choices = {
        { text = "Patience, then. I'll learn to wait before I strike.", next = "BACK", reply = "Good, little one, and the bear will be glad of it. The quiet strike is the one that lands.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Haste wins battles, spirit. Patience loses them.", next = "BACK", reply = "Some battles, little one, and some are lost by it. The Highborne were very quick.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because a demon is all hunger and no patience, and the bear has outwaited many hungry things. The fel you carry will ask and ask of you, little one, and the strength the bear teaches is the strength to answer no." } },
      choices = {
        { text = "Then I'll learn to tell my demon no.", next = "BACK", reply = "Then you will be stronger than your demon, little one, and stronger than many. The bear says no to hunger every winter.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My demon asks, and I answer as I please.", next = "BACK", reply = "For now, little one, and the bear hopes it stays so. Hungry things are patient in their own way.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "One who speaks with the spirits sits before the bear. The spirits know me, little one, and they whisper that you listen well, which is rarer than you think." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "One in bright armour sits before the bear. You have strength, little one, and you wear it outside, where all can see, and the bear wonders whether you also wear it inside." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "One who walks with a beast comes before me. Your companion knows me, little one, though you do not, for all beasts remember the old spirits." },
        { id = "h_default", text = "Old as the hills you walked to reach me, I am, and I do not hurry. Sit, and when you are still, I will speak." },
        { id = "h_quest", tags = { "news" }, when = { questActive = TODO_QUEST("Great Bear Spirit") },
          text = "You come to learn the bear, so learn this first: strength that cannot wait is not strength. It is only noise." },
        { id = "h_not", when = { ["not"] = { class = "DRUID" } },
          text = "Not of the Circle, this one. Still, you came all this way to sit with an old bear. There is some wisdom in that." },
        { id = "h_return", when = { metBefore = true }, text = "You came back, and most do not. They think one visit is a lesson learned, when it is only a lesson begun." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A healer of the Horde sits before me. You have tended wounds, little one, and the bear understands that sort of strength." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "One who walks softly comes before me. The bear walks softly too, little one, but only until it needs to stand." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A wielder of the old fire comes before me. Your power is quick, little one, and the bear is slow, yet the bear has outlived every mage who thought that mattered." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "One who carries a demon comes before me. The bear smells it on you, little one, sour and hungry, and the bear is not afraid of it." },
      },
      again = {
        { id = "h_again", text = "The bear settles again, watching you with calm, unhurried eyes, and waits for you to speak." },
        { id = "h_again2", text = "The spirit's breath stirs the grass. There is more, if you are still enough to ask." },
      },
      choices = {
        { text = "What does the bear teach?", next = "teach" },
        { text = "You must stand for something, spirit.", next = "represent" },
        { text = "I seek your blessing, to learn the way of the Claw.", next = "blessing", when = { class = "DRUID" } },
        { text = "I'm a priest. I came to pray where it's quiet.", next = "pray", when = { class = "PRIEST" } },
        { text = "(Sit quietly a while.)", next = "sit", fx = { affinity = 2 } },
        { text = "I'm a warrior. I came to learn strength, not shapes.", next = "warrior_gb", when = { class = "WARRIOR" } },
        { text = "What strength does the bear see in a healer, spirit?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "When should a quiet walker choose to stand, spirit?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What can a slow bear teach a mage, spirit?", next = "xmage", when = { class = "MAGE" } },
        { text = "Why is the bear not afraid of demons, spirit?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Does my beast know you, Great Bear?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "What does the Great Bear mean by strength inside?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do the spirits say of me, Great Bear?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "(Rise and leave the spirit in peace.)", next = "END" },
      },
    },
    teach = {
      big = true,
      lines = {
        { id = "t_default", text = "To endure, and to protect what stands behind you, and to sleep when the world is cold and wake when it is ready. Most of what is worth doing is waiting well." },
      },
      choices = {
        { text = "Teach me the strength of the body.", next = "body" },
        { text = "Teach me the strength of the heart.", next = "heart" },
        { text = "I'll remember.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
      },
    },
    represent = {
      lines = {
        { id = "r_default", text = "The strength that holds up a young druid, and the strength under the feet of an old one. I have been part of this world for as long as there has been a world to be part of." },
      },
      choices = {
        { text = "Then teach me what you can.", next = "teach" },
        { text = "(Bow your head.)", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
      },
    },
    body = {
      lines = {
        { id = "bo_default", text = "Power and swiftness of action, little one, kept ready in mind as well as limb. The bear looks heavy, and those who think it slow and dull learn otherwise too late; let them think it." },
      },
      choices = {
        { text = "You haven't spoken of the heart.", next = "heart" },
        { text = "(Let the lesson settle.)", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },
    heart = {
      lines = {
        { id = "he_default", text = "The heart is what makes you act, for reasons that are clean and honest. Keeping the balance is not sitting still; a mother bear guarding her young does not weigh both sides, and neither does an old bear at the mouth of his den." },
      },
      choices = {
        { text = "Am I ready, then?", next = "ready" },
        { text = "(Let the lesson settle.)", next = "BACK", reply = "Good, little one, let it settle like snow on the mountain. The bear will be here when you are ready for the next.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Sometimes weighing both sides is what keeps a bear alive.", next = "BACK", reply = "It is, sometimes, and the bear has weighed many things in its time. But the heart knows when weighing is done.", fx = { align = { honor = -1 } } },
      },
    },
    ready = {
      lines = {
        { id = "re_default", text = "That remains to be seen, and the wisest and oldest druids are never ready when their time of testing comes. Go on all the same, for there will be a time when your strength is needed, and you will find it there." },
      },
      choices = {
        { text = "(Thank the spirit.)", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
      },
    },
    blessing = {
      lines = {
        { id = "bl_default", text = "You have heard me, and the rest is yours to carry, not mine to give. Go back to Dendrite, and let him see what you have taken from this place." },
      },
      choices = {
        { text = "(Bow, and rise.)", next = "BACK", fx = { affinity = 2, standing = { nighthaven = 1 } } },
      },
    },
    pray = {
      lines = {
        { id = "pr_default", text = "Pray, then, and I will keep still beside you, which is a thing I am very good at. Your Light and my mountain will not quarrel, little one; they have both been here too long for that." },
      },
      choices = {
        { text = "(Pray a while beside the bear.)", next = "BACK", fx = { affinity = 2, trait = { pious = 1 }, align = { light = 1 } } },
        { text = "I'll sit with you, but I've no prayer in me today.", next = "BACK", reply = "Then sit without one, little one, for stillness is also a prayer. The mountain has never once asked me for words.", fx = { align = { light = -1 } } },
        { text = "(Rise.)", next = "BACK" },
      },
    },
    sit = {
      lines = { { id = "s_default", text = "Good; few sit. Most come wanting, and leave still wanting, but you may come back whenever the world is too loud." } },
      choices = {
        { text = "(Stay a little longer.)", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "(Rise and go.)", next = "END" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I have watched these hills a very long time, and I remember what I have seen. Ask, and I will answer slowly." },
    },
    background = { { id = "tp_bg", text = "The bear only looks at you. It has been here as long as the world has, and it does not seem to think that needs saying." } },
    advice = { { id = "tp_ad", text = "Keep yourself fit in body and in mind, little one, for the one without the other is only half a bear." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The bear's eyes half close. The Dream is where it rests, little one, and it is troubled now, the way the forest is troubled before a storm." } },
    earth_mother = { { id = "tp_earth_mother", text = "The bear rumbles, and the ground hums with it. The tauren call the mother of all things by that name, and the bear knows her by her heartbeat." } },
    nordrassil = { { id = "tp_nordrassil", text = "The spirit looks north, toward Hyjal. The great tree is old and wounded, and the bear remembers it young." } },
    burning_legion = { { id = "tp_burning_legion", text = "The bear's fur bristles. Fire came from the sky once, and the bear stood against it with the others. It does not forget the smell." } },
    _none = { { id = "tp_none", text = "The bear says nothing. It does not seem to think the question needs an answer." } },
  },
}

P:NPC {
  key = "silva", id = TODO_NPC("Silva Fil'naveth"), name = "Silva Fil'naveth",
  bible = "bibles/nighthaven.md", role = "flightmaster", tier = "service",
  communities = { "nighthaven" }, temper = { "warm" }, values = { "dutiful" },
  notices = { "class" },
  impression = {
    first = "Silva Fil'naveth keeps the Circle's hippogryphs, and her oldest will not fly until she says its name politely. She turns away anyone who is not a druid, but so kindly that nobody can stay cross with her.",
    third = "{name} met Silva Fil'naveth, keeper of the Cenarion Circle's hippogryphs at Nighthaven.",
  },

  greetings = {
    { id = "g_flight", when = { class = "DRUID", faction = "Alliance" }, text = "Going home? The Circle's hippogryphs will carry you to Rut'theran, so climb on." },
    { id = "g_horde", when = { class = "DRUID", faction = "Horde" }, text = "Your flight's with Bunthen, friend, over by the wind riders. He'll see you to Thunder Bluff." },
    { id = "g_not", when = { ["not"] = { class = "DRUID" } }, text = "I'm sorry, but these birds fly for druids only. The Circle's rule, not mine." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I think they do, though they've never told me so in words. They grow restless before storms and calm when the lake is still, and you've the same feeling about you as a clear morning, so they're curious, and they're not often curious about anyone." } },
      choices = {
        { text = "Then I'll speak gently with them, and leave them be.", next = "BACK", reply = "That's kind of you, and they'll notice it, even if they pretend not to. Gentleness always reaches them in the end.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They're just birds. Don't read too much into it.", next = "BACK", reply = "Perhaps, but they've never once been wrong about a storm. I'd rather read too much than too little.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because the Circle bred them to carry its own, and they've grown proud about it, as birds do. I'm sorry for it, since you've come so far, but I couldn't make them carry you if I tried, and the old one would sulk at me for a week." } },
      choices = {
        { text = "I understand. I'll respect their pride, and yours.", next = "BACK", reply = "Thank you, that's gracious, and they'll think better of you for it. Perhaps one day they'll change their minds.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Pride in a bird? Then they're spoiled, Silva.", next = "BACK", reply = "Oh, terribly spoiled, and the druids are to blame for it. Still, they're mine, and I'd not change them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They mind noise, and warriors tend to bring a lot of it, all clanking and stamping on the perch. The old one once took a warrior's helmet for an egg and sat on it for a whole afternoon, and he was too polite to ask for it back." } },
      choices = {
        { text = "I'll keep quiet near the birds. They deserve that respect.", next = "BACK", reply = "Thank you, and the old one will notice, I promise you. She remembers every quiet visitor.", fx = { align = { order = 1 } } },
        { text = "Steel clanks. Your birds will have to get used to it.", next = "BACK", reply = "They'll try, but the old one might take your helmet for another egg. Mind your head.", fx = { align = { order = -1 } } },
        { text = "Something else, Silva.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Very, though they won't admit it, because hippogryphs are proud and pretend not to notice anything. The old one has been watching since you came up the path, and if she lowers her head, it means she approves." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Look, she's lowered her head to {pet}! That hasn't happened since a druid brought a bear cub up here, and that was years ago." },
      },
      choices = {
        { text = "My beast and I will mind our manners around her.", next = "BACK", reply = "Good, and she'll be watching, I promise. She's a fair judge of manners.", fx = { align = { order = 1 } } },
        { text = "Proud birds could do with taking down a peg, Silva.", next = "BACK", reply = "I'd not say that near her, if I were you. She has a very long memory and a very sharp beak.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The old one hisses at anyone who smells of the grave, so she'd hiss at a Forsaken and at a few of my own kin besides. The young ones only care whether you've brought them anything to eat, which I think is a better way to judge people." } },
      choices = {
        { text = "Gentle words with them, then. They deserve kindness.", next = "BACK", reply = "They do, and they'll remember it. Bring them a scrap of fish too, and you'll be friends for life.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A beast that hisses at me gets no gentleness.", next = "BACK", reply = "Then you'll get no gentleness back from her, either. She's very fair that way.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Once, a goblin with a rope and a great deal of confidence, and he left with neither. They fly for druids only because they choose to, so a thief would get as far as the edge of the perch and then a very long way down." } },
      choices = {
        { text = "I wouldn't dream of it. They're yours to fly.", next = "BACK", reply = "Thank you, that's good of you to say. They'd only drop you in the lake, but it's still good of you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "With the right rope and some patience, I'd manage it.", next = "BACK", reply = "You'd manage a rope burn and a long swim. The goblin managed both, and he's not been back.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They feel it the way they feel a storm coming, all prickling feathers and wide eyes. The druids say the old Highborne magic still hangs over Azshara like a smell, and my birds won't fly that way for anything." } },
      choices = {
        { text = "Then I'll keep my magic well away from them.", next = "BACK", reply = "Thank you, and they'll fly calmer for it. The old one especially.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "They'll get used to it. Everything does, in time.", next = "BACK", reply = "Some things, yes, but not birds who remember the Highborne. They've had ten thousand years to not get used to it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "As plain as smoke, and they hate it, because they've flown over Felwood and seen what it does. I don't think it makes you a bad person, but I'd rather the old one didn't bite you, because then I'd have to apologise to you both." } },
      choices = {
        { text = "Then I'll keep my distance. Their fear is earned.", next = "BACK", reply = "Thank you, and they'll thank you too, in their way. Felwood taught them all to be wary.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fel is power. Your birds will have to cope.", next = "BACK", reply = "They'll cope, but they won't forget, and neither will I. Please be careful near them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" },
          text = "A shaman! My birds only fly for druids, I'm afraid, but they can feel the spirits on you, I think, because the old one hasn't stopped staring since you came near." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! My birds only fly for druids, I'm afraid, but you're welcome to sit with them, and the old one at the end might even let you scratch its neck, if you ask it nicely." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! I'm afraid my birds only fly for druids, and they'd find all that steel very heavy besides, but you're welcome to sit with them." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! My birds only fly for druids, I'm afraid, but they're curious about your companion, so you may stand close if it's polite." },
        { id = "h_default", text = "I am Silva, and I keep the Circle's hippogryphs. They fly one road only, to Rut'theran beneath Teldrassil, and only for druids, for they are as particular as any elder of the Enclave." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "You'd rather have your own wings, I imagine. These ones bite less than you'd think, if only slightly less." },
        { id = "h_names", when = { metBefore = true }, text = "The oldest of my hippogryphs won't fly unless I say her name first, and politely. I've stopped finding it strange." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Night flights are the best. Teldrassil's lights come up out of the sea like someone's left a lantern for you." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde! My birds only fly for druids, I'm afraid, but you're welcome to sit with them, because they like a quiet voice and priests usually have one." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue, sneaking up on my hippogryphs? They'll hear you long before you hear them, I promise, and the old one bites." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Could you not conjure anything near the perches, please? The last spark that flew over here put the birds off their feed for a week." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. I'm sorry, but you'll need to stand a little further off, because the birds can smell the fel on you and it makes them very cross." },
      },
      again = {
        { id = "h_again", text = "Anything else? The birds are restless, but they'll wait for you, as patient as the moon." },
        { id = "h_again2", text = "Ask away; Rut'theran isn't going anywhere." },
      },
      choices = {
        { text = "Why only druids?", next = "rule" },
        { text = "I'm looking for half of the sea lion's pendant.", next = "pendant", when = { questActive = TODO_QUEST("Trial of the Sea Lion") } },
        { text = "Show me the flight.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "Do your hippogryphs mind a troll or a Forsaken near them, Silva?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Someone must have tried to steal a hippogryph, Silva.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why do your hippogryphs mind the arcane so, Silva?", next = "xmage", when = { class = "MAGE" } },
        { text = "Can your birds really smell the fel on me, Silva?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do your hippogryphs mind warriors, Silva?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Are your hippogryphs curious about my beast?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Why do your hippogryphs only fly for druids, Silva?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do your hippogryphs sense the spirits, Silva?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Farewell.", next = "END" },
      },
    },
    rule = {
      lines = {
        { id = "r_default", text = "The Circle keeps these birds for its own, so that a druid can come home to Moonglade and go back to the world without asking anyone's leave. Everyone else walks in through Felwood and Winterspring, I'm afraid." },
      },
      choices = {
        { text = "Couldn't you make one exception?", next = "exception", when = { ["not"] = { class = "DRUID" } } },
        { text = "That seems fair.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    exception = {
      lines = {
        { id = "e_default", text = "I could ask, and she'd bite me, and then she'd bite you. The answer's no, but it's a kind no, and the walk is lovely if you don't mind furbolgs." },
      },
      choices = { { text = "Something else, then.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    pendant = {
      lines = {
        { id = "p_alliance", when = { faction = "Alliance" },
          text = "North in Darkshore, where the Cliffspring River runs out into Mist's Edge, swim north until the sea floor drops away. There's a rock the fishermen call the Stone Claw, and what you seek is near it, but mind the threshers; they don't share." },
        { id = "p_horde", when = { faction = "Horde" },
          text = "In the northeast of the Barrens there's a pool the locals call the Sludge Fen, poisoned by the Venture Company's works. What you seek lies in the heart of it, and the goblins there hate a protector of nature on sight." },
        { id = "p_default", text = "One half lies in deep water, and I'll tell you where once you've taken the trial from Tajarri at the shrine." },
      },
      choices = {
        { text = "Thank you, Silva.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The hippogryphs carry riders, and riders carry news. Ask me what you like." },
    },
    background = { { id = "tp_bg", text = "I keep the Circle's hippogryphs and fly druids home to Teldrassil. That's the whole of it, apart from a great deal of feather-sweeping." } },
    advice = { { id = "tp_ad", text = "Never walk behind a hippogryph you haven't been introduced to. I mean that more than I'd like to." } },
    nordrassil = { { id = "tp_nordrassil", text = "My birds fly the druids to Teldrassil, but every one of them was hatched under Nordrassil's shade. They know which tree is the elder." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw don't like my birds overhead, and they make that very clear with stones. I fly high over their ground." } },
    everlook = { { id = "tp_everlook", text = "Everlook's goblins ask after my birds every time a druid flies through. My answer is always no, and they always ask again." } },
    _none = { { id = "tp_none", text = "I fly birds, friend; Rabine knows everything else, and has for longer than I have been alive." } },
  },
}

P:NPC {
  key = "bunthen", id = TODO_NPC("Bunthen Plainswind"), name = "Bunthen Plainswind",
  bible = "bibles/nighthaven.md", role = "flightmaster", tier = "service",
  communities = { "nighthaven" }, temper = { "steady" }, values = { "dutiful" },
  notices = { "class" },
  impression = {
    first = "For a keeper of wind riders, Bunthen Plainswind is a gentle and patient sort, and he admits he misses the wind on the Bluff. He seemed glad of a little conversation, since his riders offer so little.",
    third = "{name} met Bunthen Plainswind, who keeps the Cenarion Circle's wind riders for druids flying home to Thunder Bluff.",
  },

  greetings = {
    { id = "g_flight", when = { class = "DRUID", faction = "Horde" }, text = "Earth Mother keep you. The wind rider's saddled; Thunder Bluff is a long way and a short flight." },
    { id = "g_alliance", when = { class = "DRUID", faction = "Alliance" }, text = "Your flight's with Silva, little friend; her hippogryphs go to Rut'theran." },
    { id = "g_not", when = { ["not"] = { class = "DRUID" } }, text = "You're no druid, and these riders fly for the Circle alone. I'm sorry." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Quieter than any I've known, and older, like grandfathers by a fire. I wonder whether the stone spirits of your mountains are as patient, or whether they grumble like your people." } },
      choices = {
        { text = "Patient, Bunthen, like the mountains themselves.", next = "BACK", reply = "Patient, aye, I thought as much, and I'm glad of it. The mountains and the mesas would get on, I think.", fx = { align = { order = 1 } } },
        { text = "They grumble, and they're right to.", next = "BACK", reply = "Ha, then they're like their dwarves, and I'll not hold it against them. A good grumble keeps the stone honest.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Quieter than the ones at home, friend, and older, I think, like grandfathers sitting by a fire. The wind spirits up on the Bluff are loud and restless, but here they hardly stir, and I wonder whether that's peace or only sleep." } },
      choices = {
        { text = "Peace, I think. Let them rest.", next = "BACK", reply = "Then they'll have it, friend, and I'll keep my voice low. Some spirits have earned their rest.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Sleep. Spirits that never stir have forgotten themselves.", next = "BACK", reply = "Perhaps, and I've wondered the same on quiet nights. But a sleeping spirit is still a spirit, friend.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Every day, friend, the wind over the mesas and the drums at night. But the Circle needs someone to keep the riders here, and a tauren who can sit still and listen to the lake is worth more to them than one who can't, so I stay, and I'm glad of company, whatever banner it flies." } },
      choices = {
        { text = "Your patience does you credit, Bunthen. I'm glad to share the perch.", next = "BACK", reply = "And I'm glad of your company, friend. The riders like a quiet visitor as much as I do.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'd never leave my home for someone else's cause.", next = "BACK", reply = "Then your home is lucky to have you, friend. Some of us go where we're needed, and carry home with us.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They like anyone who stands still and doesn't fuss, and warriors are good at standing still when they want to be. On the Bluff, the braves would sit with the riders before a hunt, and I think the beasts miss that, out here among druids who whisper at them." } },
      choices = {
        { text = "Then I'll sit with them a while, as the braves did.", next = "BACK", reply = "They'll be glad of it, friend, and so will I. A warrior who can sit still is a rare and good thing.", fx = { align = { light = 1 } } },
        { text = "I've no time to sit with beasts. There's fighting elsewhere.", next = "BACK", reply = "Then go with the Earth Mother, friend. The riders will be here when the fighting is done.", fx = { align = { light = -1 } } },
        { text = "Something else, Bunthen.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "As much as I do, I think, because Moonglade is beautiful, but it's still, and wind riders are made for the open sky over Mulgore. I take them for a long flight over the lake when the druids aren't looking, and they come back happier." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And {pet} looks like it misses home too, wherever home was. The Earth Mother watch over it, friend." },
      },
      choices = {
        { text = "Every beast deserves the open sky it was born to.", next = "BACK", reply = "Every beast does, friend, and I'm glad you see it. I'll take them out over the lake again tonight.", fx = { align = { light = 1 } } },
        { text = "Beasts go where they're needed. Missing home is for people.", next = "BACK", reply = "Perhaps, but the riders have hearts as well as wings. I'd not tell them they can't miss the Bluff.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The Earth Mother hears everyone who walks on her, friend, whether they call her by name or not. The trolls of our Horde have their loa and the Forsaken have their own dark faith, and I've never thought she minded, so long as the prayer was honest." } },
      choices = {
        { text = "Then I'll pray honestly, whatever name I use.", next = "BACK", reply = "Then she'll hear you, friend, whatever name you give her. The Earth Mother is not particular.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Honest prayers are rare. Mine are mostly useful.", next = "BACK", reply = "Useful prayers are still prayers, friend. The Earth Mother will take them, I'm sure.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "They take offence at nearly everyone, but quiet folk most, since anything that sneaks on the plains wants to eat them. Stomp a bit and hum a tune, and they'll grumble and leave you be, which is about as friendly as a wind rider gets." } },
      choices = {
        { text = "I'll stomp and hum, then. No need to startle them.", next = "BACK", reply = "Thank you, friend, and they'll grumble at you kindly. A tune goes a long way with a wind rider.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If they can't hear me coming, all the better.", next = "BACK", reply = "Then you'll find a wind rider's beak before you find its saddle. Hum a little, friend, for both our sakes.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "By me, on a cold night, yes, though the druids might frown if it got out of hand. The Circle remembers the Highborne and their burning, and a tauren knows better than most that a small fire on the plains can be a big one by morning." } },
      choices = {
        { text = "A small fire, well tended, then. I'll be careful.", next = "BACK", reply = "That's all I ask, friend, and the druids will thank you too. A small fire warms as well as a big one.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A fire that's never let loose is barely a fire.", next = "BACK", reply = "Perhaps, but a fire let loose is a burned forest, and the Circle remembers. Keep it small here, please.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "She turns from no one, but some turn from her, and the fel has a way of crowding out everything gentle. I won't refuse you a seat on the perch, friend, but I'll ask you to leave your imp at the bottom of the hill, because my riders eat imps." } },
      choices = {
        { text = "I'll leave it below. The Earth Mother's welcome matters.", next = "BACK", reply = "Thank you, friend, and the Earth Mother will notice. The riders will too.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My imp goes where I go, Bunthen.", next = "BACK", reply = "Then keep it close and quiet, friend, and we'll manage. The riders will forgive you sooner than they forgive it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" },
          text = "A shaman, so far from the Bluff! My riders fly for druids alone, friend, but the spirits on you smell of home, and I'm very glad to see you." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, so far from your own lands! My riders fly for druids alone, friend, but you're welcome to share the perch and a little conversation, since I miss the sound of voices up here." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, all the way out in Moonglade! My riders fly for druids alone, friend, but you're welcome on the perch, and I'll confess they like a sturdy back to lean on." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, at the perch! The riders like your kind, friend, because you smell of open country and honest beasts, which is more than I can say for most." },
        { id = "h_default", text = "Bunthen Plainswind is my name, and I keep the Circle's wind riders, who fly for druids to Thunder Bluff. It's a short road through the sky, from one home to another." },
        { id = "h_skyborne", when = { race = "Skyborne", faction = "Horde" },
          text = "From the sky to the Bluff, your folk came, I hear, and the Earthen Ring vouched for you. The winds are kind to you. Let my riders be kind too." },
        { id = "h_rider", when = { metBefore = true }, text = "My riders grumble at Nighthaven's quiet, because they like the wind on the Bluff. So do I, but don't tell the Keeper." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Mu'sha's eye is open over the lake, and it's a good night for flying. The riders know it too; listen to them fidget." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde, so far from the Bluff! My riders fly for druids alone, friend, but you're welcome to share the perch and a little conversation." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue, at the perch. My riders don't trust anyone who moves that quietly, friend, so walk loud near them, for your own sake." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage, so far from the cities! The riders don't care for magic on the wind, but I've always thought a mage's fire would be welcome on a cold night by the lake." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. The Earth Mother keep you, friend, though I wonder whether your demons let her near you at all." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, and a dwarf! The spirits on you smell of mountain stone instead of the plains, and I find I'm curious about it." },
      },
      again = {
        { id = "h_again", text = "Something more, friend? The riders can wait a little, as the herd waits for the slowest calf." },
        { id = "h_again2", text = "Ask, and I'll answer if I can. Wind riders aren't much for conversation, so I'm glad of it." },
      },
      choices = {
        { text = "Why do the Circle's riders fly for druids alone?", next = "rule" },
        { text = "I'm looking for half of the sea lion's pendant.", next = "pendant", when = { questActive = TODO_QUEST("Trial of the Sea Lion") } },
        { text = "Show me the flight.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "Does a priest's prayer reach the Earth Mother, Bunthen?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do your wind riders take offence at quiet folk, Bunthen?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Is a mage's fire really welcome in Moonglade, Bunthen?", next = "xmage", when = { class = "MAGE" } },
        { text = "Would the Earth Mother turn from a warlock, Bunthen?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do your wind riders like warriors, Bunthen?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do the wind riders miss the plains, Bunthen?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do you miss Thunder Bluff, Bunthen?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What do the spirits of Moonglade feel like, Bunthen?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "What do the spirits of Moonglade feel like, Bunthen?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Farewell.", next = "END" },
      },
    },
    rule = {
      lines = {
        { id = "r_default", text = "They were given to the Circle so its druids could come and go between Moonglade and their own people. Silva keeps the same rule with her hippogryphs, and between us we see every druid home, whatever their banner." },
      },
      choices = {
        { text = "You and Silva seem to get along.", next = "silva" },
        { text = "Something else.", next = "BACK" },
      },
    },
    silva = {
      lines = {
        { id = "s_default", text = "She flies elves and I fly tauren and our beasts glare at each other across the perches, but we have never once quarrelled. That is Moonglade for you, friend; out there it would be a war." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, learn = { "cenarion_circle" } } } },
    },
    pendant = {
      lines = {
        { id = "p_alliance", when = { faction = "Alliance" },
          text = "Search the waters of Westfall, west and a little north of where the Gold Coast Quarry meets the shore, where an anchor marks a sunken boat. The deep there will crush a swimmer who goes too far, so look for the bubbling fissure and breathe there." },
        { id = "p_horde", when = { faction = "Horde" },
          text = "In Silverpine, along the North Tide's Run, an old boat lies wrecked on the shore. Swim west of it to a lockbox on the sea floor, and use the bubbling fissure for breath, or the deep will take you." },
        { id = "p_default", text = "One half lies in deep water far from here. Take the trial from Tajarri at the shrine first, and then come and ask me again." },
      },
      choices = {
        { text = "Thank you, Bunthen.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The wind riders bring travellers, and travellers bring stories. Ask, and I'll tell you what I've heard." },
    },
    background = { { id = "tp_bg", text = "I keep the wind riders for the Circle and fly druids home to the Bluff, and that is work enough for one tauren." } },
    advice = { { id = "tp_ad", text = "Hold on with your knees, not your hands, and don't look down until you're over water." } },
    cenarion_circle = { { id = "tp_circle", text = "The Circle took my people in when others would not, and we remember that. The tauren remember everything kind." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother's breath carries my wind riders, and her eye watches over them at night. I give thanks to her each time they land safely." } },
    cairne = { { id = "tp_cairne", text = "Cairne Bloodhoof is the wisest of us, and he sent many tauren to learn from the Circle. I am proud to fly them home to the Bluff." } },
    thrall = {
      { id = "tp_thrall", text = "The Warchief gave my people a place among the Horde when we needed it most. I will fly wherever he needs." },
      { id = "tp_thrall2", when = { faction = "Alliance" }, text = "You are of the Alliance, and still you ask after the Warchief kindly. He is a good leader, whatever your people say of him." },
    },
    centaur = { { id = "tp_centaur", text = "The centaur have made war on my people for longer than anyone remembers. I fly above them and I do not land." } },
    _none = { { id = "tp_none", text = "I fly the riders, friend. Ask the elves in the village; their memories are as long as the plains are wide." } },
  },
}
