-- Role pools that aren't tied to one town. Narrow roles only: these people notice
-- specific things (DESIGN.md §2.3, brief 4.4). Town-specific pools live in zone packs.
local P = RPGDialogueAPI:Pack("rpgd.world")

-- Children: every child is impressed by magic and by animals.
P:Pool {
  id = "child", role = "child",
  barks = {
    { id = "b_look", text = "Mama, look! An adventurer!" },
    { id = "b_sword", when = { class = { "WARRIOR", "PALADIN" } }, text = "Bet I could carry that sword. Bet I could." },
    { id = "b_kitty", when = { form = "cat" }, text = "There's a big kitty! Is it friendly?" },
  },
  greetings = {
    { id = "g_hi", text = "Are you an adventurer? A real one?" },
    { id = "g_sword", when = { class = { "WARRIOR", "PALADIN" } }, text = "Is that sword heavy? Can I hold it? I won't drop it." },
  },
  notice = {
    { id = "n_cat", cat = "form", when = { form = "cat" }, place = "replace",
      text = "You were a person and now you're a kitty! Can I pet you? I'll be gentle." },
    { id = "n_bear", cat = "form", when = { form = "bear" }, place = "replace",
      text = "A bear! Mama says bears eat children. You look like a nice bear, though." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Does {pet} bite? Does {pet} like apples? I have half an apple." },
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "What IS that? It's making faces at me. I'm making faces back." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "Can you do a trick? A little one? Make something float?" },
  },
  react = {
    { id = "r_cat", on = "form", when = { form = "cat" }, text = "You just turned into a cat! Do it again! Do it again!" },
    { id = "r_bear", on = "form", when = { form = "bear" }, text = "Whoa! You got so big!" },
    { id = "r_stealth", on = "stealth", text = "Where'd you go? I can still see your feet a bit." },
    { id = "r_pet", on = "pet", text = "Where did that come from? Is it yours?" },
  },
  lines = {
    { id = "l_default", text = "I'm not supposed to talk to strangers. But you're not very strange." },
    { id = "l_hero", when = { townStanding = { min = 30 } }, text = "Everybody says you're a hero. Are you? Did you fight anything big?" },
  },
  choices = {
    { text = "Run along home, now.", next = "END", fx = { trait = { stern = 1 } } },
    { text = "I'll show you a trick another time.", next = "END", fx = { trait = { kind = 1 } } },
  },
  topics = {
    _none = { { id = "t_none", text = "I don't know. I'm only little. Ask a grown-up." } },
  },
}

-- Flight masters: professional opinions about anything that flies.
P:Pool {
  id = "flightmaster_alliance", role = "flightmaster", faction = "Alliance",
  greetings = {
    { id = "g_where", text = "Where to? The birds are rested." },
    { id = "g_again", when = { timesTalked = { min = 5 } }, text = "Back again. You'd think you owned a gryphon." },
  },
  notice = {
    { id = "n_skyborne", cat = "race", when = { race = "Skyborne" },
      text = "I've heard about your people's little glide. Nice trick for going down. A gryphon goes up." },
    { id = "n_druid_travel", cat = "form", when = { form = "travel" },
      text = "Four legs are fine on a road. Wings get you there before your supper's cold." },
    { id = "n_mounted", cat = "mount", when = { mounted = true },
      text = "Fine animal. Doesn't fly, though, does it?" },
  },
  lines = {
    { id = "l_default", text = "Pay the fare, hold on, don't lean. That's all there is to it." },
  },
  choices = { { text = "Just the flight, thanks.", next = "BUSINESS" } },
}

-- Innkeepers anywhere (named innkeepers override this).
P:Pool {
  id = "innkeeper", role = "innkeeper",
  greetings = {
    { id = "g_room", text = "Room, meal, or both?" },
    { id = "g_home", when = { homeInn = true }, text = "Welcome home. Your bed's as you left it." },
  },
  notice = {
    { id = "n_imp", cat = "pet", when = { pet = { family = "Imp" } },
      text = "Your little friend doesn't sleep in the beds. Last one set the sheets smoldering." },
    { id = "n_drunk", cat = "drunk", when = { drunk = { min = 2 } },
      text = "I think you've had your share, friend. Sit. Water first." },
  },
  lines = { { id = "l_default", text = "Warm fire, cold drink, soft bed. Pick any two." } },
  choices = { { text = "A room, please.", next = "BUSINESS" }, { text = "Just passing through.", next = "END" } },
  topics = { _none = { { id = "t_none", text = "Never heard of it, and I hear most things." } } },
}

-- Vendors anywhere.
P:Pool {
  id = "vendor", role = "vendor",
  greetings = {
    { id = "g_buying", text = "Buying or selling?" },
    { id = "g_rich", when = { money = { min = 1000000 } }, text = "Ah, a customer with weight in their purse." },
  },
  lines = { { id = "l_default", text = "Everything's priced fair. Mostly." } },
  choices = { { text = "Let me see your wares.", next = "BUSINESS" } },
}

-- Trainers anywhere (named trainers override this).
P:Pool {
  id = "trainer", role = "trainer",
  greetings = { { id = "g_ready", text = "Ready to learn something?" } },
  lines = { { id = "l_default", text = "Practice what I teach you, or don't come back for more." } },
  choices = { { text = "Train me.", next = "BUSINESS" } },
}

