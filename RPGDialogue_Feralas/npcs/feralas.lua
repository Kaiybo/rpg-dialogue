-- Feralas: Feathermoon Stronghold on Sardor Isle (Alliance) and Camp Mojache (Horde). Voice: bibles/feralas.md
local P = RPGDialogueAPI:Pack("rpgd.feralas")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "shandris", id = TODO_NPC("Shandris Feathermoon"), name = "Shandris Feathermoon",
  bible = "bibles/feralas.md", role = "soldier", tier = "major",
  communities = { "feathermoon" }, temper = { "intent" }, values = { "loyal", "dutiful", "brave" },
  notices = { "class", "race" },

  impression = {
    first = "Shandris Feathermoon watches the water around Sardor Isle as though it might betray her at any moment. Her loyalty to the High Priestess runs deeper than duty, and it shows in every word.",
    third = "{name} met Shandris Feathermoon, General of the Sentinels, who holds Feathermoon Stronghold for the High Priestess.",
  },

  greetings = {
    { id = "g_isle", text = "Welcome to Sardor Isle. Keep your bow strung and your eyes on the water; that's all I ask of anyone here." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back across the water, good. Now report." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = { "HUNTER", "WARRIOR" } },
      text = "You carry yourself like someone who's held a line. Feralas will test that, and so will I." },
    { id = "n_kaldorei", cat = "race", when = { race = "NightElf" },
      text = "Sister, or brother, of the kaldorei: the Sentinels can always use another. Think on it." },
  },

  start = "hello",
  nodes = {
    sky_sh = {
      big = true,
      lines = {
        { id = "ssh_default", text = "Then you're a long way from home and very close to it at once. Eldre'Thalas stands in the hills east of here, and the ogres call it Dire Maul now; what lives in its deepest halls I wouldn't wish on any child of the city." },
        { id = "ssh_order", when = { all = { { race = "Skyborne" }, { faction = "Alliance" } } },
          text = "The High Order went to the Kirin Tor, I hear, looking for the magic your forebears carried out. I'll be honest with you, sky-child: my Sentinels will watch you closely until they understand what you came for." },
      },
      choices = {
        { text = "Watch, then. I've nothing to hide.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Everyone has something to hide, General.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "What's in the deepest halls?", next = "sky_sh2" },
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
        { id = "rsh_default", text = "Everyone works where my archers can't see them, eventually; the trick is being useful when you do. The ogres in the Feral Scar keep their chiefs well hidden, and a rogue who learns where would save a great deal of arrows." },
        { id = "rsh_watch", when = { origin = "nightelf_watcher_trained" },
          text = "Watcher-trained, by the look of you. Maiev's people and mine don't always agree, but I've never once known one of you to waste an arrow's worth of effort, so go find me those chiefs." },
      },
      choices = {
        { text = "I'll find the chiefs. And deal with them.", next = "BACK", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "I'll find them and report. Your archers can finish it.", next = "BACK", fx = { align = { honor = 1 } } },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "You call upon the same powers that broke the world and turned our own kin into the satyrs that haunt Eldre'Thalas. I will judge you by your deeds while you are here, but I will not forget what you are, and neither will my Sentinels." } },
      choices = {
        { text = "I master the Legion's power. It doesn't master me.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I understand your caution. I'll earn your trust.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then let us speak of other things.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I distrust what magic does to those who love it too much, and I watched the Highborne love it far too much. The High Priestess has made peace with your people's mages for the sake of the Alliance, and I keep that peace, though I keep my eyes open as I do." } },
      choices = {
        { text = "Magic is a tool. It's the wielder who matters.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Your caution is wise. Magic needs a firm hand.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Watch the Hatecrest where my archers cannot, and tell me what they plan before they plan it. The naga strike from the water without warning, and a quiet blade among them would save Sentinel lives." } },
      choices = {
        { text = "I'll fight for Feathermoon gladly.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll go where the pay is best, General.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The mainland shore, where the naga come up out of the surf at night, and the camps near the Twin Colossals where the ogres gather. My Sentinels strike and withdraw, but there are times I need someone who will plant their feet and not move." } },
      choices = {
        { text = "Then I'll hold, and I won't retreat while your Sentinels need me.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll hold while it serves. I'm no use dead.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let me ask something else, General.", next = "BACK" },
      },
    },
    hello = {
      lines = {
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
          text = "A mage of the Alliance. Our people remember too well what arcane hunger did to this world, so you'll forgive me if I watch your spells as closely as I watch the naga." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You walk like a Sentinel on the hunt, which I'll take as a compliment to whoever trained you. The naga on the coast are sly, and I have use for anyone who can match them." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin of the Silver Hand on Feathermoon. Pratt McGrubben once wore that tabard, and he tells me your order stands its ground, which is the only praise I give." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Hatecrest", min = 30 } }, text = "My Sentinels report fewer Hatecrest on the shore at night, and they tell me it was you who thinned them. Elune favors those who do the work, and so do I." },
      },
      again = { { id = "h_again", text = "Report, or ask; either is useful." }, { id = "h_again2", text = "What else?" } },
      choices = {
        { text = "What troubles Feralas?", next = "troubles" },
        { text = "The stronghold carries your name.", next = "name" },
        { text = "How did you come to serve the High Priestess?", next = "tyrande" },
        { text = "Who keeps the watch when you sleep?", next = "watch" },
        { text = "Test my aim, General.", next = "archery", when = { class = { "HUNTER", "WARRIOR" } } },
        { text = "I'd stand with the Sentinels.", next = "sentinels", when = { race = "NightElf" } },
        { text = "A human paladin sells leather here. Odd company for Sentinels.", next = "pratt", when = { race = { "Human", "Dwarf", "Gnome" } } },
        { text = "Elune and the Light. Are they so different?", next = "priest_elune", when = { class = "PRIEST" } },
        { text = "My people came from Eldre'Thalas, General.", next = "sky_sh", when = { race = "Skyborne" } },
        { text = "The Circle sent me. What does Feathermoon need from a druid?", next = "druid_sh", when = { class = "DRUID" } },
        { text = "I work best where your archers can't see me.", next = "rogue_sh", when = { class = "ROGUE" } },
        { text = "I've done nothing to earn your contempt, General.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do you distrust all who study magic, General?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What would you have a rogue do here, General?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What ground would you have me hold, General?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Elune guide your arrows.", next = "END", fx = { affinity = 1, standing = { feathermoon = 1 } } },
      },
    },
    troubles = {
      big = true,
      lines = {
        { id = "t_default", text = "Hatecrest naga in the ruins of Solarsal, more of them each month. A hive of insects that has no business being in Feralas; I've sent word to Gracina Spiritmight in Darnassus. And ogres, always ogres." },
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
        { text = "She must be proud of you.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "That's a heavy debt to carry.", next = "tyrande_debt" },
      },
    },
    tyrande_debt = {
      lines = { { id = "td_default", text = "It isn't a debt, because debts get paid off. This is a vow, and vows don't end." } },
      choices = {
        { text = "A vow like that deserves respect.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Even vows can be broken when they stop making sense.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "You'd rather be at her side in Darnassus.", tag = "Persuade", next = "tyrande_far",
          check = { pass = { any = { { disposition = { min = 65 } }, { heardLine = "tyrande.h_default" }, { trait = "brave" } } } },
          fail = { next = "tyrande_no", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch = {
      lines = { { id = "w_default", text = "Latronicus Moonspear, my second. He sleeps less than I do and complains about it more. The island has never once been unwatched." } },
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
      lines = { { id = "s_default", text = "Then come back when you're ready to stand a watch and not just a fight. They're different things, and most learn that late." } },
      choices = {
        { text = "I'll be ready.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Standing watch isn't for me, so I'll stick to the fighting.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    pratt = {
      lines = { { id = "p_default", text = "He mends our leather better than any of us can, and he's never once asked to be thanked. On this island, that makes him kaldorei enough." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    priest_elune = {
      lines = { { id = "pe_default", text = "My priestesses would say yes, and argue for a week. I've seen both close the same wound on the same Sentinel. I don't argue with what works." } },
      choices = {
        { text = "Nor do I.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Prayer doesn't close wounds; skill does.", next = "BACK", fx = { align = { light = -1 } } },
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
      { id = "tp_knows", text = "My scouts cover every road and shore in Feralas, and every one of them reports to me. Ask what you need." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } },
        text = "You've earned a straight answer from the Sentinels, so ask me anything. I'll tell you what I'd tell my own second." },
    },
    background = { { id = "tp_ba", text = "The High Priestess raised me and the Sentinels taught me, and Feralas is where I keep the promise I made to both.", next = "tyrande" } },
    advice = { { id = "tp_ad", text = "Keep the water at your back only if you can see what's in it. Here, you can't." } },
    cenarion_circle = { { id = "tp_circle", text = "The druids heal the land, and we keep it whole long enough for them to finish. It's a fair arrangement." } },
    _none = { { id = "tp_none", text = "That's not a matter for the Sentinels. Ask in Darnassus." } },
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
    { id = "g_shop", text = "Well met! Leather, repairs, or a kind word: which can I do for you?" },
  },

  notice = {
    { id = "n_leather", cat = "craft", when = { profession = "Leatherworking" },
      text = "A leatherworker! Then I've a pattern or two you'll want to earn. Bring me proof of good work and we'll see." },
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin, out here! I swung a hammer for the Light longer than I care to count, and now I swing a needle. The Light doesn't seem to mind." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every day out here, friend, or you'll find a buckle gone green and a strap snapped the moment an ogre swings at you. I learned that the hard way in my paladin days, and now I pass it on with the needle, which hurts a good deal less." } },
      choices = {
        { text = "Caring for your kit is a warrior's first duty.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'd sooner buy new than fuss over old straps.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Not the beasts so much as what's been done to them. Some of the cats the Sentinels bring back came out of the Grimtotem's cages half-starved, and a hide like that tears in my hands." } },
      choices = {
        { text = "Take only what you need, and thank the beast for it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A hide is a hide, whatever became of the beast.", next = "BACK", fx = { align = { light = -1 } } },
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
      lines = { { id = "xlock_default", text = "It worries me, which is different, and it worries the Sentinels a great deal more. I've seen what fel does to a soul over time, and I'll patch your leathers just the same, but I'll say a quiet word to the Light for you while I do it." } },
      choices = {
        { text = "Pray all you like. I don't need it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll take any prayers you have to spare.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I patched a few in the war, when SI:7 lads came through our camps needing their kit mended in a hurry. They never said where they'd been, and I never asked, and I got rather good at sewing quiet." } },
      choices = {
        { text = "SI:7 did the dirty work that kept us safe.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Spies and cutthroats, the lot of them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Pratt.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every morning, friend, when the rain stops long enough for the sun to come through the trees. I don't swing a hammer for it anymore, but I stitch for it, after a fashion, because a Sentinel in good leathers comes home more often than one without." } },
      choices = {
        { text = "That's still service. The Light doesn't care what tool you use.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A paladin should fight. Stitching is a retreat, Pratt.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Their ancestors were Highborne once, or fought against them, and the ruins of Eldre'Thalas are right across the water to remind them. Shandris doesn't forget a thing like that, and I can't say I'd want her to." } },
      choices = {
        { text = "I'll show them a mage can be trusted, in time.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Their old grudges are their own. I won't apologize for my craft.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Pratt McGrubben, mostly retired from paladin work and fully employed in leather. I patch whatever the Sentinels bring back torn." },
        { id = "h_quality", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("The Mark of Quality") }, { questActive = TODO_QUEST("Improved Quality") } } },
          text = "Show me the hides, and I'll show you how to make something a Sentinel would be proud to wear. Quality takes patience, and I've got plenty of that now." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid of the Circle! Good, because half the hides the Sentinels bring me were torn by things I'd rather a druid explained to me." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock, is it? I've hung up my hammer, friend, but a man doesn't stop being a paladin all at once, and I'll admit my hand still twitches for it." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Now there's a rogue's coat, and it's had a rough time of it, by the look of those seams. Oil those seams before you go near the naga, because creaky leather gets more of your lot killed than bad luck does." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior! Come here and let me see those straps, because the rain in Feralas rots good leather faster than any Gordunni club ever broke it." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest of the Light! I've not had a proper talk about the Light since I hung up my tabard, and you'll forgive an old man for being glad of it." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage, on Feathermoon! The Sentinels will watch you closely, friend, so don't take it to heart, because they watched me for a full year and I only sell leather." },
      },
      again = { { id = "h_again", text = "Anything else, friend? I'll keep stitching while you think." } },
      choices = {
        { text = "Do the beasts of Feralas trouble a leatherworker, Pratt?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "Why did you retire?", next = "retire" },
        { text = "A human, among the Sentinels?", next = "human" },
        { text = "Teach me something about leather.", next = "leather", when = { profession = "Leatherworking" } },
        { text = "Does the Light answer a leatherworker?", next = "light", when = { class = "PALADIN" } },
        { text = "I skin what I hunt. Any use to you?", next = "hunter_pr", when = { class = "HUNTER" } },
        { text = "Does my craft offend you, Pratt?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "You know a lot about rogues' leathers, Pratt.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Does a warrior's armor really need that much tending, Pratt?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you still feel the Light, Pratt, without your tabard?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why do the Sentinels distrust mages so, Pratt?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Just browsing.", next = "END" },
      },
    },
    retire = {
      lines = { { id = "r_default", text = "Mostly. The Light still answers when I call; I just call less often. Don't let the needle fool you." } },
      choices = {
        { text = "What made you stop?", next = "retire_why" },
        { text = "Ha. Noted.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    retire_why = {
      lines = { { id = "rw_default", text = "Knees, mostly, and a feeling that there were enough young paladins and not enough people who could fix their boots." } },
      choices = { { text = "Something else.", next = "BACK" } },
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
        { text = "Then I'll try to do right with mine.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "I've no use for the Light, morning or night.", next = "BACK", fx = { align = { light = -1 } } },
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
    { id = "g_inn", text = "Come in from the rain. Feralas is always wet; at least here it's warm and wet." },
    { id = "g_home", when = { homeInn = { "Feathermoon Stronghold" } }, text = "You've returned to the island. Your bed is ready, and the tea is fresh." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You've come back from somewhere grey and far away. Sit; the Sentinels can spare you for an evening." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More than I'd like, and the Gordunni do most of it, though the naga on the coast take their share. The Sentinels bring them in at every hour, and I keep the kettle hot, because a warm cup steadies a hand that's held a shield all night." } },
      choices = {
        { text = "Rest is part of the fight. Your kindness keeps us standing.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A soldier shouldn't need comfort. Hardship makes us stronger.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Every night, and they lie by the fire in a great warm heap while their riders sleep upstairs. I think the cats guard the stronghold as well as the Sentinels do, though I'd never say so where the General could hear." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is welcome to join them by the fire, if it doesn't mind sharing, and I suspect it's had a wetter day than you have." },
      },
      choices = {
        { text = "A loyal beast has earned its place by the fire.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Beasts belong outside. A stronghold isn't a kennel.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Restful enough, until the naga come up out of the water at night. The Sentinels say the old ruins along the coast draw them, and nothing we do keeps them away for long." } },
      choices = {
        { text = "The Sentinels should drive them back into the sea.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Better to watch the isle than waste lives on ruins.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Of course, for the kettle at least. My sisters are wary of your kind, and they have their reasons, but I've never met a mage who couldn't be trusted with a cup of tea, and the Sentinels drink a great deal of it." } },
      choices = {
        { text = "Kindness should come first, whatever someone's craft.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Your sisters are right to be wary.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "No harm done, though some of the Sentinels jump at shadows after their watch, and I'd hate for you to catch an arrow in my inn. They've seen naga come out of the water without a sound, and they don't take kindly to surprises." } },
      choices = {
        { text = "I'll announce myself. Your guests deserve their rest.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Being unheard keeps me alive. I won't change.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The coral blades, some say, or the salt, or something darker that the Hatecrest sorceresses lay on them. Our priestesses of Elune tend them well, but there are only so many hands on this island, and the rain makes every fever worse." } },
      choices = {
        { text = "Your priestesses should lead. I'll follow their ways here.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Wounds don't care whose prayer closes them. I'll do it my way.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Some do and some don't, and the ones who don't remember the Third War too well. Your people and mine bled together at Hyjal, though, and most here will meet you halfway if you fight beside them on the coast." } },
      choices = {
        { text = "I'll follow Shandris's orders while I'm on her island.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I answer to the Light, not to Sentinel captains.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Not one of them, and I don't blame them. Some of them are old enough to remember the satyrs being made, and they've spent ten thousand years killing what came of it, so a demon in the common room asks more of them than you know." } },
      choices = {
        { text = "Then my demon stays on the dock. They deserve their rest.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Ten thousand years is long enough to learn tolerance.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Innkeeper Shyria. The Sentinels sleep in shifts, and every shift passes through my door. You're welcome among them." },
        { id = "h_jonespyre", when = { questActive = TODO_QUEST("Jonespyre's Request") },
          text = "Quantas Jonespyre has a request, so go and hear him out; he'll explain." },
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
      },
      again = { { id = "h_again", text = "Anything else? The kettle's on." } },
      choices = {
        { text = "Is the isle a restful place, Shyria?", next = "druid_q", when = { class = "DRUID" } },
        { text = "I'd like a room.", next = "BUSINESS" },
        { text = "What do the Sentinels talk about here?", next = "talk" },
        { text = "Is the rain ever going to stop?", next = "rain" },
        { text = "You'd let a mage near your hearth?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Sorry. Old habits, Shyria.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What makes the naga wounds so slow to heal?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do the Sentinels welcome help from outsiders?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do many warriors come back from the mainland hurt?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do the Sentinels really bring their cats inside, Shyria?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Will the Sentinels truly not sleep with a demon near, Shyria?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Thank you.", next = "END" },
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
    _none = { { id = "tp_none", text = "I keep the inn, and the General keeps the rest." } },
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
    { id = "g_camp", text = "You want to help the Horde in Feralas? Good, then kill ogres; that's how." },
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
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "If it hits hard, it helps. The Gordunni are many and foul, and I don't care whose god you swing for as long as you swing at them. Someday this land will heal, but not while the ogres hold the north." } },
      choices = {
        { text = "The Light will help this land heal once the ogres fall.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The Light breaks skulls. That's all I need from it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "In the caves and the old ruins to the north, where their shamans work foul magic with orbs and scrolls. Find their tracks, follow them to the shamans, and I will send the warriors in after you." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And let {pet} take the first bite, because the ogres fear a beast's teeth more than an orc's axe, and I want them afraid." },
      },
      choices = {
        { text = "I'll find them, but the kill should be face to face.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "An ambush kills just as dead. I'll strike from cover.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Not much, I'll be honest, but a forest full of angry beasts is harder to march through. Break enough Gordunni and the woods will quiet down, and then you can tend them however you like." } },
      choices = {
        { text = "Then break them. The forest needs them gone.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The woods need healing, not only more killing.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shaman_ro = {
      lines = {
        { id = "sro_default", text = "Wrongly, rightly, all I know is that the elements answer them and the braves burn. You're the first shaman who's come out to Mojache in a moon; if you can turn their fire back on them, I'll owe you a drink." },
        { id = "sro_thrall", when = { origin = "orc_thrall_shaman" },
          text = "Thrall taught you himself? Then you know what it looks like when the elements are forced instead of asked. That's every Gordunni mage you'll meet." },
      },
      choices = {
        { text = "The elements will be freed from them.", next = "BACK", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "I'll burn them with their own fire.", next = "BACK", fx = { align = { light = -1 }, trait = { brave = 1 } } },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "The ogres have always had their warlocks and shamans, and their spells killed more of my warriors than their clubs did. If you mean to turn your power against them, I'll be glad of it, but I'll be watching where else you turn it." } },
      choices = {
        { text = "I'll burn the Gordunni for the Horde.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll use my power as I see fit, orc.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Enough of that. Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I would have you strike them however breaks them fastest. The Gordunni don't fight with honor, so I won't ask you to, but I'd want the job done cleanly and the camp told who did it." } },
      choices = {
        { text = "A sleeping ogre is still an enemy.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Even ogres deserve a fair fight.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Badly enough. The Gordunni mages throw fire, and the brutes follow it in with clubs as big as a kodo's leg, and we've buried four this season. Belgrom sent me here to win, not to count graves, so I need healers who'll stand at the front line, not hide behind it." } },
      choices = {
        { text = "I'll stand at the front with them. That's where healing matters.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A dead healer helps no one. I'll stay back where it's safe.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Rok Orhan. Belgrom Rockmaul sent me to break the Gordunni ogres of Feralas, and they're many, and foul, and nearly broken." },
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
      },
      again = {
        { id = "h_again", text = "What else? Ogres don't wait for talk." },
        { id = "h_again2", text = "Ask it, then go hit something." },
      },
      choices = {
        { text = "Do you care what the ogres do to the forest?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Who are the Gordunni?", next = "gordunni" },
        { text = "Why did Belgrom send you?", next = "belgrom" },
        { text = "What's this dark ceremony?", next = "ceremony" },
        { text = "An orc in a tauren camp?", next = "camp" },
        { text = "Warrior to warrior: how do you fight an ogre?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "This is my people's camp.", next = "tauren", when = { race = "Tauren" } },
        { text = "I could read that orb for you.", next = "mage", when = { class = { "MAGE", "WARLOCK" } } },
        { text = "My people once lived in these hills.", next = "skyborne", when = { race = "Skyborne" } },
        { text = "The ogres' shamans call on the elements wrongly.", next = "shaman_ro", when = { class = "SHAMAN" } },
        { text = "The Gordunni use dark magic too?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "You'd have me strike the ogres in their sleep?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Where do the Gordunni hide, Rok Orhan?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "How badly are the Gordunni hurting your braves, Rok Orhan?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Would the Light help you break the Gordunni, Rok Orhan?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
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
        { text = "Can it heal?", next = "gordunni_heal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gordunni_heal = {
      lines = {
        { id = "gh_default", text = "In time, if we push them back and keep them back. I'm a warrior, not a druid, but I know that a wound closes once you stop opening it." },
      },
      choices = {
        { text = "Then I'll help keep that wound closed.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Better to burn the Gordunni out than wait for anything to heal.", next = "BACK", fx = { align = { light = -1 } } },
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
        { id = "br_default", text = "When the Gordunni do. Until then I sleep with my axe and eat standing up, and Greul scolds me for both." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    ceremony = {
      lines = {
        { id = "c_default", text = "Somebody found a filthy scroll at their outpost, plans for a meeting or a rite of some kind, run by their mage-lords. Whatever they're calling up, I want it stopped before it comes." },
      },
      choices = {
        { text = "And the orbs they carry?", next = "ceremony_orb" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ceremony_orb = {
      lines = {
        { id = "co_default", text = "A mage-lord's orb holds a great deal of power, and I know my enemy well, but I can't tell you what it does. There's a mage in Orgrimmar, Uthel'nay, in the Darkbriar Lodge, who can." },
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
      choices = { { text = "Something else.", next = "BACK" } },
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
        { id = "m_default", text = "Maybe you could, but it's dangerous, and I'd rather a master looked at it far from my camp. Bring the orbs to me and let Uthel'nay take the risk; that's what Orgrimmar feeds him for." },
      },
      choices = { { text = "Fair enough.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } } },
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
    grimtotem = { { id = "tp_grimtotem", text = "Tauren trouble. The tauren here watch for them, and I watch for ogres." } },
    background = { { id = "tp_ba", text = "A warrior of the Horde, sent from Orgrimmar to break ogres. There's no more to it, and I like it that way.", next = "belgrom" } },
    advice = { { id = "tp_ad", text = "Never fight a Gordunni on a slope where it's above you. Ogres fall downhill, and they don't care who's underneath." } },
    _none = { { id = "tp_none", text = "I don't know, but if it's an ogre, I'll learn." } },
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
    { id = "g_ore", text = "You look like someone who can carry rocks: valuable rocks, mysterious rocks!" },
  },

  notice = {
    { id = "n_miner", cat = "craft", when = { profession = { "Mining", "Engineering" } },
      text = "A miner! Have you ever seen Gordunni cobalt? Nobody has, well, except the ogres, and that's the problem." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Everybody is, friend, but you're worth more than most, because nobody understands you yet. The ogres guard an ore nobody understands either, and I'd like to study both of you, though I'll settle for selling the ore." } },
      choices = {
        { text = "Study the ore honestly, Orwin, and share what you learn.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Sell it first, Orwin, and study it after.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Nobody knows, which is exactly what makes it special, and exactly why I want to be the first to sell it. The Gordunni dig it out with their big hands and do something odd with it, and I'd dearly love a sample a warrior pried out of their grip." } },
      choices = {
        { text = "I'll fight the ogres for the Horde, not for your profit.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If there's coin in it, I'll break the ogres for you.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because I'm a goblin, and goblins who follow ogre trails end up as ogre suppers, which is bad for business and worse for the goblin. You hunters can step around a sleeping ogre without waking it, and that's a talent I'd happily rent." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And {pet} looks like it could sniff out cobalt in an ogre camp, if cobalt smells of anything, which I'm going to assume it does, because I want it to." },
      },
      choices = {
        { text = "I hunt for Camp Mojache first. Your ore comes second.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll go wherever the coin's best, Horde or not.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue_or = {
      lines = {
        { id = "ror_default", text = "Now you're talking my language! Quiet is good, quiet means nobody else hears about the cobalt before I've set a price on it. Bring me enough and I won't ask whose cart it fell off." },
      },
      choices = {
        { text = "I'll steal it. Ogres don't need it.", next = "BACK", fx = { align = { honor = -1 }, affinity = 2 } },
        { text = "I'll fight for it openly, goblin.", next = "BACK", fx = { align = { honor = 1 } } },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because the ogres don't guard anything unless it hums, and this hums! Orgrimmar wants to know if it's useful, and I want to know if it's sellable, and you might be the one who can tell us both." } },
      choices = {
        { text = "Some things shouldn't be sold, Orwin.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Sell it. Let the buyers worry about the risk.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Steal is a strong word for taking something from an ogre who'd crack your skull for looking at it. I'd call it fair collection on behalf of the Horde, with a little left over for a goblin's curiosity." } },
      choices = {
        { text = "I'll do it for the Horde, not your purse.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll do it for whoever pays the most.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Never mind the cobalt.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "If it does, it hasn't said so, and I've been listening very carefully. The ogres tear whole hillsides open for that cobalt, though, and leave the rest to wash into the streams, and even I can see that's no way to treat a place." } },
      choices = {
        { text = "Then take only what you need, and leave the hills whole.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The ogres started it. Take everything you can carry.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Orwin Gizzmick, here on Orgrimmar's business and a bit of my own. The ogres guard an ore up north nobody understands, and I'd like to understand it. Then sell it." },
        { id = "h_cobalt", tags = { "news" }, when = { questActive = TODO_QUEST("Gordunni Cobalt") },
          text = "Gordunni cobalt, from their compound. They guard it jealously, which is how you know it's worth something." },
        { id = "h_cobalt_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Gordunni Cobalt"), days = 3 } },
          text = "Twelve samples, all glowing, all mine! Somewhere out there is a buyer who'll pay a pretty penny for these, and I mean to find them before the glow wears off." },
        { id = "h_rocks", when = { metBefore = true }, text = "I've got a sack of rocks under my bed that might be worth a fortune, or might be rocks. Science is mostly waiting to find out." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Do the earth spirits know anything about the ore the ogres guard up north? Because the rocks under my bed won't tell me." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, and here I thought this camp was all braves and drums. Do your gods care about ore, I wonder? I've a sample that could use a blessing, or at least an explanation." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock. Well, I won't ask where your power comes from if you don't ask where my samples come from, and I think that's a fair trade." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage! Tell me what you feel off this lump of cobalt, would you? The Gordunni guard it like it's worth more than gold, and I'd like to know why before I price it." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "A rogue! You know, the Gordunni keep their best cobalt in the deepest parts of their camps, and I'd pay very well for a sample that didn't come with an ogre attached." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior! Perfect, the ogres up north are sitting on a cave full of ore, and somebody's going to have to ask them politely, by which I mean with an axe." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter! You'll have seen the ogre trails through the woods, then, and I'd bet you could follow them straight to my ore." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid! Now, I know what you're going to say about digging, so let me get in first: the ogres dug it up before me, and I'm only taking it off their hands." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin! Oh, now there's a curiosity, and you know how I feel about curiosities, which is that they're worth something to somebody." },
      },
      again = {
        { id = "h_again", text = "More questions? Ask fast, my friend; time is money, and so is cobalt." },
      },
      choices = {
        { text = "What is Gordunni cobalt?", next = "cobalt" },
        { text = "Who are you going to sell it to?", next = "sell" },
        { text = "Why come all the way to Feralas?", next = "why" },
        { text = "I mine. What should I know about it?", next = "miner", when = { profession = "Mining" } },
        { text = "This is tauren land, goblin.", next = "tauren", when = { race = "Tauren" } },
        { text = "I could lift some cobalt off the ogres quietly.", next = "rogue_or", when = { class = "ROGUE" } },
        { text = "Should we really be digging up the ogres' ore, Orwin?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What's so special about the ogres' ore?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
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
        { id = "c_default", text = "Some kind of mineral the Gordunni dig up near their outpost, and it glows blue, which is never nothing. The trouble is they don't leave it lying around; they bury it again." },
      },
      choices = {
        { text = "Why would ogres bury it?", next = "cobalt_bury" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cobalt_bury = {
      lines = {
        { id = "cb_default", text = "To keep it away from folks like me, obviously, which only proves it's valuable. I'll lend you my shovel; look for the blue glow at the outpost north of here and start digging." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    sell = {
      lines = {
        { id = "s_default", text = "Whoever pays, my friend, whoever pays! I'll take it along on my travels, and somewhere between here and the sea there's always someone with more gold than sense." },
      },
      choices = {
        { text = "And if it's worthless?", next = "sell_worthless" },
        { text = "Something else.", next = "BACK" },
      },
    },
    sell_worthless = {
      lines = {
        { id = "sw_default", text = "Then it's worthless blue rocks that glow, which is still a very good story to sell with them. A goblin never carries anything he can't sell one way or another." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },

    why = {
      lines = {
        { id = "w_default", text = "I just got here, and I heard the ogres have interesting minerals in their hills, so here I am. Feralas is wet, and loud, and everything wants to bite me, but nobody else is digging, and that's my favorite kind of market." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    miner = {
      lines = {
        { id = "mi_default", text = "That a rock that glows and a rock that's buried are two different kinds of valuable, and one that does both is a treasure. Bring me cobalt, and keep a piece for yourself; I won't count too carefully." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    tauren = {
      lines = {
        { id = "t_default", text = "And very fine land it is, with very generous hosts, and I'm only digging in the ogres' corner of it! Nobody here's going to miss a few rocks from the Gordunni." },
      },
      choices = { { text = "See that nobody does.", next = "BACK", fx = { trait = { stern = 1 } } } },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "That's exactly what I'm trying to find out, and the ogres aren't telling. It's heavy and it's blue, and I've a hunch it would take an enchantment better than iron, so somebody in Orgrimmar is going to want a great deal of it." } },
      choices = {
        { text = "Sell it first. The study can wait.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Study it properly before you sell a single stone.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Digging, studying and then selling, in that order, and the ogres haven't the faintest idea what they're guarding. If the earth spirits object, they're welcome to tell me themselves, and I'll gladly take notes." } },
      choices = {
        { text = "Ask the earth's leave first, Orwin. It's only courteous.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If the ogres can't use it, somebody should profit.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I keep my ears open for anything that might be worth money, which is nearly everything. Ask!" },
    },
    background = { { id = "tp_ba", text = "A goblin with a shovel, a sack and a nose for things that glow. That's the whole of the story, and the rest is profit." } },
    advice = { { id = "tp_ad", text = "Always dig where somebody else has been guarding. Nobody guards dirt." } },
    _none = { { id = "tp_none", text = "If it's not a rock, it's not my business." } },
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
    { id = "g_inn", text = "Come in, come in! Feralas is wide and wet and full of teeth, but in here, it's just warm." },
    { id = "g_home", when = { homeInn = { "Camp Mojache" } }, text = "Welcome home to Mojache. The hides are dry and the kettle's on." },
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
        { text = "The Light is a warmth to share, Greul.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I don't need their understanding, only their room by the fire.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Many, and some who come back carrying others, and I feed them all the same. The Gordunni hit hard, and the braves of Mojache hit harder, but even the toughest of them goes quiet when the stew is hot." } },
      choices = {
        { text = "There's no shame in grieving after a battle.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A warrior should keep his grief to himself.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Stories, mostly, of yetis in the caves and great bears in the hills, and meat when the hunt is good. They sit here and argue over whose beast is bravest until the fire burns low, and I let them, because it's better than hearing about the ogres." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} is the bravest I've seen tonight, I think, and you may tell the others I said so, because they'll argue with me and I enjoy it." },
      },
      choices = {
        { text = "A hunt is only worth telling if it's told true.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A good story's worth a little stretching.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "The Twin Colossals, mostly, and the giants who walk the shore beneath them. Some of the old braves say the giants are older than the ogres and only angry because something woke them." } },
      choices = {
        { text = "Then the giants should be left in peace.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Old or not, they're a danger to the camp.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Then you'd have more friends in this camp than any warchief, little one! Still, I think the Earth Mother means for us to get wet now and then, and a warm fire and a bowl of stew are their own kind of magic." } },
      choices = {
        { text = "The Earth Mother gives us the rain for a reason.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "No one should suffer rain that magic can stop.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Then you'll forgive me for keeping a bucket of water nearby while you're here, won't you? I'll feed anyone of the Horde who comes to Mojache, but I'd like my roof to stay where it is." } },
      choices = {
        { text = "I'll keep my imp in line. You have my word.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A little chaos is in an imp's nature.", next = "BACK", fx = { align = { order = -1 } } },
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
      },
      again = { { id = "h_again", text = "Something more? Sit a while longer; the rain isn't going anywhere." } },
      choices = {
        { text = "What do the braves whisper about, Greul?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Tell me about Mojache.", next = "camp" },
        { text = "Who's the loud orc by the gate?", next = "rok" },
        { text = "Do you miss Mulgore?", next = "mulgore", when = { race = "Tauren" } },
        { text = "Does the rain in Feralas ever stop, Greul?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What dangers do travelers bring you word of?", next = "xhcast", when = { class = "PRIEST", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Who's been asking strange questions at your fire?", next = "xhrogue", when = { class = "ROGUE", race = { "Orc", "Troll", "Scourge" } } },
        { text = "Magic could keep the rain away, Greul.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Imps can be hard to control, Greul.", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do you see many warriors come back from the ogre lands, Greul?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What do the hunters of Mojache bring to your fire, Greul?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do the braves mind a Forsaken paladin, Greul?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Just a rest, thank you.", next = "END" },
      },
    },
    camp = {
      lines = {
        { id = "c_default", text = "We sit above Wildwind Lake, where the stream runs through the middle of camp, and our hides are the thickest you'll find in Kalimdor. Our braves walk the roads so travelers reach us in one piece." },
      },
      choices = {
        { text = "Who do the braves guard against?", next = "camp_braves" },
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
        { text = "I'll clear the road so your travelers come home.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll go where the treasure is. Dire Maul sounds promising.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhrogue = {
      big = true,
      lines = { { id = "xhrogue_default", text = "Travelers ask strange questions all the time, and it's half of why I like the job. Lately a few goblins have been asking about Dire Maul's old treasures, and I told them the ruins aren't for selling." } },
      choices = {
        { text = "Good. Some places should stay untouched.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The goblins have the right idea, honestly.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Not that I've seen, and the elders say the forest drinks so deeply because it's older than almost anything else in Kalimdor. The braves complain about wet boots, and I tell them to take it up with the water spirits, and then I send them to you." } },
      choices = {
        { text = "The rain feeds the forest, and we should be grateful for it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The forest could stand to dry out. I'm sick of mud.", next = "BACK", fx = { align = { light = -1 } } },
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
    _none = { { id = "tp_none", text = "I keep the fire, and Rok Orhan keeps the ogres away, so ask her." } },
  },
}
