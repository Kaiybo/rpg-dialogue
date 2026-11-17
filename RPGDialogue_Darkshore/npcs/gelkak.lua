-- Gelkak Gyromast, a shipwrecked gnome "pirate" on the northern shore by the Ruins of Mathystra (0.72.0). Voice: bibles/gelkak.md
-- Classic: Gyromast's Retrieval, Gyromast's Revenge (the Threshwackonator 4100, his "first mate").
local P = RPGDialogueAPI:Pack("rpgd.darkshore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gelkak", id = TODO_NPC("Gelkak Gyromast"), name = "Gelkak Gyromast",
  bible = "bibles/gelkak.md", role = "questgiver", tier = "quest",
  communities = { "darkshore_wilds" }, temper = { "blustering", "cheerful" }, values = { "pride", "invention" },
  notices = { "race", "craft" },
  impression = {
    first = "Gelkak Gyromast talks like a pirate and thinks like a tinker, and he lost his ship to the Threshadons without losing a scrap of swagger. His first mate is a machine, and he speaks of it more fondly than most captains speak of their crews.",
    third = "{name} met Gelkak Gyromast, a shipwrecked gnome captain on Darkshore's northern shore, and heard all about his mechanical first mate.",
  },

  greetings = {
    { id = "g_hello", text = "Ahoy, landlubber! Mind yer step; that's me ship's wheel ye're standin' on, or what's left of it." },
    { id = "g_key", when = { questActive = TODO_QUEST("Gyromast's Retrieval") }, text = "Have ye found me broke-down key yet? Three pieces, landlubber, and the beasties have every one." },
    { id = "g_mate", when = { questActive = TODO_QUEST("Gyromast's Revenge") }, text = "Where be me first mate? Bring him round, and quick, or it's shackles and sharks for ye!" },
    { id = "g_away", when = { away = 14 }, text = "Back after {away}! I thought the Threshadons had ye, I did, and I'd started composin' a shanty about it." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Ye've filled out yer boots since ye fetched me key, landlubber. Ye could almost crew a proper ship now." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "I hear ye've been spinnin' tall tales up and down the coast. That's a proper pirate's habit, and I approve!" },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A fellow gnome! Ye'll appreciate a fine bit o' engineering, unlike these tall folk who think a gear's somethin' ye pack for campin'." },
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Ye'll want to see me first mate's gyroscopic coupling when he's back aboard, because it's me finest work." },
  },

  start = "hello",
  nodes = {
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "Gnomeregan's full of radiation and troggs, and Mekkatorque's still in Ironforge drawing plans to take it back, so a gnome has to make a living somewhere. What do you think of His Royal Tinkerness, matey?" },
      },
      choices = {
        { text = "He'll take Gnomeregan back. Gnomes never quit.", next = "op_r1", fx = { align = { honor = 1 }, opinion = { mekkatorque = "trust", gnomeregan = "hope" } } },
        { text = "He flooded his own city with radiation. Some king.", next = "op_r2", fx = { affinity = 1, align = { honor = -1 }, opinion = { mekkatorque = "blame" } } },
        { text = "Sounds like you'd rather be a pirate than a refugee.", next = "op_r3", fx = { trait = { witty = 1 }, opinion = { pirates = "understand" } } },
        { text = "Don't you dare mock the High Tinker, Captain.", next = "op_r4", fx = { affinity = -1, opinion = { mekkatorque = "loyal" } }, when = { race = "Gnome" } },
        { text = "I'll stay out of gnome politics.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "Aye, never quit, and also never stop to check where the troggs came from. I hope you're right, matey, because I've cousins still in those halls." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "Ha! I'd never say that in Ironforge, but out here on the beach I'll drink to it, or I would if anybody had left me a drink." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "Rather a pirate than a beggar in somebody else's mountain, matey. The sea doesn't ask to see your clan papers." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r4 = {
      lines = { { id = "op_r4_default", text = "Mock him? I'm not mocking him, I'm just not waiting for him, which is a very different thing and a great deal wetter." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Cap'n Gelkak Gyromast, late of a fine ship now restin' on the bottom just off this shore. Them pesky Threshadons sank her, and a pirate's life ain't all plunderin' and booze, I'll tell ye that for nothin'." },
        { id = "h_before", when = { questBefore = TODO_QUEST("Gyromast's Retrieval") },
          text = "What I be needin' is me first mate back in workin' order. When I washed ashore, his key broke on the rocks, and I saw ragin' crawlers, foreststriders and murlocs all rummagin' through the wreckage." },
        { id = "h_key_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Gyromast's Retrieval"), days = 3 } },
          text = "Avast, ye did it! All three pieces of me key, and not a scratch on 'em that weren't there before. Now me first mate can be put back to rights." },
        { id = "h_mate", tags = { "news" }, when = { questActive = TODO_QUEST("Gyromast's Revenge") },
          text = "Take the key, put it in his gulliver, and bring him back here to serve the Cap'n. Them murlocs and their chief won't be so happy once me first mate gets a hold of 'em." },
        { id = "h_mate_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Gyromast's Revenge"), days = 3 } },
          text = "Yarr, ye be provin' yerself more than a yellow sea dog, landlubber. Whatever happened out there, I'll have the whole tale of it for me log." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf of Ironforge! Don't ye go tellin' the Mekkatorque lot ye found me playin' pirate, now. I'm on a research voyage, officially." },
      },
      again = {
        { id = "h_again", text = "What else, landlubber? The tide's out and I've nowhere to be." },
        { id = "h_again2", text = "Speak up! The surf's loud and me ears are full o' seawater." },
      },
      choices = {
        { text = "Why would a gnome turn pirate?", next = "op_ask" },
        { text = "You're a gnome pirate?", next = "pirate" },
        { text = "Tell me about your first mate.", next = "mate" },
        { text = "What happened to your ship?", next = "ship" },
        { text = "How did you build a machine like that?", next = "eng_g", when = { any = { { profession = "Engineering" }, { race = "Gnome" } } } },
        { text = "What do you need, Captain?", next = "BUSINESS" },
        { text = "Fair winds, Captain.", next = "END" },
      },
    },

    pirate = {
      lines = {
        { id = "pi_default", text = "A gnome can be anythin' he sets his mind to, landlubber, and I set mine to the sea. Every captain needs a hat, a ship and a grudge, and I've still got two of the three." },
      },
      choices = {
        { text = "Do you actually plunder anyone?", next = "pirate_plunder" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pirate_plunder = {
      lines = {
        { id = "pp_default", text = "Well, I plundered a lovely barrel o' pickled herring off a Booty Bay barge once, and they never even noticed. I left 'em a note, mind, because a pirate's still got manners." },
      },
      choices = {
        { text = "That's not really plundering, Captain.", next = "pirate_honest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pirate_honest = {
      big = true,
      lines = {
        { id = "ph_default", text = "Hush! Don't ye say that so loud, the murlocs might hear. A reputation's half of piracy, and the other half is runnin' fast when the reputation don't hold." },
      },
      choices = {
        { text = "Then I'll keep your secret, Captain.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Better an honest tinker than a pretend pirate.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    mate = {
      lines = {
        { id = "ma_default", text = "The Threshwackonator 4100, finest first mate ever to swab a deck, and the only crew who never asked for wages. He swims, he lifts, he thrashes, and he only needs his key to remember whose side he's on." },
      },
      choices = {
        { text = "Only needs his key to remember whose side he's on?", next = "mate_side" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mate_side = {
      big = true,
      lines = {
        { id = "ms_default", text = "Well, there's a small matter of his loyalty circuits needin' a firm hand, and the key's the firm hand. Without it he's a touch... independent, ye might say." },
      },
      choices = {
        { text = "That sounds dangerous. Build him safer.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Every good crewman has a bit of spirit.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    ship = {
      lines = {
        { id = "sh_default", text = "Threshadons, big ugly sea beasts with more teeth than sense, came up under her keel off the Ruins of Mathystra. She went down in a hurry, and I went over the side even quicker." },
      },
      choices = {
        { text = "Will you raise her again?", next = "ship_raise" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ship_raise = {
      lines = {
        { id = "sr_default", text = "With me first mate back, aye, or at least I'll salvage her best bits. A captain without a ship is just a fellow shoutin' at the sea, and I've done plenty o' that already." },
      },
      choices = {
        { text = "I'll help you get him back.", next = "BACK", fx = { affinity = 1 } },
        { text = "Fair winds, Captain.", next = "END" },
      },
    },
    eng_g = {
      lines = {
        { id = "eg_default", text = "Gnomeregan trainin', a deal of spare parts and a stubborn streak as long as the Thandol Span. The secret's in the gyroscope; he never falls over, even when he should." },
      },
      choices = {
        { text = "I'd like to see him working.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Tinker by trainin', pirate by choice, castaway by accident. That's the whole of me, landlubber." } },
    advice = { { id = "tp_ad", text = "Never sail where the water's darker than it ought to be. That's where the Threshadons sleep." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "I left before the trouble, and I'm not proud of how glad I am of it. Them as stayed deserved better." } },
    _none = { { id = "tp_none", text = "Never heard of it, and I've sailed near everywhere. Well, near here, anyhow." } },
  },
}
