-- Durotar folk the roster scan found missing, part two: Rokar Bladeshadow and his farmhand Harroc (the
-- farm east of Razorwind Canyon), Javnir Nashak (the Harvest Festival, outside Orgrimmar's gates), and
-- Sen'jin Village's K'waii (general goods), Miao'zan (alchemy), Mishiki (herbalism), Trayexir (weapons),
-- Zansoa (fishing supplies) and Lau'Tiki (fishing, on Darkspear Strand). Voices: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.durotar")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Rokar Bladeshadow: aged farmer east of Razorwind Canyon; crops, not pigs.
P:NPC {
  key = "rokar_bladeshadow", id = TODO_NPC("Rokar Bladeshadow"), name = "Rokar Bladeshadow", gender = "male",
  bible = "bibles/missed.md", role = "farmer", tier = "service",
  communities = { "razor_hill" }, temper = { "weathered", "wry" }, values = { "land", "quiet" },
  notices = { "stealth" },
  impression = {
    first = "Rokar Bladeshadow is an old orc with a small house and a patch of crops east of Razorwind Canyon, on one of the few farms in Durotar that keeps no pigs. He moves slowly among his rows, and he hears a footstep long before he turns to look.",
    third = "{name} met Rokar Bladeshadow, an aged orc who farms a small plot east of Razorwind Canyon.",
  },
  greetings = {
    { id = "g_default", text = "Mind the rows, {class}. It took me two seasons to coax anything green out of this dirt, and I'll not have it trampled in an afternoon." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "You walk on the outside of your feet, young one. I know who teaches that, and I know you didn't come here for vegetables." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and you kept to the path this time. Harroc could learn from you." },
  },
  notice = {
    { id = "n_stealth", cat = "stealth", when = { stealthed = true },
      text = "You may as well stand up straight. My eyes are going, but my ears were trained by better than you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Rokar Bladeshadow, and these days I'm a farmer, whatever the name suggests. I grow what this red ground will give me, and Harroc does the digging that my back won't do anymore." } },
      again = {
        { id = "h_again", text = "What else would you ask an old farmer?" },
        { id = "h_again2", text = "Go on, {class}. The weeds will wait, though not for long." },
      },
      choices = {
        { text = "Every other farm I've passed keeps pigs.", next = "pigs" },
        { text = "Bladeshadow isn't a farmer's name.", next = "name" },
        { text = "Is it safe out here, so far from Razor Hill?", next = "safe" },
        { text = "May your harvest be good, Rokar.", next = "END" },
      },
    },
    pigs = {
      lines = { { id = "p_default", text = "They do, because a pig will eat anything and Durotar offers little else. I wanted to know whether this land could be made to grow something, the way the land we came from once did before we ruined it." } },
      choices = {
        { text = "Durotar reminds you of Draenor?", next = "draenor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    draenor = {
      lines = { { id = "d_default", text = "The red rock does, and the way the wind smells before it rains. I watched one world turn to ash under our feet, {class}, and I mean to spend what years I have left putting something into the ground and not taking it out." } },
      choices = { { text = "That's a good use of the years. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    name = {
      lines = { { id = "n_default", text = "It isn't, and I earned it a long time ago doing work I don't describe to strangers. A few of the young ones from Orgrimmar still find their way out here to ask me questions, and I answer some of them." } },
      choices = {
        { text = "What do you tell the ones you answer?", next = "name2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    name2 = {
      lines = { { id = "n2_default", text = "That a blade in the dark is a tool, like a hoe, and that the orc who comes to love it has already cut himself. Then I hand them a hoe, and most of them leave before the row is finished." } },
      choices = { { text = "Something else, Rokar.", next = "BACK" } },
    },
    safe = {
      lines = { { id = "s_default", text = "Safe enough for an orc who listens. The harpies keep to Razorwind Canyon and the thunder lizards are too stupid to hold a grudge, so it's only the crocolisks along the river that Harroc has to be warned about, and I warn him weekly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I did the Horde's quiet work for many years, and now I grow its vegetables. I find I'm better company for it." } },
    _none = { { id = "tp_none", text = "That's news from the road, {class}, and I gave up the road. Ask in Razor Hill." } },
  },
}

-- Harroc: Rokar's farmhand.
P:NPC {
  key = "harroc", id = TODO_NPC("Harroc"), name = "Harroc", gender = "male",
  bible = "bibles/missed.md", role = "farmer", tier = "service",
  communities = { "razor_hill" }, temper = { "earnest", "restless" }, values = { "work", "respect" },
  notices = { "soldier" },
  impression = {
    first = "Harroc works the garden behind Rokar Bladeshadow's house, a broad young orc with dirt to the elbows. He digs as if the ground had insulted him, and he looks up every time someone armed walks past.",
    third = "{name} met Harroc, the farmhand who works Rokar Bladeshadow's garden.",
  },
  greetings = {
    { id = "g_default", text = "Hail, {class}. If you're looking for the old one, he's at the front, and if you're looking for work, there's a second shovel." },
    { id = "g_war", when = { class = "WARRIOR" }, text = "That's a real axe you've got. I swing a hoe all day and tell myself it's the same motion, and it isn't." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Nobody comes back out here, except the lizards." },
  },
  notice = {
    { id = "n_soldier", cat = "soldier", when = { class = { "HUNTER", "SHAMAN" } },
      text = "You've been past Razor Hill, by the dust on you. Tell me something about it, would you, because Rokar only talks about soil." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Harroc, and I dig for Rokar Bladeshadow. He says what goes where and I put it there, and between us we've grown more green in this patch than you'll see between here and the river." } },
      again = {
        { id = "h_again", text = "What else? I can dig and listen at once." },
        { id = "h_again2", text = "Go on, I like the company." },
      },
      choices = {
        { text = "What grows in ground like this?", next = "grow" },
        { text = "You'd rather be a grunt, I think.", next = "grunt" },
        { text = "What's Rokar like to work for?", next = "rokar" },
        { text = "Keep digging, Harroc.", next = "END" },
      },
    },
    grow = {
      lines = { { id = "g_default", text = "Tough things, with roots that go down a long way looking for water. We haul every bucket up from the Southfury ourselves, and Rokar makes me pour it at dusk so the sun doesn't drink it before the roots do." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    grunt = {
      lines = { { id = "gr_default", text = "I thought so when I came here. I asked Rokar to teach me to fight, since everyone says he was something fearsome once, and he handed me this shovel and said to come back when the row was straight." } },
      choices = {
        { text = "Is the row straight yet?", next = "grunt2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grunt2 = {
      lines = { { id = "gr2_default", text = "It's been straight for a year, and I haven't asked again. I think that may have been the lesson, though he'd never admit he was teaching one." } },
      choices = { { text = "It sounds like one to me. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    rokar = {
      lines = { { id = "r_default", text = "He's quiet, and fair, and he hears everything. I dropped a bucket behind the house once, and he called out which bucket it was before I'd picked it up." } },
      choices = { { text = "Something else, Harroc.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I was born in a camp and I don't remember it, which Rokar says is a gift. This farm is the first place I've had a job to do." } },
    _none = { { id = "tp_none", text = "I don't hear much out here, {class}. Rokar might know, if you ask him while he's weeding." } },
  },
}

-- Javnir Nashak: Harvest Festival, outside the gates of Orgrimmar.
P:NPC {
  key = "javnir_nashak", id = TODO_NPC("Javnir Nashak"), name = "Javnir Nashak", gender = "male",
  bible = "bibles/missed.md", role = "questgiver", tier = "quest",
  communities = { "orgrimmar" }, temper = { "solemn", "generous" }, values = { "remembrance", "honor" },
  notices = { "soldier" },
  impression = {
    first = "Javnir Nashak stands beside the feast tables outside the gates of Orgrimmar when the Harvest Festival comes round. He sees that every traveller eats, and he asks each of them to spare a thought for the dead who made the meal possible.",
    third = "{name} met Javnir Nashak, who keeps the Harvest Festival outside Orgrimmar and honors Grom Hellscream.",
  },
  greetings = {
    { id = "g_default", text = "Throm-ka, {class}. It is the time of the Harvest Festival, so sit and eat before you tell me your business." },
    { id = "g_orc", when = { race = "Orc" }, text = "Blood of my blood, come and eat. Our people went hungry for so many years that a full table is a kind of victory, and it should be shared." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned to the tables, and you're welcome at them. The feast lasts as long as the festival does." },
  },
  notice = {
    { id = "n_tauren", cat = "soldier", when = { race = "Tauren" },
      text = "A child of the Earth Mother at an orcish feast. Your people taught us how to give thanks for a harvest, so in a way these are your tables too." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_done", when = { questDone = TODO_QUEST("Honoring a Hero") },
          text = "You carried the tribute to Grom's monument and came back to tell me, and the festival is richer for it. Eat with us now, because you've earned your place at this table twice over." },
        { id = "h_active", when = { questActive = TODO_QUEST("Honoring a Hero") },
          text = "Have you been to the monument yet? The ground there still carries the Legion's taint, so go carefully, but go while the festival lasts." },
        { id = "h_default", text = "I am Javnir Nashak. For these few days we feast on what the year has given us, and we remember the heroes whose blood bought us a land to harvest in. Help yourself to the tables, and I've fireworks as well, for those who like their thanks loud." },
      },
      again = {
        { id = "h_again", text = "What else would you know, {class}? The feast will keep." },
        { id = "h_again2", text = "Ask, and eat while you ask." },
      },
      choices = {
        { text = "Which hero does the Horde remember here?", next = "grom" },
        { text = "Orcs holding a harvest feast seems a new thing.", next = "feast" },
        { text = "Fireworks, at a remembrance?", next = "fireworks" },
        { text = "I've stood at Grom's monument.", next = "stood", when = { questDone = TODO_QUEST("Honoring a Hero") } },
        { text = "I'll eat, and remember. Farewell.", next = "END" },
      },
    },
    grom = {
      lines = { { id = "g_default", text = "Many, but Grom Hellscream before all of them. He was the first of us to drink the demon's blood and the one who ended the curse, when he stood alone against Mannoroth in the canyon and killed him." } },
      choices = {
        { text = "The first to fall and the one who freed you?", next = "grom2" },
        { text = "Where is his monument?", next = "monument" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grom2 = {
      lines = { { id = "g2_default", text = "Both, and we don't pretend otherwise. The Warchief has said that our curse began and ended with Grom, and I think that is why we honor him above orcs with cleaner hands, because he paid back everything he owed and then paid more." } },
      choices = {
        { text = "Did you know him?", next = "grom3" },
        { text = "Something else, Javnir.", next = "BACK" },
      },
    },
    grom3 = {
      lines = { { id = "g3_default", text = "I saw him once, across a camp, and I was too young and too frightened to speak to him. I've wished since then that I had, so now I send others to his monument to say what I didn't." } },
      choices = { { text = "Then I'm glad you send them. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    monument = {
      lines = { { id = "m_default", text = "It stands in Demon Fall Canyon, in the south of Ashenvale, on the spot where he died. I give a tribute to those willing to carry it there and lay it at the base, and I ask only that they come back and tell me it was done." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    feast = {
      lines = { { id = "f_default", text = "It is new, and I'm not ashamed of that. On Draenor we raided for what we ate, and in the camps we ate what we were thrown, so a year in which orcs planted, tended and gathered is a thing no orc alive has seen before." } },
      choices = { { text = "Then it's worth a feast. Something else.", next = "BACK" } },
    },
    fireworks = {
      lines = { { id = "fw_default", text = "The dead of the Horde were not quiet people, {class}, and they would not thank us for a quiet remembrance. Let the sky crack a little, so they know we haven't forgotten how to make noise." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    stood = {
      lines = { { id = "st_default", text = "Then you've felt how still it is there, even with the demons' leavings in the rocks around it. I'm told the stillness is his, and that the canyon has never dared to be loud since." } },
      choices = { { text = "It was still. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I keep the festival tables each year, and for the rest of it I'm one more orc of Orgrimmar. This is the part of my year worth speaking of." } },
    _none = { { id = "tp_none", text = "That is talk for another season, {class}. This one is for feasting and for the dead." } },
  },
}

-- K'waii: general goods, Sen'jin Village.
P:NPC {
  key = "kwaii", id = TODO_NPC("K'waii"), name = "K'waii", title = "General Goods", gender = "female",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "senjin" }, temper = { "cheerful", "shrewd" }, values = { "village", "thrift" },
  notices = { "travel" },
  impression = {
    first = "K'waii sells general goods in Sen'jin Village, with everything a traveller forgot hanging from the poles of her hut. She laughs easily, and she counts the coins twice while she's laughing.",
    third = "{name} met K'waii, who sells general goods in Sen'jin Village.",
  },
  greetings = {
    { id = "g_default", text = "Hey there, {class}! Come in out of the sun and tell K'waii what you forgot to pack." },
    { id = "g_troll", when = { race = "Troll" }, text = "Ah, one of our own, come home to the village. Sit a moment, because ya look like the road been chewing on you." },
    { id = "g_back", when = { metBefore = true }, text = "You back again, mon! I knew dat one waterskin would not be enough for you." },
  },
  notice = {
    { id = "n_orc", cat = "travel", when = { race = "Orc" },
      text = "An orc, down from Razor Hill. Your people always buy the same three things, and I keep them right here by the door for you." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I be K'waii, and I sell whatever a body needs between here and the next village. Food, water, a sack to put it in, and a little talk for free if ya stay long enough." } },
      again = {
        { id = "h_again", text = "What else ya want to know, mon?" },
        { id = "h_again2", text = "Go on, I got all day and so does the sun." },
      },
      choices = {
        { text = "What do travellers forget most?", next = "forget" },
        { text = "How is the village faring?", next = "village" },
        { text = "What do orcs always buy?", next = "orcs", when = { race = "Orc" } },
        { text = "Stay well, K'waii.", next = "END" },
      },
    },
    forget = {
      lines = { { id = "f_default", text = "Water, always the water. They come down from Razor Hill thinking the sea is right there so how can ya be thirsty, and then they learn you can't drink the sea, and K'waii sells another waterskin." } },
      choices = { { text = "A fair lesson. Something else.", next = "BACK" } },
    },
    village = {
      lines = { { id = "v_default", text = "We be doing well enough, for a people who lost their home twice. The huts are up, the fish are biting, and Master Gadrin keeps the bad spirits off, but every one of us still looks south across the water when the wind is right.", fx = { learn = { "echo_isles" } } } },
      choices = {
        { text = "What's south across the water?", next = "isles" },
        { text = "Something else.", next = "BACK" },
      },
    },
    isles = {
      lines = { { id = "i_default", text = "The Echo Isles, where we lived until Zalazane went mad with his voodoo and turned our own kin against us. Half the things I sold in my old hut are still sitting there, and some hexed fool be walking past them every day without knowing what they are." } },
      choices = { { text = "Maybe you'll see that hut again. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    orcs = {
      lines = { { id = "o_default", text = "Dried meat, a skin of water, and a second skin of something stronger, in dat order and never any different. I tried once to sell an orc a nice bit of fruit, and he looked at me like I offered him a hex." } },
      choices = { { text = "I can't argue with it. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I kept a hut on the Isles before Zalazane, and I keep one here now. A trader be a trader wherever the tide puts her." } },
    echo_isles = { { id = "tp_ei", text = "Our home, mon, just across the water, and full of our own people with their minds stolen. It hurts to look, and we look anyway." } },
    _none = { { id = "tp_none", text = "Dat I don't have on my shelf or in my head, mon. Ask Master Gadrin, he knows what the rest of us don't." } },
  },
}

-- Miao'zan: alchemy trainer, Sen'jin Village; he dances while he works.
P:NPC {
  key = "miaozan", id = TODO_NPC("Miao'zan"), name = "Miao'zan", title = "Alchemy Trainer", gender = "male",
  bible = "bibles/missed.md", role = "trainer", tier = "service",
  communities = { "senjin" }, temper = { "merry", "sly" }, values = { "craft", "spirits" },
  notices = { "craft" },
  impression = {
    first = "Miao'zan teaches alchemy in Sen'jin Village, and he dances the whole time he does it, stirring a pot with one hand and keeping the beat with his feet. He says the brew comes out wrong if he stands still, and nobody in the village has ever dared test it.",
    third = "{name} met Miao'zan, the dancing alchemist of Sen'jin Village.",
  },
  greetings = {
    { id = "g_default", text = "Don't mind the feet, {class}, they got a job to do. Talk to the rest of me, I be listening." },
    { id = "g_alch", when = { profession = "Alchemy" }, text = "I smell peacebloom on your fingers, mon. You been brewing, and you been doing it standing still, I can tell." },
    { id = "g_back", when = { metBefore = true }, text = "Ha, you back! The pot remembered you, it bubbled when ya came up the path." },
  },
  notice = {
    { id = "n_herb", cat = "craft", when = { profession = "Herbalism" },
      text = "You pick your own herbs, I see the green on your hands. Dat be half the craft already, and Mishiki can teach you to pick them better." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I be Miao'zan, and I make the potions for this village. A little root, a little water, a little something from a spider, and the right dance to tell the spirits what ya want from it." } },
      again = {
        { id = "h_again", text = "What else, mon? Ask in time with the beat if ya can." },
        { id = "h_again2", text = "Go on, the pot don't mind us talking." },
      },
      choices = {
        { text = "Why do you dance while you brew?", next = "dance" },
        { text = "What do you brew for the village?", next = "brew" },
        { text = "I brew standing still, and it works.", next = "still", when = { profession = "Alchemy" } },
        { text = "Keep dancing, Miao'zan.", next = "END" },
      },
    },
    dance = {
      lines = { { id = "d_default", text = "Because a potion be a little bargain with the spirits, and ya don't bargain with a spirit sitting on your backside. The dance says what I want, the herbs pay for it, and the fire carries the message." } },
      choices = {
        { text = "What happens if you stop?", next = "stop" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stop = {
      lines = { { id = "s_default", text = "I stopped once, on the Isles, because I stubbed my toe on the pot. The healing draught came out purple and my cousin grew hair on his tusks for a month, so now I dance even when it hurts." } },
      choices = { { text = "Hair on his tusks? Something else.", next = "BACK" } },
    },
    brew = {
      lines = { { id = "b_default", text = "Healing draughts for the hunters, mostly, and something for the scorpid stings. The herbs in Durotar be few and stubborn, so I trade with Mishiki for every leaf, and she drives a hard bargain for a neighbor." } },
      choices = { { text = "Something else, Miao'zan.", next = "BACK" } },
    },
    still = {
      lines = { { id = "st_default", text = "It works, sure, the way a drum works if ya hit it with a fish. Try it my way one time, mon, and tell me the bottle don't feel warmer in your hand after." } },
      choices = { { text = "I might try it, when nobody's watching.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I learned the pot from my mother and the dance from hers. They both be watching from the other side, so I keep my steps clean." } },
    echo_isles = { { id = "tp_ei", text = "The best herbs we had grew on the Isles, mon. Zalazane got them now, and he don't even brew anything good." } },
    _none = { { id = "tp_none", text = "Dat be outside my pot, mon. Ask me about roots and bottles and I talk till sundown." } },
  },
}

-- Mishiki: herbalism trainer, Sen'jin Village.
P:NPC {
  key = "mishiki", id = TODO_NPC("Mishiki"), name = "Mishiki", title = "Herbalism Trainer", gender = "female",
  bible = "bibles/missed.md", role = "trainer", tier = "service",
  communities = { "senjin" }, temper = { "patient", "sharp" }, values = { "land", "craft" },
  notices = { "craft" },
  impression = {
    first = "Mishiki teaches herbalism in Sen'jin Village, and she can find a living plant in Durotar where most see only red dust. She speaks softly and bargains hard, and Miao'zan across the way owes her for half his stock.",
    third = "{name} met Mishiki, the herbalist of Sen'jin Village.",
  },
  greetings = {
    { id = "g_default", text = "Walk soft, {class}. There be more growing under your feet than you think, even here." },
    { id = "g_herb", when = { profession = "Herbalism" }, text = "You got the green thumbs already, I see them. Show me how ya cut a stem, and I tell you what you been doing wrong." },
    { id = "g_back", when = { metBefore = true }, text = "You come back, and ya didn't step on my seedlings this time. We be making progress." },
  },
  notice = {
    { id = "n_druid", cat = "craft", when = { class = "DRUID" },
      text = "A tauren who talks to the growing things. Your people and mine say it different, mon, but I think we be hearing the same voice." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I be Mishiki, and I know every plant from here to Razor Hill by name, which is not so hard when there be so few. This land hides its green, and I teach people where to look." } },
      again = {
        { id = "h_again", text = "What else ya want to know?" },
        { id = "h_again2", text = "Ask, mon. The herbs grow slow and so do I." },
      },
      choices = {
        { text = "Where does anything grow in Durotar?", next = "where" },
        { text = "You and Miao'zan seem to do business.", next = "miao" },
        { text = "What's the first thing a new herbalist should learn?", next = "first", when = { profession = "Herbalism" } },
        { text = "May your garden grow, Mishiki.", next = "END" },
      },
    },
    where = {
      lines = { { id = "w_default", text = "Look where the water goes when it rains, in the cracks at the foot of the cliffs and along the Southfury. Peacebloom and silverleaf hide in the shade there, and earthroot grows up on the rocks where only a fool or a troll would climb." } },
      choices = {
        { text = "Was it greener on the Echo Isles?", next = "isles" },
        { text = "Something else.", next = "BACK" },
      },
    },
    isles = {
      lines = { { id = "i_default", text = "So green it hurt the eyes, with flowers I got no name for in the orc tongue. I had a garden there dat my grandmother planted, and now Zalazane's hexed ones walk through it and never once look down.", fx = { learn = { "echo_isles" } } } },
      choices = { { text = "I'm sorry for your garden. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    miao = {
      lines = { { id = "m_default", text = "We do, and he pays me in potions and promises. He be a fine alchemist and a terrible haggler, because ya can't hold a hard face while your feet are dancing, and I been taking advantage of dat for years." } },
      choices = { { text = "Something else, Mishiki.", next = "BACK" } },
    },
    first = {
      lines = { { id = "f_default", text = "Leave the root when ya take the leaf, unless it be the root ya came for. A plant you kill feeds you one time, and a plant you thank feeds you every season, and in a land this dry dat be the difference between a craft and a famine." } },
      choices = { { text = "Leave the root. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My grandmother grew herbs on the Isles and her grandmother grew them in Stranglethorn. I be the first of us to try it in a desert." } },
    echo_isles = { { id = "tp_ei", text = "My garden be there still, I hope. I try not to think what grows in it now." } },
    _none = { { id = "tp_none", text = "If it don't have leaves, mon, I can't tell you much about it." } },
  },
}

-- Trayexir: weapon merchant, Sen'jin Village.
P:NPC {
  key = "trayexir", id = TODO_NPC("Trayexir"), name = "Trayexir", title = "Weapon Merchant", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "senjin" }, temper = { "cool", "proud" }, values = { "hunt", "craft" },
  notices = { "soldier" },
  impression = {
    first = "Trayexir sells weapons in Sen'jin Village, and he tests the balance of each one across a single finger before he'll let it go. He has a headhunter's eye, and he looks at a customer's throwing arm before he looks at their face.",
    third = "{name} met Trayexir, the weapon merchant of Sen'jin Village.",
  },
  greetings = {
    { id = "g_default", text = "Let me see your arm, {class}. I don't sell a weapon till I know what kind of arm be carrying it." },
    { id = "g_hunter", when = { class = "HUNTER" }, text = "A hunter. Good, then you know a weapon be for bringing food home first and for war second." },
    { id = "g_back", when = { metBefore = true }, text = "You back, and still got all your fingers. Then I sold you the right blade." },
  },
  notice = {
    { id = "n_war", cat = "soldier", when = { class = "WARRIOR", race = "Orc" },
      text = "Orc warriors always want the biggest axe on the wall. I sell it to them, mon, but I think a spear would teach them more." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I be Trayexir. I sell the blades, the axes and the things ya throw, and every one of them been balanced by my own hand before it hangs on this wall." } },
      again = {
        { id = "h_again", text = "What else ya want to ask?" },
        { id = "h_again2", text = "Speak, mon. The steel be patient." },
      },
      choices = {
        { text = "Why does the balance matter so much?", next = "balance" },
        { text = "What do the Darkspear hunt with these?", next = "hunt" },
        { text = "What would you put in a troll's hand?", next = "troll", when = { race = "Troll" } },
        { text = "Good hunting, Trayexir.", next = "END" },
      },
    },
    balance = {
      lines = { { id = "b_default", text = "Because a troll throws what he carries, and a thing dat flies crooked feeds nobody. An orc swings his axe and never lets go, so he never finds out it be lopsided, but the first time ya throw one, you know." } },
      choices = {
        { text = "The Darkspear throw their axes?", next = "throw" },
        { text = "Something else.", next = "BACK" },
      },
    },
    throw = {
      lines = { { id = "t_default", text = "Axes, spears, knives, and a rock if dat be all there is. Our headhunters could take a bird off a branch in Stranglethorn before the orcs ever knew our name, and we didn't leave dat skill behind on the beach." } },
      choices = { { text = "Something else, Trayexir.", next = "BACK" } },
    },
    hunt = {
      lines = { { id = "h2_default", text = "Raptors up the coast, and the big crabs on the strand when the meat be short. Lately the young ones want to take my blades south to the Echo Isles, and I sell to them, and then I watch the water till they come back.", fx = { learn = { "echo_isles" } } } },
      choices = { { text = "I hope they all come back. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    troll = {
      lines = { { id = "tr_default", text = "A spear to start, because it keeps the teeth far from you while ya learn. When you stop being afraid of what you're fighting, come back, and I show you the throwing axes." } },
      choices = { { text = "A spear, then. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I hunted heads for the tribe when I was young, mon. Now I arm the ones who do it, and I sleep in a bed." } },
    echo_isles = { { id = "tp_ei", text = "Zalazane sits over there with our kin for puppets. Every blade I sell to someone sailing south, I sharpen twice." } },
    _none = { { id = "tp_none", text = "I know edges and points, mon. For dat, ask someone who talks more than me." } },
  },
}

-- Zansoa: fishing supplies, Sen'jin Village.
P:NPC {
  key = "zansoa", id = TODO_NPC("Zansoa"), name = "Zansoa", title = "Fishing Supplies", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "senjin" }, temper = { "easy", "talkative" }, values = { "sea", "patience" },
  notices = { "craft" },
  impression = {
    first = "Zansoa sells poles, line and bait in Sen'jin Village, and he mends a net across his knees while he talks. He'd rather be on the water himself, and he says so to every customer.",
    third = "{name} met Zansoa, who sells fishing supplies in Sen'jin Village.",
  },
  greetings = {
    { id = "g_default", text = "Hey, {class}. You look like somebody who never sat still by the water in your whole life, and I got the cure for dat." },
    { id = "g_fish", when = { profession = "Fishing" }, text = "A fisher! Tell me true now, what ya been using for bait, and I promise not to laugh too hard." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more line, mon? Something big took the last of it, I hope." },
  },
  notice = {
    { id = "n_tauren", cat = "craft", when = { race = "Tauren" },
      text = "A tauren by the sea, now there be a sight. Your people fish the lakes, I hear, so come and see what salt water does to a line." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I be Zansoa, and I sell everything ya need to catch a fish except the patience. Dat you bring yourself, or you go see Lau'Tiki down on the strand and he teach it to you the slow way." } },
      again = {
        { id = "h_again", text = "What else, mon? The net can wait." },
        { id = "h_again2", text = "Go on and ask. I talk better than I mend." },
      },
      choices = {
        { text = "What's biting off Sen'jin?", next = "biting" },
        { text = "Who's Lau'Tiki?", next = "lau" },
        { text = "What bait would you use here?", next = "bait", when = { profession = "Fishing" } },
        { text = "Tight lines, Zansoa.", next = "END" },
      },
    },
    biting = {
      lines = { { id = "b_default", text = "Slitherskin mackerel close in, and longjaw mud snapper where the bottom be soft. They not grand fish, mon, but they fill a pot, and a village dat can fill its pot don't have to beg from nobody." } },
      choices = {
        { text = "Was the fishing better on the Isles?", next = "isles" },
        { text = "Something else.", next = "BACK" },
      },
    },
    isles = {
      lines = { { id = "i_default", text = "It was, and I'd still be there if not for Zalazane. I left a good boat tied to a post on the biggest isle, and I think about dat boat more than a grown troll should.", fx = { learn = { "echo_isles" } } } },
      choices = { { text = "A good boat is worth missing. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    lau = {
      lines = { { id = "l_default", text = "The best fisher in the village, and he knows it. He stands on Darkspear Strand to the southwest, teaching anybody who can keep quiet long enough, and he sends them to me when they snap their first pole." } },
      choices = { { text = "A tidy arrangement. Something else.", next = "BACK" } },
    },
    bait = {
      lines = { { id = "ba_default", text = "A shiny bauble on the line, to start with, because the mackerel be greedy and stupid. When ya want something smarter, you need something smellier, and I'll say no more while the wind is blowing this way." } },
      choices = { { text = "Something else, Zansoa.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I fished the Isles from a boy, mon. Now I sell poles to people who gonna catch the fish I should be catching." } },
    echo_isles = { { id = "tp_ei", text = "Home, and my boat still tied there. One day Vol'jin takes it back, and I be first in the water." } },
    _none = { { id = "tp_none", text = "Don't know dat one, mon. If it swims I can tell you about it, and if it don't, try K'waii." } },
  },
}

-- Lau'Tiki: fishing trainer on Darkspear Strand, southwest of Sen'jin.
P:NPC {
  key = "lautiki", id = TODO_NPC("Lau'Tiki"), name = "Lau'Tiki", title = "Fishing Trainer", gender = "male",
  bible = "bibles/missed.md", role = "trainer", tier = "quest",
  communities = { "senjin" }, temper = { "calm", "teasing" }, values = { "patience", "sea" },
  notices = { "craft" },
  impression = {
    first = "Lau'Tiki stands on Darkspear Strand with a line in the surf and his eyes half shut, and he looks asleep until a fish proves otherwise. He teaches fishing to anyone who can stand beside him without talking, and most can't.",
    third = "{name} met Lau'Tiki, who teaches fishing on Darkspear Strand.",
  },
  greetings = {
    { id = "g_default", text = "Shh, {class}, not so loud. The fish got ears, or something like ears, and you just walked up like a kodo." },
    { id = "g_fish", when = { profession = "Fishing" }, text = "You hold yourself like somebody who's waited on a line before. Stand here by me, and we see if the sea agrees." },
    { id = "g_back", when = { metBefore = true }, text = "You back, and quieter this time. See, you already learning." },
  },
  notice = {
    { id = "n_hunter", cat = "craft", when = { class = "HUNTER" },
      text = "A hunter knows how to wait, at least. Fishing be the same hunt, mon, only ya can't see what you're tracking." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_camp", when = { questActive = TODO_QUEST("Camping 101: Fishing") },
          text = "So you want to feed yourself at your own campfire, and somebody told you Lau'Tiki be the one to ask. They told you right, mon, so put down your pack and pick up dat pole." },
        { id = "h_default", text = "I be Lau'Tiki, and this strand be my school. The lesson is simple, you stand, you wait, and you don't jerk the line like a scared orc, and still it takes most people a season to learn it." },
      },
      again = {
        { id = "h_again", text = "What else? Ask it soft." },
        { id = "h_again2", text = "Go on, mon, I got one eye on the float." },
      },
      choices = {
        { text = "What's the secret to it?", next = "secret" },
        { text = "Why fish here and not at the village?", next = "strand" },
        { text = "Why should a traveller learn to fish?", next = "camp" },
        { text = "I fish already. What am I doing wrong?", next = "wrong", when = { profession = "Fishing" } },
        { text = "I'll leave you to the tide.", next = "END" },
      },
    },
    secret = {
      lines = { { id = "s_default", text = "There be no secret, and dat's what nobody wants to hear. The fish decides, not you, so all you can do is be ready when it makes up its mind." } },
      choices = {
        { text = "That sounds like more than fishing.", next = "secret2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    secret2 = {
      lines = { { id = "s2_default", text = "Ha, now you sound like Master Gadrin. He says the loa be the same, dat ya make your offering and wait, and they come when they come. Me, I only know it works on mackerel." } },
      choices = {
        { text = "Do the Darkspear wait well?", next = "secret3" },
        { text = "Something else, Lau'Tiki.", next = "BACK" },
      },
    },
    secret3 = {
      lines = { { id = "s3_default", text = "We had to learn, mon. We waited out the murlocs and the sea witch, and now we wait on Zalazane, with our home sitting right there across the water. A people who fish don't lose heart easy.", fx = { learn = { "echo_isles" } } } },
      choices = { { text = "That's worth learning from. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    strand = {
      lines = { { id = "st_default", text = "Because the village be full of talkers, and Zansoa is the worst of them. Out here there's only the surf and the crabs, and the crabs keep their opinions to themselves." } },
      choices = {
        { text = "Zansoa speaks well of you.", next = "strand2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strand2 = {
      lines = { { id = "st2_default", text = "He should, I send him every student who breaks a pole. He's a good troll and he sells honest line, but don't tell him I said it or he'll talk about it till the tide turns." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    camp = {
      lines = { { id = "c_default", text = "Because coin runs out and the road is long, but there be water nearly everywhere, and where there's water there's supper. Catch it, build your fire, cook it, and you owe nobody nothing dat night.", fx = { learn = { "camping" } } } },
      choices = { { text = "That's reason enough. Something else.", next = "BACK" } },
    },
    wrong = {
      lines = { { id = "w_default", text = "You're pulling too soon, I'd bet my best hook on it. Everybody does. Wait till the float goes all the way under, count one breath more, and then take it." } },
      choices = { { text = "One breath more. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "My father fished, his father fished, and I fish. Not much of a story, mon, but nobody in it ever went hungry." } },
    echo_isles = { { id = "tp_ei", text = "The water round the Isles had the fattest snapper I ever saw. Zalazane's welcome to choke on them." } },
    camping = { { id = "tp_camp", text = "A line, a fire and a flat rock to cook on. Dat be a home anywhere ya stop." } },
    _none = { { id = "tp_none", text = "Dat's too much noise for the fish, mon. Ask me something about the water." } },
  },
}
