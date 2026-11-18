-- Thunder Bluff. Voice: bibles/thunderbluff.md
-- Cairne keeps his rival close: Magatha lives on Elder Rise and says what she thinks of him.
-- Her later treachery is never hinted beyond her open ambition.
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "cairne", id = TODO_NPC("Cairne Bloodhoof"), name = "Cairne Bloodhoof",
  rivals = { "magatha" },
  bible = "bibles/thunderbluff.md", role = "noble", tier = "major",
  communities = { "thunder_bluff" }, temper = { "steady" }, values = { "honorable", "gentle", "wise" },
  notices = { "race", "class" },
  impression = {
    first = "Cairne Bloodhoof is huge, grey in the muzzle and kinder than I expected, and he speaks of Mulgore as a home long waited for. He means to keep it, and I would not care to test him.",
    third = "{name} met Cairne Bloodhoof, who leads the tauren tribes of Mulgore from the High Rise of Thunder Bluff.",
  },

  greetings = {
    { id = "o_cairne_soft", when = { gossip = { topic = "cairne", stance = "soft" } }, text = "Someone on Elder Rise tells me you think I've grown too old for this. Perhaps you're right, young one, but I'd rather hear it from you than from Magatha's people." },
    { id = "g_chief", text = "The High Rise greets you, young one. The Earth Mother's wind blows strong up here, so stand firm." },
    { id = "g_tauren", when = { race = "Tauren" }, text = "Tauren-born! The plains go with you wherever you walk; I see them in your step." },
    { id = "g_back", when = { metBefore = true }, text = "Good, you've come again. An old bull likes faces he knows." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, young one, and the wind on the High Rise has missed you. Come closer, and let an old bull see how the road has treated you." },
    { id = "g_away_long", when = { away = { min = 60, levels = 5 } }, text = "It has been {away} since you stood on this rise, and you come back with more nicks in your armour than you left with. The Earth Mother has kept you, and I'm grateful to her for it." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "When we first met you were a calf with a weapon, and now you stand like a warrior of the plains. I've lived long enough to know how rare that is." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The people of Thunder Bluff speak well of the help you've given them. That is the truest honour our tribes can give, and you've earned it." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I'm told someone in this city went away from you angry. Our people wandered long enough with strife at our heels, young one, so mend it if you can." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID", race = "Tauren" },
      text = "A tauren druid. Twenty generations we waited for one, and now you walk among us, thanks to Hamuul's work. Be worthy of it." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne", faction = "Horde" },
      text = "The sky-people who came down to Mulgore. The Earthen Ring spoke for you, and the tauren keep the word of friends. Walk freely here." },
    { id = "n_alliance", cat = "race", when = { faction = "Alliance" },
      text = "An outsider on the High Rise. You came in peace, or the Bluffwatchers would have said otherwise. Say what you came to say." },
  },

  start = "hello",
  nodes = {
    xalt_cairne = {
      lines = {
        { id = "xalt_cairne_default", text = "Many have sat at this fire, and I try to send each away with something worth carrying. Whoever they are to you, they left with a good word for the tauren, and that is a gift I don't forget." },
        { id = "xalt_cairne_kin", when = { alt = { kin = true } }, text = "{alt}, yes. That {altclass} asked me how the tauren came to Thunder Bluff, and I told the long version, which my son says no one should have to suffer, yet they stayed to the end." },
      },
      choices = {
        { text = "Family keeps us rooted, as the tribes keep the tauren.", next = "BACK", reply = "That is so, and a tauren knows it in his bones. A tree with deep roots bends in the storm and does not break, and so does a family.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I walk my own road, kin or not.", next = "BACK", reply = "Then walk it well, and walk it with your eyes open. Even a lone bull on the plains is grateful when the herd is near.", fx = { align = { order = -1 } } },
        { text = "Something else, High Chieftain.", next = "BACK" },
      },
    },
    op_sylvanas = {
      lines = {
        { id = "ops_q", text = "Some share my caution and some go a good deal further, young one. But you've walked roads I haven't, so tell me plainly: what do you make of the Dark Lady?" },
        { id = "ops_q_scourge", when = { race = "Scourge" }, text = "She is your queen, and I'd not ask you to speak against her under my roof. Still, I'd value an honest word from one of her own people, so what is she to you?" },
      },
      choices = {
        { text = "Her people suffered enough. She's earned the Horde's trust.", next = "op_sylvanas_r1", fx = { affinity = 1, align = { light = 1 }, opinion = { sylvanas = "trust" } } },
        { text = "She'd poison the whole world for her revenge. Cut her loose.", next = "op_sylvanas_r2", fx = { align = { light = -1 }, trait = { stern = 1 }, opinion = { sylvanas = "distrust" } } },
        { text = "She's useful to the Horde, and for now that's enough.", next = "op_sylvanas_r3", fx = { trait = { practical = 1 }, opinion = { sylvanas = "useful" } } },
        { text = "She is my queen, Chieftain, and I'd die again for her.", next = "op_sylvanas_r4", fx = { opinion = { sylvanas = "admire" } }, when = { race = "Scourge" } },
        { text = "Mulgore took a risk on her. I pray it holds.", next = "op_sylvanas_r5", fx = { affinity = 1, opinion = { sylvanas = "mixed" } }, when = { race = "Tauren" } },
        { text = "I'll keep my thoughts on her to myself, Chieftain.", next = "BACK" },
      },
    },
    op_sylvanas_r1 = {
      lines = {
        { id = "op_sylvanas_r1", text = "You've a generous heart, and so have I, though I'll keep my eyes open for the both of us." },
      },
      choices = {
        { text = "Something else, Chieftain.", next = "BACK" },
      },
    },
    op_sylvanas_r2 = {
      lines = {
        { id = "op_sylvanas_r2", text = "Hard words, and I hear them more often than I'd like. Still, I won't turn away a whole people for what I fear in their queen." },
      },
      choices = {
        { text = "Something else, Chieftain.", next = "BACK" },
      },
    },
    op_sylvanas_r3 = {
      lines = {
        { id = "op_sylvanas_r3", text = "Useful is how most alliances begin, young one, though I pray it isn't how this one ends." },
      },
      choices = {
        { text = "Something else, Chieftain.", next = "BACK" },
      },
    },
    op_sylvanas_r4 = {
      lines = {
        { id = "op_sylvanas_r4", text = "Then serve her well, and serve the Horde beside her, and you'll have a friend in Mulgore whichever way the wind blows." },
      },
      choices = {
        { text = "Something else, Chieftain.", next = "BACK" },
      },
    },
    op_sylvanas_r5 = {
      lines = {
        { id = "op_sylvanas_r5", text = "So do I, calf, every night at the fire on the High Rise." },
      },
      choices = {
        { text = "Something else, Chieftain.", next = "BACK" },
      },
    },
    xpt_cairne = {
      big = true,
      lines = { { id = "xpt_cairne_default", text = "I believe so, though I've lost sleep over it. The Earth Mother teaches that all things return to her in time, and the Forsaken were torn out of that circle by the Scourge, so perhaps the kindest thing we can do is give them somewhere to stand until they find their own way back." } },
      choices = {
        { text = "They deserve a place among us. I'd trust mine with my life.", next = "BACK", reply = "Then they are fortunate in you, and so is the Horde. Bring them to my fire one evening; I would hear their stories myself.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead belong in the earth, Chieftain, not in the Horde.", next = "BACK", reply = "Many of my own elders would agree, and I do not scorn them for it. But the earth did not take them back, and until it does, someone must give them ground to stand on.", fx = { align = { light = -1 } } },
        { text = "Your elders must still oppose them.", next = "xpt_cairne2" },
        { text = "Something else, Chieftain.", next = "BACK" },
      },
    },
    xpt_cairne2 = {
      lines = { { id = "xpt_cairne2_default", text = "Some do, and Magatha speaks loudest of them, though I suspect she would object to anything I supported. The rest will be won over slowly, by Forsaken who keep their word and by travellers like you who stand beside them." } },
      choices = {
        { text = "Then I'll help win them over.", next = "BACK" },
      },
    },
    xcl_rfd = {
      big = true,
      lines = { { id = "xcl_rfd_default", text = "Then the dead have one less nest in Kalimdor, and I am grateful. The quilboar were foolish to welcome the lich Amnennar into their Downs, but I do not wish their fate on any people, even those who have raided our herds." } },
      choices = {
        { text = "Even the quilboar deserved to be spared that fate.", next = "BACK", reply = "You have a generous heart, and I am glad of it. No people should be made into the dead's own weapon, however foolish their choices.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The quilboar chose their allies, Chieftain. They earned their end.", next = "BACK", reply = "Perhaps they did, and the Earth Mother will weigh it as she weighs all things. Still, I take no joy in it, and I hope you take none either.", fx = { align = { light = -1 } } },
        { text = "Why would the Scourge come so far south?", next = "xcl_rfd2" },
      },
    },
    xcl_rfd2 = {
      lines = { { id = "xcl_rfd2_default", text = "Because the Lich King wants this land as surely as he wanted Lordaeron, and he begins where no one is watching. A land of scattered tribes and empty plains must look easy from across the sea, and he will find that it is not." } },
      choices = { { text = "He'll find the Horde waiting, Chieftain.", next = "BACK" } },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "We have our shaman and our druids, and we have never needed priests the way your peoples have, so you will find few here who understand you. But a healer is a healer, and when the centaur harried our caravans across the Barrens, I would have welcomed any hand that could close a wound. Walk among us gently, and you will find room enough." } },
      choices = {
        { text = "Then I'll walk gently and heal where I'm needed.", next = "BACK", reply = "Then you will find more friends here than you expect. A gentle step and a healing hand are understood in every tongue.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I don't need the tauren to understand me, Chieftain.", next = "BACK", reply = "Perhaps not, but you may find you want it one day, when the wind is cold. My people's hearths stay open whether you ask for them or not.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Humility, mostly, and gratitude. The kodo and the plainstrider give us their lives so that the tribe may live, and the Earth Mother asks only that we take what we need and give thanks for it, so a hunt that ends in thanks is a hunt well done." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Humility, mostly, and gratitude. {pet} walks beside you as an equal, I see, and that is how the Earth Mother meant it to be, {class}." },
      },
      choices = {
        { text = "Humility and thanks. I'll remember both on every hunt.", next = "BACK", reply = "Then the herds will thank you, and so will I. The plainstriders near Bloodhoof Village have grown too many this year, if you are looking for a hunt.", fx = { align = { light = 1 } } },
        { text = "The hunt teaches strength, chieftain, nothing more.", next = "BACK", reply = "Strength is part of it, and the beasts teach that lesson hard. But a strong hunter who forgets gratitude soon finds the plains have nothing left to give him.", fx = { align = { light = -1 } } },
        { text = "Something else, chieftain.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "There can be, if the shadow protects someone who could not protect themselves. I've known warriors who struck from ambush to save their kin and warriors who fought in the open for nothing but their own glory, and I know which I would rather share a fire with." },
      },
      choices = {
        { text = "I'd still rather face my enemies openly.", next = "BACK", reply = "There is honor in that, and I have stood in the open more times than I can count. Only don't think less of those who guard their kin from the shadows.", fx = { align = { honor = 1 } } },
        { text = "Shadow work saves lives, and that's honor enough.", next = "BACK", reply = "It can be, and I would not have said so in my younger days. Go carefully, and let the lives you save be the measure of your shadows.", fx = { align = { honor = -1 } } },
        { text = "Why do you follow Thrall, chieftain?", next = "thrall" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "We don't fear it, but we remember. Our oldest stories say that magic once tore the world in two, and the tauren learned to live with the land instead of above it, so forgive us if we watch the arcane with an old people's caution." },
      },
      choices = {
        { text = "Caution is wise. I'll study it with care.", next = "BACK", reply = "Then the land will be safer for your learning, and the tauren will learn to trust you. Come and tell me what the spirits say to you; I am too old to stop being curious.", fx = { align = { order = 1 } } },
        { text = "Old stories shouldn't bind new learning.", next = "BACK", reply = "Perhaps they shouldn't, but they should be heard, as an old bull is heard by the young. The stories are old because they were true once.", fx = { align = { order = -1 } } },
        { text = "How did the tauren come to Mulgore?", next = "mulgore" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "I did, with my eyes open, because Thrall told me himself what the demon blood did to his people and what it cost them to be free of it. If he keeps your kind under watch, I trust him, but you should know that every tauren on these bluffs is watching too." },
      },
      choices = {
        { text = "Then I'll give your people nothing to fear.", next = "BACK", reply = "Then you will find the tauren slow to fear and quick to welcome. Show them who you are, and in time they will stop watching.", fx = { align = { order = 1 } } },
        { text = "Watch me all you like. I'll do as I must.", next = "BACK", reply = "Then we will watch, and you will do as you must, and we will see where it leads. I hope it leads somewhere I can be proud of, warlock.", fx = { align = { order = -1 } } },
        { text = "Why do you follow Thrall at all?", next = "thrall" },
      },
    },
    -- 0.71.0 depth: the long walk, the Horde's leaders, the chieftain's burdens.
    walk1 = {
      lines = { { id = "wk1_default", text = "Long, and hungry, and loud with mourning. The Kolkar and their kin rode us down across the Barrens for more generations than our songs can count, and every season we lost the slowest of the herds, and sometimes the slowest of our own, and we buried our dead quickly because we could never stay to mourn them." } },
      choices = {
        { text = "How did Thrall come into it?", next = "walk_thrall" },
        { text = "It must have cost you dearly, Chieftain.", next = "walk2" },
        { text = "Something else, Chieftain.", next = "BACK" },
      },
    },
    walk_thrall = {
      lines = { { id = "wkt_default", text = "He came upon my people as the centaur fell on us, and he and his orcs fought as though our calves were their own, though they owed us nothing. Afterwards I told him of the Oracle on Stonetalon Peak, because he was searching for a road for his people, and I think that small kindness was the beginning of everything since." } },
      choices = {
        { text = "That's a debt I'd honor too, Chieftain.", next = "BACK", fx = { affinity = 1 } },
        { text = "And the Horde has had your word ever since.", next = "thrall" },
        { text = "Something else.", next = "BACK" },
      },
    },
    walk2 = {
      lines = { { id = "wk2_default", text = "Friends of my youth lie somewhere in the grass between the Gold Road and the Stonetalon foothills, and I could not tell you the places, because we left them at a run. That is what wandering costs a people: you cannot visit your dead, so you learn to carry them in your songs instead, and Mulgore is the first land where our dead can lie still." } },
      choices = {
        { text = "I'm sorry, Chieftain. That's a heavy thing to carry.", next = "walk3", fx = { trait = { kind = 1 } } },
        { text = "Songs are a strong way to remember them.", next = "walk3", fx = { trait = { curious = 1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    walk3 = {
      lines = {
        { id = "wk3_default", text = "You listen well, young one, so let me ask you a thing in turn, as the old are allowed to do. Where is your home, and what would you give to keep it?" },
        { id = "wk3_tauren", when = { race = "Tauren" }, text = "You are tauren, so Mulgore is yours as much as mine, but I'll ask you all the same, because every calf must answer it once. What would you give to keep this home of ours?" },
      },
      choices = {
        { text = "Wherever my people stand. I'd give my life for it.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "I haven't found one yet, Chieftain. I'm still looking.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Home is a place you take, and then hold.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "My wits, long before my life, Chieftain.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "I walked that road too, as a calf.", next = "walk_calf", when = { origin = "tauren_long_migration" } },
      },
    },
    walk_calf = {
      lines = { { id = "wkc_default", text = "Then you remember the dust and the drums, and the nights we slept with our weapons in our hands. I walked at the back of that column with the warriors, so I never saw the calves' faces, but I heard them singing to keep their feet moving, and I have never heard a braver sound in all my years." } },
      choices = {
        { text = "We sang because you told us Mulgore was waiting.", next = "BACK", fx = { affinity = 2 } },
        { text = "I still dream of the dust some nights.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else, Chieftain.", next = "BACK" },
      },
    },
    o_narache = {
      lines = { { id = "on_default", text = "Red Cloud Mesa raises good hunters, because the plainstriders there are quick and the cliffs are unkind to the careless. Does your mother still hunt, or has she put the bow down for the fire and the stories?" } },
      choices = {
        { text = "She still hunts, Chieftain, and she still gives thanks.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "She's gone to the Earth Mother now.", next = "o_narache2" },
        { text = "She taught me well. That's all I'll say.", next = "BACK", fx = { trait = { discreet = 1 } } },
      },
    },
    o_narache2 = {
      lines = { { id = "on2_default", text = "Then she walks the plains with An'she's light on her back, and every plainstrider you take with thanks is a word sent after her. The tauren do not believe our dead go far, young one, so speak to her when you hunt, and she'll hear you." } },
      choices = {
        { text = "I will, Chieftain. Thank you.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else, Chieftain.", next = "BACK" },
      },
    },
    o_runner = {
      lines = { { id = "or_default", text = "Then you know the Barrens better than half my council, so tell me true, because runners see what chieftains are not shown. Does Camp Taurajo hold, and do the orcs at the Crossroads treat my people as kin or as couriers?" } },
      choices = {
        { text = "Taurajo holds, and the orcs treat us as kin.", next = "BACK", fx = { affinity = 1, opinion = { crossroads = "kin" } } },
        { text = "They're good allies, but they forget we aren't orcs.", next = "BACK", fx = { trait = { skeptical = 1 }, opinion = { crossroads = "careless" } } },
        { text = "Taurajo needs more spears, Chieftain. The Barrens are hungry.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    o_spirit = {
      lines = { { id = "osr_default", text = "The seers told me of a water-carrier who heard the elements before the elements were finished speaking, and they laughed about it for days, which seers rarely do. Tell me, what did the spirits say first, when you finally listened?" } },
      choices = {
        { text = "Mostly that I'd spilled the water, Chieftain.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "That the land remembers everything we do to it.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "I'd rather keep that between me and them.", next = "BACK", fx = { trait = { discreet = 1 } } },
      },
    },
    leaders = {
      hub = true,
      lines = { { id = "ld_default", text = "The Horde is many peoples with many voices, and I have sat at the fire with most of its leaders. Ask, and I'll tell you what an old bull thinks of them, though I'd ask you to carry it carefully." } },
      again = {
        { id = "ld_again", text = "Who else would you hear of, young one?" },
        { id = "ld_again2", text = "Ask on. I've known them all longer than you've been walking." },
      },
      choices = {
        { text = "What do you make of Thrall himself?", next = "ld_thrall" },
        { text = "What about Sylvanas and her Forsaken?", next = "ld_sylvanas" },
        { text = "And the Darkspear trolls?", next = "ld_voljin" },
        { text = "Who among your own elders do you trust most?", next = "ld_hamuul" },
        { text = "What do you think of the Alliance, Chieftain?", next = "ld_alliance" },
        { text = "Enough of leaders, Chieftain.", next = "BACK" },
      },
    },
    ld_thrall = {
      lines = { { id = "ldt_default", text = "He is young, and he carries his whole people's shame on his shoulders as though he alone drank the demon's blood, which he did not. I counsel him as I would a son, and he listens more than he lets his warriors see, which is the mark of a leader who will last." } },
      choices = {
        { text = "You must disagree with him sometimes, Chieftain.", next = "ld_thrall2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ld_thrall2 = {
      lines = { { id = "ldt2_default", text = "Often, and quietly, which is how friends ought to disagree. I've told him that Durotar is a hard land and his people will be tempted by softer ones, and that the night elves' forests are not empty simply because the elves are quiet. But tell me, young one, what do you make of him?" } },
      choices = {
        { text = "He's the best thing that ever happened to the Horde.", next = "BACK", fx = { affinity = 1, opinion = { warchief = "trust" } }, when = { faction = "Horde" } },
        { text = "He's too soft on the humans, Chieftain.", next = "BACK", fx = { trait = { stern = 1 }, opinion = { warchief = "soft" } }, when = { faction = "Horde" } },
        { text = "He keeps faith with Theramore. That earns my respect.", next = "BACK", fx = { affinity = 1, opinion = { warchief = "respect" } }, when = { faction = "Alliance" } },
        { text = "I don't know him well enough to judge.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    ld_sylvanas = {
      lines = {
        { id = "lds_default", text = "She is sharp as winter, and she gives her trust to no one, which I understand better than my elders think, because her people were betrayed by their own prince. I spoke for the Forsaken, not for her alone, and I watch her as I watch every new ally, with an open hand and open eyes." },
        { id = "lds_scourge", when = { race = "Scourge" }, text = "Your Dark Lady is sharp as winter and trusts no one, and after what your prince did to you all, I cannot blame her. I spoke for your people, young one, and I watch her as I watch every new ally, with an open hand and open eyes." },
      },
      choices = {
        { text = "Do the other elders share your caution?", next = "op_sylvanas" },
        { text = "An open hand and open eyes. I'll remember that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Chieftain.", next = "BACK" },
      },
    },
    ld_voljin = {
      lines = { { id = "ldv_default", text = "The Darkspear lost their islands to a sea witch and the murlocs, and Vol'jin's father, Sen'jin, gave his life so that his people could go free with Thrall. A people who know what it is to lose a home are a people the tauren understand, and Vol'jin is wiser than his tusks and his temper make him look." } },
      choices = {
        { text = "The trolls and the tauren have that in common, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ld_hamuul = {
      lines = { { id = "ldh_default", text = "Hamuul is the oldest friend I have left on this Bluff, and the bravest, because he went to the night elves and asked to learn their ways when some of our own elders called it shameful. Malfurion Stormrage said yes, which surprised us all, and now there are young druids on Elder Rise again." } },
      choices = {
        { text = "Why would the elders call it shameful?", next = "ld_hamuul2" },
        { text = "Something else, Chieftain.", next = "BACK" },
      },
    },
    ld_hamuul2 = {
      lines = { { id = "ldh2_default", text = "Because a proud people does not like to admit it has forgotten something, and the tauren had forgotten the druid's path for twenty generations. Hamuul swallowed that pride for all of us, and the ones who mocked him then now send their grandchildren up the lift to learn from him." } },
      choices = {
        { text = "Pride's a hard thing to swallow. He did well.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ld_alliance = {
      lines = { { id = "lda_default", text = "I've no love for the humans who herded the orcs into camps, and no hatred either, because Jaina Proudmoore keeps faith with Thrall from Theramore, and I will not throw that away over an old grudge. What troubles me lies closer to home, for the dwarves dig at Bael'dun in Mulgore's own earth and never asked whose land it was." } },
      choices = {
        { text = "My people mean the tauren no harm, Chieftain.", next = "ld_alliance2", when = { faction = "Alliance" } },
        { text = "The Horde should drive the dwarves out.", next = "ld_alliance2", when = { faction = "Horde" } },
        { text = "Something else, Chieftain.", next = "BACK" },
      },
    },
    ld_alliance2 = {
      lines = {
        { id = "lda2_default", text = "Not while Theramore keeps faith with us, because a war over a hole in the ground would cost more lives than the hole is worth. My son Baine watches the digsite from Bloodhoof Village, and he has more patience for diplomats than I ever did, which is a gift I'm glad he didn't get from me." },
        { id = "lda2_alliance", when = { faction = "Alliance" }, text = "Words are light, young one, and the earth at Bael'dun is heavy with their machines. If your kings mean what you say, let their diggers ask before they dig, as a guest asks before he sits at a fire, and I will answer them as a host. Would you tell your own kings that?" },
      },
      choices = {
        { text = "I would, Chieftain. A guest should ask first.", next = "BACK", fx = { affinity = 1, trait = { honest = 1 } }, when = { faction = "Alliance" } },
        { text = "I'm no diplomat, Chieftain. I only fight.", next = "BACK", fx = { trait = { blunt = 1 } }, when = { faction = "Alliance" } },
        { text = "Patience, then. Baine sounds wise for his years.", next = "BACK", fx = { affinity = 1 }, when = { faction = "Horde" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    burdens = {
      hub = true,
      lines = { { id = "bd_default", text = "More than an old bull lets the council see, young one, though I'll name a few if you'll hear them. The tauren have a home now, and a home has more enemies than a wandering herd ever did." } },
      again = {
        { id = "bd_again", text = "What else would you have me set down, young one?" },
        { id = "bd_again2", text = "Go on, then. It does me good to say these things aloud." },
      },
      choices = {
        { text = "Tell me about the Grimtotem.", next = "bd_grimtotem" },
        { text = "What did the Venture Company do here?", next = "bd_venture" },
        { text = "The centaur will never leave you be.", next = "bd_centaur" },
        { text = "Do some tauren want to reclaim the old lands?", next = "bd_lands" },
        { text = "And what weighs on you yourself, Chieftain?", next = "bd_age" },
        { text = "Something else, Chieftain.", next = "BACK" },
      },
    },
    bd_grimtotem = {
      lines = { { id = "bdg_default", text = "They are tauren, and they are proud, and they believe the orcs and the humans and every other young race are a sickness on the land that ought to be burned out of it. They keep to the high places, in Thousand Needles and Stonetalon and further, and they have never forgiven me for bringing the tauren into the Horde." } },
      choices = {
        { text = "They sound like a danger to Thunder Bluff.", next = "bd_grimtotem2" },
        { text = "I was born among them, Chieftain. I left.", next = "bd_grimtotem_born", when = { origin = "tauren_grimtotem_born" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bd_grimtotem2 = {
      lines = {
        { id = "bdg2_default", text = "To the Bluff, not while Magatha sits on Elder Rise and they wait to see what she can win for them with words. To travellers on the roads through the Needles, and to any orc who walks alone near their camps, they are a danger already, and I've lost more sleep over that than I admit at the council fire." },
        { id = "bdg2_warm", when = { disposition = { min = 70 } }, text = "To the Bluff, not while Magatha sits on Elder Rise, but I'll tell you what I tell no elder. Some nights I wonder whether I should have gone up into the high places myself, years ago, and argued with them until they listened, instead of trusting Magatha to speak for them." },
      },
      choices = {
        { text = "You can't argue with people who won't listen.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "It isn't too late to try, Chieftain.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bd_grimtotem_born = {
      lines = { { id = "bdgb_default", text = "Then you have done a harder thing than most warriors ever do, because it is easy to leave strangers and hard to leave kin. They will call you a traitor, and some of them will mean it with spears, so walk carefully in the high places. Tell me, young one, is there anyone among them still worth calling family?" } },
      choices = {
        { text = "Many of them. They aren't all like Magatha.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 }, opinion = { grimtotem = "redeemable" } } },
        { text = "No one, Chieftain. They chose hatred over kin.", next = "BACK", fx = { trait = { stern = 1 }, opinion = { grimtotem = "lost" } } },
        { text = "I'd rather not speak of them, Chieftain.", next = "BACK", fx = { trait = { discreet = 1 } } },
      },
    },
    bd_venture = {
      lines = { { id = "bdv_default", text = "The goblins of the Venture Company came asking to dig in Mulgore, and when we told them the land was not for sale, they fouled the wells our herds drink from and set their machines on our hills anyway. They are a people who think everything has a price, and they are learning that the tauren do not." } },
      choices = {
        { text = "All goblins seem to be like that.", next = "bd_venture2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bd_venture2 = {
      lines = { { id = "bdv2_default", text = "No, and I try to remember it, because the goblins of Ratchet built Orgrimmar for Thrall and dealt honestly with him. A goblin treats you as well as you make it worth his while, and the Venture Company decided that cheating the tauren was worth more than our friendship. Do you trust them, young one, the goblins?" } },
      choices = {
        { text = "As far as the contract, Chieftain, and no further.", next = "BACK", fx = { trait = { practical = 1 }, opinion = { goblins = "contract" } } },
        { text = "Not one of them, Chieftain.", next = "BACK", fx = { trait = { skeptical = 1 }, opinion = { goblins = "distrust" } } },
        { text = "Gazlowe in Ratchet seemed fair enough to me.", next = "BACK", fx = { affinity = 1, opinion = { goblins = "fair" } }, when = { heardLine = "gazlowe.h_default" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bd_centaur = {
      lines = { { id = "bdc_default", text = "Not while either of us lives, I think, because the centaur have hated the tauren longer than our oldest songs reach back. The Kolkar still ride the Barrens, the Galak raid the Needles, and the Magram and Gelkis fight each other in Desolace when they are not fighting us, and not one of them has ever asked for peace." } },
      choices = {
        { text = "I'd guess you've offered them peace before.", next = "bd_centaur2" },
        { text = "Something else, Chieftain.", next = "BACK" },
      },
    },
    bd_centaur2 = {
      lines = { { id = "bdc2_default", text = "Once, when I was young and certain, I rode out with an open hand to a Kolkar khan, and he gave me the scar along my flank for my trouble. I don't regret trying, young one, but I learned that peace needs two open hands, and theirs have only ever held spears." } },
      choices = {
        { text = "Then keep your hand on your spear, Chieftain.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "One day, one of them might open his hand.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bd_age = {
      lines = {
        { id = "bda_default", text = "Age, mostly, though I don't say so in front of the young braves. I was made for the open plains and the hunt, and I spend my days on the High Rise listening to elders argue about water and bridges, so some mornings I envy every kodo in Mulgore." },
        { id = "bda_warm", when = { disposition = { min = 70 } }, text = "I'll tell you a thing I've told only Hamuul. Some nights I wonder whether I bound my people to the Horde too quickly, out of gratitude, and whether our calves will pay for wars that were never theirs, but then morning comes and I remember who stood with us when no one else would." },
      },
      choices = {
        { text = "You chose rightly, Chieftain. The Horde stood with you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Then go hunt. The council can argue without you.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else, Chieftain.", next = "BACK" },
      },
    },
    bd_lands = {
      big = true,
      lines = { { id = "bdl_default", text = "Magatha says the tauren should take back the lands we wandered before the centaur scattered us, and she is not wrong that we walked them once. But we walked them, young one, we never owned them, and I will not send our calves to die for a map drawn by pride when the Earth Mother has already given us Mulgore." } },
      choices = {
        { text = "Mulgore is enough. The tauren have bled sufficiently.", next = "BACK", reply = "Spoken like one who has buried friends, and I thank you for it. Mulgore is green and our calves are safe, and that is enough wealth for any chieftain.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Land that was yours is worth taking back, Chieftain.", next = "BACK", reply = "Magatha would welcome you to her fire for saying so, and many would agree. But I have seen what taking back costs, and I would rather pay it in patience than in young lives.", fx = { align = { order = -1 } } },
        { text = "Which lands does Magatha mean, exactly?", next = "bd_lands2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bd_lands2 = {
      lines = { { id = "bdl2_default", text = "The high mesas of Thousand Needles, where the Grimtotem already camp, and the Stonetalon peaks, where the night elves and the goblins quarrel over the trees, and the green hills of Feralas, where our people are few. Each of those lands has someone living on it now, and that is the part of the argument Magatha never speaks aloud." } },
      choices = {
        { text = "So the argument is about blood, not land.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else, Chieftain.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_kin", tags = { "news" }, when = { alt = { kin = true } },
          text = "Earth Mother bless you, I could swear {alt} had come back up the lift, for you share the same stride. Kin of yours, I think, since the spirits rarely shape two of anyone by accident." },
        { id = "h_alt_far", tags = { "news" }, when = { alt = { notKin = true } },
          text = "A {altrace} called {alt} sat at my fire not long ago and asked good questions about the plains. When you see that {altclass} again, tell them the Bloodhoof remember a guest who listens." },
        { id = "h_alt_higher", tags = { "news" }, when = { alt = { higher = true, level = 55 } },
          text = "I hear that {alt} has walked into places I would not send my own braves, and walked out again. You keep strong company, young one, so be sure it makes you braver and not careless." },
        { id = "h_pt_forsaken", tags = { "news" }, when = { party = { race = "Scourge" } },
          text = "You walk with one of the Forsaken, I see, and you've not flinched from them. I asked Thrall to welcome Sylvanas's people when many of my own elders called it a mistake, so it does an old bull good to see that trust repaid in small ways." },
        { id = "h_rivalfav", when = { rivalFavor = { min = 2 } },
          text = "You have been up on Elder Rise, listening to Magatha. She is clever and she is patient, and I would ask you to be careful how much of her patience you mistake for kindness." },
        { id = "h_rivalfoe", when = { rivalFavor = { max = -2 } },
          text = "Magatha speaks poorly of you, which in this city counts as a recommendation. Sit by the fire, and tell me what passed between you." },
        { id = "h_default", key = true,
          text = "I am Cairne Bloodhoof, and I lead the Bloodhoof and all the tribes who call Mulgore home, even Magatha's Grimtotem on Elder Rise. We wandered for generations, but now we have a home, and I mean to keep it." },
        { id = "h_baine", when = { heardLine = "baine.h_default" },
          text = "You've met my son in the village. He listens better than I did at his age, but don't tell him I said so." },
        { id = "h_cl_rfd", tags = { "news" }, when = { cleared = "Razorfen Downs", faction = "Horde" }, text = "The scouts say a stranger went down into Razorfen Downs and broke the Scourge's hold there. If that was you, you have my thanks, because that cold was creeping north toward my people." },
        { id = "h_journey", tags = { "news" }, when = { questActive = TODO_QUEST("Journey into Thunder Bluff") },
          text = "You've climbed the lifts and found your way to me, and well done; a tauren who knows the Bluff knows where home is. Now, let me look at you." },
        { id = "h_rites", when = { questDone = TODO_QUEST("Rites of the Earthmother") },
          text = "You walked the rites of the Earth Mother. I see it on you. Carry it lightly; it's heavy enough on its own." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. The tauren have hunted these plains for longer than any of us can remember, and we still learn something new with every hunt." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde stands on Thunder Bluff. The Earth Mother has many children, and I am glad to welcome those who heal, whatever voice answers their prayers." },
      },
      choices = {
        { text = "Someone dear to me has sat at your fire, High Chieftain.", next = "xalt_cairne", when = { alt = true } },
        { text = "The tauren may not have room for priests, Chieftain.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "How did the tauren come to Mulgore?", next = "mulgore" },
        { text = "Why do you follow Thrall?", next = "thrall" },
        { text = "Tell me of the Horde's other leaders, Chieftain.", next = "leaders" },
        { text = "Something seems to weigh on you, Chieftain.", next = "burdens" },
        { text = "I was a calf on the long walk, Chieftain.", next = "walk_calf", when = { origin = "tauren_long_migration" } },
        { text = "My mother hunted plainstriders at Red Cloud Mesa.", next = "o_narache", when = { origin = "tauren_narache_hunter" } },
        { text = "I ran messages between Taurajo and the Crossroads, Chieftain.", next = "o_runner", when = { origin = "tauren_plains_runner" } },
        { text = "I carried water for the seers on the Spirit Rise.", next = "o_spirit", when = { origin = "tauren_spirit_rise" } },
        { text = "I was born Grimtotem, Chieftain, and I chose the Bloodhoof.", next = "bd_grimtotem_born", when = { origin = "tauren_grimtotem_born" } },
        { text = "Why do you let Magatha live on Elder Rise?", tag = "Persuade", next = "magatha_close",
          check = { pass = { any = { { disposition = { min = 65 } }, { heardLine = "magatha.h_default" }, { race = "Tauren", trait = "kind" } } } },
          fail = { next = "magatha_closed", fx = { affinity = -1 } } },
        { text = "You spoke for my people before the Warchief. Why?", next = "forsaken", when = { race = "Scourge" } },
        { text = "I'm Forsaken, chieftain, and the Light still answers me.", next = "paladin", when = { race = "Scourge", class = "PALADIN" } },
        { text = "Hamuul has taught me the druid's way, chieftain.", next = "druid", when = { race = "Tauren", class = "DRUID" } },
        { text = "I'm a warrior. Teach me how you fought, chieftain.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "The Earth Mother's spirits answer me now.", next = "shaman", when = { race = "Tauren", class = "SHAMAN" } },
        { text = "My work is done in shadow, chieftain. Is there honor in it?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "The tauren seem to fear the arcane, chieftain.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What does a hunt teach the tauren, Cairne?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "You allied with a Horde that has warlocks, chieftain.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "The Scourge are broken in Razorfen Downs, Chieftain.", next = "xcl_rfd", when = { cleared = "Razorfen Downs", faction = "Horde" } },
        { text = "My companion is Forsaken. Was the Horde right to take them?", next = "xpt_cairne", when = { party = { race = "Scourge" } } },
        { text = "Earth Mother keep you, chieftain.", next = "END", fx = { affinity = 1 } },
      },
      again = {
        { id = "h_again", text = "What else is on your mind, young one? The wind will wait." },
        { id = "h_again2", text = "Speak on. An old bull has more time than he lets the council know." },
      },
    },
    forsaken = {
      big = true,
      lines = {
        { id = "fk_default", text = "Because you were made into something you never chose, and you came to us still able to choose. The tauren know what it is to be hunted and homeless, and if there is any way back toward what you lost, I would like the Earth Mother's children to help find it." },
        { id = "fk_soldier", when = { origin = "forsaken_lordaeron_soldier" },
          text = "You stood in Lordaeron's ranks once, against orcs, perhaps, and yet here you are in the Horde's tallest city. I spoke for you because the Earth Mother has a long memory and a short grudge, and I try to be the same." },
      },
      choices = {
        { text = "There's no way back. I want only vengeance on the Scourge.", next = "BACK", reply = "I understand that anger, and I would never ask you to let go of what the Scourge did. Only don't let vengeance be all that remains of you, for that is what the Lich King would want.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "If there's a cure, I'll take it gladly.", next = "BACK", reply = "Then I hope it comes, and that the Earth Mother is the one who sends it. Until then, you have a home here, whatever you are.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The other tribes must not all agree with you.", next = "forsaken_tribes" },
      },
    },
    forsaken_tribes = {
      lines = { { id = "ft_default", text = "Not all of them, and Magatha least of all, though she offers your people her remedies when it suits her. Some elders say the dead should stay in the earth. I say the earth gave you back, and it's not for an old bull to argue with the earth." } },
      choices = { { text = "Thank you, chieftain.", next = "BACK", fx = { affinity = 2 } } },
    },
    paladin = {
      lines = { { id = "pa_default", text = "The Light burns you, they say, and you carry it anyway. I don't understand the Light; the tauren never needed it. But I understand a warrior who takes up a burden that hurts him because he thinks it right, and I won't mock you for it." } },
      choices = {
        { text = "It's right, and I need no better reason.", next = "BACK", reply = "Then the Light has chosen well, and so have you. A warrior who carries pain for what is right walks taller than any who walk free of it.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "It's useful. The pain is a fair price.", next = "BACK", reply = "A hard bargain, and an honest one, and I respect your saying so plainly. May it never cost you more than you are willing to pay.", fx = { align = { light = -1 } } },
      },
    },
    druid = {
      lines = {
        { id = "dr_default", text = "Then you are what Hamuul worked for, and what twenty generations of our people forgot how to be. When you take the shape of the bear, think of the ones who waited, and walk a little proudly for them." },
        { id = "dr_pupil", when = { origin = "tauren_hamuul_pupil" },
          text = "Hamuul speaks of you by name at the council fire, you know. He counts his students the way I count the herds, and he worries over each one like a calf in a storm." },
      },
      choices = {
        { text = "I'll be worthy of them, chieftain.", next = "BACK", fx = { affinity = 3 } },
        { text = "Why did our people forget?", next = "druid_forgot" },
      },
    },
    druid_forgot = {
      lines = { { id = "df_default", text = "Wandering does that. When every day is spent running from the centaur, you keep only what keeps you alive, and the deep ways fell away from us. Mulgore gave us the peace to remember." } },
      choices = { { text = "Then we'll remember.", next = "BACK", fx = { affinity = 2 } } },
    },
    warrior = {
      lines = {
        { id = "wa_default", text = "With my whole body and no fear of tomorrow, when I was young, and that is how young warriors die. Now I fight like an old bull: I choose the ground, I let them come to me, and I don't stop until it's done." },
        { id = "wa_orc", when = { race = "Orc" },
          text = "Your Warchief fought beside me against the centaur, and I've never seen anyone swing a hammer like it. Learn from him before you learn from me." },
      },
      choices = {
        { text = "Choose the ground, then hold it. I'll remember.", next = "BACK", reply = "Good, then you have learned in a moment what took me forty winters. An old bull lives long because he chooses where to stand.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Better to strike first, before they choose for you.", next = "BACK", reply = "Spoken with the fire of the young, and I remember it well. There are fights that need it, but be sure you live long enough to learn the other kind.", fx = { align = { honor = -1 } } },
      },
    },
    shaman = {
      lines = {
        { id = "sh_default", text = "Good, good. The elements and the Earth Mother are not strangers, whatever the orcs' teachers say. Go to the Spirit Rise and sit with the seers; they speak to the spirits of our ancestors, and it will do you good to hear them." },
        { id = "sh_rise", when = { origin = "tauren_spirit_rise" },
          text = "A child of the Spirit Rise. The seers there sent word you had the gift before you knew it yourself. Keep listening, young one; they're rarely wrong." },
      },
      choices = { { text = "I'll go to the Spirit Rise.", next = "BACK", fx = { affinity = 2 } } },
    },
    magatha_close = {
      lines = {
        { id = "mc_default", text = "Because she is tauren, and the Grimtotem are tauren, and I will not see my people split. If she leaves the Bluff, her tribe follows her into the hills and answers to no one. She wants my place, and she says so; I would rather hear it across the bridge than not hear it at all." },
        { id = "mc_heard", when = { heardLine = "magatha.h_default" },
          text = "She told you she lets me think it works, did she? Ha! She is right that it only half works. Still, a rival who speaks her mind at the council fire is better than one who says nothing and leads her people away." },
      },
      choices = {
        { text = "That's wise, chieftain.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll keep an eye on her too.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    magatha_closed = {
      lines = {
        { id = "mx_default", text = "Magatha is an elder of our people, and what lies between us is a matter for the tauren." },
        { id = "mx_fire", text = "That is a question for the council fire, young one, and you have not yet sat at it." },
      },
      choices = { { text = "I understand.", next = "BACK" } },
    },
    mulgore = {
      big = true,
      lines = {
        { id = "m_default", text = "The centaur hunted us across the plains. A young orc named Thrall fought beside us, and when his people found their land, we found ours. We built the Bluff high so we would never be caught in the open again." },
      },
      choices = {
        { text = "A good home.", next = "BACK", fx = { affinity = 2 } },
        { text = "What was the wandering like, Chieftain?", next = "walk1" },
        { text = "And you swore to the Horde.", next = "thrall" },
      },
    },
    thrall = {
      lines = { { id = "t_default", text = "He came to us as a stranger and fought for us as kin. A debt like that isn't paid in one lifetime. The Horde has my word, and my word holds." } },
      choices = {
        { text = "Then you serve for honor. I respect that.", next = "BACK", reply = "For honor, and for the debt we owe him. The tauren do not forget a friend who fought for them when no one else would.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Debts are for paying, not for a lifetime of service.", next = "BACK", reply = "Some debts are, for those who count them in coin. The tauren count theirs in gratitude, and gratitude does not run out so easily.", fx = { align = { honor = -1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Many voices come up the lifts to the High Rise, and an old bull listens to all of them. Ask me about these, and I'll tell you what I've heard." },
      { id = "tp_knows_warm", when = { disposition = { min = 65 } }, text = "You have walked with honor among my people, so ask freely, and I'll answer as I would my own son." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "I will answer you, because the tauren do not turn away a question, but I will not pretend to trust you yet." },
    },
    cenarion_circle = { { id = "tp_circle", text = "That is Hamuul's road, and the night elves let him walk it, some more gladly than others. I'm proud of him." } },
    thrall = {
      { id = "tp_thrall", text = "Thrall is young and carries a heavy burden, but he carries it with honour. When the centaur drove my people to the edge of the Barrens, his Horde stood beside us, and I would trust him with my own life." },
      { id = "tp_thrall2", when = { race = "Orc" }, text = "Your Warchief is a son to me in all but blood, young one. Tell him, when you see him, that the old bull still sits by his fire on the bluff and thinks of him." },
    },
    forsaken = {
      { id = "tp_forsaken", text = "Hamuul believes the Forsaken may yet be healed, and so we spoke for them when they asked to join the Horde. I pray he is right, because the alternative is a grief I do not wish to imagine." },
      { id = "tp_forsaken2", when = { race = "Undead" }, text = "You are welcome on my bluff, and I hope you find some peace here. Hamuul works for your people's healing, and I watch over it with him." },
    },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady keeps her own counsel, and I have never been certain of her heart. We brought her people into the Horde because they suffered, and I hope she remembers that." } },
    centaur = { { id = "tp_centaur", text = "The centaur hunted my people across these plains for generations, and many of our elders died fighting them. With Thrall's help we drove them from Mulgore, and I mean that they never return." } },
    quilboar = { { id = "tp_quilboar", text = "The quilboar are children of Agamaggan, and they are wild and bitter. They press on our borders from the Barrens, and my son Baine is learning what it is to hold a home against them." } },
    grimtotem = { { id = "tp_grimtotem", when = { disposition = { min = 65 } }, text = "Magatha thinks I do not see her schemes, and I let her think it. But you ask as a friend, so I will tell you that I sleep lightly on Elder Rise, and I do not mind it." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother gave us this land, and she gave us the strength to keep it. I thank her every morning, and I hope she is pleased with what we have made." } },
    jaina = { { id = "tp_jaina", text = "Lady Proudmoore stood beside us on Hyjal, and she has kept her word since. I would trust her more than most of her kind, though her soldiers in the Barrens test that trust." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran was the city of human mages, and the Legion broke it. I am told they rebuild, slowly, behind walls, and I do not blame them for being careful." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "When the Darkmoon Faire comes to Mulgore, the young ones beg me to visit, and I usually do. Silas Darkmoon tells a fine story, and I am old enough to enjoy being fooled by it." } },
    second_war = { { id = "tp_second_war", text = "The tauren did not fight in the orcs' wars, but we heard the stories after. The orcs carry those years like a scar, and Thrall has given them a reason to heal it." } },
    _none = { { id = "tp_none", text = "Ask the elders on their rise. They've more patience for questions than an old warrior, and the Earth Mother gave them longer memories." } },
  },
}

P:NPC {
  key = "hamuul", id = TODO_NPC("Arch Druid Hamuul Runetotem"), name = "Arch Druid Hamuul Runetotem",
  rivals = { "magatha" },
  bible = "bibles/thunderbluff.md", role = "noble", tier = "major",
  communities = { "thunder_bluff" }, temper = { "calm" }, values = { "wise", "balanced" },
  notices = { "form", "race" },
  impression = {
    first = "Arch Druid Hamuul Runetotem counts every young druid who rides up the lift and is not ashamed of it. He has spent years trying to be worth the yes Malfurion gave him, and it shows in his kindness.",
    third = "{name} met Arch Druid Hamuul Runetotem on Elder Rise, the first tauren to learn the druid's path from Malfurion Stormrage.",
  },

  greetings = {
    { id = "g_rise", text = "Peace, traveller, and may the Earth Mother keep you. You're on Elder Rise, so speak softly; the old ones are thinking." },
    { id = "g_druid", when = { class = "DRUID" }, text = "Another druid! Come, come; every one of you is a gift, when not so long ago there were none of us at all." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, traveller, and I'm glad to see you back on Elder Rise. Sit, and tell me what the wild places showed you." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown since we last spoke, and I can see it as plainly as a sapling grown to an oak. It gladdens an old druid's heart." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Someone on the rises spoke very warmly of you, and kindness travels quickly in a city this small. It's good to hear it of you." },
  },

  notice = {
    { id = "n_bear", cat = "form", when = { form = "bear" },
      text = "Ha! The bear, my favourite. Remember that the bear is strong because it rests, so rest, young one." },
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne", class = "DRUID" },
      text = "A shen'dorei druid! You honour the elements first, I'm told, which suits me; the Earth Mother is the earth, after all. We'll get along." },
  },

  start = "hello",
  nodes = {
    op_night_elves = {
      lines = {
        { id = "one_q", text = "I learned the wild from the kaldorei, and I've never stopped being grateful for it. But every traveller sees them differently, so tell an old druid: what do you make of Malfurion's people?" },
        { id = "one_q_ne", when = { race = "NightElf" }, text = "You're one of Malfurion's own people, and it's a rare thing to ask one of you this to your face. What do you make of your own kind, young one, now that you've seen how the rest of Kalimdor lives?" },
      },
      choices = {
        { text = "They're the wisest people in Kalimdor, and generous with it.", next = "op_night_elves_r1", fx = { affinity = 1, align = { light = 1 }, opinion = { night_elves = "admire" } } },
        { text = "They hoard their wisdom and look down on everyone else.", next = "op_night_elves_r2", fx = { align = { light = -1 }, trait = { skeptical = 1 }, opinion = { night_elves = "distrust" } } },
        { text = "They kill orcs in Ashenvale over a few felled trees.", next = "op_night_elves_r3", fx = { affinity = -1, opinion = { night_elves = "hate" } }, when = { faction = "Horde" } },
        { text = "We still have much to learn, Arch Druid, from you as well.", next = "op_night_elves_r4", fx = { affinity = 2, opinion = { night_elves = "mixed" } }, when = { race = "NightElf" } },
        { text = "They taught you, so in a way they taught me too.", next = "op_night_elves_r5", fx = { affinity = 2, opinion = { night_elves = "respect" } }, when = { race = "Tauren", class = "DRUID" } },
        { text = "I don't know them well enough to judge, Arch Druid.", next = "BACK" },
      },
    },
    op_night_elves_r1 = {
      lines = {
        { id = "op_night_elves_r1", text = "Generous to me, at least, and I've tried to pass it on. I'm glad you've seen that side of them." },
      },
      choices = {
        { text = "Something else, Arch Druid.", next = "BACK" },
      },
    },
    op_night_elves_r2 = {
      lines = {
        { id = "op_night_elves_r2", text = "Some of them do, and Fandral most of all, I'm sorry to say. But Malfurion said yes when he could have said no, so I can't speak of all of them that way." },
      },
      choices = {
        { text = "Something else, Arch Druid.", next = "BACK" },
      },
    },
    op_night_elves_r3 = {
      lines = {
        { id = "op_night_elves_r3", text = "Over a few trees, and over a few thousand, and over Cenarius's blood, spilled by the Warsong. There's grief on both sides of that forest, and I'd ask you not to add to it." },
      },
      choices = {
        { text = "Something else, Arch Druid.", next = "BACK" },
      },
    },
    op_night_elves_r4 = {
      lines = {
        { id = "op_night_elves_r4", text = "That's a kinder thing than I've heard from most of your people. Take it home to Darnassus with you, if they'll hear it." },
      },
      choices = {
        { text = "Something else, Arch Druid.", next = "BACK" },
      },
    },
    op_night_elves_r5 = {
      lines = {
        { id = "op_night_elves_r5", text = "They did, and I hope you'll thank them for it some day in Moonglade, as I did." },
      },
      choices = {
        { text = "Something else, Arch Druid.", next = "BACK" },
      },
    },
    xpt_hamuul = {
      big = true,
      lines = { { id = "xpt_hamuul_default", text = "To Moonglade, in time, where the Cenarion Circle gathers under Keeper Remulos and night elf and tauren sit at the same fire. There are elves there who still believe we should never have been taught at all, so your friend will need patience as well as skill." } },
      choices = {
        { text = "Nature's knowledge belongs to everyone who would protect it.", next = "BACK", reply = "I believe so too, and I've spent my life trying to prove it. Tell your friend to carry that belief to Moonglade, and to carry it gently.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "The elves are right to guard their secrets carefully.", next = "BACK", reply = "They have their reasons, older than any tree in Mulgore, and I respect them. But a secret kept too long becomes a wall, and walls keep out friends as well as enemies.", fx = { align = { order = 1 } } },
        { text = "Something else, Arch Druid.", next = "BACK" },
      },
    },
    xcl_wc = {
      big = true,
      lines = { { id = "xcl_wc_default", text = "Then you did what his own disciples could not, and what I could not either. Naralex was a night elf of the Circle who went into the Emerald Dream to make the Barrens green again, and the Dream turned to nightmare around him, so every young druid should know his story before trying to bend the land." } },
      choices = {
        { text = "Some things in nature shouldn't be forced, however good the cause.", next = "BACK", reply = "That is the lesson I took from Naralex, and it cost him dearly. Even the best of hearts can drown when it reaches too far into the Dream.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Naralex was right to try. Caution never healed anything.", next = "BACK", reply = "He was, and I honor him for it, though it cost him and his followers so much. Courage and caution must walk together, or one of them falls.", fx = { align = { order = -1 } } },
        { text = "You must have known Naralex yourself.", next = "xcl_wc2" },
      },
    },
    xcl_wc2 = {
      lines = { { id = "xcl_wc2_default", text = "Only by name and reputation, through the Circle. He was said to be impatient to heal the world, which is a fine thing in a young druid and a dangerous one in a powerful druid, and I have tried to remember the difference in myself." } },
      choices = { { text = "Then I'll try to remember it too, Arch Druid.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Some will be wary; the Light and the dead are both strangers to us. But I learned from a teacher who saw past what I was, and I would be a poor student if I did not do the same for you." } },
      choices = {
        { text = "Thank you, Arch Druid. I'll be worthy of that.", next = "BACK", reply = "You are already more worthy than you know, simply by coming here. My teacher was patient with me, and I can be patient with you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I don't need the druids' acceptance, Arch Druid.", next = "BACK", reply = "Then I will not press it on you. But the druids accept whom they will, and you may find yourself welcome whether you seek it or not.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Mine asks the green world to lend its strength, and it does, so long as I remember to thank it. Yours, as I understand it, comes from belief itself, which seems a stranger and lonelier thing to carry. I don't think either is wrong, but I do wonder sometimes who answers you when you pray." } },
      choices = {
        { text = "Every healing borrows from something. I try to give back.", next = "BACK", reply = "That is wisdom, and the green world honors it. Give back as you take, and your healing will grow deeper with the seasons.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Nothing answers me but my own will, and I prefer it so.", next = "BACK", reply = "Then I hope your will is strong, because it must carry you alone. The green world, at least, answers anyone who asks it kindly.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "That a warrior who waits until the moment is right wastes no strength and spills no needless blood. The night elves guarded their forests for ten thousand years that way, and I'd wish the same patience on every warrior of the Horde." } },
      choices = {
        { text = "I'll be patient, and spill no needless blood.", next = "BACK", reply = "Then you'll be a rare warrior and a welcome one. Too many young bulls come back from the Barrens proud of how much they killed.", fx = { align = { honor = 1 } } },
        { text = "Patience is for those with ten thousand years to spare.", next = "BACK", reply = "Ha, perhaps you're right, and the night elves have more time than either of us. Still, a little patience costs a warrior nothing, and it saves a great deal.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "We try, though the goblins and the gnolls make it harder every season. A hunter who takes only what the tribe needs helps us more than any druid's spell, and a hunter who takes more harms the land in ways that may take years to heal." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "We try, though the goblins and the gnolls make it harder every season. {pet} is healthy and calm, I see, and the Earth Mother's blessing shows in the care you've given it." },
      },
      choices = {
        { text = "I'll take only what the tribe needs, Arch Druid.", next = "BACK", reply = "Then the land will be greener for your passing. The Barrens need more hunters like you, and fewer goblins.", fx = { align = { light = 1 } } },
        { text = "The plains are wide. A few more won't matter.", next = "BACK", reply = "That's what every hunter says, and every hunter is one of many. The plains are wide, but they are not endless, and the herds remember.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "He spoke of little else when he spoke of the past, because it was the highborne's hunger for magic that drew the Burning Legion into the world. He doesn't hate mages, as far as I know, but he taught me that every power asks for something back, and the arcane asks more than most." },
      },
      choices = {
        { text = "Then I'll pay its price carefully, Arch Druid.", next = "BACK", reply = "That is all any of us can do, and more than the highborne ever did. Keep your eyes on what it asks of you, and you'll see the cost before it comes due.", fx = { align = { order = 1 } } },
        { text = "I'll take the power and pay whatever it costs.", next = "BACK", reply = "The highborne said much the same, and the world still bears their scars. I hope your cost is smaller than theirs, for all our sakes.", fx = { align = { order = -1 } } },
        { text = "What did Malfurion teach you?", next = "taught" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "No, and I won't soften that for you, because the Circle exists to heal what demons and their servants broke. You may walk in Thunder Bluff under Cairne's peace, but in Moonglade the druids would see only what you carry." },
      },
      choices = {
        { text = "Then I'll stay away from Moonglade. That's fair.", next = "BACK", reply = "It is fair, and kind, and I'm grateful you see it so. Thunder Bluff is wide enough for you, even if Moonglade is not.", fx = { align = { light = 1 } } },
        { text = "Their loss. Power is neither good nor evil.", next = "BACK", reply = "Power is a tool, as you say, but the hand matters more than the tool. The Circle has seen too many hands in its time to trust yours on your word alone.", fx = { align = { light = -1 } } },
        { text = "What's the most important lesson you learned?", next = "lesson" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "That a soft step serves a thief and a guardian equally well. The Cenarion Circle keeps out of sight to watch over the wild, and I'd ask you to think about what yours watch over." },
      },
      choices = {
        { text = "My shadows will watch over those who need them.", next = "BACK", reply = "Then the Circle would understand you better than you might think. Watch well, and let the shadows serve the living.", fx = { align = { light = 1 } } },
        { text = "What I watch over is me. Nobody else will.", next = "BACK", reply = "That is a lonely watch to keep, and a long one. I hope someday you find someone else worth watching over.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_kin", tags = { "news" }, when = { alt = { kin = true } },
          text = "You remind me of {alt}, who came up to the Elder Rise to ask about the Cenarion Circle. The likeness is strong enough that I nearly greeted you by that name, so forgive an old druid his eyes." },
        { id = "h_alt_druid", tags = { "news" }, when = { alt = { class = "DRUID" } },
          text = "{alt} is one of the young druids who has walked the path to Moonglade, and I was glad to see it. If you know them, then you know the Dream is wider than any one tribe." },
        { id = "h_pt_druid", tags = { "news" }, when = { party = { class = "DRUID" } },
          text = "Your companion {companion} wears the old ways lightly, but I can see them all the same. Few tauren walked the druid's path before Malfurion's people taught me, so every druid I meet on these bluffs feels like a seed I helped to plant." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken carrying the Light. Malfurion said yes to me when others said no, so I will not be the one who says no to you." },
        { id = "h_rivalfav", when = { rivalFavor = { min = 2 } },
          text = "Magatha has been generous with her time where you are concerned. The Grimtotem give nothing for free, young one, so think on what she may want from you in return." },
        { id = "h_rivalfoe", when = { rivalFavor = { max = -2 } },
          text = "I hear Magatha's people would rather you stayed away from Elder Rise. The Earth Mother does not ask her children to love the Grimtotem, and you are welcome here." },
        { id = "h_default", key = true,
          text = "Hamuul Runetotem. I asked Malfurion Stormrage to teach me, after the war, and he said yes when others, Fandral Staghelm loudest of all, said no. I've tried to be worth that yes ever since." },
        { id = "h_rau", when = { heardLine = "rau.h_default" },
          text = "You've spoken with Rau at Freewind. He learned to listen to the land here, on Elder Rise. I'm glad it's serving him in the Needles." },
        { id = "h_fandral", when = { heardLine = "fandral.h_default" },
          text = "So Fandral has received you in Darnassus. He didn't want me taught, and he was wrong, but I don't hold it against him. Mostly." },
        { id = "h_mulgris", when = { heardLine = "mulgris.h_default" },
          text = "You met Mulgris Deepriver, in the Plaguelands. He went east to mend what the plague had broken, so tell me plainly how he was, and do not spare my feelings." },
        { id = "h_young", when = { metBefore = true }, text = "Every young druid who comes up the lift reminds me how few of us there were. I count you all, you know, and I'm not ashamed of it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Malfurion once told me that the fiercest warriors he knew were the most patient, and I've found that true of the tauren as well." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. The beasts of Mulgore are the Earth Mother's children, and you walk among them closer than most." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Forgive an old druid's curiosity, but I have learned the night elves' ways and never quite understood yours, whether you pray to the loa or to the shadow." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. Malfurion once told me the nightsaber is the quietest hunter in the forest, and also the most patient." },
        { id = "h_cl_wc", tags = { "news" }, when = { cleared = "Wailing Caverns", faction = "Horde" }, text = "Tonga Runetotem at the Crossroads writes that the Barrens oases run a little sweeter, and he says a stranger went down into the Wailing Caverns to wake Naralex. If that was you, then you've done the Circle a kindness I won't forget." },
      },
      choices = {
        { text = "Does a druid's healing differ from a priest's, Arch Druid?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What did Malfurion teach you?", next = "taught" },
        { text = "What's the most important lesson?", next = "lesson" },
        { text = "Did Fandral's refusal hurt more than you admit?", tag = "Persuade", next = "fandral_sting",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "DRUID" }, { heardLine = "fandral.h_default" } } } },
          fail = { next = "fandral_polite", fx = { affinity = -1 } } },
        { text = "I studied under you, Arch Druid. Am I ready for Moonglade?", next = "pupil", when = { origin = "tauren_hamuul_pupil" } },
        { text = "I'm a druid of the sky isles. Will the Circle have me?", next = "skyborne", when = { race = "Skyborne", class = "DRUID" } },
        { text = "The elements speak to me. Is that so different from the wild?", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Does the wild have any place for my kind?", next = "forsaken", when = { race = "Scourge" } },
        { text = "Malfurion must have spoken of the arcane.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Why would the fiercest warriors be the most patient, Arch Druid?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "The druids must watch over Mulgore's beasts, Arch Druid.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "The Cenarion Circle might accept a warlock someday.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What can a rogue learn from a druid, Arch Druid?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Will the druids accept a Forsaken paladin, Arch Druid?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I went into the Wailing Caverns to wake Naralex, Arch Druid.", next = "xcl_wc", when = { cleared = "Wailing Caverns", faction = "Horde" } },
        { text = "My companion is a druid. Where should they go to learn more?", next = "xpt_hamuul", when = { party = { class = "DRUID" } } },
        { text = "Farewell, Arch Druid.", next = "END" },
      },
      again = {
        { id = "h_again", text = "What else? Ask, ask; I'm too old to be in a hurry." },
        { id = "h_again2", text = "Go on. The old ones on the Rise won't mind a little more talk, and the grass grows whether we hurry or not." },
      },
    },
    pupil = {
      lines = { { id = "pu_default", text = "Ready to go, yes, and not ready to stay, which is as it should be. Moonglade will make you feel small, and the night elves will watch you as though you might stampede. Let them watch, and be calm, and come home and tell me which of them stared hardest." } },
      choices = {
        { text = "I'll be calm, Arch Druid.", next = "BACK", reply = "Good, calm is the best answer to a stare, and the hardest to give. Come home with your stories, and I'll pour the tea.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "If they stare, I'll stare right back.", next = "BACK", reply = "Ha, they won't like that, and I confess I'd like to see it. Still, be calm after the staring, because you're a guest of the Circle in their house.", fx = { affinity = 1, align = { order = -1 } } },
      },
    },
    skyborne = {
      lines = { { id = "sk_default", text = "It will, though Fandral will make a face about it, and so will some of mine. You come to the wild through the elements rather than through Elune or the Earth Mother, and I think the Circle could learn something from that, if it's willing." } },
      choices = {
        { text = "Then I'll show them, gently.", next = "BACK", fx = { affinity = 2, learn = { "cenarion_circle" } } },
        { text = "The difference must trouble you.", next = "skyborne_trouble" },
      },
    },
    skyborne_trouble = {
      lines = { { id = "st_default", text = "Trouble me? I'm a tauren who learned from a night elf. If I worried about druids coming to the wild by the wrong road, I'd have to start with myself." } },
      choices = { { text = "Ha. You've got me there.", next = "BACK", fx = { affinity = 2 } } },
    },
    shaman = {
      lines = { { id = "sh_default", text = "Less than either of our orders likes to admit. The shaman asks the spirits for help, and the druid tries to become a part of the thing the spirits live in. Both are listening; we simply sit in different places." } },
      choices = { { text = "Then we're neighbours, Arch Druid.", next = "BACK", fx = { affinity = 2 } } },
    },
    forsaken = {
      big = true,
      lines = { { id = "fk_default", text = "That is a hard question, and I won't give you an easy answer. The wild is a circle of living and dying, and you stand outside it, but the Chieftain believes you can be brought back in, and I've learned not to bet against him." } },
      choices = {
        { text = "Then help me find the way back in.", next = "BACK", reply = "I'll try, and the Chieftain will try, and the Earth Mother will decide. Every circle has a gap somewhere, and the trick is finding it.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I don't need your circle, druid.", next = "BACK", reply = "Perhaps not, but the circle will still have room for you, should you ever want it. The wild is patient, and so am I.", fx = { affinity = -2, align = { light = -1 } } },
      },
    },
    fandral_sting = {
      lines = {
        { id = "fs_default", text = "It did. He told Malfurion that a tauren would hear the wild the way a herd hears thunder, and run from it. I've spent years proving him wrong, and some mornings I can't tell whether I do it for the Earth Mother or for my own pride. Both, probably; she is patient with pride." },
        { id = "fs_druid", when = { class = "DRUID" },
          text = "Between druids, then: yes. Every time I walk into Darnassus I feel him counting the ways I'm wrong. And every time one of you comes up the lift, I count you, and I think, there's another one he said would never be." },
      },
      choices = {
        { text = "You proved him wrong.", next = "BACK", fx = { affinity = 2 } },
        { text = "Pride isn't the worst reason.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    fandral_polite = {
      lines = {
        { id = "fp_default", text = "Ha! You'd like me to say something unkind about the Arch Druid of Darnassus, wouldn't you? Not today, young one." },
        { id = "fp_polite", text = "Fandral and I disagree politely, and I intend to keep it polite, whatever you've heard." },
      },
      choices = { { text = "Polite it is, then.", next = "BACK" } },
    },
    taught = {
      big = true,
      lines = {
        { id = "t_default", text = "That the wild isn't something you command; it's something you join. I was the first of my people in twenty generations to hear that, and I mean not to be the last." },
      },
      choices = {
        { text = "I've my own view of the night elves, Arch Druid.", next = "op_night_elves" },
        { text = "You won't be.", next = "BACK", fx = { affinity = 2, learn = { "cenarion_circle" } } },
      },
    },
    lesson = {
      lines = { { id = "l_default", text = "Strength without wisdom is only a stampede, and I say it to every young druid. Most nod and a few listen, and you can tell the difference in about ten years." } },
      choices = { { text = "I'm listening.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The Circle sends word from Moonglade, and the young druids carry the rest up the lift with them. Ask me of these, and I'll tell you what the wind has told me." },
      { id = "tp_knows_warm", when = { disposition = { min = 65 } }, text = "Sit, sit; you have the patience of someone worth talking to, and I have many seasons of things to say." },
    },
    cenarion_circle = { { id = "tp_circle", text = "I'm the highest of the tauren in it, which mostly means I'm the one who gets glared at in Darnassus. Remulos is kinder." } },
    emerald_dream = {
      { id = "tp_emerald_dream", text = "The Emerald Dream is the world as it was meant to be, and the druids walk it in sleep. Something has begun to trouble it, and I fear what that means for the waking world." },
      { id = "tp_emerald_dream2", when = { class = "DRUID" }, text = "You have walked in the Dream yourself, so you know what I mean when I say the green has turned grey at the edges. Watch for it, and tell me if you see it spread." },
    },
    green_dragons = { { id = "tp_green_dragons", text = "The green dragons serve Ysera, the Dreamer, and they guard the gates to the Dream. Some of them have grown strange of late, and I do not know why." } },
    malfurion = { { id = "tp_malfurion", text = "Malfurion Stormrage taught me the druid's path when no tauren had walked it before. I owe him more than I can repay, and I mean to spend my life trying." } },
    elune = { { id = "tp_elune", text = "The night elves pray to Elune, the moon goddess, and we call her Mu'sha. I find it a comfort that our faiths agree on so much." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken suffer a curse that should never have been laid on anyone. I believe it can be lifted, and I spoke for them before the Horde because of it." } },
    nordrassil = { { id = "tp_nordrassil", text = "Nordrassil is the World Tree on the peak of Hyjal, where the druids gather. I have stood beneath it, and I have never felt so small, nor so welcome." } },
    cairne = { { id = "tp_cairne", text = "Cairne is my oldest friend and my chieftain, and he has never once doubted the druids. Without him, there would be no druids among the tauren at all." } },
    maraudon = { { id = "tp_maraudon", text = "Maraudon is a sacred place in Desolace, where Zaetar, son of Cenarius, lies buried. The centaur call it their holy ground, and something has corrupted it from within." } },
    _none = { { id = "tp_none", text = "Ask Turak, or the Chieftain, or the wind; it knows more than both of us." } },
  },
}

P:NPC {
  key = "turak", id = TODO_NPC("Turak Runetotem"), name = "Turak Runetotem",
  bible = "bibles/thunderbluff.md", role = "trainer", tier = "quest",
  communities = { "thunder_bluff" }, temper = { "patient" }, values = { "balanced", "wise" },
  notices = { "form", "class" },
  impression = {
    first = "Turak Runetotem teaches the steps while the Arch Druid teaches why they matter, and he seems content with that share. He speaks of balance as a thing practised daily, like any honest craft.",
    third = "{name} met Turak Runetotem, who helps the Arch Druid train young druids on Elder Rise.",
  },

  greetings = {
    { id = "g_druid", when = { class = "DRUID" }, text = "Welcome, young druid. Keep your mind clear and your heart strong, and the Great Balance will keep a place for you." },
    { id = "g_other", when = { ["not"] = { class = "DRUID" } }, text = "Balance in all things, friend, as the Earth Mother keeps it between sun and moon. Even in a city built on cliffs." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, friend, and I hope you kept your balance out there. Come and tell me how the land is faring." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I'm told one of your words was found false here in the city. Balance is practised daily, friend, and honesty is part of the practice." },
  },

  notice = {
    { id = "n_cat", cat = "form", when = { form = "cat" },
      text = "Swift and quiet, the cat. Mind it doesn't make you forget the rest of what you are." },
  },

  start = "hello",
  nodes = {
    xcl_mara = {
      big = true,
      lines = { { id = "xcl_mara_default", text = "Then Zaetar's spirit may rest a little easier. Zaetar was a son of Cenarius who loved Theradras, the daughter of Therazane the Stonemother, and their children were the first centaur, who murdered their own father. Theradras buried him in Maraudon, and her grief has poisoned those caves and half of Desolace ever since." } },
      choices = {
        { text = "The balance had to be restored, whatever she felt.", next = "BACK", reply = "It did, and I'm glad it was done, though it gives me no joy. Grief poisoning a whole land is still poison, whatever its cause.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "An elemental's grief isn't ours to judge, Turak.", next = "BACK", reply = "It isn't, and I'm glad you see it so. We judged only what her grief had done to the land, not the grief itself.", fx = { align = { order = -1 } } },
        { text = "Why do the centaur honour Maraudon?", next = "xcl_mara2" },
      },
    },
    xcl_mara2 = {
      lines = { { id = "xcl_mara2_default", text = "Because it's their father's tomb, and every centaur clan in Desolace claims Zaetar as its own, though they agree on little else. To them Maraudon is a holy place, and a tomb is sacred even to a people who make so many of them." } },
      choices = { { text = "Then I hope the dead of Maraudon rest now, Turak.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Perhaps. Death and Light should not walk together, and yet you do. Balance is practised daily, like any honest craft, and I suspect you practise harder than most to find your own." } },
      choices = {
        { text = "I'll practise it daily, as you say.", next = "BACK", reply = "Then you'll be a steadier paladin than most, and a better student than many of my cubs. Come back and tell me how it goes.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Balance is your craft. Mine is the Light.", next = "BACK", reply = "Perhaps it is, though I suspect the Light knows more about balance than its paladins do. Keep your craft, and I'll keep mine.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "There is in everything, though some people try hard to forget it. I'm told a priest can heal with one hand and wound with the other, and that the shadow costs something every time it's used. Practise the mending more often than the wounding, and I think you'll keep your footing." } },
      choices = {
        { text = "Then I'll mend more than I wound, Turak.", next = "BACK", reply = "Then I think you'll keep your footing, and your soul too. Mend more than you wound, and you will be welcome at every fire.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll use whichever hand the fight needs.", next = "BACK", reply = "A fighter's answer, and fair enough in a fight. Only remember which hand you reach for first, because one grows stronger than the other.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "That they're strong and brave and far too quick to fight, though I'll admit some of my cubs are the same. A bear and a warrior both stand in front of the danger, so I'd say we have more in common than either of us likes to admit." } },
      choices = {
        { text = "Then we stand together, druid, bear and warrior.", next = "BACK", reply = "Then the bear and the warrior will hold the line, and I'll be glad of the company. Come and spar with my cubs sometime, they need humbling.", fx = { align = { honor = 1 } } },
        { text = "A warrior doesn't need a druid's approval, Turak.", next = "BACK", reply = "No, but you might want a druid's healing someday, and it's given freely. Keep your pride, warrior, and I'll keep my paws ready.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Quieter, I'd wager, since we have soft paws and you have boots. But a rogue and a druid both learn that the quiet hunter eats and the loud one goes hungry, which is a lesson I teach every cub who comes up the lift." },
      },
      choices = {
        { text = "Quiet hunters win, and that's the whole lesson.", next = "BACK", reply = "That's most of it, and the rest is knowing when to stop being quiet. You'd make a fine cub, if you ever wanted fur.", fx = { align = { honor = -1 } } },
        { text = "Quiet is good, but I'll still fight fair.", next = "BACK", reply = "Then you'd make a good bear, and a poor cat. Fair is good, but don't be too proud to step softly when it matters.", fx = { align = { honor = 1 } } },
        { text = "What is the Great Balance?", next = "balance" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "That's a question the Arch Druid would answer better than I, but I'll tell you what I think. Everything has a place in the balance, even fire, though the arcane has a way of forgetting its own place and taking someone else's." },
      },
      choices = {
        { text = "I'll remember my place in it, then.", next = "BACK", reply = "That's all the balance asks, and more than most remember. Keep your place, and the arcane will keep its own.", fx = { align = { order = 1 } } },
        { text = "Balance is for druids. I'll take what I need.", next = "BACK", reply = "Then the balance will take what it needs back, in its own time. I only hope you're ready to pay when it comes for you.", fx = { align = { order = -1 } } },
        { text = "What do you mean by the Great Balance?", next = "balance" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Balance is practised daily, like any honest craft, and a warlock practises holding something that would gladly devour them. Perhaps you understand balance better than my students do, then, but if you ever let go, the balance will set itself right, and you won't like how." },
      },
      choices = {
        { text = "I'll hold it, Turak, every day.", next = "BACK", reply = "That's the hardest discipline I've ever heard of, and you carry it every day. I hope your hands never tire.", fx = { align = { order = 1 } } },
        { text = "The balance can look after itself.", next = "BACK", reply = "It will, warlock, and that's my warning. You may not like what it looks like when it does.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken carrying the Light. I teach the steps of balance, and you, I think, are a very strange step." },
        { id = "h_default", key = true, text = "I'm Turak Runetotem, and I help the Arch Druid train the young ones. I teach the steps; he teaches why they matter." },
        { id = "h_cl_mara", tags = { "news" }, when = { cleared = "Maraudon", faction = "Horde" }, text = "You've been down to the bottom of Maraudon, where Princess Theradras sits in her poisoned grotto. The Circle will want to hear of it, and I'd like to hear it first, if you'll humour me." },
        { id = "h_call", tags = { "news" }, when = { questActive = TODO_QUEST("Heeding the Call") },
          text = "The call reached you, then, and good. Sit, for before you can be more than one creature, you must understand the one you are." },
        { id = "h_back", when = { questActive = TODO_QUEST("Back to Thunder Bluff") },
          text = "You've sat with the Great Bear Spirit; few forget that look. Tell me what you felt." },
        { id = "h_poison", when = { questActive = TODO_QUEST("Power over Poison") },
          text = "The Crossroads has troubles with poison. A druid who can draw it out of the living is worth a dozen healers' herbs." },
        { id = "h_aquatic", when = { questDone = TODO_QUEST("Aquatic Form") },
          text = "Now the water's yours too, though few tauren take to it. You'll be a strange sight in the rivers, so enjoy it." },
        { id = "h_bear", when = { metBefore = true, class = "DRUID" }, text = "How does the bear sit with you now? It's heavy at first, for most, and then it gets lighter, or you get stronger, and I've never been sure which." },
        { id = "h_listen", when = { metBefore = true }, text = "The Arch Druid speaks to the Circle. I speak to the young ones. Between the two of us, someone is always being listened to." },
        { id = "h_skyborne", when = { race = "Skyborne", class = "DRUID" }, text = "A druid from the sky isles! Your people lean on the elements before Elune, I'm told, and I'm glad of it. The Earth Mother made the winds too, and she won't mind sharing you." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Mu'sha has her eye open, and she brings sleep to the plains, though not to me, tonight." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! The Arch Druid and your elders argue over tea about which of us listens better, and neither of them ever wins." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior on Elder Rise. The Arch Druid won't mind, but the cubs will stare, because they think warriors are bears that forgot to change back." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest on Elder Rise. Welcome, friend; I teach balance here, and I suspect you keep a balance of your own, between the hurts you mend and the hurts you can cause." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock among the druids. Balance asks that I welcome you, though it does not ask me to like your demon." },
      },
      choices = {
        { text = "Is there balance in a priest's power, Turak?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "How did you become a druid?", next = "path" },
        { text = "Train me.", next = "BUSINESS", when = { class = "DRUID" } },
        { text = "What is the Great Balance?", next = "balance" },
        { text = "Which form should I learn to trust first?", next = "forms", when = { class = "DRUID" } },
        { text = "I hunted before I heard the call, Turak.", next = "hunter", when = { class = "DRUID", origin = { "tauren_narache_hunter", "tauren_plains_runner" } } },
        { text = "The sky isles never taught me the Earth Mother.", next = "skyborne", when = { race = "Skyborne", class = "DRUID" } },
        { text = "I'm a hunter. Is there anything you'd teach me?", next = "hunterclass", when = { class = "HUNTER" } },
        { text = "Who listens better, Turak, a druid or a shaman?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "A cat druid moves as quietly as I do.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Is the arcane part of the Great Balance, Turak?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What do druids think of warriors, Turak?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "A warlock can't keep the balance, I'd guess.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Am I out of balance, Turak?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Princess Theradras is defeated, Turak.", next = "xcl_mara", when = { cleared = "Maraudon", faction = "Horde" } },
        { text = "Farewell.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Another question? Good; a druid who asks is a druid who's learning." },
        { id = "h_again2", text = "Sit a while longer. The Balance can wait for one more question." },
      },
    },
    forms = {
      big = true,
      lines = {
        { id = "fo_default", text = "The bear, because it teaches you to stand your ground, and every druid needs that before anything else. The cat teaches you to move, and the water teaches you to let go, but those come later, when you've learned you can stand." },
        { id = "fo_skyborne", when = { race = "Skyborne" },
          text = "For you, perhaps the travel form, since your people seem to dislike standing still on solid ground. But learn the bear anyway; the ground here doesn't move, and you'll need to be as heavy as it is." },
      },
      choices = {
        { text = "The bear first, then. Patience before speed.", next = "BACK", reply = "Wise words for someone so new, and the bear will reward them. Learn to stand, and the cat will come easier than you think.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "I'd rather be the cat. Speed wins fights.", next = "BACK", reply = "The cat is quick, and the cat is clever, and the cat runs out of breath. Learn the bear first, cub, and you'll be faster in the end.", fx = { align = { order = -1 } } },
        { text = "And what does the bear ask in return?", next = "forms_ask" },
      },
    },
    forms_ask = {
      lines = { { id = "fa_default", text = "That you don't stay in it too long. The bear is content and slow and very hard to argue with, and some young druids find they like that more than being themselves. Come back to your own shape each night, and you'll be fine." } },
      choices = { { text = "I'll come back each night.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Then you know the moment when the hunt turns around and the beast looks back at you, because I hunted too, before the call. Don't lose the hunter's eye, young one; a druid who can track is twice as useful to the Arch Druid." } },
      choices = { { text = "I'll keep both eyes open.", next = "BACK", fx = { affinity = 2 } } },
    },
    skyborne = {
      lines = { { id = "sb_default", text = "No, and I won't make you pretend she was there all along. Honor the elements that raised you; the Earth Mother is patient, and she'll be glad of you whenever you find your way to her." } },
      choices = { { text = "I'd like to learn about her.", next = "BACK", fx = { affinity = 2, learn = { "cenarion_circle" } } } },
    },
    hunterclass = {
      lines = { { id = "hc_default", text = "Only what I learned when I put the bow down: that the beast you're tracking is often tracking you. Jorn Skyseer at Taurajo teaches the rest, and better than I could." } },
      choices = { { text = "I'll find Jorn.", next = "BACK" } },
    },
    balance = {
      lines = { { id = "b_default", text = "Everything in its place, and everything with a place. When we forget our place, the world reminds us, gently if we're lucky." } },
      choices = { { text = "Thank you.", next = "BACK", fx = { affinity = 1, learn = { "cenarion_circle" } } } },
    },
    path = {
      lines = {
        { id = "p_stag", text = "I hunted, first, and I tracked a stag three days and lost it. On the fourth morning it found me, standing in the grass and watching, and I put the bow down. Hamuul found me a week later, still sitting there." },
      },
      choices = { { text = "That's a good story.", next = "BACK", fx = { affinity = 2 } }, { text = "What did the stag want?", next = "stag" } },
    },
    stag = {
      lines = {
        { id = "s_default", text = "I've wondered for years. I think it wanted to see if I'd keep chasing, and I didn't, and that was the lesson." },
      },
      choices = { { text = "I'll remember it.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Druids listen to the wild until we become part of it, and shamans speak to the elements and wait for an answer. I'd say we practice the same balance, and like any craft it comes down to who does the work each day." } },
      choices = {
        { text = "Balance is a discipline, so it should be practiced daily.", next = "BACK", reply = "It should, and it does, whether we talk to the wind or sleep in the grass. Practice is the only prayer the land truly hears.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Balance is overrated. The elements answer passion, not routine.", next = "BACK", reply = "Passion makes a fine spark, I'll grant, but a spark won't keep a fire going through the night. The elements answer passion once and routine forever.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_circle", text = "Our order, and the Arch Druid's pride. Go to Moonglade when you can; it's quieter than here." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The Dream is where we go to rest and to learn, and every druid must walk it. I teach the steps, and Hamuul teaches why they matter." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother made every creature, and a druid learns to take their shape. I teach that shape, and she teaches what it means." } },
    elune = { { id = "tp_elune", text = "The night elves' moon goddess, whom we call Mu'sha, watches over the druids at night. I find her light restful after a long day of teaching." } },
    cairne = { { id = "tp_cairne", text = "Cairne is a great chieftain, and he gave us a place to teach. I am grateful, and I show it by teaching well." } },
    _none = { { id = "tp_none", text = "Ask Hamuul. I only teach what I'm sure of, and the land teaches the rest in its own season." } },
  },
}

P:NPC {
  key = "magatha", id = TODO_NPC("Magatha Grimtotem"), name = "Magatha Grimtotem",
  prejudice = { race = { "Orc", "Troll", "Scourge" }, amount = 12, why = "Grimtotem pride: the tauren were whole before Thrall came, and his strays are a debt Cairne took on without asking the elders." },
  rivals = { "cairne", "hamuul" },
  bible = "bibles/thunderbluff.md", role = "noble", tier = "major",
  communities = { "thunder_bluff" }, temper = { "cunning" }, values = { "proud", "ambitious" },
  notices = { "race", "class" },
  impression = {
    first = "Cairne lets her live on Elder Rise to keep an eye on her, Magatha Grimtotem says, and she lets him think it works. Every courtesy she offered seemed to come with a reason she was keeping to herself.",
    third = "{name} met Magatha Grimtotem, the sharp-tongued Elder Crone of the Grimtotem who dwells on Elder Rise.",
  },

  greetings = {
    { id = "g_prej", when = { prejudiced = true }, text = "Another of Thrall's people up on my bluff, wearing a guest's smile. Cairne owes your Warchief a debt, but the Grimtotem never signed it, so mind your feet on Elder Rise." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "You again, and I find I don't mind it as much as I ought to. Don't let that go to your head, outsider; the Grimtotem still keep their own counsel." },
    { id = "o_mag_respect", when = { gossip = { topic = "magatha", stance = "respect" } }, text = "Sage Truthseeker has written in that little book of hers that you think well of me. How nice to have one sensible voice on the lower rise." },
    { id = "g_crone", text = "Hm. Another one come to stare at the old crone. Well, stare, and then be useful or be gone." },
    { id = "g_tauren", when = { race = "Tauren" }, text = "A child of the plains, good. You at least have the sense to be born tauren." },
    { id = "g_away", when = { away = 14 }, text = "So you've been gone {away}, and now you've crawled back up to Elder Rise. Well, I hope you've brought something more useful than your face." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "I hear someone in this city swallowed a story of yours whole. How clever of you, child, and how very foolish of them." },
    { id = "g_word_intimidated", when = { word = "intimidated" }, text = "They say you made someone back down without lifting a hand. Fear is a fine tool, child, and the Grimtotem know it better than most." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman? The elements speak to you, do they? They speak to me louder, so remember that, if we ever disagree." },
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "Forsaken. Don't flinch; I don't hate you, and our ways might give you back a little of what you lost. Some here think I've other reasons, so let them think." },
    { id = "n_outsider", cat = "race", when = { race = { "Human", "Dwarf", "Gnome", "NightElf" } },
      text = "The lesser races walk on Elder Rise now; what a time we live in. Keep your hands where I can see them." },
  },

  start = "hello",
  nodes = {
    prej_magatha = {
      big = true,
      lines = { { id = "prej_magatha_default", text = "Both, if you want the truth, and I'm too old to waste time on anything else. My people walked these plains for a thousand years before the orcs came across the sea, and Cairne bound us to a Horde that did nothing for us but help one fight with the centaur. Now every orc, troll and walking corpse thinks Mulgore is theirs to wander." } },
      choices = {
        { text = "The Horde stood with you against the centaur. That debt is real.", next = "BACK", reply = "Real, and paid many times over, child, though Cairne still keeps writing promissory notes. A debt that never ends is no longer a debt, it's a chain.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Then the tauren should stand alone, and the Grimtotem lead them.", next = "BACK", reply = "Now there's a voice I don't hear often enough up here. Say it again, child, but quieter, because Cairne's braves have long ears.", fx = { align = { order = -1, honor = -1 }, affinity = 1 } },
        { text = "Pride like yours will split the tauren in two, Crone.", next = "BACK", reply = "Split them? Cairne split them when he knelt to an orc. I only want the tauren to stand up straight again, and pride is what makes a people stand.", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "I'm a guest here. I'll act like one.", next = "prej_magatha_calm", fx = { affinity = 1 } },
        { text = "What did the elders want, if not the Horde?", next = "prej_magatha_why" },
      },
    },
    prej_magatha_why = {
      lines = { { id = "prej_magatha_why_default", text = "To be asked, child. Cairne went to Thrall and came back with an alliance in his hand, and the elders were told after the kodo had already been bartered. The Grimtotem remember things like that, and we remember them for a long while." } },
      choices = { { text = "I see. Let me answer you, then.", next = "prej_magatha" }, { text = "Something else.", next = "BACK" } },
    },
    prej_magatha_calm = {
      lines = { { id = "prej_magatha_calm_default", text = "Hmph. Most of your kind forget that by the second cup of tea. Act like a guest long enough and I may even learn your name without being told it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xalt_magatha = {
      lines = {
        { id = "xalt_magatha_default", text = "Many climb up here to stare at the old crone and go home with a story, and I let them. The one you speak of stayed longer and asked what the Grimtotem want, which is a better question than Cairne's people ever think to ask." },
        { id = "xalt_magatha_kin", when = { alt = { kin = true } }, text = "{alt} asked me what the Grimtotem want, and I said that land is owed to those who held it first. They didn't agree, but they didn't run off to Cairne either, and I value that sort of discretion." },
      },
      choices = {
        { text = "Land should be shared among the tribes, Elder Crone.", next = "BACK", reply = "Shared, she says, as if the centaur ever shared anything with us. Sharing is for those who can afford it, child, and the tauren never could.", fx = { align = { light = 1 } } },
        { text = "The strong keep what they hold. That's the old way.", next = "BACK", reply = "It is, and the only way that ever kept the tauren alive. Cairne has forgotten it, but the Grimtotem never did.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, Elder Crone.", next = "BACK" },
      },
    },
    op_cairne = {
      lines = {
        { id = "opc_q", text = "Because I like to know where people stand before the wind changes. You've seen him on the High Rise, so tell me, what do you think of Cairne Bloodhoof?" },
      },
      choices = {
        { text = "Cairne is the greatest chief the tauren have ever had.", next = "op_cairne_r1", fx = { affinity = -2, align = { order = 1 }, opinion = { cairne = "admire" } } },
        { text = "He's old. The tribes need younger, harder hands.", next = "op_cairne_r2", fx = { affinity = 2, align = { order = -1 }, trait = { ambitious = 1 }, opinion = { cairne = "soft" } } },
        { text = "He trusts too easily. The orcs and the Forsaken know it.", next = "op_cairne_r3", fx = { affinity = 1, trait = { skeptical = 1 }, opinion = { cairne = "trusting" } } },
        { text = "He brought our people home to Mulgore. I'll not speak against him.", next = "op_cairne_r4", fx = { affinity = -1, opinion = { cairne = "loyal" } }, when = { race = "Tauren" } },
        { text = "He's an honest bull. The Alliance could ask for no better neighbour.", next = "op_cairne_r5", fx = { affinity = -2, opinion = { cairne = "respect" } }, when = { faction = "Alliance" } },
        { text = "He's the chieftain. My opinion doesn't change that.", next = "BACK" },
      },
    },
    op_cairne_r1 = {
      lines = {
        { id = "op_cairne_r1", text = "Spoken like one of his calves. Greatness is easy to see in the old, child, and harder to see in what they leave behind them." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_cairne_r2 = {
      lines = {
        { id = "op_cairne_r2", text = "Now there is someone who sees clearly. Keep saying it, quietly, to the right people, and you'll find Elder Rise very friendly." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_cairne_r3 = {
      lines = {
        { id = "op_cairne_r3", text = "He does, and it's a fine quality in a grandfather and a dangerous one in a chieftain. I'm glad someone besides me has noticed." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_cairne_r4 = {
      lines = {
        { id = "op_cairne_r4", text = "Loyalty is a fine thing in a calf. Remember that you said it, though, because the day may come when you'll want to say something else." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_cairne_r5 = {
      lines = {
        { id = "op_cairne_r5", text = "Of course the Alliance likes him, outsider, because he gives away so much and asks so little. That rather proves my point." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xpt_magatha = {
      big = true,
      lines = { { id = "xpt_magatha_default", text = "Plainly, then: the Forsaken are a bargain Cairne made without asking the elders, and bargains made in haste are paid for later. I've nothing against your friend in particular, child, only against a chieftain who no longer listens to those who walked these plains before him." } },
      choices = {
        { text = "Cairne was right, and the elders should follow him.", next = "BACK", reply = "Then you've learned your lessons well from the Bloodhoof, child. Follow him, then, and see where his handshakes lead.", fx = { align = { order = 1 } } },
        { text = "Perhaps the elders deserve a stronger voice than Cairne allows.", next = "BACK", reply = "Now you're starting to see what I see from up here. The elders have voices, child, and they're being drowned out by orc drums.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Who would you rather see lead the tauren?", next = "xpt_magatha2" },
        { text = "Something else, Elder Crone.", next = "BACK" },
      },
    },
    xpt_magatha2 = {
      lines = { { id = "xpt_magatha2_default", text = "I would rather see the tauren led by those who remember the old ways, and I'll say no more than that in a city full of Bloodhoof ears. Go and enjoy your walk with your friend, and think on what I've told you." } },
      choices = {
        { text = "I'll think on it.", next = "BACK" },
      },
    },
    xcl_mara = {
      big = true,
      lines = { { id = "xcl_mara_default", text = "Defeated, you say, which is a fine word for something that cannot truly die. Theradras is a daughter of the Stonemother, and the earth itself listened when she wept, so Desolace became the wasteland it is now. My Grimtotem have always known the earth is not gentle, whatever Cairne's druids say, and Maraudon is the proof of it." } },
      choices = {
        { text = "Power like hers belongs to those strong enough to claim it.", next = "BACK", reply = "Ah, so you understand. The strong are the ones who decide what the earth gives, and the Grimtotem have always been strong.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "The earth's power should be respected, Elder Crone, not seized.", next = "BACK", reply = "Respected, yes, and feared, and used when it is needed. The druids respect it from a safe distance, and the earth laughs at them.", fx = { align = { order = 1 } } },
        { text = "The Grimtotem seem to honour the earth's anger.", next = "xcl_mara2" },
      },
    },
    xcl_mara2 = {
      lines = { { id = "xcl_mara2_default", text = "We honour the earth as it is, child, in its anger as well as its patience, which is more than the Bloodhoof bother with. Cairne would have the Earth Mother be a gentle grandmother who sings to calves, but the stones of Desolace know better." } },
      choices = { { text = "I think the earth is both, Elder Crone.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "A creature that should not be, carrying a power that should not answer it. The Earth Mother has nothing to say about you, so I will say it: you are useful, and you are dangerous, and I wonder whether the Horde knows which." } },
      choices = {
        { text = "I serve the Horde, Elder Crone. That's what I am.", next = "BACK", reply = "Good, then serve it well, and remember who stands behind the Horde's throne. Cairne has many friends, and few of them see as clearly as I do.", fx = { align = { order = 1 } } },
        { text = "Useful and dangerous. I'll take both.", next = "BACK", reply = "Ha! At least you're honest, which is more than most of your kind. Be useful, then, and I'll worry about the dangerous part.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "That faith is a tool like any other, and that the dead learned as much when the Light stopped answering them. Cairne would call that a sad lesson, but I think it a useful one, and I find the Forsaken far more practical company than the elders who sit beside me. Remember that, priest, if you ever need a friend on this bluff." } },
      choices = {
        { text = "Faith isn't a tool, Magatha. That's a dangerous belief.", next = "BACK", reply = "Is it, child? Then why do the dead still pray? Something answers them, and it isn't kindness.", fx = { align = { light = 1 } } },
        { text = "They're right. Faith serves whoever wields it best.", next = "BACK", reply = "Practical words, and I like them better than the sermons I usually hear on this rise. You'll do well among the Forsaken, priest.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Protection? From whom, child? I'm an old woman among friends, and everyone on Elder Rise is so very kind. Though if you're looking for someone worth guarding, I'd watch those who speak loudest of peace, because they are always the first to need defending." } },
      choices = {
        { text = "I'll guard whoever Cairne asks me to guard.", next = "BACK", reply = "A loyal answer, child, and Cairne would like it. But a guard who never asks why he guards is only a spear waiting for someone else's hand.", fx = { align = { order = 1 } } },
        { text = "I'll guard whoever pays the best, Elder Crone.", next = "BACK", reply = "Honest coin for honest work, and I can't fault you for it. Come back when your purse is lighter, and we'll see what an old woman can offer.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Whatever threatens the tribe, child, and we've always had a broad idea of what that means. The Grimtotem keep to the Stonetalon peaks and Thousand Needles, and the hunting is good up there, though the company can be rather unforgiving." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Whatever threatens the tribe, child, and we've always had a broad idea of what that means. {pet} watches me as though it expects me to bite, which shows good sense." },
      },
      choices = {
        { text = "I hunt for the whole tribe, not just the Grimtotem.", next = "BACK", reply = "Well said, though the Bloodhoof would smile at that and forget it by supper. Every tribe, then, but the Grimtotem remember who hunts for them.", fx = { align = { order = 1 } } },
        { text = "I hunt whatever threatens me. That's all that matters.", next = "BACK", reply = "That is the oldest lesson there is, child. Cairne's people would call it selfish, but the plains don't care what anyone calls anything.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Everyone on Elder Rise keeps secrets, child, and the clever ones keep them from Cairne. A rogue might be useful to an old woman, so long as she knew whose purse the rogue had been in last." },
      },
      choices = {
        { text = "My secrets are for sale, if the price is right.", next = "BACK", reply = "There we are, an honest rogue, which is rarer than gold on Elder Rise. Keep the price reasonable, child, and come back when you have something worth selling.", fx = { align = { order = -1 } } },
        { text = "My loyalty is to Cairne, not to you.", next = "BACK", reply = "Then you are a fool, child, and a loyal one, which is a dangerous combination. Cairne won't thank you, but I'll remember your face.", fx = { align = { order = 1 } } },
        { text = "What do the Grimtotem really want?", next = "want" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "They are as different as a river and a stolen bucket of water, child. The earth answers me because the Grimtotem have always known how to ask it hard, and your arcane answers you because you never stop grabbing at it, which I almost admire." },
      },
      choices = {
        { text = "Grabbing gets results, and your earth would agree.", next = "BACK", reply = "It does, child, and the earth gives more to those who reach for it. Grab, then, but grab carefully, or the earth will grab back.", fx = { align = { order = -1 } } },
        { text = "Then I'll learn to ask, not grab.", next = "BACK", reply = "A sensible answer, and a rare one from a mage. Ask hard, though, child, because the earth respects those who demand.", fx = { align = { order = 1 } } },
        { text = "What do you think of Cairne?", next = "cairne" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "The Grimtotem fear very little, and certainly not a little imp on a chain. But I've seen what demons made of the orcs, and I'll tell you what Cairne won't, which is that any power that makes you its servant is a poor bargain, however strong it feels." },
      },
      choices = {
        { text = "You're right. I'll never let it master me.", next = "BACK", reply = "Good, see that you never do. The orcs said the same once, and look what it cost them.", fx = { align = { light = 1 } } },
        { text = "Strength is strength, whatever it costs me.", next = "BACK", reply = "Then you'll pay, child, and pay dearly, as everyone does. I only hope your strength is worth the price.", fx = { align = { light = -1 } } },
        { text = "And what do the Grimtotem want?", next = "want" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_any", tags = { "news" }, when = { alt = true },
          text = "I remember {alt}, the {altclass} who came across the bridge to my rise and tried very hard not to look at the totems. You have the same careful eyes, and careful people interest me." },
        { id = "h_alt_kin", tags = { "news" }, when = { alt = { kin = true, race = "Tauren" } },
          text = "You have {alt}'s horns, or near enough, and I wonder which tribe raised the two of you. Not the Bloodhoof, I hope, because Cairne has admirers enough." },
        { id = "h_pt_forsaken", tags = { "news" }, when = { party = { race = "Scourge" } },
          text = "You bring one of the walking dead up onto my bluff and expect me to smile. Cairne may open his arms to every stray Thrall drags in, but the Grimtotem remember what the Earth Mother intended for the dead, and it was not this." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken who still calls on the Light, how very curious. Cairne sees a strange ally, I suspect, and I see something else entirely." },
        { id = "h_rivalfav", when = { rivalFavor = { min = 2 } },
          text = "You have been sitting at Cairne's fire, or at Runetotem's, and they have filled your head with talk of peace and patience. I will not hold it against you, but I will not pretend to be pleased." },
        { id = "h_rivalfoe", when = { rivalFavor = { max = -2 } },
          text = "So you have worn out your welcome on the High Rise. Then perhaps you will find Elder Rise more hospitable than the old bull's lodge." },
        { id = "h_default", key = true,
          text = "Magatha, Elder Crone of the Grimtotem. Cairne lets me live up here so he can keep an eye on me. I let him think it works." },
        { id = "h_cl_mara", tags = { "news" }, when = { cleared = "Maraudon", faction = "Horde" }, text = "So you've been into Maraudon and humbled Theradras. She is a princess of the earth itself, child, and you walked into her grotto as though it were Elder Rise, which is either very brave or very foolish." },
        { id = "h_crone", tags = { "news" }, when = { questActive = TODO_QUEST("The Elder Crone") },
          text = "Someone sent you to me? Good; I have uses for capable hands, and fewer for chatter. Listen carefully, because I won't say it twice." },
        { id = "h_forsaken", when = { questActive = TODO_QUEST("Forsaken Aid") },
          text = "The Forsaken want to remember being alive, and I can help with that. Whether I should is a matter the Chieftain has opinions on, and I'll ask for them when I want them." },
        { id = "h_fire", when = { questActive = TODO_QUEST("Sacred Fire") },
          text = "Sacred fire, for sacred work. Fetch it, and don't let anyone ask you what it's for." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Elves who dropped out of the sky. Kalimdor fills up with strangers, and Cairne opens the gate to every one. I'd have shut it." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, child. Cairne surrounds himself with warriors, and I find it so reassuring to see another come up the lifts." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, child, with a beast at your side. The Grimtotem have always admired a good hunter; it's one of the few things we admire." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde, come up to Elder Rise. How interesting, for the Forsaken priests tell me things the shaman of this bluff would rather not hear." },
      },
      choices = {
        { text = "Do you dislike me, Elder Crone, or everyone Thrall brought?", next = "prej_magatha", when = { prejudiced = true } },
        { text = "Someone close to me has been to your rise, Elder Crone.", next = "xalt_magatha", when = { alt = true } },
        { text = "What do the Forsaken priests tell you, Magatha?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "You must have opinions about Cairne.", next = "cairne" },
        { text = "What do the Grimtotem want?", next = "want" },
        { text = "Then let's test it. Whose voice do the elements prefer?", next = "shaman", when = { class = "SHAMAN" } },
        { text = "What can your ways give back to my people?", next = "forsaken", when = { race = "Scourge" } },
        { text = "I was born Grimtotem, Elder Crone.", next = "grimtotem", when = { origin = "tauren_grimtotem_born" } },
        { text = "Hamuul made me a druid. You disapprove.", next = "druid", when = { race = "Tauren", class = "DRUID" } },
        { text = "I'm the sort who keeps secrets, Elder Crone.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Your earth magic and my arcane aren't so different.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "You might need protection on Elder Rise, Magatha.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What do the Grimtotem hunt, Magatha?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "The Grimtotem must fear demons, Elder Crone.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What do you see in me, Magatha?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I defeated Princess Theradras in Maraudon, Elder Crone.", next = "xcl_mara", when = { cleared = "Maraudon", faction = "Horde" } },
        { text = "My companion is Forsaken. Will you speak plainly about it?", next = "xpt_magatha", when = { party = { race = "Scourge" } } },
        { text = "I'll go.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Still here? Then ask, and be quick about it; the Grimtotem were never a herd that waited on stragglers." },
        { id = "h_again2", text = "Well? I've no time for children who stand about thinking." },
      },
    },
    shaman = {
      lines = {
        { id = "sh_default", text = "Ha! Mine, child, because I've been speaking to them since before your grandmother was weaned. But hear this: a shaman with a spine is rarer up here than one with a gift, and you seem to have both." },
        { id = "sh_orc", when = { race = "Orc" },
          text = "An orc shaman, taught by the Warchief's people. The elements were here long before your Warchief, and they'll be here long after him; remember whose land they're speaking for." },
      },
      choices = {
        { text = "The elements speak for no one tribe, Elder.", next = "BACK", reply = "They don't, child, and that is precisely the trouble. They answer the strongest voice, and Cairne's voice grows softer every year.", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Then teach me to make them speak louder.", next = "BACK", reply = "Ha! Now that's a question worth answering. Come to me when you're ready, and bring your spine.", fx = { affinity = 2, align = { order = -1 } } },
      },
    },
    forsaken = {
      big = true,
      lines = { { id = "fk_default", text = "A little of what you've lost: the taste of things, the feel of the sun, perhaps, for a while. The old remedies were made for living flesh, but flesh is flesh, and I'm curious to see what they do to yours. Cairne calls it charity, and I let him." } },
      choices = {
        { text = "I'll take whatever you can give me.", next = "BACK", reply = "Good, child, a sensible answer from a corpse. Sit down, then, and let an old woman see what the herbs can do.", fx = { affinity = 2, align = { light = -1 } } },
        { text = "I won't be your experiment, crone.", next = "BACK", reply = "Then go back to the Pools and play with your apothecaries. I'll find another curious corpse soon enough.", fx = { affinity = -2, align = { light = 1 } } },
      },
    },
    grimtotem = {
      lines = { { id = "gt_default", text = "I know who you were born to, and I know who you kneel to now. The Grimtotem don't forget, child, but neither do I give up on blood. When Cairne's handshakes run out, you'll know where your people are." } },
      choices = {
        { text = "My people are the Horde now.", next = "BACK", reply = "Then you've forgotten your blood, child, and the Horde will forget you too, when it suits them. The Grimtotem will still be here.", fx = { affinity = -2, align = { honor = 1 } } },
        { text = "I'll remember where they are.", next = "BACK", reply = "Good, child, and remember it when Cairne's handshakes turn cold. Blood calls, and the Grimtotem always answer.", fx = { affinity = 2, align = { honor = -1 } } },
      },
    },
    druid = {
      lines = { { id = "dr_default", text = "Disapprove? I find it embarrassing, which is worse, because tauren should not need a night elf to teach them their own land. Still, you can wear the bear, and the bear was ours before Elune ever heard of it, so wear it proudly and forget who taught you." } },
      choices = { { text = "I'll never forget who taught me.", next = "BACK", fx = { affinity = -1, trait = { kind = 1 } } } },
    },
    cairne = {
      big = true,
      lines = {
        { id = "c_default", text = "A good warrior and a kind old bull, and a chieftain who gives our people's future away to orcs and outsiders one handshake at a time. I would lead them better, and I have said so, to his face." },
      },
      choices = {
        { text = "Why tell me this, Elder Crone?", next = "op_cairne" },
        { text = "That's bold.", next = "bold" },
        { text = "He's a great leader.", next = "BACK", fx = { affinity = -2 } },
      },
    },
    bold = {
      lines = { { id = "b_default", text = "It's honest, and the tauren used to value that. Now we value getting along, and it's not the same thing, child." } },
      choices = { { text = "...", next = "END" } },
    },
    want = {
      lines = { { id = "w_default", text = "What was ours: the old lands, wherever they lie. Kalimdor was the tauren's before it was anyone's, and I haven't forgotten; I'm old enough not to." } },
      choices = { { text = "...", next = "END", fx = { learn = { "grimtotem" } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I hear what the elders say on their rise, and what they say when they think the old crone isn't listening. Ask, if you've the stomach for an honest answer." },
      { id = "tp_knows_cold", when = { disposition = { max = 34 } }, text = "You'll get answers from me, child, but you won't enjoy a single one of them." },
    },
    cenarion_circle = { { id = "tp_circle", text = "Night elves teaching tauren to be tauren! Hamuul is proud of it, and I find it embarrassing." } },
    grimtotem = { { id = "tp_grimtotem", text = "You've heard about Arnak Grimtotem's raids in Thousand Needles, I suppose. Every clan has its hotheads. Mine simply has more of them, and better reasons." } },
    cairne = { { id = "tp_cairne", text = "Cairne is a great chieftain, of course, and a generous one. He gives everyone a chance, which is why he gives me one, and why I make sure to be grateful." } },
    thrall = { { id = "tp_thrall", text = "The Warchief is an orc, and a strong one. The tauren owe him much, Cairne says, and I am sure Cairne is right." } },
    forsaken = { { id = "tp_forsaken", text = "Cairne and Hamuul opened our doors to the dead of Lordaeron, which seems unwise to me. But I am only an elder, and what do elders know?" } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother is ancient, and her children should be strong. Some of us remember that, and some of us have grown soft on these comfortable mesas." } },
    the_elements = { { id = "tp_the_elements", text = "The elements answer to those who command them, and I have learned to command them well. That is a gift Cairne does not share, and he would do well to remember it." } },
    centaur = { { id = "tp_centaur", text = "The centaur were our enemies, and they made us strong. Peace has made us comfortable, and comfortable is not the same thing." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady is clever, and she knows what she wants. I find that I understand her better than most in this city." } },
    _none = { { id = "tp_none", text = "Not my concern, and not yours either, I expect. The earth tells me what I need to know." } },
  },
}

P:NPC {
  key = "pala", id = TODO_NPC("Innkeeper Pala"), name = "Innkeeper Pala",
  bible = "bibles/thunderbluff.md", role = "innkeeper", tier = "service",
  communities = { "thunder_bluff" }, temper = { "warm" }, values = { "generous", "kind" },
  notices = { "weary", "race" },
  impression = {
    first = "Innkeeper Pala gives everyone the same welcome and the same stew at the Cat and the Shaman. She fusses over her guests like a mother, and she clearly enjoys every minute of it.",
    third = "{name} rested at Innkeeper Pala's inn, the Cat and the Shaman, high on the bluffs of Thunder Bluff.",
  },

  greetings = {
    { id = "o_sylv_distrust", when = { gossip = { topic = "sylvanas", stance = "distrust" } }, text = "Word on the rises is you've no trust for the Dark Lady, dear. Say it softer near the Pools of Vision, because those apothecaries hear everything." },
    { id = "g_inn", text = "In out of the wind with you. There's always room by my fire, and the Earth Mother never turned a traveller away." },
    { id = "g_home", when = { homeInn = { "Thunder Bluff", "Lower Rise" } }, text = "Your blanket's by the fire, love. I aired it out this morning." },
    { id = "g_away", when = { away = 14 }, text = "There you are, love! You've been gone {away}, and I kept your blanket aired the whole time, just in case." },
    { id = "g_away_long", when = { away = 60 }, text = "You've been away {away}, love, and I'd started to worry myself sick over you. Sit by the fire, and I'll bring you a bowl before you say a word." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Everyone at the Cat and the Shaman is talking about how you've helped the city, and I couldn't be prouder if you were my own. Eat up, it's on me tonight." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I heard you left someone cross with you, love, and they came in here sulking about it. Make it right if you can, because a grudge spoils the stew." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Oh, look at you! Sit, sit; stew first, then sleep, and then you can go and get hurt again, though the Earth Mother knows I wish you wouldn't." },
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "You look chilled through, but sit by the fire anyway; warm's warm, whatever's underneath." },
  },

  start = "hello",
  nodes = {
    xpt_pala = {
      big = true,
      lines = { { id = "xpt_pala_default", text = "That's for each traveller to decide, but I'll tell you what I've noticed from behind this counter. The companies made of one people argue less on the first night and more on the tenth, and the mixed ones are the other way around, so it all evens out by the time they reach Feralas." } },
      choices = {
        { text = "Mixed companies are stronger, since each brings something different.", next = "BACK", reply = "That's been my experience too, mostly. A mixed table eats slower, but it talks better, and the stew's never wasted.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Kin understand each other. Variety just means more arguing.", next = "BACK", reply = "There's sense in that, and I've seen it on many a first night. Still, a little arguing never spoiled a stew, so long as nobody throws it.", fx = { align = { order = 1 } } },
        { text = "Thanks, Pala.", next = "BACK" },
      },
    },
    xcl_wc = {
      big = true,
      lines = { { id = "xcl_wc_default", text = "Then you'll have heard the moaning in the stone, which the young ones say is the cave itself crying. My cousin's boy went in with a hunting party and talked in his sleep about snakes for a month after, and he still won't eat eel. I feed them all when they come back up, because it's the only cure I know." } },
      choices = {
        { text = "The young ones should stay out until they're ready.", next = "BACK", reply = "I'd say so too, but they never listen to an old innkeeper. I'll keep the stew hot for when they come back scared.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them go, Pala. Fear is how the young learn.", next = "BACK", reply = "Fear's a fine teacher, I'll grant you, but a cruel one. I'll keep the stew hot, then, and the beds warm, for the lessons that don't end well.", fx = { align = { order = -1 } } },
        { text = "What do the druids say is down there?", next = "xcl_wc2" },
      },
    },
    xcl_wc2 = {
      lines = { { id = "xcl_wc2_default", text = "A sleeping night elf, if you'll believe it, dreaming so badly that the whole cave dreams with him. The druids are very solemn when they say it, and I nod and pour the stew, because what else can an innkeeper do with a story like that?" } },
      choices = { { text = "Keep pouring, Pala. It helps more than you know.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Thunder Bluff welcomes everyone, more or less. Some of my guests will want to see the Light, and some will keep their distance, and both are fine. The orcs who come up the lifts sometimes go quiet around paladins, so give them space." } },
      choices = {
        { text = "I'll give them space. They've earned it.", next = "BACK", reply = "Good, they'll thank you for it, though they won't say so. Orcs remember their camps better than they let on.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They'll learn to share a room with me.", next = "BACK", reply = "They will, in time, and so will you, I hope. Just be gentle about it, child, because some of them have very long memories.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Oh, every night, it seems, and mostly from the Barrens road, with arrows in them or centaur bruises all down their sides. I give them stew and a bed and send for a shaman, but a priest by the hearth would save my old legs a lot of running about. You're welcome to sit with the sore ones, if you'd like, and I'll keep your bowl warm." } },
      choices = {
        { text = "I'll sit with them tonight, Pala. Keep the stew coming.", next = "BACK", reply = "Bless you, child, you've no idea what a help that will be. The stew's on the house tonight, at least the extra bowl for you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I didn't come here to nurse strangers, Pala.", next = "BACK", reply = "Then sit by the fire and eat your stew, and let an old innkeeper do the nursing. I'm used to it by now.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Mostly, though I had an orc arm-wrestle a tauren brave last month and they broke two tables between them. They shook hands afterward and both paid for the wood, so I'll call that a good night, all things considered." } },
      choices = {
        { text = "A warrior should pay for what he breaks.", next = "BACK", reply = "He should, and these two did, so I've no complaint. If only all my guests were so honourable about it.", fx = { align = { honor = 1 } } },
        { text = "Broken tables are the price of a good contest.", next = "BACK", reply = "Ha, not from my purse, they aren't! But I'll grant you a good contest warms the room better than any fire.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The good ones do, and I'm grateful, because the lifts don't carry fresh meat up the bluffs fast enough. Plainstrider makes the best stew and kodo the heartiest, and I've learned to cook both, though I'll admit I never quite mastered prairie wolf." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The good ones do, and I'm grateful. {pet} looks well fed already, but it can have the scraps anyway, because every beast at the Cat and the Shaman eats." },
      },
      choices = {
        { text = "I'll bring you game, Pala. The inn feeds everyone.", next = "BACK", reply = "Oh, bless you, child, and the guests will bless you too. Bring me plainstrider if you can, it makes the best stew on the bluff.", fx = { align = { honor = 1 } } },
        { text = "I'll sell my game to whoever pays more.", next = "BACK", reply = "That's fair, and I'll pay fair, though maybe not the most. The orcs pay me mostly in grumbling, so you're already ahead.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "They do, and they've done it for years, because nobody in Thunder Bluff has ever given them a reason not to. If that changes while you're under my roof, I'll know which guest to blame, so let's both keep it from changing." },
      },
      choices = {
        { text = "No need to worry, Pala. I'm an honest guest.", next = "BACK", reply = "Good, that's all I ask of anyone under my roof. Eat your stew and sleep sound, and we'll get on fine.", fx = { align = { honor = 1 } } },
        { text = "Then they should learn to watch their packs.", next = "BACK", reply = "Maybe they should, but not under my roof. Thunder Bluff runs on trust, and I'll not see it broken by one clever guest.", fx = { align = { honor = -1 } } },
        { text = "Why call it the Cat and the Shaman?", next = "name" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "You'll do no such thing at my hearth! The stew is warm, and if it's gone cold it's because you've been talking instead of eating, so pick up that spoon and leave the fire to the fire." },
      },
      choices = {
        { text = "Sorry, Pala. Your hearth, your rules.", next = "BACK", reply = "That's the spirit, and the stew will forgive you if you eat it quickly. Now pick up that spoon, child.", fx = { align = { order = 1 } } },
        { text = "A spell is quicker than waiting on your fire.", next = "BACK", reply = "Quicker, perhaps, and you'll still be eating outside if you try it. The fire's mine, and so is the stew.", fx = { align = { order = -1 } } },
        { text = "Do the Forsaken ever stay at your inn?", next = "forsaken" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Oh, whether the Earth Mother speaks louder through the spirits or through the wild, and whose turn it is to pay. One of Hamuul's own students came down to settle it once and ended up shouting louder than any of them, so now I keep the stew coming until they're too full to talk." } },
      choices = {
        { text = "Someone should settle it properly, once and for all.", next = "BACK", reply = "Someone has tried, and it ended in shouting. I'd rather keep the stew coming and the peace too, thank you.", fx = { align = { order = 1 } } },
        { text = "Let them argue. Every voice deserves a seat by the fire.", next = "BACK", reply = "That's what I think, and that's why I named the place for both of them. The arguing usually stops when the second bowl comes round.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Everyone's welcome, child, and everyone gets the same stew, but not everyone gets to bring a demon in among my guests. Leave it at the door, and if it gets cold out there, well, I'm told that's what demons are for." },
      },
      choices = {
        { text = "I'll leave it outside, Pala.", next = "BACK", reply = "Good, child, and you'll get a full bowl for your manners. The demon can sulk outside, I'm sure it's used to it.", fx = { align = { order = 1 } } },
        { text = "My demon stays by my side.", next = "BACK", reply = "Then you'll eat your stew outside with it, child. The night air's good for the digestion, they say.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_kin", tags = { "news" }, when = { alt = { kin = true } },
          text = "Earth Mother, you could be {alt}'s twin! That {altclass} had three bowls of stew at the long table, so I'll be keeping an eye on you as well." },
        { id = "h_alt_far", tags = { "news" }, when = { alt = { notKin = true } },
          text = "We had a {altrace} called {alt} at the Cat and the Shaman not long ago, who couldn't stop staring at the lifts. I'll tell you what I told them: the lifts are perfectly safe, and the wind only takes the ones who lean." },
        { id = "h_pt_kin", tags = { "news" }, when = { party = { kin = true } },
          text = "You travel with your own people, I see, and that's a comfort on the long roads. The best companies I've seen at this hearth, though, were the ones that mixed, because each of them knew something the others didn't." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken carrying the Light! Everyone gets the same welcome and the same stew at the Cat and the Shaman, even if you don't eat it." },
        { id = "h_default", text = "I'm Pala, and I keep the Cat and the Shaman. Warriors, druids, traders off the lifts: everyone gets the same welcome and the same stew." },
        { id = "h_skyborne", when = { race = "Skyborne", faction = "Horde" },
          text = "Sky-folk, from down at the camp? Sit by the fire; up here the wind comes off the mesa with teeth, even for you." },
        { id = "h_lifts", when = { metBefore = true }, text = "The lift-runners eat here every night, the strongest backs in the city and the softest hearts. Don't tell them I said so." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Late and windy tonight, so listen to the totems creak; it sounds like the whole bluff is breathing." },
        { id = "h_turak", when = { heardLine = "turak.h_default" }, text = "You've been up to Turak on Elder Rise? He eats here twice a moon, and sits by the window and doesn't speak, but he tips well." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "Oh, a shaman! You'll fit right in at the Cat and the Shaman, dear, so sit down and I'll find you the warm corner." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, and you'll want the big bowl, I can tell. Sit down before you knock over a table, because tauren tables are sturdy, but not that sturdy." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Your beast can sleep by the fire, and you can sleep upstairs, and the stew is the same for both of you." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Come in, come in, and sit by the fire, for you healers never stop to eat, and you look as if you've been praying on an empty stomach." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid! Sit with the others by the fire, love, because they'll want you on their side the next time the shamans start the old argument." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock! Sit down and I'll bring you stew, but your demon waits outside with the kodos." },
        { id = "h_cl_wc", tags = { "news" }, when = { cleared = "Wailing Caverns", faction = "Horde" }, text = "Some of the young druids came through the Cat and the Shaman saying a stranger had been down the Wailing Caverns ahead of them. Sit down, because anyone who's breathed that air needs a bowl of something hot." },
      },
      choices = {
        { text = "Travellers must often need healing at your inn, Pala.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Why 'the Cat and the Shaman'?", next = "name" },
        { text = "I'd guess few Forsaken stay here.", next = "forsaken", when = { race = "Scourge" } },
        { text = "Why is your inn called the Cat and the Shaman, Pala?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Your guests leave their packs unattended, Pala.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Your stew's gone cold, Pala. Shall I warm it with a spell?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "I'd guess warriors behave in your inn, Pala.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Hunters must bring you game for the stew, Pala.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What do the druids and shamans argue about, Pala?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Is a warlock welcome at the Cat and the Shaman?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Does Thunder Bluff welcome paladins, Pala?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I've been down the Wailing Caverns, Pala.", next = "xcl_wc", when = { cleared = "Wailing Caverns", faction = "Horde" } },
        { text = "Should a company keep to its own kind, Pala?", next = "xpt_pala", when = { party = { kin = true } } },
        { text = "Just resting.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Anything else, love? Ask while the stew warms, and don't mind the braves snoring in the corner; they came in from Bael'dun at dawn smelling of dwarf powder." },
      },
    },
    forsaken = {
      lines = { { id = "fk_default", text = "Now and then, the apothecaries mostly, on their way to see Magatha. They don't eat my stew, which wounds me, but they sit nearest the fire every time, so I keep a seat there for them. You're welcome to it." } },
      choices = { { text = "Thank you, Pala.", next = "BACK", fx = { affinity = 2 } } },
    },
    name = {
      lines = { { id = "n_default", text = "Ask three regulars and you'll get three stories, and my favourite has the cat winning. Make up your own; everyone else does." } },
      choices = { { text = "Ha.", next = "BACK", fx = { affinity = 1 } } },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Because the druids come in wearing fur and the shamans come in smelling of rain, and they always sit together and argue. I named the place after them so they'd feel at home, and now they argue over who gets top billing." } },
      choices = {
        { text = "Arguing over stew is better than arguing with spears.", next = "BACK", reply = "It is, and that's why I keep them fed. A full belly makes for a soft argument, or so I've found.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let them quarrel properly. A little blood sharpens both sides.", next = "BACK", reply = "Not in my inn, they won't, whatever the old ways say. Blood stains the floor, and I've only just had it scrubbed.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I only keep the beds, friend. Ask on the rises, and may the eternal sun light your way up the lifts." } },
    cairne = { { id = "tp_cairne", text = "Cairne comes down to my inn sometimes and sits by the fire with the travellers. He is a kind host to his people, and I try to be the same to mine." } },
    thrall = { { id = "tp_thrall", text = "The Warchief ate my stew once, and he asked for more. I've told everyone, and I'll keep telling them." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken don't eat, which is a shame, because I make a lovely stew. They do like the fire, though, and I let them sit as long as they like." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "When the Faire comes to Mulgore, half its folk ride the lifts to see the bluff, and they all end up at my fire. I hear more strange stories that week than in the rest of the year together." } },
  },
}
