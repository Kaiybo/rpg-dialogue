-- Freewind Post: tauren on the mesas above Thousand Needles. Voice: bibles/thousandneedles.md
local P = RPGDialogueAPI:Pack("rpgd.thousandneedles")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "longhorn", id = TODO_NPC("Cliffwatcher Longhorn"), name = "Cliffwatcher Longhorn",
  bible = "bibles/thousandneedles.md", role = "soldier", tier = "major",
  communities = { "freewind" }, temper = { "grim" }, values = { "dutiful", "protective" },
  notices = { "kit", "race" },

  impression = {
    first = "Cliffwatcher Longhorn sees the centaur long before they see him, and he spoke as though the canyon were a debt he means to collect. Underneath, he is worried about a brother he hasn't written to.",
    third = "{name} met Cliffwatcher Longhorn, who keeps watch over the Thousand Needles from Freewind Post.",
  },

  greetings = {
    { id = "g_watch", text = "From up here I see the centaur long before they see us. That is why we built on the mesas." },
    { id = "g_back", when = { metBefore = true }, text = "The canyon gave you back, good. It keeps more than it returns." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The Galak marked you. Let it heal, then remember it the next time you see their banners." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A child of the plains, this far into the Needles. Stand with us on the mesa; it is good to see more horns." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Anyone who stands firm is useful against the Galak, and the Light makes a fine thing to stand behind. The centaur fear what they don't understand, and they will not understand you any more than I do." } },
      choices = {
        { text = "I'll stand the watch with Freewind, Cliffwatcher.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll hunt the Galak my own way, alone.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Back to their camps on the canyon floor, by paths that change with every raid, because they know we watch from the mesas. Follow the hoofprints west toward their hold and you'll find them, though I'd go in daylight, because the Galak scouts see well at night." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Keep {pet} close on the canyon floor. The Galak shoot at anything that moves down there, and they won't stop to ask whether it's wild." },
      },
      choices = {
        { text = "I'll find their camps, and Freewind can strike them openly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll find their camps and burn them while they sleep.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "The grass will come back, the elders say, once the hooves stop coming. Whether the hooves stop depends on us, and on how hard we are willing to strike." } },
      choices = {
        { text = "Strike their raiders, but leave their families be.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Strike until no Galak rides the Needles.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "A rogue could walk into their camps below and count their spears before they ride, which is more than my scouts manage from up here. The centaur see a tauren coming from a mile off, but they might never see you." } },
      choices = {
        { text = "Knowing the enemy wins wars. I'll scout for you.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Scouting is slow. Better to cut down their chiefs.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Cliffwatcher.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I think power that answers to no spirit is a dangerous thing, wherever it comes from. Still, the Warchief accepts your kind, and the Galak raid whatever walks below us, so I will not turn away any weapon that faces the canyon." } },
      choices = {
        { text = "My power is a weapon. I aim it where it's needed.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "I understand your caution. I'll earn your trust.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xcl_rfd = {
      big = true,
      lines = {
        { id = "xcl_rfd_default", text = "Then the quilboar have lost the master they sold themselves to, and the Scourge have lost a foothold in Kalimdor I never thought they could take. A lich among the quilboar at the edge of my canyons is the worst thing I have seen from this mesa, and I have watched the Galak burn a caravan." },
      },
      choices = {
        { text = "Freewind should keep a watch on the Downs from now on.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the quilboar deal with what's left. It's their mess.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "How did the Scourge reach the quilboar at all?", next = "xcl_rfd2" },
      },
    },
    xcl_rfd2 = {
      lines = { { id = "xcl_rfd2_default", text = "I don't know, and that frightens me more than the lich did. The Scourge came from the north, across the sea, and if they could reach a quilboar warren at the edge of the Barrens they could reach Thunder Bluff, so I've sent word to Cairne, and I'll keep sending it until someone listens." } },
      choices = {
        { text = "I'll carry word too, if I pass Thunder Bluff.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_cl_rfd", tags = { "news" }, when = { cleared = "Razorfen Downs", faction = "Horde" }, text = "The scouts say you went into Razorfen Downs and put the dead thing at its heart back in the ground. I've watched cold air roll off those thorns toward the Needles all season, and this morning it didn't come." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter. From up here I can see every Galak raiding party long before they see us, but I can't follow them into the canyons, and you can." },
        { id = "h_default", key = true,
          text = "Cliffwatcher Longhorn. Freewind keeps watch over the Needles, and when the Galak raid whatever walks below us, we answer them." },
        { id = "h_message", tags = { "news" }, when = { questActive = TODO_QUEST("Message to Freewind Post") },
          text = "You carry word from the plains. Let me read it, for news climbs to the mesas slowly." },
        { id = "h_pacify", when = { questActive = TODO_QUEST("Pacify the Centaur") },
          text = "The Galak have bled us long enough. Thin their raiders, and the canyon roads will breathe again." },
        { id = "h_spying", when = { questActive = TODO_QUEST("Grimtotem Spying") },
          text = "The Grimtotem on Darkcloud Pinnacle keep their own counsel, too much of it. Find out what they plan." },
        { id = "h_arnak", when = { questActive = TODO_QUEST("Wanted - Arnak Grimtotem") },
          text = "Arnak Grimtotem. The poster says murder, and if it speaks true, he has earned whatever finds him." },
        { id = "h_nataka", when = { heardLine = "nataka.h_default" },
          text = "You've seen Nataka, in Desolace? Is he well? I let a whole year go by without writing to him, so tell me he's well, and that he isn't angry with me." },
        { id = "h_family", when = { questActive = TODO_QUEST("Family Tree") },
          text = "My brother Nataka is stationed at Ghost Walker Post, and a year has passed since I last wrote to him. The centaur have been stirring since then, and he should hear of it from me." },
        { id = "h_warm", when = { disposition = { min = 70 } },
          text = "You climb this mesa more often than the wind does, and I've come to listen for your step on the lift. Stand with me a while and watch the canyon." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid of Thunder Bluff. The Galak have trampled the canyon floor bare in places, and I would hear whether the land down there can recover." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. Good, because the Galak have their own spirit-callers, and I'd like to see one of ours answer them." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. When the Galak raid the canyon floor there is always someone to carry up to Freewind, and I'd sooner they reached a healer than a pyre." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage. From up here a fireball could reach the Galak camps before they ever saw you coming, and I'd like to see that someday." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "You came up the lift without a sound, and I watch that lift all day. The Galak would pay well for feet like yours, so I'm glad they belong to the Horde." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "A warlock on my watch. The Galak have their own dark-hearted shamans, and I like their fires no better than yours, but you at least stand on the right side of the cliff." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Galak", min = 40 } }, text = "The Galak raid less these days, and the scouts say it's because you've cut down so many of their warriors. Freewind is grateful, though the centaur will remember you." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken who carries the Light. I've watched many things climb the canyon from up here, but nothing quite like you." },
      },
      again = {
        { id = "h_again", text = "What else? Speak, but keep one eye on the canyon while you do." },
        { id = "h_again2", text = "Go on. The Galak won't wait for us to finish talking." },
      },
      choices = {
        { text = "Can the canyon floor recover from the Galak?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Why build so high?", next = "high" },
        { text = "What do you know of the Grimtotem?", next = "grimtotem" },
        { text = "What did the centaur do this time?", next = "galak" },
        { text = "You have a brother?", next = "nataka" },
        { text = "What happens at Highperch?", next = "highperch" },
        { text = "Arnak Grimtotem is dead.", next = "arnak", when = { questDone = TODO_QUEST("Wanted - Arnak Grimtotem") } },
        { text = "What did the secret notes mean?", next = "notes", when = { questDone = TODO_QUEST("Grimtotem Spying") } },
        { text = "The Grimtotem shame every tauren.", next = "x_tauren", when = { race = "Tauren" } },
        { text = "Send me against the Galak, Cliffwatcher.", next = "x_warrior", when = { class = "WARRIOR" } },
        { text = "The Horde stands with Freewind.", next = "x_orc", when = { race = "Orc" } },
        { text = "Do the Galak centaur have shamans, Longhorn?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What do the Galak windchasers call down on the canyon?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Could a rogue be of use against the Galak?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "You think my power no better than the centaurs' magic?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Where do the Galak raiders go after a raid, Cliffwatcher?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Would a paladin be useful against the Galak, Cliffwatcher?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Amnennar the Coldbringer is destroyed, Cliffwatcher. The Downs are broken.", next = "xcl_rfd", when = { cleared = "Razorfen Downs", faction = "Horde" } },
        { text = "Earth Mother watch over you.", next = "END", fx = { affinity = 1 } },
      },
    },
    high = {
      lines = {
        { id = "hi_default", text = "Centaur don't climb. Harpies do, but harpies are a nuisance; the Galak are a war." },
      },
      choices = {
        { text = "How do you get up and down?", next = "lifts" },
        { text = "I'll help you fight it.", next = "BACK", fx = { affinity = 2, standing = { freewind = 1 } } },
      },
    },
    lifts = {
      lines = {
        { id = "l_default", text = "The lifts carry us up the needle, and the rope bridges join the pinnacles to one another. A Galak warband can circle below us all day long, and never reach a single tent." },
      },
      choices = {
        { text = "Clever.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    grimtotem = {
      big = true,
      lines = {
        { id = "gr_default", text = "They are tauren who want nothing to do with the Horde. That is their right. What they do on that pinnacle in the dark is not." },
      },
      choices = {
        { text = "What do they do?", next = "agents" },
        { text = "I'll keep my eyes open.", next = "BACK", fx = { affinity = 1, learn = { "grimtotem" } } },
      },
    },
    agents = {
      lines = {
        { id = "ag_default", text = "Over the past weeks, three strangers of no people I could name have gone up to Darkcloud Pinnacle and come down again. Whatever passed between them and the Grimtotem was written down and locked in chests, and I would very much like to read it." },
      },
      choices = {
        { text = "I could find those notes.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 }, learn = { "grimtotem" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "grimtotem" } } },
      },
    },
    galak = {
      lines = {
        { id = "ga_default", text = "They raided one of my supply caravans on the road and slaughtered every soul in it. This is an outrage, and it will not go unpunished while I watch these cliffs." },
      },
      choices = {
        { text = "Where do they camp?", next = "splithoof" },
        { text = "Something else.", next = "BACK" },
      },
    },
    splithoof = {
      lines = {
        { id = "sp_default", text = "North of us, at Splithoof Crag, hard against the cliffs, with their scouts, wranglers and windchasers all about. Go there with wrath to guide your hand, and come back to tell me of it." },
      },
      choices = {
        { text = "I will.", next = "BACK", fx = { affinity = 2, standing = { freewind = 1 }, align = { honor = 1 } } },
        { text = "I'll pick them off quietly, and leave wrath out of it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    nataka = {
      lines = {
        { id = "n_default", text = "Nataka, at Ghost Walker Post in Desolace, keeping watch over centaur of his own. We were raised on the same plains, and now we stand guard on two different ones, and I am a poor letter writer." },
      },
      choices = {
        { text = "Write to him. I'll carry it.", next = "BACK", fx = { affinity = 3, trait = { kind = 1 } } },
        { text = "Why haven't you written, truly?", tag = "Persuade", next = "nataka_why",
          check = { pass = { any = { { disposition = { min = 65 } }, { race = "Tauren" }, { trait = "kind" } } } },
          fail = { next = "nataka_duty", fx = { affinity = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    highperch = {
      lines = {
        { id = "hp_default", text = "The wyverns nest at Highperch, west of here, and our young tauren go there to study them and take eggs from the old nesting grounds. Every wind rider the Horde flies began in a nest like those." },
      },
      choices = {
        { text = "That sounds dangerous.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    arnak = {
      big = true,
      lines = {
        { id = "ar_default", text = "Hah! Now that is news worth the climb, for I had begun to think he'd never answer for it. His murders boiled my blood, and you have cooled it a little." },
      },
      choices = {
        { text = "Thalia's friend is free, too.", next = "BACK", when = { questDone = TODO_QUEST("Free at Last") }, fx = { affinity = 2, standing = { freewind = 1 } } },
        { text = "Justice was owed.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "Justice had little to do with it. He was in my way.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    notes = {
      lines = {
        { id = "no_default", text = "Great Spirit Totem, those notes are worse than I feared. I must start preparing for whatever comes, and I would rather do it with you on this mesa than off it." },
      },
      choices = {
        { text = "I'll be here.", next = "BACK", fx = { affinity = 2, standing = { freewind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    nataka_why = {
      lines = {
        { id = "nw_default", text = "Because every letter I begin turns into a report of who the Galak killed on the road this month, and I will not send my brother a list of the dead. So I put the quill down, and a year goes by, and the silence says worse things than the list would have." },
      },
      choices = {
        { text = "Then write about something else.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "He'd rather have the list than nothing.", next = "BACK", fx = { affinity = 1, trait = { stern = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    nataka_duty = {
      lines = {
        { id = "nd_default", text = "Because the cliffs need watching, and letters do not. That is reason enough for a Cliffwatcher." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_tauren = {
      lines = {
        { id = "xt_default", text = "They do, and I carry that shame up these lifts every morning, because the centaur see horns and hooves and never ask which tribe. Arnak's people chose a road away from the Earth Mother's children, and I watch that road from this mesa day and night." },
        { id = "xt_grim", when = { origin = "tauren_grimtotem_born" }, text = "You were born among them; I can see it in how you stiffen when their name is spoken. I will not hold your birth against you, but I will watch you as I watch them, until you give me reason to stop." },
      },
      choices = {
        { text = "Some of them could still come home.", next = "BACK", fx = { affinity = -1, align = { light = 1 } } },
        { text = "They chose their road. Let them walk it to the end.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, Cliffwatcher.", next = "BACK" },
      },
    },
    x_warrior = {
      lines = {
        { id = "xw_default", text = "Gladly, for they cut down my caravan to the last runner, and the Galak respect nothing but strength. Go north to Splithoof Crag and make it plain that Freewind's patience ended on that road." },
      },
      choices = {
        { text = "They'll learn that lesson from me.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Killing alone won't end this war.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },
    x_orc = {
      lines = {
        { id = "xo_default", text = "The Horde stood with my people when the centaur hunted us across the Barrens, and the Warchief's warriors fought beside us all the way to Mulgore. I have not forgotten it, and neither have the Galak, which is why they run a little faster when they see an orc on my mesa." },
      },
      choices = {
        { text = "Then the debt is paid both ways.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Storms out of a clear sky, and winds that knock riders off the ledges, and they do it as if the canyon owes them blood. A spellcaster who could break their chanting would save more of ours than any arrow." } },
      choices = {
        { text = "I'll break their chants and keep your riders safe.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll strike their camps at night, before they can chant.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "They have something, and their windchasers call on the elements as if the canyon owed them blood, because the centaur believe it does. The Needles remember every raid, and I want them to remember that Freewind answered." } },
      choices = {
        { text = "Then we answer them in the open, raid for raid.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Then we strike their camps at night, before they call anything.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "From this mesa I see much of the Needles, and what I can't see, my scouts tell me. Ask about any of these." },
    },
    background = { { id = "tp_bg", text = "I watch the cliffs for Freewind, and I have a brother in Desolace who thinks I've forgotten him. Both duties weigh on me.", next = "nataka" } },
    advice = { { id = "tp_ad", text = "If you go up Darkcloud Pinnacle, smile at the Grimtotem and keep your back to the wall." } },
    grimtotem = { { id = "tp_grimtotem", text = "Watch them. Smile if you must, but watch them." } },
    _none = { { id = "tp_none", text = "That is beyond what I can see from this mesa." } },
  },
}

P:NPC {
  key = "rau", id = TODO_NPC("Rau Cliffrunner"), name = "Rau Cliffrunner",
  bible = "bibles/thousandneedles.md", role = "questgiver", tier = "quest",
  communities = { "freewind" }, temper = { "intent" }, values = { "curious", "patient" },
  notices = { "class", "form" },

  impression = {
    first = "Rau Cliffrunner has been staring at centaur carvings since dawn and would happily keep going until the moon sets. There is a scholar's patience in that, and a scholar's hunger too.",
    third = "{name} met Rau Cliffrunner of Freewind Post, who studies the centaur relic called the Cloven Hoof.",
  },

  greetings = {
    { id = "g_study", text = "Ah, a visitor. Forgive the mess; I've been staring at centaur carvings since dawn." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned! I hoped you might, because I've had questions piling up." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID" },
      text = "One of the Circle's students. Then you'll understand why moonwell water is never carried lightly." },
  },

  react = {
    { id = "r_bear", on = "form", when = { form = "bear" }, text = "Easy, friend. These tablets are older than both of us, and you're wider than the doorway." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "The centaur keep a flame that never goes out, and you seem to carry one too, in a body that ought to have gone out long ago. I'd very much like to know why, though I suspect you're as curious as I am." } },
      choices = {
        { text = "The Light chose to stay with me. That's reason enough.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It's power, Rau. Study it like anything else.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Great battles, mostly, centaur against centaur and clan against clan, and very few of them seem to end with anyone winning. The Galak carve their heroes trampling their enemies, and I've begun to wonder if they've ever carved anything else." } },
      choices = {
        { text = "War without honor is just slaughter. The carvings prove it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Victory is victory. The Galak simply remember theirs.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "They do, and their carvings show it, with great hunts drawn round the walls in red ochre. What puzzles me is that the beasts in the oldest carvings are larger than anything in the Needles now, and I can't tell whether the centaur exaggerated or something has been lost." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "{pet} would make a fine carving, you know. The centaur only ever drew beasts being hunted, and I'd like to see one drawn standing proudly beside its hunter." },
      },
      choices = {
        { text = "Trust the bones and the evidence, not painted boasts.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Trust the carvings. Old tales hold truths that bones don't.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "That's what I think, but I've no proof, and a scholar who thinks without proof is only a dreamer. If you ever get close enough to the flame to sense what feeds it, I'd be grateful for the word, because I'd rather know than guess." } },
      choices = {
        { text = "Leave sacred things in peace. Some mysteries stay mysteries.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Every secret can be learned. I'll find out.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else, Rau.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I think I don't know, and that bothers me more than any answer would. You'd know the feel of a summoned thing better than I would, so if you ever walk near their hold, I'd value your opinion, even from a warlock." } },
      choices = {
        { text = "I'll look. Knowledge serves us all.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Some questions are better left unasked.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Only to see the Cloven Hoof up close, and to learn why the centaur keep it behind a flame that never dies. I don't want it stolen, because a relic taken by force stops telling you anything, and I've waited too long to learn its story." } },
      choices = {
        { text = "Then I'll look and leave it where it lies.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Easier to take it and study it here, Rau.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhpriest = {
      big = true,
      lines = { { id = "xhpriest_default", text = "I think it is old, and that the centaur believe it holy, which may be the same thing to them. The night elves say their moonwells were blessed in a similar way, so I've begun to wonder whether every people finds a fire and decides it must be sacred." } },
      choices = {
        { text = "Every faith deserves respect, even the centaur's.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The centaur are raiders. Their fire is no holier than a torch.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior, good! If you go down to the Galak camps, mind the carvings on the walls, because some are older than the centaur who live there now, and I'd hate to lose them to a stray axe." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter! You'll have seen the centaur's game trails in the canyons, and I'd love to know if any of them lead near the Cloven Hoof." },
        { id = "h_default", key = true,
          text = "Rau Cliffrunner. The centaur keep a relic in their hold, the Cloven Hoof, behind a flame that never goes out. I'd very much like to know why." },
        { id = "h_flame", tags = { "news" }, when = { questActive = TODO_QUEST("The Sacred Flame") },
          text = "Moonwell water is the key. The dryads and the centaur share an ancestry, so water from the night elves' wells can breach that eternal flame for a little while, if whoever carries it is quick." },
        { id = "h_hoof_done", when = { questDone = TODO_QUEST("The Sacred Flame") },
          text = "I can feel a strange energy coming off the Hoof even now, and I've barely begun. Every night I think I'm close to one of its secrets, and every morning it has another." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage! You'll want to hear about the flame that guards the Cloven Hoof, because it burns without fuel, and I've never been able to decide whether it's magic or the centaur are simply very good at lying." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "A warlock. The Galak call on the spirits of their dead khans before they raid, and I've often wondered whether what answers them is a spirit at all." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" }, text = "You came up the lift without making the ropes sing, and that is rare. I could use someone who can walk into the Galak hold without being heard." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde. You'll know something of holy fire, I hope, because the flame that guards the Cloven Hoof burns without wood and without end." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. I've been staring at centaur carvings all morning, and now I have something even more puzzling to stare at." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'll warn you, I can talk about centaur until the moon sets." },
        { id = "h_again2", text = "Go on, ask. Questions are the only thing I never tire of." },
      },
      choices = {
        { text = "How did you learn to listen to the land?", next = "listen" },
        { text = "What is the Cloven Hoof?", next = "hoof" },
        { text = "How do you get moonwell water in Thousand Needles?", next = "moonwell" },
        { text = "What have you learned from the Hoof?", next = "study", when = { questDone = TODO_QUEST("The Sacred Flame") } },
        { text = "I'm a druid too. What does the Hoof feel like to you?", next = "druid", when = { class = "DRUID" } },
        { text = "Do the spirits speak through the Cloven Hoof?", next = "x_shaman", when = { class = "SHAMAN" } },
        { text = "A flame without fuel must be magic, Rau.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "You think something darker answers the centaur?", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "What do the centaur carvings show of their wars, Rau?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do the centaur hunt the beasts of the canyon, Rau?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "What do you want from the Galak hold, Rau?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do you think the flame is holy, Rau?", next = "xhpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What puzzles you about me, Rau?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Good luck with your studies.", next = "END" },
      },
    },
    hoof = {
      big = true,
      lines = {
        { id = "ho_default", text = "Something strange; I can feel it from here, the way you feel weather turning. Centaur history, perhaps, or centaur trouble." },
      },
      choices = {
        { text = "How old is it?", next = "ancestry" },
        { text = "Maybe both.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
      },
    },
    ancestry = {
      lines = {
        { id = "an_default", text = "The Galak guard it as a thing from the time the centaur were made, and they guard it fiercely. It's kept deep in Splithoof Hold, at the back of their crag, with their strongest warriors around the flame." },
      },
      choices = {
        { text = "Then whoever takes it needs friends.", next = "BACK", fx = { affinity = 1, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    moonwell = {
      lines = {
        { id = "m_default", text = "You don't, not here. My associate in Thunder Bluff, Zangen Stonehoof, arranges for someone to fill a phial at a moonwell in Ashenvale, near Raynewood, and send it on to me." },
      },
      choices = {
        { text = "The night elves allow that?", next = "phial" },
        { text = "Something else.", next = "BACK" },
      },
    },
    phial = {
      lines = {
        { id = "p_default", text = "The phials come from the dryads near Raynewood, and they don't give them up willingly. I don't love that, but the Hoof won't wait for Ashenvale's blessing." },
      },
      choices = {
        { text = "That's theft, plainly.", next = "BACK", fx = { align = { honor = 1 }, trait = { stern = 1 } } },
        { text = "Knowledge has a price.", next = "BACK", fx = { trait = { curious = 1 }, align = { honor = -1 } } },
      },
    },
    listen = {
      lines = {
        { id = "l_rise", text = "On Elder Rise, sitting still until my legs went numb. The Arch Druid says the land talks all the time. Most of us just never shut up long enough to hear it." },
      },
      choices = {
        { text = "I'll try being quiet.", next = "BACK", fx = { affinity = 2, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    study = {
      lines = {
        { id = "s_default", text = "That I was right to want it, for there's more to learn about the centaur in that Hoof than in a lifetime of watching them raid. I mean to decipher every bit of it, however long it takes." },
      },
      choices = {
        { text = "Tell me when you do.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid = {
      lines = {
        { id = "d_default", text = "Like standing near a moonwell with your eyes shut; you can't see it, but you know exactly where it is. Put your hand near it some time, and tell me if you feel the same." },
      },
      choices = {
        { text = "I will.", next = "BACK", fx = { affinity = 2, learn = { "cenarion_circle" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_shaman = {
      lines = {
        { id = "xs_default", text = "I hoped someone would ask, for I can only feel that it hums, the way a drum hums after it has been struck. A shaman may hear words where I hear an echo, so if the spirits tell you anything of the Hoof, come to me first, I beg you." },
      },
      choices = {
        { text = "I'll listen, and tell you what I hear.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "The spirits want it left alone, Rau.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I study the centaur from up here, and the Circle's teachers taught me to listen before I study anything." } },
    advice = { { id = "tp_ad", text = "Never fight the Galak on open ground. Make them come up to you; centaur hate a slope." } },
    cenarion_circle = { { id = "tp_circle", text = "Hamuul's teachers. I owe them more than I can say; the land speaks to me because they taught me to listen." } },
    _none = { { id = "tp_none", text = "I don't know, but now I want to. Thank you for that." } },
  },
}

P:NPC {
  key = "hagar", id = TODO_NPC("Hagar Lightninghoof"), name = "Hagar Lightninghoof",
  bible = "bibles/thousandneedles.md", role = "scholar", tier = "quest",
  communities = { "freewind" }, temper = { "eager" }, values = { "curious" },
  notices = { "pet" },

  impression = {
    first = "Hagar Lightninghoof asked whether I'd seen a very large egg before he asked anything else. His mind keeps drifting back to it, and he is too delighted to apologize properly.",
    third = "{name} met Hagar Lightninghoof of Thunder Bluff, who came to the Thousand Needles chasing tales of a strange egg.",
  },

  greetings = {
    { id = "g_egg", text = "You haven't seen an egg, have you, a very large one? No? Ah, well, it was worth asking." },
    { id = "g_back", when = { metBefore = true }, text = "There you are! I've been waiting to tell somebody, anybody, really." },
  },

  notice = {
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "What a fine beast; was it hatched or born? Forgive me, eggs are on my mind." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Nearly! An egg no wind serpent ever laid and one of the dead the Light never let go of are both things nobody expected, and I came all this way to see the unexpected. I'd write you down in my notes, if you'd hold still." } },
      choices = {
        { text = "Write that the Light holds what it chooses.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Write that I made my own way back.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Then I'll be very polite to her and you'll be very brave, which seems a fair division of labour to me. Anything that lays an egg that size is something I'd like to meet from a respectful distance, with a warrior standing helpfully in between." } },
      choices = {
        { text = "Then leave the egg. Its mother has the better claim.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If the mother comes, I'll handle her. Go get your egg.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Something with wings, I'm nearly sure, because no beast that walks would choose to nest this high. I've heard old tales of great fliers over the Needles, and I'd give a great deal to know whether one is waiting to be born." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Does {pet} sniff at the canyon nests when you pass? I'd trust its nose over any map I bought in Thunder Bluff." },
      },
      choices = {
        { text = "Some eggs should stay in their nests, Hagar.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Find it before the Galak do, whatever hatches.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "A fair question, and I asked it myself, briefly. But if something like that hatches out there with no one watching, it will be the Needles that pay, and I'd rather it hatched where I could see it." } },
      choices = {
        { text = "You're right to take it. It must be watched.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Leave it be. Some things are meant to sleep.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "That's what I've been telling everyone, and they all laugh at me! If you find it before I do, don't break it, and don't sell it to a goblin, because I think whatever's inside it deserves to hatch." } },
      choices = {
        { text = "Let it hatch in peace. Nature knows best.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Something that rare should be studied, not left.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Hagar.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "No, no, I only want to see it, and maybe draw it. But the wind serpents guard their nests fiercely, and a quiet climber could get close enough to look without ending up as dinner." } },
      choices = {
        { text = "Looking's harmless. I'll climb up for you.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "If it's worth seeing, it's worth taking.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior! Splendid, because if I do find that egg, whatever laid it may want it back, and I'd rather it found you first." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter! Then you'll know every nest and den in these canyons, and I've been wondering for days which of them might hide an egg the size of a kodo's head." },
        { id = "h_default", key = true,
          text = "Hagar Lightninghoof, of Thunder Bluff. I heard these canyons hid an egg unlike anything a wind serpent ever laid, so I came to see for myself." },
        { id = "h_egg", tags = { "news" }, when = { questActive = TODO_QUEST("Alien Egg") },
          text = "The serpents guard it like a hoard. Get past them and bring the egg here, gently, please, very gently." },
        { id = "h_serpent", when = { questActive = TODO_QUEST("Serpent Wild") },
          text = "It hatched, and I know the shape from the old tales: Arikara, the Vengeance. Motega Firemane must hear of this." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! Then you'll understand that the egg I'm after is no ordinary serpent's; there's something old and angry in it, and I mean to know what." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Do the spirits of the air know anything about very large eggs? I ask everyone, and you seem better informed than most." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Have you ever, by any chance, prayed over a very large egg? No? Well, if you ever do, I'd love to know how it went." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock! Do demons lay eggs, do you know? I'm sorry, I'm sure you're asked that constantly, but it's been on my mind." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage! Can you tell me if an egg can be magical? There's one in these canyons bigger than any wind serpent could lay, and I'd give a great deal to know what's strange about it." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "You look like someone who could climb to a nest without the mother noticing. Not that I'm asking, only wondering aloud." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin! Have you seen a very large egg? No? Well, never mind, because you're nearly as surprising as the egg, so I'm delighted all the same." },
      },
      again = {
        { id = "h_again", text = "Yes, yes, what else? Forgive me, my mind keeps wandering back to that shell." },
        { id = "h_again2", text = "Ask, please. I've been talking to myself for days." },
      },
      choices = {
        { text = "Should that egg be disturbed at all, Hagar?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What kind of egg?", next = "egg" },
        { text = "Why come all this way for an egg?", next = "why" },
        { text = "What is Arikara?", next = "legend", when = { questDone = TODO_QUEST("Alien Egg") } },
        { text = "My companion? Born, not hatched.", next = "pet", when = { pet = { type = "Beast" } } },
        { text = "My people raise raptors from the egg.", next = "x_troll", when = { race = "Troll" } },
        { text = "Why would the air spirits know about your egg, Hagar?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Could magic help you find this egg of yours?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "A strange egg might well hold magic, Hagar.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "You want me to steal an egg?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "What if the egg's mother comes looking, Hagar?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "What do you think will hatch from this egg, Hagar?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Am I really as surprising as your egg, Hagar?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Good luck with your egg.", next = "END" },
      },
    },
    egg = {
      lines = {
        { id = "e_default", text = "Too large, too warm, and the wrong color entirely. The serpents won't leave it alone. Either they think it's theirs, or they're afraid of it." },
      },
      choices = {
        { text = "Where do the serpents keep it?", next = "dens" },
        { text = "Which do you think?", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
      },
    },
    dens = {
      lines = {
        { id = "d_default", text = "In one of their dens along the foot of the cliffs, south of the post or off to the northeast; the reports don't agree. Nobody who's seen it has got close enough to look properly, which is exactly my complaint." },
      },
      choices = {
        { text = "I'll get close enough.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    why = {
      lines = {
        { id = "w_default", text = "Because nobody else would, and because a rumor about an egg that serpents guard as their own is the best rumor I've heard in years. Who knows what will hatch from a thing like that?" },
      },
      choices = {
        { text = "Something dangerous, maybe.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    legend = {
      big = true,
      lines = {
        { id = "l_default", text = "I'd have called anyone a liar who told me, and then I saw it hatch. Arikara is the Vengeance of our old stories, a serpent that comes only when some terrible wrong has been done, and it has come to the Needles." },
      },
      choices = {
        { text = "What wrong could have called it?", next = "motega" },
        { text = "Something else.", next = "BACK" },
      },
    },
    motega = {
      lines = {
        { id = "m_default", text = "That's beyond a scholar of eggs, I'm afraid. Motega Firemane at Whitereach Post, northwest along the road, will know what must be done, so go to him quickly." },
      },
      choices = {
        { text = "I'm on my way.", next = "BACK", fx = { affinity = 2, standing = { freewind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pet = {
      lines = {
        { id = "p_default", text = "Born, then, and none the worse for it. I only ask because the moment a shell gives way and something looks out at a world it has never seen stays with you. Mine looked at me and flew off, which I'm trying not to take personally." },
      },
      choices = {
        { text = "It'll come back to haunt you.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_troll = {
      lines = {
        { id = "xt_default", text = "Do they? Then you know more about eggs than I do, which I admit isn't hard, since I've hatched exactly one and it flew away. Tell me, does a hatchling know its mother, or only whoever feeds it first?" },
      },
      choices = {
        { text = "Whoever feeds it first, and it never forgets.", next = "BACK", fx = { affinity = 1 } },
        { text = "A raptor knows its rider. Nothing else matters.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "That's the very question I've been asking myself! If an egg that size had anything special in it, a spellcaster might feel it from a pinnacle away, so if you feel anything at all out on the Needles, please come and tell me." } },
      choices = {
        { text = "I'll keep my senses open for your egg, Hagar.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "An egg that rare is worth gold. I'd sell it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Because the wind serpents nest high on the Needles, and the wind goes everywhere, so it must have passed the egg at some point. If the spirits would only tell me which pinnacle, I'd stop asking travelers, though I'd probably keep asking anyway." } },
      choices = {
        { text = "The spirits deserve respect, not questions about eggs.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Ask them anyway. Curiosity is a gift from the Earth Mother too.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I'm a scholar from Thunder Bluff with a weakness for strange eggs. That's how I came to be sitting on a mesa." } },
    advice = { { id = "tp_ad", text = "If a wind serpent is guarding something, there's a reason, and it's usually a good one. Go carefully." } },
    _none = { { id = "tp_none", text = "Not my field, I'm afraid, unless it hatches, and then it's my field." } },
  },
}

P:NPC {
  key = "thalia", id = TODO_NPC("Thalia Amberhide"), name = "Thalia Amberhide",
  bible = "bibles/thousandneedles.md", role = "questgiver", tier = "quest",
  communities = { "freewind" }, temper = { "bitter" }, values = { "loyal", "stern" },
  notices = { "race" },

  impression = {
    first = "Thalia Amberhide warned me she was poor company and was right about it. She keeps a knotted cord for the friend the Grimtotem took, and her fingers never stop finding it.",
    third = "{name} met Thalia Amberhide at Freewind Post, who waits for word of her friend Lakota Windsong.",
  },

  greetings = {
    { id = "g_inn", text = "Sit if you like, but don't expect me to be good company." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Have you come with news, or just for the stew?" },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You're tauren, so you know the Grimtotem should be family. That's what makes it worse." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "I don't know. Arnak Grimtotem took her and killed her brother, and I've prayed to the Earth Mother until my voice gave out. If the Light can walk into that pinnacle in one of the dead, then perhaps it can bring her out." } },
      choices = {
        { text = "The Light abandons no one, Thalia. I'll look for her.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Prayer won't bring her back. A blade might.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "A good one might, if they climbed at night and didn't mind the drop, because the braves pull the ropes up behind them. I've tried it twice and come back with nothing but torn hands, so I sit here, and I wait, and I hate myself for it." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "{pet} might catch Lakota's scent on the rocks, if any of her is left up there. Let it smell this cord; she tied the first knots in it herself." },
      },
      choices = {
        { text = "Waiting isn't weakness. Going up alone would be.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Waiting won't save her. Climbing might.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "They say the land belongs to the tauren alone, and every other race is a weed to be pulled. Somewhere along that road, they started pulling tauren too." } },
      choices = {
        { text = "They can still be shown the way back.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "They chose their road. Cut them down.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "If anyone could, it would be someone like you, because a war party would only get her killed. Arnak keeps her close, and I've been sitting here counting days, too afraid to go and too ashamed to stay." } },
      choices = {
        { text = "I'll bring her back. Quietly, and alive.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Arnak should die for this. I'll see to it.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "No, and that's what frightens me, because I want Arnak dead more than I want anything good. Tell me I'm wrong to think of it, and I'll believe you, because I want to believe someone." } },
      choices = {
        { text = "You're not wrong. Let your anger burn.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Don't go down that road. Hold to the Earth Mother.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let's speak of something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter. Arnak's braves leave tracks up the pinnacle like any beast, and I've followed them to the foot of the cliff a dozen times and never any further." },
        { id = "h_default", key = true,
          text = "Thalia Amberhide. Arnak Grimtotem carried off my friend Lakota Windsong and killed her brother when he tried to stop it, and every trail leads up to the Grimtotem's pinnacle. So I sit here and wait, and I'm poor company for it." },
        { id = "h_free", tags = { "news" }, when = { questActive = TODO_QUEST("Free at Last") },
          text = "You found Lakota? She's coming down from the pinnacle with you? Then bring her the rest of the way, and if a Grimtotem stands in your way, don't hesitate." },
        { id = "h_names", when = { metBefore = true }, text = "I tied a knot in this cord the night Lakota was taken, and I'll untie it the day she walks through that door. My fingers keep finding it." },
        { id = "h_home", when = { questDone = TODO_QUEST("Free at Last") },
          text = "Lakota's home, and I knew in my bones she'd find her way back to me. She told me how you fought for her, and I won't forget it." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid. If you have any way of seeing into the Grimtotem's camp, I would walk any trail you named for word of Lakota." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman. If the spirits could tell me whether Lakota still lives, I would listen to anything they said." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Would you say something for Lakota's brother, who died trying to stop them? Nobody has said anything for him that I've heard." },
        { id = "h_hmage", when = { class = "MAGE", race = { "Troll", "Scourge" } }, text = "A mage. If you can see far, then look up at Darkcloud Pinnacle and tell me whether there's a light in the high camp, because I can't stop looking." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "You move like someone who could get up to the pinnacle without the Grimtotem seeing. I've thought of nothing else since Lakota was taken." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Horde" },
          text = "Warlock. I have prayed to the Earth Mother every night for Lakota, and I am starting to wonder if your kind of power answers faster." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Grimtotem", min = 30 } }, text = "You've been killing Grimtotem, haven't you? It doesn't bring Lakota home, but I'll admit it helps me sleep, and I'm not proud of that." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "A Forsaken paladin. I'm poor company, and I'm sorry for it, but I find myself hoping the Light reaches the Grimtotem's pinnacle, since nothing else has." },
      },
      again = {
        { id = "h_again", text = "What else? Say it, and then let me be." },
        { id = "h_again2", text = "Ask, if you must. I've nothing better to do than sit here." },
      },
      choices = {
        { text = "How did the Grimtotem stray so far from the Earth Mother?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Why so bitter?", next = "bitter" },
        { text = "What happened to Lakota?", next = "lakota" },
        { text = "Lakota spoke of her brother. I'm sorry.", next = "brother", when = { questDone = TODO_QUEST("Free at Last") } },
        { text = "Arnak is dead. I killed him.", next = "arnak_dead", when = { questDone = TODO_QUEST("Wanted - Arnak Grimtotem") } },
        { text = "I'm tauren. I know what the Grimtotem should be to us.", next = "kin", when = { race = "Tauren" } },
        { text = "I'd have stood with Lakota's brother that night.", next = "x_warrior", when = { class = "WARRIOR" } },
        { text = "Have you asked the spirits about Lakota, Thalia?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Could magic help find Lakota?", next = "xhcast", when = { class = { "PRIEST", "MAGE" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Could I get Lakota out quietly?", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Vengeance doesn't need the Earth Mother's blessing.", next = "xlock", when = { class = "WARLOCK", faction = "Horde" } },
        { text = "Could a hunter follow the Grimtotem up the pinnacle?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Could the Light help you find Lakota, Thalia?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "I'm sorry.", next = "END", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    bitter = {
      big = true,
      lines = {
        { id = "b_default", text = "Because the Grimtotem are tauren, and they do this to tauren. A centaur I could hate cleanly." },
      },
      choices = {
        { text = "Then let's make it right.", next = "BACK", fx = { affinity = 2, align = { honor = 1 }, learn = { "grimtotem" } } },
        { text = "It isn't my fight, Thalia.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Not every Grimtotem is Arnak.", next = "grimtotem" },
        { text = "...", next = "BACK", fx = { learn = { "grimtotem" } } },
      },
    },
    grimtotem = {
      lines = {
        { id = "g_default", text = "No, and the poster calls him an outcast. But he made his lair right above their pinnacle and not one of them came down to tell us, so don't ask me to split hairs." },
      },
      choices = {
        { text = "That's fair.", next = "BACK", fx = { affinity = 1, learn = { "grimtotem" } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "grimtotem" } } },
      },
    },
    lakota = {
      lines = {
        { id = "l_default", text = "Arnak wanted her for his bride, and she said no. He came back that same night and took her, and her brother died trying to stop him." },
      },
      choices = {
        { text = "Where is she now?", next = "where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    where = {
      lines = {
        { id = "w_default", text = "Up on the cliffs north of Darkcloud Pinnacle, where Arnak keeps to himself, if she's alive, and she is. I'd know if she wasn't." },
      },
      choices = {
        { text = "Then I'll go up and look.", next = "BACK", fx = { affinity = 3, trait = { brave = 1 }, standing = { freewind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    brother = {
      lines = {
        { id = "br_default", text = "He was braver than he was strong, and it got him killed. Wear what I gave you of his; Lakota wanted you to have it, and so do I." },
      },
      choices = {
        { text = "I'll carry them well.", next = "BACK", fx = { affinity = 2, align = { honor = 1 } } },
        { text = "I'd sooner sell them than wear a dead man's things.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    arnak_dead = {
      lines = {
        { id = "a_default", text = "Good. I hoped it would feel like more than it does, but good, and I hope he knew why it was happening." },
      },
      choices = {
        { text = "He knew.", next = "BACK", fx = { affinity = 2, trait = { stern = 1 } } },
        { text = "It won't bring her brother back.", next = "BACK", fx = { trait = { kind = 1 } } },
      },
    },
    kin = {
      lines = {
        { id = "k_default", text = "Then you know why I can't sleep. The Earth Mother made us all one people, and they've made themselves something else, and they did it on purpose." },
      },
      choices = {
        { text = "We'll answer them together.", next = "BACK", fx = { affinity = 2, learn = { "grimtotem" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_warrior = {
      lines = {
        { id = "xw_default", text = "Then you'd be lying dead beside him, because Arnak didn't come alone and he didn't come to fight fair. Brave words cost nothing on this mesa, warrior; everyone says them, afterward." },
      },
      choices = {
        { text = "Then let me spend them on Arnak.", next = "BACK", fx = { affinity = 1, trait = { brave = 1 } } },
        { text = "You're right. I'm sorry.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "I've wondered, every night, but the elders say Arnak's people have shamans of their own guarding the pinnacle. If you could get close enough to feel where she's being held, I'd owe you more than I could ever say." } },
      choices = {
        { text = "I'll go up tonight, alone if I have to.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Wait for the braves. A rescue needs planning.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I asked an elder at Freewind, and she said the wind up at Darkcloud Pinnacle carries only Grimtotem voices now. So I keep my cord and I wait, because I don't know what else to do with an answer like that." } },
      choices = {
        { text = "Don't give up. The spirits haven't said she's gone.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Waiting won't bring her back. Arnak should pay in blood.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Lakota Windsong is my friend, and that's all you need to know about me right now.", next = "lakota" } },
    advice = { { id = "tp_ad", text = "If you go up Darkcloud Pinnacle, don't trust a single smile you see there." } },
    grimtotem = { { id = "tp_grimtotem", text = "Ask me again when they've answered for it." } },
    _none = { { id = "tp_none", text = "I don't care about that, not today." } },
  },
}

P:NPC {
  key = "abeqwa", id = TODO_NPC("Innkeeper Abeqwa"), name = "Innkeeper Abeqwa",
  bible = "bibles/thousandneedles.md", role = "innkeeper", tier = "service",
  communities = { "freewind" }, temper = { "gentle" }, values = { "kind", "generous" },
  notices = { "weary", "drink" },

  impression = {
    first = "Innkeeper Abeqwa keeps the blankets dry and tells guests not to look down from the mesa. The wind sings over her inn at night, and she plainly loves it.",
    third = "{name} met Innkeeper Abeqwa, who keeps the inn atop the mesas at Freewind Post.",
  },

  greetings = {
    { id = "g_inn", text = "Rest here, traveler. The wind sings over the mesa at night; most guests find it soothing." },
    { id = "g_home", when = { homeInn = { "Freewind Post" } }, text = "Back to your own bed above the canyons. I kept the blankets dry." },
  },

  notice = {
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You've walked a hard road back from somewhere darker. Sit; nothing on this mesa needs you for an hour." },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Careful near the edge in that state. The canyon doesn't forgive a misstep." },
  },

  start = "hello",
  nodes = {
    xfpala = {
      big = true,
      lines = { { id = "xfpala_default", text = "Because it sings for anything new, and you're the newest thing these mesas have seen in a long time. One of the dead with the Light in them is a song the wind hasn't learned yet, and I'd like to hear how it goes." } },
      choices = {
        { text = "Then let it be a hopeful song.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let the wind keep its songs. I'm here to fight.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Easier than anywhere, I think, because the Galak can't reach us up here and the Grimtotem keep to their own pinnacle. The warriors who sleep here say the wind sounds like drums at night, and some of them sleep better for it, and some of them don't sleep at all." } },
      choices = {
        { text = "The drums are a comfort. Let the wind keep watch.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Drums mean war. I'll keep my axe close tonight.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Only their lunches, because the hawks have learned that anyone eating on the ledge isn't watching the sky. Nyse says her wind riders chase them off the roost, but the hawks were here before Freewind, and I think they consider us the guests." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And there's {pet}, sniffing at the stew pot already. It can have the bones once the guests are fed, because nothing goes to waste up here." },
      },
      choices = {
        { text = "The hawks were here first. Let them have their share.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A mesa's no place for thieves, even feathered ones.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "My grandmother said it carries the voices of those who fell from the mesas, which is why I tell guests not to look down. Most nights I think it's only the wind, and some nights I'm not so sure." } },
      choices = {
        { text = "Honor the old tales. They keep people careful.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "It's only wind. Old tales just make people afraid.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "No, but everyone who sleeps here is a guest, and I treat my guests kindly. If you'd rather not, I'll understand, but you'd make a cold traveler very happy, and that's worth something, even to a mage." } },
      choices = {
        { text = "A small kindness costs me nothing. I'll help.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "My magic isn't a servant's tool.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "It's the safest way down, and I'd ask you to use it, because I've had to tell more than one family their child fell climbing. The canyon doesn't forgive a slip, however quiet the feet." } },
      choices = {
        { text = "I'll take the lift. Safety first.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll climb. I trust my own hands.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Horde" },
          text = "A warrior! Leave your axe by the door, please, because the last one who brought his to the table turned round to look at the view and cut the stew in half." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Horde" },
          text = "A hunter! If you bring a beast up here, keep it back from the edge, please, because the last hunter's cat tried to follow a hawk and gave us all a fright." },
        { id = "h_default", key = true,
          text = "The inn at Freewind: beds, stew, and a view that will turn your knees to water if you look down. So don't look down." },
        { id = "h_bridges", when = { metBefore = true }, text = "A young brave fell asleep on the rope bridge last night, on it, and we found him at dawn, snoring, swinging in the wind. Tauren sleep anywhere." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Look out there. The needles throw long shadows under the moon, like the canyon is full of sleeping giants." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! You'll want the room by the edge, then; the wind sings through it at night, and the druids who stay here say it's the canyon talking." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Then you'll know why I love the wind singing over this mesa at night, because you can hear what it's singing about." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Come in and sit, and if you could bless the bridges on your way out I'd sleep better, because I'm forever telling guests not to look down." },
        { id = "h_hlock", when = { class = "WARLOCK", race = { "Orc", "Scourge" } }, text = "A warlock. Your companion may stay, but not near the blankets, and certainly not near the edge, because I won't be explaining a falling demon to the cliffwatchers." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Horde" },
          text = "A mage! Would you warm the blankets for my guests? The wind up here cuts through anything, and a little fire in the right place would make their sleep sweeter." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Horde" },
          text = "You walk the mesa like you know the ground, but you look like you'd sooner climb down the cliff than ride the lift. Most rogues do, I've noticed." },
        { id = "h_fpaladin", when = { class = "PALADIN", faction = "Horde" }, text = "Welcome to Freewind, and don't look down. You're the first Forsaken paladin to sleep at my inn, and the wind will sing louder for you, I think." },
      },
      again = {
        { id = "h_again", text = "Something more, friend? There's no hurry on the mesa." },
        { id = "h_again2", text = "Ask away. The stew won't spoil while we talk." },
      },
      choices = {
        { text = "What does the wind over the mesas say?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What's the news on the mesa?", next = "news" },
        { text = "How did anyone build up here?", next = "mesa" },
        { text = "Who else lodges here?", next = "guests" },
        { text = "Make this my home.", next = "BUSINESS" },
        { text = "Do I frighten your guests, innkeeper?", next = "x_forsaken", when = { race = "Scourge" } },
        { text = "What does the wind sing about over Freewind, Abeqwa?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Does the wind up here do anything to magic?", next = "xhcast", when = { class = { "PRIEST", "WARLOCK" }, race = { "Orc", "Troll", "Scourge" } } },
        { text = "Mages aren't hearth-keepers, Abeqwa.", next = "xmage", when = { class = "MAGE", faction = "Horde" } },
        { text = "The lift's too slow and too open.", next = "xrogue", when = { class = "ROGUE", faction = "Horde" } },
        { text = "Do warriors rest easy up here on the mesa, Abeqwa?", next = "xwarcl", when = { class = "WARRIOR", faction = "Horde" } },
        { text = "Do the hawks of the mesa trouble your guests, Abeqwa?", next = "xhuntcl", when = { class = "HUNTER", faction = "Horde" } },
        { text = "Why would the wind sing louder for me, Abeqwa?", next = "xfpala", when = { class = "PALADIN", faction = "Horde" } },
        { text = "Just a bed, thank you.", next = "END" },
      },
    },
    news = {
      lines = { { id = "n_default", text = "Hagar talks of nothing but his egg, and Rau of nothing but his hoof. Thalia isn't talking at all, and that worries me most." } },
      choices = {
        { text = "Why isn't Thalia talking?", next = "thalia" },
        { text = "I'll look in on her.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
      },
    },
    thalia = {
      lines = {
        { id = "t_default", text = "Her friend Lakota Windsong was taken by Arnak Grimtotem, and she sits by my fire every night waiting for news. I keep her bowl full and say nothing, for there's nothing useful to say." },
      },
      choices = {
        { text = "Then I'll find something useful to do.", next = "BACK", fx = { affinity = 2, align = { honor = 1 }, learn = { "grimtotem" } } },
        { text = "Then keep saying nothing. Hope would do her more harm.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mesa = {
      lines = {
        { id = "m_default", text = "With lifts and rope bridges, friend, and a great deal of patience. The centaur can't follow us up, and that's worth every aching back it took." },
      },
      choices = {
        { text = "And the harpies?", next = "harpies" },
        { text = "Something else.", next = "BACK" },
      },
    },
    harpies = {
      lines = {
        { id = "h2_default", text = "The harpies can fly, so they're the Cliffwatcher's headache, not mine, except when they steal the washing. Keep your window shut at night." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    guests = {
      lines = {
        { id = "g_default", text = "Braves off watch, travellers bound for the Great Lift, and the young ones who go to study the wyverns at Highperch and come back with bitten hands. Everyone's welcome here, the same as the wind is." },
      },
      choices = {
        { text = "Bitten hands?", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_forsaken = {
      lines = {
        { id = "xf_default", text = "A little, friend, though the harpies frighten them more, and the harpies steal the washing besides. Sit near the fire if you like; I don't suppose the cold troubles you, but the others will be gladder to see you warm." },
      },
      choices = {
        { text = "Thank you, Abeqwa.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "A shaman who stayed here once told me the air on the mesa is restless and spells feel lighter for it, whatever that means. All I know is that candles go out the moment you light them, so I keep lanterns instead." } },
      choices = {
        { text = "I'll keep my spells tame while I'm your guest.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Lighter spells? I'll test that from the edge.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "I like to think it sings about the centaur getting lost in the canyons, but the shaman who stayed here last winter said it carries the songs of the tribes who wandered through long ago. Whichever it is, it puts my guests to sleep, and that's good enough for an innkeeper." } },
      choices = {
        { text = "Then it sings for us, and we should keep listening.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Wind is only wind, whatever the shamans read into it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep the inn at Freewind, and I keep it high and dry. That's the whole of me, friend." } },
    advice = { { id = "tp_ad", text = "Hold the rope rail on the bridges, and never cross one after a second mug." } },
    grimtotem = { { id = "tp_grimtotem", text = "I feed whoever comes to my door, but I've never fed a Grimtotem, and I don't expect to." } },
    _none = { { id = "tp_none", text = "Ask the Cliffwatcher; little happens in the Needles that he misses." } },
  },
}
