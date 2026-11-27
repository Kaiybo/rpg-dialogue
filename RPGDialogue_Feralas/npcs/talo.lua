-- Talo Thornhoof, old tauren hunter at Camp Mojache (0.72.0). Voice: bibles/talo.md
-- Storyteller elder; a harpy ambush broke his nerve years ago, and the hate never left.
local P = RPGDialogueAPI:Pack("rpgd.feralas")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "talo", id = TODO_NPC("Talo Thornhoof"), name = "Talo Thornhoof",
  bible = "bibles/talo.md", role = "questgiver", tier = "quest",
  communities = { "mojache" }, temper = { "grave", "patient" }, values = { "wise", "proud" },
  notices = { "class", "trophy" },
  impression = {
    first = "He still hears the cries of the harpies who caught him alone.",
    third = "{name} met Talo Thornhoof, an elder tauren hunter at Camp Mojache who carries an old grudge against the Northspring harpies.",
  },

  greetings = {
    { id = "o_war_trust", when = { gossip = { topic = "warchief", stance = "trust" } }, text = "Rok Orhan tells me you think well of the Warchief. So do I, young one. Thrall's orcs stood with us when the centaur hunted us across the plains." },
    { id = "g_default", text = "Sit, young one. An elder's stories are long, but they are rarely wasted." },
    { id = "g_north", when = { questActive = TODO_QUEST("Vengeance on the Northspring") }, text = "The Northspring harpies' wings are black as night, so do not take your eyes from them, or they vanish into the dark." },
    { id = "g_heart", when = { questDone = TODO_QUEST("Dark Heart") }, text = "I keep Edana's crystal heart beside my bedroll, and I sleep better for it. That is your doing." },
    { id = "g_away", when = { away = 14 }, text = "You were gone {away}, and I told your story twice to the young braves while you were away. It grows a little each time, I confess." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You walk heavier than you did, the way a hunter does when the hunt has changed them. Sit, and tell me what you have learned." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "The camp speaks well of you, and the camp is not easy to please. The Earth Mother sees such things." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Someone in Mojache is angry with you. A hunter who angers his own camp must hunt alone, and alone is how I was caught." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. I see it in how you stand, half turned toward the trees, and I stood that way once." },
    { id = "n_harpy", cat = "trophy", when = { killed = { name = "Northspring", min = 15 } },
      text = "There are harpy feathers on your boots, black ones. Sit, and tell me how many." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Talo Thornhoof, and in my day I was a seasoned hunter, with no creature in these hills I feared. That was before the harpies, and I am an elder now, which is what we call hunters who stopped." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Vengeance on the Northspring") },
          text = "The hate boils in me still, after all these years, and I am too old to carry a spear to the western ruins. Perhaps you are not." },
        { id = "h_active", tags = { "news" }, when = { questActive = TODO_QUEST("Vengeance on the Northspring") },
          text = "The Northspring roost to the west, harpies and windcallers both. Strike the windcallers first, because they call the wind that hides the others." },
        { id = "h_ven_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Vengeance on the Northspring"), days = 3 } },
          text = "You have put an old tauren's mind at peace, or nearly. There is one more of them I think about at night." },
        { id = "h_heart", tags = { "news" }, when = { questActive = TODO_QUEST("Dark Heart") },
          text = "Blow the harpies' horn between the Hatetalon stones in the north of the ruins, and Edana will come thinking her own kin called her. Imagine her surprise." },
        { id = "h_fel", when = { questActive = TODO_QUEST("The Strength of Corruption") },
          text = "The bears and wolves of Felwood are mad with the fel, but stronger for it, I believe. Go and learn whether I am right, because a hunter must know his enemy." },
        { id = "h_dm", when = { questActive = TODO_QUEST("Lethtendris's Web") },
          text = "The elf mage Lethtendris hides among the satyrs in the old city's broken quarter. Bring me her web, so its stolen magic can be let go into the wild again." },
      },
      again = {
        { id = "h_again", text = "Another question? Good, an elder likes to be asked, as the old grass likes the rain." },
        { id = "h_again2", text = "Go on. The fire is warm and I have nowhere to be." },
      },
      choices = {
        { text = "What happened with the harpies?", next = "ambush" },
        { text = "I've heard the name Edana Hatetalon.", next = "edana", when = { any = { { questActive = TODO_QUEST("Dark Heart") }, { questDone = TODO_QUEST("Vengeance on the Northspring") } } } },
        { text = "What makes a good hunter, elder?", next = "hunting" },
        { text = "Tell me one of your stories.", next = "story" },
        { text = "I am a hunter too. Teach me something.", next = "teach", when = { class = "HUNTER" } },
        { text = "Edana is dead, Talo.", next = "after", when = { questDone = TODO_QUEST("Dark Heart") } },
        { text = "What would you have me do?", next = "BUSINESS" },
        { text = "Who else at Mojache was a hunter in your day?", next = "w7_peers" },
        { text = "Farewell, elder.", next = "END" },
      },
    },
    w7_peers = {
      lines = {
        { id = "w7_peers_l1", text = "Hadoken Swiftstrider, though he was a calf then and followed me about with a stick for a spear. And Rok Orhan's father, an orc who came with the first caravan and hunted beside us before his knees gave out." },
      },
      choices = {
        { text = "Hadoken followed you?", next = "w7_peers2" },
        { text = "And now they lead, and you sit.", next = "w7_peers3" },
        { text = "Something else, elder.", next = "BACK" },
      },
    },
    w7_peers2 = {
      lines = {
        { id = "w7_peers2_l1", text = "Everywhere, young one, until I let him carry my waterskin to be rid of him. He became a far better hunter than I was, and he still brings me the first cut of every great cat he takes, which I pretend I do not need." },
        { id = "w7_peers2_l2", when = { class = "HUNTER" }, text = "Everywhere, until I let him carry my water. You remind me of him, a little; you have the same way of looking at the treeline. Go and ask him what he learned from me, and he will tell you more than I would." },
      },
      choices = {
        { text = "He honours you.", next = "BACK", reply = "He does. It is the best thing I ever made, that young hunter." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w7_peers3 = {
      lines = {
        { id = "w7_peers3_l1", text = "Yes, and that is as it should be. The grass grows, and the old grass makes room, and an elder's work is to tell the stories." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    ambush = {
      lines = { { id = "a_default", text = "I was in the forest, sharpening my blade after a hard hunt, when they came down out of the trees like a black storm over the plains. They surrounded me, and I barely dragged myself to safety, and even now I can hear their cries." } },
      choices = {
        { text = "Were you badly hurt?", next = "ambush_hurt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ambush_hurt = {
      lines = { { id = "ah_default", text = "My body healed, as bodies do. My nerve did not, and a hunter without his nerve is only a tauren standing in the forest waiting to be eaten." } },
      choices = {
        { text = "Is revenge what you want?", next = "ambush_stance" },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    ambush_stance = {
      big = true,
      lines = { { id = "as_default", text = "I would like to say it is justice I want, because that is the better word. But I am old enough to be honest, and it is revenge, and I want to get even." } },
      choices = {
        { text = "Then you'll have your vengeance. The harpies earned it.", next = "BACK", reply = "Then may the Earth Mother forgive me for wanting it, and may your arrows fly true when you reach their nests.", fx = { align = { light = -1 } } },
        { text = "Let it go, elder. Hate is a heavy pack.", next = "BACK", reply = "It is heavy, and I have carried it many years, but I do not yet know how to set it down without falling.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    edana = {
      lines = { { id = "e_default", text = "The queen of the Northspring, and pure evil, they say, with a heart of crystal instead of flesh. She feels nothing but hate for every living thing, and I find I understand her better than I would like." } },
      choices = {
        { text = "A heart of crystal? Really?", next = "edana_heart" },
        { text = "Something else, elder.", next = "BACK" },
      },
    },
    edana_heart = {
      lines = { { id = "eh_default", text = "That is the story, and if it is true, I would like to hold it in my hand. Only then will I know she is dead and not waiting in some other tree." } },
      choices = { { text = "I'll bring it to you.", next = "BACK", fx = { affinity = 1 } } },
    },
    hunting = {
      lines = { { id = "hn_default", text = "Strive to learn the strengths of your opponent, and take them for your own. Know your enemy well, and the battle turns in your favor before the first arrow flies." } },
      choices = {
        { text = "Even strength from corruption?", next = "hunting_fel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunting_fel = {
      big = true,
      lines = { { id = "hf_default", text = "The beasts of Felwood glow with a strange green light, and I sense it is evil, but very powerful too. I would not drink it, but I would study it, because what I do not understand can kill me." } },
      choices = {
        { text = "Some power should never be studied.", next = "BACK", reply = "You may be right, young one, and if the green light ever speaks to me, I will remember you warned me.", fx = { align = { order = 1 } } },
        { text = "Any strength is worth understanding.", next = "BACK", reply = "That is a hunter's thought, and I share it, though I would study it from very far away and very upwind.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    story = {
      lines = { { id = "st_default", text = "When I was young, I tracked a great cat through these hills for six days, and on the seventh I found it watching me from a branch above my head. It had been hunting me the whole time, and it let me go." } },
      choices = {
        { text = "Why did it let you go?", next = "story_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    story_why = {
      lines = { { id = "sw_default", text = "I have thought about that for many years. I believe it wanted me to know it could, and that was its lesson, and I have tried to be worthy of it since." } },
      choices = { { text = "That's a good story, Talo.", next = "BACK", fx = { affinity = 1 } } },
    },
    teach = {
      lines = { { id = "te_default", text = "Watch the wind before you watch the beast, because the beast is watching the wind too. And never sit with your back to the trees, young one, however tired you are." } },
      choices = { { text = "I'll remember, elder.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } } },
    },
    after = {
      lines = { { id = "af_default", text = "I have held her heart and felt how cold it is, and now I know. You did here what I could not, and I will keep that heart in memory of it, and tell your name to the ancestors when I go to them." } },
      choices = { { text = "Rest easy now, Talo.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A hunter of Thunder Bluff once, and an elder of Mojache now. The space between those two is a story about harpies." } },
    advice = { { id = "tp_ad", text = "Always know your enemy. Learn what makes it strong before you learn what makes it bleed." } },
    cairne = { { id = "tp_cairne", text = "Cairne Bloodhoof gave our people a home on the mesas, and when I am old and done hunting, I will go back to Thunder Bluff and sit at his fire. That day is closer than it was." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother sent me the harpies to teach me humility, I think, and I learned it. I would have preferred a gentler teacher." } },
    grimtotem = { { id = "tp_grimtotem", text = "The Grimtotem are tauren who have forgotten that the land is shared. They camp in the hills of Feralas and would rather see us gone than see us thrive." } },
    dire_maul = { { id = "tp_dire_maul", text = "The great ruin north of here belonged to the night elves' ancestors, and now the ogres keep it. The spirits there are not at peace, and I do not hunt near it." } },
    centaur = { { id = "tp_centaur", text = "The centaur have harried our people since before Thunder Bluff was ours. They are fierce, and they are cruel, and they do not forget a slight." } },
    _none = { { id = "tp_none", text = "That is not among my stories, young one. Ask someone younger, who goes out more than I do, and walk with the Earth Mother." } },
  },
}
