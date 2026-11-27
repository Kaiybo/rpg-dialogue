-- Azshara folk an earlier pass missed, both at Bear's Head under Archmage Xylem's tower: Coral Moongale, a
-- night elf who keeps her own watch there, and Nyrill, one of the archmage's apprentices. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.azshara")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Coral Moongale: night elf at Bear's Head.
P:NPC {
  key = "coral_moongale", id = TODO_NPC("Coral Moongale"), name = "Coral Moongale", gender = "female",
  bible = "bibles/missed.md", role = "citizen", tier = "service",
  communities = { "xylems_tower" }, temper = { "calm", "watchful" }, values = { "careful", "curious" },
  notices = { "arcane" },
  impression = {
    first = "Coral Moongale is a night elf who keeps to the cliffs of Bear's Head, within sight of the archmage's tower and well outside its door. She watches it the way a sentinel watches a campfire in dry grass.",
    third = "{name} met Coral Moongale, a night elf keeping her own watch at Bear's Head in Azshara.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Ishnu-alah, friend. Sit with me a while; the archmage can wait, and it is good to see a face I trust." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "You want the archmage. His servant is below. That is all I can help you with." },
    { id = "g_default", text = "Ishnu-alah, {class}. If you have come for the archmage, his servant is below and his tower is above, and I belong to neither." },
    { id = "g_back", when = { metBefore = true }, text = "You are back on the cliff. Did the archmage have any use for you, or you for him?" },
  },
  notice = {
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "The arcane hangs on you like woodsmoke, mage. You will find much to admire in that tower, and I ask only that you remember what this coast was before your art sank it." },
    { id = "n_horde", cat = "race", when = { faction = "Horde" },
      text = "I am no friend to the Horde, though I did not come to Azshara to spill blood. Go about your business with the archmage, and we need not test each other." },
  },
  start = "hello",
  nodes = {
    ylife = {
      lines = { { id = "ylife_x", text = "A Sentinel of Astranaar, under Shandris Feathermoon's command for a time. I fought the Warsong orcs in the forest. When word came of a human mage digging in Azshara, I asked to be the one who watched him. My captain did not refuse." } },
      choices = {
        { text = "Shandris Feathermoon commands well, and the Sentinels are better for it.", next = "BACK", reply = "She does. I served under her, and I would again, if she asked.", fx = { align = { order = 1 } } },
        { text = "The Sentinels should answer to no one but themselves.", next = "BACK", reply = "Then they would be bandits with bows. Go and find the archmage.", fx = { align = { order = -1 } } },
        { text = "You chose this post yourself?", next = "ychose" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ychose = {
      lines = { { id = "ychose_x", text = "I did. My mother's mother was Highborne, though she renounced it. I carry that in my blood. Is it right to watch a stranger for the sins of my own ancestors?" } },
      choices = {
        { text = "Yes. Those who know the danger must guard against it.", next = "BACK", reply = "Then I will keep watching, and I will keep my grandmother's shame to myself.", fx = { align = { order = 1 } } },
        { text = "No. He's not your grandmother. Give him a chance.", next = "BACK", reply = "Perhaps. I will try to see him, and not the past.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywoke = {
      lines = { { id = "ywoke_x", text = "Then I would go up the tower stairs with my glaive, whatever Sanath said. I have told Nyrill as much. He did not seem surprised. I think he has wondered the same." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ynaga = {
      lines = { { id = "ynaga_x", text = "From the cliff, yes. They were our kin once, the Queen's own court. When I see them coil in the shallows, I remember that the sea was not a punishment to them. It was a gift they chose." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Coral Moongale. A human archmage has raised a tower on kaldorei ruins and fills it with Highborne relics, and I thought that someone of my people ought to be near enough to see what he does with them." },
        { id = "yh_mage", when = { class = "MAGE" }, text = "A mage, on the cliff below the tower. You will forgive me if I watch your hands. I am Coral Moongale, and I watch everyone's hands near Xylem's door." },
      },
      again = {
        { id = "h_again", text = "What more would you ask? I can watch that tower and talk at once." },
        { id = "h_again2", text = "Speak. The tower will keep while we talk." },
      },
      choices = {
        { text = "Do you think Xylem is dangerous?", next = "danger" },
        { text = "What was this coast, before?", next = "coast" },
        { text = "Why not go up and ask him yourself?", next = "ask" },
        { text = "Who were you before you came here?", next = "ylife" },
        { text = "What would you do if Xylem woke something?", next = "ywoke" },
        { text = "Do you watch the naga too?", next = "ynaga" },
        { text = "What does the tower look like at night?", next = "w_night" },
        { text = "Keep your watch well.", next = "END" },
      },
    },
    danger = {
      lines = { { id = "d_default", text = "I think he is curious, and that in a mage the two are seldom far apart. He has done no harm that I have seen, and I will say in fairness that he speaks of the old magic with more caution than the Highborne ever did." } },
      choices = {
        { text = "Then why keep watching?", next = "why" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Because the Highborne were cautious too, at the beginning. My people learned what follows from ten thousand years of mourning it, and so we watch even those who mean well." } },
      choices = { { text = "Another matter.", next = "BACK" } },
    },
    coast = {
      lines = { { id = "c_default", text = "The shining edge of an empire, named for the queen who ruled it. The towers of Eldarath stood where the naga crawl now, and when the Well of Eternity broke, the sea took all of it in a single night." } },
      choices = { { text = "Another matter.", next = "BACK" } },
    },
    ask = {
      lines = { { id = "a_default", text = "I have spoken with his apprentices, which tells me more than he would. Nyrill is honest and a little frightened of his master, and when a student like that stops being frightened, I shall know it is time to climb." } },
      choices = { { text = "Another matter.", next = "BACK" } },
    },
    w_night = {
      lines = {
        { id = "w_night_default", text = "Beautiful, which is what troubles me. The windows glow violet and blue, and sometimes a light moves from room to room as though something is walking. On the worst nights the whole top floor goes white, like a star, and then nothing, and then the birds go quiet." },
      },
      choices = {
        { text = "Have you told anyone?", next = "w_night2" },
        { text = "A star in the tower.", next = "w_night2" },
      },
    },
    w_night2 = {
      lines = {
        { id = "w_night2_default", text = "I've written to the Sentinels at Talrendis Point. They send back thanks and nothing more. I think they believe a human archmage is a human problem. My grandmother's grandmother believed the same of a certain queen's palace, once." },
        { id = "w_night2_w1", when = { class = "MAGE" }, text = "You know the arcane. Tell me honestly, when a tower glows white like that, what is being done inside it? I want an answer from someone who knows." },
      },
      choices = {
        { text = "Keep watching. Someone must.", next = "BACK", fx = { align = { order = 1 } }, reply = "I will, until there's nothing left to watch, or no one left to watch it." },
        { text = "It's Xylem's tower, not yours.", next = "BACK", fx = { align = { order = -1 } }, reply = "It was ours before it was his. That's rather the point." },
        { text = "Something else, Coral.", next = "BACK" },
      },
    },
  },
  topics = {
    astranaar = { { id = "ytp_ast", text = "Astranaar is my home, and Ashenvale my forest. I will return when the archmage gives me reason to." } },
    naga = { { id = "ytp_naga", text = "The naga were Highborne once. They chose the sea. Remember that." } },
    background = { { id = "tp_bg", text = "I came east from Ashenvale to see who had settled among our ruins. I have stayed longer than I meant to." } },
    highborne = { { id = "tp_hb", text = "Queen Azshara's favoured servants, whose magic called the Legion and drowned this coast." } },
    _none = { { id = "tp_none", text = "That I do not know. I watch one tower, and I see little beyond it." } },
  },
}

-- Nyrill: human, Xylem's Apprentice, Bear's Head.
P:NPC {
  key = "nyrill", id = TODO_NPC("Nyrill"), name = "Nyrill", title = "Xylem's Apprentice", gender = "male",
  bible = "bibles/missed.md", role = "scholar", tier = "service",
  communities = { "xylems_tower" }, temper = { "anxious", "earnest" }, values = { "curious", "dutiful" },
  notices = { "arcane" },
  impression = {
    first = "Nyrill is one of Archmage Xylem's apprentices, a young human with ink on his cuffs and the look of someone who has been corrected a great deal. He admires his master enormously and flinches a little at the name.",
    third = "{name} met Nyrill, an apprentice to Archmage Xylem at Bear's Head in Azshara.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Oh, it's you! Good! The Archmage was in a fine mood today, so I'll see what I can arrange for you." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Oh. You. I'll tell Sanath you're here, I suppose. Please don't make trouble." },
    { id = "g_default", text = "Oh! A visitor. You'll want the Archmage, I expect, and you'll need to speak to Sanath for that, though I should warn you that he's seldom pleasant about it." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again. I hope the Archmage was in one of his better tempers when you went up." },
  },
  notice = {
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "You're a mage! Might I ask where you trained, and whether your master also made you copy every ward out forty times? Only I've begun to wonder whether that is usual." },
  },
  start = "hello",
  nodes = {
    ylife = {
      lines = { { id = "ylife_x", text = "In Stormwind, at the Mage Quarter's little school, until my tutor said I'd learned all he could teach. He wrote a letter to the Archmage for me. I sometimes wonder whether that was praise or revenge." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ydrake = {
      lines = { { id = "ydrake_x", text = "His name was Halden. He came back, mostly. He lost an arm and most of his nerve, and went home to Lakeshire. The Archmage sent a letter of condolence, which was three lines long. I've wondered if I'll be next." } },
      choices = {
        { text = "A good apprentice learns patience before power.", next = "BACK", reply = "That's what the Archmage says, almost word for word. I'm still learning it.", fx = { align = { order = 1 } } },
        { text = "Power first. Patience is for people without talent.", next = "BACK", reply = "The Archmage would turn you into a newt for saying that. I'm only half joking.", fx = { align = { order = -1 } } },
        { text = "Then leave, before you are.", next = "yleave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yleave = {
      lines = { { id = "yleave_x", text = "Leave? And give up the finest teacher in Kalimdor? It's tempting, some nights. What would you do in my place, stay and learn, or leave and live?" } },
      choices = {
        { text = "Stay. Great knowledge comes at great risk.", next = "BACK", reply = "Yes. That's what I tell myself. I'll finish my ward, then.", fx = { align = { order = 1 } } },
        { text = "Leave. No teacher is worth your life.", next = "BACK", reply = "That's what Halden said, the night he left. I'll think on it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ygood = {
      lines = { { id = "ygood_x", text = "Good? He's brilliant, and he's never once lied to me. He also keeps a demon at the door. I think he's good the way a storm is good. It waters the fields and drowns the sheep, and it doesn't care which." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Nyrill, apprentice to Archmage Xylem. I copy his notes, I mind his circles, and I keep well away from anything he has told me not to touch, which is most of the tower." },
        { id = "yh_human", when = { race = "Human" }, text = "Oh, another human. That's nice, honestly. Everyone else up here is either an elf, a demon or the Archmage. I'm Nyrill, his apprentice." },
      },
      again = {
        { id = "h_again", text = "Was there something else? I've a ward to finish, but it can wait a moment." },
        { id = "h_again2", text = "Yes? Do ask, I'm glad of the company." },
      },
      choices = {
        { text = "What is it like, studying under Xylem?", next = "study" },
        { text = "What does the Archmage study out here?", next = "work" },
        { text = "He's said to lose apprentices.", next = "lose" },
        { text = "Where did you study before?", next = "ylife" },
        { text = "What happened to the apprentice who met the drake?", next = "ydrake" },
        { text = "Do you think Xylem is a good man?", next = "ygood" },
        { text = "What's the hardest thing Xylem has asked you to do?", next = "w_hard" },
        { text = "Good luck with your ward.", next = "END" },
      },
    },
    study = {
      lines = { { id = "s_default", text = "It's the finest education a mage could ask for, and I remind myself of that most mornings. He knows more of Highborne spellcraft than anyone living, and he explains it once, quite fast, while doing something else." } },
      choices = {
        { text = "And if you don't follow the first time?", next = "follow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    follow = {
      lines = { { id = "f_default", text = "Then I work it out from his notes at night, which are written in three languages and his own shorthand. I've become rather good at the shorthand, and I think that may be the real lesson." } },
      choices = { { text = "It may be. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    work = {
      lines = { { id = "w_default", text = "The ruins, chiefly. Azshara was the heart of the old night elf empire, and there are enchantments lying under the sand here that have kept their shape for ten thousand years, which is something no magic of ours can do." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    lose = {
      lines = { { id = "l_default", text = "I'd rather you hadn't brought that up, though it's true enough. One of us was sent after a shard and met a blue drake instead, and the Archmage still talks about the shard, so I am very careful about which errands I volunteer for." } },
      choices = { { text = "A sensible precaution. Something else.", next = "BACK" } },
    },
    w_hard = {
      lines = {
        { id = "w_hard_default", text = "Hold a circle for eleven hours while he spoke to something on the other side of it. I don't know what it was. It had a very polite voice, and it asked my name twice, and Xylem told me not to answer. I didn't sleep for a week afterward." },
      },
      choices = {
        { text = "Did you ever find out what it was?", next = "w_hard2" },
        { text = "Eleven hours is a long time.", next = "w_hard2" },
      },
    },
    w_hard2 = {
      lines = {
        { id = "w_hard2_default", text = "I didn't ask, and he didn't say. He gave me a cup of tea the next morning and told me I'd done well, which is the only praise I've ever had from him. I keep thinking that a teacher who praises you for not answering a voice is a teacher you should listen to." },
        { id = "w_hard2_w1", when = { class = "MAGE" }, text = "You're a mage. If something ever asks your name across a circle, don't answer. That's all I've learned here, and it might be the most important thing." },
      },
      choices = {
        { text = "Never give your name.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else, Nyrill.", next = "BACK" },
      },
    },
  },
  topics = {
    stormwind = { { id = "ytp_sw", text = "I studied in Stormwind before coming here. The food was better there." } },
    xylem = { { id = "ytp_xylem", text = "The Archmage knows more than anyone alive about Highborne magic. He's also terrifying." } },
    background = { { id = "tp_bg", text = "I came to Azshara to learn from the Archmage. I've learned a great deal, mostly about copying." } },
    highborne = { { id = "tp_hb", text = "The mages of the old empire. Their wards are still standing in these ruins, and the Archmage wants to know why." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know, and I've learned not to guess where the Archmage might hear of it." } },
  },
}
