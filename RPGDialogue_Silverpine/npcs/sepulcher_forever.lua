-- The Sepulcher (Forever only): a sour Deathguard, a widow at a gravestone, Bandarion Keep's man in Silverpine,
-- and the Windshaper the paladins pulled out of Fenris Keep. Voice: bibles/sepulcher_forever.md
local P = RPGDialogueAPI:Pack("rpgd.silverpine")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Deathguard Baldren: night patrols, Fenris Isle, and no great love for paladins.
P:NPC {
  key = "sp_baldren", id = TODO_NPC("Deathguard Baldren"), name = "Deathguard Baldren",
  bible = "bibles/sepulcher_forever.md", role = "soldier", tier = "quest",
  communities = { "sepulcher" }, temper = { "sour" }, values = { "dutiful", "skeptical" },
  notices = { "class", "kit" },
  impression = {
    first = "Deathguard Baldren has opinions about lost causes, paladins and elves, and none of them are generous. Still, he tells you exactly what he saw on patrol, and he seems to have been paying attention.",
    third = "{name} met Deathguard Baldren at the Sepulcher, a sour patrolman who watches the shore toward Fenris Isle.",
  },

  greetings = {
    { id = "g_default", text = "Make it quick. I've a patrol to walk and the gnolls don't wait." },
    { id = "g_paladin", when = { class = "PALADIN", race = "Scourge" }, text = "Another paladin. Your lot are getting to be a habit around here." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Still alive, in our sense of the word?" },
    { id = "g_saved", when = { questDone = TODO_QUEST("The Windshaper's Wrath") }, text = "You're the paladin who found that elf on Fenris Isle. I'd never have bet on it, and I'm glad I didn't." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You've been on Fenris Isle, haven't you? Those gnolls chew on anything, armor included." },
    { id = "n_fpal", cat = "class", when = { class = "PALADIN", race = "Scourge" },
      text = "I can see the glow on you from here, paladin. Don't point it at me." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Deathguard Baldren. I walk the patrol along the shore at night, and I see things on the water I'd rather not, so if you've a question, ask it before I'm back out there." },
        { id = "h_pair", tags = { "news" }, when = { questActive = TODO_QUEST("A Curious Pair") },
          text = "Trevan sent you about the Earthen Ring travellers? I might not care for you paladins, but I'll say this much: your timing is impeccable. It's better to be lucky than good, I suppose." },
        { id = "h_grim", when = { questBefore = TODO_QUEST("A Grim Fate"), questDone = TODO_QUEST("A Curious Pair") },
          text = "Out on patrol last night I saw a pack of gnolls throwing a very large body onto a pyre on the shore of Fenris Isle. I didn't see an elf, or any smaller corpses, but I wouldn't call that good news." },
        { id = "h_grimact", when = { questActive = TODO_QUEST("A Grim Fate") },
          text = "Still going after that elf? I told you it isn't worth it, and I meant it, but go on, then. Fenris Isle is east, across the water." },
        { id = "h_found", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Windshaper's Wrath"), days = 3 } },
          text = "You brought her back alive. I'd have bet my sword against it, and I'd have lost it, so I'll keep my mouth shut about lost causes for a week or so." },
      },
      again = {
        { id = "h_again", text = "What else? The tide's turning." },
        { id = "h_again2", text = "Go on, then. Ask." },
      },
      choices = {
        { text = "What did you see of the Earthen Ring travellers?", next = "pair" },
        { text = "Tell me about Fenris Isle.", next = "fenris" },
        { text = "Why don't you care for paladins?", next = "paladins" },
        { text = "What threatens the Sepulcher?", next = "threats" },
        { text = "Why patrol at night?", next = "night" },
        { text = "Goodbye, Baldren.", next = "END" },
      },
    },
    pair = {
      lines = {
        { id = "p_default", text = "Two of them, cloaked, with an escort, heading east toward Tarren Mill. A tauren, which is ordinary enough for the Earthen Ring, and something slim and tall beside him that Trevan swears was an elf. I only saw the hood." },
        { id = "p_after", when = { questDone = TODO_QUEST("The Windshaper's Wrath") },
          text = "A tauren and an elf who calls herself Skyborne, and I'll call her what she likes so long as she doesn't call down lightning on me. The tauren was the body on the pyre, poor beast, and from what I hear he went out fighting." },
      },
      choices = {
        { text = "Do you think the elf survived?", next = "elf" },
        { text = "What did Trevan make of them?", next = "trevan" },
        { text = "What do you make of Lumina now?", next = "lumina", when = { questDone = TODO_QUEST("The Windshaper's Wrath") } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trevan = {
      lines = {
        { id = "tv_default", text = "Trevan made a song and dance of them, as he does of everything. He's a decent sort for a paladin, I'll give him that, but he'd bet his last finger on a cloaked shadow, and as it happens he very nearly has." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    lumina = {
      lines = {
        { id = "lu_default", text = "Sharp-tongued and blue as a drowned man, and when she first came in she looked at me the way I look at gnolls. I've decided I like her, though I'll deny it if you repeat that to anyone." },
      },
      choices = {
        { text = "Your secret's safe.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    elf = {
      big = true,
      lines = {
        { id = "e_default", text = "No, I don't. If you're brave or stupid, you can charge into Fenris Isle and look, but that's a lot of worgen to wade through for some snooty elf who's probably long dead. You paladins love swearing oaths and taking up lost causes, so I suppose you'll go anyway." },
        { id = "e_after", when = { questDone = TODO_QUEST("The Windshaper's Wrath") },
          text = "She did, as it turns out, and I was wrong, which I'll admit once and then never again. Tell me, was it stubbornness or faith that sent you in after her?" },
      },
      choices = {
        { text = "Nobody gets left behind if I can help it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "It was a chance to win favour. I took it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fenris = {
      lines = {
        { id = "f_default", text = "An island in the lake to the east, with an old keep on it that the Rot Hide gnolls have made their den. They burn what they don't eat and eat most of what they find, and they've been bolder than usual lately, which nobody can explain." },
      },
      choices = {
        { text = "Bolder how?", next = "bolder" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bolder = {
      lines = {
        { id = "b_default", text = "Taking prisoners, for one, which gnolls never used to bother with. I'd say somebody's paying them, or frightening them, and I don't much care which, so long as it stays on their side of the water." },
      },
      choices = {
        { text = "I'll keep an eye out.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    paladins = {
      lines = {
        { id = "pa_default", text = "Because the last paladins I saw before you lot turned up were wearing red, and they were burning my patrol mates on the lakeshore. I know you're Forsaken, and I know you're not them, but the glow looks the same from where I'm standing." },
      },
      choices = {
        { text = "Has anything changed your mind?", tag = "Persuade", next = "changed",
          check = { pass = { any = { { disposition = { min = 65 } }, { questDone = TODO_QUEST("The Windshaper's Wrath") }, { questDone = TODO_QUEST("A Lesson in Divinity") } } } },
          fail = { next = "changed_no", fx = { affinity = -1 } } },
        { text = "I understand. Something else.", next = "BACK" },
      },
    },
    changed = {
      lines = {
        { id = "c_default", text = "Maybe. I've seen what you did on Fenris Isle, and that's one more good deed than the Scarlets ever managed. Don't tell Trevan I said so; he's unbearable enough already." },
      },
      choices = {
        { text = "Your secret's safe.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    changed_no = {
      lines = {
        { id = "cn_default", text = "Not yet. Do something worth remembering, and then we'll see." },
      },
      choices = { { text = "I will.", next = "BACK" } },
    },
    threats = {
      lines = {
        { id = "t_default", text = "Worgen in the woods, gnolls on the islands, and whatever Arugal keeps in Shadowfang Keep. High Executor Hadrec will give you the full list if you ask, and he'll give you work to go with it." },
      },
      choices = {
        { text = "Tell me about the worgen.", next = "worgen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    worgen = {
      lines = {
        { id = "w_default", text = "Big, fast, and hard to kill, and they don't stay down the way they ought to. Some of the Deathguard say one bite changes you, and I've no wish to learn whether it works on the dead." },
      },
      choices = {
        { text = "Who commands here?", next = "hadrec" },
        { text = "Something else.", next = "BACK", fx = { learn = { "worgen" } } },
      },
    },
    hadrec = {
      lines = {
        { id = "hd_default", text = "High Executor Hadrec, and he's got four fronts to hold and not enough of us to hold them. He doesn't waste words, which I appreciate, and he doesn't waste soldiers either, which I appreciate even more." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    shore = {
      lines = {
        { id = "sh_default", text = "Gnoll boats, mostly, rowing low with no lights, and once in a while something swimming that's too big to be a gnoll. Last week the lamps on Dalaran's new walls across the lake went dark for most of an hour, and nobody in the Sepulcher could tell me why." },
      },
      choices = {
        { text = "I'll keep an eye on the water too.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    night = {
      big = true,
      lines = {
        { id = "n_default", text = "Because that's when the worgen hunt and the gnolls row their boats, and someone has to be on the shore when they do. Most of the Deathguard grumble about it, but I'd rather see trouble coming than hear about it afterward. Would you take the night watch, if it were yours?" },
      },
      choices = {
        { text = "What do you see on the water?", next = "shore" },
        { text = "Gladly. Duty doesn't keep hours.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "No. I'd go hunting instead of waiting.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    worgen = { { id = "tp_worgen", text = "Wolves that walk like men and won't die. If you see one, don't stop to look at it." } },
    background = { { id = "tp_bg", text = "I was a soldier, then a corpse, and now I'm Deathguard. I've been told I complain more now than when I was alive, which I doubt." } },
    advice = { { id = "tp_ad", text = "Don't swim to Fenris Isle. Take a boat, or take a lot of friends." } },
    _none = { { id = "tp_none", text = "Ask High Executor Hadrec. He likes questions more than I do." } },
  },
}

-- Tabitha Heartweaver: kneeling at a gravestone, waiting for her husband.
P:NPC {
  key = "sp_tabitha", id = TODO_NPC("Tabitha Heartweaver"), name = "Tabitha Heartweaver",
  bible = "bibles/sepulcher_forever.md", role = "questgiver", tier = "quest",
  communities = { "sepulcher" }, temper = { "gentle" }, values = { "loyal", "kind" },
  notices = { "weary", "race" },
  impression = {
    first = "Tabitha Heartweaver kneels by a gravestone in the Sepulcher and seems surprised that anyone would come to speak with her. Her grief is quiet and very old, and her kindness has somehow outlasted it.",
    third = "{name} met Tabitha Heartweaver at the Sepulcher, whose husband Edward went searching the ruins of Lordaeron for their lost son.",
  },

  greetings = {
    { id = "g_default", text = "Praise to the Banshee Queen, it isn't often I have visitors out here." },
    { id = "g_back", when = { metBefore = true }, text = "You came back. I'm glad; it's lonely by the stones." },
    { id = "g_after", when = { questDone = TODO_QUEST("A Frightened Request") }, text = "Hello again, friend. I hoped our paths would cross without so much sorrow, and here you are." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { resSick = true },
      text = "You've been hurt, haven't you, and recently. Sit a while by the stones; the dead don't mind the company." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "One of the living, out here among the graves. You must have a kind heart, or a very good reason." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Praise to the Banshee Queen, it isn't often I have visitors out here. I'm Tabitha, and I'm waiting for my husband, though I'm beginning to fear I've waited too long." },
        { id = "h_before", when = { questBefore = TODO_QUEST("A Frightened Request"), minLevel = 16 },
          text = "It's my husband Edward. He hasn't come back from his weekly journey to the graveyard in the Lordaeron ruins, and it's been days, and I try not to worry, but I can't stop." },
        { id = "h_active", when = { questActive = TODO_QUEST("A Frightened Request") },
          text = "First my son, and now sweet Edward... Please, if you've found anything, tell me, whatever it is." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("A Frightened Request"), days = 3 } },
          text = "What I asked of you wasn't fair, and nobody would have blamed you for walking away. Thank you for going, and for telling me the truth, even though it's the truth I was afraid of." },
        { id = "h_later", when = { questLater = { TODO_QUEST("A Frightened Request"), days = 7 } },
          text = "I still come out to the stones every morning. I suppose I'm waiting for two of them now, and I've stopped pretending otherwise." },
      },
      again = {
        { id = "h_again", text = "Is there something else, dear?" },
        { id = "h_again2", text = "Go on. I'm not going anywhere." },
      },
      choices = {
        { text = "Tell me about Edward.", next = "edward" },
        { text = "What happened to your son?", next = "son" },
        { text = "Whose grave is this?", next = "grave" },
        { text = "Why not search the ruins yourself?", next = "ruins", when = { ["not"] = { questDone = TODO_QUEST("A Frightened Request") } } },
        { text = "Was Edward right to keep searching?", next = "worth", when = { questDone = TODO_QUEST("A Frightened Request") } },
        { text = "I found Edward, Tabitha.", next = "found", when = { questDone = TODO_QUEST("A Frightened Request") } },
        { text = "Why live out here, among the graves?", next = "why" },
        { text = "Goodbye, Tabitha.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "wy_default", text = "Because the Sepulcher is the nearest the Forsaken have to a churchyard, and I find I'd rather be near the dead who stay quiet than the living who don't. The Banshee Queen gave us our minds back, and I've chosen to spend mine remembering." },
      },
      choices = {
        { text = "You speak warmly of the Banshee Queen.", next = "queen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    queen = {
      big = true,
      lines = {
        { id = "qu_default", text = "She freed us from the Scourge, and without her I'd be shambling through the ruins myself, perhaps past my own son's bones without knowing them. Some say she uses us, and perhaps she does, but I'd rather be used by someone who let me grieve. Do you serve her gladly?" },
      },
      choices = {
        { text = "Gladly. She gave us back ourselves.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I serve myself first, and her when it suits.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    guilt = {
      lines = {
        { id = "gu_default", text = "He was on the walls when the city fell, and he sent our boy away from the square with a neighbour because he thought it would be safer. He never saw either of them again, and he's carried that every day since, though I've told him a thousand times that I'd have done the same." },
      },
      choices = {
        { text = "It wasn't his fault.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    found = {
      lines = {
        { id = "fd_default", text = "You found him near the necromancer in the graveyard, didn't you? I don't need the details, friend; I only needed to know, and now I do, and I can stop listening for his footsteps at the gate." },
        { id = "fd_wrath", when = { questDone = TODO_QUEST("The Wrath of Rath'mael") },
          text = "You found him by that necromancer in the graveyard, and the Deathguard tell me the necromancer is gone now too. I'm glad, though it doesn't bring Edward back, and I can stop listening for his footsteps at the gate." },
      },
      choices = {
        { text = "I'm so sorry, Tabitha.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    remember = {
      lines = {
        { id = "rm_default", text = "We met at a harvest fair outside the capital, and he stepped on my foot twice in one dance and apologised for a week. I've forgotten so much since I rose, and I can still feel exactly where he stepped." },
      },
      choices = {
        { text = "That's a lovely memory.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    edward = {
      lines = {
        { id = "e_default", text = "He's a good man, and a stubborn one, and both of those things have got him into trouble. Every week he walks to the graveyard in the ruins above the Undercity, and every week he comes home with nothing, and the next week he goes again." },
        { id = "e_after", when = { questDone = TODO_QUEST("A Frightened Request") },
          text = "He was a good man, and a stubborn one, and in the end the stubbornness was what took him. I find I can't be angry with him for it, though I've tried." },
      },
      choices = {
        { text = "What is he looking for?", next = "son" },
        { text = "How did you two meet?", next = "remember" },
        { text = "Something else.", next = "BACK" },
      },
    },
    son = {
      lines = {
        { id = "s_default", key = true, text = "Our boy. He was lost when Arthas razed the city, and we never found his body, and Edward has never forgiven himself for that. He thinks that if he can find our son and bury him properly, he'll finally be able to rest." },
      },
      choices = {
        { text = "And you? Do you need to find him?", next = "son2" },
        { text = "Why does Edward feel so guilty?", next = "guilt" },
        { text = "I'm sorry, Tabitha.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    son2 = {
      lines = {
        { id = "s2_default", text = "I've made my peace, or as much of it as I can make. Some nights I still hear him laughing in the next room, and I've learned not to get up and look, because there's never anyone there." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "He'd be glad you remember him.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    grave = {
      lines = {
        { id = "g_default", text = "It's his, our son's, though there's nothing beneath it. I needed somewhere to kneel, and Edward needed to keep searching, so he goes to the ruins and I come here, and between the two of us I suppose we've covered both." },
      },
      choices = {
        { text = "That's a sad sort of balance.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ruins = {
      lines = {
        { id = "r_default", text = "There are things up there I can't contend with, and Edward knows it, so he's never let me come. I've tried to warn him against searching those overrun ruins, but he refuses to give up, and now I've no one left to warn." },
        { id = "r_fog", when = { questBefore = TODO_QUEST("The Wrath of Rath'mael") },
          text = "There are things up there I can't contend with, and lately there's been a fog over the graveyard that the Deathguard don't like talking about. Edward went into it anyway, because Edward always goes." },
      },
      choices = {
        { text = "I'll go and look for him.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    worth = {
      big = true,
      lines = {
        { id = "w_default", text = "I've asked myself that every morning since you came back. He never found our boy, and it cost him everything he had left, but I don't think he could have stopped. What do you think, friend?" },
      },
      choices = {
        { text = "Yes. Hope was what kept him going.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "No. He should have let the dead lie.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I don't think it's mine to judge.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I was a wife and a mother in Lordaeron, and now I'm a widow at a grave in Silverpine. I'd rather talk about Edward." } },
    advice = { { id = "tp_ad", text = "Tell the people you love that you love them. You never know which journey will be the last one." } },
    _none = { { id = "tp_none", text = "I wouldn't know, dear. I don't leave the stones much anymore." } },
  },
}

-- Trevan Rol: Bandarion Keep's man in the Sepulcher.
P:NPC {
  key = "sp_trevan", id = TODO_NPC("Trevan Rol"), name = "Trevan Rol",
  bible = "bibles/sepulcher_forever.md", role = "questgiver", tier = "quest",
  communities = { "sepulcher" }, temper = { "wry" }, values = { "practical", "devout" },
  notices = { "class", "kit" },
  impression = {
    first = "Trevan Rol keeps the Light and a very sturdy mace in roughly equal regard. He is Bandarion Keep's eyes in the Sepulcher, wry and sharp, and he notices more than people expect a paladin to.",
    third = "{name} met Trevan Rol, a Forsaken paladin of Bandarion Keep who keeps watch in the Sepulcher for Danitha Morr.",
  },

  greetings = {
    { id = "g_default", text = "In the darkest of nights, trust in the Light to protect you, and a sturdy mace never hurts either." },
    { id = "g_paladin", when = { class = "PALADIN", race = "Scourge" }, text = "One of ours! Come in, before Baldren starts muttering." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Good; I've always got something on the boil." },
    { id = "g_blade", when = { questDone = TODO_QUEST("The Moonsilver Blade") }, text = "There's the bearer of Ott's masterwork. Keep it sharp, and keep it pointed at that worgen." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your gear's taken a beating. Trust in the Light, by all means, but trust a good armorer too." },
    { id = "n_fpal", cat = "class", when = { class = "PALADIN", race = "Scourge" },
      text = "You hold your weapon like a Keep-trained knight. Danitha Morr's drills, I'd guess; she never did let anyone grip low." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Trevan Rol, at your service, more or less. In the darkest of nights, trust in the Light to protect you; of course, having a nice, sturdy mace doesn't hurt either." },
        { id = "h_incident", tags = { "news" }, when = { questActive = TODO_QUEST("Diplomatic Incident") },
          text = "Danitha sent you? Well, in that case I already know why you're here. You've just walked into a damned fine mess, paladin." },
        { id = "h_pair", when = { questActive = TODO_QUEST("A Curious Pair") },
          text = "Baldren's near the entrance, scowling at something. Ask him what he saw on patrol, and try not to let him put you off." },
        { id = "h_saved", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Windshaper's Wrath"), days = 3 } },
          text = "You found her alive! Lumina's been telling me all about it, and about the sky, and the clouds, and her aunt, and I think Danitha will be very pleased with both of us." },
        { id = "h_bladeact", when = { questActive = TODO_QUEST("A Moon-Kissed Blade") },
          text = "Trust in the Light to guide your blade, but the Light needs a good blade to guide. Have you got my materials yet?" },
        { id = "h_ott", when = { questActive = TODO_QUEST("An Underrated Talent") },
          text = "Ott, the orc smith, is in Tarren Mill by the smithy. Give him the materials and the commission, and don't let him talk himself out of it; he will try." },
        { id = "h_ottwait", when = { questActive = TODO_QUEST("The Moonsilver Blade") },
          text = "Was Ott able to carry out the commission? Let me see it, please; I've been waiting on this for weeks." },
        { id = "h_bladedone", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Moonsilver Blade"), days = 3 } },
          text = "This will do very nicely. I knew Ott had it in him to make something great, and now there's only the beast left to kill, so speak with Lumina when you're ready." },
      },
      again = {
        { id = "h_again", text = "What else can I do for you?" },
        { id = "h_again2", text = "Go on; my mace and I are listening." },
      },
      choices = {
        { text = "What's this diplomatic mess?", next = "mess" },
        { text = "Who were the missing travellers?", next = "pair" },
        { text = "Why is Bandarion Keep's man in Silverpine?", next = "why" },
        { text = "How will we kill Old Fire-Eye?", next = "fireeye", when = { any = { { questDone = TODO_QUEST("The Debt") }, { questActive = TODO_QUEST("A Moon-Kissed Blade") } } } },
        { text = "Why send me to an ordinary smith?", next = "ott", when = { any = { { questActive = TODO_QUEST("An Underrated Talent") }, { questDone = TODO_QUEST("An Underrated Talent") } } } },
        { text = "A mace, and the Light? Which do you trust more?", next = "mace" },
        { text = "What do you make of Lumina?", next = "lumina", when = { questDone = TODO_QUEST("The Windshaper's Wrath") } },
        { text = "Farewell, Trevan.", next = "END" },
      },
    },
    mess = {
      lines = {
        { id = "m_default", key = true, text = "A pair of dignitaries from the Earthen Ring went missing in Silverpine on their way to Tarren Mill, and the whole Horde is asking who let it happen. Danitha saw a chance in it, because if we can find them, it would buy the Keep the kind of legitimacy we badly need." },
      },
      choices = {
        { text = "Is that why we help? For legitimacy?", next = "legit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    legit = {
      big = true,
      lines = {
        { id = "l_default", text = "Partly, and I won't dress it up as anything nobler. Two people were lost and we'd have looked for them regardless, but if finding them makes the Horde think twice before spitting at a Forsaken paladin, I'll take that too. Does that sit badly with you?" },
      },
      choices = {
        { text = "No. We do good, and let it be seen.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "A little. Good deeds shouldn't be done for credit.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pair = {
      lines = {
        { id = "p_default", text = "These so-called dignitaries were no ordinary diplomats. One was a tauren, which is ordinary enough for the Earthen Ring, but the other, and you'll scarcely believe this, was an elf, a high elf, and I'd bet my good pinky finger on it." },
        { id = "p_after", when = { questDone = TODO_QUEST("The Windshaper's Wrath") },
          text = "A tauren named Banon and an elf named Lumina, and it turns out I'd have lost my good pinky finger, because she's no quel'dorei. Shen'dorei, she says, Skyborne, and she was very patient about correcting me." },
      },
      choices = {
        { text = "Your good pinky finger?", next = "pinky" },
        { text = "How do you know a high elf when you see one?", next = "elves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pinky = {
      lines = {
        { id = "pk_default", text = "The others aren't what they were, and I'll leave it at that. The Light mends bones and burns and worse, but it seems to draw the line at fingers, and I've learned to be grateful for the one that stayed put." },
      },
      choices = {
        { text = "That's a grim sort of humour.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    elves = {
      lines = {
        { id = "el_default", text = "I've seen quel'dorei before, in Lordaeron, when they still walked among us as allies, and you don't forget the way they carry themselves. This one was cloaked, but she held herself the same way, and so I made my bet." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = {
        { id = "w_default", text = "Because Danitha wants eyes beyond Tirisfal, and I volunteered before anyone could stop me. The Sepulcher sees everything that moves between the Undercity and the south, and a paladin who listens more than he preaches picks up all sorts." },
        { id = "w_fpal", when = { class = "PALADIN", race = "Scourge" },
          text = "Same reason you'll end up somewhere strange before long: Danitha wants eyes beyond Tirisfal. The Sepulcher sees everything that moves between the Undercity and the south, and the Keep needs friends out here more than it needs another knight on the walls." },
      },
      choices = {
        { text = "What do the Forsaken here make of you?", next = "forsaken" },
        { text = "Tell me about Danitha Morr.", next = "danitha" },
        { text = "Something else.", next = "BACK" },
      },
    },
    danitha = {
      lines = {
        { id = "dn_default", text = "A Knight of the Silver Hand who lost the Light after she rose and fought her way back to it, and then went looking for the rest of us. She found me sitting in a ruined chapel trying to remember a prayer, and she said it for me, and I've followed her since." },
      },
      choices = {
        { text = "That's a good reason to follow someone.", next = "BACK", fx = { affinity = 1, learn = { "silver_hand" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "silver_hand" } } },
      },
    },
    lumina = {
      lines = {
        { id = "lm_default", text = "That she's the most frightening guest I've ever had, and I've had High Executor Hadrec to supper. She talks about her debt to Banon as if it were a holy vow, and I've decided not to stand anywhere near the worgen when she pays it." },
      },
      choices = {
        { text = "Then we'd best forge that blade.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    forsaken = {
      lines = {
        { id = "f_default", text = "Baldren grumbles, Hadrec tolerates me, and the apothecaries pretend I don't exist, which suits us both. It's better than it was a year ago, and I mean to leave it better still." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    fireeye = {
      lines = {
        { id = "fe_default", text = "The Son of Arugal that attacked Lumina is known as Old Fire-Eye, and he's famous for his ferocity and his stubborn refusal to die. I've done a fair amount of research, and I think we can forge a blade that will put him down for good." },
      },
      choices = {
        { text = "What will the blade need?", next = "materials" },
        { text = "Something else.", next = "BACK" },
      },
    },
    materials = {
      lines = {
        { id = "ma_default", text = "Whitestone oak lumber, which the goblin woodcarvers in the Deadmines are hoarding, an enchanted silver ingot from Shadowfang Keep, near Arugal himself, and a purified Kor gem; Ulric Frostveil at Zoram'gar can clean one, if you bring him one from the naga at Blackfathom Deeps. It's all on the list, so don't lose it." },
      },
      choices = {
        { text = "That's most of the world.", next = "world" },
        { text = "Something else.", next = "BACK" },
      },
    },
    world = {
      lines = {
        { id = "wo_default", text = "It is, and that's rather the point. A blade made from ordinary things kills ordinary things, and Old Fire-Eye is anything but ordinary." },
      },
      choices = {
        { text = "Then I'll gather it all.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ott = {
      big = true,
      lines = {
        { id = "o_default", text = "Because I bought a sword from him once, an ordinary-looking thing, and when I took it to the Undercity for maintenance the smiths there swore it came from a famous master. It came from Ott, a plain orc in Tarren Mill who has never been asked to do anything special. I'd like to give him the chance; wouldn't you?" },
      },
      choices = {
        { text = "Yes. Talent deserves its chance.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'd rather trust a proven master.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mace = {
      big = true,
      lines = {
        { id = "mc_default", text = "The Light, always, but the Light seems to appreciate a man who doesn't make it do all the work. Danitha says faith without readiness is only hope, and I've found that a good mace keeps a man humble about the difference." },
      },
      choices = {
        { text = "Faith first. The Light provides.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Readiness first. The Light helps the prepared.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    silver_hand = { { id = "tp_sh", text = "Danitha carried the Silver Hand's oaths through death, and she's teaching us to carry them too. They're heavier than they look." } },
    worgen = { { id = "tp_worgen", text = "The worgen are Arugal's children. Most of them die if you hit them hard enough, but Old Fire-Eye is another matter." } },
    background = { { id = "tp_bg", text = "I was a paladin, then I wasn't, then Danitha found me and I was again. The middle part involved fewer fingers." } },
    advice = { { id = "tp_ad", text = "Pray, and keep your mace oiled. In that order, but not by much." } },
    _none = { { id = "tp_none", text = "No idea, I'm afraid. I'd bet my good pinky finger that someone in the Sepulcher knows, though." } },
  },
}

-- Lumina Windsinger: a Windshaper of the Skyborne, guest of the Earthen Ring.
P:NPC {
  key = "sp_lumina", id = TODO_NPC("Lumina Windsinger"), name = "Lumina Windsinger",
  bible = "bibles/sepulcher_forever.md", role = "questgiver", tier = "quest",
  communities = { "sepulcher" }, temper = { "fierce" }, values = { "loyal", "honest" },
  notices = { "class", "kin" },
  impression = {
    first = "Lumina Windsinger is a Skyborne Windshaper, sky-touched and sharp-tongued, who has seen more horror in a week on Azeroth than she expected in a lifetime. She speaks of debts as if they were sacred, and she means to pay hers.",
    third = "{name} met Lumina Windsinger, a Skyborne Windshaper and guest of the Earthen Ring, who survived Fenris Keep and swore to avenge her companion Banon.",
  },

  greetings = {
    { id = "g_default", text = "Winds' blessings to you." },
    { id = "g_paladin", when = { class = "PALADIN" }, text = "Winds' blessings, paladin." },
    { id = "g_back", when = { metBefore = true, questDone = TODO_QUEST("The Windshaper's Wrath") }, text = "My rescuer returns. Winds' blessings, friend." },
    { id = "g_kin", when = { race = "Skyborne" }, text = "Kin! Winds' blessings, and pardon my staring; I didn't expect to see one of us this far from the sky." },
  },

  notice = {
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "You speak to the elements as well; I can feel them leaning toward you. Do they answer you readily here? They still feel strange to me below the clouds." },
    { id = "n_kin", cat = "kin", when = { race = "Skyborne", faction = "Horde" },
      text = "A Windshaper's child, sent down to the Horde like me. Did Ayessa Dawnsinger warn you that the ground here is full of teeth?" },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Lumina Windsinger, of the Windshapers, and a guest of the Earthen Ring, though I've been a very poor guest so far. Winds' blessings to you." },
        { id = "h_cage", when = { questActive = TODO_QUEST("Lumina Windsinger") },
          text = "Quel'dorei? No, I'm no quel'dorei; I'm shen'dorei, one of the Windshaper Skyborne. We have no time for this now, though, so kill the gnolls and bring me the key to this cage, and I'll tell you the rest once we're safely away." },
        { id = "h_escort", when = { questActive = TODO_QUEST("The Windshaper's Wrath") },
          text = "Now that I'm free, I'm going to make these vile creatures regret ever laying eyes on a Windshaper. Let's get out of here." },
        { id = "h_saved", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Windshaper's Wrath"), days = 3 } },
          text = "Thank you again. I've heard less than charitable things about paladins in my travels, and as a sky-touched elf walking through Horde lands, I know how easily that sort of thing takes root. You and your kind have a friend among the Windshapers." },
        { id = "h_debt", when = { questActive = TODO_QUEST("The Debt") },
          text = "I've never seen anything like what happened to Banon. Azeroth is a wonderful place, but the breadth of what's possible here is terrifying." },
        { id = "h_blade", when = { questActive = TODO_QUEST("A Moon-Kissed Blade") },
          text = "Trevan has the list. To put down a beast like Old Fire-Eye we need a special kind of weapon, and he seems to know exactly what kind." },
        { id = "h_hunt", tags = { "news" }, when = { questDone = TODO_QUEST("The Moonsilver Blade"), questBefore = TODO_QUEST("Old Fire-Eye") },
          text = "Trevan says the blade is finished. Then all that's left is the beast, down by the Greymane Wall, and I've been waiting for this since Fenris Isle." },
        { id = "h_avenged", tags = { "news" }, when = { questRecent = { TODO_QUEST("Old Fire-Eye"), days = 3 } },
          text = "It's done. The creature that doomed Banon is dead and will stay dead, and the debt is paid; I swore it on the sky above, and the sky has seen it kept." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "One of Banon's people. I'm sorry; I keep seeing him in every tauren I meet, and it isn't fair to any of you. Winds' blessings to you." },
      },
      again = {
        { id = "h_again", text = "What else would you like to know?" },
        { id = "h_again2", text = "Ask; I owe you that much, and more." },
      },
      choices = {
        { text = "What are the shen'dorei?", next = "shendorei", when = { ["not"] = { race = "Skyborne" } } },
        { text = "Why did you come down to Azeroth?", next = "why" },
        { text = "Who was Banon?", next = "banon" },
        { text = "What happened on the road?", next = "road", when = { any = { { questDone = TODO_QUEST("The Windshaper's Wrath") }, { questActive = TODO_QUEST("The Debt") } } } },
        { text = "What do you make of Azeroth so far?", next = "azeroth" },
        { text = "What do the Windshapers want with the Horde?", next = "horde" },
        { text = "Where will we find Old Fire-Eye?", next = "fireeye", when = { any = { { questDone = TODO_QUEST("The Moonsilver Blade") }, { questActive = TODO_QUEST("Old Fire-Eye") } } } },
        { text = "What have you heard about paladins?", next = "paladins", when = { class = "PALADIN" } },
        { text = "Winds' blessings, Lumina.", next = "END" },
      },
    },
    shendorei = {
      lines = {
        { id = "sd_default", text = "The hidden people. Our ancestors left Eldre'Thalas rather than kneel to a prince who drank from the Nether, and we lived among the clouds for ten thousand years, and now we've come down. I'm sky-touched, too, so I'm this colour; it's a blessing among our newborns, though people here keep asking if I'm ill." },
      },
      choices = {
        { text = "Why come down now?", next = "why" },
        { text = "Something else.", next = "BACK", fx = { learn = { "two_orders" } } },
      },
    },
    why = {
      lines = {
        { id = "w_default", text = "Our home drifts, the spirits that sheltered us are gone, and Ayessa Dawnsinger brought the Windshapers to the Horde, at Camp Gev'rek in Mulgore. The Earthen Ring offered to show some of us how the elements behave down here, and Banon and I were bound for the Arathi Highlands to study the elemental convergences there." },
      },
      choices = {
        { text = "And then Silverpine happened.", next = "road" },
        { text = "What are the convergences?", next = "convergences" },
        { text = "How does one become a Windshaper?", next = "trials" },
      },
    },
    trials = {
      lines = {
        { id = "tr_default", text = "Through the elemental trials, and a draught of enchanted sapta that opens your ears to the spirits, which tastes about as pleasant as you'd expect. I passed mine the spring before we came down, and I still dream about the fire trial." },
      },
      choices = {
        { text = "What happened in the fire trial?", next = "fire" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fire = {
      lines = {
        { id = "fi_default", text = "Nothing dramatic, I'm afraid; I simply sat with it until it stopped trying to burn me and started trying to talk. It's the lightning I'm good with, as that worgen learned, and as the next one will." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    fireeye = {
      lines = {
        { id = "fe_default", text = "Down by the Greymane Wall, in the south of this forest, where the worgen gather thickest. He's the biggest and meanest of them, and he never seems to stay dead, so we strike with Ott's blade first and everything else afterward." },
      },
      choices = {
        { text = "Then let's pay your debt.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    paladins = {
      big = true,
      lines = {
        { id = "pd_default", text = "Less than charitable things, mostly from Forsaken who don't trust the Light and from orcs who remember the Alliance's knights. As a sky-touched elf walking through Horde lands, I know how easily that sort of thing takes root, so I prefer to judge by what I see. What would you have me see in you?" },
      },
      choices = {
        { text = "A shield for anyone who needs one.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A weapon pointed at the Horde's enemies.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    convergences = {
      lines = {
        { id = "cv_default", text = "Places where the elements pull against each other more strongly than they should, according to the Earthen Ring. Banon wanted to see whether the winds of Arathi felt anything like the winds at home. I still mean to go, for both of us, once I've finished here." },
      },
      choices = {
        { text = "I hope you find what he was looking for.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    banon = {
      lines = {
        { id = "b_default", text = "A tauren of the Earthen Ring, and my companion on the road, and very patient with an elf who asked far too many questions. He was the one who threw himself between me and the creature, and it was his body the gnolls burned on Fenris Isle." },
      },
      choices = {
        { text = "I'm sorry, Lumina.", next = "BACK", fx = { affinity = 1 } },
        { text = "What creature?", next = "road" },
      },
    },
    road = {
      lines = {
        { id = "r_default", key = true, text = "It wasn't the gnolls who attacked us on the road. It was a giant wolf-like creature I now know as a worgen, and it cut down our guards and came for me, and Banon threw himself in its path. I singed its backside with lightning and it fled, but Banon was already badly bitten." },
      },
      choices = {
        { text = "What happened to him?", next = "change" },
        { text = "Something else.", next = "BACK", fx = { learn = { "worgen" } } },
      },
    },
    change = {
      lines = {
        { id = "c_default", text = "The gnolls took us on the way back, and it was when they pulled us from the boat on Fenris Isle that the change began. Every bone in his body seemed to break at once, and his hands became claws, and it took twenty gnolls to bring him down; he killed half of them before the end." },
      },
      choices = {
        { text = "<Keep listening.>", next = "change2" },
        { text = "I've heard enough. Something else.", next = "BACK", fx = { learn = { "worgen" } } },
      },
    },
    change2 = {
      lines = {
        { id = "c2_default", text = "At the very end he reared up to strike me, and we locked eyes, and I could see he still knew who he was and who I was. He knew what was happening, and he had no control over it at all, and that was the worst part." },
      },
      choices = {
        { text = "He saved you from a terrible fate.", next = "debt", fx = { learn = { "worgen" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "worgen" } } },
      },
    },
    debt = {
      big = true,
      lines = {
        { id = "d_default", text = "He knew what would happen and he shielded me anyway. We Windshapers always pay our debts, and I owe him one, so if such a thing is possible I'll see the creature that doomed him dead, so it can never do this to another living thing. Do you understand that, or does it sound like vengeance to you?" },
      },
      choices = {
        { text = "A debt is a debt. Pay it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Vengeance, and that's fine. Just make it hurt.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    azeroth = {
      lines = {
        { id = "a_default", text = "Wonderful and terrifying in about equal measure. Gnolls are the second worst creatures I've met here so far, and you can guess which are the first, and yet I've seen tauren drums and Forsaken who pray to the Light and a whole forest of silver pines, and none of that exists at home." },
      },
      choices = {
        { text = "What do you think of the Forsaken?", next = "forsaken" },
        { text = "Something else.", next = "BACK" },
      },
    },
    forsaken = {
      big = true,
      lines = {
        { id = "f_default", text = "Strange, and kinder than I was warned, at least the ones who came for me. On the isle we scatter our dead to the wind so they can't be disturbed, and here are people who were disturbed and stood up and kept going, and I haven't decided yet whether that's a horror or a kind of courage. What would you say?" },
        { id = "f_scourge", when = { race = "Scourge" },
          text = "Kinder than I was warned, starting with you. On the isle we scatter our dead to the wind, and here you are, standing and walking and arguing with me, and I can't decide yet whether that's a horror or a courage I don't have a word for. Which is it, from where you stand?" },
      },
      choices = {
        { text = "Courage. We chose to keep going.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Neither. We simply refuse to lie down.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    horde = {
      lines = {
        { id = "h2_default", text = "Friends who keep their word, Ayessa says, and teachers who understand the elements as we do. The tauren took us in at Skywatcher Plateau without asking anything in return, and I find I don't mind belonging to a Horde that does that." },
      },
      choices = {
        { text = "Didn't some of your people go to the Alliance instead?", next = "orders" },
        { text = "Something else.", next = "BACK", fx = { learn = { "two_orders" } } },
      },
    },
    orders = {
      lines = {
        { id = "o_default", text = "The High Order did, to Dalaran and the Kirin Tor. They want back what the magisters knew, and we feel we owe the spirits everything, and we've quarrelled about it for longer than I've been alive. I'd rather not quarrel about it here, so far from home." },
      },
      choices = {
        { text = "Then we won't. Something else.", next = "BACK", fx = { learn = { "two_orders" } } },
      },
    },
  },

  topics = {
    two_orders = { { id = "tp_orders", text = "The High Order wants the magisters' knowledge back, and the Windshapers want to honour the spirits who sheltered us. Both are right, and both are stubborn." } },
    worgen = { { id = "tp_worgen", text = "A curse that walks on four legs and then on two. I've seen what it does from the inside, and I'll be glad never to see it again." } },
    background = { { id = "tp_bg", text = "A Windshaper of Zephras Isle who passed her trials and came down to learn. The ground teaches faster than the winds did, and much more rudely." } },
    advice = { { id = "tp_ad", text = "Pay your debts, all of them. The ones you forget are the ones that come back to collect." } },
    _none = { { id = "tp_none", text = "I don't know; I've only been below the clouds a little while. Ask Trevan; he knows everything, or says he does." } },
  },
}
