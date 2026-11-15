-- Freewind Post: tauren on the mesas above Thousand Needles. Voice: bibles/thousandneedles.md
local P = RPGDialogueAPI:Pack("rpgd.thousandneedles")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "longhorn", id = TODO_NPC("Cliffwatcher Longhorn"), name = "Cliffwatcher Longhorn",
  bible = "bibles/thousandneedles.md", role = "soldier", tier = "major",
  communities = { "freewind" }, temper = { "grim" }, values = { "dutiful", "protective" },
  notices = { "kit", "race" },

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
    hello = {
      lines = {
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
      },
      again = {
        { id = "h_again", text = "What else? Speak, but keep one eye on the canyon while you do." },
        { id = "h_again2", text = "Go on. The Galak won't wait for us to finish talking." },
      },
      choices = {
        { text = "Why build so high?", next = "high" },
        { text = "What do you know of the Grimtotem?", next = "grimtotem" },
        { text = "What did the centaur do this time?", next = "galak" },
        { text = "You have a brother?", next = "nataka" },
        { text = "What happens at Highperch?", next = "highperch" },
        { text = "Arnak Grimtotem is dead.", next = "arnak", when = { questDone = TODO_QUEST("Wanted - Arnak Grimtotem") } },
        { text = "What did the secret notes mean?", next = "notes", when = { questDone = TODO_QUEST("Grimtotem Spying") } },
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
  },

  topics = {
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
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Rau Cliffrunner. The centaur keep a relic in their hold, the Cloven Hoof, behind a flame that never goes out. I'd very much like to know why." },
        { id = "h_flame", tags = { "news" }, when = { questActive = TODO_QUEST("The Sacred Flame") },
          text = "Moonwell water is the key. The dryads and the centaur share an ancestry, so water from the night elves' wells can breach that eternal flame for a little while, if whoever carries it is quick." },
        { id = "h_hoof_done", when = { questDone = TODO_QUEST("The Sacred Flame") },
          text = "I can feel a strange energy coming off the Hoof even now, and I've barely begun. Every night I think I'm close to one of its secrets, and every morning it has another." },
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
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Hagar Lightninghoof, of Thunder Bluff. I heard these canyons hid an egg unlike anything a wind serpent ever laid, so I came to see for myself." },
        { id = "h_egg", tags = { "news" }, when = { questActive = TODO_QUEST("Alien Egg") },
          text = "The serpents guard it like a hoard. Get past them and bring the egg here, gently, please, very gently." },
        { id = "h_serpent", when = { questActive = TODO_QUEST("Serpent Wild") },
          text = "It hatched, and I know the shape from the old tales: Arikara, the Vengeance. Motega Firemane must hear of this." },
      },
      again = {
        { id = "h_again", text = "Yes, yes, what else? Forgive me, my mind keeps wandering back to that shell." },
        { id = "h_again2", text = "Ask, please. I've been talking to myself for days." },
      },
      choices = {
        { text = "What kind of egg?", next = "egg" },
        { text = "Why come all this way for an egg?", next = "why" },
        { text = "What is Arikara?", next = "legend", when = { questDone = TODO_QUEST("Alien Egg") } },
        { text = "My companion? Born, not hatched.", next = "pet", when = { pet = { type = "Beast" } } },
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
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Thalia Amberhide. Arnak Grimtotem carried off my friend Lakota Windsong and killed her brother when he tried to stop it, and every trail leads up to the Grimtotem's pinnacle. So I sit here and wait, and I'm poor company for it." },
        { id = "h_free", tags = { "news" }, when = { questActive = TODO_QUEST("Free at Last") },
          text = "You found Lakota? She's coming down from the pinnacle with you? Then bring her the rest of the way, and if a Grimtotem stands in your way, don't hesitate." },
        { id = "h_names", when = { metBefore = true }, text = "I tied a knot in this cord the night Lakota was taken, and I'll untie it the day she walks through that door. My fingers keep finding it." },
        { id = "h_home", when = { questDone = TODO_QUEST("Free at Last") },
          text = "Lakota's home, and I knew in my bones she'd find her way back to me. She told me how you fought for her, and I won't forget it." },
      },
      again = {
        { id = "h_again", text = "What else? Say it, and then let me be." },
        { id = "h_again2", text = "Ask, if you must. I've nothing better to do than sit here." },
      },
      choices = {
        { text = "Why so bitter?", next = "bitter" },
        { text = "What happened to Lakota?", next = "lakota" },
        { text = "Lakota spoke of her brother. I'm sorry.", next = "brother", when = { questDone = TODO_QUEST("Free at Last") } },
        { text = "Arnak is dead. I killed him.", next = "arnak_dead", when = { questDone = TODO_QUEST("Wanted - Arnak Grimtotem") } },
        { text = "I'm tauren. I know what the Grimtotem should be to us.", next = "kin", when = { race = "Tauren" } },
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
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "The inn at Freewind: beds, stew, and a view that will turn your knees to water if you look down. So don't look down." },
        { id = "h_bridges", when = { metBefore = true }, text = "A young brave fell asleep on the rope bridge last night, on it, and we found him at dawn, snoring, swinging in the wind. Tauren sleep anywhere." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Look out there. The needles throw long shadows under the moon, like the canyon is full of sleeping giants." },
      },
      again = {
        { id = "h_again", text = "Something more, friend? There's no hurry on the mesa." },
        { id = "h_again2", text = "Ask away. The stew won't spoil while we talk." },
      },
      choices = {
        { text = "What's the news on the mesa?", next = "news" },
        { text = "How did anyone build up here?", next = "mesa" },
        { text = "Who else lodges here?", next = "guests" },
        { text = "Make this my home.", next = "BUSINESS" },
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
  },

  topics = {
    background = { { id = "tp_bg", text = "I keep the inn at Freewind, and I keep it high and dry. That's the whole of me, friend." } },
    advice = { { id = "tp_ad", text = "Hold the rope rail on the bridges, and never cross one after a second mug." } },
    grimtotem = { { id = "tp_grimtotem", text = "I feed whoever comes to my door, but I've never fed a Grimtotem, and I don't expect to." } },
    _none = { { id = "tp_none", text = "Ask the Cliffwatcher; little happens in the Needles that he misses." } },
  },
}
