-- Everlook's other residents (0.37.0): the goblin Umi means to frighten, the parts-maker, a Lordaeron refugee,
-- a Thorium Brotherhood smith, a tauren hunter, and the two flight masters. Voice: bibles/winterspring.md
local P = RPGDialogueAPI:Pack("rpgd.winterspring")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "legacki", id = TODO_NPC("Legacki"), name = "Legacki",
  bible = "bibles/winterspring.md", role = "citizen", tier = "service",
  communities = { "everlook" }, temper = { "smug" }, values = { "gossip", "comfort" },
  notices = { "race", "lock_steed" },

  impression = {
    first = "She thinks herself too clever to fear anything a goblin builds.",
    third = "{name} met Legacki, the goblin of Everlook who laughs loudest at Umi Rumplesnicker's inventions.",
  },

  greetings = {
    { id = "g_default", text = "Cold enough for you, darling? I've had three cups of something hot at Vizzie's prices, and one of 'em was supposed to be for washing, and I still can't feel my ears." },
    { id = "g_scared", when = { questRecent = { TODO_QUEST("Are We There, Yeti?"), days = 7 } },
      text = "Don't you come near me with anything furry, you hear? I know it was you, darling, and I know who put you up to it, and I'd bet my last gold piece she didn't even pay you properly." },
    { id = "g_away", when = { away = 14 }, text = "Oh, it's you, back after {away}, and I've still not got any feeling in my ears! You didn't bring anything furry back with you, did you?" },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "Darling, I hear you told someone in town a whopper and they swallowed it whole, and I'm not saying I'm impressed, but I'd pay good silver for lessons." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "Word is you talked somebody round today, darling, which is more than I've ever managed with Umi, so go and tell her that yeti isn't funny, would you?" },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "A gnome! You're not one of Umi's, are you, darling? Every time a tinkerer smiles at me lately, I check behind me and count my purse." },
    { id = "n_lock_steed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 5784, 23161 } },
      text = "Is that horse on fire, or am I seeing things? Hoofprints that smoke in the snow, ha, now that's a real fright, and Umi can keep her furry yeti!" },
  },

  start = "hello",
  nodes = {
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Of course it is, because a demon's real and Umi's yeti is just fur on a pile of gears! Not that I'd want it in my room, so if it starts sniffing about my door, I'll scream, and that'll only be because I'm being polite." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Of course it is, because the yeti's just gears, and that thing of yours is looking at me like it knows what my insides taste like! I'm not screaming yet, but I'm thinking about it very hard, so maybe steer it away from my door." },
      },
      choices = {
        { text = "A demon is nothing to laugh about, Legacki. Keep away from mine.", next = "BACK", reply = "Oh, don't be so serious, darling, it's terribly bad for the complexion. I'll keep my distance from your little pet if you keep it away from my good rug.", fx = { align = { light = 1 } } },
        { text = "Want me to set my demon on Umi's yeti? It'd be funny.", next = "BACK", reply = "Ooh, now that's a proposal I'd pay to see, darling, though I'll deny I ever said so. Just make sure Umi doesn't know where the sparks came from.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Of course I would, darling, because that's what warriors are for, isn't it? You stand at the front looking grim and dented, and clever goblins like me stand at the back looking lovely and holding the purse." } },
      choices = {
        { text = "Gladly. Standing in front of people is the whole point of the job.", next = "BACK", reply = "There, you see, a warrior who understands the arrangement! You take the bruises, I take the credit, and everyone's happier for it.", fx = { align = { honor = 1 } } },
        { text = "Only if you pay me. Shields aren't free, Legacki.", next = "BACK", reply = "Pay you? Darling, the privilege of protecting me is worth more than gold, but fine, I'll think about it. I'll let you know the rate after the yeti's gone.", fx = { align = { honor = -1 } } },
        { text = "Something else, darling.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I think Umi wants me to think so, darling, which is worse! There were tracks in the snow outside my window this morning, big ones, and if they're real yeti tracks I'll scream, and if they're Umi's I'll scream louder and send her the bill for my nerves." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I think Umi wants me to think so, darling, which is worse, because there were big tracks outside my window this morning. If {pet} could sniff them and tell me whether they smell of fur or of oil, I'd be ever so grateful." },
      },
      choices = {
        { text = "Tracks don't lie. I'll read them and tell you the truth, Legacki.", next = "BACK", reply = "You're a darling, truly, and if they're Umi's, I'll know who to send the bill to. If they're real, I'll be moving my room to the cellar.", fx = { align = { honor = 1 } } },
        { text = "I'll lay a few fake tracks of my own and keep the joke going.", next = "BACK", reply = "Oh, you wicked thing, and here I thought you were on my side! If I find a single extra footprint, darling, I'll know exactly who to blame.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "The Cartel cares about anything that pays, darling, and the woods don't, so that's the short answer. The long answer is that if the furbolgs keep going mad, nobody will come up the pass to buy anything, and an empty market's bad for everyone." } },
      choices = {
        { text = "The woods deserve care whether they pay or not.", next = "BACK", reply = "That's very sweet, darling, and if the woods ever start paying rent, I'll care about them twice as much. Until then, I leave the trees to the druids.", fx = { align = { light = 1 } } },
        { text = "Coin keeps the fires lit. The woods can wait.", next = "BACK", reply = "Finally, someone with sense, darling! A warm fire and a full purse, and the woods will still be standing when we're done.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Respect them? This is a Steamwheedle town, so we respect the exchange rate first and the weather second. Umi thinks the snow's a personal friend, and the troll witch doctor out in the hills thanks every critter she skins, but the rest of us just want the wind to stop getting under the door." } },
      choices = {
        { text = "Spirits don't pay for firewood. Coin does.", next = "BACK", reply = "Exactly, darling, and you'd be amazed how few people grasp it. The spirits never once bought me a drink.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "The land feeds this town. It deserves more than that.", next = "BACK", reply = "Oh, you sound just like that troll, darling, and she wears feathers in her hair. Fine, I'll respect the land, as long as it keeps the ice off my windows.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Hiding? Me? I'm simply keeping out of the way of an engineer with too much spare fur and not enough sense, darling. If you see it creaking about, you could always give it a nudge into a snowdrift, and I'd never tell a soul who did it, not even for money." } },
      choices = {
        { text = "I'll warn you if it comes, fair and square.", next = "BACK", reply = "You're a dear, and I'll remember it, darling, I always remember a favour. Just shout loud enough that I hear you over my own screaming.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll tip it over myself. Sounds like fun.", next = "BACK", reply = "Oh, would you? Darling, that would make my whole winter, and Umi's face would be priceless. I'll pretend I never asked.", fx = { align = { honor = -1 } } },
        { text = "I'll stay out of this one.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because Umi's been building one for weeks and swears it'll scare me silly, and I mean to see it scrapped before it gets the chance. If it's made of the junk she buys cheap from Felnok, it'll fall apart without your help, and I've got a gold piece riding on it." } },
      choices = {
        { text = "I won't wreck someone else's work for you.", next = "BACK", reply = "How very principled of you, darling, and how very inconvenient for me. I'll just have to find a mage with fewer scruples.", fx = { align = { order = 1 } } },
        { text = "One fireball, for the fun of it.", next = "BACK", reply = "Ooh, you're my favourite mage already, darling. Do it where I can watch, would you, from a good, safe distance?", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'll leave you two to it.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Dangerous, no, but it's the principle of the thing, darling, because a lady shouldn't have to scream in front of the whole of Everlook, it's bad for her credit. Mind you, I've seen worse things come down off that mountain, and none of 'em were made of tin." } },
      choices = {
        { text = "Then laugh it off. A good prank deserves a good sport.", next = "BACK", reply = "A good sport? Darling, I'm a goblin, not a saint, and my credit rating's at stake. Still, I suppose a lady can laugh when it's someone else screaming.", fx = { align = { honor = 1 } } },
        { text = "Then get her back. Every prank deserves a sharper reply.", next = "BACK", reply = "Now you're talking, darling, and I've been plotting all week. You'll keep my secret, won't you, for a lady in distress?", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Faith's welcome, so long as it pays its way like everything else under the Cartel's roof. Horde priests and Alliance priests all pray for the same thing up here, which is a warm bed and an honest deal, and only one of those is easy to find." } },
      choices = {
        { text = "Some of us pray for more than a warm bed.", next = "BACK", reply = "I suppose you do, darling, and good luck to you. But even the holiest priest sleeps better in a warm bed, I've noticed.", fx = { align = { honor = 1 } } },
        { text = "Then I'll pray for a better deal than yours.", next = "BACK", reply = "Ha! A priest who negotiates, darling, now I've seen everything. Pray away, but the Cartel will still get its cut.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_yeti", when = { killed = { name = "Yeti", min = 30 } },
          text = "Darling, the yetis up at Owl Wing Thicket are getting scarce, and I hear you're to blame. Where am I supposed to find inspiration for my little pranks on Umi if you keep killing it?" },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Ooh, a warlock! Now there's somebody who knows what real scary looks like, darling, and I'd wager you wouldn't jump at Umi's silly yeti, would you?" },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "Ooh, a warrior, all muscle and buckles! If Umi's yeti comes clanking round the corner, I'm hiding behind you, and I'm not ashamed of it one bit." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! You've tracked everything in Winterspring, I bet, so tell me, did you ever see Umi's yeti out in the snow, because I swear it moved by itself last night." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "Oh, a shaman, all bones and feathers and totems! It's a look, I'll give you that, though I'd lose a few of the teeth." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! Well, aren't you dashing, darling. If Umi asks whether you've seen me, you haven't, and I'll make it worth your while to keep forgettin'." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, how fancy! Do you think a fireball would melt a mechanical yeti, darling? I'm only asking out of curiosity, you understand, and maybe a small wager." },
        { id = "h_default", key = true,
          text = "Legacki, at your service, darling, and the only goblin in Everlook with any taste. You've met Umi? Then you've seen her latest toy, and I'll bet you a gold piece it falls apart before the thaw, and I always collect." },
        { id = "h_after", tags = { "news" }, when = { questDone = TODO_QUEST("Are We There, Yeti?") },
          text = "All right, all right, I screamed, and the whole of Everlook heard it, and now Umi says a yeti that makes me scream hasn't fallen apart, so she wants her gold piece. She's never going to let me forget it, and neither are the bruisers, who laughed until they wept." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Now there's a fashion I appreciate, all leaves and antlers and nobody telling you it's too much. What brings you to the frozen end of the world?" },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, how grand! You'll protect a poor goblin girl from a mechanical yeti, won't you? I'm joking, mostly, though I'd feel better with you standing between me and Umi's workbench." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, in Everlook! You'll be wanting a quiet corner for prayers, and I'll tell you now there isn't one, because Umi's built something that clanks." },
      },
      again = {
        { id = "h_again", text = "Anything else, darling? I've got gossip to spare, and nobody else in this town is worth sharing it with for free." },
        { id = "h_again2", text = "Ask away, but stand where I can see your hands." },
      },
      choices = {
        { text = "Does anyone in Everlook respect the spirits of this land?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "The goblins don't seem to care much for Winterspring's woods.", next = "druid_q", when = { class = "DRUID" } },
        { text = "What's wrong with Umi's inventions?", next = "umi" },
        { text = "There can't be much to do in Everlook.", next = "town" },
        { text = "Scared of yetis, are you?", next = "yetis", when = { questActive = TODO_QUEST("Are We There, Yeti?") } },
        { text = "Are you hiding from a mechanical yeti?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why would you want to melt a yeti?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do you really think Umi's yeti is dangerous?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does Everlook have any room for faith, Legacki?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Would you really hide behind me, Legacki?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Those tracks outside could be Umi's yeti walking about at night.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Is my demon scarier than Umi's yeti? Be honest, Legacki.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    umi = {
      lines = { { id = "u_default", text = "Nothing, darling, if you like smoke, springs and loud noises in the middle of the night. She's sweet, really, but she thinks a joke's not finished until somebody's fallen over, and somebody's usually me." } },
      choices = {
        { text = "You laugh at her, though.", next = "umi_laugh" },
        { text = "Something else.", next = "BACK" },
      },
    },
    umi_laugh = {
      lines = { { id = "ul_default", text = "Somebody has to keep her humble, darling, and it might as well be me. If she ever builds something that works, I'll be the first to clap, from a safe distance." } },
      choices = {
        { text = "Mocking a friend's work isn't kind.", next = "BACK", reply = "Unkind? Darling, it's the kindest thing I do all day, because nobody else tells her the truth. She'd be insufferable without me.", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Friends tease. She'll get you back.", next = "BACK", reply = "Oh, I know she will, darling, and I'll scream, and the whole town will laugh. That's what friends are for, isn't it?", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    town = {
      lines = { { id = "t_default", text = "Drink at Vizzie's, freeze, drink again, and watch the Horde and the Alliance pretend not to see each other across the square. It's the best show in Winterspring, darling, the bruisers keep it civil, and nobody even charges admission." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    yetis = {
      lines = { { id = "y_default", text = "Me? Scared? The yetis stay up in the hills where they belong, darling, and anything that comes down into town gets a bruiser's boot. Why do you ask, exactly, and who's paying you to?" } },
      choices = {
        { text = "No reason at all.", next = "END", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I came north for the Cartel's trade, darling, and stayed because nobody up here ever banged on anything. Then Umi arrived with a hammer and a mechanical yeti, and the rent went up besides." } },
    advice = { { id = "tp_ad", text = "Never turn your back on a goblin who's whistling, darling. That's free, and it's the best bargain you'll get up here." } },
    everlook = { { id = "tp_everlook", text = "Everlook's a lovely little town, cold as a banker's heart and twice as profitable. I've got no complaints, except for Umi and whatever she's building this week." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's the place to be if you want to get rich or get stabbed, and usually both. I prefer the snow." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Gnomeregan's gone, and every gnome in the world wants to tell you about it. I'd rather they told me something useful, like where they hid the treasure." } },
    _none = { { id = "tp_none", text = "No idea, darling, and if Umi told you about it, don't believe a word, and don't pay for any of it either." } },
  },
}

P:NPC {
  key = "felnok", id = TODO_NPC("Felnok Steelspring"), name = "Felnok Steelspring",
  bible = "bibles/winterspring.md", role = "questgiver", tier = "quest",
  communities = { "everlook" }, temper = { "fussy" }, values = { "precise", "dependable" },
  notices = { "craft", "lock_stones" },

  impression = {
    first = "He cares more about an uncracked horn than why anybody wants it.",
    third = "{name} met Felnok Steelspring, the careful gnome who builds parts for Tinkee Steamboil in Everlook.",
  },

  greetings = {
    { id = "g_default", text = "Careful, careful! Nothing on that bench is finished, and some of it is cold enough to take your skin off." },
    { id = "g_horns", when = { questActive = TODO_QUEST("Chillwind Horns") }, text = "Horns, uncracked horns! Tell me you didn't drop any of them on the way here." },
    { id = "g_away", when = { away = 14 }, text = "Careful, careful, you've been gone {away} and the bench is in a different order now! Don't touch anything until I tell you what's frozen." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear you talked somebody round in town, and if you've a knack for that, you might try it on Tinkee, who still thinks I'm slow. Mind the bench while you think about it." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Word is somebody caught you out in a fib, and I'll say I prefer my measurements honest and my customers likewise. Mind the bench." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "You smell of oil and burnt fingers, so you're an engineer. Don't touch the cooling coils; I counted them." },
    { id = "n_lock_stones", cat = "lock_stones", when = { class = "WARLOCK", carrying = { 5522, 13602, 13603, 1254, 13699, 13700, 13701 } },
      text = "Is that a firestone in your pack? I can feel it from here like an open furnace door, so please keep it on the far side of the bench, because these gears are measured to a hair and heat ruins the fit." },
  },

  start = "hello",
  nodes = {
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "An imp got into my packs in Booty Bay, years back, and set fire to a month of work just to see the colours. I don't blame the warlock entirely, since the little beast had a mind of its own, but I do keep a bucket of snow by the door now, and I'm not too proud to use it." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Once, in Booty Bay, and I've kept a bucket of snow by the door ever since, which you'll notice I've just moved a little closer. I don't blame you for what some other warlock's demon did, but yours is standing right beside my schematics, and I'd feel a great deal better if it weren't." },
      },
      choices = {
        { text = "A demon's master answers for it. I'll keep mine in hand.", next = "BACK", reply = "Exactly right, and I wish more warlocks thought as you do. A leash costs nothing, and a month of notes is a month I'll never get back.", fx = { align = { honor = 1 } } },
        { text = "Imps will be imps. You should have warded your packs.", next = "BACK", reply = "Warded them? Against an imp? I'd have needed a forty-percent thicker canvas and a binding glyph I couldn't afford, so no, friend, I'd rather the warlock did his job.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "That the chillwind horns hold the cold because the cold is the only thing they know, and anything warm and bright disturbs it. I've no proof yet, and Tinkee in the Burning Steppes is waiting on these, so I'd rather not discover it on her order." } },
      choices = {
        { text = "A sound precaution. I'll keep my distance from the bench.", next = "BACK", reply = "Very sensible, and I'll mark you down as a cooperative variable. Warm bodies near the bench raise the temperature two degrees at least, and the horns don't like it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Theories are for testing. I'd hold a horn and see.", next = "BACK", reply = "Absolutely not, no, please, the last one cracked when a paladin breathed on it! I test under controlled conditions, friend, and you are not a controlled condition.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The chillwind chimaerae, that's the use, because they breathe frost hard enough to freeze a fighter where they stand, and somebody has to get close. Trouble is, a warrior's whole idea of getting close is hitting things in the head, and I need those horns uncracked." } },
      choices = {
        { text = "Then I'll fight carefully and strike the body. The horns stay whole.", next = "BACK", reply = "Oh, thank you, and Tinkee will thank you too, in her own peculiar way. Body shots, always body shots, and mind the horns.", fx = { align = { order = 1 } } },
        { text = "I'll hit them however I can. Cracked horns are your problem.", next = "BACK", reply = "They are my problem, yes, and that's exactly why I asked you nicely. A cracked horn is worth less than the ore in my boot.", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because you can bring a chillwind down from a distance and choose where the arrow lands, can't you? The last fellow I sent swung his axe at the head and brought me eight horns in about thirty pieces." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Because you can bring a chillwind down from a distance and choose where the arrow lands, and the horns stay whole. Keep {pet} off the carcass until you've got them free, though, because teeth on a horn are as bad as an axe." },
      },
      choices = {
        { text = "A clean shot is the only honest way to bring down a chimaera.", next = "BACK", reply = "Precisely, and I'd write that in the margins of my notes if I had any margins left. I've had three horns come back split from axe blows this month alone.", fx = { align = { honor = 1 } } },
        { text = "I'll trap them and wait them out. Whatever keeps the horns whole.", next = "BACK", reply = "Oh, that's clever, very clever, and the horns stay ninety-five percent intact by my estimate. Just don't leave the trap where a yeti can step in it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Because the chimaera live in that wind all their lives, and the cold gets into the horn the way rust gets into iron. Tinkee wants them whole for her work, so I take them uncracked or not at all. I suppose you'd say there's a spirit of the ice in them, and I'd say it's density, and we could both be right, if you insist." } },
      choices = {
        { text = "A horn's a horn. Take as many as Tinkee pays for.", next = "BACK", reply = "Well, I'll take as many as she pays for, certainly, but I won't waste a beast for nothing. I'm precise, not greedy.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Respect the beast that gave the horn, Felnok.", next = "BACK", reply = "I do, I do, I'm not some goblin with a sack! Each horn gets labelled and logged, which is the most respect a gnome can give anything.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Chillwind horns, which Tinkee wants for her work in the Burning Steppes, and I don't ask what for, because the answer would only make me nervous. They have to be uncracked, mind, which means someone has to take them off live chimaeras very carefully." } },
      choices = {
        { text = "Better not to ask, when the coin is good.", next = "BACK", reply = "Exactly, and that's how I sleep at night, mostly. Ask too many questions in this trade and you start dreaming of what the answers are.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "You ought to know what your work is used for.", next = "BACK", reply = "Perhaps, but Tinkee pays on time, and knowing never made anything safer. I'll ask when the order's done, maybe.", fx = { align = { order = 1 } } },
        { text = "I'll keep my spells away from the bench.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "A gnome once tried to walk off with a gyromatic coil, and I caught him because the count was one short. That's the trick with thieves, friend, you don't watch them, you watch your inventory." } },
      choices = {
        { text = "Smart. Honest folk have nothing to fear from a count.", next = "BACK", reply = "Precisely, and the count never lies, unless I've made a mistake, which I haven't. I've counted twice already this morning, just to be sure.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A good thief would swap it for a fake.", next = "BACK", reply = "Then I'd count the fakes too, friend, because every fake weighs differently. Forty percent of thieves forget that, and the other sixty forget the count.", fx = { align = { honor = -1 } } },
        { text = "I'll keep my hands where you can see them.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Less than I should, I'll admit, though I said a few on the day Gnomeregan fell and I meant every word of them. Now I put my faith in good springs and careful hands, and I find that's mostly enough." } },
      choices = {
        { text = "Faith and craft go together. Keep both close, Felnok.", next = "BACK", reply = "I'll try, though craft has never once failed me and faith has done so at least twice. Still, it's comforting to have a second plan.", fx = { align = { light = 1 } } },
        { text = "Good springs never failed anyone. I'm less sure of prayers.", next = "BACK", reply = "No, they never did, and I trust a good spring more than a good wish. But I'll keep a prayer in my pocket, just in case the springs ever let me down.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Precise, sure, though I've never seen the schematics. You put your hands on a broken thing and it mends, which is the job I do with a spanner, only slower and with a lot more swearing." } },
      choices = {
        { text = "Discipline is the heart of both crafts, I think.", next = "BACK", reply = "That's a lovely way of looking at it, and very tidy. I've always said a healer is just an engineer who works on people instead of gears.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Prayer's no craft, Felnok. It's a gamble, like anything.", next = "BACK", reply = "A gamble? Oh, I don't like gambles, they make my notes untidy. Still, if it works more often than not, I'll call it a well-tested theory.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I take ore and scrap and the odd yeti hide, and I pay for it all, mostly. Machines don't grow on trees, druid, and Tinkee needs her order, but I'll admit Winterspring's quiet makes even a gnome think twice before he starts up a furnace." } },
      choices = {
        { text = "Take only what you need. Winterspring won't forgive greed.", next = "BACK", reply = "I do, I promise, and I count everything I take, so I'd know if I were greedy. Winterspring won't get one bolt more out of me than Tinkee needs.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Build what you like. The snow has plenty to spare.", next = "BACK", reply = "Thank you, though I'd rather not test the snow's patience. Last time I took too much ore from one ridge, half the ridge followed me home.", fx = { align = { order = -1 } } },
        { text = "Something else, Felnok.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "o_mekkatorque_blame", tags = { "news" }, when = { opinion = { topic = "mekkatorque", stance = "blame" } },
          text = "I hear you've been saying the High Tinker poisoned his own city. Mekkatorque made a hard choice to save who he could, and I'll hear no different in my workshop." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Gloves on, please, and keep whatever you've summoned well back, because a chillwind horn cracks if you so much as breathe on it wrong, let alone burn it." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin. Keep that hammer off my bench, if you please, and if your gauntlets have been near anything holy lately, don't touch the horns, because I have a theory about blessings and frost." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. Lean that shield anywhere but against my bench, please, because one good knock and a month of Tinkee's work ends up on the floor." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! Good, at last, somebody who might bring back a chimaera horn without a great axe-mark through the middle of it." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, is it? Kindly keep your totems off my bench, because I've a horn here that cracks if you so much as breathe on it." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage. Don't cast anything near my bench, please, because sparks and fine springs do not get along, and I've lost a whole box of them to a show-off before." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "Gloves, rogue, gloves. If you're going to handle anything on my bench, you'll wear gloves, and you'll not pocket a single spring, because I count them." },
        { id = "h_default", key = true,
          text = "Felnok Steelspring, and I build things for people who can't build them for themselves, to tolerances you could measure a gnat's whisker by. Right now that's Tinkee Steamboil, down in the Burning Steppes, and she wants her order finished yesterday, which is a schedule I've never once managed." },
        { id = "h_from_tinkee", tags = { "news" }, when = { questActive = TODO_QUEST("Felnok Steelspring") },
          text = "Tinkee sent you? Then she's sent me something she needs freezing, and I'm nearly ready for it, nearly being the word, because I'm still missing one part." },
        { id = "h_horns_before", when = { questDone = TODO_QUEST("Felnok Steelspring"), questBefore = TODO_QUEST("Chillwind Horns") },
          text = "I've got nearly everything Tinkee asked for, except the horns of the chillwind chimaera. They have to be uncracked, mind, because a cracked horn is worth nothing to me." },
        { id = "h_horns_during", tags = { "news" }, when = { questActive = TODO_QUEST("Chillwind Horns") },
          text = "Eight horns, all of them perfect, from the chillwinds out in the snow. Hit the beasts anywhere but the head, if you can manage it." },
        { id = "h_return", tags = { "news" }, when = { questActive = TODO_QUEST("Return to Tinkee") },
          text = "It's all packed and padded, so carry it level and don't let anyone sit on it. Tinkee will know what to do with it from there." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Good, you'll have steady hands, because everyone who prays a lot seems to, and steady hands are just what I need near this bench." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, eh? Keep your hands to yourself if they glow, because I'm working with chillwind horns and they don't take kindly to blessings." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, all the way up here in the snow? I build machines for a living, so I expect you'll disapprove of me, but I'll answer anything you like while I work." },
      },
      again = {
        { id = "h_again", text = "What else? I've a coil to wind to exactly forty-two and a half turns, and it won't wind itself." },
        { id = "h_again2", text = "Ask, but mind the bench." },
        { id = "h_again3", text = "Go on. I'll listen while I count these springs again." },
      },
      choices = {
        { text = "Why does that horn hold the cold so well?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What does Tinkee need all this for?", next = "tinkee" },
        { text = "What goes into Tinkee's order?", next = "horns" },
        { text = "Why work out here in the cold?", next = "cold" },
        { text = "Building something that stays cold must be tricky.", next = "eng", when = { profession = "Engineering" } },
        { text = "What are you working on, Felnok?", next = "xmage", when = { class = "MAGE" } },
        { text = "Has anyone actually stolen from you?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Does a gnome tinker have much use for prayer?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What does a tinker make of a priest's work, Felnok?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "A warrior could be of some use to you, Felnok.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Why would a hunter bring you better horns, Felnok?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do you take what you need from the land, Felnok?", next = "xdruid", when = { class = "DRUID" } },
        { text = "What's your theory about blessings and frost, Felnok?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Have you had trouble with a demon before, Felnok?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    tinkee = {
      lines = { { id = "tk_default", text = "Dragon eggs, I think, or something like them, from the black dragonkin in the Steppes. She wants them kept cold for study, and I build the bits that keep them cold. I don't ask more than that, because the people paying her don't like questions." } },
      choices = {
        { text = "Who's paying her?", next = "tinkee_patron" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tinkee_patron = {
      lines = { { id = "tp_line", text = "Somebody she calls a patron, very important, very rich and very secretive. Tinkee goes pale when she mentions him, so I stopped asking, and I'd advise you to stop as well." } },
      choices = {
        { text = "Someone should find out who he is.", next = "BACK", reply = "I'd advise against it, and very strongly, because Tinkee is not a gnome who frightens easily. Whoever frightens her is someone I'd rather never meet.", fx = { align = { order = -1 }, trait = { curious = 1 } } },
        { text = "A client's business is his own.", next = "BACK", reply = "Precisely, and I'm glad someone in this town understands discretion. Ask me about my clients and I'll show you a very boring list of numbers.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    horns = {
      lines = { { id = "hr_default", text = "Chillwind horns, mostly, because a chillwind horn holds the cold the way a bottle holds water, and I use them to line the cases. Crack one and the cold leaks out, and then whatever's inside spoils." } },
      choices = {
        { text = "Where do the chillwinds live?", next = "horns_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    horns_where = {
      lines = { { id = "hw_default", text = "Out in the snowfields, wherever the wind's worst, and they breathe frost on anyone who comes close. Take a warm cloak and a friend, and if your friend's slower than you, so much the better." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    cold = {
      lines = { { id = "c_default", text = "Because the cold here is free, friend, and in the Steppes it costs a fortune. Everlook's the only place I know where the weather does half my work for me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    eng = {
      lines = { { id = "e_default", text = "You don't build it cold, you build it to keep the warmth out, which is a different thing entirely. Layers, padding, sealed joints and good horn, and never open the lid to check, however tempted you are." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I make parts, I make them right and I make them on time. That's all there is to tell, and in a goblin town that's rarer than it sounds." } },
    advice = { { id = "tp_ad", text = "Wear gloves. Always wear gloves, in Winterspring and everywhere else." } },
    blackrock_spire = { { id = "tp_blackrock_spire", text = "My employer works near Blackrock Spire, and that's all I'll say about it. I make the parts, and I don't ask what they're for, because asking isn't part of the price." } },
    everlook = { { id = "tp_everlook", text = "Everlook's cold enough to keep a horn from cracking, which is the whole reason I'm here. The goblins are pleasant enough, though I wear gloves when I shake their hands." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Gnomeregan's lost, and I lost a good workshop with it. I don't talk about it much, and I'll thank you not to either." } },
    _none = { { id = "tp_none", text = "Not my department, friend. Ask somebody who isn't busy recalibrating a frost coil for the third time since breakfast." } },
  },
}

P:NPC {
  key = "jessica", id = TODO_NPC("Jessica Redpath"), name = "Jessica Redpath",
  bible = "bibles/winterspring.md", role = "questgiver", tier = "quest",
  communities = { "everlook", "argent_dawn" }, temper = { "quiet" }, values = { "family", "hope" },
  notices = { "race", "kin", "lock_shadow" },

  impression = {
    first = "She asks about Darrowshire the way people ask about a wound.",
    third = "{name} met Jessica Redpath, a Lordaeron refugee in Everlook who hopes to find her little sister.",
  },

  greetings = {
    { id = "g_default", text = "Hello, traveller. If you've come from the east, I'd be grateful for any news at all." },
    { id = "g_searching", when = { questActive = TODO_QUEST("Sister Pamela") }, text = "Have you been to Darrowshire yet? Please, don't spare my feelings when you do." },
  },

  notice = {
    { id = "n_forsaken", cat = "race", when = { race = "Scourge" },
      text = "You were from Lordaeron once, weren't you? Forgive me for staring; I keep looking for faces I knew." },
    { id = "n_refugee", cat = "kin", when = { origin = "human_lordaeron_refugee" },
      text = "You fled the north too, I can hear it in your voice. Did your family get out with you?" },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "The lamp just dipped when you came in, and it did the same thing the night the men in dark robes passed our farm outside Darrowshire. I'm sure it's only the draught, and I'm sorry for staring, but I can't help it." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Every day, though nobody up here has even heard of it. I'd like to think your spirits remember places like that, because the Scourge took everything else of mine." } },
      choices = {
        { text = "The spirits stand against the Scourge too, Jessica.", next = "BACK", reply = "They do, I think, and I can feel it when you speak, like a warm wind off the hills. It's good to know something old is on our side.", fx = { align = { light = 1 } } },
        { text = "Hope won't bring them back. Only vengeance matters.", next = "BACK", reply = "I've thought that too, on the worst nights, but I can't make myself believe it. If hope is all I have left, I'll keep it a little longer.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "You remind me of everything I lost, and I'm sorry to say it so plainly. My family stayed behind when the plague came, and I've wondered every night whether they rose, and whether the Light would have come back to them the way it came back to you." } },
      choices = {
        { text = "The Light never abandoned Lordaeron. It still answers.", next = "BACK", reply = "I want to believe that, more than you know, and hearing it from you helps. Mother used to light a candle in Stratholme's cathedral every Sunday, and I hope somebody heard her.", fx = { align = { light = 1 } } },
        { text = "The Light failed Lordaeron. I serve it for my own reasons.", next = "BACK", reply = "That's a hard thing to hear, and harder to hear from you, of all people. I won't argue, but I hope you find a better reason someday.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "No, I don't, though I've tried to. The men who brought the plague to Lordaeron dabbled in the same things you do, and it's hard to look at that creature of yours and not think of what came over the hills toward Darrowshire. But if you've been into the Plaguelands and seen my family's village, I'd hear it from anyone, even you." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "No, I don't, though I've tried to, and it's harder with that thing standing there and that sulphur smell coming off it. The men who brought the plague to Lordaeron dabbled in the same things you do, but if you've seen Darrowshire, I'd hear it from anyone, even you and your servant." },
      },
      choices = {
        { text = "Fear is fair. I'll prove I'm nothing like the Cult.", next = "BACK", reply = "Then I'll try to see it, I promise you. Only you'll understand if I watch your little friend more closely than I watch you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Power is power. The Cult just used it badly.", next = "BACK", reply = "That's exactly what they said, I think, before the plague. Please be careful with it, for all our sakes.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Everyone says they did, that they held the town until there was no town left to hold. I'd trade every brave story about it for one plain letter saying my family got out, though I know that's not what a warrior wants to hear." } },
      choices = {
        { text = "Standing your ground when all is lost is worth honouring.", next = "BACK", reply = "Thank you, I think they would have liked hearing that. Still, I'd rather have one of them alive than all the honour in the world.", fx = { align = { honor = 1 } } },
        { text = "They should have fled. There's no shame in surviving.", next = "BACK", reply = "That's what I wish they'd done, every single day. If any of them did, I hope they're somewhere warm.", fx = { align = { honor = -1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "After all this time, I know it's foolish, and the Plaguelands have swallowed every trail there ever was. But you people read the ground the way I read letters, and I can't help hoping it still has something to say." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I know it's foolish after all this time, but you read the ground the way I read letters, and I can't help hoping. My sister Pamela would have loved {pet}, I think, because she was always hiding strays in the barn." },
      },
      choices = {
        { text = "Some trails are worth following, however old they are. I'll look.", next = "BACK", reply = "Oh, would you? I can't pay you back with anything but thanks, but I'd be grateful for the rest of my life. Even a word would be more than I have now.", fx = { align = { light = 1 } } },
        { text = "The land doesn't remember the dead. You should let go of hoping.", next = "BACK", reply = "You may be right, but I've let go of everything else, and this is the last thing I've got. Please don't ask me to give it up yet.", fx = { align = { light = -1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "It's whiter and quieter, and nothing here remembers me, and some days I'm glad of that. Lordaeron had green hills and farms all the way to Darrowshire, and they say the plague has turned it all grey. If the land up there has spirits like yours, I hope somebody is still being kind to them." } },
      choices = {
        { text = "If I travel north, I'll ask the spirits after your family.", next = "BACK", reply = "You would do that? I can't tell you what it would mean, even if the spirits have nothing good to say. Thank you, truly.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let Lordaeron go. The living need you here.", next = "BACK", reply = "I'm trying, but some days the living feel very far away. Maybe you're right, and I'll try a little harder tomorrow.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Not that I know of, but mages travel farther than anyone, so every one who comes through Everlook, I ask whether they've heard any news of the folk from Darrowshire. They all shake their heads, and I keep asking anyway." } },
      choices = {
        { text = "Don't stop asking. Someone may know.", next = "BACK", reply = "I won't, I promise, and thank you for saying so. I've asked every mage who's come through Everlook since spring, and one of them is bound to know something.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They're probably dead. You should let go.", next = "BACK", reply = "Maybe he is, and maybe I'm a fool, but it's a fool's hope that gets me out of bed. Please, just leave me that much.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'm sorry. I've heard nothing of them.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Ruins, I'm told, and ghosts who still fight the battle that killed them. My family was there, and nobody can tell me whether they fell or fled, so if someone quiet could look among the houses, I'd be grateful just to know." } },
      choices = {
        { text = "I'll look, if I pass that way.", next = "BACK", reply = "Thank you, oh, thank you, and please be careful there. Even a scrap of news would be more than I've had in years.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Some things are better left buried.", next = "BACK", reply = "Maybe they are, but I'm not ready to bury them yet. I'll keep asking, even if no one wants to answer.", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "I hope you find your answer.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "I left before the plague came, and they stayed because the farm was all they had, and I've heard nothing since Darrowshire. Some days I pray they're safe, and some days, Light forgive me, I pray only that they're at rest." } },
      choices = {
        { text = "That's no sin, Jessica. The Light hears both prayers.", next = "BACK", reply = "Thank you for telling me that, it's a weight I've carried a long time. I'll try to pray without feeling guilty, then.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Hope can be cruel. Better to grieve now than wait forever.", next = "BACK", reply = "That might be wiser, and maybe someday I'll be strong enough for it. But not today, please, not yet.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "No, though I did for a while, because it's easier to be angry at someone than at a sickness in the grain. They died in the same fields as everyone else, and I've heard some of their order still fight on in the east, when most of us only ran." } },
      choices = {
        { text = "The order still stands. I'll carry its oath into the Plaguelands.", next = "BACK", reply = "Then go with my blessing, though I don't know what it's worth. If you find any trace of the Redpaths out there, I'd be grateful to hear it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The Hand failed Lordaeron. I serve the Light, not an order.", next = "BACK", reply = "I understand that, I think, because I don't trust much of anything anymore. Still, I'm glad the Light found someone who'll go east.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "For my family, if any of them still live, and for their rest if they don't. I've stopped asking the Light for answers, so if your prayers go somewhere else, send them anyway; I'll take whatever is listening." } },
      choices = {
        { text = "I'll pray for their rest, and for yours.", next = "BACK", reply = "Thank you, that's kind of you, and I'll try to take that prayer in. It's been a long time since anyone prayed for me.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The dead don't need prayers. Some of us walk regardless.", next = "BACK", reply = "I know, and I'm sorry if it sounded otherwise. I only meant that I don't know who's listening anymore.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Only whether anything grows there again. I can't go back, and I don't know if my family's alive, but if a druid told me the fields around Darrowshire had turned green, I think I could stop dreaming about them burning." } },
      choices = {
        { text = "I'll ask the Circle for you. You deserve to know.", next = "BACK", reply = "Would you? Even a whisper of green would be more than I've had in years, and I'd be grateful forever. Thank you.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Better to let Darrowshire go, Jessica. Look forward now.", next = "BACK", reply = "I've tried, believe me, I've tried. But Darrowshire's the only home I've ever known, and I can't let go of all of it.", fx = { align = { light = -1 } } },
        { text = "Something else, Jessica.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "o_scarlet_crusade_useful", tags = { "news" }, when = { gossip = { topic = "scarlet_crusade", stance = "useful" } },
          text = "Gregor says you'd forgive the Crusade a lot for killing Scourge. I've heard what they do to the villages they cleanse, and I can't." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Something about you puts me in mind of the Cult of the Damned back home, so I'll stand a little further off, though I'll still ask you whether you've been east." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "You're a warrior, aren't you? Darrowshire had soldiers once, good ones, who stood against the dead in the streets, but I've never heard who came out again." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "You look like someone who can find a trail where nobody else sees one. I wonder if you could find anything left of the road my family took out of Darrowshire." },
        { id = "h_shamancl", when = { class = "SHAMAN", faction = "Horde" }, text = "You're a shaman? I've never met one, though I've heard the orcs who speak to spirits are gentler than the ones I was taught to fear as a girl." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "You're a mage? Then perhaps you've been to Dalaran, or what's left of it. My family used to say the city's light could be seen from the hills on a clear night." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "You have the look of someone who goes where others can't, and finds what others miss. I wonder whether you've ever been to Darrowshire." },
        { id = "h_default", key = true,
          text = "I'm Jessica Redpath. I left Lordaeron before the plague reached us, but my family stayed behind, and I've heard nothing of them since the fighting at Darrowshire." },
        { id = "h_before", when = { minLevel = 53, questBefore = TODO_QUEST("Sister Pamela") },
          text = "You look like someone who could walk into the Plaguelands and come out again. My little sister Pamela was in Darrowshire when the dead came, and I miss her more than I can say." },
        { id = "h_during", tags = { "news" }, when = { questActive = TODO_QUEST("Sister Pamela") },
          text = "Darrowshire is in the southern hills of the eastern Plaguelands, below the old roads. Pamela would be little still, in my mind at least, with a doll she never let go of." },
        { id = "h_after", tags = { "news" }, when = { questDone = TODO_QUEST("Sister Pamela") },
          text = "You went to Darrowshire for me. I can see in your face that you found something, and I'm not sure yet whether I want to hear it." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest. Would you say a prayer for my family, if you have one to spare? I've said every one I know for them, and I'm afraid the Light has stopped listening to mine." },
        { id = "h_apaladin", when = { class = "PALADIN", faction = "Alliance" },
          text = "A paladin. My father used to say the Silver Hand would never let Lordaeron fall, and I wanted so much to believe him, and now look at us." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. If you're one of the Forsaken, I'll ask you plainly whether you ever walked near Darrowshire, and I'll try to bear whatever answer you give." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. I've heard your kind can make dead ground grow again, and I can't stop wondering whether that could ever reach the fields around Darrowshire." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A paladin, and one of the Forsaken. My father said the Silver Hand would never let Lordaeron fall, and now here you stand, one of Lordaeron's dead, with the Light still on you." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "You're a shaman? I was raised in Darrowshire to think only orcs called on spirits, and here you are, as kind-faced as anybody." },
      },
      again = {
        { id = "h_again", text = "Is there something else? I don't mind talking; it passes the time." },
        { id = "h_again2", text = "Go on, please. It's good to hear a voice that isn't a trader's." },
      },
      choices = {
        { text = "How does Winterspring compare to the land you left?", next = "xhsham", when = { class = "SHAMAN", faction = "Horde" } },
        { text = "Tell me about your family.", next = "family" },
        { text = "Everlook seems a long way from home for you.", next = "everlook" },
        { text = "What happened at Darrowshire?", next = "darrowshire" },
        { text = "I found Pamela in Darrowshire.", next = "found", when = { questDone = TODO_QUEST("Sister Pamela") } },
        { text = "My family fled the north too.", next = "refugee", when = { origin = "human_lordaeron_refugee" } },
        { text = "Have you asked mages about your family?", next = "xmage", when = { class = "MAGE" } },
        { text = "Darrowshire must hold something for you.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Tell me what you pray for, Jessica.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you blame the Silver Hand for what happened?", next = "xapala", when = { class = "PALADIN", faction = "Alliance" } },
        { text = "What would you have a priest pray for, Jessica?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Did the defenders of Darrowshire fight well, Jessica?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "A hunter might still pick up your family's trail.", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Is there any news you'd want me to bring you?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Do you think everyone who studies the dark arts serves the Scourge?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Do I remind you of Lordaeron, Jessica?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Do you miss Darrowshire, Jessica?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    family = {
      lines = { { id = "f_default", text = "My father, Joseph, and my little sister Pamela, and others besides. Father was stubborn about leaving our home, and I was the one who ran, and I've been sorry ever since that I didn't make them come with me." } },
      choices = {
        { text = "You couldn't have known what was coming.", next = "family_guilt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    family_guilt = {
      lines = { { id = "fg_default", text = "Nobody could, I suppose. People keep telling me that, and some days I believe them, and some days I sit here and think of every word I should have said before I left." } },
      choices = {
        { text = "You lived. That isn't a crime.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    everlook = {
      lines = { { id = "e_default", text = "I went as far from the plague as a ship would take me, and then further, and the further road ended here in the snow. The Argent Dawn's man, Gregor, is kind to me, and he writes down every rumour from the east." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    darrowshire = {
      lines = { { id = "d_default", text = "There was a battle there, they say, when the Scourge came down on the village and the people stood against them. I've heard it went very badly, and I've heard nothing else." } },
      choices = {
        { text = "Do you want the truth, if I find it?", next = "darrowshire_truth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    darrowshire_truth = {
      lines = { { id = "dt_default", text = "I think so, yes, though ask me again on a cold night and I might say no. Not knowing is its own kind of plague, and I've had it long enough." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    found = {
      lines = { { id = "fd_default", text = "Then tell me plainly, please, or don't tell me at all. I've imagined it a hundred ways already, and none of them were kind." } },
      choices = {
        { text = "She's at peace now, Jessica. Hold on to that.", next = "found_soft", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "You deserve the whole truth, however hard it is.", next = "found_hard", fx = { affinity = 1, align = { honor = 1 } } },
      },
    },
    found_soft = {
      lines = { { id = "fs_default", text = "At peace. I'll take those words and keep them, and I won't ask what you aren't saying. Thank you for going where I couldn't." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    found_hard = {
      lines = { { id = "fh_default", text = "Then she's gone, isn't she, and I knew it before you came back. Thank you for not lying to me; everyone else has been so careful, and all that care felt like lying." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    refugee = {
      lines = { { id = "r_default", text = "Then you know how it is, waking up thinking you're home and remembering you're not. Did you leave anyone behind?" } },
      choices = {
        { text = "Yes, and I still hope to find them.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "I don't talk about it.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I was a daughter of Lordaeron once, and now I'm a refugee in the snow. Neither one was my idea." } },
    advice = { { id = "tp_ad", text = "Say what you mean to the people you love before you leave home. I didn't." } },
    lordaeron = { { id = "tp_lordaeron", text = "I fled Lordaeron before the Scourge came, and I've been waiting for news of my family ever since. I came all the way to Everlook because a trader said he'd heard of them, and he hadn't." } },
    scourge = { { id = "tp_scourge", text = "The Scourge took Darrowshire, I'm told, and my family with it. I don't know what happened to them, and I'm afraid to know." } },
    stratholme = { { id = "tp_stratholme", text = "Stratholme was a day's ride from home, and we used to go to market there. I can't imagine it as it is now, and I don't want to." } },
    everlook = { { id = "tp_everlook", text = "Everlook is the farthest I could get from Lordaeron without falling into the sea. It's cold here, but nobody asks about the plague." } },
    _none = { { id = "tp_none", text = "I'm sorry, I don't know. Gregor might; he hears more than I do." } },
  },
}

P:NPC {
  key = "malyfous", id = TODO_NPC("Malyfous Darkhammer"), name = "Malyfous Darkhammer", title = "The Thorium Brotherhood",
  bible = "bibles/winterspring.md", role = "blacksmith", tier = "quest",
  communities = { "everlook", "thorium_brotherhood" }, temper = { "dismissive", "proud" }, values = { "craft", "pride" },
  notices = { "race", "craft", "lock_taint" },

  impression = {
    first = "He calls outsiders ants to their faces.",
    third = "{name} met Malyfous Darkhammer, the Thorium Brotherhood's proud Dark Iron smith in Everlook.",
  },

  greetings = {
    { id = "g_default", text = "Another one wanting something, I see, so speak quickly or go." },
    { id = "g_hide", when = { questActive = TODO_QUEST("Pip Quickwit, At Your Service!") }, text = "You have a hide for me? Show it, and we'll see if it's worth the air you're breathing." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Bronzebeard blood, I can smell it on you. Keep your opinions of my clan behind your teeth, and we'll get along well enough." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith, are you? We'll see; plenty of people hold a hammer, and very few know what to do with it." },
    { id = "n_lock_taint", cat = "lock_taint", when = { class = "WARLOCK", taint = { min = 30 } },
      text = "My forge flame bent toward you when you walked in, ant, and the edge of it went green. I have seen that colour in Blackrock where fools play with fire they do not own, so stand back from the anvil while we talk." },
  },

  start = "hello",
  nodes = {
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "Most ants who see a soot-black face reach for their axe first and ask my business after. I'll ask you plainly, then: what do you think of the Dark Iron clan?" },
      },
      choices = {
        { text = "Your clan started the War of the Three Hammers. Never forget.", next = "op_r1", fx = { affinity = -1, align = { honor = -1 }, opinion = { dark_iron = "hate" } } },
        { text = "The Brotherhood broke from Ragnaros. That earns respect.", next = "op_r2", fx = { affinity = 2, align = { honor = 1 }, opinion = { dark_iron = "respect" } } },
        { text = "Your clan's work is the finest in the world.", next = "op_r3", fx = { affinity = 1, trait = { witty = 1 }, opinion = { dark_iron = "admire" } } },
        { text = "A Bronzebeard trusts no Dark Iron, smith. Not yet.", next = "op_r4", fx = { trait = { cautious = 1 }, opinion = { dark_iron = "distrust" } }, when = { race = "Dwarf" } },
        { text = "I've no quarrel with you, smith.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "The Sorcerer-Thane is two hundred years dead, and plenty of my clan curse his name as hard as you do. The Brotherhood bends no knee to Ragnaros, and you'd do well to remember it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "It does, and it costs plenty as well. There's not a Brotherhood smith alive who hasn't been spat at in Ironforge." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "Flattery, but accurate flattery, which I'll allow. Bring me the hide and I'll show you how accurate." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r4 = {
      lines = { { id = "op_r4_default", text = "Not yet is better than never, {g:lad|lass}, and I'll take not yet." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpt_malyfous = {
      big = true,
      lines = { { id = "xpt_malyfous_default", text = "Most of them do, and I can hardly blame them, given what Thaurissan's people have done since the War of the Three Hammers. But the Brotherhood left the Emperor's halls to work for ourselves, and I'll not apologize for the blood of a clan I walked away from." } },
      choices = {
        { text = "A dwarf should be judged by his own deeds, not his clan's.", next = "BACK", reply = "Few of your kind say so, and fewer mean it. Judge us by what we forge, then, and you'll find our deeds are better than our name.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Blood is blood. The Dark Irons earned that mistrust.", next = "BACK", reply = "Earned, yes, and I'll not pretend otherwise, for I left that mountain for good reason. Still, a man's blood is not his oath, and mine was sworn elsewhere.", fx = { align = { honor = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xcl_brd = {
      big = true,
      lines = { { id = "xcl_brd_default", text = "Free of him, not free, and you surface folk always confuse the two. Ragnaros still burns beneath the mountain, and the Dark Irons who knelt to the Emperor will kneel to the fire next, while the Thorium Brotherhood goes on working metal and keeping its own counsel." } },
      choices = {
        { text = "Your people deserve better than the Firelord. Help them.", next = "BACK", reply = "Help them? They'd sooner throw me into the forge than listen to me, surface-dweller. But I'll forge weapons for those who go down, and that's help enough.", fx = { align = { light = 1 } } },
        { text = "Let them kneel. Fools choose their own masters.", next = "BACK", reply = "Fools, aye, and some of them my kin, which is the bitterest part. I did not leave that mountain to watch them burn, but I'll not weep for them either.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Did the Brotherhood ever serve the Emperor?", next = "xcl_brd2" },
      },
    },
    xcl_brd2 = {
      lines = { { id = "xcl_brd2_default", text = "We served the forge, and the forge sat in his city, so ask yourself how much choice that was. Some of us left his halls for Thorium Point, and I came farther still, to the snow, because the cold is honest and the Emperor never was." } },
      choices = {
        { text = "The cold suits you, Malyfous. Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Your fire burns and is gone, ant. A forge's fire goes into the metal and stays there, and the blade remembers it long after the smith is dust, which is the only kind of magic the Brotherhood respects. Bring me ore from the Searing Gorge and I'll show you what fire is for." } },
      choices = {
        { text = "Fair. Craft that lasts deserves more respect than a spell.", next = "BACK", reply = "Hmph, a mage with sense, which is rarer than thorium in these hills. Keep your respect, ant, and I'll keep my forge lit.", fx = { align = { order = 1 } } },
        { text = "My fire's done more good in a moment than your hammer in a year.", next = "BACK", reply = "Then go and spend your moment, mage, and come back when your spell has outlived you. My hammer will still be here.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Your smith quenched it in water, I'd wager, and folded nothing, so it will turn a furbolg's claw and split under a real blow. A Brotherhood smith would work thorium and fire into it until it rang, and you'd never need another set." } },
      choices = {
        { text = "Good steel is earned. I'll earn the Brotherhood's the honest way.", next = "BACK", reply = "Honest, he says, as if the Brotherhood had ever handed anything out for less. Bring the ore and the patience, and we'll see what you're worth.", fx = { align = { honor = 1 } } },
        { text = "I'll take Brotherhood steel off a corpse in Blackrock Spire, cheaper.", next = "BACK", reply = "Then go and pry it off a corpse, ant, and see how well it fits a living back. Stolen steel was never forged for you.", fx = { align = { honor = -1 } } },
        { text = "Never mind my armour.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The hide of the Beast in Blackrock Spire, for one, though few who go after it come back with anything. An arrow at least leaves a smaller hole than a warrior's axe, so if anyone brings me that hide whole, I expect it will be one of your kind." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "The hide of the Beast in Blackrock Spire, for one, and if anyone brings me that whole, it will be one of your kind. That {pet} of yours stays outside my forge, though, because beasts chew leather." },
      },
      choices = {
        { text = "I'll bring you a clean hide or none at all.", next = "BACK", reply = "Clean, or none, and you mean it, I can hear that much. Bring me such a hide and I'll work it as it deserves.", fx = { align = { honor = 1 } } },
        { text = "I'll buy a hide off someone luckier and call it mine.", next = "BACK", reply = "And I'd know it, the moment I put my hand on it, because a hide remembers who skinned it. Don't insult my craft, ant.", fx = { align = { honor = -1 } } },
        { text = "Never mind the hides.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "A forge answers to the smith, ant, and that is the lesson my people learned at a terrible price beneath Blackrock. Thaurissan called up the Firelord thinking fire would serve him, and now Ragnaros rules our kin. I keep my fire small and my hammer heavy, and I do not ask the flame what it wants." } },
      choices = {
        { text = "Fire must be respected, not commanded. Your people learned that.", next = "BACK", reply = "Learned it, aye, in chains and in ash, and a few of us remember the lesson still. You speak like one who knows fire, shaman.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Then bind it better than Thaurissan did, smith.", next = "BACK", reply = "Thaurissan thought he'd bound it well enough, and his people are still paying. No smith binds the Firelord, ant, he only feeds it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Thaurissan summoned him to win a war against Ironforge, and the Firelord has held the Dark Iron ever since. The Thorium Brotherhood are those of us who chose the forge over the chains, so you will forgive me, ant, if I think little of anyone who bargains with fire for a living." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Thaurissan called him up to win a war against Ironforge, and the Firelord has held the Dark Iron ever since, so you'll forgive me if I mislike that heat at your heel, ant. It smells like the Molten Core to me, and the Thorium Brotherhood are those of us who walked out of that fire." },
      },
      choices = {
        { text = "Your kin made a bad bargain. I'll make better ones.", next = "BACK", reply = "Every warlock says that, and every one of them is wrong, eventually. My people were proud too, before the fire swallowed them.", fx = { align = { light = -1 } } },
        { text = "You chose rightly. No power is worth those chains.", next = "BACK", reply = "We did, and it cost us everything but the hammer. I'd sooner freeze up here with an honest anvil than sweat down there with Ragnaros breathing on my neck.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'll leave you to your forge.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "We could make one that would cut through anything you pointed it at, if you proved worthy of our trust and brought us the ore and the arcanite. Until then, sharpen what you have, and stop dragging it across stone when you sneak." } },
      choices = {
        { text = "I'll earn your trust, and the blade with it.", next = "BACK", reply = "Earn it, then, and we'll see if your hands are as quick as your tongue. I don't forge for anyone I wouldn't trust at my back, ant.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll find a smith who's less particular.", next = "BACK", reply = "Go and find one, then, and you'll find the steel shows it. I've seen what passes for a blade in Gadgetzan, ant, and I wouldn't use it to stir soup.", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "I'll sharpen what I have.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "My kin under Blackrock bow to Ragnaros now, and before him they bowed to Thaurissan and his ambition. The Brotherhood bows to nothing but the anvil, and I have found the anvil a more honest master than any god." } },
      choices = {
        { text = "The Light sees honest work, even in the snow.", next = "BACK", reply = "Perhaps it does, though it never came down Blackrock to look. My anvil sees my work too, and it's never lied about it.", fx = { align = { light = 1 } } },
        { text = "Then trust your anvil. Gods have failed better men than you.", next = "BACK", reply = "Ha! That is the first sensible thing a paladin has said to me in years. The anvil, at least, has never asked me to kneel.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "In fire, and in thorium, and in the hammer that joins them, because those three have never lied to me. My people put their faith in Ragnaros once, and it left them slaves in their own mountain, so I'll not kneel to anything again." } },
      choices = {
        { text = "Faith in your own work is no small thing.", next = "BACK", reply = "No, it is not, and few surface-dwellers understand it. Faith in your own two hands is the only faith that never chains you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Everything kneels to something, smith. You just chose the hammer.", next = "BACK", reply = "Perhaps I did, ant, but the hammer has never once asked me to burn my kin for it. I'll take that bargain over any god's.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I feel its absence, ant, which is worse. My people still bow to the fire under Blackrock, and the Brotherhood walked away from it with nothing but our hammers. Your kind speak of balance with the land; a Dark Iron who's left the mountain learns what balance costs, and I paid it." } },
      choices = {
        { text = "Breaking that chain took courage. You chose rightly, Malyfous.", next = "BACK", reply = "It took fire, and the loss of it, and I still dream of the halls. But I'd not go back, druid, not for all the warmth beneath Blackrock.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A smith with no fire is still a smith. Stop brooding.", next = "BACK", reply = "Brooding, he calls it, as though grief were a thing to be stopped by asking. I'll brood as I like, ant, and forge while I do.", fx = { align = { honor = -1 } } },
        { text = "Something else, Malyfous.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_malyfous", tags = { "news" }, when = { party = { race = "Dwarf" } },
          text = "You bring a dwarf of the mountain with you, and {companion} is looking at me the way they all do, as though a Dark Iron at a forge must be hiding a knife in his apron." },
        { id = "h_cl_brd", tags = { "news" }, when = { cleared = "Blackrock Depths" }, text = "So the Emperor's dead in his own throne room, ant, and Shadowforge City has no king. The Brotherhood will be drinking to it, and I will be at my forge, because a king dying never made one bar of iron better." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, ant. You spin fire out of nothing and call it craft, and I've spent my life coaxing it from coal and bellows, so don't expect me to be impressed." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, ant, wearing armour some fool hammered out in a hurry. Stand there long enough and I may tell you everything that's wrong with it." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, ant, with a bow I wouldn't hang on my wall. Still, hunters bring hides in less ragged than the rest of you, and the Brotherhood has a use for hides." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. My people bound fire once and were burned for it, ant, so don't expect me to be impressed by your little totems." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "You stink of brimstone, ant. My kin under Blackrock let a fire lord into their mountain and are slaves to him still, so do not think your little demon impresses a Dark Iron." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "Rogue. I can see the blades at your belt from here, and the edges are poor. A real smith would weep to see them." },
        { id = "h_default", key = true,
          text = "I am Malyfous Darkhammer of the Thorium Brotherhood, and I do not waste my hours on idle talk. If you have a task worthy of my hammer, name it; if not, there are snowdrifts outside you could study." },
        { id = "h_warm", when = { reputation = { faction = "Thorium Brotherhood", min = "honored" } },
          text = "You're known to the Brotherhood, I see, so you'll have a little patience from me. A little." },
        { id = "h_beast", when = { minLevel = 58 },
          text = "There's a beast in Blackrock Spire whose hide would make armour fit for a king, if anyone could skin it whole. The odds of a pristine hide are one in a million, so I don't expect you to bring me one." },
        { id = "h_after", tags = { "news" }, when = { questDone = TODO_QUEST("Pip Quickwit, At Your Service!") },
          text = "You brought me the hide, and it's pristine, so the catalogue is open to you. Choose carefully, because I don't make anything twice." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, clanking like a cart of scrap. The Light means little to a Dark Iron, ant, but your armour is decent work, so I will grant you a minute." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, here in the cold. Pray all you like, ant, but no god ever tempered a blade, and I've no time for anything that can't." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, the sort that sleeps in trees. You'll find nothing here for you, ant, unless you've learned to bend a forge to your will the way you bend your shape." },
      },
      again = {
        { id = "h_again", text = "Still here? Then say what you want." },
        { id = "h_again2", text = "More questions. The ants always have questions." },
      },
      choices = {
        { text = "Does a Dark Iron forge answer to the fire spirits?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I've heard of the Thorium Brotherhood.", next = "brotherhood" },
        { text = "What's the finest thing you could make?", next = "hide" },
        { text = "Everlook is a long way from home for a Dark Iron.", next = "everlook" },
        { text = "A Dark Iron, trading with my people?", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Teach me something about the forge.", next = "smith", when = { profession = "Blacksmithing" } },
        { text = "Ragnaros enslaved your people?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Could the Thorium Brotherhood make a better blade?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I'd guess the Dark Irons have never known the Light, Malyfous.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Does a Dark Iron smith put faith in anything, Malyfous?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "You're frowning at my armour, Malyfous.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What hides would the Brotherhood want from a hunter?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do you feel the mountain's fire up here, Malyfous?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Is a mage's fire really so different from a forge's, Malyfous?", next = "xmage", when = { class = "MAGE" } },
        { text = "Thaurissan is dead, Malyfous. Your clan is free of him.", next = "xcl_brd", when = { cleared = "Blackrock Depths" } },
        { text = "Do the other dwarves still treat you as an enemy, Malyfous?", next = "xpt_malyfous", when = { party = { race = "Dwarf" } } },
        { text = "Goodbye.", next = "END" },
      },
    },
    brotherhood = {
      lines = { { id = "b_default", text = "Smiths of my clan who were slaves to the Firelord in the depths of Blackrock, and who broke their chains and walked out. We trade with anyone who pays, and we bow to no one, least of all fire." } },
      choices = {
        { text = "What do people make of your clan, out here?", next = "op_ask" },
        { text = "Escaping Ragnaros can't have been easy.", next = "brotherhood_escape" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brotherhood_escape = {
      lines = { { id = "be_default", text = "It was not, and many who tried are still down there, burned or worse. We made what freed us with our own hands, and that is why our work is the best you'll find above the ground." } },
      choices = {
        { text = "Freedom earned by your own hands. I respect that.", next = "BACK", reply = "Respect is easy to say and hard to earn, but I'll take it from you, this once. Our freedom cost more than you can know.", fx = { affinity = 2, align = { order = -1 } } },
        { text = "Your clan served the fire willingly once.", next = "BACK", reply = "Willingly, aye, and in fear, which is a worse kind of willing. Those of us who woke to it left, and the others are still down there.", fx = { affinity = -2, align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hide = {
      lines = { { id = "h_line", text = "Armour, and armour of a caliber you have never worn: a breastplate for a fighter, leggings for a spellcaster, and more besides. Every piece needs the hide of the Beast in Blackrock Spire, whole and unmarked, and other things harder still to find." } },
      choices = {
        { text = "How hard is that hide to come by?", next = "hide_odds" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hide_odds = {
      lines = { { id = "ho_default", text = "One in a million, and I'm being generous. Most who try come back with a ruined hide and a bigger scar, and I send them away, because I will not put my name on scraps." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
    everlook = {
      lines = { { id = "ev_default", text = "The goblins here pay, they don't ask where I come from, and nobody in Everlook has tried to spit at me yet. In the Brotherhood's trade, that counts as a fine place to work." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dwarf = {
      lines = { { id = "dw_default", text = "Your people and mine fought a war over a mountain long before you were born, and we lost, and we've been paying for it since. I'll sell you good work, Bronzebeard, but don't ask me to love you for it." } },
      choices = {
        { text = "That war's done. We can trade like honest folk.", next = "BACK", reply = "Honest folk, he says, and a Bronzebeard at that. I'll trade with you, then, and we'll leave the old war under its stone.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A Dark Iron's word isn't worth much in Ironforge.", next = "BACK", reply = "Nor is a Bronzebeard's worth much under Blackrock, so we're even. Buy what you came for and spare me the history.", fx = { affinity = -2, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    smith = {
      lines = { { id = "sm_default", text = "Heat is patience, not force, and the metal tells you when it's ready if you listen. You surface folk beat it until it obeys, and then you wonder why your blades break." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I was born under the mountain and I forged for a master of fire. Now I forge for myself, and for whoever pays." } },
    advice = { { id = "tp_ad", text = "Don't bring me anything less than perfect. It saves us both a walk." } },
    dark_iron = { { id = "tp_dark_iron", text = "My people are slaves to the fire in the mountain, the ones who stayed, and the Brotherhood is what's left of the ones who chose otherwise. Don't call me Dark Iron unless you mean it as a compliment, ant." } },
    thaurissan = { { id = "tp_thaurissan", text = "Emperor Thaurissan rules the Dark Irons in Blackrock Depths, and he's welcome to it. I'd sooner forge in the snow than kneel to that one." } },
    blackrock_depths = { { id = "tp_blackrock_depths", text = "Blackrock Depths is a city of fire and chains under the mountain, and I spent enough of my life there. The Brotherhood's forge is the only thing I miss." } },
    everlook = { { id = "tp_everlook", text = "Everlook is cold and quiet, and the goblins pay on time, unlike most of the ants who come begging at my anvil. The forge burns hot enough up here, if you feed it right." } },
    _none = { { id = "tp_none", text = "The Brotherhood doesn't waste time on that. Neither will I." } },
  },
}

P:NPC {
  key = "storm", id = TODO_NPC("Storm Shadowhoof"), name = "Storm Shadowhoof",
  bible = "bibles/winterspring.md", role = "questgiver", tier = "quest",
  communities = { "everlook" }, temper = { "stern" }, values = { "hunt", "honor" },
  notices = { "race", "class", "lock_shards" },

  impression = {
    first = "He measures people by whether they would face a charging bear.",
    third = "{name} met Storm Shadowhoof, the tauren who hunts Winterspring's greatest beasts.",
  },

  greetings = {
    { id = "g_default", text = "The snow carries tracks a long way. Have you come to hunt, or to watch?" },
    { id = "g_away", when = { away = 14 }, text = "You have been gone {away}, and the snow has covered your old tracks, but I am glad to see you making new ones." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You have grown stronger since we last spoke, and I think now you would stand your ground when the bear charges, which is the only measure I trust." },
    { id = "g_word_threat", when = { word = "intimidated" }, text = "I hear you made someone in Everlook afraid, and fear is a hunter's tool, but not one to use on the people around the fire." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The traders say you have helped Everlook, and I have heard it from more than one of them. That is a good track to leave behind you." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Earth Mother keep you, child of Mulgore. These hills are colder than our plains, but the beasts here would make our elders proud." },
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "You walk like a hunter, quiet and watching. Good; the beasts of Winterspring kill the careless first." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 5 } },
      text = "Your bag hums with the souls of beasts, and some of them were taken from Winterspring, I think. The hunter gives thanks for a kill, and you give it a jar, so tell me at least that the frostsabers fought you honestly." },
  },

  start = "hello",
  nodes = {
    op_ask = {
      big = true,
      lines = {
        { id = "op_ask_default", text = "My chieftain Cairne gave the tauren a home in the Horde, and some of our elders still grumble that we traded the old ways for orc friendship. What do you think of Cairne's choice?" },
      },
      choices = {
        { text = "Cairne chose wisely. Thrall helped save your people.", next = "op_r1", fx = { affinity = 1, align = { honor = 1 }, opinion = { cairne = "respect" } } },
        { text = "The tauren were stronger before the orcs came.", next = "op_r2", fx = { affinity = -1, align = { honor = -1 }, opinion = { cairne = "doubt" } } },
        { text = "Any alliance that holds through hard winters is worth keeping.", next = "op_r3", fx = { trait = { practical = 1 }, opinion = { horde = "useful" } } },
        { text = "Cairne is wise. The Earth Mother guided him to Thrall.", next = "op_r4", fx = { affinity = 1, opinion = { cairne = "admire" } }, when = { race = "Tauren" } },
        { text = "That's for the tauren to say.", next = "BACK" },
      },
    },
    op_r1 = {
      lines = { { id = "op_r1_default", text = "He did, and the centaur learned what an orc's axe and a tauren's totem can do together. I would make the same choice." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r2 = {
      lines = { { id = "op_r2_default", text = "Stronger? We were running from the centaur, stranger, and the orcs ran with us. I will not hear the old days spoken of so kindly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r3 = {
      lines = { { id = "op_r3_default", text = "Spoken like someone who has seen a hard winter. This one is long, so I hope the Horde holds." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    op_r4 = {
      lines = { { id = "op_r4_default", text = "She did, and I am glad to see she walks with you even this far north." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I might, if you did not send that creature in to do the killing. A beast of Winterspring deserves to die facing the one who hunts it, and there is no honour in a death dealt by something that never lived at all." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I might, if the warlock did not send the demon in to do the killing, and I see you have brought yours to listen. A beast of Winterspring deserves to die facing its hunter, and that thing has never lived, so it can do nothing for a saber but end it without honour." },
      },
      choices = {
        { text = "Then I'll face the beast myself, and leave my companion behind.", next = "BACK", reply = "Then you will learn the beast, and the beast will learn you, and that is the hunt. Go well, and may the Earth Mother guide your aim.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A kill's a kill. The beast won't care who struck it.", next = "BACK", reply = "The beast will not care, but you will, if you have any heart in you. A death given by another's hand teaches you nothing about yourself.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The great bears here stand taller than a tauren, and the frostsabers strike from the snow before you see them. Your Light will not stop a claw, but a steady heart might, and I have seen that in some of your kind and not in others." } },
      choices = {
        { text = "I'd stand my ground and give the beast a clean death.", next = "BACK", reply = "That is the way of my people, and the beast will honour you for it in its passing. Thank its spirit after, and the snow will remember you kindly.", fx = { align = { honor = 1 } } },
        { text = "I'd let the Light blind it and strike while it's helpless.", next = "BACK", reply = "That is a cruel road, and you'll learn nothing from the beast but its fear. The Earth Mother does not smile on a blinded kill.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because Ursius of the Shardtooth charges like a falling hill, and the warrior who runs to meet him is thrown, while the one who plants both feet and waits is only knocked down. A hunter lets the beast tire itself, but a warrior must take the blow, so take it well." } },
      choices = {
        { text = "Then I'll plant my feet and take the blow, as a warrior should.", next = "BACK", reply = "Good, and you will walk away bruised but standing, which is all a warrior can ask of Ursius. Plant your feet like a tauren and you will not fall.", fx = { align = { order = 1 } } },
        { text = "I'll meet him at a run. Fury breaks a charge.", next = "BACK", reply = "Many have tried it, and many were thrown into the snow like calves. I have seen the scars that bear leaves, and they are not the scars of a beast that breaks.", fx = { align = { order = -1 } } },
        { text = "Something else, Storm.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Shy-Rotam, the old frostsaber, for she has been hunted many times and has never been found unless she wished it. I followed her tracks for three days and lost them on bare stone, and I was not ashamed, for she is cleverer than I am." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Shy-Rotam, the old frostsaber, who has never been found unless she wished it. Your {pet} has good feet for snow, I see, but keep it downwind, or she will know you are coming before you have strung your bow." },
      },
      choices = {
        { text = "A beast like that deserves to be faced, not trapped.", next = "BACK", reply = "Then we hunt the same way, you and I, and I think you will find her one day, or she will find you. Either way, it will be an honest meeting.", fx = { align = { honor = 1 } } },
        { text = "Cleverness answers cleverness. I'd bait her out and take her.", next = "BACK", reply = "Bait would be clever, and Shy-Rotam is cleverer still, so I wish you luck. She has walked around every snare I have ever set and left her tracks beside them, as if laughing.", fx = { align = { honor = -1 } } },
        { text = "Something else, Storm.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "The leaders of the herds and packs, the old chimaera and the great bears the young ones follow. When a leader falls the herd scatters for a season, so I choose carefully and never take more than one a year." } },
      choices = {
        { text = "That is a fair hunt. The herd grows stronger for it.", next = "BACK", reply = "It does, and you see as the druids see, which I am glad of. The old and the slow are taken, and the young run faster next spring.", fx = { align = { honor = 1 } } },
        { text = "Why hunt them at all? Let the leaders lead.", next = "BACK", reply = "Because the leaders grow old and the herd grows slow behind them, and the snow does not wait. The Earth Mother made the hunt to keep the herds young.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I believe they do. Ursius of the Shardtooth, Brumeran of the Chillwind and Shy-Rotam the frostsaber have lived long enough to grow great, and nothing in this snow grows old without the land's favour. I hunt them with respect and give the spirits thanks after every hunt, because a hunter who forgets his thanks soon stops coming home." } },
      choices = {
        { text = "A hunt given thanks is the only honourable hunt.", next = "BACK", reply = "It is, and the beasts know it, I believe, as they pass into the wind. Walk that way, and the spirits will walk beside you.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The spirits don't choose who's hunted. Strength decides.", next = "BACK", reply = "Strength decides the end of the hunt, perhaps, but not its honour. My father hunted these hills before me, and he never once took a beast he did not thank.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I would track it from hiding and face it in the open, because a hunt that ends with a blade in the back is a killing and nothing more. You may hunt as you like, but the leaders of the herds deserve to see what comes for them." } },
      choices = {
        { text = "Facing your prey is the honourable way.", next = "BACK", reply = "It is the only way I know, and my fathers knew no other. May you face your prey and find yourself in its eyes.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A kill is a kill. The beast won't care.", next = "BACK", reply = "The beast will not care, but the hunter should. I hope one day you learn the difference.", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "I'll think about that.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "In war, yes; I have seen mages turn a battle. But a hunt is between the hunter and the beast, and a bolt of frost from far away teaches you nothing about the animal you killed, which is the whole reason to hunt." } },
      choices = {
        { text = "You're right. I'll hunt with my own hands.", next = "BACK", reply = "Then you will learn more in one hunt than a hundred battles could teach you. The beast will teach you, if you let it.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A hunt is about the kill. Use what works.", next = "BACK", reply = "Then call it a killing, not a hunt, and I will have no quarrel with you. But do not call it by my people's word.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "We hunt differently, then.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Always, and I thank the beast after, because a hunt without thanks is only killing. The frostsabers and the ice bears give their lives to the snow every winter, and a hunter who forgets that soon joins them." } },
      choices = {
        { text = "Then I'll give thanks for every beast I take.", next = "BACK", reply = "Then you will hunt as a tauren hunts, and the beasts will know it. The Earth Mother watches how we take from her.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Thanks don't fill a belly. A clean kill is enough.", next = "BACK", reply = "A belly is filled either way, I grant you. But the spirit of a beast taken without thanks walks hungry for a long time.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dd_bears = {
      lines = {
        { id = "dd_bears_1",
          text = "I did not say that. The bears are strong and the snow is hard, and a hunter who brings meat to Everlook keeps the town alive through the long dark. I only wonder whether you took what you needed, or what you could." },
        { id = "dd_bears_2",
          text = "On the plains of Mulgore we thank the kodo before the spear falls, and we leave the young and the old for the next season. Here, nobody leaves anything, and the herds remember it." },
      },
      choices = {
        { text = "I took what I needed and gave thanks for it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The hills are full of bears. I'll take what I like.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Storm.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_dd_bears", when = { killed = { name = "Shardtooth", min = 30 } },
          text = "The Shardtooth bears of the eastern hills grow fewer, and the hunters' fires in Everlook say it was your hand that thinned them. The Earth Mother sees how you hunt, young one, and so do I." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "That thing at your side watches me as a wolf watches a calf, and I do not like it, but I will speak with you, because I judge the hunter and not the hound." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin. You wear your armour like a bear wears its hide, and I think you would stand in front of a charge, though I would like to see it before I believe it." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. You would stand in front of a charging bear, I think, and I measure everyone by that, but whether you would stand still is another question." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, in the snows of Winterspring, where the beasts are as great as any in the world. Walk with me a moment, for there is much to tell of the hunts here." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, the Earth Mother's blessing on you. The great beasts here are wise, and I think the cold spirits keep them strong, so walk softly when you pass their dens." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "You walk like a cat on snow, rogue, and a cat on snow is a fine hunter. But the beasts of Winterspring smell you long before they hear you, so mind the wind." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, in a land of frost. You will feel at home here, I think, though the ice in Winterspring does not answer to any spell I have seen." },
        { id = "h_default", key = true,
          text = "I am Storm Shadowhoof, and I hunt the great beasts of Winterspring, as my fathers hunted the plains of Mulgore. Every herd and pack in these hills has a leader, and those leaders are the hunts the Earth Mother means to test us with." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "You are of the Alliance, and I don't share my hunts with the Alliance lightly. Still, the goblins say this is neutral ground, so speak, and I will listen." },
        { id = "h_ursius", tags = { "news" }, when = { questActive = TODO_QUEST("Ursius of the Shardtooth") },
          text = "Ursius leads the shardtooth bears, and he is bigger and angrier than any of them. Bring friends, and let him come to you." },
        { id = "h_brumeran", tags = { "news" }, when = { questActive = TODO_QUEST("Brumeran of the Chillwind") },
          text = "Brumeran rules the chillwind chimaera, and his breath freezes a warrior where he stands. Strike fast and keep moving." },
        { id = "h_shyrotam", tags = { "news" }, when = { questActive = TODO_QUEST("Shy-Rotam") },
          text = "Shy-Rotam is the matriarch of the frostsabers, old and clever, and she will not show herself to just anyone. Prepare well before you face her." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, out here in the snow! Then you know as well as I do that the great beasts of Winterspring can teach a patient hunter things no trainer ever will." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. The great beasts of Winterspring do not fear prayers, but they respect anyone who stands their ground, and so do I." },
      },
      again = {
        { id = "h_again", text = "Ask what you will, for the tracks will keep a while, and a tauren does not hurry a hunt." },
        { id = "h_again2", text = "Speak on, but quietly; sound carries over snow." },
      },
      choices = {
        { text = "You disapprove of how many bears I've killed?", next = "dd_bears", when = { killed = { name = "Shardtooth", min = 30 } } },
        { text = "How do the tauren feel about the Horde?", next = "op_ask" },
        { text = "Do the spirits favour the great beasts of Winterspring?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "You must hunt the greatest beasts in Winterspring, Storm.", next = "druid_q", when = { class = "DRUID" } },
        { text = "Which beasts do you hunt?", next = "beasts" },
        { text = "You've come a long way north to hunt.", next = "why" },
        { text = "Do you hunt frostsabers? They're sacred to my people.", next = "kaldorei", when = { race = "NightElf" } },
        { text = "How do tauren hunt in the snow?", next = "tauren", when = { race = "Tauren" } },
        { text = "Would you hunt a great beast from hiding?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Magic seems to have a place in the hunt as well.", next = "xmage", when = { class = "MAGE" } },
        { text = "Do you ask the Earth Mother's blessing before a hunt, Storm?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Why ask whether I'd stand still, Storm?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Which hunt here would you call the greatest, Storm?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do you think a paladin could stand against Winterspring's beasts?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would you hunt beside someone like me, Storm?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    beasts = {
      lines = { { id = "b_default", text = "Ursius of the shardtooth, Brumeran of the chillwind, and Shy-Rotam of the frostsabers, each the greatest of its kind. Bring them down, and the hills will know your name as they know theirs." } },
      choices = {
        { text = "Why hunt the leaders?", next = "beasts_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    beasts_why = {
      lines = { { id = "bw_default", text = "Because killing the weak teaches you nothing, and killing the strong teaches you everything. My people honour the hunt, and the hunt is only honest when the beast can kill you too." } },
      choices = {
        { text = "A fair hunt honours both hunter and prey.", next = "BACK", reply = "It does, and few outside my people say so. You will find the hunt honours you in turn, if you walk it this way.", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "A hunt is a hunt. Kill quick and go home.", next = "BACK", reply = "Quick, yes, and home, yes, but you will have learned nothing on the way. Hunt as you choose, but I will choose differently.", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "The plains of Mulgore have no snow, and the beasts there have learned to fear my people. Here, nothing fears a tauren, and that is a better teacher than any elder." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kaldorei = {
      lines = { { id = "k_default", text = "I have heard this from the night elves before, and I know the frostsabers fought beside your people long ago. I don't hunt Shy-Rotam, their old matriarch, out of disrespect, but because she is the greatest of her kind, and that is the highest honour a hunter can give." } },
      choices = {
        { text = "Then hunt something else, and honour her by letting her live.", next = "BACK", reply = "Then she will live, and I will hunt another, for your people's sake and for hers. The Earth Mother made room enough for both of us.", fx = { affinity = -2, align = { honor = 1 } } },
        { text = "I understand. The hunt has its own law.", next = "BACK", reply = "It does, and I think we understand each other, elf and tauren both. Walk carefully in the deep snow, and listen for her before you see her.", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    tauren = {
      lines = { { id = "t_default", text = "Slowly, young one, and downwind, and with a thicker cloak than you think you need. The snow hides the tracks by noon, so rise early, and trust your nose before your eyes." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I learned the hunt on the plains of Mulgore, and I came north to test it. So far, the north is winning." } },
    advice = { { id = "tp_ad", text = "Watch the tracks, not the trees. The beasts here are white, and they hide in plain sight." } },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother made the great beasts of the snow, and I've come to hunt them with respect. A bear here will teach you more about her than a year on the plains." } },
    cairne = { { id = "tp_cairne", text = "Cairne Bloodhoof is the greatest of our people, and he'd stand in front of a charging bear without blinking. I measure everyone else against him." } },
    thrall = { { id = "tp_thrall", text = "Thrall is a good warchief, and he's been a friend to the tauren. He hunts like an orc, though, all charge and no patience." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw are proud hunters in their own way, and they guard their tunnels well. I've learned to respect them, and they've learned to respect me." } },
    everlook = { { id = "tp_everlook", text = "Everlook is a good place to rest between hunts, and the goblins don't bother you much. The cold keeps the meat fresh, too." } },
    _none = { { id = "tp_none", text = "I know tracks and beasts, and the Earth Mother's ways in the snow. That is neither." } },
  },
}

P:NPC {
  key = "yugrek", id = TODO_NPC("Yugrek"), name = "Yugrek", title = "Wind Rider Master",
  bible = "bibles/winterspring.md", role = "flightmaster", tier = "service",
  communities = { "everlook" }, temper = { "gruff" }, values = { "dutiful" },
  notices = { "race", "lock_pact" },

  impression = {
    first = "He grumbles about the snow but would never leave his beasts.",
    third = "{name} met Yugrek, the orc who keeps the Horde's wind riders in Everlook.",
  },

  greetings = {
    { id = "g_default", text = "Flying? The riders are wrapped and ready, though they hate this cold more than I do, and one of them bit me this morning for the cheek of it." },
  },

  notice = {
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Another orc in the snow! Durotar's sun seems a long way off up here, doesn't it?" },
    { id = "n_lock_pact", cat = "lock_pact", when = { aura = { 6307, 7804, 7805, 11766, 11767 } },
      text = "Your blood's running hot, I can smell it from here, like a fever with no sickness behind it. The old warriors smelled like that after Mannoroth's blood, so tell me that's only an imp's pact and nothing worse." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "In Everlook? No, because the goblins sell to anyone and the dwarves stare at everyone. What's strange is seeing the Light on one of the dead, but the cold is stranger still, and I've got used to that." } },
      choices = {
        { text = "The Light keeps me warm enough, Yugrek.", next = "BACK", reply = "Then you're luckier than me, and I've got fur on every part of me that isn't blade. Strange times, when the dead feel warmer than the living.", fx = { align = { light = 1 } } },
        { text = "The cold means nothing to the dead. Nor does the Light.", next = "BACK", reply = "Hah, I'll take your word for it, since I've no wish to find out myself. Mount up, and try not to freeze any faster than you already have.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Plenty, because a goblin town's full of secrets and somebody's always carrying one to Orgrimmar. I don't ask what's in their packs, and I don't want to know, but I've had to sew up two blankets that somebody used to hide a crate of something that ticked." } },
      choices = {
        { text = "Your riders deserve better. I'll carry nothing that ticks.", next = "BACK", reply = "Good. My riders have enough to fear from the wind without a goblin's surprise in the saddlebag.", fx = { align = { order = 1 } } },
        { text = "What's in my pack is my business, and nobody else's.", next = "BACK", reply = "It is, until it catches fire over Felwood. Then it's my business and my beast's, and neither of us will thank you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The heavy ones make the beast work harder, and the beast lets me know about it all night. But I'll carry a warrior over Felwood gladly, because if a rider comes down among the Deadwood, I want someone on its back who can fight their way out." } },
      choices = {
        { text = "If we come down, I'll guard the beast before myself.", next = "BACK", reply = "That's the right answer, and the beast will know it. My first wind rider kept me alive through a fall over Ashenvale, and I owe that one every blanket I own.", fx = { align = { honor = 1 } } },
        { text = "If we come down, I'm leaving the beast and running.", next = "BACK", reply = "Then you'll run alone, and the furbolgs will find you before the night's out. Run if you like, but the beast will remember.", fx = { align = { honor = -1 } } },
        { text = "Something else, Yugrek.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Blankets, three each, and meat twice a day, because a cold wind rider is a hungry one and a hungry one bites. I've asked the goblins for a stove twice, and they've quoted me a price both times that I won't repeat." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Blankets, three each, and meat twice a day, because a cold wind rider is a hungry one and a hungry one bites. That {pet} of yours could use a blanket too, so bring it by the perch at night, if my riders don't decide it's dinner." },
      },
      choices = {
        { text = "Beasts that serve us are owed warmth and care, Yugrek.", next = "BACK", reply = "They are, and I'll keep giving it, stove or no stove. The goblins can keep their quote; my beasts will have my blankets first.", fx = { align = { light = 1 } } },
        { text = "A beast that can't stand the cold isn't worth keeping up here.", next = "BACK", reply = "Then you've never flown one over Hyjal in a storm. These beasts earn their keep twice over, and they'll have their blankets while I'm roostmaster.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Demons, the shaman say, from the old war, and the ground drank their filth until it went sick. The riders won't land anywhere near it, and I've learned to trust their noses." } },
      choices = {
        { text = "Then someone must cleanse it, whatever the cost.", next = "BACK", reply = "That's the shaman's word too, and they'll need warriors to do it. When the Horde moves on that forest, my riders will carry them.", fx = { align = { honor = 1 } } },
        { text = "Leave it to the night elves. It's their forest.", next = "BACK", reply = "The night elves have tried, and the forest is still rotting. Felwood's sickness won't stay inside elven borders, grunt.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Harsher, shaman, because it comes down off the peaks all night and drives the snow sideways into the roosts. I've wrapped the riders in blankets and still they shiver. If the air spirits here have a grudge, I'd like to know whose it is, because it isn't mine." } },
      choices = {
        { text = "Leave the wind an offering at the roost, as is proper.", next = "BACK", reply = "I'll do it tonight, shaman, and I thank you. The beasts might sleep for once, and so might I.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The wind answers no one. Your beasts will have to toughen up.", next = "BACK", reply = "My beasts are tough enough, shaman, it's the wind that's crueller than it ought to be. Come and feel their ears after a flight before you tell me to toughen them.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "They don't refuse, but they grumble and snap, and an angry wind rider over the mountains between here and Felwood is a hard flight. Keep that creature of yours out of sight until you land and we'll all get along fine." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "They don't refuse, but listen to them now, all snapping and pulling at their tethers since your demon came up the path. An angry wind rider is a hard flight over the mountains, so send it back where it came from before you mount, and we'll all get along fine." },
      },
      choices = {
        { text = "I'll keep it out of sight. The beasts come first.", next = "BACK", reply = "Then you'll fly smoother, and so will the beast. They passed over Felwood on the way up here, and they still shy at anything that smells green.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "What's mine stays with me. They'll get used to it.", next = "BACK", reply = "They won't, but they'll fly you anyway, and you'll hear every growl of it. Hold tight.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Fair enough.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Badly, and loudly, and I don't blame them, since they come from the hot canyons of the Barrens and Thousand Needles. I warm their feed and wrap their wings at night, and I'd give a month's pay for a mage willing to stand guard over them with a hearth spell." } },
      choices = {
        { text = "Their care is worth every effort you make.", next = "BACK", reply = "It is, and I'll keep doing it as long as there's breath in me. I lost two wind riders to the cold my first winter here, and I won't lose a third.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They're beasts. They'll toughen up.", next = "BACK", reply = "They toughen, aye, but they don't stop hurting. Spend a winter in a roost with them before you judge them.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll leave you to your blankets.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Because the Horde needs a road to Everlook, and somebody has to stand at the end of it. The goblins keep the peace here, but a wind rider is how word gets back to Orgrimmar before the Alliance's birds reach Darnassus." } },
      choices = {
        { text = "Then I'll honour that duty, and carry word if asked.", next = "BACK", reply = "Then you're a better Horde than half the ones I fly. Bring word to Orgrimmar as fast as the beast can carry you.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Duty's for orcs, Yugrek. I fly where I please.", next = "BACK", reply = "You fly where my beasts take you, priest, and they go where they're told. Duty's what keeps you in the air.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "o_cairne_doubt", tags = { "news" }, when = { gossip = { topic = "cairne", stance = "doubt" } },
          text = "Storm tells me you think the tauren were better off without us orcs. Tell that to the centaur; they'd agree with you." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "A rogue. You'll want a seat in the back where nobody sees you come and go, I suppose, and my riders don't care who climbs on, so long as you don't steal their blankets." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior of the Horde. Help me lift this saddle, would you? My back's been stiff since the snow started, and the snow started the day I arrived." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter of the Horde! Then you know how to keep a beast fed and warm, and most riders who come through here treat their mounts like a cart." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Good, maybe you can tell the wind up here to stop biting my beasts, because they won't listen to me." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "My wind riders don't like the smell of brimstone, and you carry plenty of it, so I'll have you stand downwind while I saddle one, if it's the same to you." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage of the Horde! If you've got a spell to keep the cold off my wind riders, I'd like to hear it, because these blankets only do so much." },
        { id = "h_default", key = true,
          text = "I am Yugrek, and I keep the wind riders here for the Horde. They'll take you south to Felwood and on to Orgrimmar, if your business is with the Horde, and no orc should stay in this cold longer than his honor demands." },
        { id = "h_alliance", when = { faction = "Alliance" },
          text = "My riders don't carry the Alliance. The night elf with the hippogryphs will see to you; she's just over there." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, this far north! If you fly south over Felwood, keep your eyes shut over the worst of it, because the trees down there aren't right." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. If you've a prayer against the cold, say it over my riders, because they shiver all night under three blankets and still glare at me in the morning." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin, in the snow. My riders are wrapped in blankets and still they shiver, but you won't feel the cold at all, I suppose." },
      },
      again = {
        { id = "h_again", text = "Something else? The riders grow cold while we talk, and an orc doesn't waste his beasts." },
        { id = "h_again2", text = "Speak, then, and quickly." },
      },
      choices = {
        { text = "Is the wind over Winterspring as harsh as it seems?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "The trees of Felwood look sick from the air.", next = "druid_q", when = { class = "DRUID" } },
        { text = "Where can I fly?", next = "BUSINESS", when = { faction = "Horde" } },
        { text = "How do wind riders stand the cold?", next = "cold" },
        { text = "You and the night elf work side by side?", next = "maethrya" },
        { text = "Do your wind riders refuse folk who smell like me?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "How do the wind riders take the cold?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Why keep your riders in the snow at all, Yugrek?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do warriors make good wind rider passengers, Yugrek?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Keeping wind riders warm up here can't be easy.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "I'd guess a few rogues fly out of Everlook, Yugrek.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Does a Forsaken paladin seem strange in Everlook, Yugrek?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    cold = {
      lines = { { id = "c_default", text = "Badly, and they tell me so every morning. I wrap them in blankets bought from the goblins, at goblin prices, and the riders chew the blankets anyway." } },
      choices = {
        { text = "Chew the blankets?", next = "cold_chew" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cold_chew = {
      lines = { { id = "cc_default", text = "Wind riders chew everything, friend, saddles, ropes and once a goblin's hat while he was still wearing it. The Bruisers fined me, and the rider was very pleased with himself." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    maethrya = {
      lines = { { id = "m_default", text = "Side by side, and we've never come to blows, though our beasts have. She says nothing to me and I say nothing to her, and in this cold that's as near to friendship as an orc and an elf will get." } },
      choices = {
        { text = "Maybe one day you'll say more.", next = "BACK", reply = "Perhaps, if the winter goes on long enough. Even an orc and an elf can find something to say about the cold, though we haven't found it yet.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Some enemies are best kept at a distance.", next = "BACK", reply = "She's not an enemy, not up here, and the goblins would make sure of that. But aye, the distance suits us both.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I flew for the Horde across the Barrens before they sent me here to freeze. I don't complain much, though the riders do." } },
    advice = { { id = "tp_ad", text = "Wear something warm when you fly. The wind up there bites harder than the riders." } },
    thrall = { { id = "tp_thrall", text = "The Warchief built Orgrimmar out of the desert and sent us to the ends of the world to keep the Horde strong. I'd follow him anywhere, even here, where the snow comes up to your knees." } },
    everlook = { { id = "tp_everlook", text = "Everlook's too cold for an orc, but the wind riders like it, and the goblins pay well. I keep my beasts wrapped in blankets and my complaints to myself, mostly." } },
    timbermaw = { { id = "tp_timbermaw", text = "The Timbermaw don't trust orcs, and I don't blame them, since we've given them reason. I keep my distance, and they keep theirs." } },
    _none = { { id = "tp_none", text = "I keep wind riders, and that's all I know. Ask a shaman if you want the spirits' answers." } },
  },
}

P:NPC {
  key = "maethrya", id = TODO_NPC("Maethrya"), name = "Maethrya", title = "Hippogryph Master",
  bible = "bibles/winterspring.md", role = "flightmaster", tier = "service",
  communities = { "everlook" }, temper = { "reserved" }, values = { "dutiful", "nature" },
  notices = { "race", "lock_steed" },

  impression = {
    first = "She speaks softly, and her birds listen to every word.",
    third = "{name} met Maethrya, the night elf who keeps the Alliance's hippogryphs in Everlook.",
  },

  greetings = {
    { id = "g_default", text = "Ishnu-alah. The hippogryphs are rested, if you wish to leave the snow behind." },
  },

  notice = {
    { id = "n_nelf", cat = "race", when = { race = "NightElf" },
      text = "Elune's light on you. It is good to hear our tongue among so many goblins." },
    { id = "n_lock_steed", cat = "lock_steed", when = { class = "WARLOCK", aura = { 5784, 23161 } },
      text = "Your horse left burning hoofprints in the snow from the gate to my roost, and the hippogryphs have not stopped shrieking since. Felwood taught them what green fire means, so please tether that creature well away before you ask me for a flight." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "They are not kind to anything, but my birds ride the wind rather than fight it. Only the goblins think the wind is something to sell, and they would if they could catch it." } },
      choices = {
        { text = "The wind isn't the goblins' to sell.", next = "BACK", reply = "No, it is not, nor anyone's, and I'm glad you see that. These winds blew over Winterspring when the goblins' grandfathers were still digging in the mud of Undermine.", fx = { align = { honor = 1 } } },
        { text = "If they can catch it, let them profit.", next = "BACK", reply = "And when the wind is bottled and sold, what will the hills breathe? You speak like a merchant, not a shaman.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "They would carry you, because they are well trained, but they would shiver all the way to Talonbranch Glade, and Felwood has taught them to fear the fel. I've watched good birds go sick from that forest, so you'll understand why I'm careful about what comes near them." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "They would carry you, but look how they draw back from the creature beside you, and that is before it has come near the roost. Felwood taught them to fear the fel, and I have watched good birds go sick from that forest, so I will ask you to dismiss it before you climb up." },
      },
      choices = {
        { text = "I'll send it off. The birds have suffered enough.", next = "BACK", reply = "Thank you, and they'll fly you gently for it, I promise. The birds that came through Felwood still won't eat if they smell the fel on a traveller.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "What I keep is no threat to them. Your fear is misplaced.", next = "BACK", reply = "Perhaps it is not, to you, but they have seen what the fel did to their forest. A bird's fear is older than anything you keep.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because the glint looks like water to them, and water in the snow is ice, and ice means a hard landing. It's nothing against the Light; they'll warm to you once you've flown with them twice, and I'll ask you to be patient until then." } },
      choices = {
        { text = "Then I'll be patient. The birds come first.", next = "BACK", reply = "Then you'll be their friend before you know it. Bring an apple next time, and let them take it from your hand.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They're mounts. They'll learn to carry me or they won't.", next = "BACK", reply = "They will carry you, because I've trained them to, but they will remember how you spoke of them. Hippogryphs have long memories, and short tempers in the cold.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "They are proud birds, and they hear a shield struck as a rival's call. Our Sentinels learned long ago to quiet their armour near the roosts, and I've found it calms the goblins too, though I'd never tell them so." } },
      choices = {
        { text = "I'll keep my steel quiet near the birds. Their peace matters.", next = "BACK", reply = "Then you are wiser than many warriors I've flown, and the birds will thank you in their way, probably by not biting.", fx = { align = { order = 1 } } },
        { text = "A warrior's armour rings. The birds will have to grow used to it.", next = "BACK", reply = "They will, in time, though they may peck at your pauldrons on the way. Don't take it personally; they peck at mine too.", fx = { align = { order = -1 } } },
        { text = "Something else, Maethrya.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Most, if the beast is calm and its keeper calmer. Owlbeasts are another matter, for they are the birds' true enemies here, and my birds will scream at an owlbeast's scent long before I see one in the snow." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Most, if the beast is calm and its keeper calmer, though owlbeasts are their true enemies here. {pet} may stay close, so long as it doesn't chase the feathers that blow off the roost." },
      },
      choices = {
        { text = "Every beast deserves a keeper it can trust, Maethrya.", next = "BACK", reply = "They do, and I try to be that for mine, as my mother was for hers. Ishnu-alah, hunter.", fx = { align = { light = 1 } } },
        { text = "Beasts trust whoever feeds them. There's nothing more to it.", next = "BACK", reply = "Food buys a beast's company, perhaps, but not its trust. You'll learn that, or you'll be bitten learning it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "The Circle at the Emerald Sanctuary believes so, and they're braver than I am for it. I see the forest from above every day, and the rot reaches further each season." } },
      choices = {
        { text = "It can. Felwood must be cleansed, tree by tree.", next = "BACK", reply = "I pray Elune grants them strength for it, and you too, if you go. I was at Emerald Sanctuary once, and the rot had crept to within a stone's throw of the camp.", fx = { align = { light = 1 } } },
        { text = "Some forests are lost. Burn the worst of it.", next = "BACK", reply = "Fire is how Felwood began its dying, druid, when the Legion came. I would rather the Circle tried longer than burned sooner.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I trust them to keep their bargains and nothing more, and the Steamwheedle Cartel sells to the Horde as gladly as to us. A quiet ear among their traders would hear more than I can, but that is the Sentinels' business, and not mine." } },
      choices = {
        { text = "The Cartel keeps the peace. I don't need more.", next = "BACK", reply = "Perhaps not, and I'll not ask more of you. The Cartel's peace is thin, but it has held for three winters now.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd happily lighten a goblin's purse for the Alliance.", next = "BACK", reply = "I didn't say that, and I'd rather not hear it said near the roost. The Bruisers have very good ears.", fx = { align = { order = -1 } } },
        { text = "I'll keep my ears open.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "They remember, I think, in the way beasts do, what the Highborne's magic did to this world in the Sundering. Elune's creatures feel the arcane like a storm coming, and Winterspring has old Highborne ruins enough to keep them on edge." } },
      choices = {
        { text = "Then I'll keep my spells to myself around them.", next = "BACK", reply = "Thank you, and they'll fly calmer for it. Their mothers' mothers remember the night the Well of Eternity tore apart, and they don't forget the smell of wild magic.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Beasts shouldn't dictate how I use my power.", next = "BACK", reply = "They don't dictate, they remember, and you might do the same. My grandmother watched the Highborne say what you've just said, a long time ago.", fx = { affinity = -1, align = { light = -1 } } },
        { text = "I'll keep my hands still.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "None but the inn's hearth, where the traders mostly pray for good weather and better prices. I say my evening words to Elune out by the roost, and the hippogryphs listen better than the goblins would." } },
      choices = {
        { text = "Faith needs no walls. The open sky is shrine enough.", next = "BACK", reply = "It is, and the stars over Winterspring are as fine as any temple ceiling. Elune hears us best out here, I think.", fx = { align = { order = -1 } } },
        { text = "Faith needs a proper home. Everlook should have a shrine.", next = "BACK", reply = "Perhaps, but the goblins would charge rent on it. Elune doesn't mind the roost, and neither do I.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "My birds can smell what you've bound, stranger, and they don't care for it, so I'll ask you to send it off before you climb onto the perch." },
        { id = "h_apaladin", when = { class = "PALADIN", faction = "Alliance" },
          text = "A paladin of the Alliance. My hippogryphs flinch at the shine of plate, so walk slowly to the perch, and let them see your face before they see your hammer." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" },
          text = "A warrior of the Alliance. Please set your shield down gently while you wait; my hippogryphs mistake the ring of steel for a challenge." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" },
          text = "A hunter of the Alliance. The birds settle when they see a beast at your side; it tells them you are someone animals trust." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "A rogue of the Alliance. The goblins here will watch your hands closely, so I hope you give them nothing to see." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage. My hippogryphs are nervous around the arcane, so speak softly near them and keep your hands still while they settle." },
        { id = "h_default", key = true,
          text = "I am Maethrya, and I keep the hippogryphs for the Alliance in Everlook. They will carry you to Talonbranch Glade in Felwood and on to the rest of Kalimdor, over forests my people have known since the world was whole." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "My birds will not carry you, but Yugrek's wind riders will, and he keeps them well enough. You'll find him a few paces away, complaining about the cold." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid of the Circle. My hippogryphs fly south over Felwood every day, and they always climb higher over the worst of it, as if they can smell what's wrong with the trees." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest of the Alliance. Everlook has the goblins' bruisers and the goblins' prices, but it has no shrine at all, and I have missed the sound of prayer." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman of the Alliance. My hippogryphs have rarely flown one of you, but the winds of Winterspring seem to know you already, and they are older than either of our peoples." },
      },
      again = {
        { id = "h_again", text = "Is there something else you wish to know? Ask; Elune has granted me patience enough for the cold." },
        { id = "h_again2", text = "Speak; the birds are patient, and so am I." },
      },
      choices = {
        { text = "Can Felwood still be saved, Maethrya?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Where can I fly?", next = "BUSINESS", when = { faction = "Alliance" } },
        { text = "You seem uneasy in Everlook.", next = "everlook" },
        { text = "The hippogryphs must find the snow strange.", next = "birds" },
        { text = "You don't trust the goblins much, do you?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Why are the hippogryphs afraid of magic?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Is there really no place for prayer in Everlook?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Your hippogryphs seem to dislike steel, Maethrya.", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do your hippogryphs trust other beasts?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Why do the hippogryphs flinch at a paladin's plate, Maethrya?", next = "xapala", when = { class = "PALADIN", faction = "Alliance" } },
        { text = "Would your hippogryphs really refuse me, Maethrya?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Are the winds of Winterspring kind to your birds, Maethrya?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    everlook = {
      lines = { { id = "e_default", text = "It is a goblin town in the heart of a land my people once walked freely, and they sell its furs by the bundle. I keep my opinions to myself, mostly, because the Bruisers keep the peace and the peace serves my birds." } },
      choices = {
        { text = "The goblins have as much right here as anyone.", next = "BACK", reply = "They have as much right as their coin buys, I suppose, and the Bruisers agree with you. I'll keep my peace, as I always have.", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Winterspring belongs to the kaldorei.", next = "BACK", reply = "It does, and it did long before the goblins came with their ledgers. But I'll say it quietly, for the Bruisers are listening.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    birds = {
      lines = { { id = "b_default", text = "They are creatures of the forest, and they find the snow strange, but they are braver than they look. They watch the frostsabers on the hills as if they recognise old friends." } },
      choices = {
        { text = "Old friends?", next = "birds_friends" },
        { text = "Something else.", next = "BACK" },
      },
    },
    birds_friends = {
      lines = { { id = "bf_default", text = "The frostsabers have been allies of my people since long before the goblins came here with their scales. Some of our sentinels still ride them, and the hippogryphs remember." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I have tended hippogryphs since before the Third War, and I go wherever they are needed." } },
    advice = { { id = "tp_ad", text = "Do not stare at the hippogryphs when you mount. They find it rude." } },
    tyrande = { { id = "tp_tyrande", text = "The High Priestess leads our people from Darnassus, and her wisdom has kept us whole through every trial. I serve her by keeping the Alliance's birds ready for flight." } },
    elune = { { id = "tp_elune", text = "Elune watches over us from the moon, and in Winterspring the nights are long enough to feel her watching. My hippogryphs fly by her light." } },
    everlook = { { id = "tp_everlook", text = "Everlook is a goblin town, and the goblins trade with everyone, Horde and Alliance alike. I watch their bargains carefully, though I keep my opinions to myself." } },
    nordrassil = { { id = "tp_nordrassil", text = "The World Tree stands on Mount Hyjal, just south of here, and my people guard it still. I've seen it from a hippogryph's back, and I'll never forget it." } },
    _none = { { id = "tp_none", text = "I do not know, and I do not think the hippogryphs do either, though they remember more than they let on." } },
  },
}
