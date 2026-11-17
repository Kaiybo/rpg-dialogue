-- The Trade Quarter and its edges: Jeremiah Payson the cockroach vendor, Alessandro Luca's odd goods,
-- Ophelia Montague at the bank, and the craft teachers and suppliers: Graham Van Talen and Franklin Lloyd (engineering),
-- Arthur Moore (leatherworking), Bowen Brisboise (tailoring). Voices: bibles/<key>.md
local P = RPGDialogueAPI:Pack("rpgd.undercity")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Jeremiah Payson: the cockroach vendor, once Jeremiah Felstone. Rude, ashamed, and attached to his roaches.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_payson", id = TODO_NPC("Jeremiah Payson"), name = "Jeremiah Payson", title = "Cockroach Vendor",
  bible = "bibles/uc_payson.md", role = "vendor", tier = "quest",
  communities = { "undercity" }, temper = { "surly", "nervous" }, values = { "practical" },
  notices = { "race", "purse" },
  impression = {
    first = "Jeremiah Payson sells cockroaches under a walkway by the bank and treats every customer as an intrusion. Under the rudeness there's a man who would very much prefer not to be asked who he used to be.",
    third = "{name} met Jeremiah Payson, the Undercity's cockroach vendor, who was once Jeremiah Felstone.",
  },

  greetings = {
    { id = "g_default", text = "What? You want a roach or not? I haven't got all night, and neither have they." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Did the last roach die? They don't, usually; they're tougher than you." },
    { id = "g_blues", when = { questActive = TODO_QUEST("The Jeremiah Blues") }, text = "Who sent you? Bauhaus? That census-counting busybody needs to keep my old name out of his mouth." },
    { id = "g_charm", when = { questActive = TODO_QUEST("Good Luck Charm") }, text = "Did you find it yet? Then why are you standing here looking at me?" },
  },

  notice = {
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "Don't eat them. I've had trolls ask, and I've had a tauren look at them funny, and they're not for eating." },
    { id = "n_broke", cat = "purse", when = { money = { max = 100 } },
      text = "You haven't even got the price of a roach on you, have you? Go on, get out of my light." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Jeremiah Payson, and I sell cockroaches. Good ones, healthy ones, the kind that'll follow you about and won't bite more than twice." },
        { id = "h_blues_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("The Jeremiah Blues"), days = 3 } },
          text = "So Janice sent a parcel, years late, and you went to the trouble of finding me. I suppose I owe you something for that, though I'd rather not think about how much." },
        { id = "h_charm_done", tags = { "news" }, when = { questDone = TODO_QUEST("Good Luck Charm") },
          text = "You saw her, then, out at the farm. Don't tell me how she looked. I've decided to remember her the way she was, and that's my right." },
        { id = "h_scourge", when = { race = "Scourge", ["not"] = { questDone = TODO_QUEST("The Jeremiah Blues") } },
          text = "You're dead like me, so you'll understand when I say I don't want to talk about before. Buy a roach or move along." },
      },
      again = {
        { id = "h_again", text = "What now? You're scaring off customers, and I haven't got many." },
        { id = "h_again2", text = "Still here? All right, ask your question, but quickly." },
      },
      choices = {
        { text = "Why cockroaches, of all things?", next = "roaches" },
        { text = "Who comes to buy them?", next = "buyers" },
        { text = "You were Jeremiah Felstone, weren't you?", next = "felstone", when = { questDone = TODO_QUEST("The Jeremiah Blues") } },
        { text = "What do you need, Payson?", next = "BUSINESS" },
        { text = "I'll leave you to your roaches.", next = "END" },
      },
    },

    roaches = {
      lines = { { id = "ro_default", text = "Because they're the only thing that lived through the plague without complaining. Rats got sick, dogs went mad, birds fell out of the sky, and the roaches just carried on, and I respect that." } },
      choices = {
        { text = "You see something of yourself in them?", next = "roaches_self" },
        { text = "Something else.", next = "BACK" },
      },
    },
    roaches_self = {
      lines = { { id = "rs_default", text = "I see something I'd like to be, which isn't the same. Nobody asks a roach where it came from or who its family was, it just gets on with being a roach." } },
      choices = {
        { text = "And that's what you want? To be left alone?", next = "roaches_alone" },
        { text = "Something else.", next = "BACK" },
      },
    },
    roaches_alone = {
      big = true,
      lines = { { id = "ra_default", text = "That's what all of us want down here, if we're honest, and most of us aren't. The Dark Lady gave us our minds back, and I'd like to spend mine on something that doesn't hurt." } },
      choices = {
        { text = "The past is gone. You're right to leave it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Hiding from it won't make it hurt less.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    buyers = {
      lines = { { id = "bu_default", text = "Rogues, mostly, who like something small that can get into places. Some of the apothecaries buy them by the jar, which I don't ask about, and a few lonely sorts who just want something to talk to." } },
      choices = {
        { text = "The apothecaries buy them by the jar?", next = "buyers_apoth" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_apoth = {
      lines = { { id = "ba_default", text = "And they never bring the jars back. I sell, they pay, and whatever happens after that happens in the Apothecarium, which is where I like it to stay." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    felstone = {
      lines = { { id = "fe_default", text = "Keep your voice down. Yes, I was, on a farm out in the west of Lordaeron with my sister Janice, and then the plague came and I wasn't anybody for a while." } },
      choices = {
        { text = "Your sister still thinks of you.", next = "felstone_sister" },
        { text = "Something else.", next = "BACK" },
      },
    },
    felstone_sister = {
      big = true,
      lines = { { id = "fs_default", text = "I know she does, and that's what I can't stand. She sent that parcel when we were both alive, and it took four years and a stranger to reach me, and now I don't know what to do with it." } },
      choices = {
        { text = "Go and see her, Jeremiah. Before it's too late.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Some doors stay shut. Let her keep her memories.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "I sell roaches. That's all the background anyone needs." } },
    _none = { { id = "tp_none", text = "Do I look like I'd know? I sell roaches." } },
  },
}

---------------------------------------------------------------------------
-- Alessandro Luca: seller of odd goods, a merchant with a showman's patter.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_luca", id = TODO_NPC("Alessandro Luca"), name = "Alessandro Luca", title = "Blue Moon Odds and Ends",
  bible = "bibles/uc_luca.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "smooth", "cheerful" }, values = { "greedy" },
  notices = { "purse" },
  impression = {
    first = "Alessandro Luca sells odds and ends in blue in the Undercity, and he sells them like heirlooms. He seems to think the colour blue is the only cheerful thing left in Lordaeron.",
    third = "{name} met Alessandro Luca, who sells blue odds and ends in the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "Ah, a discerning customer! I can always tell; they look at the blue things first." },
    { id = "g_back", when = { metBefore = true }, text = "My favourite customer returns! Well, one of my favourites, but you're very high on the list." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "You've a good weight to your purse, my friend, and I've just the thing to lighten it gracefully." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Alessandro Luca, purveyor of Blue Moon odds and ends. Shirts, trinkets and small comforts, all in blue, because grey is the colour of the dead and green is the colour of the canals, and I am tired of both." },
        { id = "h_woman", when = { gender = "female" }, text = "Madam, you've an eye for colour, I can tell, and blue would suit you beautifully, whatever the state of your complexion." },
      },
      again = {
        { id = "h_again", text = "Something else catch your eye? Everything here is blue, so it's an easy choice." },
      },
      choices = {
        { text = "Why only blue?", next = "blue" },
        { text = "Who buys this sort of thing?", next = "buyers" },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Good day, Luca.", next = "END" },
      },
    },
    blue = {
      lines = { { id = "bl_default", text = "The sky over Lordaeron was blue, once, on a good summer day, and we can't see it from down here. So I sell a little bit of it by the yard, and people pay surprisingly well for a reminder." } },
      choices = {
        { text = "It's a kind thing to sell, Luca.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Selling nostalgia to the dead. Clever business.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = { { id = "bu_default", text = "The dead who want to feel dressed, the living who want a souvenir of the Undercity, and the occasional goblin who wants to buy my whole stock and sell it in Booty Bay. I tell the goblins no, because some things are art." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I don't know, my friend, but I'll wager there's a blue version of it somewhere." } },
  },
}

---------------------------------------------------------------------------
-- Ophelia Montague: banker, cool and amused.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_omontague", id = TODO_NPC("Ophelia Montague"), name = "Ophelia Montague", title = "Banker",
  bible = "bibles/uc_omontague.md", role = "banker", tier = "service",
  communities = { "undercity" }, temper = { "cool", "wry" }, values = { "precise" },
  notices = { "race" },
  impression = {
    first = "Ophelia Montague keeps the Undercity's vaults alongside William and answers every question about their family with a smile and nothing else. She seems to enjoy the mystery more than the money.",
    third = "{name} met Ophelia Montague, a banker of the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "Good evening. Your vault, I presume, and not my life story?" },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. Your vault hasn't moved, I promise you, although nothing else in this city stays put." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Do mind your horns on the vault door. The last tauren took a chip out of the lintel, and William still hasn't forgiven him." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Ophelia Montague, of the bank. I keep the vaults with William, and before you ask, yes, we share a name, and no, I'm not going to tell you what else we share." },
      },
      again = {
        { id = "h_again", text = "Anything else? I've a ledger that's begging to be balanced, and the dead keep dreadful accounts." },
      },
      choices = {
        { text = "Are you and William related?", next = "william" },
        { text = "What's the strangest thing in your vaults?", next = "strange" },
        { text = "Open my vault.", next = "BUSINESS" },
        { text = "Good evening, Ophelia.", next = "END" },
      },
    },
    william = {
      lines = { { id = "wi_default", text = "Everyone asks that, and William and I agreed long ago that it's more fun not to say. Brother, cousin, husband, perfect stranger, it hardly matters after a plague, does it?" } },
      choices = {
        { text = "Family should still matter, even after death.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "It doesn't. Death made us all strangers.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    strange = {
      lines = { { id = "st_default", text = "A wedding dress, folded very carefully, and nothing else in the box. The owner comes in once a month to look at it, and leaves without saying a word, and I've never once asked." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Not a thing I keep in the vaults, and so not a thing I know." } },
  },
}

---------------------------------------------------------------------------
-- Graham Van Talen: engineering trainer, a Forsaken who loves explosives a little too much.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_vantalen", id = TODO_NPC("Graham Van Talen"), name = "Graham Van Talen", title = "Engineering Trainer",
  bible = "bibles/uc_vantalen.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "eager", "scattered" }, values = { "curious" },
  notices = { "craft", "race" },
  impression = {
    first = "Graham Van Talen teaches engineering in the Undercity and is missing two fingers, which he says the plague didn't take. He was the happiest person I'd met in the city until I realised why.",
    third = "{name} met Graham Van Talen, the Undercity's engineering trainer.",
  },

  greetings = {
    { id = "g_default", text = "Careful where you step! No, the other way; that one's live." },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Wonderful. I've just about finished something that will either impress you or remove the eyebrows you've got left." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! I can smell the blasting powder on you, and I mean that as the highest compliment." },
    { id = "n_orc", cat = "race", when = { race = "Orc" },
      text = "Your people blow things up very well, I'm told, though rather less precisely than the goblins." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Graham Van Talen, engineer. I teach anyone who isn't afraid of a loud noise how to make one, and the Forsaken make excellent students, since we can't go deaf twice." },
        { id = "h_notengineer", when = { ["not"] = { profession = "Engineering" } }, text = "You're not an engineer, are you? Pity. Still, mind the bench, it's just been varnished, and the varnish is flammable." },
      },
      again = {
        { id = "h_again", text = "What else? I've got a fuse burning, but it's a long one." },
      },
      choices = {
        { text = "What happened to your fingers?", next = "fingers" },
        { text = "Why do the dead need engineers?", next = "dead" },
        { text = "Teach me engineering.", next = "BUSINESS", when = { profession = "Engineering" } },
        { text = "I'll leave before something explodes.", next = "END" },
      },
    },
    fingers = {
      lines = { { id = "fi_default", text = "A clockwork dragonling I was building for a nephew, before the plague. It worked, for a moment, and then it worked rather too well, and I've been trying to build a better one ever since." } },
      choices = {
        { text = "Some things are worth losing a finger for.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Next time, follow the schematics exactly.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dead = {
      lines = { { id = "de_default", text = "For the same reason the living do: the Scourge outnumbers us, and a well-placed explosive evens the odds. The Deathguard in Brill buy my dynamite by the crate, and they never complain about the noise." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "No idea, but if you can show me how it works, I can probably make it explode." } },
  },
}

---------------------------------------------------------------------------
-- Franklin Lloyd: engineering supplies, gloomy salesman.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_flloyd", id = TODO_NPC("Franklin Lloyd"), name = "Franklin Lloyd", title = "Engineering Supplies",
  bible = "bibles/uc_flloyd.md", role = "vendor", tier = "service",
  communities = { "undercity" }, temper = { "gloomy", "dry" }, values = { "practical" },
  notices = { "craft" },
  impression = {
    first = "Franklin Lloyd sells engineering supplies next to Graham Van Talen and seems to be waiting for the day his neighbour finally blows them both up. He's very calm about it.",
    third = "{name} met Franklin Lloyd, who sells engineering supplies in the Undercity.",
  },

  greetings = {
    { id = "g_default", text = "Blasting powder, bolts, copper tubes. Whatever you're building, I hope it works better than Graham's." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Still in one piece, I see, which puts you ahead of most of my customers." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "Another engineer. You'll be wanting blasting powder, I expect. Everyone does, sooner or later." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Franklin Lloyd. I sell engineering supplies, and I keep the shop right next to Graham's, which is either very convenient or very foolish, depending on the day." },
      },
      again = {
        { id = "h_again", text = "Anything else? I'll be here until the next explosion." },
      },
      choices = {
        { text = "Does Graham worry you?", next = "graham" },
        { text = "Where do your supplies come from?", next = "supplies" },
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "Goodbye, Franklin.", next = "END" },
      },
    },
    graham = {
      lines = { { id = "gr_default", text = "Every day for six years, and I've made my peace with it. If he blows up the quarter, at least I won't have to listen to him talk about dragonlings anymore." } },
      choices = {
        { text = "Then move your shop somewhere safer.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Safe is dull, Franklin. Stay where the sparks are.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    supplies = {
      lines = { { id = "su_default", text = "Goblins, mostly, through Ratchet and the zeppelin. They charge too much and ask too few questions, which is about the right balance for this city." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Never heard of it, and I'd rather not, if it's anything Graham's interested in." } },
  },
}

---------------------------------------------------------------------------
-- Arthur Moore: leatherworking trainer, a tanner who works without a sense of smell.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_amoore", id = TODO_NPC("Arthur Moore"), name = "Arthur Moore", title = "Leatherworking Trainer",
  bible = "bibles/uc_amoore.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "gruff", "dry" }, values = { "practical" },
  notices = { "craft", "race" },
  impression = {
    first = "Arthur Moore teaches leatherworking in the Undercity and says death was the best thing that ever happened to his trade, since he can't smell the tannery anymore. He wasn't entirely joking.",
    third = "{name} met Arthur Moore, the Undercity's leatherworking trainer.",
  },

  greetings = {
    { id = "g_default", text = "Hides on the left, tools on the right, and don't touch either without asking." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Bring me anything worth tanning?" },
  },

  notice = {
    { id = "n_lw", cat = "craft", when = { profession = { "Leatherworking", "Skinning" } },
      text = "You've been skinning, I can see it on your knife. Good clean cuts, too, or near enough." },
    { id = "n_living", cat = "race", when = { race = { "Orc", "Tauren", "Troll" } },
      text = "You'll want to breathe through your mouth in here. The living never get used to the smell, and I'm told it's quite something." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Arthur Moore, leatherworker. I tanned hides in the capital for thirty years, and I'll tell you the truth, the worst part of the job was always the smell, and now I don't have that problem." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "A tauren, in a leatherworker's shop. I'll not ask what you think of my work, since you're the only one in here who's ever been a cow's neighbour." },
      },
      again = {
        { id = "h_again", text = "Something else? These hides won't scrape themselves." },
      },
      choices = {
        { text = "Do you miss the smell?", next = "smell" },
        { text = "What hides do you work now?", next = "hides" },
        { text = "Teach me leatherworking.", next = "BUSINESS", when = { profession = "Leatherworking" } },
        { text = "Good day, Arthur.", next = "END" },
      },
    },
    smell = {
      lines = { { id = "sm_default", text = "Not the tannery, but I miss bread, and wet grass, and my wife's hair. Funny, the things you find you've lost when you can't smell them anymore." } },
      choices = {
        { text = "Hold on to those memories, Arthur.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Better not to dwell on what's gone.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hides = {
      lines = { { id = "hi_default", text = "Wolves from Tirisfal, bears from Silverpine, and the odd thing from the Plaguelands that I'd rather not name. The Deathguard need boots, and boots need leather, so the work's steady." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Couldn't say. I know leather, and that's all I've ever needed to know." } },
  },
}

---------------------------------------------------------------------------
-- Bowen Brisboise: tailoring trainer, a fussy court tailor.
---------------------------------------------------------------------------
P:NPC {
  key = "uc_brisboise", id = TODO_NPC("Bowen Brisboise"), name = "Bowen Brisboise", title = "Tailoring Trainer",
  bible = "bibles/uc_brisboise.md", role = "trainer", tier = "service",
  communities = { "undercity" }, temper = { "fussy", "proud" }, values = { "precise" },
  notices = { "craft", "gear" },
  impression = {
    first = "Bowen Brisboise teaches tailoring in the Undercity and visibly winced at my clothes. He once made coats for the court, and he still judges everyone by the cut of their seams.",
    third = "{name} met Bowen Brisboise, the Undercity's tailoring trainer and a former court tailor.",
  },

  greetings = {
    { id = "g_default", text = "Oh dear. Oh dear, oh dear. Come in, and let's see what can be done." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned, and your hem is still crooked. Some things never change." },
  },

  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor! Your stitches are a little loose at the shoulder, but the instinct is there." },
    { id = "n_naked", cat = "gear", when = { nearlyNaked = true },
      text = "Where are your clothes? No, don't tell me; just let me find you something before I faint." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Bowen Brisboise, tailor. I made coats for the court of Lordaeron, back when the court still needed coats, and now I teach the Forsaken to sew, which is a different sort of challenge." },
        { id = "h_woman", when = { gender = "female" }, text = "Madam, that cloak does nothing for your shoulders, and I say that with great respect. Let me show you what a proper cut can do." },
      },
      again = {
        { id = "h_again", text = "Something else? I've a robe on the table that needs its sleeves reattached." },
      },
      choices = {
        { text = "You made coats for the court?", next = "court" },
        { text = "Why do the dead need tailors?", next = "dead" },
        { text = "Teach me tailoring.", next = "BUSINESS", when = { profession = "Tailoring" } },
        { text = "Good day, Bowen.", next = "END" },
      },
    },
    court = {
      lines = { { id = "co_default", text = "For the King's nobles and their wives, and once, a riding coat for Prince Arthas himself, in blue and gold. I wonder sometimes whether he wore it on his way north." } },
      choices = {
        { text = "Do you hate him for what he did?", next = "court_arthas" },
        { text = "Something else.", next = "BACK" },
      },
    },
    court_arthas = {
      big = true,
      lines = { { id = "ca_default", text = "I hate him with every stitch I've sewn since, and there have been a great many. I hope one day someone hangs him up in that riding coat, and I hope the seams hold." } },
      choices = {
        { text = "Hate him all you like, Bowen. He earned every stitch.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Hate won't mend anything, Bowen.", next = "BACK", fx = { align = { light = 1 } } },
      },
    },
    dead = {
      lines = { { id = "de_default", text = "Because we fall apart, my dear, and someone has to hold us together. A good robe hides a great deal, and the Forsaken have a great deal to hide." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "I wouldn't know. I only know fabric, and fabric never lies, which is more than I ever said for the court." } },
  },
}
