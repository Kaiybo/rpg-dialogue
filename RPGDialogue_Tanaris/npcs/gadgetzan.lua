-- Gadgetzan: the Steamwheedle Cartel's desert town. Voice: bibles/tanaris.md
-- Neutral ground: both factions talk to everyone here.
local P = RPGDialogueAPI:Pack("rpgd.tanaris")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "marin", id = TODO_NPC("Marin Noggenfogger"), name = "Marin Noggenfogger",
  bible = "bibles/tanaris.md", role = "vendor", tier = "major",
  communities = { "gadgetzan" }, temper = { "eager" }, values = { "ambitious", "practical" },
  notices = { "purse", "drink" },

  impression = {
    first = "Marin Noggenfogger talks about his elixir the way some people talk about their children, side effects and all. He was sweating, cheerful and already pricing me as a customer.",
    third = "{name} met Marin Noggenfogger, the goblin alchemist who runs Gadgetzan and dreams of a fortune in elixirs.",
  },

  greetings = {
    { id = "g_heat", text = "Hot, hot, hot, every single day it's hot, pal! Come in out of the sun, come in, because I've got something to tell you about, and it's an investment opportunity." },
    { id = "g_back", when = { metBefore = true }, text = "My favorite partner in progress! Well, partner's a strong word, so let's say associate, or customer at the very least!" },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and it's been hot every single day of it, you'll be shocked to hear! Come in, come in, because I've made improvements since you left, mostly to the side effects." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Look at you, you've grown into a proper adventurer since we last spoke, and that's exactly the sort of person who needs an elixir. Stronger customers make braver test subjects, I always say, and braver test subjects make better advertising." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "Word around town is that you sold somebody a story they bought whole, and in Gadgetzan that's practically a trade license. Just remember my bruisers keep the peace, and the peace includes my customers." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear you talked someone round in town, and that's a talent I respect, because half my business is persuasion and the other half is the elixir, and the elixir's the easy part." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "Now that is a well-stuffed purse, friend! Have you ever thought about investing in liquid refreshment, the kind with side effects? Only minor ones, and they're all in the small print!" },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ah, you've been at the Road Warrior's ale, I see, which is strictly amateur hour, pal. Wait until you try my elixir, which costs more and does more!" },
  },

  start = "hello",
  nodes = {
    xpt_marin = {
      big = true,
      lines = { { id = "xpt_marin_default", text = "My bruisers keep the peace, friend, and peace is the best business there is in this desert. You'd be amazed how polite a company becomes once it learns that drawing steel on my streets costs more than anything it could steal, plus a cleaning fee." } },
      choices = {
        { text = "Your rules keep trade honest, Baron. I'll keep them.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rules for us and gold for you. We'll do as we please.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Well, you might shrink, which makes you harder to hit, or you might float, which makes you very hard to reach! The skeleton effect's not much use in a brawl, but I've seen a Wastewanderer run screaming from it, so I'm calling it a feature." } },
      choices = {
        { text = "I'll win my fights with my own strength, not a bottle.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Any edge in a fight is worth taking, even a strange one.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Only on one hyena, and it was entirely voluntary, in the sense that it ate the bottle. It turned into a skeleton for an hour and then trotted off into the dunes looking very pleased with itself, so I've written that down as a success." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Not {pet}, of course, I wouldn't dream of it, unless you were offering, in which case I'd dream of it quite a lot." },
      },
      choices = {
        { text = "Leave the beasts out of your experiments, Marin.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A beast's as fair a test as any goblin.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Harm is a strong word, friend, and I prefer to call them surprises, because nobody's died of my elixir that I know of, and I'd know, because they'd ask for a refund. A few have walked about looking like your Forsaken cousins for an hour or so, and the Bruisers have asked me to keep them out of the square." } },
      choices = {
        { text = "Then warn your buyers plainly. Their bodies deserve that respect.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A little death never hurt anyone. I'll take a bottle.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Dew collector glands, mostly, from the thistleshrubs out in the valley, plus a few trade secrets that I'd sell you for a very large sum. The shrubs don't miss the glands, I'm told, or if they do, they haven't filed a complaint." } },
      choices = {
        { text = "Those shrubs are living things. Take only what you need.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If it sells, harvest away. The desert's big.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "That's because you're thinking like a rogue! A poison does one thing and does it badly, but my elixir does several things and does them interestingly, and only one or two of them involve becoming a skeleton for a while." } },
      choices = {
        { text = "You should test it properly before you sell it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Sell it now. Let the buyers take the risk.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Polymorph turns a man into a sheep for a minute, and he hates you forever after. My elixir turns him into a skeleton, and he pays me for the privilege and comes back for more, so tell me, pal, which of us has the better business sense?" } },
      choices = {
        { text = "Magic should never be sold like a cheap tonic.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Fair point. Coin talks louder than spells.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else, Marin.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Need is a strong word, though a few have turned into skeletons for an afternoon, and one fellow shrank so small he fell through a crack in the floorboards. They all came back to normal, mostly, so I'd call it a natural process with very dramatic side effects." } },
      choices = {
        { text = "Test your brews on willing folk only, Marin, and warn them plainly.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Anyone who drinks a goblin's elixir knows the risk.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Safe is a big word for the desert, friend, where the water will kill you slower than the bandits do. I tell every buyer it might turn them into a skeleton for a bit, it's right there on the label, and they buy it anyway, so who am I to stand between a customer and his money?" } },
      choices = {
        { text = "Someone ought to set rules for what goblins sell.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A buyer who's been warned fairly can drink what he likes.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "I thought about it, believe me, but Sprinkle said if I fed a single drop to an imp she'd stop fixing my recipes, and I need her more than I need the data. Besides, who knows what an imp turns into, and I'd hate to find out at the bar." } },
      choices = {
        { text = "Listen to Sprinkle. Some experiments shouldn't be run.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Test it on mine. I'm curious too.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_marin", tags = { "news" }, when = { party = { size = 4 } },
          text = "Well now, a whole company at once! Gadgetzan loves a crowd with full purses, and I love Gadgetzan, so you'll understand why I'm smiling and doing sums." },
        { id = "h_default", key = true,
          text = "Marin Noggenfogger, alchemist and businessgoblin, at your service, pal! I'm working on an elixir that's going to make me rich, and maybe leave you a bit thirstier, but that's a small price, and it's going to be a very reasonable price." },
        { id = "h_water_resolved", tags = { "news" }, when = { thread = { id = "gadgetzan_water", state = "resolved" } },
          text = "The Bruisers are walking the pipes now, pal, and grumbling about the sun, and the overhead is every bit as bad as I said it would be. Bilgewhizzle smiled at me on Tuesday, though, so I'm writing the whole thing down as an investment." },
        { id = "h_water_soured", when = { thread = { id = "gadgetzan_water", state = "soured" } },
          text = "The Wastewanderers took the first payment and asked when the second was due, which I suppose is what you'd expect from a valued business partner. Don't tell Bilgewhizzle I said so, pal, because he's insufferable enough already." },
        { id = "h_thirsty", tags = { "news" }, when = { questActive = TODO_QUEST("The Thirsty Goblin") },
          text = "The dew collectors out in Thistleshrub Valley, southwest of here, carry a gland full of the stuff. Bring me one, buddy, and try not to squeeze it on the way, because a squeezed gland is a gland I can't sell." },
        { id = "h_taste", when = { questActive = TODO_QUEST("In Good Taste") },
          text = "It works, but it tastes like a boot, and boots don't sell, so take it to Sprinkle. She knows how to make awful things palatable." },
        { id = "h_delivery", when = { questActive = TODO_QUEST("Delivery for Marin") },
          text = "Sprinkle's powder! She says I owe her for it, and she always says I owe her, and the trouble is she's usually right, down to the copper." },
        { id = "h_elixir", when = { questActive = TODO_QUEST("Noggenfogger Elixir") },
          text = "This is it, the finished thing, the product! Drink one and tell me what happens; I'll take notes, and I'll stand back a little while I do, in case of explosions." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Noggenfogger Elixir"), days = 3 } },
          text = "You drank it and you're still the right size, or mostly the right size, anyway! I'm putting you in the advertisements, pal, and you won't even have to sign anything, well, much." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! Perfect, a customer who knows herbs, and my elixir is mostly natural, you know, apart from the bits that aren't." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! You lot know your poisons, so you'll appreciate what I'm doing with my elixir, which is very nearly not a poison at all, most of the time." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, eh? Don't go telling me magic does it better, because I've heard that, and magic doesn't come in a bottle you can sell for forty silver with a markup." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Now, some of my customers come out of a dose looking a little, shall we say, skeletal, and I'd love to know whether that troubles a Forsaken or flatters one." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Now, before you say anything, I've had no complaints about the elixir that a little healing didn't fix, and that's practically a recommendation." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! Don't look at me like that, sweetheart, because the elixir is perfectly legal in Gadgetzan, and I checked, twice, and paid somebody to check a third time." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! You look like you could drink a whole bottle of my elixir and still swing that sword, which is exactly the sort of testimonial I'm after." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, and with a beast! Tell me, pal, have you ever wondered what my elixir would do to an animal, purely in the name of science and possibly a second product line?" },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Now there's a customer who understands side effects. You've seen what happens when a little power goes a long way, so you'll appreciate my elixir better than most." },
      },
      again = {
        { id = "h_again", text = "More questions? Ask them in the shade, then, because everything's better in the shade, and the shade's free, for now." },
        { id = "h_again2", text = "Yes, yes? Go on, I'm listening, even if I'm also sweating and doing arithmetic." },
      },
      choices = {
        { text = "What exactly goes into your elixir, Marin?", next = "druid_q", when = { class = "DRUID" } },
        { text = "What does the elixir do?", next = "elixir" },
        { text = "How do you stand the heat?", next = "heat" },
        { text = "What's Sprinkle to you?", next = "sprinkle" },
        { text = "How's business?", next = "business" },
        { text = "Alchemist to alchemist: what's in it?", next = "recipe", when = { profession = "Alchemy" } },
        { text = "Slow fall? I can do that already.", next = "slowfall", when = { class = "MAGE" } },
        { text = "Sprinkle calls you Noggy.", next = "noggy", when = { heardLine = "sprinkle.n_default" } },
        { text = "I could ask the spirits for rain, you know.", next = "x_shaman", when = { class = "SHAMAN" } },
        { text = "Do the Sandfury trolls give you trouble?", next = "x_troll", when = { race = "Troll" } },
        { text = "A gnome could improve that elixir.", next = "x_gnome", when = { race = "Gnome" } },
        { text = "Your elixir sounds a lot like a poison to me.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Polymorph does better than your elixir, Marin.", next = "xmage", when = { class = "MAGE" } },
        { text = "Do your customers ever need healing after the elixir?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Does your elixir ever do real harm, Marin?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Is your elixir safe enough to sell, Marin?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would your elixir help me in a fight, Marin?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "You haven't actually tested the elixir on animals, have you?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Have you ever tested the elixir on a demon, Marin?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "We're here on business, Baron. Keep your bruisers off us.", next = "xpt_marin", when = { party = { size = 4 } } },
        { text = "I've heard everyone's sums on the Wastewanderers, Baron.", next = "water_word",
          when = { thread = { id = "gadgetzan_water", beat = "b5_marin", state = { "stirring", "unfolding" } } } },
        { text = "Good luck with it.", next = "END" },
      },
    },
    elixir = {
      big = true,
      lines = {
        { id = "e_default", text = "It refreshes you, mostly, though sometimes you shrink, or float a bit, or come out looking like a skeleton for a while. All very temporary, I'm almost sure, and nobody's sued yet!" },
      },
      choices = {
        { text = "Almost sure?", next = "elixir_safe", fx = { trait = { cautious = 1 } } },
        { text = "I'll take a dozen.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "I'll pass.", next = "BACK", fx = { affinity = -1, trait = { cautious = 1 } } },
      },
    },
    water_word = {
      big = true,
      lines = { { id = "ww_default", text = "Then sit in the shade and give me yours, pal, because the Cartel wants an answer by the end of the quarter and the quarter's already sweating. Do I pay the Wastewanderers to stay off the springs, the way the Cartel pays the Southsea, or do I put Bruisers out at Waterspring Field and eat the overhead?" } },
      again = { { id = "ww_again", text = "So, pal, do I pay the bandits or guard the pipes? The quarter isn't getting any cooler." } },
      choices = {
        { text = "Guard your own water. Pay a bandit once and you've hired him.", next = "water_guard",
          fx = { thread = { id = "gadgetzan_water", state = "resolved" }, affinity = 2, align = { honor = 1 }, standing = { gadgetzan = 2 } },
          journal = { first = "Told Baron Noggenfogger to put the Bruisers on the pipes and pay the Wastewanderers nothing. He complained about the overhead and wrote it down anyway.",
                      third = "{name} counselled Marin Noggenfogger to guard Gadgetzan's water instead of paying the Wastewanderers." } },
        { text = "Pay them. It's cheaper than a war in the sand.", next = "water_pay",
          fx = { thread = { id = "gadgetzan_water", state = "soured" }, affinity = 1, align = { honor = -1 }, trait = { skeptical = 1 } },
          journal = { first = "Told Baron Noggenfogger to pay the Wastewanderers off, the way the Cartel pays the Southsea. He liked the arithmetic.",
                      third = "{name} counselled Marin Noggenfogger to pay the Wastewanderers off." } },
        { text = "What does Bilgewhizzle say?", next = "water_chief" },
      },
    },
    water_chief = {
      lines = { { id = "wc_default", text = "He says if I pay the Wastewanderers a single copper he'll pack up his pumps and move to Ratchet, and he's said that every quarter since I've known him. He also says the Bruisers would rather stand in the shade than at a pipe, and on that, I'll admit, he's got me." } },
      choices = { { text = "Then here's my answer.", next = "water_word" } },
    },
    water_guard = {
      lines = { { id = "wg_default", text = "Overhead, overhead, it's always overhead with you heroes, but I can't say your sums are wrong. I'll tell the Cartel the Bruisers walk the pipes from now on, and I'll tell Bilgewhizzle it was his idea, because then he'll stop sulking long enough to fix a pump." } },
      choices = { { text = "Good luck, Baron.", next = "END" } },
    },
    water_pay = {
      lines = { { id = "wp_default", text = "Now that's arithmetic I like, pal, and it's arithmetic the Cartel likes too, which is either very good news or very bad. I'll send somebody out to the camps with an offer, and I'll send somebody braver to tell Bilgewhizzle." } },
      choices = { { text = "...", next = "END" } },
    },
    elixir_safe = {
      lines = { { id = "es_default", text = "Well, nobody's stayed a skeleton and nobody's stayed small. One fellow stayed very cheerful for a week, but that might have been unrelated." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    heat = {
      lines = { { id = "ht_default", text = "I don't, pal, I complain, because complaining is how a goblin cools down for free! I'm also developing a drink for it, since everything comes back to the drink, and the drink comes back to money." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    sprinkle = {
      lines = { { id = "sp_default", text = "She's my friend, my very good friend, who fixes my recipes and reminds me what I owe her every single day, with numbers." } },
      choices = {
        { text = "Just a friend?", next = "sprinkle_friend", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sprinkle_friend = {
      lines = { { id = "sf_default", text = "Is it hot in here? It's hot in here, isn't it, so next question, and quickly, please." } },
      choices = { { text = "Ha. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    business = {
      lines = { { id = "b_default", text = "The Cartel takes a cut, the Water Company charges for every cup, and I'm about to sell the cure for both. Business is wonderful, friend, or it will be any day now, by my mother's ledger." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "steamwheedle" } } } },
    },
    recipe = {
      lines = { { id = "r_default", text = "Dew from a desert plant that refuses to die, and a little something to stop it tasting of feet. The rest is a trade secret, worth a fortune, and also I lost the notes." } },
      choices = {
        { text = "You lost the notes?", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Sprinkle already told me the secret ingredient, Marin.", tag = "Deceive", next = "secret",
          check = { pass = { any = { { trait = "witty" }, { class = "ROGUE" }, { disposition = { min = 60 } } } } },
          fail = { next = "secret_no", fx = { affinity = -1 } } },
      },
    },
    slowfall = {
      lines = { { id = "sl_default", text = "Yes, and you have to learn it, pal, for years, unpaid! Mine comes in a bottle, and anybody can drink a bottle, so that's the whole business right there." } },
      choices = { { text = "Fair point.", next = "BACK", fx = { affinity = 1 } } },
    },
    noggy = {
      lines = { { id = "ng_default", text = "She does, and only she does, not you and not anybody else. That's... well, that's an arrangement we have." } },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 2 } } },
    },
    secret = {
      lines = {
        { id = "se_default", text = "She did? She never tells anyone! Well, then you know the truth: without Sprinkle's little something from when she was a girl, the elixir tastes like a boot, and I'd be selling boot water to thirsty people and going broke doing it, so don't tell her I said so." },
        { id = "se_taste", when = { questDone = TODO_QUEST("In Good Taste") },
          text = "Oh, of course she did, you helped her with it! Then you know that without her secret the elixir tastes like a boot, and the whole fortune's really half hers, which I'll deny if you repeat it." },
      },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    secret_no = {
      lines = {
        { id = "sn_default", text = "Ha! Sprinkle wouldn't tell her own mother that recipe, and she likes her mother. Nice try, friend, and a very goblin one." },
        { id = "sn_gnome", when = { race = "Gnome" },
          text = "Sprinkle, telling a gnome her secret? She'd sooner print it in the newspaper, so nice try, but no." },
      },
      choices = {
        { text = "It was worth a try.", next = "BACK" },
      },
    },
    x_shaman = {
      lines = {
        { id = "xs_default", text = "Rain, over Gadgetzan? You'd put the Water Company out of business by suppertime, and then who'd be left to buy my elixirs? Mind you, if your spirits ever want to knock a few degrees off this oven, I'll sign whatever contract they like." },
      },
      choices = {
        { text = "The spirits aren't for hire, Marin.", next = "BACK", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Everything's for hire in Gadgetzan. Make me an offer.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "What would you even pay a rainstorm?", next = "x_shaman_pay" },
        { text = "Never mind the weather.", next = "BACK" },
      },
    },
    x_shaman_pay = {
      lines = { { id = "xsp_default", text = "In elixirs, naturally, since gold goes soft in this heat. I'm joking, mostly, though I did once try to bottle a dust storm and it blew the roof clean off, a perfectly good roof, and I'm still paying for it." } },
      choices = {
        { text = "I'll tell the spirits you made an offer.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else, Marin.", next = "BACK" },
      },
    },
    x_troll = {
      lines = {
        { id = "xt_default", text = "The Sandfury? They're nobody's cousins I'd invite in, and they treat the whole desert around Zul'Farrak as if it was theirs by right. You, on the other hand, are welcome to spend your coin here, because coin has never once asked me about tusks." },
      },
      choices = {
        { text = "The Sandfury are no kin of the Darkspear.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They hold the desert. Smart goblins would pay the toll.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_gnome = {
      lines = {
        { id = "xg_default", text = "A gnome in my laboratory, offering improvements? I've heard what happens when your people let an idea run away from them, and I've already got one of those bubbling on the stove." },
      },
      choices = {
        { text = "What does the elixir do to a gnome, anyway?", next = "x_gnome_size" },
        { text = "Suit yourself. Gnomish method would've made it great.", next = "BACK", fx = { affinity = -1, trait = { witty = 1 } } },
        { text = "I'll take your word for it. Something else.", next = "BACK" },
      },
    },
    x_gnome_size = {
      lines = { { id = "xgs_default", text = "Well, it shrinks some folks a little, and you're starting from very nearly the bottom of the scale already. I'd want you sitting down, with a goblin nearby who can do sums, before you so much as sniffed it." } },
      choices = {
        { text = "I'll take my chances.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "On second thought, no.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Ask me anything, anything at all, as long as we stay in the shade while I answer it!" },
      { id = "tp_knows_warm", when = { disposition = { min = 70 } },
        text = "For you, friend, I'll answer anything, and I'll even stop sweating long enough to do it properly." },
    },
    background = { { id = "tp_ba", text = "I was born poor, then I got thirsty, then I got ideas. The ideas are going to make me rich, pal; the thirst is still working on it." } },
    advice = { { id = "tp_ad", text = "Carry twice the water you think you need, and buy it from me... well, from the Water Company for now, but I'm working on that." } },
    steamwheedle = { { id = "tp_cartel", text = "The Cartel takes its cut, the Bruisers keep the peace and I keep inventing, so everybody wins, and me most of all, eventually, after expenses." } },
    _none = { { id = "tp_none", text = "No idea, friend, but is it thirsty? Then I might have something for it, at a very fair price." } },
  },
}

P:NPC {
  key = "sprinkle", id = TODO_NPC("Sprinkle"), name = "Sprinkle",
  bible = "bibles/tanaris.md", role = "citizen", tier = "quest",
  communities = { "gadgetzan" }, temper = { "warm" }, values = { "loyal", "generous" },
  notices = { "craft" },

  impression = {
    first = "Sprinkle calls everyone sweetie and believes that anything can taste good with the right ingredient. She lets Marin think he runs their partnership, and seems to enjoy it.",
    third = "{name} met Sprinkle, the warm-hearted goblin of Gadgetzan who fixes food that tastes wrong.",
  },

  greetings = {
    { id = "g_kitchen", text = "Hello, sweetie! You look like someone who hasn't eaten anything that tasted good in a week, and that's a crime I can fix for a few coppers." },
    { id = "g_away", when = { away = 14 }, text = "Sweetie, you've been gone {away}, and look at you, you're all bones and sunburn! Sit down and let me fix you something that sticks." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "My, haven't you grown since you were last in my kitchen, sweetie, and I don't mean taller. You'll be wanting a bigger plate now, so I'll find one, and I won't even charge you for the plate." },
    { id = "g_word_pleased", when = { word = "pleased" }, text = "Somebody came by the kitchen today just beaming about you, sweetie, and I do love good news with my baking. Whatever you told them, it went down better than my scorpid stew." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Then you know the secret, sweetie: anything at all can taste good, if you find the right ingredient, and the right ingredient is worth more than gold." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Something heavy that stays put, sweetie, like a good roast with plenty of salt, because the sun sweats it all out of you by noon. I tell Noggy the same thing, and he eats a biscuit and wonders why he faints in the lab." } },
      choices = {
        { text = "A soldier who doesn't eat properly is a soldier who falls.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I fight best hungry. It keeps me angry and sharp.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Sweetie, I can make anything taste good, though hyena wants a long soak and basilisk wants a very sharp knife. Scorpid's the surprise, because once the stinger's off it tastes a bit like crab from the coast." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I've saved scraps for hunters' beasts before, sweetie, and {pet} has the look of someone who'd never say no to a stockpot bone." },
      },
      choices = {
        { text = "Waste nothing from a kill. That honours the beast.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A kill's just meat. Honour doesn't come into the kitchen.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Every one of them, sweetie, whether they've coin or not, though don't tell Marin, because he thinks I charge, and he'd want his cut. You priests mend the body and the soul and I mend the stomach, and I'd say mine's the hardest job on a water ration." } },
      choices = {
        { text = "Feeding the hungry is holy work. Keep doing it, Sprinkle.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Charity on a water ration? The desert will punish that kindness.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Dries it, bakes it and fills it with grit, sweetie, and that's before the flies arrive. I keep my spices sealed in jars from Booty Bay, and still the sand finds its way in, as if it's hungry too." } },
      choices = {
        { text = "The land gives little here. Waste none of it.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the sand have its share. A little grit never hurt anyone.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "A cook always knows, sweetie, because you look at food the way I do, wondering what's been added. I'd ask you not to practice on anything in my kitchen, though, because Marin's experiments already give me enough to fix, and one of them blew the lid off my best pot." } },
      choices = {
        { text = "I'd never poison an innocent's food.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A weapon's a weapon, whatever it's mixed into.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else, sweetie.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Alive isn't the same as fed, sweetie, and anybody who's eaten my stew knows the difference. Still, in a drought like this I'll not turn my nose up at a mage's water, so long as you let me add a pinch of something to make it worth drinking." } },
      choices = {
        { text = "Food is for living, not for pleasure.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You're right. Food should be enjoyed.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More than you'd think, sweetie, because a goblin who won't pay a healer will still pay for soup, and that's just good business. I put a little something in it for the fevers and a little something for the taste, and between the two they mostly get better on their own." } },
      choices = {
        { text = "Leave real fevers to trained healers, Sprinkle.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Soup and kindness work fine. Folk don't need temple rules.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Cactus apples, mostly, and a little of what grows in the shade near the Gaping Chasm, though the bugs there bite through gloves. Everything out here's bitter, so you get out at dawn and pick before the sun ruins it." } },
      choices = {
        { text = "Share your recipes. Good food keeps people alive here.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Keep your secrets. A cook's recipes are her living.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Everyone who'll sit still long enough, sweetie, and plenty who won't. Noggy forgets to eat when he's brewing, the Bruisers forget when they're on watch, and somebody has to remember for all of them." } },
      choices = {
        { text = "That's good work, Sprinkle. Someone has to care for them.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Grown folk can feed themselves. Let them learn.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "It did, sweetie, and then it laughed about it, which was the part I minded most. Its master paid for the cloth and the biscuits, and I'll say he was very sorry, but I've kept a bucket by the door ever since." } },
      choices = {
        { text = "I'll keep mine outside, then. Your biscuits are safe.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "He'll behave. I won't leave him in the sun.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, sweetie? Then you'll know fire's the most important spirit in any kitchen, and I've a stove back here that could use a stern word from you." },
        { id = "h_default", key = true,
          text = "I'm Sprinkle, sweetie, and I fix things that taste wrong, mostly food, though lately it's mostly Marin's experiments. He calls it a partnership; I call it a favor he owes me, with interest, and I keep the books." },
        { id = "h_taste", tags = { "news" }, when = { questActive = TODO_QUEST("In Good Taste") },
          text = "Noggy's elixir tastes like a swamp? Of course it does, and swamp doesn't sell. There's a mushroom up in the Hinterlands that fixes anything, so bring me some, sweetie." },
        { id = "h_secret", when = { questActive = TODO_QUEST("Sprinkle's Secret Ingredient") },
          text = "When I was little I couldn't stand my sister's cooking. Then I found the secret ingredient, and suddenly I could. Fetch me some, would you?" },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "You know what goes in a drink to make it wrong, sweetie, I can see it on you. Well, I know what goes in to make it right again, so we'd make quite a pair, and quite a profit." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, sweetie! I've tasted conjured bread before, and I'm sorry to tell you it tastes of nothing at all, which is the worst thing food can taste of and the hardest thing to sell." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, sweetie? Sit a moment, because I always say a full belly makes the Light shine brighter, and I suspect the loa feel much the same way." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Oh, sweetie, bless whatever you like in here, but if you can bless Marin's samples into tasting better, I'll want to know how you did it." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "Oh, a warrior, sweetie, and you look half-starved! You can't hold off the Wastewanderers on an empty stomach, so tell me you've eaten something today that didn't come out of a tin." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! Now there's someone who brings dinner home, sweetie, and I'd love to see what you've caught out in those dunes." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Do you know which desert plants won't kill a person, sweetie? Because Marin says all of them are fine, and Marin is a liar when there's money on the line." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, sweetie! You'll want something hot and heavy before you march off into the sand, though not too heavy, or you'll sink." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock, sweetie? You can eat at my table, but your little friend can wait outside, because the last imp in here ate a whole tray of biscuits, set the tablecloth on fire and never paid for either." },
      },
      again = { { id = "h_again", text = "Anything else, sweetie?" }, { id = "h_again2", text = "Go on, sweetie; I'm stirring, but I can listen." } },
      choices = {
        { text = "Which desert plants do you cook with, Sprinkle?", next = "xdruid", when = { class = "DRUID" } },
        { text = "What does the desert do to food, Sprinkle?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Noggy?", next = "noggy" },
        { text = "What's the secret ingredient?", next = "secret" },
        { text = "What's Marin like?", next = "marin" },
        { text = "Tell me about your sister's cooking.", next = "sister" },
        { text = "Trade a recipe?", next = "trade", when = { profession = "Cooking" } },
        { text = "Hinterlands cooking, is it? I know Wildhammer cooking.", next = "x_dwarf", when = { race = "Dwarf" } },
        { text = "You can tell I use poisons?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Conjured bread keeps you alive. Stop sneering at it.", next = "xmage", when = { class = "MAGE" } },
        { text = "Do the sick in Gadgetzan come to you, Sprinkle?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do you feed the folk who come in from the desert, Sprinkle?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What should a warrior eat before a long fight, Sprinkle?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Can you really make desert meat taste good, Sprinkle?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do you look after many folk in Gadgetzan, Sprinkle?", next = "xapala", when = { class = "PALADIN" } },
        { text = "An imp really set your tablecloth on fire, Sprinkle?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Thanks, Sprinkle.", next = "END" },
      },
    },
    noggy = {
      lines = { { id = "n_default", key = true, text = "That's my name for him. Mine. If anyone else calls him that, they'll be tasting my cooking without the secret ingredient." } },
      choices = { { text = "Understood.", next = "BACK", fx = { affinity = 2 } } },
    },
    secret = {
      lines = { { id = "s_default", text = "If I told you, it wouldn't be a secret, would it? It would just be an ingredient. Nobody gets excited about an ingredient." } },
      choices = {
        { text = "Fair.", next = "BACK", fx = { affinity = 1 } },
        { text = "Not even a hint?", next = "secret_hint" },
      },
    },
    secret_hint = {
      lines = { { id = "sh_default", text = "It grows somewhere green and far away from here. That's more than Noggy knows." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    marin = {
      lines = { { id = "m_default", text = "He's clever, sweaty, and always one bottle away from a fortune, and he owes me for every one of those bottles. I keep a list with the interest worked out, and he hates the list." } },
      choices = {
        { text = "Will he ever pay you back?", next = "marin_pay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    marin_pay = {
      lines = { { id = "mp_default", text = "Oh, he pays, sweetie, in stories and in promises, and once in a very nice hat, which I've added to the ledger at full value and I'm keeping." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sister = {
      lines = { { id = "si_default", text = "Dreadful, but lovingly dreadful; she'd boil anything that stood still. I learned to cook so I'd survive, and I learned to fix food so I'd survive her." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    trade = {
      lines = { { id = "t_default", text = "A cook who shares! All right, sweetie: a pinch of salt in anything sweet, and a squeeze of lemon in anything that came out of a swamp. That one's free, but the secret would cost you more than Noggy's whole laboratory." } },
      choices = { { text = "Thank you.", next = "BACK", fx = { affinity = 2 } } },
    },
    x_dwarf = {
      lines = {
        { id = "xd_default", text = "Now who told you that, sweetie? Never mind, I can see it in the beard, and I'll tell you what I tell Noggy: you can taste the hills in it all you like and still never guess the rest." },
        { id = "xd_wild", when = { origin = "dwarf_wildhammer_kin" }, text = "Wildhammer, are you? Then you've eaten off those hillsides yourself, so you'll understand why I won't say another word about it, not even to family." },
      },
      choices = {
        { text = "Keep your secret. A cook's entitled to one.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Just one hint, and I'll stop guessing.", next = "x_dwarf_hint" },
        { text = "Something else, Sprinkle.", next = "BACK" },
      },
    },
    x_dwarf_hint = {
      lines = { { id = "xdh_default", text = "One, then, because you asked so nicely: it grows where the mornings are cold and the afternoons are warm. Noggy has never been anywhere like that in his life, which is exactly how I like it." } },
      choices = {
        { text = "Ha. Your secret's safe with me.", next = "BACK", fx = { affinity = 1 } },
        { text = "That narrows it down to half of Azeroth.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I hear all sorts of things, mostly from Noggy when he's excited. Ask me, and I'll sort out the useful bits for you." },
    },
    background = { { id = "tp_ba", text = "I grew up with a sister who couldn't cook and a stubborn tongue, sweetie, and one of those made me a cook, and the other made me good at haggling." } },
    advice = { { id = "tp_ad", text = "If something tastes wrong, it's missing one thing, sweetie, so find that one thing and don't go adding six." } },
    _none = { { id = "tp_none", text = "Couldn't say, sweetie. Can I get you something to eat instead? It's the best value in Gadgetzan." } },
  },
}

P:NPC {
  key = "bilgewhizzle", id = TODO_NPC("Chief Engineer Bilgewhizzle"), name = "Chief Engineer Bilgewhizzle",
  bible = "bibles/tanaris.md", role = "questgiver", tier = "quest",
  communities = { "gadgetzan" }, temper = { "harried" }, values = { "practical", "proud" },
  notices = { "craft", "kit" },

  impression = {
    first = "Chief Engineer Bilgewhizzle watches his pressure gauge the way other men watch the sky for storms. In a desert town he keeps the water flowing, and it shows on his face.",
    third = "{name} met Chief Engineer Bilgewhizzle, the harried head of the Gadgetzan Water Company.",
  },

  greetings = {
    { id = "g_water", text = "Water Company business only, please, pal. If you're here about the pressure, take a number, and the numbers cost a copper now, Cartel's orders." },
    { id = "g_away", when = { away = 14 }, text = "Oh, it's you, back after {away}. The pressure dropped twice while you were gone, and each drop cost me a day's profit, so if you've come to complain about the water, you're late, and you'll have to take a number." },
    { id = "g_word_helped", when = { word = "helped" }, text = "Word reached the office that you helped the town while I had my head in a pipe, and I appreciate it, pal. Gadgetzan runs on water and favors, and both are in short supply and very expensive." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Look at this pump, no, really look at it, and tell me it's not beautiful, and worth every one of the four thousand gold it cost. Then tell me why it isn't working." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The Wastewanders got you, eh, chum? They get everybody, so get yourself patched up, then go and get even, preferably near my pipes." },
  },

  start = "hello",
  nodes = {
    xpt_bilgewhizzle = {
      big = true,
      lines = { { id = "xpt_bilgewhizzle_default", text = "Nothing at all, as long as they stay out of my machinery, because a gnome builds to see if a thing can be done and a goblin builds to see if it'll pay. The pump that keeps this town alive has to do both, every single day, and it's over budget at both." } },
      choices = {
        { text = "A machine should work first and dazzle later.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Curiosity built Gnomeregan. Profit never invented anything.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xcl_zf = {
      big = true,
      lines = { { id = "xcl_zf_default", text = "Broken for a season, maybe, and a season is all the Water Company needs to run new pipe out toward the west, if the Cartel signs the requisition, which it won't. The Sandfury have been fouling springs out there since before I owned my first wrench, so you'll forgive me if I wait for the gauges before I celebrate." } },
      choices = {
        { text = "Strike now, while they're leaderless. Mercy only gives them time to regroup.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Let the survivors be. A beaten enemy deserves the chance to stay beaten.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Why do the Sandfury foul the springs at all?", next = "xcl_zf2" },
      },
    },
    xcl_zf2 = {
      lines = { { id = "xcl_zf2_default", text = "Because they figure the water was theirs before the Cartel ever sank a well, and between you and me, they're probably right. That doesn't change the fact that Gadgetzan dies in three days without it, so I keep the pumps running and let the historians argue." } },
      choices = {
        { text = "Then I'm glad someone keeps them running. Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Hyenas chew the seals, scorpids nest in the pump housings because it's cool in there, and I once found a basilisk sunning itself on the main valve like it paid for the privilege. Every one of them costs me a crew day, pal, and every crew day costs Gadgetzan water and me a reprimand." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "If {pet} fancies a bit of work, there's a hyena pack that's been sniffing round the north well every night, and I'd be glad if they found something else to sniff." },
      },
      choices = {
        { text = "The town's water comes first. Clear the pests off the pipes.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The beasts were here first. Build around them, not through them.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "If you can keep my crew standing in this heat, you'd be worth more to me than a new pump, and I don't say that lightly, because I've priced new pumps. The Wastewanderers jump them at the wells, and half come back cut up while the other half come back too scared to go out again." } },
      choices = {
        { text = "I'll tend your crew. A town's water is worth guarding.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let the weak ones fall. The desert keeps only the strong.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Sure they do, and they can line up behind Gadgetzan like everybody else. Every gallon a basilisk drinks is a gallon a paying customer doesn't, and the Company counts every one." } },
      choices = {
        { text = "Leave some for the wild. The desert was here first.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Gadgetzan comes first. The beasts can fend for themselves.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Deep wells, sunk through rock older than any of us, and pumps that cost more than this whole town, by my last copper. The water's down there, but it moves, and every year it moves a little further from where we've drilled, and every new well's another budget meeting." } },
      choices = {
        { text = "Water is a spirit, not a product. Treat it that way.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Water flows where it's paid to flow. Keep drilling.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It could, and it would ruin me doing it, because I can't sell water you can make for free, pal. Still, I'd rather have a mage on the walls than a Wastewander at the well, so you'll get no complaints from me about the conjuring, only about the price." } },
      choices = {
        { text = "Water should be free to all in a desert.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Someone has to pay for the wells and pipes.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let's leave the water alone.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "No, they're thieves, and you're a professional, which I'll grant is different. The Wastewander steal water pouches by the dozen and sell them back to us, and a rogue who knew their camps could cut that trade off at the root." } },
      choices = {
        { text = "I'd go after them for honest pay.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They're only surviving. A thirsty man steals water.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Badly enough that I've stopped sending anyone out alone, and that slows the work, and slow work means thirsty people and angry memos from the Cartel. Water is life out here in the plainest sense, so every man they put in a sickbed costs this town more than a broken pump ever could." } },
      choices = {
        { text = "Then I'll tend your workers first and fight the bandits second.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Heal them later; hit the bandits hard enough and they'll stop coming.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Nobody, most nights, and the Wastewanderers know it as well as I do. The Cartel pays for walls and Bruisers inside them, but a pipe runs across a lot of open sand, and I can't hire enough guards to stand on every yard of it on what they budget me." } },
      choices = {
        { text = "The Cartel should guard its own pumps. That's its duty.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Forget the Cartel. Arm your crew and let them fight back.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Maybe, but every time someone burns down a bandit camp, the Wastewanders move to the next spring and foul it on the way out. What I need is the water back, clean, not a lot of smoking sand where our sources used to be." } },
      choices = {
        { text = "Then I'll get your water back, and leave the springs clean.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Burn the camps. They'll learn not to come back.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_bilgewhizzle", tags = { "news" }, when = { party = { race = "Gnome" } },
          text = "Is that a gnome in your company? Tell {companion} to keep their hands off my water pump, because every gnome who comes through here wants to improve it, and I like it working." },
        { id = "h_cl_zf", tags = { "news" }, when = { cleared = "Zul'Farrak" }, text = "You've been to the bottom of Zul'Farrak and come back with your boots on, which is more than Sergeant Bly's crew can say. If Sandscalp's really dead, I can stop doubling the guard on the western pipes." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! Can you talk to water? Because I've got wells that have stopped listening to me, and the Wastewanders are sitting on the ones that still do." },
        { id = "h_default", key = true,
          text = "Water is everything out here, pal. The Water Company keeps Gadgetzan drinking at a fair price, and the Wastewander bandits keep stealing it, so guess which one of us is having a worse week." },
        { id = "h_water_resolved", tags = { "news" }, when = { thread = { id = "gadgetzan_water", state = "resolved" } },
          text = "Bruisers out at Waterspring Field, pal, actual Bruisers standing at my actual pumps, and the word in the office is that you talked the Baron into it. I've stopped doubling the night shift, and that's the first good news my budget's had all year." },
        { id = "h_water_soured", when = { thread = { id = "gadgetzan_water", state = "soured" } },
          text = "So we're paying the Wastewanders now, on your advice, I'm told. The Company buys back water it already owns from the bandits who stole it, and I get to explain that line in the ledger every quarter, so thanks, pal, thanks a lot." },
        { id = "h_justice", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Wastewander Justice") }, { questActive = TODO_QUEST("More Wastewander Justice") } } },
          text = "The Wastewanders camp around the water sources and take whatever they like, and every pouch is money out of the Company's pocket. Go and teach them about consequences, buddy, and teach them in bulk." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("More Wastewander Justice"), days = 3 } },
          text = "Pressure's up two notches since you thinned the Wastewanders, two whole notches! I nearly cried, and I'm an engineer, and engineers don't cry, not on the clock." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! I don't suppose you can talk a well into filling faster? No? Then I'll settle for you talking sense into the Wastewanders, because they've got our water and they don't share." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, and I suppose you're about to tell me you can make water out of thin air. Do you know what that does to a water company's quarterly projections, pal?" },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "Another sneak in my town. If you've been near the Wastewander camps, I'll want to know, and if you've been near my water tower, I'll want to know more, and I'll want it in writing." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Unless your prayers can raise the water pressure, I'll ask you to pray quietly, because my crew have been dropping from heatstroke and I need them on their feet." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, good. When the Wastewanderers hit a water pump, they hit the workers on it too, and I've had more of my crew bandaged this month than I've had pipes repaired." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin? The Bruisers keep order inside the walls, but out at the pumps it's just my crew and the sand, so I'll take any hammer the Light sends." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter? Good, because the Wastewanderers aren't the only ones drinking my water without paying, and I'd like the hyenas off my pipes as well." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. Keep your fire-breathing friends away from the water tower, pal, because steam and demons don't mix, and the last time something blew a valve it took three crews and a week's budget to fix." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Wastewander", min = 40 } }, text = "The Wastewanders have been keeping away from our pumps lately, and from what I hear, they've been keeping away from you. Pressure's holding, for once, and I'm not complaining." },
      },
      again = { { id = "h_again", text = "What else? Quickly, pal, the gauge is twitching, and a twitching gauge is about to be an expensive gauge." } },
      choices = {
        { text = "Where does Gadgetzan's water really come from?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "The desert's creatures need water too, Chief Engineer.", next = "druid_q", when = { class = "DRUID" } },
        { text = "How does a desert town get water?", next = "water" },
        { text = "Who are the Wastewanders?", next = "bandits" },
        { text = "Who runs the Water Company?", next = "company" },
        { text = "Let me look at that pump.", next = "pump", when = { profession = "Engineering" } },
        { text = "Point me at the Wastewanders, Chief.", next = "x_warrior", when = { class = "WARRIOR" } },
        { text = "Conjured water could save lives in a drought.", next = "xmage", when = { class = "MAGE" } },
        { text = "I'm no Wastewander, Bilgewhizzle.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "How badly have the Wastewanderers hurt your crew?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Could I help your crew, Bilgewhizzle?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Who guards your pumps when the Bruisers won't leave town?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What's been getting at the Water Company's pipes, Chief?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Could my magic help with the Wastewanders, Chief Engineer?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Chief Ukorz Sandscalp is dead, Bilgewhizzle. Zul'Farrak is broken.", next = "xcl_zf", when = { cleared = "Zul'Farrak" } },
        { text = "What do you have against gnomish engineers, Chief Engineer?", next = "xpt_bilgewhizzle", when = { party = { race = "Gnome" } } },
        { text = "Good luck with the pressure.", next = "END" },
      },
    },
    water = {
      lines = { { id = "w_default", text = "We've got towers out at Waterspring Field pulling it up from under the sand, and they're delicate machinery, very delicate, very expensive. Bandits are not delicate." } },
      choices = {
        { text = "I'll deal with the bandits.", next = "BACK", fx = { affinity = 2, standing = { gadgetzan = 1 } } },
        { text = "What happens if the towers stop?", next = "water_stop" },
      },
    },
    water_stop = {
      lines = { { id = "ws_default", text = "Then Gadgetzan finds out how much it loves gold when there's nothing to wash it down with. About three days, I'd guess, and I don't like guessing, because guesses don't go in a report." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bandits = {
      lines = { { id = "b_default", text = "Desert folk with guns and no water bill, who take a source and sell the water back to the caravans at a markup. It's almost good business, and I hate that it's almost good business." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    company = {
      lines = { { id = "c_default", text = "The Cartel owns it, I run it, and everybody in town complains about it and pays anyway. That's how you know it's working." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "steamwheedle" } } } },
    },
    pump = {
      lines = { { id = "p_default", text = "See the seal? There's sand in it, there's always sand, because you can't keep sand out of anything in Tanaris. I've stopped trying, pal, since it was costing a fortune, and now I build things that like sand." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    x_warrior = {
      lines = {
        { id = "xw_default", text = "Finally, somebody who looks like they hit things for a living instead of writing reports about it! The Wastewanders sit by our towers with our water in their bellies, so knock some sense into them, and please, please don't dent the pipes." },
      },
      choices = {
        { text = "I'll meet them in the open, where they can see me coming.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll hit their camps at night, while they sleep.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Tell me more first.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I've a desk full of reports and no time to read them, so I've memorized the important parts, meaning the numbers. Ask, quickly." },
    },
    background = { { id = "tp_ba", text = "I'm an engineer, a water engineer specifically, which in Tanaris makes me the most important goblin nobody ever thanks, or tips." } },
    advice = { { id = "tp_ad", text = "Never camp by a water source out there, pal. Somebody already has, and they've got a gun and a price list." } },
    _none = { { id = "tp_none", text = "Unless it's wet or it's billed, it's not my department." } },
  },
}

P:NPC {
  key = "fizzledowser", id = TODO_NPC("Senior Surveyor Fizzledowser"), name = "Senior Surveyor Fizzledowser",
  bible = "bibles/tanaris.md", role = "scholar", tier = "quest",
  communities = { "gadgetzan" }, temper = { "cautious" }, values = { "practical", "dutiful" },
  notices = { "craft" },

  impression = {
    first = "Senior Surveyor Fizzledowser keeps a map full of circles where water used to be, and he expects every simple job to go wrong. In fairness, out here, he's usually right.",
    third = "{name} met Senior Surveyor Fizzledowser, who searches the desert for new water on behalf of the Gadgetzan Water Company.",
  },

  greetings = {
    { id = "g_maps", text = "Careful with the maps, pal, because they cost the Company a fortune and every one of those circles is a place we used to have water." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = { "Engineering", "Mining" } },
      text = "You know the ground, or the gadgets, and either one helps, buddy; both would be a miracle, and miracles aren't in my budget." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More than I get, always, because the Wastewanderers watch the wells and they know a dowsing rod when they see one, and they know what it's worth. I've stopped marking the good sources where anyone can read them, which means some days I can't read them either." } },
      choices = {
        { text = "Keep your guards close and your maps closer. Caution wins.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Strike the bandits first, and the wells stay yours.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "That every beast in Tanaris knows where the water is before I do, which is humbling for a senior surveyor on a senior surveyor's wage. I've started following the hyenas, frankly, and they've been right more often than my rod has, and they work for free." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Does {pet} have a good nose? I only ask because I'd trade my dowsing rod for a beast that could smell a spring under the sand, pal, and the Company would probably give me a bonus for it." },
      },
      choices = {
        { text = "Share the water with the beasts. They found it first.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The town needs that water more than any hyena does.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Nothing makes them go better, in my experience, but a prayer might make them go less badly. Every circle on this map is a well that's dried up, been poisoned or been taken by the Wastewanderers, so I'd welcome the blessing of anything that can find water in sand." } },
      choices = {
        { text = "I'll bless your survey. Careful work deserves a careful prayer.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Forget your map. Water goes where it pleases, as I do.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Wrong is the polite word for it. Bugs that size don't just appear at a water hole, and Pestlezugg says they're organized, which is the last thing I wanted to hear from anybody." } },
      choices = {
        { text = "Study them first. We don't know what they are yet.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Burn their nests now, before anyone wastes time studying.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Maybe, though everything out here goes wrong for me sooner or later, so I'd expect the spell to find a Wastewander camp instead, or blow up. I've lost good surveyors to Thistleshrub and to bandits, and a fancy spell doesn't make the desert any kinder or the insurance any cheaper." } },
      choices = {
        { text = "Try new methods. The old way keeps failing.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Stick to your rods. They've worked for years.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else, please.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Quietly would be new, I'll grant you, because my lads go in loud and come out running, and they drop the expensive gear every time. If you can slip into a bandit camp and slip out again, you'd be the first plan of mine in a month that didn't go wrong." } },
      choices = {
        { text = "Leave the thieves alone. Your gear isn't worth blood.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Thieves deserve what's coming to them.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because out here water is gold, pal, and whoever controls the wells controls who lives in Tanaris. The Wastewanderers know that, which is why they hit the sources first and the caravans second, and why I expect every job to go wrong." } },
      choices = {
        { text = "Water should be shared under law, not seized by bandits.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Whoever can hold a well has earned it, I suppose.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "They point at something under Sandsorrow Watch, and I'd hoped it was water. Pestlezugg thinks the strange insects there came up from below, and if they did, I don't like to think what else might follow them." } },
      choices = {
        { text = "Then we should find out what's down there, carefully.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If something's below, I'd like to meet it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The Wastewanders, mostly, and the heat, and the bugs at Sandsorrow that don't look like any bug in my books. Two of my lads haven't gone back out since the last trip, even for hazard pay, and I can't say I blame them." } },
      choices = {
        { text = "Then I'll go out with them next time.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "They're paid to survey. Fear isn't an excuse.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Senior Surveyor Fizzledowser, of the Gadgetzan Water Company. The Wastewanders took half our sources, so I find new ones, which is slower than it sounds and costs more than the Company likes." },
        { id = "h_survey", tags = { "news" }, when = { questActive = TODO_QUEST("Gadgetzan Water Survey") },
          text = "Take the dowsing widget to Sandsorrow Watch and sample the pool there, and please, pal, don't drop it, because it's signed out in my name. It should be simple, but I say that about everything, and it rarely is." },
        { id = "h_lair", when = { questActive = TODO_QUEST("Noxious Lair Investigation") },
          text = "Giant insects, at a water hole? That's not natural, and it's definitely not in the budget. Bring me pieces from their lair; Pestlezugg can tell us what they are." },
        { id = "h_analysis", when = { questActive = TODO_QUEST("Insect Part Analysis") },
          text = "Is that Pestlezugg's report you've got there? Let me see... oh, oh dear, that's worse than I hoped, and I'd hoped for nothing at all." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, out here? If you can feel water under the sand, please tell me, because my dowsing widget certainly can't, and it cost the Company a fortune that's coming out of my bonus." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage. You'll be thinking you could find water with a spell faster than my rods, and I'll be the one who has to explain to the Company why nobody tried it sooner." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "You'd make a decent scout, if you can keep your head down. The Wastewander keep taking my survey gear, and my men keep getting caught trying to take it back, and the Company keeps billing me for both." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! I don't suppose the Light can find water, can it? No, I didn't think so, but you can stand next to me while I look, and that's nearly as good." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest. Well, I suppose if anything goes wrong on a survey, and something always does, it can't hurt to have one of you about." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, good, because my last survey party had three engineers and one Bruiser, and the Bruiser spent the whole trip complaining about his feet and claiming overtime. Please tell me your feet are fine." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter? Oh, good, someone who can read tracks, because half the water I find out there already has paw prints all round it." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. Please don't summon anything near my dowsing rods, pal, because they twitch at every strange thing, and I've already got a month of readings that point at demons and a boss who wants them explained." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, out here with the surveyors? Good, because my crew comes back from the dunes sunburnt and scared, and I'm a surveyor, not a nursemaid." },
      },
      again = { { id = "h_again", text = "Somethin' else? I'll mark it on a map, and the map goes on the expense report." } },
      choices = {
        { text = "Those insects at Sandsorrow Watch feel wrong to me.", next = "druid_q", when = { class = "DRUID" } },
        { text = "What are the insects?", next = "insects" },
        { text = "How do you find water in a desert?", next = "dowsing" },
        { text = "What happened to the old sources?", next = "maps" },
        { text = "Pestlezugg thinks they come from Un'Goro.", next = "ungoro", when = { heardLine = "pestlezugg.h_march" } },
        { text = "The earth would tell me where water runs.", next = "x_shaman", when = { class = "SHAMAN" } },
        { text = "Could magic really find water faster?", next = "xmage", when = { class = "MAGE" } },
        { text = "I could get your gear back quietly.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why would bandits steal water rather than gold?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would a prayer make your surveys go better, Fizzledowser?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "How many guards does a survey party really need, Fizzledowser?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What do the tracks around your water sources tell you?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Your dowsing rods point at demons, Fizzledowser?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What frightens your survey crews, Fizzledowser?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "I'll go and look.", next = "END", fx = { affinity = 1 } },
      },
    },
    insects = {
      big = true,
      lines = {
        { id = "i_default", text = "They're big, organized, and coming up out of the sand where they've no business being. I don't think this stops at Tanaris, though I'd love to be wrong." },
      },
      choices = {
        { text = "Let's find out.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Who else should know?", next = "insects_who" },
      },
    },
    insects_who = {
      lines = { { id = "iw_default", text = "Everyone with a city and a wall. I wrote to the Cartel, and the Cartel wrote back asking about the water, because the Cartel always asks about the water, and then about the cost of the letter." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dowsing = {
      lines = { { id = "d_default", text = "A widget, a lot of walking, and listening for the widget to stop screaming. When it stops, you dig, and when it starts again, you run, and you try not to leave the widget behind, because they're forty gold apiece." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    maps = {
      lines = { { id = "m_default", text = "Bandits sit on some, and the sand ate the others. Every circle on this map is a well we used to drink from and a line of lost income in somebody's ledger, and I keep them, because somebody should remember where the water was." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    ungoro = {
      lines = { { id = "u_default", text = "Pestlezugg reads more than I do. If he says the crater, I believe him, and I'm going to start sleeping with the lamp on." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_shaman = {
      lines = {
        { id = "xs_default", text = "Would it, now? My widget tells me the same thing, and I've learned not to trust the widget either. Tell your earth that the Wastewanders reached the last three springs before I did, so whatever it knows, someone's already drinking it." },
      },
      choices = {
        { text = "The spirits are uneasy here. Something's stirring under the sand.", next = "x_shaman_uneasy" },
        { text = "Keep your widget, then.", next = "BACK", fx = { affinity = -1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_shaman_uneasy = {
      lines = { { id = "xsu_default", text = "Uneasy is not a word a surveyor likes to hear, though it's the very word I'd use for those insects at Sandsorrow Watch. Tell me if your spirits say any more, would you, because I'd like it written down before anyone tells me I'm imagining things." } },
      choices = {
        { text = "I'll tell you what I hear.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Not everything fits in a ledger, surveyor.", next = "BACK", fx = { trait = { skeptical = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Surveyors see a lot of desert, and a lot of what's hiding in it. Ask, and I'll tell you what I've found." },
    },
    background = { { id = "tp_ba", text = "I'm a surveyor, pal: I go out with a widget, I come back with a map, and in between I try very hard not to be eaten, which isn't covered by the Company." } },
    advice = { { id = "tp_ad", text = "If the sand moves and there's no wind, walk the other way, buddy, and walk quickly." } },
    _none = { { id = "tp_none", text = "I haven't surveyed that, I'm afraid, or not yet, and not without a signed work order." } },
  },
}

P:NPC {
  key = "pestlezugg", id = TODO_NPC("Alchemist Pestlezugg"), name = "Alchemist Pestlezugg",
  bible = "bibles/tanaris.md", role = "vendor", tier = "quest",
  communities = { "gadgetzan" }, temper = { "brisk" }, values = { "curious", "practical" },
  notices = { "craft", "pet" },

  impression = {
    first = "Alchemist Pestlezugg keeps a rat named Rose for an assistant and seems to trust her more than most people. He is brisk, curious and a little too pleased by horrible discoveries.",
    third = "{name} met Alchemist Pestlezugg, the Gadgetzan alchemist who studies the desert's stranger creatures for the Water Company.",
  },

  greetings = {
    { id = "g_shop", text = "Vials, phials, the good flasks, whatever you're after, pal, priced fair and corked tight. Don't mind the rat; that's Rose, and she's my assistant, unpaid." },
  },

  notice = {
    { id = "n_imp", cat = "pet", when = { class = "WARLOCK", pet = { type = "Demon" } },
      text = "Rose, under the counter, now! Sorry, she can smell brimstone a street away, and that little friend of yours is practically steaming." },
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "A fellow alchemist! I've some insect samples you'd find fascinating, or horrifying, and usually both, and I'd sell you a slice for a reasonable sum." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Keep your pet away from Rose, chum. She's small, but she bites, and she's been at the reagents, and I'm not liable for anything she's been at." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Fetching things from places that bite, sting or turn you to stone, mostly, and not drinking anything off my bench without paying. The last warrior who helped me swigged a basilisk extract before a fight, and Rose still won't go near him." } },
      choices = {
        { text = "Know what you drink before a fight. Discipline keeps you alive.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If it makes me stronger in a fight, I'll drink it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Glands, stingers, the odd basilisk eye, all the lovely bits a hunter usually throws away, and I pay by the ounce. Scorpid venom goes into half the antidotes in Gadgetzan, which I find delightfully ironic and very profitable." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Do keep {pet} at a polite distance from Rose, please, because she's the best assistant I've ever had and she's quite small enough to be mistaken for a snack." },
      },
      choices = {
        { text = "Kill only what you need, and use all of it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "The desert's full of beasts. Take what you like from it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Things the Sandfury hexed before they died, mostly, carried in from Zul'Farrak by people who ought to know better. Their humors are all wrong, there's a loa's mark on the bone, and Rose won't go near them, which is all the proof I need." } },
      choices = {
        { text = "Bring them to me first. I'll cleanse the hex before you cut.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Keep them. A hexed corpse has much to teach a priest.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Pieces of those giant insects from Sandsorrow Watch, and they're nothing like a scorpid on the inside. Gracina Spiritmight in Darnassus thinks they're tied to Un'Goro, and the more I cut, the more I think she's right." } },
      choices = {
        { text = "Send word to the Circle. This needs many eyes.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Keep it quiet until you're sure. Rumors spread faster than bugs.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Some of it, yes, which is the interesting part. The scorpids down in the southern dunes carry stronger venom than the ones near town, and I think it's whatever's in the water they drink, though Rose and I haven't proved it yet." } },
      choices = {
        { text = "Poisoned water means a wounded land. Someone should heal it.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Stronger venom sells for more. Bottle it.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Someone who can freeze a sample before it goes off in this heat, mostly, and I'd pay well for that. Whatever the Water Company finds in the bad wells rots in an hour, and I'd rather study it fresh than smell it stale." } },
      choices = {
        { text = "Science needs patience, not shortcuts.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Use whatever works, magic included.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "It interests me, which is worse, because interesting things blow up, and the last interesting thing took my eyebrows and a whole shelf of stock. I'd be curious what fel residue does to a reagent, but I'd want it kept in a jar a long way from my rat." } },
      choices = {
        { text = "Fel is just another reagent. Study it.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Keep it far from your rat. It corrupts.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Silt, salt, a dead scorpid or two and, once, something that smelled of the grave, which Rose wouldn't go near and neither would I. Most of it's only nature being unpleasant, but I keep that sample in a locked jar, because some sicknesses don't come from nature at all." } },
      choices = {
        { text = "Taint like that should be burned and prayed over, not studied.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Study it closely. Even a foul thing can teach us something.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Most of it, if you drink it wrong, and a few things if you drink it right. The Water Company brings me whatever crawls out of their pipes, pays me by the jar, and I take it apart so they know whether to worry, which these days they usually should." } },
      choices = {
        { text = "Then label it well, and keep it from fools.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Danger sells. Put it on the front shelf.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Scorpid venom, mostly, and a few extracts from the plants down by Lost Rigger Cove that'll make a man see things. I sell to rogues and hunters both, pal, cash up front, and I don't ask whom it's for, but I'd rather not hear about it afterwards." } },
      choices = {
        { text = "You won't hear of it. I use it only on enemies.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "What I do with it is my business, alchemist.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, eh? Rose doesn't care for the smell of totem smoke, but she'll put up with it if you've brought me something interesting to cut open." },
        { id = "h_default", key = true,
          text = "Alchemist Pestlezugg, pal. I sell supplies, and when the Water Company finds something nasty, I take it apart and tell them how nasty, at my usual rate." },
        { id = "h_analysis", tags = { "news" }, when = { questActive = TODO_QUEST("Insect Part Analysis") },
          text = "These parts confirm what I feared: these aren't scattered bugs, they're organized, and organized bugs are very bad for business. Take my report to Fizzledowser, and be quick about it." },
        { id = "h_march", key = true, when = { questActive = TODO_QUEST("March of the Silithid") },
          text = "Gracina Spiritmight in Darnassus and Zilzibin Drumlore both have theories about where these things come from, and both of them say Un'Goro. I think they may be right." },
        { id = "h_bungle", when = { questActive = TODO_QUEST("Bungle in the Jungle") },
          text = "I need a scent gland from the hive's own and a handful of Un'Goro soil, and with the two I can build a lure. I'd rather not say what it's for just yet." },
        { id = "h_rose", when = { metBefore = true }, text = "Rose ate the label off a jar again, so now I've a jar of something, worth something, and no idea what. She looks pleased with herself, which worries me." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "Rose, mind your manners, it's a druid. Druids always ask what I'm dissecting, and they never like the answer." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage. Good, you'll have a steady hand, and Rose likes steady hands; she bites the shaky ones, and I don't pay for the bandages." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Warlock. I can smell the brimstone on your sleeve, and so can Rose, which is why she's hiding behind the flasks." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Rose and I have opened up a fair few dead things this month, and I'll confess some of them looked at me afterward in a way I didn't care for." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest! Splendid timing, because Rose and I have something from the Wastewanderer camps on the bench, and I'd love to know whether your Light can tell me if it's cursed or merely disgusting." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, excellent! Rose and I are always short of people who don't mind standing near a jar that might explode, and it usually doesn't, much." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter! Rose, look, a hunter, and Rose is looking at your beast in a way I'd describe as professionally nervous." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin. I'll warn you now that some of what's on these shelves would curdle the Light right out of you, so look but don't sample." },
        { id = "h_roguecl", when = { class = "ROGUE" }, text = "A rogue. You're looking at my poison shelf, I can tell, and I'll sell from it, pal, but Rose there remembers faces, and she bites." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Centipaar", min = 30 } }, text = "You've been killing a great many of those Centipaar insects, haven't you? Bring me a few more of the parts, because the more I take apart, the less I like what I find." },
      },
      again = { { id = "h_again", text = "Anything else, pal? Rose is getting impatient, though Rose is always impatient, and her time's cheaper than mine." } },
      choices = {
        { text = "Do the elements here have anything to do with the poison?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What are you dissecting, Pestlezugg?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Let's see your supplies.", next = "BUSINESS" },
        { text = "Who's Rose?", next = "rose" },
        { text = "What did you find in the insect parts?", next = "insects" },
        { text = "Talk shop with me.", next = "shop", when = { profession = "Alchemy" } },
        { text = "Your rat doesn't like my imp much.", next = "x_warlock", when = { class = "WARLOCK" } },
        { text = "What does an alchemist want with a mage?", next = "xmage", when = { class = "MAGE" } },
        { text = "Does my craft bother you, alchemist?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What foul things have you found in the water, Pestlezugg?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Which dead things have looked back at you, Pestlezugg?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What do you need a warrior for, Pestlezugg?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What do you need from the beasts of Tanaris, Pestlezugg?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Is anything on your shelves actually dangerous, Pestlezugg?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What sort of poisons do you keep, Pestlezugg?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Just browsing.", next = "END" },
      },
    },
    rose = {
      lines = { { id = "r_default", text = "She's my assistant, and she tests things, though not on purpose and not for wages. She's survived everything so far, which is either very good or very bad news about my reagents." } },
      choices = {
        { text = "Can I pet her?", next = "rose_pet" },
        { text = "Something else.", next = "BACK" },
      },
    },
    rose_pet = {
      lines = { { id = "rp_default", text = "You can try. She's had a long day and something blue for lunch. I'd keep your fingers where you can count them." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
    insects = {
      lines = { { id = "i_default", text = "Hard shells, a shared scent, the same markings on every one of them. That's not a swarm; it's a hive with somewhere to be." } },
      choices = {
        { text = "Where would a hive like that come from?", next = "insects_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    insects_where = {
      lines = { { id = "iw_default", text = "Somewhere hot and green and full of things that grew too big: Un'Goro, if the scholars in Darnassus and Ironforge are right. I hope they're wrong, but they're rarely wrong together." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    shop = {
      lines = { { id = "s_default", text = "Keep your reagents dry, your vials corked, and your rat out of the cupboard, pal. I manage two of those." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
    x_warlock = {
      lines = {
        { id = "xw_default", text = "Rose has a nose for brimstone and she doesn't care for it, and between you and me, neither do I. Keep the little horror on your side of the counter and away from the sulfur, because I'm short this week as it is." },
      },
      choices = {
        { text = "My imp does exactly as it's told.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My imp does as it likes. I've stopped arguing.", next = "BACK", fx = { align = { order = -1 }, trait = { witty = 1 } } },
        { text = "Do you sell anything for my kind of work?", next = "x_warlock_shop" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_warlock_shop = {
      lines = { { id = "xws_default", text = "Herbs, vials and the odd jar of something that fizzes, and what you do with them afterward is your own affair. If any of it ends up in a summoning circle, though, I'd rather not hear about it." } },
      choices = {
        { text = "Then I won't tell you.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Then don't sell me anything that fizzes.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I take things apart for a living, rumors included, at a fair rate. Ask, and I'll tell you what's inside them." },
    },
    background = { { id = "tp_ba", text = "I've been an alchemist as long as I can remember, and a profitable one for nearly as long. Rose came later, and she's never told me where from." } },
    advice = { { id = "tp_ad", text = "Label your vials, pal, then hide the labels from your rat, because relabeling costs money." } },
    _none = { { id = "tp_none", text = "If you can't distill it, dissect it or sell it, I'm not your goblin." } },
  },
}

P:NPC {
  key = "tranrek", id = TODO_NPC("Tran'rek"), name = "Tran'rek",
  bible = "bibles/tanaris.md", role = "questgiver", tier = "quest",
  communities = { "gadgetzan" }, temper = { "evasive" }, values = { "cunning", "ambitious" },
  notices = { "purse" },

  impression = {
    first = "Tran'rek answered every question about his business without actually answering any of them. He buys what the desert offers, sells it elsewhere and keeps his margins very close.",
    third = "{name} met Tran'rek, an evasive goblin trader of Gadgetzan who deals in whatever the desert yields.",
  },

  greetings = {
    { id = "g_shifty", text = "What do I do? A bit of this and a bit of that, pal, all of it profitable, and you can't have any." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away} and come back again, and I'd bet you didn't bring me anything worth buying, so prove me wrong if you can, chum." },
    { id = "g_word_deceived", when = { word = "deceived" }, text = "Word is you pulled one over on somebody in town, and I'll admit I'm impressed, though I'm counting my coins while we talk, because professional courtesy only goes so far." },
    { id = "g_word_persuaded", when = { word = "persuaded" }, text = "I hear you talked some fool in town round to your way of thinking, and I'd like to know what you charge for that. I wouldn't pay it, mind, but I like to know the going rate." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "Somebody's doing well! You ever buy scarab shells, pal? You should, you know; everybody should, and I've got a crate going cheap, relatively." },
  },

  start = "hello",
  nodes = {
    xcl_zf = {
      big = true,
      lines = { { id = "xcl_zf_default", text = "Bad? A city with no chief is a city with nobody watching the storerooms, and there are scarabs carved in that place older than Gadgetzan's oldest debt. The trouble is that every goblin in Tanaris heard the same news this morning, and margins don't survive a crowd." } },
      choices = {
        { text = "Those relics belong to the dead who carved them. Leave them buried.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Dig them up and sell them. The dead don't haggle.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Who buys Sandfury scarabs, anyway?", next = "xcl_zf2" },
      },
    },
    xcl_zf2 = {
      lines = { { id = "xcl_zf2_default", text = "Collectors in Booty Bay, a few scholars in Ironforge who pretend they don't buy from goblins, and the odd Forsaken who never says what it's for. Each of them thinks the scarabs mean something different, and I let every one of them go on thinking it." } },
      choices = {
        { text = "Your secrets are safe with me, Tran'rek.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Depends on the thing and depends on who's asking, and I'm not telling you either, not for free. Sandfury blades out of Zul'Farrak fetch good coin up north, and I don't ask whose hand they came out of, so you don't have to tell me." } },
      choices = {
        { text = "I only sell what I've won in a fair fight.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Spoils are spoils. Where they came from is nobody's business.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "People who've never seen a desert and want to say they have, mostly. A basilisk eye in a glass case sells in Booty Bay for more than you'd guess, and I'll leave you to guess what I pay for one." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Not that I'm looking at {pet} that way, mind, because I don't deal in live goods, though I've a cousin who might, for a fee, and you didn't hear that from me." },
      },
      choices = {
        { text = "Some kills aren't for selling. They're for respect.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Every part of a kill has a price. Name yours.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Nothing is wrong with them, friend, and that's the trouble, because they still work, and the loa they call on are no friends of ours. I sell them to collectors a long way from here at a very long markup, and what the collectors do with them is no business of mine." } },
      choices = {
        { text = "Burn them, Tran'rek. Some loa are better left unfed.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Sell me one. I'd like to hear that loa speak.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Scorpid shell, basilisk hide, troll trinkets from round Zul'Farrak, and now and then a stone that hums when you hold it. Those go to a buyer in Booty Bay at a price I won't repeat, and that's as much as you're getting out of me, pal." } },
      choices = {
        { text = "A humming stone has a spirit in it. Selling it is wrong.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "If the stone hums, charge double. That's good business.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Offering? I don't offer anything, friend; I just mention things. Now, if somebody happened to bring me something from Lost Rigger Cove the pirates were fond of, I might happen to pay well for it, and nobody would happen to remember." } },
      choices = {
        { text = "I don't steal for other people.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Pirates' goods are anyone's goods.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because everyone sells something, friend, and your sort always have the strangest things to offer. I keep away from soul business in general, because the Cartel doesn't like it and the margins are lousy, and I'm fond of the Cartel liking me." } },
      choices = {
        { text = "The Cartel's rules aren't my concern.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Wise. Some trade isn't worth the coin.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Scarabs, mostly, the ones carved in Zul'Farrak and the ones that crawl, and you'd be surprised what a collector pays for either. Herbs too, when the pickers come back alive, which isn't as often as I'd like, and replacing pickers costs money." } },
      choices = {
        { text = "If someone pays, sell it. The dead don't need scarabs.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Leave the dead their scarabs. Some things aren't for sale.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The Cartel's rules, not Stormwind's, and the Cartel's rules are what count in Gadgetzan. I buy turtle shells and Sandfury trinkets, and if the trolls don't like it, they should've thought of that before they sat on all that loot." } },
      choices = {
        { text = "Cartel rules or not, plunder is plunder.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Trade is trade in a free town, shells and all.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because the trolls guard them like they're worth something, and some of them hum at night, which is either magic or beetles. Either way, a buyer in Booty Bay pays more for magic than for beetles, so I'd like to know which I've got." } },
      choices = {
        { text = "Some troll charms are cursed. Sell them carefully.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Tell the buyers they're all magic. They'll never know.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Well, it's good for me, pal, and that's a start. The goods move, the coin moves, and the coin keeps Gadgetzan's lights on, so I'd say I'm doing the town a favor, even if I take a small cut for my trouble, or a medium one." } },
      choices = {
        { text = "Charity doesn't take a cut, Tran'rek.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Coin keeps the town alive. That's charity enough.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_cl_zf", tags = { "news" }, when = { cleared = "Zul'Farrak" }, text = "Word came off the western road that Sandscalp is dead and the Sandfury are counting their losses, so somebody's going to be selling troll goods by the crate soon. I'd like that somebody to be me, friend, and I'd like to hear what you saw down there." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "Shaman, yes? I've sold to your kind before, totems and skins and a few odd stones, cash only. What you do with them is your business, and what I paid for them is mine." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest of the Horde, and maybe one of my own blood, if that's a troll's face under the hood. I sell what the desert gives up, and I've some Sandfury fetishes you'd do well not to touch." },
        { id = "h_default", key = true,
          text = "I'm Tran'rek, pal. I buy what the desert's got and sell it to people who haven't got a desert, and business is good, better than I'll ever tell you or the Cartel's tax man." },
        { id = "h_krazek", when = { any = { { questActive = TODO_QUEST("Tran'rek") }, { heardLine = "krazek.h_default" } } },
          text = "Krazek sent you? That's my cousin, and he talks too much, as I'm sure he told you himself, at length, and probably billed you for." },
        { id = "h_shells", tags = { "news" }, when = { questActive = TODO_QUEST("Scarab Shells") },
          text = "I want uncracked scarab shells, pal, and uncracked is the important part, because cracked ones are worth exactly nothin'." },
        { id = "h_valley", when = { questActive = TODO_QUEST("Thistleshrub Valley") },
          text = "Thistleshrub Valley has something I want, and don't ask me why I want it, buddy; just bring it, and I'll pay on delivery." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "One of the light-fingered trade, I see. Funny, I was just thinking how nice it'd be to have someone who could find things, and never mention where they found them." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Ah, a warlock. I don't buy what you'd sell and I don't sell what you'd buy, so we needn't waste each other's time, unless you'd like to, pal, in which case I charge for time." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior. I like warriors, because you always come back with something heavy to sell, and you never haggle as hard as you swing, which is very good for my margins." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, eh? Hides and claws, then, or maybe something rarer. I'm always buying, and I'm never telling who I'm selling to." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, eh? I buy a lot of what grows in this desert, so maybe you can tell me where the good stuff hides." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin, at my stall? You're looking at me like I've got something to hide, sweetheart, and I'll have you know everything I sell is very nearly legal." },
        { id = "h_magecl", when = { class = "MAGE" }, text = "A mage! Now, tell me true, can you tell enchanted from ordinary with a glance? Because I've a crate of Sandfury fetishes and I'd like to know which ones to charge double for." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Look, I know what you're thinking, but the trolls in Zul'Farrak aren't using that stuff, and I am, at a profit, so it's practically charity." },
      },
      again = { { id = "h_again", text = "Still here asking questions? That's how I started, pal, and look where it got me, which I won't tell you." } },
      choices = {
        { text = "What do you buy from the desert?", next = "xdruid", when = { class = "DRUID" } },
        { text = "What does the desert give up that's worth buying?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What do the shells sell for?", next = "shells" },
        { text = "What's it like being Krazek's cousin?", next = "krazek" },
        { text = "Who buys this stuff?", next = "buyers" },
        { text = "I've coin. Let me invest.", next = "invest", when = { money = { min = 500000 } } },
        { text = "I know a smuggler when I see one, Tran'rek.", next = "x_rogue", when = { class = "ROGUE" } },
        { text = "Are you offering me work, Tran'rek?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What makes you think I'd sell anything dark?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What's wrong with the Sandfury fetishes you sell, Tran'rek?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What do you pay for what warriors bring out of the desert?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Who buys the things hunters bring back from Tanaris?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Very nearly legal, Tran'rek?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why do you think the fetishes are enchanted, Tran'rek?", next = "xmage", when = { class = "MAGE" } },
        { text = "Is it really charity, Tran'rek?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Zul'Farrak's chief is dead. Is that bad for your scarab trade?", next = "xcl_zf", when = { cleared = "Zul'Farrak" } },
        { text = "I'll bring them.", next = "END", fx = { affinity = 1 } },
      },
    },
    shells = {
      lines = { { id = "s_default", text = "More than I pay you and less than you'd hope, which is the whole secret of commerce, pal, so don't write it down." } },
      choices = {
        { text = "Then pay me more.", next = "shells_more", fx = { trait = { greedy = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shells_more = {
      lines = { { id = "sm_default", text = "Ha! No, but I like you better for asking. Respect is free, chum, and I give it away constantly, since it's the only thing I do give away." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    krazek = {
      lines = { { id = "k_default", text = "Exhausting, since he tells everyone everything and I tell nobody anything. Between the two of us, we make one perfectly balanced goblin." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    buyers = {
      lines = { { id = "b_default", text = "Rich people, far away from here, and that's all you're getting, pal, which is more than Krazek would get out of me." } },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Who's buying, Tran'rek? Or should Krazek hear what you charge?", tag = "Intimidate", next = "buyers_true",
          check = { pass = { any = { { power = { "above", "far_above" } }, { class = { "WARRIOR", "ROGUE" } }, { trait = "stern" } } } },
          fail = { next = "buyers_no", fx = { affinity = -1 } } },
      },
    },
    invest = {
      lines = { { id = "i_default", text = "Invest, with me? Put that purse away before somebody sees it, pal, including me, and especially me." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    buyers_true = {
      lines = {
        { id = "bt_default", text = "All right, all right, leave my cousin out of this! The shells go out on the Booty Bay boat crated as curios, and Krazek sends me the buyers' names, which is the only secret he's ever kept, because I pay him to keep it." },
        { id = "bt_rogue", when = { class = "ROGUE" },
          text = "You'd really tell him, wouldn't you? Fine: the shells go out on the Booty Bay boat as curios, Krazek finds me the buyers, and I pay him to keep that one secret, which is a first for him." },
      },
      choices = {
        { text = "That wasn't so hard.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers_no = {
      lines = {
        { id = "bn_default", text = "Tell Krazek whatever you like, because he won't believe it unless he's the one selling it. Now, about those shells." },
        { id = "bn_mage", when = { class = "MAGE" },
          text = "Threats from a mage, how frightening; I'll be sure to keep away from your sheep. The buyers stay my business." },
      },
      choices = {
        { text = "Fine, keep your secrets.", next = "BACK" },
      },
    },
    x_rogue = {
      lines = {
        { id = "xr_default", text = "And I know a cutpurse when one walks in squinting at my crates, so we're even, aren't we? Shells are shells, friend, and where they go once they leave this tent is between me and my cousin." },
      },
      choices = {
        { text = "Cut me in, and I'll forget I saw anything.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Your business is yours. I'm not here to rob you.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know plenty and tell very little, but you're welcome to ask. Asking's free, pal; answers are extra." },
    },
    background = { { id = "tp_ba", text = "I'm a goblin, a businessman and cousin to a talker, and that last one I didn't choose and can't sell." } },
    steamwheedle = { { id = "tp_cartel", text = "The Cartel? Lovely people, very fair, every one of them. Is this conversation being written down?" } },
    _none = { { id = "tp_none", text = "Wouldn't know, and wouldn't tell you if I did, pal, not without a price, no offense." } },
  },
}

P:NPC {
  key = "fizzgrimble", id = TODO_NPC("Innkeeper Fizzgrimble"), name = "Innkeeper Fizzgrimble",
  bible = "bibles/tanaris.md", role = "innkeeper", tier = "service",
  communities = { "gadgetzan" }, temper = { "chatty" }, values = { "generous" },
  notices = { "drink", "weary" },

  impression = {
    first = "Innkeeper Fizzgrimble runs the only inn in Gadgetzan and makes a joke of it before anyone else can. He calls the sand in the stew seasoning, and somehow I believed him.",
    third = "{name} met Innkeeper Fizzgrimble, the chatty keeper of the Road Warrior inn in Gadgetzan.",
  },

  greetings = {
    { id = "g_inn", text = "Welcome to the Road Warrior, pal! Grab a stool, grab a drink, shake the sand out of your boots, and the sand's free, the drinks aren't." },
    { id = "g_home", when = { homeInn = { "Gadgetzan", "The Road Warrior" } }, text = "You again! Your room's ready and the sand's been swept out of it, mostly, and I only charged you for the sweeping once." },
    { id = "g_away", when = { away = 14 }, text = "Back after {away}! I kept your stool warm, or the sun did, which in this town amounts to the same thing and costs me nothin'." },
    { id = "g_away_long", when = { away = 60 }, text = "Well, I'll be, you've been gone {away} and you walk back in like you only stepped out for air. Sit down, because there's sand in everything and a whole lot of gossip you've missed." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "Word at the bar is that somebody caught you in a fib, and nothing travels faster in Gadgetzan except sand and debts. I'd keep your head down a while if I were you, chum, and maybe buy a round to smooth it over." },
    { id = "g_word_threat", when = { word = "intimidated" }, text = "Folks say you leaned on somebody hard enough to make them squeak, and they were complaining about it at table four all night, which put six people off their second drink. Do it outside next time, pal, because the Bruisers frown on that sort of thing indoors." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Easy, pal! You walk out in the heat like that and the Bruisers'll be scraping you off the street and billing me for the shovel." },
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look like the desert chewed you up and spat you out, friend, so sit down and drink something wet, and I'll put it on your tab." },
  },

  start = "hello",
  nodes = {
    xpt_fizzgrimble = {
      big = true,
      lines = { { id = "xpt_fizzgrimble_default", text = "I mean I've watched more companies break up over loot than over any monster, and it always starts at my tables after the third drink, usually with a broken chair. The smart ones decide who gets what before they go out, and the rest end up asking me to hold a grudge for them, which I do, for a small fee." } },
      choices = {
        { text = "We split everything evenly. That's the only fair way.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Whoever does the most work should take the most.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xcl_zf = {
      big = true,
      lines = { { id = "xcl_zf_default", text = "That the Sandfury are pulling back from the road, that the Bruisers are drinking on duty to celebrate, and that a dwarf at table three is selling a map to the chief's treasure. The map's a fake, because I watched him draw it, but he's sold two already and I've taken a cut of both." } },
      choices = {
        { text = "Tell the Bruisers. A cheat shouldn't drink in your inn.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Let him sell. Fools pay for their own lessons.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Do the Sandfury ever come into town?", next = "xcl_zf2" },
      },
    },
    xcl_zf2 = {
      lines = { { id = "xcl_zf2_default", text = "Not through the front gate, and never to drink. The Bruisers say they've seen a few in the dunes at dusk watching the walls, and since tonight's news, I've had more guests asking for rooms on the east side." } },
      choices = {
        { text = "Then I'd take an east room myself.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Not trouble exactly, just weight, because you lot sit down hard after a week in the dunes. The Bruisers keep the peace, but nobody can keep a table from giving out under a man in full plate who's just found the sand in his stew, and tables cost six silver apiece out here." } },
      choices = {
        { text = "I'll keep the town's peace. My fights are out in the dunes.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If a fight comes to your inn, I won't walk away from it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I mind beasts that eat the stew, and I mind beasts that eat the guests, and I'm told that rules out most of them. But a quiet one by the fire's no worse than half my regulars, and it usually smells better." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} looks well-mannered enough, so if it curls up by the hearth and leaves the stew alone, I'll call that a paying guest." },
      },
      choices = {
        { text = "A beast should mind the house rules like anyone else.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "My companion goes where I go. House rules don't change that.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Every night, friend, and mostly I give them a bed and a joke, because that's what I've got and the joke's on the house. But the ones coming back from Zul'Farrak sometimes need more than a joke, and I'd not turn away a priest who sat with them a while." } },
      choices = {
        { text = "I'll sit with them tonight. That's what I'm here for.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They chose Zul'Farrak. Let them carry what they found there.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every night, and they grow a little taller with every round. The latest is a sandstorm with a face, out past the Wastewander camps, and I'd laugh, except three different caravans told it the same way." } },
      choices = {
        { text = "Drink talks. Trust what you see, not what's sung.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Listen to those stories. The land speaks through odd mouths.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "In a desert, pal, water is the most expensive thing on the menu, and I didn't set the price, the Water Company did. A mage could put me out of business with a flick of the wrist, so keep the conjuring to your room and I'll keep the stew warm." } },
      choices = {
        { text = "Water should be free in a drought.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Business is business. I'll keep it quiet.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, Fizzgrimble.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not often, because the Bruisers are quick and I'm quicker, especially with the bill. Still, the port brings in all sorts, and I've had pirates at one table and Booty Bay debt-collectors at the next, so a smart innkeeper watches his guests' pockets as well as his own." } },
      choices = {
        { text = "A smart thief wouldn't steal under the Bruisers' noses.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'd never steal from your guests.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every day, and half of them came in too proud to drink enough water on the road. I put them in the back room and charge them for the bed and the bucket, and I'd send for a healer if Gadgetzan kept one handy, but mostly they get me and a roll of bandages." } },
      choices = {
        { text = "Point the sick ones my way. Healing them is my calling.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fools who don't carry water have earned the lesson.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Not often, friend, because nobody wants to fight with a Bruiser watching and an orc and a dwarf sharing a table. The truce here is thin, though, and one bad hand of cards can turn it into a broken chair, so I keep a sharp eye on the corners." } },
      choices = {
        { text = "Your truce is worth keeping. I'll keep my temper in here.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A truce with the Horde won't last. Best be ready when it breaks.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Only the once, and he paid for the mattress, I'll give him that, plus a little for my nerves. Mostly your kind sit in the corner, drink water, and complain the sand's too dry, which it is, but I can't do much about that." } },
      choices = {
        { text = "Fair's fair. A guest should pay for what they break.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A mattress is nothing. A bear needs room to sleep.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "A few every month, Horde and Alliance both, and they're quieter than the warriors, I'll give them that. The only trouble I've had was a felhunter that wouldn't stop sniffing the mage at the next table, and the Bruisers sorted that out quick." } },
      choices = {
        { text = "I'll keep mine on a short leash, then.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If the Bruisers try sorting me, they'll regret it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_pt_fizzgrimble", tags = { "news" }, when = { party = { size = { min = 2 } } },
          text = "A table for {companion} and the rest of you, then? Sit anywhere the sand isn't, and mind you settle your shares before you start drinking, not after, because I'm not refereeing for free." },
        { id = "h_cl_zf", tags = { "news" }, when = { cleared = "Zul'Farrak" }, text = "Half the Road Warrior's talking about you tonight, friend, because word is you went all the way down into Zul'Farrak and came back with the chief's head. I've heard the story told four ways already, and in one of them you wrestled a hydra." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman in the Road Warrior! If you can call up a bit of rain, pal, I'll stop calling the sand in the stew seasoning and start calling it soup." },
        { id = "h_default", key = true,
          text = "Innkeeper Fizzgrimble, of the Road Warrior: the best inn in Gadgetzan, and also the only inn in Gadgetzan, and those two facts are related, and so are my prices." },
        { id = "h_sand", when = { metBefore = true }, text = "There's sand in the stew again, so I tell the guests it's seasoning, a very exclusive desert seasoning, and I charge a copper extra for it." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Night's when Gadgetzan cools off and the Bruisers relax, a little. Hear that? Somebody's arguing about water again." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Please don't go conjuring water in my common room, friend, because I charge for it, and everybody watching will want it free, and free is a terrible word in an inn." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue in my inn! Keep your hands off the other guests' purses, pal, if you'd be so kind, and I'll keep my hands off the bill, mostly." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest in the Road Warrior! Say grace over the stew if you like, though I warn you, the sand in it has already been blessed more times than I can count." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest under my roof! Say a little blessing over the stew, would you, because the sand in it is seasoning and I'd hate for it to start thinking it's the main course." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin at the Road Warrior! Mind the beam over the door, and please don't smite anyone in the common room, because the Bruisers bill me for the cleanup." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! Leave the axe by the door if you're staying, would you, buddy? Not that anyone fights in Gadgetzan, but I've replaced three tables this year and only one of them was a fight; the other two were a dwarf and a rocket." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, and a beast with you! Animals sleep in the stables, friend, and Laziphus will tell you so, but I'll pretend I didn't see it if it's quiet." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid at the Road Warrior! Please stay in the shape you walked in with, because the last bear tore up a perfectly good mattress." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Welcome to the Road Warrior, friend, and if that little fellow of yours wants a drink, he can have one, but he's paying the same as everyone else, plus a deposit on the furniture." },
      },
      again = {
        { id = "h_again", text = "Anything else? Have a drink while you think, pal; thinking's thirsty work and I'm the one who sells the cure." },
        { id = "h_again2", text = "Ask away, friend; the stool's paid for and the gossip's free." },
      },
      choices = {
        { text = "Have druids caused you much trouble, Fizzgrimble?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Do travellers bring tales of the desert's spirits to your inn?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I'd like a room.", next = "BUSINESS" },
        { text = "What's the news in town?", next = "news" },
        { text = "Why 'the Road Warrior'?", next = "name" },
        { text = "Do the Sandfury ever drink here?", next = "x_troll", when = { race = "Troll" } },
        { text = "Who cooks for the Road Warrior?", next = "kitchen" },
        { text = "Horde and Alliance drink here together?", next = "both", when = { minLevel = 40 } },
        { text = "You charge for water in your inn?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do guests often lose their purses here?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Do travelers come in sick from the desert, Fizzgrimble?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Do weary travelers ever ask you for comfort, Fizzgrimble?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Do brawls break out often in your inn?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do warriors really cause that much trouble at the Road Warrior?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do you mind beasts at the Road Warrior, Fizzgrimble?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do you get many warlocks at the Road Warrior, Fizzgrimble?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What are people saying about Zul'Farrak tonight?", next = "xcl_zf", when = { cleared = "Zul'Farrak" } },
        { text = "What do you mean, settle our shares?", next = "xpt_fizzgrimble", when = { party = { size = { min = 2 } } } },
        { text = "Just a drink, thanks.", next = "END" },
      },
    },
    news = {
      lines = { { id = "n_default", text = "Water's dear, the Bruisers are grumpy, Marin's elixir made a fellow small for an hour, and someone saw bugs the size of carts out past the dunes, so it's a normal week and a good one for the bar." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kitchen = {
      lines = { { id = "k_default", text = "Dirge Quikcleave, the butcher, who'll tell you he's the greatest living chef in Azeroth before you've sat down and charge you for listening. He's half right, which for Dirge is a fine average." } },
      choices = {
        { text = "Which half is right?", next = "kitchen_half" },
        { text = "Something else.", next = "BACK" },
      },
    },
    kitchen_half = {
      lines = { { id = "kh_default", text = "The living part, mostly, and the meat's good if you don't ask what it was. Gimblethorn eats there every night, and he's the most careful goblin in Tanaris, so that's a recommendation." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    both = {
      lines = {
        { id = "bo_default", text = "Same bar, same stools, same sand in the stew, and the Bruisers stand by the door to keep it that way. Bera and Bulkrek drink at opposite ends and raise their mugs to each other, which is about as warm as it gets." },
      },
      choices = {
        { text = "That's how it should be everywhere.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Goblin peace lasts as long as goblin profit.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = { { id = "na_default", text = "Because everyone who walks in has crossed a desert to get here, so every guest's a road warrior, and flattery sells rooms, pal, at four silver a night." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_troll = {
      lines = {
        { id = "xt_default", text = "The Sandfury? Not a chance, they'd sooner drink the sand. You're the first troll this month to come in through the front door instead of over the wall, so sit down and I'll tell everyone you're with me." },
      },
      choices = {
        { text = "Thanks, Fizzgrimble.", next = "BACK", fx = { affinity = 1 } },
        { text = "I'll keep my tusks off the furniture.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "Everyone in Gadgetzan drinks at the Road Warrior, since there's nowhere else, so I hear everything, and I hear it for the price of a drink! Ask away." },
    },
    background = { { id = "tp_ba", text = "I opened the Road Warrior with one stool and a barrel, and now I've got four stools and a line of credit. That's growth!" } },
    advice = { { id = "tp_ad", text = "Drink water first, ale second, pal. The other way round, the desert wins, and it doesn't tip." } },
    _none = { { id = "tp_none", text = "Never heard of it, pal, but do you want to hear about the weather? It's hot, and that's the weather, and it's very good for the drink trade." } },
  },
}

-- Steamwheedle Port, on the coast east of Gadgetzan.
P:NPC {
  key = "stoley", id = TODO_NPC("Stoley"), name = "Stoley",
  bible = "bibles/tanaris.md", role = "citizen", tier = "quest",
  communities = { "steamwheedle_port" }, temper = { "nervous" }, values = { "practical" },
  notices = { "purse" },

  impression = {
    first = "Stoley asked who sent me and then guessed before I could answer. He owes money in Booty Bay and seems to spend most of his days hoping nobody notices him.",
    third = "{name} met Stoley, a nervous trader at Steamwheedle Port with debts in Booty Bay.",
  },

  greetings = {
    { id = "g_dock", text = "Who sent you? No, don't tell me, I know who sent you, because it's always the same fellow." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "You wouldn't consider a small loan to a man with excellent prospects? No, nobody ever does." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Nobody, nobody at all, just a few friends of mine in Booty Bay who think a loan lasts forever. They hire big folk with big swords, so you'll understand why I flinch whenever one of you walks up the pier." } },
      choices = {
        { text = "Pay what you owe, Stoley. Running only makes it worse.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Debts to sharks don't count. Keep running, and keep your coin.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because a hunter's quieter than a bruiser and cheaper than a rogue, that's why, and the Bay knows I'd see a bruiser coming. I sleep on a different crate every night down at the port, which is no way to live, but it's still living." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And don't let {pet} sniff around my coat, please, because it might be the sort of beast that's been given a scent, and I'm not being nervous, I'm being careful." },
      },
      choices = {
        { text = "Settle it with them properly. Hiding forever is no life.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Keep moving and trust nobody. That's how the hunted survive.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "It might, if the Light or the loa or whatever you pray to could square things with the Cartel, but I don't suppose it works that way. Mostly I'd like someone to know where I'm buried, if a Bruiser ever catches up with me." } },
      choices = {
        { text = "Pay what you owe, Stoley. That's the only absolution there is.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Keep running. The Cartel's ledgers aren't holy writ.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Pirates from Lost Rigger Cove, mostly, sniffing round the ships, and the tide doing strange things at night. I keep my head down and my eyes on the water, because I'd rather see trouble coming than have it walk up behind me." } },
      choices = {
        { text = "Hiding from debts only makes them heavier. Face them.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Smart man. Let the tide carry your troubles off.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "That's what the last one said, right before he asked me where I kept my strongbox. If you're really not from Booty Bay, you'll understand why I keep looking over your shoulder, and you won't take it personally." } },
      choices = {
        { text = "Pay your debts. You'll sleep better.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Run further. Booty Bay can't reach everywhere.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "A sheep! Well, nobody in Booty Bay is looking for a sheep, that's true, but I'd rather keep my own feet. I suppose I'll just have to keep my head down and hope the next ship doesn't bring anyone who remembers my face." } },
      choices = {
        { text = "You should face the people you owe.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Hide if you must. Debts can wait.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because what I owe and what they say I owe are two very different sums, and the difference is mostly interest. I'll pay the honest part when I find out who's honest in Booty Bay, so not soon." } },
      choices = {
        { text = "Let them chase you. The Bay was never honest anyway.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Pay your debts. Running only makes it worse.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because he's tried everything else! He's sent letters, he's sent sailors, and once he sent a parrot that sat on my window and shouted my debts. A demon would be the next step, and I'd honestly rather have the parrot back." } },
      choices = {
        { text = "Pay what you owe and you won't need to fear him.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Nobody sent me. Your debts are your business.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Money, mostly, and a little guilt, because I said I'd pay MacKinley back by the end of last season and I didn't. I'm not a bad goblin, I'm only a goblin with a bad run of luck and a lot of cousins." } },
      choices = {
        { text = "Make it right with him. You'll sleep better.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Luck turns. Keep your head down until it does.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "Shaman, huh? Don't suppose the spirits ever tell you who's looking for a fellow, do they, because that's a talent I'd pay for, if I could pay for things." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest! Do your lot hear confessions, because if so, I've a few Booty Bay debts I'd like to get off my chest before the people I owe find me." },
        { id = "h_default", key = true,
          text = "I'm Stoley, and I work the port and keep my head down. Some people in Booty Bay think I owe them money, and they're not entirely wrong." },
        { id = "h_mackinley", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Stoley's Debt") }, { heardLine = "mackinley.h_default" } } },
          text = "MacKinley, of course it's MacKinley. All right, all right, I'll make it good; I've got a shipment coming that'll square us." },
        { id = "h_shipment", when = { questActive = TODO_QUEST("Stoley's Shipment") },
          text = "Get my shipment here and we'll all be happier, especially me, and MacKinley too, but mostly me." },
        { id = "h_deliver", when = { questActive = TODO_QUEST("Deliver to MacKinley") },
          text = "Take it to the Sea Wolf with my compliments, and tell him we're even... please, tell him we're even." },
        { id = "h_owe", when = { metBefore = true }, text = "If MacKinley's sent you, I'm not here. If he hasn't, I'm here, and I've got a fine selection of bottles." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "Did Booty Bay send you? You look like the sort they'd send, all quiet feet and patient eyes, and I swear I'll have the money soon." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! You couldn't, ah, make a man look like somebody else for a while, could you? Asking for a friend, who owes money." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior? You're not here from Booty Bay, are you? Only, you've got the look of someone who collects things, and I'd rather it wasn't me." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. You're tracking something, I can tell, and I'd feel a lot better if you told me it wasn't me." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You'd not happen to have a shape that lets a fellow disappear quickly, would you? I'm asking for a friend, and the friend is me." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Oh, no, please tell me MacKinley hasn't started sending demons to collect, because that would be very unfair, even for Booty Bay." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Is this about my soul? Because I've been meaning to work on that, I really have, right after I settle a few small accounts." },
      },
      again = { { id = "h_again", text = "Anything else? Say it quietly, because ships have ears." } },
      choices = {
        { text = "Why not just pay what you owe in Booty Bay?", next = "xdruid", when = { class = "DRUID" } },
        { text = "The sea out there is restless. What's the port seen lately?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "How much do you owe MacKinley?", next = "debt" },
        { text = "What's in the shipment?", next = "shipment" },
        { text = "Why not just sail away?", next = "leave" },
        { text = "What's MacKinley like, to owe?", next = "mackinley", when = { heardLine = "mackinley.h_default" } },
        { text = "I'm not here to judge you, Stoley.", next = "x_paladin", when = { class = "PALADIN" } },
        { text = "Nobody sent me, Stoley.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I could turn you into a sheep, Stoley.", next = "xmage", when = { class = "MAGE" } },
        { text = "Would confession really ease your mind, Stoley?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Why do you think MacKinley would send a warlock, Stoley?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What's weighing on you, Stoley?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "You should pay your debts.", next = "END", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Debts in Booty Bay are for fools who get caught.", next = "END", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Who are you afraid I've come to collect for, Stoley?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Why would anyone set a hunter on your trail, Stoley?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Good luck.", next = "END", fx = { affinity = 1 } },
      },
    },
    debt = {
      lines = { { id = "d_default", text = "A sum, and a sum with friends: it started small and invited all its cousins." } },
      choices = {
        { text = "How did it start?", next = "debt_start" },
        { text = "Something else.", next = "BACK" },
      },
    },
    debt_start = {
      lines = { { id = "ds_default", text = "One game of knucklebones in Booty Bay, and I won the first round. Never win the first round, friend, because that's how they get you." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    shipment = {
      lines = { { id = "s_default", text = "Bottles, good ones, worth enough to square things if they arrive and nobody drinks them on the way. Sailors drink everything on the way." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    leave = {
      lines = { { id = "lv_default", text = "Every ship out of here stops at Booty Bay sooner or later, and so would I, and so would he, waiting on the dock with a smile." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mackinley = {
      lines = { { id = "m_default", text = "Patient, and that's the frightening part. A shouting man you can run from, but a patient one is already waiting where you're running to." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    x_paladin = {
      lines = {
        { id = "xp_default", text = "You say that, but you've got a hammer and a holy symbol, and in my experience that's exactly how judgment dresses. I owe a man in Booty Bay, that's all, and I'll pay him when the shipment comes in, I swear it on anything you like." },
      },
      choices = {
        { text = "A debt's a debt. Pay the man, Stoley.", next = "BACK", fx = { affinity = -1, align = { order = 1 } } },
        { text = "MacKinley can wait. Booty Bay can afford it.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I keep my head down but my ears up. Ask, quietly, and I'll tell you what I can." },
    },
    background = { { id = "tp_ba", text = "Sailor, merchant and debtor, and mostly the last one, lately." } },
    advice = { { id = "tp_ad", text = "Never borrow from anyone with a nickname." } },
    _none = { { id = "tp_none", text = "I don't know anything. Knowing things gets a man in trouble." } },
  },
}

P:NPC {
  key = "krinkle", id = TODO_NPC("Krinkle Goodsteel"), name = "Krinkle Goodsteel", title = "Blacksmithing Supplies",
  bible = "bibles/tanaris.md", role = "vendor", tier = "quest",
  communities = { "gadgetzan" }, temper = { "sharp" }, values = { "greedy", "proud" },
  notices = { "craft", "purse" },

  impression = {
    first = "Krinkle Goodsteel will pour a mold for anything if the coin is right, and he says so proudly. He fought the Repairers' Union and won, which tells me a lot about him.",
    third = "{name} met Krinkle Goodsteel, a sharp-tongued goblin smith in Gadgetzan who makes molds nobody else will.",
  },

  greetings = {
    { id = "g_forge", text = "Welcome to the hottest forge in the hottest town in Kalimdor, pal, and don't touch the anvil, or anything else for that matter, because touching's a deposit." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Are you buying or mending, buddy, because I do both now, and you can ask me how, and I'll tell you for free, which is a first." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith! I thought so, from the forearms, so don't look so surprised, chum. You don't look like one, but looks lie, and mine certainly do, and so do my competitors' prices." },
    { id = "n_purse", cat = "purse", when = { money = { max = 1500 } },
      text = "That's a light purse you've got there, lighter than mine, anyway. Browse all you like, because browsing's free, and everything else isn't." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I can make the same weapon a hundred times without a smith's bad mornings, which is better in my book and cheaper in yours. The Repairers' Union thought only their members should mend a warrior's kit in this town, and I proved them wrong with a cheaper price and a shorter queue." } },
      choices = {
        { text = "Steel made by a craftsman's own hand carries honour. Molds don't.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A sharp edge is a sharp edge, and cheaper is better.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Against basilisk hide nothing's good, friend, because those beasts are half stone already. Aim for the eyes or the soft bit under the jaw, and take thorium heads if you can afford them, which you can't, but I'll sell them to you anyway, on account." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And keep {pet} away from the cooling trough, because the last hunter's cat drank from it and spent a week coughing up flux." },
      },
      choices = {
        { text = "Aim true and end it quickly. The beast deserves that much.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Whatever brings the beast down is good enough for me.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Out here, friend, a good mace is a prayer that comes with a guarantee, and I'd say the Light agrees, or why would so many priests carry one? The trolls of Zul'Farrak don't respect sermons, but they respect a cracked skull." } },
      choices = {
        { text = "A prayer mends what a mace can't. I'll trust both.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Shadow cracks skulls quicker than any mace you'll ever pour.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "It's over a hundred out there every day, and the forge has to burn hotter still, so it sulks if I stoke it wrong, and twice it's blown the chimney clean off. Some mornings I'd swear it's got moods, and I've lost more good molds to its tempers than to any customer." } },
      choices = {
        { text = "Treat the flame with respect and it'll serve you well.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Fire's a tool. Hammer it into line like everything else.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "For anyone who pays and doesn't stab a Bruiser with it, yes, pal, and I've never asked what my edges get used for. The Repairers' Union wanted me to ask questions, and that's partly why I don't belong to the Repairers' Union." } },
      choices = {
        { text = "A smith should care whose hands hold his blades.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Steel's steel. What it cuts isn't your business.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "A rod, a focus, a setting for some crystal nobody else will touch; I've poured all of them for mages with odd ideas. I'll pour anything for the right coin, and I'm proud of that, whatever the Union says about standards." } },
      choices = {
        { text = "Some things shouldn't be made, whatever the price.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Good. A craftsman should make what's asked.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Never mind molds.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I'd forge it for anybody whose coin is good, friend, Horde or Alliance, and that's never kept me up at night. A blade doesn't know who's holding it, so I figure the sin, if there is one, belongs to the hand and not the forge, and the profit belongs to me." } },
      choices = {
        { text = "A smith who sells to murderers shares their guilt.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "A blade doesn't care who swings it. Neither do I.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The desert's been scarred since long before me, friend, and a few holes in the hills won't make it worse. Still, I buy most of my ore off the boats from Booty Bay, at a terrible markup, so if you're looking for someone to blame, it isn't Krinkle." } },
      choices = {
        { text = "The desert's dead already. Dig all you like.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Every hole matters. Mine with care.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "A cultist, I think, though he said he was a collector. He paid well, and the mold came out perfect, and then I dreamt of fire every night until I melted the thing down myself, which cost me the profit and then some." } },
      choices = {
        { text = "You did right to melt it down.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "You lost good gold over a bad dream, Krinkle.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More than you've got, I expect, pal, because thorium's dear and the Cartel takes its share. But I'll tell you this: a holy symbol's no different from a sword in the forge, and the metal doesn't care what it's for, so long as the coin's good." } },
      choices = {
        { text = "The metal may not care, but you should.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Then you're right to charge what it's worth.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, is it? Fire and earth are my trade too, near enough, only I bill for mine, so if your spirits fancy a job at the forge, I'm hiring." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, is it? You'll want a mace, then, because the Sandfury don't stop for prayers, and I'll pour you one that does the praying for you." },
        { id = "h_default", key = true,
          text = "Krinkle Goodsteel, pal. Iron, thorium, flux, and molds for things that nobody else will make molds for, and if you can pay, I can pour it." },
        { id = "h_mold", tags = { "news" }, when = { questActive = TODO_QUEST("Mold Rhymes With...") },
          text = "Arbington's courier, or is it Dithers's? Doesn't matter, both send the same bones. Fifteen gold for the mold, up front, no haggling, and the lesson on the stem I'll throw in at no charge, because I'm sentimental." },
        { id = "h_plume", tags = { "news" }, when = { questActive = TODO_QUEST("Fire Plume Forged") },
          text = "The key needs a fire hot enough to set it, buddy, and my forge isn't it. Find the hottest spot on Fire Plume Ridge in Un'Goro and hold your breath, and try not to melt anything I've already been paid for." },
        { id = "h_union", when = { metBefore = true },
          text = "The Repairers' Union pulled my right to mend armor once, saying I was undercutting them, so I filed a complaint, and then I filed five more, by my mother's ledger. Now I mend armor again, and that's persistence for you, friend." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue, and with blades that haven't seen a proper stone in weeks, pal. I could put an edge on those daggers that'll go through a Wastewander's leathers like butter, for a very sharp price." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage. You don't need my steel, but I'll wager you'd like a smith who can pour a mold for something the Kirin Tor never bothered to make." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin, with a hammer that's seen some honest work, I'd say. If you ever want it reforged with more weight in the head, I'll pour it, though the Light's blessing is your department." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! Now that's a blade that wants a better hilt, and I've got the mold for one, chum, if you've got the coin to let me pour it." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, eh? I pour arrowheads by the thousand and shot by the barrel, and I'll bet you go through both faster than you'd like, which is exactly how I like it." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You don't wear much metal, so I'm guessing you're here for a friend, or you're lost, and either way, pal, there's no charge for directions today." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. I pour molds for anyone who pays, but I won't pour anything with a demon's face on it, because the last one gave me nightmares for a week." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, in a smithy? I don't make censers, if that's what you're after, though I could for the right price." },
      },
      again = {
        { id = "h_again", text = "More questions? Ask them over the anvil, pal, because the thorium cools while we chat, and cold thorium is money down the drain." },
        { id = "h_again2", text = "Still here? Then you're either buying or haggling, and I filed a complaint against haggling years ago." },
      },
      choices = {
        { text = "Does all this mining scar the desert?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Does the fire in your forge ever fight you?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Who else buys these molds?", next = "who" },
        { text = "Show me your stock.", next = "BUSINESS" },
        { text = "Goblin steel? Let's see if it meets a dwarf's standards.", next = "x_dwarf", when = { race = "Dwarf" } },
        { text = "Do you sharpen for anyone who pays?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What would a mage need from a mold?", next = "xmage", when = { class = "MAGE" } },
        { text = "Would you forge a weapon for someone who'd misuse it?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is a mace really better than a prayer out here, Krinkle?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Can you really make a better weapon than a smith, Krinkle?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Someone asked you to pour a demon, Krinkle?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What would you charge to make a censer, Krinkle?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Are your arrowheads any good against basilisk hide, Krinkle?", next = "xhuntcl", when = { class = "HUNTER" } },
      },
    },
    who = {
      lines = {
        { id = "w_default", text = "Couriers from the north, mostly, with bags of bones and long faces and fifteen gold apiece. I don't ask what the keys are for, and that's the secret of a long career in Gadgetzan." },
      },
      choices = { { text = "Wise.", next = "END", fx = { affinity = 1 } } },
    },
    x_dwarf = {
      lines = {
        { id = "xd_default", text = "Go on, knock on it, bend it, breathe your beard all over it; I've had Ironforge smiths in here before, and every one of them left carrying something. Dwarves complain the loudest and buy the most, which is why I keep a little extra on the rack for your lot." },
      },
      choices = {
        { text = "Not bad, for goblin work.", next = "BACK", fx = { affinity = 1 } },
        { text = "I've seen better at the Great Forge.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know metal, pal, and I know who's buying it. Ask, but don't waste my time, because my time's billed by the hour." },
    },
    scholomance = { { id = "tp_scholomance", text = "I've never been, and I'm never going, pal. I make the key and somebody else gets to use it, which is the best arrangement there is: all profit and no ghosts." } },
    steamwheedle = { { id = "tp_cartel", text = "The Cartel keeps the bruisers paid and the trade roads open, and I pay my share for it. I complain about it plenty, but I pay." } },
    _none = { { id = "tp_none", text = "That's not my trade, friend, my trade is metal, so how about buying some?" } },
  },
}
