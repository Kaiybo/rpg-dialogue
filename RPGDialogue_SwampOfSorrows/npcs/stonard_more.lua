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
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and somehow you still came back through the swamp. It must be growing on you, though I can't think why." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Someone in Stonard was in a good mood after talking with you, and that's rare enough here to be worth mentioning. Well done." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look like the swamp chewed on you and spat you out. It does that, so sit a moment before you go back in." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter. Good, because I've got a cook on the beach who's out of meat and a swamp full of it." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Stones don't think much, but the people who built them did, and they'd have been as puzzled as I am. Still, the Horde's made a home out of stranger things than you, so I'd not worry about the stones." } },
      choices = {
        { text = "The Horde's my home too. I'll serve it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I serve the Light first. The Horde comes second.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because we're close enough to the Blasted Lands to smell them, and the demons that still wander out there don't care whose stones these are. These old walls were built to hold, and a warrior on top of them makes them hold a good deal better." } },
      choices = {
        { text = "I'll stand on the walls and keep them safe.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd rather go out and meet the demons than wait for them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Swamp jaguars, if you're quick, and the big crocolisks along the shore if you're brave, and the spiders if you're daft. None of it tastes good, but Karakul will cook anything you bring him and never asks what it was." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Swamp jaguars, if you're quick, and the big crocolisks along the shore if you're brave, and the spiders if you're daft. None of it tastes good, but Karakul will cook anything you bring him and never asks what it was. Your {pet} looks like it would enjoy chasing a jaguar through the reeds, so let it, and bring back whatever's left." },
      },
      choices = {
        { text = "I hunt only what the town needs, no more.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I hunt for the sport of it. The swamp has plenty.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Well, Tok'Kar's got a cookpot on the beach that half the soldiers would fight for, and he sleeps with one eye open because of it. Leave it be, though, because he'd blame me, and he insults me enough already." } },
      choices = {
        { text = "I'll leave Tok'Kar's pot alone, for your sake.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A good cookpot is worth a few insults.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Dar.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Only stories, and I don't believe half of them, but the old-timers say the warlocks came and went before Thrall's day, and nobody misses them. Greshka sells her grimoires here now and the Warchief allows it, so I suppose times have changed." } },
      choices = {
        { text = "Times have changed. The fel serves the Horde now.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Some things shouldn't be forgotten. I won't forget.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let's leave that there.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Crocolisks, whelps from the ruins, the Lost Ones skulking at the edge of the mire, and the frogs, which are the worst of the lot. I've heard the tauren say every living thing has a place, and I'd like to ask them where the frogs are meant to go." } },
      choices = {
        { text = "Every creature has its place, Dar, even the frogs.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Then fill the pond in. Stonard's sleep matters more than frogs.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. The old Horde raised these stones, and I'd wager a few of your kind walked these halls back then, doing things the walls still remember." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. If you're looking for something worth stealing in Stonard, I wish you luck, because I've been looking for years and found mostly mud." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. There's enough old history in these stones that I'd wager they've got something to say to you, if you've the patience to listen." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest. Stonard could use a few prayers, though I've never been sure whose ears they'd reach out here." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } },
          text = "A mage. Well, you came through the swamp in one piece, so whatever you're doing must be working." },
        { id = "h_default", key = true,
          text = "I'm Dar. Stonard's a bit short on comforts, as you've noticed, but there's enough history in these stones that it must matter to somebody, and I suppose that's why I stay. It isn't for the scenery, I'll tell you that." },
        { id = "h_meat_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Lack of Surplus"), days = 3 } },
          text = "Tok'Kar got his sawtooth flanks, and his soldiers ate well, and I hear he said something about my face while he was at it. He always does, so I'll take it as thanks." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. You'll find Stonard's walls a comfort, at least, since they're about the only comfort here." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. There's not much to hunt round Stonard but crocolisks and spiders, though I'm told a swamp jaguar is good eating, if you can catch one." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid of the Earth Mother, in Stonard! The swamp's not much to look at, friend, but it's alive, I'll give it that, and more alive than I'd like some nights." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin, in Stonard. Well, that's one more piece of history for these stones, and I didn't think they had room for any more." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've got the time, which is the one thing Stonard has plenty of." },
        { id = "h_again2", text = "Go on, ask. The mud isn't going anywhere, and neither am I." },
      },
      choices = {
        { text = "What would these old stones say, if they could speak?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do the old stones of Stonard hold any magic, Dar?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Who's Tok'Kar?", next = "tokkar" },
        { text = "Why does Stonard matter, then?", next = "history" },
        { text = "Doesn't it feel like home?", next = "home" },
        { text = "These stones were raised by my grandfathers' Horde.", next = "k_orc", when = { race = "Orc" } },
        { text = "The swamp feels like home to me, Dar.", next = "k_troll", when = { race = "Troll" } },
        { text = "Nothing worth stealing at all, Dar?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "What do you know of Stonard's old warlocks?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Why does Stonard need warriors on its walls, Dar?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What's worth hunting around Stonard, Dar?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What lives in the swamp that keeps you up at night, Dar?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "What would these old stones make of a Forsaken paladin, Dar?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
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
        { id = "hw_default", text = "Little more than a camp with walls, and the Warchief opened the gates. Durotar's the first home most of us chose for ourselves, and I chose to leave it for this, which says something about me I don't like to think about." },
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
    thrall = { { id = "tp_thrall", text = "The Warchief cares about places like this, places nobody else remembers. That's why I stay." } },
    second_war = { { id = "tp_second_war", text = "Stonard's stones were laid by the old Horde, back in the wars, and they still remember it. I like to think someone should be here to remember with them." } },
    sunken_temple = { { id = "tp_sunken_temple", text = "The trolls on the lake keep to themselves, mostly. I'd like it to stay that way." } },
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
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "They'll fly you, but they'll fuss about it. They know the smell of the dead and they know the shine of the Light, and they've never had both on their backs at once, so be gentle with the reins." } },
      choices = {
        { text = "They'll fly because they're told to, and that's all.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll be gentle, and let them learn me in their own time.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Heavy and slow, which in a fight is the same thing, and a rider in plate on a wet beast is a rider who goes down in the swamp. I dry their wings every morning before they fly, and I'd ask a warrior to wait for it rather than complain." } },
      choices = {
        { text = "I'll wait. Patience is part of any soldier's work.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'd fly now and take the risk. Waiting wastes daylight.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Dry them every day, check their feet for rot and keep the leeches off, because a swamp leech will drain a beast weaker than any wound. It's dull work, but a hunter who skips it ends up with a sick animal and no idea why." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Dry them every day, check their feet for rot and keep the leeches off, because a swamp leech will drain a beast weaker than any wound. It's dull work, but a hunter who skips it ends up with a sick animal and no idea why. Check {pet}'s paws tonight, I'd say, because the mud gets between the pads and festers if you leave it." },
      },
      choices = {
        { text = "Daily care is a hunter's first duty to his beast.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Beasts are tough. They'll manage without the fuss.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Warm and gentle, mind, because a rider with a singed mane sulks for a week and won't fly south past the temple at all. Do it right, and you'll have a friend in every stall." } },
      choices = {
        { text = "Gently, then. Your riders deserve the care.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A little singe won't hurt them. Toughens them up.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Somebody with a grudge, or a sense of humour I'd like to beat out of him, and Ruag never found out which. The rider swam out angry and the passenger didn't swim out at all, so I check every strap twice now." } },
      choices = {
        { text = "Find him and see him properly punished.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The swamp already took its toll. Let it lie.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Breyk.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Rots their harness, molds their feathers, and puts them in a temper that lasts the whole flight north to Kargath. Back in the Barrens a druid showed me a moss that keeps the damp out of leather, but it doesn't grow here, and I can't remember its name." } },
      choices = {
        { text = "I'll find you a swamp moss that works. Your beasts deserve it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Wind riders are tough. They'll learn to live with the wet.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. Keep your hands off the harness, because the last time somebody cut a strap for a joke, a rider came down in the Pool of Tears." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. Can you dry a wind rider's wings with a spell? Because if you can, I'll stop scraping moss and start taking bets." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. The riders won't fly over the temple when the wind comes from the east, and maybe you can tell me why." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest. The riders cough every morning, so if you've a blessing for wet lungs, they'd take it gladly, and so would I." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } },
          text = "A warlock. Keep the demon well away from the pen, because the riders already hate the swamp, and they'd hate your friend a good deal more." },
        { id = "h_default", key = true,
          text = "Breyk, wind rider master. From Stonard the riders go north to Kargath over the Steppes, and west to Grom'gol and Booty Bay, and they hate every minute of the wet before they leave." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "The riders don't like flying out of here at night, because the mist sits so low they can't see the trees. They'll go, but they'll grumble the whole way." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. The wind riders don't like the weight of plate when their wings are wet, so I'll ask you to be patient while they shake off the damp." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll know how to look after a beast in this wet, I hope, because most folk don't and their animals suffer for it." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid! I could use you, friend, because the wind riders' wings never dry in this swamp, and I've a feeling you know a better trick than my rags." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken in plate, and glowing besides. My riders are already miserable in this wet, and now they've got something new to sulk about." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've got harness to scrape." },
        { id = "h_again2", text = "Quick, before the mist rolls in." },
      },
      choices = {
        { text = "What spooks your wind riders over the Sunken Temple?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What do your riders carry for the spellcasters who come through?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "How do the riders take the swamp?", next = "wet" },
        { text = "Do you hear from the other rider masters?", next = "others" },
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "I could try drying your riders, Breyk.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Who would cut a wind rider's harness?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do wet wings make the wind riders dangerous, Breyk?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "How do you keep beasts healthy in this swamp, Breyk?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What does the swamp do to the wind riders, Breyk?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Will your riders fly a Forsaken paladin, Breyk?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
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
    thrall = { { id = "tp_thrall", text = "The Warchief built the wind rider routes, and I keep them running, rain or not. Mostly rain." } },
    dark_portal = { { id = "tp_dark_portal", text = "The wind riders won't fly near the Dark Portal, not for anything. They smell something there that I can't." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's the driest place my beasts have ever landed, and they loved it. I'd give a lot to fly there again." } },
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
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I think you're a contradiction with a hammer. Your Light burned the dead when they first rose, and now it lives in one of them, and my books have nothing to say about that, which is rare and annoying." } },
      choices = {
        { text = "Contradiction or not, the Light chose me.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The Light's just power, like your books. I use it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I don't dislike them, I simply have nothing to sell them, which is worse. Warriors think a demon can be killed like any other beast, and they're usually right, which annoys my customers no end." } },
      choices = {
        { text = "Warlocks play with fire. A warrior's steel is cleaner.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Demons are tools. A warrior could learn from warlocks.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Better isn't the word I'd use, but they're more useful if you know how to bind them, and they never need feeding. A beast loves you and a demon hates you, and on a bad night I'd rather have something that hates me honestly." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Better isn't the word I'd use, but they're more useful if you know how to bind them, and they never need feeding. A beast loves you and a demon hates you, and on a bad night I'd rather have something that hates me honestly. Your {pet} would be torn to pieces by a felhunter in a heartbeat, but I'll grant it looks happier than any demon I've ever bound." },
      },
      choices = {
        { text = "I'd take a loyal beast over any bound demon.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A demon that obeys is worth ten loyal beasts.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Ask Dalaran, if you can find it, or ask the elves what their Sunwell brought down on Quel'Thalas. Every power has a price, mage; mine just has the honesty to bite." } },
      choices = {
        { text = "The arcane can be used well. The fel can't.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "You're right. Power's power, whatever it costs.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Another question, then.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Some of them, and the ones that don't will whisper your name to me when they leave the shop. A thief with a stolen grimoire is just a thief with a very bad night ahead of him." } },
      choices = {
        { text = "I'll keep my hands to myself, Greshka.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Everything can be stolen. Even a biting book.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Never mind that for now.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because every word in them is about binding something that never asked to be bound, and your people spend their lives letting things go. I don't apologize for it, druid, but I don't pretend it's kind, either." } },
      choices = {
        { text = "Binding the unwilling is a crime against nature, Greshka.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Power is power. A warlock knows it, even if a druid won't.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. Don't bother pocketing a grimoire, because you can't read it, and the first page bites." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. You'll want to tell me the arcane is cleaner than the fel, I suppose, and I'll want you to leave, so let's both be quick." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You'll want to tell me what warlocks did to your people, I expect, so spare me the lecture and buy something or go." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest. Shadow or loa, it makes no difference to me, because neither of them buys grimoires, so be brief." },
        { id = "h_default", key = true,
          text = "I sell grimoires to warlocks, and you aren't one. If you've a question, make it quick, and then go and bother Karakul instead." },
        { id = "h_lock", when = { class = "WARLOCK" },
          text = "Greshka. I sell the grimoires that teach your servants new tricks, the Blood Pact and the Firebolt and the rest. You know enough to be dangerous, but you still need training, so let's see what you can pay for." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. You've no use for grimoires and I've no use for you, but Malosh is out in the yard if you want somebody to hit." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, and you keep beasts, which is a pity, though I suppose they're loyal." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. You've no business here, then, and I'll tell you what I tell every druid: what I sell would make your Earth Mother weep." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "You're no warlock, and the Light on you makes my books itch. A Forsaken paladin, of all things, so what do you want?" },
      },
      again = {
        { id = "h_again", text = "What else? Be brief." },
        { id = "h_again2", text = "You're still here, so ask your question." },
      },
      choices = {
        { text = "Why does Stonard still keep a warlock's shop, after all that?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Is the temple's magic anything like your trade, Greshka?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "What's in your grimoires?", next = "grimoires" },
        { text = "Why sell to warlocks here, of all places?", next = "why" },
        { text = "Fel'zerul is a warlock too.", next = "felzerul" },
        { text = "Show me your grimoires.", next = "BUSINESS", when = { class = "WARLOCK" } },
        { text = "Is the arcane really any cleaner than the fel?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do your grimoires really bite?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Why do you dislike warriors so much, Greshka?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Are demons really better than beasts, Greshka?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Why would the Earth Mother weep at your grimoires, Greshka?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "What does a warlock's bookseller think of a Forsaken paladin?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
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
    burning_legion = { { id = "tp_burning_legion", text = "The Burning Legion is the reason warlocks have the power we do, and the reason the old Horde fell. Remember both, or don't bother opening my books." } },
    dark_portal = { { id = "tp_dark_portal", text = "The Portal is south of here, and the demons that guard the Tainted Scar still answer to old names. I'd send a student there only if I wanted to lose one." } },
    thrall = { { id = "tp_thrall", text = "The Warchief tolerates warlocks because he must. I tolerate him because he's right to be careful." } },
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
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I train warriors, not paladins, but I'll tell you what I tell them: the mud doesn't care what you pray to. If the Light makes you hard to kill, good, because the Horde needs soldiers who stay standing longer than their enemies." } },
      choices = {
        { text = "I'll stand and fight fair, mud or no mud.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll win however I can. The mud doesn't care either.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "When I can get them, aye, because a warrior who's only fought other warriors will freeze the first time a swamp jaguar comes at him out of the reeds. A hunter's beast makes a fine sparring partner, if it's patient and the hunter keeps a hand on the lead." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "When I can get them, aye, because a warrior who's only fought other warriors will freeze the first time a swamp jaguar comes at him out of the reeds. A hunter's beast makes a fine sparring partner, if it's patient and the hunter keeps a hand on the lead. Your {pet} looks like it would give my recruits a good fright, which is exactly what they need." },
      },
      choices = {
        { text = "Disciplined sparring saves lives in the field. It's worth doing.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Real fights teach more than any yard ever will.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
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
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Teach them? No, but I'd let you show them what a knife does to a warrior who drops his guard. They need to learn that the enemy won't always stand in front of them shouting." } },
      choices = {
        { text = "A fair fight is a fool's fight.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Your warriors should fight fair. That's their strength.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else, Malosh.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "One thing: that a robe can kill you just as dead as an axe, if you're slow to close the distance. I tell the young ones to charge the mage first, and the mage tells them to try it, and that's how I lose recruits to the mud." } },
      choices = {
        { text = "Teach them caution. They'll live longer.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let them charge, then, and dig their own graves.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I would, and gladly, because the swamp has crocolisks bigger than any bear, and a warrior who's been thrown about by a druid won't panic when one comes out of the reeds. Your kind fights with instinct, and mine with drill, and both have something to learn from the other." } },
      choices = {
        { text = "Then I'll wrestle them fairly, and teach them what instinct means.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Drill makes a warrior. A druid's wildness is no lesson for recruits.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage in my yard. Stand back from the sparring rings, because the last mage who wandered in froze one of my recruits to the mud, and he's still shy about it." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "A rogue. You fight dirty, I'm told, and in the mud of this swamp there's no other way to fight, so maybe you've something to teach my warriors." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You hit like a warrior and heal like a priest, and I've never decided whether to train you or envy you." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } },
          text = "A priest. You'll be the one patching up my warriors when they fall in the mud, so stand close to the yard and keep your hands warm." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } },
          text = "A warlock. Keep your demon out of my yard, because my warriors have enough trouble with the mud without a voidwalker getting in the way." },
        { id = "h_default", key = true,
          text = "I'm Malosh, and I teach warriors in Stonard. Fight in this mud long enough and you'll be able to fight anywhere, because nothing else is harder on your feet." },
        { id = "h_war", when = { class = "WARRIOR" },
          text = "A warrior, and you've walked through the swamp to get here, so your legs are already half trained. Let's see about the other half." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, in my yard. A hunter's beast fights better in this mud than half my warriors do, and I don't mind saying so." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, in my yard! Change into a bear and wrestle one of my recruits, if you're willing; they need to learn what a real beast feels like." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin in my yard. Can you fight in this mud, or does the Light keep your boots clean for you?" },
      },
      again = {
        { id = "h_again", text = "More questions? Swing a blade while you ask them." },
        { id = "h_again2", text = "What else? The yard's waiting." },
      },
      choices = {
        { text = "Do your warriors respect shamans fighting beside them?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do your warriors trust spellcasters at their backs, Malosh?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Why train in the mud?", next = "mud" },
        { text = "What makes a good warrior?", next = "good" },
        { text = "Train me.", next = "BUSINESS", when = { class = "WARRIOR" } },
        { text = "Would you let a rogue teach your warriors?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Can a warrior learn anything from a mage?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do your warriors ever train against beasts, Malosh?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Would you really put your recruits against a druid's bear, Malosh?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Would you train a Forsaken paladin, Malosh?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
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
        { id = "mh_default", text = "My training's harsh because the swamp is harsher. I've dug graves in this mud for soft-trained grunts, and the mud doesn't stay dug." },
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
    background = { { id = "tp_ba", text = "I fought, I lived, and now I teach. I've two fewer fingers than I started with, and I don't talk about where they went." } },
    advice = { { id = "tp_ad", text = "Lean forward in the swamp. Always lean forward." } },
    thrall = { { id = "tp_thrall", text = "The Warchief's a warrior first, and I'd follow him into any swamp. I'm already in this one, so I suppose I have." } },
    second_war = { { id = "tp_second_war", text = "I fought in the Second War, and I learned more there than any trainer could teach. I teach what I learned now, with fewer fingers." } },
    sunken_temple = { { id = "tp_sunken_temple", text = "The trolls in that temple are no warriors, they hide behind their magic. Give me a troll with an axe any day." } },
    _none = { { id = "tp_none", text = "I teach warriors. Ask somebody who talks for a living." } },
  },
}
