-- Darnassus, folk the roster scan found missing (1 of 3): the Tradesmen's Terrace. The four
-- auctioneers and the terrace's merchants of arms, armor, robes and bags. Voice: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.darnassus")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Auctioneer Silva'las: the youngest of the four, curious about outlanders.
P:NPC {
  key = "dar_silvalas", id = TODO_NPC("Auctioneer Silva'las"), name = "Auctioneer Silva'las", gender = "male",
  bible = "bibles/missed.md", role = "auctioneer", tier = "service",
  communities = { "darnassus" }, temper = { "curious", "polite" }, values = { "learning", "fairness" },
  notices = { "race" },
  impression = {
    first = "Auctioneer Silva'las studies each customer as closely as the goods they bring. He asks more questions than an auctioneer needs to, and listens to all of the answers.",
    third = "{name} met Auctioneer Silva'las at the auction house in Darnassus.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. You have the dust of a long road on you, and I would guess a pack worth emptying." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and welcome. Tell me where you have been since, if you have a moment for it." },
  },
  notice = {
    { id = "n_human", cat = "race", when = { race = "Human" },
      text = "A human of Stormwind, unless I mistake the accent. I have a dozen questions about your city, and I will try to ask only one of them." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Silva'las, the newest of the four who keep this house. Every lot that crosses my counter has come from somewhere I have never stood, and I confess that is half of why I took the post." } },
      again = {
        { id = "h_again", text = "What else would you tell me, or ask?" },
        { id = "h_again2", text = "Please, go on." },
      },
      choices = {
        { text = "Show me what's on offer.", next = "BUSINESS" },
        { text = "You've never left Teldrassil?", next = "left" },
        { text = "What's the strangest thing you've sold?", next = "strange" },
        { text = "Until next time.", next = "END" },
      },
    },
    left = {
      lines = { { id = "le_default", text = "I have been to Auberdine, which hardly counts, since one can see the great tree from its docks. So I learn the world from what it sends me, such as Stranglethorn pearls, dwarven powder and cloth that smells of other people's hearths." } },
      choices = {
        { text = "The world is rougher than its goods.", next = "rough" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rough = {
      lines = { { id = "r_default", text = "So Golothas tells me, and he has seen far more of it than I have. I think I would still like to judge for myself one day, when the house can spare me." } },
      choices = { { text = "Then I hope it can. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    strange = {
      lines = {
        { id = "st_gnome", when = { race = "Gnome" }, text = "Something made by your own people, I am afraid. It ticked, it had a small brass key, and the gnome who bought it would not tell me what it did, so I think of it often." },
        { id = "st_default", text = "A gnomish device that ticked, with a small brass key in its back. Nobody in Darnassus could say what it was for, and it sold within the hour to a gnome who seemed delighted." },
      },
      choices = { { text = "Best not to wind such things. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I am the newest auctioneer of the four. Golothas says I ask too much, and Tolon says I do not ask about prices enough." } },
    _none = { { id = "tp_none", text = "I do not know, though now I would like to. Tell me if you find out." } },
  },
}

-- Cyridan: leather armor merchant.
P:NPC {
  key = "dar_cyridan", id = TODO_NPC("Cyridan"), name = "Cyridan", title = "Leather Armor Merchant", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "darnassus" }, temper = { "quiet", "observant" }, values = { "stealth", "craft" },
  notices = { "class" },
  impression = {
    first = "Cyridan sells leather armor and moves about his shop without making a sound. He listens to how a customer walks before he recommends anything.",
    third = "{name} met Cyridan, who sells leather armor on the Tradesmen's Terrace.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. I heard you on the walkway well before I saw you, and we may be able to mend that." },
    { id = "g_back", when = { metBefore = true }, text = "You tread more softly than you did last time. Is that my leather, or have you been practising?" },
  },
  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "You, I did not hear at all, which is the best thing I can say to anyone. Come and see what I keep for people who walk as you do." },
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "A druid wants leather that does not complain when the wearer changes shape. I have some that has learned to bear it." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Cyridan, and leather is my trade. Melea sells mail down the terrace for those who wish to be heard coming, and Vinasia sells cloth for those who do not expect to be struck, and I serve everybody in between." } },
      again = {
        { id = "h_again", text = "What else would you know?" },
        { id = "h_again2", text = "Yes? Speak, and I will hear it." },
      },
      choices = {
        { text = "Let me see your leathers.", next = "BUSINESS" },
        { text = "Why does quiet matter so much to you?", next = "quiet" },
        { text = "Where do your hides come from?", next = "hides" },
        { text = "Go quietly, Cyridan.", next = "END" },
      },
    },
    quiet = {
      lines = { { id = "q_default", text = "Because in the forest the loud thing is the thing that is eaten, or the thing that goes hungry. Our hunters and scouts have known that since before your grandsires' grandsires, and good leather is cut with it in mind." } },
      choices = {
        { text = "How do you cut leather for silence?", next = "cut" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cut = {
      lines = { { id = "c_default", text = "You keep the seams away from where the limbs bend, you oil the hide until it stops creaking, and you leave off every buckle that the wearer can live without. The humans love a buckle, and I have stopped arguing with them about it." } },
      choices = { { text = "No buckles, then. Something else.", next = "BACK" } },
    },
    hides = {
      lines = {
        { id = "hi_hunter", when = { class = "HUNTER" }, text = "From hunters like yourself, for the most part, and from the leatherworkers on the Craftsmen's Terrace who cure them. If you take only what you need and skin it cleanly, they will always be glad of your hides there." },
        { id = "hi_default", text = "From the hunters of Teldrassil and Darkshore, by way of the leatherworkers on the Craftsmen's Terrace. Nothing is taken that the forest cannot spare, and nothing of the animal is wasted." },
      },
      choices = { { text = "As it should be. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I scouted for many years before I sold armor. I learned what a creaking strap can cost." } },
    _none = { { id = "tp_none", text = "I have not heard anything of that, and I hear most things." } },
  },
}
