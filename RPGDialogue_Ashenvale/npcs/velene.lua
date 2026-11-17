-- Sentinel Velene Starstrike of Silverwind Refuge, and the befouled elementals of Mystral Lake (0.72.0). Voice: bibles/velene.md
-- Classic: Elemental Bracers, Mage Summoner (Sarilus Foulborne at Dreadmist Peak in the Barrens).
local P = RPGDialogueAPI:Pack("rpgd.ashenvale")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "velene", id = TODO_NPC("Sentinel Velene Starstrike"), name = "Sentinel Velene Starstrike",
  bible = "bibles/velene.md", role = "soldier", tier = "quest",
  communities = { "silverwind_refuge" }, temper = { "sharp", "impatient" }, values = { "duty", "pride" },
  notices = { "arcane", "class" },
  impression = {
    first = "Sentinel Velene Starstrike has a lake full of fouled elementals and a grudge against the one undead mage foolish enough to make them. She takes his smugness more personally than his magic.",
    third = "{name} met Sentinel Velene Starstrike at Silverwind Refuge, who wanted the summoner of Mystral Lake's befouled water elementals found and destroyed.",
  },

  greetings = {
    { id = "g_hello", text = "Have you seen the elementals in our lake? A sorry sight, and I mean to know who put them there." },
    { id = "g_bracers", when = { questActive = TODO_QUEST("Elemental Bracers") }, text = "The bracers, {class}. Pry them off the elementals in the lake, and we'll learn who's pulling their strings." },
    { id = "g_sarilus", when = { questActive = TODO_QUEST("Mage Summoner") }, text = "Dreadmist Peak, in the Barrens, and mind the Horde on the way. Bring me that smirking head." },
    { id = "g_done", when = { questDone = TODO_QUEST("Mage Summoner") }, text = "The lake runs clearer every day, and nobody is laughing at me from the Barrens any longer. I sleep well, {class}." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, {class}. The lake has missed you, and so have I, a little." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You were barely ready for Dreadmist Peak when I sent you, and look at you now. I chose well." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "There's talk you've been telling tales around the forest. I have no patience for liars, {class}, so don't bring that to Silverwind." },
  },

  notice = {
    { id = "n_mage", cat = "arcane", when = { class = "MAGE" },
      text = "A mage. You'll forgive me if I watch your hands, because the last mage I heard of fouled my whole lake." },
    { id = "n_undead", cat = "class", when = { race = "Scourge" },
      text = "One of the Forsaken, here? You walk like Sarilus must walk, and you'll understand why that does you no favours at Silverwind." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I am Velene Starstrike of the Sentinels, and I hold Silverwind Refuge above Mystral Lake. Something has fouled the water elementals in our lake, and the first thing we must learn is who controls them." },
        { id = "h_bracers_before", when = { questBefore = TODO_QUEST("Elemental Bracers") },
          text = "The elementals wear bracers, bound to them by whoever called them up. Bring me a few, and with a little divination I think we can read the name of the one who bound them." },
        { id = "h_bracers_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Elemental Bracers"), days = 3 } },
          text = "The bracers have told us their maker, and I am not surprised in the least. Sarilus Foulborne, an undead mage of the Barrens, and exactly as foolish as I feared." },
        { id = "h_sarilus", tags = { "news" }, when = { questActive = TODO_QUEST("Mage Summoner") },
          text = "There's only one undead mage in the Barrens capable of defiling this many elementals, and only one fool enough to try. He's probably sitting atop Dreadmist Peak laughing at me, so go and stop the laughter." },
        { id = "h_sarilus_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Mage Summoner"), days = 3 } },
          text = "Now that repugnant smile is gone from the world forever, and you've done very well. Drink the Light of Elune when all seems lost, {class}, and may it save you, Goddess willing." },
        { id = "h_young", when = { maxLevel = 20 },
          text = "You're young for the work I have, {class}. Come back when you've a few more scars, and I'll put you to use." },
      },
      again = {
        { id = "h_again", text = "What else? Speak quickly; I'm watching the lake." },
        { id = "h_again2", text = "Go on, {class}. The elementals aren't going anywhere, more's the pity." },
      },
      choices = {
        { text = "What's wrong with the elementals?", next = "elementals" },
        { text = "Who is Sarilus Foulborne?", next = "sarilus", when = { any = { { questDone = TODO_QUEST("Elemental Bracers") }, { questActive = TODO_QUEST("Mage Summoner") } } } },
        { text = "Tell me about Silverwind Refuge.", next = "refuge" },
        { text = "Could my magic cleanse the elementals?", next = "mage_v", when = { class = { "MAGE", "SHAMAN" } } },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "Goodbye, Sentinel.", next = "END" },
      },
    },

    elementals = {
      lines = {
        { id = "el_default", text = "Water spirits, twisted into something murky and spiteful, rising out of Mystral Lake and dragging at anyone who comes to drink. Elementals don't do that on their own; somebody called them and soured them." },
      },
      choices = {
        { text = "How can you be sure someone called them?", next = "elementals_sure" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elementals_sure = {
      lines = {
        { id = "es_default", text = "Because they wear bracers, {class}, and water doesn't forge its own jewellery. Whoever bound them left his mark on every one, and a mark can be read." },
      },
      choices = {
        { text = "And then?", next = "elementals_then" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elementals_then = {
      big = true,
      lines = {
        { id = "et_default", text = "And then I find the one who made them and I end him, so that no one is foolish enough to try it again. The Sentinels can't guard every lake, but they can make an example." },
      },
      choices = {
        { text = "An example is exactly what's needed.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Justice, yes, but not a show of it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    sarilus = {
      lines = {
        { id = "sa_default", text = "A Forsaken mage who has set himself up at Dreadmist Peak in the Barrens, and fancies himself clever. He is the only undead mage out there with the skill to do this, and the only one with so little sense." },
      },
      choices = {
        { text = "Why would he foul a lake so far from him?", next = "sarilus_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sarilus_why = {
      big = true,
      lines = {
        { id = "sw_default", text = "To vex us, I think, or to see if he could. I have had enough of his idiocy, and we must show him what happens to those who annoy the Sentinels." },
      },
      choices = {
        { text = "Then he'll learn, and I'll teach him.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Going into the Barrens risks open war.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    refuge = {
      lines = {
        { id = "re_default", text = "A small post above the lake, at the edge of the Horde's reach. We watch the roads south and east, and lately we spend more time watching the water than the roads." },
      },
      choices = {
        { text = "Are you well supplied out here?", next = "refuge_supply" },
        { text = "Something else.", next = "BACK", fx = { learn = { "sentinels" } } },
      },
    },
    refuge_supply = {
      lines = {
        { id = "rs_default", text = "Well enough, if you count arrows and patience. What we're short of is clean water, which is a ridiculous thing to be short of beside a lake." },
      },
      choices = {
        { text = "I'll help you clear it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Goodbye, Sentinel.", next = "END" },
      },
    },
    mage_v = {
      lines = {
        { id = "mv_default", text = "Perhaps, if you can find the binding in them and break it, though I'd sooner you broke the one who bound them. Cleanse one, and he will only call another." },
      },
      choices = {
        { text = "Then I'll go to the source.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A Sentinel, {class}. I hold a post and I don't leave it, and that's the whole of my story worth telling." } },
    advice = { { id = "tp_ad", text = "Don't drink from Mystral Lake, and don't trust anyone who tells you it's safe." } },
    sentinels = { { id = "tp_sentinels", text = "We hold more ground than we have warriors for. It's a habit of ours." } },
    _none = { { id = "tp_none", text = "I don't know, and I haven't time to find out. Ask in Astranaar." } },
  },
}
