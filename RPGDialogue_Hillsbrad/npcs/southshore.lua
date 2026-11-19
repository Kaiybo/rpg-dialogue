-- Southshore (Alliance). Voice: bibles/hillsbrad.md
local P = RPGDialogueAPI:Pack("rpgd.hillsbrad")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "redpath", id = TODO_NPC("Marshal Redpath"), name = "Marshal Redpath",
  rivals = { "maleb" },
  bible = "bibles/hillsbrad.md", role = "soldier", tier = "major",
  communities = { "southshore" }, temper = { "steady" }, values = { "dutiful", "protective" },
  likesTone = "blunt",
  notices = { "soldier", "kit", "lock_shadow", "lock_steed" },

  impression = {
    first = "He's small-town stubborn and proud of it.",
    third = "{name} met Marshal Redpath, who has watched over Southshore since the first refugee boats came from Stormwind.",
  },

  greetings = {
    { id = "g_hall", text = "Southshore. We're small, we're stubborn, and we're still here. State your business." },
    { id = "g_back", when = { metBefore = true }, text = "Good, you're back. Southshore's short of hands that stay." },
    { id = "g_away", when = { away = { min = 14, max = 59 } }, text = "Back after {away} away, are you? The Forsaken didn't take the holiday you did, so I hope you're rested." },
    { id = "g_away_long", when = { away = 60 }, text = "I'd nearly written you off after {away} away, and I'm glad I didn't. Southshore's short of hands that come back, so welcome home." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've come a long way since we last spoke, and it shows in how you carry yourself. Southshore could use that up the Mill road." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Word in town is you told someone a story that didn't hold water. Southshore's small, and a lie walks round it faster than you do." },
    { id = "g_word_helped", when = { word = "helped" }, text = "I hear you've done a good turn for Southshore while I wasn't looking. That's the sort of thing a marshal remembers." },
  },

  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You've the bearing of a soldier. Stormwind-trained, maybe, though it doesn't matter; I'll take you either way." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Those ogres up the hill did that, I'll wager. Get it mended at Aebischer's, then go back and return the favour." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "Every dog on the green set up a howl the moment you crossed the bridge, and they don't do that for soldiers. I'll take your word that you're here to help, but you'll understand if I double the watch tonight." },
    { id = "n_lock_steed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 5784, 23161 } },
      text = "I saw the scorch marks your horse left on the north road, and so did half the town. Stable that creature outside the palisade, please, because the last time fire came down that road it was riding with the Horde." },
  },

  start = "hello",
  nodes = {
    dd_assassins = {
      lines = { { id = "dd_assassins_default", text = "Because my men are fishermen's sons in borrowed mail, and the Syndicate are Alterac nobles who've been knifing each other for three generations. They see a Southshore patrol coming from a mile off, but they didn't see you." } },
      choices = {
        { text = "Then train your men harder. Southshore deserves real soldiers.", next = "BACK", reply = "It does, and I'll tell Stormwind so again in my next letter, for all the good it does. Thank you for saying it plainly.", fx = { align = { order = 1 } } },
        { text = "Fight knives with knives, Marshal. Hire someone like me.", next = "BACK", reply = "That's not how I like to keep a town, but I'll admit it worked. Keep your knives pointed at Alterac, and we'll get along.", fx = { align = { order = -1 } } },
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },

    opn_hand = {
      lines = {
        { id = "opn_hand_q", text = "Raised by whom? The best of them died with Uther, the angriest went off to the Crusade, and the rest drink quietly in Innkeeper Anderson's taproom and don't wear the tabard. I hear talk of it, though, every time a paladin rides through. What do you think?" },
      },
      choices = {
        { text = "Yes. Lordaeron needs the Hand more than ever.", next = "opn_hand_r_restore", fx = { affinity = 1, align = { order = 1 }, opinion = { silver_hand = "restore" } } },
        { text = "Let it rest. Orders like that turn into crusades.", next = "opn_hand_r_let_rest", fx = { align = { order = -1 }, trait = { skeptical = 1 }, opinion = { silver_hand = "let_rest" } } },
        { text = "The Argent Dawn does the Hand's work now, without the pride.", next = "opn_hand_r_replaced", fx = { opinion = { silver_hand = "replaced", argent_dawn = "trust" } } },
        { text = "I carry its oaths still, Marshal. The Hand isn't gone.", next = "opn_hand_r_keep", when = { class = "PALADIN" }, fx = { affinity = 2, trait = { pious = 1 }, opinion = { silver_hand = "keep" } } },
        { text = "I don't know enough of it to say.", next = "BACK" },
      },
    },
    opn_hand_r = {
      lines = {
        { id = "opn_hand_r_default", text = "Then ask the old knights in the taproom. They'll tell you more than you want and less than they know." },
      },
      choices = {
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    opn_hand_r_restore = {
      lines = {
        { id = "opn_hand_r_restore", text = "More than ever, yes, and fewer to do it than ever. If you find a man fit to lead it, send him to Southshore first; we'll feed him." },
      },
      choices = {
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    opn_hand_r_let_rest = {
      lines = {
        { id = "opn_hand_r_rest", text = "That's the view of Raleigh the Devout, up at the inn, more or less, and he'd know better than either of us. I'd still rather have the Hand than the Crusade, given the choice." },
      },
      choices = {
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    opn_hand_r_replaced = {
      lines = {
        { id = "opn_hand_r_replaced", text = "The Argent Dawn, you mean. I've heard of them, out at the Plaguelands' edge. If they're half what the Hand was, I'll take them, and gladly." },
      },
      choices = {
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    opn_hand_r_keep = {
      lines = {
        { id = "opn_hand_r_keep", text = "Then it isn't, not while there's someone saying so out loud. The old knights in the taproom will want to buy you a drink; let them." },
      },
      choices = {
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    xpt_company = {
      big = true,
      lines = { { id = "xpt_company_default", text = "I'd send the lot of you at the Mill tomorrow if Magistrate Maleb would sign for it, but he counts coin before he counts graves. Still, a company that holds together does more good on the Hillsbrad road than any order I could write, and the farmers notice." } },
      choices = {
        { text = "Then we'll go to Tarren Mill, whether the Magistrate signs or not.", next = "BACK", reply = "I didn't hear that, and I'll go on not hearing it until you're back. If you come home with the Mill's banner, Maleb can argue with you himself.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "We'll wait for proper orders. A town needs its law.", next = "BACK", reply = "Spoken like someone who's seen what happens to towns without it. Patience, then, though I'm running short of it.", fx = { align = { order = 1 } } },
        { text = "Why won't the Magistrate sign for it?", next = "xpt_company2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpt_company2 = {
      lines = { { id = "xpt_company2_default", text = "Because a battle costs money, and Maleb has never once had to bury anyone, so the Forsaken are a line in his ledger to him. I don't hold it against him as much as I should, though I'd like to see him walk the Mill road just once." } },
      choices = {
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xcl_sm = {
      big = true,
      lines = { { id = "xcl_sm_default", text = "When the plague came, the Crusade marched through Hillsbrad promising to burn the dead out of Lordaeron, and some of our own lads went north with them. A few came home and couldn't say what they'd seen, and the rest never came home at all, so I'll thank you for whatever justice you carried in there." } },
      choices = {
        { text = "They'll answer to the Alliance's law, as every army should.", next = "BACK", reply = "They will, if the Alliance ever remembers it has law up here. Until then, I keep my own lads home and my gate shut.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Law never stopped an inquisitor's torch, but a sword did.", next = "BACK", reply = "True enough, and I've no quarrel with the sword. I only want it in hands that know who they're cutting.", fx = { align = { order = -1 } } },
        { text = "Did any of those lads ever say why they left?", next = "xcl_sm2" },
      },
    },
    xcl_sm2 = {
      lines = { { id = "xcl_sm2_default", text = "One did, a cooper's son from the east end, though he only said it the once, in his cups. He said the inquisitors never asked whether a man was sick, only whether he'd confess, and after the third village he couldn't tell the two apart any more." } },
      choices = {
        { text = "I'm glad he got out. Not everyone did.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Worry's a strong word, but I'll own the first thing I thought of was the orcs that burned these hills in the Second War, for their shamans came first. Then I remembered you're standing in my town and not burning it, so I'll judge you by that, same as I judged the refugees." } },
      choices = {
        { text = "Then I'll keep your laws while I'm in Southshore, Marshal.", next = "BACK", reply = "That's all I ask, and you'll find Southshore's quick to forget an old grudge when a stranger's kind. Most of it, anyway.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I answer to the elements, Marshal, not to a town's laws.", next = "BACK", reply = "The elements don't patrol my streets, friend, and I do. Keep the peace here and we'll not need to argue about it.", fx = { align = { order = -1 } } },
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "The Forsaken poison what they can't hold and the Syndicate burn what they can't steal, and between them the farms up the valley are going back to thorn. I'd sooner have thorns than Forsaken, but I'd sooner have farms than either." } },
      choices = {
        { text = "Then the farms must be reclaimed and held.", next = "BACK", reply = "Reclaimed by whom, though? I've fishermen and farmers' sons, and they can't hold a field against plague.", fx = { align = { order = 1 } } },
        { text = "Let the thorns have them. The land needs rest.", next = "BACK", reply = "Rest, while the Forsaken poison it and the Syndicate burn it? That's a fine thought, but the farmers still need to eat.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Bad enough that farmers lock their doors in daylight and the Magistrate has a stack of reports taller than he is. They're Alterac's old nobility playing at bandits, and they think the hills still belong to them, so every Southshore farm looks to them like a stolen field." } },
      choices = {
        { text = "I'll root them out of the hills for good.", next = "BACK", reply = "Do that, and every farmer in the valley will buy you a drink. I'll buy two.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Hard to blame them. Alterac was theirs once.", next = "BACK", reply = "They sold it to the orcs, friend, and then they wept when they lost it. I've little sympathy, and less patience.", fx = { align = { order = -1 } } },
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I'd like to think so, but the Kirin Tor keep to their half-built city while the Syndicate takes the hills around it. Emissary Jacques of the Kirin Tor is down here asking for aid, and I keep wondering why a city full of archmages needs a fishing town's help." } },
      choices = {
        { text = "Dalaran stood against the Scourge. It deserves the Alliance's aid.", next = "BACK", reply = "I'd give it gladly if I had any to give. Tell Jacques I've a spare spear and nothing else.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the Kirin Tor look after themselves for once.", next = "BACK", reply = "They've been looking after themselves for years, behind a dome. I'd settle for them looking after the hills a little.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "If the ogres come down from Alterac or the Forsaken push past the farms, I'll take any blade that points the right way, and I won't ask what it was forged in. But the mothers in this town remember the orcs and their demons, so do your work outside the walls and don't make me answer for you." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "If the ogres come down from Alterac I'll take any blade that points the right way, but I'd rather that blade didn't stand in my square reeking of brimstone. The mothers in this town remember the orcs and their demons, so walk yours back outside the walls before one of them sees it and I have to answer for you." },
      },
      choices = {
        { text = "Fair terms, Marshal. I'll keep my craft beyond the walls.", next = "BACK", reply = "Good. The townsfolk sleep easier if they don't see what's helping them.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll use my craft where it's needed, walls or no walls.", next = "BACK", reply = "Then do it far from my horses and my children, and we'll stay friends.", fx = { align = { order = -1 } } },
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_company", tags = { "news" }, when = { party = { size = 4 }, faction = "Alliance" },
          text = "Five of you, armed and fed and walking in step, and you've no idea how good that looks from my wall. If you're heading up toward Tarren Mill, I'd ask you to come back the same number you left with." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf who calls on the storm, the guards tell me. Dun Garok's lot pray to their stone and their forefathers, {class}, and I never heard of one talking to the wind before today." },
        { id = "h_rivalfav", when = { rivalFavor = { min = 2 } },
          text = "Magistrate Maleb says you've been a great help with his papers. Good, somebody has to read them, while the rest of us stand on the road where the Syndicate actually is." },
        { id = "h_rivalfoe", when = { rivalFavor = { max = -2 } },
          text = "Maleb says you weren't much use to him, which is about the best reference a soldier can get in Southshore. What do you need?" },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID" },
          text = "A night elf druid in Southshore. Your folk pass through now and then on the road to Ironforge, but few of them stop, and fewer ask about the hills, which is a shame, because the hills need asking about." },
        { id = "h_default", key = true,
          text = "Marshal Redpath. I was headman here when the first boats came from Stormwind, full of people with nothing left. Now I'm marshal, and the town's full of their children." },
        { id = "h_crushridge", tags = { "news" }, when = { questActive = TODO_QUEST("Crushridge Bounty") },
          text = "The Crushridge ogres come down out of Alterac and take whatever's loose, people included. Thin them out, and the hills will breathe easier." },
        { id = "h_farren", when = { heardLine = "farren.h_default" },
          text = "Lieutenant Farren told you how much he hates it here? He tells everyone. I gave him the murlocs, and he gave them to you, I suppose." },
        { id = "h_warmongers", tags = { "news" }, when = { questActive = TODO_QUEST("Crushridge Warmongers") },
          text = "The Warmongers are the ones who lead the raids. Cut down enough of them and the rest will remember where Alliance land starts." },
        { id = "h_refugee", when = { origin = "human_lordaeron_refugee" },
          text = "Another one out of the north, then. Southshore was taking in people with nothing long before you got here, and you're welcome." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Night's when the horses go missing, so I keep a lantern lit by the stables, not that the dead need the light." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You've the look of someone who knows the Syndicate's tricks from the inside, and that's worth more to me on my side of the river than on theirs, so welcome to Southshore." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Emissary Jacques will want a word with you, because the Kirin Tor seem to need every friend they can find these days." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock in Southshore. I'll not turn you away, because I've turned away too many already, but the folk here lost their homes to things very like your little friend, so keep it on a short leash." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Syndicate", min = 30 } }, text = "The patrols tell me the Syndicate's camps in the hills have gone quiet, and that the trampled ashes are full of boot prints about your size. Southshore owes you for that, and I won't forget it." },
        { id = "h_cl_sm", tags = { "news" }, when = { cleared = "Scarlet Monastery", faction = "Alliance" },
          text = "Word's come down the north road that someone went into the Scarlet Monastery and walked back out again, and Raleigh the Devout up at the inn hasn't stopped pacing since. If that was you, I'd like a word before the rumours get here first." },
        { id = "h_dd_assassins", tags = { "news" }, when = { questDone = TODO_QUEST("Syndicate Assassins") },
          text = "Magistrate Maleb tells me you broke up the Syndicate's assassins in the hills. I've had men on that road for a year and never got close, so you'll understand if I'm both grateful and a little put out." },
      },
      again = {
        { id = "h_again", text = "Anything more? Ask as we go; I've the wall to inspect." },
        { id = "h_again2", text = "Go on, I've a minute. There's a crack in the east wall the size of my fist, and it'll still be there after." },
        { id = "h_again3", when = { timeOfDay = "night" }, text = "Ask. The night watch can spare me a moment, and I them." },
      },
      choices = {
        { text = "The hills look sick, Marshal.", next = "druid_q", when = { class = "DRUID" } },
        { text = "The first boats from Stormwind?", next = "boats" },
        { text = "What threatens Southshore?", next = "threats" },
        { text = "Tell me about the town.", next = "town" },
        { text = "Lieutenant Orinelle doesn't seem happy in his post.", next = "farren" },
        { text = "I fled the plague. Is there room for me here?", next = "refugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "Did Silver Hand knights ever come to Southshore?", next = "paladin", when = { class = "PALADIN" } },
        { text = "The dead are so close. How do your people bear it?", next = "priest", when = { class = "PRIEST" } },
        { text = "I've seen the ruins of Alterac.", next = "alterac_seen", when = { questDone = TODO_QUEST("Crushridge Warmongers") } },
        { text = "I'm doing Lieutenant Orinelle's murloc work.", next = "errand", when = { questActive = TODO_QUEST("Farren's Proof") } },
        { text = "I've come back from the Scarlet Monastery, Marshal.", next = "xcl_sm", when = { cleared = "Scarlet Monastery", faction = "Alliance" } },
        { text = "I'll help.", next = "BUSINESS", fx = { affinity = 2, standing = { southshore = 1 } } },
        { text = "Your militia needs drilling, Marshal. I can do it.", next = "xwarrior", when = { class = "WARRIOR" } },
        { text = "I've been hunting in the Alterac foothills.", next = "xhunter", when = { class = "HUNTER" } },
        { text = "The Stormpike are digging into Alterac, I hear.", next = "xdwarf", when = { race = "Dwarf" } },
        { text = "My people came to Dalaran from the sky.", next = "xskyborne", when = { race = "Skyborne" } },
        { text = "How bad is the Syndicate in Hillsbrad these days, Marshal?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Will the Alliance help Dalaran, Marshal?", next = "xmage", when = { class = "MAGE" } },
        { text = "Will Southshore fight beside a warlock, Marshal?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "You seem uneasy around a dwarf shaman, Marshal.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "We're a full company, Marshal. Put us to use.", next = "xpt_company", when = { party = { size = 4 }, faction = "Alliance" } },
        { text = "I used to run letters for the Syndicate, Marshal.", next = "xorig_syndicate", when = { origin = "human_syndicate_runner" } },
        { text = "Good day, Marshal.", next = "END" },
        { text = "Why couldn't your men get close to the Syndicate, Marshal?", next = "dd_assassins", when = { questDone = TODO_QUEST("Syndicate Assassins") } },
      },
    },
    xorig_syndicate = {
      lines = {
        { id = "xosyndicate_default", text = "Did you, now? Then you're either very brave to tell me so or very foolish, and I've not yet decided which. If you know where they keep their camps in the foothills, Southshore would be glad to hear it, and I'd not ask how you came to know." },
      },
      choices = {
        { text = "I'll tell you what I know, Marshal.", next = "BACK", fx = { affinity = 2, standing = { southshore = 1 } } },
        { text = "I got out, and I won't go back, even to talk.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    boats = {
      big = true,
      lines = {
        { id = "b_default", key = true,
          text = "Sir Anduin Lothar came off the lead ship with a young mage called Khadgar, and I sent Willem, my fastest rider, to King Terenas that hour. He rode like the dead were after him." },
      },
      choices = {
        { text = "You met Lothar?", next = "lothar" },
        { text = "And the mage, Khadgar?", next = "khadgar" },
        { text = "That's a lot of history.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    lothar = {
      lines = { { id = "l_default", text = "Only for an hour. He was tired, soaked and grieving, and still the most dangerous man I'd ever seen; I've never forgotten it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    khadgar = {
      lines = {
        { id = "kh_default", text = "A young man with an old man's eyes, even then. He went north with Lothar, and later through the Dark Portal with the expedition. None of them came back." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    threats = {
      lines = { { id = "t_default", text = "Murlocs on the coast, naga past them, ogres in the hills and the Syndicate at Durnholde. Worst of all are the dead in Tarren Mill, who'd like the whole valley." } },
      choices = {
        { text = "Tell me about the ogres.", next = "crushridge" },
        { text = "Who are the Syndicate?", next = "syndicate" },
        { text = "And Tarren Mill?", next = "tarren" },
      },
    },
    crushridge = {
      lines = {
        { id = "cr_default", text = "Crushridge ogres, dug in in the Alterac Mountains and squatting in the ruins of the old capital. Let them get comfortable, and the foothills are next, then my front door." },
      },
      choices = {
        { text = "Then they won't get comfortable.", next = "BUSINESS", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    syndicate = {
      lines = {
        { id = "sy_default", text = "They're thieves with old names, out of Alterac. They hold the ruins of Durnholde and take our horses and our shipments, and while Magistrate Maleb keeps their papers, I keep the road." },
      },
      choices = {
        { text = "Durnholde? The old keep?", next = "durnholde" },
        { text = "Something else.", next = "BACK" },
      },
    },
    durnholde = {
      lines = {
        { id = "du_default", text = "It's where they held the captured orcs after the Second War. One of those orcs came back with an army and pulled the keep down around its lord. Now the Syndicate squat in the rubble." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    tarren = {
      big = true,
      lines = {
        { id = "ta_default", text = "Tarren Mill was a town like this one, until the plague came and the dead took it, and now they want our fields too. Hillsbrad's farms feed Southshore, and they know it." },
      },
      choices = {
        { text = "The Forsaken were people once.", next = "tarren_people" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tarren_people = {
      lines = {
        { id = "tpe_default", text = "So were the farmers they've killed. I don't hate them, mind, I just don't let them near the horses." },
      },
      choices = {
        { text = "That's fair.", next = "BACK", reply = "I think so. It's the best I can do for them, and it's more than they've done for us.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Someone should try talking to them.", next = "BACK", reply = "Someone has, and he came back in a box. You're welcome to try, but take a spear with you.", fx = { align = { light = 1 }, opinion = { forsaken = "talk" } } },
      },
    },

    town = {
      lines = {
        { id = "to_default", text = "A fishing village before the boats, a seaport in the war, and now one of the last human towns in Lordaeron. We fish, we farm the fields up the valley, and we keep watch." },
      },
      choices = {
        { text = "Who lives here now?", next = "town_people" },
        { text = "Something else.", next = "BACK", fx = { standing = { southshore = 1 } } },
      },
    },
    town_people = {
      lines = {
        { id = "tw_default", text = "Fishermen, mostly. A few old knights of the Silver Hand, a few Kirin Tor mages who never went back north, and refugees who stopped running here." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    farren = {
      lines = {
        { id = "fa_default", text = "Orinelle? He's a good guardsman in the wrong post. He gets the work done eventually, usually through someone else." },
      },
      choices = {
        { text = "Through me, you mean.", next = "farren_you" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farren_you = {
      lines = {
        { id = "fy_default", text = "Through you, yes. He thinks I don't know, and I've decided to let him keep thinking it, since it gets the murlocs killed." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },

    refugee = {
      big = true,
      lines = {
        { id = "rf_default", text = "There's room; there's always room, because that's what this town is for. It was for the Stormwind folk once, so tell Innkeeper Anderson at the inn I said so." },
      },
      choices = {
        { text = "Thank you, Marshal.", next = "BACK", fx = { affinity = 3, standing = { southshore = 2 } } },
        { text = "I won't be a burden. Put me to work.", next = "BUSINESS", fx = { affinity = 2, standing = { southshore = 2 }, trait = { proud = 1 } } },
      },
    },
    paladin = {
      lines = {
        { id = "pa_default", text = "Some came, and a few still live here, quieter than they were. When Uther fell, the Hand came apart, and some of the men in it came apart too. Be kind to them." },
      },
      choices = {
        { text = "Should the Silver Hand be raised again?", next = "opn_hand" },
        { text = "I will.", next = "BACK", reply = "Thank you. They need it more than they'll ever say, and so does this town.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Men who ran when Uther fell don't deserve much kindness.", next = "BACK", reply = "You weren't there when the Hand broke, friend. I'd hold my tongue around them, if I were you.", fx = { align = { light = -1 } } },
      },
    },
    priest = {
      big = true,
      lines = {
        { id = "pr_default", text = "We bury our dead with the old words, and then we watch the grave for a few nights, to be sure. That's what Lordaeron is now." },
      },
      choices = {
        { text = "Then I'll say the words with them.", next = "BACK", reply = "They'd be glad of you. It's a comfort to hear the words said by someone who still believes them.", fx = { affinity = 2, align = { light = 2 }, standing = { southshore = 1 } } },
        { text = "Skip the words. A torch by the grave serves the dead better.", next = "BACK", reply = "We do both here, the words first and the torch after. I'd not skip either.", fx = { align = { light = -2 } } },
        { text = "No one should have to grieve like that.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "What do you fear most, Marshal?", tag = "Persuade", next = "lantern",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "PRIEST" }, { origin = "human_lordaeron_refugee" } } } },
          fail = { next = "lantern_no", fx = { affinity = -1 } } },
      },
    },
    alterac_seen = {
      lines = {
        { id = "as_default", text = "Have you, now? Then tell me how the old city looks these days. Bad, I'd guess, since ogres don't keep house." },
      },
      choices = {
        { text = "Ruined, and filthy with ogres.", next = "BACK", fx = { affinity = 1 } },
        { text = "There were still books in it.", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Quieter, now.", next = "BACK", fx = { affinity = 2, standing = { southshore = 1 } } },
      },
    },
    errand = {
      lines = {
        { id = "er_default", text = "Lieutenant Farren's errand-runner, are you? Thank you, then. Southshore needs people who'll do the work, whoever ends up taking the credit." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1, standing = { southshore = 1 } } } },
    },
    lantern = {
      lines = {
        { id = "la_default", text = "That Southshore goes the way of Tarren Mill. I knew folk there and fished the same river, and now they're the reason I keep a lantern lit by the stables all night. Most nights I'm the one holding it, while the town thinks I'm seeing to the horses." },
        { id = "la_priest", when = { class = "PRIEST" },
          text = "You've the look of someone people confess to, so here it is. I'm afraid Southshore will go the way of Tarren Mill, and most nights I'm the one by the stables with the lantern, watching the hill road, while the town thinks I'm seeing to the horses." },
      },
      choices = {
        { text = "I'll keep it to myself, Marshal.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lantern_no = {
      lines = {
        { id = "ln_default", text = "Fear's not something a marshal leaves on the counter for anyone to pick up. Ask me about the ogres instead; I'm very free with my opinions of them." },
        { id = "ln_soldier", when = { class = "WARRIOR" },
          text = "A soldier asking a soldier what he's afraid of? You know better than that, so ask me about the ogres instead." },
      },
      choices = {
        { text = "Right, then. The ogres it is.", next = "BACK" },
      },
    },
    xwarrior = {
      big = true,
      lines = {
        { id = "xwa_default", text = "It does, and it's had nobody but me to do it since the war, and I'm a headman, not a sergeant. I've fishermen who hold a spear like an oar, and Stormwind's grandchildren who think a spear is a story." },
      },
      choices = {
        { text = "Then they'll learn the way soldiers learn: by rote.", next = "BACK", reply = "By rote, by bruises and by the Light's own patience. Mine's thinning by the day.", fx = { affinity = 2, align = { order = 1 }, standing = { southshore = 1 } } },
        { text = "Fishermen with oars fight dirty. Let them.", next = "BACK", reply = "They do, and they'll need to. Dirty or clean, a dead Forsaken's a dead Forsaken.", fx = { affinity = 1, align = { order = -1 }, trait = { witty = 1 } } },
        { text = "How many can actually fight?", next = "xwarrior_count" },
      },
    },
    xwarrior_count = {
      lines = { { id = "xwc_default", text = "Forty I'd trust on the wall, and another forty who'd try. Against Tarren Mill that's not enough, so I don't say the number aloud in the inn." } },
      choices = {
        { text = "I won't say it either.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    xhunter = {
      lines = {
        { id = "xhu_default", text = "Then you've seen the Crushridge fires and you've had the sense to stay downwind of them. Ogres I can hold off, but the lions keep taking horses from Farmer Malvew up the valley, and he'll talk your ear off about it." },
        { id = "xhu_human", when = { race = "Human" },
          text = "A Stormwind {g:lad|lass} with a bow and a beast at heel; my grandfather would have called you a ranger and asked where your elves were. Times change, and you're welcome to the hills." },
      },
      choices = {
        { text = "Who else lives around Southshore?", next = "town_people" },
        { text = "I'll thin the lions.", next = "BACK", fx = { affinity = 1, standing = { southshore = 1 } } },
      },
    },
    xdwarf = {
      lines = { { id = "xdw_default", text = "So I hear, and I hear the Frostwolves don't care for it either. I'll take any dwarf with a hammer who wants to stand between us and the mountains, Stormpike or Wildhammer or Ironforge; I'm not particular." } },
      choices = {
        { text = "The Frostwolves are orcs. Ask me again what I think.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Something in those mountains frightens you.", next = "crushridge" },
      },
    },
    xskyborne = {
      lines = { { id = "xsk_default", text = "From the sky, as if it were Menethil! Southshore's had Stormwind's refugees and Dalaran's wizards and Alterac's ghosts, so I suppose we'll get used to elves falling out of the clouds as well." } },
      choices = {
        { text = "We didn't fall. We came looking.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "You've a welcoming town, Marshal.", next = "BACK", fx = { affinity = 2 } },
      },
    },
  },

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Well, that's decent of you. Southshore doesn't get much thanks for staying put, and I'll pass it on to the militia." },
        { id = "s2", text = "I'll take that kindly. It's good to know someone from outside sees what this town's worth." },
      },
      fail = {
        { id = "f1", text = "I was a headman before I was a marshal, and I've had every fishmonger in town try to sweeten me. Tell me straight what you're after." },
        { id = "f2", text = "Fine words don't hold a line. If you think well of Southshore, there's a watch tonight that's short of men." },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha. You've a mouth on you, and I've known good soldiers who were the same. I can take a ribbing, so long as you'll stand a watch afterwards." },
        { id = "s2", text = "Fair enough, that one landed. We're a stubborn lot down here, and I suppose we can stand being laughed at now and then." },
      },
      fail = {
        { id = "f1", text = "I've buried too many neighbors this year to find that funny. Keep a civil tongue while you're in my town." },
        { id = "f2", text = "That's cheap talk from someone who hasn't stood on our line, and I don't care for it. Mind yourself." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "Easy, now. You've made your point, and I've no men to spare for a quarrel inside the town, so I'll let you have it." },
        { id = "s2", text = "You've a hard look, and I've learned to take those seriously. Go on and say what you want." },
      },
      fail = {
        { id = "f1", text = "I've got the Forsaken across the fields and ogres in the hills, so you're a long way down my list of worries. Don't try that in Southshore again." },
        { id = "f2", text = "I've faced things that were already dead and still coming, friend. You don't frighten me, and you've only made me trust you less." },
      },
    },
  },
  topics = {
    _gated = {
      { id = "gt1", text = "That's the town's business, and I don't know you well enough to share it. Do right by Southshore and ask me again." },
      { id = "gt2", text = "I know, and I'm not saying, not to someone who only just walked in. We've learned to be careful about who hears what." },
    },
    knows = {
      { id = "tp_knows", text = "I've stood on this wall long enough to hear about most things in the valley. Ask me, and I'll give it to you straight." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } },
        text = "Ask me anything you like. You've done right by this town, and I don't hold much back from people who have." },
    },
    alterac = { { id = "tp_alterac", text = "There are ogres in the old capital now, and their next step is my front door.", next = "crushridge" } },
    silver_hand = { { id = "tp_hand", text = "Some of the old knights live here still, quieter than they were." } },
    new_plague = { { id = "tp_plague", text = "Across the valley they're brewing something, and I don't need a scholar to tell me what." } },
    background = { { id = "tp_bg", text = "First headman, then marshal: the same town and the same people, only a bigger sword.", next = "boats" } },
    advice = { { id = "tp_ad", text = "Stay off the hill roads after dark. Between the ogres, the Syndicate and the dead, somebody up there's always awake." } },
    defias = { { id = "tp_defias", text = "Stormwind's thieves? We've our own here, the Syndicate: the same rot, only with different noble names on the deeds." } },
    seven_kingdoms = { { id = "tp_seven", text = "Alterac was one of the seven, until Lord Perenolde sold the Alliance to the Horde. Its nobles have been thieves ever since, and some of them were before." } },
    scourge = { { id = "tp_scourge", text = "The dead took everything north of the Alterac hills, and they'll take Hillsbrad too if we let them. We won't, and that's the whole of Southshore's policy on the matter." } },
    forsaken = { { id = "tp_forsaken", text = "The dead up the hill in Tarren Mill call themselves free, and maybe they are, but they're still pushing my lines back one field at a time. I'll take free over Scourge, but I'll not take it as a neighbour." }, { id = "tp_forsaken2", when = { race = "Scourge" }, text = "I don't know what you are, exactly, and I'm not sure you do either. Mind yourself in my town, for my folk lost too many to the plague to be gentle." } },
    lordaeron = { { id = "tp_lordaeron", text = "I was a young man when Lordaeron was the greatest kingdom in the world, and I saw it fall in a single season. Southshore's what's left of it on this side of the mountains, and we mean to keep it." } },
    thrall = { { id = "tp_thrall", text = "The orc warchief broke out of Durnholde not ten miles from here, and Southshore remembers that night. He's built a kingdom across the sea now, and I'll thank him to stay there." } },
    stratholme = { { id = "tp_stratholme", text = "Stratholme was the jewel of the north, and Prince Arthas burned it to the ground. I've heard the Argent Dawn's tales of what's there now, and I'll not repeat them in front of children." } },
    sylvanas = { { id = "tp_sylvanas", text = "The Dark Lady, they call her up the hill, and she's turned the Undercity into a nest of the walking dead. I'd not trust her as far as I could throw her, and I'd not want to touch her to try." } },
    _none = { { id = "tp_none", text = "Ask Magistrate Maleb; he's paid to know things, and I'm paid to stand here." } },
  },
}

P:NPC {
  key = "maleb", id = TODO_NPC("Magistrate Henry Maleb"), name = "Magistrate Henry Maleb",
  rivals = { "redpath" },
  bible = "bibles/hillsbrad.md", role = "noble", tier = "quest",
  communities = { "southshore" }, temper = { "weary" }, values = { "lawful", "dutiful" },
  notices = { "status", "lock_shards" },

  impression = {
    first = "He is too honest about wishing he were a clerk somewhere safer.",
    third = "{name} met Magistrate Henry Maleb, Southshore's young magistrate, whose desk is buried in reports about the Syndicate.",
  },

  greetings = {
    { id = "g_office", text = "Sit, sit, and don't mind the papers. The Syndicate keep me in reading." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, if my ledger's right, and it usually is. Sit down, for the Syndicate certainly didn't take any time off." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "A complaint crossed my desk suggesting someone in town was talked into something they now regret. I won't ask if it was you, but I'll be reading the fine print while you're here." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I'm told you talked someone round to your way of thinking. Most useful, and if you can do the same for the treasury, my door is always open." },
  },

  notice = {
    { id = "n_rogue", cat = "status", when = { class = "ROGUE" },
      text = "I'll speak plainly, since you look like someone who reads between lines anyway. The Syndicate wear faces like yours. Prove you're not one of them." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 15 } },
      text = "Is your bag humming, or is that me? I've been through every statute Stormwind ever sent us, and there's nothing at all about carrying souls about in a sack, which I suppose makes it legal, though I'd rather not be the one to rule on it." },
  },

  start = "hello",
  nodes = {
    opn_bolvar = {
      lines = {
        { id = "opn_bolvar_q", text = "Stormwind sends magistrates and forms, and very few soldiers. Highlord Bolvar is a good man with a missing king and a court full of opinions, and Lady Prestor has more of those than most. I'd value an outside view, off the record, if you have one." },
      },
      choices = {
        { text = "Bolvar holds a kingdom together alone. Give him time.", next = "opn_bolvar_r_trust", fx = { affinity = 1, align = { order = 1 }, opinion = { bolvar = "trust" } } },
        { text = "Stormwind forgot the north the day the plague came.", next = "opn_bolvar_r_neglect", fx = { align = { order = -1 }, opinion = { stormwind = "abandoned", bolvar = "neglect" } } },
        { text = "I'd look harder at who has the Regent's ear.", next = "opn_bolvar_r_distrust", fx = { trait = { skeptical = 1 }, opinion = { prestor = "distrust" } } },
        { text = "Lady Prestor seems to keep the court steady.", next = "opn_bolvar_r_prestor_trust", when = { origin = "human_minor_noble" }, fx = { opinion = { prestor = "trust" } } },
        { text = "I'd rather not, Magistrate.", next = "BACK" },
      },
    },
    opn_bolvar_r = {
      lines = {
        { id = "opn_bolvar_r_default", text = "Wise. I've a form for opinions, but it's never once been filled in." },
      },
      choices = {
        { text = "Something else, Magistrate.", next = "BACK" },
      },
    },
    opn_bolvar_r_trust = {
      lines = {
        { id = "opn_bolvar_r_trust", text = "Time is the one thing I can't requisition, but I take your point. He answered my last letter himself, which is more than his predecessors did." },
      },
      choices = {
        { text = "Something else, Magistrate.", next = "BACK" },
      },
    },
    opn_bolvar_r_neglect = {
      lines = {
        { id = "opn_bolvar_r_neglect", text = "I couldn't possibly agree with that in writing. Out loud, in this office, with the shutters closed, I'll only say the last shipment of soldiers was three men and a cook." },
      },
      choices = {
        { text = "Something else, Magistrate.", next = "BACK" },
      },
    },
    opn_bolvar_r_distrust = {
      lines = {
        { id = "opn_bolvar_r_prestor", text = "That's a dangerous thing to say about a noblewoman, and I'll pretend I didn't hear it. I'll also pretend I haven't thought it myself, reading her letters." },
      },
      choices = {
        { text = "Something else, Magistrate.", next = "BACK" },
      },
    },
    opn_bolvar_r_prestor_trust = {
      lines = {
        { id = "opn_bolvar_r_prestortrust", text = "Steady is a word for it. The court hasn't been so quiet in years, which I'd find more reassuring if Southshore's requests didn't keep vanishing into that quiet." },
      },
      choices = {
        { text = "Something else, Magistrate.", next = "BACK" },
      },
    },
    xpt_rogue = {
      big = true,
      lines = { { id = "xpt_rogue_default", text = "There's no such creature in my experience, though I'll grant there are useful ones, and Southshore has needed a few of those since Ravenholdt started sending its people down the hill. Keep yours on a short leash, and I'll pretend I didn't see them standing by the strongbox." } },
      choices = {
        { text = "You're right to be careful. I'll keep an eye on them.", next = "BACK", reply = "Thank you. I'd rather know who I'm dealing with before something goes missing from my office.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I trust my companions. Their past is their own business.", next = "BACK", reply = "I'm sure you do, and I'm sure their past is very interesting. Still, I'll keep a quill handy, just in case.", fx = { align = { order = -1 } } },
        { text = "What does Ravenholdt want with Southshore?", next = "xpt_rogue2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpt_rogue2 = {
      lines = { { id = "xpt_rogue2_default", text = "Ravenholdt wants what every lord in Alterac wants, which is to be left alone and paid, and I'd sooner pay than find out what happens when I don't. Lord Jorach writes very polite letters, and that frightens me more than all of Marshal Redpath's shouting." } },
      choices = {
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I'd have to file you under 'other', I'm afraid, which never feels like the right answer for anyone. Southshore's law doesn't care what you pray to, only whether you pay your dues and stay clear of the Syndicate's business, and I'd be grateful if you did both." } },
      choices = {
        { text = "The law's the law. I'll keep to it, Magistrate.", next = "BACK", reply = "Thank you; you'd be surprised how rare that answer is. Most people tell me the law doesn't apply to them, and then I have to write it down.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Forms are for clerks. The earth keeps no ledgers.", next = "BACK", reply = "Clerks keep this town running, I'll have you know, and the earth would keep better ledgers if it had a magistrate.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I have reports on everything else, so I suppose I should have one on that. The farmers clear more of the hills every spring, and the ogres take it badly, and so do the wolves. I'd never thought of the hills having an opinion." } },
      choices = {
        { text = "Let them clear the hills. People need the fields.", next = "BACK", reply = "They need fields, yes, and the ogres need hills, and I'm the one who gets the complaints from both. I'll note your view.", fx = { align = { order = 1 } } },
        { text = "Then slow them down. The hills were here first.", next = "BACK", reply = "First, perhaps, but the farmers have mouths to feed. I'll write the report, and I'll probably regret it.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else, Magistrate.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Durnholde Keep, if I had a hundred of you, but I don't, so start with the camps along the Alterac road. Every crate they bring down from the hills passes through there, and my clerk says they've begun posting guards who know which end of a sword to hold." } },
      choices = {
        { text = "I'll do it by the book, Magistrate. Arrests where I can.", next = "BACK", reply = "Arrests are all I ask for, and I'll have the cells ready. Bring them in alive if you can; dead men don't confess.", fx = { align = { order = 1 } } },
        { text = "The Syndicate gave up the law. I'll give them none.", next = "BACK", reply = "They gave it up, and I can't pretend I'm sorry to see them lose it. Mind you, I'll want a report all the same.", fx = { align = { order = -1 } } },
        { text = "Something else, Magistrate.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Desperately, and the farmers want it more, but it feels odd to put a bounty on an animal for doing what animals do. The Syndicate, at least, know they're breaking the law, which makes the paperwork so much simpler." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Desperately, and is that {pet}? It's very handsome, and it's staring at my inkpot, and I'd be grateful if you'd ask it not to, because these reports took me three nights." },
      },
      choices = {
        { text = "Beasts that raid farms should be culled. The town comes first.", next = "BACK", reply = "That's what the farmers say, and they're louder than I am. I'll draft the bounty in the morning.", fx = { align = { order = 1 } } },
        { text = "Lions don't know the law. Drive them off, don't bounty them.", next = "BACK", reply = "You're a kinder soul than most in this town. I'll see if the farmers will settle for driving them off.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Stand beside it, mostly, because my papers only frighten clerks. The Syndicate are Alterac's old nobility, and they think the law is a thing they own, so a knight on the road reminds them that it isn't." } },
      choices = {
        { text = "The law should be served openly. I'll ride the roads.", next = "BACK", reply = "Then ride, and wave a writ at them as you go. They'll laugh, but they'll remember it was served.", fx = { align = { order = 1 } } },
        { text = "Your papers won't stop them. Steel will, law or no.", next = "BACK", reply = "I'm afraid you may be right, though I'll deny saying so. Steel with a writ beside it, then.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Nobody, because the families fled south years ago and the Syndicate leaves its dead wherever they fall. I've written to the Cathedral twice asking for a priest, and both times they wrote back very kindly to say they hadn't one to spare." } },
      choices = {
        { text = "I'll say the words over them myself, if I find them.", next = "BACK", reply = "Thank you. The Cathedral may not send anyone, but you've done more than they have.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The living need justice more than the dead need words.", next = "BACK", reply = "Justice, yes, and I'm trying to give them that too. Still, I'd like someone to say a word over the poor souls.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I've worked out names, mostly old Alterac houses like the Perenoldes, and a few places in the hills I can't find on any map. The rest is either very clever code or very bad spelling, and after three weeks I can't tell which." } },
      choices = {
        { text = "Let me help you crack it properly. The law deserves the truth.", next = "BACK", reply = "I'd be grateful beyond words. I've been staring at those pages so long the letters are dancing.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Burn the letters and burn their camps. Simpler that way.", next = "BACK", reply = "Simpler, yes, but then I'd never know who was writing them. Bring me the letters first, if you'd be so kind.", fx = { align = { order = -1 } } },
        { text = "Something else, Magistrate.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_rogue", tags = { "news" }, when = { party = { class = "ROGUE" }, faction = "Alliance" },
          text = "You travel with {companion}, I see, and I'd know that soft step anywhere. I've nothing against rogues as such, but I keep the town's ledgers locked whenever one comes into my hall, and I'd thank you not to take it personally." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, and a dwarf at that! I'm afraid I've no form for this, {class}, and I've a form for nearly everything, so you'll forgive me if I stare a little." },
        { id = "h_rivalfav", when = { rivalFavor = { min = 2 } },
          text = "Marshal Redpath tells me you've been out on the road with his men. Good work, I'm sure, but the Syndicate is beaten in my ledgers as much as on the road, and the Marshal never quite believes that." },
        { id = "h_rivalfoe", when = { rivalFavor = { max = -2 } },
          text = "The Marshal had harsh words about you, I gather. Redpath has harsh words for anyone who isn't holding a sword, so I shouldn't let it trouble you." },
        { id = "h_default", key = true,
          text = "Henry Maleb, Magistrate of Southshore. I was thrilled to be given the post so young. Some evenings I wonder if I'd have done better as a clerk in Stormwind." },
        { id = "h_assassins", tags = { "news" }, when = { questActive = TODO_QUEST("Syndicate Assassins") },
          text = "There are Syndicate assassins, paid killers, in the hills above town. Someone's paying them and I want to know who, so start by finding out what they carry." },
        { id = "h_plans", when = { questActive = TODO_QUEST("Foreboding Plans") },
          text = "Those plans you found name names, and old ones at that. Alterac's nobility never died; it just learned to hire better." },
        { id = "h_council", tags = { "news" }, when = { questActive = TODO_QUEST("Dark Council") },
          text = "Whoever pulls these strings meets somewhere up in the mountains. Break them, and you'll do more for Southshore than ten years of my letters." },
        { id = "h_papers", when = { metBefore = true }, text = "I signed forty documents before breakfast and read most of them... some of them, at least the important ones, I hope." },
        { id = "h_rings", when = { questActive = TODO_QUEST("Noble Deaths") },
          text = "I want their signet rings. The nobles hide among their cutthroats, but they can't bear to take the rings off. Bring me the rings, and we'll know who's left." },
        { id = "h_contract", tags = { "news" }, when = { questActive = TODO_QUEST("Baron's Demise") },
          text = "Baron Vardus signed my death in red wax, and he's cold, cruel, and an Alterac lord to his boots. Find him in the mountains and bring him to justice." },
        { id = "h_vardus_done", when = { questDone = TODO_QUEST("Baron's Demise") },
          text = "I slept through the night, the whole night, and I'd forgotten what that was like." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Could you possibly read the Syndicate's coded letters? I've got a drawer of them and not one person in Southshore who can make sense of the cipher." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Forgive me, but I'd hoped someone would come about the Syndicate's victims in the hills, because some of them still haven't had proper burials and I've no idea whose job that is." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, in my office! I'll tell you plainly that Southshore hasn't had a knight of the Light on its roads since the Silver Hand broke, and the Syndicate have noticed." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Oh, thank goodness, because I've a list of Syndicate camps as long as my arm and nobody to send who won't drop his spear at the first shout." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, good! The farmers keep filing complaints about the lions taking their sheep, and I've no idea which department those belong to." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "Oh! A night elf druid, in my town. I'm afraid I don't have a form for that, but I'm sure there's some proper way to welcome you, and I'll find it eventually." },
        { id = "h_dd_crushridge", when = { questDone = TODO_QUEST("Crushridge Bounty") },
          text = "Marshal Redpath's report on the Crushridge ogres arrived on my desk with your name underlined twice. The Marshal doesn't underline anything, so I've had it copied for the town records." },
      },
      again = {
        { id = "h_again", text = "What else? The depositions will keep a minute." },
        { id = "h_again2", text = "Go on. I'll pretend this is official business." },
      },
      choices = {
        { text = "Who are the Syndicate?", next = "syndicate" },
        { text = "Your predecessor seems to have left in a hurry.", next = "predecessor" },
        { text = "Why not go back to Stormwind?", next = "stormwind" },
        { text = "If not the Syndicate, who wrote that letter?", next = "argus", when = { questDone = TODO_QUEST("Further Mysteries") } },
        { text = "I could get inside the Syndicate for you.", next = "rogue", when = { class = "ROGUE" } },
        { text = "My family knew some of the Alterac houses.", next = "noble", when = { origin = "human_minor_noble" } },
        { text = "Baron Vardus is dead.", next = "vardus", when = { questDone = TODO_QUEST("Baron's Demise") } },
        { text = "I could give the Syndicate nightmares they'd not wake from.", next = "xwarlock", when = { class = "WARLOCK" } },
        { text = "What do the Syndicate letters say, Magistrate?", next = "xmage", when = { class = "MAGE" } },
        { text = "Who buries the Syndicate's victims, Magistrate?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What can a paladin do for Southshore's law, Magistrate?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Which Syndicate camp would you send a warrior to first, Magistrate?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "I'd guess you want the lions dealt with, Magistrate.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do the Southshore farms trouble the land here, Magistrate?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "I doubt your forms have a place for someone like me, Magistrate.", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "My friend's a rogue, but an honest one, Magistrate.", next = "xpt_rogue", when = { party = { class = "ROGUE" }, faction = "Alliance" } },
        { text = "Good day, Magistrate.", next = "END" },
      },
    },
    syndicate = {
      big = true,
      lines = {
        { id = "s_default", text = "Alterac's lords, or their heirs, who never forgave the Alliance for taking their kingdom away. They took Durnholde and called it a home. They'd take Southshore too, if we let them." },
      },
      choices = {
        { text = "Who leads them?", next = "nobles" },
        { text = "Then we won't let them.", next = "BACK", reply = "No, we won't, and I'll say so in every report I write. Thank you for saying it.", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Alterac's lords had a fair grievance, if you ask me.", next = "BACK", reply = "They had a grievance, perhaps, but they answered it with poison and lamp oil. I'll judge the deed, not the cause.", fx = { align = { order = -1 } } },
      },
    },
    nobles = {
      lines = {
        { id = "no_default", text = "They're old Alterac names, hiding among the footpads. You can tell a noble by his signet ring; they never take them off. Strahnbrad, up in the mountains, is their den." },
      },
      choices = {
        { text = "What do they want with Southshore?", next = "plans" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plans = {
      big = true,
      lines = {
        { id = "pl_default", text = "I've read their supply list too many times. Black masks, lamp oil for burning, paralytic poison, and the stolen uniforms of my own guard. They mean to come for us looking like us." },
      },
      choices = {
        { text = "Then we strike first.", next = "BACK", reply = "First, yes, though I'd like it to be the Marshal's idea, for his pride's sake. I'll put it to him tonight.", fx = { affinity = 2, align = { order = 1 }, standing = { southshore = 1 } } },
        { text = "Southshore should hire its own knives and beat them at their game.", next = "BACK", reply = "Fight thieves with thieves? I hate how much sense that makes. I'll pretend I didn't hear it.", fx = { align = { order = -1 } } },
        { text = "Double the watch and check every uniform at the gate.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
      },
    },
    predecessor = {
      lines = {
        { id = "pd_default", text = "He was assassinated, and the killers were never found, but everything points to the Syndicate. I took the post knowing that, because I was young enough to think it wouldn't matter." },
      },
      choices = {
        { text = "I'd be afraid, in your place.", next = "afraid" },
        { text = "Something else.", next = "BACK" },
      },
    },
    afraid = {
      lines = {
        { id = "af_default", text = "Every night. I bolt the shutters, I check the guard, I read one more report. Fear's only useful if it makes you careful." },
      },
      choices = {
        { text = "Careful keeps you alive.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Then let me be your guard for a while.", next = "BUSINESS", fx = { affinity = 2, trait = { brave = 1 } } },
      },
    },
    stormwind = {
      lines = { { id = "st_default", text = "Because someone has to keep the law here, and everyone else who could has already gone. That's how most magistrates are made, I suspect." } },
      choices = {
        { text = "Is Stormwind doing right by Lordaeron's survivors?", next = "opn_bolvar" },
        { text = "Do you regret coming?", next = "regret" },
        { text = "Something else.", next = "BACK" },
      },
    },
    regret = {
      lines = {
        { id = "rg_default", text = "Some evenings. Then a fisherman thanks me for settling a quarrel over a net, and I stay. Small justice is still justice." },
      },
      choices = {
        { text = "Small justice is the kind that holds a town together.", next = "BACK", reply = "I've always thought so. Most of my cases are nets and fences and a missing goat, and every one of them matters to somebody.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Justice that small isn't worth keeping you here, Magistrate.", next = "BACK", reply = "Perhaps not, but somebody has to settle the nets, and I'm the one with the seal. I'll stay a while longer.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    argus = {
      big = true,
      lines = {
        { id = "ar_default", text = "Not a thief, nor an Alterac noble. Something calling itself the Argus Wake stands behind the Syndicate, and I don't know what it is. That frightens me more than masks." },
      },
      choices = {
        { text = "We'll find out.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    rogue = {
      lines = {
        { id = "ro_default", text = "I'd rather you didn't tell me how. I'm a magistrate; there are things I'd have to write down. Bring me what you find, and I won't ask about the rest." },
      },
      choices = {
        { text = "Understood. You won't hear how I did it.", next = "BACK", reply = "Thank you. My ledger and my conscience are both obliged to you.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I'll do it cleanly, so there's nothing you'd need to write down.", next = "BACK", reply = "Cleanly is all I could ask. Do it so well I never have to wonder.", fx = { align = { honor = 1 } } },
      },
    },
    noble = {
      lines = {
        { id = "nb_default", text = "Then you'll understand why I check every signet ring twice. Old names don't die out; they hire people." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    vardus = {
      lines = {
        { id = "va_default", text = "Then my predecessor is avenged, or near enough, and I thank you. I may even open a shutter tonight." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, standing = { southshore = 2 } } } },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwl_default", text = "I'm sure you could, and I'm sure Southshore would never sleep again either. I'm a magistrate, not a general, but even I know you don't put out one fire by lighting a bigger one." },
        { id = "xwl_demon", when = { pet = { type = "Demon" } }, text = "I'm sure you could, and from the way your demon perked up at the word nightmares, I'm sure it would enjoy the work. I'm a magistrate, not a general, but even I know you don't put out one fire by lighting a bigger one." },
      },
      choices = {
        { text = "Sometimes a bigger fire is the only cure.", next = "BACK", reply = "And sometimes the bigger fire takes the town with it. I'd rather we didn't find out which.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "Then I'll do it with a sword instead.", next = "BACK", reply = "Thank you. A sword I can write into a report without losing my post.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something else, Magistrate.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "The magistrate's office hears about everything eventually, usually in the form of a complaint. Ask, and I'll tell you what's crossed my desk." },
    },
    background = { { id = "tp_bg", text = "A commission young, a predecessor dead, and a desk full of Syndicate. That's my career so far.", next = "predecessor" } },
    advice = { { id = "tp_ad", text = "Read everything twice, especially whatever's been slipped under your door." } },
    defias = { { id = "tp_defias", text = "That's a Stormwind problem, and I've a Syndicate problem; some days I'd gladly trade." } },
    seven_kingdoms = { { id = "tp_seven", text = "Alterac was a kingdom once. Now it's a list of names I keep in a locked drawer." } },
    forsaken = { { id = "tp_forsaken", text = "The Forsaken are at war with us, and they're at war with the Scourge, and I'm still not sure which of those they mean more. I've filled two ledgers on the question, and neither has helped." } },
    alterac = { { id = "tp_alterac", text = "Half my docket is Syndicate, and the Syndicate are all Alterac's old nobility, and they still think they can't be hanged. I'd like to prove them wrong, once the paperwork's done." } },
    ravenholdt = { { id = "tp_ravenholdt", text = "Ravenholdt doesn't exist, officially, and I've been told so by people who should know. Unofficially, I lock my door at night." } },
    bolvar = { { id = "tp_bolvar", text = "Highlord Fordragon wrote to me once, to thank Southshore for taking Stormwind's refugees. I've framed it, though I'd not tell him so." } },
    _none = { { id = "tp_none", text = "Not before the court. Ask Marshal Redpath; he knows the ground." } },
  },
}

P:NPC {
  key = "farren", id = TODO_NPC("Lieutenant Farren Orinelle"), name = "Lieutenant Farren Orinelle",
  bible = "bibles/hillsbrad.md", role = "soldier", tier = "quest",
  communities = { "southshore" }, temper = { "sulky" }, values = { "ambitious" },
  notices = { "drink", "lock_armor" },

  impression = {
    first = "He calls commanding murlocs building character, and he doesn't look convinced.",
    third = "{name} met Lieutenant Farren Orinelle, late of the Stormwind City Guard, now charged with Southshore's murloc troubles.",
  },

  greetings = {
    { id = "g_inn", text = "Pull up a chair... no, not that one, that's mine. They're all mine, actually, I've been here so long." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ah, a fellow sufferer. Southshore drives everyone to it eventually. You're just ahead of schedule." },
    { id = "n_lock_armor", cat = "lock_armor", when = { class = "WARLOCK", aura = { 687, 696, 706, 1086, 11733, 11734, 11735 } },
      text = "That's no armour the Stormwind Guard ever issued, that dark hide crawling over your shoulders. I'd put in a requisition for some, but I suspect the paperwork would have to be signed in blood, and Samuelson would want it in triplicate." },
  },

  start = "hello",
  nodes = {
    opn_varian = {
      lines = {
        { id = "opn_varian_q", text = "The King? He sailed for Theramore and never arrived, and everyone in the Keep says 'missing' in the voice they use for 'dead'. I say he's alive, because I'm a Stormwind man and that's our job, but you've been further than I have. Well?" },
      },
      choices = {
        { text = "He's alive somewhere, and he'll come home.", next = "opn_varian_r_alive", fx = { affinity = 2, align = { light = 1 }, opinion = { varian = "alive" } } },
        { text = "He's gone, Lieutenant. Stormwind needs to accept it.", next = "opn_varian_r_dead", fx = { affinity = -1, align = { light = -1 }, opinion = { varian = "dead" } } },
        { text = "Someone wanted him gone. I'd ask who.", next = "opn_varian_r_betrayed", fx = { trait = { skeptical = 1 }, opinion = { varian = "betrayed" } } },
        { text = "Prince Anduin needs his father. I hope he's found.", next = "opn_varian_r_alive", when = { race = "Human" }, fx = { affinity = 1, trait = { kind = 1 }, opinion = { varian = "alive" } } },
        { text = "I couldn't say.", next = "BACK" },
      },
    },
    opn_varian_r = {
      lines = {
        { id = "opn_varian_r_default", text = "Nobody can, which is the worst part. Go and kill murlocs; at least that's simple." },
      },
      choices = {
        { text = "Something else, Lieutenant.", next = "BACK" },
      },
    },
    opn_varian_r_alive = {
      lines = {
        { id = "opn_varian_r_alive", text = "Ha! There, finally, someone who isn't from the Keep and still says it. I'll write that to Major Samuelson tonight, along with my transfer request." },
      },
      choices = {
        { text = "Something else, Lieutenant.", next = "BACK" },
      },
    },
    opn_varian_r_dead = {
      lines = {
        { id = "opn_varian_r_dead", text = "Well, you sound exactly like the Keep, then. I'll thank you not to say it again in here; I've enough reasons to be miserable in Southshore without that one." },
      },
      choices = {
        { text = "Something else, Lieutenant.", next = "BACK" },
      },
    },
    opn_varian_r_betrayed = {
      lines = {
        { id = "opn_varian_r_betrayed", text = "Who? Oh, no, I'm not touching that, not with a stranded lieutenant's career. Keep your voice down, and don't say it near the Magistrate's forms." },
      },
      choices = {
        { text = "Something else, Lieutenant.", next = "BACK" },
      },
    },
    xpt_pair = {
      big = true,
      lines = { { id = "xpt_pair_default", text = "Maybe it is, if you're quick and you keep off the roads, because the Syndicate fight like cutpurses and they scatter when the odds turn. Just don't go chasing them up into Strahnbrad, for that's where they want you, and that's where my last patrol went quiet." } },
      choices = {
        { text = "You're right. We'll find more swords before we go.", next = "BACK", reply = "Good. The Syndicate love an outnumbered enemy, and I'd hate to fill out two death reports.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Two who move quickly beat a slow column of soldiers.", next = "BACK", reply = "Fine, fine, but don't come crying to me when the Syndicate prove you wrong. I'll have the paperwork ready.", fx = { align = { order = -1 } } },
        { text = "What happened to your last patrol?", next = "xpt_pair2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpt_pair2 = {
      lines = { { id = "xpt_pair2_default", text = "We found their horses grazing outside Strahnbrad with the saddles still on, and that's all we found, though I've written to Stormwind twice. The Syndicate wear the old Alterac colours and call themselves nobles, but nobles don't leave a man's horse to starve." } },
      choices = {
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I'd love to know whether a shaman can ask the tide to carry them off somewhere else, Menethil perhaps, because I've tried asking politely and they only gurgle at me. Failing that, I'll take a dwarf with a lightning bolt over three of my own guards any day." } },
      choices = {
        { text = "I'll fight them on the shore, fair and in the open.", next = "BACK", reply = "In the open? Brave of you, and more than I'd do. Watch your ankles; they bite low.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'd sooner catch them sleeping in their huts, Lieutenant.", next = "BACK", reply = "Sleeping? Now that I'd like to see. Just don't wake them on my account.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I'd never ask you to do my duty for me, of course, but if you happened to be tracking along the shore and happened to thin them out a bit, I'd mention it in my report. Favourably, and in some detail, since the Magistrate likes detail." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I'd never ask you to do my duty, of course, but {pet} could help, couldn't it? I've seen murlocs flee from a barking dog, so I imagine they'd do the same for something with proper teeth." },
      },
      choices = {
        { text = "It's your duty, Lieutenant. You should lead the hunt yourself.", next = "BACK", reply = "Lead it? Myself? I've a very bad knee, I'll have you know. Or I will, if I go out there.", fx = { align = { honor = 1 } } },
        { text = "Put my name on the report, and the bounty, and I'll do it.", next = "BACK", reply = "Done, and I'll write it up so nicely that Samuelson will think you're a hero. Well, I'll write it up eventually.", fx = { align = { honor = -1 } } },
        { text = "Something else, Lieutenant.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I prayed in the Cathedral every week when I was in the Guard, and look where it got me, sitting in Southshore with a beach full of fish-men. The Light has bigger troubles than mine, I suppose, with the plague up north, but I'd take a small miracle if one's going spare." } },
      choices = {
        { text = "Duty first, Lieutenant. Your post is on that shore.", next = "BACK", reply = "My post is on a chair, and the chair is very comfortable, thank you. But fine, I'll look at the shore tomorrow.", fx = { align = { order = 1 } } },
        { text = "Stormwind's wronged you. Write them another letter.", next = "BACK", reply = "Finally, someone who understands! I've drafted four already, and I'll start the fifth tonight.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "That's a generous view from someone who isn't nibbled on the ankles every morning. Still, they were here first, I suppose, and they've never once filed a complaint with the Magistrate." } },
      choices = {
        { text = "The town comes first. Drive them up the coast.", next = "BACK", reply = "Up the coast, then, and maybe all the way to Menethil. I'll put it in the report as a strategic relocation.", fx = { align = { order = 1 } } },
        { text = "Leave their spawning grounds be, Lieutenant.", next = "BACK", reply = "Leave them be? Tell that to my ankles. Still, I'll keep away from their eggs, if only because they smell.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "They come up out of the bay at night and steal nets, fish and the occasional boot, and they're far cleverer at it than they have any right to be. The town wants me to stop them, and I'd give a month's pay for someone who could sneak up on them as you just did on me." } },
      choices = {
        { text = "I'll handle the murlocs. Southshore deserves a quiet night.", next = "BACK", reply = "You'd do that? Southshore will owe you, and I'll owe you even more, since I won't have to do it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them have the boots. You're wasting your talents here.", next = "BACK", reply = "Wasting my talents? Thank you, someone finally noticed. I'll tell Samuelson you said so.", fx = { align = { order = -1 } } },
        { text = "Something else, Lieutenant.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because the fishermen would lose their catch and the Magistrate would hold me responsible for every frostbitten fish, I'm told. The murlocs, of course, would wait for the thaw and carry on as if nothing had happened." } },
      choices = {
        { text = "Then we'll do this properly, one murloc at a time.", next = "BACK", reply = "Exactly what I'd have said, given enough time. One murloc at a time, starting with someone else.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Freeze it anyway. Some problems need a heavy hand.", next = "BACK", reply = "Freeze it anyway? I'd love to, but the Magistrate would have my hide. Don't tell him I agreed.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Don't tempt me, because I've sat in this chair long enough to consider worse ideas. But if Major Samuelson ever heard I'd sent a demon to do my duty, I'd be guarding murlocs for the rest of my life, and I mean to see Stormwind again." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Don't tempt me, especially with it standing right there looking so eager to go. But if Major Samuelson ever heard I'd sent a demon to do my duty, I'd be guarding murlocs for the rest of my life, so send {pet} away before he walks past this tent." },
      },
      choices = {
        { text = "Do your own duty, Lieutenant. Demons are no shortcut.", next = "BACK", reply = "You sound like Samuelson, and I'm not sure I like it. Fine, my own duty, eventually.", fx = { align = { order = 1 } } },
        { text = "A shortcut's a shortcut. Samuelson needn't ever hear.", next = "BACK", reply = "You and I think alike, which worries me a little. Still, best keep the demon out of my office.", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_pair", tags = { "news" }, when = { party = { size = 1 }, faction = "Alliance" },
          text = "Just you and {companion} against the Syndicate? I've seen braver plans, but not many, and most of them ended in the Alterac foothills with the crows." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman, in Southshore! Finally something new walks through that door, {class}, for I've been staring at the same murloc reports since spring." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! Tell me you speak murloc, because I've been trying to reason with them for a year and they only ever answer in that dreadful gurgle." },
        { id = "h_default", key = true,
          text = "Lieutenant Farren Orinelle, late of the Stormwind City Guard. Now I'm in charge of murlocs, and naga too, apparently, in a fishing town, at the end of the world. I'm told it builds character." },
        { id = "h_proof", tags = { "news" }, when = { questActive = TODO_QUEST("Farren's Proof") },
          text = "Marshal Redpath wants proof the murlocs are being dealt with. Deal with them, bring me proof, and I'll pass it up as if I'd been out there. Everyone wins." },
        { id = "h_stormwind", when = { questActive = TODO_QUEST("Stormwind Ho!") },
          text = "If I can show the city I've cleaned up this coast, they'll have to call me home, so please, I'm begging you, in a dignified way." },
        { id = "h_reassign", when = { questDone = TODO_QUEST("Reassignment") },
          text = "Still waiting on the reply, any day now, any day. I've packed; I've been packed for a month." },
        { id = "h_chair", when = { metBefore = true }, text = "Same chair, same murlocs, same sea. If you've come to tell me I've been recalled to Stormwind, I'll kiss you. If not, sit." },
        { id = "h_coast", tags = { "news" }, when = { questActive = TODO_QUEST("Down the Coast") },
          text = "The Torn Fin murlocs are down the Western Strand, so kill a few for me, then a few more for Marshal Redpath, and we'll both have something to talk about." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "Another evening in Southshore, and the gulls have gone to bed. I envy the gulls." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You crept up on me, and I was watching for murlocs, so either you're very good or I'm very tired, and I'd accept either answer." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Can't you just freeze the whole bay for a night? I've asked, and everyone says no, but I feel the question deserves a proper hearing." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Don't suppose you could bless the murlocs into leaving? I've tried everything else, short of actually going out there myself." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Splendid, because I've been told murlocs count as wildlife, and if that's true, they're surely your department rather than mine." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. Wonderful. In Stormwind we'd have had you followed by two guards and a magistrate's clerk, and here I've only got murlocs, so I suppose you're the least of my worries." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Torn Fin", min = 30 } }, text = "The Torn Fin haven't come up the beach in days, and the fishermen keep asking me what I did. I've been telling them it was strategy, so do me the kindness of not correcting them." },
        { id = "h_dd_deaths", when = { deaths = { min = 10 } },
          text = "You've the look of someone who's died more often than I've had hot dinners in this town. Take it from a soldier who's been sitting in one chair too long: the dead don't get recalled to Stormwind either." },
      },
      again = {
        { id = "h_again", text = "Still here? Fine, I wasn't going anywhere; I never am." },
        { id = "h_again2", text = "What else? Quickly, before I remember where I am." },
      },
      choices = {
        { text = "Murlocs belong on that shore as much as Southshore does.", next = "druid_q", when = { class = "DRUID" } },
        { text = "You don't seem to like it here much.", next = "hate" },
        { text = "What's the trouble with the murlocs?", next = "murlocs" },
        { text = "What was the City Guard like?", next = "guard" },
        { text = "What about the naga?", next = "naga" },
        { text = "I was in Stormwind not long ago.", next = "stormwind_news", when = { visited = "Trade District" } },
        { text = "A soldier shouldn't hide in an inn, Lieutenant.", next = "push", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Major Samuelson read your report.", next = "reassign", when = { questDone = TODO_QUEST("Reassignment") } },
        { text = "Fine, I'll deal with the murlocs.", next = "BUSINESS", fx = { affinity = 1 } },
        { text = "The naga were kaldorei once.", next = "xnightelf", when = { race = "NightElf" } },
        { text = "Surely murlocs can't give you that much trouble, Lieutenant.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why not freeze the bay, Lieutenant?", next = "xmage", when = { class = "MAGE" } },
        { text = "Perhaps the Light could help with your murlocs, Lieutenant.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Shall I hunt your murlocs for you, Lieutenant?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Could my imp handle your murlocs for you, Lieutenant?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Could a shaman help with your murlocs, Lieutenant?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Two of us is enough for the Syndicate, Lieutenant.", next = "xpt_pair", when = { party = { size = 1 }, faction = "Alliance" } },
        { text = "I'll leave you to your chair.", next = "END" },
      },
    },
    hate = {
      big = true,
      lines = {
        { id = "h2_default", text = "It smells of fish, it rains sideways, and the most exciting thing that happens is the Forsaken trying to kill us. In Stormwind I had a uniform people respected. Here I have gulls." },
      },
      choices = {
        { text = "Do you think King Varian is still alive?", next = "opn_varian" },
        { text = "The people here need you.", next = "need", fx = { trait = { kind = 1 } } },
        { text = "Sounds rough.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    need = {
      lines = { { id = "n_default", text = "...That's a low blow, accurate but low. Go and kill some murlocs before I start feeling guilty." } },
      choices = {
        { text = "Would you really leave them, if Stormwind called?", next = "conscience" },
        { text = "Something else.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    conscience = {
      lines = {
        { id = "co_default", text = "I'd write them a letter, a long one, with apologies... fine, probably not, but don't tell Redpath." },
      },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    murlocs = {
      lines = {
        { id = "mu_default", text = "They're Torn Fins, down on the Western Strand, fish that grew legs and opinions. I've stopped eating fish, and in Southshore that's close to fasting." },
      },
      choices = {
        { text = "Why not fight them yourself?", next = "fight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fight = {
      lines = {
        { id = "fi_default", text = "I could clear a Stormwind tavern of drunks one-handed, but murlocs don't drink, don't argue, and don't respect a uniform. It's a different trade entirely." },
      },
      choices = {
        { text = "Can't argue with that. Murlocs respect nothing.", next = "BACK", fx = { affinity = 1 } },
        { text = "That's an excuse, Lieutenant.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
        { text = "Get down to the strand, or Samuelson hears where you sit.", tag = "Intimidate", next = "strand_truth",
          check = { pass = { any = { { power = { "above", "far_above" } }, { class = { "WARRIOR", "PALADIN" } }, { trait = "stern" } } } },
          fail = { next = "strand_bluff", fx = { affinity = -1 } } },
      },
    },
    guard = {
      lines = {
        { id = "gu_default", text = "Clean streets, a uniform people saluted, and Major Samuelson drilling us at dawn. He trained me, and he's the best officer in the city." },
      },
      choices = {
        { text = "Can he get you home?", next = "samuelson" },
        { text = "Something else.", next = "BACK" },
      },
    },
    samuelson = {
      lines = {
        { id = "sa_default", text = "He's captain of the guard in the Keep now, and if anyone can get a man transferred, he can. So I write to him often, and very politely." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    naga = {
      big = true,
      lines = {
        { id = "na_default", text = "Marshal Redpath wants them dealt with, and so does High Command, according to my old mentor Major Samuelson. That means the man who deals with them gets noticed in Stormwind." },
      },
      choices = {
        { text = "So you'll fight the naga yourself, then.", next = "naga_deal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    naga_deal = {
      lines = {
        { id = "nd_default", text = "I will arrange for the naga to be fought by a capable volunteer, who might, by chance, be standing in front of me." },
      },
      choices = {
        { text = "Fine. Point me at them.", next = "BUSINESS", fx = { affinity = 2 } },
        { text = "Do your own fighting.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 } } },
      },
    },
    stormwind_news = {
      lines = {
        { id = "sn_default", text = "You were? Then tell me everything... no, wait, just one thing: do the lamps still come on along the canals at dusk?" },
      },
      choices = {
        { text = "Every evening.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "I didn't notice.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    push = {
      lines = {
        { id = "pu_default", text = "...You sound like Redpath, or worse, like Samuelson. Fine, fine! I'll go out tomorrow, probably." },
      },
      choices = {
        { text = "I'll hold you to it.", next = "BACK", reply = "Hold me to it, then, and I'll try not to disappoint you. Probably.", fx = { align = { honor = 1 }, trait = { stern = 1 } } },
        { text = "Probably will do, Farren. Nobody's counting.", next = "BACK", reply = "Bless you, a reasonable person at last. I'll tell Samuelson you said so.", fx = { align = { honor = -1 } } },
      },
    },
    reassign = {
      lines = {
        { id = "ra_default", text = "And? He'll 'take it into account', which is what they say in the Keep when they mean next month. It's always next month." },
      },
      choices = { { text = "Next month, then.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    strand_truth = {
      lines = {
        { id = "st_default", text = "All right, all right, keep your voice down! The first week here I went down to the Western Strand with my sword drawn, and a Torn Fin nearly had my leg off before I'd taken three steps, and I haven't been back since, because I'm not sure I could do it again." },
        { id = "st_paladin", when = { class = "PALADIN" },
          text = "Please don't write to anyone, paladin; I can see you're the type who would. The first time I went down to the strand a Torn Fin nearly took my leg, and I've been sitting in this chair ever since, telling myself it's strategy." },
      },
      choices = {
        { text = "Then come down with me next time.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    strand_bluff = {
      lines = {
        { id = "sb_default", text = "Samuelson already knows where I sit, since I write to him about it every week. Nice try, though, and very Stormwind of you." },
        { id = "sb_rogue", when = { class = "ROGUE" },
          text = "Threats, from you? I was City Guard, friend, and I know a cutpurse's bluff when I hear one." },
      },
      choices = {
        { text = "Have it your way, Lieutenant.", next = "BACK" },
      },
    },
    xnightelf = {
      lines = { { id = "xne_default", text = "Were they? Light, I'd rather not have known that. I've been telling myself they were some sort of fish with ambitions, and now I'll have to think of them as your cousins every time one comes up the shore." } },
      choices = {
        { text = "They're not cousins, they're traitors.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "Think of them as fish. It helps.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've picked up a few things, mostly by accident, from sitting in this chair. Ask, if you must." },
    },
    background = { { id = "tp_bg", text = "I'm Stormwind City Guard, temporarily posted elsewhere, very temporarily, I'm told.", next = "guard" } },
    advice = { { id = "tp_ad", text = "Never volunteer, because that's how I ended up here." } },
    scourge = { { id = "tp_scourge", text = "I'd rather fight the Scourge than murlocs, since at least the dead don't smell of fish. I've told the Marshal so, and he's told me to be careful what I wish for." } },
    forsaken = { { id = "tp_forsaken", text = "The dead up the hill are pushing into our farms one field at a time, and I'm stuck down here fighting fish. I'd swap my post for theirs in a heartbeat." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's got the best rum in the world, they say, and the worst pirates. I'd go, if I could get the Marshal to give me a month off." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. I've stopped learning things about Southshore, since it only encourages the place." } },
  },
}

P:NPC {
  key = "bilger", id = TODO_NPC("Brewmeister Bilger"), name = "Brewmeister Bilger",
  bible = "bibles/hillsbrad.md", role = "citizen", tier = "quest",
  communities = { "southshore" }, temper = { "rueful" }, values = { "honest" },
  notices = { "paladin", "drink", "lock_soulstone" },

  impression = {
    first = "He never drank as a knight, and has made up for it.",
    third = "{name} met Brewmeister Bilger in the Southshore cellar, a former knight of the Silver Hand who turned to brewing.",
  },

  greetings = {
    { id = "g_cellar", text = "Careful o' the casks, {g:lad|lass}, hic! They're older than you an' better behaved." },
  },

  notice = {
    { id = "n_paladin", cat = "paladin", when = { class = "PALADIN" },
      text = "A paladin, hic. I was one o' you once, Silver Hand, back when the Hand meant somethin'. Don't look at me like that; I know what I look like." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ah, ye've been at it too, hic! Good, for I hate drinkin' with sober folk; they count." },
    { id = "n_lock_soulstone", cat = "lock_soulstone", when = { aura = { 20707, 20762, 20763, 20764, 20765 } },
      text = "Ye've got yer soul tucked away in a stone, haven't ye? I can feel it on ye, hic. In the Hand we called a fallen man back with a prayer an' his own name, an' now folk carry a spare in a rock like a second pair o' boots." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "We didn't think, we knew: the Light was the one true thing, an' orc shamans were the enemy, hic. Then the Hand broke an' I found out I'd been sure about a lot o' things I'd never tasted, so if a dwarf can hear the earth, who am I to tell the earth it's wrong?" } },
      choices = {
        { text = "The Hand was right about one thing: faith needs rules.", next = "BACK", reply = "Rules, aye, an' I kept 'em all, an' look where they got me. Still, ye might be right, hic.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Certainty was the Hand's problem. Taste everything, I say.", next = "BACK", reply = "Now that's a philosophy I can drink to! Pour ye one an' we'll taste the whole cellar together.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "More than ye'd think! There's a bitter moss up by the Alterac falls that turns a plain ale into somethin' the Light itself would blush at. Course, I'm not supposed tae pick it, the ogres say, but I don't speak ogre, so who's to say?" } },
      choices = {
        { text = "Pick it sparingly, Bilger, and leave the rest to grow.", next = "BACK", reply = "Sparingly, aye, I suppose, though the moss doesn't know how good it tastes. I'll leave a bit for next season.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Take all you want. Moss grows back fast enough.", next = "BACK", reply = "That's what I tell meself every spring! The falls don't seem to mind, an' neither does the ale.", fx = { align = { order = -1 } } },
        { text = "Somethin' else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every mornin', for about as long as it takes to pour the first mug. I stood in the line beside men who'd have died for Uther, an' some did, an' the rest of us learned the Hand could be broken by one prince with a grudge." } },
      choices = {
        { text = "Your oath still matters, Bilger, even if the Hand is gone.", next = "BACK", reply = "It matters to me, hic, which is why I drink to forget it. Ye're kind to say it, though.", fx = { align = { light = 1 } } },
        { text = "Oaths are for fools. Steel and ale never lie to you.", next = "BACK", reply = "Steel an' ale, aye, an' only one of 'em ever let me down. I'll let ye guess which.", fx = { align = { light = -1 } } },
        { text = "Something else, Bilger.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Aye, I do! Jessen in the kitchen does the cookin', but I do the tastin', an' boar from the Alterac foothills goes down grand with a dark ale. Mind the Crushridge, though, because the ogres think the boar are theirs, an' they've no sense o' humour about it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Aye, I do! An' who's this, then, {pet}? Fine beast, but it'll get no ale from me, hic, for the last dog I gave a sip to tried to fight the cellar door." },
      },
      choices = {
        { text = "Give thanks for the hunt, Bilger. That's the old way.", next = "BACK", reply = "The old way, aye, an' I still do it, though I say it into the mug. The Light hears me all the same, I hope.", fx = { align = { light = 1 } } },
        { text = "Thanks for what? It's meat. Pour the ale and skip the prayer.", next = "BACK", reply = "Ha! Ye sound like me on a bad night. Pour the ale, then, an' I'll say the prayer quietly.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Trust is a strong word, lad, but cold ale is a stronger one, an' I've had worse in me cellar than a mage. When the Hand broke up, I swore I'd never take another oath, but I'll swear by a cold mug any day o' the week." } },
      choices = {
        { text = "You've earned a cold drink, old knight. I'll chill the keg.", next = "BACK", reply = "Now that's a kindness I'll not forget! I'll drink it slow, an' think of ye with every mouthful.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A broken oath is still broken. Drink won't fix it.", next = "BACK", reply = "No, it won't, but it makes the breakin' easier to bear, hic. Ye've a hard tongue for one so young.", fx = { align = { light = -1 } } },
        { text = "Something else, Bilger.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Every day, an' every night, so I drink. Uther believed every soul could be saved, an' I believed it with him, but then Arthas showed us what a soul can turn into, an' I never found the faith again." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Every day, an' every night, so I drink, an' havin' your demon starin' at me across the bar won't make me stop. Uther believed every soul could be saved, an' I believed it with him, but I never once believed it of a thing like that." },
      },
      choices = {
        { text = "Uther was right. Even a warlock can serve the Light.", next = "BACK", reply = "Ye think so? Uther would've agreed with ye, an' I'd like to, if I'm honest.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Faith is a crutch. Power is what saves people.", next = "BACK", reply = "Power didn't save Lordaeron, did it? I've seen what power does, an' I'll take me crutch, thank ye.", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Uther did, hic, an' he'd sit wi' a cutpurse in the stocks an' talk to him like a brother. I thought he was soft, an' then I found out the cutpurse fought beside us at Hearthglen an' died there, an' I've been less sure about a great many things ever since." } },
      choices = {
        { text = "Uther was right. Anyone can choose a better road.", next = "BACK", reply = "He'd have liked ye, I think. I'm glad someone still believes what he believed.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Uther was soft. A thief serves himself first.", next = "BACK", reply = "Maybe so, an' I thought the same, once. The cutpurse proved me wrong, an' I've never been so glad to be wrong.", fx = { align = { light = -1 } } },
        { text = "Something else, Bilger.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf who talks to storms instead o' the Light, hic! The old Hand would've had a fit, {class}, but I'm not the Hand anymore, so come an' tell me what the spirits think o' my stout." },
        { id = "h_default", key = true,
          text = "I'm Bilger, the brewmeister, hic. I used to be a knight o' the Silver Hand, strict as a church bell, never touched a drop. Then the Hand broke, an' I found out what I'd been missin', mostly Foggy MacKreel's moonshine." },
        { id = "h_moonshine", tags = { "news" }, when = { questActive = TODO_QUEST("MacKreel's Moonshine") },
          text = "MacKreel's moonshine! Now that's a brew, hic. Get me a jug an' I'll tell ye a story about Uther that'll curl yer hair." },
        { id = "h_brew", when = { metBefore = true }, text = "New batch, hic, an' smoother than the last. The old Hand would've had me flogged for it, but the old Hand's gone an' the batch is here." },
        { id = "h_paid", when = { questDone = TODO_QUEST("MacKreel's Moonshine") },
          text = "Foggy paid up, hic, in moonshine, which is the only coin he's got, an' the best one." },
        { id = "h_night", when = { timeOfDay = "night" },
          text = "It's the night shift in the cellar, hic. The casks talk at night, ye know, an' mostly they say 'more'." },
        { id = "h_xsilverhand", when = { origin = "dwarf_silver_hand" },
          text = "Ye've the look o' a dwarf who knelt before Uther, same as I did, hic, an' ye're still sober, which is more than I can say. Sit doon, brother, an' don't tell the others what I used to be." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage, hic! Ye wouldn't be able to chill a keg, would ye? The cellar gets warm in summer, an' warm ale is a sin even I won't forgive." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock, hic, in me inn. In the old days, the Hand would've had ye in irons, an' now I'll just ask ye to keep the imp away from me barrels." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, hic, an' a proper one by the dents! I carried a hammer for the Hand once, an' I'll tell ye now, plate's heavier when ye've nothin' left to believe in." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, hic! Bring me somethin' wild for the pot an' I'll pour ye somethin' that'll make ye forget ye ever shot it." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "Hic! A druid, an' a night elf one at that. Ye don't, by chance, turn into a bear that drinks, do ye? I've been wantin' a proper drinkin' companion." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue, hic, an' I'll warn ye now: the good casks are the ones ye can't lift, so don't bother. The knights o' the Hand used to say a thief's hands were the Light's hardest work." },
        { id = "h_dd_tornfin", when = { killed = { name = "Torn Fin", min = 30 } },
          text = "Ye've been at the murlocs down the shore, hic, an' I can smell it from here. Sit down, an' have a drink that tastes of somethin' other than fish." },
      },
      again = {
        { id = "h_again", text = "Hic. What else, {g:lad|lass}?" },
        { id = "h_again2", text = "Go on, I'm listenin', to you an' the casks both, an' by this hour the casks make more sense." },
      },
      choices = {
        { text = "What happened to the Silver Hand?", next = "hand" },
        { text = "You might ease off the brew a little.", next = "ease" },
        { text = "Who's this MacKreel?", next = "foggy" },
        { text = "The Light hasn't left you, brother.", next = "paladin", when = { class = "PALADIN" } },
        { text = "I squired for the Silver Hand before it broke.", next = "squire", when = { origin = "human_paladin_squire" } },
        { text = "The Light forgives, Bilger.", next = "priest", when = { class = "PRIEST" } },
        { text = "I didn't know the Silver Hand took dwarves.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Would you really trust a mage near your cellar, Bilger?", next = "xmage", when = { class = "MAGE" } },
        { text = "You must miss the Silver Hand, Bilger.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do you miss carrying a hammer for the Silver Hand, Bilger?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do you want game for the inn's kitchen, Bilger?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'd guess a brewer knows little of wild herbs, Bilger.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Did the Silver Hand really think thieves could be saved, Bilger?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What did the Silver Hand think of shamans, Bilger?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Cheers.", next = "END" },
      },
    },
    hand = {
      big = true,
      lines = {
        { id = "h2_default", text = "Uther died, an' it was Arthas did it, hic. The rest of us scattered like rabbits: some kept the faith an' some found a cellar, an' I'm no' proud of which one I am." },
      },
      choices = {
        { text = "It's not too late to go back.", next = "back", fx = { affinity = 2 } },
        { text = "I understand.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    back = {
      lines = { { id = "b_default", text = "...Maybe, hic. Ask me again when I'm sober, an' bring breakfast, for it'll be a while." } },
      choices = {
        { text = "I mean it, Bilger.", next = "back_more" },
        { text = "Something else.", next = "BACK" },
      },
    },
    back_more = {
      lines = {
        { id = "bm_default", text = "I know ye do, an' that's what frightens me, hic. Come back in a month an' ask again, an' maybe I'll have an answer, or maybe a new batch." },
      },
      choices = {
        { text = "I'll ask.", next = "BACK", reply = "Ye will? Then come back, an' bring a thirst. I'll have somethin' new to try.", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Maybe the cellar's where you belong, Bilger.", next = "BACK", reply = "Maybe it is, hic. Leastways, the cellar's never asked me why I left.", fx = { align = { light = -1 } } },
      },
    },
    ease = {
      lines = { { id = "e_default", text = "Ease off? I'm a brewmeister! It's research, hic, very serious research." } },
      choices = {
        { text = "Research into what?", next = "brew" },
        { text = "Ha.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    brew = {
      lines = { { id = "bw_default", text = "Barley, hops, an' forgettin'. Two o' the three are goin' very well." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    foggy = {
      lines = {
        { id = "fg_default", text = "Foggy MacKreel, one o' Longbraid the Grim's lads, up on the broken Thandol Span. He owes me money an' pays in moonshine when he remembers, which is less often than ye'd hope." },
      },
      choices = {
        { text = "Is his moonshine any good?", next = "moonshine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    moonshine = {
      lines = { { id = "ms_default", text = "Good, hic? It'd strip the paint off a church door, an' I'd know, for I've tried." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    paladin = {
      big = true,
      lines = {
        { id = "pa_default", text = "Has it no', hic? Then it's patient, I'll give it that. Go on, ask me who trained me... no, don't, I'd only miss it more." },
      },
      choices = {
        { text = "You can still come back to it.", next = "BACK", reply = "Ye think so? I'd like to believe it, if only for tonight.", fx = { affinity = 2, align = { light = 2 } } },
        { text = "Some oaths stay broken, and yours might be one of them.", next = "BACK", reply = "Aye, maybe it is, an' I knew it before ye said it. Pour me another, would ye?", fx = { align = { light = -2 } } },
        { text = "I won't ask.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    squire = {
      lines = {
        { id = "sq_default", text = "A squire, hic. Then ye knew it at its best, or near enough, an' I'm sorry ye saw it end. Sit a minute, but no' on that cask; that one bites." },
      },
      choices = {
        { text = "Tell me about the old days.", next = "squire_days" },
        { text = "Something else.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    squire_days = {
      lines = {
        { id = "sd_default", text = "Up before the sun for prayers, then drill, then prayers again, an' no ale, no cards an' no excuses. Hic, I'd give the whole cellar to have one of those mornings back." },
      },
      choices = {
        { text = "So would I.", next = "BACK", reply = "Ye would? Then we'd be two old fools missin' the same thing.", fx = { affinity = 3, align = { light = 1 } } },
        { text = "I'd keep the ale and the cards, myself.", next = "BACK", reply = "Ha! Ye'd have been a terrible squire, but a grand drinkin' partner.", fx = { align = { light = -1 } } },
      },
    },
    priest = {
      lines = {
        { id = "pr_default", text = "Does it, hic? It's no' the Light I'm worried about, it's me, for I'm the harder judge." },
      },
      choices = {
        { text = "Then go easier on the judge.", next = "BACK", reply = "Easier, aye, an' I'll try. The Light's been easier on me than I have, at least.", fx = { affinity = 2, align = { light = 1 }, trait = { kind = 1 } } },
        { text = "Judge yourself hard, then. You've earned it.", next = "BACK", reply = "Aye, I have, an' I do. Every night, wi' a mug in me hand.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf = {
      lines = {
        { id = "dw_default", text = "Aye, a few of us. The Light never asked our height, hic, but the armourers did, an' ye've no idea what it costs to have plate taken in." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Ask away, friend, hic, an' I'll tell ye what I remember, which is more'n ye'd think an' less'n I'd like." },
    },
    silver_hand = { { id = "tp_hand", text = "Ask me sober, hic... no, ask me now, for I only lie when I'm sober.", next = "hand" } },
    background = { { id = "tp_bg", text = "First a paladin, then no' a paladin, an' now a brewmeister, hic. It's a short story wi' a long middle.", next = "hand" } },
    advice = { { id = "tp_ad", text = "Drink slow, pray quick, an' never trust a dwarf who says he's had enough, hic, because he's lyin'." } },
    holy_light = { { id = "tp_holy_light", text = "I served the Light in plate and never touched a drop, and now I serve ale and touch every drop. The Light hasn't complained yet, so I'll take that as approval." } },
    scourge = { { id = "tp_scourge", text = "I fought the dead before the Silver Hand broke, and I'll tell you they don't stop, and they don't sleep, and they don't drink. I can't think of anything worse than that." } },
    arthas = { { id = "tp_arthas", text = "Arthas was one of us once, a paladin of the Silver Hand, and Uther's own student. I don't speak of what he became, and I'll pour you something strong if you make me." } },
    _none = { { id = "tp_none", text = "Dunno, hic. Ask me again after the next cask." } },
  },
}

P:NPC {
  key = "dibbs", id = TODO_NPC("Loremaster Dibbs"), name = "Loremaster Dibbs",
  bible = "bibles/hillsbrad.md", role = "scholar", tier = "quest",
  communities = { "southshore" }, temper = { "dry" }, values = { "curious", "careful" },
  notices = { "lore", "lock_shards" },

  impression = {
    first = "He talks about the old kingdom's books like lost friends.",
    third = "{name} met Loremaster Dibbs, who collects the scattered knowledge of the old kingdom in Southshore.",
  },

  greetings = {
    { id = "g_books", text = "If you've come about the books, sit. If you've come about anything else, sit anyway; I'll get to the books." },
    { id = "g_xrefugee", when = { origin = "human_lordaeron_refugee" }, text = "You were born up north, weren't you? I can hear Lordaeron in your vowels, even after all those years in Stormwind, and I've books on the old kingdom you might want before you go looking for it." },
  },

  notice = {
    { id = "n_book", cat = "lore", when = { bookRead = "The Seven Kingdoms" },
      text = "The Seven Kingdoms, good! Then you know Alterac was one of them once, and most of its library is now ogre bedding." },
    { id = "n_lock_infernal", cat = "lock_shards", when = { class = "WARLOCK", carrying = 5565 },
      text = "There's a stone in your pack that smells like the night the burning rocks fell on Dalaran. One of my Alterac texts describes a stone just like it, and the writer's hand stops shaking on the very next page, because there is no next page." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I'd like to, if you'll sit still for it, because history has a habit of forgetting the first of anything. The old kingdom's scribes wrote down every orc shaman's curse in the Second War and never once asked what the elements thought of it, and I don't mean to make the same mistake." } },
      choices = {
        { text = "Write it plainly. Truth should be kept for those who come after.", next = "BACK", reply = "Plainly is the only way I know how. Sit down, then, and I'll fetch my good quill.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some things shouldn't be written down. Let the spirits keep them.", next = "BACK", reply = "I'll respect that, though it pains a loremaster to hear it. Some things, I suppose, belong to the spirits.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Very little, I'm afraid, for Arathor's scholars thought the forest was a thing to be cleared. There's one fragment about sacred groves in Lordaeron's north, before the cities came, but the ogres used most of that scroll to light a cookfire." } },
      choices = {
        { text = "Then that knowledge was lost because men chose cities.", next = "BACK", reply = "Yes, and it's one of history's quieter tragedies. I'll keep looking for that fragment.", fx = { align = { order = -1 } } },
        { text = "Arathor needed cities. You can't hold a kingdom in groves.", next = "BACK", reply = "They needed cities, I'll grant you, but they could have written down what they cleared away. A loremaster always wishes for more.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else, Loremaster.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I'd be in your debt, though I'll warn you that ogres defend their kindling as fiercely as a dwarf defends his beer. Anything bearing the Perenolde seal, please bring back even if it's half ash, because half a page is still a page." } },
      choices = {
        { text = "Alterac's records should be kept, traitor's seal or not.", next = "BACK", reply = "They should, and I'll keep them all, Perenolde seal and all. Lies tell you as much as truth, sometimes.", fx = { align = { order = 1 } } },
        { text = "Let the Perenolde lies burn. Some history deserves the fire.", next = "BACK", reply = "Let them burn? A loremaster's nightmare, that! Bring them to me first, and we'll decide together.", fx = { align = { order = -1 } } },
        { text = "Something else, Loremaster.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A surprising amount, since the old Alterac nobles loved their hunts more than their kingdom and wrote down every stag like a battle won. I found a hunting ledger last month that listed more kills than the treasury listed coins, which tells you something about how Alterac was run." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "A surprising amount, but first, is {pet} trained not to chew paper? I ask because the last hunter's dog ate the third chapter of a treatise on Strom's founding, and I still dream about it." },
      },
      choices = {
        { text = "That ledger belongs in a proper library, kept and catalogued.", next = "BACK", reply = "It does, and I'll catalogue it myself. Even a noble's vanity tells us something about his kingdom.", fx = { align = { order = 1 } } },
        { text = "A noble's hunting tally isn't worth the ink. Burn it.", next = "BACK", reply = "Burn it? It tells us which forests were thick with stags before the war. Bring it to me, I beg you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Orders, mostly, from the years Lordaeron's soldiers held Alterac after Perenolde's treachery, and some of them make hard reading. A few bear the Silver Hand's own seal, and I keep those apart from the rest, because I can't quite bear to file them away." } },
      choices = {
        { text = "Keep them safe. The order's record deserves to survive.", next = "BACK", reply = "They will, as long as I have breath and a dry shelf. The Hand deserves at least that much.", fx = { align = { order = 1 } } },
        { text = "Burn the hard ones. Some orders shouldn't be remembered.", next = "BACK", reply = "Burn them? Then nobody would learn from them, and somebody else would give the same orders. I keep them all.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Prayer books, mostly, and the rolls of christenings and burials, which mean more to me than any spellbook. When Alterac fell, nobody thought to save the parish rolls, and now whole families have nothing left to say they ever lived." } },
      choices = {
        { text = "Those names belong in the Light's keeping. Save every one.", next = "BACK", reply = "Every one, and I'll copy them twice. Those names were people once, and nobody else remembers them.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let old names go. The living need the shelf room.", next = "BACK", reply = "Shelf room? I'd sleep in the street before I burned a christening roll. You'll not change my mind.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Rarely, because most thieves can't imagine anyone paying for paper, but the Syndicate once took a whole crate thinking it held Alterac deeds. I found half of it in an ogre camp being used as kindling, which was a bitter day." } },
      choices = {
        { text = "I'll recover what I can from the ogres. History deserves saving.", next = "BACK", reply = "Thank you, truly. The ogres don't read, so whatever you bring back will at least be unspoiled by scholarship.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Old books burn the same as new. Let the past go.", next = "BACK", reply = "Burn the same, yes, but they don't remember the same. I'll keep fighting for my books, if no one else will.", fx = { align = { order = -1 } } },
        { text = "Something else, Loremaster.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Old Alterac texts on summoning and binding, written in a hand that grew shakier the farther I read. I think the author learned more than he wanted, and I won't be the one to finish his research, no matter what you offer." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Old Alterac texts on summoning and binding, and one of the bindings would hold a thing very like your servant, which is why I'd rather it stopped reading over my shoulder. The author learned more than he wanted, and I won't be the one to finish his research, no matter what you or it might offer." },
      },
      choices = {
        { text = "Forbidden knowledge is still knowledge. Don't let it rot.", next = "BACK", reply = "I'd agree, if I hadn't watched the author's hand shake on the page. They're locked in the back, and there they'll stay.", fx = { align = { light = -1 } } },
        { text = "Then keep them locked. Some books should never be opened.", next = "BACK", reply = "That's where they are, behind two locks and a very heavy dictionary. I'll sleep easier knowing you agree.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman, of all things? I've three books on Ironforge's lore and not one of them mentions you, {class}, which means either the books are wrong or you're about to be very interesting." },
        { id = "h_default", text = "I'm Dibbs. I collect what's left of the old kingdom's knowledge before the ogres finish using it to start their fires, and it's slow work, for they're quick readers, in their way." },
        { id = "h_milton", when = { heardLine = "milton.h_default" },
          text = "Milton Sheaf, in Ironforge, sent you? Of course he did, bless him. Tell him I've three crates of Alterac's records waiting, and one of them is mostly soot." },
        { id = "h_preserve", tags = { "news" }, when = { questActive = TODO_QUEST("Preserving Knowledge") },
          text = "Books still lie in the ruins of Alterac, and the ogres have been at them. Bring me whatever you can save, and handle it gently." },
        { id = "h_parchment", when = { questActive = TODO_QUEST("The Ensorcelled Parchment") },
          text = "This parchment has magic woven through it, so don't fold it and don't read it aloud... actually, don't read it at all." },
        { id = "h_page", when = { metBefore = true }, text = "I saved three whole pages from an ogre's cookfire yesterday, and they turned out to be a treatise on beekeeping. It's not what I'd hoped, but it's knowledge all the same." },
        { id = "h_stormpike", when = { questActive = TODO_QUEST("Letter to Stormpike") },
          text = "Prospector Stormpike in Ironforge will crow about this cipher for a month, and I'll let him, since he'll actually read it, which is more than the last cipher got." },
        { id = "h_milton_done", when = { questDone = TODO_QUEST("Return to Milton") },
          text = "Milton wrote to thank me, three pages of it, and two of them were about the bindings." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You have very careful hands, which is a fine quality in someone who handles old books, though I'll ask you to keep them off the ones I haven't catalogued yet." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. You'll be interested in a few books I've found in the hills, I suspect, and I'll tell you now that I've locked them away because I don't want anyone interested in them." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Then you'll be glad to hear I saved a whole psalter from an ogre's fire last week, though half of it is singed and the rest smells of mutton." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! I've a pile of old Silver Hand writs from the hills, and I'd dearly love someone to tell me what half the seals mean." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior. Good, because the Crushridge ogres have three more crates of Alterac's library at their camp, and I can't very well read them out of the fire." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter. You'll be out in the hills more than I am, then, and if you see loose pages blowing about the ogre camps, I'd count it a great kindness if you'd pick them up." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! The old Arathorian scrolls mention your people, you know, though always as a rumor from over the sea. It's a pleasure to find the rumor standing in my doorway." },
        { id = "h_dd_plague", when = { questDone = TODO_QUEST("Hints of a New Plague?") },
          text = "Phin Odelic tells me you found papers suggesting the Forsaken are brewing something new at Tarren Mill. I've added it to my notes, though I confess I'd rather be recording beekeeping." },
      },
      again = {
        { id = "h_again", text = "Another question? Good, for questions are the only thing I collect faster than books." },
        { id = "h_again2", text = "Go on, I'll mark my place with a herring, apparently, since someone's been using my bookmarks for kindling." },
      },
      choices = {
        { text = "I'd guess the ogres weren't kind to your books.", next = "ogres" },
        { text = "What are you looking for, exactly?", next = "grilek" },
        { text = "Can you read old ciphers too?", next = "ciphers" },
        { text = "You could go to the ruins yourself.", next = "climb" },
        { text = "I could help with your enchanted parchments.", next = "mage", when = { class = "MAGE" } },
        { text = "I came out of Lordaeron myself.", next = "refugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "Do thieves ever come after your books, Loremaster?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What sort of books did you find in the hills, Loremaster?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What holy books did Alterac's chapels keep, Loremaster?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Silver Hand writs from Alterac? What do they say?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I could fight the ogres for your books, Loremaster.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Does Alterac's history say anything about hunting, Loremaster?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I doubt the old kingdom knew much of druids.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would you write me into your books, Loremaster?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good luck with the books.", next = "END" },
      },
    },
    ogres = {
      lines = { { id = "o_default", text = "They burned some, sat on others, and used a history of the Alterac succession to prop up a table. The table's never stood steadier, and the history deserved it." } },
      choices = {
        { text = "These books seem to matter a lot to you.", next = "why_books" },
        { text = "Ha.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    why_books = {
      lines = {
        { id = "wb_default", text = "Alterac kept what the other kingdoms didn't bother to write down. Lose it, and we lose the part of history that embarrassed people, which is usually the useful part." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    grilek = {
      big = true,
      lines = {
        { id = "gr_default", text = "One book above all, the Arm of Gri'lek, which holds old troll lore. The last intact copy anyone knew of sat in Alterac's library." },
      },
      choices = {
        { text = "Why troll lore?", next = "grilek_why" },
        { text = "I'll look for it.", next = "BUSINESS", fx = { affinity = 2 } },
      },
    },
    grilek_why = {
      lines = {
        { id = "gy_default", text = "Because the trolls were in these hills long before Arathor, and nobody ever asked them what they knew. Also, I'm curious, and curiosity is most of scholarship." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    ciphers = {
      lines = {
        { id = "ci_default", text = "The plain ones, yes, but not the clever ones; those go to Prospector Stormpike in Ironforge. He's had three crates from me since spring." },
      },
      choices = {
        { text = "Is he any good?", next = "stormpike" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stormpike = {
      lines = {
        { id = "sp_default", text = "He's insufferable, and the best reader of ciphers north of Blackrock Spire. He calls me an old bookworm, and he's not wrong." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "explorers_league" } } } },
    },
    climb = {
      lines = {
        { id = "cl_default", text = "Look at me. These bones wouldn't survive the climb, and the ogres would use what's left for a bookmark." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    mage = {
      lines = {
        { id = "ma_default", text = "Could you? Then please don't read anything aloud. Alterac's mages wove spells into the very ink, and I'd like to keep my eyebrows." },
      },
      choices = { { text = "No promises.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } } },
    },
    refugee = {
      lines = {
        { id = "rf_default", text = "Then tell me, did anyone carry books out of the north? Anyone at all?" },
      },
      choices = {
        { text = "Only what we could carry.", next = "BACK", fx = { affinity = 2 } },
        { text = "We carried children, not books.", next = "refugee_children" },
      },
    },
    refugee_children = {
      lines = {
        { id = "rc_default", text = "...Yes, of course you did. Forgive an old man his priorities; the books can wait, as they always have." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've catalogued most of what this valley used to know. Ask about any of it, and I'll tell you what survived the ogres." },
    },
    alterac = { { id = "tp_alterac", text = "Alterac had a whole library, and it's lost under ogres now. I could weep, and I have.", next = "why_books" } },
    background = { { id = "tp_bg", text = "I gather what Alterac left behind, for Milton Sheaf and the Royal Library in Ironforge. Before that I read, and I still do.", next = "grilek" } },
    advice = { { id = "tp_ad", text = "Wash your hands before you touch a book, and after you touch an ogre, ideally twice." } },
    seven_kingdoms = { { id = "tp_seven", text = "There were seven, until Alterac sold itself to the Horde and stopped being one. The books remember, though the ogres are working on that." } },
    lordaeron = { { id = "tp_lordaeron", text = "Lordaeron's histories burned with its cities, and I'm saving what I can from the ogres' cookfires. Every book I pull out of Alterac is a little piece of the old kingdom that didn't die." } },
    dalaran = { { id = "tp_dalaran", text = "Dalaran's libraries were the greatest in the world, and Archimonde burned most of them. The Kirin Tor are rebuilding, and I'd give my left hand to see what they saved." } },
    second_war = { { id = "tp_second_war", text = "The Second War was fought right over these hills, and the Horde came close to taking Southshore. I've a book of the fighting that I'll lend to anyone who'll bring it back." } },
    stratholme = { { id = "tp_stratholme", text = "Stratholme had a library to rival Dalaran's, before the prince put it to the torch. Somebody in the Argent Dawn tells me some of the shelves still stand, and I don't sleep for thinking about it." } },
    _none = { { id = "tp_none", text = "It's not in anything I've saved, which isn't to say it isn't in something I haven't." } },
  },
}

P:NPC {
  key = "anderson", id = TODO_NPC("Innkeeper Anderson"), name = "Innkeeper Anderson",
  bible = "bibles/hillsbrad.md", role = "innkeeper", tier = "service",
  communities = { "southshore" }, temper = { "steady" }, values = { "practical" },
  notices = { "weary", "lock_shadow" },

  impression = {
    first = "He admits every corner of his roof leaks, which is honest enough.",
    third = "{name} took shelter at the Southshore inn, kept by Innkeeper Anderson, where the rain finds every corner.",
  },

  greetings = {
    { id = "o_hand_keep", tags = { "news" }, when = { gossip = { topic = "silver_hand", stance = { "keep", "restore" } } },
      text = "The Marshal says you'd see the Silver Hand raised again. The old knights in the corner heard it too, and two of them have polished their gauntlets since, which they haven't done in years." },
    { id = "o_varian_dead", tags = { "news" }, when = { gossip = { topic = "varian", stance = "dead" } },
      text = "Lieutenant Orinelle's been sulking worse than usual since you told him King Varian's dead and gone. I'd go easy on him for a day or two; he's a Stormwind lad, after all." },
    { id = "g_inn", text = "Shut the door, the rain gets in. Is it a bed, food or both? Both, by the look of you." },
    { id = "g_home", when = { homeInn = { "Southshore" } }, text = "Your room's dry, mostly, though the corner leaks. All the corners leak, and the ceiling's starting to think about it." },
    { id = "g_away", when = { away = 14 }, text = "Come in and shut the door, because it's been {away} and the rain hasn't stopped once in all that time. Your room's still there, and so is the leak." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown into your boots since you last stayed, and I don't mean your feet. Sit down, and I'll find you the room that leaks the least." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Folk in the common room have been saying you did right by Southshore. The first mug's on the house, then, though only the first." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "Up against the Syndicate, were you, or the ogres? Sit down and have some fish stew; it's always fish stew, this being a fishing town." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "Every candle in the common room just leaned away from the door, and the fishermen by the fire have gone quiet over their cups. Rooms are upstairs, and I'll open the window in yours before you have to ask." },
  },

  start = "hello",
  nodes = {
    dd_syndicate = {
      lines = { { id = "dd_syndicate_default", text = "Less than it did, thanks to you, but the Syndicate's like damp in a cellar: you scrub it out and it creeps back in from the hills. They're Alterac's old nobles and their hired knives, and they've never forgiven anyone for anything." } },
      choices = {
        { text = "Then they'll find me waiting every time they creep back.", next = "BACK", reply = "I'll drink to that, and so will the room. Mind the hill roads after dark, though; they know your face now.", fx = { align = { order = 1 } } },
        { text = "Every town has its knives. Southshore just has fancier ones.", next = "BACK", reply = "Ha! Don't say that where the Magistrate can hear, but you're not wrong. There's knives behind half the doors on the Alterac road.", fx = { align = { order = -1 } } },
        { text = "Something else, Anderson.", next = "BACK" },
      },
    },

    xpt_inn = {
      big = true,
      lines = { { id = "xpt_inn_default", text = "More than they used to, now that the Forsaken sit in Tarren Mill and the Syndicate sit in Alterac, and everyone wants a soft bed between the two. Most of them are good for trade and a few are good for nothing, and I can usually tell which by how they treat the serving girl." } },
      choices = {
        { text = "We'll treat your house well, Innkeeper. You have my word.", next = "BACK", reply = "I'll hold you to it, and so will Neema. She's fiercer than I am about the furniture.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A company that's paid its coin keeps its own rules.", next = "BACK", reply = "Your own rules, perhaps, but my roof. Break anything and you'll pay for it, company or no.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "There's always one who mutters, mind, but I've had dwarves through here from Dun Garok for as long as I've kept the place, and most of them talked to their ale more than to any spirit. So you're an improvement, as far as I'm concerned." } },
      choices = {
        { text = "Let them mutter. I'll answer them to their faces.", next = "BACK", reply = "Good, that's the way to handle it. They usually go quiet once you look them in the eye.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let them mutter. I'll quietly sour their ale.", next = "BACK", reply = "Sour their ale? Not in my house, friend; the ale's the one thing I take pride in. Find another way.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I'd guess it's the noise, the fish smell and the soldiers, though I'm biased toward the fish. One of yours stayed a week last summer and spent every evening out by the shore, talking to the turtles, and I never did find out what they said back." } },
      choices = {
        { text = "Turtles are good company. Better than soldiers, some nights.", next = "BACK", reply = "Better than soldiers, aye, and quieter. Though the turtles don't pay for their rooms.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A town needs soldiers. The turtles won't stop the Forsaken.", next = "BACK", reply = "No, they won't, more's the pity. I'll keep my rooms for the soldiers, then, and leave the turtles the beach.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Every patrol that comes back from the Tarren Mill fields, and they sleep with their boots on, which is hard on the blankets. The lieutenant's the only soldier who ever asked for the good chair, and he's never once given it back." } },
      choices = {
        { text = "Soldiers should keep their boots on. The Forsaken don't wait.", next = "BACK", reply = "They say the same thing, and I'll stop arguing. I'll buy more blankets instead.", fx = { align = { order = 1 } } },
        { text = "Let them take their boots off. They've earned a night's peace.", next = "BACK", reply = "I've told them that, and they look at me like I'm mad. You tell them; they might listen to someone with a sword.", fx = { align = { order = -1 } } },
        { text = "Something else, Anderson.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I'd buy anything that isn't fish, since the guests have started complaining that they can taste the bay in the bread. Bear from the foothills, perhaps, if you can bring it down without bringing a Syndicate patrol back with you." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I'd buy anything that isn't fish, and your {pet} can sleep by the hearth between hunts, since it's the one dry spot in the house. Just don't let it near the lieutenant's chair, or he'll file a complaint, and he files them very slowly." },
      },
      choices = {
        { text = "Pay hunters a fair price. They keep this town fed.", next = "BACK", reply = "I always do. A hunter who's paid fair brings me the good cuts and not the gristle.", fx = { align = { honor = 1 } } },
        { text = "Haggle hard. Hunters take what they can get these days.", next = "BACK", reply = "I could, but then they'd sell to Neema's cousin instead. I'll pay fair and keep my bread fishless.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because he was one himself, and he hasn't forgiven himself for putting the hammer down. He'll pour you an ale and tell you about it if he's in the mood, but I'd go gently, for he's carried it a long while." } },
      choices = {
        { text = "A knight who falls can rise again. I'll tell him so.", next = "BACK", reply = "He'd like to hear it, I think, though he'll argue with you over a mug. Tell him anyway.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Some vows are broken for good. Let him be.", next = "BACK", reply = "Maybe you're right, but I'll keep pouring him ale and hope otherwise. He was a good man, once.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Family in Hillsbrad Fields, mostly, and friends from the farms the plague took before the Forsaken moved in. They don't talk of it unless they've had a few, and then they don't talk of anything else, so I keep the mugs full and listen." } },
      choices = {
        { text = "Grief should be spoken aloud. I'll sit with them.", next = "BACK", reply = "That's kind, and they'd be grateful for it. Some of them have never told anyone.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Some grief is best left in the mug.", next = "BACK", reply = "It's been in the mug for years, friend, and it's not got any lighter there. Still, I'll not push them.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "A fair bit, since Southshore's close enough to the Syndicate's hills that some folk come down to sell what they've found. I don't ask questions, and they don't make trouble, and the lieutenant's too busy with murlocs to notice either way." } },
      choices = {
        { text = "Not asking questions is a fine policy. I'll follow it.", next = "BACK", reply = "Then you'll fit in well here. Southshore's always been quiet about what comes up from the hills.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "You should report them. The Magistrate needs to know.", next = "BACK", reply = "Report them? Half of them would end up in Maleb's cells, and I'd lose my best customers. I'll think on it.", fx = { align = { order = 1 } } },
        { text = "Something else, Anderson.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because every time I patch one leak, the rain finds another, and the carpenters are all busy shoring up the farms against the Forsaken. I've started to think the roof's just tired, and I can't say I blame it." } },
      choices = {
        { text = "I'll lend a hand with the roof. Magic isn't everything.", next = "BACK", reply = "Would you? I'd be grateful, and I'll find you a hammer. The rain's not stopped for a week.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A leaky roof is the innkeeper's problem, not mine.", next = "BACK", reply = "Fair enough, it is my problem. I'll keep my buckets and you keep your coin.", fx = { align = { light = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "One or two a season, coming down from Dalaran's way or up from Stormwind on some business they won't name. They pay on time and tip better than the soldiers, I'll give them that, but the room always smells of sulphur after, and the fishermen won't take it for days." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "One or two a season, and they mostly have the decency to leave their companions outside, unlike some I could name. They pay on time and tip better than the soldiers, but I can smell sulphur on the stair already, so if {pet} stays the night it stays on the floor." },
      },
      choices = {
        { text = "I'll leave the room as I found it, Anderson.", next = "BACK", reply = "Thank you. The last one left a smell in the walls, and the fishermen still complain.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The fishermen can sleep somewhere else, then.", next = "BACK", reply = "Not in my inn, they can't. I'll find you a room at the far end, if you don't mind the draught.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_inn", tags = { "news" }, when = { party = { size = 4 }, faction = "Alliance" },
          text = "A whole company at once! Let me guess: you'll want the long table and five bowls of the chowder, and I'll warn you now that we've only three rooms left." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, and a dwarf! If you've any pull with the rain, {class}, I'd take it kindly if you'd ask it to fall somewhere other than through my roof." },
        { id = "h_default", text = "Anderson's the name, and I keep the inn: fishermen, soldiers, and a lieutenant who's been sitting in that chair since last spring." },
        { id = "h_bilger", when = { heardLine = "bilger.h_default" },
          text = "Bilger told you he was a paladin? He was, and a good one, folk here say. I keep the cellar unlocked for him, because somebody should be kind to him." },
        { id = "h_chair", when = { metBefore = true }, text = "Lieutenant Farren asked for his usual, and I didn't have to ask what. That's either a good inn or a sad story, or both, maybe." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Fishermen come in at this hour smelling of the bay, so I keep the windows open, out of habit more than anything." },
        { id = "h_refugee", when = { origin = "human_lordaeron_refugee" },
          text = "Up from the north? There's a bed for you, and you can pay when you can; Marshal Redpath would have my hide if I turned you away." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "You came in without the door creaking, and that door creaks for everybody, so I'll guess you're the quiet sort with quiet business. Just pay for your room and we'll get on." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Don't suppose you could do something about the leaks? Every corner drips when it rains, and it always rains in Hillsbrad." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, and you're welcome, because half my customers have someone they lost up north. If one of them asks you to sit a while, I'd count it a kindness." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin under my roof! Bilger will either be thrilled or hide in the cellar, and I couldn't tell you which." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and dripping on my floor like everyone else. Hang that mail by the fire, will you, because rust and rain are the two things Southshore has more of than fish." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, and you've brought in more mud than the rain did. Wipe your boots, and tell me what's out in the hills, because nobody else will." },
        { id = "h_druidcl", when = { race = "NightElf", class = "DRUID", faction = "Alliance" }, text = "A druid, is it? Most night elves who come through just want a room and a quiet corner, and you look like you'd sooner sleep under a tree." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock, is it? I'll rent you a bed like anyone else, but I'll ask you to keep whatever you've got on a leash off the stairs, because the last time a guest's pet got loose, Barkeep Kelly didn't sleep for a week." },
        { id = "h_dd_crushridge", tags = { "news" }, when = { questDone = TODO_QUEST("Crushridge Bounty") },
          text = "The Marshal stood a round for the whole common room after you came back from the Crushridge hills, and that man doesn't stand rounds. Whatever you did to those ogres, it put him in a rare good mood." },
        { id = "h_dd_assassins", when = { questDone = TODO_QUEST("Syndicate Assassins") },
          text = "The Magistrate's been sleeping with his shutters open again, he tells me, ever since you dealt with those Syndicate cutthroats in the hills. Folk in Southshore notice a thing like that." },
      },
      again = {
        { id = "h_again", text = "Anything else? The stew's hot and the chairs are dry, mostly." },
        { id = "h_again2", text = "Go on. I'm only wiping the same mug." },
      },
      choices = {
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Your common room has a mixed crowd.", next = "regulars" },
        { text = "Any news from the road?", next = "news" },
        { text = "Do you get many quiet customers at the inn, Anderson?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why not just fix the roof, Anderson?", next = "xmage", when = { class = "MAGE" } },
        { text = "Who do your customers mourn, Anderson?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Why would Bilger hide from a paladin, Anderson?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Your inn seems full of soldiers, Anderson.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Your kitchen could use some game, Anderson.", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Why do so few of my people stay in Southshore?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "I'd guess few warlocks sleep under your roof, Anderson.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do your guests mind a dwarf who talks to the elements?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Do companies like ours come through Southshore often?", next = "xpt_inn", when = { party = { size = 4 }, faction = "Alliance" } },
        { text = "Just resting.", next = "END" },
        { text = "Does the Syndicate still frighten Southshore, Anderson?", next = "dd_syndicate", when = { questDone = TODO_QUEST("Syndicate Assassins") } },
      },
    },
    regulars = {
      lines = {
        { id = "rg_default", text = "Fishermen, Marshal Redpath's guards off duty, the lieutenant in his chair, and Bilger down in the cellar. They all pay, though Bilger pays in brew." },
      },
      choices = {
        { text = "What's the lieutenant's usual?", next = "farren" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farren = {
      lines = {
        { id = "fa_default", text = "Ale, and a seat facing the door, in case it's a messenger from Stormwind. It never is, but I bring the ale anyway." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    news = {
      lines = {
        { id = "nw_default", text = "Horses are going missing from the stables again. Some say the Syndicate, some say Tarren Mill and some say lions down from Alterac, and it's probably all three." },
      },
      choices = {
        { text = "I can't see why the Forsaken would steal horses.", next = "news_horses" },
        { text = "Something else.", next = "BACK" },
      },
    },
    news_horses = {
      lines = {
        { id = "nh_default", text = "They don't eat, so I can't think what for. Riding, maybe, or just to take something of ours, which would be like them." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everyone in Southshore drinks here eventually, and they talk while they do it. Ask, and I'll pass along what I've heard." },
    },
    syndicate = { { id = "tp_syndicate", text = "They never drink here, and that's how you know them, because everyone drinks here." } },
    background = { { id = "tp_bg", text = "I keep the inn. Somebody has to, and the fish stew won't make itself." } },
    advice = { { id = "tp_ad", text = "Sleep with your boots by the bed. In Southshore you never know which night you'll need them in a hurry." } },
    forsaken = { { id = "tp_forsaken", text = "The dead up the hill drink nothing and eat nothing and pay for nothing, so they're no use to me. I'd still rather have them in Tarren Mill than here." } },
    scourge = { { id = "tp_scourge", text = "Refugees from the north stopped in my inn on their way to Stormwind, and they all had the same look in their eyes. I gave them beds and didn't ask." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay rum comes through Southshore now and then, and it's not as good as they say. I sell it anyway, for the sailors." } },
    _none = { { id = "tp_none", text = "Ask Marshal Redpath. He knows everyone in town by name and most of their grandparents." } },
  },
}
