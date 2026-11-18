-- Booty Bay, the Salty Sailor and the walkways: Ian Strom (rogue trainer), Tokal (a Desolace marauder in hiding),
-- Elril Everlight (a night elf in plate). Voice: bibles/stranglethorn.md ("The Salty Sailor's corners").
local P = RPGDialogueAPI:Pack("rpgd.stranglethorn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Ian Strom: the quiet trade, taught in a pirate tavern.
P:NPC {
  key = "ianstrom", id = TODO_NPC("Ian Strom"), name = "Ian Strom", title = "Rogue Trainer",
  bible = "bibles/stranglethorn.md", role = "trainer", tier = "service",
  communities = { "booty_bay" }, temper = { "sharp" }, values = { "cunning", "practical" },
  notices = { "stealth", "purse" },

  impression = {
    first = "Ian Strom sits in a corner of the Salty Sailor with his back to the wall and his eyes on the door. He knew I was coming before I'd decided to, or at least he let me think so.",
    third = "{name} met Ian Strom, a Stormwind-born rogue trainer who teaches the quiet trade from a corner of Booty Bay's Salty Sailor, to Horde and Alliance alike.",
  },

  greetings = {
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Sit with your back to the wall and order something, so you look like you belong here. Then we can talk." },
    { id = "g_other", when = { ["not"] = { class = "ROGUE" } }, text = "If you're looking for the bar, it's behind you, and if you're looking for me, I'd wonder why." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and you came in by the side stair this time. Somebody's been paying attention." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde or Alliance makes no difference at my table, since a purse cuts the same either way." },
    { id = "g_eye_resolved", when = { thread = { id = "bloodsail_eye", state = "resolved" } }, text = "There's a new lad drying cups behind the bar, and he can't read a word, I checked. I find I've nobody to nod to in the evenings now, and I miss it more than I expected." },
  },

  notice = {
    { id = "n_stealth", cat = "stealth", place = "replace", when = { stealthed = true },
      text = "Nice try, but every third board in this tavern was laid by a goblin to squeak on purpose, and you found two of them." },
    { id = "n_rich", cat = "purse", when = { money = { min = 300000 } },
      text = "You're carrying more gold than anyone should into a pirate tavern. Split it between two pouches, and keep the fat one where nobody would think to reach." },
  },

  react = {
    { id = "r_stealth", on = "stealth", text = "I saw that, and so did the barman, so you might as well come out and buy something." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Ian Strom. I teach the quiet trade to anyone who can find this corner and pay for the lesson, and the Baron's people leave me to it so long as nobody's purse goes missing on the docks." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "Another of the trade, and you came up the stairs without rattling. Good, because I've had students arrive sounding like a tinker's cart, and they didn't stay students long." },
        { id = "h_rogue_vet", when = { class = "ROGUE", minLevel = 25 },
          text = "You've grown sharp since you first sat here, and I can see it in where you put your feet. There's not much more I can show you before you'll want teachers I can only point toward." },
        { id = "h_rogue_horde", when = { class = "ROGUE", faction = "Horde" },
          text = "A Horde blade at a Stormwind man's table, and don't look so surprised about it. The Bay takes no sides, and neither do my lessons." },
        { id = "h_pala", when = { class = "PALADIN" },
          text = "A paladin in the Salty Sailor, of all places. If you've come to tell me my trade is a sin, take a stool first, because the speech goes down better with rum." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest in a pirate tavern? You'll be offered more confessions tonight than you can hear, and most of them will be lies told for a free drink." },
        { id = "h_warrior", when = { class = "WARRIOR" },
          text = "A warrior, walking in as if you mean to clear the room. That's fine for you and terrible for my students, who are trying to learn the opposite." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, and your beast found me before you did. Animals are the one thing my students can't fool, and I've stopped trying to teach them how." },
        { id = "h_mage", when = { class = "MAGE" },
          text = "A mage, and every one of my students just put a hand on their purse. They've heard about the sheep, you see, and none of them wants to be next." },
        { id = "h_lock", when = { class = "WARLOCK" },
          text = "A warlock, with something small and smouldering at your heel. Keep it off the tables, please, because Skindle has already lost two to an imp this year." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid, and I didn't hear you on the stairs, which annoys me more than I'll say. You'd have made a better student than most of the ones I've got." },
        { id = "h_shaman", when = { class = "SHAMAN" },
          text = "A shaman. Your totems hum, you know, and anybody with ears can hear it across a crowded room, so don't ever try sneaking up on me." },
        { id = "h_tokal", when = { heardLine = "tokal.il_default" },
          text = "You've been sitting with the orc in the far corner. Careful, because somebody's paid good coin to know where she drinks, and it wasn't me." },
        { id = "h_seen", when = { metBefore = true },
          text = "I saw you come in, you know. I see everyone come in, and that's half of what I'd teach you, if you had the knack for it." },
      },
      again = {
        { id = "h_again", text = "What else? Keep it low, because Skindle's customers have big ears." },
        { id = "h_again2", text = "Go on, then. I've a lesson in an hour, and the student's always late." },
        { id = "h_again3", text = "Ask it quietly, and I'll answer the same way." },
      },
      choices = {
        { text = "Train me.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "Do you have anything to teach me?", next = "redirect", when = { ["not"] = { class = "ROGUE" } } },
        { text = "Why teach in a tavern, of all places?", next = "tavern" },
        { text = "What's the talk on the coast these days?", next = "gossip" },
        { text = "You don't sound like you're from the Bay.", next = "origin" },
        { text = "Who comes to you for lessons?", next = "students" },
        { text = "The trade must work differently down here.", next = "trade", when = { class = "ROGUE" } },
        { text = "Is there more to learn than you can teach?", next = "higher", when = { class = "ROGUE", minLevel = 20 } },
        { text = "Why would a Stormwind man train Horde rogues?", next = "horde_students", when = { class = "ROGUE", faction = "Horde" } },
        { text = "The Watchers taught me to move unseen.", next = "k_nelf", when = { class = "ROGUE", race = "NightElf" } },
        { text = "I've been dead. Moving quietly comes easy now.", next = "k_undead", when = { class = "ROGUE", race = "Scourge" } },
        { text = "They say my kind can't be quiet.", next = "k_short", when = { class = "ROGUE", race = { "Dwarf", "Gnome" } } },
        { text = "Is your trade really so different from mine, Strom?", next = "xpala", when = { class = "PALADIN" } },
        { text = "Do your students ever ask the Light's forgiveness?", next = "xpriest", when = { class = "PRIEST" } },
        { text = "What could a rogue teach a warrior?", next = "xwar", when = { class = "WARRIOR" } },
        { text = "Can a beast learn to move quietly?", next = "xhunt", when = { class = "HUNTER" } },
        { text = "Your students must fear a mage or two.", next = "xmage", when = { class = "MAGE" } },
        { text = "Have you ever traded secrets with a warlock?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Could a cat teach your students more than you?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Do the spirits ever give a rogue away?", next = "xsham", when = { class = "SHAMAN" } },
        { text = "I'll leave you to your corner.", next = "END" },
      },
    },

    redirect = {
      lines = {
        { id = "rd_default", text = "I doubt there's much I teach that you'd care to learn, friend, and less that you'd thank me for later. You'd do far better with a {class} trainer of your own, though Booty Bay's a long way from most of them." },
        { id = "rd_pala", when = { class = "PALADIN" }, text = "Nothing a paladin would thank me for, I'm afraid. Find a trainer of your own order and let them teach you to stand in the open, since that's what your kind is good at." },
      },
      choices = {
        { text = "Teach me one small thing anyway.", next = "outsider_lesson" },
        { text = "I'll find my own trainer, then.", next = "BACK" },
      },
    },
    outsider_lesson = {
      lines = { { id = "ol_default", text = "Then here's one for nothing: when you walk into a room like this, find the two ways out before you find the bar. Most folk never do, and the ones who do tend to live long enough to complain about it." } },
      choices = {
        { text = "Exits first. I'll remember that.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "I'd rather face trouble than look for the door.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },

    tavern = {
      lines = { { id = "tv_default", text = "Because everybody comes through the Salty Sailor sooner or later, and nobody looks twice at a man drinking alone in a tavern. A rogue trainer in a guildhall gets noticed, and being noticed is the first thing I teach people to stop doing." } },
      choices = {
        { text = "Doesn't Skindle mind?", next = "tavern_skindle" },
        { text = "Hiding in plain sight. I like it.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    tavern_skindle = {
      lines = { { id = "ts_default", text = "Skindle minds anything that doesn't pay for a room, so I pay for a room I hardly sleep in. He also likes knowing that if a stranger starts asking about the Baron's stairs, somebody in the corner will hear it first." } },
      choices = {
        { text = "So you keep watch for the Baron, too.", next = "BACK", fx = { learn = { "steamwheedle" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    gossip = {
      hub = true,
      lines = { { id = "gs_default", text = "Gossip is the one thing this tavern serves more of than rum, and most of it's worth less. What are you after: the Bloodsail, the Defias, or the folk who sit in here with no colors on at all?" } },
      again = {
        { id = "gs_again", text = "Who else do you want to hear about? I've only so many ears, but they're good ones." },
        { id = "gs_again2", text = "More? You're as bad as Krazek, though at least you don't charge me for asking." },
      },
      choices = {
        { text = "The Bloodsail.", next = "g_bloodsail" },
        { text = "The Defias. Do they come this far south?", next = "g_defias" },
        { text = "Does SI:7 keep eyes in Booty Bay?", next = "g_si7", when = { faction = "Alliance" } },
        { text = "Horde spies must come through here.", next = "g_horde", when = { faction = "Horde" } },
        { text = "Who's the orc nursing grog in the far corner?", next = "g_corner" },
        { text = "And the night elf in plate down by the water?", next = "g_elril" },
        { text = "That's enough gossip for one night.", next = "hello" },
      },
    },
    g_bloodsail = {
      lines = { { id = "gb_default", text = "The Bloodsail keep a man in every tavern on this coast, and I'd wager they've got two in this one. I know one of them, and he knows I know, so we nod to each other every evening like old friends and neither of us sits with his back to the door." } },
      choices = {
        { text = "I'd point him out to the Bruisers and be done with it.", next = "BACK", reply = "And then the Bloodsail would send a third, whose face I don't know yet. A spy you can see is worth more than one you can't, friend.", fx = { align = { honor = 1 }, learn = { "bloodsail" } } },
        { text = "I'd leave him be and sell whatever he lets slip.", next = "BACK", reply = "Now that's the Bay way of thinking, and I'd have made the same choice at your age. Just remember he might be selling you, too.", fx = { align = { honor = -1 }, learn = { "bloodsail" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    g_defias = {
      lines = { { id = "gd_default", text = "Not many, and never openly, but Westfall's coast is a short sail north and the Brotherhood keeps ships of its own. Now and then a lad comes in with a red bandana in his pocket instead of on his face, asking who buys Stormwind silver, and Kebok usually answers before I can." } },
      choices = {
        { text = "The Brotherhood are traitors, and they should hang for it.", next = "BACK", reply = "Some of them should, and some of them only wanted their wages. I knew a few of those masons, and I'd not want to tie every knot myself.", fx = { align = { order = 1 }, learn = { "defias" } } },
        { text = "Stormwind cheated the masons. I can't blame them much.", next = "BACK", reply = "Neither can I, much, though I'd not say it too loudly in Stormwind. A debt unpaid has a way of picking up a knife.", fx = { align = { order = -1 }, learn = { "defias" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    g_si7 = {
      lines = { { id = "gsi_default", text = "If SI:7 had eyes in Booty Bay, you'd never know it, and neither would I, which is just how they'd want it. Mind you, there's a fellow who's been drinking cider in here for a month and has never once got drunk, and I've decided not to wonder why." } },
      choices = {
        { text = "The crown's watchers keep us safe. Good for them.", next = "BACK", reply = "Perhaps they do, and the crown sleeps easier for it. I'd still not order a drink in front of anyone too forgettable.", fx = { align = { order = 1 }, learn = { "si7" } } },
        { text = "Spies are spies, whoever happens to pay them.", next = "BACK", reply = "That's a rogue's answer, and the only honest one in this tavern. Coin buys loyalty, and more coin buys it back.", fx = { align = { order = -1 }, learn = { "si7" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    g_horde = {
      lines = { { id = "gh_default", text = "They come through, though the Horde's spies are greener at it than Stormwind's and tend to be very large. The Baron doesn't mind either side's watchers, so long as they buy drinks and settle their quarrels somewhere past the tunnel." } },
      choices = {
        { text = "Spying in a neutral port is beneath the Horde.", next = "BACK", reply = "Beneath them, perhaps, but a Horde spy who blends in would be worth his weight in gold. Most of them don't, which is why I still sleep at night.", fx = { align = { honor = 1 } } },
        { text = "Every side spies. The Horde would be fools not to.", next = "BACK", reply = "That's what I tell my Horde students, and they nod very solemnly. Then they try to hide behind a barrel half their size.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    g_corner = {
      lines = { { id = "gc_default", text = "That's Tokal, who has been in that corner for weeks, watching the door and waiting on a boat that never seems to be hers. Whoever she's hiding from, she's better at waiting than at hiding, and I'd tell her so if she didn't look ready to bite the hand that offered." } },
      choices = {
        { text = "Is somebody looking for her?", next = "g_corner_who" },
        { text = "Something else.", next = "BACK" },
      },
    },
    g_corner_who = {
      lines = {
        { id = "gcw_default", text = "A goblin out in Desolace sent word down the coast asking whether an orc woman had come through, and Krazek sold him an answer that was mostly true. That's all I know, and more than I meant to say, so buy her a drink before you ask her anything, because she won't talk dry." },
        { id = "gcw_lam", when = { questActive = TODO_QUEST("On the Lam") }, text = "You know the answer to that, since the goblin's letter is in your pack, unless I miss my guess. Go easy with her, and buy her a drink before you ask anything, because she won't talk dry." },
      },
      choices = {
        { text = "Whatever she did, she should answer for it.", next = "BACK", reply = "Maybe, but answer to whom, a goblin with a reward poster? I'll leave the judging to people with cleaner hands than mine.", fx = { align = { order = 1 } } },
        { text = "A woman's got a right to run from her past.", next = "BACK", reply = "That's what I told Krazek, more or less, though he charged me for the opinion. Some of us came to this port for the same reason.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    g_elril = {
      lines = { { id = "ge_default", text = "That's Elril Everlight, and if you're about to ask whether she's a paladin, every drunk in the Bay has asked already and none of them got a straight answer. She pays in coin, speaks softly and stands guard over nothing in particular, which in this town makes her the most respectable soul on the walkway." } },
      choices = {
        { text = "Night elves don't take up the Light, do they?", next = "g_elril_pala" },
        { text = "Something else.", next = "BACK" },
      },
    },
    g_elril_pala = {
      lines = { { id = "gep_default", text = "Not that I've ever heard, and I've heard most things. The Light's a human habit that spread to the dwarves, and the night elves have their moon, but folk see plate and a hammer and decide the rest for themselves, and Elril seems to enjoy letting them." } },
      choices = {
        { text = "Then I'll ask her myself.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    origin = {
      lines = {
        { id = "or_default", text = "Stormwind, the Trade District and later the docks, where I learned that a sailor will tell you anything three cups in and that a ship's manifest lies more often than he does. I came south on a Blackwater ship about eight years ago and never quite got round to leaving." },
        { id = "or_human", when = { race = "Human" }, text = "Stormwind, same as you, by the sound of it: the Trade District and later the docks, where I learned that a ship's manifest lies more often than its sailors do. I came south on a Blackwater ship about eight years ago and never quite got round to leaving." },
      },
      choices = {
        { text = "Why did you leave Stormwind?", next = "origin_left" },
        { text = "You must miss the city.", next = "origin_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    origin_left = {
      lines = { { id = "ol2_default", text = "After the stonemasons went unpaid, every lord in the city wanted a spy and a scapegoat in the same afternoon, and I didn't care to be either. Down here the only law is the Baron's ledger, and at least the ledger's honest about what it wants." } },
      choices = {
        { text = "A man should stand by his city, even when it's hard.", next = "BACK", reply = "Perhaps, if the city had stood by him first. I stood by it for twenty years, and it handed me the scapegoat's rope.", fx = { align = { order = 1 } } },
        { text = "You did right to leave a city like that.", next = "BACK", reply = "I like to think so, though I miss the bells of the Cathedral on a quiet night. Booty Bay's bells are mostly cannon.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    origin_miss = {
      lines = { { id = "om_default", text = "I miss the bread, and the canals at night when the lamps are lit, and nothing else whatsoever. If you're ever back there, eat a loaf from the Trade District on the bridge for me, because nobody in this heat bakes anything worth the name." } },
      choices = {
        { text = "I'll eat one in your honor.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    students = {
      lines = { { id = "st_default", text = "Both colors, all sorts, and most of them younger than they ought to be, which is the way of this trade. I'll teach a Darkspear and a Westfall farm boy on the same evening, and the only rule is that neither of them practises on the other." } },
      choices = {
        { text = "Who was your worst student?", next = "students_worst" },
        { text = "Isn't teaching the Horde a kind of treason?", next = "horde_students" },
        { text = "Something else.", next = "BACK" },
      },
    },
    students_worst = {
      lines = { { id = "sw_default", text = "A gnome who could open any lock in Booty Bay and couldn't stop telling everyone he'd done it. The Bruisers found him in the bank vault one morning, sitting on a strongbox and explaining how he'd got in, and I hear he mends clocks in Ratchet now." } },
      choices = {
        { text = "Ha! A rogue needs a closed mouth first.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    horde_students = {
      lines = {
        { id = "hs_default", text = "Coin is coin, and a blade in the Barrens doesn't care who trained the hand holding it. I teach anyone who comes to my table and leaves the war at the door, and if that's treason, I'll be judged by somebody who's met fewer orcs than I have." },
        { id = "hs_horde", when = { faction = "Horde" }, text = "Because you came, and you paid, and you didn't draw on me, which is more than some of my own countrymen manage. A blade in the Barrens doesn't care who trained the hand holding it, and neither do I." },
      },
      choices = {
        { text = "A trainer should serve his own people first.", next = "BACK", reply = "That's the argument I heard in Stormwind, right before they ran me out of it. My people are whoever pays and listens.", fx = { align = { order = 1 } } },
        { text = "Skill shouldn't wear colors. You've got the right of it.", next = "BACK", reply = "Then you'll do well here, and better in the trade. A sharp blade has no flag, only an edge.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    trade = {
      hub = true,
      lines = { { id = "tr_default", text = "The trade's the same here as anywhere, only hotter, and the marks have more gold and sharper friends. What do you want to know: the rules of the Bay, the poisons, or who's buying?" } },
      again = {
        { id = "tr_again", text = "What else about the trade? Ask it quietly." },
        { id = "tr_again2", text = "More shop talk? Good, because it's the only talk I enjoy." },
      },
      choices = {
        { text = "What are the rules in Booty Bay?", next = "trade_rules" },
        { text = "Tell me about poisons.", next = "trade_poison" },
        { text = "Someone down here must be buying.", next = "trade_buyers" },
        { text = "Enough shop talk for now.", next = "hello" },
      },
    },
    trade_rules = {
      lines = { { id = "trr_default", text = "There's only one rule, and it's the Baron's: nobody's purse goes missing between the tunnel and the docks. Rob a Bloodsail on the Wild Shore and the Bay will buy you a drink, but lift a sailor's coin on Skindle's stairs and the Bruisers will throw you off the pier without checking whether you can swim." } },
      choices = {
        { text = "A good rule. Never steal where you sleep.", next = "BACK", reply = "The first and best lesson in this trade, and the Baron agrees with it. Keep your hands to yourself in the Bay, and the Bay keeps you.", fx = { align = { honor = 1 } } },
        { text = "Rules like that just make the docks softer pickings.", next = "BACK", reply = "Softer, and guarded by Bruisers with clubs the size of your leg. Try it once, if you like, and I'll visit you in the harbour.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade_poison = {
      lines = {
        { id = "trp_default", text = "Poisons are why half my students come to me, because this jungle grows things that would make a Westfall apothecary weep with joy. Learn to brew your own and never buy from a goblin on the docks, since they water them down and you'll find out exactly when you can least afford it." },
        { id = "trp_vet", when = { minLevel = 25 }, text = "You've the basics already, so learn the jungle next: there are vines up past Grom'gol whose sap will put a raptor down mid-leap. Brew your own, always, and never buy from a goblin on the docks, since they water everything." },
      },
      choices = {
        { text = "Who taught you poisons?", next = "trade_poison_who" },
        { text = "I'll brew my own, then.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    trade_poison_who = {
      lines = { { id = "tpw_default", text = "A Darkspear woman passing through, years back, who traded me her recipes for a set of Stormwind lockpicks and called it the worst bargain of her life. She swore the jungle grew better poisons than anything I'd ever buy, and she was right, though I still have all ten fingers and she couldn't say the same." } },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Ten fingers is a fine trade in this line of work.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    trade_buyers = {
      lines = { { id = "trb_default", text = "The Bay buys everything: maps of the Bloodsail anchorages, a letter off a Venture Company foreman, the name of whoever's been skimming the Baron's cannonballs. Krazek pays best and talks most, so sell to him if you want gold and to nobody at all if you want to grow old." } },
      choices = {
        { text = "I'd keep a secret before I'd sell it.", next = "BACK", reply = "Then you'll be poorer and better liked, and that's a fair trade in some lives. Just know your secret's worth a meal to someone.", fx = { align = { honor = 1 } } },
        { text = "I'll sell what I learn to the highest bidder.", next = "BACK", reply = "Then you'll be rich, and watched, and that's a fair trade in the Bay. Mind you sell each secret only once.", fx = { align = { honor = -1 }, learn = { "venture_company" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    higher = {
      lines = { { id = "hi_default", text = "There is, and the people who teach it don't keep a corner in a tavern. Up north in the Alterac hills there's a house where the best of the trade are said to gather, and its master doesn't take visitors, only guests he's invited." } },
      choices = {
        { text = "How does one get invited?", next = "higher_how" },
        { text = "Have you been there yourself?", next = "higher_you" },
        { text = "Something else.", next = "BACK" },
      },
    },
    higher_how = {
      lines = { { id = "hh_default", text = "By being good enough that someone mentions your name in the wrong room, and lucky enough that the right person hears it. Practise your locks, keep your mouth shut and stay well clear of the Syndicate, because the house in the hills has very little patience with them." } },
      choices = {
        { text = "I'll earn the invitation by my own work.", next = "BACK", reply = "That's the slow way and the honest one, and it works more often than you'd think. Good work speaks loudly in quiet rooms.", fx = { align = { honor = 1 }, learn = { "alterac" } } },
        { text = "I'll make sure the right people hear my name.", next = "BACK", reply = "Clever, but careful, because the wrong people hear names too. Make sure it's the right room you're whispering in.", fx = { align = { honor = -1 }, learn = { "syndicate" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    higher_you = {
      lines = { { id = "hy_default", text = "Once, as a guest who was told to keep his eyes on his boots, and did. I'll say no more about it, partly because I promised and partly because I don't remember the road, which I suspect was the point." } },
      choices = {
        { text = "Then I'll ask no more.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll find the road myself, someday.", next = "BACK", fx = { trait = { brave = 1 } } },
      },
    },

    k_nelf = {
      lines = { { id = "kn_default", text = "The Watchers are good, I'll grant you, but they move like the forest, and the Bay isn't a forest. In here you want to sound like a drunk sailor rather than like nothing at all, because silence in a busy tavern is the loudest thing in it." } },
      choices = {
        { text = "Silence served my people for ten thousand years.", next = "BACK", reply = "It did, in the forest, and I'd not argue it there. But a tavern's a different beast, and silence here makes people look twice.", fx = { align = { order = 1 } } },
        { text = "Then I'll learn to stagger like a sailor.", next = "BACK", reply = "Ha! You learn quickly, and you'll be the best-dressed drunk on the docks. Stagger slowly, and spill a little on your boots.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_undead = {
      lines = { { id = "ku_default", text = "I'm sure it does, since you don't breathe and your heart doesn't give you away. The trouble is the smell, friend, and I mean that kindly, but sailors know a dead thing on the wind better than any hound." } },
      choices = {
        { text = "Death gave me a gift, and I'll use it.", next = "BACK", reply = "Use it, then, and mind the smell, as I said. A bit of rosemary in the collar works wonders on the docks.", fx = { align = { light = -1 } } },
        { text = "It's no gift. I'd trade it back tomorrow.", next = "BACK", reply = "I'm sorry, friend, truly, and I'll not call it a gift again. But since you have it, you might as well make it pay.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Then I'll stand downwind.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    k_short = {
      lines = {
        { id = "ks_default", text = "Whoever said that never met a good one in stocking feet. Short legs make short steps and short steps are quiet ones, and you can hide behind a rum barrel, which no night elf has ever managed." },
        { id = "ks_gnome", when = { race = "Gnome" }, text = "Whoever said that never met a gnome who'd left his tools at home. You're light, you're low and you can hide behind a rum barrel, which no night elf has ever managed, so stop listening to tall people." },
      },
      choices = {
        { text = "Ha! A rum barrel it is.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xpala = {
      big = true,
      lines = { { id = "xpala_default", text = "Further than you'd like and closer than you'd admit, friend. You fight where everyone can see you and swear oaths in the Light's hearing, and I teach people to fight where nobody can and to swear nothing they can't take back, yet we both keep the same streets, by different doors." } },
      choices = {
        { text = "There's no honor in a knife in the dark.", next = "BACK", reply = "There's honor in coming home alive, paladin, and I've buried enough honorable men to know the difference. Still, I'll not make you sit with me.", fx = { align = { honor = 1 } } },
        { text = "Different doors, same house. I can respect that.", next = "BACK", reply = "That's generous of you, and rare from your sort. We both keep the house standing, after all, you at the front door and me at the back.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpriest = {
      big = true,
      lines = { { id = "xpriest_default", text = "More often than you'd think, usually the night before a job and never the morning after. I tell them to go and see a priest, and now one's come to see me, so you can tell me whether the Light keeps a separate ledger for rogues." } },
      choices = {
        { text = "The Light forgives anyone who asks honestly.", next = "BACK", reply = "I hope you're right, and I send them to you with that hope. They usually come back lighter in the pocket and the conscience.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "The Light doesn't trouble itself with tavern sins.", next = "BACK", reply = "You'd be surprised what the Light troubles itself with, from what my students tell me. They come back looking haunted.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwar = {
      big = true,
      lines = { { id = "xwar_default", text = "Where to stand, mostly, which is never where the enemy expects you to be. A warrior who learns to watch the doors as well as the blade lives twice as long, and that lesson I'll give away for nothing." } },
      choices = {
        { text = "I'll face my enemy where he can see me.", next = "BACK", reply = "Brave, and I've buried braver, friend. Learn the doors anyway, for the day he brings friends.", fx = { align = { honor = 1 } } },
        { text = "Watching the doors is just sense. I'll learn it.", next = "BACK", reply = "That's the warrior I like to train, one who knows the doors matter. You'll live longer than most of your sergeants.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunt = {
      big = true,
      lines = {
        { id = "xhunt_default", text = "Better than most of my students, because a cat already knows everything I teach and simply refuses to admit it. Keep yours downwind of the room and don't let it eat anything in this tavern, since the stew has felled tougher animals." },
        { id = "xhunt_pet", when = { pet = { type = "Beast" } }, text = "Better than most of my students, and {pet} found my corner before you did, so it's halfway there already. Keep it downwind of the room and don't let it near the stew, which has felled tougher animals." },
      },
      choices = {
        { text = "My beast and I hunt in the open.", next = "BACK", reply = "Then you'll be loud and honest, and the cat will be ashamed of you. Every hunter has a different way, I suppose.", fx = { align = { honor = 1 } } },
        { text = "The quiet hunt's the best hunt. I'll teach it.", next = "BACK", reply = "You and your cat both, then, and I'll consider you colleagues. Teach the young ones to keep their feet quiet.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Only the ones who've been turned into a sheep in front of their friends. A rogue who can't see a polymorph coming learns to love grass very quickly, and I've a student who still won't eat mutton." } },
      choices = {
        { text = "A thief caught in the act deserves the wool.", next = "BACK", reply = "Spoken like a mage with a fondness for sheep, and the Bay's thieves fear your kind. I've only my bad memories of the wool.", fx = { align = { order = 1 } } },
        { text = "I'd let a hungry thief run. Sheeping him's cruel.", next = "BACK", reply = "You've a kinder heart than most mages, friend. I'll tell my students to rob you first, since you'll forgive them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Once, with a warlock who wanted my poisons and offered me a demon's name in return, and I said no faster than I've ever said anything. Some secrets cost more than they're worth, and the ones that talk back cost the most." } },
      choices = {
        { text = "You were wise. Some knowledge should stay buried.", next = "BACK", reply = "I was, and I'd say it again tomorrow. Some names should stay in the dark where they were found.", fx = { align = { light = 1 } } },
        { text = "Your loss. A demon's name is a sharp tool.", next = "BACK", reply = "Sharp, yes, and it cuts the hand that holds it. I'll keep my poisons and my soul, thank you.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "A cat could teach them more than I can, but it wouldn't, because cats don't care whether anybody else learns. I once watched a druid in cat's shape cross this tavern without spilling a single drink, and I've been envious ever since." } },
      choices = {
        { text = "A quiet step is for hunting, not for purses.", next = "BACK", reply = "A fair point, and the druids I've met would agree. I teach the step, not the purpose, but I hope it finds a good one.", fx = { align = { honor = 1 } } },
        { text = "A quiet step suits any purpose. I won't judge.", next = "BACK", reply = "Then you're kinder than most druids, and I'll not argue with you. A quiet foot is just a quiet foot.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsham = {
      big = true,
      lines = { { id = "xsham_default", text = "The spirits I couldn't tell you about, though one of my students swore a shaman's ghost wolf smelled him through a wall in Grom'gol. Your totems hum besides, and anyone with ears can hear them, so your kind is the last I'd ever try to teach." } },
      choices = {
        { text = "I've no need to sneak. The spirits fight in the open.", next = "BACK", reply = "Then you'll be a loud shaman and a brave one, and the Bloodsail will hear you coming a mile off. That has its uses too.", fx = { align = { honor = 1 } } },
        { text = "Then I'll leave the totems behind when I go quiet.", next = "BACK", reply = "Wise, because wolves and totems give you away faster than a cough. The spirits will forgive you a quiet night.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = { { id = "tp_knows", text = "I know who came in tonight, who left early and who paid. Ask, and I'll tell you the part that's safe to say aloud." } },
    background = { { id = "tp_bg", text = "Stormwind docks, then a Blackwater ship, then this corner, and I've no plans to change the order.", next = "origin" } },
    advice = { { id = "tp_ad", text = "Find the exits, sit with your back to a wall, and never count your coin where anyone can watch you do it." } },
    defias = { { id = "tp_defias", text = "Red bandanas in pockets, asking who buys Stormwind silver. Kebok answers them, and I don't." } },
    si7 = { { id = "tp_si7", text = "If they're here, they're better than I am, and I'd rather not find out by accident." } },
    bloodsail = { { id = "tp_bloodsail", text = "They've a man in this tavern every night, and I nod to him like an old friend." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay is the only port where Stormwind's spies and the Horde's spies can drink at the same bar without anybody pretending otherwise. It makes my work simpler, and much more expensive." } },
    varian = { { id = "tp_varian", text = "The king went to a peace talk and never arrived, and the people who should be asking questions are very busy not asking them. I find that more interesting than the disappearance itself." } },
    prestor = { { id = "tp_prestor", text = "Lady Prestor appeared at court with a pedigree nobody can quite trace, and now half the nobles in Stormwind answer to her smile. I'd love to know where she came from, and so would a few of my old friends." } },
    bolvar = { { id = "tp_bolvar", text = "Highlord Fordragon is an honest soldier in a nest of courtiers, and that makes him either very brave or very blind. I haven't decided which." } },
    ravenholdt = {
      { id = "tp_ravenholdt", text = "Ravenholdt is a manor in the hills of Alterac that doesn't exist, and if you ever find it, they'll have found you first. I've never been invited, and I prefer it that way." },
      { id = "tp_ravenholdt2", when = { class = "ROGUE" }, text = "You've heard of Ravenholdt, then, and you know better than to talk about it in a tavern. Keep your blades clean and your mouth shut, and maybe one day they'll come looking for you." },
    },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "The Arena is where people go to die for a box, and it's also where I go to watch who carries what out of it. Everyone's honest when they think they're about to die." } },
    _none = { { id = "tp_none", text = "If it didn't happen in this tavern or on the docks below, I didn't hear it, and neither did you." } },
  },
}

-- Tokal: a Desolace marauder hiding out in the Salty Sailor. Season of Discovery chain: On the Lam,
-- Cherry for Your Thoughts?, No Honor Among Thieves.
P:NPC {
  key = "tokal", id = TODO_NPC("Tokal"), name = "Tokal",
  bible = "bibles/stranglethorn.md", role = "citizen", tier = "quest",
  communities = { "booty_bay" }, temper = { "watchful" }, values = { "proud", "practical" },
  notices = { "race", "kit" },

  impression = {
    first = "Tokal sits in the darkest corner of the Salty Sailor with her back to the wall and a mug she hardly touches. She told me to make it quick, and I had the feeling she meant it as advice.",
    third = "{name} met Tokal, an orc hiding out in Booty Bay's Salty Sailor and waiting on a boat that will take her anywhere but Desolace.",
  },

  greetings = {
    { id = "g_corner", text = "Something you want? Say it quickly, then, because an orc doesn't sit in a goblin tavern for the company." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Sit down if you're sitting, and keep your voice low." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "You're not riding with that marshal, are you? No, you haven't got the boots for it." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde colors. Don't salute me, because I stopped saluting when I struck my sergeant, and I haven't missed it." },
  },

  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Another night elf. Sit where I can see your hands, and don't take it personally, since I've had a bad year for your kind." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "You look like you came through Desolace the hard way, but everybody does, because the place grinds you down to the rivets." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Tokal. I'm waiting on a boat, and until it comes I'm minding my own business, which is a habit I'd recommend to anybody, orc or otherwise, who wanders into this corner." },
        { id = "h_lam", tags = { "news" }, when = { questActive = TODO_QUEST("On the Lam") },
          text = "That goblin in Desolace sent you after me, didn't he? Well, you've found me, so say what you came to say and make it quick, because I don't sit still for long." },
        { id = "h_cherry", tags = { "news" }, when = { questActive = TODO_QUEST("Cherry for Your Thoughts?") },
          text = "How's that drink coming along? A Cherry Grog, I said, and not the watered slop they pour for sailors, either." },
        { id = "h_cherry_now", tags = { "news" }, when = { questRecent = { TODO_QUEST("Cherry for Your Thoughts?"), days = 1 } },
          text = "Now that's the stuff, sweet as a lie and twice as strong. So, where was I? Desolace, the camps, and the one who sent us after them." },
        { id = "h_honor", tags = { "news" }, when = { questActive = TODO_QUEST("No Honor Among Thieves") },
          text = "You've got my note, then. Read it twice if you like, because Illari's name doesn't get any prettier the second time." },
        { id = "h_honor_done", when = { questDone = TODO_QUEST("No Honor Among Thieves") },
          text = "So you went after Illari's trail, or as far as it goes. If you ever find her, tell her Tokal's still breathing, and watch her face when you do." },
        { id = "h_drank", when = { questDone = TODO_QUEST("Cherry for Your Thoughts?") },
          text = "You bought me a drink once, so you get to sit down. Don't push your luck much past that." },
        { id = "h_orc", when = { race = "Orc" },
          text = "Another orc, looking at me like you're trying to place my clan. Don't bother, because I've stopped answering to it." },
        { id = "h_nelf", when = { race = "NightElf" },
          text = "A night elf in my corner. Keep your distance, because the last of your people I trusted left my whole crew for a marshal to find." },
        { id = "h_troll", when = { race = "Troll" },
          text = "A Darkspear. Your people know what it is to leave a home behind, so you can sit, if you keep the voodoo in your pocket." },
        { id = "h_scourge", when = { race = "Scourge" },
          text = "One of the Undercity's lot. You don't drink, so you're no use to me, but you don't talk much either, and I like that." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren, a long way from Mulgore. Desolace is all kodo bones and centaur, and I camped among both for a month, and I'd take the bones every time." },
        { id = "h_rogue", when = { class = "ROGUE" },
          text = "One of Strom's students, I'd guess, from the way you came in along the wall. Tell your teacher to stop staring at my boots." },
        { id = "h_warrior", when = { class = "WARRIOR" },
          text = "I swung an axe for the Horde long enough to know a soldier when I see one, so stand easy and don't loom." },
        { id = "h_wait", when = { metBefore = true },
          text = "Still no boat. Skindle keeps telling me tomorrow, and he's been saying tomorrow for three weeks now." },
      },
      again = {
        { id = "h_again", text = "What else? I've nowhere to be, but an orc with no clan doesn't advertise it." },
        { id = "h_again2", text = "Go on. The grog's not getting any warmer, or any colder either." },
        { id = "h_again3", text = "Ask, then, and keep your eyes off the door while you do it." },
      },
      choices = {
        { text = "Bibbly sent me. You rode with the Desolace marauders.", next = "lam", when = { questActive = TODO_QUEST("On the Lam") } },
        { text = "You don't look like any common sellsword.", next = "who" },
        { text = "Why hide out in Booty Bay?", next = "boat" },
        { text = "Where were you before Booty Bay?", next = "drink_first", when = { ["not"] = { questDone = TODO_QUEST("Cherry for Your Thoughts?") } } },
        { text = "So what happened in Desolace?", next = "desolace", when = { questDone = TODO_QUEST("Cherry for Your Thoughts?") } },
        { text = "Tell me about Illari Duskfeather.", next = "illari", when = { questDone = TODO_QUEST("Cherry for Your Thoughts?") } },
        { text = "What do you make of the folk in this tavern?", next = "bay" },
        { text = "Why not go home to Orgrimmar?", next = "orcs" },
        { text = "What's so special about Cherry Grog?", next = "grog", when = { any = { { questActive = TODO_QUEST("Cherry for Your Thoughts?") }, { questDone = TODO_QUEST("Cherry for Your Thoughts?") } } } },
        { text = "Give me one reason not to fetch the marshal.", next = "k_alliance", when = { faction = "Alliance" } },
        { text = "Raiders like you give the Horde a bad name.", next = "k_horde", when = { faction = "Horde" } },
        { text = "Not every night elf is your Illari.", next = "k_nelf", when = { race = "NightElf", questDone = TODO_QUEST("Cherry for Your Thoughts?") } },
        { text = "What clan were you, Tokal?", next = "k_orc", when = { race = "Orc" } },
        { text = "You move like you've done some quiet work yourself.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "You carry yourself like a soldier.", next = "xwar", when = { class = "WARRIOR" } },
        { text = "Desolace must make for hard hunting.", next = "xhunt", when = { class = "HUNTER" } },
        { text = "Have you asked the ancestors for guidance?", next = "xsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "Desolace is full of the Burning Blade, isn't it?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "The Light could still forgive you, Tokal.", next = "xpala", when = { class = "PALADIN" } },
        { text = "I'll leave you to your grog.", next = "END" },
      },
    },

    lam = {
      lines = { { id = "lm_default", text = "The goblin wants his money's worth out of you, I suppose, and the marshal wants a head, and everybody in Desolace wants someone to blame. Yes, I rode with them and I'm not ashamed of most of it, but if you want the rest you'll wait until I've got something wet in front of me." } },
      choices = {
        { text = "What does Bibbly want with you?", next = "lam_bibbly" },
        { text = "Then I'll hear the rest later.", next = "BACK" },
      },
    },
    lam_bibbly = {
      lines = { { id = "lb_default", text = "Whatever the goblin's being paid to want, which I'd guess is a name to sell to the marshal and another name to sell back to me. Goblins are the only honest folk in this whole business, because at least they tell you up front that they'll sell you." } },
      choices = {
        { text = "The law should catch up with raiders, Tokal.", next = "BACK", reply = "Maybe it should, but it's a goblin holding the leash, and he's not after justice. I'll not hand myself over for a bounty.", fx = { align = { order = 1 } } },
        { text = "I don't work for marshals or goblins. Your business is yours.", next = "BACK", reply = "Good, because I'd hate to have to cut your throat. Keep your nose out of it, and we'll get along.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    who = {
      lines = { { id = "wh_default", text = "I'm an orc with an axe and no clan worth naming, who rode with a crew in Desolace until the crew stopped existing. Now I'm a customer of the Salty Sailor, and as long as I keep paying, Skindle calls me his favorite." } },
      choices = {
        { text = "Tell me about the crew.", next = "who_crew" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_crew = {
      lines = { { id = "wc_default", text = "Six of us at the start: two orcs, an ogre who couldn't count past his fingers, a pair of trolls, and a human deserter who cooked better than the rest of us put together. We were good at the work, and that was the trouble, because when you're good at something somebody always notices." } },
      choices = {
        { text = "What happened to them?", next = "crew_fate" },
        { text = "A human riding with orcs. That's a strange crew.", next = "crew_human" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crew_fate = {
      lines = { { id = "cf_default", text = "Caught, scattered or dead, and I don't know which for most of them, which is worse than knowing. The ogre held a pass at the end so the rest of us could run, and I've drunk to him every night since, though I never did learn how to spell his name." } },
      choices = {
        { text = "He died well. Honor him by living better.", next = "BACK", reply = "I'll try, though I'm not sure I know how yet. He'd have laughed at me for saying so.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "He picked his end. Don't waste good grog on it.", next = "BACK", reply = "I'll drink to him all the same, because somebody should. He picked his end, aye, but it should never have come to that.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    crew_human = {
      lines = { { id = "ch_default", text = "Coin makes strange company, and Desolace makes it stranger still. He'd walked out of some Alliance outpost with a grudge and a frying pan, and as far as I'm concerned he was more of an orc than half the grunts in Orgrimmar." } },
      choices = {
        { text = "So the crew was never about Horde or Alliance.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    boat = {
      lines = { { id = "bt_default", text = "Because nobody in Booty Bay asks where you're from, only whether you can pay, and because every ship on this coast stops here sooner or later. One of them will take me somewhere the marshal's writ doesn't reach, and until then I'm drinking and watching the door." } },
      choices = {
        { text = "Where will you go?", next = "boat_where" },
        { text = "The Baron's Bruisers don't mind you here?", next = "boat_bruisers" },
        { text = "Something else.", next = "BACK" },
      },
    },
    boat_where = {
      lines = { { id = "bw_default", text = "Not the Ratchet ferry, because the marshal's friends watch that dock, so I'm waiting on a goblin captain who owes me a berth and keeps forgetting it. After that it's anywhere warm where nobody's heard of Desolace, which shouldn't be hard, because nobody wants to." } },
      choices = {
        { text = "Running won't clear your name.", next = "BACK", reply = "No, but it'll keep my head on, and I need it to clear my name. I'll do the clearing later, from somewhere with fewer marshals.", fx = { align = { honor = 1 } } },
        { text = "Smart. Never stay where they know your face.", next = "BACK", reply = "You've been on the run before, I see it in your face. Faces stay in the mind, and I'd rather mine didn't.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    boat_bruisers = {
      lines = { { id = "bb_default", text = "The Bruisers don't mind anybody who keeps the peace and pays the bar, and I do both, mostly. One of them told me the Baron's had far worse than me under his roof, and I chose to take that as a compliment." } },
      choices = {
        { text = "Something else.", next = "BACK", fx = { learn = { "steamwheedle" } } },
      },
    },

    drink_first = {
      lines = {
        { id = "df_default", text = "Not on a dry throat, I won't. Buy me a Cherry Grog, the proper stuff and not the sailors' slop, and then maybe I'll tell you about Desolace." },
        { id = "df_active", when = { questActive = TODO_QUEST("Cherry for Your Thoughts?") }, text = "I said I'd talk once there's a Cherry Grog in my hand, and I don't see one yet. The bar's right there, friend, and it isn't going anywhere." },
      },
      choices = {
        { text = "Cherry Grog? Why that, of all things?", next = "grog" },
        { text = "Something else.", next = "BACK" },
      },
    },

    desolace = {
      hub = true,
      lines = { { id = "ds_default", text = "All right, since you've paid your way. Desolace is the ugliest land in Kalimdor, all bones and centaur and dust, and there were human and dwarven camps out there, digging and surveying and guarding their supply wagons, and we took what they had." } },
      again = {
        { id = "ds_again", text = "What else about Desolace? Ask it before the grog wears off." },
        { id = "ds_again2", text = "More? Fine, but it doesn't get any prettier." },
      },
      choices = {
        { text = "You raided them for the Horde?", next = "raids_horde" },
        { text = "Who paid you?", next = "illari" },
        { text = "You must have taken something worth the trouble.", next = "raids_loot" },
        { text = "Did anyone die in those raids?", next = "raids_dead" },
        { text = "Enough about Desolace.", next = "hello" },
      },
    },
    raids_horde = {
      lines = { { id = "rh_default", text = "Not for the Horde, no, and you can tell that to anybody who asks. We were hired privately, by somebody who paid well and wanted no colors flown, and the Warchief would sooner see us in chains than claim us, which I can't say I blame him for." } },
      choices = {
        { text = "Thrall's peace matters, and you spat on it.", next = "BACK", reply = "Maybe I did, and I'll not pretend otherwise. Thrall's peace never fed my crew, but it was worth more than I gave it.", fx = { align = { order = 1 } } },
        { text = "The Horde's rules don't feed anyone. I understand.", next = "BACK", reply = "They didn't feed us, no, and nobody in Orgrimmar ever asked why we were hungry. I'm glad someone understands.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    raids_loot = {
      lines = { { id = "rl_default", text = "Supplies, mostly: tools, flour, a dwarf's surveying kit I still couldn't tell you the use of, and now and then a strongbox. The boss let us keep most of it, which should have told me something, because nobody that generous is only being generous." } },
      choices = {
        { text = "Who was the boss?", next = "illari" },
        { text = "Something else.", next = "BACK" },
      },
    },
    raids_dead = {
      lines = { { id = "rd2_default", text = "Fewer than you'd think, because a dead guard brings soldiers and a robbed one only brings complaints. I won't tell you nobody bled, though, and some nights I go over it in my head, and other nights I just drink faster." } },
      choices = {
        { text = "Then make it right, Tokal, whatever that takes.", next = "BACK", reply = "I'd like to, if I could find them, but some are buried and some have moved on. I'll make what amends I can.", fx = { align = { light = 1 } } },
        { text = "Raiders bleed folk. That's the work you chose.", next = "BACK", reply = "We bled them, aye, and I'll not pretend it was honorable. But it was the work we had, and I did it as clean as I could.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    illari = {
      hub = true,
      lines = {
        { id = "il_default", key = true, text = "Illari Duskfeather, a night elf with soft hands and a softer voice, who knew where every Alliance camp in Desolace kept its wagons before the wagons got there. She hired us, fed us the intelligence and let us keep most of the take, and I thought she was the best boss I'd ever had." },
      },
      again = {
        { id = "il_again", text = "What else about her? I've had a long time to think, so ask." },
        { id = "il_again2", text = "Go on. Her name's already ruined my drink." },
      },
      choices = {
        { text = "How did she know where the camps were?", next = "illari_intel" },
        { text = "What went wrong?", next = "illari_betray" },
        { text = "Where is she now?", next = "illari_hideout" },
        { text = "Something else.", next = "hello" },
      },
    },
    illari_intel = {
      lines = { { id = "ii_default", text = "She said she had friends among the Sentinels and friends among the humans, and she never said which friends told her what. I didn't ask, because the word was always good, and when something works you don't kick it to see what's inside." } },
      choices = {
        { text = "Taking a traitor's coin makes you no better.", next = "BACK", reply = "Maybe it does, and I've thought on that every night since. But we were hungry, and she had coin and a plan.", fx = { align = { honor = 1 } } },
        { text = "Good intelligence is good intelligence. You'd have been a fool to refuse.", next = "BACK", reply = "That's what the crew said too, and look where it got us. Good intelligence is only as good as the hand that sells it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    illari_betray = {
      lines = { { id = "ib_default", text = "When the marshal came after us, Illari was simply gone, camp struck and tracks swept, and not a word left for any of us. Then the marshal's riders knew exactly which canyon we'd run for, and I've had a long time on this stool to wonder who told them." } },
      choices = {
        { text = "You think she sold you out?", next = "illari_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    illari_why = {
      lines = { { id = "iw_default", text = "I think a night elf who sends orcs to rob Alliance camps can't afford to have those orcs talking afterward. Hand us to the marshal and her hands stay clean and her other friends never learn what she's been about, so it's tidy, and I hate how tidy it is." } },
      choices = {
        { text = "Then bring her to justice, not just to your grudge.", next = "BACK", reply = "Justice would be nice, if anyone in Kalimdor cared for an orc's word against an elf's. I'll settle for answers.", fx = { align = { honor = 1 } } },
        { text = "Then find her before she decides to find you.", next = "BACK", reply = "That's my worry, and why I sleep with my axe these days. She has a long reach for someone who never comes to the Bay.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    illari_hideout = {
      lines = {
        { id = "ih_default", text = "She let it slip once, over a fire, that she kept a place up north near the Arathi Highlands where nobody would think to look. It was the only careless thing I ever heard her say, and I've held on to it like a coin." },
        { id = "ih_note", when = { questActive = TODO_QUEST("No Honor Among Thieves") }, text = "It's all in the note: somewhere near the Arathi Highlands, a place she let slip over a fire once and never mentioned again. It was the only careless thing I ever heard her say, so make it count." },
      },
      choices = {
        { text = "Tell the marshal. Let the law handle her.", next = "BACK", reply = "The marshal would hang me before he looked for her, friend. I'll tell him, but only once I'm safely somewhere else.", fx = { align = { order = 1 } } },
        { text = "Settle it yourself. The law already failed you.", next = "BACK", reply = "That's what I'd like to do, and the law can thank me later. She owes me a crew, and I mean to collect.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    orcs = {
      lines = { { id = "oc_default", text = "Because Orgrimmar is full of orcs who want to tell me what an orc ought to be, and I spent my whole life before Desolace being told that. Thrall's a fine Warchief and his peace is a fine peace, but there's not much room in it for an orc who doesn't fit in a barracks." } },
      choices = {
        { text = "Something must have happened to you, back home.", next = "orcs_exile" },
        { text = "The Horde needs every orc it has. Go home.", next = "BACK", reply = "Maybe it does, but it needs orcs who want to be there, not ones dragged back in chains. I'll come home when I'm ready.", fx = { align = { order = 1 } } },
        { text = "Some orcs aren't made for barracks. I understand.", next = "BACK", reply = "Thank you, that's more than Orgrimmar ever said. Some of us were made for the open road and the long nights.", fx = { align = { order = -1 } } },
      },
    },
    orcs_exile = {
      lines = { { id = "oe_default", text = "I struck a sergeant who had it coming and didn't wait around to see whether anybody agreed with me. That was enough to make me a stranger at every cookfire in Durotar, so I took the first work that paid, and the first work that paid was in Desolace." } },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "I'd have struck him too.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },

    bay = {
      lines = { { id = "by_default", text = "Booty Bay is the only town in the world where an orc can drink beside a Stormwind man and neither of them reaches for an axe, so I'll say that for it. The rest is goblins, rum and sailors, and I can stand all three for as long as I need to." } },
      choices = {
        { text = "What about the rogue trainer in the corner?", next = "bay_ian" },
        { text = "And the night elf in plate by the water?", next = "bay_elril" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bay_ian = {
      lines = { { id = "bi_default", text = "Strom watches everybody and pretends he isn't, which is a trick he teaches for money, so I don't hold it against him. He's never asked me a single question, either, and in this town that's practically a proposal of marriage." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    bay_elril = {
      lines = {
        { id = "be_default", text = "Elril Everlight stands out by the water most days in plate, with a hammer on her hip, smiling as if she knows a joke the rest of us don't. Every night elf makes my hand go to my axe these days, which isn't her fault, but my hand doesn't listen to reason." },
        { id = "be_illari", when = { questDone = TODO_QUEST("Cherry for Your Thoughts?") }, text = "Elril Everlight stands out by the water most days in plate, with a hammer on her hip, and every time I see that face I think Illari's come to finish the job. Then I remember Illari never wore anything heavier than leather, and I go back to my drink." },
      },
      choices = {
        { text = "Judge Elril on her own deeds, Tokal.", next = "BACK", reply = "Maybe I should, and maybe I will when she stops smiling at me like that. I'll judge her on what she does, not what she wears.", fx = { align = { light = 1 } } },
        { text = "You're right to keep your axe close.", next = "BACK", reply = "Good, I'll keep it close, and an eye on that hammer too. Elves with friendly smiles have cost me enough already.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    grog = {
      lines = { { id = "gg_default", text = "Because it's sweet and it's strong and it tastes like nothing in Desolace, where everything tastes of dust. And because the bar here waters down everything except the Cherry Grog, which nobody orders but me, so they've never bothered." } },
      choices = {
        { text = "Sounds like my kind of drink.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    k_alliance = {
      lines = { { id = "ka_default", text = "Because you'd have to get him here first, and Booty Bay doesn't hand anyone over to anybody without the Baron's say-so. And because I've told you it wasn't for the Horde, which ought to count for something with you, even if it doesn't count for much." } },
      choices = {
        { text = "The law still matters, even in Booty Bay.", next = "BACK", reply = "It does, and I'll answer to it someday, but not to some goblin's bounty hunter. Let the law find me if it wants me that badly.", fx = { align = { order = 1 } } },
        { text = "I'm no marshal's hound. Your secret stays here.", next = "BACK", reply = "Then you've done me a kindness, and I'll remember it. Keep your mouth shut and your purse close, and we'll get along.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_horde = {
      lines = { { id = "kh_default", text = "Maybe so, but the Horde shamed me first, and I've decided we're even. You can carry that back to Orgrimmar if you like, though I doubt anyone there will thank you for reminding them I exist." } },
      choices = {
        { text = "Honor's worth more than any grudge, Tokal.", next = "BACK", reply = "Maybe it is, and I'd like to believe it. But honor never fed my crew, and the Horde never asked why we were hungry.", fx = { align = { honor = 1 } } },
        { text = "Grudges keep you alive. Honor gets you killed.", next = "BACK", reply = "Spoken like a raider, and you're not wrong. Honor's a fine thing for orcs with full bellies.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_nelf = {
      lines = { { id = "kne_default", text = "I know it, in my head, but my hands haven't learned it yet, and my hands are what kept me alive in Desolace. Sit there a while and don't sell me to anybody, and maybe they'll come round." } },
      choices = {
        { text = "I'll prove it. My word holds.", next = "BACK", reply = "Then prove it, and I'll learn to trust you a little at a time. My hands will catch up eventually.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Trust nobody. That's the wiser lesson anyway.", next = "BACK", reply = "That's the lesson Desolace taught me too, and it hasn't failed me yet. Trust is for orcs with nothing to lose.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_orc = {
      lines = { { id = "ko_default", text = "One that doesn't want me back, and that's all the name you're getting, because names travel faster than ships. You're orc-born yourself, so you know what it is to be judged by your clan before you've opened your mouth." } },
      choices = {
        { text = "A clan is family. Don't throw it away.", next = "BACK", reply = "Maybe it is, and maybe I'll go back someday when they want me. For now, they don't, and I won't beg.", fx = { align = { order = 1 } } },
        { text = "Clans are old chains. You're better off free.", next = "BACK", reply = "Free, aye, and lonely with it. But I'll take lonely over chained any day.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "A little, the kind where you go in at night and come out before the dogs wake. Our boss was better at it than any of us, which I should have taken as a warning instead of a recommendation." },
        { id = "xrogue_told", when = { questDone = TODO_QUEST("Cherry for Your Thoughts?") }, text = "A little, the kind where you go in at night and come out before the dogs wake. Illari was better at it than any of us, which I should have taken as a warning instead of a recommendation." },
      },
      choices = {
        { text = "Quiet work is still theft, Tokal.", next = "BACK", reply = "It is, and I'll not pretend otherwise. But the boss made sure we never took from anyone who couldn't spare it, mostly.", fx = { align = { honor = 1 } } },
        { text = "Quiet work's honest enough if you pay your crew.", next = "BACK", reply = "We paid, when we could, and that's more than most crews manage. Quiet work feeds the hungry better than loud work.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwar = {
      big = true,
      lines = { { id = "xwar_default", text = "I was, for a while, in a grunt's mail with a sergeant's boot behind me, and I was good at it until I wasn't. A soldier's the same anywhere, because you hold the line until somebody tells you why, and one day I asked why." } },
      choices = {
        { text = "A soldier holds the line without asking.", next = "BACK", reply = "That's what my sergeant said, right up until the day he sent us into a slaughter. Holding the line's fine until the line's wrong.", fx = { align = { order = 1 } } },
        { text = "Asking why is the first thing a free orc does.", next = "BACK", reply = "It was for me, and the sergeant never forgave me for it. Asking why is a hard habit to break, once you've started.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhunt = {
      big = true,
      lines = {
        { id = "xhunt_default", text = "Hard hunting and harder eating, because everything out there is a kodo too old to chew or a scorpid too mean to catch. We lived on centaur flatbread we took off their raiders, and it tasted like saddle leather." },
        { id = "xhunt_pet", when = { pet = { type = "Beast" } }, text = "Hard hunting and harder eating, because everything out there is a kodo too old to chew or a scorpid too mean to catch. Your {pet} would have starved in a week, or eaten the cook, and I'm not sure which I'd have minded more." },
      },
      choices = {
        { text = "Ha! I'll stick to jungle boar.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsham = {
      big = true,
      lines = { { id = "xsham_default", text = "The ancestors and I aren't on speaking terms, shaman, and I'd rather they didn't see where I've been. If you talk to them tonight, leave my name out of it, since they've enough to be disappointed about already." } },
      choices = {
        { text = "The ancestors forgive more than you'd think.", next = "BACK", reply = "Maybe they do, but I'm not ready to ask them yet. I'll walk a little further first.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Then walk your own road without them.", next = "BACK", reply = "That's what I've been doing, and the road's long but it's mine. Thank you for not pushing.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Crawling with them, out at their fortress in the north, and they're the worst of what the Horde ever was, still drunk on the old demon blood. If that's your kind of magic, sit on the far side of the table from me." } },
      choices = {
        { text = "The Burning Blade disgust me too.", next = "BACK", reply = "Good, then we agree on something. The Burning Blade are what the Horde was before Thrall, and I've no stomach for them.", fx = { align = { light = 1 }, learn = { "burning_blade" } } },
        { text = "My demons are leashed. Theirs leash them.", next = "BACK", reply = "Leashed, aye, until the day the leash slips. I hope you hold yours tighter than they hold theirs.", fx = { align = { light = -1 }, learn = { "burning_blade" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpala = {
      big = true,
      lines = { { id = "xpala_default", text = "The Light can do as it likes, paladin, but I'd rather be forgiven by the people we robbed, and they're not offering. If you want to help, find whoever hired us, because I'd forgive a great deal for that." } },
      choices = {
        { text = "Forgiveness starts with you making amends.", next = "BACK", reply = "Maybe it does, and I'll try, but the people we robbed don't want my apologies. I'll make what amends I can, from afar.", fx = { align = { light = 1 } } },
        { text = "Forgiveness is cheap. Settling scores isn't.", next = "BACK", reply = "Settling scores is all I've got left, paladin. Forgiveness can wait until Illari's paid.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Durotar, then a sergeant's jaw, then Desolace, then this stool. That's the short of it, and the long of it costs a drink.", next = "who" } },
    advice = { { id = "tp_ad", text = "Never work for anybody who pays too well. I learned that one the expensive way, and there's no honor in the lesson either." } },
    burning_blade = { { id = "tp_blade", text = "Demon-drunk orcs out in Desolace. Even raiders kept clear of them." } },
    steamwheedle = { { id = "tp_cartel", text = "The goblins run this town, and they'll sell you out with a smile, which is more honest than some." } },
    thrall = { { id = "tp_thrall", text = "The Warchief got us out of the camps and gave us a home in Durotar, and I owe him for that, same as every orc. That doesn't mean I agree with every orc he gives a sergeant's stripes to." } },
    internment = {
      { id = "tp_internment", text = "I was a child in the internment camps, and I remember the guards and the mud and the cold. Durotar's better, even if the sun tries to kill you there." },
      { id = "tp_internment2", when = { race = "Orc" }, text = "You'd remember them too, then, or your parents would. Don't let anyone in Orgrimmar tell you the camps made us soft, because the camps made us patient." },
    },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "I fought in the Arena once, for the chest, and I won it, and there was nothing inside but a few coins and a rusty sword. I still think about that fight." } },
    centaur = { { id = "tp_centaur", text = "The centaur of Desolace are the worst enemies I've fought, and I've fought plenty. They ride like the wind and they never take prisoners." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay is the one town where nobody asks an orc why she's sitting in a corner. That makes it the best town I know." } },
    _none = { { id = "tp_none", text = "Don't know, don't care, and I'm not paid to find out. Ask someone who still has a warchief." } },
  },
}

-- Elril Everlight: a night elf in plate who lets Booty Bay wonder whether she's a paladin.
P:NPC {
  key = "elril", id = TODO_NPC("Elril Everlight"), name = "Elril Everlight",
  bible = "bibles/stranglethorn.md", role = "citizen", tier = "quest",
  communities = { "booty_bay" }, temper = { "steady" }, values = { "loyal", "careful" },
  notices = { "race", "kit" },

  impression = {
    first = "Elril Everlight stands by the water in plate armor with a hammer on her hip, and the whole town takes her for a paladin. When I asked, she only smiled, which I suspect is the answer she gives everyone.",
    third = "{name} met Elril Everlight, a soft-spoken night elf in plate who watches the sea from Booty Bay's walkways and never quite says whether she's a paladin.",
  },

  greetings = {
    { id = "g_default", text = "Ishnu-alah, friend, and welcome to the quietest stretch of boards in Booty Bay. The gulls make up for it." },
    { id = "g_back", when = { metBefore = true }, text = "You've come back to the water's edge. The sea does that to people, as Elune's tides do, and to me most of all." },
    { id = "g_horde", when = { faction = "Horde" }, text = "You wear Horde colors and this is neutral ground, so you have my courtesy, and I hope I have yours." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "The moon's up, so speak softly; she's listening, and so are the pickpockets." },
  },

  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "One of the kaldorei, this far south! The moon looks the same here, and nothing else does, so it's good to see a familiar face under it." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "Your armor has seen hard use, and the salt air will finish what the fighting started unless you oil it every night. I speak from bitter experience." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Elril Everlight, of the kaldorei, a long way from the forests. Half the Bay thinks I'm a paladin and the other half has a wager on it, and I've found it's more fun for everyone if I don't settle the matter." },
        { id = "h_pala", when = { class = "PALADIN" },
          text = "Another paladin, come to greet a fellow servant of the Light, I expect. Look at me as long as you like, and if you see a glow, do tell me, because I've never managed to catch it myself." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf, and you're looking at my armor like you're trying to place the forge. You're close, and I'll say no more than that until you've guessed." },
        { id = "h_priest", when = { class = "PRIEST" },
          text = "A priest. You'll know what it's like to be asked for blessings in taverns, then, so I'll spare you if you spare me the same." },
        { id = "h_priest_nelf", when = { class = "PRIEST", race = "NightElf" },
          text = "One of Elune's own, here among the lanterns and the rum. You're looking at my hammer as if it's a riddle, and I promise it's only a hammer, mostly." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid, and I can smell the forest on you even through the fish. Sit with me a while, because I miss the trees more than I let on." },
        { id = "h_druid_tauren", when = { class = "DRUID", race = "Tauren" },
          text = "A tauren of the Cenarion Circle, if I'm any judge. Our peoples have a war between them in Ashenvale, but I've never met a Circle druid I couldn't share a bench with." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "You're Horde and I'm Alliance, and the Baron's Bruisers would like us both to remember the other part, which is that we're in Booty Bay." },
        { id = "h_scourge", when = { race = "Scourge" },
          text = "One of the Forsaken. My people have no stories for the dead who walk about with their own minds, so I'd rather ask you than guess, if you'll be patient with me." },
        { id = "h_warrior", when = { class = "WARRIOR" },
          text = "A warrior, looking at my plate the way smiths look at each other's work. It was made for someone a head shorter, so please don't look too closely at the shoulders." },
        { id = "h_tokal", when = { heardLine = "tokal.il_default" },
          text = "You've been sitting with Tokal, I think, because you're looking at me the way she does. Whoever this Illari is, I promise you I'm not her, and my hands are far from soft." },
        { id = "h_seen", when = { metBefore = true },
          text = "Still no glow, before you ask. I checked in a puddle this morning, just to be sure." },
      },
      again = {
        { id = "h_again", text = "What else would you ask? The tide's in no hurry, and after a few centuries neither am I." },
        { id = "h_again2", text = "Go on. My people are better at listening than talking, and I'm no exception, but I'll do my best." },
        { id = "h_again3", text = "Another question? Ask it, and I'll decide how much of it to answer." },
      },
      choices = {
        { text = "Are you a paladin, Elril?", next = "paladin" },
        { text = "Plate and a hammer seem an odd choice for a night elf.", next = "hammer" },
        { text = "Who are you, really?", next = "who" },
        { text = "What brings a night elf to Booty Bay?", next = "why_here" },
        { text = "Where have your travels taken you?", next = "travels" },
        { text = "Ishnu-alah. It's good to find kin this far south.", next = "k_nelf", when = { race = "NightElf" } },
        { text = "I know a paladin when I see one, Elril.", next = "k_pala", when = { class = "PALADIN" } },
        { text = "Do you serve Elune or the Light?", next = "k_priest", when = { class = "PRIEST" } },
        { text = "That plate's dwarven work, isn't it?", next = "k_dwarf", when = { race = "Dwarf" } },
        { text = "Do you know the Cenarion Circle?", next = "k_druid", when = { class = "DRUID" } },
        { text = "Night elves and Horde don't usually share benches.", next = "k_horde", when = { faction = "Horde" } },
        { text = "Do I frighten you, Elril?", next = "k_scourge", when = { race = "Scourge" } },
        { text = "How do you fight in plate without a paladin's prayers?", next = "k_war", when = { class = "WARRIOR" } },
        { text = "Do you miss the nightsabers?", next = "k_hunt", when = { class = "HUNTER" } },
        { text = "Strom says you guard nothing in particular.", next = "k_rogue", when = { class = "ROGUE", heardLine = "ianstrom.ge_default" } },
        { text = "I doubt the Alliance knows where you are.", next = "k_alliance", when = { faction = "Alliance", ["not"] = { race = "NightElf" } } },
        { text = "Have you heard of Illari Duskfeather?", next = "illari", when = { any = { { heardLine = "tokal.il_default" }, { questActive = TODO_QUEST("No Honor Among Thieves") } } } },
        { text = "May the tides be kind to you.", next = "END" },
      },
    },

    paladin = {
      hub = true,
      lines = {
        { id = "pa_default", text = "Now why would you think a thing like that, just because I wear plate and carry a hammer and stand about looking noble? Everyone knows night elves keep to Elune, though I'll tell you a secret: the Light doesn't check your ears." },
        { id = "pa_nelf", when = { race = "NightElf" }, text = "You of all people know our kind keep to Elune, so the question is a cheeky one, and I like you better for asking it. Still, I'll tell you what I tell the humans: the Light doesn't check your ears." },
      },
      again = {
        { id = "pa_again", text = "Still curious? Good. Curiosity is the only thing I charge nothing for." },
        { id = "pa_again2", text = "Press on, then, if you think you'll get further this time." },
      },
      choices = {
        { text = "So you are one!", next = "paladin_tease" },
        { text = "Why does everyone in the Bay think so?", next = "paladin_why" },
        { text = "Come on, Elril. You can tell me the truth.", tag = "Persuade", next = "paladin_almost",
          check = { pass = { any = { { disposition = { min = 65 } }, { class = "PALADIN" }, { race = "NightElf" } } } },
          fail = { next = "paladin_no", fx = { affinity = -1 } } },
        { text = "The Silver Hand sent me to find you.", tag = "Deceive", next = "paladin_deceived",
          check = { pass = { any = { { disposition = { min = 70 } }, { class = "ROGUE" } } } },
          fail = { next = "paladin_caught", fx = { affinity = -1 } } },
        { text = "What does Elune ask of you, then?", next = "moon" },
        { text = "I'll leave the mystery be.", next = "hello" },
      },
    },
    paladin_tease = {
      lines = { { id = "pt_default", text = "I didn't say that, and you'll find I very rarely say anything at all on the subject. The sailors have a song about it now, and it's terrible, and I've asked them to add a verse." } },
      choices = {
        { text = "Then I'll take that as a yes.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    paladin_why = {
      lines = { { id = "pw_default", text = "Because humans see plate and a hammer and fill in the rest with a tabard and a sermon. I let them think it, I'll confess, since a paladin gets fewer pockets picked on these docks than a lone night elf does." } },
      choices = {
        { text = "Letting a lie stand is still a lie, Elril.", next = "BACK", reply = "Perhaps it is, and I'll not argue it with you. But humans hear what they want to hear, and I only stop correcting them.", fx = { align = { honor = 1 } } },
        { text = "A useful mistake. I'd let them believe it too.", next = "BACK", reply = "Then you understand why I smile. A mistake that keeps the Bloodsail wary is the kindest kind.", fx = { align = { honor = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    paladin_almost = {
      lines = { { id = "pal_default", text = "The truth is that I once knelt beside a human paladin in a burned village and helped mend what we could, and something warm answered both of us. I've never known whether it was his Light or my goddess, and I've stopped needing to know, so that's as close to an answer as anyone gets." } },
      choices = {
        { text = "Maybe the Light and Elune are kinder neighbors than we think.", next = "BACK", reply = "Perhaps they are, and that's what I like to think on long nights. The Light and Elune both seem to like the same sort of people.", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "Warmth isn't power. Don't let the humans fool you.", next = "BACK", reply = "I'll not let them fool me, and I'll not let them fool themselves either. But warmth has its own power, small as it is.", fx = { align = { light = -1 } } },
        { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    paladin_no = {
      lines = { { id = "pn_default", text = "Nice try, friend, but Krazek offered me ten gold for that answer last week, and I turned him down too. You'll have to be a great deal more charming than a goblin with a purse." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    paladin_deceived = {
      lines = { { id = "pd_default", text = "Did they really? Then they'll have told you the password, and I'll wait while you remember it. No? Then tell the Silver Hand I'm flattered, and that I'll come quietly the day they find a tabard long enough." } },
      choices = {
        { text = "Ha! You got me.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    paladin_caught = {
      lines = { { id = "pc_default", text = "The Silver Hand would sooner send a letter than a stranger, and they'd spell my name wrong in it, which is how I'd know it was really from them. You'll have to lie better than that in Booty Bay, where even the gulls are better at it." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    moon = {
      lines = { { id = "mn_default", text = "Very little and very much: to keep watch, to keep faith, and to remember that the night is no enemy to anyone who carries her light. I pray to her every evening from the end of the pier, and the sailors have learned to step round me." } },
      choices = {
        { text = "Will you teach me a prayer to Elune?", next = "moon_prayer" },
        { text = "The night holds a goddess, not just shadows.", next = "BACK", reply = "It does, and I'm glad someone else sees it. The night is Elune's gift, and she shares it with anyone who looks up.", fx = { align = { light = 1 }, learn = { "sisterhood_of_elune" } } },
        { text = "Faith is fine for those who need it. I don't.", next = "BACK", reply = "Then I'll keep faith enough for us both. The moon doesn't mind, she shines on the doubters too.", fx = { align = { light = -1 } } },
      },
    },
    moon_prayer = {
      lines = { { id = "mp_default", text = "It's short, which is why the sailors put up with it: Elune, keep the watch while I sleep, and wake me if I'm needed. I've said it every night for longer than Booty Bay has had a pier, and so far she's never once needed to wake me." } },
      choices = {
        { text = "I'll say it tonight.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hammer = {
      lines = { { id = "hm_default", text = "The salt air eats an edge in a week, and a hammer doesn't care how dull it gets, which suits me, since I'm terrible at sharpening anything. As for the plate, a lady in Booty Bay ought to have a little mystery, and it hides a great deal of it." } },
      choices = {
        { text = "Why not a glaive, like the Sentinels?", next = "sentinels" },
        { text = "Plate that fits a night elf can't be easy to find.", next = "hammer_dwarf" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hammer_dwarf = {
      lines = { { id = "hd_default", text = "From a dwarf in Menethil Harbor, who charged me twice over for the length in the legs and grumbled the whole time. It's still the finest armor I've owned, and he made me swear never to tell another elf where I'd bought it, so I've only told you." } },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 1 } },
        { text = "Dwarves charge by the inch, then. Noted.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
    sentinels = {
      lines = { { id = "sn_default", text = "I carried water and arrows for the Sentinels in Ashenvale, long ago, and stood a few watches when they were short of hands, but I never earned a glaive and never asked for one. They fight like wind through the trees and I fight like a door that won't open, and the forest needs both kinds." } },
      choices = {
        { text = "Then you should have stayed and served with them.", next = "BACK", reply = "Perhaps I should have, and some nights I wonder. But the Sentinels had warriors enough, and I had other roads to walk.", fx = { align = { order = 1 }, learn = { "sentinels" } } },
        { text = "Better to pick your own road than wear their colors.", next = "BACK", reply = "That's what I told myself, and I still believe it. The Sentinels serve well, but I serve better walking.", fx = { align = { order = -1 }, learn = { "sentinels" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    who = {
      lines = { { id = "wo_default", text = "A child of Elune who spent many years at a temple in Ashenvale learning the rites without ever taking the vows, and many more years walking away from it. I'm not a priestess, nor a Sentinel, nor a druid, and when people ask what I am instead, I tell them a traveler and let them argue about the rest." } },
      choices = {
        { text = "Why didn't you take the vows?", next = "who_vows" },
        { text = "How long have you been traveling?", next = "who_long" },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_vows = {
      lines = { { id = "wv_default", text = "Because the priestesses asked me to stay in one place and listen, and I found I listened best while walking. Elune's light reaches the road as well as the temple, and I think she forgave me for it long before my teachers did." } },
      choices = {
        { text = "Vows matter. You should have kept to the temple.", next = "BACK", reply = "Perhaps, and the priestesses would agree with you. But Elune never once complained about where I knelt.", fx = { align = { order = 1 } } },
        { text = "Elune walks with wanderers too. You chose well.", next = "BACK", reply = "She does, and I'm glad you see it. A wanderer's prayers reach the moon as easily as a priestess's.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    who_long = {
      lines = { { id = "wl_default", text = "Long enough that the humans I met on my first visit to Stormwind are grandparents now, which is a strange thing to discover in a market. My people forget how short a human life is, and I've tried not to, because it seems rude." } },
      choices = {
        { text = "That must get lonely.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    why_here = {
      lines = { { id = "wy_default", text = "The moon over this cove is the brightest I've seen outside Ashenvale, and the sea under it changes every night, which is more than you can say for a forest. And Booty Bay is the one town in the world where nobody asks a night elf why there are no trees." } },
      choices = {
        { text = "What do you make of the people here?", next = "bay" },
        { text = "You could always go home to Darnassus.", next = "why_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_home = {
      lines = { { id = "wyh_default", text = "I could, and someday I will, but Teldrassil is young and the city on it younger still, and it doesn't yet feel like home the way the old forest did. I'd rather miss Ashenvale from the sea than from a branch." } },
      choices = {
        { text = "Your people need you at home, Elril.", next = "BACK", reply = "Maybe they do, and I'll go when they call. But Teldrassil doesn't feel like home yet, and I've learned to wait.", fx = { align = { order = 1 }, learn = { "teldrassil" } } },
        { text = "Home is wherever you choose to stand.", next = "BACK", reply = "That's what I tell myself, and the cove agrees most nights. Home is where the moon finds you.", fx = { align = { order = -1 }, learn = { "teldrassil" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bay = {
      lines = { { id = "ba_default", text = "Kind, in their way, if you don't count the pickpockets, and I don't, since they've never found anything worth stealing on me. Ian Strom nods to me every evening, Tokal glares at me from the tavern door, and Skindle has finally stopped asking me to bless the cellar." } },
      choices = {
        { text = "Why does Tokal glare at you?", next = "bay_tokal" },
        { text = "I'd like to hear what you make of Ian Strom.", next = "bay_ian" },
        { text = "Something else.", next = "BACK" },
      },
    },
    bay_tokal = {
      lines = { { id = "bt2_default", text = "Because some night elf did her a great wrong, I think, and I'm the nearest one she can glare at. I've left a cup of tea on her table twice now and she poured it into a potted fern both times, but the second time she nodded, and I'm counting that." } },
      choices = {
        { text = "Keep trying. Kindness wears down a grudge.", next = "BACK", reply = "I will, and one day perhaps she'll take the cup. A grudge is a heavy thing to carry in this heat.", fx = { align = { light = 1 } } },
        { text = "Leave her be. Some grudges are earned.", next = "BACK", reply = "Perhaps they are, and I'll not force myself on her. But I'll keep leaving the cup, just in case.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    bay_ian = {
      lines = { { id = "bi2_default", text = "Strom watches the room the way a heron watches a pond, and I watch the sea, so between us very little gets past this end of the Bay. He's never once asked me whether I'm a paladin, and for that alone I'd trust him with my purse, though perhaps not my hammer." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },

    travels = {
      hub = true,
      lines = { { id = "tv_default", text = "Ashenvale, Feralas, the Barrens on a night I'd rather forget, Stormwind, Ironforge and the long coast in between. Ask me about any of it, though I warn you I remember the weather better than the battles." } },
      again = {
        { id = "tv_again", text = "Where else shall I take you? I've more roads than stories, but not by much." },
        { id = "tv_again2", text = "Another road? Pick one, and I'll try to remember the good parts." },
      },
      choices = {
        { text = "Tell me about Ashenvale.", next = "t_ashenvale" },
        { text = "What's Feralas like?", next = "t_feralas" },
        { text = "I'd guess you've been to Desolace.", next = "t_desolace" },
        { text = "What do you make of the human kingdoms?", next = "t_humans" },
        { text = "Enough roads for one evening.", next = "hello" },
      },
    },
    t_ashenvale = {
      lines = {
        { id = "ta_default", text = "The most beautiful forest in the world, and the orcs are cutting it down for their lumber camps, and my people are killing them for it. I've seen both sides bury their dead under the same trees, and I've stopped being sure the trees are on anyone's side." },
        { id = "ta_horde", when = { faction = "Horde" }, text = "You'll have heard the Warsong's side of it, so here's mine: the most beautiful forest in the world, cut for lumber, and my people killing for every tree. I've seen both sides bury their dead under the same branches, and I've stopped being sure the trees are on anyone's side." },
      },
      choices = {
        { text = "Every grave there is a loss. Both sides need peace.", next = "BACK", reply = "They do, and I'll pray for it every night. Peace is the only thing that saves the forest.", fx = { align = { light = 1 }, learn = { "warsong" } } },
        { text = "The forest belongs to whoever can hold it.", next = "BACK", reply = "Then the forest belongs to nobody, and that's the saddest thought I've heard all week. I'll keep praying for it anyway.", fx = { align = { light = -1 }, learn = { "warsong" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    t_feralas = {
      lines = { { id = "tf_default", text = "Green and wet and full of old ruins that remember my people better than my people remember them. The Highborne built there long ago, and some of what they left behind still walks about at night, so I went quietly and left before the moon set." } },
      choices = {
        { text = "Old ruins are best left alone.", next = "BACK", fx = { trait = { cautious = 1 }, learn = { "highborne" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    t_desolace = {
      lines = { { id = "td_default", text = "Once, and quickly, because Desolace takes the heart out of anyone who stays too long. There were Alliance camps out there being robbed by raiders when I passed through, and the soldiers swore the raiders always knew which wagon carried the silver." } },
      choices = {
        { text = "Someone must have been feeding them word.", next = "BACK", fx = { trait = { skeptical = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    t_humans = {
      lines = { { id = "th_default", text = "Busy, brave and in a terrible hurry, as if every one of them knows exactly how few years they've got. I like Stormwind's bakers and Ironforge's smiths, and I've learned never to tell a human a building looks new when it's two hundred years old." } },
      choices = {
        { text = "Humans build to last. That's their wisdom.", next = "BACK", reply = "They do, and their stone will outlast many of my people's trees. Hurry has its own wisdom, I suppose.", fx = { align = { order = 1 } } },
        { text = "They rush everything. Your patience is the better way.", next = "BACK", reply = "Patience has its own costs, and my people have paid them. I'd not trade the humans' fire for all of it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    k_nelf = {
      lines = { { id = "kn_default", text = "Ishnu-alah, and it is good; I'd forgotten how it feels to hear our tongue from someone who isn't me. Before you ask, as every kaldorei does, no, the Sisterhood didn't give me this hammer, and I'll say no more than that. Tell me, does Teldrassil still smell of new bark?" } },
      choices = {
        { text = "Darnassus is home now. We must look forward.", next = "BACK", reply = "We must, and I'll try to look forward with you. Darnassus is a start, if a young one.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "It'll never replace the old forests.", next = "BACK", reply = "No, it won't, and I'll grieve for them the rest of my days. But a new forest is still a forest.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "I've not been back in a long while.", next = "k_nelf_away" },
      },
    },
    k_nelf_away = {
      lines = { { id = "kna_default", text = "Then we're two of a kind, and we can miss it together without having to go back. If you pass through Darnassus before I do, tell the moonwell at the Temple of the Moon that Elril still keeps watch, even if it's only over the sea." } },
      choices = {
        { text = "I will, Elril.", next = "BACK", fx = { affinity = 2 } },
      },
    },
    k_pala = {
      lines = { { id = "kp_default", text = "Do you, now? Then you'll know a paladin can't tell a lie, so if I were one, I'd have to keep very quiet about it, wouldn't I? I've met a few of the Silver Hand on the road and liked them better than I expected, and not one of them has ever caught me glowing." } },
      choices = {
        { text = "The Light chooses whom it will. Ears and all.", next = "BACK", reply = "It does, and I'll thank it for that, ears and all. But I'll not confirm or deny, if you'll forgive me.", fx = { align = { light = 1 }, affinity = 1, learn = { "silver_hand" } } },
        { text = "Plate and a hammer don't make a paladin.", next = "BACK", reply = "No, they don't, and I've never claimed otherwise. Plate and a hammer make a good guard, and that's all I am.", fx = { align = { light = -1 }, learn = { "silver_hand" } } },
        { text = "So that's a yes, then?", next = "paladin_tease" },
      },
    },
    k_priest = {
      lines = {
        { id = "kpr_default", text = "Elune, always, though I've prayed beside priests of the Light in Stormwind's cathedral and found the quiet in there much like the quiet under a moon. Whether the Light ever answered me back is between me and the Light, and the Light has very good manners about these things." },
        { id = "kpr_nelf", when = { race = "NightElf" }, text = "Elune, as you do, and I'd guess the Sisterhood taught you more of her rites than I ever stayed to learn. If you hear stories about me in the temple, please believe only the ones about the hammer." },
      },
      choices = {
        { text = "The Light and the moon are one warmth, shared.", next = "BACK", reply = "Perhaps they are, and that's the warmth I felt in the cathedral. Elune and the Light seem to like the same sort of quiet.", fx = { align = { light = 1 }, learn = { "sisterhood_of_elune" } } },
        { text = "Gods and priests both quarrel. I trust neither.", next = "BACK", reply = "Then trust the moon, which never quarrels with anyone. It shines on gods and priests alike.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_dwarf = {
      lines = { { id = "kd_default", text = "Menethil Harbor, a smith with a beard to his belt and a temper to match, who charged me double for the legs. You've a good eye, so I'll let you wonder what else under it is dwarven, and whether the Light came with the rivets." } },
      choices = {
        { text = "Ha! A dwarf's plate makes anyone look half a paladin.", next = "BACK", fx = { affinity = 2, trait = { witty = 1 } } },
        { text = "Plate's plate. The Light is another matter.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
    k_druid = {
      lines = {
        { id = "kdr_default", text = "I know some of its druids, and I've slept in Moonglade's grass on a night I needed to, which is more than most travelers can say. The druids taught my people to be patient with the world, and I've tried to keep the lesson, even here, where nothing is patient at all." },
        { id = "kdr_tauren", when = { race = "Tauren" }, text = "I know some of its druids, and you're proof the Circle is wiser than the war in Ashenvale. I've slept in Moonglade's grass on a night I needed to, and I'd guess you have too." },
      },
      choices = {
        { text = "Nature's balance comes before any war.", next = "BACK", reply = "It does, and the druids have kept it for ten thousand years. War is a passing thing, and the forest remains.", fx = { align = { order = 1 }, learn = { "cenarion_circle" } } },
        { text = "Even druids must pick a side sometimes.", next = "BACK", reply = "Sometimes, and I've seen them do it in Ashenvale. But even then they try to choose the forest's side.", fx = { align = { order = -1 }, learn = { "cenarion_circle" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_horde = {
      lines = { { id = "kh_default", text = "Not in Ashenvale, no, and I've no wish to quarrel with you here, where the Baron makes us both behave. I've buried friends in that forest and I don't doubt you have too, so perhaps we can watch the sea together and leave the forest out of it." } },
      choices = {
        { text = "Peace here is a start. I'll take it.", next = "BACK", reply = "Then we'll have peace here at least, and I'll be glad of it. The Baron makes good neighbors of us all.", fx = { align = { light = 1 }, affinity = 1 } },
        { text = "Ashenvale won't be forgotten by my people.", next = "BACK", reply = "Nor will mine, and I'll not ask either side to forget. But we can share a dock, if not a forest.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_scourge = {
      lines = { { id = "ksc_default", text = "A little, since my people have no stories for the dead who keep their own minds. But Elune's light falls on everything, the drowned and the dead included, so I'd rather learn your name than fear it." } },
      choices = {
        { text = "I was someone once. I'd be glad of a friend.", next = "BACK", reply = "Then you have one, and I'll be glad of you too. Elune shines on the living and the dead alike.", fx = { align = { light = 1 }, affinity = 2 } },
        { text = "Fear us if you like. We've earned it.", next = "BACK", reply = "Perhaps you have, and I'll not pretend otherwise. But I'll still not fear you here, under the Baron's peace.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_war = {
      lines = { { id = "kw_default", text = "The same way you do, I expect: by standing where the blow is coming and refusing to move. Whether anything mends my dents afterward is my own business, though I'll admit they do heal rather quickly." } },
      choices = {
        { text = "Stand your ground and let them come. That's honest fighting.", next = "BACK", reply = "It is, and I'd stand beside you any day. The Bloodsail never expect a wall that smiles.", fx = { align = { honor = 1 } } },
        { text = "Better to sidestep a blow than catch it.", next = "BACK", reply = "Sometimes it is, and a good sidestep has saved me more than once. Plate makes it harder, though.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_hunt = {
      lines = {
        { id = "khu_default", text = "Every day, and the owls, and the sound of something large moving quietly through the trees at night. The Bay has gulls and crocolisks, and I've tried to befriend both without much luck on either side." },
        { id = "khu_pet", when = { pet = { type = "Beast" } }, text = "Every day, and the owls, and the sound of something large moving quietly through the trees at night. Your {pet} is the first creature in a month that hasn't tried to steal my fish, so you may visit as often as you like." },
      },
      choices = {
        { text = "Ha! Gulls make poor company.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_rogue = {
      lines = { { id = "kr_default", text = "Strom is wrong, which pleases me, because it so rarely happens. I watch the cove for Bloodsail sails and tell the Bruisers when I see them, and in return they let me stand where I like and don't ask what I'm waiting for." } },
      choices = {
        { text = "Keeping watch for a town is honest work.", next = "BACK", reply = "It is, and I'm glad someone else thinks so. The Bay is safer for a few watchers on the docks.", fx = { align = { honor = 1 }, learn = { "bloodsail" } } },
        { text = "Watchers see plenty. I'd sell what you see.", next = "BACK", reply = "Then you'd sell the Bay's safety to its enemies, and I'd have to stop telling you anything. I'll keep my sightings for the Baron.", fx = { align = { honor = -1 }, learn = { "bloodsail" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    k_alliance = {
      lines = { { id = "kal_default", text = "The Alliance knows where its soldiers are, and I'm not one of them, which is a freedom I've grown fond of. If Darnassus ever needs me, a letter will find me here, because everything finds its way to Booty Bay eventually." } },
      choices = {
        { text = "Everyone owes their people service, Elril.", next = "BACK", reply = "Perhaps they do, and I've served in my own way. But the Alliance has soldiers enough, and I've chosen a smaller post.", fx = { align = { order = 1 } } },
        { text = "Good. Nobody should be a banner's property.", next = "BACK", reply = "Exactly, and I've grown fond of being nobody's. The moon's the only banner I follow.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    illari = {
      lines = { { id = "ilr_default", text = "Duskfeather isn't a name I know, and I'd remember it, since there are fewer of us this far from Kalimdor than you'd think. But not everyone of my people who leaves Ashenvale leaves for good reasons, and that's a hard thing for me to say aloud." } },
      choices = {
        { text = "If she sold out her crew, she must answer for it.", next = "BACK", reply = "She must, and if she's of my people, I'll help find her. A night elf who sells her allies shames us all.", fx = { align = { honor = 1 } } },
        { text = "Tokal's no saint either. Let them settle it.", next = "BACK", reply = "Perhaps neither is, and they should settle it between them. But I'd not stand by and watch Tokal killed for it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A temple in Ashenvale, no vows, a great many roads, and a pier in Booty Bay. The armor is a longer story.", next = "who" } },
    advice = { { id = "tp_ad", text = "Oil your armor every night by the sea, and never tell a sailor anything you'd mind hearing sung." } },
    sentinels = { { id = "tp_sentinels", text = "I carried their water once. They fight like the wind, and I've never been the wind." } },
    silver_hand = { { id = "tp_silver_hand", text = "Good people, and terribly earnest. They've never once asked me to join, which I find a little hurtful." } },
    sisterhood_of_elune = { { id = "tp_sisterhood", text = "They taught me the rites, and I walked away before the vows. They were kinder about it than I deserved." } },
    elune = { { id = "tp_elune", text = "Elune is the light I was raised under, in a temple in Ashenvale, and I still pray to her every night by the water. The moon looks the same from Booty Bay, and that's a comfort." } },
    holy_light = { { id = "tp_holy_light", text = "I carry a hammer and wear plate, and people here assume it's for the Light. I've let them, because the Light and the moon seem to want the same things from the people who serve them." } },
    tyrande = {
      { id = "tp_tyrande", text = "Tyrande Whisperwind is the High Priestess of Elune, and the Sentinels follow her as they always have. I've never spoken with her, but I heard her bless the temple once, and I've never forgotten it." },
      { id = "tp_tyrande2", when = { race = "NightElf" }, text = "You've stood in her temple too, I'd guess, and felt the moonlight come through the roof. Tell me, does Darnassus feel like home yet, or is the tree still a stranger?" },
    },
    nordrassil = { { id = "tp_nordrassil", text = "Nordrassil was the World Tree, and it gave us our immortality, and we gave that up to save the world. I don't regret it, though I feel the years now in a way I never did before." } },
    teldrassil = { { id = "tp_teldrassil", text = "Teldrassil is the new tree, grown without the dragons' blessing, and I'm not sure what it will grow into. I haven't been home since it was planted." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay is loud and greedy and full of people who would sell their mothers, and I've never been happier anywhere. There's a freedom in it." } },
    _none = { { id = "tp_none", text = "That's beyond what the moon has shown me, friend, and further still beyond what I've bothered to learn." } },
  },
}
