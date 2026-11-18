-- The Crossroads. Voice: bibles/crossroads.md
-- Thork holds the walls, Sergra holds the road, Mankrik holds a grudge.
local P = RPGDialogueAPI:Pack("rpgd.barrens")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "thork", id = TODO_NPC("Thork"), name = "Thork",
  bible = "bibles/crossroads.md", role = "soldier", tier = "quest",
  communities = { "crossroads" }, temper = { "firm" }, values = { "loyal", "dutiful" },
  notices = { "race", "kit", "origin" },
  impression = {
    first = "Thork keeps the Crossroads for the Warchief and treats every road in the Barrens as his to hold. He is firm and fair after his fashion, and he will not spend soldiers on a grieving man's vengeance.",
    third = "{name} met Thork, the steadfast orc who holds the Crossroads for the Warchief against every threat in the Barrens.",
  },

  greetings = {
    { id = "g_home", text = "Make yourself at home at the Crossroads, {class}, and mind your own business while you do. The Horde shares its fire, not its secrets." },
    { id = "g_back", when = { metBefore = true }, text = "Back on the road, I see. The Crossroads is glad of you, so don't let it go to your head." },
    { id = "g_away", when = { away = 14 }, text = "You've been off the roads for {away}, and the Crossroads held without you, as it always does. Still, it's good to see you back." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown since you first came through this gate, and the Barrens has noticed even if you haven't. Go and put it to use." },
    { id = "g_word_helped", when = { word = "helped" }, text = "My people tell me you've done honest work for the Crossroads. I don't hand out thanks lightly, so take this as one." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I'm told one of your lies was caught out in this town. I hold these roads by trust as much as by steel, so don't make a habit of it here." },
    { id = "g_kw_resolved", when = { thread = { id = "kolkar_war", state = "resolved" } }, text = "Regthar let Krom'zar's stragglers run home, I hear, and the caravans have come through untouched ever since. I'd have ridden them down myself, but I can't argue with a quiet road." },
  },

  notice = {
    { id = "n_alliance", cat = "race", when = { faction = "Alliance" },
      text = "An Alliance face at the Crossroads? That's bold. You'll get the same welcome as anyone else, once, so don't make me regret it." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "You've been out among the centaur, by the look of it. Get yourself patched up; the Horde needs you standing." },
    { id = "n_walk", cat = "origin", when = { origin = "tauren_long_migration" },
      text = "You came through here on the long walk to Mulgore, I'd wager, small enough to ride on a kodo. Some of my older grunts fought the Kolkar off your people's flanks on that march, and they still talk about how quiet the calves were." },
  },

  start = "hello",
  nodes = {
    xalt_thork = {
      lines = {
        { id = "xalt_thork_default", text = "Plenty report to me, and I'd forget most of them by sundown if I could. The one you mean held the wall during a centaur raid and never asked for thanks, so they stayed in my head." },
        { id = "xalt_thork_kin", when = { alt = { kin = true } }, text = "{alt} took a Kolkar arrow in the shoulder at the north gate and pulled it out before anyone could help. If you're family, I hope you got the same hard hide." },
      },
      choices = {
        { text = "The Crossroads needs people who hold the wall, no questions.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Better to ride out and hunt them than wait at the wall.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Thork.", next = "BACK" },
      },
    },
    xpt_thork = {
      big = true,
      lines = { { id = "xpt_thork_default", text = "South toward the Stagnant Oasis, where the centaur and the raptors both hunt the caravan road, and west where the Kolkar have grown bold. A company your size could keep the road open for a week, and a week is all I need to get the grain through." } },
      choices = {
        { text = "We'll go where we're needed. The Crossroads comes first.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "We'll go wherever the pay is best, Thork.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Thork.", next = "BACK" },
      },
    },
    xcl_wc = {
      big = true,
      lines = { { id = "xcl_wc_default", text = "Then you've seen what's been crawling up out of those hills. Deviate beasts and twisted raptors have been coming out of the caves for years, along with serpents the size of a kodo and the druids in snakeskin robes who were meant to be healing the place. Every caravan I lose on the northern road I lose to something from those caves, so whatever you did down there, the road will feel it." } },
      choices = {
        { text = "The Horde should guard those caves until the land heals.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "That's tauren business, Thork. I've done my part.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Those druids down there all wore snakeskin, every last one.", next = "xcl_wc2" },
      },
    },
    xcl_wc2 = {
      lines = { { id = "xcl_wc2_default", text = "The tauren say they were disciples of a night elf named Naralex, who went down to heal the Barrens and fell asleep in his own dream. His followers went down after him and came back up wrong, and now they call themselves the Druids of the Fang. I don't pretend to understand druids, but I know a deserter when I see one." } },
      choices = { { text = "Then I hope the dreamer stays awake, Thork.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "The kind I haven't seen before. Every orc my age remembers the Silver Hand riding past the camp fences with that glow, and now it walks into my fort wearing Horde colours. If you hold these roads with me, I'll call you an ally and mean it." } },
      choices = {
        { text = "I'll hold the roads with you, Thork.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I hold to the Light, Thork, not to your roads.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Hands for the wounded and a steady voice for the dying, because the Razormane don't leave many clean cuts. I care little whether your prayers go to the loa or to the shadow, so long as my grunts get back on the wall." } },
      choices = {
        { text = "Then I'll tend your wounded before my own business.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Your grunts chose the wall. Their wounds are their own affair.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Thork.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Along the southern road at dusk, and around the Stagnant Oasis by night, where the water draws them in. Track them back to their camps and I can send grunts to hit them before they hit us, which is how I like to fight." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has a good nose on it. Put it to work along the road, and it'll find centaur sign before you do." },
      },
      choices = {
        { text = "I'll scout for the wall, Thork, and report back.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Scouting's too slow. I'll hunt the centaur myself.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I need everything I can get. The Kolkar have their stormers and the quilboar have geomancers who make the thorns move, so if the enemy brings spirits to the fight, I'd be a fool not to bring my own." } },
      choices = {
        { text = "Then I'll answer your call, Thork, like the rest of the garrison.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll fight beside you, but the spirits aren't the Horde's to command.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "There is, though I won't say it too loudly on the wall where the grunts can hear. The Kolkar and the Razormane both scout this road at night, and a blade that watches their scouts without being seen is worth ten that charge them." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "There is, and I've learned to look past what the Forsaken are when they make themselves useful. The Kolkar and the Razormane both scout this road at night, and a blade that watches their scouts without being seen is worth ten that charge them." },
      },
      choices = {
        { text = "A scout who never sees me never reports back.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'd rather meet them in the open, under your banner.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What else threatens the Crossroads?", next = "threats" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Only if your demon forgets whose road this is. The Warchief allows your kind under watch, and I'll keep that watch myself, so keep the thing leashed and away from the tauren caravans, who've heard enough about the Burning Blade to reach for their spears." },
        { id = "xwarlock_orc", when = { race = "Orc" }, text = "You're an orc, so you know what that power cost our people the first time. The Warchief allows it under watch, and I'll be the watch here, so keep your demon leashed and away from the tauren caravans." },
      },
      choices = {
        { text = "My demon answers to me, and I answer to the Warchief.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My power is my own business, Thork.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Holding the Crossroads must be hard work.", next = "hardest" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The tauren blame the druids who went down into the Wailing Caverns, and they say their magic has twisted the water underground. I don't know druid business, but I know the oases are shrinking and the Kolkar fight harder over each one, so whatever's wrong, I need it fixed." } },
      choices = {
        { text = "Hold the oases first. We can mend the land once they're ours.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Fix the caverns first, or there'll be no water left to hold.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "On the wall at dusk, when the Razormane come up the road in a pack and my grunts can't reach them before they scatter. Your fire breaks a charge before it starts, but keep it off the grass, because a burning plain doesn't care whose side it's on." },
      },
      choices = {
        { text = "I'll stand the wall at dusk and answer to your sergeant.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll go where my spells are needed, not where I'm posted.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Thork.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_kin", tags = { "news" }, when = { alt = { kin = true } },
          text = "Another {altrace} with your look reported to me, a {altclass} named {alt}, and went out after the Kolkar the same day. If you're blood of theirs, I'll put you to the same work." },
        { id = "h_alt_far", tags = { "news" }, when = { alt = { notKin = true } },
          text = "{alt} came through the gates a while back, a {altrace} who asked more questions about the Crossroads than any spy I've ever caught. I decided they weren't a spy, since spies don't ask that many." },
        { id = "h_alt_higher", tags = { "news" }, when = { alt = { higher = true } },
          text = "I hear {alt} has gone south past Camp Taurajo and kept going, which is further than most who leave by this gate. Remember the Crossroads when you're that far out, because it remembers you." },
        { id = "h_pt_band", tags = { "news" }, when = { party = { size = 4 } },
          text = "That's a proper war band you've brought to my crossroads. The centaur raid in fours and fives, so they'll think twice before they come at you, and most of the travellers I send down that road get no such respect." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin at the Crossroads. Every kind of trouble meets here, and I'm not yet sure which kind you are." },
        { id = "h_default", key = true,
          text = "I'm Thork, and I keep the Crossroads for the Warchief. Every road in the Barrens meets here, and so does every kind of trouble, and an orc doesn't give ground to either." },
        { id = "h_cl_wc", tags = { "news" }, when = { cleared = "Wailing Caverns", faction = "Horde" }, text = "My scouts say someone went deep into the Wailing Caverns, and the howling from the hills has changed its tune since. If that was you, I'd like to hear about it." },
        { id = "h_journey", tags = { "news" }, when = { questActive = TODO_QUEST("Journey to the Crossroads") },
          text = "So they sent you to me. Good, I've more work than warriors. Rest a night, and then we'll see what you're made of." },
        { id = "h_disrupt", when = { questActive = TODO_QUEST("Disrupt the Attacks") },
          text = "Kolkar raiders hit our caravans and run. I want you to hit them first, hard enough that they think twice before they ride at the Crossroads." },
        { id = "h_supplies", when = { questActive = TODO_QUEST("Supplies for the Crossroads") },
          text = "The raiders took our supplies. Bring back whatever you can find, because every crate is another week we hold." },
        { id = "h_mankrik", when = { heardLine = "mankrik.h_default" },
          text = "So Mankrik told you his story. I'm sorry for his loss, but I won't send soldiers to die for a man who can't see past his anger. Someone has to say no." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman at the Crossroads. Good, because the Barrens are dry as bone, and if you can find water where my scouts can't, you're worth three grunts on my wall." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid at the Crossroads. The Barrens are drying out faster every season, and if your kind can tell me why, you'll do more good than a dozen grunts on my wall." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Good, because the Barrens is all open ground, and I need someone who can see the Kolkar coming before they reach my wall." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. The Crossroads sends more wounded back through that gate than I have beds for, so you'll find work here if you want it." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage at the Crossroads. I don't understand your spells, but I understand a fireball landing among the Kolkar, and my wall could use a few." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Kolkar", min = 30 } }, text = "The caravans have been getting through, and my scouts say the Kolkar have pulled back from the road. I hear your name in that, so keep it up, and the Crossroads will owe you." },
      },
      choices = {
        { text = "Someone close to me reported to you, Thork.", next = "xalt_thork", when = { alt = true } },
        { text = "The spirits could help you hold the Crossroads, Thork.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Why are the Barrens drying out, Thork?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "What's the hardest part of holding the Crossroads?", next = "hardest" },
        { text = "The Crossroads seems to have enemies on every side.", next = "threats" },
        { text = "I work from the shadows, Thork. Is there a use for that here?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Where do the Kolkar scouts move, Thork?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "I'm a warlock, Thork. Will that be trouble at the Crossroads?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "I went to the bottom of the Wailing Caverns, Thork.", next = "xcl_wc", when = { cleared = "Wailing Caverns", faction = "Horde" } },
        { text = "We're a company now. Where are we needed most, Thork?", next = "xpt_thork", when = { party = { size = { min = 2 } } } },
        { text = "I'm loyal to the Horde.", next = "END", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I look out for myself first, and the Horde second.", next = "END", fx = { align = { honor = -1 } } },
        { text = "Give me a post on the wall, Thork.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Do you trust the Forsaken at your crossroads?", next = "forsaken", when = { race = "Scourge" } },
        { text = "What does the Crossroads need from a priest, Thork?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Where would a mage do the most good, Thork?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "What kind of trouble am I, Thork?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Farewell, Thork.", next = "END" },
      },
      again = {
        { id = "h_again", text = "What else? The road doesn't stop for talk, so neither do I, for long." },
      },
    },
    warrior = {
      lines = {
        { id = "wa_default", text = "The wall's the easy part, because it doesn't move. What I need are warriors who'll ride out with the caravans, since the Kolkar never attack a wall; they attack the wagons strung out on the road." },
        { id = "wa_tauren", when = { race = "Tauren" },
          text = "A tauren warrior on my wall would scare most raiders off before they got close, but you're more use out with the kodo caravans, where the Kolkar actually strike." },
      },
      choices = {
        { text = "Then I'll ride with the caravans.", next = "BACK", fx = { affinity = 2, standing = { crossroads = 1 } } },
        { text = "Why not strike the Kolkar camps first?", next = "warrior_camps" },
      },
    },
    warrior_camps = {
      lines = { { id = "wc_default", text = "Because I've got sixty soldiers and they've got the whole Barrens to run in. Hit them hard enough when they come, and they'll pick an easier target; that's all holding a road is." } },
      choices = { { text = "Understood.", next = "BACK" } },
    },
    forsaken = {
      lines = { { id = "fk_default", text = "I trust Helbrim to brew what he's paid to brew, and to keep his bottles away from my well. The Warchief says your people are Horde, so you're Horde at my crossroads, but I count the bottles." } },
      choices = {
        { text = "Count them, then. We've earned some suspicion.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "Your suspicion is an insult to the Dark Lady.", next = "BACK", fx = { affinity = -2, align = { order = -1 } } },
      },
    },
    threats = {
      big = true,
      lines = {
        { id = "t_default", text = "Centaur, quilboar, harpies and the Alliance, in no particular order, and they all want the same thing: the road. The Horde needs that road, so we hold it." },
      },
      choices = {
        { text = "Then I'll help hold it.", next = "BACK", fx = { affinity = 2, standing = { crossroads = 1 } } },
        { text = "That's a lot of enemies.", next = "lot" },
      },
    },
    lot = {
      lines = { { id = "l_default", text = "It is, though they hate each other too, and most days that's what keeps us alive." } },
      choices = {
        { text = "Which of them worries you most?", next = "northwatch_op" },
        { text = "...", next = "END" },
      },
    },
    northwatch_op = {
      lines = { { id = "nw_default", text = "The humans at Northwatch Hold, building a fort on our side of the water and pointing its guns at our road. The Warchief calls it peace, and he's the Warchief, but you've walked that road, so what do you call it?" } },
      choices = {
        { text = "A broken promise. Theramore is getting ready for war.", next = "nw_war", fx = { affinity = 1, align = { order = -1 }, opinion = { theramore = "distrust", peace = "against" } } },
        { text = "They watch us, we watch them. That's what peace looks like.", next = "nw_peace", fx = { align = { order = 1 }, opinion = { peace = "for" } } },
        { text = "Lady Proudmoore keeps her word. Northwatch is only caution.", next = "nw_jaina", fx = { opinion = { jaina = "trust" } } },
        { text = "My people want quiet. Leave Northwatch be, if they leave us be.", next = "nw_tauren", when = { race = "Tauren" }, fx = { affinity = 1, opinion = { peace = "for" } } },
        { text = "I'll leave that to you, Thork.", next = "BACK" },
      },
    },
    nw_war = {
      lines = { { id = "nww_default", text = "I've said the same in my own reports, and Orgrimmar tells me to hold the road and wait. So I hold the road, and I wait, and I keep my grunts' axes sharp." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    nw_peace = {
      lines = { { id = "nwp_default", text = "Maybe. It's a nervous sort of peace, though, and nervous men with cannons make mistakes, so keep your head down when you pass their walls." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    nw_jaina = {
      lines = { { id = "nwj_default", text = "Her word, maybe, but her soldiers are another matter. Plenty of the marines in that fort sailed with her father, and they don't take orders kindly from his daughter." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    nw_tauren = {
      lines = { { id = "nwt_default", text = "Your people have more patience than mine, and I envy it some days. If Northwatch keeps its guns pointed at the sea, I'll keep my axe on my back." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hardest = {
      lines = {
        { id = "h_sieve", text = "Every caravan wants an escort, every scout wants a rest, and the centaur raid on the one night I've got neither. The Warchief asked me for a crossroads. Some days I'm holding a sieve." },
      },
      choices = { { text = "You're holding it well.", next = "END", fx = { affinity = 2, standing = { crossroads = 1 } } } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I hear every report that reaches these walls, and these are the ones I'll speak to." },
    },
    wailing_caverns = { { id = "tp_caverns", text = "That's the druids' business, and Tonga worries about it enough for all of us." } },
    thrall = { { id = "tp_thrall", text = "The Warchief built the Crossroads the same year he built Orgrimmar, because he knew the Barrens would be lost without a fist in the middle of them. I hold it for him, and I'll hold it until he tells me otherwise." } },
    centaur = { { id = "tp_centaur", fx = { learn = { "razorfen" } }, text = "The Kolkar raid the roads from their camps out west and south, and they'd raid my gates too if they thought they'd live through it. Regthar Deathgate deals with them for the Horde, and he deals with them hard." } },
    quilboar = { { id = "tp_quilboar", fx = { learn = { "razorfen" } }, text = "The Razormane are thick around the Crossroads, and every season they get bolder. Their warrens lie south at Razorfen, and if half of what the scouts say is true, something worse than a quilboar is giving the orders down there." } },
    theramore = { { id = "tp_theramore", text = "Jaina Proudmoore keeps her peace with the Warchief, and I respect the Warchief's word. But Theramore's soldiers built Northwatch Hold on our southern coast, and a fort full of human guns is not what I'd call peace." } },
    second_war = { { id = "tp_second_war", text = "I was a grunt in the Second War, and I spent the years after it in a camp with the rest of the lost. I don't talk about either much, and the Crossroads is the first thing I've built that I'm proud of." } },
    forsaken = {
      { id = "tp_forsaken", text = "The Warchief made a pact with the dead of Lordaeron, and I'll keep it. Their apothecaries work out of my town now, and I watch them the way I'd watch any guest who brings their own poisons." },
      { id = "tp_forsaken2", when = { race = "Undead" }, text = "You're one of the Dark Lady's, so I'll say it to your face. The Warchief's word protects you here, and as long as you keep it, so will mine." },
    },
    ratchet = { { id = "tp_ratchet", text = "The goblins' port on the coast to the east, and Gazlowe's town. Everything that comes into the Barrens by sea comes through Ratchet, and Gazlowe makes sure he's paid for it." } },
    _none = { { id = "tp_none", text = "That's not my concern. My concern is the walls, and keeping them standing for the Horde." } },
  },
}

P:NPC {
  key = "sergra", id = TODO_NPC("Sergra Darkthorn"), name = "Sergra Darkthorn",
  bible = "bibles/crossroads.md", role = "questgiver", tier = "quest",
  communities = { "crossroads" }, temper = { "fierce" }, values = { "proud", "fair" },
  notices = { "gender", "kit" },
  impression = {
    first = "Sergra Darkthorn runs the Crossroads and dares anyone to be bothered by it. She sends people out past the walls with a grin, as if the Barrens were a test she enjoys setting.",
    third = "{name} met Sergra Darkthorn, the fierce orc who runs the Crossroads and sends new blood out to prove itself on the Barrens.",
  },

  greetings = {
    { id = "g_road", text = "You're new here. Good; the Barrens eats the timid, and you don't look timid to me. Now prove it." },
    { id = "g_back", when = { metBefore = true }, text = "You made it back. Most do, the first few times, and then the Barrens gets serious." },
    { id = "g_away", when = { away = 14 }, text = "Well, look who's back after {away}! I had a bet going on whether the Barrens would keep you, and I've just lost it." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "When I first sent you out you were as green as spring grass, and now look at you. The Barrens didn't eat you, so it must have taught you something." },
    { id = "g_word_intimidated", when = { word = "intimidated" }, text = "Somebody tells me you stared down one of our own and they blinked first. I like that, just don't make a habit of it inside the walls." },
  },

  notice = {
    { id = "n_woman", cat = "gender", when = { gender = "female" },
      text = "A woman out on the Barrens, making her own name. Good! The Horde has more of us than the old clans ever liked to admit, so go and show them." },
    { id = "n_man", cat = "gender", when = { gender = "male" },
      text = "Before you say it: yes, I lead here. If that bothers you, the road out is that way. If it doesn't, we'll get along fine." },
  },

  start = "hello",
  nodes = {
    xpt_sergra = {
      big = true,
      lines = { { id = "xpt_sergra_default", text = "Keep to people you trust, and let their skin be whatever it is. The Horde was nearly destroyed once by orcs who trusted only orcs, and Thrall built it again by doing the opposite, so I'd rather follow his example." } },
      choices = {
        { text = "The Horde is strongest when its peoples fight side by side.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Trust is earned by blood. Kin come first, always.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Sergra.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Gladly. The Silver Hand used to decide where orcs could walk, and now I decide where a paladin walks. I'd call that justice, if I cared for the word. Go and tame some of the Barrens, and come back and tell me about it." } },
      choices = {
        { text = "Then send me. I'll gladly earn my place.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll go where I please, not where I'm sent.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "I send anyone who'll go, and a priest who can keep a grunt breathing until the kodo cart reaches the gate is worth three axes out there. The Razormane have their own geomancers, so if you meet one, show it what real power looks like." } },
      choices = {
        { text = "I'll keep your people breathing, whatever's out there.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I go out to test myself, not to nurse grunts.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Sergra.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Everywhere south of the Gold Road, and everywhere north of it too if you're careless. The Razormane raid from their kraals, the Kolkar from the oases and the Witchwing harpies from the cliffs to the west, so pick one and break it, and then come back to me for the next." } },
      choices = {
        { text = "I'll break them one by one, for the Crossroads.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll break whoever carries the best bounty first.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I think everything out here tests us, and complaining never got a grunt through a single one of those tests. The tauren say the Earth Mother made the Barrens hard so that only the strong would stay, and I've never heard a better reason to stay." } },
      choices = {
        { text = "Then I'll meet the test head on.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Out here the clever survive as often as the strong.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Then you'll see more of it than most, because the Barrens hides plenty from anyone who stomps. Go and watch the Kolkar camps by the Stagnant Oasis and count the fires they light at night, and you'll have earned your keep before anyone else is awake." },
      },
      choices = {
        { text = "Unseen work is still work, and it wins fights.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll scout, but when it comes to it, I'll fight openly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What else does the Barrens need?", next = "need" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Fire works too well out here, {class}, because the grass has been dry since spring and one careless spell sets a whole plain burning. Use your frost on the raptors and keep your fire for the centaur, and nobody at the Crossroads will have to put out your mistakes." },
        { id = "xmage_troll", when = { race = "Troll" }, text = "A Darkspear who reads books, now that's something new for the Barrens. Fire works too well out here, though, because the grass is dry, so keep your frost for the raptors and your fire for the centaur." },
      },
      choices = {
        { text = "I'll mind the grass. A burnt plain helps nobody.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If the plain burns with the Kolkar on it, so be it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Some of the orcs here seem to resent you.", next = "resent" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Tamed, no, and I'd be sorry to see it, because a land that bites back keeps the Horde sharp. But it can be lived in, if you learn where the water is and who else is drinking from it, and that's what I send people out to learn." } },
      choices = {
        { text = "The Horde should bring order to these plains, wall by wall.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Leave the Barrens wild. That's what makes it worth living in.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "You'll find plenty, though the tauren caravans will keep their distance and I won't blame them. The Burning Blade have a nest up on Dreadmist Peak to the north, so go and show those cultists what a warlock who serves the Horde looks like, and keep your demon on a short chain while you do it." },
      },
      choices = {
        { text = "I'll keep it leashed. The Crossroads has troubles enough.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My demon goes where I send it, and nobody else decides.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xorig_beast = {
      lines = { { id = "xbm_default", text = "I remember the hunters from those first seasons, before the palisade was finished, when we slept with our beasts for walls. You've kept to the old way since, so tell me, is the Barrens still teaching you, or have you started teaching it?" } },
      choices = {
        { text = "It's still teaching me, and it's a harsh teacher.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Lately, the Barrens learns from me.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_kin", tags = { "news" }, when = { alt = { kin = true } },
          text = "You put me in mind of {alt}, who I sent out after the plainstriders and who came back with more meat than I'd asked for. Whatever blood you share, I could use that kind of work again." },
        { id = "h_alt_higher", tags = { "news" }, when = { alt = { higher = true } },
          text = "{alt} has made quite a name past the Barrens since I first sent that {altclass} after the zhevra. I take a little of the credit, so don't make me give it back by dying out there." },
        { id = "h_pt_kin", tags = { "news" }, when = { party = { kin = true } },
          text = "You travel with your own kind, I see, which I understand, but don't stay that way too long. I've learned more about fighting from tauren and trolls these past seasons than I learned in all my years among orcs." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin! Now that's a sight for the Barrens. I'll bet you've never been sent past these walls by an orc before." },
        { id = "h_default", key = true,
          text = "I'm Sergra Darkthorn, and I run the Crossroads. Thork holds the walls and I send people out past them, since the Barrens doesn't tame itself." },
        { id = "h_plainstrider", tags = { "news" }, when = { questActive = TODO_QUEST("Plainstrider Menace") },
          text = "The plainstriders are out of hand, and they breed faster than we hunt them. Thin the flock and bring me proof." },
        { id = "h_zhevra", when = { questActive = TODO_QUEST("The Zhevra") },
          text = "Zhevra are fast and mean, and they kick like a falling rock. Bring me their hooves and you'll have earned a meal." },
        { id = "h_prowlers", when = { questActive = TODO_QUEST("Prowlers of the Barrens") },
          text = "Prowlers have been stalking the roads. Hunt them down, and show them who the predator is out here." },
        { id = "h_echeyakee", tags = { "news" }, when = { questActive = TODO_QUEST("Echeyakee") },
          text = "Out on the plains is a white savannah cat the hunters call Echeyakee, old and clever and hungry. Call it out the way I showed you, and bring luck." },
        { id = "h_jorn", when = { questActive = TODO_QUEST("Jorn Skyseer") },
          text = "Go and see Jorn Skyseer at Camp Taurajo. He'll teach you things about the Barrens that I never could. Tauren listen to the land better than orcs." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, out here where the land's still wild! Then you'll feel what I feel, that the Barrens are a test and the spirits are watching to see who passes." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, out in the Barrens! Then you'll know this land better than any orc, so tell me whether it's really dying or only testing us." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. Thork will want you on the wall, but I'll want you past it, out where the Barrens bites back." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, then! Good, because the scouts I send past the walls come back with Kolkar arrows in them, when they come back at all." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock. The Crossroads has seen your kind before, and I'll judge you the way I judge anyone, by what you bring back from the Barrens." },
      },
      choices = {
        { text = "Do you really think the spirits test us, Sergra?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Do you think the Barrens can be tamed, Sergra?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Some of the orcs here seem to resent you.", next = "resent" },
        { text = "The Barrens seems to need more than soldiers can give.", next = "need" },
        { text = "My beast and I are ready to hunt.", next = "hunter", when = { class = "HUNTER" } },
        { text = "The trolls here seem to answer to you as well.", next = "troll", when = { race = "Troll" } },
        { text = "I'd rather scout the Barrens unseen than hunt it loudly.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Fire and frost work out here as well as any spear.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Where does the Barrens bite hardest, Sergra?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do you ever send priests past the walls, Sergra?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Will a warlock find work at the Crossroads, Sergra?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Will you send a paladin out past the walls, Sergra?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Should a company keep to its own people, Sergra?", next = "xpt_sergra", when = { party = { kin = true } } },
        { text = "I came out here when these walls first went up, Sergra.", next = "xorig_beast", when = { origin = "orc_barrens_beastmaster" } },
        { text = "I'll get to it.", next = "END", fx = { affinity = 1 } },
      },
      again = {
        { id = "h_again", text = "What else? Talk fast, the plainstriders don't wait." },
      },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "Good, because half my hunting work is for people like you anyway. A hunter who can't bring down a zhevra has no business calling out Echeyakee, so start small and earn the big cat." },
        { id = "hu_runner", when = { origin = "tauren_plains_runner" },
          text = "A plains runner, out of Taurajo's grass. Then you know the Barrens better than I do, and you'll find Echeyakee before he finds you." },
        { id = "hu_pet", when = { pet = { type = "Beast" } },
          text = "And {pet} looks hungry. Out here a hunter's beast eats what it kills, so let it do some of my work for me." },
      },
      choices = {
        { text = "I'll take the zhevra first, and then the cat.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
        { text = "Why does Echeyakee matter so much?", next = "hunter_cat" },
      },
    },
    hunter_cat = {
      lines = { { id = "hc_default", text = "Because he's old enough to have taught every cat out there how to stalk a caravan. Kill him and the rest get clumsy, and the Crossroads breathes easier for a season." } },
      choices = { { text = "Then he dies.", next = "BACK", fx = { affinity = 1 } } },
    },
    troll = {
      lines = { { id = "tr_default", text = "They answer to me when I give the orders, and they give me less trouble about it than the orcs do. The Darkspear have had women leading hunts for longer than the Horde has had a name, I'm told." } },
      choices = { { text = "We have. The orcs could learn from it.", next = "BACK", fx = { affinity = 2 } } },
    },
    resent = {
      big = true,
      lines = {
        { id = "r_default", text = "They do, because I'm a woman who gives orders, and some of the old warriors still think the Horde is a boys' war-band. They'll learn, or they'll stay grunts, and either one suits me." },
      },
      choices = {
        { text = "They'll learn.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Then don't wait for them to learn. Go around them.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Who resents you?", next = "who" },
      },
    },
    who = {
      lines = { { id = "w_default", text = "Kargal Battlescar, for one. He's welcome to resent me from wherever I send him." } },
      choices = { { text = "Ha.", next = "END", fx = { affinity = 1 } } },
    },
    need = {
      lines = { { id = "n_default", text = "What I need is everything back in its place. When one part of the Barrens sickens the rest follow it down, and lately it's the water." } },
      choices = { { text = "...", next = "END", fx = { learn = { "wailing_caverns" } } } },
    },
  },

  topics = {
    wailing_caverns = { { id = "tp_caverns", text = "Something's wrong in the deep places, and it's seeping into the oases. Tonga knows more than I do, so listen to him." } },
    centaur = { { id = "tp_centaur", text = "The Kolkar think the Barrens are theirs because they've been riding over them longer. I think they're wrong, and I send people out every day to argue the point with an axe." } },
    quilboar = { { id = "tp_quilboar", text = "It's the Razormane, and more of them every week, because they breed faster than we can thin them. If you've got a strong arm and a short temper, there's a fence of their tusks I'd like to see built." } },
    thrall = { { id = "tp_thrall", text = "The Warchief freed us from the camps, so I'll follow him into the sea if he says so. But I'll grumble about it, because I'm an orc and not a statue." } },
    onyxia = { { id = "tp_onyxia", text = "She's a black dragon down in Dustwallow Marsh, and the grunts at Brackenwall say she has a lair in the hills there. I'd like a look at her, and the grunts say that's why I'm not allowed down there." } },
    ratchet = { { id = "tp_ratchet", text = "It's goblins, salt air, and prices that make me want to hit somebody. Go if you need a boat, but count your coins before you leave and again after." } },
    _none = { { id = "tp_none", text = "Ask Thork, or better yet, go out there and find out for yourself. Deeds teach more than talk." } },
  },
}

P:NPC {
  key = "mankrik", id = TODO_NPC("Mankrik"), name = "Mankrik",
  bible = "bibles/crossroads.md", role = "soldier", tier = "quest",
  communities = { "crossroads" }, temper = { "grieving" }, values = { "loyal", "vengeful" },
  notices = { "kit", "kin" },
  impression = {
    first = "Up on the wall, Mankrik watches the horizon as if Olgra might walk out of the grass at any moment. His grief has gone hard and angry, and it will not let him rest.",
    third = "{name} met Mankrik, a grieving orc who stands watch at the Crossroads waiting for word of his wife Olgra.",
  },

  greetings = {
    { id = "g_horizon", text = "Hm? Oh, it's you. Stand aside, I'm watching the horizon, and if they come I want to see them first." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Did you see the pigs out there? Did you see any sign of her?" },
    { id = "g_after", when = { questDone = TODO_QUEST("Lost in Battle") }, text = "She's found, and I know where she lies now. It isn't enough, but it's something." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and I've stood on this wall the whole while, because what else is there for me to do?" },
    { id = "g_word_intimidated", when = { word = "intimidated" }, text = "I hear you made someone down there back off without lifting a weapon. I used to be able to do that, before I stopped caring who backed down." },
  },

  notice = {
    { id = "n_orc", cat = "kin", when = { race = "Orc" },
      text = "There's fire in you, orc. Good! Point it at the quilboar; they've earned every bit of it." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The pigs got to you too? Then you understand, and you're angry, and that's good. Stay angry." },
  },

  start = "hello",
  nodes = {
    xpt_mankrik = {
      big = true,
      lines = { { id = "xpt_mankrik_default", text = "You don't let them out of your sight, and you don't let pride tell you the road is safe because it was safe yesterday. Olgra was the better fighter of the two of us, and the quilboar still took her, because she was alone when they came." } },
      choices = {
        { text = "We'll watch each other's backs. Nobody rides alone.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Every fighter should be able to stand alone.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'm sorry, Mankrik.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Sorry doesn't find her. I've no use for prayers, dead man, and less for the Light. If you want to do something holy, go out into the grass and find out what the quilboar did with her. That's the only miracle I'm waiting for." } },
      choices = {
        { text = "Then I'll search for her, and pray as I go.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "No miracles. Just a sword and a search.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "If you find her, say what you like over her, and say it loud enough for the quilboar to hear. She'd have laughed at a priest fussing over her, but I wouldn't laugh, and I'd owe you for it." } },
      choices = {
        { text = "When she's found, she'll have her rites. You have my word.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers won't bring her back. Vengeance at least feels like something.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Mankrik.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "The trail's cold now, but you could try, and nobody else has offered. The quilboar who swarmed us dragged everything they took off to the south, so look for heavy tracks heading toward the southern kraals, and look closely." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} has a fine nose. If Olgra's still out there, a beast like that might find her where my eyes never could." },
      },
      choices = {
        { text = "I'll search for her, Mankrik, whatever I find.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Your grief is your own, Mankrik. I hunt for myself.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "No. Yes. I don't know what I want, shaman, except to stop standing on this wall. If she's dead she'll be angry, and if she's angry she'll be near the quilboar who did it, so look there, and don't come back and tell me she was afraid." } },
      choices = {
        { text = "You should grieve her, Mankrik, and not only avenge her.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Then her killers will pay for every day you've waited.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Quietly is how she'd have done it, if she'd ever had the sense to run, though Olgra never ran from anything in her life. The quilboar camps to the south took prisoners after that fight, so look there, and if you find her, don't let them see you leave." },
      },
      choices = {
        { text = "If I find who did it, they'll never see me coming.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll find her, and then I'll face her killers openly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "What was Olgra like?", next = "olgra" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "I hate the stink of the things, and I hate that the Horde still has to look at them. But if your demon puts its claws in the quilboar who swarmed us, I won't spit when it walks past me, and that's the most you'll get from me." },
        { id = "xwarlock_orc", when = { race = "Orc" }, text = "Our people sold themselves to those things once, and look what it bought us. But if your demon tears into the quilboar who swarmed us, I'll keep my mouth shut about it, and that's more than I'd give most warlocks." },
      },
      choices = {
        { text = "A demon's claws are still claws, and revenge is revenge.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I'll do it with my own hands, not a demon's.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Who was the tauren who found you?", next = "tauren" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "I asked, and they told me the land would give her back to me in its own time. I don't want the land's time, I want my wife, and if I have to kill every quilboar between here and Thousand Needles to find her, I will." } },
      choices = {
        { text = "Find her and honour her. Vengeance won't bring her back.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "The quilboar earned your vengeance. Take every bit of it.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "No spell finds what the quilboar took, or I'd have begged one off every mage who passed through this gate. Burn their camps to the south if you like, and if you find her, bring me something of hers, because that's all I'll ever ask of anyone." },
      },
      choices = {
        { text = "Vengeance won't bring her back, Mankrik. I'm sorry.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then I'll make the quilboar pay for her, camp by camp.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_any", tags = { "news" }, when = { party = true },
          text = "You've got someone at your back out there. Keep them close, because I let Olgra ride ahead to the Crossroads alone once, and I'll be paying for that the rest of my life." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "The Light. The humans' priests never saved anyone in the camps, and your Light didn't save my Olgra either." },
        { id = "h_default", key = true,
          text = "I'm Mankrik. My wife Olgra and I fought the quilboar side by side until they split us up and swarmed us. A tauren found me half-dead on the road, but nobody ever found her." },
        { id = "h_hatred", tags = { "news" }, when = { questActive = TODO_QUEST("Consumed by Hatred") },
          text = "Kill them, as many as you can, and bring me proof. Thork won't send anyone, so I'm sending you, and for every one you kill I'll sleep a little." },
        { id = "h_lost", tags = { "news" }, when = { questActive = TODO_QUEST("Lost in Battle") },
          text = "She's out there somewhere, so find her for me, alive or not. I need to know, because I can't stand on this wall not knowing much longer." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "You came back, and you didn't have to. Olgra would have liked you, I think, and she didn't like many people." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. You talk to the dead, they say, so if Olgra's spirit has crossed your path out in the grass, I need to hear it, whatever she said." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. You've the eyes of someone who knows the grass, so if you've seen tracks out there that might be Olgra's, I need to hear it." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Olgra could track a quilboar across bare rock, and she taught me a little of it before... well, before." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. If you've come to tell me Olgra's spirit is at peace, save your breath, because I'll believe that when I've seen what the quilboar did to her." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. I know your spells can't bring back the dead, so don't offer, and don't look at me like that." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Razormane", min = 40 } }, text = "The Razormane are fewer than they were, and I know whose work that is. It doesn't bring her back, but I sleep a little better knowing they bleed too." },
      },
      choices = {
        { text = "Do you want me to listen for Olgra's spirit?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "The tauren druids might help you search, Mankrik.", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Tell me about Olgra.", next = "olgra" },
        { text = "Revenge won't bring her back.", next = "revenge" },
        { text = "I fight with an axe too. Tell me how she fought.", next = "warrior", when = { class = "WARRIOR" } },
        { text = "So a tauren found you out on the road.", next = "tauren", when = { race = "Tauren" } },
        { text = "I can slip into the quilboar camps and look for her quietly.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Could I pick up Olgra's trail, Mankrik?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "My demons could hunt the ones who took her.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Would you want a prayer said over Olgra, Mankrik?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "My spells might help you find Olgra, Mankrik.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "I'm sorry about Olgra, Mankrik.", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "How do I keep my companions safe out there, Mankrik?", next = "xpt_mankrik", when = { party = true } },
        { text = "I'll keep an eye out.", next = "END", fx = { affinity = 1 } },
      },
      again = {
        { id = "h_again", text = "What else? Say it, and then let me get back to the horizon." },
      },
    },
    warrior = {
      lines = { { id = "wr_default", text = "Two axes and no shield, always charging the biggest one first, and she never once let me take the front. That's how they split us: she charged, and I went after her, and there were more of them behind than either of us saw." } },
      choices = {
        { text = "That's how a warrior should die, charging.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "She should have held back, Mankrik.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
      },
    },
    tauren = {
      lines = { { id = "ta_default", text = "One of your people, a kodo herder heading for Taurajo, and he carried me to the Crossroads on his own back. I never got his name, and I owe him a debt I can't pay to a stranger." } },
      choices = { { text = "I'll ask after him at Taurajo.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } } },
    },
    olgra = {
      big = true,
      lines = {
        { id = "o_default", text = "She fought better than me, and laughed louder. She'd have told me to stop standing on this wall moping, and I would, if I knew where she was." },
      },
      choices = {
        { text = "I'll find her.", next = "END", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "I'm sorry.", next = "END", fx = { affinity = 2 } },
      },
    },
    revenge = {
      lines = { { id = "r_default", text = "Thork said the same, so I'll tell you what I told him: I know, and I don't care. Now leave me to the horizon." } },
      choices = {
        { text = "Why stand on this wall instead of searching yourself?", tag = "Persuade", next = "wall_truth",
          check = { pass = { any = { { disposition = { min = 65 } }, { trait = "kind" }, { questActive = TODO_QUEST("Lost in Battle") } } } },
          fail = { next = "wall_away", fx = { affinity = -1 } } },
        { text = "...", next = "END", fx = { affinity = -1 } },
      },
    },
    wall_truth = {
      big = true,
      lines = {
        { id = "wt_default", text = "Because as long as I stand here, she might still be out there alive. If I go and look, and I find her, then she isn't, and I'm a coward about that one thing, the only thing Olgra ever saw me run from." },
      },
      choices = {
        { text = "Then let me look for you.", next = "END", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "That isn't cowardice. It's love.", next = "END", fx = { affinity = 2 } },
      },
    },
    wall_away = {
      lines = {
        { id = "wa_default", text = "Because someone has to watch for the pigs, and I'm the one with the reason to. Go on, leave me to it." },
      },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I don't know much beyond the quilboar and this wall. Ask about these, if you must." },
    },
    centaur = { { id = "tp_centaur", text = "Kolkar or quilboar, it was one of them that caught Olgra on the road south, and I'll know which before I'm done. I've killed enough of both to stop caring which is which." } },
    quilboar = { { id = "tp_quilboar", text = "The Razormane run their raiders down the roads at dusk, and that's when the caravans burn. If you see their banners, kill the one carrying it first." } },
    thrall = { { id = "tp_thrall", text = "The Warchief is a good chieftain and a better orc than me. He'd tell me to let Olgra go, and I'd tell him no, and neither of us would be wrong." } },
    second_war = { { id = "tp_second_war", text = "I fought for the old Horde, and I was proud of it then. I came home to Olgra after the camps, and she was the only good thing that came out of all those years." } },
    _none = { { id = "tp_none", text = "I don't know and I don't care, grunt. Ask me about quilboar." } },
  },
}

P:NPC {
  key = "tonga", id = TODO_NPC("Tonga Runetotem"), name = "Tonga Runetotem",
  bible = "bibles/crossroads.md", role = "questgiver", tier = "quest",
  communities = { "crossroads" }, temper = { "measured" }, values = { "balanced", "patient" },
  notices = { "form", "class" },
  impression = {
    first = "Tonga Runetotem found the strange power Thunder Bluff sent him looking for, and he wishes he had not. He speaks calmly about poisoned oases, which made what he said all the more unsettling.",
    third = "{name} met Tonga Runetotem, a tauren druid at the Crossroads tracing the sickness that poisons the oases of the Barrens.",
  },

  greetings = {
    { id = "g_calm", text = "Peace, friend. The land is restless lately, like a herd before a storm, and all the more reason for us not to be." },
    { id = "g_druid", when = { class = "DRUID" }, text = "Druid-kin, good. I need eyes that see the land the way the Earth Mother does, so sit, and I'll tell you what's wrong with it." },
    { id = "g_away", when = { away = 14 }, text = "You've been away {away}, and the land hasn't healed in that time, I'm sorry to say. Grass is slow to forgive. Sit, and I'll tell you what has changed." },
    { id = "g_word_angered", when = { word = "angered" }, text = "I heard you left someone here angry not long ago. The land is troubled enough, friend, so I'd ask you not to add to it." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Someone at the Crossroads spoke warmly of you, and warm words are rare enough out here. The Earth Mother notices kindness, and so do I." },
  },

  notice = {
    { id = "n_travel", cat = "form", when = { form = "travel" },
      text = "You came in on four legs, and fast. That's good, because the Barrens is big, and the faster we move, the more we can save." },
  },

  start = "hello",
  nodes = {
    xpt_tonga = {
      big = true,
      lines = { { id = "xpt_tonga_default", text = "The Druids of the Fang went into the Wailing Caverns to heal the land and came out wrong, and the water rose with them, poisoned with their dreams. A druid in your company should feel it near the Lushwater and the Stagnant Oasis, and should be careful not to sleep there." } },
      choices = {
        { text = "They were healers once, and they deserve a chance to be saved.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Stop them before they poison any more of the land.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else, Tonga.", next = "BACK" },
      },
    },
    xcl_wc = {
      big = true,
      lines = { { id = "xcl_wc_default", text = "Then the nightmare under the Barrens may finally be loosening its grip. Naralex went down to make this land green again, but his dream turned sour and poisoned the oases from below, and that was the power Thunder Bluff sent me to find. I'll write to Hamuul tonight, because he'll want to know that a stranger's hand did what the Circle's could not." } },
      choices = {
        { text = "Naralex meant well. He deserves to be saved, not blamed.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "His good intentions poisoned the Barrens. He should answer for it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "The oases should begin to heal now, I'd think.", next = "xcl_wc2" },
      },
    },
    xcl_wc2 = {
      lines = { { id = "xcl_wc2_default", text = "Slowly, if they heal at all. The deviate creatures will breed for years yet, and water remembers poison longer than earth does, but a wound that stops being torn open can start to close. I'll be watching the Lushwater and the Stagnant Oasis to see which way they go." } },
      choices = { { text = "Then I'll look in on them when I pass, Tonga.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "To a tauren, yes. The Earth Mother gives life, and the Light is a stranger to us, and you are a stranger still: death that carries the Light. Yet you do not feel like the poison in the oases, and I am curious what you are instead." } },
      choices = {
        { text = "Something that heals, I hope. Watch and judge.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'm a weapon, Tonga. Point me at the poison.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Perhaps the creatures that drink from them, if not the water itself, because what sickens the oases comes from under the earth and does not answer to prayers. The druids who went down into the Wailing Caverns meant to heal the land, and something answered them that should not have. Mend what you can on the surface, and leave the deep places to us." } },
      choices = {
        { text = "Then I'll mend whatever crawls out of those waters sick.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "If the land is poisoned, let it burn clean instead.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Tonga.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Twisted beasts, and druids who have forgotten what they once swore to protect. The Druids of the Fang dream wrong and the creatures of the oases grow wrong around them, so if you must fight there, fight the corruption and spare whatever can still be healed." } },
      choices = {
        { text = "I'll fight the corruption and spare what can be healed.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Twisted or not, a threat is a threat. I'll cut it down.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They're larger, angrier and stranger, and some of them have scales where no scales should grow. Something in the Wailing Caverns is seeping into the water and the beasts that drink it, so watch what you hunt near the Forgotten Pools, and tell me what you see." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep your {pet} from drinking at the oases until we know what's in the water. I'd hate to see a good companion turn against you." },
      },
      choices = {
        { text = "I'll watch and report, Tonga. The land must heal.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Twisted beasts make good trophies. I'll hunt them anyway.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Perhaps it could, though I confess the arcane makes me uneasy, because it is a power taken rather than one given. The trouble in the Wailing Caverns began with a druid who reached too far for something he wanted, so whatever you see down there, look carefully and do not reach." },
        { id = "xmage_scourge", when = { race = "Scourge" }, text = "Perhaps, though a dead mage studying a dying oasis is a strange sight, even for me. The trouble in the Wailing Caverns began with a druid who reached too far for something he wanted, so look carefully down there and do not reach." },
      },
      choices = {
        { text = "I'll study it to mend it, not to take it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Power is power, and I'll take what I can learn.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What exactly did you find out there?", next = "found" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Leashed is a word I've heard before, usually just before something got loose. The tauren know what the Burning Blade's fire does to living things, and your company does not sit easily with me, but if you know corruption, perhaps you'll know it when you smell it at the oases." },
      },
      choices = {
        { text = "Then I'll use what I know to help cleanse them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Corruption is only a tool, and I'll use it as I like.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "What did you find at the oases?", next = "found" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Perhaps better than a druid could, because the Druids of the Fang would know me at a glance and they would not know you. Slip past them at the mouth of the caverns and listen to what they say to each other, then come back and tell me whether any of them still remember who they were." },
      },
      choices = {
        { text = "I'll watch them first and judge them after.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If they've fallen, I'll put them down quietly.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Tonga.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_druid", tags = { "news" }, when = { party = { class = "DRUID" } },
          text = "Your friend {companion} walks like a druid, careful where the grass is thin. The Barrens are hard on everything that grows, so tell them to keep an eye on the oases, because something has gone wrong in the water." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken who carries the Light. Thunder Bluff sent me to find a strange power in the Barrens, and I did not expect to meet another one at the Crossroads." },
        { id = "h_default", key = true,
          text = "My name is Tonga Runetotem. Thunder Bluff sent me to find where a strange power in the Barrens was coming from, and I found it, though I wish the wind had carried me somewhere else." },
        { id = "h_cl_wc", tags = { "news" }, when = { cleared = "Wailing Caverns", faction = "Horde" }, text = "The oases have run a little clearer this week, and the wrongness I felt in the green has faded. I've heard you went down into the caverns, and I'd very much like to know what you found." },
        { id = "h_oases", tags = { "news" }, when = { questActive = TODO_QUEST("The Barrens Oases") },
          text = "The oases are the heart of the Barrens, and something is poisoning them. Bring me samples from the water, and we'll see how deep the sickness goes." },
        { id = "h_stagnant", when = { questActive = TODO_QUEST("The Stagnant Oasis") },
          text = "The Stagnant Oasis is the worst of all, so go carefully. The things that drink from it aren't themselves anymore." },
        { id = "h_hamuul", when = { questActive = TODO_QUEST("Hamuul Runetotem") },
          text = "Take what we've found to the Arch Druid. He'll want to see it with his own eyes, as I would in his place." },
        { id = "h_cure", when = { questActive = TODO_QUEST("Gathering the Cure") },
          text = "The gazelles near Dreadmist Peak are sick. Moonglade's lore and the Barrens' own water together might make them well, if you bring me what's needed." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. The land doesn't need more blood spilled on it, but it may need someone to stand between it and whatever is spreading from the Wailing Caverns." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter, and you'll have seen it already: the beasts near the oases aren't what they were." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde in the Barrens. The Earth Mother speaks to my people in her own way, and I have wondered what your gods tell you when you listen as hard as I do." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "You walk quietly for one so young. Good, because the Wailing Caverns do not forgive heavy feet." },
      },
      choices = {
        { text = "What did you find?", next = "found" },
        { text = "I'm a druid too, Tonga. Can I help heal the oases?", next = "druid", when = { class = "DRUID" } },
        { text = "The water spirits here are crying out.", next = "shaman", when = { class = "SHAMAN" } },
        { text = "Could an arcane eye help you trace the power in the caverns?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Something is spreading out of the Wailing Caverns, Tonga.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What's wrong with the beasts near the oases, Tonga?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "I know the feel of corruption. Mine is leashed, at least.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Can a priest help heal the poisoned oases, Tonga?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "A rogue could learn what's happening in those caverns.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Am I a strange power, Tonga?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I reached Naralex in the Wailing Caverns, Tonga.", next = "xcl_wc", when = { cleared = "Wailing Caverns", faction = "Horde" } },
        { text = "My companion is a druid. What's wrong with the oases?", next = "xpt_tonga", when = { party = { class = "DRUID" } } },
        { text = "Farewell, Tonga.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Something more, friend? The land isn't in a hurry, even if we must be. A kodo crosses the plains one step at a time." },
      },
    },
    druid = {
      lines = {
        { id = "dr_default", text = "You can, and you should, but carefully. The druids in those caverns were trying to heal the land too, and they walked into the Dream and didn't come out themselves. Heal from the waking world first." },
        { id = "dr_pupil", when = { origin = "tauren_hamuul_pupil" },
          text = "You studied under Hamuul as I did, so you've heard his warning about the Dream already. Those druids under the Barrens heard it too, and went anyway." },
      },
      choices = {
        { text = "The Dream is dangerous. I'll stay in the waking world.", next = "BACK", fx = { affinity = 2, align = { order = 1 } } },
        { text = "If the sickness is in the Dream, that's where I'll fight it.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
      },
    },
    shaman = {
      lines = { { id = "sh_default", text = "They are, and I can only feel it as a wrongness in the green, while you hear it in words. Tell me what they say, friend, and I'll write it down for Hamuul; he'll want the spirits' account beside mine." } },
      choices = { { text = "They say the water is dreaming badly.", next = "BACK", fx = { affinity = 2, learn = { "wailing_caverns" } } } },
    },
    found = {
      big = true,
      lines = {
        { id = "f_default", key = true,
          text = "The Wailing Caverns. Druids went into them to heal the land, and something in the dark turned their dream bad. Now the sickness comes up with the water." },
      },
      choices = {
        { text = "Can it be stopped?", next = "stop", fx = { learn = { "wailing_caverns" } } },
        { text = "So it was druids who did this.", next = "druids", fx = { learn = { "wailing_caverns" } } },
      },
    },
    stop = {
      lines = { { id = "s_default", text = "By someone braver than me. Go into the caverns when you're strong and find who started this, and start with the water. Always start with the water." } },
      choices = {
        { text = "I will.", next = "END", fx = { affinity = 2, align = { light = 1 } } },
        { text = "I'll go when there's coin in it, and not before.", next = "END", fx = { align = { light = -1 } } },
      },
    },
    circle_op = {
      lines = { { id = "cc_default", text = "The Circle taught Hamuul, and Hamuul taught us, so I owe it my training. But its night elves are the same people the Warsong fight in Ashenvale, and folk at the Crossroads ask me whose side a druid is on. What do you think, friend?" } },
      choices = {
        { text = "The Circle stands above Horde and Alliance. That's its worth.", next = "cc_trust", fx = { affinity = 2, align = { order = 1 }, opinion = { cenarion_circle = "trust" } } },
        { text = "A night elf is a night elf. The Circle serves Darnassus.", next = "cc_distrust", fx = { affinity = -1, align = { order = -1 }, opinion = { cenarion_circle = "distrust", night_elves = "distrust" } } },
        { text = "The Warsong are wrong to cut Ashenvale.", next = "cc_ashen", fx = { affinity = 1, opinion = { ashenvale = "wrong" } } },
        { text = "The Circle gave us back the old ways. I honor it.", next = "cc_druid", when = { class = "DRUID" }, fx = { affinity = 2, opinion = { cenarion_circle = "admire", druidism = "respect" } } },
        { text = "I don't know enough to say.", next = "BACK" },
      },
    },
    cc_trust = {
      lines = { { id = "cct_default", text = "I hope so, and in Moonglade it's true. Out here, with the Outriders and the Sentinels killing each other a day's ride north, it's harder to believe, but I keep trying." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cc_distrust = {
      lines = { { id = "ccd_default", text = "Some of the elves would say the same about us, that a tauren druid is only a Horde spy in antlers. I'd rather prove both of you wrong." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cc_ashen = {
      lines = { { id = "cca_default", text = "Say that gently near Kadrak's runners, because they bury friends in that forest. I think you're right, but being right won't build Orgrimmar's walls." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cc_druid = {
      lines = { { id = "ccr_default", text = "Then you walk the same path I do, between two peoples who don't trust either of us. Mind the Dream, friend, and mind the forest's anger too." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    druids = {
      lines = { { id = "d_default", text = "Druids meant well. That's the most frightening part, friend. Anyone can mean well and still go wrong in the dark, where An'she's light doesn't reach." } },
      choices = {
        { text = "Do you trust the Cenarion Circle?", next = "circle_op" },
        { text = "...", next = "END" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've listened to the Barrens a long while, and it tells me more than people do. Ask me about any of these, friend." },
    },
    wailing_caverns = { { id = "tp_caverns", text = "It's a cave with a poisoned dream at the bottom of it. That's the plain version, and the plain version is bad enough." } },
    cenarion_circle = { { id = "tp_circle", text = "Hamuul brought us into it. The Barrens needs every druid it can get, and the Circle needs to hear about this place." } },
    centaur = { { id = "tp_centaur", text = "The centaur are sons of Cenarius, so the old stories say, though they have little of his patience in them. The Kolkar war on everyone and on each other, and it is a sad thing to watch a whole people so angry." } },
    quilboar = { { id = "tp_quilboar", fx = { learn = { "razorfen" } }, text = "The quilboar are children of Agamaggan, the great boar who bled to save the forest, and they still carry that wound in their temper. Their warrens at Razorfen grow thornier every year, and something dark has taken root among them." } },
    emerald_dream = {
      { id = "tp_emerald_dream", text = "The Dream is the world as it might have been, untouched, and the druids walk it in their sleep. Naralex went into the Wailing Caverns to dream the Barrens green again, and I fear he went too deep." },
      { id = "tp_emerald_dream2", when = { class = "DRUID" }, text = "You have felt it too, then, when you sleep and the world is greener than it should be. Be careful near Naralex's dream, because something in it has turned sour." },
    },
    earth_mother = { { id = "tp_earth_mother", text = "The Earth Mother made us, and she is in every root and stone of the Barrens. When the oases sicken, I feel it the way you might feel a fever in a friend." } },
    green_dragons = { { id = "tp_green_dragons", text = "Ysera's flight guards the Dream and the great trees where its doors open. They are not cruel, but they are old, and they do not always remember that small things like us can be hurt." } },
    cairne = { { id = "tp_cairne", text = "High Chieftain Cairne sent me here to learn what is poisoning the land, and I will not go home until I can tell him. He is the wisest of us and the most patient, and patience like his should not be spent on me." } },
    _none = { { id = "tp_none", text = "I don't know, friend, but the land might. Listen to it a while, and walk with the Earth Mother." } },
  },
}

P:NPC {
  key = "helbrim", id = TODO_NPC("Apothecary Helbrim"), name = "Apothecary Helbrim",
  prejudice = { race = "Tauren", class = "DRUID", amount = 10, why = "Tauren druids sniff at his samples and report him to Thunder Bluff; he thinks them sanctimonious about the Society's work." },
  bible = "bibles/crossroads.md", role = "scholar", tier = "quest",
  communities = { "crossroads" }, temper = { "clinical" }, values = { "curious", "practical" },
  notices = { "craft", "race" },
  impression = {
    first = "Apothecary Helbrim swears the Society only wants to study the Barrens, not harm it, mostly. That 'mostly' has stayed with me longer than anything else he said.",
    third = "{name} met Apothecary Helbrim of the Royal Apothecary Society, who studies what grows, festers and stings in the Barrens.",
  },

  greetings = {
    { id = "g_prej", when = { prejudiced = true }, text = "A tauren druid, at my stall again. Go on, then, smell the jars and frown and send another letter to the Arch Druid about what the wicked apothecary is doing to the grass." },
    { id = "g_prej_over", when = { prejudiced = "overcome" }, text = "You know, you're the only druid in the Barrens who's ever asked what I'm actually doing before telling me it's wrong. I find it unsettling, in a pleasant sort of way." },
    { id = "g_samples", text = "Hands! Living ones, even, which is excellent. Mine shake a little, these days." },
    { id = "g_back", when = { metBefore = true }, text = "Back with something for me? The Barrens is full of things worth bottling, most of them still alive, which I find so wasteful." },
    { id = "g_away", when = { away = 14 }, text = "Back after {away}, and still breathing, which is more than my samples can say. Do you have anything for me?" },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've grown considerably since I sent you out for those first samples. Stronger hands mean bigger jars, so I'm delighted." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "I hear someone here believed a tale you spun them. How delightful; the living are so trusting, and I do enjoy watching them learn." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = { "Alchemy", "Herbalism" } },
      text = "You work with reagents? Good, then we'll talk shop, you and I. The others here only ask what's in my bottles so they can avoid it." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Don't look at me like that; we're on the same side. The Society only wants to study the Barrens, not harm it. Mostly." },
  },

  start = "hello",
  nodes = {
    prej_helbrim = {
      big = true,
      lines = { { id = "prej_helbrim_default", text = "Trouble? Your kind have written to Thunder Bluff about me eleven times this season. I collect spores, I take notes, I mind my own business, and every druid who walks past my table looks at me as if I'd poisoned the Earth Mother herself." } },
      choices = {
        { text = "Your Society brews plagues. Somebody should be watching you.", next = "BACK", fx = { align = { light = 1 }, affinity = -1 } },
        { text = "The Barrens are big. Your samples won't hurt the Earth Mother.", next = "BACK", fx = { align = { light = -1 }, affinity = 1 } },
        { text = "I'd rather ask than guess. Show me your work.", next = "prej_helbrim_calm", fx = { affinity = 1 } },
        { text = "What are the spores really for?", next = "prej_helbrim_why" },
      },
    },
    prej_helbrim_why = {
      lines = { { id = "prej_helbrim_why_default", text = "I don't know, and that is the truth; I send them to the Undercity and the Society tells me nothing. The not knowing keeps me up at night, if the dead can be said to sleep, and perhaps that's why the druids bother me so much." } },
      choices = { { text = "I see. Let me answer you, then.", next = "prej_helbrim" }, { text = "Something else.", next = "BACK" } },
    },
    prej_helbrim_calm = {
      lines = { { id = "prej_helbrim_calm_default", text = "Oh. Well, nobody's asked that before, so the notes are a mess. Here, these are the spores from the oasis, and these are the ones that made a lizard sneeze for a week." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xpt_helbrim = {
      big = true,
      lines = { { id = "xpt_helbrim_default", text = "Politely, which is worse than rudely, because politeness means they're waiting for me to do something they can hang me for. Still, Thork sends me his wounded, and a grunt who's been stitched up by dead hands tends to look at me differently afterwards." } },
      choices = {
        { text = "Trust is earned slowly, and you're earning it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Can you blame them? The dead are hard to trust.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Apothecary.", next = "BACK" },
      },
    },
    xcl_rfd = {
      big = true,
      lines = { { id = "xcl_rfd_default", text = "Destroyed, yes, since he was already dead, though I'll allow the distinction is academic. The Scourge sent him to make the quilboar into servants, and he very nearly managed it, so you may judge for yourself what the Lich King thinks Kalimdor is for. The Forsaken know better than anyone what it is to be one of his tools, and we take a certain pleasure in breaking them." } },
      choices = {
        { text = "His power could have been studied first, apothecary.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Every servant of the Lich King deserves to be destroyed.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "What does the Society want from the Downs?", next = "xcl_rfd2" },
      },
    },
    xcl_rfd2 = {
      lines = { { id = "xcl_rfd2_default", text = "Samples, naturally, and notes on how the plague behaves in quilboar, since it clearly behaves differently than it does in humans. A cure needs a disease to study, and the Downs were a very generous source while they lasted, though I'm sure the tauren would rather not hear the details." } },
      choices = { { text = "Then I'll leave the details with you, apothecary.", next = "BACK" } },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Doubt is a scientific virtue. The Silver Hand served Terenas and the living, and many of its knights still hunt us in Lordaeron. You carry their Light, and I'm merely curious whether you carry their loyalties too. The Society would love to know." } },
      choices = {
        { text = "My loyalty is to the Dark Lady and the Horde.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "My loyalty is to the Light, not any Lady.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Use? Certainly, though perhaps not the one you'd hope, because a priest who can keep a test subject alive a little longer is very useful to our work. Master Faranell would say the same, and he'd mean it more than I do." } },
      choices = {
        { text = "I'd keep anyone alive for the Society, whatever the reason.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Healing isn't a tool for your experiments, Apothecary.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else, Apothecary.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Venom glands from the spiders and serpents, mostly, and whatever grows in the Forgotten Pools that the tauren won't let me pick. I'd go myself, but the last time I tried, a raptor took my satchel and very nearly my arm, and I can't spare either." } },
      choices = {
        { text = "I'll gather your samples, for the Horde's sake.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll gather them for coin, apothecary, and ask nothing.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "For their venom, of course, which cures as often as it kills, depending on who holds the vial. The tauren call it medicine and I nod politely, and somewhere in Brill a colleague of mine is grateful for every gland I send home." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And do keep your {pet} away from my crates. Some of what's inside would interest it far too much, and none of it would do it any good." },
      },
      choices = {
        { text = "Medicine, then. I'll only gather for healing.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Venom is venom. What you do with it is your affair.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Because the elements make poor research partners, and shamans make worse ones, so I have to ask. The tauren at Thunder Bluff look at us as though the ground itself objects to our walking on it, and I would very much like to know whether it does, for my notes." } },
      choices = {
        { text = "Undeath breaks the natural order, and the earth feels it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The elements don't care what walks on them, Helbrim.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "They do, and the Society has never pretended otherwise, whatever it tells the tauren. The spiders and serpents of the Barrens carry venoms that would interest anyone with a blade, though I'd rather not write it all down where our hooved friends might read it." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "They do, and you'll know as well as I do that the Dark Lady values both. The spiders and serpents of the Barrens carry venoms that would interest anyone with a blade, though I'd rather not write it all down where our hooved friends might read it." },
      },
      choices = {
        { text = "Better the tauren don't know everything. Secrets keep us strong.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The Horde should know what its allies are brewing.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You seem to be studying everything that grows out here.", next = "study" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "The Forsaken trust nobody, which makes us admirably fair about it. The Dark Lady keeps a dreadlord of her own on a short chain in Undercity, so a warlock is welcome among us for exactly as long as he remembers who is holding the chain." },
      },
      choices = {
        { text = "Every power needs a master, and I hold my chain tightly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Chains are for the weak. My demon and I need none.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Does the Society send you word from Undercity?", next = "forsaken" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Remedies, mostly, and a better understanding of what grows in dry country, which the Society finds very useful. Not every tincture I brew is meant to heal, admittedly, but the Warchief has seen our reports, and he hasn't complained." } },
      choices = {
        { text = "Plants taken for healing are well taken. Poisons are not.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Remedy or poison, knowledge is knowledge. I'd study it too.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "We trust results, and a good many of our finest minds were magi in Lordaeron before the plague, which rather proves the point. Keep your fire well away from my samples, though, because there is nothing quite as educational as a scorched specimen, and nothing quite as useless." },
      },
      choices = {
        { text = "Study the Barrens all you like, but don't poison them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Whatever the Society brews, the Horde's enemies deserve it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_forsaken", tags = { "news" }, when = { party = { race = "Scourge" } },
          text = "Another of my own, travelling with you. {companion} must have the patience of a saint or the stubbornness of the dead, because the orcs out here still won't share a campfire with me." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. How quaint. Some of us remember the Silver Hand from before the plague, and we wonder which side of that memory you stand on." },
        { id = "h_default", key = true, text = "The name is Helbrim, of the Royal Apothecary Society. The Dark Lady sent me to see what grows out here that might be useful, and a surprising amount does, though most of it is better dead." },
        { id = "h_cl_rfd", tags = { "news" }, when = { cleared = "Razorfen Downs", faction = "Horde" }, text = "Word reached me that the lich in Razorfen Downs has been dealt with. The Society will be pleased, and I confess so am I, because the Scourge are an embarrassment to all of us who left them behind." },
        { id = "h_spores", tags = { "news" }, when = { questActive = TODO_QUEST("Fungal Spores") },
          text = "Spores from the fungus out by the water are what I need, and don't breathe near them. Well, you do still breathe, I suppose, so I'll simply advise against it." },
        { id = "h_zamah", when = { questActive = TODO_QUEST("Apothecary Zamah") },
          text = "Zamah needs this, up in Thunder Bluff by the Pools of Vision. The tauren don't entirely trust the Society, but they trust Zamah." },
        { id = "h_dizzywig", when = { questActive = TODO_QUEST("Wharfmaster Dizzywig") },
          text = "Dizzywig at Ratchet is to have this delivery. The goblins will move anything for the right price, and some of my shipments need moving very discreetly." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. I doubt I have a spirit left worth speaking to, so don't trouble yourself, though I confess I'm curious what the elements make of a man like me." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid. You'll disapprove of my work, I imagine, since I take the Barrens' plants apart to see what's inside, and your kind prefer them whole." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior. How useful; the Society's samples have a habit of biting back, and I've only these thin old arms to defend them." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. You'll know where the serpents and spiders of the Barrens nest, then, which is more than I do." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "Ah, a priest. If you're one of the Forgotten Shadow, we're practically colleagues, but if you still pray to the Light, I'd rather not hear about it while I'm working." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage! The Society respects the arcane, in its place, and its place is usually a laboratory." },
      },
      choices = {
        { text = "You sound like you've had trouble with druids before, Helbrim.", next = "prej_helbrim", when = { prejudiced = true } },
        { text = "Why would an apothecary care what the elements think?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "The Society must want something from the Barrens' plants.", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "What are you studying?", next = "study" },
        { text = "Does the Society send you word from Undercity?", next = "forsaken", when = { race = "Scourge" } },
        { text = "My people make medicine from these plants too.", next = "troll", when = { race = "Troll" } },
        { text = "An apothecary's venoms and a rogue's blades go well together.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "What samples does the Society want, Helbrim?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Why does the Society care about serpents, Helbrim?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "The Forsaken seem to trust warlocks more than the orcs do.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Does the Society have any use for priests, Helbrim?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Does the Society trust mages, Helbrim?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do you doubt my loyalty to the Dark Lady, Helbrim?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Amnennar the Coldbringer is destroyed, apothecary.", next = "xcl_rfd", when = { cleared = "Razorfen Downs", faction = "Horde" } },
        { text = "How do the orcs here treat you, Apothecary?", next = "xpt_helbrim", when = { party = { race = "Scourge" } } },
        { text = "Good luck with your work.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a sample warming, and unlike you, it won't keep forever. Be brief." },
      },
    },
    forsaken = {
      lines = { { id = "fk_default", text = "Every fortnight, by bat, and always the same thing: more samples, faster, and fewer questions from the tauren. Master Faranell is not a patient correspondent, though I'm told patience is a living virtue anyway." } },
      choices = {
        { text = "The Society's work comes first.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The tauren deserve answers, Helbrim.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    troll = {
      lines = { { id = "tr_default", text = "Do they? Witch doctors' remedies, I suppose, which some of my colleagues sneer at. I don't, because half of what the Society knows about poisons began as someone's grandmother's cure, so do tell me which of these your people boil." } },
      choices = { { text = "Peacebloom, for fever. Never the fungus.", next = "BACK", fx = { affinity = 2 } } },
    },
    study = {
      big = true,
      lines = {
        { id = "s_default", text = "Everything that grows, festers or stings out here, and what I'm after is remedies, mostly. Some of us still remember being sick, and we'd like no one else to be." },
      },
      choices = {
        { text = "That's kind of you.", next = "BACK", fx = { affinity = 2 } },
        { text = "Mostly remedies?", next = "mostly" },
      },
    },
    plague_op = {
      lines = {
        { id = "pl_default", text = "Hypothetically, then. Suppose the Society were brewing a plague of its own, something to rot the Scourge the way the Scourge rotted us. Would you call that a weapon, or a crime?" },
        { id = "pl_undead", when = { race = "Scourge" }, text = "You know what the Society does, or you've heard the whispers in the Undercity. Suppose we were brewing a plague of our own, for the Scourge alone. Weapon, or crime?" },
      },
      choices = {
        { text = "A weapon against the Scourge is a weapon worth having.", next = "pl_weapon", fx = { affinity = 2, align = { light = -1 }, opinion = { new_plague = "necessary" } } },
        { text = "Plague is plague. That road ends with all of us dead.", next = "pl_crime", fx = { affinity = -1, align = { light = 1 }, opinion = { new_plague = "wrong" } } },
        { text = "The tauren would never forgive it. Nor would Thrall.", next = "pl_danger", fx = { trait = { cautious = 1 }, opinion = { new_plague = "dangerous" } } },
        { text = "Whatever the Dark Lady wills, I support.", next = "pl_loyal", when = { race = "Scourge" }, fx = { affinity = 1, opinion = { sylvanas = "loyal", new_plague = "necessary" } } },
        { text = "I'd rather not know, Helbrim.", next = "BACK" },
      },
    },
    pl_weapon = {
      lines = { { id = "plw_default", text = "A practical answer, and I hear so few of those out here. I'll mention it in my next letter to Master Faranell, without your name, of course." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pl_crime = {
      lines = { { id = "plc_default", text = "Spoken like someone who still has a pulse. It's only a hypothesis, my friend, and I'd thank you not to repeat it to the tauren." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pl_danger = {
      lines = { { id = "pld_default", text = "Forgiveness is a living sort of concern, but you're right that it matters out here. That is precisely why I said hypothetically." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    pl_loyal = {
      lines = { { id = "pll_default", text = "As do I, and as does every bottle in this tent. Still, keep your voice down, because Thork counts the bottles and he is not a fool." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mostly = {
      lines = { { id = "m_default", text = "You listen closely. Mostly remedies, yes, but science is science, and what people do with it is their own affair." } },
      choices = {
        { text = "And what does the Society do with it?", next = "plague_op" },
        { text = "...", next = "END" },
      },
    },
  },

  topics = {
    wailing_caverns = { { id = "tp_caverns", text = "A poisoned dream leaking into the water? Terrible, of course, but quite fascinating." } },
    forsaken = {
      { id = "tp_forsaken", text = "We are the Forsaken, and we are free of the Lich King's voice, whatever the living whisper. The Dark Lady gave us back our minds, and the Society means to give us back our place in Lordaeron." },
      { id = "tp_forsaken2", when = { race = "Undead" }, text = "Ah, a fellow citizen of the Undercity. Do mind the Crossroads folk, who still flinch, and do mind my samples, which are not for drinking." },
    },
    sylvanas = { { id = "tp_sylvanas", text = "Our queen, the Banshee Queen, who walked out of the Scourge and took us with her. I serve her through the Society, and I find that I do not mind serving at all." } },
    scourge = { { id = "tp_scourge", text = "The Scourge took my body and my name, and the Society is finding out how it did so. Study is a kind of revenge, if you are patient enough." } },
    thrall = { { id = "tp_thrall", text = "The Warchief offered us a place in his Horde when no living people would. He is generous, and I am grateful, and gratitude is a rare thing among the dead." } },
    razorfen = { { id = "tp_razorfen", text = "There is a lich in Razorfen Downs, I am told, Amnennar the Coldbringer, who has made friends of the quilboar there. I would very much like a sample of whatever he is using." } },
    lordaeron = { { id = "tp_lordaeron", text = "Lordaeron is a dead kingdom with dead people in it, and we are what is left. Undercity sits beneath the old capital, and we are rebuilding it in our own way." } },
    _none = { { id = "tp_none", text = "Not my field. Bring me a sample, preferably no longer twitching, and I'll make it my field." } },
  },
}

P:NPC {
  key = "darsok", id = TODO_NPC("Darsok Swiftdagger"), name = "Darsok Swiftdagger",
  bible = "bibles/crossroads.md", role = "questgiver", tier = "quest",
  communities = { "crossroads" }, temper = { "boastful" }, values = { "proud" },
  notices = { "class", "stealth" },
  impression = {
    first = "If Darsok Swiftdagger is to be believed, he is the best there is and cheaper besides. He is so pleased with himself that it is almost charming, though I would still keep an eye on my purse.",
    third = "{name} met Darsok Swiftdagger, a boastful blade at the Crossroads who wages his own war on the harpies of the hills.",
  },

  greetings = {
    { id = "g_blade", text = "Need someone dead? I'm the best there is. Need someone dead quietly? That's still me, and I'm cheaper, too." },
    { id = "g_back", when = { metBefore = true }, text = "Ha, my favourite errand-runner. How many feathers today?" },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "A fellow blade, eh? Don't get any ideas; I saw you coming from the gate, and nobody sneaks up on Darsok." },
  },

  react = {
    { id = "r_stealth", on = "stealth", text = "Ha! Nice try, but I can smell a shadow from twenty paces. Come out, before I come in." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Only when it's pointed at me. Paladins don't usually approve of my line of work, and I don't usually approve of glowing at people in the dark. But you're Horde, so we'll call it professional courtesy and leave it there." } },
      choices = {
        { text = "Professional courtesy, then. Neither of us lectures.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "I don't approve of backstabbing, Darsok.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "Only the clumsy ones, and I don't keep the clumsy ones long. Still, a troll priest pulled me back from a Kolkar spear once, and I've been politer to your sort ever since." } },
      choices = {
        { text = "A priest heals anyone who needs it, paying or not.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I'll heal who I like, and let the rest bleed.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, Darsok.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "When I must, and I'll admit they're handy, because the harpies always go for the biggest target first. You hold Serena's sisters off with that shield, and I'll be behind them before they've finished screeching, and we'll argue later about who got the most kills." } },
      choices = {
        { text = "I'll hold the line, and you can keep the kills.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll count my kills too, Darsok, and I'll beat yours.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Worth it? The Witchwing harpies come down out of the hills to raid caravans, and every one you bring down is one less screeching at our traders. Serena Bloodfeather leads them, and I've a mind to send her feathers to Thork for his helmet." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} eyed me like dinner the moment you walked up, and I respect that. Most people take a while to work out I'm dangerous." },
      },
      choices = {
        { text = "I hunt harpies to keep the roads safe.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I hunt harpies for the bounty, and that's all.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Once, against Serena's sisters in the hills, and he called up a wind that knocked the harpies out of the sky like rocks. I'll admit it was a good trick, but I still got more kills, and I've the ears in a sack to prove it." } },
      choices = {
        { text = "The kills matter less than winning together.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Counting kills keeps everyone sharp, so I'll count mine.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "Use, sure, if you can stand at the back and set their feathers alight while I go to work up close. The Witchwing harpies nest in the hills west of here, and they come at you screaming in threes, so keep your spells fast and your back to a rock." },
        { id = "xmage_troll", when = { race = "Troll" }, text = "Use, sure, and a Darkspear mage is a fine thing to see, so long as you stand behind me. The Witchwing harpies nest in the hills west of here and come at you screaming in threes, so keep your spells fast and your back to a rock." },
      },
      choices = {
        { text = "I'll burn them from cover while they're busy with you.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll stand in front with you, not behind.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "You talk like the best hunter in the Barrens, Darsok.", next = "best" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Jealous of a little thing that sets my cloak on fire whenever it gets bored? Not really, friend, because a good blade never asks to be fed and never talks back, and I'll take that over a demon on my shoulder any day." },
      },
      choices = {
        { text = "A demon is just a sharper knife.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "You're right. I'd rather trust my own steel.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Are you really the best around?", next = "best" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Not a chance, though I'll admit I've lost a harpy or two to a lion that got there first. The difference is that the lion eats what it kills and I get paid for it, which is the more civilised arrangement, if you ask me." } },
      choices = {
        { text = "I'd rather face my prey than knife it from the grass.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Strike unseen and get paid for it. That's sensible work.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin. Now there's a customer I've never had. Do you need a throat cut, or are you here to tell me off for cutting them?" },
        { id = "h_default", key = true,
          text = "The name's Darsok Swiftdagger. Throats, backs and the soft bits between armour plates are my trade, and I'm good at it." },
        { id = "h_harpy", tags = { "news" }, when = { questActive = TODO_QUEST("Harpy Raiders") },
          text = "Up in the hills you'll find harpies, filthy screeching things. Bring me their talons; I'd go myself, but I'd enjoy it too much." },
        { id = "h_lieutenants", when = { questActive = TODO_QUEST("Harpy Lieutenants") },
          text = "Now for the ones who give the orders: their lieutenants. Cut the head off a flock and the rest fly in circles." },
        { id = "h_serena", tags = { "news" }, when = { questActive = TODO_QUEST("Serena Bloodfeather") },
          text = "Serena Bloodfeather is their matriarch. Bring me her head, and then they'll know the Crossroads bites back." },
        { id = "h_jinzil", when = { questActive = TODO_QUEST("Letter to Jin'Zil") },
          text = "This letter goes to my old friend Jin'Zil, a witch doctor out in Stonetalon, and he'll have a use for you. Don't read it; he'll know." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, eh? Nice trick with the lightning, but I've killed more harpies with one knife than most shamans have with a whole storm." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid, eh? I hear you can turn into a cat and creep up on people, which is cute, but I was doing it before you'd grown your first claw." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, eh? Loud, slow and very good at getting hit, which is exactly what I need standing in front of me." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter. Nobody sneaks up on Darsok, and that includes your beast, so don't let it try." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, eh? Patch up my clients' victims and I'll be out of business, so do us both a favour and only heal the people who pay me." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Witchwing", min = 30 } }, text = "The Witchwing harpies have stopped circling over the road, and my scouts say their nests are thinning out. That's your work, I think, and the Crossroads is grateful." },
      },
      choices = {
        { text = "I'd guess you've fought beside a shaman before, Darsok.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Could a cat outstalk you in the grass, Darsok?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Are you really the best?", next = "best" },
        { text = "I'm a blade too. Teach me something.", next = "rogue", when = { class = "ROGUE" } },
        { text = "You know Jin'Zil? He's Darkspear, like me.", next = "troll", when = { race = "Troll", heardLine = "darsok.h_jinzil" } },
        { text = "Would a mage be any use to you against the harpies?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do you ever fight beside warriors, Darsok?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "The harpies must be worth the hunting, Darsok.", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "My imp does the dirty work for me. Jealous, Darsok?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do your students ever need a priest, Darsok?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Does the Light bother you, Darsok?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'll handle the harpies.", next = "END", fx = { affinity = 1 } },
      },
      again = {
        { id = "h_again", text = "What else? Make it quick, the harpies won't kill themselves, more's the pity." },
      },
    },
    rogue = {
      lines = {
        { id = "ro_default", text = "Something for free from Darsok, eh? Fine, here is one lesson: harpies look up and never down, so come at them from below the ridge and they'll never see the knife. That one's worth gold in Ratchet." },
        { id = "ro_deathstalker", when = { origin = "forsaken_deathstalker_recruit" },
          text = "A deathstalker, eh? The Dark Lady trains you lot to kill quiet and report back, and I only do the first part. Tell your masters Darsok sends his regards." },
      },
      choices = {
        { text = "A clean kill from hiding. That's the job.", next = "BACK", fx = { affinity = 2, align = { honor = -1 } } },
        { text = "I'd rather they saw me coming.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
      },
    },
    troll = {
      lines = { { id = "tr_default", text = "Know him? He pulled a harpy talon out of my shoulder once and charged me for the voodoo. You trolls drive a hard bargain, and I respect that more than I'd tell the Warchief." } },
      choices = { { text = "Ha. I'll carry your letter, then.", next = "BACK", fx = { affinity = 2 } } },
    },
    best = {
      lines = { { id = "b_default", text = "Ask the harpies. Oh, wait, you can't, and that's how good I am." } },
      choices = { { text = "Ha.", next = "BACK", fx = { affinity = 1 } }, { text = "Charming.", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "If it doesn't bleed, I'm not interested, and in the Barrens nearly everything bleeds." } },
    thrall = { { id = "tp_thrall", text = "The Warchief? Good orc, strong arm, and I'm told he's never once tried to make me cheaper. That's leadership." } },
    voljin = { { id = "tp_voljin", text = "Vol'jin's a clever troll, and he knows talent when he sees it, so the Darkspear get the hard work. Don't tell him I said he was clever." } },
    ratchet = { { id = "tp_ratchet", text = "The goblins down on the coast who think they're the only ones who know how to make coin. They're wrong, and I'm the proof." } },
    centaur = { { id = "tp_centaur", text = "Kolkar camps out west, and they hire nobody and trust nobody, which is no way to run a business. I've patched up more than a few grunts after a Kolkar spear, and I charged them fair." } },
  },
}

P:NPC {
  key = "zargh", id = TODO_NPC("Zargh"), name = "Zargh",
  bible = "bibles/crossroads.md", role = "vendor", tier = "quest",
  communities = { "crossroads" }, temper = { "jolly" }, values = { "generous" },
  notices = { "hunger", "craft" },
  impression = {
    first = "Zargh the butcher sells meat to everyone who passes the Crossroads, which is everyone. Mention Gryshka in Orgrimmar and he goes as bashful as a butcher with a cleaver can.",
    third = "{name} met Zargh, the jolly butcher of the Crossroads, who has his heart set on a certain innkeeper in Orgrimmar.",
  },

  greetings = {
    { id = "g_meat", text = "Fresh meat! Well, recent meat. Stock up before you head out; the Barrens won't feed you kindly." },
    { id = "g_back", when = { metBefore = true }, text = "Hungry again? Course you are; everyone's hungry out here." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Take a look at these cuts of prime zhevra. Well, zhevra, anyway; prime is a strong word for anything in the Barrens." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Gryshka told me once that the old grunts go quiet when that light shows, because they saw it on the guards at the camps. I was one of those grunts. But you didn't guard anyone, and meat's meat. Buy something and we're square." } },
      choices = {
        { text = "Then I'll buy, and keep the light out of it.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll not hide the Light to sell meat.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "The tauren do, and they look at me sideways when I don't, so lately I mutter a word over every kodo before the cleaver comes down. I don't know who's listening, but the meat tastes no worse for it." } },
      choices = {
        { text = "Thanking the beast is a good habit. Keep it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Meat is meat. Prayers won't make it any tenderer.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Zargh.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Kodo, if you can find one that's died honestly, and zhevra, and plainstrider when nothing else is going. The grunts come in from the oases starving and eat anything I put in front of them, so I always keep a pot on for the ones who've earned it." } },
      choices = {
        { text = "Feed the grunts first, Zargh. They've earned it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll take the best cut, and the grunts can wait.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I didn't say that, and I'll thank you not to say it so loudly. Though if the spirits did happen to say whether a woman who sends back clean bones means yes, I wouldn't stop you telling me." } },
      choices = {
        { text = "Speak to her yourself, Zargh. That's what any spirit would say.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let her wonder a while longer. It works better.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "Quietly, you say? Well, I wouldn't say no, though if she finds out somebody's been asking she'll know it was me, and then I'll never show my face in the Broken Tusk again, so tell her the meat's still good out here and leave the rest alone." },
      },
      choices = {
        { text = "A little sneaking never hurt a romance.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Then ask her yourself, Zargh, and wash your hands first.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "What happened to your finger, Zargh?", next = "finger" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Once, and the thing ate the whole haunch in a breath and looked at me like I was next on the hook. I don't know what demons eat when nobody's feeding them, and I don't want to find out, so I'll sell you meat for your own belly and that's where it stays." },
      },
      choices = {
        { text = "Fair. My demon goes hungry, and I keep it lean.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It eats what I let it eat, and it's always hungry.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "You're missing a finger, Zargh.", next = "finger" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Plainstrider mostly, kodo when the herders sell me an old one, and zhevra when the hunters bring it in. Nobody goes hungry at the Crossroads while I've a cleaver, and I've never taken more than the herds could spare." } },
      choices = {
        { text = "Taking only what's needed honours the herds. Keep doing that.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The plains are full of game. Take all you can sell.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "It does. I'd sell meat to a kodo if it had coin. Bring me plainstrider meat or a few raptor flanks for the stew, and if you could warm my cooking stone without setting the stall alight, I'd say you were worth knowing." },
      },
      choices = {
        { text = "I'll hunt it myself and bring it to you fresh.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll buy it cheap off the hunters and sell it to you dear.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A dead paladin. I sell meat to everyone who passes the Crossroads, and that's everyone, even you, I suppose." },
        { id = "h_default", key = true, text = "Name's Zargh, and I'm the butcher. I sell meat to everyone who passes through the Crossroads, which is everyone, so business is good. Everything else is the Barrens." },
        { id = "h_meats", tags = { "news" }, when = { questActive = TODO_QUEST("Meats to Orgrimmar") },
          text = "Take these choice cuts to Gryshka at the inn in Orgrimmar, and get them there fresh. And tell her, well, tell her they're from me; she'll know what that means." },
        { id = "h_return", when = { questDone = TODO_QUEST("Return to the Crossroads") },
          text = "She liked them, she actually said that? Good, good! If there's a wedding you're invited, but I'm only saying if, mind; I'm not saying there's a wedding." },
        { id = "h_bones", when = { metBefore = true }, text = "Gryshka sent back the bones, picked clean. I don't know what that means, but I've decided it's a good sign." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Do the spirits know anything about, well, matters of the heart? Never mind, forget I asked, and buy some meat." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid! I'll not ask how you feel about the meat, because the last druid who came by gave me a very long look, and I've been selling less plainstrider since." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior! You'll be wanting meat, and plenty of it, because nobody eats like a grunt back from the Kolkar camps." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Do your lot eat meat like the rest of us, or is it all prayers and broth where you come from?" },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" }, text = "A mage. Can you cook with that fire, or does it only burn things to cinders?" },
      },
      choices = {
        { text = "Do you want the spirits' advice on your heart, Zargh?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Where does the Crossroads' meat come from, Zargh?", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "What happened to your finger?", next = "finger" },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "I hunt the plains. Want what I bring back?", next = "hunter", when = { class = "HUNTER" } },
        { text = "I could find out how Gryshka feels about you, quietly.", next = "xrogue", when = { class = "ROGUE", faction = "Horde", heardLine = "zargh.h_meats" } },
        { text = "What's good to eat in the Barrens, Zargh?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do warlocks ever buy meat to feed their demons?", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "The tauren pray over every beast they butcher, Zargh.", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "I'd guess a mage's coin spends as well as anyone's here.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "Do you mind serving a paladin, Zargh?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Not hungry.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a zhevra on the block that won't cut itself, and the flies are getting there first." },
      },
    },
    hunter = {
      lines = {
        { id = "hu_default", text = "A hunter who brings it in already dressed? You're my favourite kind of customer, the kind who's also my supplier. Bring me zhevra flank and I'll cut the best of it for Gryshka's next delivery." },
        { id = "hu_pet", when = { pet = { type = "Beast" } },
          text = "That beast of yours has been staring at my block since you walked up. Here, {pet}, a scrap, and that's all; I've got a reputation for stinginess to keep up." },
      },
      choices = { { text = "Only the best cuts go to Gryshka.", next = "BACK", fx = { affinity = 2 } } },
    },
    finger = {
      big = true,
      lines = {
        { id = "f_default", text = "An accident with the cleaver, a long time ago. Don't look at the sausages like that; I looked for it, I promise. Mostly." },
      },
      choices = { { text = "...I'll pass on the sausages.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Don't know, friend. I know meat, so ask me about meat, grunt." } },
    ratchet = { { id = "tp_ratchet", text = "The goblins buy my meat to ship to Booty Bay, or so they tell me, and I sell it to them because their coin spends the same. I don't ask what they charge for it after." } },
    quilboar = { { id = "tp_quilboar", text = "Quilboar meat is tough and smells worse than it tastes, but it's cheap, because the Razormane bring themselves right to our walls. You'd be surprised how many grunts come back for seconds." } },
    thrall = { { id = "tp_thrall", text = "The Warchief came through the Crossroads once and ate my ribs, and he said they were good. I've not stopped telling people since." } },
    centaur = { { id = "tp_centaur", text = "The Kolkar hunt the same zhevra I do, and we don't share. Bring me a centaur's catch and I'll at least cook it properly." } },
  },
}

P:NPC {
  key = "boorand", id = TODO_NPC("Innkeeper Boorand Plainswind"), name = "Innkeeper Boorand Plainswind",
  bible = "bibles/crossroads.md", role = "innkeeper", tier = "service",
  communities = { "crossroads" }, temper = { "warm" }, values = { "generous" },
  notices = { "weary", "drink" },
  impression = {
    first = "Hooves, feet or whatever else comes through the door, Innkeeper Boorand Plainswind welcomes them all. He likes his leaky roof because that is how the stars get in, and he keeps putting food in Mankrik's hands.",
    third = "{name} rested at Innkeeper Boorand Plainswind's inn at the Crossroads, where every traveller of the Barrens sleeps sooner or later.",
  },

  greetings = {
    { id = "g_inn", text = "Rest your hooves, or your feet, or whatever you've got. Everyone's welcome under this roof, as the Earth Mother welcomes every calf to the grass." },
    { id = "g_home", when = { homeInn = { "The Crossroads" } }, text = "Back to the Crossroads! Your bedroll's where you left it. I swept the dust off twice." },
    { id = "g_away", when = { away = 14 }, text = "Back to the Crossroads after {away}! I swept your corner a few times while you were out, and the stars kept coming in through the roof." },
    { id = "g_away_long", when = { away = 60 }, text = "You've been away {away}, friend, and I was starting to worry the road had swallowed you whole. Sit down and let me find you something hot." },
    { id = "g_word_helped", when = { word = "helped" }, text = "The whole common room's been talking about the help you've given this town. Supper's on me tonight, and don't argue." },
    { id = "g_word_angered", when = { word = "angered" }, text = "Someone came in here with a sour face, grumbling about you. I won't ask what happened, but under my roof everyone gets along." },
  },

  notice = {
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.25 } },
      text = "The Barrens beat you up, little one. Sit down and eat; the Barrens will still be out there in the morning, sadly." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Easy. The floor's flat in here, but it won't feel like it. Sit down before it proves me wrong." },
  },

  start = "hello",
  nodes = {
    xpt_boorand = {
      big = true,
      lines = { { id = "xpt_boorand_default", text = "Every day, and I can tell which ones will last by how they order their supper. The ones who share a pot come back in a month, and the ones where each grunt eats alone with his back to the others usually don't come back at all." } },
      choices = {
        { text = "A company that shares a pot shares the danger too.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A grunt who can't eat alone won't last out here.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Thanks, Boorand.", next = "BACK" },
      },
    },
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Fear it? No. We simply never needed it; the Earth Mother gives what we need. I'm curious, though, because the orcs go quiet when your kind come in, and the trolls watch your hands. I'd like to know what the Light feels like, if you'll tell me over stew." } },
      choices = {
        { text = "It burns, but it's right. I'll tell you over stew.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "It's power, Boorand, and nothing more than that.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "More often than for a second bowl, because the Barrens takes from everyone. Mankrik won't let anyone near him, though, so if you've a gentle way with the grieving, he's up on the wall, and I've run out of stew to bring him." } },
      choices = {
        { text = "I'll speak to Mankrik. Grief shouldn't sit alone.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A man who wants to grieve alone has earned that.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Boorand.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not as well as they should, because the Kolkar raid at night and Thork rings the bell whether you're asleep or not. Still, a warrior who sleeps with his boots on wakes up faster, and the ones who learn that tend to live to pay me again." } },
      choices = {
        { text = "I'll sleep in my boots and answer the bell.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let the wall guard answer the bell. I need sleep.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They do, and I'm glad of it, because the supply kodos are slow and the travellers are hungry. Zhevra makes a fine stew and plainstrider makes a poor one, but I'll cook either if a hunter brings it in clean." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} can sleep by the fire tonight. The tauren snore loud enough to scare off anything else that might come in." },
      },
      choices = {
        { text = "I'll share my game with the inn, Boorand.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "My game goes to the trader who pays most.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Not the way they speak to you, but I hear them in the wind riders' grumbling and in the dust before the rains. My grandmother said the oases ran sweeter when she was young, and lately the water tastes wrong, so the spirits must feel it worse than we do." } },
      choices = {
        { text = "Then the oases must be healed, and the spirits with them.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The Barrens have always been harsh. Let them be.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = {
        { id = "xrogue_default", text = "You and every trader who's crossed the Barrens with a full purse, friend. Nobody steals under my roof, because the walls are thin and the tauren snore loud enough to wake the dead, so take your boots off and let the stars come in through the holes." },
        { id = "xrogue_scourge", when = { race = "Scourge" }, text = "You don't sleep at all, I've heard, so I don't know why you'd keep your boots on. Nobody steals under my roof, because the walls are thin and the tauren snore loud enough to wake the dead, which I'm told you won't take personally." },
      },
      choices = {
        { text = "If you say so, I'll trust your roof tonight.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I trust nobody's roof. The boots stay on.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "You must hear all the road's news at this inn.", next = "news" },
      },
    },
    xmage = {
      big = true,
      lines = {
        { id = "xmage_default", text = "You could, I suppose, but then I'd lose the stars, and they're the best thing about this inn. My mother said the sky over the Barrens was the Earth Mother's blanket, and a blanket with a few holes in it suits me better than one of your spells." },
      },
      choices = {
        { text = "Then I'll leave the stars where they are.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A good spell beats a leaky roof, Boorand.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Any news from the road, Boorand?", next = "news" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "It worries everyone, though most try not to say so over supper. The herders talk about the druids lost in the Wailing Caverns and the grunts talk about the Kolkar at the oases, and I keep the stew hot because I can't do anything about either." } },
      choices = {
        { text = "The Horde should guard every oasis until the rains return.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "No one should own the water. Let everyone drink freely.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarlock = {
      big = true,
      lines = {
        { id = "xwarlock_default", text = "Everyone's welcome who pays and keeps the peace, and the stars come in through my roof whether you're a shaman or something darker. Some of my tauren guests have seen the Burning Blade's work up on Dreadmist Peak, though, so give them a wide berth and they'll give you one." },
      },
      choices = {
        { text = "I'll keep my distance and my demon quiet.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If they fear me, that's their trouble, not mine.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_kin", tags = { "news" }, when = { alt = { kin = true } },
          text = "You've the same face as {alt}, who slept here two nights and snored straight through a Kolkar raid. If it runs in the family, you'll want the room furthest from the gate." },
        { id = "h_alt_far", tags = { "news" }, when = { alt = { notKin = true } },
          text = "A {altrace} called {alt} drank here not long ago and told a story about a raptor that got bigger every time. I don't suppose you've heard it, though you've the look of someone who has." },
        { id = "h_pt_band", tags = { "news" }, when = { party = { size = { min = 3 } } },
          text = "That's a lot of dusty boots on my floor, but the Crossroads has seen worse. Find a corner for all of you, and if one of you snores, I'd ask you to put them nearest the wind rider roost." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken carrying the Light! The odd Forsaken sleeps here often enough, but never one who glows. Come in, the roof leaks, but the stars are fine." },
        { id = "h_default", text = "Boorand Plainswind is my name, and I keep the inn at the Crossroads. Orcs, trolls, tauren, the odd Forsaken: they all sleep the same once they're tired enough, like a herd in the long grass." },
        { id = "h_op_northwatch", tags = { "news" }, when = { gossip = { topic = "theramore", stance = "distrust" } },
          text = "Thork says you see war coming from Northwatch. Rest while you can, then, because if you're right, none of us will sleep much later." },
        { id = "h_op_plague", tags = { "news" }, when = { gossip = { topic = "new_plague", stance = "wrong" } },
          text = "Helbrim's been sour all week, and the grunts say it's because you told him something he didn't care to hear. Whatever it was, the Earth Mother thanks you, and so do I." },
        { id = "h_op_circle", tags = { "news" }, when = { gossip = { topic = "cenarion_circle", stance = "trust" } },
          text = "Tonga's been smiling since your talk about the Circle. He doesn't smile often, so I thought you should know." },
        { id = "h_op_forsaken", tags = { "news" }, when = { gossip = { topic = "forsaken", stance = "distrust" } },
          text = "Word at the Crossroads is you don't trust the Forsaken. Keep it to yourself in my inn, because Helbrim sleeps under this roof too, when he sleeps at all." },
        { id = "h_mankrik", when = { heardLine = "mankrik.h_default" },
          text = "Mankrik's been on that wall since before I got here. He eats when someone puts food in his hands, so I put food in his hands." },
        { id = "h_roof", when = { metBefore = true }, text = "A goblin from Ratchet stayed three nights and tried to sell me a better roof. This roof is fine; it has holes, and that's how the stars get in." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Night at the Crossroads is never quiet. Riders coming in, wind riders grumbling on the tower. I'd miss it if it stopped." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman under my roof, and under the holes in it. The Earth Mother sends rain through them now and then, but she sends the stars through more often, so I've never patched a single one." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Horde" }, text = "A druid under my roof! The stars come in through the holes, and the rain too when the Earth Mother remembers us, so you'll feel right at home." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" }, text = "A warrior, and you've got the walk of somebody who's spent all day fighting centaur. Sit, friend, before your legs decide it for you." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" }, text = "A hunter! Mind your beast on the stairs, because the last one knocked over a tauren and he wasn't happy about it." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest under my leaky roof! Sit by the fire, and if any of the grunts by the door start groaning in their sleep, you'll know what to do better than I would." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" }, text = "A warlock, under my leaky roof. Keep your demon away from the other guests, friend, and it can sleep by the door like anyone's dog." },
      },
      choices = {
        { text = "Do the spirits of the Barrens speak to you, Boorand?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "The drought must worry the folk who stay here, Boorand.", next = "xdruid", when = { class = "DRUID", faction = "Horde" } },
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Any news?", next = "news" },
        { text = "I don't really sleep anymore, Boorand.", next = "forsaken", when = { race = "Scourge" } },
        { text = "I sleep light, Boorand, and with my boots on.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Could a mage patch your leaky roof with a spell?", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "I'd guess warriors rarely rest well at the Crossroads.", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do hunters bring you game, Boorand?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Do travellers ever ask you for a priest, Boorand?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "A warlock might not be welcome at every inn, Boorand.", next = "xwarlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Do the tauren fear the Light, Boorand?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "You must see a great many companies pass through here.", next = "xpt_boorand", when = { party = { size = { min = 2 } } } },
        { text = "Just resting.", next = "END" },
      },
      again = {
        { id = "h_again", text = "Anything else, little one? Ask it by the fire, where the Barrens wind can't reach us." },
      },
    },
    forsaken = {
      lines = { { id = "fk_default", text = "No, I suppose you don't, and I'm sorry for it. Sit by the fire anyway, because I've seen your people warm their hands like everyone else, and I don't think it's only habit." } },
      choices = { { text = "Maybe it isn't. Thank you.", next = "BACK", fx = { affinity = 2 } } },
    },
    news = {
      lines = { { id = "n_default", text = "Everyone coming through asks the same question: where's Mankrik's wife? If you find out, tell him first and then tell me, because I'm tired of not knowing either." } },
      choices = { { text = "...", next = "END" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Ask Tonga, by the inn. He knows the Barrens better than anyone, and he listens to the grass as I never learned to." } },
    thrall = { { id = "tp_thrall", text = "The Warchief gave the tauren friendship when we needed it most, and so I give his people my best beds. That seems a fair trade to me." } },
    cairne = { { id = "tp_cairne", text = "Cairne is the greatest of us, and I mean that kindly, not in fear. He led us out of the wandering and onto the high mesas, and I would have walked further if he'd asked." } },
    earth_mother = { { id = "tp_earth_mother", text = "She is the sky and the earth, and she sees every guest who passes through this inn. I like to think she approves of the stew." } },
    centaur = { { id = "tp_centaur", text = "The centaur raided us when we wandered, and they raid us still, though less often since the Horde came. Travellers come in with their stories, and I keep a bowl ready for anyone who runs into the Kolkar." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire comes to Mulgore sometimes, with its lights and strange folk, and every guest that season talks about it until I could tell the stories myself. I have never been, but I keep meaning to." } },
  },
}
