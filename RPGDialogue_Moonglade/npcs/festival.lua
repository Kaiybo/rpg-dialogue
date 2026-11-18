-- The Lunar Festival in Nighthaven: Fariel Starsong, Valadar's sister, who sells the festival's
-- fireworks, candles and finery. Voice: bibles/fariel.md
local P = RPGDialogueAPI:Pack("rpgd.moonglade")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Fariel Starsong, Lunar Festival Vendor
---------------------------------------------------------------------------
P:NPC {
  key = "fariel", id = TODO_NPC("Fariel Starsong"), name = "Fariel Starsong", title = "Lunar Festival Vendor",
  bible = "bibles/fariel.md", role = "vendor", tier = "service",
  communities = { "nighthaven" }, temper = { "cheerful", "chatty" }, values = { "family", "generous" },
  notices = { "race", "class" },

  impression = {
    first = "Fariel Starsong sells the Lunar Festival's rockets and candles beside her brother Valadar, and she laughs far more than he does. She thinks a festival for the dead ought to be the loudest night of the year.",
    third = "{name} met Fariel Starsong, who sells fireworks and festival finery in Nighthaven.",
  },

  greetings = {
    { id = "g_default", text = "Welcome, welcome! Mind the crates, because some are rockets and some are cakes, and I can never remember which." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "Happy new year, and Elune's light on you! The sky's been quiet for a whole twelvemonth, so let's make up for it tonight." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Either you liked the rockets, or you've come to complain about them, and I'm happy either way." },
    { id = "g_omen", when = { questActive = TODO_QUEST("Elune's Blessing") }, text = "Off to wake Omen, are you? Take more rockets than you think you'll need, because he never wakes as quickly as anyone hopes." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "A clear sky and the moon on the lake! You couldn't ask for a better night to set something on fire." },
  },

  notice = {
    { id = "n_gnome", cat = "race", when = { race = { "Gnome", "Dwarf" } },
      text = "Oh, please don't look too closely at my rockets. Your people make the best fireworks in the world, and I'm terribly afraid you'll find mine quaint." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "Valadar adores the tauren, you know, because you honour your elders all year round. I adore them because they always buy the biggest rockets." },
    { id = "n_lock", cat = "class", when = { class = "WARLOCK" },
      text = "No setting off rockets with fel fire, please. I had one go up green last year and the Keeper gave me such a look." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Fariel Starsong, Valadar's sister, and while he talks about the elders I sell everything you need to make them notice you: rockets, Elune's candles, festive clothes and a great many cakes. Ask me anything, so long as it isn't how many cakes I've eaten." },
        { id = "h_horde", when = { faction = "Horde" },
          text = "A guest from the Horde, and very welcome! For these few days the glade belongs to everyone, and I've never once asked a customer which banner they fight under, because a rocket doesn't care." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "One of the Circle, home for the festival! The druids here pretend they don't like the noise, but I've caught Loganaar, their trainer, watching the rockets with his mouth open." },
      },
      again = {
        { id = "h_again1", text = "What else can I tell you? I've got all night, and so has the moon." },
        { id = "h_again2", text = "Anything else? Ask quickly, before Valadar comes to fetch me for more cakes." },
      },
      choices = {
        { text = "Let me see your wares.", next = "BUSINESS" },
        { text = "What are the rockets for, really?", next = "rockets" },
        { text = "What are Elune's candles?", next = "candles" },
        { text = "You and Valadar seem very different.", next = "brother" },
        { text = "Dwarves and gnomes make fine fireworks too, you know.", next = "xtinker", when = { race = { "Dwarf", "Gnome" } } },
        { text = "Do the Forsaken have elders worth honouring?", next = "xforsaken", when = { race = "Scourge" } },
        { text = "A druid ought to be quiet at a festival, surely?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Elune's light on you, Fariel.", next = "END" },
      },
    },

    rockets = {
      lines = {
        { id = "r_default", text = "For the ancestors, of course! We light the sky so they can look down and see that the living still remember them, and if the light happens to be red and green and very loud, I don't think they mind." },
        { id = "r_night", when = { timeOfDay = "day" }, text = "They're best after dark, I'll warn you. In daylight they just go bang and leave a smell, and the hippogryphs complain to Sindrayl for an hour." },
      },
      choices = {
        { text = "Who makes them for you?", next = "rockets_make" },
        { text = "Do you really think the dead can see them?", next = "rockets_dead" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rockets_make = {
      lines = {
        { id = "rm_default", text = "I do, mostly, with powders I buy from a goblin in Everlook who swears every barrel is safe and then stands very far back when I open it. The rest is patience, and a good deal of luck, and eyebrows that grow back." },
      },
      choices = {
        { text = "Goblin powder in a druids' glade? Bold.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rockets_dead = {
      big = true,
      lines = {
        { id = "rd_default", text = "Valadar says it isn't about whether they see, it's about whether we remember. I say if I were an elder, I'd want a very large rocket in my honour and I'd be cross not to get one. What do you think, friend?" },
      },
      choices = {
        { text = "Remembering matters more than the show. Valadar's right.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If I were an elder, I'd want the biggest rocket you have.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    candles = {
      lines = {
        { id = "c_default", text = "Little candles blessed in Elune's name, and they burn bright enough to throw like a rocket. Folk who go down to the lake to wake Omen take them along, because they say Elune's own light sits better with him than gunpowder." },
      },
      choices = {
        { text = "Why would anyone want to wake Omen?", next = "candles_omen", fx = { learn = { "burning_legion" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    candles_omen = {
      lines = {
        { id = "co_default", text = "Because he wakes anyway, every new year, and it's kinder to meet him with a crowd and a blessing than to let him rage alone in the silt. Valadar can tell you the whole sad story, but I warn you, he'll want to tell you all of it." },
        { id = "co_low", when = { maxLevel = 50 }, text = "Not you, not yet, I hope! Omen was a hero of the War of the Ancients and he's terribly strong, so leave him to the grizzled ones and buy a few rockets for the shore instead." },
      },
      choices = {
        { text = "I'll ask Valadar about him.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    brother = {
      lines = {
        { id = "b_default", text = "Valadar's the solemn one and I'm the loud one, and we've kept the festival together for longer than either of us admits. He'll tell you the elders deserve reverence, and I'll tell you they deserve a party, and the truth is we're both right." },
      },
      choices = {
        { text = "Does he worry about Omen, too?", next = "brother_omen" },
        { text = "Does he really count the cakes?", next = "brother_cakes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    brother_omen = {
      big = true,
      lines = {
        { id = "bo_default", text = "Every year, whether quieting him is mercy or cruelty, and every year I tell him the same thing: Elune blessed Omen, and Elune doesn't make mistakes. I think Omen's spirit gets a little lighter each time we send him back down, though I've never said so to his face." },
      },
      choices = {
        { text = "Trust Elune's blessing. It's mercy, as you say.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A blessing that won't let him die sounds like a curse.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    brother_cakes = {
      lines = {
        { id = "bc_default", text = "He swears every year that we'll bake fewer, and every year the line of hungry tauren and dwarves is longer, so I bake more. He always eats the first three himself, and then he says the batch is too large." },
      },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },

    -- who the player is
    xtinker = {
      big = true,
      lines = {
        { id = "xt_default", text = "Oh, I know, and I'm hopelessly jealous! A gnome told me last year that my blue rocket was 'charmingly rustic', and I've been trying to decide ever since whether that was a compliment. Be a friend and tell me, are mine any good?" },
      },
      choices = {
        { text = "They're lovely. Craft made with joy beats precision.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Honestly? They'd never pass inspection in Ironforge.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xforsaken = {
      lines = {
        { id = "xf_default", text = "Oh, I think you of all people might have more of them than most, since everyone you lost is an elder now, in a way. I can't pretend to know what it's like, but the festival doesn't ask whether your heart still beats, only whether you remember." },
      },
      choices = {
        { text = "I remember them. That's the hard part.", next = "xforsaken_rem" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xforsaken_rem = {
      big = true,
      lines = {
        { id = "xfr_default", text = "Then light a rocket for them anyway, and let it be hard. Valadar says grief is only love with nowhere to go, and I've always thought a rocket gives it somewhere to go, even if it's only up." },
      },
      choices = {
        { text = "I'll light one for them, then.", next = "BACK", fx = { affinity = 2, align = { light = 1 } } },
        { text = "The dead are gone. Rockets won't change that.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = {
        { id = "xd_default", text = "Quiet? At the new year? Remulos himself watches the rockets from the shrine, I've seen him, and I'm sure Cenarius enjoyed a bang now and then. Balance means a little noise as well as a lot of silence, don't you think?" },
      },
      choices = {
        { text = "Balance needs a celebration now and then. Agreed.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "The glade's quiet should be kept. Fire them over the lake.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_bg", text = "Valadar and I came to Nighthaven to keep the festival, and I've stayed for the rockets. He'd say he stayed for the elders, but I've seen him eat the cakes." } },
    advice = { { id = "tp_ad", text = "Never light a rocket while you're holding it, never stand downwind of Omen, and always save one cake for the walk home." } },
    _none = { { id = "tp_none", text = "I haven't the faintest idea, I'm afraid! Ask Valadar; he knows everything solemn, and most things that aren't." } },
  },
}
