-- Ashenvale, Alliance folk we had missed: Liladris Moonriver (Maestra's Post, waiting for Kerlonian),
-- Shael'dryn (the dryad of Raene's Cleansing), Illiyana (the dryad at the Shrine of Aessina), Talen
-- (Blackfathom Camp, the Ring of Zoram) and Maluressian (Astranaar's stable master). Classic only.
-- Voice: bibles/ashenvale_folk.md
local P = RPGDialogueAPI:Pack("rpgd.ashenvale")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Liladris Moonriver
---------------------------------------------------------------------------
P:NPC {
  key = "liladris", id = TODO_NPC("Liladris Moonriver"), name = "Liladris Moonriver",
  bible = "bibles/ashenvale_folk.md", role = "questgiver", tier = "quest",
  communities = { "maestras_post" }, temper = { "dry", "warm" }, values = { "loyal", "patient" },
  notices = { "class", "weary" },

  impression = {
    first = "Liladris Moonriver keeps her eyes on the northern road from Maestra's Post, waiting for a druid who should have arrived a season ago. She is fond of him and exasperated with him in about equal measure.",
    third = "{name} met Liladris Moonriver at Maestra's Post, who waits for her beloved Kerlonian Evershade to wake up and come home.",
  },

  greetings = {
    { id = "g_hello", text = "You came up the north road? Did you see a druid asleep under a tree, by any chance?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Any sign of him? No, of course not, why would there be." },
    { id = "g_done", when = { questDone = TODO_QUEST("The Sleeper Has Awakened") },
      text = "He's here, and awake, mostly, and it's your doing. Kerlonian hasn't stopped talking about you between naps." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Tell me, do all of you come back from the Dream this sleepy, or is it only the one I chose?" },
    { id = "n_weary", cat = "weary", when = { resting = true },
      text = "You look tired. Please don't fall asleep here, I've had quite enough of that from one person." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Liladris Moonriver. My beloved, Kerlonian Evershade, woke from the Emerald Dream months ago and set out to meet me here, and I've been waiting at Maestra's Post ever since." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("The Sleeper Has Awakened") },
          text = "You've found him, then, and he's dozing somewhere between here and Darkshore. Keep the horn of awakening close, and blow it whenever he nods off, and please don't let the furbolgs eat him on the way." },
        { id = "h_done", when = { questDone = TODO_QUEST("The Sleeper Has Awakened") },
          text = "He's sleeping in the back room right now, so speak softly, though I don't suppose a stampede of kodo would wake him. Thank you for bringing him home, with all my heart." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid, and awake! You've no idea how rare that seems to me just now. I'm waiting on one of your sort, who's been waking from the Dream for about three months and hasn't quite managed it." },
      },
      again = {
        { id = "h_again", text = "What else? I've nothing to do but wait, so I may as well talk." },
        { id = "h_again2", text = "Ask away, while I keep half an eye on the road." },
      },
      choices = {
        { text = "Who is Kerlonian?", next = "kerlonian" },
        { text = "Why does he keep falling asleep?", next = "dream" },
        { text = "He told me he was going home to Auberdine.", next = "auberdine" },
        { text = "What's Maestra's Post like?", next = "post" },
        { text = "Was it worth the wait?", next = "after", when = { questDone = TODO_QUEST("The Sleeper Has Awakened") } },
        { text = "I'll keep an eye out for him.", next = "END" },
      },
    },

    kerlonian = {
      lines = { { id = "ke_default", text = "He's a druid of the Cenarion Circle, gentle and clever and absolutely hopeless at being on time. He went into the Dream with the others, long ago, and I waited, and now he's out and I'm still waiting, which I'm told is very romantic." } },
      choices = {
        { text = "It is romantic.", next = "romantic" },
        { text = "It sounds exhausting.", next = "exhausting" },
        { text = "Something else.", next = "BACK" },
      },
    },
    romantic = {
      lines = { { id = "ro_default", text = "Then you can wait for him next time, and I'll go to the inn at Astranaar. No, I don't mean that, or not entirely, because I'd wait another thousand years if he asked me to, though I'd complain about it." } },
      choices = {
        { text = "Love that waits is worth more than gold.", next = "BACK", reply = "It is, and I'll remind myself of that the next time he oversleeps by a century. You're kind to say it.", fx = { align = { order = 1 } } },
        { text = "Life is short. Go and drag him here yourself.", next = "BACK", reply = "Ha! If I could drag a druid out of the Dream, I'd have done it long ago. But I like the way you think.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    exhausting = {
      lines = { { id = "ex_default", text = "It is, thank you, someone finally said it. Everyone else sighs and tells me how lucky I am to love a druid, and they're not the ones sitting on a wall for a season." } },
      choices = { { text = "Something else, then.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },

    dream = {
      lines = { { id = "dr_default", text = "Those who sleep long in the Emerald Dream find it hard to leave, and something in it pulls at them for a long while afterward. The Circle sent word that it would pass, which is what the Circle says about everything." } },
      choices = {
        { text = "Can anything wake him?", next = "horn" },
        { text = "Is the Dream dangerous?", next = "dream_danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    horn = {
      lines = { { id = "ho_default", text = "There's a horn of awakening, which the Circle uses for exactly this sort of trouble. Blow it near him and he'll wake, for a while, and you'll have to blow it again before the next bend in the road." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dream_danger = {
      lines = { { id = "dd_default", text = "He says it's beautiful and he won't say more, and when I ask, he goes quiet in a way I don't like. I think he saw something there that frightened him, and I think he's sleeping to look at it again." } },
      choices = {
        { text = "Trust him. He'll tell you when he's ready.", next = "BACK", reply = "I will, I suppose, because I've always trusted him. It's just hard to wait when he looks like that.", fx = { align = { honor = 1 } } },
        { text = "Make him tell you. You've earned it.", next = "BACK", reply = "I've earned it, haven't I? Perhaps you're right, and I'll ask him again, gently.", fx = { align = { honor = -1 } } },
      },
    },

    auberdine = {
      lines = { { id = "au_default", text = "Of course he did, because that's where we lived when he went to sleep, and he's forgotten I wrote to him that I'd moved. The Sentinels sent me down to the Post with the supplies, and I left word in Auberdine, and he left the letter unread in his pack, I expect." } },
      choices = {
        { text = "Should I tell him?", next = "au_tell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    au_tell = {
      lines = { { id = "at_default", text = "Bring him here and he'll find out. I'd like to see his face when he understands he's walked twice as far as he needed to." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    post = {
      lines = { { id = "po_default", text = "It's a watch post on the edge of the forest, with Delgren the Purifier and his paladins, a few Sentinels, and more orc scouts in the trees than anyone likes to count. It's not a home, but the moon comes up beautifully over the hills, and I watch it every night." } },
      choices = {
        { text = "What do you make of Delgren?", next = "delgren" },
        { text = "Something else.", next = "BACK" },
      },
    },
    delgren = {
      lines = { { id = "de_default", text = "He's earnest, young and very human, and he prays out loud, which none of us are used to. But he stands his watch without complaining, and he never once told me how lucky I am to love a druid." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    after = {
      lines = { { id = "af_default", text = "He woke up properly this morning and looked at me as if no time had passed, and asked if I'd waited long. I told him no, which is the first lie I've ever told him, and I think he knew." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
  },
}

---------------------------------------------------------------------------
-- Shael'dryn
---------------------------------------------------------------------------
P:NPC {
  key = "shaeldryn", id = TODO_NPC("Shael'dryn"), name = "Shael'dryn",
  bible = "bibles/ashenvale_folk.md", role = "questgiver", tier = "quest",
  communities = { "astranaar" }, temper = { "cheerful", "gentle" }, values = { "nature", "kind" },
  notices = { "class", "form" },

  impression = {
    first = "Shael'dryn is a dryad who tends a moonwell in the hills of Ashenvale, quick to laugh and quicker to grieve when she talks about the treants gone wrong. She knows the pieces of Dartol's Rod and where they were hidden.",
    third = "{name} met Shael'dryn, a dryad of Ashenvale who helped rebuild Dartol's Rod for Raene Wolfrunner.",
  },

  greetings = {
    { id = "g_hello", text = "Oh, a visitor! Mind the water, it's the only clean moonwell for miles and I like it that way." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Hehe, I hoped you would." },
    { id = "g_done", when = { questDone = TODO_QUEST("Raene's Cleansing") },
      text = "The rod is whole and you're whole, and that's two good things in one day, which is more than this forest usually manages." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid! You smell of the Moonglade, or of somewhere very like it. Have you come to help, or only to visit?" },
    { id = "n_form", cat = "form", when = { form = { "bear", "cat", "travel" } },
      text = "You're wearing an animal, how lovely! The treants won't be fooled, though, they can smell an elf under any fur." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_dd_branch", when = { questDone = TODO_QUEST("The Branch of Cenarius") }, text = "Illiyana says you took the Branch of Cenarius back from that horrid satyr, and she has stopped weeping by the shrine. You have been kind to both of Father's daughters now, and we do not forget kindness." },
        { id = "h_default", key = true,
          text = "I'm Shael'dryn, a daughter of Cenarius, and I keep this moonwell for as long as anyone lets me. Raene Wolfrunner sent you, didn't she? She only sends people when she's worried about something." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Raene's Cleansing") },
          text = "Dartol's Rod is in pieces, and the pieces are in places no sensible person would go, so I'm very glad you came. Bring them to me and I'll put the rod back together, and then we'll find the shrine that can wake it." },
        { id = "h_done", when = { questDone = TODO_QUEST("Raene's Cleansing") },
          text = "Raene has her rod and I have my well, and the treants are still sick, but one thing at a time. You did well, you really did." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid, come up the hill! Father Cenarius would be glad of you, and so am I, because there are treants in these woods that need someone who understands what they were." },
      },
      again = {
        { id = "h_again", text = "What else? I've all day, and the well doesn't mind waiting." },
        { id = "h_again2", text = "Ask! I like questions. They're like seeds, hehe." },
      },
      choices = {
        { text = "What is Dartol's Rod?", next = "rod" },
        { text = "What happened to the treants?", next = "treants" },
        { text = "What happened to the druids of Dor'Danil?", next = "dordanil" },
        { text = "You're a daughter of Cenarius?", next = "cenarius" },
        { text = "I'll come back with the pieces.", next = "END" },
      },
    },

    rod = {
      lines = { { id = "ro_default", text = "Dartol was a druid with clever hands, and he made a rod that could let its bearer wear another shape for a while. When he died, his friends broke it apart and hid the pieces, because a thing like that shouldn't be found by just anyone." } },
      choices = {
        { text = "Why does Raene want it?", next = "raene" },
        { text = "Should it be put back together at all?", next = "rod_should" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rod_should = {
      lines = { { id = "rs_default", text = "I asked myself that too, all night by the well. But Raene's people are dying out there, and a tool that lets them walk where they couldn't before might save some of them, so I decided yes." } },
      choices = {
        { text = "Dartol's friends hid it for a reason. Be careful.", next = "BACK", reply = "I will, I promise, and I'll watch it closely. Dartol's friends weren't fools.", fx = { align = { order = 1 } } },
        { text = "A tool that saves lives should be used.", next = "BACK", reply = "That's what I keep telling myself, and it helps to hear it from someone else. Raene's people need every chance.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    raene = {
      lines = { { id = "ra_default", text = "She'd have to tell you herself, she keeps her plans close. But she's fighting the furbolgs and the corruption both, and I think she wants to look at the sickness from the inside." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    treants = {
      lines = { { id = "tr_default", text = "They were Dartol's friends, tending this part of the forest, and now they're twisted and angry and they don't know me any more. One of them held the key to the rod's chest, and you'll have to take it from him." } },
      choices = {
        { text = "I'll be as gentle as I can.", next = "treants_gentle" },
        { text = "Something else.", next = "BACK" },
      },
    },
    treants_gentle = {
      lines = { { id = "tg_default", text = "That's kind of you, and a bit silly, because they won't be gentle with you. But thank you anyway, because nobody else has said it." } },
      choices = {
        { text = "They were good once. They deserve mercy.", next = "BACK", reply = "They were, and I'm so glad you remember it. Be gentle, if you can, and safe, if you can't.", fx = { align = { light = 1 } } },
        { text = "What they were doesn't matter. They're dangerous now.", next = "BACK", reply = "I know, and I won't ask you to stand still for them. Just, please, don't hate them for it.", fx = { align = { light = -1 } } },
      },
    },

    dordanil = {
      lines = { { id = "do_default", text = "They took the last piece of the rod to keep it safe, in their barrow den east of the road toward the Barrens. Something killed them, not long ago, and I cannot bear to think on it, so I'll only say be careful there." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    cenarius = {
      lines = { { id = "ce_default", text = "All the dryads are, and the keepers of the grove are his sons. I've only seen him once, from very far away, and he was so tall that the trees seemed to bow to him, though maybe they were only bending in the wind." } },
      choices = {
        { text = "That must have been something to see.", next = "BACK", fx = { trait = { curious = 1 }, learn = { "cenarion_circle" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
}

---------------------------------------------------------------------------
-- Illiyana
---------------------------------------------------------------------------
P:NPC {
  key = "illiyana", id = TODO_NPC("Illiyana"), name = "Illiyana",
  bible = "bibles/ashenvale_folk.md", role = "questgiver", tier = "quest",
  communities = { "astranaar" }, temper = { "fierce", "gentle" }, values = { "nature", "loyal" },
  notices = { "class", "fel" },

  impression = {
    first = "Illiyana is a dryad at the Shrine of Aessina, grieving her friend Anilia and furious at the satyr who killed her. Her grief comes out as a hunger for horns, which she doesn't seem to find strange.",
    third = "{name} met Illiyana, a dryad of the Shrine of Aessina who mourns her friend Anilia and wants the satyr punished.",
  },

  greetings = {
    { id = "g_hello", text = "Step softly, this is Aessina's shrine. And if you've satyr blood on your boots, so much the better." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Did you bring me horns, or only questions?" },
    { id = "g_branch", when = { questDone = TODO_QUEST("The Branch of Cenarius") },
      text = "You brought the Branch home. Anilia can rest now, I think, and maybe I can too." },
  },

  notice = {
    { id = "n_lock", cat = "fel", when = { class = "WARLOCK" },
      text = "You smell like the satyr do, of smoke and something sour. I'll assume you're on our side, but I'll watch you." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid. Anilia loved the druids; she used to follow them through the woods and hide their boots for a joke." },
  },

  start = "hello",
  nodes = {
    dd_raene = {
      lines = {
        { id = "ddr_default", text = "She would; she talks to anyone who stops long enough, and she has been lonely. The furbolgs were Cenarius' friends once, as we are his daughters, and it hurts us both to see them turned against the woods they guarded." },
      },
      choices = {
        { text = "The furbolgs are lost. The forest comes first.", next = "BACK", reply = "You sound like the Sentinels, and perhaps you are right. I still hope for them, because someone should.", fx = { align = { light = -1 } } },
        { text = "Maybe the furbolgs can still be saved.", next = "BACK", reply = "My father would like you for saying so. Go gently in the north, then, and look for the ones who can still hear reason.", fx = { align = { light = 1 } } },
        { text = "Something else, Illiyana.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_raene", when = { questDone = TODO_QUEST("Raene's Cleansing") }, text = "Shael'dryn sings again in the north, and she says it is because of you. My sister's grove was dying of the furbolgs' corruption, and now it breathes, so I count you twice a friend." },
        { id = "h_default", key = true,
          text = "I'm Illiyana, a daughter of Cenarius. The satyr of these woods killed my friend Anilia and stole the Branch of Cenarius from her, and I want them to answer for it." },
        { id = "h_slay", tags = { "news" }, when = { questActive = TODO_QUEST("Satyr Slaying!") },
          text = "Sixteen horns, and I'll know each one belonged to a creature that earned its end. The satyr gather to the north and east of here, in the Night Run and around Satyrnaar." },
        { id = "h_branch", tags = { "news" }, when = { questActive = TODO_QUEST("The Branch of Cenarius") },
          text = "Anilia spoke to you before she died? Then you know who took it: Geltharis, the satyr, and he'll be somewhere close to where she fell." },
        { id = "h_done", when = { questDone = TODO_QUEST("Satyr Slaying!") },
          text = "I counted the horns twice, and I felt a little better each time, and then I felt worse. I don't think grief listens to arithmetic." },
      },
      again = {
        { id = "h_again", text = "What else? Ask quickly, I don't like talking about her for long." },
        { id = "h_again2", text = "Go on, I'm listening." },
      },
      choices = {
        { text = "Shael'dryn told me about the corruption in her grove.", next = "dd_raene", when = { questDone = TODO_QUEST("Raene's Cleansing") } },
        { text = "Tell me about Anilia.", next = "anilia" },
        { text = "What is the Branch of Cenarius?", next = "branch" },
        { text = "Who are these satyr?", next = "satyr" },
        { text = "Does killing them really help?", next = "help" },
        { text = "I'll hunt the satyr for you.", next = "END" },
      },
    },

    anilia = {
      lines = { { id = "an_default", text = "We grew up in these woods together, if dryads grow up at all. She was always the brave one and I was always the one telling her not to be, and she never listened, not once." } },
      choices = {
        { text = "I'm sorry for your loss.", next = "anilia_sorry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    anilia_sorry = {
      lines = { { id = "as_default", text = "Thank you. I'm not used to being sad, it isn't really what dryads are made for, so I keep turning it into being angry instead, because I know how to do that." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },

    branch = {
      lines = { { id = "br_default", text = "It's a branch from the Lord of the Forest himself, given to the dryads to keep, and it holds a little of his strength. In a satyr's hands it could poison a whole grove, which is why Anilia went after it alone." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } } },
    },

    satyr = {
      lines = { { id = "sa_default", text = "They were elves once, Azshara's people, and now they're horns and hooves and hate. They foul the moonwells and they laugh while they do it, and I've never heard a sound I hated more." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "satyrs" } } } },
    },

    help = {
      lines = { { id = "he_default", text = "I don't know. But every satyr that falls is one fewer that can do to someone else what was done to her, and that has to count for something, doesn't it?" } },
      choices = {
        { text = "It counts. Every one stopped saves a life.", next = "BACK", reply = "It does, doesn't it? Thank you, I needed to hear someone say it.", fx = { align = { light = -1 } } },
        { text = "Revenge won't heal you. Mourn her instead.", next = "BACK", reply = "I know, and I'll mourn her too, I promise. But I can't sit still while the satyrs are out there.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
}

---------------------------------------------------------------------------
-- Talen
---------------------------------------------------------------------------
P:NPC {
  key = "talen", id = TODO_NPC("Talen"), name = "Talen",
  bible = "bibles/ashenvale_folk.md", role = "scholar", tier = "quest",
  communities = { "astranaar" }, temper = { "nervous", "chatty" }, values = { "curious", "ambitious" },
  notices = { "class", "race" },

  impression = {
    first = "Talen camps on the edge of the Zoram Strand with a few salvaged supplies and the look of a man who was nearly eaten very recently. He is still more interested in the drowned city than in his own skin.",
    third = "{name} met Talen, a night elf scholar camped near the Zoram Strand who lost his ancient statuette to a naga ambush.",
  },

  greetings = {
    { id = "g_hello", text = "Oh! You startled me. Welcome, welcome, to what I'm generously calling a camp." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and nothing's tried to drag you into the sea. Good, good." },
    { id = "g_done", when = { questDone = TODO_QUEST("Ruuzel") },
      text = "The Ring of Zoram, in my hands! I keep looking at it to make sure it's still there." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage. You'll understand, I hope, that a lock made by the Highborne isn't the sort of thing you pick with a hairpin." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf! The Explorers' League would give their beards for what's under that water, so don't tell them I said so." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Talen. I was skimming my little boat over the drowned ruins of Zoram when the naga came up out of the water and tore at me, and I fled with what I could carry, which turned out not to include the one thing I came for." },
        { id = "h_statuette", tags = { "news" }, when = { questActive = TODO_QUEST("The Ancient Statuette") },
          text = "The ambush was along the coast to the north of here. The statuette's small and dark and very, very old, so look in the sand and among the wreckage, and look over your shoulder while you're at it." },
        { id = "h_ruuzel", tags = { "news" }, when = { questActive = TODO_QUEST("Ruuzel") },
          text = "Ruuzel leads the naga from an isle on the northern edge of Zoram, and the ring will be on her or near her. I'd come with you, but I'd only get in the way, and probably drown." },
        { id = "h_done", when = { questDone = TODO_QUEST("Ruuzel") },
          text = "Ring and statuette together, and the lock's still holding, which is maddening, but it's the good sort of maddening. I'll have it open by the next moon, or the one after." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm always glad of someone to talk at." },
        { id = "h_again2", text = "Go on. I've been talking to the statuette, so you're a welcome change." },
      },
      choices = {
        { text = "What was Zoram?", next = "zoram" },
        { text = "What's so special about the statuette?", next = "statuette" },
        { text = "Who's Ruuzel?", next = "ruuzel" },
        { text = "Why risk your life for old things?", next = "risk" },
        { text = "I'll see what I can find.", next = "END" },
      },
    },

    zoram = {
      lines = { { id = "zo_default", text = "It was a Highborne city on this coast, before the Sundering, and a grand one by the look of what's left. When the Well was destroyed the sea came in and swallowed it, and you can still see the tops of its towers at low tide." } },
      choices = {
        { text = "And the naga live there now?", next = "naga" },
        { text = "Something else.", next = "BACK" },
      },
    },
    naga = {
      lines = { { id = "na_default", text = "They seem to think it's theirs, and perhaps it is, if the stories are true and some of them were Highborne once. I find that a very uncomfortable thought, and I try not to have it when I'm out in the boat." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "highborne" } } } },
    },

    statuette = {
      lines = { { id = "st_default", text = "It has a lock in it, a tiny one, made by someone who didn't want it opened by just anyone. Whatever the Highborne thought worth hiding inside a statue, I want to know what it is." } },
      choices = {
        { text = "Some things were hidden for good reason.", next = "st_stance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    st_stance = {
      lines = { { id = "sts_default", text = "You sound like my mother, and like every Sentinel who's walked past my camp. But nobody learns anything by leaving locks alone." } },
      choices = {
        { text = "Leave the Highborne's secrets drowned.", next = "BACK", reply = "There, you sound like my mother too, now. Well, it's too late, because I've already started.", fx = { align = { order = 1 } } },
        { text = "Open it. Knowledge belongs to whoever finds it.", next = "BACK", reply = "Exactly, exactly, and you're the first person who's said so! I'll write your name in my notes.", fx = { align = { order = -1 } } },
      },
    },

    ruuzel = {
      lines = { { id = "ru_default", text = "She's the naga who leads the raiders on the strand, and the one who found the Ring of Zoram before I could. The ring was the key to the statuette all along, which I'd have known sooner if I'd read more carefully." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    risk = {
      lines = { { id = "ri_default", text = "Because if nobody does, the sea keeps them, and the naga keep them, and everything Zoram knew is lost for another ten thousand years. I'm not brave, I'm only curious, and some days that's the same thing." } },
      choices = {
        { text = "That's a good enough reason.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
}

---------------------------------------------------------------------------
-- Maluressian (stable master, Astranaar)
---------------------------------------------------------------------------
P:NPC {
  key = "maluressian", id = TODO_NPC("Maluressian"), name = "Maluressian",
  title = "Stable Master",
  bible = "bibles/ashenvale_folk.md", role = "stablemaster", tier = "service",
  communities = { "astranaar" }, temper = { "calm", "gentle" }, values = { "patient", "kind" },
  notices = { "pet" },

  impression = {
    first = "Maluressian keeps Astranaar's stables and talks to the animals in his care in a low voice, as if they were patients. He has opinions about how hunters treat their companions and doesn't hide them.",
    third = "{name} met Maluressian, Astranaar's stable master.",
  },

  greetings = {
    { id = "g_hello", text = "Quietly, please. The animals are resting, and so am I." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Come for a companion, or to leave one with me?" },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { named = true } },
      text = "Your {pet} looks well fed and well kept. I can always tell, you know; a neglected beast carries its head differently." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Maluressian, and I keep the stables here on the island. I'll look after any companion you leave with me as if it were my own, and better than some keep their own." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter. Your companions are safe with me, though I'll ask you to come and visit them, because they notice when you don't." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid, and the sabers lifted their heads when you came up the path, which they only do for kin. I am Maluressian, and I keep the stables here; you'll forgive me if I talk to them more than to you." },
      },
      again = {
        { id = "h_again", text = "Anything else? Speak softly." },
        { id = "h_again2", text = "What else can I do for you?" },
      },
      choices = {
        { text = "I'd like to see the stables.", next = "BUSINESS" },
        { text = "What sort of beasts do you keep?", next = "beasts" },
        { text = "How do the animals take the war?", next = "war" },
        { text = "Astranaar seems a strange place for stables.", next = "island" },
        { text = "How would I find a companion of my own?", next = "find", when = { class = "HUNTER" } },
        { text = "The Horde ride wolves here too. Do you hate them?", next = "wolves", when = { faction = "Horde" } },
        { text = "Thank you.", next = "END" },
      },
    },
    beasts = {
      lines = { { id = "be_default", text = "Sabers mostly, and wolves, and once a bear who stayed a month and ate most of Astranaar's honey. Every beast among them was easier to care for than the hunters who left them here." } },
      choices = {
        { text = "What makes a good hunter, then?", next = "good" },
        { text = "Tell me about this bear.", next = "bear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bear = {
      lines = { { id = "br_default", text = "His hunter left him with me for a week and came back after a month, smelling of Darkshore and full of apologies. In the meantime the bear found the beekeepers' stores, and the beekeepers found me, and I paid for that honey for a season." } },
      choices = {
        { text = "Did the hunter ever pay you back?", next = "bear_paid" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bear_paid = {
      lines = { { id = "bp_default", text = "In apologies, at great length, and in coin, eventually. The bear paid me back better: he slept against the stable door every night and nothing came near it. I still miss him, if I'm honest, and I don't miss the hunter at all." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    good = {
      lines = { { id = "go_default", text = "One who thinks of the beast as a companion and not a weapon. You can tell the difference in the way they call them back; one sort calls, the other sort commands." } },
      choices = {
        { text = "A companion is an equal. I call mine.", next = "BACK", reply = "Then your beast is lucky, and you'll find it comes back gladly. That's how it should be.", fx = { align = { order = -1 } } },
        { text = "A beast needs a firm hand. I command.", next = "BACK", reply = "Then it will obey, and you'll never know what it might have given you freely. Think on that.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    war = {
      lines = { { id = "wa_default", text = "Badly. They hear the Warsong axes long before we do, and on bad nights the sabers pace all night long. I sing to them, which helps them more than it helps me." } },
      choices = {
        { text = "What do you sing to them?", next = "song" },
        { text = "Something else.", next = "BACK" },
      },
    },
    song = {
      lines = { { id = "so_default", text = "An old lullaby from Darnassus about the moon walking the forest to check that every creature is asleep. My mother sang it to me, and I sing it badly, but the sabers have never once complained about my voice, which is more than Kimlya can say." } },
      choices = {
        { text = "The Warsong's axes are the real trouble, though.", next = "axes" },
        { text = "Something else.", next = "BACK", fx = { learn = { "elune" } } },
      },
    },
    axes = {
      big = true,
      lines = { { id = "ax_default", text = "They are. Every tree they fell is a den gone, or a nest, and the beasts that lose their homes wander toward the lake and into the hunters' traps. Some at the Sentinels' table want to burn the lumber camps, and some want to wait for the Horde to tire of it." } },
      choices = {
        { text = "Burn the camps. The forest can't wait for them.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Fire only kills more beasts. Find another way.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "warsong" } } },
      },
    },
    island = {
      lines = { { id = "is_default", text = "Strange, but safe. The lake keeps the wolves of the Horde at a distance, and the only way in is over the bridges, which the Sentinels watch. A frightened beast sleeps better with water all around it, and so, I find, do I." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "ashenvale" } } } },
    },
    find = {
      lines = { { id = "fi_default", text = "Not by chasing the strongest thing in the forest, which is what young hunters always do. Watch a beast for a day before you call it, and see how it treats its own; the gentle ones make the best companions, and they're braver than they look." } },
      choices = {
        { text = "Any beast near Astranaar you'd recommend?", next = "find_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    find_where = {
      lines = { { id = "fw_default", text = "The ghostpaw wolves in the west are clever and loyal, and the sabers on the ridges are proud but true. Leave the bears near the furbolg camps alone, though; the sickness that took the Foulweald gets into everything that drinks near them." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "furbolgs" } } } },
    },
    wolves = {
      lines = { { id = "wo_default", text = "Hate them? No. A wolf doesn't choose its rider, any more than my sabers choose theirs, and I've seen Horde wolves loose in the forest that were as frightened as anything of ours. It's the riders I have opinions about, and I keep them to myself." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "The beasts of the forest, and the hunters who are kind to them, and the ones who aren't." } },
    warsong = { { id = "tp_warsong", text = "Every tree they fell sends something frightened toward my stables. I count the cost in sleepless sabers." } },
    _none = { { id = "tp_none", text = "I wouldn't know. Ask me about a beast instead; I know beasts." } },
  },
}
