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
      lines = { { id = "grow_default", text = "Tough things, with roots that go down a long way looking for water. We haul every bucket up from the Southfury ourselves, and Rokar makes me pour it at dusk so the sun doesn't drink it before the roots do." } },
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
      lines = { { id = "grom_default", text = "Many, but Grom Hellscream before all of them. He was the first of us to drink the demon's blood and the one who ended the curse, when he stood alone against Mannoroth in the canyon and killed him." } },
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
