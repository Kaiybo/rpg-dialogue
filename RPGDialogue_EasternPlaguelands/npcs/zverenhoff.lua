-- Duke Nicholas Zverenhoff, outside Light's Hope Chapel. Voice: bibles/zverenhoff.md
-- A nobleman and linguist of the Argent Dawn: urbane, measured, and allergic to every kind of extreme.
local P = RPGDialogueAPI:Pack("rpgd.easternplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "zverenhoff", id = TODO_NPC("Duke Nicholas Zverenhoff"), name = "Duke Nicholas Zverenhoff",
  bible = "bibles/zverenhoff.md", role = "noble", tier = "quest",
  communities = { "light_hope", "argent_dawn" }, temper = { "warm", "dry" }, values = { "curious", "dutiful" },
  notices = { "lore", "reputation" },
  impression = {
    first = "Duke Nicholas Zverenhoff talks about the Scourge, the Scarlet Crusade and a nonsensical book on spirit-speaking with the same patient interest. He is a scholar first and a duke second, and he distrusts anyone who is too sure of anything.",
    third = "{name} met Duke Nicholas Zverenhoff, a linguist and one of the Argent Dawn's respected leaders at Light's Hope Chapel.",
  },

  greetings = {
    { id = "g_greet", text = "Ah, good day to you. I am Duke Nicholas Zverenhoff, and you've caught me between translations." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back to Light's Hope. I trust your pockets are full of scourgestones and your head is full of questions." },
    { id = "g_archive", when = { questActive = TODO_QUEST("The Archivist") }, text = "Galford and his archive, in Stratholme. Burn it all, and try not to read anything first; zealotry is catching." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and I've deciphered precisely two more pages of that dreadful book in the meantime. Your news is bound to be better." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've become a good deal more formidable since we first spoke. The Dawn notices these things, and so do I." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "Word is you talked someone round here at the chapel. Well done; a mind changed is worth more than a skull split, in my experience." },
  },

  notice = {
    { id = "n_lore", cat = "lore", when = { profession = "Enchanting" },
      text = "An enchanter! Then you'll know runes are only a language that answers back. I've long wanted to compare notes with someone who writes in it." },
    { id = "n_rep", cat = "reputation", when = { reputation = { faction = "Argent Dawn", min = "honored" } },
      text = "The quartermasters speak well of you, and the Dawn's ledgers more so. You're well on your way to being one of us, if you aren't already." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Duke Nicholas Zverenhoff of the Argent Dawn. I help Lord Tyrosus keep this chapel standing, and I'm the one who pays out valor tokens when people bring us proof of what they've slain." },
        { id = "h_book", tags = { "news" }, when = { questRecent = { TODO_QUEST("Duke Nicholas Zverenhoff"), days = 3 } },
          text = "Studies in Spirit Speaking, by Umbranse. I'd like to tell you that \"special\" means illuminating, but so far it means a great many pages that say \"Ooooooo\", and I'm not yet sure who thinks that up." },
        { id = "h_stones", when = { questDone = TODO_QUEST("Minion's Scourgestones") },
          text = "Another handful of scourgestones? Splendid. Each one is a soldier of the Scourge who won't walk again, and the Dawn is glad to trade a token for that." },
        { id = "h_truth", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Truth Comes Crashing Down"), days = 7 } },
          text = "The Grand Crusader, a dreadlord? And brother to the one who stands beside the Banshee Queen? I've read a great many strange things in my life, but none stranger than this head." },
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
        { text = "What do you make of the Scarlet Crusade?", next = "crusade" },
        { text = "You're a linguist?", next = "linguist" },
        { text = "What did the Balnazzar business mean for the Crusade?", next = "balnazzar", when = { questDone = TODO_QUEST("The Truth Comes Crashing Down") } },
        { text = "I study the Light, Duke. Does the Dawn need priests?", next = "priest", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "I'm here to trade.", next = "BUSINESS" },
        { text = "Good day, Duke.", next = "END" },
      },
    },

    stones = {
      lines = { { id = "st_default", text = "The insignia of the Scourge's ranks, carried by their soldiers from the lowliest minion to the corruptors who lead them. Bring us enough, and the Dawn will give you a valor token for them." },
        { id = "st_rep", when = { reputation = { faction = "Argent Dawn", min = "revered" } }, text = "You know very well what they are, having brought us more than most. Each one is a Scourge soldier the Plaguelands won't see again." } },
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
      lines = { { id = "su_default", text = "Study them, purify them, and make very sure nobody carries them home as a keepsake. They're the Scourge's hand on its soldiers, and I'd rather that hand were empty." } },
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
      lines = { { id = "cf_default", text = "They do, and bravely, and I won't pretend otherwise. But a sword that cuts the Scourge and the farmer behind it is not a weapon I'd want in the Dawn's hands, however sharp it is." } },
      choices = {
        { text = "Then the Crusade has to be stopped too.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "We need every sword. Work with them where we can.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    linguist = {
      lines = { { id = "li_default", text = "Guilty, I'm afraid. I read most of the tongues of the Eastern Kingdoms, a little Thalassian, and an embarrassing amount of Dwarven, and now I'm trying to read a man who writes in moans." } },
      choices = {
        { text = "The book on spirit-speaking?", next = "linguist_book" },
        { text = "Something else.", next = "BACK" },
      },
    },
    linguist_book = {
      lines = { { id = "lb_default", text = "Umbranse's masterpiece, so called. It may be nonsense, or it may be the only honest account of how the dead speak, and the trouble is that both would look much the same on the page." } },
      choices = {
        { text = "Which do you think it is?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    balnazzar = {
      lines = { { id = "ba_default", text = "That the Crusade may have been steered by a demon for longer than any of them knows. Many of them are simply frightened men who wanted to save their homes, and somebody very old and very cruel made good use of that." } },
      choices = {
        { text = "Will they believe it, if they're told?", next = "BACK", fx = { trait = { skeptical = 1 } } },
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
    _none = { { id = "tp_none", text = "I've read a great deal, but not about that. Try the quartermaster; she hears what the soldiers say." } },
  },
}
