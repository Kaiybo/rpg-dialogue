-- Duke Nicholas Zverenhoff, outside Light's Hope Chapel. Voice: bibles/zverenhoff.md
-- A nobleman and linguist of the Argent Dawn: urbane, measured, and allergic to every kind of extreme.
local P = RPGDialogueAPI:Pack("rpgd.easternplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "zverenhoff", id = TODO_NPC("Duke Nicholas Zverenhoff"), name = "Duke Nicholas Zverenhoff",
  bible = "bibles/zverenhoff.md", role = "noble", tier = "quest",
  communities = { "light_hope", "argent_dawn" }, temper = { "warm", "dry" }, values = { "curious", "dutiful" },
  prejudice = { race = "Scourge", amount = 8, why = "Lost family to the plague; knows the Forsaken aren't Scourge, but his skin hasn't caught up." },
  notices = { "lore", "reputation" },
  impression = {
    first = "Duke Nicholas Zverenhoff talks about the Scourge, the Scarlet Crusade and a nonsensical book on spirit-speaking with the same patient interest. He is a scholar first and a duke second, and he distrusts anyone who is too sure of anything.",
    third = "{name} met Duke Nicholas Zverenhoff, a linguist and one of the Argent Dawn's respected leaders at Light's Hope Chapel.",
  },

  greetings = {
    { id = "g_prej1", when = { prejudiced = true }, text = "Ah, good day to you. Forgive me if I look twice; the Dawn welcomes the Forsaken and so do I, but my eyes were taught in Stratholme, and they're slower to learn than I am." },
    { id = "g_prej2", when = { prejudiced = true }, text = "One of the Banshee Queen's people, at Light's Hope. Do sit down. I'll only flinch a little, and I'll be ashamed of it afterward." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "Welcome back, my friend. I realised this morning that I no longer look twice when you come in, and I took the trouble to be glad about it." },
    { id = "g_greet", text = "Ah, good day to you. I am Duke Nicholas Zverenhoff, and you've caught me between translations." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back to Light's Hope. I trust your pockets are full of scourgestones and your head is full of questions." },
    { id = "g_archive", when = { questActive = TODO_QUEST("The Archivist") }, text = "Galford and his archive, in Stratholme. Burn it all, and try not to read anything first; zealotry is catching." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and I've deciphered precisely two more pages of that dreadful book in the meantime. Your news is bound to be better." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've become a good deal more formidable since we first spoke. The Dawn notices these things, and so do I." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "Word is you talked someone round here at the chapel. Well done; I've changed more minds with talk than with a mace, and buried fewer of them." },
  },

  notice = {
    { id = "n_lore", cat = "lore", when = { profession = "Enchanting" },
      text = "An enchanter! Then you'll know runes are only a language that answers back. I've long wanted to compare notes with someone who writes in it." },
    { id = "n_rep", cat = "reputation", when = { reputation = { faction = "Argent Dawn", min = "honored" } },
      text = "The quartermasters speak well of you, and the Dawn's ledgers more so. You're well on your way to being one of us, if you aren't already." },
  },

  start = "hello",
  nodes = {
    prej = {
      lines = { { id = "prej_default", text = "I do, and I'm sorry for it. I lost a brother and two cousins in Stratholme, and the last time I saw them they were walking, so when one of your people walks into the chapel, my heart sees them before my head can argue." } },
      choices = {
        { text = "I'm not your brother, and I'm not the Lich King's.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Some Forsaken would deserve that look. Keep it handy.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Your head will win the argument. Give it time.", next = "prej_ok", fx = { affinity = 1 } },
        { text = "Have you looked for them among the Forsaken?", next = "prej_why" },
        { text = "Something else, Duke.", next = "BACK" },
      },
    },
    prej_why = {
      lines = { { id = "prejwhy_default", text = "Once, in the Undercity, with a translator and a borrowed tabard. I found no one I knew, and I was glad and sorry at once, which is a thing I hadn't known a man could be." } },
      choices = {
        { text = "Maybe they found rest. That's a mercy.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Maybe they're still out there, in the Plaguelands.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Duke.", next = "BACK" },
      },
    },
    prej_ok = {
      lines = { { id = "prejok_default", text = "You're kinder to me than I deserve. Come, sit, and tell me something that has nothing to do with the dead." } },
      choices = {
        { text = "Something else, Duke.", next = "BACK" },
      },
    },
    op_scarlet_crusade = {
      big = true,
      lines = {
        { id = "opsc_default", text = "I have colleagues who think the Crusade can be reasoned with, given time and the right letters, and colleagues who think it ought to be broken like any other enemy. Which are you, friend?" },
      },
      choices = {
        { text = "Reason with them. Most are only frightened men.", next = "op_scarlet_crusade_r1", fx = { align = { light = 1 }, opinion = { scarlet_crusade = "mercy" } } },
        { text = "Break them. They've murdered too many refugees.", next = "op_scarlet_crusade_r2", fx = { align = { light = -1 }, trait = { stern = 1 }, opinion = { scarlet_crusade = "hardline" } } },
        { text = "They burn my kind on sight. I'm unpersuaded, Duke.", next = "op_scarlet_crusade_r3", fx = { opinion = { scarlet_crusade = "hate" } }, when = { race = "Scourge" } },
        { text = "I'll leave the Crusade to the Dawn, Duke.", next = "BACK" },
      },
    },
    op_scarlet_crusade_r1 = {
      lines = { { id = "opsc_r1", text = "That's my hope as well, and I keep writing my letters. They're rarely answered, but now and then a squire slips away from Hearthglen and comes to us." } },
      choices = { { text = "Something else, Duke.", next = "BACK" } },
    },
    op_scarlet_crusade_r2 = {
      lines = { { id = "opsc_r2", text = "I can't argue with the graves, and I won't try. Bring proof of what you do to them, though, so the Dawn knows where the line was crossed." } },
      choices = { { text = "Something else, Duke.", next = "BACK" } },
    },
    op_scarlet_crusade_r3 = {
      lines = { { id = "opsc_r3", text = "I'd be unpersuaded too, in your place. The Dawn won't ask you to love them, only to remember that some of them might still be saved." } },
      choices = { { text = "Something else, Duke.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Duke Nicholas Zverenhoff of the Argent Dawn. I help Lord Tyrosus keep this chapel standing, and I'm the one who pays out valor tokens when people bring us scourgestones as proof of what they've slain." },
        { id = "h_book", tags = { "news" }, when = { questRecent = { TODO_QUEST("Duke Nicholas Zverenhoff"), days = 3 } },
          text = "Studies in Spirit Speaking, by Umbranse. I'd hoped it would be illuminating, but so far it's a great many pages that say \"Ooooooo\", and I'm not yet sure who thinks that up." },
        { id = "h_stones", when = { questDone = TODO_QUEST("Minion's Scourgestones") },
          text = "Another handful of scourgestones? Splendid. Each one is a soldier of the Scourge who won't walk again, and the Dawn is glad to trade a token for that." },
        { id = "h_truth", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Truth Comes Crashing Down"), days = 7 } },
          text = "The Grand Crusader, a dreadlord? And brother to the one who stands beside the Banshee Queen? I've read a great many strange things in my life, but nothing stranger than the head you've brought me." },
        { id = "h_tyrosus", when = { questActive = TODO_QUEST("Lord Maxwell Tyrosus") },
          text = "Lord Maxwell is inside the chapel and expecting you. It's been years since he granted an outsider an audience, so do try to look suitably honored." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "Welcome, friend of the Horde. The Dawn has no quarrel with any banner that stands against the Scourge, though I know some of my colleagues still need reminding." },
      },
      again = {
        { id = "h_again", text = "Something further? I'm in no hurry; the book certainly isn't going anywhere." },
        { id = "h_again2", text = "Go on. I enjoy a conversation in a language I already speak." },
      },
      choices = {
        { text = "What are scourgestones?", next = "stones" },
        { text = "You don't seem to think much of the Scarlet Crusade.", next = "crusade" },
        { text = "I hear you're a linguist.", next = "linguist" },
        { text = "What is Lord Tyrosus like?", next = "tyrosus" },
        { text = "Do your colleagues truly accept the Horde here?", next = "horde", when = { faction = "Horde" } },
        { text = "Can a scholar read anything useful in Scourge runes?", next = "runes", when = { class = { "MAGE", "WARLOCK" } } },
        { text = "What did the Balnazzar business mean for the Crusade?", next = "balnazzar", when = { questDone = TODO_QUEST("The Truth Comes Crashing Down") } },
        { text = "I study the Light, Duke. Does the Dawn need priests?", next = "priest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "I'm here to trade.", next = "BUSINESS" },
        { text = "You look at me as if I were Scourge, Duke.", next = "prej", when = { prejudiced = true } },
        { text = "Good day, Duke.", next = "END" },
      },
    },

    stones = {
      lines = { { id = "st_default", text = "The insignia of the Scourge's ranks, carried by their soldiers from the lowliest minion to the corruptors who lead them. Bring us enough, and the Dawn will give you a valor token for them." },
        { id = "st_rep", when = { reputation = { faction = "Argent Dawn", min = "revered" } }, text = "You know very well what they are, having brought us a sackful yourself. Each one is a Scourge soldier the Plaguelands won't see again." } },
      choices = {
        { text = "What are the tokens good for?", next = "stones_token" },
        { text = "Something else, Duke.", next = "BACK", fx = { learn = { "argent_dawn" } } },
      },
    },
    stones_token = {
      lines = { { id = "stt_default", text = "Two things. They raise your standing with the Dawn, which opens doors that stay shut to strangers, and the quartermasters will accept them, with coin, for some of our better gear." } },
      choices = {
        { text = "And what does the Dawn do with the stones?", next = "stones_use" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stones_use = {
      lines = { { id = "su_default", text = "Study them, purify them, and make very sure nobody carries them home as a keepsake. They're the Scourge's hand on its soldiers, and I want that hand empty." } },
      choices = {
        { text = "I'll keep bringing them.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    crusade = {
      lines = { { id = "cr_default", text = "Anything taken to an extreme is a hazard to the world, and the Crusade is zealotry taken as far as it will go. How many innocents have they burned in the name of the Light, and how many of them could have stood with us?" } },
      choices = {
        { text = "They fight the Scourge, though.", next = "crusade_fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crusade_fight = {
      big = true,
      lines = { { id = "cf_default", text = "They do, and bravely; I'll give them that much. But a sword that cuts the Scourge and the farmer behind it is not a weapon I'd want in the Dawn's hands, however sharp it is." } },
      choices = {
        { text = "Then the Crusade has to be stopped too.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "We need every sword. Work with them where we can.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Can the Crusade be brought back to its senses?", next = "op_scarlet_crusade" },
        { text = "Something else.", next = "BACK" },
      },
    },

    linguist = {
      lines = { { id = "li_default", text = "Guilty, I'm afraid. I read most of the tongues of the Eastern Kingdoms, a little Thalassian, and an embarrassing amount of Dwarven, and now I'm trying to read a man who writes in moans." } },
      choices = {
        { text = "Who writes in moans?", next = "linguist_book" },
        { text = "Something else.", next = "BACK" },
      },
    },
    linguist_book = {
      lines = { { id = "lb_default", text = "Umbranse's masterpiece, so called. It may be nonsense, or it may be the only honest account of how the dead speak, and the trouble is that both would look much the same on the page." } },
      choices = {
        { text = "Tell me which, when you decide.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    balnazzar = {
      lines = { { id = "ba_default", text = "That the Crusade may have been steered by a demon for longer than any of them knows. Many of them are simply frightened men who wanted to save their homes, and somebody very old and very cruel made good use of that." } },
      choices = {
        { text = "Will they believe it, if they're told?", next = "balnazzar_believe", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    balnazzar_believe = {
      big = true,
      lines = { { id = "bb_default", text = "Some will, and those are the ones worth saving, if the Crusade's ranks break. The rest will call it a lie of the Dawn's and burn the messenger. Should we reach out to the ones who doubt, do you think, or simply let the Crusade rot?" } },
      choices = {
        { text = "Reach out. Frightened men can still be redeemed.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let it rot. They chose their masters.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    tyrosus = {
      lines = { { id = "ty_default", text = "A good man who has carried the Dawn for longer than any one man ought to. He left the Silver Hand when it became the Crusade, and he's never stopped grieving the difference, though he'd never say so." } },
      choices = {
        { text = "They say he refuses visitors.", next = "tyrosus_recluse" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tyrosus_recluse = {
      lines = { { id = "tr_default", text = "He refuses idle ones, and the Plaguelands breed a great many idle questions. I take the visitors and the letters, he takes the decisions, and between the two of us the chapel holds." } },
      choices = {
        { text = "You're the face, and he's the will?", next = "tyrosus_face" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tyrosus_face = {
      lines = { { id = "tf_default", text = "Something like that, though I'd put it more kindly to his face. A leader who listens to everyone hears nothing, and he's chosen to listen to very few, me among them, Light help him." } },
      choices = {
        { text = "He chose well, I think.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    horde = {
      lines = { { id = "ho_default", text = "Most do, and the rest are learning, slowly, the way old soldiers learn anything. There's a knight inside who still lowers his voice when an orc walks past, and I've asked him to stop, twice." } },
      choices = {
        { text = "And you? You don't mind us?", next = "horde_you" },
        { text = "Something else.", next = "BACK" },
      },
    },
    horde_you = {
      big = true,
      lines = { { id = "hy_default", text = "I've read your histories, which few of my peers ever bothered to do, and I find the Horde no more alarming than Lordaeron's own nobility. Tell me plainly, though: do you trust us?" } },
      choices = {
        { text = "I trust anyone who bleeds against the Scourge.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "No. I'll use the Dawn while it serves my people.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    runes = {
      lines = { { id = "ru_default", text = "Rather too much, and not comfortably. The Cult writes its necromancy the way clerks write ledgers, neat and joyless, and that frightens me more than any ranting would." } },
      choices = {
        { text = "Why does neatness frighten you?", next = "runes_neat" },
        { text = "Something else.", next = "BACK" },
      },
    },
    runes_neat = {
      lines = { { id = "rn_default", text = "Because madmen burn out, {class}, and clerks don't. Whoever taught the Cult to raise the dead taught them to keep accounts of it, and that's a patience the living rarely match." } },
      choices = {
        { text = "Then we'll have to be more patient still.", next = "BACK", fx = { affinity = 1, trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    priest = {
      lines = { { id = "pr_default", text = "We need everyone, but healers most of all, for the Plaguelands wound in ways a bandage won't mend. Speak to Leonid; he'll find you work, and he'll pray with you afterward whether you ask him to or not." } },
      choices = {
        { text = "I'll find him.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A duke by birth and a linguist by inclination. The Plaguelands care for neither title, so I mostly answer to Nicholas." } },
    advice = { { id = "tp_ad", text = "Distrust anyone who's entirely certain, including me, especially before breakfast." } },
    argent_dawn = { { id = "tp_argent", text = "Those who'll stand against the Scourge with anyone else who will, whatever their banner. It's a simple idea, and you'd be amazed how many people find it difficult." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "Brave, blind and dangerous. I'd pity them more if they burned fewer villages." } },
    scourge = { { id = "tp_scourge", text = "The Scourge is a subject of great interest to me, though not of great affection. I study it so that others may fight it better." } },
    kelthuzad = { { id = "tp_kelthuzad", text = "Kel'Thuzad was a scholar once, like me, and he chose a very different path. I find it instructive, and a little frightening." } },
    holy_light = { { id = "tp_holy_light", text = "The Light is a mystery I've spent my life studying, and I'm no closer to understanding it. I distrust anyone who claims they are." } },
    lordaeron = { { id = "tp_lordaeron", text = "Lordaeron's nobility mostly fled or died, and I'm one of the few who stayed. I'd rather be useful than safe." } },
    stratholme = { { id = "tp_stratholme", text = "Stratholme holds secrets I'd dearly love to study, and Scourge I'd dearly love to avoid. The Dawn will take it eventually, and I'll be there with my notebook." } },
    _none = { { id = "tp_none", text = "I've read widely, but not about that. Try the quartermaster; she hears what the soldiers say." } },
  },
}
