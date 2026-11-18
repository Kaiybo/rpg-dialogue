-- More Wetlands folk: Andrea Halloran, the tanner's wife in Menethil Harbor with two children who won't stay
-- off things, and Comar Villard, who wanders the north road near the Thandol Span looking for his lost wife.
-- Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.wetlands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Andrea Halloran: James Halloran's wife; mother of Jesse and Regina.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_andrea", id = TODO_NPC("Andrea Halloran"), name = "Andrea Halloran",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  communities = { "menethil" }, temper = { "harried", "warm" }, values = { "family", "practical" },
  notices = { "race", "class" },
  impression = {
    first = "She says the tannery smell is the least of her worries.",
    third = "{name} met Andrea Halloran, the tanner's wife in Menethil Harbor, who has her hands full with two adventurous children.",
  },
  greetings = {
    { id = "g_hi", text = "Oh, hello! Sorry, I'm only half listening; I've lost sight of Jesse again, and that's never a good sign." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! Have you seen a small boy halfway up anything tall? If you have, don't tell me which." },
  },
  notice = {
    { id = "n_lw", cat = "class", when = { profession = { "Leatherworking", "Skinning" } },
      text = "You work hides yourself, don't you? I can always tell by the hands. James will talk to you for an hour if you let him." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Jesse's been pestering the dwarves at the keep to teach him to shoot. If he asks you, please say no, and say it loudly." },
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A priest! You'd not believe how many scraped knees I've bandaged this month. I could use a blessing or two for patience." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I'm Andrea Halloran, and my husband James is the tanner here, which you've probably smelled already. Most days I'm keeping our two from falling off something, and the rest of the time I'm scrubbing hides." },
      },
      again = {
        { id = "h_again3", text = "Yes? Sorry, I heard a splash, but I think it was only a gull. Go on." },
        { id = "h_again", text = "What else? Quickly, before Regina notices I've stopped watching." },
        { id = "h_again2", text = "Go on, I'm listening, mostly." },
      },
      choices = {
        { text = "Tell me about your children.", next = "kids" },
        { text = "How is life in Menethil?", next = "harbor" },
        { text = "Your husband's work must be hard on the nose.", next = "james" },
        { text = "Who do you rely on in this town?", next = "neighbours" },
        { text = "The harbor is no playground.", next = "docks" },
        { text = "I work leather too. How is the trade?", next = "trade", when = { profession = { "Leatherworking", "Skinning" } } },
        { text = "Good day, Andrea.", next = "END" },
      },
    },
    kids = {
      lines = { { id = "ki_default", text = "Jesse's the climber, and Regina's the one who tells on him, and between them I've not had a quiet afternoon in years. They're good children, really, just very fond of high places and loud voices." } },
      choices = {
        { text = "Let him climb. It's how children learn.", next = "kids_climb" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kids_climb = {
      big = true,
      lines = { { id = "kc_default", text = "Learn what, how to break a leg? His father says the same as you, mind, and his father isn't the one picking him up after. What would you do, if he were yours?" } },
      choices = {
        { text = "Keep him safe. There's time enough for risks later.", next = "BACK", reply = "Thank you! I'll tell James a stranger agreed with me, and he'll hate that.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let him fall once. He'll learn faster.", next = "BACK", reply = "Spoken like someone who's never had to carry a crying child home. But maybe you're right.", fx = { align = { order = -1 } } },
      },
    },
    harbor = {
      lines = { { id = "ha_default", text = "Busy, damp and noisy, with ships in and out at all hours and the Dragonmaw never far off. We came here for James's trade, and I suppose we've stayed for it too." } },
      choices = {
        { text = "Do you ever think of leaving?", next = "harbor_leave" },
        { text = "Something else.", next = "BACK" },
      },
    },
    harbor_leave = {
      lines = { { id = "hl_default", text = "Every time I hear about the orcs at Grim Batol, yes. But James's leather sells in every port that has a ship to Menethil, and where else would we go? Stormwind's crowded, and the children would hate it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    james = {
      lines = { { id = "ja_default", text = "Hard on everybody's nose, but I stopped smelling it years ago. He's a good man, James, and his crocolisk leather is the finest in the kingdom, or so he tells me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    neighbours = {
      lines = { { id = "nb_default", text = "Innkeeper Helbrek, mostly, who's fed my two more suppers than I can repay when I've been late at the vats. And Captain Stoutfist's guards know Jesse by name now, which I can't decide whether to be glad or ashamed of." } },
      choices = {
        { text = "The guards bring him home?", next = "neighbours_guards" },
        { text = "Something else.", next = "BACK" },
      },
    },
    neighbours_guards = {
      lines = { { id = "ng_default", text = "Twice from the keep wall and once from the roof of the inn. They're very good about it, and one of the dwarves told Jesse he'd make a fine mountaineer some day, which was not the help he thought it was." } },
      choices = { { text = "He may be right, in ten years.", next = "BACK", reply = "In ten years he's welcome to climb whatever he likes. I only need him in one piece until then.", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    docks = {
      lines = { { id = "dk_default", text = "No, and I've told them so until I'm hoarse. There are ropes, cranes and sailors who don't look where they're walking, and under all of it the water's cold enough to stop your breath." } },
      choices = {
        { text = "Do the sailors look out for them?", next = "docks_sailors" },
        { text = "Something else.", next = "BACK" },
      },
    },
    docks_sailors = {
      lines = { { id = "ds_default", text = "The regular crews do. First Mate Fitzsimmons sends Regina home with ship's biscuit and tells Jesse horrible stories about murlocs, and I've decided the stories do more good than any scolding of mine." } },
      choices = {
        { text = "A frightening story has its uses.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade = {
      lines = { { id = "td_default", text = "Good, when the hunters can get out to the marsh and back. Crocolisk hide is what the port wants, and James says the young raptors skin cleaner, though you'd better ask him, because I only scrape what I'm handed." } },
      choices = { { text = "I'll talk to James. Thank you.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    james = { { id = "tp_james", text = "My husband, and the best tanner in the Wetlands, if you can stand downwind of him. He's kinder than he smells." } },
    menethil = { { id = "tp_menethil", text = "It's a working port with a keep in the middle of it. Everything arrives damp and everyone leaves in a hurry." } },
    background = { { id = "tp_bg", text = "I'm a tanner's wife and a mother of two. That keeps me busy enough." } },
    _none = { { id = "tp_none", text = "I couldn't say, I'm afraid. Ask me about children, or hides." } },
  },
}

---------------------------------------------------------------------------
-- Comar Villard: wanders the northern Wetlands near the Thandol Span searching for his lost wife.
---------------------------------------------------------------------------
P:NPC {
  key = "mf_comar", id = TODO_NPC("Comar Villard"), name = "Comar Villard",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  communities = { "wetlands" }, temper = { "mournful", "gentle" }, values = { "love", "faithful" },
  notices = { "class" },
  impression = {
    first = "He doesn't notice how thin he has grown looking for his wife.",
    third = "{name} met Comar Villard, a grieving man who wanders the northern Wetlands searching for his lost wife.",
  },
  greetings = {
    { id = "g_hi", text = "Excuse me, friend, but have you seen a woman travelling alone on these roads? No, I suppose you haven't, and nobody ever has." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. Still no sign of her, I'm afraid, but I keep looking." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = { "PRIEST", "PALADIN" } },
      text = "You serve the Light, I think. If you have a prayer to spare for a traveller, I would be glad of it, though it's for her and not for me." },
    { id = "n_road", cat = "class", when = { minLevel = 30 },
      text = "You've travelled farther than most who pass me. You would tell me if you had seen her, wouldn't you? Yes, of course you would." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "You've a strange shadow about you, friend, but I'll not judge. Everyone who walks these roads has their own burden." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "My name is Comar Villard, and I'm looking for my wife. She came this way, I'm sure of it, and I've been walking these roads ever since." },
      },
      again = {
        { id = "h_again3", text = "Forgive me, I was watching the road. What were you asking?" },
        { id = "h_again", text = "Is there anything else? I should keep looking." },
        { id = "h_again2", text = "Go on, I've time to listen, though not much." },
      },
      choices = {
        { text = "Tell me about your wife.", next = "wife" },
        { text = "How long have you been searching?", next = "searching" },
        { text = "Aren't these roads dangerous?", next = "danger" },
        { text = "Who do you meet on these roads?", next = "roads" },
        { text = "You don't look as though you've eaten.", next = "eaten" },
        { text = "Let me say a prayer for her.", next = "prayer", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "Farewell, Comar.", next = "END" },
      },
    },
    wife = {
      lines = { { id = "wi_default", text = "She's kind, and she laughs at everything, and she sings badly but loudly. I lost her somewhere on these roads, and I've never learned where or how." } },
      choices = {
        { text = "Do you think she's still alive?", next = "wife_alive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wife_alive = {
      big = true,
      lines = { { id = "wa_default", text = "I have to think so, for what else would I do with myself? Some say I should stop and grieve and move on. Do you think I should?" } },
      choices = {
        { text = "No. Keep searching. Love like that is rare.", next = "BACK", reply = "Thank you, friend. Not many people say that anymore.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Yes. You deserve to live again.", next = "BACK", reply = "Perhaps you're right, but I can't, not yet. Thank you for your kindness, anyway.", fx = { align = { light = -1 } } },
      },
    },
    searching = {
      lines = { { id = "se_default", text = "Longer than I care to count, if I'm honest. The seasons blur together out here, and I stopped counting after the third winter." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    danger = {
      lines = { { id = "da_default", text = "They are, with the Dark Irons on the Span and the Dragonmaw in the hills, but nobody seems to trouble a man with nothing worth taking. I sleep in the old farmhouses, and the raptors leave me alone, mostly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    roads = {
      lines = { { id = "rd_default", text = "Not many. The dwarves at Dun Modr know me, and they have stopped asking me to come inside their lines, though one of them still leaves a blanket by the old wall. Now and then a caravan passes for the Thandol Span and I ask the drivers." } },
      choices = {
        { text = "What do the drivers tell you?", next = "roads_drivers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    roads_drivers = {
      lines = { { id = "rv_default", text = "That they've seen no one, and that I should go south to Menethil where it's safe. They mean it kindly, but she didn't go to Menethil, so there's no sense in my going there either." } },
      choices = {
        { text = "How can you be sure which way she went?", next = "roads_sure" },
        { text = "Something else.", next = "BACK" },
      },
    },
    roads_sure = {
      lines = { { id = "rs_default", text = "I can't be, and you are the first in a long while to ask it plainly. I only know that this is the road where I last had her beside me, and a man has to stand somewhere." } },
      choices = { { text = "Then I hope she finds this road again.", next = "BACK", fx = { affinity = 1 } }, { text = "Something else.", next = "BACK" } },
    },
    eaten = {
      lines = { { id = "ea_default", text = "Haven't I? I forget to, some days. There are berries along the marsh, and the dwarves leave bread where I'll find it and pretend they haven't, so I do well enough." } },
      choices = {
        { text = "Eat when it's offered, Comar. She'd want that.", next = "BACK", reply = "She would, and she'd say it a great deal louder than you. I'll try to remember.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    prayer = {
      lines = { { id = "pr_default", text = "Would you? Thank you. I've not prayed properly in a long time, for I never know whether to ask that she is safe or that she is at peace, and it seems wrong to choose." } },
      choices = { { text = "The Light knows which she needs.", next = "BACK", reply = "Yes. Yes, I suppose it must. That is a kinder answer than I've given myself.", fx = { affinity = 1 } } },
    },
  },
  topics = {
    thandol_span = { { id = "tp_span", text = "A great dwarven bridge to the north, with fighting on it now. I keep to this side, for the Dark Irons don't care who is only looking for someone." } },
    dun_modr = { { id = "tp_modr", text = "The dwarves there lost their town and are trying to win it back. They've been kind to me, in the gruff way dwarves are kind." } },
    background = { { id = "tp_bg", text = "There's not much to tell, friend, beyond the woman I've lost and the roads I walk looking for her." } },
    _none = { { id = "tp_none", text = "I'm sorry, I don't know. I've thought of nothing but her for years." } },
  },
}
