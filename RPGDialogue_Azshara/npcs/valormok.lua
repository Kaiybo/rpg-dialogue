-- Valormok: a bare Horde camp against the northern mountains, a dozen warriors short. Voice: bibles/azshara.md
local P = RPGDialogueAPI:Pack("rpgd.azshara")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "agtor", id = TODO_NPC("Ag'tor Bloodfist"), name = "Ag'tor Bloodfist",
  bible = "bibles/azshara.md", role = "soldier", tier = "quest",
  communities = { "valormok" }, temper = { "steady", "proud" }, values = { "loyal", "brave" },
  notices = { "race", "class" },

  impression = {
    first = "Ag'tor Bloodfist holds Valormok for a commander who made a fool's bargain with an elf. He grieves a dozen dead warriors and still believes the Horde will win here, because someone has to.",
    third = "{name} met Ag'tor Bloodfist, who holds Valormok after Magus Rimtori's betrayal cost it a dozen warriors.",
  },

  greetings = {
    { id = "g_default", text = "Lok'tar. Valormok can use another blade, and you've not come a moment too soon." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, friend. The camp's still standing, more or less." },
    { id = "g_avenged", when = { questDone = TODO_QUEST("Betrayed") }, text = "There's the one who brought me the elf's head! Sit by my fire whenever you like." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "An orc of Durotar, out in this elf-haunted forest. Good; I'm tired of explaining the Horde to people who aren't in it." },
    { id = "n_shaman", cat = "class", when = { class = "SHAMAN" },
      text = "A shaman. The spirits here are angry and old, and they don't like us much. Maybe they'll like you better." },
  },

  start = "hello",
  nodes = {
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "If anyone can, it's your kind, because they leave no tracks a grunt would see, but they leave them all the same. Find where they camp past the northern bluffs, and I'll have my answer for the dead of Valormok." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And send {pet} ahead of you through the trees. The elves' mages set traps, and I'd rather lose a sniffing nose than another warrior." },
      },
      choices = {
        { text = "I'll find them and bring you the truth, not just their heads.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll find them and finish them before they ever see me.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Ag'tor.", next = "BACK" },
      },
    },
    warrior_ag = {
      lines = {
        { id = "wag_default", text = "Answer for them, then, and do it properly. They died in a ruin, betrayed and outnumbered, without a chance to see who killed them; whatever you do in their name, make sure the elf sees your face." },
        { id = "wag_grunt", when = { origin = "orc_razor_hill_grunt" },
          text = "Razor Hill, eh? Half the warriors buried here learned their trade on that same parade ground. They'd want one of their own doing this, so I'll not argue." },
      },
      choices = {
        { text = "She'll see me coming. On my honour.", next = "BACK", fx = { align = { honor = 1 }, standing = { valormok = 1 } } },
        { text = "She betrayed them. She gets no warning.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "We guarded her expedition into the ruins, on Belgrom's orders, and when she found what she wanted, she turned her magic on us. Twelve warriors, cut down by spells they never saw coming, and I cut their names into that post myself." } },
      choices = {
        { text = "Their deaths will be avenged. I swear it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They should have watched her more closely.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "I'm sorry for your loss.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I think the Horde paid for demon power once, and I'd rather we never paid again. But Thrall lets your kind serve, and I follow Thrall, so you'll fight beside us and I'll judge you by what you do here." } },
      choices = {
        { text = "Judge me by my deeds, then. I'll fight with honor.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Power is power. The Horde needs every weapon.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Fair enough.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Rimtori's people, I think, watching to see whether any of us are still standing. Find their scouts and deal with them, and I'll sleep a little easier at night." } },
      choices = {
        { text = "I'll hunt their scouts. Valormok deserves peace.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll do it, but on my own terms.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll see what I can find.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "They'd want their axes and a war song, but they'd take a priest's words too, if that's all we have. Belgrom sent them out here on a fool's bargain, and the least the Horde owes them is to remember their names." } },
      choices = {
        { text = "Then I'll speak over them, and the Horde will remember.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Words won't fix Belgrom's mistake. Vengeance might.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Maybe, if you can heal faster than the elves can kill. I lost most of my warriors to that mage's betrayal, and the ones left need mending more than they need speeches, so if your Earth Mother has any gifts to spare, spend them on my wounded." } },
      choices = {
        { text = "I'll tend your wounded. That comes before any vengeance.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Mending is slow. Better to hunt down the elves who did this.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Ag'tor.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter. Good, because the elves have scouts in those woods who hide better than any orc, and I need someone who can find their trail." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage of the Horde. The last mage who came to Valormok was an elf, and she killed my warriors, so forgive me if I watch your hands." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "A warlock. I don't love your kind, but you're Horde and we need hands, so I won't turn you away, not with elves in the woods and naga on the shore." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "A rogue. Good, because the elves have scouts in the woods, and I need someone who can find them before they find us." },
        { id = "h_default", key = true,
          text = "Ag'tor Bloodfist, and this is Valormok, or what's left of it. Belgrom Rockmaul sent us out here to guard an elf mage's expedition, and she repaid us by killing nearly every warrior in this camp." },
        { id = "h_letter", when = { questActive = TODO_QUEST("Betrayed") },
          text = "So Belgrom finally sent someone who isn't one of his own grunts. The elf's workers are on the bluffs of the northern cliffs, and her camp is somewhere past them; we'll start there." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Betrayed"), days = 7 } },
          text = "The spirits of our dead can rest now, and Belgrom can stop pacing his hall. You did that, {name}, and Valormok won't forget it." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Good, because I've buried a dozen warriors since that elf mage turned on us, and they went into the ground without a proper word said over them." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid of the Earth Mother, out here at Valormok? You'll find this forest sick, tauren, and the elves who live in it are sicker." },
      },
      again = {
        { id = "h_again", text = "What else? Speak; I've had nothing but the wind to talk to for weeks." },
        { id = "h_again2", text = "Go on. We've time, until the satyr come again." },
      },
      choices = {
        { text = "What happened to your warriors?", next = "betrayal" },
        { text = "Why did Belgrom trust an elf?", next = "belgrom" },
        { text = "How does Valormok hold out here?", next = "camp" },
        { text = "The spirits of your dead deserve rites.", next = "rites", when = { class = { "SHAMAN", "PRIEST" } } },
        { text = "I'm a warrior. Let me answer for your dead.", next = "warrior_ag", when = { class = "WARRIOR" } },
        { text = "What did Magus Rimtori do here?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do you think warlocks shame the Horde?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Who's scouting Valormok?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Would your fallen want a priest's words, Ag'tor?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Can a hunter find the elves who betrayed you?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Can a druid help this camp hold out?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Lok'tar, Ag'tor.", next = "END", fx = { affinity = 1, standing = { valormok = 1 } } },
      },
    },

    betrayal = {
      big = true,
      lines = {
        { id = "b_default", fx = { learn = { "rimtori" } },
          text = "Magus Rimtori promised Belgrom treasure and power from the old elven ruins if we kept her people safe while they dug. Once her diggers had what they needed, she turned her spells on the warriors guarding her, and this camp went from a dozen strong to what you see." },
      },
      choices = {
        { text = "Did any of them escape?", next = "betrayal_ran" },
        { text = "Where is she now?", next = "betrayal_where" },
        { text = "They'll be avenged. I swear it.", next = "BACK", fx = { affinity = 2, align = { honor = 1 }, standing = { valormok = 1 } } },
        { text = "Vengeance won't bring them back. Cut your losses.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
      },
    },
    betrayal_ran = {
      lines = { { id = "br_default", text = "After that I threw every warrior I had left at her, and not one came home. Some are dead, I'm sure, and some simply ran, and I don't know which I'd rather believe." } },
      choices = {
        { text = "Not every warrior is a hero.", next = "betrayal_names" },
        { text = "Something else.", next = "BACK" },
      },
    },
    betrayal_names = {
      lines = { { id = "bn_default", text = "No, but every one of them was mine. I cut the twelve names into the post by my tent, the cowards with the rest, because I'll judge them when I'm dead and not before." } },
      choices = {
        { text = "That's a fair way to remember them.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    betrayal_where = {
      lines = { { id = "bw_default", text = "In her base camp on the northern cliffs, with her guards and her circle of floating crystals, digging up whatever the old elves left. She has a book there she won't let out of her sight, and I'd like very much to take it from her." } },
      choices = { { text = "Then that's where I'll start.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },

    belgrom = {
      lines = { { id = "be_default", text = "Because she told him what he wanted to hear, and told it well. He's a great warrior and a poor judge of elves, and too many orcs have died for that already, but he still commands us, and honour says we make the best of it." } },
      choices = {
        { text = "You're more loyal than he deserves.", next = "belgrom_loyal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    belgrom_loyal = {
      lines = { { id = "bl_default", text = "Maybe. But if his gamble had paid off, the whole Horde would have gained by it, and I'd have called him wise. A plan isn't foolish until it fails, {class}, and this one failed very loudly." } },
      choices = {
        { text = "Loyalty to a fool is still loyalty.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A leader who wastes lives deserves none.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },

    camp = {
      lines = { { id = "c_default", fx = { learn = { "satyrs" } },
        text = "Badly, and stubbornly. The satyr of Haldarr are just south of us, the elves' Sentinels watch from their point to the southwest, and the mountains behind us are full of furbolgs who'd sooner kill us than trade." } },
      choices = {
        { text = "Why not pull back to Orgrimmar?", next = "camp_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_why = {
      lines = { { id = "cw_default", text = "Because this forest hasn't given us our finest hours, but we're young and our blood's hot, and we'll have a victory out of it yet. If we left now, the dead would have died for nothing." } },
      choices = {
        { text = "Then I'll stand with you.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 }, standing = { valormok = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    rites = {
      lines = { { id = "ri_default", text = "They do, and we've had no one to give them. If you'd say the words over the post where their names are cut, I'd count it a kindness, {class}." } },
      choices = {
        { text = "I'll do it before I leave.", next = "BACK", fx = { affinity = 3, standing = { valormok = 2 } },
          journal = { first = "At Valormok I said the rites over the post where Ag'tor cut the names of his twelve dead warriors.",
                      third = "{name} spoke the rites for Valormok's twelve dead warriors at Ag'tor Bloodfist's post." } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know this forest and the enemies in it, and not much else. Ask." } },
    background = { { id = "tp_bg", text = "An orc of Durotar, sent to guard an elf and left to bury what she left behind. My brother Haggrum came with me; he's the only one of us who still smiles." } },
    advice = { { id = "tp_ad", text = "Don't trust anyone who promises you treasure in old ruins. I learned that from someone else's mistake, and it cost me twelve warriors anyway." } },
    rimtori = { { id = "tp_rimtori", text = "The elf who betrayed us. Ask me again when her head's on a spike, and I'll be more cheerful about it.", next = "betrayal" } },
    satyrs = { { id = "tp_satyr", text = "The Haldarr are south of us and never sleep. We kill them, they come back, and so it goes." } },
    sentinels = { { id = "tp_sent", text = "They watch us from their point, and we watch them. Nobody's spilt blood over it yet, and I'd like to keep it that way." } },
    _none = { { id = "tp_none", text = "I don't know about that. Ask Jediga; she's the one who thinks about things." } },
  },
}

P:NPC {
  key = "jediga", id = TODO_NPC("Jediga"), name = "Jediga",
  bible = "bibles/azshara.md", role = "questgiver", tier = "quest",
  communities = { "valormok" }, temper = { "sharp", "proud" }, values = { "greedy", "proud" },
  notices = { "race", "drink" },

  impression = {
    first = "Jediga was sent to Valormok because she told a powerful orc no, and she's turned her exile into a business selling Highborne tablets. She trusts nobody, the Archmage least of all.",
    third = "{name} met Jediga, who turned her exile at Valormok into a trade in stolen Highborne tablets.",
  },

  greetings = {
    { id = "g_default", text = "Another face from Orgrimmar. Tell me you brought ale." },
    { id = "g_back", when = { metBefore = true }, text = "You're back, and alive, and I've a use for both of those things." },
    { id = "g_done", when = { questDone = TODO_QUEST("Stealing Knowledge") }, text = "My favourite partner in crime. How's the tablet trade treating you?" },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = true },
      text = "You smell of a tavern, and I envy you so much I could spit. Where did you find a drink in this forest?" },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "One of ours, and from the city, I'd wager. Tell me the ale in the Drag is still cold." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Plenty, because the naga sit on the tablets and the naga don't sell, so somebody has to take them. You hit things, I sell things, and the Archmage pays for whatever we bring him, so everyone ends up happy except the naga." } },
      choices = {
        { text = "I fight for the Horde's honour, not for your profit.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then let's talk about my cut, partner.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Jediga.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Nothing useful, which is what bothers me, because they guard them like treasure and can't read a word. A hunter who can slip past their patrols could bring the tablets out and leave the naga none the wiser until it was too late." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And keep {pet} out of the water by the ruins, because the naga eat anything that swims, and I can't sell a tablet with teeth marks in it." },
      },
      choices = {
        { text = "I'll take them openly. I'm no thief, Jediga.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Then I'll slip in, take them, and never be seen.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage_jd = {
      lines = {
        { id = "mjd_default", text = "An orc mage, out here with the tablets? Somebody in Orgrimmar's going to have kittens about that. Read all you like, but you'll pay what Magatha's agents pay, because a mage's curiosity is worth more to me than his loyalty." },
        { id = "mjd_camp", when = { origin = "orc_camp_primer" },
          text = "Learned your letters from a primer in the internment camps, I'd bet; plenty of us did. Look where it's got you, reading dead elves' homework in a ruined forest, same as me." },
      },
      choices = {
        { text = "Knowledge shouldn't be sold.", next = "BACK", fx = { align = { order = 1 }, affinity = -1 } },
        { text = "Fair price. Everything's for sale.", next = "BACK", fx = { align = { order = -1 }, affinity = 2 } },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "If they mind, they've not said so to me, and I've been digging a good while. The Highborne were demon-lovers who brought ruin on their own city, so I don't lose sleep over their ghosts. Ag'tor would tell you to leave it be, but Ag'tor isn't the one buying his way back to Orgrimmar." } },
      choices = {
        { text = "Dig away. The Horde needs coin more than ghosts need tablets.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "The dead deserve better, even Highborne dead.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Anyone who wants to study them or sell them on, and I'm not particular about which. Xylem would buy them in a heartbeat, but I'd rather sell to a goblin than to that pompous fool." } },
      choices = {
        { text = "Sell to the highest bidder. That's smart business.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Those tablets should go to the Horde, not goblins.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Good luck with your sales.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "A few, and they make my skin crawl, but they sell for more than the plain ones. The Highborne dabbled in everything, and some of what they wrote down would make even a warlock think twice." } },
      choices = {
        { text = "I'll pass. Some knowledge is too dangerous.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll take the dark ones. Knowledge is power.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Show me what you have.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Enough Highborne tablets sold to enough fools, and an orc's memory that's shorter than his temper. I said no to the wrong orc and I've had a long time to regret it, though I've never once regretted the no." } },
      choices = {
        { text = "Standing by your no is worth something.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "You should've said yes. Pride's a poor trade.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Everything grows too big and too quiet, like it's holding its breath. I've watched beasts walk into the shadows of those ruins and come out wrong, and I've no wish to be one of them, so I trade and I wait, and I let braver tauren than me ask the trees what's the matter." } },
      choices = {
        { text = "Someone has to go in there and face it. I will.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Waiting is wise. No coin is worth being changed by that place.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Never mind the forest.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior. Let me guess, you're here for glory, which is very noble and doesn't pay, so you'll forgive me if I talk business instead." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter. You'll know the Ruins of Eldarath, then, because there's game around them, and naga, and somewhere in all that, my tablets." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, and I can already hear the lecture about respecting dead elves. Save it, because the tablets don't mind where they end up." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "A rogue! Finally, someone who understands business. I've got tablets to sell and buyers to find, and I could use someone who knows how to move goods quietly." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "A warlock, here? You'll be wanting the darker tablets, I expect, the ones with the demon scribbles on them. They cost extra." },
        { id = "h_default", key = true,
          text = "Jediga, and I'm not out here for glory or honour, before you ask. One orc's wounded pride put me in this forest, and I mean to make enough coin out of my exile to buy my way home." },
        { id = "h_tablets", when = { questActive = TODO_QUEST("Stealing Knowledge") },
          text = "Four tablets in the Ruins of Eldarath, each named for a Highborne wizard, and each one worth a tidy sum to the right buyer. Get them all and you get a cut; that's how partners work." },
        { id = "h_xylem", when = { questActive = TODO_QUEST("Delivery to Archmage Xylem") },
          text = "You're taking the last one to the Archmage. Be careful up there; he's human, but he doesn't act like any human I've met, and I've met plenty." },
        { id = "h_paid", when = { questDone = TODO_QUEST("Xylem's Payment to Jediga") },
          text = "He paid, every coin, and didn't even try to turn you into a toad. I don't know whether to be relieved or suspicious, so I'm being both." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, out here? Don't bother praying for my soul, because it's busy making enough gold to get me out of this forest." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, all the way from Thunder Bluff? Then you'll understand better than these orcs why I keep my distance from that forest, because it doesn't feel right to me either." },
      },
      again = {
        { id = "h_again", text = "What else? Talk fast; I've accounts to keep." },
        { id = "h_again2", text = "Go on. You're better company than Ag'tor, at least." },
      },
      choices = {
        { text = "Do the spirits here mind you digging up the Highborne ruins?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Whose pride sent you here?", next = "exile" },
        { text = "Who buys Highborne tablets?", next = "buyers" },
        { text = "What do you make of the Archmage?", next = "xylem" },
        { text = "What would you do back in Orgrimmar?", next = "home" },
        { text = "You and me both, I could use a drink.", next = "drink", when = { drunk = true } },
        { text = "I'm an orc mage. These tablets interest me.", next = "mage_jd", when = { race = "Orc", class = "MAGE" } },
        { text = "Who buys Highborne tablets out here?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Are there demonic tablets among the Highborne ruins?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What would it take to send you home, Jediga?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Is there business here for a warrior, Jediga?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What do the naga do with the tablets, Jediga?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What's wrong with the forest here, in your view?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Good luck, Jediga.", next = "END" },
      },
    },

    exile = {
      big = true,
      lines = {
        { id = "e_default", text = "Belgrom Rockmaul's. He made me an offer I didn't want, and I turned him down in front of half the Valley of Honor. A week later I was posted to the edge of the world to guard his precious elf, and he called it a promotion." },
      },
      choices = {
        { text = "That's an abuse of his rank.", next = "exile_rank" },
        { text = "You did the right thing.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Swallowing your pride would've been smarter.", next = "BACK", fx = { affinity = -2, align = { honor = -1 } } },
      },
    },
    exile_rank = {
      lines = { { id = "er_default", text = "It is, and everyone knows it, and nobody says it. I'll say it, though, to anyone who'll listen, and the next time he tries it with someone, I hope she has fewer manners than I did." } },
      choices = {
        { text = "I'll remember his name.", next = "BACK", fx = { affinity = 1, opinion = { belgrom = "contempt" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    buyers = {
      lines = { { id = "bu_default", fx = { learn = { "highborne" } },
        text = "More people than you'd think. An apothecary in the Undercity, the old crone of the Grimtotem in Thunder Bluff, a troll alchemist in Orgrimmar, and the Archmage on his cliff. Each one wanted a tablet, and none of them asked where it came from." } },
      choices = {
        { text = "Isn't selling to Magatha a risk?", next = "buyers_magatha" },
        { text = "This is just grave-robbing.", next = "buyers_rob" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_magatha = {
      lines = { { id = "bm_default", text = "Everything's a risk out here. The crone pays well and asks nothing, and I don't care what she does with a stone tablet any more than she cares what I do with her gold." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    buyers_rob = {
      lines = { { id = "br_default", text = "The Highborne have been dead ten thousand years, and the naga are robbing the graves anyway. I'd sooner the Horde got the coin than a fish with a trident." } },
      choices = {
        { text = "Fair point. Profit is profit.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Some things shouldn't be for sale.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
      },
    },

    xylem = {
      lines = { { id = "x_default", fx = { learn = { "xylem" } },
        text = "He came down to this camp himself to ask for a tablet, then said his bodyguard would see to the rest. He reeks of power, and I didn't dare ask him what he wanted with it, which isn't like me at all." } },
      choices = {
        { text = "He seemed harmless to me.", next = "xylem_harmless" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xylem_harmless = {
      lines = { { id = "xh_default", text = "Harmless people don't live alone on cliffs with no stairs. He paid, I'll grant him that, but I'll keep counting my fingers after every handshake, just the same." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },

    home = {
      lines = { { id = "ho_default", text = "Drink, first of all, something cold and brewed by someone who knows how. Then I'd take my tablet money and open a stall in the Drag, and Belgrom could walk past it every morning and choke." } },
      choices = {
        { text = "I'll buy the first round.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    drink = {
      lines = { { id = "dr_default", text = "Don't tease me, friend. Kurll sells milk and fruit juice here, as if we were children, and I've been dreaming about a mug of grog for a month." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I keep my ears open; it's the only entertainment in Valormok. Here's what I've heard." } },
    background = { { id = "tp_bg", text = "A warrior of Orgrimmar who said no to the wrong orc. Now I sell old stones to strangers.", next = "exile" } },
    advice = { { id = "tp_ad", text = "Get paid before you deliver, unless the buyer's a mage on a cliff. Then pray." } },
    xylem = { { id = "tp_xylem", text = "Dangerous, polite and very rich. I don't know which of those worries me most.", next = "xylem" } },
    highborne = { { id = "tp_hb", text = "Dead wizards with expensive handwriting. Their tablets are my ticket home." } },
    rimtori = { { id = "tp_rimtori", text = "She fooled Belgrom, which isn't hard, and killed our warriors, which is unforgivable. Ag'tor wants her head, and he's welcome to it." } },
    _none = { { id = "tp_none", text = "No idea, and unless there's coin in it, no interest either." } },
  },
}

P:NPC {
  key = "kroum", id = TODO_NPC("Kroum"), name = "Kroum",
  bible = "bibles/azshara.md", role = "flightmaster", tier = "service",
  communities = { "valormok" }, temper = { "steady" }, values = { "dutiful" },
  notices = { "race" },

  impression = {
    first = "Kroum keeps Valormok's wind riders and speaks as little as he can. He told me the beasts hate the salt wind, and I think he does too.",
    third = "{name} met Kroum, the wind rider master at Valormok.",
  },

  greetings = {
    { id = "g_default", text = "Need a wind rider? They're fed, rested and ready to go." },
    { id = "g_back", when = { metBefore = true }, text = "You again. The beasts know your smell now." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren. The wind riders are calmer with your kind; something about the smell of the plains." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "No. My riders carry warriors to the fight and bring them home, and that's all, because a wind rider that fights the naga doesn't come back. You do the fighting, and I'll be here when you're done." } },
      choices = {
        { text = "Fair enough. Everyone has a place, and yours is here.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A beast that won't fight is a beast wasted.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They mind the salt wind, the naga and the noise from Ag'tor's camp, but a quiet beast doesn't bother them. If yours starts barking, though, they'll bite it, and then you'll be walking home." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "{pet} can stay by the perch while you wait. The riders won't mind it, if it doesn't mind them." },
      },
      choices = {
        { text = "A trained beast stays calm. That's the whole of the art.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My beast barks when it wants. That's its right.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Couldn't say, shaman, but it troubles the beasts. The wind comes off the bay full of salt and storm, and they shake their heads at it as if it stings. Talk to it if you like, and I'll keep the harness oiled." } },
      choices = {
        { text = "I'll ask the wind's leave before I fly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I fly where I please. The wind can follow.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They hate them, and so do I. Keep it unsummoned near the roost and we'll have no trouble, but if one of my beasts gets spooked, you'll walk back to Orgrimmar." } },
      choices = {
        { text = "Fair. The beasts come first.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My demon stays with me.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "I'll keep it away.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "When Ag'tor asks, I do, but I keep my beasts high and fast. The elves have archers, and a wind rider is a big target, so I'm careful about who I carry." } },
      choices = {
        { text = "Your caution keeps them alive.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Risks are part of war.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll keep quiet, then.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "The salt gets in their feathers and the naga shriek from the bay all night, and a wind rider wants open plains, not a cursed coast. I don't blame them; I'd sooner be in Durotar myself, but the Horde needs a perch here." } },
      choices = {
        { text = "The Horde needs the perch. That's reason enough.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Then fly them somewhere better. Nobody's watching.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Well enough, but they won't fly low over the old elf ruins, no matter how hard I push them. Something down there frightens them, and I've learned to trust a wind rider's nose more than my own eyes, so we go high, and we go fast." } },
      choices = {
        { text = "Trust the beasts. They know danger better than we do.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Beasts should be trained past their fear. Push them harder.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else, Kroum.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "Warrior. Good. You won't complain about the wind, I hope, because everyone else does." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "Hunter. Your beast is quiet, and the riders like that." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "Shaman. The beasts like you better than they like me, so maybe you'll calm them before you fly." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "Warlock. Keep your demon away from the wind riders." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "Rogue. You're quiet, which I like, because the wind riders hate noise almost as much as I do." },
        { id = "h_default", key = true,
          text = "Kroum, wind rider master. I can send you home to Orgrimmar or Thunder Bluff, to the Crossroads, to Splintertree in Ashenvale, to Bloodvenom Post in Felwood, or north to Everlook in the snow." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, out here in the salt wind. My riders hate it and so do I, so if you've a prayer for it, say it quickly and climb on." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. My wind riders won't need to carry you far, I'd think, but they'll carry you all the same, and they don't mind the smell of the wild on you." },
      },
      again = { { id = "h_again", text = "The wind riders are restless. Say what you need, or climb on." } },
      choices = {
        { text = "Does the salt wind off the coast trouble the spirits too?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "How do the wind riders like it here?", next = "beasts" },
        { text = "Is it safe to fly over the coast?", next = "coast" },
        { text = "Show me where I can fly.", next = "BUSINESS" },
        { text = "Do your wind riders fear demons?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do you ever fly scouts over the elf camps?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Why do your riders hate Azshara so, Kroum?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do your wind riders ever fly into the fighting, Kroum?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do your wind riders mind my beast, Kroum?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do your wind riders fly well over Azshara?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Not today.", next = "END" },
      },
    },
    beasts = {
      lines = { { id = "b_default", text = "They hate the salt wind off the bay, and they hate the smell of the satyr camp even more. But they'll fly anywhere I tell them, which is more than I can say for most grunts." } },
      choices = {
        { text = "Good beasts.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    coast = {
      lines = { { id = "c_default", text = "Over the cliffs, yes. Over the bay, no: the storms come up out of nothing, and the elves' Sentinels shoot at anything with leathery wings, so we fly west and keep our heads down." } },
      choices = { { text = "West it is.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I fly wind riders for the Horde. Ag'tor gives the orders; I just make sure they get delivered." } },
    advice = { { id = "tp_ad", text = "Don't feed the wind riders the satyr's meat. Trust me on that." } },
    _none = { { id = "tp_none", text = "Ask Ag'tor. I just fly." } },
  },
}
