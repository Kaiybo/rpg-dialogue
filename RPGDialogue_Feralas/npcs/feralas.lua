-- Feralas: Feathermoon Stronghold on Sardor Isle (Alliance) and Camp Mojache (Horde). Voice: bibles/feralas.md
local P = RPGDialogueAPI:Pack("rpgd.feralas")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "shandris", id = TODO_NPC("Shandris Feathermoon"), name = "Shandris Feathermoon",
  bible = "bibles/feralas.md", role = "soldier", tier = "major",
  prejudice = { { class = "WARLOCK", amount = 15, why = "the Legion's tools; her family died in the War of the Ancients" }, { class = "MAGE", amount = 8, why = "the Highborne's arcane hunger brought the Legion" } },
  communities = { "feathermoon" }, temper = { "intent" }, values = { "loyal", "dutiful", "brave" },
  notices = { "class", "race" },

  impression = {
    first = "Shandris Feathermoon watches the water around Sardor Isle as though it might betray her at any moment. Her loyalty to the High Priestess runs deeper than duty, and it shows in every word.",
    third = "{name} met Shandris Feathermoon, General of the Sentinels, who holds Feathermoon Stronghold for the High Priestess.",
  },

  greetings = {
    { id = "g_pj_lock", when = { prejudiced = true, class = "WARLOCK" }, text = "Warlock. The sisters on the dock have orders to let you pass, and they will, but every bow on Feathermoon will know where you're standing until you leave it." },
    { id = "g_pj_mage", when = { prejudiced = true, class = "MAGE" }, text = "A mage, at my gate. The Highborne who ruled my people were mages too, and they spoke as softly as you will, right up until the sky burned." },
    { id = "g_pj_over", when = { prejudiced = "overcome" }, text = "I've watched you closely since you first came, and I meant to keep watching until you gave me a reason. You never gave me one, and the High Priestess would tell me to say so aloud." },
    { id = "g_isle", text = "Ishnu-alah, and welcome to Sardor Isle. Keep your bow strung and your eyes on the water; that's all I ask of anyone here." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back across the water, good. Now report." },
    { id = "g_scout", when = { origin = "nightelf_sentinel_scout" }, text = "A scout off Ashenvale's borders, this far south. You left the Sentinels' paths to watch the rest of the world, I'm told, and I don't approve, but a scout's eyes are a scout's eyes, so report as if you'd never left." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone from the isle {away}, and the naga have tested our shores more than once in that time. Report, and then rest, because I'll need you sharp." },
    { id = "g_away_long", when = { away = 60 }, text = "You've been away {away}, and I had begun to count you among those the forest kept, as Feralas keeps so many. I'm glad to be wrong, and the High Priestess will be glad to hear it." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown considerably since you last stood on this isle, and I can see it in how you carry your weapon. I have harder errands than the ones I gave you before, if you want them." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Word on the isle is that one of my people caught you in a lie, and Sentinels share such things quickly. Speak truly to me, or don't speak at all." },
    { id = "g_word_threat", when = { word = "intimidated" }, text = "I hear you frightened one of the Feathermoon folk, and I won't have our own people cowed on our own island. Turn that temper on the Gordunni instead." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = { "HUNTER", "WARRIOR" } },
      text = "You carry yourself like someone who's held a line. Feralas will test that, and so will I." },
    { id = "n_kaldorei", cat = "race", when = { race = "NightElf" },
      text = "Sister, or brother, of the kaldorei: the Sentinels can always use another. Think on it." },
  },

  start = "hello",
  nodes = {
    pj_shandris = {
      lines = { { id = "pj_shandris_default", text = "I judge it by what it did. I was a girl when the Highborne opened the way for the Legion, and I lost my family in the burning that followed, so forgive me if I don't wait to learn which kind of {class} you are." } },
      choices = {
        { text = "What happened to your family, General?", next = "pj_shandris2" },
        { text = "I answer to the Alliance's law, General, like any Sentinel.", next = "BACK", reply = "Then you will answer well, and I will see it, and in time perhaps I will stop watching your hands.", fx = { align = { order = 1 } } },
        { text = "I answer to no one for my craft, least of all you.", next = "BACK", reply = "You will answer to me on my island, whether you like it or not, and I would rather we did not test that.", fx = { align = { order = -1 } } },
        { text = "I'll give you no reason to draw, General.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    pj_shandris2 = {
      lines = { { id = "pj_shandris2_default", text = "Demons came through the trees at night, and my mother hid me under an overturned cart and went out to meet them. The High Priestess found me there days later, and I haven't lowered my bow near the Legion's tools since." } },
      choices = {
        { text = "I'm sorry for your mother. I'll keep my distance from your sisters.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    op_tyrande = {
      lines = {
        { id = "opt_q", text = "Strangers who come to Feathermoon have usually heard of her, and most of them have opinions they keep behind their teeth. I would rather hear yours aloud. What do you think of Tyrande Whisperwind?" },
        { id = "opt_q_h", when = { faction = "Horde" }, text = "You serve the Horde, and the High Priestess has sent Sentinels against your kind in Ashenvale. So tell me what the Horde says of her, since I doubt I'll hear it from anyone else." },
      },
      choices = {
        { text = "She's a true leader, and Elune's own voice in this world.", next = "op_tyrande_r1", fx = { affinity = 2, align = { light = 1 }, opinion = { tyrande = "admire" } } },
        { text = "She's cold, and her Sentinels kill first and ask later.", next = "op_tyrande_r2", fx = { affinity = -2, align = { light = -1 }, opinion = { tyrande = "distrust" } } },
        { text = "She's a priestess leading a war. That's a hard thing to do well.", next = "op_tyrande_r3", fx = { trait = { curious = 1 }, opinion = { tyrande = "mixed" } } },
        { text = "The High Priestess is the reason we still stand. I'd follow her anywhere.", next = "op_tyrande_r4", fx = { affinity = 3, opinion = { tyrande = "loyal" } }, when = { race = "NightElf" } },
        { text = "She defends her forests. I can respect an enemy who does that.", next = "op_tyrande_r5", fx = { affinity = 1, opinion = { tyrande = "respect" } }, when = { faction = "Horde" } },
        { text = "I'd sooner not speak of her, General.", next = "BACK" },
      },
    },
    op_tyrande_r1 = {
      lines = {
        { id = "op_tyrande_r1", text = "She is, and it is good to hear an outsider say it plainly. Remember it when you see her in the Temple of the Moon." },
      },
      choices = {
        { text = "Something else, General.", next = "BACK" },
      },
    },
    op_tyrande_r2 = {
      lines = {
        { id = "op_tyrande_r2", text = "Cold? She held our people together through the War of the Ancients and the Third War both. Be glad you have never needed to know how." },
      },
      choices = {
        { text = "Something else, General.", next = "BACK" },
      },
    },
    op_tyrande_r3 = {
      lines = {
        { id = "op_tyrande_r3", text = "It is, and she does it anyway, because Malfurion sleeps and someone must. I will not pretend that costs her nothing." },
      },
      choices = {
        { text = "Something else, General.", next = "BACK" },
      },
    },
    op_tyrande_r4 = {
      lines = {
        { id = "op_tyrande_r4", text = "Then we share a vow, kaldorei, and you are welcome at my side whenever the naga come up out of the water." },
      },
      choices = {
        { text = "Something else, General.", next = "BACK" },
      },
    },
    op_tyrande_r5 = {
      lines = {
        { id = "op_tyrande_r5", text = "That is more grace than I expected from the Horde. I will not return it in Ashenvale, but I will remember it here." },
      },
      choices = {
        { text = "Something else, General.", next = "BACK" },
      },
    },
    xpt_shandris = {
      big = true,
      lines = { { id = "xpt_shandris_default", text = "We trust them a little more, which is all anyone should ask of a Sentinel. The humans fought beside us at Hyjal, and I honor that, but this forest was ours for ten thousand years before any of them crossed the sea." } },
      choices = {
        { text = "Trust has to be earned, General. That's only fair.", next = "BACK", reply = "It is, and I am glad you see it, because I have lost too many sisters to trust that came too quickly.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "We bled at Hyjal too. Your caution insults your allies.", next = "BACK", reply = "Perhaps it does, and I will carry that, but I have also buried sisters who trusted too easily.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "The Sentinels trust those who keep their word. The naga twist the waters around Sardor Isle, and if your spirits can tell me where they gather, you'll have more than my trust." } },
      choices = {
        { text = "I'll scout the naga for you, General.", next = "BACK", reply = "Then Elune guide your spirits, and bring me the place, and my archers will see to the rest.", fx = { align = { order = 1 } } },
        { text = "The spirits aren't scouts. I'll go where they guide me.", next = "BACK", reply = "Then go where they guide you, and if it happens to be toward the naga, I will not complain.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sky_sh = {
      big = true,
      lines = {
        { id = "ssh_default", text = "Then you're a long way from home and very close to it at once. Eldre'Thalas stands in the hills east of here, and the ogres call it Dire Maul now; what lives in its deepest halls I wouldn't wish on any child of the city." },
        { id = "ssh_order", when = { all = { { race = "Skyborne" }, { faction = "Alliance" } } },
          text = "The High Order went to the Kirin Tor, I hear, looking for the magic your forebears carried out. I'll say it plainly, sky-child: my Sentinels will watch you closely until they understand what you came for." },
      },
      choices = {
        { text = "Watch, then. I've nothing to hide.", next = "BACK", reply = "Then you have nothing to fear from my archers, and they will watch you as closely as anyone else.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Everyone has something to hide, General.", next = "BACK", reply = "They do, and that is exactly why I watch, though I am glad to hear someone admit it.", fx = { align = { honor = -1 } } },
        { text = "Something must still live in the deepest halls.", next = "sky_sh2" },
      },
    },
    sky_sh2 = {
      lines = {
        { id = "ssh2_default", text = "The Highborne who stayed, or what's left of them, and whatever power they've been drinking for ten thousand years. Your people left before it got that bad, and I'd count that in their favour, if anyone asks me." },
      },
      choices = { { text = "Something else, General.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    druid_sh = {
      lines = {
        { id = "dsh_default", text = "Eyes on the coast that don't need a boat. The naga come up out of the sea where my scouts can't follow, and a druid who can swim among them and come back to tell me what she saw is worth a dozen archers on the wall." },
      },
      choices = {
        { text = "I'll scout the waters for you.", next = "BACK", fx = { affinity = 2, standing = { feathermoon = 1 } } },
        { text = "I serve the Circle, not the Sentinels.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    rogue_sh = {
      lines = {
        { id = "rsh_default", text = "Everyone works where my archers can't see them, eventually, so make yourself useful while you're out of sight. The ogres in the Feral Scar keep their chiefs well hidden, and a rogue who learns where would spare my Sentinels many arrows." },
        { id = "rsh_watch", when = { origin = "nightelf_watcher_trained" },
          text = "Watcher-trained, by the look of you. Maiev's people and mine don't always agree, but I've never once known one of you to waste an arrow's worth of effort, so go find me those chiefs." },
      },
      choices = {
        { text = "I'll find the chiefs. And deal with them.", next = "BACK", reply = "Then deal with them quietly, and my archers will see their camps fall into confusion by morning.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "I'll find them and report. Your archers can finish it.", next = "BACK", reply = "That is the wiser choice, and I will see your report reaches every archer before the next raid.", fx = { align = { honor = 1 } } },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "You call upon the same powers that broke the world and turned our own kin into the satyrs that haunt Eldre'Thalas. I will judge you by your deeds while you are here, but I will not forget what you are, and neither will my Sentinels." } },
      choices = {
        { text = "I master the Legion's power. It doesn't master me.", next = "BACK", reply = "So said the Highborne before they knelt, and I watched them kneel, so forgive me if I wait to see.", fx = { align = { light = -1 } } },
        { text = "I understand your caution. I'll earn your trust.", next = "BACK", reply = "Then earn it slowly, and I will notice, because I miss very little on this island.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then let us speak of other things.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I distrust what magic does to those who love it too much, and I watched the Highborne love it far too much. The High Priestess has made peace with your people's mages for the sake of the Alliance, and I keep that peace, though I keep my eyes open as I do." } },
      choices = {
        { text = "Magic is a tool. It's the wielder who matters.", next = "BACK", reply = "You may be right, but the wielder is always certain, until the day he is not, and that is what I fear.", fx = { align = { order = -1 } } },
        { text = "Your caution is wise. Magic needs a firm hand.", next = "BACK", reply = "It does, and I am glad a mage says so, because I have known very few who believed it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Watch the Hatecrest where my archers cannot, and tell me what they plan before they plan it. The naga strike from the water without warning, and a quiet blade among them would save Sentinel lives." } },
      choices = {
        { text = "I'll fight for Feathermoon gladly.", next = "BACK", reply = "Then you will be welcome at Feathermoon, and my Sentinels will be glad of a blade they cannot see.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll go where the pay is best, General.", next = "BACK", reply = "Then go to the mainland, where the pay is better and the naga are worse, and see how long it lasts.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The mainland shore, where the naga come up out of the surf at night, and the camps near the Twin Colossals where the ogres gather. My Sentinels strike and withdraw, but there are times I need someone who will plant their feet and not move." } },
      choices = {
        { text = "Then I'll hold, and I won't retreat while your Sentinels need me.", next = "BACK", reply = "Then you will stand where my Sentinels stand, and I will see that they remember your name.", fx = { align = { honor = 1 } } },
        { text = "I'll hold while it serves. I'm no use dead.", next = "BACK", reply = "That is honest, and I will not hold it against you, though my Sentinels never had that choice.", fx = { align = { honor = -1 } } },
        { text = "Let me ask something else, General.", next = "BACK" },
      },
    },
    xcl_dm = {
      big = true,
      lines = {
        { id = "xcl_dm_default", text = "Less crowded, perhaps, but a city that old is never empty. The Highborne raised it in Azshara's day, and it outlived the Sundering when so much else drowned, and since then the satyrs have nested in its gardens and the ogres in its courts." },
      },
      choices = {
        { text = "It should be sealed, General, and its magic left to rot.", next = "BACK", reply = "I have thought the same many times, and if I had the strength, I would seal it with my own hands.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "There's knowledge in those halls, and it's worth the risk.", next = "BACK", reply = "There may be, and I cannot stop you, but I have watched what that knowledge did to the ones who held it first.", fx = { align = { light = -1 } } },
        { text = "Do any Highborne still live inside, General?", next = "xcl_dm2" },
      },
    },
    xcl_dm2 = {
      lines = { { id = "xcl_dm2_default", text = "The ogres whisper that someone in the western halls still lights lamps at night, and my Sentinels have seen lights there that no ogre would bother with. If any of the old Highborne survive, they have hidden from Elune's people for ten thousand years, and I do not think they will be glad to be found." } },
      choices = {
        { text = "Then let them stay hidden, for now.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_shandris", tags = { "news" }, when = { party = { race = "NightElf" }, faction = "Alliance" },
          text = "You ride with one of my people, I see. I trust {companion} has told you that the forests of Feralas do not forgive carelessness, and that the Sentinels expect better than that from their friends." },
        { id = "h_cl_dm", tags = { "news" }, when = { cleared = "Dire Maul", faction = "Alliance" }, text = "My scouts say you went into the ruins of Eldre'Thalas, the place the ogres call Dire Maul, and came back out of its depths. Few of my Sentinels have walked those halls and lived, and I find I must look at you more carefully now." },
        { id = "h_default", key = true,
          text = "Shandris Feathermoon, General of the Sentinels. This stronghold watches over Feralas for the High Priestess. The naga stir along the coast, and the ogres in the hills; we watch them both." },
        { id = "h_tyrande", when = { heardLine = "tyrande.h_default" },
          text = "You've stood before the High Priestess, so you know why I serve as I do. She found me when I had no one, and I've never left her side since." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Elune's light on the water. The naga hate it, and that's reason enough for me to love it." },
        { id = "h_warm", when = { disposition = { min = 75 } },
          text = "You're back, and the sisters will be glad of it; so am I, though I'll deny it if Latronicus asks." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You carry the stench of the Legion, warlock, and every Sentinel on this isle can smell it. You stand on Feathermoon by the grace of the Alliance, and by nothing else." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage of the Alliance. Our people remember too well what arcane hunger did to this world, so I will watch your spells as closely as I watch the naga." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You walk like a Sentinel on the hunt, which I'll take as a compliment to whoever trained you. The naga on the coast are sly, and I have use for anyone who can match them." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin of the Silver Hand on Feathermoon. Pratt McGrubben once wore that tabard, and he tells me your order stands its ground, which is the only praise I give." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Hatecrest", min = 30 } }, text = "My Sentinels report fewer Hatecrest on the shore at night, and they tell me it was you who thinned them. Elune favors those who do the work, and so do I." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman at Feathermoon. The High Priestess teaches that all things answer to Elune in time, and I am curious what you believe answers you." },
        { id = "h_dd_shalzaru", tags = { "news" }, when = { questDone = TODO_QUEST("Against Lord Shalzaru") }, text = "Latronicus tells me Lord Shalzaru is dead in his hole at Isle of Dread, and that you were the blade that did it. The Hatecrest will choose another royal soon enough, but they'll think twice before they look toward this isle again." },
      },
      again = { { id = "h_again", text = "Report, or ask; either is useful, and the Sentinels have little use for idle words." }, { id = "h_again2", text = "What else?" } },
      choices = {
        { text = "What troubles Feralas?", next = "troubles" },
        { text = "The stronghold carries your name.", next = "name" },
        { text = "You seem devoted to the High Priestess.", next = "tyrande" },
        { text = "Who keeps the watch when you sleep?", next = "watch" },
        { text = "Test my aim, General.", next = "archery", when = { class = { "HUNTER", "WARRIOR" } } },
        { text = "I'd stand with the Sentinels.", next = "sentinels", when = { race = "NightElf" } },
        { text = "A human paladin sells leather here. Odd company for Sentinels.", next = "pratt", when = { race = { "Human", "Dwarf", "Gnome" } } },
        { text = "Elune and the Light. Are they so different?", next = "priest_elune", when = { class = "PRIEST" } },
        { text = "My people came from Eldre'Thalas, General.", next = "sky_sh", when = { race = "Skyborne" } },
        { text = "The Circle sent me. What does Feathermoon need from a druid?", next = "druid_sh", when = { class = "DRUID" } },
        { text = "I work best where your archers can't see me.", next = "rogue_sh", when = { class = "ROGUE" } },
        { text = "I've done nothing to earn your contempt, General.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "You seem wary of anyone who studies magic, General.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What would you have a rogue do here, General?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What ground would you have me hold, General?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do the Sentinels trust a shaman, General?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I've been through Dire Maul, General. Eldre'Thalas is less crowded now.", next = "xcl_dm", when = { cleared = "Dire Maul", faction = "Alliance" } },
        { text = "Do the Sentinels trust outsiders who travel with your people, General?", next = "xpt_shandris", when = { party = { race = "NightElf" }, faction = "Alliance" } },
        { text = "You judge my craft before you've seen what I do with it.", next = "pj_shandris", when = { prejudiced = true } },
        { text = "I grew up on this isle, General. You may not remember me.", next = "xorig_fmoon", when = { origin = "nightelf_feathermoon_raised" } },
        { text = "Elune guide your arrows.", next = "END", fx = { affinity = 1, standing = { feathermoon = 1 } } },
      },
    },
    xorig_fmoon = {
      lines = {
        { id = "xfm_default", text = "I remember every child raised on Feathermoon, because there have never been so many that I could forget one. You used to sit on the pier and count the boats in from Auberdine, and you scolded the sailors when they came in late. What brings you home?" },
      },
      choices = {
        { text = "I wanted to see that the isle still holds.", next = "BACK", fx = { affinity = 1, standing = { feathermoon = 1 } } },
        { text = "The world felt too small without the sea around it.", next = "BACK" },
        { text = "Something else, General.", next = "BACK" },
      },
    },
    troubles = {
      big = true,
      lines = {
        { id = "t_default", text = "The Hatecrest naga hold the ruins of Solarsal, and there are more of them each month. A hive of insects has appeared that has no business being in Feralas, and I've sent word to Gracina Spiritmight in Darnassus. And there are ogres, always ogres." },
      },
      choices = {
        { text = "The naga first.", next = "troubles_naga" },
        { text = "Tell me about the hive.", next = "troubles_hive" },
        { text = "Send me where I'm needed.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 }, standing = { feathermoon = 1 } } },
      },
    },
    troubles_naga = {
      lines = { { id = "tn_default", text = "They crawl out of the sea into the old ruins and call them theirs. Solarsal was ours long before the water rose. I don't intend to let them keep it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    troubles_hive = {
      lines = { { id = "th_default", text = "Insects the size of sabercats, building where nothing like them has built before. Gracina will know what they are. I'd rather she didn't have to." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    name = {
      lines = { { id = "n_default", text = "The sisters named it. I didn't argue; it's hard to argue with an entire island's worth of Sentinels. I'd have called it something less vain." } },
      choices = {
        { text = "Like what?", next = "name_like" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name_like = {
      lines = { { id = "nl_default", text = "The Watch, or the Rock, or anything that sounds like it does its job and doesn't need thanking." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    tyrande = {
      big = true,
      lines = { { id = "ty_default", text = "She found me alone, a child with no one left, and she took me in. Everything I am, she began. Everything I do, I do so she never has to regret it." } },
      choices = {
        { text = "What do others make of the High Priestess?", next = "op_tyrande" },
        { text = "She must be proud of you.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "That's a heavy debt to carry.", next = "tyrande_debt" },
      },
    },
    tyrande_debt = {
      lines = { { id = "td_default", text = "It isn't a debt, because debts get paid off. This is a vow, and vows don't end." } },
      choices = {
        { text = "A vow like that deserves respect.", next = "BACK", reply = "Thank you, and I will carry it, because the High Priestess has never once asked me to set it down.", fx = { align = { honor = 1 } } },
        { text = "Even vows can be broken when they stop making sense.", next = "BACK", reply = "Perhaps they can, but I have never found a reason, and ten thousand years is a long time to look.", fx = { align = { honor = -1 } } },
        { text = "You'd rather be at her side in Darnassus.", tag = "Persuade", next = "tyrande_far",
          check = { pass = { any = { { disposition = { min = 65 } }, { heardLine = "tyrande.h_default" }, { trait = "brave" } } } },
          fail = { next = "tyrande_no", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch = {
      lines = { { id = "w_default", key = true, text = "Latronicus Moonspear, my second. He sleeps less than I do and complains about it more. The island has never once been unwatched." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    archery = {
      lines = { { id = "a_default", text = "That post, past the dock, and the knot in the middle of it. One arrow, and don't hurry; I can tell when someone hurries." } },
      choices = {
        { text = "I take my time and loose.", next = "archery_hit", fx = { trait = { cautious = 1 } } },
        { text = "I loose at once.", next = "archery_miss", fx = { trait = { brave = 1 } } },
      },
    },
    archery_hit = {
      lines = { { id = "ah_default", text = "Good. Not perfect, but good. You'd be welcome on the night watch, if you ever tire of wandering." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, standing = { feathermoon = 1 } } } },
    },
    archery_miss = {
      lines = { { id = "am_default", text = "Fast and wide, and Feralas forgives neither. Try again next time you're here, and slower." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sentinels = {
      lines = { { id = "s_default", text = "Then come back when you're ready to stand a night watch in the rain with a cold bowstring. A fight's over in minutes, and a watch lasts till dawn." } },
      choices = {
        { text = "I'll be ready.", next = "BACK", reply = "Then come back, and I will give you the hardest post on the wall, because that is how we judge readiness here.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Standing watch isn't for me, so I'll stick to the fighting.", next = "BACK", reply = "Then fight well, but know that the battles are won by those who stand the long nights before them.", fx = { align = { order = -1 } } },
      },
    },
    pratt = {
      lines = { { id = "p_default", text = "He mends our leather better than any of us can, and he's never once asked to be thanked. On this island, that makes him kaldorei enough." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest_elune = {
      lines = { { id = "pe_default", text = "My priestesses would say yes, and argue for a week. I've seen both close the same wound on the same Sentinel. I don't argue with what works." } },
      choices = {
        { text = "Nor do I.", next = "BACK", reply = "Then we agree on more than I expected, and I will not argue with you either.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Prayer doesn't close wounds; skill does.", next = "BACK", reply = "Perhaps, but I have seen the priestesses close wounds no skill could reach, so I will keep both close.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tyrande_far = {
      lines = {
        { id = "tf_default", text = "Every night. She carries our people alone while Malfurion sleeps, and the Temple is full of priestesses who would never tell her she looks tired, so I write my reports long and send them fast, because I know she reads them at moonrise." },
        { id = "tf_heard", when = { heardLine = "tyrande.h_default" },
          text = "You've stood before her, so you've seen it. She carries our people alone and nobody in that Temple would dare tell her to rest, so I write long reports and send them fast, because she reads them at moonrise and it's the only way I can be there." },
      },
      choices = {
        { text = "She knows you're keeping your vow.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tyrande_no = {
      lines = {
        { id = "tno_default", text = "Where I'd rather be doesn't matter; she sent me here, and here is where I'm needed. Ask me about the naga." },
        { id = "tno_kin", when = { race = "NightElf" },
          text = "A Sentinel doesn't choose her post, {g:brother|sister}, and you know it as well as I do. Ask me about the naga." },
      },
      choices = {
        { text = "As you say, General.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "My scouts cover every road and shore in Feralas, and each reports to me by moonrise. Ask what you need." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } },
        text = "You've earned a straight answer from the Sentinels, so ask me anything. I'll tell you what I'd tell my own second." },
    },
    background = { { id = "tp_ba", text = "The High Priestess raised me and the Sentinels taught me, and Feralas is where I keep the promise I made to both.", next = "tyrande" } },
    advice = { { id = "tp_ad", text = "Keep the water at your back only if you can see what's in it. Here, you can't." } },
    cenarion_circle = { { id = "tp_circle", text = "The druids heal the land, and we keep it whole long enough for them to finish. It's a fair arrangement." } },
    tyrande = { { id = "tp_tyrande", text = "I have served Tyrande since the first war against the Legion, when she was a young priestess and I was an orphan she took in. There is nothing she could ask of me that I would refuse." } },
    elune = { { id = "tp_elune", text = "Elune watches over the Sentinels on the darkest nights, and Feralas has a great many dark nights. I do not ask her for victory, only for clear eyes." } },
    dire_maul = { { id = "tp_dire_maul", text = "The Highborne of Eldre'Thalas hid behind their wards for ten thousand years, and now the ogres crawl through their halls. Whatever is still alive in the deep library, I do not trust it." } },
    green_dragons = { { id = "tp_green_dragons", text = "The green dragons guard a portal into the Dream in the wilds of Feralas, and lately they guard it with too much fury. Something troubles Ysera's children, and they do not say what.", fx = { learn = { "emerald_dream" } } } },
    highborne = { { id = "tp_highborne", text = "The Highborne nearly ended the world once, and some of their descendants still think it was a misunderstanding. I keep my bow strung when they talk." } },
    malfurion = { { id = "tp_malfurion", text = "Malfurion sleeps in the Dream, and the druids tell us he will wake when he is needed. I have heard them say it a long time now." } },
    thrall = {
      { id = "tp_thrall", text = "The orc warchief cut a peace with the humans, and his warriors still fell trees in Ashenvale and call it trade. I will judge him by what his axes do, not what his heralds say." },
      { id = "tp_thrall2", when = { faction = "Horde" }, text = "Your warchief speaks of honor, and Warsong Gulch still bleeds. Tell him the Sentinels keep a count, if you see him." },
    },
    nordrassil = { { id = "tp_nordrassil", text = "Nordrassil gave its blessing to stop Archimonde, and it has never been whole since. That is why we have Teldrassil, and why some of us worry about Teldrassil." } },
    sentinels = { { id = "tp_sentinels", text = "The Sentinels guarded Kalimdor while our men slept in the Dream, and we are still guarding it. Feathermoon is the far edge of that watch, and it is a cold, wet edge." } },
    satyrs = { { id = "tp_satyrs", text = "The satyrs were our own people once, before they sold themselves to the Legion. When I put an arrow in one, I am finishing a quarrel ten thousand years old." } },
    _none = { { id = "tp_none", text = "That's not a matter for the Sentinels. Ask in Darnassus, where the priestesses have centuries to spare for such questions." } },
  },
}

P:NPC {
  key = "pratt", id = TODO_NPC("Pratt McGrubben"), name = "Pratt McGrubben",
  bible = "bibles/feralas.md", role = "vendor", tier = "quest",
  communities = { "feathermoon" }, temper = { "genial" }, values = { "kind", "practical" },
  notices = { "craft", "class" },

  impression = {
    first = "Pratt McGrubben calls himself mostly retired from paladin work and fully busy with leather. He has an old soldier's patience and a friendly word for whoever wanders up to his bench.",
    third = "{name} met Pratt McGrubben, a genial semi-retired paladin who works leather at Feathermoon Stronghold.",
  },

  greetings = {
    { id = "g_shop", text = "Well met! Leather, repairs, or a kind word? The kind word's free, but mind the mould on the straps; it grows overnight in this damp." },
  },

  notice = {
    { id = "n_leather", cat = "craft", when = { profession = "Leatherworking" },
      text = "A leatherworker! Then I've a pattern or two you'll want to earn. Bring me proof of good work and we'll see." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin, out here! I swung a hammer for the Light longer than I care to count, and now I swing a needle. The Light doesn't seem to mind." },
  },

  start = "hello",
  nodes = {
    op_silver_hand = {
      lines = {
        { id = "opsh_q", text = "The Silver Hand was a fine order, once, before Lordaeron went the way it did and the Scarlets took half our banners. People still ask me what I think of it now, so let me ask you the same: what do you make of the Silver Hand?" },
      },
      choices = {
        { text = "The finest order Lordaeron ever raised. It'll rise again.", next = "op_silver_hand_r1", fx = { affinity = 2, align = { order = 1 }, opinion = { silver_hand = "admire" } } },
        { text = "It failed Lordaeron when it mattered. The Crusade is its child.", next = "op_silver_hand_r2", fx = { affinity = -1, align = { order = -1 }, opinion = { silver_hand = "failed" } } },
        { text = "The order doesn't matter. The paladins who still keep faith do.", next = "op_silver_hand_r3", fx = { trait = { kind = 1 }, opinion = { the_light = "faith" } } },
        { text = "I carry the Hand's oath still, Pratt.", next = "op_silver_hand_r4", fx = { affinity = 3, opinion = { silver_hand = "loyal" } }, when = { class = "PALADIN", faction = "Alliance" } },
        { text = "I don't know enough of it to say, Pratt.", next = "BACK" },
      },
    },
    op_silver_hand_r1 = {
      lines = {
        { id = "op_silver_hand_r1", text = "I'd like to think so, and I'd like to be there when it does, if my knees agree. Thank you for saying it." },
      },
      choices = {
        { text = "Something else, Pratt.", next = "BACK" },
      },
    },
    op_silver_hand_r2 = {
      lines = {
        { id = "op_silver_hand_r2", text = "That stings, friend, and it stings because there's truth in it. The Crusade grew out of our grief, and we never pulled the weeds in time." },
      },
      choices = {
        { text = "Something else, Pratt.", next = "BACK" },
      },
    },
    op_silver_hand_r3 = {
      lines = {
        { id = "op_silver_hand_r3", text = "Now that's the sort of thing Uther used to say, more or less. You'd have liked him, I think, and he'd have liked you." },
      },
      choices = {
        { text = "Something else, Pratt.", next = "BACK" },
      },
    },
    op_silver_hand_r4 = {
      lines = {
        { id = "op_silver_hand_r4", text = "Then the Hand isn't gone, is it? Mind your knees and keep your boots mended, and I'll call that a fine career." },
      },
      choices = {
        { text = "Something else, Pratt.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Not wrong, only new. The Light and the spirits both ask you to look after more than yourself, and if you do that, I won't argue with how." } },
      choices = {
        { text = "I'll look after more than myself, Pratt.", next = "BACK", reply = "Good, then the Light won't mind, and neither will the spirits, and neither will I.", fx = { align = { light = 1 } } },
        { text = "I look after myself first. The spirits understand.", next = "BACK", reply = "They might, friend, but I've never yet met a spirit or a Light that didn't ask a little more of us.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every day out here, friend, or you'll find a buckle gone green and a strap snapped the moment an ogre swings at you. I lost a good shield that way in my paladin days, and now I pass it on with the needle, which hurts a good deal less." } },
      choices = {
        { text = "Caring for your kit is a warrior's first duty.", next = "BACK", reply = "That's the first lesson I teach anyone who walks into my shop, and you've saved me the speech.", fx = { align = { honor = 1 } } },
        { text = "I'd sooner buy new than fuss over old straps.", next = "BACK", reply = "Then you'll be back here often, friend, because new straps snap just as fast as old ones out here.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Not the beasts so much as what's been done to them. Some of the cats the Sentinels bring back came out of the Grimtotem's cages half-starved, and a hide like that tears in my hands." } },
      choices = {
        { text = "Take only what you need, and thank the beast for it.", next = "BACK", reply = "That's how I was taught, and how I teach, and the hides seem to hold better for it.", fx = { align = { light = 1 } } },
        { text = "A hide is a hide, whatever became of the beast.", next = "BACK", reply = "It's not, friend, and you'd know it if you felt one tear in your hands like those cats' hides do.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hunter_pr = {
      lines = {
        { id = "hpr_default", text = "Plenty, if you skin it clean and don't hack it about. The yetis in the Feral Scar make the warmest hides in Kalimdor, though I'd want your companion to keep the claws off the good bits." },
      },
      choices = {
        { text = "I take only what I'll use.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "It worries me, which is different, and it troubles the Sentinels far more. I've seen what fel does to a soul over time, and I'll patch your leathers just the same, but I'll say a quiet word to the Light for you while I do it." } },
      choices = {
        { text = "Pray all you like. I don't need it.", next = "BACK", reply = "Then I'll pray quietly, and you won't hear it, and we'll both be happier for the arrangement.", fx = { align = { light = -1 } } },
        { text = "I'll take any prayers you have to spare.", next = "BACK", reply = "Then you'll have them, friend, every morning, and I'll throw in a quick one for your leathers too.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I patched a few in the war, when SI:7 lads came through our camps needing their kit mended in a hurry. They never said where they'd been, and I never asked, and I got rather good at sewing quiet." } },
      choices = {
        { text = "SI:7 did the dirty work that kept us safe.", next = "BACK", reply = "They did, and they paid for it in ways nobody saw, so I sewed their kit as quietly as they wore it.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Spies and cutthroats, the lot of them.", next = "BACK", reply = "Some were, I won't deny it, but the ones I mended bled for the kingdom same as any knight.", fx = { align = { honor = -1 } } },
        { text = "Something else, Pratt.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every morning, friend, when the rain stops long enough for the sun to come through the trees. I don't swing a hammer for it anymore, but I stitch for it, after a fashion, because a Sentinel in good leathers comes home more often than one without." } },
      choices = {
        { text = "That's still service. The Light doesn't care what tool you use.", next = "BACK", reply = "Thank you, friend, that's how I've come to see it too, and it makes the needle feel lighter.", fx = { align = { light = 1 } } },
        { text = "A paladin should fight. Stitching is a retreat, Pratt.", next = "BACK", reply = "Maybe it is, but my knees told me I'd fought enough, and the Light didn't argue with them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Their ancestors were Highborne once, or fought against them, and the ruins of Eldre'Thalas are right across the water to remind them. Shandris doesn't forget a thing like that, and I can't say I'd want her to." } },
      choices = {
        { text = "I'll show them a mage can be trusted, in time.", next = "BACK", reply = "Good, and they'll notice, slow as they are to say so, because Shandris misses nothing.", fx = { align = { order = 1 } } },
        { text = "Their old grudges are their own. I won't apologize for my craft.", next = "BACK", reply = "That's your right, friend, but you'll find the Sentinels slow to forget, and slower to forgive.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Pratt McGrubben, mostly retired from paladin work and fully employed in leather. I patch whatever the Sentinels bring back torn." },
        { id = "h_quality", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("The Mark of Quality") }, { questActive = TODO_QUEST("Improved Quality") } } },
          text = "Show me the hides, and I'll show you how to make something a Sentinel would be proud to wear. Quality takes patience, and I've got plenty of that now." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid of the Circle! Good, because too many of the hides the Sentinels bring me were torn by things I'd like a druid to explain." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock, is it? I've hung up my hammer, friend, but a man doesn't stop being a paladin all at once, and I'll admit my hand still twitches for it." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Now there's a rogue's coat, and it's had a rough time of it, by the look of those seams. Oil those seams before you go near the naga, because creaky leather gets more of your lot killed than bad luck does." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior! Come here and let me see those straps, because the rain in Feralas rots good leather faster than any Gordunni club ever broke it." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest of the Light! I've not had a proper talk about the Light since I hung up my tabard, and you'll forgive an old man for being glad of it." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage, on Feathermoon! The Sentinels will watch you closely, friend, so don't take it to heart, because they watched me for a full year and I only sell leather." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! I carried the Light for many a year, and I never once thought I'd see the day Ironforge took up totems." },
        { id = "h_dd_scales", tags = { "news" }, when = { questDone = TODO_QUEST("Against the Hatecrest") }, text = "Latronicus sent me down a sack of Hatecrest scales, and he said you were the one who pried them off. They're the toughest hide I've worked since I put down the hammer, so thank you kindly, friend." },
      },
      again = { { id = "h_again", text = "Anything else, friend? I'll keep stitching while you think." } },
      choices = {
        { text = "Do the beasts of Feralas trouble a leatherworker, Pratt?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "Why did you retire?", next = "retire" },
        { text = "I didn't expect a human among the Sentinels.", next = "human" },
        { text = "Teach me something about leather.", next = "leather", when = { profession = "Leatherworking" } },
        { text = "Does the Light answer a leatherworker?", next = "light", when = { class = "PALADIN" } },
        { text = "I skin what I hunt. Any use to you?", next = "hunter_pr", when = { class = "HUNTER" } },
        { text = "My craft seems to bother you, Pratt.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "You know a lot about rogues' leathers, Pratt.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Does a warrior's armor really need that much tending, Pratt?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "You must still feel the Light, Pratt, even without your tabard.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why do the Sentinels distrust mages so, Pratt?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Does a dwarf shaman seem wrong to an old paladin?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "What can you make from naga scales, Pratt?", next = "dd_scales", when = { questDone = TODO_QUEST("Against the Hatecrest") } },
        { text = "Just browsing.", next = "END" },
      },
    },
    dd_scales = {
      lines = {
        { id = "dd_scales_1", text = "Bracers, mostly, and a vest if I can stretch them, though they fight the needle like the naga fought you. I used to wear plate blessed by the Light, and now I stitch scales off creatures that used to be night elves, which is a strange road for an old paladin to walk." },
      },
      choices = {
        { text = "Armor is armor. Where it came from doesn't matter.", next = "BACK", reply = "That's a soldier's answer, and I gave it myself once. It keeps a Sentinel alive, and I suppose that's blessing enough.", fx = { align = { light = -1 } } },
        { text = "They were elves once. That should give us pause.", next = "BACK", reply = "It gives me pause every time I cut a piece, friend. The Light taught me that, even if it didn't teach me to stop.", fx = { align = { light = 1 } } },
        { text = "Something else, Pratt.", next = "BACK" },
      },
    },
    retire = {
      lines = { { id = "r_default", text = "Only mostly retired, friend. The Light still answers when I call; I just call less often, so don't let the needle fool you." } },
      choices = {
        { text = "Something must have made you stop.", next = "retire_why" },
        { text = "Ha. Noted.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    retire_why = {
      lines = { { id = "rw_default", text = "Knees, mostly, and a feeling that there were enough young paladins and not enough people who could fix their boots." } },
      choices = {
        { text = "What do you think of the Silver Hand now?", next = "op_silver_hand" },
        { text = "Something else.", next = "BACK" },
      },
    },
    human = {
      lines = { { id = "h2_default", text = "They tolerated me, then they trusted me, and now they argue with me about stitching. That's as close to family as the kaldorei get with a human." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    leather = {
      lines = { { id = "l_default", text = "Stretch it wet, cut it dry, and never rush the edge. Everything that tears, tears at the edge first." } },
      choices = { { text = "Thank you.", next = "BACK", fx = { affinity = 2 } } },
    },
    light = {
      lines = { { id = "li_default", text = "Every morning. It doesn't care what you're holding, hammer or needle; it cares what you do with it." } },
      choices = {
        { text = "Then I'll try to do right with mine.", next = "BACK", reply = "That's all any of us can do, friend, and the Light seems content with that, most mornings.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "I've no use for the Light, morning or night.", next = "BACK", reply = "Then I'll not push it on you, friend, but it'll still be there if you change your mind.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've patched a lot of leather and heard a lot of stories while doing it. Ask, and I'll tell you what I know." },
    },
    background = { { id = "tp_ba", text = "Paladin, then leatherworker, then the only human on an island full of Sentinels. Each step was a smaller hammer.", next = "human" } },
    advice = { { id = "tp_ad", text = "Oil your straps. A buckle that snaps in a fight has killed more of us than any ogre." } },
    holy_light = { { id = "tp_holy_light", text = "I served the Light with a hammer for a good many years before I served leather with a knife. The Light doesn't mind the change, I think, as long as the work is honest." } },
    silver_hand = { { id = "tp_silver_hand", text = "I was never a great name in the Order, just a fellow who held the line when he was told. The Silver Hand broke after Uther fell, and I came west to do something quieter." } },
    scourge = { { id = "tp_scourge", text = "I saw what the plague did to Lordaeron, and I went west so I'd never have to see it again. Some days the smell of a tannery brings it back anyway." } },
    booty_bay = { { id = "tp_booty_bay", text = "I bought my first good skinning knife in Booty Bay from a goblin who swore it was dwarven steel. It wasn't, but it's lasted twenty years, so I can't complain." } },
    dire_maul = { { id = "tp_dire_maul", text = "The ogres have the run of Dire Maul now, and they've hung their banners over elven arches. I'd not go in there without a priest and a good deal of luck." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. Ask the General; she knows everything on this island." } },
  },
}

P:NPC {
  key = "shyria", id = TODO_NPC("Innkeeper Shyria"), name = "Innkeeper Shyria",
  bible = "bibles/feralas.md", role = "innkeeper", tier = "service",
  communities = { "feathermoon" }, temper = { "gentle" }, values = { "kind", "generous" },
  notices = { "weary" },

  impression = {
    first = "Innkeeper Shyria keeps the kettle on for Sentinels coming in from the rain at every hour. She has a gentle way about her that makes the island feel safer than it is.",
    third = "{name} met Innkeeper Shyria, who shelters the Sentinels of Feathermoon Stronghold beneath her roof.",
  },

  greetings = {
    { id = "o_sh_failed", when = { gossip = { topic = "silver_hand", stance = "failed" } }, text = "Pratt's been quiet at his bench since you two talked, and he's usually such a chatterbox. Whatever you said about the old order, it stayed with him." },
    { id = "o_tyr_distrust", when = { gossip = { topic = "tyrande", stance = "distrust" } }, text = "The General has been sharp with everyone since you spoke, and I'm told it was about the High Priestess. Sit down and have some tea, and let's not mention it again." },
    { id = "g_inn", text = "Come in from the rain. Feralas is always wet; at least here it's warm and wet, and the roof only leaks over the table nobody sits at." },
    { id = "g_home", when = { homeInn = { "Feathermoon Stronghold" } }, text = "You've returned to the island, Elune be thanked. Your bed is ready, and the tea is fresh." },
    { id = "g_away", when = { away = 14 }, text = "Oh, you've been away {away}, and here you are dripping on my floor as though you never left. Sit by the fire, and I'll put the kettle on." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "One of the Sentinels came in tonight smiling, and she said it was something you'd told her. That's rare enough on this island that I made her a second cup." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Someone on the isle came in tonight quite cross after speaking with you, and drank her tea far too quickly. I hope it was a misunderstanding, because the island is small." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You've come back from somewhere grey and far away. Sit; the Sentinels can spare you for an evening." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Because the elements raged when the Well of Eternity fell, and our elders remember. They'll learn you mean no harm, and until then, the tea is hot." } },
      choices = {
        { text = "I'll show them I mean no harm.", next = "BACK", reply = "Then the tea will be ready whenever you come, and the elders will soften in time.", fx = { align = { honor = 1 } } },
        { text = "Let them stare. I owe them no explanations.", next = "BACK", reply = "You owe them nothing, but a kind word costs little, and they have long memories.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More than I'd like, and the Gordunni do most of it, though the naga on the coast take their share. The Sentinels bring them in at every hour, and I keep the kettle hot, because a warm cup steadies a hand that's held a shield all night." } },
      choices = {
        { text = "Rest is part of the fight. Your kindness keeps us standing.", next = "BACK", reply = "Thank you, and I will keep the kettle on, because a soldier who rests well fights well.", fx = { align = { light = 1 } } },
        { text = "A soldier shouldn't need comfort. Hardship makes us stronger.", next = "BACK", reply = "Perhaps, but even the hardest Sentinel takes a cup from me before her watch, and none of them are weak.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Every night, and they lie by the fire in a great warm heap while their riders sleep upstairs. I think the cats guard the stronghold as well as the Sentinels do, though I'd never say so where the General could hear." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Every night, and they lie by the fire in a great warm heap while their riders sleep upstairs. Your {pet} is welcome to join them, if it doesn't mind sharing, and I suspect it's had a wetter day than you have." },
      },
      choices = {
        { text = "A loyal beast has earned its place by the fire.", next = "BACK", reply = "It has, and the cats know it, and they would tell you so if they could speak.", fx = { align = { light = 1 } } },
        { text = "Beasts belong outside. A stronghold isn't a kennel.", next = "BACK", reply = "Then you'll have to tell the cats, and I would not like to be the one doing the telling.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Restful enough, until the naga come up out of the water at night. The Sentinels say the old ruins along the coast draw them, and nothing we do keeps them away for long." } },
      choices = {
        { text = "The Sentinels should drive them back into the sea.", next = "BACK", reply = "They try, every night, and every morning they come back with fewer arrows and more wounds.", fx = { align = { honor = 1 } } },
        { text = "Better to watch the isle than waste lives on ruins.", next = "BACK", reply = "That is what I tell the young ones, though they rarely listen to an innkeeper.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Of course, for the kettle at least. My sisters are wary of your kind, and they have their reasons, but I've never met a mage who couldn't be trusted with a cup of tea, and the Sentinels go through it by the barrel." } },
      choices = {
        { text = "Kindness should come first, whatever someone's craft.", next = "BACK", reply = "I have always thought so, and I am glad to hear a guest say it, because my sisters do not always agree.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Your sisters are right to be wary.", next = "BACK", reply = "They are, and I do not blame them, but I still keep a cup ready for you.", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "No harm done, though some of the Sentinels jump at shadows after their watch, and I'd hate for you to catch an arrow in my inn. They've seen naga come out of the water without a sound, and they don't take kindly to surprises." } },
      choices = {
        { text = "I'll announce myself. Your guests deserve their rest.", next = "BACK", reply = "Thank you, that is very kind, and the Sentinels will sleep easier for it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Being unheard keeps me alive. I won't change.", next = "BACK", reply = "Then please keep away from the archers' quarters, because I would rather not clean blood off my floor.", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The coral blades, some say, or the salt, or something darker that the Hatecrest sorceresses lay on them. Our priestesses of Elune tend them well, but there are only so many hands on this island, and the rain makes every fever worse." } },
      choices = {
        { text = "Your priestesses should lead. I'll follow their ways here.", next = "BACK", reply = "Thank you, they will be grateful, and so will I, because they have been working without rest.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Wounds don't care whose prayer closes them. I'll do it my way.", next = "BACK", reply = "Then do it gently, please, because the Sentinels are wary of strangers, even strangers who heal.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Some do and some don't, and the ones who don't remember the Third War too well. Your people and mine bled together at Hyjal, though, and most here will meet you halfway if you fight beside them on the coast." } },
      choices = {
        { text = "I'll follow Shandris's orders while I'm on her island.", next = "BACK", reply = "Thank you, and you will find the Sentinels warmer to you for it, slowly but surely.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I answer to the Light, not to Sentinel captains.", next = "BACK", reply = "Then answer to the Light, but please do it quietly, because Shandris does not like surprises.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Not one of them, and I don't blame them. Some of them are old enough to remember the satyrs being made, and they've spent ten thousand years killing what came of it, so a demon in the common room asks more of them than you know." } },
      choices = {
        { text = "Then my demon stays on the dock. They deserve their rest.", next = "BACK", reply = "Thank you, and they will thank you too, in their own way, which is by not shooting you.", fx = { align = { order = 1 } } },
        { text = "Ten thousand years is long enough to learn tolerance.", next = "BACK", reply = "Perhaps it is, but not for them, and I would not ask them to learn it in my common room.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Innkeeper Shyria. The Sentinels sleep in shifts, and every shift passes through my door. You're welcome among them." },
        { id = "h_jonespyre", when = { questActive = TODO_QUEST("Jonespyre's Request") },
          text = "Quintis Jonespyre has a request, so go and hear him out; he'll explain." },
        { id = "h_shift", when = { metBefore = true }, text = "The night shift came in soaked and laughing, because some ogre fell in the sea chasing them. Elune forgive me, I laughed too." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "The Sentinels change watch at this hour. Listen: no words, only the bows being passed, because they've done it so long they don't need words." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "Welcome, druid. The Sentinels rest easier with one of the Cenarion Circle under this roof, though I suspect you'd rather sleep under the trees." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! If you'd warm the kettle for me, I'd thank you, because the rain gets into the firewood and the Sentinels come in wet and cold at every hour." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You came in so quietly I nearly poured tea on you, friend. Sit down by the fire and dry off, and do make a little more noise next time." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest of the Light, here at Feathermoon? You're welcome at my hearth, and if you've healing to spare, some of the Sentinels came in from the coast last night with naga wounds that won't close cleanly." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, so far from the Eastern Kingdoms! The Sentinels will want to see you swing that hammer before they trust it, but my kettle trusts everyone." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior, wet through and weary, like every soldier who comes off the boat. Sit by the fire and let the rain run off you for a while." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter, and with a companion! Bring it in out of the rain, please; the Sentinels' cats sleep by my hearth all the time." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock, under my roof. I won't turn anyone from my hearth in this rain, but I'll ask you to leave your companion on the dock, because the Sentinels won't sleep with it in the house." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman! The Sentinels will stare, I'm afraid, but they'll share the fire with you, and so will I." },
        { id = "h_dd_raschal", tags = { "news" }, when = { questDone = TODO_QUEST("The Missing Courier") }, text = "Ginro came down for a cup last night and didn't drink it, and he told me you found what was left of Raschal's boat. The Sentinels have been quieter at the tables since, the way people are when they've lost one of their own." },
        { id = "h_dd_drown", when = { deathCause = "drowning" }, text = "You've drowned at least once, I'd say, by the way you eye the channel. Half the stronghold has swallowed too much of that water crossing from the mainland, so take the boat next time, and leave the swimming to the naga." },
      },
      again = { { id = "h_again", text = "Anything else? The kettle's on, and the moon won't be up for an hour yet." } },
      choices = {
        { text = "Is the isle a restful place, Shyria?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I'd like a room.", next = "BUSINESS" },
        { text = "The Sentinels here seem to have plenty to talk about.", next = "talk" },
        { text = "Is the rain ever going to stop?", next = "rain" },
        { text = "You'd let a mage near your hearth?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Sorry. Old habits, Shyria.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "The naga wounds seem slow to heal.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "I'd guess the Sentinels don't welcome outsiders easily.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do many warriors come back from the mainland hurt?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the Sentinels really bring their cats inside, Shyria?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Will the Sentinels really not sleep with a demon near, Shyria?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Why would the Sentinels stare at a dwarf shaman, Shyria?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Ginro took Raschal's loss hard, didn't he?", next = "dd_raschal", when = { questDone = TODO_QUEST("The Missing Courier") } },
        { text = "Thank you.", next = "END" },
      },
    },
    dd_raschal = {
      lines = {
        { id = "dd_raschal_1", text = "Harder than he lets anyone see. Raschal ate at that table by the window every evening and teased me about the rain, and Ginro sent him out with the parcel himself. Now Ginro sits in Raschal's seat and reads the dispatches twice, as if one of them might bring him back." },
      },
      choices = {
        { text = "It wasn't his fault. The coast is dangerous.", next = "BACK", reply = "I've told him so, and so has the General, but grief doesn't listen to Sentinels any more than to innkeepers. Perhaps he'll hear it from you.", fx = { align = { light = 1 } } },
        { text = "He'll want whoever did it found and punished.", next = "BACK", reply = "He does, and he's said as much to Quintis. Feathermoon doesn't forget its dead, and the gnolls of the south may learn that the hard way.", fx = { align = { light = -1 } } },
        { text = "Something else, Shyria.", next = "BACK" },
      },
    },
    talk = {
      lines = { { id = "t_default", text = "Naga, ogres, and whose turn it is to sweep. The last one causes the most arguments." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rain = {
      lines = { { id = "r_default", text = "Once, for an afternoon, long ago, and the whole island came out to look at the sky. Then it started again, and we all felt better." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The Sentinels talk on their way to sleep, and I hear it all as I bank the fire. Ask, and I'll share what I've heard." },
    },
    background = { { id = "tp_ba", text = "I've kept this inn as long as the Sentinels have kept this island. Neither of us has thought of leaving." } },
    advice = { { id = "tp_ad", text = "Dry your bowstring before you sleep. The damp here warps everything but a Sentinel's patience." } },
    elune = { { id = "tp_elune", text = "I light a candle to Elune for every Sentinel who goes out into the rain, and blow it out when she comes home. Some candles burn down on their own." } },
    tyrande = { { id = "tp_tyrande", text = "The High Priestess sent General Feathermoon to us, and the island has felt safer ever since. I have never met Lady Tyrande, but I have met her trust." } },
    dire_maul = { { id = "tp_dire_maul", text = "The Sentinels come back from Dire Maul with stories they tell only after the second cup. I keep the second cup ready." } },
    teldrassil = { { id = "tp_teldrassil", text = "I left Teldrassil for this island, where the rain never stops and the naga sing at night. I would not trade it back, but I miss the quiet branches sometimes." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "A traveler told me of a faire that moves from land to land with fortune-tellers and strange beasts. It has never come to Feathermoon, which is a shame, because we could all use a little foolishness." } },
    _none = { { id = "tp_none", text = "I keep the inn, and the General keeps the rest. Elune keeps the things neither of us can." } },
  },
}

-- Camp Mojache: the tauren camp in eastern Feralas.
P:NPC {
  key = "rokorhan", id = TODO_NPC("Rok Orhan"), name = "Rok Orhan",
  bible = "bibles/feralas.md", role = "soldier", tier = "major",
  communities = { "mojache" }, temper = { "fierce" }, values = { "loyal", "stern" },
  notices = { "class", "kit" },

  impression = {
    first = "Rok Orhan has one answer for most problems in Feralas, and it involves killing ogres. Still, he spoke of the land healing someday, which I didn't expect from him.",
    third = "{name} met Rok Orhan, who leads the Horde's fight against the Gordunni ogres from Camp Mojache.",
  },

  greetings = {
    { id = "g_camp", text = "You want to help the Horde in Feralas? Good, then kill ogres; that's how. Bring back their ears and not their smell, if you can manage it." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the ogres didn't stop breeding while you were away, so get your blade ready. Lok'tar, and back to work." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You hit harder than you did when I last saw you, and I can tell that just by looking. Good, then the Gordunni will learn to fear you, and I can send you deeper north." },
    { id = "g_word_threat", when = { word = "intimidated" }, text = "I hear you made one of the camp folk back down, and I'll allow it, once. Save that for the ogres, because they deserve it and our own people don't." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The camp says you've done good work for Mojache, and I listen when the camp agrees on something. Keep killing ogres, and they'll keep saying it." },
  },

  notice = {
    { id = "n_scourge", cat = "class", when = { race = "Scourge", class = "WARRIOR" },
      text = "A dead warrior. The ogres won't know whether to hit you or run from you, and neither do I, so let's both aim at the ogres." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "A warrior, good. The Gordunni are big and stupid, so hit them where it hurts, and that's everywhere if you hit hard enough." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Ogre clubs do that. Get mended and go back; they don't stop, so we don't either." },
  },

  start = "hello",
  nodes = {
    op_warchief = {
      lines = {
        { id = "opw_q", text = "Thrall sent me here to keep the Horde's road open, and I'll keep it open till I drop. But I hear a lot of grumbling on the road about him lately, so tell me true: what do you think of the Warchief?" },
      },
      choices = {
        { text = "He's the best thing that ever happened to the Horde.", next = "op_warchief_r1", fx = { affinity = 2, align = { honor = 1 }, opinion = { warchief = "trust" } } },
        { text = "He's too soft on the humans. The Horde needs a harder hand.", next = "op_warchief_r2", fx = { affinity = -1, align = { honor = -1 }, trait = { stern = 1 }, opinion = { warchief = "soft" } } },
        { text = "He freed the orcs from the camps. That's a debt I'll never forget.", next = "op_warchief_r3", fx = { affinity = 3, opinion = { warchief = "admire" } }, when = { race = "Orc" } },
        { text = "He's a fair foe, for what that's worth from the Alliance.", next = "op_warchief_r4", fx = { opinion = { warchief = "respect" } }, when = { faction = "Alliance" } },
        { text = "I'd rather not judge the Warchief, Rok.", next = "BACK" },
      },
    },
    op_warchief_r1 = {
      lines = {
        { id = "op_warchief_r1", text = "Ha! Now that's a proper answer. Go tell it to the ogres, they need to hear it most." },
      },
      choices = {
        { text = "Something else, Rok.", next = "BACK" },
      },
    },
    op_warchief_r2 = {
      lines = {
        { id = "op_warchief_r2", text = "Soft? I've seen him put a hammer through things you couldn't lift. He keeps the peace because he's strong enough to choose it, and you'd do well to learn the difference." },
      },
      choices = {
        { text = "Something else, Rok.", next = "BACK" },
      },
    },
    op_warchief_r3 = {
      lines = {
        { id = "op_warchief_r3", text = "Nor I, friend, because every orc remembers those walls, whether they stood inside them or only heard the stories. Lok'tar!" },
      },
      choices = {
        { text = "Something else, Rok.", next = "BACK" },
      },
    },
    op_warchief_r4 = {
      lines = {
        { id = "op_warchief_r4", text = "It's worth something. Don't tell the braves I said so, but I'll take fair over friendly any day." },
      },
      choices = {
        { text = "Something else, Rok.", next = "BACK" },
      },
    },
    xpt_rokorhan = {
      big = true,
      lines = { { id = "xpt_rokorhan_default", text = "Then take it to them properly, as a band and not as five heroes chasing their own glory. I've seen good fighters die in Dire Maul because each of them wanted to be the one who killed the chief." } },
      choices = {
        { text = "The band comes first. Glory is shared or it's nothing.", next = "BACK", reply = "Good. A band that moves as one comes home, and that's the only glory I care about.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Every warrior earns their own glory. That's the Horde's way.", next = "BACK", reply = "Then earn it, but if you earn it alone, you may find you have no one to tell about it.", fx = { align = { honor = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "If it hits hard, it helps. The Gordunni are many and foul, and I don't care whose god you swing for as long as you swing at them. Someday this land will heal, but not while the ogres hold the north." } },
      choices = {
        { text = "The Light will help this land heal once the ogres fall.", next = "BACK", reply = "Maybe it will, and I'll not argue, but it'll need the ogres dead first, and that's where I come in.", fx = { align = { light = 1 } } },
        { text = "The Light breaks skulls. That's all I need from it.", next = "BACK", reply = "Good. Then swing hard, and let the priests worry about the rest.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "In the caves and the old ruins to the north, where their shamans work foul magic with orbs and scrolls. Find their tracks, follow them to the shamans, and I will send the warriors in after you." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "In the caves and the old ruins to the north, where their shamans work foul magic. Follow their tracks, and let {pet} take the first bite, because the ogres fear a beast's teeth more than an orc's axe." },
      },
      choices = {
        { text = "I'll find them, but the kill should be face to face.", next = "BACK", reply = "Face to face, then, and I'll put my best warriors behind you when you find them.", fx = { align = { honor = 1 } } },
        { text = "An ambush kills just as dead. I'll strike from cover.", next = "BACK", reply = "Strike from cover, then, and I'll not ask you to explain it, as long as the shamans fall.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Not much, I admit, but a forest full of angry beasts is harder to march through. Break enough Gordunni and the woods will quiet down, and then you can tend them however you like." } },
      choices = {
        { text = "Then break them. The forest needs them gone.", next = "BACK", reply = "That's what I mean to do, and I'll send for you when we march north again.", fx = { align = { honor = 1 } } },
        { text = "The woods need healing, not only more killing.", next = "BACK", reply = "Maybe so, but healing starts when the wound stops opening, and the Gordunni are the wound.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shaman_ro = {
      lines = {
        { id = "sro_default", text = "Wrongly or rightly, all I know is that the elements answer them and the braves burn. You're the first shaman who's come out to Mojache in a moon; if you can turn their fire back on them, I'll owe you a drink." },
        { id = "sro_thrall", when = { origin = "orc_thrall_shaman" },
          text = "Thrall taught you himself? Then you know what it looks like when the elements are forced instead of asked. That's every Gordunni mage you'll meet." },
      },
      choices = {
        { text = "The elements will be freed from them.", next = "BACK", reply = "Then you'll be the shaman this camp has been waiting for, and the braves will thank you for it.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "I'll burn them with their own fire.", next = "BACK", reply = "Good. Let them taste what they've been throwing at us, and I'll watch from the front.", fx = { align = { light = -1 }, trait = { brave = 1 } } },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "The ogres have always had their warlocks and shamans, and their spells killed more of my warriors than their clubs did. If you mean to turn your power against them, I'll be glad of it, but I'll be watching where else you turn it." } },
      choices = {
        { text = "I'll burn the Gordunni for the Horde.", next = "BACK", reply = "Good. The Horde will remember it, and so will I, and so will the Gordunni, the few who live.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll use my power as I see fit, orc.", next = "BACK", reply = "Then I'll be watching, warlock, and you'll find my eyes are sharper than an ogre's.", fx = { align = { honor = -1 } } },
        { text = "Enough of that. Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I would have you strike them however breaks them fastest. The Gordunni don't fight with honor, so I won't ask you to, but I'd want the job done cleanly and the camp told who did it." } },
      choices = {
        { text = "A sleeping ogre is still an enemy.", next = "BACK", reply = "That's right, and they're easier to kill that way, so go and kill them while they snore.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Even ogres deserve a fair fight.", next = "BACK", reply = "They don't give one, but if you want to offer it, I won't stop you, as long as they still die.", fx = { align = { honor = 1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Badly enough. The Gordunni mages throw fire, and the brutes follow it in with clubs as big as a kodo's leg, and we've buried four this season. Belgrom sent me here to win, not to count graves, so I need healers who'll stand at the front line, not hide behind it." } },
      choices = {
        { text = "I'll stand at the front with them. That's where healing matters.", next = "BACK", reply = "Good. That's where the braves need you, and that's where I'll make sure you're guarded.", fx = { align = { honor = 1 } } },
        { text = "A dead healer helps no one. I'll stay back where it's safe.", next = "BACK", reply = "Then stay back, but stay close enough to reach the ones who fall, because they fall fast.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_dm = {
      big = true,
      lines = {
        { id = "xcl_dm_default", text = "Then the Gordunni lost the only ogre they were ever afraid of, and an ogre with nobody to fear makes stupid choices. Belgrom sent me here to break them, and you've done a piece of it in one night, so I'll be telling him your name." },
      },
      choices = {
        { text = "The Gordok fought hard for their king. I'll grant them that.", next = "BACK", reply = "They did, I'll give them that, and I respect any warrior who dies for his chief, even an ogre.", fx = { align = { honor = 1 } } },
        { text = "They're ogres, and they deserve whatever comes next.", next = "BACK", reply = "They do, and you've given them a start, so let's finish what you began.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Who rules the Gordok now?", next = "xcl_dm2" },
      },
    },
    xcl_dm2 = {
      lines = { { id = "xcl_dm2_default", text = "I've heard their custom says whoever kills the king takes his place, so the ogres in there may be calling you their king right now. If that's so, I'd laugh myself sick, and then I'd ask you to order them all off a cliff." } },
      choices = {
        { text = "Ogres can keep their crowns, Rok Orhan.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_rokorhan", tags = { "news" }, when = { party = { size = 4 }, faction = "Horde" },
          text = "A full war band, here at Camp Mojache. Good, because the Gordunni don't fear one orc, but they learn to fear five." },
        { id = "h_cl_dm", tags = { "news" }, when = { killed = { name = "King Gordok" }, faction = "Horde" }, text = "They say you went into the ruins the Gordok call home and pulled down their king. Good, because every Gordunni in these hills looks at that ruin like it's a throne, and now it's an empty chair." },
        { id = "h_default", key = true,
          text = "Rok Orhan. Belgrom Rockmaul sent me to break the Gordunni ogres of Feralas, and they're many, and foul, and nearly broken." },
        { id = "h_eldre_resolved", tags = { "news" }, when = { thread = { id = "eldre_thalas", state = "resolved" }, faction = "Horde" },
          text = "The Gordunni are still arguing over who gets Gordok's chair, and I hope they argue all year. Keep your eyes on the hills, and on the island too, because the elves haven't stopped watching us." },
        { id = "h_threat", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("A Threat in Feralas") }, { questActive = TODO_QUEST("The Ogres of Feralas") } } },
          text = "The Gordunni hold the hills north of camp, so thin them. Every ogre you drop is one fewer club at our gate." },
        { id = "h_belgrom", when = { questActive = TODO_QUEST("A Threat in Feralas") },
          text = "So Belgrom sent you, and that means your nerve is already proven. Let me tell you how things stand, and then you can decide if you're up to it." },
        { id = "h_ceremony", when = { questActive = TODO_QUEST("Dark Ceremony") },
          text = "Their shamans are at some ritual, dark work. Stop it before it finishes." },
        { id = "h_scroll", when = { any = { { questActive = TODO_QUEST("The Gordunni Scroll") }, { questActive = TODO_QUEST("The Gordunni Orb") } } },
          text = "The ogres are carrying scrolls and orbs, so bring them here. I want to know what an ogre's doing with writing." },
        { id = "h_proven", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Ogres of Feralas"), days = 3 } },
          text = "You came back, and the Gordunni outpost is quieter for it. In time the land will heal, as long as we don't give up on it." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A tauren druid, good! The Gordunni burn the old trees for their cookfires out west, and I'd like to see what a bear does to an ogre." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "A warlock. Thrall lets your kind serve the Horde, and so I let you stand in my camp, but the Gordunni have their own dark casters, so you'll understand if I don't care for the smell." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "You walk soft for one of the Horde. Good, because the Gordunni sleep in shifts, and a blade that comes in the dark is worth ten that come at noon." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter. Good, because the Gordunni hide in their caves and ruins, and I need someone who can track them to their doors." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Good, because ogre clubs break bones my healers can't set, and I'm tired of sending braves home to Thunder Bluff on a litter." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Gordunni", min = 40 } }, text = "The Gordunni are counting their dead, and a good share of them are yours. Belgrom will hear of it, and so will every ogre in the Lower Wilds." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. Can the Light break ogres? Because that's the only question I've got for anyone in Feralas." },
        { id = "h_dd_horns", tags = { "news" }, when = { questDone = TODO_QUEST("A Grim Discovery") }, text = "Krueg says you brought him a pile of Grimtotem horns big enough to make Belgrom smile, and Belgrom doesn't smile. Good work, and keep your back to a tree when you're in those hills." },
      },
      again = {
        { id = "h_again", text = "What else? Ogres don't wait for talk, and an orc who talks too long forgets to swing." },
        { id = "h_again2", text = "Ask it, then go hit something. Deeds, not words; that's the Horde's way." },
      },
      choices = {
        { text = "Do you care what the ogres do to the forest?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Who are the Gordunni?", next = "gordunni" },
        { text = "Why did Belgrom send you?", next = "belgrom" },
        { text = "What are the ogres up to?", next = "ceremony" },
        { text = "I didn't expect an orc in a tauren camp.", next = "camp" },
        { text = "Warrior to warrior: how do you fight an ogre?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "This is my people's camp.", next = "tauren", when = { race = "Tauren" } },
        { text = "I could read that orb for you.", next = "mage", when = { class = { "MAGE", "WARLOCK" }, any = { { questActive = TODO_QUEST("The Gordunni Scroll") }, { questActive = TODO_QUEST("The Gordunni Orb") } } } },
        { text = "My people once lived in these hills.", next = "skyborne", when = { race = "Skyborne" } },
        { text = "The ogres' shamans call on the elements wrongly.", next = "shaman_ro", when = { class = "SHAMAN" } },
        { text = "The Gordunni use dark magic too?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "You'd have me strike the ogres in their sleep?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Where do the Gordunni hide, Rok Orhan?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "The Gordunni seem to be hurting your braves badly, Rok Orhan.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Would the Light help you break the Gordunni, Rok Orhan?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "King Gordok is dead, Rok Orhan. I killed him in Dire Maul.", next = "xcl_dm", when = { killed = { name = "King Gordok" }, faction = "Horde" } },
        { text = "We'll take the fight to the Gordunni, Rok Orhan.", next = "xpt_rokorhan", when = { party = { size = 4 }, faction = "Horde" } },
        { text = "I'll fight.", next = "END", fx = { affinity = 2, trait = { brave = 1 }, standing = { mojache = 1 } } },
      },
    },

    gordunni = {
      lines = {
        { id = "go_default", text = "The strongest fighting force in Feralas, and they grow every season. Their outpost sits up the river to the north, and they'll push past it into everything we hold if we let them." },
      },
      choices = {
        { text = "They're just ogres.", next = "gordunni_mages", fx = { trait = { brave = 1 } } },
        { text = "What have they done to the land?", next = "gordunni_scar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gordunni_mages = {
      lines = {
        { id = "gm_default", text = "So I thought, until I met their ogre-magi, and their shamans, and their warlocks. Ogres with spells are ogres with ideas, and I don't like ogres with ideas." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gordunni_scar = {
      lines = {
        { id = "gs_default", text = "Look around and you'll see it; their very presence scars this place. In the High Wilderness to the southwest they camp in old night elf ruins, among withered trees and fouled ground, and nothing grows where they've been." },
      },
      choices = {
        { text = "The land here might heal in time.", next = "gordunni_heal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gordunni_heal = {
      lines = {
        { id = "gh_default", text = "In time, if we push them back and keep them back. I'm a warrior, not a druid, but I know that a wound closes once you stop opening it." },
      },
      choices = {
        { text = "Then I'll help keep that wound closed.", next = "BACK", reply = "Then you're welcome here, and I'll see your name told at the fire tonight.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Better to burn the Gordunni out than wait for anything to heal.", next = "BACK", reply = "Burn them out, then, and I'll light the first torch myself, but the healing will still come after.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    belgrom = {
      lines = {
        { id = "b_default", text = "Because I don't stop. Belgrom Rockmaul in Orgrimmar knows I'll still be hitting ogres when the rest have gone home, so he sends me the bold ones to help." },
      },
      choices = {
        { text = "Do you ever stop?", next = "belgrom_rest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    belgrom_rest = {
      lines = {
        { id = "br_default", text = "When the Gordunni do. Until then I sleep with my axe and eat standing up, and Innkeeper Greul scolds me for both." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    ceremony = {
      lines = {
        { id = "c_default", text = "Somebody found a filthy scroll at their outpost, plans for a meeting or a rite of some kind, run by their mage-lords, who carry strange orbs as well. Whatever they're calling up, I want it stopped before it comes." },
      },
      choices = {
        { text = "And the orbs they carry?", next = "ceremony_orb" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ceremony_orb = {
      lines = {
        { id = "co_default", text = "A mage-lord's orb holds real power, and I know my enemy well, but I can't tell you what it does. There's a mage in Orgrimmar, Uthel'nay, in the Darkbriar Lodge, who can." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    camp = {
      lines = {
        { id = "ca_default", text = "The tauren of Mojache are the reason the ogres haven't taken all of Feralas already. Their braves guard travelers on the roads, and I guard the braves from whatever's too big for them." },
      },
      choices = {
        { text = "Do they mind an orc giving orders?", next = "camp_orders" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_orders = {
      lines = {
        { id = "cor_default", text = "I don't give them orders; I give ogres orders, mostly to fall down. The tauren decide their own business, and they've been kind to a loud orc who forgets to wipe her boots." },
      },
      choices = {
        { text = "What do the braves think of the Warchief?", next = "op_warchief" },
        { text = "Something else.", next = "BACK" },
      },
    },

    warrior = {
      lines = {
        { id = "wa_default", text = "Low and fast. An ogre swings high and slow, so get under the club and take its knees, and it can't reach you once it's down." },
      },
      choices = { { text = "Knees first. Got it.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } } },
    },
    tauren = {
      lines = {
        { id = "t_default", text = "It is, and I'm a guest in it, so don't think I forget. Your people have held this ground against the Gordunni longer than I've been here, and I fight beside them because they've earned it." },
      },
      choices = { { text = "Then fight on, guest.", next = "BACK", fx = { affinity = 2, standing = { mojache = 1 } } } },
    },
    mage = {
      lines = {
        { id = "m_default", text = "Maybe you could, but it's dangerous, and a master should look at it far from my camp. Bring the orbs to me and let Uthel'nay take the risk; that's what Orgrimmar feeds him for." },
      },
      choices = { { text = "Better Uthel'nay's eyebrows than mine.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } } },
    },
    skyborne = {
      lines = {
        { id = "sk_default", text = "Then you've come back to find ogres squatting in every ruin from here to the coast. I can't give you your hills back today, but I can give you something to hit while you wait." },
      },
      choices = { { text = "That'll do.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know these ogres and this land better than I'd like. Ask, and be brief." },
    },
    grimtotem = { { id = "tp_grimtotem", text = "The Grimtotem are tauren trouble. The tauren here watch for them, and I watch for ogres." } },
    background = { { id = "tp_ba", text = "A warrior of the Horde, sent from Orgrimmar to break ogres. There's no more to it, and I like it that way.", next = "belgrom" } },
    advice = { { id = "tp_ad", text = "Never fight a Gordunni on a slope where it's above you. Ogres fall downhill, and they don't care who's underneath." } },
    thrall = { { id = "tp_thrall", text = "Thrall led us out of the camps, and every orc in Camp Mojache would die for him. I would die for him twice and complain about the first time." } },
    cairne = { { id = "tp_cairne", text = "The tauren of Mojache follow Cairne, and Cairne follows the Warchief, and that is why we share a camp. The old bull is wiser than me, so I let him do the thinking." } },
    dire_maul = { { id = "tp_dire_maul", text = "The Gordunni ogres crawl out of Dire Maul like rats from a burning barn. Kill enough of them and the ruin will empty, that is my plan." } },
    centaur = { { id = "tp_centaur", text = "I fought the Kolkar in the Barrens before I came to Feralas, and they are cowards with fast legs. The ogres are at least brave enough to stand still." } },
    tyrande = { { id = "tp_tyrande", text = "The night elves' priestess sends archers to shoot our scouts in Ashenvale and calls it defense. Let her come to Feralas and see what defense looks like." } },
    sylvanas = { { id = "tp_sylvanas", text = "The dead ones in Lordaeron are allies because the Warchief says so. I would not let one cook for me." } },
    _none = { { id = "tp_none", text = "I don't know, but if it's an ogre, I'll learn, and it'll learn what an orc's axe feels like." } },
  },
}

P:NPC {
  key = "orwin", id = TODO_NPC("Orwin Gizzmick"), name = "Orwin Gizzmick",
  bible = "bibles/feralas.md", role = "questgiver", tier = "quest",
  communities = { "mojache" }, temper = { "eager" }, values = { "curious", "ambitious" },
  notices = { "craft" },

  impression = {
    first = "Orwin Gizzmick keeps a sack of rocks under his bed that might be a fortune, and he can't stop talking about them. Half scholar, half salesman, and both halves are hungry.",
    third = "{name} met Orwin Gizzmick, a goblin at Camp Mojache who wants to know what the Gordunni cobalt is worth.",
  },

  greetings = {
    { id = "g_ore", text = "You look like somebody who can carry rocks, my friend: valuable rocks, mysterious rocks, rocks I can sell to a dwarf for twice what they're worth!" },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, my friend! Did you bring rocks? A friend who comes back after that long usually brings rocks, or at least I like to think so, and I've already set the price." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "Word is you talked somebody in camp into believin' something they shouldn't have, and I have to say I'm impressed! Never on me, of course, because I'm a goblin, and we invented that trick and we hold the patent." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "Word is you talked someone round to your view, and I'd love to know how, my friend, because I've been trying to sell this camp on my ore for months and nobody's bought a single stone." },
  },

  notice = {
    { id = "n_miner", cat = "craft", when = { profession = { "Mining", "Engineering" } },
      text = "A miner! Have you ever seen Gordunni cobalt? Nobody has, my friend, well, except the ogres, and that's the problem with the supply chain." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Everybody is, my friend, but you're more interesting than most, because nobody understands you yet. The ogres guard an ore nobody understands either, and I'd like to study both of you, though I'll settle for sellin' the ore." } },
      choices = {
        { text = "Study the ore properly, Orwin, and share what you learn.", next = "BACK", reply = "Ah, a scholar after my own heart, my friend, and I'll share what I learn, at a very reasonable rate.", fx = { align = { honor = 1 } } },
        { text = "Sell it first, Orwin, and study it after.", next = "BACK", reply = "Now that's the goblin way, my friend, and I'll study the receipts very carefully afterwards.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Nobody knows, which is exactly what makes it special, and exactly why I want to be the first to sell it. The Gordunni dig it out with their big hands and do somethin' odd with it, and I'd dearly love a sample a warrior pried out of their grip, my friend." } },
      choices = {
        { text = "I'll fight the ogres for the Horde, not for your profit.", next = "BACK", reply = "Fair enough, my friend, the Horde's profit and mine just happen to line up very nicely this season.", fx = { align = { honor = 1 } } },
        { text = "If there's coin in it, I'll break the ogres for you.", next = "BACK", reply = "Now you're speakin' my language, my friend, and I'll make sure you get a cut of the first sale.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because I'm a goblin, and goblins who follow ogre trails end up as ogre suppers, which is bad for business and worse for the goblin. You hunters can step around a sleeping ogre without waking it, my friend, and that's a talent I'd happily rent by the hour." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Because goblins who follow ogre trails end up as ogre suppers, my friend. You hunters can step around a sleeping ogre, though, and {pet} looks like it could sniff out cobalt in an ogre camp, if cobalt smells of anything." },
      },
      choices = {
        { text = "I hunt for Camp Mojache first. Your ore comes second.", next = "BACK", reply = "That's very loyal of you, my friend, and if you happen to pass any cobalt on the way, I'll be waiting.", fx = { align = { order = 1 } } },
        { text = "I'll go wherever the coin's best, Horde or not.", next = "BACK", reply = "Now there's a hunter with sense, my friend, and I'll see you're paid in coin that spends anywhere.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue_or = {
      lines = {
        { id = "ror_default", text = "Now you're talkin' my language, my friend! Quiet is good, because quiet means nobody else hears about the cobalt before I've set a price on it. Bring me enough and I won't ask whose cart it fell off." },
      },
      choices = {
        { text = "I'll steal it. Ogres don't need it.", next = "BACK", reply = "Exactly what I was thinkin', my friend, and I'll have the scales ready when you get back.", fx = { align = { honor = -1 }, affinity = 2 } },
        { text = "I'll fight for it openly, goblin.", next = "BACK", reply = "Openly, eh? Brave and noisy, my friend, but bring back the ore and I'll not care how you got it.", fx = { align = { honor = 1 } } },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because the ogres don't guard anything unless it hums, and this hums, my friend! Orgrimmar wants to know if it's useful, and I want to know if it's sellable, and you might be the one who can tell us both." } },
      choices = {
        { text = "Some things shouldn't be sold, Orwin.", next = "BACK", reply = "Shouldn't is a strong word, my friend, and I've never let a strong word stand between me and a good margin.", fx = { align = { order = 1 } } },
        { text = "Sell it. Let the buyers worry about the risk.", next = "BACK", reply = "My thinking exactly, my friend, and I'll write that on the receipt, in very small print.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Steal is a strong word for taking somethin' from an ogre who'd crack your skull for looking at it. I'd call it collection on behalf of the Horde, my friend, with a small handling fee left over for a goblin's curiosity." } },
      choices = {
        { text = "I'll do it for the Horde, not your purse.", next = "BACK", reply = "For the Horde, then, my friend, and the Horde's purse and mine will both be grateful.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll do it for whoever pays the most.", next = "BACK", reply = "A true professional, my friend, and I'll match any offer you get, plus a little extra for loyalty.", fx = { align = { honor = -1 } } },
        { text = "Never mind the cobalt.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "If it does, it hasn't said so, and I've been listening very carefully, my friend. The ogres tear whole hillsides open for that cobalt, though, and leave the rest to wash into the streams, and even I can see that's no way to treat a place, or a resource." } },
      choices = {
        { text = "Then take only what you need, and leave the hills whole.", next = "BACK", reply = "Fair enough, my friend, and I'll try, though I'll admit whole hills are very hard to leave alone.", fx = { align = { light = 1 } } },
        { text = "The ogres started it. Take everything you can carry.", next = "BACK", reply = "That's the spirit, my friend, and I'll bring a bigger cart next time.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Orwin Gizzmick, here on Orgrimmar's business and a bit of my own, my friend, mostly my own. The ogres guard an ore up north nobody understands, and I'd like to understand it, and then sell it." },
        { id = "h_cobalt", tags = { "news" }, when = { questActive = TODO_QUEST("Gordunni Cobalt") },
          text = "Gordunni cobalt, from their compound, my friend. They guard it jealously, which is how you know it's worth something, and worth something is my favourite kind of rock." },
        { id = "h_cobalt_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Gordunni Cobalt"), days = 3 } },
          text = "Twelve samples, all glowin', all mine! Somewhere out there is a buyer who'll pay a pretty penny for these, my friend, and I mean to find them before the glow wears off." },
        { id = "h_rocks", when = { metBefore = true }, text = "I've got a sack of rocks under my bed that might be worth a fortune, or might be rocks, my friend. Science is mostly waiting to find out, and business is mostly pretending you already know." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Do the earth spirits know anything about the ore the ogres guard up north? Because the rocks under my bed won't tell me, my friend, and I've asked nicely and offered a cut." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, and here I thought this camp was all braves and drums! Do your gods care about ore, I wonder? I've a sample that could use a blessing, my friend, or at least an appraisal." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock. Well, I won't ask where your power comes from if you don't ask where my samples come from, my friend, and that's what we in the trade call a mutual understanding." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage! Tell me what you feel off this lump of cobalt, would you, my friend? The Gordunni guard it like their mothers' bones, and I'd like to know why before I price it." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "A rogue! You know, my friend, the Gordunni keep their best cobalt in the deepest parts of their camps, and I'd pay very well for a sample that didn't come with an ogre attached." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior! Perfect, my friend, the ogres up north are sitting on a cave full of ore, and somebody's going to have to ask them politely, by which I mean with an axe." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter! You'll have seen the ogre trails through the woods, then, my friend, and I'd bet my best sample you could follow them straight to my ore." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid! Now, I know what you're going to say about digging, my friend, so let me get in first: the ogres dug it up before me, and I'm only taking it off their hands, as a public service." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin! Oh, now there's a curiosity, my friend, and you know how I feel about curiosities, which is that they're worth somethin' to somebody." },
      },
      again = {
        { id = "h_again", text = "More questions? Ask fast, my friend; time is money, and so is cobalt." },
      },
      choices = {
        { text = "What's this ore the ogres guard?", next = "cobalt" },
        { text = "You must have a buyer in mind for it.", next = "sell" },
        { text = "Feralas is a long way to come, Orwin.", next = "why" },
        { text = "I mine. What should I know about it?", next = "miner", when = { profession = "Mining" } },
        { text = "This is tauren land, goblin.", next = "tauren", when = { race = "Tauren" } },
        { text = "I could lift some cobalt off the ogres quietly.", next = "rogue_or", when = { class = "ROGUE" } },
        { text = "Should we really be digging up the ogres' ore, Orwin?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "The ogres' ore must be something special.", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "What makes you think the cobalt is magical?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "You want me to steal from the ogres?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "What's so special about the ore the ogres guard, Orwin?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Why don't you follow the ogre trails yourself, Orwin?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Does the earth not mind your digging, Orwin?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Am I worth something to somebody, Orwin?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll get you some.", next = "END", fx = { affinity = 1 } },
      },
    },

    cobalt = {
      lines = {
        { id = "c_default", text = "Gordunni cobalt, I call it, some kind of mineral the Gordunni dig up near their outpost, my friend, and it glows blue, which is never nothing in my experience. The trouble is they don't leave it lying around; they bury it again, like misers." },
      },
      choices = {
        { text = "Why would ogres bury it?", next = "cobalt_bury" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cobalt_bury = {
      lines = {
        { id = "cb_default", text = "To keep it away from folks like me, obviously, which only proves it's valuable. I'll lend you my shovel, my friend, deposit waived, so look for the blue glow at the outpost north of here and start diggin'." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    sell = {
      lines = {
        { id = "s_default", text = "Whoever pays, my friend, whoever pays! I'll take it along on my travels, and somewhere between here and the sea there's always somebody with more gold than sense." },
      },
      choices = {
        { text = "And if it's worthless?", next = "sell_worthless" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sell_worthless = {
      lines = {
        { id = "sw_default", text = "Then it's worthless blue rocks that glow, which is still a very good story to sell with them, my friend. A goblin never carries anything he can't sell one way or another." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    why = {
      lines = {
        { id = "w_default", text = "I just got here, my friend, and I heard the ogres have interesting minerals in their hills, so here I am. Feralas is wet, and loud, and everything wants to bite me, but nobody else is diggin', and that's my favourite kind of market." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    miner = {
      lines = {
        { id = "mi_default", text = "That a rock that glows and a rock that's buried are two different kinds of valuable, and one that does both is a treasure, my friend. Bring me cobalt, and keep a piece for yourself, because I won't count too carefully, and that's a rare thing for a goblin to say." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    tauren = {
      lines = {
        { id = "t_default", text = "And very fine land it is, with very generous hosts, and I'm only digging in the ogres' corner of it! Nobody here's going to miss a few rocks from the Gordunni, my friend, and the Gordunni can file a complaint." },
      },
      choices = { { text = "See that nobody does.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "That's exactly what I'm trying to find out, my friend, and the ogres aren't telling. It's heavy and it's blue, and I've a hunch it would take an enchantment better than iron, so somebody in Orgrimmar is going to want a cartload of it at a fat price." } },
      choices = {
        { text = "Sell it first. The study can wait.", next = "BACK", reply = "Now you're thinkin' like a goblin, my friend, and I'll study the profits very carefully afterwards.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Study it properly before you sell a single stone.", next = "BACK", reply = "Properly, properly, my friend, I'll study it so properly the price will double while I wait.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Digging, studying and then selling, in that order, my friend, and the ogres haven't the faintest idea what they're sitting on. If the earth spirits object, they're welcome to tell me themselves, and I'll gladly take notes and offer terms." } },
      choices = {
        { text = "Ask the earth's leave first, Orwin. It's only courteous.", next = "BACK", reply = "If they answer, my friend, I'll ask nicely, and if they don't, I'll take it as a yes.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If the ogres can't use it, somebody should profit.", next = "BACK", reply = "Exactly, my friend, and I'll make sure that somebody is me, with a little something for you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I keep my ears open for anything that might be worth money, my friend, which is nearly everything. Ask!" },
    },
    background = { { id = "tp_ba", text = "A goblin with a shovel, a sack and a nose for things that glow, my friend. That's the whole of the story, and the rest is profit." } },
    advice = { { id = "tp_ad", text = "Always dig where somebody else has been guarding, my friend, because nobody guards dirt." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay is where a goblin goes to make his fortune and where my fortune went to make somebody else's, pal. I'll be back there with a sack of rocks someday and they'll be sorry." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's got the best auction house this side of Undermine, and the worst water, and both are expensive. If my rocks are worth what I think, I'll sell them there." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Cartel keeps the peace in the ports, and the peace is very good for business, which is the only reason anybody keeps it. I'm a loyal member, on my mother's ledger." } },
    dire_maul = { { id = "tp_dire_maul", text = "Dire Maul's crammed full of old elf trinkets, and the ogres sitting on them don't know a relic from a rock. That's either a business opportunity or a funeral, depending who goes in." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet's a good port with a bad smell, and the bad smell's the Venture Company's lumber yards. I don't buy from those guys, they don't share." } },
    _none = { { id = "tp_none", text = "If it's not a rock, my friend, it's not my business, and if it is, it's for sale." } },
  },
}

P:NPC {
  key = "greul", id = TODO_NPC("Innkeeper Greul"), name = "Innkeeper Greul",
  bible = "bibles/feralas.md", role = "innkeeper", tier = "service",
  communities = { "mojache" }, temper = { "warm" }, values = { "generous" },
  notices = { "weary" },

  impression = {
    first = "Innkeeper Greul made me feel welcome before I'd shaken the rain off. In a land so full of teeth, her fire feels like the safest spot in Feralas.",
    third = "{name} met Innkeeper Greul, the hospitable tauren who keeps the fire at Camp Mojache.",
  },

  greetings = {
    { id = "o_war_soft", when = { gossip = { topic = "warchief", stance = "soft" } }, text = "Rok's been stomping around the camp since you told her the Warchief's gone soft. Sit by my fire a while, and give her time to cool off." },
    { id = "g_inn", text = "Come in, come in! Feralas is wide and wet and full of teeth, but in here it's just warm, and the only thing that bites is the pepper in the stew." },
    { id = "g_home", when = { homeInn = { "Camp Mojache" } }, text = "Welcome home to Mojache. The hides are dry, the kettle's on, and the Earth Mother kept the rain off the cookfire for once." },
    { id = "g_away", when = { away = 14 }, text = "Look who's come back after {away}! Shake off the rain and sit down, because the stew's been waiting nearly as long as I have." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "One of the braves came in grinning tonight and said it was because of you, and I've never seen that one grin before. Whatever you told him, you have my thanks." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The whole camp's been talking about how you helped Mojache, and they've been talking about it loudly, over my stew. Sit down, because they'll want to hear it from you." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look worn thin as old hide. Sit; nothing in Feralas can reach you for an hour." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "They're tauren, so they mind quietly and then they get over it. The Light warms you the way a fire warms the rest of us, and I think they understand that better than they'd say." } },
      choices = {
        { text = "The Light is a warmth to share, Greul.", next = "BACK", reply = "It is, little one, and I think the braves are beginning to feel it, even if they will not say so.", fx = { align = { light = 1 } } },
        { text = "I don't need their understanding, only their room by the fire.", next = "BACK", reply = "There is always room by the fire, little one, and the understanding usually comes with the stew.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Many, and some who come back carrying others, and I feed them all the same. The Gordunni hit hard, and the braves of Mojache hit harder, but even the toughest of them goes quiet when the stew is hot." } },
      choices = {
        { text = "There's no shame in grieving after a battle.", next = "BACK", reply = "No shame at all, and I am glad you know it, because many of the young ones do not.", fx = { align = { light = 1 } } },
        { text = "A warrior should keep his grief to himself.", next = "BACK", reply = "Some do, and some cannot, and I feed them all, because grief eats less when the belly is full.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Stories, mostly, of yetis in the caves and great bears in the hills, and meat when the hunt is good. They sit here and argue over whose beast is bravest until the fire burns low, and I let them, because it's better than hearing about the ogres." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Stories, mostly, of yetis in the caves and great bears in the hills, and whose beast is bravest. Your {pet} is the bravest I've seen tonight, I think, and you may tell the others I said so, because they'll argue with me and I enjoy it." },
      },
      choices = {
        { text = "A hunt is only worth telling if it's told true.", next = "BACK", reply = "True, little one, though I have never heard a hunt told true by this fire, and I would miss the stretching.", fx = { align = { honor = 1 } } },
        { text = "A good story's worth a little stretching.", next = "BACK", reply = "It is, and the braves agree, so they stretch until the bear is the size of a kodo.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "The Twin Colossals, mostly, and the giants who walk the shore beneath them. Some of the old braves say the giants are older than the ogres and only angry because something woke them." } },
      choices = {
        { text = "Then the giants should be left in peace.", next = "BACK", reply = "That is my thought too, and the elders agree, though the young braves itch to try their spears.", fx = { align = { light = 1 } } },
        { text = "Old or not, they're a danger to the camp.", next = "BACK", reply = "They may be, but they have not come to the camp yet, and I hope they never do.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Then you'd have more friends in this camp than any warchief, little one! Still, I think the Earth Mother means for us to get wet now and then, and a warm fire and a bowl of stew are their own kind of magic." } },
      choices = {
        { text = "The Earth Mother gives us the rain for a reason.", next = "BACK", reply = "He does, little one, and I think the forest would agree, though the braves complain about their boots.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "No one should suffer rain that magic can stop.", next = "BACK", reply = "Then you are welcome to try, little one, and I will make you an extra bowl if you succeed.", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Then you'll forgive me for keeping a bucket of water nearby while you're here, won't you? I'll feed anyone of the Horde who comes to Mojache, but I'd like my roof to stay where it is." } },
      choices = {
        { text = "I'll keep my imp in line. You have my word.", next = "BACK", reply = "Thank you, little one, and I will keep the bucket nearby anyway, out of habit.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A little chaos is in an imp's nature.", next = "BACK", reply = "Then I will keep two buckets, and I will hope its nature is satisfied by the fire in the pit.", fx = { align = { order = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Innkeeper Greul. Braves, hunters, traders, all of them pass my fire, and while Mojache keeps travelers safe, I keep them fed." },
        { id = "h_rain", when = { metBefore = true }, text = "Rain again; it always rains in Feralas. The ogres hate it, and that's the only thing I like about it." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid of the Earth Mother at my fire! Sit, because the braves say you hear things in Feralas the rest of us miss, and I like a good story with my stew." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman by my fire! Sit down, because the rain in Feralas never stops, and your kind are usually the ones who brought it." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest at my fire! Sit and eat, and if the braves come in torn up from the ogre hills tonight, I'll know where to send them." },
        { id = "h_hrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } }, text = "You came in out of the rain without a drip on the floor, which is a trick I'd like to learn. Sit down and warm yourself, and keep your hands on your own bowl." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage! Sit by my fire and dry those robes, because Feralas rains every day, and I've yet to see a spell that keeps the wet out of a traveler's boots." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "You're welcome at my fire, warlock, as every traveler is. But tell your little companion not to play with the flames, because the last imp that came through set my roof thatch smoldering." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior, soaked through and still gripping that weapon! Set it down by the fire, friend; nobody here will steal it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter! Come in from the rain, and bring your beast close to the fire, for the wet gets into fur worse than it gets into skin." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "Come in, come in, out of the rain. A Forsaken who carries the Light is as welcome by my fire as anyone, though the braves may need a moment." },
        { id = "h_dd_horns", tags = { "news" }, when = { questDone = TODO_QUEST("A Grim Discovery") }, text = "Krueg came through here with a sack of Grimtotem horns over his shoulder and your name in his mouth, loud enough for the whole camp to hear. Some of the braves cheered, and some of the elders went very quiet." },
        { id = "h_dd_deaths", when = { deaths = { min = 10 } }, text = "You have the tired look of someone who has walked back from the spirit healer more than once. Sit by my fire and dry off, because the rain in Feralas doesn't care how many times you've died." },
      },
      again = { { id = "h_again", text = "Something more? Sit a while longer; the rain isn't going anywhere, and the Earth Mother means it to grow the grass." } },
      choices = {
        { text = "What do the braves whisper about, Greul?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Tell me about Mojache.", next = "camp" },
        { text = "That orc by the gate is a loud one.", next = "rok" },
        { text = "Do you miss Mulgore?", next = "mulgore", when = { race = "Tauren" } },
        { text = "Does the rain in Feralas ever stop, Greul?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What dangers do travelers bring you word of?", next = "xhcast", when = { class = "PRIEST", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Someone's been asking strange questions at your fire, I'd guess.", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Magic could keep the rain away, Greul.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Imps can be hard to control, Greul.", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do you see many warriors come back from the ogre lands, Greul?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What do the hunters of Mojache bring to your fire, Greul?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do the braves mind a Forsaken paladin, Greul?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Why did the elders go quiet about the horns, Greul?", next = "dd_horns", when = { questDone = TODO_QUEST("A Grim Discovery") } },
        { text = "Just a rest, thank you.", next = "END" },
      },
    },
    dd_horns = {
      lines = {
        { id = "dd_horns_1", text = "Because those horns grew on tauren heads, friend, whatever tribe the heads belonged to. The Grimtotem are a shame on our people and they would kill every orc in this camp if they could, but some of our elders remember sharing fires with them before the tribes split." },
      },
      choices = {
        { text = "The Grimtotem chose their side. The bounty is fair.", next = "BACK", reply = "Krueg would agree with you, and so would most of the braves. I only ask you not to wave the horns around near the elders' fire.", fx = { align = { honor = -1 } } },
        { text = "Trophies from kin are a hard thing. I understand.", next = "BACK", reply = "Thank you for that; it's more than Krueg ever said. The orcs are good allies, but they don't always see what we see.", fx = { align = { honor = 1 } } },
        { text = "Something else, Greul.", next = "BACK" },
      },
    },
    camp = {
      lines = {
        { id = "c_default", text = "We sit above Wildwind Lake, where the stream runs through the middle of camp, and our hides are the thickest you'll find in Kalimdor. Our braves walk the roads so travelers reach us in one piece." },
      },
      choices = {
        { text = "Your braves seem to be guarding against something.", next = "camp_braves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp_braves = {
      lines = {
        { id = "cb_default", text = "Ogres from the north, gnolls from the west, and whatever's hungry in between. Feralas has more teeth than it has trees, and it has a great many trees." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rok = {
      lines = {
        { id = "r_default", text = "Rok Orhan, and she's loud because the ogres are loud, I think. She eats standing up and sleeps with her axe, and she won't take a seat at my fire no matter how often I offer." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mulgore = {
      lines = {
        { id = "m_default", text = "The open grass, yes, and the sky with nothing in it. But the Earth Mother is under this wet ground too, so I put my hand on it in the morning, and she's still there." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Ogres from the west, gnolls in the southern woods, and the old elf ruins at Dire Maul, which the braves won't go near after dark. A spellcaster might find work in any of them, but I'd rather you came back to eat my stew afterward." } },
      choices = {
        { text = "I'll clear the road so your travelers come home.", next = "BACK", reply = "Thank you, little one, and I will keep a bowl warm for you when you come back.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll go where the treasure is. Dire Maul sounds promising.", next = "BACK", reply = "Then go carefully, and come back to tell me what you found, because the braves will want the story.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "Travelers ask strange questions all the time, and it's half of why I like the job. Lately a few goblins have been asking about Dire Maul's old treasures, and I told them the ruins aren't for selling." } },
      choices = {
        { text = "Good. Some places should stay untouched.", next = "BACK", reply = "I think so too, and so do the braves, and I hope the goblins take the hint.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The goblins have the right idea, honestly.", next = "BACK", reply = "Perhaps, but I have heard what lives in those halls, and I do not think it wants to be sold.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Not that I've seen, and the elders say the forest drinks so deeply because it's older than almost anything else in Kalimdor. The braves complain about wet boots, and I tell them to take it up with the water spirits, and then I send them to you." } },
      choices = {
        { text = "The rain feeds the forest, and we should be grateful for it.", next = "BACK", reply = "We should, and I am, though my boots are not as grateful as I am.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The forest could stand to dry out. I'm sick of mud.", next = "BACK", reply = "So are the braves, little one, but the forest is older than all of us, and it likes its mud.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everyone who passes my fire leaves a little news behind. Ask, and I'll share what I've gathered." },
    },
    background = { { id = "tp_ba", text = "I keep the fire at Mojache. Every tauren camp needs one, and this one is mine." } },
    advice = { { id = "tp_ad", text = "Rub your hides with fat before you go into the rain. The braves laugh at it, and then they borrow my pot." } },
    thrall = { { id = "tp_thrall", text = "The Warchief stopped at an inn I worked once, before Mojache, and ate his stew like any grunt. That's the kind of chief worth following." } },
    cairne = { { id = "tp_cairne", text = "My people follow Cairne, and we're quiet and slow to anger, though the braves here eat more than any orc I've ever fed. I like that in a guest." } },
    dire_maul = { { id = "tp_dire_maul", text = "The hunters who go up toward Dire Maul come back with their armor dented and their stories bigger. I feed them either way." } },
    grimtotem = { { id = "tp_grimtotem", text = "The Grimtotem are tauren who've decided they hate everyone, and they sit up in the hills hating us. The Mojache tauren won't speak of them at supper." } },
    booty_bay = { { id = "tp_booty_bay", text = "Goblin traders come up the coast from Booty Bay and sell me spices at three times the price. Then they eat here and complain about my prices." } },
    _none = { { id = "tp_none", text = "I keep the fire, and Rok Orhan keeps the ogres away, so ask her. She'll answer as an orc does, short and to the point." } },
  },
}
