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
    first = "Andrea Halloran keeps one eye on me and the other on her children, Jesse and Regina, who seem determined to climb everything in Menethil. She's married to the tanner, and says the smell is the least of her worries.",
    third = "{name} met Andrea Halloran, the tanner's wife in Menethil Harbor, who has her hands full with two adventurous children.",
  },
  greetings = {
    { id = "g_hi", text = "Oh, hello! Sorry, I'm only half listening; I've lost sight of Jesse again, and that's never a good sign." },
    { id = "g_back", when = { metBefore = true }, text = "Hello again! Have you seen a small boy halfway up anything tall? If you have, don't tell me which." },
  },
  notice = {
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
        { id = "h_again", text = "What else? Quickly, before Regina notices I've stopped watching." },
        { id = "h_again2", text = "Go on, I'm listening, mostly." },
      },
      choices = {
        { text = "Tell me about your children.", next = "kids" },
        { text = "How is life in Menethil?", next = "harbor" },
        { text = "Your husband's work must be hard on the nose.", next = "james" },
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
  },
  topics = {
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
    first = "Comar Villard walks the muddy roads near the Thandol Span looking for his wife, who went missing long ago. He's gentle and polite and seems not to notice how thin and worn he's become.",
    third = "{name} met Comar Villard, a grieving man who wanders the northern Wetlands searching for his lost wife.",
  },
  greetings = {
    { id = "g_hi", text = "Excuse me, friend, but have you seen a woman travelling alone on these roads? No, I suppose you haven't, and nobody ever has." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, you again. Still no sign of her, I'm afraid, but I keep looking." },
  },
  notice = {
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
        { id = "h_again", text = "Is there anything else? I should keep looking." },
        { id = "h_again2", text = "Go on, I've time to listen, though not much." },
      },
      choices = {
        { text = "Tell me about your wife.", next = "wife" },
        { text = "How long have you been searching?", next = "searching" },
        { text = "Aren't these roads dangerous?", next = "danger" },
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
  },
  topics = {
    background = { { id = "tp_bg", text = "There's not much to tell, friend, beyond the woman I've lost and the roads I walk looking for her." } },
    _none = { { id = "tp_none", text = "I'm sorry, I don't know. I've thought of nothing but her for years." } },
  },
}
