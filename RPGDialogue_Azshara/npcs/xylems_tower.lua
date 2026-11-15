-- Xylem's tower on the cliffs at Bear's Head, and the servant who sends visitors up. Voice: bibles/azshara.md
local P = RPGDialogueAPI:Pack("rpgd.azshara")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "xylem", id = TODO_NPC("Archmage Xylem"), name = "Archmage Xylem",
  bible = "bibles/azshara.md", role = "scholar", tier = "major",
  communities = { "xylems_tower" }, temper = { "proud", "sharp" }, values = { "curious", "proud" },
  notices = { "class", "race", "arcane" },

  impression = {
    first = "Archmage Xylem lives in a tower no one can climb, surrounded by Highborne relics and his own opinions. He talks about a drake that ate his apprentice, and seems to mourn the shard more than the student.",
    third = "{name} met Archmage Xylem in his tower above the Highborne ruins of Azshara.",
  },

  greetings = {
    { id = "g_default", text = "Ah, a visitor who survived Sanath's manners. Come in, and do try not to touch anything that glows." },
    { id = "g_back", when = { metBefore = true }, text = "You again, {name}. Good; the last three visitors were disappointments." },
    { id = "g_morphaz", when = { questDone = TODO_QUEST("Destroy Morphaz") }, text = "My favourite drake-slayer! Sit, sit; the shard has been singing all week." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The ley lines are louder after dark. You'll forgive me if I listen to them and to you at once." },
  },

  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, and one who can find a tower on a cliff with no stairs. That's a better start than most of my students ever made." },
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "One of Ravenholdt's quiet friends, unless I miss my guess. Keep your hands where I can see them, and we'll get along famously." },
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Kaldorei! Your ancestors built every wonder on this coast, and your people let them crumble. I've never decided whether that was wisdom or waste." },
    { id = "n_skyborne", cat = "race", when = { all = { { race = "Skyborne" }, { faction = "Alliance" } } },
      text = "One of the High Order, here, in the shadow of Eldarath? Your ancestors would weep to see what's left of their libraries, and so do I, every morning." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Archmage Xylem, at your service, or rather, you at mine, if you're any use. I study what the Highborne left on this coast, which is a great deal, guarded by a great many things that would rather I didn't." },
        { id = "h_dust", when = { questActive = TODO_QUEST("Magic Dust") },
          text = "The elves on the northern cliffs grind their relics to a glittering dust, and they killed the apprentice I sent to buy some. We'll take it the other way, then; violence is only a less polite kind of trade." },
        { id = "h_coral", when = { questActive = TODO_QUEST("The Siren's Coral") },
          text = "The Spitelash sirens have stripped the bay of enchanted coral, and I need it more than they do. They cast rather well for fish-folk, so don't underestimate them." },
        { id = "h_morphaz", tags = { "news" }, when = { questActive = TODO_QUEST("Destroy Morphaz") },
          text = "Morphaz is waiting in the drowned temple of Atal'Hakkar, fat on my apprentice and my shard. Bring friends, {name}, because I'd hate to lose two students to the same stomach." },
        { id = "h_krellian", when = { questActive = TODO_QUEST("Warlord Krellian") },
          text = "Krellian hides in the Temple of Zin-Malor with a shell that fairly shouts with magic. My scrying never lies, though it does exaggerate sometimes, so hurry before somebody else hears it." },
        { id = "h_frag", when = { questActive = TODO_QUEST("Fragmented Magic") },
          text = "Polymorph the Spitelash with the shell close by and strike down the little copies before they fade. It sounds absurd, I know, and that's how you can tell it's real research." },
        { id = "h_bag", when = { questActive = TODO_QUEST("Encoded Fragments") },
          text = "My books on dispelling were stolen and torn up by savages, and Ravenholdt's bag won't open itself. Bring me the fragments; the beasts out there swallow everything, including literature." },
        { id = "h_tablet", when = { questActive = TODO_QUEST("Delivery to Archmage Xylem") },
          text = "Is that the Tablet of Sael'hai? I can feel it from here, like warmth from a hearth. Put it down gently, please, and tell me nothing about the orc who found it." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "{name}! Splendid. You're the only person in a hundred miles who listens to the end of my sentences, and I've saved several long ones for you." },
        { id = "h_cool", when = { disposition = { max = 34 } },
          text = "Oh, it's you. Say what you came to say; I'm in the middle of something that will explode if I leave it too long." },
      },
      again = {
        { id = "h_again", text = "What else? Quickly, please; a thought is cooling on my desk." },
        { id = "h_again2", text = "Go on. I can listen and calculate at the same time, which is more than Sanath can manage." },
        { id = "h_again3", when = { disposition = { min = 70 } }, text = "Ask me anything, {name}. Within reason, and the reason is mine." },
      },
      choices = {
        { text = "What do you study up here?", next = "study" },
        { text = "Who is Morphaz?", next = "morphaz" },
        { text = "What do you want with the naga?", next = "naga" },
        { text = "Where did you come from, Archmage?", next = "past" },
        { text = "Tell me about your apprentices.", next = "apprentices" },
        { text = "I've come to learn, Archmage.", next = "mage", when = { class = "MAGE" } },
        { text = "Lord Ravenholdt sends his regards.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Do you ever pray up here, Archmage?", next = "priest", when = { class = "PRIEST" } },
        { text = "Jediga sent me with the tablet.", next = "jediga", when = { questActive = TODO_QUEST("Delivery to Archmage Xylem") } },
        { text = "Good day, Archmage.", next = "END" },
      },
    },

    study = {
      big = true,
      lines = {
        { id = "st_default", fx = { learn = { "highborne", "eldarath" } },
          text = "The Highborne, of course. They were the finest arcanists this world has ever produced, and the worst-behaved, and they left their runes and tablets lying about Eldarath like a careless child leaves toys. Most of it's ruined, but what isn't is worth a lifetime." },
        { id = "st_nelf", when = { race = "NightElf" },
          text = "Your ancestors, my dear kaldorei, and don't look so sour about it. Their pride sank a continent, I know, but their notes are magnificent." },
      },
      choices = {
        { text = "Their magic broke the world.", next = "study_danger" },
        { text = "What have you found?", next = "study_found" },
        { text = "What do you really want with Highborne tablets?", tag = "Persuade", next = "tablet_why",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "MAGE" }, { questDone = TODO_QUEST("Destroy Morphaz") }, { all = { { race = "Skyborne" }, { faction = "Alliance" } } } } } },
          fail = { next = "tablet_fail", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    study_danger = {
      lines = { { id = "sd_default", text = "Their appetite broke the world, which is a different thing entirely. A knife cuts bread or throats, and nobody blames the knife; I simply intend to be a better cook than they were." } },
      choices = {
        { text = "Knowledge is worth the risk.", next = "BACK", fx = { affinity = 1, align = { order = -1 }, trait = { curious = 1 } } },
        { text = "Some doors should stay shut, Archmage.", next = "BACK", fx = { affinity = -1, align = { order = 1 }, trait = { cautious = 1 } } },
      },
    },
    study_found = {
      lines = { { id = "sf_default", text = "Runes on the old walls that explain how the Highborne kept their towers standing, a ward I still can't break, and four tablets named for their wizards that an enterprising orc keeps selling to everyone in Kalimdor. I bought one, naturally." } },
      choices = {
        { text = "The orc is Jediga, at Valormok.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tablet_why = {
      big = true,
      lines = {
        { id = "tw_default", text = "Very well, since you ask nicely. The Highborne wrote down how they bound the arcane into objects, and most of it is madness, but a little of it is sense. Enough sense, with the right shard, to forge magic the way a smith forges steel, and I mean to be that smith." },
      },
      choices = {
        { text = "That's an extraordinary ambition.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Then be careful what you forge.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
    tablet_fail = {
      lines = { { id = "tf_default", text = "I want to read it, which is what one does with writing. If you were hoping for a confession, try the priests in Stormwind; they're better at that sort of thing." } },
      choices = { { text = "Something else, then.", next = "BACK" } },
    },

    morphaz = {
      lines = {
        { id = "mo_default", fx = { learn = { "morphaz" } },
          text = "A green drake, and my oldest enemy. Years ago he caught us in the open, me and my best apprentice, and swallowed the boy whole, along with the finest arcane shard I've ever held." },
        { id = "mo_done", when = { questDone = TODO_QUEST("Destroy Morphaz") },
          text = "Was my oldest enemy, I should say, thanks to you. The shard grew fat on him over the years, and now my hands remember how to forge the arcane." },
      },
      choices = {
        { text = "You mourn the shard more than the apprentice.", next = "morphaz_cold" },
        { text = "Where is the drake now?", next = "morphaz_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    morphaz_cold = {
      lines = { { id = "mc_default", text = "I mourn them both; I simply talk about the shard, because the shard can be recovered and the boy can't. He was the best student I ever had, and the most irritating, and I still set out two cups some mornings out of habit." } },
      choices = {
        { text = "I'm sorry, Archmage.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Then avenge him, not the shard.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    morphaz_where = {
      lines = { { id = "mw_default", text = "Deep in the sunken temple of Atal'Hakkar, in the Swamp of Sorrows, where the trolls drowned their own god. He's in good company down there, and none of it's friendly." } },
      choices = {
        { text = "I'll find him.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    naga = {
      lines = {
        { id = "na_default", fx = { learn = { "spitelash" } },
          text = "The Spitelash have learned which of this coast's treasures are rare, which is inconvenient of them. They've stripped the bay of enchanted coral, and their warlord Krellian sits in the Temple of Zin-Malor on top of things I'd very much like to have." },
      },
      choices = {
        { text = "What are the naga, really?", next = "naga_what" },
        { text = "Why not take it yourself?", next = "naga_tower" },
        { text = "Something else.", next = "BACK" },
      },
    },
    naga_what = {
      lines = { { id = "nw_default", text = "Elves, once, if the old stories are right, and the sea made them into what you see. I'd love to study one, but they object so strenuously to being studied." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    naga_tower = {
      lines = { { id = "nt_default", text = "Because my work can't be left, and because young people with swords are plentiful while archmages are not. I pay well, I keep my bargains to the letter, and I never send anyone where I wouldn't go myself, given forty years less and a stronger back." } },
      choices = {
        { text = "That's honest, at least.", next = "BACK", fx = { affinity = 1 } },
        { text = "You'd rather risk my neck than yours.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },

    past = {
      lines = {
        { id = "pa_default", text = "Dalaran trained me, and the war took me west with the expedition to Kalimdor. I was in the Stonetalon Mountains when Hellscream's Warsong came down on our camp, and after that I decided I preferred my own company and a tower nobody could climb." },
      },
      choices = {
        { text = "You fought the Warsong?", next = "past_war" },
        { text = "Why Azshara, of all places?", next = "past_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_war = {
      lines = { { id = "pw_default", text = "I survived the Warsong, which is not the same as fighting them. They came out of the trees like a forest fire, and I learned that day that a spellbook is a poor shield and a long way off is a fine one." } },
      choices = {
        { text = "The Horde has changed since then.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_why = {
      lines = { { id = "py_default", text = "Because the Highborne lived here, and nobody else wants it. Ten thousand years of magic lying in the grass, and the only competition is naga, elves who should know better, and a blue dragon who thinks he owns the place." } },
      choices = {
        { text = "A blue dragon?", next = "past_dragon" },
        { text = "Something else.", next = "BACK" },
      },
    },
    past_dragon = {
      lines = { { id = "pdr_default", text = "Azuregos, he calls himself, and he roams the cliffs south of Eldarath guarding something he won't name. Every adventurer in Kalimdor tries to stick a sword in him, which hasn't improved his temper, and we are not on speaking terms." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },

    apprentices = {
      lines = {
        { id = "ap_default", text = "I have had a great many, and lost rather too many. Sanath below keeps the door and sends you up, and the others come and go, mostly go, sometimes in pieces." },
      },
      choices = {
        { text = "Sanath doesn't like visitors.", next = "apprentices_sanath" },
        { text = "Could I study with you?", next = "apprentices_me" },
        { text = "Something else.", next = "BACK" },
      },
    },
    apprentices_sanath = {
      lines = { { id = "as_default", text = "Sanath doesn't like anything, which makes him an excellent doorkeeper. He used to charge visitors a fee to come up, until I told him to stop; he still sulks about it, and I find it restful." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    apprentices_me = {
      lines = {
        { id = "am_default", text = "Bring me what I ask for, bring it back in one piece, and we'll see. I take anyone with talent and patience, and I keep the ones who survive." },
        { id = "am_mage", when = { class = "MAGE" }, text = "You're halfway there already, simply by being a mage who came all this way. Do the errands, and I'll teach you a trick or two that Dalaran never would." },
      },
      choices = {
        { text = "I'll prove myself.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    mage = {
      big = true,
      lines = { { id = "ma_default", text = "Then you've come to the right cliff. Prove your skill against the elves' dust and the sirens' coral, and then against something worthy of it, and I'll give you something no library in Stormwind has." } },
      choices = {
        { text = "Power is what I came for.", next = "BACK", fx = { affinity = 1, align = { light = -1 }, trait = { proud = 1 } } },
        { text = "I came for understanding, not power.", next = "BACK", fx = { affinity = 1, align = { light = 1 }, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Does he? How unlike him. Jorach and I have an understanding: he finds the things nobody can find, and I open the things nobody can open, and neither of us asks the other what's inside." } },
      choices = {
        { text = "A good arrangement.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    priest = {
      lines = { { id = "pr_default", text = "I calculate up here, which is like praying, except that the answers come back. No offence meant, {class}; I'm sure the Light does wonderful work for those who have the patience to wait for it." } },
      choices = {
        { text = "The Light answers. You just don't listen.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "I've wondered the same, some nights.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    jediga = {
      lines = { { id = "jd_default", text = "I've been waiting to study this for a very long time. Tell Jediga she's done well and that I'll pay what she asked; she seems to expect me to cheat her, which I find rather hurtful." } },
      choices = {
        { text = "She says you can't be trusted.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "I'll tell her.", next = "BACK", fx = { affinity = 1 } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know a great deal about nearly everything, and everything about a few things. Choose carefully, or we'll be here until supper." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "For you, {name}, I'll even explain the hard parts. Pick a subject." },
    },
    background = { { id = "tp_bg", text = "Dalaran's son, the war's leftover, and Azshara's only resident archmage. I like it that way.", next = "past" } },
    advice = { { id = "tp_ad", text = "Never read a Highborne rune aloud until you know what it says. I lost a perfectly good set of eyebrows learning that." } },
    highborne = { { id = "tp_hb", text = "Geniuses and fools in equal measure, which is the usual proportion for geniuses.", next = "study" } },
    eldarath = { { id = "tp_eld", text = "The richest ruin in Kalimdor, and the naga know it. I'd move in tomorrow if they'd move out." } },
    morphaz = { { id = "tp_morph", text = "A green drake with my apprentice and my shard in his belly. You can guess my opinion of him.", next = "morphaz" } },
    spitelash = { { id = "tp_spite", text = "Naga with taste, which is the worst kind. They've learned what's valuable on this coast.", next = "naga" } },
    xylem = { { id = "tp_self", text = "Ah, the subject I know best. I'm brilliant, impatient and right more often than is fair; ask anyone." } },
    rimtori = { { id = "tp_rimtori", text = "Thalassian scavengers with good instincts and bad manners. They killed my apprentice over a sack of dust." } },
    _none = { { id = "tp_none", text = "Not my field, and I don't waste time outside my field. Try someone with less to do." } },
  },
}

P:NPC {
  key = "sanath", id = TODO_NPC("Sanath Lim-yo"), name = "Sanath Lim-yo",
  bible = "bibles/azshara.md", role = "questgiver", tier = "quest",
  communities = { "xylems_tower" }, temper = { "proud", "sharp" }, values = { "proud", "dutiful" },
  notices = { "race", "class", "kit" },

  impression = {
    first = "Sanath Lim-yo guards the way up to Xylem's tower and hates every minute of it. He insulted my clothes, my face and my reasons for coming, and then got bored of insulting me.",
    third = "{name} met Sanath Lim-yo, who sends visitors up to Archmage Xylem's tower and despises each of them.",
  },

  greetings = {
    { id = "g_default", text = "Another pilgrim to my master's door. How dreary." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and in the same dreadful clothes. Remarkable." },
  },

  notice = {
    { id = "n_elf", cat = "race", when = { race = { "NightElf", "Skyborne" } },
      text = "An elf, of a sort. I'd say we were cousins, but I have standards about family." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage, here to grovel for lessons. My master will love you; he adores an audience." },
    { id = "n_kit", cat = "kit", when = { nearlyNaked = true },
      text = "You've come to see the Archmage dressed like that? Bold. Foolish, but bold." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Sanath Lim-yo, servant of Archmage Xylem. My master's tower stands above us, and there are no stairs, so you will need me to send you up, which I am obliged to do for anyone at all now, more's the pity." },
        { id = "h_magecraft", when = { questActive = TODO_QUEST("Magecraft") },
          text = "Ah, the Archmage asked for someone with your experience, did he? He's expecting you, though I can't imagine why." },
      },
      again = {
        { id = "h_again", text = "Still here? What else, then?" },
        { id = "h_again2", text = "Go on. Bore me a little more; I'm almost asleep." },
      },
      choices = {
        { text = "Send me up to your master.", next = "up" },
        { text = "You used to charge for this?", next = "toll" },
        { text = "What is your master like?", next = "master" },
        { text = "Where are you from, Sanath?", next = "home" },
        { text = "You're a long way from Quel'Thalas.", next = "home", when = { race = "Skyborne" } },
        { text = "I'll leave you to your sulking.", next = "END" },
      },
    },
    up = {
      lines = { { id = "u_default", text = "Very well, since I must. Try not to scream on the way; the last one did, and the Archmage made me clean the floor." } },
      choices = {
        { text = "Do it, then.", next = "BUSINESS" },
        { text = "On second thought, something else.", next = "BACK" },
      },
    },
    toll = {
      lines = { { id = "t_default", text = "Once, I could ask whatever I liked of the people who wanted to see him. Now my master takes in any stray who asks, and I am reduced to sneering at their boots for entertainment." } },
      choices = {
        { text = "What did you used to ask?", next = "toll_price" },
        { text = "Something else.", next = "BACK" },
      },
    },
    toll_price = {
      lines = { { id = "tp2_default", text = "Hippogryph feathers, undamaged ones, which is harder than it sounds when the birds object. I counted them every night, and now I count the days since anyone paid me, which is a much sadder number." } },
      choices = {
        { text = "That's petty, Sanath.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "A toll's a toll. You were cheated.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
      },
    },
    master = {
      lines = { { id = "m_default", fx = { learn = { "xylem" } },
        text = "Brilliant, impatient and entirely beyond your understanding. I do not question his orders, and I advise you not to question them either, especially to his face." } },
      choices = {
        { text = "You're very loyal to him.", next = "master_loyal" },
        { text = "Is he dangerous?", next = "master_danger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    master_loyal = {
      lines = { { id = "ml_default", text = "I'm useful to him, and he's the only person on this coast worth being useful to. That is loyalty enough for an elf with any sense." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    master_danger = {
      lines = { { id = "md_default", text = "To the naga, to the drake that ate his student, and to anyone who touches his books. To you, only if you're very stupid, so I'd say your odds are poor." } },
      choices = {
        { text = "Charming as ever.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    home = {
      lines = { { id = "ho_default", text = "Quel'Thalas, before the dead walked through it. I don't speak of it to strangers, and everyone is a stranger." } },
      choices = {
        { text = "I'm sorry for what happened there.", next = "home_sorry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    home_sorry = {
      lines = { { id = "hs_default", text = "Your sorrow is noted and of no use to me. Still, it's the first polite thing anyone's said at this camp in a month, so I'll insult your hat a little less." } },
      choices = { { text = "That's something.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I serve the Archmage. Before that, I was somewhere better. Neither is your concern.", next = "home" } },
    advice = { { id = "tp_ad", text = "Dress better before you meet the Archmage. He notices, and then I have to hear about it." } },
    xylem = { { id = "tp_xylem", text = "My master. Go up and see for yourself, and stop asking me about him.", next = "master" } },
    rimtori = { { id = "tp_rimtori", text = "Thalassians who've forgotten their manners along with their homes. I am not one of them, before you ask." } },
    _none = { { id = "tp_none", text = "How tedious. I neither know nor care." } },
  },
}
