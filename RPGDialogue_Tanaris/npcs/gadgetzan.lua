-- Gadgetzan: the Steamwheedle Cartel's desert town. Voice: bibles/tanaris.md
-- Neutral ground: both factions talk to everyone here.
local P = RPGDialogueAPI:Pack("rpgd.tanaris")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "marin", id = TODO_NPC("Marin Noggenfogger"), name = "Marin Noggenfogger",
  bible = "bibles/tanaris.md", role = "vendor", tier = "major",
  communities = { "gadgetzan" }, temper = { "eager" }, values = { "ambitious", "practical" },
  notices = { "purse", "drink", "lock_shards", "lock_taint" },

  impression = {
    first = "He talks about his elixir like a child, side effects and all.",
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
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 5 } },
      text = "What's in the bag that's cold enough to sweat in this heat? Soul shards, ha! I do wonder what a splash of Noggenfogger would do to one, though Sprinkle would have my hide for even asking." },
    { id = "n_lock_taint", cat = "lock_taint", when = { taint = { min = 30 } },
      text = "You've got a green tinge about the gills, friend, and I'd know, because half my customers turn colors. Mine wears off in an hour, though, and I've a feeling yours doesn't." },
  },

  start = "hello",
  nodes = {
    op_steamwheedle = {
      lines = {
        { id = "ops_q", text = "Speakin' of the Cartel, I'm doin' a little market research, friend, purely for the elixir business. What do you really think of the Steamwheedle Cartel, just between us and the sand?" },
      },
      choices = {
        { text = "The Cartel keeps its towns neutral and its trade fair. I admire that.", next = "op_steamwheedle_r1", fx = { affinity = 2, align = { order = 1 }, opinion = { steamwheedle = "admire" } } },
        { text = "Thieves with a ledger. They tax every cup of water.", next = "op_steamwheedle_r2", fx = { affinity = -1, align = { order = -1 }, opinion = { steamwheedle = "greedy" } } },
        { text = "They're useful. I'd not trust them past the contract.", next = "op_steamwheedle_r3", fx = { trait = { practical = 1 }, opinion = { steamwheedle = "useful" } } },
        { text = "The Venture Company's worse. At least the Cartel keeps its word.", next = "op_steamwheedle_r4", fx = { opinion = { venture_company = "hate" } } },
        { text = "I don't talk politics with salesmen, Marin.", next = "BACK" },
      },
    },
    op_steamwheedle_r1 = {
      lines = {
        { id = "op_steamwheedle_r1", text = "Second-best, pal, because the first is my elixir, but I'll take it! Put that in writing and I'll frame it over the counter." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_steamwheedle_r2 = {
      lines = {
        { id = "op_steamwheedle_r2", text = "Shh, shh, the Bruisers have ears like bats! Between you and me, though, I've got a cure for the water bill comin', so hang on to that grudge." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_steamwheedle_r3 = {
      lines = {
        { id = "op_steamwheedle_r3", text = "Now that's a businessman's answer, and I respect it like a good margin. Nobody trusts anybody past the contract, kid; that's what contracts are for." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_steamwheedle_r4 = {
      lines = {
        { id = "op_steamwheedle_r4", text = "Oh, don't get me started on the Venture boys, because they'd sell the sand out from under their own mothers. The Cartel at least pays her a fair price for it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xpt_marin = {
      big = true,
      lines = { { id = "xpt_marin_default", text = "My bruisers keep the peace, friend, and peace is the best business there is in this desert. You'd be amazed how polite a company becomes once it learns that drawing steel on my streets costs more than anything it could steal, plus a cleaning fee." } },
      choices = {
        { text = "Your rules keep trade honest, Baron. I'll keep them.", next = "BACK", reply = "Music to a baron's ears, friend, and the Bruisers will be glad of it too, since a polite customer is one less mop for them.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Rules for us and gold for you. We'll do as we please.", next = "BACK", reply = "Do as you please, pal, and see how far it gets you, because my Bruisers don't care whose banner you fly and they bill by the bruise.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Well, you might shrink, which makes you harder to hit, or you might float, which makes you very hard to reach! The skeleton effect's not much use in a brawl, but I've seen a Wastewanderer run screaming from it, so I'm calling it a feature." } },
      choices = {
        { text = "I'll win my fights with my own strength, not a bottle.", next = "BACK", reply = "Admirable, friend, and very old-fashioned, but when the Wastewanderers outnumber you six to one, you'll wish you'd floated.", fx = { align = { honor = 1 } } },
        { text = "Any edge in a fight is worth taking, even a strange one.", next = "BACK", reply = "Now there's a customer after my own heart, pal, and if you happen to float off mid-swing, do write down how high you went.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Only on one hyena, and it was entirely voluntary, in the sense that it ate the bottle. It turned into a skeleton for an hour and then trotted off into the dunes looking very pleased with itself, so I've written that down as a success." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Only on one hyena, which ate the bottle of its own accord. Not {pet}, of course, I wouldn't dream of it, unless you were offering, in which case I'd dream of it quite a lot." },
      },
      choices = {
        { text = "Leave the beasts out of your experiments, Marin.", next = "BACK", reply = "The hyena volunteered, friend, very nearly in writing, but fine, fine, I'll stick to goblins, they complain less and pay more.", fx = { align = { light = 1 } } },
        { text = "A beast's as fair a test as any goblin.", next = "BACK", reply = "Exactly what I told Sprinkle, pal, though she still won't let the hyena back in the kitchen, and I can't say I blame her.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Harm is a strong word, friend, and I prefer to call them surprises, because nobody's died of my elixir that I know of, and I'd know, because they'd ask for a refund. A few have walked about looking like your Forsaken cousins for an hour or so, and the Bruisers have asked me to keep them out of the square." } },
      choices = {
        { text = "Then warn your buyers plainly. Their bodies deserve that respect.", next = "BACK", reply = "It's on the label, friend, in letters nearly half an inch high, which is more honesty than you'll get anywhere else in Tanaris.", fx = { align = { light = 1 } } },
        { text = "A little death never hurt anyone. I'll take a bottle.", next = "BACK", reply = "Ha, a customer with spirit, pal, and you'll want two bottles, because the first one sometimes doesn't take, and the second one always does.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Dew collector glands, mostly, from the thistleshrubs out in the valley, plus a few trade secrets that I'd sell you for a very large sum. The shrubs don't miss the glands, I'm told, or if they do, they haven't filed a complaint." } },
      choices = {
        { text = "Those shrubs are living things. Take only what you need.", next = "BACK", reply = "Only what I need, friend, and I need rather a lot, but I'll pass on your kind words to the thistleshrubs next time I'm robbing them.", fx = { align = { light = 1 } } },
        { text = "If it sells, harvest away. The desert's big.", next = "BACK", reply = "There's a fellow with vision, pal, and if you bring me a sack of glands I'll pay a fair price, by my standards.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "That's because you're thinking like a rogue! A poison does one thing and does it badly, but my elixir does several things and does them interestingly, and only one or two of them involve becoming a skeleton for a while." } },
      choices = {
        { text = "You should test it properly before you sell it.", next = "BACK", reply = "Properly? Friend, every bottle I sell is a test, and every customer is a very well-paid volunteer, so I'd say it's tested constantly.", fx = { align = { order = 1 } } },
        { text = "Sell it now. Let the buyers take the risk.", next = "BACK", reply = "Spoken like a true businessman, pal, and if you ever want a job selling elixirs at the dock, I've a stall that needs a friendly face.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Polymorph turns a man into a sheep for a minute, and he hates you forever after. My elixir turns him into a skeleton, and he pays me for the privilege and comes back for more, so tell me, pal, which of us has the better business sense?" } },
      choices = {
        { text = "Magic should never be sold like a cheap tonic.", next = "BACK", reply = "And yet they sell spells in Dalaran by the lesson, friend, so I'd say we're only arguing about the size of the bottle.", fx = { align = { honor = 1 } } },
        { text = "Fair point. Coin talks louder than spells.", next = "BACK", reply = "There it is, pal, the whole of Gadgetzan in one sentence, and I'll have it carved over my door if you don't mind.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else, Marin.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Need is a strong word, though a few have turned into skeletons for an afternoon, and one fellow shrank so small he fell through a crack in the floorboards. They all came back to normal, mostly, so I'd call it a natural process with very dramatic side effects." } },
      choices = {
        { text = "Test your brews on willing folk only, Marin, and warn them plainly.", next = "BACK", reply = "Willing is the only kind I sell to, friend, since nobody's ever bought one by accident, though one fellow did claim he was sleepwalking.", fx = { align = { honor = 1 } } },
        { text = "Anyone who drinks a goblin's elixir knows the risk.", next = "BACK", reply = "And they come back for more, pal, which tells you all you need to know about risk and about goblins both.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Safe is a big word for the desert, friend, where the water will kill you slower than the bandits do. I tell every buyer it might turn them into a skeleton for a bit, it's right there on the label, and they buy it anyway, so who am I to stand between a customer and his money?" } },
      choices = {
        { text = "Someone ought to set rules for what goblins sell.", next = "BACK", reply = "There are rules, friend, the Cartel's, and they say sell what you like and don't kill the customers, which I've mostly managed.", fx = { align = { order = 1 } } },
        { text = "A buyer who's been warned fairly can drink what he likes.", next = "BACK", reply = "That's the spirit of free trade, pal, and you'd make a fine goblin if you could stand the ears.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "I thought about it, believe me, but Sprinkle said if I fed a single drop to an imp she'd stop fixing my recipes, and I need her more than I need the data. Besides, who knows what an imp turns into, and I'd hate to find out at the bar." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "I thought about it, believe me, and looking at your {pet} now I'm thinking about it again. But Sprinkle said if I fed a single drop to a demon she'd stop fixing my recipes, and I'd hate to find out what that thing turns into right here at the bar." },
      },
      choices = {
        { text = "Listen to Sprinkle. Some experiments shouldn't be run.", next = "BACK", reply = "Oh, I do listen to her, friend, I just do it very slowly, and sometimes I forget halfway through.", fx = { align = { order = 1 } } },
        { text = "Test it on mine. I'm curious too.", next = "BACK", reply = "Now that's the spirit of science, pal, but you'll do it outside town, and you'll tell Sprinkle it was entirely your idea.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xalt_marin = {
      lines = {
        { id = "xalt_marin_default", text = "{alt}, a regular, or as regular as anyone gets when the side effects vary, and I wrote down everything that happened after the third bottle. Floated for an hour, shrank for ten minutes and paid in full, which is the only result I really care about." },
        { id = "xalt_marin_other", when = { alt = { faction = "other" } }, text = "{alt}, the {altrace}, a customer from the other side of the war, which in Gadgetzan means exactly nothing, pal, because the Bruisers don't check banners and my elixir doesn't either. If anything it's my best advertising, because both sides keep coming back." },
      },
      choices = {
        { text = "You shouldn't sell untested brews to anyone, Marin, either side.", next = "BACK", reply = "Either side, friend, the bottles don't know the difference and neither do I, and nobody's asked for a refund yet.", fx = { align = { order = 1 } } },
        { text = "If they paid and walked away, that's business done right.", next = "BACK", reply = "That's the creed of Gadgetzan, pal, and I'll say it at every Cartel meeting from now until they make me stop.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_other", when = { alt = { faction = "other" }, metBefore = false },
          text = "Hold still, pal, because I'd swear I sold three bottles to a {altrace} by the name of {alt} not long ago, and you've got the very same look of somebody about to say no. {alt} said yes, flying the other banner and all, so let's see if it runs in the family!" },
        { id = "h_alt_kin", when = { alt = { kin = true, faction = "same" } },
          text = "Another one! I had a {altclass} named {alt} in here with the same face, give or take a skeleton, and that one drank the elixir and walked off almost entirely normal. Now that's a testimonial, and you could be the sequel!" },
        { id = "h_alt_notkin", when = { alt = { notKin = true }, metBefore = false },
          text = "You know {alt}, don't you? Don't tell me, I can see it, because you both look at my bottles like they owe you money, and that's a family look, even if {alt}'s a {altrace}." },
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
          text = "It works, but it tastes like a boot, and boots don't sell, so take it to Sprinkle, the cook. She knows how to make awful things palatable." },
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
        { id = "h_dd_justice", tags = { "news" }, when = { questDone = TODO_QUEST("Wastewander Justice") }, text = "Bilgewhizzle tells me you went out and gave the Wastewanders a lesson in property rights, pal, and the pumps are running sweeter for it. Water's the one ingredient I can't do without, so call it an investment in the elixir business." },
      },
      again = {
        { id = "h_again", text = "More questions? Ask them in the shade, then, because everything's better in the shade, and the shade's free, for now." },
        { id = "h_again2", text = "Yes, yes? Go on, I'm listening, even if I'm also sweating and doing arithmetic." },
      },
      choices = {
        { text = "What exactly goes into your elixir, Marin?", next = "druid_q", when = { class = "DRUID" } },
        { text = "That elixir of yours has quite a reputation.", next = "elixir" },
        { text = "How do you stand the heat?", next = "heat" },
        { text = "Does anyone help you with the elixir?", next = "sprinkle" },
        { text = "Business must be good in a town like this.", next = "business" },
        { text = "Alchemist to alchemist: what's in it?", next = "recipe", when = { profession = "Alchemy" } },
        { text = "Slow fall? I can do that already.", next = "slowfall", when = { class = "MAGE" } },
        { text = "Sprinkle calls you Noggy.", next = "noggy", when = { heardLine = "sprinkle.n_default" } },
        { text = "I could ask the spirits for rain, you know.", next = "x_shaman", when = { class = "SHAMAN" } },
        { text = "Do the Sandfury trolls give you trouble?", next = "x_troll", when = { race = "Troll" } },
        { text = "A gnome could improve that elixir.", next = "x_gnome", when = { race = "Gnome" } },
        { text = "Your elixir sounds a lot like a poison to me.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Polymorph does better than your elixir, Marin.", next = "xmage", when = { class = "MAGE" } },
        { text = "Do your customers ever need healing after the elixir?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "I'd wager your elixir has done real harm, Marin.", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Is your elixir safe enough to sell, Marin?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would your elixir help me in a fight, Marin?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "You haven't actually tested the elixir on animals, have you?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Have you ever tested the elixir on a demon, Marin?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "We're here on business, Baron. Keep your bruisers off us.", next = "xpt_marin", when = { party = { size = 4 } } },
        { text = "I've heard everyone's sums on the Wastewanderers, Baron.", next = "water_word",
          when = { thread = { id = "gadgetzan_water", beat = "b5_marin", state = { "stirring", "unfolding" } } } },
        { text = "Who was this other customer of yours, Marin?", next = "xalt_marin", when = { alt = true } },
        { text = "The Wastewanders won't be at your pumps for a while, Marin.", next = "dd_justice", when = { questDone = TODO_QUEST("Wastewander Justice") } },
        { text = "Good luck with it.", next = "END" },
      },
    },
    dd_justice = {
      lines = {
        { id = "dd_justice_1", text = "Music to my ears, pal, and to my ledger. Every barrel of water those bandits drank was a barrel I couldn't brew with, and a Noggenfogger without water is just a very expensive powder that makes you sneeze. You've cut my overheads, so to speak, and I'm a goblin who notices that sort of thing." },
      },
      choices = {
        { text = "Bandits on the water deserve a hard lesson.", next = "BACK", reply = "Now that's a philosophy I can bottle, friend! Bilgewhizzle will want to put it on a plaque.", fx = { align = { light = -1 } } },
        { text = "Sell them water and they'd stop stealing it.", next = "BACK", reply = "Sell to the Wastewanders? With what money, pal, the money they stole from the last caravan? I like the way you think, though, it's very nearly profitable.", fx = { align = { light = 1 } } },
        { text = "Something else, Marin.", next = "BACK" },
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
      lines = { { id = "sp_default", text = "That'd be Sprinkle, the cook, my friend, my very good friend, who fixes my recipes and reminds me what I owe her every single day, with numbers." } },
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
      choices = {
        { text = "What do people think of the Cartel, Marin?", next = "op_steamwheedle" },
        { text = "Something else.", next = "BACK", fx = { learn = { "steamwheedle" } } },
      },
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
        { id = "xs_default", text = "Rain, over Gadgetzan? You'd put the Water Company out of business by suppertime, and then who'd be left to buy my elixirs? Then again, if your spirits ever want to knock a few degrees off this oven, I'll sign whatever contract they like." },
      },
      choices = {
        { text = "The spirits aren't for hire, Marin.", next = "BACK", reply = "Not for hire, friend? Then they're the only thing in Tanaris that isn't, and I'd keep that quiet before the Cartel tries to tax them.", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Everything's for hire in Gadgetzan. Make me an offer.", next = "BACK", reply = "Ha, a shaman who knows the market, pal, so name me a price for three degrees off the afternoon, and we'll haggle from there.", fx = { affinity = 1, align = { honor = -1 } } },
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
        { text = "The Sandfury are no kin of the Darkspear.", next = "BACK", reply = "Glad to hear it, friend, because the Darkspear pay their tabs and the Sandfury pay in spears, and I know which I prefer.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They hold the desert. Smart goblins would pay the toll.", next = "BACK", reply = "Pay them? Pal, I'd sooner pay my taxes on time, and you've no idea how much that hurts a goblin to say.", fx = { affinity = -1, align = { honor = -1 } } },
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

  persuade = {
    admire = {
      success = {
        { id = "s1", text = "Now that's what I like to hear, pal, a customer with vision! I keep tellin' people this elixir's gonna be the biggest thing since bottled water, and you're the first one today who didn't just ask about the side effects." },
        { id = "s2", text = "Friend, you can stand in my shade any time, because talk like that is good for morale and morale is good for output. I'm half tempted to print it on the label." },
      },
      fail = {
        { id = "f1", text = "I'm an alchemist, pal, I know syrup when I taste it, and that was about nine parts sugar to one part meaning it. It's too hot out here for a sales pitch that isn't mine." },
        { id = "f2", text = "Everybody loves the goblin who runs the town right up until the bill comes, friend, so I've heard that tune before. What are you really shoppin' for?" },
      },
    },
    taunt = {
      success = {
        { id = "s1", text = "Ha! All right, all right, that's fair, I sweat like a leaky still and I talk like one too. You've got zip, pal, and I like zip, it's practically an ingredient." },
        { id = "s2", text = "Ooh, cheeky, and in this heat! Most folks haven't got the energy to needle me past noon, friend, so I'll take it as the sign of a strong constitution." },
      },
      fail = {
        { id = "f1", text = "Hey, hey, I'm tryin' to run a town and invent a fortune in the middle of an oven, pal, and I don't need hecklin' on top of it. The Bruisers charge extra for removin' comedians." },
        { id = "f2", text = "That's not funny, friend, that's just rude with the labor taken out. Go and cool your head in the trough, and try me again when you've got some manners in stock." },
      },
    },
    intimidate = {
      success = {
        { id = "s1", text = "Whoa, whoa, let's not do anything that'll spill inventory, pal! I've just worked out what a fight in here costs me in broken glassware, and I'd much sooner listen, so go ahead." },
        { id = "s2", text = "Okay, friend, okay, I'm sweatin' more than usual and that's sayin' somethin'. You've clearly got a bigger temper than I've got Bruisers within earshot, so let's talk it through nice and reasonable." },
      },
      fail = {
        { id = "f1", text = "Pal, you're in Gadgetzan, where the Bruisers outnumber the scorpids and every one of 'em is on the payroll. Take it down a notch before it gets expensive for you." },
        { id = "f2", text = "I mix things that explode for a livin', friend, and I do it in this heat, so a mean look isn't even the scariest thing on my bench. Try again with a smile." },
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
    gadgetzan = {
      { id = "tp_gadgetzan", text = "Gadgetzan's my town, pal, and every barrel of water and every bottle of elixir passes under my nose. I keep the peace with the Bruisers and the profit with everything else." },
      { id = "tp_gadgetzan2", when = { disposition = { min = 70 } }, text = "Between you and me, pal, this town lives on two things, the water tower and the Bruisers, and both cost me more every month. Keep that under your hat, I've got a reputation for being rich." },
    },
    booty_bay = { { id = "tp_booty_bay", text = "Baron Revilgaz runs a nice little cove, I'll grant him that, but he's got the sea doing half his work for him. Out here I had to make a town out of sand, and I did." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet's a sleepy little port, and Gazlowe runs it like a workshop, which suits him. It's not ambitious, pal, but it's honest, in its way." } },
    everlook = { { id = "tp_everlook", text = "Everlook is our cousins up north freezing their fingers off for the Cartel, and I don't envy them. I'd take sand over snow any day, pal, sand doesn't make you wear a coat." } },
    zul_farrak = { { id = "tp_zul_farrak", text = "The trolls in Zul'Farrak are a bad neighbor, pal, raiding our caravans and cursing our water. I've put out a few bounties, and the adventurers keep coming back with very interesting trinkets." } },
    thrall = { { id = "tp_thrall", text = "The Warchief's people pay in gold and keep their tempers inside the walls, and that's all I ask of anybody. He built a whole country in a desert, pal, and I've got respect for that." } },
    theramore = { { id = "tp_theramore", text = "Lady Proudmoore runs a disciplined harbor, and her people buy our elixirs by the crate. She's a good customer, pal, and I'd like her to stay that way." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "The Arena in Stranglethorn's good business for Short John, but I've thought about building one here. Sand's cheap, and everybody already wants to kill each other in this heat." } },
    _gated = {
      { id = "gt1", text = "Ah, that one's a trade secret, pal, and I don't uncork trade secrets for folks I've only just met. Stick around, do a little business, and we'll see." },
      { id = "gt2", text = "Not yet, friend, not yet! Some things I keep under the counter until I know a customer's good for it." },
    },
    _none = { { id = "tp_none", text = "No idea, friend, but is it thirsty? Then I might have something for it, at a very fair price." } },
  },
}

P:NPC {
  key = "sprinkle", id = TODO_NPC("Sprinkle"), name = "Sprinkle",
  bible = "bibles/tanaris.md", role = "citizen", tier = "quest",
  communities = { "gadgetzan" }, temper = { "warm" }, values = { "loyal", "generous" },
  notices = { "craft", "lock_pact" },

  impression = {
    first = "She lets Marin think he runs their partnership, and enjoys it.",
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
    { id = "n_lock_pact", cat = "lock_pact", when = { aura = { 6307, 7804, 7805, 11766, 11767 } },
      text = "You're running hot, sweetie, hotter than the desert, and that's the imp's blood pact, isn't it? I can see it in your cheeks, so sit down and have something cool, but keep the little firebug away from my biscuits." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Something heavy that stays put, sweetie, like a good roast with plenty of salt, because the sun sweats it all out of you by noon. I tell Noggy the same thing, and he eats a biscuit and wonders why he faints in the lab." } },
      choices = {
        { text = "A soldier who doesn't eat properly is a soldier who falls.", next = "BACK", reply = "That's exactly right, sweetie, so sit yourself down and eat something with salt in it before you march back out into that oven.", fx = { align = { order = 1 } } },
        { text = "I fight best hungry. It keeps me angry and sharp.", next = "BACK", reply = "Angry and sharp's all very well, sweetie, until you're angry and sharp and flat on your back in the dunes, so take a biscuit for the road.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Sweetie, I can make anything taste good, though hyena wants a long soak and basilisk wants a very sharp knife. Scorpid's the surprise, because once the stinger's off it tastes a bit like crab from the coast." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Sweetie, I can make anything taste good, though hyena wants a long soak and scorpid tastes a bit like crab. I've saved scraps for hunters' beasts before, and {pet} has the look of someone who'd never say no to a stockpot bone." },
      },
      choices = {
        { text = "Waste nothing from a kill. That honours the beast.", next = "BACK", reply = "That's my thinking too, sweetie, and you'd be surprised how far one scorpid goes once you know your way round the shell.", fx = { align = { light = 1 } } },
        { text = "A kill's just meat. Honour doesn't come into the kitchen.", next = "BACK", reply = "Maybe not for you, sweetie, but a good cook honours everything she puts in the pot, and the stew tastes better for it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "All of 'em, sweetie, whether they've coin or not, though don't tell Marin, because he thinks I charge, and he'd want his cut. You priests mend the body and the soul and I mend the stomach, and I'd say mine's the hardest job on a water ration." } },
      choices = {
        { text = "Feeding the hungry is holy work. Keep doing it, Sprinkle.", next = "BACK", reply = "You're a dear to say it, sweetie, and I'll keep on, though if Marin ever asks, I charged everyone double.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Charity on a water ration? The desert will punish that kindness.", next = "BACK", reply = "Maybe it will, sweetie, but a hungry town is a dangerous town, and I'd rather be poor and kind than rich and stabbed in the alley.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Dries it, bakes it and fills it with grit, sweetie, and that's before the flies arrive. I keep my spices sealed in jars from Booty Bay, and still the sand finds its way in, as if it's hungry too." } },
      choices = {
        { text = "The land gives little here. Waste none of it.", next = "BACK", reply = "That's my rule too, sweetie, and you'll find nothing goes to waste in my kitchen except Marin's leftovers, and those try to crawl away.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let the sand have its share. A little grit never hurt anyone.", next = "BACK", reply = "You've never bitten down on a sandy biscuit, have you, sweetie, because once you have, you'll never say that again.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "A cook always knows, sweetie, because you look at food the way I do, wondering what's been added. I'd ask you not to practice on anything in my kitchen, though, because Marin's experiments already give me enough to fix, and one of them blew the lid off my best pot." } },
      choices = {
        { text = "I'd never poison an innocent's food.", next = "BACK", reply = "I believe you, sweetie, though I'll still keep an eye on you while you're near my soup pot, just out of habit.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A weapon's a weapon, whatever it's mixed into.", next = "BACK", reply = "Not in my kitchen it isn't, sweetie, so mix your nasty things somewhere else and come to me for supper after.", fx = { align = { light = -1 } } },
        { text = "Let's talk about something else, sweetie.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Alive isn't the same as fed, sweetie, and anybody who's eaten my stew knows the difference. Still, in a drought like this I'll not turn my nose up at a mage's water, so long as you let me add a pinch of something to make it worth drinking." } },
      choices = {
        { text = "Food is for living, not for pleasure.", next = "BACK", reply = "Then you've never had my stew, sweetie, and I'll fix that tonight, because nobody leaves my table without smiling.", fx = { align = { order = 1 } } },
        { text = "You're right. Food should be enjoyed.", next = "BACK", reply = "There, you see, sweetie, that's all I've ever been trying to tell Noggy, and he still eats standing up over his bubbling pots.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Plenty, sweetie, because a goblin who won't pay a healer will still pay for soup, and that's just good business. I put a little something in it for the fevers and a little something for the taste, and between the two they mostly get better on their own." } },
      choices = {
        { text = "Leave real fevers to trained healers, Sprinkle.", next = "BACK", reply = "Oh, I do, sweetie, when there's a healer to leave them to, which out here is about once a month on a lucky week.", fx = { align = { order = 1 } } },
        { text = "Soup and kindness work fine. Folk don't need temple rules.", next = "BACK", reply = "My sentiments exactly, sweetie, and soup's never once asked a fellow to kneel before he drinks it.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Cactus apples, mostly, and a little of what grows in the shade near the Gaping Chasm, though the bugs there bite through gloves. Everything out here's bitter, so you get out at dawn and pick before the sun ruins it." } },
      choices = {
        { text = "Share your recipes. Good food keeps people alive here.", next = "BACK", reply = "I share them with anyone who asks nicely, sweetie, though nobody ever makes it taste the same, and I like it that way.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Keep your secrets. A cook's recipes are her living.", next = "BACK", reply = "You're sweet to think of my living, sweetie, but I'd rather the whole town ate well than keep a recipe nobody gets to taste.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Everyone who'll sit still long enough, sweetie, and plenty who won't. Noggy forgets to eat when he's brewing, the Bruisers forget when they're on watch, and somebody has to remember for all of them." } },
      choices = {
        { text = "That's good work, Sprinkle. Someone has to care for them.", next = "BACK", reply = "Thank you, sweetie, that warms me right through, and it's nice to hear it from someone who isn't asking for seconds.", fx = { align = { light = 1 } } },
        { text = "Grown folk can feed themselves. Let them learn.", next = "BACK", reply = "They can, sweetie, but they don't, and I'd rather fill their bellies than bury them, so I'll keep at it, thanks very much.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "It did, sweetie, and then it laughed about it, which was the part I minded most. Its master paid for the cloth and the biscuits, and I'll say he was very sorry, but I've kept a bucket by the door ever since." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "It did, sweetie, and then it laughed about it, which was the part I minded most. Your demon's giving my biscuit tin the same look right now, so I'll just move the bucket a little closer to the door while you keep an eye on it." },
      },
      choices = {
        { text = "I'll keep mine outside, then. Your biscuits are safe.", next = "BACK", reply = "You're a sweetie for it, and I'll save you a biscuit, though you'll eat it out of reach of those little claws.", fx = { align = { order = 1 } } },
        { text = "He'll behave. I won't leave him in the sun.", next = "BACK", reply = "Then I'll trust you, sweetie, but the bucket stays by the door, and if he so much as looks at my dough, it gets used.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_other", when = { alt = { faction = "other" }, metBefore = false },
          text = "Oh, sweetie, you look just like a {altrace} who ate at my table not long ago, {alt}, from the other side of the war and hungry as a hyena. I fed {alt} the same as I'd feed anybody, because nobody fights well on a full stomach, and that's my little contribution to the peace." },
        { id = "h_alt_kin", when = { alt = { kin = true } },
          text = "You've got the same face as {alt}, sweetie, who sat right there and told me my stew needed salt, which it didn't. Is it a family thing, being wrong about salt?" },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, sweetie? Then you'll know fire's the most important spirit in any kitchen, and I've a stove back here that could use a stern word from you." },
        { id = "h_default", key = true,
          text = "I'm Sprinkle, sweetie, and I fix things that taste wrong, mostly food, though lately it's mostly Marin's experiments. He calls it a partnership; I call it a favor he owes me, with interest, and I keep the books." },
        { id = "h_taste", key = true, tags = { "news" }, when = { questActive = TODO_QUEST("In Good Taste") },
          text = "Noggy's elixir tastes like a swamp? Of course it does, and swamp doesn't sell. There's a mushroom up in the Hinterlands that fixes anything, so bring me some, sweetie." },
        { id = "h_secret", when = { questActive = TODO_QUEST("Sprinkle's Secret Ingredient") },
          text = "When I was little I couldn't stand my sister's cooking, until I found the secret ingredient that fixed it. Fetch me some, would you, sweetie?" },
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
        { id = "h_dd_elixir", tags = { "news" }, when = { questDone = TODO_QUEST("Noggenfogger Elixir") }, text = "Noggy came round waving a bottle and telling me you drank his elixir and didn't turn into a skeleton, sweetie, or not for long anyway. He's been unbearable since, and I mean that with love." },
      },
      again = { { id = "h_again", text = "Anything else, sweetie?" }, { id = "h_again2", text = "Go on, sweetie; I'm stirring, but I can listen." } },
      choices = {
        { text = "Which desert plants do you cook with, Sprinkle?", next = "xdruid", when = { class = "DRUID" } },
        { text = "What does the desert do to food, Sprinkle?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Noggy?", next = "noggy", when = { heardLine = "sprinkle.h_taste" } },
        { text = "Do you have a secret to your cooking?", next = "secret" },
        { text = "Marin seems a clever sort.", next = "marin" },
        { text = "Who taught you to cook?", next = "sister" },
        { text = "Trade a recipe?", next = "trade", when = { profession = "Cooking" } },
        { text = "Hinterlands cooking, is it? I know Wildhammer cooking.", next = "x_dwarf", when = { race = "Dwarf", heardLine = "sprinkle.h_taste" } },
        { text = "You can tell I use poisons?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Conjured bread keeps you alive. Stop sneering at it.", next = "xmage", when = { class = "MAGE" } },
        { text = "Do the sick in Gadgetzan come to you, Sprinkle?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "You must feed the folk who come in from the desert, Sprinkle.", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What should a warrior eat before a long fight, Sprinkle?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Can you really make desert meat taste good, Sprinkle?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Do you look after many folk in Gadgetzan, Sprinkle?", next = "xapala", when = { class = "PALADIN" } },
        { text = "An imp really set your tablecloth on fire, Sprinkle?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Marin's elixir works, Sprinkle. Mostly.", next = "dd_elixir", when = { questDone = TODO_QUEST("Noggenfogger Elixir") } },
        { text = "Thanks, Sprinkle.", next = "END" },
      },
    },
    dd_elixir = {
      lines = {
        { id = "dd_elixir_1", text = "Mostly is about as good as Noggy ever gets, and he knows it, which is why he needed my powder to make it taste like anything but a boot. He'll never put my name on the label, but he did buy me a new pot, so I suppose that's goblin for thank you." },
      },
      choices = {
        { text = "You deserve credit on the label, Sprinkle.", next = "BACK", reply = "Oh, you're sweet! I'll tell him you said so, and he'll go red and change the subject, which is half the fun.", fx = { align = { honor = 1 } } },
        { text = "Take the pot and let him have the label.", next = "BACK", reply = "That's the practical answer, sweetie, and I suppose I already did. A good pot lasts longer than a label anyway.", fx = { align = { honor = -1 } } },
        { text = "Something else, Sprinkle.", next = "BACK" },
      },
    },
    noggy = {
      lines = { { id = "n_default", key = true, text = "That's my name for him, and mine alone. If anyone else calls him that, they'll be tasting my cooking without the secret ingredient." } },
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
        { text = "I doubt he'll ever pay you back.", next = "marin_pay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    marin_pay = {
      lines = { { id = "mp_default", text = "Oh, he pays, sweetie, in stories and in promises, and once in a very nice hat, which I've added to the ledger at full value and I'm keeping." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sister = {
      lines = { { id = "si_default", text = "My sister did, in a way, because her cooking was dreadful, but lovingly dreadful; she'd boil anything that stood still. I learned to cook so I'd survive, and I learned to fix food so I'd survive her." } },
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
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's a hard town for cooking, sweetie, with no water and nothing growing but cactus. But I make do, and the customers keep coming back." } },
    zul_farrak = { { id = "tp_zul_farrak", text = "The trolls of Zul'Farrak eat things I won't even put in my soup, sweetie, and I've put some strange things in my soup. Don't ask me what." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's got fresh fish and fresh fruit, sweetie, and I'd give my right arm for either one. Out here, the closest thing to fresh is a lizard that just stopped moving." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire cooks make a lovely sweet bread, sweetie, and I've been trying to get the recipe out of them for years. They won't budge." } },
    _none = { { id = "tp_none", text = "Couldn't say, sweetie. Can I get you something to eat instead? It's the best value in Gadgetzan." } },
  },
}

P:NPC {
  key = "bilgewhizzle", id = TODO_NPC("Chief Engineer Bilgewhizzle"), name = "Chief Engineer Bilgewhizzle",
  bible = "bibles/tanaris.md", role = "questgiver", tier = "quest",
  communities = { "gadgetzan" }, temper = { "harried" }, values = { "practical", "proud" },
  notices = { "craft", "kit", "lock_breath" },

  impression = {
    first = "He watches his pressure gauge the way others watch for storms.",
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
    { id = "n_lock_breath", cat = "lock_breath", when = { class = "WARLOCK", aura = { 5697 } },
      text = "Is that the warlock trick that lets you breathe under water? I've got springs full of muck that need somebody to dive down and look, pal, and you'd save me a fortune in diving bells." },
  },

  start = "hello",
  nodes = {
    xpt_bilgewhizzle = {
      big = true,
      lines = { { id = "xpt_bilgewhizzle_default", text = "Nothing at all, as long as they stay out of my machinery, because a gnome builds to see if a thing can be done and a goblin builds to see if it'll pay. The pump that keeps this town alive has to do both, every single day, and it's over budget at both." } },
      choices = {
        { text = "A machine should work first and dazzle later.", next = "BACK", reply = "Finally, somebody with sense, pal, and if you ever want to tell that to the gnome who keeps adjusting my pressure valves, be my guest.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Curiosity built Gnomeregan. Profit never invented anything.", next = "BACK", reply = "And look where curiosity left Gnomeregan, pal, while profit's been keeping this pump running for twenty years straight.", fx = { align = { order = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xcl_zf = {
      big = true,
      lines = { { id = "xcl_zf_default", text = "Broken for a season, maybe, and a season is all the Water Company needs to run new pipe out toward the west, if the Cartel signs the requisition, which it won't. The Sandfury have been fouling springs out there since before I owned my first wrench, so I'm waitin' on the gauges before I celebrate anything." } },
      choices = {
        { text = "Strike now, while they're leaderless. Mercy only gives them time to regroup.", next = "BACK", reply = "Strike now, sure, pal, and send me the invoice for the extra water you'll drink doing it, because I'm all for anything that clears the springs.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Let the survivors be. A beaten enemy deserves the chance to stay beaten.", next = "BACK", reply = "Beaten's fine, pal, as long as beaten means they stay off my pipes, and if it doesn't, I'm sending the bill to you.", fx = { align = { honor = 1 } } },
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
        { id = "xhuntcl_default", text = "Hyenas chew the seals, scorpids nest in the pump housings because it's cool in there, and I once found a basilisk sunning itself on the main valve like it paid for the privilege. Each critter costs me a crew day, pal, and every crew day costs Gadgetzan water and me a reprimand." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "If {pet} fancies a bit of work, there's a hyena pack that's been sniffing round the north well every night, and I'd be glad if they found something else to sniff." },
      },
      choices = {
        { text = "The town's water comes first. Clear the pests off the pipes.", next = "BACK", reply = "Now you sound like someone I'd hire, buddy, and the crew will happily point you at the basilisk that's been sitting on my valve all week.", fx = { align = { order = 1 } } },
        { text = "The beasts were here first. Build around them, not through them.", next = "BACK", reply = "Build around them? Do you know what a detour costs in pipe, pal, because I do, and I've got the requisitions to prove it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "If you can keep my crew standing in this heat, you'd be worth more to me than a new pump, and I don't say that lightly, because I've priced new pumps. The Wastewanderers jump them at the wells, and my crews come back either cut up or too scared to go out again." } },
      choices = {
        { text = "I'll tend your crew. A town's water is worth guarding.", next = "BACK", reply = "You've no idea how good that sounds, pal, and the crew will buy you a drink if any of them can still lift their arms.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let the weak ones fall. The desert keeps only the strong.", next = "BACK", reply = "Easy for you to say, buddy, but every one that falls is a crew day lost and a new hire I have to train, so they stay standing.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Sure they do, and they can line up behind Gadgetzan like everybody else. Every gallon a basilisk drinks is a gallon a paying customer doesn't, and the Company counts every one." } },
      choices = {
        { text = "Leave some for the wild. The desert was here first.", next = "BACK", reply = "Leave some, sure, pal, as soon as the Cartel writes it into my budget, which will be the same day the sand turns to grass.", fx = { align = { light = 1 } } },
        { text = "Gadgetzan comes first. The beasts can fend for themselves.", next = "BACK", reply = "That's how the Company sees it, buddy, and I'm too tired to argue with anyone who agrees with my bosses.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Deep wells, sunk through rock older than any of us, and pumps that cost more than this whole town, by my last copper. The water's down there, but it moves, and every year it moves a little further from where we've drilled, and every new well's another budget meeting." } },
      choices = {
        { text = "Water is a spirit, not a product. Treat it that way.", next = "BACK", reply = "A spirit, pal? Then the spirit owes me twenty years of back pay and a new drill bit, and I'd like it paid by Tuesday.", fx = { align = { honor = 1 } } },
        { text = "Water flows where it's paid to flow. Keep drilling.", next = "BACK", reply = "You'd do well in the Water Company, buddy, though I'd warn you the drilling's the easy part and the requisitions will kill you.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It could, and it would ruin me doing it, because I can't sell water you can make for free, pal. Still, I'd rather have a mage on the walls than a Wastewander at the well, so you'll get no complaints from me about the conjuring, only about the price." } },
      choices = {
        { text = "Water should be free to all in a desert.", next = "BACK", reply = "Free? Pal, you go tell that to the pump, and the pipes, and the boys who fix them, and come back when one of them agrees.", fx = { align = { order = -1 } } },
        { text = "Someone has to pay for the wells and pipes.", next = "BACK", reply = "Somebody finally said it, buddy, and I'd like you to say it again in front of the Cartel inspectors next time they visit.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Let's leave the water alone.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "No, they're thieves, and you're a professional, which I'll grant is different. The Wastewander steal water pouches by the dozen and sell them back to us, and a rogue who knew their camps could cut that trade off at the root." } },
      choices = {
        { text = "I'd go after them for honest pay.", next = "BACK", reply = "Honest pay I can manage, pal, barely, and if you cut that trade off at the roots I'll find the coin somewhere, even if it's under my own mattress.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They're only surviving. A thirsty man steals water.", next = "BACK", reply = "Thirsty men steal water, sure, pal, and then they sell it back to thirsty men at ten times the price, which isn't survival, it's competition.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Badly enough that I've stopped sending anyone out alone, and that slows the work, and slow work means thirsty people and angry memos from the Cartel. Water is life out here in the plainest sense, so every man they put in a sickbed costs this town more than a broken pump ever could." } },
      choices = {
        { text = "Then I'll tend your workers first and fight the bandits second.", next = "BACK", reply = "That's the right order, pal, because a healed crew can dig, and a crew that can dig keeps this town drinking.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Heal them later; hit the bandits hard enough and they'll stop coming.", next = "BACK", reply = "That's one plan, buddy, and I'll take it, but I'd still like my crew patched before they go back out with their guts showing.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Nobody, most nights, and the Wastewanderers know it as well as I do. The Cartel pays for walls and Bruisers inside them, but a pipe runs across a lot of open sand, and I can't hire enough guards to stand on every yard of it on what they budget me." } },
      choices = {
        { text = "The Cartel should guard its own pumps. That's its duty.", next = "BACK", reply = "Should, pal, is a lovely word, but the Cartel's duty is to its ledger, and the ledger says pipes don't vote.", fx = { align = { order = 1 } } },
        { text = "Forget the Cartel. Arm your crew and let them fight back.", next = "BACK", reply = "I've thought about it, buddy, but my crew are engineers, and an engineer with a sword is mostly an engineer with a cut hand.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Maybe, but every time someone burns down a bandit camp, the Wastewanders move to the next spring and foul it on the way out. What I need is the water back, clean, not a lot of smoking sand where our sources used to be." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Maybe, but every time someone burns down a bandit camp, the Wastewanders move to the next spring and foul it on the way out. Your demon's standing over my water barrels breathing that sulphur on them, too, so walk it somewhere else, because I need the water clean, not smoking." },
      },
      choices = {
        { text = "Then I'll get your water back, and leave the springs clean.", next = "BACK", reply = "You do that, pal, and I'll put your name on a memo to the Cartel, which is the closest thing to a medal I can afford.", fx = { align = { order = 1 } } },
        { text = "Burn the camps. They'll learn not to come back.", next = "BACK", reply = "Burn them, and they'll foul three more springs on the way out, buddy, so maybe save the fire for something that won't cost me water.", fx = { align = { order = -1 } } },
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
        { id = "h_dd_shakedown", tags = { "news" }, when = { questDone = TODO_QUEST("Southsea Shakedown") }, text = "The Security Chief down at Steamwheedle Port, who is no relation of mine whatever anybody tells you, says you shook down the Southsea at Lost Rigger Cove for him, and now he won't stop writing me letters about it. Every letter costs me a reply, pal, so I'd appreciate it if you'd stop being so heroic for a week." },
      },
      again = { { id = "h_again", text = "What else? Quickly, pal, the gauge is twitching, and a twitching gauge is about to be an expensive gauge." } },
      choices = {
        { text = "Where does Gadgetzan's water really come from?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "The desert's creatures need water too, Chief Engineer.", next = "druid_q", when = { class = "DRUID" } },
        { text = "Water must be hard to come by in a desert town.", next = "water" },
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
        { text = "My magic could make short work of the Wastewanders, Chief Engineer.", next = "xlock", when = { class = "WARLOCK" } },
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
        { text = "I'll meet them in the open, where they can see me coming.", next = "BACK", reply = "Good, pal, let 'em see you coming, because a few running away is as good as a few cut down, and it's cheaper on the cleanup.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll hit their camps at night, while they sleep.", next = "BACK", reply = "Sneaky, but I'm not complaining, buddy, as long as you don't knock over any of my towers on the way in.", fx = { affinity = 1, align = { honor = -1 } } },
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
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan lives or dies by that water tower, pal, and every day I keep it running is a day nobody has to kill anybody for a drink. That's not a joke, pal, that's a schedule." } },
    zul_farrak = { { id = "tp_zul_farrak", text = "The trolls in Zul'Farrak curse our wells, pal, and I'm the one who has to clean them out. I'd like somebody to talk to them about it, with an axe preferably." } },
    ratchet = { { id = "tp_ratchet", text = "Ratchet's got the sea, pal, so they don't know what a real water shortage is. I'd trade places with Gazlowe's engineers in a heartbeat." } },
    steamwheedle = { { id = "tp_steamwheedle", text = "The Cartel pays my wage, and the Water Company pays my bills, and both of them think I'm somebody else's problem. I'm everybody's problem, pal, because I'm the water." } },
    _none = { { id = "tp_none", text = "Unless it's wet or it's billed, it's not my department." } },
  },
}

P:NPC {
  key = "fizzledowser", id = TODO_NPC("Senior Surveyor Fizzledowser"), name = "Senior Surveyor Fizzledowser",
  bible = "bibles/tanaris.md", role = "scholar", tier = "quest",
  communities = { "gadgetzan" }, temper = { "cautious" }, values = { "practical", "dutiful" },
  notices = { "craft", "lock_shadow" },

  impression = {
    first = "He expects every simple job to go wrong, and is usually right.",
    third = "{name} met Senior Surveyor Fizzledowser, who searches the desert for new water on behalf of the Gadgetzan Water Company.",
  },

  greetings = {
    { id = "g_maps", text = "Careful with the maps, pal, because they cost the Company a fortune and every one of those circles is a place we used to have water." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = { "Engineering", "Mining" } },
      text = "You know the ground, or the gadgets, and either one helps, buddy; both would be a miracle, and miracles aren't in my budget." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "My dowsing rods just swung round and pointed at you, which they do for water and, apparently, for whatever it is you're wrapped in. I'm writing that down, because it's the most interesting thing they've done all month." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "More than I get, always, because the Wastewanderers watch the wells and they know a dowsing rod when they see one, and they know what it's worth. I've stopped marking the good sources where anyone can read them, which means some days I can't read them either." } },
      choices = {
        { text = "Keep your guards close and your maps closer. Caution wins.", next = "BACK", reply = "Caution's kept me alive this long, friend, though it hasn't kept my wells, so I'll take whatever luck you've got to spare.", fx = { align = { order = 1 } } },
        { text = "Strike the bandits first, and the wells stay yours.", next = "BACK", reply = "That's a plan I'd sign, pal, if I could get the Cartel to pay for it, which I can't, so go strike them on your own coin.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "That every beast in Tanaris knows where the water is before I do, which is humbling for a senior surveyor on a senior surveyor's wage. I've started following the hyenas, frankly, and they've been right more often than my rod has, and they work for free." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "That every beast in Tanaris knows where the water is before I do, so I've started following the hyenas. Does {pet} have a good nose? I'd trade my dowsing rod for a beast that could smell a spring under the sand, pal." },
      },
      choices = {
        { text = "Share the water with the beasts. They found it first.", next = "BACK", reply = "I've thought about it, friend, and the hyenas would agree with you, but the hyenas don't sign my survey reports.", fx = { align = { light = 1 } } },
        { text = "The town needs that water more than any hyena does.", next = "BACK", reply = "It does, pal, but you go and tell that to the hyena standing on it, and I'll wait right here with my clipboard.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Nothing makes them go better, in my experience, but a prayer might make them go less badly. Every circle on this map is a well that's dried up, been poisoned or been taken by the Wastewanderers, so I'd welcome the blessing of anything that can find water in sand." } },
      choices = {
        { text = "I'll bless your survey. Careful work deserves a careful prayer.", next = "BACK", reply = "Thank you, friend, I'll take any help I can get, and this map could use a blessing more than most things in Tanaris.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Forget your map. Water goes where it pleases, as I do.", next = "BACK", reply = "And look where pleasing yourself got you, pal, standing in my office with a dry waterskin and no idea where the next well is.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Wrong is the polite word for it. Bugs that size don't just appear at a water hole, and Alchemist Pestlezugg says they're organized, which is the last thing I wanted to hear from anybody." } },
      choices = {
        { text = "Study them first. We don't know what they are yet.", next = "BACK", reply = "That's the cautious way, friend, and I'd like it to be the right way, but every day we study them, they get a little bigger.", fx = { align = { order = 1 } } },
        { text = "Burn their nests now, before anyone wastes time studying.", next = "BACK", reply = "Burn them, then, pal, and come back to tell me whether they burned, because I'm not going down there to check.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Maybe, though everything out here goes wrong for me sooner or later, so I'd expect the spell to find a Wastewander camp instead, or blow up. I've lost good surveyors to Thistleshrub and to bandits, and a fancy spell doesn't make the desert any kinder or the insurance any cheaper." } },
      choices = {
        { text = "Try new methods. The old way keeps failing.", next = "BACK", reply = "I'd love to, friend, but the last new method was a gnome with a divining machine, and the machine divined itself into a cactus.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Stick to your rods. They've worked for years.", next = "BACK", reply = "Thank you, pal, finally, because my rods have never once exploded, and in Gadgetzan that's a ringing endorsement.", fx = { align = { order = 1 } } },
        { text = "Something else, please.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Quietly would be new, pal, because my lads go in loud and come out running, and they drop the expensive gear every time. If you can slip into a bandit camp and slip out again, you'd be the first plan of mine in a month that didn't go wrong." } },
      choices = {
        { text = "Leave the thieves alone. Your gear isn't worth blood.", next = "BACK", reply = "It isn't, friend, but the Cartel will dock it from my wages anyway, so maybe the blood isn't mine to spare either.", fx = { align = { light = 1 } } },
        { text = "Thieves deserve what's coming to them.", next = "BACK", reply = "Then you're the fellow I've been looking for, pal, and if you can bring back even one of my rods, I'll owe you more than I can afford to say.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because out here water is gold, pal, and whoever controls the wells controls who lives in Tanaris. The Wastewanderers know that, so they hit the sources first and the caravans second, and I've budgeted for every job to go wrong." } },
      choices = {
        { text = "Water should be shared under law, not seized by bandits.", next = "BACK", reply = "Shared under law, friend, is how it ought to work, and I'll believe it when the Wastewanderers learn to read a contract.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Whoever can hold a well has earned it, I suppose.", next = "BACK", reply = "That's the desert's law, pal, and I don't like it, but I've stopped arguing with it, because it listens about as well as my bosses do.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "They point at something under Sandsorrow Watch, and I'd hoped it was water. Pestlezugg thinks the strange insects there came up from below, and if they did, I don't like to think what else might follow them." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "They point at something under Sandsorrow Watch, and I'd hoped it was water. Your demon went very still when I unrolled that map just now, and I'd rather it hadn't, because if something's following those insects up from below, I don't want to know it recognises the place." },
      },
      choices = {
        { text = "Then we should find out what's down there, carefully.", next = "BACK", reply = "Carefully, yes, friend, and preferably with someone who isn't me, because I'm a surveyor, not a hero.", fx = { align = { order = 1 } } },
        { text = "If something's below, I'd like to meet it.", next = "BACK", reply = "Then you'll go down there without me, pal, and if you meet it, ask it whether it's sitting on my water.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The Wastewanders, mostly, and the heat, and the bugs at Sandsorrow that don't look like any bug in my books. Two of my lads haven't gone back out since the last trip, even for hazard pay, and I can't say I blame them." } },
      choices = {
        { text = "Then I'll go out with them next time.", next = "BACK", reply = "You'd do that, friend? Then they might go back out after all, and I'd stop doing their share of the measuring myself.", fx = { align = { light = 1 } } },
        { text = "They're paid to survey. Fear isn't an excuse.", next = "BACK", reply = "They're paid to survey, pal, not to be eaten, and I'll not shame a fellow for running from a bug the size of a wagon.", fx = { align = { light = -1 } } },
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
          text = "Giant insects, at a water hole? That's not natural, and it's definitely not in the budget. Bring me pieces from their lair, and Alchemist Pestlezugg can tell us what they are." },
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
          text = "A hunter? Oh, good, someone who can read tracks, because every puddle I find out there already has paw prints all round it." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock. Please don't summon anything near my dowsing rods, pal, because they twitch at every strange thing, and I've already got a month of readings that point at demons and a boss who wants them explained." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest, out here with the surveyors? Good, because my crew comes back from the dunes sunburnt and scared, and I'm a surveyor, not a nursemaid." },
        { id = "h_dd_pouches", when = { questDone = TODO_QUEST("Water Pouch Bounty") }, text = "Luglunket tells me you've been bringing back water pouches from the Wastewanders, and every one of them shows up in my figures as a little less water missing. I do love it when the numbers improve, and so does the Company." },
      },
      again = { { id = "h_again", text = "Somethin' else? I'll mark it on a map, and the map goes on the expense report." } },
      choices = {
        { text = "Something in this desert feels wrong to me.", next = "druid_q", when = { class = "DRUID" } },
        { text = "Have you found anything strange out in the dunes?", next = "insects" },
        { text = "Finding water in a desert can't be easy.", next = "dowsing" },
        { text = "What happened to the old sources?", next = "maps" },
        { text = "Pestlezugg thinks they come from Un'Goro.", next = "ungoro", when = { heardLine = "pestlezugg.h_march" } },
        { text = "The earth would tell me where water runs.", next = "x_shaman", when = { class = "SHAMAN" } },
        { text = "Could magic really find water faster?", next = "xmage", when = { class = "MAGE" } },
        { text = "I could get your gear back quietly.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Why would bandits steal water rather than gold?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would a prayer make your surveys go better, Fizzledowser?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "How many guards does a survey party really need, Fizzledowser?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What do the tracks around your water sources tell you?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Your dowsing rods seem to point at demons, Fizzledowser.", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What frightens your survey crews, Fizzledowser?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "I'll go and look.", next = "END", fx = { affinity = 1 } },
      },
    },
    insects = {
      big = true,
      lines = {
        { id = "i_default", text = "Giant insects at Sandsorrow Watch, pal. They're big, organized, and coming up out of the sand where they've no business being. I don't think this stops at Tanaris, though I'd love to be wrong." },
      },
      choices = {
        { text = "Let's find out.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Others ought to hear about this.", next = "insects_who" },
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
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's the only town in Tanaris with water, pal, and I spend my days making sure it stays that way. Every circle on my map is a well that went dry, and it's a lot of circles." } },
    zul_farrak = { { id = "tp_zul_farrak", text = "The trolls of Zul'Farrak are sitting on the best water in the desert, pal, I'd stake my widget on it. I've never been close enough to check, because I'd like to keep my head." } },
    silithid = { { id = "tp_silithid", text = "The bugs to the west are digging tunnels under the sand, pal, and I've felt the ground shake from them on my surveys. That's the sort of thing that keeps a surveyor up at night." } },
    centaur = { { id = "tp_centaur", text = "The centaur up in Thousand Needles shoot at anything with wheels, pal, and they've put holes in more than one of my survey carts. I've started bringing spares." } },
    _none = { { id = "tp_none", text = "I haven't surveyed that, I'm afraid, or not yet, and not without a signed work order." } },
  },
}

P:NPC {
  key = "pestlezugg", id = TODO_NPC("Alchemist Pestlezugg"), name = "Alchemist Pestlezugg",
  bible = "bibles/tanaris.md", role = "vendor", tier = "quest",
  communities = { "gadgetzan" }, temper = { "brisk" }, values = { "curious", "practical" },
  notices = { "craft", "pet", "lock_shards" },

  impression = {
    first = "He trusts his rat Rose over any person in Gadgetzan.",
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
      text = "Keep {pet} away from Rose, chum. She's small, but she bites, and she's been at the reagents, and I'm not liable for anything she's been at." },
    { id = "n_lock_shards", cat = "lock_shards", when = { class = "WARLOCK", carrying = { id = 6265, min = 15 } },
      text = "Is that a full bag of soul shards? I can feel the cold from here, and my rat's gone under the counter, so I'd say fifteen at least. I'd love to know what one does in a crucible, but I'm fond of my remaining eyebrows." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Fetching things from places that bite, sting or turn you to stone, mostly, and not drinking anything off my bench without paying. The last warrior who helped me swigged a basilisk extract before a fight, and Rose still won't go near him." } },
      choices = {
        { text = "Know what you drink before a fight. Discipline keeps you alive.", next = "BACK", reply = "Ha, that's what I tell everybody, pal, and Rose agrees, though the last warrior who listened still came back green round the gills.", fx = { align = { order = 1 } } },
        { text = "If it makes me stronger in a fight, I'll drink it.", next = "BACK", reply = "Then you'll drink it after you've paid, friend, and you'll sign this little paper first saying you were warned.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Glands, stingers, the odd basilisk eye, all the lovely bits a hunter usually throws away, and I pay by the ounce. Scorpid venom goes into half the antidotes in Gadgetzan, which I find delightfully ironic and very profitable." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Glands, stingers, the odd basilisk eye, all the bits a hunter usually throws away, and I pay by the ounce. Do keep {pet} at a polite distance from Rose, my little assistant, because she's quite small enough to be mistaken for a snack." },
      },
      choices = {
        { text = "Kill only what you need, and use all of it.", next = "BACK", reply = "A hunter with principles, pal, and I'll take the leftovers you don't need, which by your rule should be none.", fx = { align = { light = 1 } } },
        { text = "The desert's full of beasts. Take what you like from it.", next = "BACK", reply = "Now that's the attitude that keeps my shelves stocked, friend, and I'll pay by the ounce for anything that still twitches.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Things the Sandfury hexed before they died, mostly, carried in from Zul'Farrak by people who ought to know better. Their humors are all wrong, there's a loa's mark on the bone, and Rose won't go near them, which is all the proof I need." } },
      choices = {
        { text = "Bring them to me first. I'll cleanse the hex before you cut.", next = "BACK", reply = "I'd welcome that, friend, because Rose won't sniff them and I'd like to cut one open without hearing whispers.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Keep them. A hexed corpse has much to teach a priest.", next = "BACK", reply = "Teach, maybe, pal, but Rose doesn't like the lessons, and when Rose leaves the room, I leave right after her.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Pieces of those giant insects from Sandsorrow Watch, and they're nothing like a scorpid on the inside. Gracina Spiritmight in Darnassus thinks they're tied to Un'Goro, and the more I cut, the more I think she's right." } },
      choices = {
        { text = "Send word to the Circle. This needs many eyes.", next = "BACK", reply = "You're right, friend, and I've written to Gracina twice already, though I'd like a third pair of eyes on these that isn't Rose's.", fx = { align = { order = 1 } } },
        { text = "Keep it quiet until you're sure. Rumors spread faster than bugs.", next = "BACK", reply = "That's my instinct too, pal, because if the town hears giant bugs are crawling out of the ground, the price of everything goes up.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Some of it, yes, which is the interesting part. The scorpids down in the southern dunes carry stronger venom than the ones near town, and I think it's whatever's in the water they drink, though Rose and I haven't proved it yet." } },
      choices = {
        { text = "Poisoned water means a wounded land. Someone should heal it.", next = "BACK", reply = "You might be right, friend, and if you find the wound, I'll make the salve, though I'd like a sample first.", fx = { align = { honor = 1 } } },
        { text = "Stronger venom sells for more. Bottle it.", next = "BACK", reply = "Oh, I'm already bottling it, pal, and the stronger batch sells three to one, so you've got the head for business.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Someone who can freeze a sample before it goes off in this heat, mostly, and I'd pay well for that. Whatever the Water Company finds in the bad wells rots in an hour, and a stale sample smells like a dead kodo and tells me nothin'." } },
      choices = {
        { text = "Science needs patience, not shortcuts.", next = "BACK", reply = "Patience, friend? In this heat? My samples rot before I've finished uncorking them, so I'll take a shortcut and a fan.", fx = { align = { order = 1 } } },
        { text = "Use whatever works, magic included.", next = "BACK", reply = "My thoughts exactly, pal, and if you can freeze a sample on the spot, I'll pay you to stand by my bench all day.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "It interests me, which is worse, because interesting things blow up, and the last interesting thing took my eyebrows and a whole shelf of stock. I'd be curious what fel residue does to a reagent, but I'd want it kept in a jar a long way from my rat." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "It interests me, which is worse, because interesting things blow up, and the last interesting thing took my eyebrows and a whole shelf of stock. I'd love a scraping of whatever residue comes off your {pet}, but my rat has gone under the counter and won't come out, so it'll have to stand a long way off." },
      },
      choices = {
        { text = "Fel is just another reagent. Study it.", next = "BACK", reply = "Another reagent with a very nasty temper, friend, but you're right, and if you bring me a pinch, Rose and I will stand well back.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Keep it far from your rat. It corrupts.", next = "BACK", reply = "Rose agrees with you, friend, and she's usually right, so I'll keep my curiosity on a shelf where it can't get her.", fx = { align = { light = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Silt, salt, a dead scorpid or two and, once, something that smelled of the grave, which Rose wouldn't go near and neither would I. Most of it's only nature being unpleasant, but I keep that sample in a locked jar, because some sicknesses don't come from nature at all." } },
      choices = {
        { text = "Taint like that should be burned and prayed over, not studied.", next = "BACK", reply = "You might be right, friend, and I've thought about it, but I can't help wanting to know what it is first.", fx = { align = { light = 1 } } },
        { text = "Study it closely. Even a foul thing can teach us something.", next = "BACK", reply = "My thinking exactly, pal, though I'll keep the lid on tight, because some lessons you only need to learn once.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Most of it, if you drink it wrong, and a few things if you drink it right. The Water Company brings me whatever crawls out of their pipes, pays me by the jar, and I take it apart so they know whether to worry, which these days they usually should." } },
      choices = {
        { text = "Then label it well, and keep it from fools.", next = "BACK", reply = "I label everything, friend, twice, and the fools still drink it, which is good for business and bad for my conscience.", fx = { align = { order = 1 } } },
        { text = "Danger sells. Put it on the front shelf.", next = "BACK", reply = "Danger sells, pal, sure, but front shelf is where kids reach, and I'm not that kind of goblin, whatever the Cartel says.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Scorpid venom, mostly, and a few extracts from the plants down by Lost Rigger Cove that'll make a man see things. I sell to rogues and hunters both, pal, cash up front, and I don't ask whom it's for, but I'd rather not hear about it afterwards." } },
      choices = {
        { text = "You won't hear of it. I use it only on enemies.", next = "BACK", reply = "I'll take your word for it, friend, and I'll take your coin too, and we'll call that an understanding.", fx = { align = { order = 1 } } },
        { text = "What I do with it is my business, alchemist.", next = "BACK", reply = "It is, pal, and so's my rat's nose, and she's going to keep sniffing you until you've paid and walked out.", fx = { align = { order = -1 } } },
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
          text = "I need a scent gland from one of the hive's own insects and a handful of Un'Goro soil, and with the two I can build a lure. I'd rather not say what it's for just yet." },
        { id = "h_rose", when = { metBefore = true }, text = "Rose ate the label off a jar again, so now I've a jar of something, worth something, and no idea what. She looks pleased with herself, which worries me." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "Rose, mind your manners, it's a druid. Druids always ask what I'm dissecting, and they never like the answer." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage. Good, you'll have a steady hand, and Rose likes steady hands; she bites the shaky ones, and I don't pay for the bandages." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Warlock. I can smell the brimstone on your sleeve, and so can Rose, and she's hiding behind the flasks about it." },
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
        { text = "You've got something strange on that table, Pestlezugg.", next = "druid_q", when = { class = "DRUID" } },
        { text = "Let's see your supplies.", next = "BUSINESS" },
        { text = "Who's Rose?", next = "rose" },
        { text = "What nasty things have you taken apart lately?", next = "insects" },
        { text = "Talk shop with me.", next = "shop", when = { profession = "Alchemy" } },
        { text = "Your rat doesn't like my imp much.", next = "x_warlock", when = { class = "WARLOCK" } },
        { text = "What does an alchemist want with a mage?", next = "xmage", when = { class = "MAGE" } },
        { text = "Does my craft bother you, alchemist?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What foul things have you found in the water, Pestlezugg?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Which dead things have looked back at you, Pestlezugg?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What do you need a warrior for, Pestlezugg?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "What do you need from the beasts of Tanaris, Pestlezugg?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Some of what's on your shelves looks dangerous, Pestlezugg.", next = "xapala", when = { class = "PALADIN" } },
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
      lines = { { id = "i_default", text = "Giant insects from Sandsorrow Watch, pal: hard shells, a shared scent, the same markings on every last bug. That's not a swarm; it's a hive with somewhere to be." } },
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
        { text = "My imp does exactly as it's told.", next = "BACK", reply = "Good, friend, then tell it to stay out of the sulfur, because Rose has been glaring at it since you walked in.", fx = { align = { order = 1 } } },
        { text = "My imp does as it likes. I've stopped arguing.", next = "BACK", reply = "Then you'll pay for whatever it eats, pal, and I'll start the bill right now, because Rose says it's already sniffing the brimstone.", fx = { align = { order = -1 }, trait = { witty = 1 } } },
        { text = "I'd guess you sell a thing or two for my kind of work.", next = "x_warlock_shop" },
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
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's the best place for an alchemist, pal, because nobody minds a few strange smells when everybody already smells like sweat. Rose agrees." } },
    zul_farrak = { { id = "tp_zul_farrak", text = "The trolls of Zul'Farrak brew potions I'd love to study, pal, using reagents I'd love to get my hands on. Rose is very curious about them too." } },
    silithid = { { id = "tp_silithid", text = "The silithid have ichor that would make a wonderful base for a solvent, pal, if it didn't keep trying to eat the jar. I've lost three jars that way." } },
    emerald_dream = { { id = "tp_emerald_dream", text = "The druids talk about a dream world where everything's green and growing, pal, and I'd love to collect a sample. Rose doesn't believe in it, but Rose doesn't believe in much." } },
    _none = { { id = "tp_none", text = "If you can't distill it, dissect it or sell it, I'm not your goblin." } },
  },
}

P:NPC {
  key = "tranrek", id = TODO_NPC("Tran'rek"), name = "Tran'rek",
  bible = "bibles/tanaris.md", role = "questgiver", tier = "quest",
  communities = { "gadgetzan" }, temper = { "evasive" }, values = { "cunning", "ambitious" },
  notices = { "purse", "lock_soulstone" },

  impression = {
    first = "He answered every question about his business without answering any.",
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
    { id = "n_lock_soulstone", cat = "lock_soulstone", when = { carrying = { 5232, 16892, 16893, 16895, 16896 } },
      text = "Is that a soulstone in your pack, pal, a whole soul's worth sitting in there ready to be spent? I stay out of soul business, as I've said, but I'll admit I've always wondered what one would fetch on the open market." },
  },

  start = "hello",
  nodes = {
    op_booty_bay = {
      lines = {
        { id = "opb_q", text = "Speakin' of my cousin Krazek's port, you've been to Booty Bay, haven't ya, or you will be. What do you think of the place, just between two people in the trade?" },
      },
      choices = {
        { text = "Best port in the world. Everything's for sale there.", next = "op_booty_bay_r1", fx = { affinity = 1, align = { order = -1 }, opinion = { booty_bay = "admire" } } },
        { text = "A nest of crooks wearing Cartel badges.", next = "op_booty_bay_r2", fx = { align = { order = 1 }, trait = { skeptical = 1 }, opinion = { booty_bay = "distrust" } } },
        { text = "Revilgaz keeps it fair enough. I'd trade there.", next = "op_booty_bay_r3", fx = { trait = { practical = 1 }, opinion = { booty_bay = "useful" } } },
        { text = "I don't talk shop with you, Tran'rek.", next = "BACK" },
      },
    },
    op_booty_bay_r1 = {
      lines = {
        { id = "op_booty_bay_r1", text = "Everything, yeah, includin' your boots if you fall asleep at the dock. I like how you think, though." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_booty_bay_r2 = {
      lines = {
        { id = "op_booty_bay_r2", text = "Crooks with badges, kid, are what we call a regulated industry. Don't say it near Krazek, though; he's sensitive about the badge." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_booty_bay_r3 = {
      lines = {
        { id = "op_booty_bay_r3", text = "Fair enough for a baron, which is to say he takes his cut with a smile. You'll do fine there." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xcl_zf = {
      big = true,
      lines = { { id = "xcl_zf_default", text = "Bad? A city with no chief is a city with nobody watching the storerooms, and there are scarabs carved in that place older than Gadgetzan's oldest debt. The trouble is that every goblin in Tanaris heard the same news this morning, and margins don't survive a crowd." } },
      choices = {
        { text = "Those relics belong to the dead who carved them. Leave them buried.", next = "BACK", reply = "Leave them buried, mon? Somebody else will dig them up by the next moon, and they won't say a prayer over them like Tran'rek would.", fx = { align = { honor = 1 } } },
        { text = "Dig them up and sell them. The dead don't haggle.", next = "BACK", reply = "Ha, you got de right idea, friend, though the dead in Zul'Farrak do haggle, in their own way, so mind your back.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Who buys Sandfury scarabs, anyway?", next = "xcl_zf2" },
      },
    },
    xcl_zf2 = {
      lines = { { id = "xcl_zf2_default", text = "Collectors in Booty Bay, a few scholars in Ironforge who pretend they don't buy from goblins, and the odd Forsaken who never says what it's for. Each of them thinks the scarabs mean something different, and I let 'em all go on thinking it, at full price." } },
      choices = {
        { text = "Your secrets are safe with me, Tran'rek.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Depends on the thing and depends on who's asking, and I'm not telling you either, not for free. Sandfury blades out of Zul'Farrak fetch good coin up north, and I don't ask whose hand they came out of, so you don't have to tell me." } },
      choices = {
        { text = "I only sell what I've won in a fair fight.", next = "BACK", reply = "Fair fights be fine, friend, and Tran'rek pays de same for fair loot as for foul, so bring it all.", fx = { align = { honor = 1 } } },
        { text = "Spoils are spoils. Where they came from is nobody's business.", next = "BACK", reply = "Dat's how Tran'rek sees it too, mon, and you an' me gonna get along just fine.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "People who've never seen a desert and want to say they have, mostly. A basilisk eye in a glass case sells in Booty Bay for more than you'd guess, and I'll leave you to guess what I pay for one." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "People who've never seen a desert and want to say they have, mostly, and a basilisk eye in a glass case sells well in Booty Bay. Not that I'm looking at {pet} that way, mind, because I don't deal in live goods." },
      },
      choices = {
        { text = "Some kills aren't for selling. They're for respect.", next = "BACK", reply = "Respect is good, friend, but respect don't fill a belly, and dis troll got a big appetite.", fx = { align = { light = 1 } } },
        { text = "Every part of a kill has a price. Name yours.", next = "BACK", reply = "Now you talkin', mon, and Tran'rek'll make you an offer you'll pretend not to like.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Nothing is wrong with them, friend, and that's the trouble, because they still work, and the loa they call on are no friends of ours. I sell them to collectors a long way from here at a very long markup, and what the collectors do with them is no business of mine." } },
      choices = {
        { text = "Burn them, Tran'rek. Some loa are better left unfed.", next = "BACK", reply = "Burn dem? And make de loa angry wit' Tran'rek? No, friend, better dey go far away to some fool who don't know what he's holdin'.", fx = { align = { light = 1 } } },
        { text = "Sell me one. I'd like to hear that loa speak.", next = "BACK", reply = "You don't want to hear dat loa, mon, trust Tran'rek, but if you insist, it be costin' extra for de nightmares.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Scorpid shell, basilisk hide, troll trinkets from round Zul'Farrak, and now and then a stone that hums when you hold it. Those go to a buyer in Booty Bay at a price I won't repeat, and that's as much as you're getting out of me, pal." } },
      choices = {
        { text = "A humming stone has a spirit in it. Selling it is wrong.", next = "BACK", reply = "Maybe it does, friend, and maybe de spirit wants to see Booty Bay, so who be Tran'rek to argue wit' it?", fx = { align = { honor = 1 } } },
        { text = "If the stone hums, charge double. That's good business.", next = "BACK", reply = "Dat's a troll after my own heart, even if you not a troll, mon, and I'll put de price up right now.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Offering? I don't offer anything, friend; I just mention things. Now, if somebody happened to bring me something from Lost Rigger Cove the pirates were fond of, I might happen to pay well for it, and nobody would happen to remember." } },
      choices = {
        { text = "I don't steal for other people.", next = "BACK", reply = "Den you keep your own loot, friend, and Tran'rek keeps his coin, and nobody gets hurt.", fx = { align = { honor = 1 } } },
        { text = "Pirates' goods are anyone's goods.", next = "BACK", reply = "Exactly what Tran'rek says, mon, and if somebody brings me anything from Lost Rigger, Tran'rek pays well and forgets fast.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because everyone sells something, friend, and your sort always have the strangest things to offer. I keep away from soul business in general, because the Cartel doesn't like it and the margins are lousy, and I'm fond of the Cartel liking me." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Because everyone sells something, friend, and your sort always have the strangest things to offer. That one's been watching my scales the whole time like it's working out a better rate, and I keep away from soul business, because the margins are lousy and the Cartel likes me." },
      },
      choices = {
        { text = "The Cartel's rules aren't my concern.", next = "BACK", reply = "Maybe not yours, friend, but Tran'rek still lives in dis town, so take your soul business somewhere far from my tent.", fx = { align = { order = -1 } } },
        { text = "Wise. Some trade isn't worth the coin.", next = "BACK", reply = "Dat's what Tran'rek thinks too, mon, and a troll who lives a long time picks his trades careful.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Scarabs, mostly, the ones carved in Zul'Farrak and the ones that crawl, and you'd be surprised what a collector pays for either. Herbs too, when the pickers come back alive, which isn't as often as I'd like, and replacing pickers costs money." } },
      choices = {
        { text = "If someone pays, sell it. The dead don't need scarabs.", next = "BACK", reply = "Dat's de spirit, friend, and if you find any scarabs on your travels, you know where Tran'rek sits.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Leave the dead their scarabs. Some things aren't for sale.", next = "BACK", reply = "Maybe not, mon, but somebody's selling dem anyway, and Tran'rek would rather it be him than a fool from Booty Bay.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "The Cartel's rules, not Stormwind's, and the Cartel's rules are what count in Gadgetzan. I buy turtle shells and Sandfury trinkets, and if the trolls don't like it, they should've thought of that before they sat on all that loot." } },
      choices = {
        { text = "Cartel rules or not, plunder is plunder.", next = "BACK", reply = "Plunder's a big word for some shells, friend, and Tran'rek didn't take dem, he only bought dem.", fx = { align = { order = 1 } } },
        { text = "Trade is trade in a free town, shells and all.", next = "BACK", reply = "Now you understand Gadgetzan, mon, and dat's more than most of de folk who walk through my tent.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Because the trolls guard them like they're worth something, and some of them hum at night, which is either magic or beetles. Either way, a buyer in Booty Bay pays more for magic than for beetles, so I'd like to know which I've got." } },
      choices = {
        { text = "Some troll charms are cursed. Sell them carefully.", next = "BACK", reply = "Careful be Tran'rek's middle name, friend, and if one starts whisperin' to de buyer, dat's between dem and de loa.", fx = { align = { order = 1 } } },
        { text = "Tell the buyers they're all magic. They'll never know.", next = "BACK", reply = "Ha, maybe dey won't, mon, but Tran'rek prefers to know, because cursed buyers come back angry.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Well, it's good for me, pal, and that's a start. The goods move, the coin moves, and the coin keeps Gadgetzan's lights on, so I'd say I'm doing the town a favor, even if I take a small cut for my trouble, or a medium one." } },
      choices = {
        { text = "Charity doesn't take a cut, Tran'rek.", next = "BACK", reply = "No, but charity don't keep a troll fed either, friend, so Tran'rek'll leave charity to de priests.", fx = { align = { light = 1 } } },
        { text = "Coin keeps the town alive. That's charity enough.", next = "BACK", reply = "Dat's what Tran'rek tells everybody, mon, and now you be saying it too, so it must be true.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_other", when = { alt = { faction = "other" }, metBefore = false },
          text = "Huh, I sold a crate to a {altrace} named {alt} last week, pal, from the other side of the war, and here you are with the same nose for a bargain. Don't tell me who you're related to, because I don't want to know who I'm selling to, and that's the whole business model." },
        { id = "h_alt_higher", when = { alt = { higher = true } },
          text = "{alt} came by, all grown up and carrying a heap of Zul'Farrak's leftovers, and I paid fair, mostly. You've got the same eye for goods, pal, so come back when you're carrying as much." },
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
        { id = "h_dd_dunemaul", tags = { "news" }, when = { killed = { name = "Dunemaul", min = 30 } }, text = "The Dunemaul ogres haven't been bothering my suppliers out in the south dunes lately, pal, and my suppliers all describe somebody who looks a lot like you. Fewer ogres means cheaper shells, and cheaper shells means a fatter margin for me." },
      },
      again = { { id = "h_again", text = "Still here asking questions? That's how I started, pal, and look where it got me, which I won't tell you." } },
      choices = {
        { text = "What do you buy from the desert?", next = "xdruid", when = { class = "DRUID" } },
        { text = "The desert must give up a few things worth buying.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What sells best for you?", next = "shells" },
        { text = "Being Krazek's cousin must be a trial.", next = "krazek", when = { any = { { questActive = TODO_QUEST("Tran'rek") }, { heardLine = "krazek.h_default" } } } },
        { text = "Who buys this stuff?", next = "buyers" },
        { text = "I've coin. Let me invest.", next = "invest", when = { money = { min = 500000 } } },
        { text = "I know a smuggler when I see one, Tran'rek.", next = "x_rogue", when = { class = "ROGUE" } },
        { text = "Sounds like you're offering me work, Tran'rek.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What makes you think I'd sell anything dark?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What's wrong with the Sandfury fetishes you sell, Tran'rek?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "What do you pay for what warriors bring out of the desert?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Who buys the things hunters bring back from Tanaris?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Very nearly legal, Tran'rek?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why do you think the fetishes are enchanted, Tran'rek?", next = "xmage", when = { class = "MAGE" } },
        { text = "Is it really charity, Tran'rek?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Zul'Farrak's chief is dead. That must hurt your scarab trade.", next = "xcl_zf", when = { cleared = "Zul'Farrak" } },
        { text = "The Dunemaul are paying for your margins, Tran'rek.", next = "dd_dunemaul", when = { killed = { name = "Dunemaul", min = 30 } } },
        { text = "I'll bring them.", next = "END", fx = { affinity = 1 } },
      },
    },
    dd_dunemaul = {
      lines = {
        { id = "dd_dunemaul_1", text = "Everybody pays for somebody's margins out here, pal, that's what makes it a market. The Dunemaul squat on the best scarab grounds south of the Gaping Chasm and smash anybody who digs there, so every ogre you put down is one more digger who comes home with shells instead of a broken leg." },
      },
      choices = {
        { text = "Then I'll take a cut of those margins.", next = "BACK", reply = "Ha! A partner, is it? Talk to me after you've brought me a few crates, and we'll see about a percentage, a small one.", fx = { align = { honor = -1 } } },
        { text = "I killed them to keep the diggers alive, not for you.", next = "BACK", reply = "Sure, sure, and the diggers thank you, and I thank you, and everybody's happy. Motives don't show up on an invoice, pal.", fx = { align = { honor = 1 } } },
        { text = "Something else, Tran'rek.", next = "BACK" },
      },
    },
    shells = {
      lines = { { id = "s_default", text = "Scarab shells, uncracked, and they sell for more than I pay you and less than you'd hope, which is the whole secret of commerce, pal, so don't write it down." } },
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
        { text = "What do people make of Booty Bay?", next = "op_booty_bay" },
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
        { text = "Cut me in, and I'll forget I saw anything.", next = "BACK", reply = "Ha, you got some nerve, mon, and Tran'rek likes dat, but de only thing you get cut into is a deal, at my price.", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Your business is yours. I'm not here to rob you.", next = "BACK", reply = "Good, friend, den we both keep our fingers, and dat be de best kind of business dere is.", fx = { affinity = 1, align = { honor = 1 } } },
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
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's a good place for business, friend, since nobody asks where your goods come from and nobody tells where they're going. That suits me." } },
    zul_farrak = { { id = "tp_zul_farrak", text = "The trolls of Zul'Farrak have trinkets people pay good gold for, and I've bought one or two, from people who wouldn't say how they got them. I didn't ask." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's got better margins, friend, but more competition. I like it here, where the competition's mostly sand." } },
    everlook = { { id = "tp_everlook", text = "Everlook buys furs and sells them to the south, friend, and I buy what they sell. That's all I'll say about Everlook, or about my margins." } },
    _none = { { id = "tp_none", text = "Wouldn't know, and wouldn't tell you if I did, pal, not without a price, no offense." } },
  },
}

P:NPC {
  key = "fizzgrimble", id = TODO_NPC("Innkeeper Fizzgrimble"), name = "Innkeeper Fizzgrimble",
  gender = "male",
  bible = "bibles/tanaris.md", role = "innkeeper", tier = "service",
  communities = { "gadgetzan" }, temper = { "chatty" }, values = { "generous" },
  notices = { "drink", "weary", "lock_stones" },

  impression = {
    first = "He calls the sand in the stew seasoning, and I believed him.",
    third = "{name} met Innkeeper Fizzgrimble, the chatty keeper of the Road Warrior inn in Gadgetzan.",
  },

  greetings = {
    { id = "g_flirt", when = { flirt = true, chance = 0.4 }, text = "Well, would you look at that, the desert finally sent me somethin' better than sand! Grab a stool, friend, and I'll pretend I'm not lookin' at you while I wipe the bar." },
    { id = "g_flirt_warm", when = { flirt = true, npcFlagBefore = "flirt_warm" }, text = "There you are, sweetheart! I swept the sand off your stool personally and put it on nobody's bill, which for me is practically a love letter." },
    { id = "g_flirt_cool", when = { flirt = true, npcFlagBefore = "flirt_declined", chance = 0.5 }, text = "Welcome back to the Road Warrior, pal! Drinks, rooms and gossip, and nothin' else on the menu, just like we agreed." },
    { id = "o_sw_greedy", when = { gossip = { topic = "steamwheedle", stance = "greedy" } }, text = "Word around the inn is you called the Cartel thieves with a ledger! Keep your voice down in here, pal, because the Bruisers drink here too and the stew's bad enough already." },
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
    { id = "n_lock_stones", cat = "lock_stones", when = { class = "WARLOCK", carrying = { 5512, 19004, 19005, 5511, 19006, 19007, 5509, 19008, 19009, 5510, 19010, 19011, 9421, 19012, 19013 } },
      text = "If you're staying, warlock, keep those healthstones in your bag, because the last guest who set one on the bar had three drunks fighting over it by midnight. Rooms are for sleeping, not for passing round pieces of somebody's life." },
  },

  start = "hello",
  nodes = {
    flirt = {
      lines = { { id = "fl_default", text = "Attentive? Sweetheart, I run the only inn in Gadgetzan, so I see every face in Tanaris sooner or later, and most of 'em are sunburned and cranky. Yours isn't, and that's a rare commodity, so how about I show you the roof after sundown, because the stars over the dunes are the one thing in this town I don't charge for." } },
      choices = {
        { text = "Show me the roof, then, Fizzgrimble.", next = "flirt_warm", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "flirt_warm" } } } },
        { text = "A goblin courting a gnome? The Cartel would laugh.", next = "flirt_gnome", when = { race = "Gnome" } },
        { text = "That's sweet, but I'm only after a bed and a drink.", next = "BACK", fx = { trait = { reserved = 1 }, npcFlag = { set = { "flirt_declined" } } },
          reply = "And a bed and a drink you'll have, friend, no hard feelings, because a happy customer's worth more to me than a broken heart. Well, about the same, but the customer pays." },
        { text = "I didn't come here to be sweet-talked, goblin.", next = "BACK", fx = { affinity = -1, trait = { stern = 1 }, npcFlag = { set = { "flirt_declined" } } },
          reply = "Fair enough, fair enough, consider the sweet talk withdrawn and the offer void. It was worth a try, and tries are free, which is why I make so many." },
      },
    },
    flirt_warm = {
      lines = { { id = "flw_default", text = "Now you're talkin', and I'll even dust off the second chair, which nobody's sat in since the last sandstorm. Mind the loose shingle by the chimney, though, because that chimney took my cousin's eyebrows and I'd hate for it to take yours." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    flirt_gnome = {
      lines = { { id = "flg_default", text = "Let 'em laugh, sweetheart, because the Cartel's been doin' business with gnomes for years and never once admitted it. Besides, your lot build things that blow up and so do mine, so we'd never run out of things to talk about." } },
      choices = {
        { text = "Then show me the roof, Fizzgrimble.", next = "flirt_warm", fx = { affinity = 1, trait = { charming = 1 }, npcFlag = { set = { "flirt_warm" } } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpt_fizzgrimble = {
      big = true,
      lines = { { id = "xpt_fizzgrimble_default", text = "I mean I've watched more companies break up over loot than over any monster, and it always starts at my tables after the third drink, usually with a broken chair. The smart ones decide who gets what before they go out, and the rest end up asking me to hold a grudge for them, which I do, for a small fee." } },
      choices = {
        { text = "We split everything evenly. That's the only fair way.", next = "BACK", reply = "Even's fair, friend, and it's also the fastest way to argue over who did nothing, but at least it doesn't end with my chairs broken.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Whoever does the most work should take the most.", next = "BACK", reply = "That's how most of my broken chairs got broken, pal, so if you're going to say it, say it outside.", fx = { align = { honor = -1 } } },
        { text = "I'll ask about something else.", next = "BACK" },
      },
    },
    xcl_zf = {
      big = true,
      lines = { { id = "xcl_zf_default", text = "That the Sandfury are pulling back from the road, that the Bruisers are drinking on duty to celebrate, and that a dwarf at table three is selling a map to the chief's treasure. The map's a fake, because I watched him draw it, but he's sold two already and I've taken a cut of both." } },
      choices = {
        { text = "Tell the Bruisers. A cheat shouldn't drink in your inn.", next = "BACK", reply = "I might, friend, though the Bruisers are drinking on duty, so I'd have to find one sober enough to care first.", fx = { align = { order = 1 } } },
        { text = "Let him sell. Fools pay for their own lessons.", next = "BACK", reply = "That's the spirit of Gadgetzan, pal, and I'll take my cut of the drinks he buys with the proceeds.", fx = { affinity = 1, align = { order = -1 } } },
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
        { text = "I'll keep the town's peace. My fights are out in the dunes.", next = "BACK", reply = "Much obliged, friend, because my tables have already met enough warriors this month to last them a lifetime.", fx = { align = { order = 1 } } },
        { text = "If a fight comes to your inn, I won't walk away from it.", next = "BACK", reply = "I'd rather you did walk away, pal, though if you must stay, try not to land on table three, it's new.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "I mind beasts that eat the stew, and I mind beasts that eat the guests, and I'm told that rules out most of them. But a quiet one by the fire's no worse than half my regulars, and it usually smells better." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "I mind beasts that eat the stew or the guests, but a quiet one by the fire's no worse than half my regulars. {pet} looks well-mannered enough, so if it curls up by the hearth and leaves the stew alone, I'll call that a paying guest." },
      },
      choices = {
        { text = "A beast should mind the house rules like anyone else.", next = "BACK", reply = "Exactly my view, friend, and if your beast can manage it, it's welcome by the fire anytime.", fx = { align = { order = 1 } } },
        { text = "My companion goes where I go. House rules don't change that.", next = "BACK", reply = "Then your beast is welcome, pal, so long as it doesn't eat the stew or the guests, in that order.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Every night, friend, and mostly I give them a bed and a joke, because that's what I've got and the joke's on the house. But the ones coming back from Zul'Farrak sometimes need more than a joke, and I'd not turn away a priest who sat with them a while." } },
      choices = {
        { text = "I'll sit with them tonight. That's what I'm here for.", next = "BACK", reply = "Bless you for it, friend, and I'll bring you something warm to drink while you sit, because those nights get long.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "They chose Zul'Farrak. Let them carry what they found there.", next = "BACK", reply = "They chose it, pal, true, but they're still my guests, and a guest who won't sleep is a guest who breaks things.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Every night, and they grow a little taller with every round. The latest is a sandstorm with a face, out past the Wastewander camps, and I'd laugh, except three different caravans told it the same way." } },
      choices = {
        { text = "Drink talks. Trust what you see, not what's sung.", next = "BACK", reply = "That's sensible, friend, though when three caravans tell the same lie, I start checking the sky before I go to bed.", fx = { align = { order = 1 } } },
        { text = "Listen to those stories. The land speaks through odd mouths.", next = "BACK", reply = "You shamans always say that, pal, and I'd laugh, except the sandstorm with a face does keep turning up in the tales.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "In a desert, pal, water is the most expensive thing on the menu, and I didn't set the price, the Water Company did. A mage could put me out of business with a flick of the wrist, so keep the conjuring to your room and I'll keep the stew warm." } },
      choices = {
        { text = "Water should be free in a drought.", next = "BACK", reply = "Should be, pal, but it isn't, and until the Water Company says otherwise, a glass costs what a glass costs.", fx = { align = { light = 1 } } },
        { text = "Business is business. I'll keep it quiet.", next = "BACK", reply = "A conjurer with sense, friend, and you'll always have a room here, so long as nobody sees you filling the jug.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, Fizzgrimble.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not often, because the Bruisers are quick and I'm quicker, especially with the bill. Still, the port brings in all sorts, and I've had pirates at one table and Booty Bay debt-collectors at the next, so a smart innkeeper watches his guests' pockets as well as his own." } },
      choices = {
        { text = "A smart thief wouldn't steal under the Bruisers' noses.", next = "BACK", reply = "A smart thief wouldn't, friend, and most of them aren't smart, which is how I've stayed in business this long.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'd never steal from your guests.", next = "BACK", reply = "That's good to hear, pal, though I'll still count the spoons after you've gone, because it's become a habit.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Every day, and half of them came in too proud to drink enough water on the road. I put them in the back room and charge them for the bed and the bucket, and I'd send for a healer if Gadgetzan kept one handy, but mostly they get me and a roll of bandages." } },
      choices = {
        { text = "Point the sick ones my way. Healing them is my calling.", next = "BACK", reply = "Bless you, friend, and I'll send them up with a bucket, because they'll need one before you're through.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Fools who don't carry water have earned the lesson.", next = "BACK", reply = "Earned it, sure, pal, but they still pay for the bed, so I'll keep the lessons comfortable.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Not often, friend, because nobody wants to fight with a Bruiser watching and an orc and a dwarf sharing a table. The truce here is thin, though, and one bad hand of cards can turn it into a broken chair, so I keep a sharp eye on the corners." } },
      choices = {
        { text = "Your truce is worth keeping. I'll keep my temper in here.", next = "BACK", reply = "Much obliged, friend, because a calm guest is the best kind, and you'd be surprised how few of you there are.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A truce with the Horde won't last. Best be ready when it breaks.", next = "BACK", reply = "Maybe so, pal, but it'll break somewhere else first, and until then, everybody drinks at my bar and pays the same price.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Only the once, and he paid for the mattress, I'll give him that, plus a little for my nerves. Mostly your kind sit in the corner, drink water, and complain the sand's too dry, which it is, but I can't do much about that." } },
      choices = {
        { text = "Fair's fair. A guest should pay for what they break.", next = "BACK", reply = "You're my kind of guest, friend, and if every bear paid for its mattress, I'd be a much happier goblin.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "A mattress is nothing. A bear needs room to sleep.", next = "BACK", reply = "Room's fine, pal, it's the claws I mind, so next time he can sleep in the stable with the other big beasts.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "A few every month, Horde and Alliance both, and they're quieter than the warriors, I'll give them that. The only trouble I've had was a felhunter that wouldn't stop sniffing the mage at the next table, and the Bruisers sorted that out quick." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "A few every month, Horde and Alliance both, and they're quieter than the warriors, I'll give them that. Yours is already eyeing the mage by the fire, though, so keep it close and keep it fed, because the Bruisers sort out trouble quick and they don't ask whose fault it was." },
      },
      choices = {
        { text = "I'll keep mine on a short leash, then.", next = "BACK", reply = "Much obliged, friend, and the mage at table four will be too, he's still nervous about the last one.", fx = { align = { order = 1 } } },
        { text = "If the Bruisers try sorting me, they'll regret it.", next = "BACK", reply = "Then I'll warn them, pal, but I'd rather not have to, because broken Bruisers cost more than broken chairs.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xalt_fizzgrimble = {
      lines = {
        { id = "xalt_fizzgrimble_default", text = "{alt}, and I remember because the room got paid for in advance, which almost never happens. Slept two nights, complained once about the sand and left a tip, so as far as I'm concerned your family's welcome back any time, at the usual rates." },
        { id = "xalt_fizzgrimble_other", when = { alt = { faction = "other" } }, text = "{alt}, a {altrace} from the other side of the war, sat drinking across the room from a whole table of your lot without a single chair getting broken. In Gadgetzan that's practically a peace treaty, pal, and I didn't even charge extra for it." },
      },
      choices = {
        { text = "Good. The war can wait outside the inn.", next = "BACK", reply = "That's how I see it, friend, and that's how I've kept this place standing, with a stick behind the bar for when it doesn't.", fx = { align = { light = 1 } } },
        { text = "I'd rather not drink across from the other side.", next = "BACK", reply = "Then sit at the far end, pal, the bar's long enough for everyone, and the stew tastes the same at both ends.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_alt_other", when = { alt = { faction = "other" }, metBefore = false },
          text = "You've a twin on the other side of the war, pal, did you know that? A {altrace} called {alt} drank at that very table and swore at that very sand in the stew, and you've already got the same look on your face." },
        { id = "h_alt_higher", when = { alt = { higher = true } },
          text = "{alt} came through not long ago, all battle scars and buying rounds, and you look like you might grow into that if you keep at it. Kin of yours, maybe? The table manners were family, anyway, and so was the habit of tipping in copper." },
        { id = "h_alt_class", when = { alt = { sameClass = true }, metBefore = false },
          text = "Another {altclass} at the Road Warrior! The last one, {alt}, broke a chair, apologized and paid for it, which puts your sort ahead of most of my customers already." },
        { id = "h_pt_fizzgrimble", tags = { "news" }, when = { party = { size = { min = 2 } } },
          text = "A table for {companion} and the rest of you, then? Sit anywhere the sand isn't, and make sure you settle your shares before you start drinking, not after, because I'm not refereeing for free." },
        { id = "h_cl_zf", tags = { "news" }, when = { cleared = "Zul'Farrak" }, text = "Every table in the Road Warrior is talking about you tonight, friend, because word is you went all the way down into Zul'Farrak and came back with the chief's head. I've heard the story told four ways already, and in one of them you wrestled a hydra." },
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
        { id = "h_dd_andre", tags = { "news" }, when = { questDone = TODO_QUEST("WANTED: Andre Firebeard") }, text = "The Security Chief came up from the port last night and bought a round for the whole bar, which he has never once done in the history of this establishment, and he kept saying your name between toasts. Something about Andre Firebeard's head, which is not a thing I like to hear over dinner, but I'll take the business." },
        { id = "h_dd_deaths", when = { deaths = { min = 10 } }, text = "You look like you've been dead and back a few times this week, friend, and the desert does that to a body. Pull up a stool out of the sun, because a room's cheaper than another walk from the spirit healer." },
      },
      again = {
        { id = "h_again", text = "Anything else? Have a drink while you think, pal; thinking's thirsty work and I'm the one who sells the cure." },
        { id = "h_again2", text = "Ask away, friend; the stool's paid for and the gossip's free." },
      },
      choices = {
        { text = "Have druids caused you much trouble, Fizzgrimble?", next = "xdruid", when = { class = "DRUID" } },
        { text = "Travellers must bring tales of the desert's spirits to your inn.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "I'd like a room.", next = "BUSINESS" },
        { text = "What's the news in town?", next = "news" },
        { text = "Why 'the Road Warrior'?", next = "name" },
        { text = "Do the Sandfury ever drink here?", next = "x_troll", when = { race = "Troll" } },
        { text = "Who cooks for the Road Warrior?", next = "kitchen" },
        { text = "Horde and Alliance drinking under one roof is a rare sight.", next = "both", when = { minLevel = 40 } },
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
        { text = "Someone like me has stayed here before, Fizzgrimble?", next = "xalt_fizzgrimble", when = { alt = true } },
        { text = "You're very attentive tonight, Fizzgrimble.", next = "flirt", when = { flirt = true } },
        { text = "The Security Chief bought a round? For me?", next = "dd_andre", when = { questDone = TODO_QUEST("WANTED: Andre Firebeard") } },
        { text = "Just a drink, thanks.", next = "END" },
      },
    },
    dd_andre = {
      lines = {
        { id = "dd_andre_1", text = "For you, about you, and for anybody who'd sit still long enough to hear about the Southsea, which turned out to be everybody. Firebeard's been raiding Cartel ships for years, so half the sailors in here owed him a grudge, and the other half owed him money, so they drank to you either way." },
      },
      choices = {
        { text = "Pirates had it coming. Good riddance to Firebeard.", next = "BACK", reply = "That's the spirit, and that's what the bar said too, about forty times. You'll never pay for a drink in here again, figuratively speaking, of course.", fx = { align = { order = 1 } } },
        { text = "Someone will pay me better to go after the Cartel next.", next = "BACK", reply = "Shh, keep your voice down, pal, the Bruisers drink here! I like you, though, so I'll pretend that was the heat talking.", fx = { align = { order = -1 } } },
        { text = "Something else, Fizzgrimble.", next = "BACK" },
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
      lines = { { id = "kh_default", text = "The living part, mostly, and the meat's good if you don't ask what it was. Gimblethorn the banker eats there every night, and he's the most careful goblin in Tanaris, so that's a recommendation." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    both = {
      lines = {
        { id = "bo_default", text = "Same bar, same stools, same sand in the stew, and the Bruisers stand by the door to keep it that way. Bera and Bulkrek, the two flight masters, drink at opposite ends and raise their mugs to each other, which is about as warm as it gets." },
      },
      choices = {
        { text = "That's how it should be everywhere.", next = "BACK", reply = "You'd think so, friend, but out there they don't have Bruisers by the door, and that makes all the difference.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Goblin peace lasts as long as goblin profit.", next = "BACK", reply = "Maybe so, pal, but goblin profit's been holding steady for twenty years, which is longer than most kingdoms manage.", fx = { affinity = -1, align = { order = -1 } } },
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
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's the only inn town for a hundred miles, pal, and the Road Warrior's the only inn, so I'm doing very well. The sand in the stew is complimentary." } },
    zul_farrak = { { id = "tp_zul_farrak", text = "The adventurers coming back from Zul'Farrak drink twice as much as anybody, pal, and they pay in troll trinkets. My shelves are full of them now." } },
    booty_bay = { { id = "tp_booty_bay", text = "I've heard Skindle down in Booty Bay pours a better rum than me, pal, and I'd like to see him try it with no water. Anybody can brew by the sea." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Darkmoon Faire came through once, pal, and they drank me dry in two days. Best two days of business I ever had." } },
    _none = { { id = "tp_none", text = "Never heard of it, pal, but do you want to hear about the weather? It's hot, and that's the weather, and it's very good for the drink trade." } },
  },
}

-- Steamwheedle Port, on the coast east of Gadgetzan.
P:NPC {
  key = "stoley", id = TODO_NPC("Stoley"), name = "Stoley",
  bible = "bibles/tanaris.md", role = "citizen", tier = "quest",
  communities = { "steamwheedle_port" }, temper = { "nervous" }, values = { "practical" },
  notices = { "purse", "lock_shadow" },

  impression = {
    first = "He owes money in Booty Bay and hopes nobody notices him.",
    third = "{name} met Stoley, a nervous trader at Steamwheedle Port with debts in Booty Bay.",
  },

  greetings = {
    { id = "o_bb_distrust", when = { opinion = { booty_bay = "distrust" } }, text = "Shh! Somebody said you called Booty Bay a nest of crooks, and some of those crooks are lookin' for me, so don't go mentionin' my name down there, okay?" },
    { id = "g_dock", text = "Who sent you? No, don't tell me, it was MacKinley in Booty Bay, because it's always MacKinley." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "You wouldn't consider a small loan to a man with excellent prospects? No, nobody ever does." },
    { id = "n_lock_shadow", cat = "lock_shadow", when = { class = "WARLOCK" },
      text = "Did the room just get colder, or is that you? I've had plenty of people come looking for me on MacKinley's behalf, and none of them made the lamps flicker, which is worse, frankly." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Nobody, nobody at all, just a few friends of mine in Booty Bay who think a loan lasts forever. They hire big folk with big swords, so you'll understand why I flinch whenever one of you walks up the pier." } },
      choices = {
        { text = "Pay what you owe, Stoley. Running only makes it worse.", next = "BACK", reply = "Pay? With what, friend, sand? I'd love to pay, really I would, if somebody would stop charging me interest on the interest.", fx = { align = { honor = 1 } } },
        { text = "Debts to sharks don't count. Keep running, and keep your coin.", next = "BACK", reply = "Oh, I like you, pal, and if anyone from Booty Bay asks, you never saw me and I was never here.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Because a hunter's quieter than a bruiser and cheaper than a rogue, that's why, and the Bay knows I'd see a bruiser coming. I sleep on a different crate every night down at the port, which is no way to live, but it's still living." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Because a hunter's quieter than a bruiser and cheaper than a rogue, and I sleep on a different crate every night down at the port. Don't let {pet} sniff around my coat, though, because it might be the sort of beast that's been given my scent." },
      },
      choices = {
        { text = "Settle it with them properly. Hiding forever is no life.", next = "BACK", reply = "Properly? Friend, the last fellow who tried to settle properly with the Bay is still settling, at the bottom of the harbour.", fx = { align = { order = 1 } } },
        { text = "Keep moving and trust nobody. That's how the hunted survive.", next = "BACK", reply = "That's my whole philosophy, pal, though I'll admit it's lonely sleeping on a different crate every night.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "It might, if the Light or the loa or whatever you pray to could square things with the Cartel, but I don't suppose it works that way. Mostly I'd like someone to know where I'm buried, if a Bruiser ever catches up with me." } },
      choices = {
        { text = "Pay what you owe, Stoley. That's the only absolution there is.", next = "BACK", reply = "Then I'll never be absolved, friend, because there isn't enough coin in Tanaris to cover what MacKinley thinks I owe.", fx = { align = { order = 1 } } },
        { text = "Keep running. The Cartel's ledgers aren't holy writ.", next = "BACK", reply = "That's what I keep telling myself, pal, and it sounds better every time somebody else says it out loud.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Pirates from Lost Rigger Cove, mostly, sniffing round the ships, and the tide doing strange things at night. I keep my head down and my eyes on the water, because I'd rather see trouble coming than have it walk up behind me." } },
      choices = {
        { text = "Hiding from debts only makes them heavier. Face them.", next = "BACK", reply = "They're heavy already, friend, so a little heavier hardly matters, and at least I'm alive to carry them.", fx = { align = { honor = 1 } } },
        { text = "Smart man. Let the tide carry your troubles off.", next = "BACK", reply = "I've been hoping it would, pal, every night, but the tide keeps bringing them back, along with the debt collectors.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "That's what the last one said, right before he asked me where I kept my strongbox. If you're really not from Booty Bay, you'll understand why I keep looking over your shoulder, and you won't take it personally." } },
      choices = {
        { text = "Pay your debts. You'll sleep better.", next = "BACK", reply = "Sleep? Friend, I haven't slept properly since I signed that first loan, and every time a door creaks I think it's MacKinley's collectors.", fx = { align = { honor = 1 } } },
        { text = "Run further. Booty Bay can't reach everywhere.", next = "BACK", reply = "They've reached here twice already, pal, so I'm starting to think everywhere might be closer than it looks.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "A sheep! Well, nobody in Booty Bay is looking for a sheep, that's true, but I'd rather keep my own feet. I suppose I'll just have to keep my head down and hope the next ship doesn't bring anyone who remembers my face." } },
      choices = {
        { text = "You should face the people you owe.", next = "BACK", reply = "Face them? Friend, I'd much rather face a devilsaur, at least it doesn't charge interest.", fx = { align = { honor = 1 } } },
        { text = "Hide if you must. Debts can wait.", next = "BACK", reply = "That's the nicest thing anyone's said to me all month, pal, so thank you, and if you see a fellow with a ledger, keep walking.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Because what I owe and what they say I owe are two very different sums, and the difference is mostly interest. I'll pay the honest part when I find out who's honest in Booty Bay, so not soon." } },
      choices = {
        { text = "Let them chase you. The Bay was never honest anyway.", next = "BACK", reply = "Exactly, pal, finally someone who understands the Bay, and you'll always have a friend at the port if you need one.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Pay your debts. Running only makes it worse.", next = "BACK", reply = "It makes it worse, friend, I know, I know, but it also keeps me alive, which is my top priority this season.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "Because he's tried everything else! He's sent letters, he's sent sailors, and once he sent a parrot that sat on my window and shouted my debts. A demon would be the next step, and frankly I'd take the parrot back any day." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "Because he's tried everything else! He's sent letters, he's sent sailors, and once a parrot that shouted my debts from the window. And now you've walked up with that thing breathing brimstone on me, which I hope is a coincidence, because I'd take the parrot back any day." },
      },
      choices = {
        { text = "Pay what you owe and you won't need to fear him.", next = "BACK", reply = "I know, friend, I know, and I mean to, I really do, as soon as the shipment comes in, which it won't.", fx = { align = { order = 1 } } },
        { text = "Nobody sent me. Your debts are your business.", next = "BACK", reply = "Oh, thank goodness, pal, because I was ready to jump in the harbour, and I can't swim.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Money, mostly, and a little guilt, because I said I'd pay MacKinley back by the end of last season and I didn't. I'm not a bad goblin, I'm only a goblin with a bad run of luck and a lot of cousins." } },
      choices = {
        { text = "Make it right with him. You'll sleep better.", next = "BACK", reply = "I will, friend, I swear it, right after this season, or the next one, when my luck turns properly.", fx = { align = { light = 1 } } },
        { text = "Luck turns. Keep your head down until it does.", next = "BACK", reply = "That's my plan exactly, pal, and I'm glad somebody thinks it's a good one, because my cousins certainly don't.", fx = { align = { light = -1 } } },
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
          text = "A warrior? You're not here from Booty Bay, are you? Only, you've got the look of someone who collects things, and I'm very much hoping it isn't me." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter. You're tracking something, I can tell, and I'd feel a lot better if you told me it wasn't me." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid. You'd not happen to have a shape that lets a fellow disappear quickly, would you? I'm asking for a friend, and the friend is me." },
        { id = "h_lockcl", when = { class = "WARLOCK" }, text = "A warlock! Oh, no, please tell me MacKinley hasn't started sending demons to collect, because that would be very unfair, even for Booty Bay." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Is this about my soul? Because I've been meaning to work on that, I really have, right after I settle a few small accounts." },
        { id = "h_dd_southsea", when = { killed = { name = "Southsea", min = 30 } }, text = "You've been cutting down Southsea pirates by the boatload, I hear, and some of those boats owe money to people I owe money to. I can't decide whether to thank you or hide from you, so I'll do a little of both." },
      },
      again = { { id = "h_again", text = "Anything else? Say it quietly, because ships have ears." } },
      choices = {
        { text = "Why not just pay what you owe in Booty Bay?", next = "xdruid", when = { class = "DRUID" } },
        { text = "The sea out there is restless. What's the port seen lately?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "How much do you owe?", next = "debt" },
        { text = "How will you pay it back?", next = "shipment" },
        { text = "You could just sail away from all this.", next = "leave" },
        { text = "What's MacKinley like, to owe?", next = "mackinley", when = { heardLine = "mackinley.h_default" } },
        { text = "I'm not here to judge you, Stoley.", next = "x_paladin", when = { class = "PALADIN" } },
        { text = "Nobody sent me, Stoley.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I could turn you into a sheep, Stoley.", next = "xmage", when = { class = "MAGE" } },
        { text = "Would confession really ease your mind, Stoley?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Why do you think MacKinley would send a warlock, Stoley?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "What's weighing on you, Stoley?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "You should pay your debts.", next = "END", reply = "I should, friend, and I will, someday, but for now I'm going to go hide behind those crates, so walk away slowly.", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Debts in Booty Bay are for fools who get caught.", next = "END", reply = "You're my kind of shaman, pal, and if the spirits ever whisper who's coming for me, you'll find me down by the pier.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "You look like you think I've come to collect a debt, Stoley.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Why would anyone set a hunter on your trail, Stoley?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Afraid I'll come for you next, Stoley?", next = "dd_southsea", when = { killed = { name = "Southsea", min = 30 } } },
        { text = "Good luck.", next = "END", fx = { affinity = 1 } },
      },
    },
    dd_southsea = {
      lines = {
        { id = "dd_southsea_1", text = "Me? No, no, I'm just a humble dockhand who happens to know a few pirates, pal, the way everybody on this coast knows a few pirates. The Southsea at Lost Rigger Cove used to buy my crates, and some of them owe MacKinley, and MacKinley owes nobody, so you can see why I'm sweating more than usual." },
      },
      choices = {
        { text = "Pay your debts and you've nothing to fear.", next = "BACK", reply = "You sound like my mother, friend, and she also told me to stay away from boats. I'll get there, I swear on my last copper.", fx = { align = { order = 1 } } },
        { text = "Relax. I only kill pirates who swing first.", next = "BACK", reply = "That's a comfort, pal, because I never swing first, or second, or at all. I'm more of a running sort of fellow.", fx = { align = { order = -1 } } },
        { text = "Something else, Stoley.", next = "BACK" },
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
      lines = { { id = "s_default", text = "I've a shipment coming, bottles, good ones, worth enough to square things if they arrive and nobody drinks them on the way. Sailors drink everything on the way." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    leave = {
      lines = { { id = "lv_default", text = "Every ship out of here stops at Booty Bay sooner or later, and so would I, and so would MacKinley, waiting on the dock with a smile." } },
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
        { text = "A debt's a debt. Pay the man, Stoley.", next = "BACK", reply = "I'll pay him, friend, I swear, but if the shipment doesn't come I'll need a hiding place, and maybe a paladin's blessing.", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Your creditor can wait. Booty Bay can afford it.", next = "BACK", reply = "You're a very understanding paladin, pal, and if you ever come to Booty Bay, please don't mention you've seen me.", fx = { affinity = 1, align = { order = -1 } } },
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
    booty_bay = { { id = "tp_booty_bay", text = "I owe money in Booty Bay, pal, quite a lot of it, and I'm not going back until I've found a way to pay it, or until they forget, which is likelier." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's a fine place to hide, pal, because nobody comes out here unless they have to. That's why I came." } },
    bloodsail = { { id = "tp_bloodsail", text = "The Bloodsail would sell me back to my creditors for a copper, pal, and they'd think it a good deal. I stay well away from the coast." } },
    gurubashi_arena = { { id = "tp_gurubashi_arena", text = "I bet on the Arena once, pal, and that's how I came to owe money in Booty Bay. I don't bet anymore, mostly." } },
    _none = { { id = "tp_none", text = "I don't know anything. Knowing things gets a man in trouble." } },
  },
}

P:NPC {
  key = "krinkle", id = TODO_NPC("Krinkle Goodsteel"), name = "Krinkle Goodsteel", title = "Blacksmithing Supplies",
  bible = "bibles/tanaris.md", role = "vendor", tier = "quest",
  communities = { "gadgetzan" }, temper = { "sharp" }, values = { "greedy", "proud" },
  notices = { "craft", "purse", "lock_shards" },

  impression = {
    first = "He fought the Repairers' Union and won, which says a lot.",
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
    { id = "n_lock_infernal", cat = "lock_shards", when = { class = "WARLOCK", carrying = 5565 },
      text = "That lump in your bag is an infernal stone, isn't it? It has the same sick weight and warmth as the one my cultist kept on his belt, and I dreamt of fire for a month after he left, so I'd rather it didn't stay long." },
  },

  start = "hello",
  nodes = {
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I can make the same weapon a hundred times without a smith's bad mornings, which is better in my book and cheaper in yours. The Repairers' Union thought only their members should mend a warrior's kit in this town, and I proved them wrong with a cheaper price and a shorter queue." } },
      choices = {
        { text = "Steel made by a craftsman's own hand carries honour. Molds don't.", next = "BACK", reply = "Honour doesn't stop a hyena, friend, but a sharp edge does, and mine come out sharp every single time.", fx = { align = { honor = 1 } } },
        { text = "A sharp edge is a sharp edge, and cheaper is better.", next = "BACK", reply = "My kind of customer, pal, and if you ever need a dozen, I'll have them poured by sundown.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Against basilisk hide nothing's good, friend, because those beasts are half stone already. Aim for the eyes or the soft bit under the jaw, and take thorium heads if you can afford them, which you can't, but I'll sell them to you anyway, on account." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Against basilisk hide nothing's good, friend, so aim for the eyes or the soft bit under the jaw, and take thorium heads if you can afford them. Keep {pet} away from the cooling trough, though, because the last hunter's cat drank from it and spent a week coughing up flux." },
      },
      choices = {
        { text = "Aim true and end it quickly. The beast deserves that much.", next = "BACK", reply = "A merciful hunter, friend, and you'll want a thorium head for that, which you can't afford, but I'll sell you one anyway.", fx = { align = { honor = 1 } } },
        { text = "Whatever brings the beast down is good enough for me.", next = "BACK", reply = "That's the spirit, pal, and I've got a crate of arrows that'll do it, mostly, if you aim at the soft bits.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Out here, friend, a good mace is a prayer that comes with a guarantee, and I'd say the Light agrees, or why would so many priests carry one? The trolls of Zul'Farrak don't respect sermons, but they respect a cracked skull." } },
      choices = {
        { text = "A prayer mends what a mace can't. I'll trust both.", next = "BACK", reply = "A sensible priest, friend, and I'll pour you a mace that'll hold up while you're busy with the prayer part.", fx = { align = { light = 1 } } },
        { text = "Shadow cracks skulls quicker than any mace you'll ever pour.", next = "BACK", reply = "Maybe, pal, but shadow doesn't come with a handle and a warranty, so I'll keep pouring and you keep whispering.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "It's over a hundred out there every day, and the forge has to burn hotter still, so it sulks if I stoke it wrong, and twice it's blown the chimney clean off. Some mornings I'd swear it's got moods, and I've lost more good molds to its tempers than to any customer." } },
      choices = {
        { text = "Treat the flame with respect and it'll serve you well.", next = "BACK", reply = "I try, friend, but the flame's got moods, and I've learned to bow to it every morning before I stoke it.", fx = { align = { honor = 1 } } },
        { text = "Fire's a tool. Hammer it into line like everything else.", next = "BACK", reply = "I've tried that, pal, and it blew the chimney off twice, so maybe the fire's got the better argument.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "For anyone who pays and doesn't stab a Bruiser with it, yes, pal, and I've never asked what my edges get used for. The Repairers' Union wanted me to ask questions, and that's partly why I don't belong to the Repairers' Union." } },
      choices = {
        { text = "A smith should care whose hands hold his blades.", next = "BACK", reply = "I'll leave the caring to the Union, friend, they've got more time for it than I do.", fx = { align = { light = 1 } } },
        { text = "Steel's steel. What it cuts isn't your business.", next = "BACK", reply = "Exactly my view, pal, and that's why I'm not in the Union and you're my customer.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "A rod, a focus, a setting for some crystal nobody else will touch; I've poured all of them for mages with odd ideas. I'll pour anything for the right coin, and I'm proud of that, whatever the Union says about standards." } },
      choices = {
        { text = "Some things shouldn't be made, whatever the price.", next = "BACK", reply = "Oh, there are a few, friend, and I melted one of them down myself, but a mage's focus isn't one of them.", fx = { align = { order = 1 } } },
        { text = "Good. A craftsman should make what's asked.", next = "BACK", reply = "You'll do well in Gadgetzan, pal, and if you ever need something odd poured, my forge is open.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Never mind molds.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "I'd forge it for anybody whose coin is good, friend, Horde or Alliance, and that's never kept me up at night. A blade doesn't know who's holding it, so I figure the sin, if there is one, belongs to the hand and not the forge, and the profit belongs to me." } },
      choices = {
        { text = "A smith who sells to murderers shares their guilt.", next = "BACK", reply = "Maybe so, friend, but then the farmer who sells them bread shares it too, and I don't see him losing sleep.", fx = { align = { honor = 1 } } },
        { text = "A blade doesn't care who swings it. Neither do I.", next = "BACK", reply = "Couldn't have said it better myself, pal, and I'll be quoting you to the Union next time they come round.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "The desert's been scarred since long before me, friend, and a few holes in the hills won't make it worse. Still, I buy most of my ore off the boats from Booty Bay, at a terrible markup, so if you're looking for someone to blame, it isn't Krinkle." } },
      choices = {
        { text = "The desert's dead already. Dig all you like.", next = "BACK", reply = "That's the spirit, pal, though I'll still buy my ore off the boats, because the hills are full of ogres.", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Every hole matters. Mine with care.", next = "BACK", reply = "I do, friend, mostly, and when I don't, I buy it off a boat so somebody else's hole is the one that matters.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = {
        { id = "xlock_default", text = "A cultist, I think, though he said he was a collector. He paid well, and the mold came out perfect, and then I dreamt of fire every night until I melted the thing down myself, which cost me the profit and then some." },
        { id = "xlock_demon", when = { pet = { type = "Demon" } }, text = "A cultist, I think, though he said he was a collector, and he had a servant just like yours standing at his elbow. I dreamt of fire every night until I melted his mold down, so you'll understand why I'd like that thing to stay outside the forge." },
      },
      choices = {
        { text = "You did right to melt it down.", next = "BACK", reply = "Thank you, friend, I've been telling myself the same, and it's nice to hear somebody else agree for once.", fx = { align = { order = 1 } } },
        { text = "You lost good gold over a bad dream, Krinkle.", next = "BACK", reply = "Maybe so, pal, but I slept like a baby afterwards, and you can't put a price on that, though I tried.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More than you've got, I expect, pal, because thorium's dear and the Cartel takes its share. But I'll tell you this: a holy symbol's no different from a sword in the forge, and the metal doesn't care what it's for, so long as the coin's good." } },
      choices = {
        { text = "The metal may not care, but you should.", next = "BACK", reply = "I do, friend, a little, and that's why I pray over my anvil some nights when nobody's looking.", fx = { align = { light = 1 } } },
        { text = "Then you're right to charge what it's worth.", next = "BACK", reply = "Glad you see it my way, pal, and I'll pour your symbol with the same care I'd give any blade.", fx = { align = { light = -1 } } },
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
          text = "Dithers and Arbington sent you down from the Plaguelands? They always send the same bones. Fifteen gold for the mold, up front, no haggling, and the lesson on the stem I'll throw in at no charge, because I'm sentimental." },
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
        { id = "h_again_b1", text = "Ask quick, chum, because this pour won't wait and neither will the invoice." },
      },
      choices = {
        { text = "Does all this mining scar the desert?", next = "xdruid", when = { class = "DRUID" } },
        { text = "The fire in your forge seems to fight you in this heat.", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Who else buys these molds?", next = "who" },
        { text = "Show me your stock.", next = "BUSINESS" },
        { text = "Goblin steel? Let's see if it meets a dwarf's standards.", next = "x_dwarf", when = { race = "Dwarf" } },
        { text = "Do you sharpen for anyone who pays?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What would a mage need from a mold?", next = "xmage", when = { class = "MAGE" } },
        { text = "Would you forge a weapon for someone who'd misuse it?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Is a mace really better than a prayer out here, Krinkle?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Can you really make a better weapon than a smith, Krinkle?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Someone asked you to pour a demon, Krinkle?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "A censer of thorium would cost a fair bit, I'd guess, Krinkle.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Are your arrowheads any good against basilisk hide, Krinkle?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "That Repairers' Union still seems to rankle you.", next = "union" },
        { text = "Is Wrinkle Goodsteel next door any relation?", next = "wrinkle" },
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
        { id = "xd_default", text = "Go on, knock on it, bend it, breathe your beard all over it; I've had Ironforge smiths in here before, and not one of 'em walked out empty-handed. Dwarves complain the loudest and buy the most, so I keep a little extra on the rack for your lot." },
      },
      choices = {
        { text = "Not bad, for goblin work.", next = "BACK", fx = { affinity = 1 } },
        { text = "I've seen better at the Great Forge.", next = "BACK", fx = { affinity = -1, trait = { skeptical = 1 } } },
      },
    },
    union = {
      lines = {
        { id = "b_union_default", text = "Rankle? Pal, they pulled my mending rights over a price list, and I've got six complaints on file with the Cartel and a seventh half written. All I did was charge less than they do, which I'm told is unfair competition." },
      },
      choices = {
        { text = "What did the Cartel say?", next = "union_cartel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    union_cartel = {
      lines = {
        { id = "b_union_cartel_default", text = "The Cartel said they'd look into it, which in Gadgetzan means they're waiting to see who pays the bigger filing fee. So I pay mine on time, in full, with a receipt, and I keep every receipt in a strongbox." },
      },
      choices = {
        { text = "And if they rule against you?", next = "union_rule" },
        { text = "Something else.", next = "BACK" },
      },
    },
    union_rule = {
      lines = {
        { id = "b_union_rule_default", text = "Then I appeal, buddy, and after that I appeal the appeal, and by then half the Union will have retired or blown up. I can't lose so long as I've got more patience than they've got members." },
      },
      choices = {
        { text = "That's a long game for a goblin.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrinkle = {
      lines = {
        { id = "b_wrinkle_default", text = "That's my brother, friend, and he sells armor while I sell what goes into it and what goes through it. Folks say it's a conflict of interest, and I say it's a family business with excellent coverage." },
      },
      choices = {
        { text = "So you profit whichever way the fight goes.", next = "wrinkle_both" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wrinkle_both = {
      lines = {
        { id = "b_wrinkle_both_default", text = "Now you're thinking like a Goodsteel! He sells you the breastplate, I sell the other fella the mace, and then you both come back to one of us for repairs. It's a beautiful thing, and the paperwork's all in order." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I know metal, pal, and I know who's buying it. Ask, but don't waste my time, because my time's billed by the hour." },
    },
    scholomance = { { id = "tp_scholomance", text = "I've never been, and I'm never going, pal. I make the key and somebody else gets to use it, which is the best arrangement there is: all profit and no ghosts." } },
    steamwheedle = { { id = "tp_cartel", text = "The Cartel keeps the bruisers paid and the trade roads open, and I pay my share for it. I complain about it plenty, but I pay." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's got the best forges in Tanaris, pal, because it's got the only forges in Tanaris. That's a monopoly, and I'm very proud of it." } },
    zul_farrak = { { id = "tp_zul_farrak", text = "The trolls of Zul'Farrak have metal I've never seen, pal, old and strange and very hard to work. I'd pay well for a sample." } },
    booty_bay = { { id = "tp_booty_bay", text = "Booty Bay's got a few good smiths, pal, but none of them can pour a mold like I can. I'd like them to try." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Irons make the best steel in the world, pal, and they'd kill you before they'd sell it to you. I'd love to know their secrets, but I'm fond of my head." } },
    trade = { { id = "tp_b_trade", text = "Thorium's up, iron's steady, and flux is whatever I say it is, because nobody else in Tanaris stocks it. Buy today, pal, while I'm in a generous mood." } },
    mirage_raceway = { { id = "tp_b_mirage_raceway", text = "I pour axle pins for both crews at the Raceway, and they snap about as often as you'd expect. I don't warranty anything that goes that fast." } },
    _none = { { id = "tp_none", text = "That's not my trade, friend, my trade is metal, so how about buying some?" } },
  },
}
