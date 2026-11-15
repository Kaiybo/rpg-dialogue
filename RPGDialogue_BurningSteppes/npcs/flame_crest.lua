-- Flame Crest: a neutral cave camp on the Steppes' northern rim, goblin dealers, a dragon scholar, an exiled elf and a dwarf with a story. Voice: bibles/burningsteppes.md
local P = RPGDialogueAPI:Pack("rpgd.burningsteppes")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "ragged_john", id = TODO_NPC("Ragged John"), name = "Ragged John",
  bible = "bibles/burningsteppes.md", role = "questgiver", tier = "major",
  communities = { "flame_crest" }, temper = { "cowardly", "sharp" }, values = { "loyal", "lazy" },
  notices = { "drink", "race", "poison" },

  greetings = {
    { id = "g_default", text = "What'll ye be wantin', then? *hic* Pardon me." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Ye must like my stories, or my ale, and I'll take either one as a compliment." },
    { id = "g_found", when = { questDone = TODO_QUEST("Marshal Windsor") }, text = "Ye found him, didn't ye? I told 'em he weren't dead, and nobody listens to old John." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ha! Ye've been at the bottle too, I can tell by the way ye're holdin' that wall up. Dwarves don't get drunk, mind ye, we only get a wee bit sloppy." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, and a sober one by the look of ye, which is a shame we can fix. Pull up a rock, cousin." },
    { id = "n_poison", cat = "poison", when = { debuffType = "Poison" },
      text = "Ooh, ye're poisoned, are ye? Hold still, let me have a look at that, purely for science and nothin' to do with brewin'." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Ragged John, they call me, on account of my good looks. I've a cave, a cask and a story, and only the first two are for sale." },
        { id = "h_business", tags = { "news" }, when = { questActive = TODO_QUEST("The True Masters") },
          text = "Official business, is it? Maxwell sent ye to hear about Windsor, and I'll bet he called me a coward on yer way out, too. Sit down, then; it's a long one." },
        { id = "h_milk", when = { questActive = TODO_QUEST("Mother's Milk") },
          text = "Have ye let that great spider in the Spire bite ye yet? It's got to be flowin' through yer veins, mind, a gland in a jar won't do it at all." },
        { id = "h_milked", tags = { "news" }, when = { questRecent = { TODO_QUEST("Mother's Milk"), days = 5 } },
          text = "That poison of yers is bubblin' away in the cask as we speak, and it's going to be the best ale this side of Ironforge. What did ye think I wanted it for, murder?" },
        { id = "h_alive", tags = { "news" }, when = { questRecent = { TODO_QUEST("Jail Break!"), days = 7 } },
          text = "They say Windsor walked out of the Depths with his hammer back and a face like thunder. I'm havin' a drink for him, and another for ye, and a third because I'm thirsty." },
      },
      again = {
        { id = "h_again", text = "What else, eh? *hic* I've got nowhere to be, and that's the best thing about this cave." },
        { id = "h_again2", text = "Go on, ask away; old John's an open book, and most of the pages are stuck together." },
      },
      choices = {
        { text = "Tell me about the last time you saw Windsor.", next = "st1" },
        { text = "What are you brewing in there?", next = "ale" },
        { text = "What's a dwarf doing in a goblin camp?", next = "crest" },
        { text = "Maxwell calls you a coward.", next = "coward", when = { heardLine = "maxwell.wc_default" } },
        { text = "Pour me one, cousin.", next = "dwarf_drink", when = { race = "Dwarf" } },
        { text = "Why does an Alliance dwarf drink with the Horde's goblins?", next = "neutral", when = { faction = "Horde" } },
        { text = "I'll leave you to your cask.", next = "END" },
      },
    },

    st1 = {
      big = true,
      lines = { { id = "st1_default", text = "Windsor was in a foul temper that day, and believe me, for Windsor that's sayin' something. He kept mutterin' that something felt wrong, and he was righter than he knew." } },
      choices = {
        { text = "Go on.", next = "st2" },
        { text = "Where were you?", next = "st2" },
      },
    },
    st2 = {
      lines = { { id = "st2_default", fx = { learn = { "blackrock" } },
        text = "Smack in the middle of Blackrock Mountain, when the orcs came at us, the filthy beasts. Grunting, clanging, steel everywhere, fifty of 'em if there was one, and ye'd better be payin' attention, because there'll be questions after." } },
      choices = {
        { text = "So what did you do?", next = "st3" },
        { text = "Fifty? Really?", next = "st3", fx = { trait = { skeptical = 1 } } },
      },
    },
    st3 = {
      lines = { { id = "st3_default", text = "Me, against fifty orcs? I'm no fool, whatever the Marshal says. My old pappy always said that discretion is the better part of a biscuit, or some such, and I took his meanin', so I tucked myself into the shadows." } },
      choices = {
        { text = "You hid.", next = "st4", fx = { affinity = -1 } },
        { text = "That makes no sense, John. Keep going.", next = "st4", fx = { trait = { witty = 1 } } },
      },
    },
    st4 = {
      lines = {
        { id = "st4_default", fx = { learn = { "windsor" } },
          text = "And Windsor didn't care for that, but he had other worries, so he started swingin' Ironfoe and roarin' like a madman. That hammer was made for his great-great-grandpappy by Franclorn Forgewright himself, and it ate orcs like I eat sausage." },
      },
      choices = {
        { text = "Who's Franclorn Forgewright?", next = "forgewright" },
        { text = "And then?", next = "st5" },
      },
    },
    forgewright = {
      lines = { { id = "fw_default", fx = { learn = { "stonewrought_dam" } },
        text = "Only the finest Dark Iron builder that ever lived, the one who came up with all that stonewrought archimectonical building business. Windsor said there was a twin to Ironfoe, too, Ironfel, that Franclorn kept for his own self." } },
      choices = {
        { text = "A Dark Iron made Windsor's hammer?", next = "forgewright_friend" },
        { text = "Back to the story.", next = "st5" },
      },
    },
    forgewright_friend = {
      lines = { { id = "ff_default", text = "Aye, and his pappy's pappy's pappy was best friends with the fellow, which comes into the story directly, so hush. Not every Dark Iron was born bad, no more than every one of us was born handsome." } },
      choices = { { text = "Go on, then.", next = "st5" } },
    },
    st5 = {
      lines = { { id = "st5_default", text = "Hours, it went on, maybe days, I lost count, and then it stopped, and there he stood, covered in orc from boots to beard and still breathin'. Angry, mind, very angry, but breathin'." } },
      choices = {
        { text = "So how did he die?", next = "st6" },
        { text = "Are you drunk, John?", next = "st_drunk" },
      },
    },
    st_drunk = {
      lines = { { id = "sd_default", text = "Dwarves don't get drunk, I've told ye, we get a wee bit sloppy, which is a different thing altogether and a lot more dignified. Now where was I?" } },
      choices = { { text = "Windsor. Standing. Covered in orc.", next = "st6" } },
    },
    st6 = {
      lines = { { id = "st6_default", text = "Die? Who said he died? I never said he died, did I, so stop puttin' words in my mouth; there's barely room in there for the ale. He went missin', that's all." } },
      choices = {
        { text = "Then where is he?", next = "st_end" },
        { text = "John. Please. Where is he?", next = "st_end", fx = { trait = { kind = 1 } } },
      },
    },
    st_end = {
      big = true,
      lines = {
        { id = "st_end", key = true, fx = { hear = "windsor_alive", learn = { "blackrock_depths", "dark_iron" } },
          text = "The Dark Irons turned up, three hundred of 'em, craftier than the orcs and better prepared, and they didn't kill him, on account of the old friendship between his family and Franclorn's. Their emperor, Thaurissan, took Ironfoe for himself and dragged Windsor off into the Depths, and that's the last I saw of him. *hic* Pardon." },
      },
      choices = {
        { text = "Thank you, John. That was... informative.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } },
          journal = { first = "Ragged John finally told me what became of Marshal Windsor: taken alive by the Dark Irons, into Blackrock Depths.",
                      third = "{name} sat through Ragged John's whole tale: Windsor was taken alive into Blackrock Depths." } },
        { text = "Why didn't you go after him?", next = "coward" },
      },
    },

    coward = {
      big = true,
      lines = { { id = "cw_default", text = "Because one dwarf with a hangover against three hundred Dark Irons is a funeral, not a rescue, and somebody had to live to tell the Marshal. Maxwell can call me what he likes; I'm the reason he knows anything at all." } },
      choices = {
        { text = "That's fair.", next = "BACK", fx = { affinity = 2, opinion = { ragged_john = "sensible" } } },
        { text = "You could have tried.", next = "coward_push", fx = { affinity = -1, opinion = { ragged_john = "coward" } } },
      },
    },
    coward_push = {
      lines = { { id = "cp_default", text = "Aye, I could have, and I think about it every night at the bottom of the cask. Don't tell Maxwell I said that." } },
      choices = {
        { text = "I won't.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ale = {
      lines = { { id = "a_default", text = "A little of everything, my friend, which is the secret of all great brewing. What it really wants, though, is a dash of the deadliest poison in the Spire, the stuff the orcs call Mother's Milk." } },
      choices = {
        { text = "You want to put poison in ale?", next = "ale_milk" },
        { text = "That sounds dreadful.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    ale_milk = {
      lines = { { id = "am_default", fx = { learn = { "blackrock_spire" } },
        text = "Not poison, ye daft thing, a live sample, flowin' warm through somebody's veins, and then I milk it out of ye. Mother Smolderweb's the spider, deep in Blackrock Spire, and she's very generous with a bite." } },
      choices = {
        { text = "And you'd 'milk' me how, exactly?", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "I'll think about it.", next = "BACK" },
      },
    },

    crest = {
      lines = { { id = "c_default", text = "The goblins don't ask where ye're from or which banner ye drink under, and the Marshal's camp asks far too many questions. Besides, the view's lovely, if ye like lava." } },
      choices = {
        { text = "Who are your neighbours?", next = "crest_neighbours" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crest_neighbours = {
      lines = { { id = "cn_default", text = "Kibler and his foul-mouthed bird, Tinkee and her contraptions, a pair of goblins countin' coin, and that elf who looks at ye like ye're a snack. Mind yer purse with all of them, and mind yer soul with the elf." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    dwarf_drink = {
      lines = { { id = "dd_default", text = "Now there's a proper request! Here, it's mostly ale and a bit of something else; don't ask what, and don't drink it near an open flame." } },
      choices = {
        { text = "To Windsor.", next = "BACK", fx = { affinity = 3 } },
        { text = "To the Bronzebeards.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    neutral = {
      lines = { { id = "ne_default", text = "Because nobody else'll drink with me, and the goblins only care if ye pay. I'm nobody's soldier now, orc; sit down and have one, and we'll both forget whose side we're on." } },
      choices = {
        { text = "One drink.", next = "BACK", fx = { affinity = 2 } },
        { text = "I remember whose side I'm on.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I rode with Windsor, once, and now I ride a cask. It's a quieter horse.", next = "st1" } },
    advice = { { id = "tp_ad", text = "When fifty orcs come over a hill, find a shadow; when three hundred Dark Irons come after, find a deeper one." } },
    windsor = { { id = "tp_windsor", text = "Not dead, whatever they tell ye in Morgan's Vigil. Ask me properly and I'll tell ye the whole of it.", next = "st1" } },
    blackrock_spire = { { id = "tp_spire", text = "Full of orcs, worgs, spiders and dragons, and I've been in and out more times than I can count. Mostly out." } },
    _none = { { id = "tp_none", text = "Never heard of it, and I've heard of most things, usually at the bottom of a mug." } },
  },
}

P:NPC {
  key = "maxwort", id = TODO_NPC("Maxwort Uberglint"), name = "Maxwort Uberglint",
  bible = "bibles/burningsteppes.md", role = "questgiver", tier = "quest",
  communities = { "flame_crest" }, temper = { "shrewd" }, values = { "greedy", "curious" },
  notices = { "purse", "class" },

  greetings = {
    { id = "g_default", text = "Welcome, welcome. Are you here to make me rich? Please say yes." },
    { id = "g_back", when = { metBefore = true }, text = "My favourite scribe returns! Do you have anything shiny, or only your charming face?" },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 1000000 } },
      text = "Oh, you've a heavy purse, I can hear it from here. We should be partners, you and I, and I mean that in the most expensive way." },
    { id = "n_scholar", cat = "class", when = { class = { "MAGE", "PRIEST" } },
      text = "You've the look of someone who reads things, and reading things is how goblins get rich, eventually. Do you read dwarven?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Maxwort Uberglint, treasure hunter. I came to the Steppes chasing the legends of the Seven, because where you find old knowledge you find power, and where you find power, my friend, you find wealth." },
        { id = "h_tablet", when = { questActive = TODO_QUEST("Tablet of the Seven") },
          text = "The tablet's in the ruins of Thaurissan, under the statue of a dwarf, if the stories are right. Copy every mark on it, every last scratch, and bring it to me." },
        { id = "h_tablet_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Tablet of the Seven"), days = 5 } },
          text = "Your transcription is beautiful, by the way, better than any scribe I could hire. I'm still reading it, and every line makes me poorer in patience and richer in hope." },
        { id = "h_heart", when = { questActive = TODO_QUEST("The Heart of the Mountain") },
          text = "The Dark Irons keep the Heart in the vault deep in their city, behind a guard who won't show himself until every coffer's open. I tried to buy it, honestly I did, but they wouldn't sell." },
        { id = "h_heart_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Heart of the Mountain"), days = 7 } },
          text = "I take it out every night and just look at it, the size of your fist and twice as beautiful as I imagined. Don't tell anyone where I keep it, and don't ask." },
      },
      again = {
        { id = "h_again", text = "What else? Time is money, and I'm generously giving you mine for free." },
        { id = "h_again2", text = "Ask away. Every question is an investment, I always say." },
      },
      choices = {
        { text = "Who were the Seven?", next = "seven" },
        { text = "What's the Heart of the Mountain?", next = "heart" },
        { text = "Why live in a cave beside a volcano?", next = "cave" },
        { text = "I can read old scripts, if you need a scribe.", next = "scholar", when = { class = { "MAGE", "PRIEST" } } },
        { text = "The Royal Historian told me about Thaurissan.", next = "archesonus", when = { heardLine = "archesonus.t_default" } },
        { text = "Good hunting, Maxwort.", next = "END" },
      },
    },

    seven = {
      lines = { { id = "s_default", fx = { learn = { "thaurissan" } },
        text = "Dwarves of great knowledge and greater power, from the old days before the city burned, and that's about all anyone agrees on. The ruins of Thaurissan are said to keep their tablet, which is where you come in." } },
      choices = {
        { text = "What did the Seven do?", next = "seven_did" },
        { text = "Knowledge for knowledge's sake?", next = "seven_wealth" },
      },
    },
    seven_did = {
      lines = { { id = "sd_default", text = "Something big enough that the stones still whisper about it two hundred years later, and I mean to find out exactly what. If it melted mountains once, imagine what it'd fetch at auction." } },
      choices = {
        { text = "That's a terrible idea.", next = "BACK", fx = { affinity = -1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    seven_wealth = {
      lines = { { id = "sw_default", text = "There's no such thing, my friend, there's only knowledge nobody's found a buyer for yet. The quest for wealth is the only proper goal for a goblin, and I'm a very proper goblin." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { greedy = 1 } } } },
    },

    heart = {
      lines = { { id = "he_default", fx = { learn = { "blackrock_depths" } },
        text = "A gem the size of your fist, locked in the Dark Iron vault under Blackrock Depths, and I've wanted it for years. To me its value is beyond any price, which is a strange thing for a goblin to say, so you know I mean it." } },
      choices = {
        { text = "Why that gem?", next = "heart_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    heart_why = {
      lines = { { id = "hw_default", text = "Some things you want because they'll make you rich, and some because they're beautiful and nobody else can have them. That one's both, and I've been chasing it longer than I've been chasing anything." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    cave = {
      lines = { { id = "c_default", text = "Cheap rent, no tax collectors, and nobody bothers you here except adventurers, who are the best customers in the world. And if the mountain goes up one day, well, I'll have had a front seat." } },
      choices = {
        { text = "You'd die.", next = "cave_death" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cave_death = {
      lines = { { id = "cd_default", text = "Wealth, my friend, and maybe one big, loud death at the very end: that's the goblin dream. Quietly in bed is for gnomes and accountants." } },
      choices = {
        { text = "To a big, loud death, then.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "I'll take quietly in bed.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },

    scholar = {
      lines = { { id = "sc_default", text = "Then you're worth twice what I'd pay a sword! Go to the ruins, copy that tablet, and if your transcription's good I'll pay you like a scribe and thank you like a partner." } },
      choices = { { text = "Partner, you said?", next = "BACK", fx = { affinity = 1, trait = { greedy = 1 } } } },
    },
    archesonus = {
      lines = { { id = "ar_default", text = "The blind historian in Ironforge? She knows more about that city than anyone alive, and she'll never sell a word of it, which I find personally offensive. Did she mention the Seven at all?" } },
      choices = {
        { text = "She said the accounts all stop at the blast.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'm not telling you.", next = "BACK", fx = { affinity = -1, trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Booty Bay born, by way of every ruin that ever had a rumour attached to it. The Seven are just the latest rumour.", next = "seven" } },
    advice = { { id = "tp_ad", text = "Never pay for anything you can find, and never find anything you can't sell." } },
    thaurissan = { { id = "tp_thaurissan", text = "A dwarven city that went up in one great flash, leaving nothing but ash and treasure for patient goblins.", next = "seven" } },
    _none = { { id = "tp_none", text = "Is there money in it? If not, I'm afraid I've never looked." } },
  },
}

P:NPC {
  key = "tinkee", id = TODO_NPC("Tinkee Steamboil"), name = "Tinkee Steamboil",
  bible = "bibles/burningsteppes.md", role = "scholar", tier = "quest",
  communities = { "flame_crest" }, temper = { "earnest", "nervous" }, values = { "curious", "proud" },
  notices = { "craft", "race" },

  greetings = {
    { id = "g_default", text = "Hello, hello! Don't touch anything on that bench; some of it is very nearly stable." },
    { id = "g_back", when = { metBefore = true }, text = "It's you! I have a new device, and it needs testing, and you're so good at testing things." },
  },

  notice = {
    { id = "n_engineer", cat = "craft", when = { profession = "Engineering" },
      text = "Oh, an engineer! You'll appreciate the Draco-Incarcinatrix 900; nobody else here appreciates it at all, they just ask whether it explodes." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! Please, please don't look at my wiring, because I know you'll want to fix it, and it's fine, it's perfectly fine." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Tinkee Steamboil, scholar of dragonkin! The Burning Steppes are dangerous, but a real scholar will do almost anything to learn something new, and I've learned so much here already." },
        { id = "h_essence", when = { questActive = TODO_QUEST("Broodling Essence") },
          text = "Zap a broodling with the device, defeat it while it's still glowing, and the essence should come right out. Should, I said; that's what the testing is for." },
        { id = "h_felnok", when = { questActive = TODO_QUEST("Felnok Steelspring") },
          text = "Felnok's in Everlook, up in Winterspring, where it's lovely and cold and nothing is on fire. Give him my letter and he'll know exactly which parts to make." },
        { id = "h_parts", tags = { "news" }, when = { questRecent = { TODO_QUEST("Return to Tinkee"), days = 5 } },
          text = "Felnok's parts are perfect, and he says I owe him, which is true, and which I'll never admit to his face. The eggscilloscope is nearly ready!" },
        { id = "h_freeze", when = { questActive = TODO_QUEST("Egg Freezing") },
          text = "The dragons hatch their eggs in a rookery high up in Blackrock Spire. Freeze one, just one, and come back and tell me it worked." },
        { id = "h_collect", when = { questActive = TODO_QUEST("Egg Collection") },
          text = "Freeze them first, then collect them, never the other way round! My patron's heard you're getting them for me, and he's very eager, very eager indeed." },
        { id = "h_leonid", tags = { "news" }, when = { questActive = TODO_QUEST("Leonid Barthalomew") },
          text = "Why would my master want the eggs sent to you, and not to me? Never mind, just take them to this Leonid and tell him I did everything I was told." },
      },
      again = {
        { id = "h_again", text = "What else? I'm all ears, and only slightly singed ones." },
        { id = "h_again2", text = "Go on! Questions are my favourite thing after dragons and gadgets." },
      },
      choices = {
        { text = "What are you studying?", next = "study" },
        { text = "What's a Draco-Incarcinatrix 900?", next = "gadgets" },
        { text = "Who's your patron?", next = "patron" },
        { text = "Who's Felnok Steelspring?", next = "felnok" },
        { text = "Can I see your schematics?", next = "engineer", when = { profession = "Engineering" } },
        { text = "Leonid told me who your patron really serves.", next = "leonid", when = { questDone = TODO_QUEST("Leonid Barthalomew") } },
        { text = "Good luck with the dragons.", next = "END" },
      },
    },

    study = {
      lines = { { id = "s_default", fx = { learn = { "black_dragonflight" } },
        text = "The black dragonkin of the Steppes: the whelps, the broodlings, the drakes, and how they grow. If I could learn to capture a living whelp, or an egg, I'd be the envy of every dragon scholar in the world." } },
      choices = {
        { text = "Isn't that dangerous?", next = "study_danger" },
        { text = "Why eggs?", next = "study_eggs" },
      },
    },
    study_danger = {
      lines = { { id = "sd_default", text = "Extremely, which is why I send adventurers! I'm a scholar, not a lunatic, though the others in this cave would argue about that." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    study_eggs = {
      lines = { { id = "se_default", text = "A frozen egg stays an egg, and an egg can be studied, and carried, and kept. Frozen eggs are harmless, you see; it's the warm ones you need to worry about." } },
      choices = {
        { text = "And what does your patron want with them?", next = "patron" },
        { text = "Something else.", next = "BACK" },
      },
    },

    gadgets = {
      lines = { { id = "g2_default", text = "It catches the essence of a dragon broodling at the moment of its defeat! After that came the eggscilloscope, which freezes eggs, and then the collectronic module, which collects them, and I named every one of them myself." } },
      choices = {
        { text = "The names are... something.", next = "gadgets_names" },
        { text = "Does any of it explode?", next = "gadgets_boom" },
      },
    },
    gadgets_names = {
      lines = { { id = "gn_default", text = "They're wonderful names, and you know it. Felnok wanted to call the eggscilloscope 'the cold thing', which tells you everything about Felnok." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    gadgets_boom = {
      lines = { { id = "gb_default", text = "Not yet! Well, not much, and never while anyone important was standing near it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    patron = {
      big = true,
      lines = { { id = "p_default", text = "Oh, he's... a very important man, a scholar much grander than me, and he pays very well for my research. He's not the sort of person you want to disappoint, so I try very hard never to." } },
      choices = {
        { text = "You sound frightened of him.", next = "patron_fear" },
        { text = "What's his name?", next = "patron_name" },
      },
    },
    patron_fear = {
      lines = { { id = "pf_default", text = "Frightened? No, no, respectful, very respectful, which is a different thing entirely. Could we talk about broodlings instead, please?" } },
      choices = {
        { text = "Of course.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Tinkee, who is he?", next = "patron_name" },
      },
    },
    patron_name = {
      lines = { { id = "pn_default", text = "I call him my master, and he likes it that way. Nobody knows him unless he wants them to, so please don't go asking around about him." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    felnok = {
      lines = { { id = "f_default", text = "My colleague in Everlook, and the best engineer north of anywhere, which he'll tell you himself if you stand still long enough. He makes the parts I'm too busy to make." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    engineer = {
      lines = { { id = "e_default", text = "You may look, but not touch, and not laugh at my soldering. The trick with the cold coil is that it has to be colder than the egg is hot, which sounds obvious but took me eleven tries." } },
      choices = { { text = "That's clever work.", next = "BACK", fx = { affinity = 2 } } },
    },
    leonid = {
      big = true,
      lines = { { id = "l_default", text = "He did? I... I'd rather you didn't tell me, if it's anything dreadful, and I can see by your face that it is. I only wanted to study dragons, honestly I did." } },
      choices = {
        { text = "The eggs are safe now. You did well.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Next time, ask who's paying.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A goblin who'd rather study than sell, which most goblins find very strange indeed. The Steppes have the best dragonkin anywhere, so here I am.", next = "study" } },
    advice = { { id = "tp_ad", text = "Freeze it first, then pick it up. That rule has saved my life more than once." } },
    black_dragonflight = { { id = "tp_dragons", text = "Fascinating creatures, terribly clever and terribly rude, and they grow so fast you can almost watch it happen.", next = "study" } },
    _none = { { id = "tp_none", text = "Is it a dragon? If it isn't, then I'm afraid I haven't studied it at all." } },
  },
}

P:NPC {
  key = "yuka", id = TODO_NPC("Yuka Screwspigot"), name = "Yuka Screwspigot",
  bible = "bibles/burningsteppes.md", role = "vendor", tier = "quest",
  communities = { "flame_crest" }, temper = { "shrewd" }, values = { "greedy", "practical" },
  notices = { "craft", "purse" },

  greetings = {
    { id = "g_default", text = "Supplies in hot demand at rock-bottom prices! Well, rock-bottom for a volcano." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? Of course you are, everybody runs out of blasting powder up here." },
  },

  notice = {
    { id = "n_engineer", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! You'll want tubes, flux and powder, and you'll want them now, before your next explosion, so step right up." },
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "My, what a lovely full purse you've got there. It'd look even lovelier half empty and my till half full." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Yuka Screwspigot, engineering supplies, best prices this side of the mountain, mostly because I'm the only supplier this side of the mountain. What can I sell you?" },
        { id = "h_sought", tags = { "news" }, when = { questActive = TODO_QUEST("Yuka Screwspigot") },
          text = "Yorba sent you? Good old Yorba; she always did know who'd be useful. Yes, I'm looking for our brother, bless his worthless little heart." },
        { id = "h_ribbly", when = { questActive = TODO_QUEST("Ribbly Screwspigot") },
          text = "Ribbly's hiding somewhere deep in Blackrock Depths with the Dark Irons. Bring him back to me, or if he won't come along quietly, his head will do nicely." },
        { id = "h_ribbly_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Ribbly Screwspigot"), days = 7 } },
          text = "The Baron's paid, the family's happy, and little Ribbly's never looked so peaceful. You've done the Screwspigots a great service." },
      },
      again = {
        { id = "h_again", text = "Anything else? Browsing's free, but only for so long." },
        { id = "h_again2", text = "What else can I do for you? I'm very reasonable, for a price." },
      },
      choices = {
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Why sell supplies in a volcano?", next = "shop" },
        { text = "Tell me about Ribbly.", next = "ribbly" },
        { text = "Your sister Yorba says hello.", next = "yorba", when = { questDone = TODO_QUEST("Yuka Screwspigot") } },
        { text = "Got anything an engineer can't find elsewhere?", next = "engineer", when = { profession = "Engineering" } },
        { text = "Goodbye, Yuka.", next = "END" },
      },
    },

    shop = {
      lines = { { id = "s_default", text = "Because everyone who comes through here is about to walk into Blackrock Mountain, and everyone who walks into Blackrock Mountain runs out of something. Location, location, lava." } },
      choices = {
        { text = "Your prices are steep.", next = "shop_prices" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shop_prices = {
      lines = { { id = "sp_default", text = "Steep? Have you seen how I get my stock up here? Every crate comes past the Blackrock, the ogres and the dragons, and every one of them wants a cut." } },
      choices = {
        { text = "Fair enough.", next = "BACK", fx = { affinity = 1 } },
        { text = "Still steep.", next = "BACK", fx = { affinity = -1, trait = { greedy = 1 } } },
      },
    },

    ribbly = {
      lines = { { id = "r_default", text = "My little brother, and a drain on the family since the day he could walk. He took our money and wasted it on one scheme after another, and his last scheme must have been the worst of the lot." } },
      choices = {
        { text = "What did he do?", next = "ribbly_bounty" },
        { text = "That's harsh, about your own brother.", next = "ribbly_family" },
      },
    },
    ribbly_bounty = {
      lines = { { id = "rb_default", fx = { learn = { "blackrock_depths" } },
        text = "Whatever it was, Baron Revilgaz of Booty Bay put a price on his head, and for the first time in his life Ribbly's finally worth something. Now he's hiding with the Dark Irons, of all people, in Blackrock Depths." } },
      choices = {
        { text = "And you'll collect the bounty?", next = "ribbly_family" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ribbly_family = {
      big = true,
      lines = { { id = "rf_default", text = "Harsh? Family's a business, friend, and Ribbly's been running at a loss for years. Yorba and I are simply closing the account, and I'll even shed a tear about it, once the gold's counted." } },
      choices = {
        { text = "That's cold, Yuka.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Business is business.", next = "BACK", fx = { affinity = 2, align = { honor = -1 } } },
      },
    },
    yorba = {
      lines = { { id = "y_default", text = "Hello right back, and tell her I want my share of the bounty in gold, not in IOUs, because I know her. Steamwheedle Port's treating her well, I hope?" } },
      choices = { { text = "She seemed well.", next = "BACK", fx = { affinity = 1 } } },
    },
    engineer = {
      lines = { { id = "e_default", text = "Flux, tubes, powder, the odd schematic that fell off the back of a caravan, nothing too exotic. Have a look, and don't ask where the schematic came from." } },
      choices = {
        { text = "Show me.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A Screwspigot, which means I sell things and my family owes people money. One of those is improving.", next = "ribbly" } },
    advice = { { id = "tp_ad", text = "Buy your powder before you need it, because the moment you need it, I double the price." } },
    blackrock_depths = { { id = "tp_depths", text = "Where my brother's hiding, and where most of my customers go to spend what they buy from me." } },
    _none = { { id = "tp_none", text = "I don't sell that, so I don't know about it. Want some flux?" } },
  },
}

P:NPC {
  key = "kibler", id = TODO_NPC("Kibler"), name = "Kibler",
  bible = "bibles/burningsteppes.md", role = "questgiver", tier = "quest",
  communities = { "flame_crest" }, temper = { "cheerful", "shrewd" }, values = { "greedy", "kind" },
  notices = { "pet", "purse" },

  greetings = {
    { id = "g_default", text = "Welcome to Kibler's Exotic Pets! How can you help me today?" },
    { id = "g_back", when = { metBefore = true }, text = "My favourite supplier's back! Opus, say hello, and say it nicely." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "beast" } },
      text = "Oh, look at that beauty at your heel! Good coat, clear eyes, nice manners; somebody's been taking proper care of that one." },
    { id = "n_rich", cat = "purse", when = { money = { min = 1000000 } },
      text = "Now there's a customer who could afford one of my finest. Ever thought about a pet worg? Very loyal, very fierce, very, very expensive." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Kibler, at your service, animal lover by nature and salesman by trade. I find exotic beasts for the rich and famous and teach them to behave like proper pets, more or less." },
        { id = "h_pups", when = { questActive = TODO_QUEST("Kibler's Exotic Pets") },
          text = "Worg pups, from the Spire, in that cage, and get 'em young or they're untrainable! Bring me one and I'll gentle a worg just for you." },
        { id = "h_eggs", when = { questActive = TODO_QUEST("En-Ay-Es-Tee-Why") },
          text = "Spire spider eggs, fifteen of 'em, from wherever the spiders are nastiest. Believe it or not, there are folk who'll pay for the vilest beast you can imagine, as long as it's housebroken." },
        { id = "h_pup_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Kibler's Exotic Pets"), days = 7 } },
          text = "How's the little fella settling in? Feed him twice a day and don't let him near your boots; worgs love boots." },
      },
      again = {
        { id = "h_again", text = "What else, friend? Opus is listening, so mind your language; he'll repeat it to customers." },
        { id = "h_again2", text = "Go on, ask me anything. Except about G.E.T.A.; we don't talk about them." },
      },
      choices = {
        { text = "Exotic pets? In a volcano?", next = "pets" },
        { text = "Tell me about the parrot.", next = "opus" },
        { text = "Who's Bijou?", next = "bijou" },
        { text = "What would you give for my companion?", next = "hunter", when = { class = "HUNTER" } },
        { text = "A druid could teach you a thing about beasts.", next = "druid", when = { class = "DRUID" } },
        { text = "Goodbye, Kibler.", next = "END" },
      },
    },

    pets = {
      lines = { { id = "p_default", fx = { learn = { "blackrock_spire" } },
        text = "Where else? Blackrock Spire's full of worgs, spiders and things nobody's even named yet, and every one of them is a pet waiting to happen. Look at the cages; ain't it obvious?" } },
      choices = {
        { text = "Who buys a pet worg?", next = "pets_clients" },
        { text = "That's cruel to the beasts.", next = "pets_cruel" },
      },
    },
    pets_clients = {
      lines = { { id = "pc_default", text = "Nobles, merchant princes, the odd baron with a big house and a small reason to feel important. A worg at the gate says more than a dozen guards, and it doesn't ask for wages." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    pets_cruel = {
      lines = { { id = "pcr_default", text = "Cruel? I feed 'em better than the orcs do, and I never send 'em out to die for a warchief, so I'd say I'm the kindest thing that ever happened to a worg pup." } },
      choices = {
        { text = "I suppose that's true.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'm not convinced.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },

    opus = {
      lines = { { id = "o_default", text = "That's Opus, the most expensive mistake I ever made, because nobody will buy him. He smokes, he swears, and he tells every customer I'm being investigated by G.E.T.A., which I am not, probably." } },
      choices = {
        { text = "What's G.E.T.A.?", next = "opus_geta" },
        { text = "He seems lovely.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    opus_geta = {
      lines = { { id = "og_default", text = "Nobody knows, friend, and that's what worries me. Opus heard it somewhere and won't stop saying it, and I'd swear he gets louder whenever a customer walks in." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    bijou = {
      lines = { { id = "b_default", text = "A goblin I hired to fetch spider eggs from the Spire, and a very capable one, for an operative. I haven't heard from her in weeks, and Opus won't stop saying she's lost." } },
      choices = {
        { text = "Are you worried about her?", next = "bijou_worry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bijou_worry = {
      lines = {
        { id = "bw_default", text = "Worried about her and about my eggs, in that order, mostly. If you're going into the Spire anyway, keep an eye out for a goblin with a lot of notes and not much patience." },
        { id = "bw_found", when = { questDone = TODO_QUEST("Bijou's Belongings") },
          text = "You found her, alive and scribbling? Ha! I knew it, and she still owes me fifteen eggs, so tell her that next time you see her." },
      },
      choices = { { text = "I'll look for her.", next = "BACK", fx = { affinity = 2 } } },
    },
    hunter = {
      lines = { { id = "h2_default", text = "Not a copper, friend, because you'd never sell, and I respect that more than I'd ever respect a sale. A beast that's chosen you is worth more than anything in my cages." } },
      choices = { { text = "That's surprisingly kind.", next = "BACK", fx = { affinity = 2 } } },
    },
    druid = {
      lines = { { id = "dr_default", text = "I'm sure you could, but could you teach a spider to sit? No? Then we're both still learning, and I'll stick to cages." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Booty Bay's finest dealer in beasts, now operating from a cave for reasons that have nothing to do with G.E.T.A.", next = "pets" } },
    advice = { { id = "tp_ad", text = "Get 'em young, feed 'em well, and never let 'em see you scared. Works on worgs, works on customers." } },
    blackrock_spire = { { id = "tp_spire", text = "The best hunting ground in the world, if you don't mind most of the stock trying to eat you." } },
    _none = { { id = "tp_none", text = "Can I sell it? If I can't, then I wouldn't know the first thing about it, friend." } },
  },
}

P:NPC {
  key = "mathredis", id = TODO_NPC("Mathredis Firestar"), name = "Mathredis Firestar",
  bible = "bibles/burningsteppes.md", role = "scholar", tier = "quest",
  communities = { "flame_crest" }, temper = { "sharp", "proud" }, values = { "proud", "greedy" },
  notices = { "class", "race" },

  greetings = {
    { id = "g_default", text = "You are standing in my light, {race}; speak, or move aside and let me work." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Have you found a libram, or only more of my time to waste?" },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. I can taste the arcane on you from here, thin and watery as it is; human teachers, no doubt." },
    { id = "n_kaldorei", cat = "race", when = { race = "NightElf" },
      text = "A night elf, who would rather we had all forgotten magic. Your people cast mine out once, and look where it brought us both." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Mathredis Firestar, of Quel'Thalas, while there was a Quel'Thalas. I seek the lost librams of the elven masters, and if you bring me one, I will make you something of power, at a price you will find high." },
        { id = "h_libram", when = { questActive = TODO_QUEST("Libram of Rumination") },
          text = "You have the libram and the components, I see. Lay them down and let me drink what's written in them, and then you'll have your trinket." },
      },
      again = {
        { id = "h_again", text = "Is there more? Be quick; I don't care for idle company." },
        { id = "h_again2", text = "Ask, then. I'll answer what I choose to." },
      },
      choices = {
        { text = "What are these librams?", next = "librams" },
        { text = "What do you gain from them?", next = "hunger" },
        { text = "What happened to Quel'Thalas?", next = "quelthalas" },
        { text = "Teach me what your master knew.", next = "mage", when = { class = "MAGE" } },
        { text = "The Light could ease that hunger.", next = "priest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Your people brought this on themselves.", next = "kaldorei", when = { race = "NightElf" } },
        { text = "I'll leave you.", next = "END" },
      },
    },

    librams = {
      lines = { { id = "l_default", text = "Ten books, written by my master, Telmius Dreamseeker, and scattered across the world when the Scourge was loosed on Quel'Thalas. Each holds a pattern for a lesser arcanum, and I can work them, given the libram and the materials." } },
      choices = {
        { text = "Where is your master now?", next = "librams_telmius" },
        { text = "Only lesser ones?", next = "librams_lesser" },
      },
    },
    librams_telmius = {
      big = true,
      lines = { { id = "lt_default", text = "Dead. He went into the ruins the night elves call Dire Maul, seeking what the old Highborne there still knew, and he was murdered there for asking. I will not speak of it twice." } },
      choices = {
        { text = "I'm sorry.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Then I won't ask again.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    librams_lesser = {
      lines = { { id = "ll_default", text = "His three greatest works are beyond me, and that knowledge is a knife I turn over every day. I make what I can, and I make you pay for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    hunger = {
      big = true,
      lines = { { id = "h2_default", text = "When an arcanum is made, power spills from it, and I take that spill for myself, because I need it. We of Quel'Thalas were raised in magic, and now that the fount is gone, the hunger never leaves." } },
      choices = {
        { text = "That sounds like an addiction.", next = "hunger_word" },
        { text = "Then I'll bring you librams.", next = "BACK", fx = { affinity = 2, trait = { greedy = 1 } } },
      },
    },
    hunger_word = {
      lines = { { id = "hw_default", text = "Call it what you like, {race}, from your full belly. You have never been hungry the way I am hungry, and I hope for your sake you never are." } },
      choices = {
        { text = "I meant no offence.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    quelthalas = {
      lines = { { id = "q_default", text = "The Scourge came through it like a fire through dry grass, and what it didn't kill, it scattered. I will not describe it to someone who'll only nod and say how sad." } },
      choices = {
        { text = "Then I won't say it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage = {
      lines = { { id = "m_default", text = "Your teachers gave you fire and frost and called it wisdom, while my master spent a long elven life on patterns you could not begin to follow. Bring me a libram, mage, and watch me work, and perhaps you'll learn the difference." } },
      choices = {
        { text = "I'd like that.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest = {
      lines = { { id = "pr_default", text = "Your Light warms, and I am not cold, I am starving. Keep your prayers for the dying; I am only diminished, and that is worse." } },
      choices = {
        { text = "The offer stands.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "As you wish.", next = "BACK" },
      },
    },
    kaldorei = {
      lines = { { id = "k_default", text = "Perhaps we did. And perhaps you'll find, on a cold night far from your moon, that every people pays for its gifts sooner or later." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A mage of Quel'Thalas and the last student of Telmius Dreamseeker. The rest is not yours to know.", next = "librams" } },
    advice = { { id = "tp_ad", text = "Never sell power cheaply, and never buy it from someone who does." } },
    _none = { { id = "tp_none", text = "That is beneath my notice, and it should be beneath yours." } },
  },
}

P:NPC {
  key = "vahgruk", id = TODO_NPC("Vahgruk"), name = "Vahgruk",
  bible = "bibles/burningsteppes.md", role = "flightmaster", tier = "service",
  communities = { "flame_crest" }, temper = { "steady" }, values = { "loyal", "dutiful" },
  notices = { "race" },

  greetings = {
    { id = "g_default", text = "Lok'tar. You need a rider, or you're lost?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The riders are rested, and so am I, almost." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Good to see a brother this far from Durotar, among all these goblins. Keep your axe close; the Blackrock down there call themselves orcs too." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Vahgruk. I keep the Horde's wind riders at Flame Crest, so that anyone the Warchief sends this far north has a way home again." },
      },
      again = { { id = "h_again", text = "Anything else, or do you want a rider?" } },
      choices = {
        { text = "Where do your riders fly?", next = "routes" },
        { text = "What do you make of the Blackrock?", next = "rend" },
        { text = "Show me the routes.", next = "BUSINESS" },
        { text = "Not today.", next = "END" },
      },
    },
    routes = {
      lines = { { id = "r_default", text = "Kargath in the Badlands, Stonard in the swamp, and over the mountain to Thorium Point. None of them goes near the Spire, because the drakes hate wind riders more than they hate anything." } },
      choices = {
        { text = "Kargath?", next = "routes_kargath" },
        { text = "Show me the routes.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    routes_kargath = {
      lines = { { id = "rk_default", text = "The Warchief's expedition against the Blackrock waits there. If you're sent to fight them, that's where the orders come from." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rend = {
      lines = {
        { id = "re_default", text = "Rend Blackhand sits in that Spire and calls himself Warchief, as if a name were a thing you could steal. Thrall is Warchief, and Rend is a traitor with a big chair." },
        { id = "re_alliance", when = { faction = "Alliance" },
          text = "They're no friends of the Horde, if that's what you're asking. Rend Blackhand would see Thrall dead, and you too, so we have that much in common." },
      },
      choices = {
        { text = "Then he'll fall.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } }, when = { faction = "Horde" } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I serve the Warchief where he sends me, and he sent me to a rock full of goblins. That's enough of a story for anyone." } },
    advice = { { id = "tp_ad", text = "Fly high over the lava; the heat lifts you, and the riders like it." } },
    blackrock = { { id = "tp_blackrock", text = "Orcs who never learned what Thrall taught the rest of us. That makes them more dangerous than humans, not less." } },
    _none = { { id = "tp_none", text = "I keep wind riders. Ask the goblins; they know everything for a price." } },
  },
}
