-- Marshal Dughan, Goldshire. Voice: bibles/dughan.md
-- Agenda: keep Goldshire calm with too few guards, so he plays the Defias down.
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "dughan", id = TODO_NPC("Marshal Dughan"), name = "Marshal Dughan",
  bible = "bibles/dughan.md", role = "questgiver", tier = "major",
  communities = { "goldshire" }, temper = { "proud" }, values = { "stern", "brave" },
  notices = { "reputation", "bounty" },
  impression = {
    first = "Marshal Dughan keeps Goldshire standing on stubbornness and very little sleep. He looked at me the way a man looks at one more pair of hands.",
    third = "{name} met Marshal Dughan, who keeps Goldshire standing on stubbornness and very little sleep.",
  },

  greetings = {
    { id = "g_op_peace_against", when = { gossip = { topic = "peace", stance = "against" } }, text = "Farley tells me you'd never make peace with the orcs. Good, keep that, but keep it for the real ones, and not the Defias who wear scarves." },
    { id = "g_op_varian_dead", when = { opinion = { topic = "varian", stance = "dead" } }, text = "Ah, it's you. I'll ask you again not to tell my farmers the king is dead; they've enough to frighten them with the gnolls." },
    { id = "g_desk", text = "Make it quick, friend; I've half of Elwynn on this desk." },
    { id = "g_liked", when = { townStanding = { town = "goldshire", min = 30 } }, text = "Good to see you, and I mean it. Don't let it go to your head." },
    { id = "g_distrust", when = { townStanding = { town = "goldshire", max = -20 } }, text = "Keep your hands where my guards can see them, and we'll get along." },
    { id = "g_mine", when = { questActive = TODO_QUEST("The Fargodeep Mine") }, text = "Fargodeep won't scout itself." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and the pile on this desk didn't shrink an inch while you were away. Pull up a chair, friend." },
    { id = "g_away_long", when = { away = { min = 30, levels = 5 } }, text = "Look at you, back after {away} and walking like a veteran. I sent a greenhorn out of this town, and I'll take back whatever this is gladly." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "When I first sent you after kobolds, you could barely hold that blade straight. Now I'd put you on my roster before half my guards." },
    { id = "g_word_intim", when = { word = "intimidated" }, text = "One of my guards says you've been leaning on folk in Goldshire. I'll have no bullying in my town, whatever good you've done me." },
    { id = "g_word_helped", when = { word = "helped" }, text = "I hear you've been pitching in around Goldshire, and folk have noticed. Take a number like everyone else, but take my thanks first." },
  },

  notice = {
    { id = "n_bounty", cat = "bounty", place = "before", when = { questReady = TODO_QUEST("WANTED: \"Hogger\"") },
      text = "Is that what I think it is? Put it on the desk, slowly, because I want the guards to see it." },
    { id = "n_town_hero", cat = "reputation", when = { townStanding = { town = "goldshire", min = 55 } },
      text = "Half the town wants to buy you a drink. The other half wants to name a pig after you. I've told them both to wait." },
  },

  start = "hello",
  nodes = {
    op_varian = {
      lines = {
        { id = "op_varian_a", text = "Officially, the crown expects His Majesty's return any day, and I've said so to every frightened farmer who's asked. Unofficially, I'm a sergeant at heart, and sergeants want to know what the man beside them believes. So what do you believe?" },
      },
      choices = {
        { text = "He's alive. A king like Varian doesn't simply vanish.", next = "op_varian_1", fx = { opinion = { varian = "alive" }, align = { light = 1 }, affinity = 1 } },
        { text = "He's dead, Marshal, and the court is lying to keep order.", next = "op_varian_2", fx = { opinion = { varian = "dead", stormwind = "abandoned_its_own" }, align = { light = -1 }, trait = { blunt = 1 } } },
        { text = "Alive or not, the boy needs good men around him now.", next = "op_varian_3", fx = { opinion = { varian = "unknown", bolvar = "trusted" }, align = { order = 1 }, trait = { practical = 1 } } },
        { text = "Someone at court wanted him gone. I'd look there first.", next = "op_varian_4", fx = { opinion = { varian = "betrayed", prestor = "distrust" }, trait = { skeptical = 1 } } },
        { text = "That's above my station, Marshal.", next = "BACK" },
      },
    },
    op_varian_1 = {
      lines = { { id = "op_varian_r1", text = "I'd like to think so, and I'd like it in writing from someone who knows. Until then I'll keep his peace for him, the same as if he were coming home tomorrow." } },
      choices = { { text = "Something else, Marshal.", next = "BACK" } },
    },
    op_varian_2 = {
      lines = { { id = "op_varian_r2", text = "Keep your voice down in my office. You may be right, and that's exactly why it shouldn't be said where Remy can hear it and sell it by supper." } },
      choices = { { text = "Something else, Marshal.", next = "BACK" } },
    },
    op_varian_3 = {
      lines = { { id = "op_varian_r3", text = "That's a soldier's answer, and the one I'd have given. Highlord Bolvar's a good man, and Goldshire will hold for the boy whether his father comes home or not." } },
      choices = { { text = "Something else, Marshal.", next = "BACK" } },
    },
    op_varian_4 = {
      lines = { { id = "op_varian_r4", text = "That's the kind of thought that gets a marshal posted to the Burning Steppes. I didn't hear it, and you didn't say it, and we'll both sleep better." } },
      choices = { { text = "Something else, Marshal.", next = "BACK" } },
    },
    xpt_dughan = {
      big = true,
      lines = { { id = "xpt_dughan_default", text = "Because Stormwind's soldiers are guarding Stormwind, and the rest are in Redridge or on the road to Lakeshire, or watching the Stockade. So I've a handful of guards and whatever good-hearted adventurers wander through, and you'd be surprised how far that goes." } },
      choices = {
        { text = "The Crown should do its duty and garrison Elwynn properly.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Folk like us do the job better than any garrison.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xcl_stocks = {
      big = true,
      lines = { { id = "xcl_stocks_default", text = "Some of them will, when their sentences run out, because a cell never cured a hungry man of stealing. I've a handful of guards for a whole county, and I'd rather folk believed the Defias are a nuisance than a war, since a frightened town is harder to keep than an angry one." } },
      choices = {
        { text = "People have a right to the truth, Marshal, frightened or not.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Keep them calm, Marshal. A little quiet is worth a little lying.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "What becomes of a thief after the Stockade, Marshal?", next = "xcl_stocks2" },
      },
    },
    xcl_stocks2 = {
      lines = { { id = "xcl_stocks2_default", text = "Most come home to Goldshire with nothing, and the Brotherhood is waiting with a meal and a mask, so I see the same faces twice. I can't feed them all, so I watch them, and I hope the Light does better with the rest than I can." } },
      choices = {
        { text = "Then I'll keep an eye on them too, Marshal.", next = "BACK" },
      },
    },
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I trust anyone who kills gnolls and kobolds and doesn't loot the dead. Show me that, and I'll not care what you talk to at night." } },
      choices = {
        { text = "I'll follow your orders, Marshal, and earn that trust.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll fight my way, Marshal. Judge me by results.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Fargodeep and Jasperlode are crawling with kobolds, and they're terrified of candles, so you can imagine how they feel about a fireball. Clear the mine mouths for me and I'll worry about the paperwork afterwards." } },
      choices = {
        { text = "Put me on your roster, Marshal. I'll follow your orders.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll clear the mines my own way, roster or no roster.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because someone in Stormwind with more braid than me decided you're useful, and with the king missing and half my guards marched off, I've no men spare to argue. I'll leave it alone so long as nothing comes up those stairs that didn't go down them." } },
      choices = {
        { text = "Nothing will come up those stairs while I'm down there.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "What I summon is my business, Marshal, not the Guard's.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Some, aye, if they'd stay off the roads. But the wolves have been bold this year, and I've farmers to look after." } },
      choices = {
        { text = "The farmers come first. I'll help.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The wolves were here before the farmers.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More than I'd like and fewer than I feared, and every one of them was too young for it. The army's away and the gnolls know it, so I send farm boys to do soldiers' work, and then I write to their mothers." } },
      choices = {
        { text = "Let me help you write those letters, Marshal.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Soldiers die, Marshal. That's what the uniform is for.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Westbrook, if you ask me, where Rainer's holding the border with what's left after the kingdom sent its soldiers abroad. Or Hogger's camp, if you're feeling bold, though bold is how most of the names on my notices got there." } },
      choices = {
        { text = "I'll go where you send me, Marshal. That's the oath.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll go where the Light leads me, not where you point.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_dughan", tags = { "news" }, when = { party = true },
          text = "Ah, a proper party. Good, because I've been sending lone farmhands after the gnolls for weeks and I'm running out of farmhands, so if you and your friends have a spare afternoon, Elwynn has a spare gnoll or two." },
        { id = "h_cl_stocks", tags = { "news" }, when = { cleared = "The Stockade", faction = "Alliance" },
          text = "I sent a good many of Goldshire's thieves to that Stockade, so I'm glad to hear you've put the riot down. Keep the tale short at the inn, if you would, because Elwynn has enough nerves about the Defias as it is." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest. Good, because Josetta upstairs at the inn could use someone to share the wounded with, and my men keep finding new ways to get hurt." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, in my office. If you've come to tell me the Light's on my side, I'll take it, but I'd sooner have your hammer on the west road." },
        { id = "h_default", text = "Marshal Dughan. If you've a complaint, take a number. If you've a sword, take a job." },
        { id = "h_from_mcbride", key = true, tags = { "news" }, when = { questRecent = { TODO_QUEST("Report to Goldshire"), days = 2 } },
          text = "McBride's papers, then. He speaks well of you, which is rare, so don't make a liar of him." },
        { id = "q_hogger_before", when = { questBefore = TODO_QUEST("WANTED: \"Hogger\""), band = "Greenhorn" },
          text = "You've seen the poster. Don't go after Hogger alone at your size. He's sent better back on a cart." },
        { id = "q_hogger_recent", tags = { "news" }, when = { questRecent = { TODO_QUEST("WANTED: \"Hogger\""), days = 3 } },
          text = "Hogger's claw on my desk. Goldshire will drink to you tonight, and I'll pretend not to notice.",
          fx = { standing = { goldshire = 10 }, expose = "hogger_unbeatable" } },
        { id = "q_hogger_later", when = { questLater = { TODO_QUEST("WANTED: \"Hogger\""), days = 7 } },
          text = "The gnolls have gone quiet since Hogger, too quiet for my liking. They're choosing a new one, mark me." },
        { id = "q_fargodeep", when = { questActive = TODO_QUEST("The Fargodeep Mine") },
          text = "There are kobolds in the tunnels at Fargodeep. Count them and come back, and don't try to fight all of them." },
        { id = "q_concerns", when = { questActive = TODO_QUEST("Further Concerns") },
          text = "Remy's murlocs. I'd have laughed, but Thomas hasn't sent word from the bridge in days." },
        { id = "q_concerns_later", tags = { "news" }, when = { questDone = TODO_QUEST("Further Concerns"), heardClaim = "murlocs_in_elwynn" },
          text = "Murlocs. Remy was right. Don't tell him I said so; he'll repeat it until the Light takes us all.",
          fx = { expose = "murlocs_in_elwynn" } },
        { id = "lie_hogger", tags = { "news" }, once = true, priority = 10, when = { lieCaught = "player_killed_hogger" },
          text = "Farley's telling the whole inn you killed Hogger, which is strange, because there's no claw on my desk.",
          fx = { standing = { goldshire = -6 }, npcFlag = { set = { "caught_lying" } } } },
        { id = "h_standing_low", when = { townStanding = { town = "goldshire", max = -20 } },
          text = "I hear things about you, and none of them good. Give me a reason to stop hearing them." },
        { id = "h_skyborne", when = { race = "Skyborne" },
          text = "Sky elves. Stormwind's calling your people friends now, and good, I'll take all the friends I can get. Keep the peace in my town and we'll get along fine." },
        { id = "q_jasperlode", when = { questActive = TODO_QUEST("The Jasperlode Mine") },
          text = "Jasperlode's further out: east along the road to the Tower of Azora, then north into the foothills. Scout it, but don't try to clear it." },
        { id = "q_jasperlode_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Jasperlode Mine"), days = 2 } },
          text = "Kobolds in Jasperlode too, and every report's worse than the last. Thank you for it anyway; I'd sooner know." },
        { id = "q_manhunt", tags = { "news" }, when = { questRecent = { TODO_QUEST("Manhunt"), days = 3 } },
          text = "The Collector won't be collecting again, but that ring bothers me. Why does a thief in a pumpkin patch carry a Stonemasons' Guild ring?",
          fx = { learn = { "the_collector", "defias" } } },
        { id = "h_veteran", when = { minLevel = 20, metBefore = true },
          text = "Look who's back. You carried McBride's papers to this desk once. Now half my reports have your name in them." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "Ah, you. Pull up that crate, because you're one of the few people who walks into this office and makes my day shorter instead of longer." },
        { id = "h_cold", when = { disposition = { max = 34 } },
          text = "I've a desk full of trouble already, and I'm told some of it has your name on it. What do you want?" },
        { id = "h_woodsman", when = { origin = "human_eastvale_woodsman" },
          text = "An Eastvale woodsman with a bow on his back instead of an axe. Marshal Haggard says you lot can track a wolf across bare rock, so I've a gnoll problem you might like." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid in Goldshire! We've wolves an' kobolds an' murlocs to spare, so if ye've a way of turning them, I'd hear it." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage, and I've no blessed idea where to put you on the duty roster. The Guard's stretched across the whole of Elwynn and I'll take any help that can throw fire." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "A warlock in my town square. You'll be from the cellar under the Lion's Pride, I expect, which I've been told isn't there and which I'm told to leave alone." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A dwarf shaman. Light's sake, the last shamans I saw were burning farms for the Horde. But I need hands, and yours look steady." },
      },
      again = {
        { id = "h_again", text = "What else? The desk isn't getting any emptier." },
        { id = "h_again2", text = "Next, and quickly, now." },
        { id = "h_again3", when = { townStanding = { town = "goldshire", min = 30 } }, text = "Go on; for you, I've a minute more." },
      },
      choices = {
        { text = "Couldn't some of the beasts just be left alone?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Any work for me?", next = "BUSINESS" },
        { text = "What about the Defias?", next = "defias" },
        { text = "McBride says someone is training them.", next = "confront",
          when = { any = { { heardLine = "mcbride.d_default" }, { heardClaim = "defias_trained" } } } },
        { text = "Tell me about Hogger.", next = "hogger", when = { questBefore = TODO_QUEST("WANTED: \"Hogger\"") } },
        { text = "How bad is Elwynn, really?", next = "threats" },
        { text = "Where's the rest of the army?", next = "army" },
        { text = "Tell me about yourself, Marshal.", next = "dg_self" },
        { text = "I'm from Westfall. Nobody came for us.", next = "farmhand", when = { origin = "human_westfall_farmhand" } },
        { text = "My family has a name in the city.", next = "noble", when = { origin = "human_minor_noble" } },
        { text = "I could say words for the footmen you lost.", next = "footmen", when = { class = "PRIEST", questDone = TODO_QUEST("Discover Rolf's Fate") } },
        { text = "I've a sword, Marshal. You said take a job.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "I can track Hogger's gnolls for you.", next = "hunter", when = { class = "HUNTER" } },
        { text = "The Defias move like trained thieves, Marshal.", next = "rogue", when = { class = "ROGUE" } },
        { text = "Do dwarves turn up in Goldshire much, Marshal?", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Where could a mage be of use to you, Marshal?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Why would you leave the cellar alone, Marshal?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "How many soldiers have you lost this season, Marshal?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Where would a paladin do the most good in Elwynn, Marshal?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you trust a shaman to fight for Goldshire, Marshal?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "The Stockade's quiet now, Marshal. Your prisoners won't trouble Goldshire.", next = "xcl_stocks", when = { cleared = "The Stockade", faction = "Alliance" } },
        { text = "Why doesn't Stormwind send more soldiers to Goldshire?", next = "xpt_dughan", when = { party = true } },
        { text = "Good day, Marshal.", next = "END" },
      },
    },

    defias = {
      lines = {
        { id = "d_common_thieves", key = true,
          text = "The Defias? Common thieves with matching scarves, and Westfall's problem, mostly. Goldshire is safe.",
          fx = { hear = "defias_common_thieves", learn = { "defias" } } },
      },
      choices = {
        { text = "Glad to hear it.", next = "BACK", fx = { affinity = 1 } },
        { text = "That's not what I've seen.", next = "confront", fx = { trait = { skeptical = 1 } } },
      },
    },

    confront = {
      big = true,
      lines = {
        { id = "c_default", text = "McBride sees an army in every bandit. Somebody has to keep this town from panicking, and it's me." },
        { id = "c_collector", when = { questDone = TODO_QUEST("The Collector") },
          text = "...Fine. Someone is paying them, and paying well, and you've seen the schedule yourself, so that stays between us.",
          fx = { expose = "defias_common_thieves" } },
        { id = "c_ring", when = { questDone = TODO_QUEST("Manhunt") },
          text = "...You found the ring, then. A Stonemasons' Guild ring on a thief who was collecting gold from my mines; I can't call that common, can I, not to you.",
          fx = { expose = "defias_common_thieves" } },
      },
      choices = {
        { text = "The town deserves to know what it's facing.", tag = "Persuade", next = "admit",
          check = { pass = { any = { { disposition = { min = 65 } }, { townStanding = { town = "goldshire", min = 30 } }, { questDone = TODO_QUEST("The Collector") } } } },
          fail = { next = "rebuff", fx = { affinity = -1 } } },
        { text = "Calm streets matter. I understand.", next = "BACK",
          fx = { align = { order = 2 }, trait = { cautious = 1 }, affinity = 1 } },
        { text = "Then you're lying to them.", next = "BACK",
          fx = { align = { honor = 2 }, affinity = -2, standing = { goldshire = -1 } } },
      },
    },
    admit = {
      lines = {
        { id = "ad_default", key = true,
          text = "You're right, and I hate that you're right. They're organized. Someone's training them, and I don't have the guards to say it out loud.",
          fx = { expose = "defias_common_thieves", hear = "defias_trained" } },
      },
      choices = {
        { text = "Then let me help.", next = "BACK", fx = { affinity = 2, standing = { goldshire = 3 }, trait = { brave = 1 } } },
        { text = "Who do you think is training them?", next = "admit_who" },
      },
    },
    admit_who = {
      lines = {
        { id = "aw_default", text = "Someone who was owed money and never got it. That's all I'll guess aloud. A marshal who guesses aloud is a marshal who starts riots." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "defias" } } } },
    },
    rebuff = {
      lines = { { id = "rb_default", text = "I don't take lessons in keeping the peace from someone who hasn't kept any. Good day." } },
      choices = { { text = "Good day, Marshal.", next = "END" } },
    },

    hogger = {
      lines = {
        { id = "hg_default", text = "A gnoll the size of a cart horse, with the temper of two. He's been in the southwest for weeks, and he's sent every hunter home on a cart.",
          fx = { learn = { "hogger" } } },
      },
      choices = {
        { text = "Why hasn't the army dealt with him?", next = "hogger_army" },
        { text = "I'll bring you his claw.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Not my problem.", next = "BACK", fx = { standing = { goldshire = -1 } } },
      },
    },
    hogger_army = {
      lines = {
        { id = "ha_default", text = "The army put a bounty on him. That's what the army does when it can't spare a squad. He's beaten every attempt to take him so far." },
      },
      choices = {
        { text = "How big is the bounty?", next = "BUSINESS", fx = { trait = { greedy = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    threats = {
      hub = true,
      lines = {
        { id = "t_default", text = "Kobolds in the mines, north and south, gnolls and thieves to the west, and Remy swears there are murlocs in the east. Pick one, and I'll tell you how bad it is." },
      },
      again = {
        { id = "t_again", text = "Another one? There's no shortage of them." },
        { id = "t_again2", text = "Which one next? They all keep me up." },
      },
      choices = {
        { text = "The mines.", next = "mines" },
        { text = "The west.", next = "west" },
        { text = "Murlocs? Really?", next = "murlocs" },
        { text = "Back to other business.", next = "hello" },
      },
    },
    mines = {
      lines = {
        { id = "m_default", text = "Fargodeep, due south between the Stonefield and Maclure farms. Jasperlode, past the Tower of Azora in the foothills. Northshire's mine isn't the only one with kobolds.",
          fx = { learn = { "kobolds" } } },
      },
      choices = {
        { text = "Who's working the mines now?", next = "mines_gold" },
        { text = "Another threat.", next = "BACK" },
      },
    },
    mines_gold = {
      big = true,
      lines = {
        { id = "mg_default", text = "Nobody of ours. We haven't had our people in those mines for months. So whoever's taking gold out of them isn't working for the crown." },
        { id = "mg_schedule", when = { questDone = TODO_QUEST("The Collector") },
          text = "You saw the schedule. Gold from my mines, picked up at the Brackwell pumpkin patch by this Collector. Who he collects for, I can't say.",
          fx = { learn = { "the_collector" } } },
      },
      choices = {
        { text = "The kobolds, then?", next = "BACK", fx = { learn = { "gold_dust" } } },
        { text = "Remy buys gold dust.", next = "mines_remy" },
      },
    },
    mines_remy = {
      lines = {
        { id = "mr_default", text = "Remy buys what the kobolds drop, a pouch at a time, and it's legal, barely. Whoever's taking it by the shipment is another matter." },
      },
      choices = { { text = "Another threat.", next = "BACK", fx = { learn = { "gold_dust" } } } },
    },
    west = {
      lines = {
        { id = "w_default", text = "Westbrook Garrison, on the western border, has more gnolls and thieves every week. Deputy Rainer wants soldiers, and I've none to spare, so I send him people like you." },
      },
      choices = {
        { text = "And past Westbrook? Westfall?", next = "westfall" },
        { text = "Another threat.", next = "BACK" },
      },
    },
    westfall = {
      lines = {
        { id = "wf_default", text = "Not mine to hold. Gryan Stoutmantle holds Sentinel Hill with farmers and whatever help walks in. When you're ready, I'll send you to him.",
          fx = { learn = { "westfall", "people_militia" } } },
      },
      choices = { { text = "Another threat.", next = "BACK" } },
    },
    murlocs = {
      lines = {
        { id = "mu_default", text = "I respect Remy as a merchant, rather less as a scout. Until I get a military report of murlocs, I can't send troops east on a rumor." },
        { id = "mu_confirmed", when = { questDone = TODO_QUEST("Further Concerns") },
          text = "Thomas confirmed it: murlocs have settled in the eastern streams, aggressive and cleverer than they look. Remy was right, for once.",
          fx = { learn = { "murlocs_east", "eastvale" } } },
        { id = "mu_lost", when = { questDone = TODO_QUEST("Discover Rolf's Fate") },
          text = "Rolf Hartford and Malakai Stone. Two of mine, sent north along the river. The murlocs had them before I'd believed a word of Remy's.",
          fx = { learn = { "lost_footmen" } } },
      },
      choices = {
        { text = "That wasn't your fault.", next = "BACK", when = { questDone = TODO_QUEST("Discover Rolf's Fate") }, fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Another threat.", next = "BACK" },
      },
    },

    army = {
      lines = {
        { id = "ar_default", text = "Abroad. Doing who knows what, for who knows which noble. I keep the order here with whoever's left, and whoever walks through that door." },
      },
      choices = {
        { text = "Do you think King Varian's coming back, Marshal?", next = "op_varian" },
        { text = "That sounds like a complaint, Marshal.", next = "army_politics" },
        { text = "Then I'll walk through it more often.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "The nobles' wars aren't my concern, Marshal.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    army_politics = {
      lines = {
        { id = "ap_default", text = "It's a report. Politics is hard to keep track of these days, so I've stopped trying and I keep track of kobolds instead." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    farmhand = {
      big = true,
      lines = {
        { id = "fh_default", text = "I know. I'd nothing to send, and Westfall got nothing. Gryan Stoutmantle holds Sentinel Hill with farmers like you. That's the truth, and I'm not proud of it.",
          fx = { learn = { "westfall" } } },
      },
      choices = {
        { text = "Then send me.", next = "BACK", fx = { affinity = 3, align = { order = 1 }, trait = { brave = 1 } } },
        { text = "I won't fight for a city that left us to starve.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Stormwind should be ashamed.", next = "farmhand_shame" },
      },
    },
    farmhand_shame = {
      lines = {
        { id = "fs_default", text = "Some of it is. Not the part that's sitting at this desk. Say it in the city if you like. Say it louder than I'm allowed to." },
      },
      choices = {
        { text = "Then I'll say it, loud enough for the nobles to hear.", next = "BACK", fx = { align = { order = -1 }, opinion = { defias = "sympathetic" } } },
        { text = "Shouting won't feed Westfall, so I'll leave it to the city.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    noble = {
      lines = {
        { id = "no_default", text = "Then tell your family Goldshire would like its soldiers back, politely; I'm told that's how it's done in the city." },
      },
      choices = {
        { text = "I'll tell them.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'm not carrying messages for the garrison, Marshal.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "My family doesn't listen to me.", next = "noble_listen" },
      },
    },
    noble_listen = {
      lines = {
        { id = "nl_default", text = "Then we've something in common. Take a sword and be useful out here. The younger ones of good houses used to, before the city got comfortable." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },

    footmen = {
      lines = {
        { id = "fo_default", text = "Would you? There's been no one to do it. Say them at the bridge, where Thomas stands. I'd like to think they'd want it there." },
      },
      choices = {
        { text = "I will. And one for you, Marshal.", next = "BACK", fx = { affinity = 3, align = { light = 2 }, trait = { pious = 1 }, standing = { goldshire = 2 } } },
        { text = "I'm no priest, Marshal, and prayers won't bring them back.", next = "BACK", fx = { align = { light = -2 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    warrior = {
      lines = {
        { id = "warrior_l", text = "I did, and I meant it. The posters by the door are the jobs: murlocs east, kobolds in the mines, gnolls west and Hogger worst of all, and every one of them pays in coin and in Goldshire sleeping easier." },
        { id = "warrior_guard", when = { origin = "human_city_guard" },
          text = "City Watch, weren't you, with that walk? Then you know how a posting works: the posters by the door are the jobs, and every one of them pays in coin and in Goldshire sleeping easier." },
      },
      choices = {
        { text = "Which one's the worst?", next = "warrior_worst" },
        { text = "I'll take them in order, Marshal.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll take whichever pays best.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    warrior_worst = {
      lines = { { id = "warrior_worst_l", text = "Hogger, and don't go at him alone; I've buried two who thought a sword and a temper were enough. Bring a friend with a prayer, or come back taller." } },
      choices = { { text = "Something else, Marshal.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    hunter = {
      lines = {
        { id = "hunter_l", text = "Can you, now? The Riverpaw move at night and leave the forest floor looking like a herd of pigs went through it, so any fool can follow them, and what I need is somebody who knows where they'll be tomorrow." },
        { id = "hunter_human", when = { race = "Human" },
          text = "A human with a bow and a beast; Eastvale breeds a few of you, I suppose. The Riverpaw leave a trail any fool can follow, so I need someone who can guess where they'll be tomorrow." },
      },
      choices = {
        { text = "They'll be near water. Gnolls always are.", next = "hunter2", fx = { trait = { curious = 1 } } },
        { text = "I'll find out and report back.", next = "BACK", fx = { affinity = 1 } },
      },
    },
    hunter2 = {
      lines = { { id = "hunter2_l", text = "The river by the Brackwell farm, then, and the old camp at Forest's Edge. If you're right, I'll owe you a drink, and if you're wrong, take a number." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rogue = {
      big = true,
      lines = { { id = "rogue_l", text = "Trained thieves are still thieves, and that's what I tell Goldshire, because a town that thinks an army's coming stops planting. You'd know how a thief moves, I suppose, so I'll ask you to keep the rest to yourself." } },
      choices = {
        { text = "Goldshire deserves the truth.", next = "BACK", fx = { affinity = -1, align = { honor = 2 } } },
        { text = "Keeping folk calm is wise. I'll keep quiet.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "What do you really make of them?", next = "defias" },
      },
    },
    dwarf = {
      lines = { { id = "dwarf_l", text = "Now and then, on the way to the city with a cart full of Ironforge steel. They drink Farley out of ale and pay without arguing, which makes them the best guests in Elwynn." } },
      choices = {
        { text = "Any trouble with them?", next = "dwarf2" },
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    dwarf2 = {
      lines = { { id = "dwarf2_l", text = "Once, over a song, and the song started it. If you want work, the Jasperlode and Fargodeep mines are full of kobolds, and a dwarf knows a mine better than any footman I've got." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },

    -- 0.71.0 depth: Dughan himself (sub-hub): his past, his guards and Stormwind's answer, his neighbours, a farmers' militia, what he asks of you.
    dg_self = {
      hub = true,
      lines = {
        { id = "dxs_default", text = "About me? There's a desk, a town and not enough guards, and that's most of it. Still, you've asked civilly, which is rarer in this office than you'd think, so go on." },
        { id = "dxs_warm", when = { disposition = { min = 70 } }, text = "For you I'll put the pen down, which I don't do for the Regent's couriers. Ask what you like." },
      },
      again = {
        { id = "dxs_again", text = "What else? I've a report to sign, but it'll keep a minute." },
        { id = "dxs_again2", text = "Go on, and be quick about it, because McBride's runner is due." },
      },
      choices = {
        { text = "How did you come to be marshal here?", next = "dg_past" },
        { text = "How many guards do you really have?", next = "dg_guards" },
        { text = "What do you make of McBride and Stoutmantle?", next = "dg_others" },
        { text = "What do you need from me, Marshal?", next = "dg_ask" },
        { text = "Should Elwynn's farmers arm themselves, Marshal?", next = "dg_militia" },
        { text = "I walked the Trade District for the Watch, Marshal.", next = "dg_watch", when = { origin = "human_city_guard" } },
        { text = "My family came through Goldshire on the road east.", next = "dg_road", when = { origin = "human_westfall_farmhand" } },
        { text = "My training stopped when the Silver Hand broke apart.", next = "dg_squire", when = { origin = "human_paladin_squire" } },
        { text = "The brothers of Northshire raised me, Marshal.", next = "dg_novice", when = { origin = "human_abbey_novice" } },
        { text = "When did you last sleep, Marshal?", next = "dg_tired", when = { disposition = { min = 65 } } },
        { text = "Back to business.", next = "hello" },
      },
    },

    dg_past = {
      lines = {
        { id = "dxp_default", text = "I was a sergeant in the Second War, and when the army went abroad and somebody had to stay and mind Elwynn, they gave the job to the man with the neatest reports. I've regretted keeping neat reports ever since." },
      },
      choices = {
        { text = "And before the war?", next = "dg_past2" },
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    dg_past2 = {
      lines = {
        { id = "dxp2_default", text = "Goldshire born, over the smithy, and I learned my letters from the old marshal before me, who said a town runs on ledgers and lanterns. I've kept the lanterns lit and the ledgers straight, and some weeks that's all the law there is between here and Westbrook." },
      },
      choices = {
        { text = "Ledgers and lanterns. That's good advice.", next = "BACK", fx = { affinity = 1, trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    dg_guards = {
      lines = {
        { id = "dxg_default", text = "Fewer than you'd guess and more than Stormwind thinks I need, and that's the whole of the quarrel. I've a few men in town, Thomas at the bridge and Rainer at Westbrook with a handful, so if three things go wrong on the same night, one of them waits until morning." },
      },
      choices = {
        { text = "What did Stormwind say when you asked for more?", tag = "Persuade", next = "dg_letter",
          check = { pass = { any = { { disposition = { min = 65 } }, { origin = "human_city_guard" }, { townStanding = { town = "goldshire", min = 30 } } } } },
          fail = { next = "dg_letter_no", fx = { affinity = -1 } } },
        { text = "Then count me as one more pair of hands.", next = "BACK", fx = { affinity = 2, standing = { goldshire = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dg_letter = {
      lines = {
        { id = "dxl_default", text = "...Fine, but it doesn't leave this office. I wrote to the Keep three times this year, and the third answer came from a clerk I'd never heard of, saying the council judged Elwynn adequately garrisoned and thanking me for my diligence, and I keep it in the drawer for whenever I'm tempted to think someone's coming." },
      },
      choices = {
        { text = "Adequately garrisoned? With what?", next = "dg_letter2" },
        { text = "It stays here, Marshal. You have my word.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
      },
    },
    dg_letter2 = {
      lines = {
        { id = "dxl2_default", text = "With me and a desk, apparently, and whoever wanders through that door. I'm not a man who sees plots under every bed, I leave that to McBride, but somebody in that city has decided Elwynn can manage on promises, and I'd dearly like to know who." },
      },
      choices = {
        { text = "So would I, Marshal.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dg_letter_no = {
      lines = {
        { id = "dxln_default", text = "What Stormwind said is between Stormwind and this desk. Take a number if you want the gossip, and you'll find the line's very long and moves very slowly." },
      },
      choices = {
        { text = "Then I'll stop asking, Marshal.", next = "BACK" },
      },
    },

    dg_others = {
      lines = {
        { id = "dxo_default", text = "McBride's a good soldier who sees an army behind every bandit, and Stoutmantle's a good soldier holding Westfall with pitchforks, and between the two of them I sometimes think I'm the only one who's noticed there's paperwork. Ask about either, if you like." },
      },
      choices = {
        { text = "What about McBride?", next = "dg_mcbride" },
        { text = "And Gryan Stoutmantle?", next = "dg_gryan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dg_mcbride = {
      lines = {
        { id = "dxm_default", text = "McBride and I go back to the Second War, and he's been right about the Defias more often than I'd like, which I'll deny if you repeat it. He sends me his recruits with their papers in order, and I send him back my worst news along with his own." },
      },
      choices = {
        { text = "He thinks you're playing the Defias down.", next = "confront" },
        { text = "Something else, Marshal.", next = "BACK" },
      },
    },
    dg_gryan = {
      lines = {
        { id = "dxgr_default", text = "Stoutmantle went to Lordaeron a farm boy and came home a knight to find Westfall in thieves' hands, and he's never once written to ask me for soldiers, because he knows I haven't any. I send him every volunteer I can spare, and I'd send more if Elwynn didn't need them too." },
      },
      choices = {
        { text = "Do you think he can hold?", next = "dg_gryan2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dg_gryan2 = {
      lines = {
        { id = "dxgr2_default", text = "If anyone can, though that's not the same as yes. If Westfall falls, the Brotherhood's on my western border with nothing between them and Goldshire but Rainer and a fence, so every volunteer I send west is one I'm sending to guard this town as well." },
      },
      choices = {
        { text = "Then send me west when I'm ready.", next = "BACK", fx = { affinity = 1, learn = { "westfall", "people_militia" } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    dg_militia = {
      big = true,
      lines = {
        { id = "dxmi_default", text = "That's the very question that's been sitting on my desk a fortnight. Some of the farm families south of town want to arm their hands and ride the roads themselves, the way Stoutmantle does in Westfall, and I've to say yes or no by the month's end, so what would you tell me?" },
      },
      choices = {
        { text = "Keep the law in the Guard's hands, Marshal.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let them arm. Folk have a right to defend their own.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "What will you tell them?", next = "dg_militia2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dg_militia2 = {
      lines = {
        { id = "dxmi2_default", text = "I'll tell them yes, so long as every man of them answers to my guard, and that anyone who rides into the Riverpaw camps on his own will be fined before the gnolls can get to him. It isn't what Stoutmantle would do, but Stoutmantle hasn't a town full of old feuds that would love an excuse to carry pitchforks." },
      },
      choices = {
        { text = "That sounds like a marshal's answer.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    dg_ask = {
      lines = {
        { id = "dxa_default", text = "I'll ask you one first, since you're in a talking mood. You've walked more of Elwynn this month than my guards have, so tell me honestly: what are folk saying about Goldshire out on the roads?" },
      },
      choices = {
        { text = "That it's safe, and that's thanks to you.", next = "dg_ask2", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "That the Guard's stretched thin, and everyone knows it.", next = "dg_ask2", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "That the Defias are coming, and you won't admit it.", next = "dg_ask2", fx = { affinity = -1, trait = { skeptical = 1 } } },
        { text = "I don't repeat road gossip, Marshal.", next = "dg_ask2", fx = { trait = { discreet = 1 } } },
      },
    },
    dg_ask2 = {
      lines = {
        { id = "dxa2_default", text = "Hm. That's worth knowing, and I thank you for it, because my guards only tell me what they think I'd like to hear. What I need from you is simple: scout before you fight, report before you rest, and if you see a red bandana east of Westbrook, I want to hear it from you before I hear it at the inn." },
      },
      choices = {
        { text = "You'll hear it from me first, Marshal.", next = "BACK", fx = { affinity = 2, standing = { goldshire = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    dg_watch = {
      lines = {
        { id = "dxw_default", text = "Then you know how it works: the Trade District gets the lanterns and the halberds, and the rest of the kingdom gets a letter. Tell me, did your sergeants ever mention Elwynn without sighing?" },
      },
      choices = {
        { text = "Only to complain about the mud on the road.", next = "dg_watch2", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Never, Marshal. The Watch only looks inward.", next = "dg_watch2", fx = { affinity = 1, trait = { stern = 1 } } },
      },
    },
    dg_watch2 = {
      lines = {
        { id = "dxw2_default", text = "That's about what I expected. If you've kept the Watch's habits, do me a kindness and walk the square at dusk once or twice while you're in town, because folk sleep better for seeing a soldier in the lamplight, even one who isn't mine." },
      },
      choices = {
        { text = "I'll walk it tonight, Marshal.", next = "BACK", fx = { affinity = 2, standing = { goldshire = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dg_road = {
      lines = {
        { id = "dxr_default", text = "A great many came through that way, families with carts and families without, and I gave what the town could give, which was a night in Farley's stable and directions to the city. I kept a list of names for a while in case anyone came asking after them, and I stopped when the list grew longer than the town." },
      },
      choices = {
        { text = "Did anyone ever come asking?", next = "dg_road2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dg_road2 = {
      lines = {
        { id = "dxr2_default", text = "Two or three, and I was glad of every one. The list is still in the bottom drawer, though I'll warn you that most of the entries end with 'went on to Stormwind' and nothing after it." },
      },
      choices = {
        { text = "Thank you for keeping it, Marshal.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dg_squire = {
      lines = {
        { id = "dxq_default", text = "The Silver Hand's squires used to pass through Goldshire on their way north, every one of them very sure of himself and very fond of Farley's pies. You kept the oaths with nobody left to hold you to them, and that's the kind of soldier I'd put on the Westbrook road tomorrow." },
      },
      choices = {
        { text = "Then put me there, Marshal.", next = "BACK", fx = { affinity = 2, standing = { goldshire = 1 } } },
        { text = "The oaths are mine to keep, not the Guard's.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    dg_novice = {
      lines = {
        { id = "dxn_default", text = "Then you'll know the brothers better than I do, and you'll know McBride sends every recruit down to me with a note on how they behaved in chapel. Northshire's quieter than Goldshire and I expect you miss it, though I'd be grateful for a prayer for my guards before you go back." },
      },
      choices = {
        { text = "I'll pray for them, Marshal.", next = "BACK", fx = { affinity = 2, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dg_tired = {
      lines = {
        { id = "dxt_default", text = "Two nights ago, I think, and only because Farley came over and turned my lamp down himself. Since you ask kindly, I'll tell you what I don't tell the guards: some nights I sit here in the dark and count the farms I couldn't send anyone to, and I wonder how many more seasons Elwynn can be held together with adventurers and luck." },
      },
      choices = {
        { text = "Then let me carry some of it.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Elwynn's held this long, Marshal. It'll hold.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Every complaint in Goldshire ends up on this desk sooner or later, so I know a little of everything. Ask me about any of this." },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } }, text = "For you, I'll even tell you what I don't put in the reports. Ask away." },
    },
    background = { { id = "tp_bg", text = "Marshal of Goldshire. Too much forest, too few guards, and a desk I see more of than my bed.", next = "army" } },
    advice = { { id = "tp_ad", text = "Scout before you fight and report before you rest, and never believe a rumor until a soldier's seen it, even one of Remy's." } },
    defias = { { id = "t_defias", text = "They're thieves, Westfall's thieves, and I'd thank you not to say otherwise in the inn.", fx = { hear = "defias_common_thieves" } } },
    hogger = { { id = "t_hogger", text = "There's a bounty on him, so bring me proof, not stories." } },
    murlocs_east = { { id = "t_murlocs", text = "Rumors, until Guard Thomas tells me otherwise." } },
    the_collector = { { id = "t_collector", text = "Where did you hear that name? Don't repeat it in the inn." } },
    gold_dust = { { id = "t_dust", text = "That's Remy's trade, and it's legal, barely. I keep an eye on it." } },
    kobolds = { { id = "tp_kobolds", text = "In Fargodeep, in Jasperlode, in my sleep. Count them before you fight them.", next = "threats" } },
    westfall = { { id = "tp_westfall", text = "It's not mine to hold. Some days I wish it were, and other days I'm glad it isn't." } },
    _none = { { id = "t_none", text = "Not a matter for the Guard." } },
  },
}