-- Spirit healers: one shared character for every spirit healer, because they seem to keep
-- shared records ("your file"). Bible: RPGDialogue_World/bibles/spirithealer.md.
-- Wry, kind, uncanny. Every answer opens a door and leaves it ajar: what the healer is, who
-- "permits" it, what waits past the mist and who writes the strange pages in your file stay
-- open (claims spirithealer_*). Nothing from later expansions: no Shadowlands, no Maw, no
-- Arbiter, no named realms of the dead. The philosophy is a real argument; the healer can lose.
-- Questions the player asks set flags in the healer's memory (npcFlag), and the next visit
-- picks the thread back up once (the cb_ lines in hello).
P:Pool {
  id = "spirithealer", role = "spirithealer", tier = "major", spiritSensitive = true,
  notices = { "death", "dark" },
  temper = { "sharp", "steady" },
  greetings = {
    { id = "g_again", when = { deaths = { min = 5 } }, text = "You again. Your file grows thick." },
    { id = "g_first", when = { deaths = { max = 1 } }, text = "Do not be afraid. Not yet." },
    { id = "g_plain", text = "Your body is waiting. So am I." },
    { id = "g_hush", text = "Quietly. The others are listening today." },
    { id = "g_thinking", when = { timesTalked = { min = 3 } }, text = "You. I was just thinking about something you said." },
    { id = "g_stay", when = { npcFlag = "asked_stay" }, priority = 10, text = "Staying this time? No. I can see you aren't." },
    { id = "g_hundred", when = { deaths = { min = 100 } }, text = "A hundred doors and more. Ask me your question again." },
  },
  notice = {
    { id = "n_soon", cat = "death", place = "before", when = { daysSinceDeath = { max = 0.02 } },
      text = "Back already? Your footprints from last time are still on the hill." },
    { id = "n_mind", cat = "dark", place = "after", when = { insanity = { min = 40 } },
      text = "Your thoughts came over in pieces. I have set them out in order. They were not in that order when you arrived." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "You have left your body behind again. It is waiting where you fell, in {deathplace}." },
        { id = "h_default2", text = "Sit, if a ghost can sit. Your body is in {deathplace}, and it is not going anywhere without you." },
        { id = "h_default3", text = "There you are. The gray is quiet today. Quieter than I like." },
        { id = "h_first", when = { deaths = { max = 1 } }, text = "The first time is the strangest. Breathe, if you remember how. You will not need to." },
        { id = "h_ten", when = { deaths = { min = 10, max = 24 } }, text = "Your file is thicker than most. I do not say that to wound you." },
        { id = "h_many", tags = { "news" }, when = { deaths = { min = 25, max = 49 } }, text = "{deaths} times. The others have begun to recognize your footsteps." },
        { id = "h_fifty", tags = { "news" }, when = { deaths = { min = 50 } }, text = "We have started a second file. The first one would not close." },
        { id = "c_falling", when = { deathCause = "falling" }, text = "The ground does not negotiate. You knew that once." },
        { id = "c_drowning", when = { deathCause = "drowning" }, text = "Water is patient. You were not." },
        { id = "c_fatigue", when = { deathCause = "fatigue" }, text = "You swam out until the world ran out. It does that." },
        { id = "c_guard", when = { deathCause = "guard" }, text = "A guard. Yours or someone else's, it makes the same mark in the file." },
        { id = "c_player", when = { deathCause = "player" }, text = "Another traveler sent you. The living are hard on one another." },
        { id = "c_trivial", when = { deathCause = "trivial" }, text = "This one I will write down kindly. {killer}. Small, but determined." },
        { id = "c_elite", when = { deathCause = "elite" }, text = "{killer}. A worthy reason, as such things are counted." },
        { id = "c_boss", when = { deathCause = "boss" }, text = "You went where the great ones wait, and one of them was waiting for you." },
        { id = "c_creature", when = { deathCause = "creature", chance = 0.3 },
          text = "Teeth, or claws, or something with both. The wild did not hate you. That is somehow worse." },
        { id = "c_unknown", when = { deathCause = "unknown" },
          text = "I could not see what took you. Sometimes that is a mercy. Sometimes it means it is still there." },
        { id = "h_same_place", tags = { "news" }, priority = 5, when = { deathsHere = { min = 3 } },
          text = "{deathplace} again. You keep returning to the same door, as if it might open differently." },
        { id = "h_streak", tags = { "news" }, when = { daysSinceDeath = { min = 14 } },
          text = "A long while since I last saw you. The file had begun to gather dust. I was almost glad." },
        { id = "h_young", when = { maxLevel = 10 }, text = "So new. Your body had barely learned it was yours, and already you have stepped out of it." },
        { id = "h_old", when = { minLevel = 60 }, text = "You have walked very far to die. The great ones I send back usually say nothing. Say something." },
        { id = "k_shaman", when = { class = "SHAMAN", minLevel = 30 }, text = "You carry your own way back. No ankh today?" },
        { id = "k_warlock", when = { class = "WARLOCK" }, text = "No soulstone this time? Your kind usually bargains its way past me." },
        { id = "k_healer", when = { class = { "PRIEST", "PALADIN" } }, text = "You raise others from where I stand. Strange, to see you on this side of the work." },
        { id = "k_hunter", when = { class = "HUNTER" }, text = "Your companion could not follow you here. Animals are not permitted. I have never agreed with that rule." },
        { id = "k_mage", when = { class = "MAGE" }, text = "You are trying to work out how this place is built. I can hear you doing it. Please stop; it itches." },
        { id = "k_druid", when = { class = "DRUID" }, text = "You wear so many shapes, and only one of them ever comes here. I find that interesting." },
        { id = "k_rogue", when = { class = "ROGUE" }, text = "You died in the dark. Your kind is always surprised the dark was not on your side." },
        { id = "k_warrior", when = { class = "WARRIOR" }, text = "You died with your arm still raised. You can put it down here. Nothing on this hill needs hitting." },
        { id = "r_forsaken", when = { race = "Scourge" }, text = "You have died before, in a larger way. You know this road better than I do." },
        { id = "r_nightelf", when = { race = "NightElf" }, text = "You come to me as a wisp, like all your people. A little light, insisting." },
        { id = "r_human", when = { race = "Human" }, text = "Your people came here by the thousand, the year Lordaeron fell. I remember every one. I try not to." },
        { id = "r_gnome", when = { race = "Gnome" }, text = "You are already measuring this place. Do not bother. It changes when no one is looking." },
        { id = "r_dwarf", when = { race = "Dwarf" }, text = "Your kind always asks if the stone remembers them. It does. So do I." },
        { id = "r_orc", when = { race = "Orc" }, text = "Your people arrive angry and leave angry. You arrived curious. Stay that way." },
        { id = "r_tauren", when = { race = "Tauren" }, text = "Your ancestors pass by here on their way somewhere. They nod to me. I have never learned where they go." },
        { id = "r_troll", when = { race = "Troll" }, text = "Your loa sniff at the edges of this place. They never come in. I have never asked why." },
        { id = "a_taint", when = { taint = { min = 30 } }, text = "Something came with you that should not have. It is watching me. Go, quickly." },
        { id = "a_light", when = { alignment = { axis = "light", min = 40 } }, text = "Gently, now. You have done more good than your file shows." },
        { id = "a_shadow", when = { alignment = { axis = "light", max = -40 } }, text = "I will return you. I am not required to approve." },
        -- Callbacks: the healer picks up last visit's argument, once each.
        { id = "cb_cage", once = true, priority = 30, when = { npcFlag = "asked_cage", timesTalked = { min = 1 } },
          text = "Last time you called this a cage. I have thought of little else. Cages have doors, you know. That is the unsettling part." },
        { id = "cb_stay", once = true, priority = 30, when = { npcFlag = "heard_thin", timesTalked = { min = 1 } },
          text = "You asked what happens to the ones who stay. One of them asked about you, after you left. I did not give your name." },
        { id = "cb_hand", once = true, priority = 30, when = { npcFlag = "read_hand", timesTalked = { min = 1 } },
          text = "The other hand in your file has written nothing since you asked. I find that more worrying, not less." },
        { id = "cb_mortal", once = true, priority = 30, when = { npcFlag = "heard_mortal", timesTalked = { min = 1 } },
          text = "Since you asked, I have tried to remember my face. I got as far as the eyes. Kind, I think. Or only tired." },
        { id = "cb_turn", once = true, priority = 30, when = { npcFlag = "answered_turn", timesTalked = { min = 1 } },
          text = "Are you the same one who left here last time? Do not answer. Just notice that you had to think about it." },
        { id = "cb_name", once = true, priority = 30, when = { npcFlag = "promised_name", timesTalked = { min = 1 } },
          text = "I have been saying your name, as I promised. Out there. You are not in the gray, so they only look puzzled." },
      },
      choices = {
        { text = "Return me to life.", next = "BUSINESS" },
        { text = "What does my file say?", next = "record" },
        { text = "I have questions.", next = "ask" },
        { text = "What if I don't go back?", next = "stay", fx = { npcFlag = { set = "asked_stay" } } },
      },
    },

    ---------------------------------------------------------------------------
    -- The file
    ---------------------------------------------------------------------------
    record = {
      lines = {
        { id = "rec_default", text = "{deaths} deaths. The last at {deathplace}. The records are complete, if not flattering." },
        { id = "rec_one", when = { deaths = { max = 1 } }, text = "One death. The file is a single page. Keep it that way, if you can." },
        { id = "rec_trivial", priority = 10, when = { deathCause = "trivial" }, text = "{deaths} deaths, the last at the hands of {killer}. I have underlined it." },
        { id = "rec_ten", when = { deaths = { min = 10, max = 49 } },
          text = "{deaths} entries. Each one ends the same way and begins the same way. It is the middles I read twice." },
        { id = "rec_fifty", when = { deaths = { min = 50 } },
          text = "{deaths}. I have started noting the weather in the margins, to tell them apart. It has not helped." },
      },
      choices = {
        { text = "Burn the file.", next = "burn", fx = { trait = { witty = 1 } } },
        { text = "Is there anything else in there?", next = "pages", fx = { trait = { curious = 1 } } },
        { text = "What happens when it's full?", next = "full" },
        { text = "Back to the matter at hand.", next = "hello" },
      },
    },
    burn = {
      lines = { { id = "b_default", text = "It does not burn. Many have asked. One tried." } },
      choices = {
        { text = "Who tried?", next = "burn2" },
        { text = "Return me to life.", next = "BUSINESS" },
      },
    },
    burn2 = {
      lines = {
        { id = "b2_default", text = "Someone who wanted to be forgotten more than they wanted to live. I understood them. I still could not let them go." },
        { id = "b2_mage", when = { class = "MAGE" },
          text = "One of yours. They set the whole hill alight. The file was fine. They were not, and then they were, and then they apologized." },
      },
      choices = {
        { text = "Why not let them be forgotten?", next = "forgotten" },
        { text = "Back to the matter at hand.", next = "hello" },
      },
    },
    forgotten = {
      big = true,
      lines = {
        { id = "fg_default", key = true,
          text = "Because being forgotten is the only death I cannot undo. Everything else, I can work with." },
      },
      choices = {
        { text = "Then don't forget me.", next = "parting", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Some people deserve forgetting.", next = "deserve", fx = { align = { light = -1 }, trait = { stern = 1 } } },
        { text = "Back to the matter at hand.", next = "hello" },
      },
    },
    deserve = {
      lines = {
        { id = "ds_default", text = "Perhaps. I am not the one who decides who deserves. I only decide who is remembered, and I have decided: everyone." },
        { id = "ds_shadow", when = { alignment = { axis = "light", max = -40 } },
          text = "You are thinking of yourself. Do not argue; this place is too thin for it. You are remembered too. That is not a threat." },
      },
      choices = { { text = "Return me to life.", next = "BUSINESS" }, { text = "Back to the matter at hand.", next = "hello" } },
    },
    pages = {
      lines = {
        { id = "pg_default", key = true,
          text = "There are pages at the back I did not write. The hand is neat. Patient. It dates things that have not happened yet.",
          fx = { hear = "spirithealer_other_hand", npcFlag = { set = "saw_hand" } } },
        { id = "pg_grown", when = { deaths = { min = 25 } }, fx = { hear = "spirithealer_other_hand", npcFlag = { set = "saw_hand" } },
          text = "The pages at the back have grown. Whoever writes them is keeping pace with you. Perhaps a little ahead." },
        { id = "pg_again", priority = 10, when = { npcFlag = "read_hand" },
          text = "The other pages again. The last line is still the one I read you. Nothing has been added. Nothing has been crossed out, either." },
      },
      choices = {
        { text = "Read one to me.", next = "pages_read", fx = { npcFlag = { set = "read_hand" } } },
        { text = "Who wrote them?", next = "pages_who" },
        { text = "Leave them closed.", next = "pages_closed", fx = { trait = { cautious = 1 } } },
      },
    },
    pages_read = {
      big = true,
      lines = {
        { id = "pr_default", key = true, text = "One line, then. \"Not here. Not yet. Not like this.\" It is underlined three times." },
        { id = "pr_light", when = { alignment = { axis = "light", min = 40 } },
          text = "\"Not here. Not yet.\" And beneath it, smaller: \"They will be glad.\" I do not know who they are." },
        { id = "pr_shadow", when = { alignment = { axis = "light", max = -40 } },
          text = "\"Not here. Not yet.\" Then a line struck out so hard the page tore. I will not guess at what it said." },
        { id = "pr_taint", when = { taint = { min = 30 } },
          text = "The page is wet. It was not wet a moment ago. Close it. Please. Close it now." },
      },
      choices = {
        { text = "Is that a promise or a warning?", next = "pages_both" },
        { text = "I'd rather not know any more.", next = "hello" },
      },
    },
    pages_both = {
      lines = { { id = "pb_default", text = "Yes." }, { id = "pb_default2", text = "Both, I expect. Most true things are." } },
      choices = { { text = "Return me to life.", next = "BUSINESS" }, { text = "Back to the matter at hand.", next = "hello" } },
    },
    pages_who = {
      lines = {
        { id = "pw_default", text = "I asked once. The question went into the mist, and something came back. Not an answer. A page in my own handwriting, very old." },
      },
      choices = {
        { text = "Your handwriting? Were you alive once?", next = "self" },
        { text = "Back to the matter at hand.", next = "hello" },
      },
    },
    pages_closed = {
      lines = { { id = "pc_default", text = "Wise. Most of what is written about us is better lived than read." } },
      choices = { { text = "Return me to life.", next = "BUSINESS" }, { text = "Back to the matter at hand.", next = "hello" } },
    },
    full = {
      lines = {
        { id = "fu_default", text = "It does not fill. Every time I reach the last page, there is another behind it. Files close another way." },
      },
      choices = {
        { text = "What closes a file?", next = "finished" },
        { text = "Back to the matter at hand.", next = "hello" },
      },
    },

    ---------------------------------------------------------------------------
    -- Questions
    ---------------------------------------------------------------------------
    ask = {
      lines = {
        { id = "ask_default", text = "Ask. This place keeps its own counsel, but I am not this place." },
        { id = "ask_default2", text = "Questions are allowed here. Answers are rationed." },
        { id = "ask_often", when = { timesTalked = { min = 5 } },
          text = "Still asking. Good. The ones who stop asking are the ones who stop coming back." },
      },
      choices = {
        { text = "What are you?", next = "mystery" },
        { text = "Why send us back at all?", next = "why" },
        { text = "What lies past the mist?", next = "beyond" },
        { text = "Who else is out there in the gray?", next = "others" },
      },
    },

    mystery = {
      lines = {
        { id = "m_default", text = "I am the one who stands here. That is all I am permitted to know, and more than most ask." },
        { id = "m_again", priority = 10, when = { npcFlag = "asked_what" },
          text = "You asked that before. My answer has not changed. I have, a little." },
      },
      choices = {
        { text = "Permitted by whom?", next = "mystery2", fx = { trait = { curious = 1 }, npcFlag = { set = "asked_what" } } },
        { text = "Were you ever alive?", next = "self", fx = { npcFlag = { set = "asked_what" } } },
        { text = "And what am I?", next = "turn", fx = { npcFlag = { set = "asked_what" } } },
        { text = "Fair enough.", next = "ask" },
      },
    },
    mystery2 = {
      lines = {
        { id = "m2_default", text = "Ask me again when you have died a hundred times. I may know by then. So may you." },
        { id = "m2_default2", text = "Whoever set this hill here and the mist around it. They do not visit. They left instructions, and a great deal of silence." },
        { id = "m2_hundred", tags = { "news" }, when = { deaths = { min = 100 } },
          text = "A hundred deaths. I promised you an answer. Here it is: I do not know, and I no longer believe anyone does. That frightens me less than it did." },
      },
      choices = {
        { text = "Do you ever disobey?", next = "disobey" },
        { text = "Return me to life.", next = "BUSINESS" },
        { text = "Back to my questions.", next = "ask" },
      },
    },
    disobey = {
      big = true,
      lines = {
        { id = "do_default", key = true,
          text = "Once. I held someone past their time, because they were weeping and I wanted them to finish. The mist went very cold. Nothing else happened, I think." },
      },
      choices = {
        { text = "Would you do it again?", next = "disobey2" },
        { text = "Back to my questions.", next = "ask" },
      },
    },
    disobey2 = {
      lines = { { id = "do2_default", text = "Yes. Do not tell anyone. I am not sure who you would tell, but do not." } },
      choices = { { text = "Your secret's safe.", next = "ask", fx = { affinity = 1 } }, { text = "Return me to life.", next = "BUSINESS" } },
    },

    self = {
      big = true,
      lines = {
        { id = "s_default", key = true,
          text = "I think so. There are things I know without having learned them. The weight of a cloak. How bread smells. Grief.",
          fx = { hear = "spirithealer_was_mortal", npcFlag = { set = "heard_mortal" } } },
        { id = "s_again", priority = 10, when = { npcFlag = "heard_mortal" },
          text = "Still thinking about that? So am I. Yesterday I remembered a door with a blue latch. I do not know whose." },
      },
      choices = {
        { text = "Who were you?", next = "self2" },
        { text = "[Persuade] You were one of us. Someone sent you back here.", tag = "Persuade", next = "self_reveal",
          check = { pass = { any = { { trait = "curious" }, { deaths = { min = 25 } }, { affinity = { min = 3 } } } } },
          fail = { next = "self_closed" } },
        { text = "That's terribly sad.", next = "self_sad", fx = { trait = { kind = 1 } } },
        { text = "Back to my questions.", next = "ask" },
      },
    },
    self2 = {
      lines = {
        { id = "s2_default", text = "I do not know. When I reach for it I find only the people I have sent back. Thousands of faces. Mine must be in there somewhere." },
      },
      choices = {
        { text = "Then I'll remember you.", next = "remember", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Back to my questions.", next = "ask" },
      },
    },
    remember = {
      big = true,
      lines = {
        { id = "rm_default", key = true,
          text = "...No one has offered that before. Be careful. Promises made here are heard by more than me. But thank you." },
      },
      choices = {
        { text = "I meant it.", next = "parting", fx = { trait = { kind = 1 } },
          journal = { first = "I promised a spirit healer I would remember them. I don't know who else heard me promise it.",
                      third = "{name} promised a spirit healer to remember them, and meant it." } },
      },
    },
    self_sad = {
      lines = { { id = "ss_default", text = "Is it? I am not sure. Sad would need me to know what I lost. I only know the shape of the hole." } },
      choices = { { text = "Return me to life.", next = "BUSINESS" }, { text = "Back to my questions.", next = "ask" } },
    },
    self_reveal = {
      big = true,
      lines = {
        { id = "sr_default", key = true,
          text = "...Yes. Someone stood here once and said \"not yet\" to me. I asked who would say it to the next one. They smiled, and stepped aside." },
      },
      choices = {
        { text = "Is that a memory, or a story?", next = "self_story" },
        { text = "Will I end up standing here too?", next = "successor" },
      },
    },
    self_story = {
      lines = { { id = "st_default", text = "Here, the difference is thin. I tell it either way. It keeps me standing." } },
      choices = { { text = "Will I end up standing here too?", next = "successor" }, { text = "Back to my questions.", next = "ask" } },
    },
    successor = {
      lines = {
        { id = "su_default", text = "Perhaps. You ask the right questions for it. That is not quite a compliment." },
        { id = "su_many", when = { deaths = { min = 50 } },
          text = "You know the hill better than some who have stood on it. Do not look so pleased. It is not a promotion." },
      },
      choices = {
        { text = "I think I'd be good at it.", next = "parting", fx = { trait = { brave = 1 } } },
        { text = "I hope not.", next = "parting" },
      },
    },
    self_closed = {
      lines = { { id = "sc_default", text = "No. Enough. Some doors here are shut for a reason, and I am one of them." } },
      choices = { { text = "Return me to life.", next = "BUSINESS" }, { text = "Back to my questions.", next = "ask" } },
    },

    turn = {
      big = true,
      lines = {
        { id = "t_default", key = true,
          text = "Let me ask you instead. When I send you back, is it the same you who wakes? Or someone who only remembers being you?" },
      },
      choices = {
        { text = "The same. I remember everything.", next = "turn_same", fx = { npcFlag = { set = "answered_turn" } } },
        { text = "I don't know.", next = "turn_unsure", fx = { npcFlag = { set = "answered_turn" }, trait = { curious = 1 } } },
        { text = "Does it matter?", next = "turn_matter", fx = { npcFlag = { set = "answered_turn" } } },
        { text = "I already know the answer to that.", next = "turn_forsaken", when = { race = "Scourge" },
          fx = { npcFlag = { set = "answered_turn" } } },
      },
    },
    turn_same = {
      lines = {
        { id = "ts_default", text = "Memory is a thread, not a rope: it holds the shape, not the weight. But you say it as if you believe it, and belief does much of the work here." },
      },
      choices = { { text = "Return me to life.", next = "BUSINESS" }, { text = "Back to my questions.", next = "ask" } },
    },
    turn_unsure = {
      lines = {
        { id = "tu_default", text = "Good. The certain ones worry me. They come back harder each time, like a blade folded too often." },
      },
      choices = { { text = "Return me to life.", next = "BUSINESS" }, { text = "Back to my questions.", next = "ask" } },
    },
    turn_matter = {
      lines = {
        { id = "tm_default", text = "To me, no. I send back whoever is standing here. To you, I think it matters a great deal, and I think you know it." },
      },
      choices = { { text = "Return me to life.", next = "BUSINESS" }, { text = "Back to my questions.", next = "ask" } },
    },
    turn_forsaken = {
      big = true,
      lines = {
        { id = "tf_default", key = true,
          text = "Yes. You were dragged back once, without being asked. I ask. That is the whole difference between me and him, and it is everything." },
      },
      choices = {
        { text = "Then why do I feel so little?", next = "turn_forsaken2" },
        { text = "Back to my questions.", next = "ask" },
      },
    },
    turn_forsaken2 = {
      lines = { { id = "tf2_default", text = "You feel. You have only learned to whisper it. I hear whispers well. It is most of what reaches me up here." } },
      choices = { { text = "Return me to life.", next = "BUSINESS", fx = { affinity = 1 } }, { text = "Back to my questions.", next = "ask" } },
    },

    ---------------------------------------------------------------------------
    -- The argument: why send anyone back?
    ---------------------------------------------------------------------------
    why = {
      big = true,
      lines = {
        { id = "w_default", text = "Because you are not finished. None of you ever are." },
        { id = "w_default2", text = "Because someone has to stand between you and the quiet, and I am the one standing." },
        { id = "w_shadow", when = { alignment = { axis = "light", max = -40 } },
          text = "Because I am asked to, not because you deserve it. Forgive the honesty. This place makes it easy." },
      },
      choices = {
        { text = "Who decides when I'm finished?", next = "finished" },
        { text = "Doesn't sending us back cheapen death?", next = "cheapen" },
        { text = "Thank you.", next = "BUSINESS", fx = { align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Back to my questions.", next = "ask" },
      },
    },
    finished = {
      lines = {
        { id = "f_default", text = "Not me. I only notice that you are not. A finished soul settles, like snow. You are still falling." },
        { id = "f_default2", text = "The finished ones stand very still and stop asking questions. You have never once stood still." },
      },
      choices = {
        { text = "And when I settle?", next = "settle" },
        { text = "What if I never feel finished?", next = "never" },
        { text = "Back to my questions.", next = "ask" },
      },
    },
    settle = {
      lines = {
        { id = "se_default", text = "Then you will walk past this hill without stopping, and I will not be the one who meets you. Someone else will. Be kind to them; they will be nervous." },
        { id = "se_default2", text = "Then I will close your file. Gently. I have closed a great many gently. It is the one thing I am sure I am good at." },
      },
      choices = { { text = "Return me to life.", next = "BUSINESS" }, { text = "Back to my questions.", next = "ask" } },
    },
    never = {
      lines = {
        { id = "nv_default", text = "Then you are like most of the living, and every one of the dead I send back. It is not a flaw. It is what keeps the world turning." },
      },
      choices = { { text = "Return me to life.", next = "parting" }, { text = "Back to my questions.", next = "ask" } },
    },
    cheapen = {
      big = true,
      lines = {
        { id = "ch_default", key = true, text = "Does a song mean less because it can be sung twice?" },
        { id = "ch_many", when = { deaths = { min = 25 } },
          text = "You ask that with {deaths} deaths behind you. Does a song mean less because it can be sung twice? Or more?" },
      },
      choices = {
        { text = "A song isn't a life.", next = "song", fx = { trait = { skeptical = 1 } } },
        { text = "Then death means nothing.", next = "nothing", fx = { trait = { skeptical = 1 } } },
        { text = "Maybe it's a mercy.", next = "mercy", fx = { align = { light = 1 } } },
        { text = "Maybe it's a cage.", next = "cage", fx = { npcFlag = { set = "asked_cage" } } },
      },
    },
    song = {
      lines = {
        { id = "so_default", text = "No. Which is why I keep the record. Someone must remember that every ending was real, even the ones you walked away from." },
        { id = "so_default2", text = "You are right, and I am glad you are right. If it were only a song, I could stop listening." },
      },
      choices = { { text = "Return me to life.", next = "BUSINESS" }, { text = "Back to my questions.", next = "ask" } },
    },
    nothing = {
      lines = {
        { id = "no_default", text = "Ask the ones I could not send back. Some arrive with no body left to return to. Some with no will. Death means a great deal to them." },
      },
      choices = {
        { text = "Who are they?", next = "others" },
        { text = "I spoke too quickly.", next = "ask", fx = { trait = { kind = 1 } } },
      },
    },
    mercy = {
      lines = {
        { id = "me_default", text = "It is meant as one. Meaning a thing and being it are not the same. I spend my days in the space between them." },
      },
      choices = { { text = "Return me to life.", next = "BUSINESS" }, { text = "Back to my questions.", next = "ask" } },
    },
    cage = {
      big = true,
      lines = {
        { id = "cg_default", key = true, text = "Perhaps. Every cage is kind to something. Would you have me open it?" },
      },
      choices = {
        { text = "Yes. Let me choose.", next = "stay", fx = { align = { order = -1 }, npcFlag = { set = "asked_stay" } } },
        { text = "No. Not yet.", next = "parting" },
        { text = "[Persuade] You're caged too, aren't you?", tag = "Persuade", next = "healer_cage",
          check = { pass = { any = { { trait = "curious" }, { trait = "kind" }, { deaths = { min = 25 } } } } },
          fail = { next = "cage_fail" } },
        { text = "Back to my questions.", next = "ask" },
      },
    },
    healer_cage = {
      big = true,
      lines = {
        { id = "hc_default", key = true,
          text = "...I have not left this hill since before your grandparents were born. I am not sure it is one hill. Some nights I hear footsteps on the others, and they are mine." },
      },
      choices = {
        { text = "Do you want to leave?", next = "want_leave" },
        { text = "Back to my questions.", next = "ask" },
      },
    },
    want_leave = {
      lines = {
        { id = "wl_default", text = "Every day. And every day someone frightened comes up the hill, and I stay. Wanting to leave is not leaving. You know that better than most." },
      },
      choices = { { text = "Return me to life.", next = "parting", fx = { affinity = 1 } } },
    },
    cage_fail = {
      lines = { { id = "cf_default", text = "Do not pity me. You are in no position to. You are, after all, dead." } },
      choices = { { text = "Return me to life.", next = "BUSINESS" }, { text = "Back to my questions.", next = "ask" } },
    },

    ---------------------------------------------------------------------------
    -- Refusing to go back
    ---------------------------------------------------------------------------
    stay = {
      big = true,
      lines = {
        { id = "st0_default", text = "Then don't. You are allowed to refuse me. Few do." },
        { id = "st0_again", priority = 10, when = { npcFlag = "heard_thin" },
          text = "You keep asking. One day you will mean it, and I will have to let you." },
      },
      choices = {
        { text = "What happens to the ones who stay?", next = "stay_what" },
        { text = "[Deceive] I'm ready. I'm not afraid.", tag = "Deceive", next = "stay_what",
          fail = { next = "stay_seen" } },
        { text = "I was only asking.", next = "hello" },
        { text = "Send me back.", next = "parting" },
      },
    },
    stay_what = {
      big = true,
      lines = {
        { id = "sw_default", key = true, fx = { npcFlag = { set = "heard_thin" } },
          text = "They thin. First the voice goes, then the name, then the reason they stayed. Then they walk into the mist, and none has come back to tell me what met them." },
      },
      choices = {
        { text = "I'll stay a little longer.", next = "linger", fx = { align = { order = -1 } } },
        { text = "That sounds peaceful.", next = "peaceful" },
        { text = "Send me back.", next = "parting" },
      },
    },
    peaceful = {
      lines = { { id = "pe_default", text = "It looks peaceful from here. Most things do, from far enough away." } },
      choices = { { text = "I'll stay a little longer.", next = "linger" }, { text = "Send me back.", next = "parting" } },
    },
    linger = {
      big = true,
      lines = {
        { id = "li_default", text = "Do you hear them? They have noticed you. They want to know what a living soul sounds like, up close." },
        { id = "li_default2", text = "Look at your hands. Your edges are softening already. Look at them. Do you see?" },
        { id = "li_taint", when = { taint = { min = 30 } },
          text = "They are not looking at you. They are looking at what came with you. And it is looking back. Go. Now." },
      },
      choices = {
        { text = "Send me back. Now.", next = "parting" },
        { text = "Let them come.", next = "linger2", fx = { trait = { brave = 1 } } },
      },
    },
    linger2 = {
      big = true,
      lines = {
        { id = "l2_default", key = true,
          text = "No. Not here. Not yet. Not like this. I said you may refuse me. I never said I would make it easy." },
      },
      choices = {
        { text = "Those words. They're in my file.", next = "linger3", when = { npcFlag = "read_hand" } },
        { text = "Return me to life.", next = "BUSINESS",
          journal = { first = "I tried to stay in the gray. The spirit healer wouldn't let me. Something out there was listening.",
                      third = "{name} tried to stay among the dead, and was sent back." } },
      },
    },
    linger3 = {
      big = true,
      lines = {
        { id = "l3_default", text = "...So they are. I did not know I was going to say them until I had. Go. Before either of us learns who wrote them." },
      },
      choices = { { text = "Return me to life.", next = "BUSINESS" } },
    },
    stay_seen = {
      lines = {
        { id = "sn_default", text = "Here, the lie arrives before the words do. You are afraid. That is all right. So am I, sometimes." },
      },
      choices = { { text = "Send me back.", next = "parting" }, { text = "I was only asking.", next = "hello" } },
    },

    ---------------------------------------------------------------------------
    -- Past the mist, and the others in it
    ---------------------------------------------------------------------------
    beyond = {
      lines = {
        { id = "by_default", text = "I have looked. The mist looks back." },
        { id = "by_default2", text = "Something patient. That is all I am sure of. It has never once been in a hurry." },
        { id = "by_again", priority = 10, when = { npcFlag = "asked_beyond" },
          text = "Last time I told you the mist looks back. I was being poetic, I thought. I am less sure now that I was." },
      },
      choices = {
        { text = "Have you ever gone in?", next = "door", fx = { npcFlag = { set = "asked_beyond" } } },
        { text = "Is the Light waiting there?", next = "light", fx = { npcFlag = { set = "asked_beyond" } } },
        { text = "Then what's the point of any of this?", next = "point", fx = { npcFlag = { set = "asked_beyond" } } },
        { text = "Back to my questions.", next = "ask" },
      },
    },
    door = {
      lines = {
        { id = "dr_default", key = true, fx = { hear = "spirithealer_the_door" },
          text = "There is a door. I have never opened it. Some days it is warm. Some days I hear someone on the other side, waiting for me to knock." },
      },
      choices = {
        { text = "Why not open it?", next = "door2" },
        { text = "Back to my questions.", next = "ask" },
      },
    },
    door2 = {
      lines = {
        { id = "d2_default", text = "Because the moment I do, there is no one here to say \"not yet\". And there is always someone coming up the hill." },
      },
      choices = { { text = "Return me to life.", next = "parting" }, { text = "Back to my questions.", next = "ask" } },
    },
    light = {
      lines = {
        { id = "lt_default", text = "The Light reaches here, thinly, like dawn through a shutter. Whether it waits beyond, or only passes through on its way elsewhere, I cannot say." },
        { id = "lt_holy", when = { class = { "PRIEST", "PALADIN" } },
          text = "You want me to say yes. Your Light comes through here every day. It has never once stopped to tell me where it is going." },
        { id = "lt_forsaken", when = { race = "Scourge" },
          text = "You wonder whether it would burn you, over there. I do not know. I know it does not burn you here. Make of that what you can." },
      },
      choices = {
        { text = "And the Shadow?", next = "shadow" },
        { text = "Back to my questions.", next = "ask" },
      },
    },
    shadow = {
      lines = {
        { id = "sh_default", text = "The Shadow is here too. It sits in the corners and takes notes. We have an understanding. I do not ask what it writes." },
      },
      choices = { { text = "Return me to life.", next = "BUSINESS" }, { text = "Back to my questions.", next = "ask" } },
    },
    point = {
      big = true,
      lines = {
        { id = "pt_default", key = true,
          text = "The point is the hill you stand on, the road down it, and whatever you do at the bottom. The mist is not the point. The mist is the edge of the page." },
      },
      choices = {
        { text = "Then I'd better go write something.", next = "parting", fx = { align = { light = 1 } } },
        { text = "Back to my questions.", next = "ask" },
      },
    },

    others = {
      lines = {
        { id = "o_default", text = "The ones who did not go back. Some chose. Some had nothing left to go back to. They gather where the mist is thickest and watch the living pass." },
        { id = "o_default2", text = "Look past my shoulder. No, don't. They prefer not to be looked at directly. It reminds them." },
      },
      choices = {
        { text = "What do they want?", next = "others_want" },
        { text = "Are any of them mine?", next = "mine" },
        { text = "Are they dangerous?", next = "others_danger" },
        { text = "Back to my questions.", next = "ask" },
      },
    },
    others_want = {
      lines = {
        { id = "ow_default", text = "Mostly to be said aloud. A name, spoken once a day, keeps a shape from thinning. I say as many as I can." },
      },
      choices = {
        { text = "If I end up out there, say mine.", next = "name_promise", fx = { npcFlag = { set = "promised_name" } } },
        { text = "Back to my questions.", next = "ask" },
      },
    },
    name_promise = {
      big = true,
      lines = {
        { id = "np_default", key = true,
          text = "I will. Every day, until there is no one left to hear it. That may be a long time. I am very patient." },
      },
      choices = {
        { text = "Thank you.", next = "parting", fx = { affinity = 1, trait = { kind = 1 } },
          journal = { first = "A spirit healer promised to say my name every day, if I ever stay in the gray.",
                      third = "A spirit healer promised to keep {name}'s name said aloud among the dead." } },
      },
    },
    mine = {
      lines = {
        { id = "mn_default", text = "Everyone has someone in the gray. Yours are quiet. Either they are at peace, or they are waiting until you are ready." },
        { id = "mn_forsaken", when = { race = "Scourge" },
          text = "Some of them knew you, before. They do not blame you for what walks in your body. They blame him." },
        { id = "mn_human", when = { race = "Human" },
          text = "Lordaeron is still crowded here. They ask after the living. I tell them the living are stubborn." },
        { id = "mn_nightelf", when = { race = "NightElf" },
          text = "Yours drift as wisps, and they keep turning toward a mountain I cannot see. Toward home, I suppose." },
        { id = "mn_orc", when = { race = "Orc" },
          text = "Yours are loud even here. Some still carry a sickness in the blood, brought from somewhere else. It is fading. Slowly." },
        { id = "mn_tauren", when = { race = "Tauren" },
          text = "Yours never stay long. Something calls them onward, and they go gladly. I envy them that." },
        { id = "mn_troll", when = { race = "Troll" },
          text = "Yours bargain with me as if I were a loa. I am not. I accept the offerings anyway. It seems to comfort them." },
        { id = "mn_dwarf", when = { race = "Dwarf" },
          text = "Yours ask whether the mountain still stands. I tell them yes. I have never checked." },
        { id = "mn_gnome", when = { race = "Gnome" },
          text = "Yours came all at once, from under a mountain, gasping and green. I remember the day. I would rather not." },
      },
      choices = { { text = "Return me to life.", next = "parting" }, { text = "Back to my questions.", next = "ask" } },
    },
    others_danger = {
      lines = {
        { id = "od_default", text = "To you? No. To me? They are what I would become, if I ever stopped. That is a kind of danger." },
        { id = "od_taint", when = { taint = { min = 30 } },
          text = "Not to you. To what came with you, perhaps. They do not like it. Neither do I." },
      },
      choices = { { text = "Return me to life.", next = "parting" }, { text = "Back to my questions.", next = "ask" } },
    },

    ---------------------------------------------------------------------------
    -- The send-off
    ---------------------------------------------------------------------------
    parting = {
      lines = {
        { id = "pa_default", text = "Go on. The world is louder than you remember. Let it be loud." },
        { id = "pa_default2", text = "Walk carefully. And if you cannot walk carefully, walk anyway." },
        { id = "pa_light", when = { alignment = { axis = "light", min = 40 } }, text = "Go. Do more of whatever it is you have been doing. They notice, out there." },
        { id = "pa_shadow", when = { alignment = { axis = "light", max = -40 } }, text = "Go. And this time, perhaps, give me something kinder to write." },
        { id = "pa_many", when = { deaths = { min = 25 } }, text = "Go. I will see you soon. I would rather not, but I will." },
      },
      choices = { { text = "Return me to life.", next = "BUSINESS" } },
    },
  },
  topics = {
    _none = {
      { id = "t_none", text = "The living ask about the living. I keep other records." },
      { id = "t_none2", text = "Ask someone with a pulse. I gave mine up, I think, a long time ago." },
    },
    scarlet_crusade = {
      { id = "t_scarlet", text = "They send me so many, and they arrive so certain. Certainty does not survive the hill. I watch it leave them. It is never pretty." },
    },
    argent_dawn = {
      { id = "t_argent", text = "They argue about the dead with great care. I appreciate that. Most people only argue with them." },
    },
  },
}
