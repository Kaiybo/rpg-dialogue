-- Egan, a dwarf tinkerer near Terrordale who builds machines to free trapped souls. Voice: bibles/egan.md
-- Runs on hatred for the Scourge and compassion for its victims, and insists the second is what matters.
local P = RPGDialogueAPI:Pack("rpgd.easternplaguelands")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "egan", id = TODO_NPC("Egan"), name = "Egan",
  bible = "bibles/egan.md", role = "scholar", tier = "quest",
  communities = { "terrordale" }, temper = { "intense" }, values = { "kind", "stubborn" },
  notices = { "craft", "race" },
  impression = {
    first = "Egan is a dwarf who hates the Scourge with his whole heart and builds contraptions to free the ghosts of Stratholme. He insisted that compassion, not hatred, is what keeps him going, and I think he needed to hear himself say it.",
    third = "{name} met Egan, a dwarven inventor near Stratholme whose blaster frees the restless souls of the city's dead.",
  },

  greetings = {
    { id = "g_tinker", text = "Mind the wires, {g:lad|lass}, and don't touch anything that's humming, especially if it's humming at ye." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Good, I've made adjustments since ye were last here, and only one of them caught fire, which is better odds than most Ironforge workshops." },
    { id = "g_blaster", when = { questActive = TODO_QUEST("The Restless Souls") }, text = "Use the blaster on the ghosts in the streets, and then again on what comes out of them. Compassion, mind, not target practice." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}? I hadn't noticed, I've been elbow-deep in a coil, but by my beard I'm glad to see ye all the same." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "You've hardened up since I first handed you that blaster. Don't harden all the way through, though; that's how you end up like the Crusade." },
  },

  notice = {
    { id = "n_engineer", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Come and look at this coupling, then, and tell me straight whether it's genius or whether it's about to take my eyebrows off." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, all this way from the mountain! Sit, sit, it's been an age since I heard a proper accent that wasn't my own." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Egan's the name, and souls are the trade, or freeing them, anyway. The Scourge locks the dead into this world like ore in stone, and I've built a way to dig them loose." },
        { id = "h_found", tags = { "news" }, when = { questActive = TODO_QUEST("The Restless Souls"), metBefore = false },
          text = "Alen's finally found someone brave enough, eh? Good. Let me show you my blaster." },
        { id = "h_before", when = { questBefore = TODO_QUEST("The Restless Souls") },
          text = "I draw my strength from hating the Scourge, every last bone of it. But I'm no zealot, because the ones the Crusade would burn for being dead are the very ones I mean to save." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Restless Souls"), days = 3 } },
          text = "Did you see my mother in there? Did you free her? No, don't answer, you couldn't know, but thank you for each soul you freed all the same." },
        { id = "h_forsaken", when = { race = "Scourge" },
          text = "You're risen, but you're your own, I can see that. You're exactly the sort I'm fighting for, so don't look at me like I'm going to point the blaster at you." },
        { id = "h_paladin", when = { class = "PALADIN", faction = "Alliance" },
          text = "A paladin, eh? Don't go smiting the ghosts in Stratholme, they've suffered enough. They need setting free, not setting on fire." },
      },
      again = {
        { id = "h_again", text = "What else? Talk while I tighten this, {g:lad|lass}; it helps me think, same as a hammer on an anvil." },
        { id = "h_again2", text = "Go on, I'm listening, mostly. The coil's listening too, and it's a wee bit nosier than I am." },
      },
      choices = {
        { text = "That blaster looks like a strange contraption.", next = "blaster" },
        { text = "What drives you to this work, Egan?", next = "hate" },
        { text = "Does the Scarlet Crusade see the dead as you do?", next = "crusade" },
        { text = "What's it like inside Stratholme's walls?", next = "streets" },
        { text = "Have you met Augustus, the merchant in Terrordale?", next = "augustus" },
        { text = "Which clan are you from, Egan?", next = "clan", when = { race = "Dwarf" } },
        { text = "Let me look at your machine.", next = "engineer", when = { profession = "Engineering" } },
        { text = "Can the Light free them instead?", next = "light", when = { class = { "PRIEST", "PALADIN" } } },
        { text = "What do you need?", next = "BUSINESS" },
        { text = "I'll leave you to it, Egan.", next = "END" },
      },
    },

    blaster = {
      lines = { { id = "bl_default", text = "It cracks the shell the Scourge put around a spirit, like a good pick through a bad seam, and then it lets the spirit go. The first blast makes them angry, I won't lie, and the second sets loose what's inside, which is the bit that matters." } },
      choices = {
        { text = "What's inside?", next = "blaster_inside" },
        { text = "Something else.", next = "BACK" },
      },
    },
    blaster_inside = {
      lines = { { id = "bi_default", text = "Little lights, a wisp or two, or three if it was a big soul. They drift off, and I like to think they're going somewhere better, though I've no gauge that measures that." } },
      choices = {
        { text = "That's a kind thing to build.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    hate = {
      lines = { { id = "ha_default", text = "My mother was in Stratholme when the prince came to purge it, and she didn't come out. Some threw themselves into the fires rather than be made into Scourge, and I've never known which way she went." } },
      choices = {
        { text = "Is that why you go into the city?", next = "hate_mother" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hate_mother = {
      big = true,
      lines = { { id = "hm_default", text = "Every soul I free might be her, or might be somebody else's mother, and either way it's worth doing. The hate gets me out of bed, but it's the other thing that sends me down the road." } },
      choices = {
        { text = "Hold on to the other thing. It's what matters.", next = "BACK", reply = "I'll try, {g:lad|lass}. Some days it's the only thing that keeps the hate honest.", fx = { affinity = 2, align = { light = 1 } } },
        { text = "Hate's served you well. Keep it sharp.", next = "BACK", reply = "It has, and it will, but I'd not want it to be all that's left of me. Keep it sharp, aye, but keep the other thing too.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    crusade = {
      lines = { { id = "cr_default", text = "They'd sooner destroy the innocent dead than spare them an ounce of pity. I'd sooner save them, and that's the whole difference, but it's a difference the size of a mountain." } },
      choices = {
        { text = "So you'd save even the Forsaken.", next = "crusade_forsaken" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crusade_forsaken = {
      lines = { { id = "cf_default", text = "The ones who want saving, aye, and the ones who don't, I'll leave be. Compassion's what separates us from the beasts, and I'll not ration it by who has a heartbeat." } },
      choices = {
        { text = "That's a rare view out here.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK", fx = { learn = { "scarlet_crusade" } } },
      },
    },

    engineer = {
      lines = { { id = "en_default", text = "Ha! Careful, careful, that's the soul-coil, and it doesn't like strangers. Now tell me, does that look like it's going to hold to you, because it's been looking at me funny all week." } },
      choices = {
        { text = "It'll hold. Tighten the second bolt.", next = "BACK", fx = { affinity = 2 } },
        { text = "It's going to explode, Egan.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
      },
    },

    streets = {
      lines = { { id = "st_default", text = "The Scarlets hold the gates and the market, barricaded in like it'll save them, and the Baron and his dead hold everything past the slaughterhouse. The ghosts wander between the two, and nobody on either side looks at them twice." } },
      choices = {
        { text = "Who is this Baron?", next = "streets_baron" },
        { text = "Something else.", next = "BACK" },
      },
    },
    streets_baron = {
      lines = { { id = "sb_default", text = "Rivendare, a lord of Lordaeron who sold his own city to the Cult before the plague ever came. He sits in the Scourge's half like a spider in a web, and every ghost I free is one less thread for him to pull." } },
      choices = {
        { text = "Should the Dawn storm the city?", next = "streets_storm" },
        { text = "Something else.", next = "BACK" },
      },
    },
    streets_storm = {
      big = true,
      lines = { { id = "ss_default", text = "An army in those streets would trample the very souls I'm trying to save, and the Crusade would be glad of the chaos. What would you do with Stratholme, if it were yours to decide?" } },
      choices = {
        { text = "Go in quietly, a few at a time, and free who we can.", next = "BACK", reply = "Aye, that's my thinking exactly, {g:lad|lass}. Quiet and careful, and every soul freed is one fewer screaming.", fx = { affinity = 2, align = { order = -1 } } },
        { text = "March the whole Dawn in and end it in one blow.", next = "BACK", reply = "And trample half the souls I'm trying to save? No, {g:lad|lass}, that's the Crusade's way, not ours.", fx = { align = { order = 1 } } },
        { text = "I'd rather not decide that, Egan.", next = "BACK" },
      },
    },

    augustus = {
      lines = { { id = "au_default", text = "The fellow the dead walk past? Aye, I've met him, and I'll admit I pointed the blaster at him for a good long while. There's a soul in there all right, but it's knotted up with the plague so tight I couldn't tell you which is holding which." } },
      choices = {
        { text = "Could your blaster free him?", next = "augustus_free" },
        { text = "Something else.", next = "BACK" },
      },
    },
    augustus_free = {
      lines = { { id = "af_default", text = "Maybe, and maybe it'd just drop him dead in the street, and he didn't ask me to. So I bought a spool of wire from him instead and left him to his shop, and I still don't know if that was kindness or cowardice." } },
      choices = {
        { text = "It was kindness. He gets to choose.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    clan = {
      lines = { { id = "cl_default", text = "Ironforge born, though I left young to chase gears in Gnomeregan, back when the gnomes still had it. Then my mother married a man from Stratholme, and I followed her east, and you know the rest." } },
      choices = {
        { text = "Do you ever think of going home?", next = "clan_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    clan_home = {
      lines = { { id = "ch_default", text = "Every winter, when the coil freezes and my fingers with it. But there's nobody in the mountain waiting on me, and there's a whole city of souls out here that is, so I stay." } },
      choices = {
        { text = "The mountain will keep. Raise a mug to it someday.", next = "BACK", fx = { affinity = 2 } },
        { text = "Something else.", next = "BACK" },
      },
    },

    light = {
      lines = { { id = "li_default", text = "Maybe it could, if there were enough of ye and ye had a hundred years. I've got a blaster and a dwarf's stubbornness, which is harder than granite, and I'd be glad of your prayers on top of it." } },
      choices = {
        { text = "You'll have them.", next = "BACK", fx = { affinity = 1, trait = { pious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "A dwarf with a toolkit and a grudge, and a mother somewhere in Stratholme. That's my story, and I'd sooner have a spanner in my hand than tell it twice." } },
    advice = { { id = "tp_ad", text = "Hate'll get you started, but it won't keep you going. Find the other thing, and hold on to it." } },
    scarlet_crusade = { { id = "tp_scarlet", text = "They'd burn every ghost in Stratholme if they could reach them, and call it mercy. It isn't." } },
    scourge = { { id = "tp_scourge", text = "I hate the Scourge with all my heart, lad, and I'll tell ye plainly, it's hard work keepin' that hate from eatin' me alive. I build my contraptions to free the ghosts they trapped, and that's a kinder way to spend it." } },
    stratholme = { { id = "tp_stratholme", text = "Stratholme's full o' ghosts that never got their peace, and the Scourge keeps 'em there like prisoners. I'll free every one o' them, if I have to build a thousand contraptions to do it." } },
    holy_light = { { id = "tp_holy_light", text = "I'm no paladin, but I've seen the Light work miracles in the chapel. I'd sooner trust a good machine, though, since it never asks me to pray." } },
    magni = { { id = "tp_magni", text = "King Magni's a good king, and he'd be proud of what I'm doin' here, I think. I'll tell him myself when I get home, if I ever do." } },
    _none = { { id = "tp_none", text = "Couldn't tell ye, I've been staring at this coil for days. Ask Alen at Light's Hope; he hears the gossip off the corpse carts." } },
  },
}
