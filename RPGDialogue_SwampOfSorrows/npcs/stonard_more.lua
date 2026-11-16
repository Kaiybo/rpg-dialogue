-- Stonard, the rest of the town: Dar and his errands, the wind riders, the grimoire seller and the warrior trainer. Voice: bibles/swampofsorrows.md
local P = RPGDialogueAPI:Pack("rpgd.swampofsorrows")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "dar", id = TODO_NPC("Dar"), name = "Dar",
  bible = "bibles/swampofsorrows.md", role = "questgiver", tier = "quest",
  communities = { "stonard" }, temper = { "dry" }, values = { "loyal", "practical" },
  notices = { "class", "weary" },

  impression = {
    first = "Dar is a plain Stonard orc who admits the town has no comforts and stays anyway, because its old stones matter to someone. He sends errands down to Tok'Kar on the beach, and Tok'Kar, by all accounts, insults him in return.",
    third = "{name} met Dar, an orc of Stonard who keeps the outpost's errands moving.",
  },

  greetings = {
    { id = "g_default", text = "Another one through the swamp in one piece. That takes some nerve, so I'll say well done." },
    { id = "g_back", when = { metBefore = true }, text = "Back in Stonard again? Then it must be growing on you, which is more than it's done for me." },
    { id = "g_tokkar", when = { questActive = TODO_QUEST("Lack of Surplus") }, text = "Tok'Kar's still waiting on that meat, so don't let the crocolisks have you first." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look like the swamp chewed on you and spat you out. It does that, so sit a moment before you go back in." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Good, because I've got a cook on the beach who's out of meat and a swamp full of it." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Probably that they've been through a war, a defeat and a great deal of rain, and that nobody's thanked them for any of it. I'm no shaman, but I've stood here long enough to feel that much." } },
      choices = {
        { text = "Then I'll thank them, Dar. Old stones deserve it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Stones don't need thanks. They need repairing.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "None that I know of, though Greshka swears the old warlocks left something of themselves in these stones, and Karakul keeps the old hearth burning, just in case. Me, I keep the meat moving and try not to think about it." } },
      choices = {
        { text = "Leave the old stones be. The Warchief would want that.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If there's power in those stones, someone should use it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "Nobody's told me straight, and I suspect Tok'Kar doesn't know either, because his soldiers only ever see the wake of it. If you went and had a quiet look, I'd sleep better, and so would the cook." } },
      choices = {
        { text = "I'll report what I see to Ruag first.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll handle whatever it is myself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. There's enough old history in these stones that I'd wager they've got something to say to you, if you've the patience to listen." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest. Stonard could use a few prayers, though I've never been sure whose ears they'd reach out here." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } },
          text = "A mage. Well, you came through the swamp in one piece, so whatever you're doing must be working." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } },
          text = "A warlock. I'll not pretend I like it, since the old Horde's warlocks gave the orders when these walls went up, but the Warchief says you serve the Horde now, and I take him at his word." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } },
          text = "You've got a light step, which is a rare thing in this mud, so I'd wager you're either a scout or up to something, and I'm too tired to ask which." },
        { id = "h_default", key = true,
          text = "I'm Dar. Stonard's a bit short on comforts, as you've noticed, but there's enough history in these stones that it must matter to somebody, and I suppose that's why I stay. It isn't for the scenery, I'll tell you that." },
        { id = "h_meat_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Lack of Surplus"), days = 3 } },
          text = "Tok'Kar got his sawtooth flanks, and his soldiers ate well, and I hear he said something about my face while he was at it. He always does, so I'll take it as thanks." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've got the time, which is the one thing Stonard has plenty of." },
        { id = "h_again2", text = "Go on, ask. The mud isn't going anywhere, and neither am I." },
      },
      choices = {
        { text = "What would these old stones say, if they could speak?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do the old stones of Stonard hold any magic, Dar?", next = "xhcast", when = { class = { "PRIEST", "MAGE", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "What comes up out of the sea at Tok'Kar's beach?", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Who's Tok'Kar?", next = "tokkar" },
        { text = "Why does Stonard matter, then?", next = "history" },
        { text = "Doesn't it feel like home?", next = "home" },
        { text = "These stones were raised by my grandfathers' Horde.", next = "k_orc", when = { race = "Orc" } },
        { text = "The swamp feels like home to me, Dar.", next = "k_troll", when = { race = "Troll" } },
        { text = "I'll be on my way.", next = "END" },
      },
    },

    tokkar = {
      lines = {
        { id = "tk_default", text = "Tok'Kar keeps a little outpost on the eastern beach, and between guard duty and cooking he has no time to hunt. He's out of sawtooth meat, which his soldiers love, so somebody has to bring him eight good flanks." },
        { id = "tk_done", when = { questDone = TODO_QUEST("Lack of Surplus") },
          text = "The cook on the eastern beach, and you've met him, so you know he talks too much. His soldiers eat well, though, and that's thanks to you." },
      },
      choices = {
        { text = "Any sawtooth will do?", next = "tokkar_young" },
        { text = "Why can't his own soldiers hunt?", next = "tokkar_beach" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tokkar_young = {
      lines = {
        { id = "ty_default", text = "No, and mind this part: leave the young ones be. Kill every small sawtooth now and there won't be a big one left to eat next season, and then Tok'Kar will complain to me about that as well." },
      },
      choices = {
        { text = "Leave the young. That's good hunting.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Meat is meat. I'll take what I find.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    tokkar_beach = {
      lines = {
        { id = "tb_default", text = "Because something keeps coming up out of the sea at that beach, and every soldier he has is watching the water. A cook who has to stand guard doesn't have time to wrestle crocolisks too." },
      },
      choices = { { text = "Then I'll bring his meat.", next = "BACK", fx = { affinity = 2, standing = { stonard = 1 } } } },
    },

    history = {
      lines = {
        { id = "hi_default", text = "The old Horde built Stonard when the Dark Portal first opened, so it's one of the oldest things our people ever raised on this world. The new Horde rebuilt it, and now it watches the Portal road and the sunken temple both." },
      },
      choices = {
        { text = "What became of Rockard?", next = "history_rockard" },
        { text = "Something else.", next = "BACK" },
      },
    },
    history_rockard = {
      lines = {
        { id = "hr_default", text = "Ogres hold it now, the Dreadmaul, out in the Blasted Lands. Stonard had a sister once, and now it has a neighbor that throws rocks, which is a fair summary of the Second War." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    home = {
      lines = {
        { id = "ho_default", text = "Not a bit of it. Home was dry, and you could see the sky, and nothing in the water wanted to eat you. But a Horde outpost doesn't run itself, and somebody has to send the meat to the beach." },
      },
      choices = {
        { text = "Duty's enough reason to stay.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "I'd have left long ago.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Where was home, Dar?", next = "home_where" },
      },
    },
    home_where = {
      lines = {
        { id = "hw_default", text = "A camp with walls, if I'm honest, and the Warchief opened the gates. Durotar's the first home most of us chose for ourselves, and I chose to leave it for this, which says something about me I don't like to think about." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    k_orc = {
      lines = {
        { id = "xor_default", text = "They were, and they built it to last, I'll give them that. I just wish they'd built it somewhere drier, though I suppose they had other things on their minds." },
        { id = "xor_camp", when = { origin = "orc_camp_born" },
          text = "You were born behind the camp walls, like me. Odd, isn't it, to stand in a town our grandfathers built while they were still free and we were still years from being born." },
      },
      choices = {
        { text = "I'm proud of what they built.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "They built it for a war we shouldn't repeat.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
      },
    },
    k_troll = {
      lines = {
        { id = "xtr_default", text = "Does it? Then you're welcome to my share of it. The trolls at the temple, the Atal'ai, seem to like it here too, and that's no point in its favor." },
      },
      choices = {
        { text = "The Atal'ai are no kin of mine.", next = "BACK", fx = { affinity = 2 } },
        { text = "Who's Tok'Kar?", next = "tokkar" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "There's not much to tell. I came, I stayed, and I send the meat to the beach." } },
    advice = { { id = "tp_ad", text = "Stay on the road, and if the road goes under water, stay where the road used to be." } },
    _none = { { id = "tp_none", text = "Can't help you there. Ask Ruag; he keeps the papers, and the papers know more than I do." } },
  },
}

P:NPC {
  key = "breyk", id = TODO_NPC("Breyk"), name = "Breyk",
  bible = "bibles/swampofsorrows.md", role = "flightmaster", tier = "service",
  communities = { "stonard" }, temper = { "brisk" }, values = { "dutiful" },
  notices = { "race" },

  impression = {
    first = "Breyk keeps the wind riders at Stonard, and spends his days drying their wings and scraping swamp moss off their harness. He complains about the wet the way Kargath's rider master complains about the heat.",
    third = "{name} met Breyk, the wind rider master at Stonard.",
  },

  greetings = {
    { id = "g_default", text = "If you're flying, the riders are dry, or as dry as they get. Where to?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again. The riders know you now, so stand still and let them sniff." },
  },

  notice = {
    { id = "n_scourge", cat = "race", when = { race = "Scourge" },
      text = "Forsaken. The riders sniff at you and shy, but they'll fly, as long as you don't make sudden moves." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Tauren, eh? I've got a strong rider for you, and you'll want him, because the air over the swamp drops like a stone." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Something rises out of that water that no rider likes, and I can't see it, but they can. I fly them the long way round the Pool of Tears now, and nobody's complained about the extra hour yet." } },
      choices = {
        { text = "Trust the riders. The long way round is the wise choice.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Fly straight over it. The Horde can't flinch at every shadow.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Mostly crates for Greshka that rattle when nobody's touching them, and the riders hate every one. I fly them anyway, wrapped in oilcloth against the wet, though I sometimes wonder whether it's the wet I'm keeping out or whatever's in there." } },
      choices = {
        { text = "Rules are rules. Fly them and don't ask.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd open one and look, rules or no rules.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "Once in a while a gryphon passes high over the swamp on its way to Nethergarde, and the riders scream at it until it's gone. I'd like to know what it carries, but my riders aren't built for chasing, and neither am I." } },
      choices = {
        { text = "Then I'll meet them where they land, weapon drawn.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll find where they land and steal what they carry.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The riders won't fly over the temple when the wind comes from the east, and maybe you can tell me why." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest. The riders cough every morning, so if you've a blessing for wet lungs, they'd take it gladly, and so would I." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } },
          text = "A mage. I don't suppose you can dry a wind rider's wings with a spell, but I ask every one of you anyway, because a rider master lives in hope." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } },
          text = "A warlock. Keep the demon well away from the pen, because the riders already hate the swamp, and they'd hate your friend a good deal more." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } },
          text = "Don't sneak up on a wind rider in the mist, because it'll take your arm off before it knows who you are." },
        { id = "h_default", key = true,
          text = "Breyk, wind rider master. From Stonard the riders go north to Kargath over the Steppes, and west to Grom'gol and Booty Bay, and they hate every minute of the wet before they leave." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "The riders don't like flying out of here at night, because the mist sits so low they can't see the trees. They'll go, but they'll grumble the whole way." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've got harness to scrape." },
        { id = "h_again2", text = "Quick, before the mist rolls in." },
      },
      choices = {
        { text = "What spooks your wind riders over the Sunken Temple?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What do your riders carry for the spellcasters who come through?", next = "xhcast", when = { class = { "PRIEST", "MAGE", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Does the Alliance ever try to watch your pen, Breyk?", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "How do the riders take the swamp?", next = "wet" },
        { text = "Do you hear from the other rider masters?", next = "others" },
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "Not now.", next = "END" },
      },
    },
    wet = {
      lines = {
        { id = "we_default", text = "Badly. The moss grows in their harness overnight, their wings never dry, and every one of them coughs in the mornings. I rub them down with hot cloths, and they bite me for it, and we're both happier after." },
      },
      choices = {
        { text = "That's devotion.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    others = {
      lines = {
        { id = "ot_default", text = "Gorrik at Kargath sends word now and then, and it's always the same: too hot. I send back that it's too wet, and we've been having that argument for years now through the riders." },
      },
      choices = {
        { text = "Which of you has it worse?", next = "others_worse" },
        { text = "Something else.", next = "BACK" },
      },
    },
    others_worse = {
      lines = {
        { id = "ow_default", text = "Me, obviously, though he'd say the same. A hot rider just sulks in the shade, but a wet one catches the cough and gives it to every other rider in the pen." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I keep wind riders. Before that I kept wind riders somewhere drier, and I'd like to again someday." } },
    advice = { { id = "tp_ad", text = "Hold on tight over the swamp, because the air drops out from under you when you least expect it." } },
    _none = { { id = "tp_none", text = "I know the sky and the riders, not much else. Try Karakul at the inn." } },
  },
}

P:NPC {
  key = "greshka", id = TODO_NPC("Greshka"), name = "Greshka",
  bible = "bibles/swampofsorrows.md", role = "vendor", tier = "service",
  communities = { "stonard" }, temper = { "cold" }, values = { "proud", "ambitious" },
  notices = { "class" },

  impression = {
    first = "Greshka sells grimoires at Stonard and has no time for anyone who isn't a warlock. To warlocks she is barely kinder: she says they know enough to be dangerous and not enough to be useful.",
    third = "{name} met Greshka, who sells warlock grimoires in Stonard.",
  },

  greetings = {
    { id = "g_default", text = "I have no time for you. Go away." },
    { id = "g_lock", when = { class = "WARLOCK" }, text = "Another warlock. You know just enough to be dangerous, so let's see if you can learn more." },
  },

  notice = {
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "Your imp is looking at my books as if it can read them. It can't, so keep it on a short leash." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Because the Warchief allows it, and because warlocks know things your elements never will. Thrall's people can talk to the wind all they like, but when a demon walks out of the Blasted Lands, it's my customers who'll know its name." } },
      choices = {
        { text = "The Warchief allows it, so I'll respect his word.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Warchief is wrong to allow it, and someone should say so.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = {
        { id = "xhcast_lock", when = { class = "WARLOCK" }, text = "You'd like to know, wouldn't you, warlock? Their god answered them, which is more than most demons will do for you, and look where it left them: under the swamp." },
        { id = "xhcast_default", text = "Closer than Fel'zerul would like to admit. The Atal'ai bargained with a god the way we bargain with demons, and they lost, which is the only lesson any of us needs, if anyone would listen." },
      },
      choices = {
        { text = "Then the Warchief is right to keep warlocks on a leash.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "They lost because they were weak, not because they reached.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "Everyone who buys them shouldn't, by Fel'zerul's reckoning. I sell to whoever has coin and a Horde face, and if some of them go south to the Portal and don't come back, that's their business, not mine." } },
      choices = {
        { text = "You should turn fools away, coin or no coin.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A fool's coin spends as well as anyone's.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You'll want to tell me what warlocks did to your people, I expect, so spare me the lecture and buy something or go." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest. Shadow or loa, it makes no difference to me, because neither of them buys grimoires, so be brief." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } },
          text = "A mage. You study the arcane and look down on my customers, and they study the fel and look down on you, and I sell to whoever pays." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } },
          text = "Keep your hands off my shelves, because some of these grimoires don't like strangers, and I won't be cleaning up after them." },
        { id = "h_default", key = true,
          text = "I sell grimoires to warlocks, and you aren't one. If you've a question, make it quick, and then go and bother Karakul instead." },
        { id = "h_lock", when = { class = "WARLOCK" },
          text = "Greshka. I sell the grimoires that teach your servants new tricks, the Blood Pact and the Firebolt and the rest. You know enough to be dangerous, but you still need training, so let's see what you can pay for." },
      },
      again = {
        { id = "h_again", text = "What else? Be brief." },
        { id = "h_again2", text = "You're still here, so ask your question." },
      },
      choices = {
        { text = "Why does Stonard still keep a warlock's shop, after all that?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is the temple's magic anything like your trade, Greshka?", next = "xhcast", when = { class = { "PRIEST", "MAGE", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Who buys your grimoires that shouldn't, Greshka?", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "What's in your grimoires?", next = "grimoires" },
        { text = "Why sell to warlocks here, of all places?", next = "why" },
        { text = "Fel'zerul is a warlock too.", next = "felzerul" },
        { text = "Show me your grimoires.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "I'll leave you be.", next = "END" },
      },
    },
    grimoires = {
      lines = {
        { id = "gr_default", text = "Lessons for imps and voidwalkers, written so even a demon can follow them. Not that a demon wants to learn, but you'll find that a voidwalker with a grimoire in front of it is a far more obedient servant." },
        { id = "gr_lock", when = { class = "WARLOCK" },
          text = "Your demons can learn new tricks the way a dog can, if you beat them into it with the right words. These books have those words, and they cost what they're worth." },
      },
      choices = {
        { text = "Demons should be mastered, not taught.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Demons shouldn't be in Horde hands at all.", next = "BACK", fx = { align = { light = 1 }, affinity = -2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = {
        { id = "wh_default", text = "Because the Dark Portal is just south of here, and the warlocks who come to study it need what I sell. Every one of them wants to stand where the old Horde opened the way, as if the stones would teach them something." },
      },
      choices = {
        { text = "Do the stones teach them anything?", next = "why_stones" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_stones = {
      lines = {
        { id = "ws_default", text = "Only that the old Horde's warlocks were fools who sold us all for power. A clever warlock learns from that, and an ambitious one learns the wrong lesson, so you can guess which kind I sell to." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    felzerul = {
      lines = {
        { id = "fe_default", text = "He is, and he keeps the Warchief's line, and he looks down on me for selling to anyone with coin. I look down on him for spending his days watching a temple when he could be learning from it." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I sell books. You're not owed my story." } },
    advice = { { id = "tp_ad", text = "Don't trust a demon who seems pleased with you. That means it's winning." } },
    _none = { { id = "tp_none", text = "If it isn't in a grimoire, I don't care to discuss it." } },
  },
}

P:NPC {
  key = "malosh", id = TODO_NPC("Malosh"), name = "Malosh",
  bible = "bibles/swampofsorrows.md", role = "trainer", tier = "service",
  communities = { "stonard" }, temper = { "gruff" }, values = { "brave", "proud" },
  notices = { "class" },

  impression = {
    first = "Malosh trains Stonard's warriors in the mud of the yard and says that a warrior who can fight in the swamp can fight anywhere. He's blunt, scarred and proud of both.",
    third = "{name} met Malosh, the warrior trainer at Stonard.",
  },

  greetings = {
    { id = "g_default", text = "Want training? Then pick up a blade, because I don't teach talkers." },
    { id = "g_war", when = { class = "WARRIOR" }, text = "A warrior! Stand in the mud and we'll see how your footing is." },
  },

  notice = {
    { id = "n_war", cat = "class", when = { class = "WARRIOR" },
      text = "Your feet are planted wrong for this ground. In the swamp, you lean forward or you end up face down." },
  },

  start = "hello",
  nodes = {
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They respect anyone who stays standing in this mud, and your lot stay standing longer than most, because you keep putting the rest of us back on our feet. I'll grant that a totem on the field is worth a grunt or two." } },
      choices = {
        { text = "A shaman fights beside the warriors, never behind them.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let the warriors take the hits. I'll stay back and heal.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "They trust anyone who keeps the ogres off them, and they curse anyone whose fireball lands too close. Stand where they can see you, don't let your spells go wide, and you'll get on fine." } },
      choices = {
        { text = "I'll stand where they can see me, and take my share.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll stay hidden and let them draw the ogres.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "Down the road from the Blasted Lands, from Rockard, which was ours before it was theirs. They come in loud and they come in big, and they never look behind them, which is your sort's favourite kind of enemy." } },
      choices = {
        { text = "Then I'll strike them on Ruag's word, not before.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll hit them when I choose, not when Ruag says.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You hit like a warrior and heal like a priest, and I've never decided whether to train you or envy you." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest. You'll be the one patching up my warriors when they fall in the mud, so stand close to the yard and keep your hands warm." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } },
          text = "A mage, in cloth robes, in this mud. You'll be face down before the first ogre swings, so stay behind the warriors where you belong." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } },
          text = "A warlock. Keep your demon out of my yard, because my warriors have enough trouble with the mud without a voidwalker getting in the way." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } },
          text = "A rogue. You fight from behind, which my warriors call cowardly and I call sensible, though I'll never say that in front of them." },
        { id = "h_default", key = true,
          text = "I'm Malosh, and I teach warriors in Stonard. Fight in this mud long enough and you'll be able to fight anywhere, because nothing else is harder on your feet." },
        { id = "h_war", when = { class = "WARRIOR" },
          text = "A warrior, and you've walked through the swamp to get here, so your legs are already half trained. Let's see about the other half." },
      },
      again = {
        { id = "h_again", text = "More questions? Swing a blade while you ask them." },
        { id = "h_again2", text = "What else? The yard's waiting." },
      },
      choices = {
        { text = "Do your warriors respect shamans fighting beside them?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do your warriors trust spellcasters at their backs, Malosh?", next = "xhcast", when = { class = { "PRIEST", "MAGE", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Where do the Dreadmaul ogres come in from, Malosh?", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Why train in the mud?", next = "mud" },
        { text = "What makes a good warrior?", next = "good" },
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "Another time.", next = "END" },
      },
    },
    mud = {
      lines = {
        { id = "mu_default", text = "Because the enemy won't wait for dry ground. Ogres from the Blasted Lands, trolls from the temple, crocolisks from everywhere, and all of them come at you when you're up to your knees." },
      },
      choices = {
        { text = "That's harsh training.", next = "mud_harsh" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mud_harsh = {
      lines = {
        { id = "mh_default", text = "Harsh training makes for living warriors. Soft training makes for dead ones, and I've buried enough of those to know the difference." },
      },
      choices = {
        { text = "The harsh way is the only way.", next = "BACK", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Some warriors need a gentler hand.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    good = {
      lines = {
        { id = "go_default", text = "Footing first, then nerve, then the blade. Most young warriors have that backward and spend all their silver on swords." },
        { id = "go_war", when = { class = "WARRIOR" },
          text = "You know the answer already, or you'd be dead. Footing, then nerve, then steel, and in Stonard, footing counts for twice as much." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I fought, I lived, and now I teach. That's my story, and it's enough." } },
    advice = { { id = "tp_ad", text = "Lean forward in the swamp. Always lean forward." } },
    _none = { { id = "tp_none", text = "I teach warriors. Ask somebody who talks for a living." } },
  },
}
