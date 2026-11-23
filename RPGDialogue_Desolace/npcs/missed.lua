-- Desolace folk the roster scan found unwritten. Goblins: Bibbly F'utzbuckle at Kormek's Hut (Bone
-- Collector), Hornizz Brimbuzzle at the Kodo Graveyard (Ghost-o-plasm Round Up) and his sister Melizza,
-- caged in the Valley of Spears (Get Me Out of Here!). Shadowprey Village: Hae'Wilani (axes),
-- Lah'Mawhani (trade goods), Mai'Lahii (fishing supplies, Clam Bait), Tukk (general goods), Wulan
-- (cooking supplies). Ghost Walker Post: Narv Hidecrafter. Sar'theris Strand: the dryad Selendra
-- (Corruption of Earth and Seed). Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.desolace")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Melizza Brimbuzzle: goblin caged by the Maraudine in the Valley of Spears. Get Me Out of Here!
---------------------------------------------------------------------------
P:NPC {
  key = "melizza_brimbuzzle", id = TODO_NPC("Melizza Brimbuzzle"), name = "Melizza Brimbuzzle", gender = "female",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = {}, temper = { "sharp" }, values = { "nerve", "family" },
  notices = { "class", "race" },
  impression = {
    first = "Melizza Brimbuzzle is locked in a wooden cage in the Maraudine camp at the north of the Valley of Spears, and she is furious about it rather than frightened. She starts negotiating her rescue before anyone has offered one.",
    third = "{name} found Melizza Brimbuzzle, a goblin caged by the Maraudine centaur in the Valley of Spears.",
  },
  greetings = {
    { id = "g_default", text = "Psst, over here, and keep your voice down! You've got two legs and you're not trying to eat me, so you're hired." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Good, because I'd nearly finished chewing through this bar and I'd hate to waste the teeth." },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Tell me you can pick a lock, sweetheart. It's a centaur lock, so it's mostly a knot, but I can't reach it from in here." },
    { id = "n_big", cat = "race", when = { race = { "Tauren", "Orc" } },
      text = "Oh, perfect, somebody big! You go in front, and I'll stay behind and tell you who to hit." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Melizza Brimbuzzle, of Gadgetzan, and currently the property of a bunch of four-legged morons. Get me out of this cage and walk me clear of their camp, and I'll make it worth your while the minute I'm somewhere I can reach my purse." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Get Me Out of Here!") }, text = "What are we standing around for? Stay close, hit anything with hooves, and don't let me out of your sight until we're well clear of the spears." },
        { id = "h_done", when = { questDone = TODO_QUEST("Get Me Out of Here!") }, text = "Well, look who it is, my own personal bodyguard! I meant what I said about making it worth your while, and a Brimbuzzle pays her debts, unlike some brothers I could name." },
      },
      again = {
        { id = "h_again", text = "Anything else? Make it fast, the big ugly one comes back on the hour." },
        { id = "h_again2", text = "Talk quick, friend." },
      },
      choices = {
        { text = "How did you end up in a cage?", next = "how" },
        { text = "What do the Maraudine want with you?", next = "want" },
        { text = "Your brother is sick with worry.", next = "brother", when = { heardLine = "hornizz_brimbuzzle.s_default" } },
        { text = "What's the plan once you're out?", next = "plan" },
        { text = "Hold on. I'll get you out.", next = "END", fx = { affinity = 1 } },
      },
    },
    how = {
      lines = { { id = "hw_default", text = "I came down here to find my brother some buyers, because he's got a head for product and none for people. I figured the Maraudine were the biggest clan, so they'd have the biggest purse, and it turns out what they've got is the biggest cages." } },
      choices = {
        { text = "You tried to sell to the Maraudine?", next = "how_sell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    how_sell = {
      lines = { { id = "hs_default", text = "I got as far as hello, sweetheart. Then one of them picked me up by the collar like a sack of oats, and I've been in here ever since, listening to them argue about whether goblins taste better roasted.", fx = { learn = { "centaur" } } } },
      choices = {
        { text = "What did they decide?", next = "how_decide" },
        { text = "Something else.", next = "BACK" },
      },
    },
    how_decide = {
      lines = { { id = "hd_default", text = "They hadn't, last I heard, which is the only reason I'm still talking. I told them I was poisonous and worth a ransom, and they're not sure enough of either one to light the fire yet." } },
      choices = {
        { text = "Quick thinking.", next = "BACK", reply = "It's the family business, friend, and I'm the one who's good at it.", fx = { affinity = 1 } },
        { text = "Are goblins poisonous?", next = "BACK", when = { class = { "ROGUE", "HUNTER" } }, reply = "Only the ones from Gadgetzan, and only if you believe us. Don't spoil it for me." },
      },
    },
    want = {
      lines = { { id = "w_default", text = "Search me. They've got prisoners from the other clans in the cages down the row, and those they shout at, but me they just come and stare at. I think I'm the entertainment, and I resent not being paid for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brother = {
      lines = { { id = "b_default", text = "Hornizz is worried? Good, he ought to be, this was his idea in everything but the details. He's camped up at the Kodo Graveyard with his crates, and when I get there he's going to hear about this until one of us retires." } },
      choices = { { text = "He'd trade his whole scheme for you.", next = "BACK", reply = "He said that? Huh. Well, don't you dare tell him I went soft about it.", fx = { affinity = 1 } } },
    },
    plan = {
      lines = { { id = "p_default", text = "We go north, fast, and we don't stop to loot. Once I'm past the last of the spears I can find my own way to my brother's camp, and you can go back to whatever a {class} does for fun around here." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I keep books in Gadgetzan, and I came to Desolace as a favour, which is the last favour I do this year." } },
    centaur = { { id = "tp_ce", text = "Loud, smelly and no head for commerce. The Maraudine are the worst of the lot, and I say that with authority." } },
    gadgetzan = { { id = "tp_gz", text = "It's a walled town in the Tanaris sand with cold drinks and a law against stabbing. I miss it something awful." } },
    _none = { { id = "tp_none", text = "Ask me when I'm not in a cage, friend." } },
  },
}

---------------------------------------------------------------------------
-- Selendra: dryad on Sar'theris Strand, south of Shadowprey. Corruption of Earth and Seed (Horde).
---------------------------------------------------------------------------
P:NPC {
  key = "selendra", id = TODO_NPC("Selendra"), name = "Selendra", gender = "female",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = {}, temper = { "earnest" }, values = { "nature", "kinship" },
  notices = { "class", "race" },
  impression = {
    first = "Selendra is a dryad, and she stands among her sisters on Sar'theris Strand as though the grey land behind her hurt to look at. She is quick and bright in her speech, and under it there is a grief much older than she seems.",
    third = "{name} met Selendra, a dryad of the Cenarion Circle on Sar'theris Strand.",
  },
  greetings = {
    { id = "g_default", text = "Oh! A traveller, and one with kind eyes, I hope. Come closer, for I will not harm you, and I have need of someone brave." },
    { id = "g_back", when = { metBefore = true }, text = "You have come back to the strand! My sisters said you would, and I am glad they were right." },
    { id = "g_cleared", when = { cleared = "Maraudon" }, text = "I felt it when she fell, like a stone lifted from the earth. Come, tell me everything, for I have waited a very long while to hear it." },
  },
  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A child of the Circle! Then you will feel what I feel in this place, how the land lies sick and silent where a forest ought to sing." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "The shu'halo have always walked gently, and my father's kin remember it. I am glad it is one of you who has come." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "You carry the taint of the Legion's magic, and it makes my skin crawl to stand near you. Still, I will not send away anyone who would help me." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Selendra, and I came down from the Stonetalon Mountains with my brother Marandis and my sisters. We seek one of our own who lies in the caverns of Maraudon, and we cannot reach him while the earth-princess lives.", fx = { learn = { "maraudon" } } },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Corruption of Earth and Seed") }, text = "You have not yet gone into the deep places, have you? Princess Theradras waits at the very heart of Maraudon, and until she is ended my kinsman cannot rest." },
        { id = "h_done", when = { questDone = TODO_QUEST("Corruption of Earth and Seed") }, text = "You did what the Circle itself could not, and Zaetar is free of her at last. My sisters and I will sing of you in Stonetalon, when we have taken him home." },
      },
      again = {
        { id = "h_again", text = "What else would you know? Ask, and I will try not to wander in the telling." },
        { id = "h_again2", text = "Yes? I am listening, truly." },
      },
      choices = {
        { text = "Who lies in Maraudon?", next = "zaetar" },
        { text = "Why is a dryad standing on a troll beach?", next = "strand" },
        { text = "Your brother is at Nijel's Point.", next = "brother" },
        { text = "What happened to this land?", next = "land" },
        { text = "Theradras is dead. I was there.", next = "dead", when = { cleared = "Maraudon" } },
        { text = "I'll do what I can.", next = "END", fx = { affinity = 1 } },
      },
    },
    zaetar = {
      lines = { { id = "z_default", text = "Zaetar, the first son of Cenarius, who was a keeper of the groves as Marandis is. Long ago he came to this land and loved Theradras, a princess of the earth elementals, though all his kin begged him not to.", fx = { learn = { "cenarion_circle" } } } },
      choices = {
        { text = "What came of that love?", next = "zaetar_children" },
        { text = "Something else.", next = "BACK" },
      },
    },
    zaetar_children = {
      lines = { { id = "zc_default", text = "The centaur came of it. They were born misshapen and full of rage, and when they saw how fair their father was they hated him for it, and they killed him. Every clan that tramples this land is his child and his murderer both.", fx = { learn = { "centaur" } } } },
      choices = {
        { text = "And the princess?", next = "zaetar_theradras" },
        { text = "Something else.", next = "BACK" },
      },
    },
    zaetar_theradras = {
      lines = { { id = "zt_default", text = "She keeps his body in the crystal caverns and will not let his spirit go, and her grief has soured into something that poisons every root it touches. I think she loved him, in the way that stone loves, which is to hold on forever." } },
      choices = {
        { text = "Then ending her is a mercy.", next = "BACK", reply = "I believe it is, for both of them. Thank you for seeing it so, because I did not know how to ask it of a stranger.", fx = { affinity = 1 } },
        { text = "The spirits of earth will mourn her.", next = "BACK", when = { class = "SHAMAN" }, reply = "They will, and they should. But ask them what she has done to the ground beneath Maraudon, and I think they will not stay your hand." },
        { text = "A grim story. Something else.", next = "BACK" },
      },
    },
    strand = {
      lines = { { id = "s_default", text = "It is the only place in Desolace where I can hear water, and I cannot bear to be far from it here. The trolls of the village let us be, for they know the centaur are no friends of theirs, and we ask nothing of them but the shore." } },
      choices = {
        { text = "The naga don't trouble you?", next = "strand_naga" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strand_naga = {
      lines = { { id = "sn_default", text = "They watch us from the shallows, and my sisters watch them back with their spears ready. The naga were Highborne once, before the Sundering, and I think they remember enough to be wary of the forest's daughters." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    brother = {
      lines = { { id = "b_default", text = "He is, among the Alliance, asking of them what I ask of you. Marandis is very grave about it, and he would not approve of how much I talk, but we want the same thing, and the Circle cares little whose banner the help comes under." } },
      choices = {
        { text = "The Horde will see it done first.", next = "BACK", when = { faction = "Horde" }, reply = "Then do, and I shall enjoy telling him so! Only be careful, for I would rather you came back than won." },
        { text = "Something else.", next = "BACK" },
      },
    },
    land = {
      lines = { { id = "l_default", text = "It was green once, or so the oldest of us say. Then the centaur were born into it, and they have warred across it ever since, and the demons came after and found it already half dead. A land can only be hated for so long before it stops growing." } },
      choices = {
        { text = "Could it ever be healed?", next = "BACK", when = { class = "DRUID" }, reply = "I have to believe so, and so must you, or why else would we serve the Circle? But not while Theradras sits at its root." },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead = {
      lines = { { id = "d_default", text = "Then it is over, and he is free, and I do not know whether to laugh or to weep. Tell me, did his spirit speak before the end, or was there only the dark and the stone?" } },
      choices = {
        { text = "He is at peace now. That much I saw.", next = "BACK", reply = "Then that is enough, and more than I dared to hope for. We will take him home to Stonetalon, where the trees still know his name.", fx = { affinity = 2 } },
        { text = "There was only the fighting.", next = "BACK", reply = "Of course there was, and it was foolish of me to ask. You went into that place for us, and I will not ask you for comfort as well." },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am a daughter of the forest, of Cenarius's line, and Stonetalon was my home until this errand called us south." } },
    maraudon = { { id = "tp_ma", text = "It is the great cavern where the centaur bury their dead, and where Theradras keeps Zaetar's body in the crystal dark." } },
    cenarion_circle = { { id = "tp_cc", text = "The Circle tends the wild places of the world, and it does not ask whether a helping hand belongs to Horde or Alliance." } },
    centaur = { { id = "tp_ce", text = "They are my kin, in a way I do not like to think on, and they have never forgiven the world for their own making." } },
    _none = { { id = "tp_none", text = "Oh, I do not know that! I know trees and rivers, and there are so few of either here." } },
  },
}
