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
    hello = {
      lines = { { id = "h_default", text = "I am Coral Moongale. A human archmage has raised a tower on kaldorei ruins and fills it with Highborne relics, and I thought that someone of my people ought to be near enough to see what he does with them." } },
      again = {
        { id = "h_again", text = "What more would you ask?" },
        { id = "h_again2", text = "Speak. The tower will keep while we talk." },
      },
      choices = {
        { text = "Do you think Xylem is dangerous?", next = "danger" },
        { text = "What was this coast, before?", next = "coast" },
        { text = "Why not go up and ask him yourself?", next = "ask" },
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
  },
  topics = {
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
    { id = "g_default", text = "Oh! A visitor. You'll want the Archmage, I expect, and you'll need to speak to Sanath for that, though I should warn you that he's seldom pleasant about it." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again. I hope the Archmage was in one of his better tempers when you went up." },
  },
  notice = {
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "You're a mage! Might I ask where you trained, and whether your master also made you copy every ward out forty times? Only I've begun to wonder whether that is usual." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Nyrill, apprentice to Archmage Xylem. I copy his notes, I mind his circles, and I keep well away from anything he has told me not to touch, which is most of the tower." } },
      again = {
        { id = "h_again", text = "Was there something else? I've a ward to finish, but it can wait a moment." },
        { id = "h_again2", text = "Yes? Do ask, I'm glad of the company." },
      },
      choices = {
        { text = "What is it like, studying under Xylem?", next = "study" },
        { text = "What does the Archmage study out here?", next = "work" },
        { text = "He's said to lose apprentices.", next = "lose" },
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
  },
  topics = {
    background = { { id = "tp_bg", text = "I came to Azshara to learn from the Archmage. I've learned a great deal, mostly about copying." } },
    highborne = { { id = "tp_hb", text = "The mages of the old empire. Their wards are still standing in these ruins, and the Archmage wants to know why." } },
    _none = { { id = "tp_none", text = "I'm afraid I don't know, and I've learned not to guess where the Archmage might hear of it." } },
  },
}
