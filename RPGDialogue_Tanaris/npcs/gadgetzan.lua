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
    { id = "g_heat", text = "Hot, hot, hot, every single day it's hot! Come in out of the sun, come in, because I've got something to tell you about." },
    { id = "g_back", when = { metBefore = true }, text = "My favorite partner in progress! Well, partner's a strong word, so let's say associate, or customer at the very least!" },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "Now that is a well-stuffed purse! Have you ever thought about investing in liquid refreshment, the kind with side effects? Only minor ones!" },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ah, you've been at the Road Warrior's ale, I see, which is strictly amateur hour. Wait until you try my elixir!" },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "Dew collector glands, mostly, from the thistleshrubs out in the valley, plus a few trade secrets. The shrubs don't miss the glands, I'm told, or if they do, they haven't filed a complaint." } },
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
      lines = { { id = "xmage_default", text = "Polymorph turns a man into a sheep for a minute, and he hates you forever after. My elixir turns him into a skeleton, and he pays me for the privilege, and comes back for more, so tell me which of us has the better business sense." } },
      choices = {
        { text = "Magic should never be sold like a cheap tonic.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Fair point. Coin talks louder than spells.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else, Marin.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Marin Noggenfogger, alchemist and businessgoblin, at your service. I'm working on an elixir that's going to make me rich, and maybe leave you a bit thirstier, but that's a small price." },
        { id = "h_thirsty", tags = { "news" }, when = { questActive = TODO_QUEST("The Thirsty Goblin") },
          text = "The dew collectors out in Thistleshrub Valley, southwest of here, carry a gland full of the stuff. Bring me one, and try not to squeeze it on the way." },
        { id = "h_taste", when = { questActive = TODO_QUEST("In Good Taste") },
          text = "It works, but it tastes like a boot, so take it to Sprinkle. She knows how to make awful things palatable." },
        { id = "h_delivery", when = { questActive = TODO_QUEST("Delivery for Marin") },
          text = "Sprinkle's powder! She says I owe her for it, and she always says I owe her, and the trouble is she's usually right." },
        { id = "h_elixir", when = { questActive = TODO_QUEST("Noggenfogger Elixir") },
          text = "This is it, the finished thing! Drink one and tell me what happens; I'll take notes, and I'll stand back a little while I do." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Noggenfogger Elixir"), days = 3 } },
          text = "You drank it and you're still the right size, or mostly the right size, anyway! I'm putting you in the advertisements." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! Perfect, a customer who knows herbs, and my elixir is mostly natural, you know, apart from the bits that aren't." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue! You lot know your poisons, so you'll appreciate what I'm doing with my elixir, which is very nearly not a poison at all, most of the time." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, eh? Don't go telling me magic does it better, because I've heard that, and magic doesn't come in a bottle you can sell for forty silver." },
      },
      again = {
        { id = "h_again", text = "More questions? Ask them in the shade, then, because everything's better in the shade." },
        { id = "h_again2", text = "Yes, yes? Go on, I'm listening, even if I'm also sweating." },
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
        { text = "Good luck with it.", next = "END" },
      },
    },
    elixir = {
      big = true,
      lines = {
        { id = "e_default", text = "It refreshes you, mostly, though sometimes you shrink, or float a bit, or come out looking like a skeleton for a while. All very temporary, I'm almost sure!" },
      },
      choices = {
        { text = "Almost sure?", next = "elixir_safe", fx = { trait = { cautious = 1 } } },
        { text = "I'll take a dozen.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "I'll pass.", next = "BACK", fx = { affinity = -1, trait = { cautious = 1 } } },
      },
    },
    elixir_safe = {
      lines = { { id = "es_default", text = "Well, nobody's stayed a skeleton and nobody's stayed small. One fellow stayed very cheerful for a week, but that might have been unrelated." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    heat = {
      lines = { { id = "ht_default", text = "I don't, I complain, because complaining is how a goblin cools down! I'm also developing a drink for it, since everything comes back to the drink." } },
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
      lines = { { id = "b_default", text = "The Cartel takes a cut, the Water Company charges for every cup, and I'm about to sell the cure for both. Business is wonderful, or it will be any day now." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "steamwheedle" } } } },
    },
    recipe = {
      lines = { { id = "r_default", text = "Dew from a desert plant that refuses to die, and a little something to stop it tasting of feet. The rest is a trade secret, and also I lost the notes." } },
      choices = {
        { text = "You lost the notes?", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } },
        { text = "Sprinkle already told me the secret ingredient, Marin.", tag = "Deceive", next = "secret",
          check = { pass = { any = { { trait = "witty" }, { class = "ROGUE" }, { disposition = { min = 60 } } } } },
          fail = { next = "secret_no", fx = { affinity = -1 } } },
      },
    },
    slowfall = {
      lines = { { id = "sl_default", text = "Yes, and you have to learn it! Mine comes in a bottle, and anybody can drink a bottle, so that's the whole business right there." } },
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
      lines = { { id = "xsp_default", text = "In elixirs, naturally, since gold goes soft in this heat. I'm joking, mostly, though I did once try to bottle a dust storm and it cost me a perfectly good roof." } },
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
        { text = "Fair enough. Something else.", next = "BACK" },
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
    background = { { id = "tp_ba", text = "I was born poor, then I got thirsty, then I got ideas. The ideas are going to make me rich; the thirst is still working on it." } },
    advice = { { id = "tp_ad", text = "Carry twice the water you think you need, and buy it from me... well, from the Water Company for now, but I'm working on that." } },
    steamwheedle = { { id = "tp_cartel", text = "The Cartel takes its cut, the Bruisers keep the peace and I keep inventing, so everybody wins, and me most of all." } },
    _none = { { id = "tp_none", text = "No idea, friend, but is it thirsty? Then I might have something for it." } },
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
    { id = "g_kitchen", text = "Hello, sweetie! You look like someone who hasn't eaten anything that tasted good in a week." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Then you know the secret: anything at all can taste good, if you find the right ingredient." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "A cook always knows, sweetie, because you look at food the way I do, wondering what's been added. I'd ask you not to practice on anything in my kitchen, though, because Marin's experiments already give me enough to fix." } },
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
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Sprinkle, and I fix things that taste wrong, mostly food, though lately it's mostly Marin's experiments. He calls it a partnership; I call it a favor he owes me." },
        { id = "h_taste", tags = { "news" }, when = { questActive = TODO_QUEST("In Good Taste") },
          text = "Noggy's elixir tastes like a swamp? Of course it does. There's a mushroom up in the Hinterlands that fixes anything, so bring me some, sweetie." },
        { id = "h_secret", when = { questActive = TODO_QUEST("Sprinkle's Secret Ingredient") },
          text = "When I was little I couldn't stand my sister's cooking. Then I found the secret ingredient, and suddenly I could. Fetch me some, would you?" },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "You know what goes in a drink to make it wrong, sweetie, I can see it on you. Well, I know what goes in to make it right again, so we'd make quite a pair." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, sweetie! I've tasted conjured bread before, and I'm sorry to tell you it tastes of nothing at all, which is the worst thing food can taste of." },
      },
      again = { { id = "h_again", text = "Anything else, sweetie?" }, { id = "h_again2", text = "Go on, sweetie; I'm stirring, but I can listen." } },
      choices = {
        { text = "Noggy?", next = "noggy" },
        { text = "What's the secret ingredient?", next = "secret" },
        { text = "What's Marin like?", next = "marin" },
        { text = "Tell me about your sister's cooking.", next = "sister" },
        { text = "Trade a recipe?", next = "trade", when = { profession = "Cooking" } },
        { text = "Hinterlands cooking, is it? I know Wildhammer cooking.", next = "x_dwarf", when = { race = "Dwarf" } },
        { text = "You can tell I use poisons?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Conjured bread keeps you alive. That's what matters.", next = "xmage", when = { class = "MAGE" } },
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
      lines = { { id = "m_default", text = "He's clever, sweaty, and always one bottle away from a fortune, and he owes me for every one of those bottles. I keep a list, and he hates the list." } },
      choices = {
        { text = "Will he ever pay you back?", next = "marin_pay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    marin_pay = {
      lines = { { id = "mp_default", text = "Oh, he pays, in stories and in promises, and once in a very nice hat, which I'm keeping." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sister = {
      lines = { { id = "si_default", text = "Dreadful, but lovingly dreadful; she'd boil anything that stood still. I learned to cook so I'd survive, and I learned to fix food so I'd survive her." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    trade = {
      lines = { { id = "t_default", text = "A cook who shares! All right: a pinch of salt in anything sweet, and a squeeze of lemon in anything that came out of a swamp. That one's free, but the secret isn't." } },
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
    background = { { id = "tp_ba", text = "I grew up with a sister who couldn't cook and a stubborn tongue, and one of those made me a cook." } },
    advice = { { id = "tp_ad", text = "If something tastes wrong, it's missing one thing, sweetie, so find that one thing and don't go adding six." } },
    _none = { { id = "tp_none", text = "Couldn't say, sweetie. Can I get you something to eat instead?" } },
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
    { id = "g_water", text = "Water Company business only, please. If you're here about the pressure, take a number." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Look at this pump, no, really look at it, and tell me it's not beautiful. Then tell me why it isn't working." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The Wastewanders got you, eh? They get everybody, so get yourself patched up, then go and get even." },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "Sure they do, and they can line up behind Gadgetzan like everybody else. Every gallon a basilisk drinks is a gallon a paying customer doesn't, and the Company counts every one." } },
      choices = {
        { text = "Leave some for the wild. The desert was here first.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Gadgetzan comes first. The beasts can fend for themselves.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It could, and it would ruin me doing it, because I can't sell water you can make for free. Still, I'd rather have a mage on the walls than a Wastewander at the well, so you'll get no complaints from me about the conjuring, only about the price." } },
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
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Water is everything out here. The Water Company keeps Gadgetzan drinking, and the Wastewander bandits keep stealing it. Guess which one of us is having a worse week." },
        { id = "h_justice", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Wastewander Justice") }, { questActive = TODO_QUEST("More Wastewander Justice") } } },
          text = "The Wastewanders camp around the water sources and take whatever they like. Go and teach them about consequences, and teach them in bulk." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("More Wastewander Justice"), days = 3 } },
          text = "Pressure's up two notches since you thinned the Wastewanders, two whole notches! I nearly cried, and I'm an engineer, and engineers don't cry, not often." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid! I don't suppose you can talk a well into filling faster? No? Then I'll settle for you talking sense into the Wastewanders, because they've got our water and they don't share." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, and I suppose you're about to tell me you can make water out of thin air. Do you know what that does to a water company's quarterly projections?" },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "Another sneak in my town. If you've been near the Wastewander camps, I'll want to know, and if you've been near my water tower, I'll want to know more." },
      },
      again = { { id = "h_again", text = "What else? Quickly, the gauge is twitching." } },
      choices = {
        { text = "The desert's creatures need water too, Chief Engineer.", next = "druid_q", when = { class = "DRUID" } },
        { text = "How does a desert town get water?", next = "water" },
        { text = "Who are the Wastewanders?", next = "bandits" },
        { text = "Who runs the Water Company?", next = "company" },
        { text = "Let me look at that pump.", next = "pump", when = { profession = "Engineering" } },
        { text = "Point me at the Wastewanders, Chief.", next = "x_warrior", when = { class = "WARRIOR" } },
        { text = "Conjured water could save lives in a drought.", next = "xmage", when = { class = "MAGE" } },
        { text = "I'm no Wastewander, Bilgewhizzle.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Good luck with the pressure.", next = "END" },
      },
    },
    water = {
      lines = { { id = "w_default", text = "We've got towers out at Waterspring Field pulling it up from under the sand, and they're delicate machinery, very delicate. Bandits are not delicate." } },
      choices = {
        { text = "I'll deal with the bandits.", next = "BACK", fx = { affinity = 2, standing = { gadgetzan = 1 } } },
        { text = "What happens if the towers stop?", next = "water_stop" },
      },
    },
    water_stop = {
      lines = { { id = "ws_default", text = "Then Gadgetzan finds out how much it loves gold when there's nothing to wash it down with. About three days, I'd guess. I don't like guessing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    bandits = {
      lines = { { id = "b_default", text = "Desert folk with guns and no water bill, who take a source and sell the water back to the caravans. It's almost good business, and I hate that it's almost good business." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    company = {
      lines = { { id = "c_default", text = "The Cartel owns it, I run it, and everybody in town complains about it. That's how you know it's working." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "steamwheedle" } } } },
    },
    pump = {
      lines = { { id = "p_default", text = "See the seal? There's sand in it, there's always sand, because you can't keep sand out of anything in Tanaris. I've stopped trying, and now I build things that like sand." } },
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
      { id = "tp_knows", text = "I've a desk full of reports and no time to read them, so I've memorized the important parts. Ask, quickly." },
    },
    background = { { id = "tp_ba", text = "I'm an engineer, a water engineer specifically, which in Tanaris makes me the most important goblin nobody ever thanks." } },
    advice = { { id = "tp_ad", text = "Never camp by a water source out there. Somebody already has, and they've got a gun." } },
    _none = { { id = "tp_none", text = "Unless it's wet, it's not my department." } },
  },
}

P:NPC {
  key = "fizzledowser", id = TODO_NPC("Senior Surveyor Fizzledowser"), name = "Senior Surveyor Fizzledowser",
  bible = "bibles/tanaris.md", role = "scholar", tier = "quest",
  communities = { "gadgetzan" }, temper = { "cautious" }, values = { "practical", "dutiful" },
  notices = { "craft" },

  impression = {
    first = "Senior Surveyor Fizzledowser keeps a map full of circles where water used to be, and he expects every simple job to go wrong. In fairness, out here, he may have learned that the hard way.",
    third = "{name} met Senior Surveyor Fizzledowser, who searches the desert for new water on behalf of the Gadgetzan Water Company.",
  },

  greetings = {
    { id = "g_maps", text = "Careful with the maps. Every one of those circles is a place we used to have water." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = { "Engineering", "Mining" } },
      text = "You know the ground, or the gadgets, and either one helps; both would be a miracle." },
  },

  start = "hello",
  nodes = {
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
      lines = { { id = "xmage_default", text = "Maybe, though everything out here goes wrong for me sooner or later, so I'd expect the spell to find a Wastewander camp instead. I've lost good surveyors to Thistleshrub and to bandits, and a fancy spell doesn't make the desert any kinder." } },
      choices = {
        { text = "Try new methods. The old way keeps failing.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Stick to your rods. They've worked for years.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else, please.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Quietly would be new, I'll grant you, because my lads go in loud and come out running. If you can slip into a bandit camp and slip out again, you'd be the first plan of mine in a month that didn't go wrong." } },
      choices = {
        { text = "Leave the thieves alone. Your gear isn't worth blood.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Thieves deserve what's coming to them.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Senior Surveyor Fizzledowser, of the Gadgetzan Water Company. The Wastewanders took half our sources, so I find new ones, which is slower than it sounds." },
        { id = "h_survey", tags = { "news" }, when = { questActive = TODO_QUEST("Gadgetzan Water Survey") },
          text = "Take the dowsing widget to Sandsorrow Watch and sample the pool there. It should be simple, but I say that about everything, and it rarely is." },
        { id = "h_lair", when = { questActive = TODO_QUEST("Noxious Lair Investigation") },
          text = "Giant insects, at a water hole? That's not natural. Bring me pieces from their lair; Pestlezugg can tell us what they are." },
        { id = "h_analysis", when = { questActive = TODO_QUEST("Insect Part Analysis") },
          text = "Is that Pestlezugg's report you've got there? Let me see... oh, oh dear, that's worse than I hoped, and I'd hoped for nothing at all." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid, out here? If you can feel water under the sand, please tell me, because my dowsing widget certainly can't, and it cost the Company a fortune." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage. You'll be thinking you could find water with a spell faster than my rods, and I'll be the one who has to explain to the Company why nobody tried it sooner." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "You'd make a decent scout, if you can keep your head down. The Wastewander keep taking my survey gear, and my men keep getting caught trying to take it back." },
      },
      again = { { id = "h_again", text = "Something else? I'll mark it on a map." } },
      choices = {
        { text = "Those insects at Sandsorrow Watch feel wrong to me.", next = "druid_q", when = { class = "DRUID" } },
        { text = "What are the insects?", next = "insects" },
        { text = "How do you find water in a desert?", next = "dowsing" },
        { text = "What happened to the old sources?", next = "maps" },
        { text = "Pestlezugg thinks they come from Un'Goro.", next = "ungoro", when = { heardLine = "pestlezugg.h_march" } },
        { text = "The earth would tell me where water runs.", next = "x_shaman", when = { class = "SHAMAN" } },
        { text = "Could magic really find water faster?", next = "xmage", when = { class = "MAGE" } },
        { text = "I could get your gear back quietly.", next = "xrogue", when = { class = "ROGUE" } },
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
      lines = { { id = "iw_default", text = "Everyone with a city and a wall. I wrote to the Cartel, and the Cartel wrote back asking about the water, because the Cartel always asks about the water." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dowsing = {
      lines = { { id = "d_default", text = "A widget, a lot of walking, and listening for the widget to stop screaming. When it stops, you dig, and when it starts again, you run." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    maps = {
      lines = { { id = "m_default", text = "Bandits sit on some, and the sand ate the others. Every circle on this map is a well we used to drink from, and I keep them, because somebody should remember where the water was." } },
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
    background = { { id = "tp_ba", text = "I'm a surveyor: I go out with a widget, I come back with a map, and in between I try very hard not to be eaten." } },
    advice = { { id = "tp_ad", text = "If the sand moves and there's no wind, walk the other way, and walk quickly." } },
    _none = { { id = "tp_none", text = "I haven't surveyed that, I'm afraid, or not yet." } },
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
    { id = "g_shop", text = "Vials, phials, the good flasks, whatever you're after. Don't mind the rat; that's Rose, and she's my assistant." },
  },

  notice = {
    { id = "n_imp", cat = "pet", when = { class = "WARLOCK", pet = { type = "Demon" } },
      text = "Rose, under the counter, now! Sorry, she can smell brimstone a street away, and that little friend of yours is practically steaming." },
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "A fellow alchemist! I've some insect samples you'd find fascinating, or horrifying, and usually both." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Keep your pet away from Rose. She's small, but she bites, and she's been at the reagents." },
  },

  start = "hello",
  nodes = {
    druid_q = {
      lines = { { id = "dq_default", text = "Pieces of those giant insects from Sandsorrow Watch, and they're nothing like a scorpid on the inside. Gracina Spiritmight in Darnassus thinks they're tied to Un'Goro, and the more I cut, the more I think she's right." } },
      choices = {
        { text = "Send word to the Circle. This needs many eyes.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Keep it quiet until you're sure. Rumors spread faster than bugs.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Someone who can freeze a sample before it goes off in this heat, mostly. Whatever the Water Company finds in the bad wells rots in an hour, and I'd rather study it fresh than smell it stale." } },
      choices = {
        { text = "Science needs patience, not shortcuts.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Use whatever works, magic included.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "It interests me, which is worse, because interesting things blow up. I'd be curious what fel residue does to a reagent, but I'd want it kept in a jar a long way from my rat." } },
      choices = {
        { text = "Fel is just another reagent. Study it.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Keep it far from your rat. It corrupts.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Let's talk about something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Alchemist Pestlezugg. I sell supplies, and when the Water Company finds something nasty, I take it apart and tell them how nasty." },
        { id = "h_analysis", tags = { "news" }, when = { questActive = TODO_QUEST("Insect Part Analysis") },
          text = "These parts confirm what I feared: these aren't scattered bugs, they're organized. Take my report to Fizzledowser, and be quick about it." },
        { id = "h_march", key = true, when = { questActive = TODO_QUEST("March of the Silithid") },
          text = "Gracina Spiritmight in Darnassus and Zilzibin Drumlore both have theories about where these things come from, and both of them say Un'Goro. I think they may be right." },
        { id = "h_bungle", when = { questActive = TODO_QUEST("Bungle in the Jungle") },
          text = "I need a scent gland from the hive's own and a handful of Un'Goro soil, and with the two I can build a lure. I'd rather not say what it's for just yet." },
        { id = "h_rose", when = { metBefore = true }, text = "Rose ate the label off a jar again, so now I've a jar of something and no idea what. She looks pleased with herself, which worries me." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "Rose, mind your manners, it's a druid. Druids always ask what I'm dissecting, and they never like the answer." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage. Good, you'll have a steady hand, and Rose likes steady hands; she bites the shaky ones." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Warlock. I can smell the brimstone on your sleeve, and so can Rose, which is why she's hiding behind the flasks." },
      },
      again = { { id = "h_again", text = "Anything else? Rose is getting impatient, though Rose is always impatient." } },
      choices = {
        { text = "What are you dissecting, Pestlezugg?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Let's see your supplies.", next = "BUSINESS" },
        { text = "Who's Rose?", next = "rose" },
        { text = "What did you find in the insect parts?", next = "insects" },
        { text = "Talk shop with me.", next = "shop", when = { profession = "Alchemy" } },
        { text = "Your rat doesn't like my imp much.", next = "x_warlock", when = { class = "WARLOCK" } },
        { text = "What does an alchemist want with a mage?", next = "xmage", when = { class = "MAGE" } },
        { text = "Does my craft bother you, alchemist?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Just browsing.", next = "END" },
      },
    },
    rose = {
      lines = { { id = "r_default", text = "She's my assistant, and she tests things, though not on purpose. She's survived everything so far, which is either very good or very bad news about my reagents." } },
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
      lines = { { id = "s_default", text = "Keep your reagents dry, your vials corked, and your rat out of the cupboard. I manage two of those." } },
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
        { text = "Fair enough.", next = "BACK" },
      },
    },
  },

  topics = {
    knows = {
      { id = "tp_knows", text = "I take things apart for a living, rumors included. Ask, and I'll tell you what's inside them." },
    },
    background = { { id = "tp_ba", text = "I've been an alchemist as long as I can remember. Rose came later, and she's never told me where from." } },
    advice = { { id = "tp_ad", text = "Label your vials, then hide the labels from your rat." } },
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
    { id = "g_shifty", text = "What do I do? A bit of this and a bit of that, all of it profitable, and you can't have any." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "Somebody's doing well! You ever buy scarab shells? You should, you know; everybody should." },
  },

  start = "hello",
  nodes = {
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
      lines = { { id = "xlock_default", text = "Because everyone sells something, friend, and your sort always have the strangest things to offer. I keep away from soul business in general, because the Cartel doesn't like it, and I'm fond of the Cartel liking me." } },
      choices = {
        { text = "The Cartel's rules aren't my concern.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Wise. Some trade isn't worth the coin.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Tran'rek. I buy what the desert's got and sell it to people who haven't got a desert, and business is good, better than I'll ever tell you." },
        { id = "h_krazek", when = { any = { { questActive = TODO_QUEST("Tran'rek") }, { heardLine = "krazek.h_default" } } },
          text = "Krazek sent you? That's my cousin, and he talks too much, as I'm sure he told you himself, at length." },
        { id = "h_shells", tags = { "news" }, when = { questActive = TODO_QUEST("Scarab Shells") },
          text = "I want uncracked scarab shells, and uncracked is the important part, because cracked ones are worth exactly nothing." },
        { id = "h_valley", when = { questActive = TODO_QUEST("Thistleshrub Valley") },
          text = "Thistleshrub Valley has something I want, and don't ask me why I want it; just bring it." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "One of the quiet trade, I see. Funny, I was just thinking how nice it'd be to have someone who could find things, and never mention where they found them." },
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "Ah, a warlock. I don't buy what you'd sell and I don't sell what you'd buy, so we needn't waste each other's time, unless you'd like to." },
      },
      again = { { id = "h_again", text = "Still here asking questions? That's how I started, and look where it got me." } },
      choices = {
        { text = "What do the shells sell for?", next = "shells" },
        { text = "What's it like being Krazek's cousin?", next = "krazek" },
        { text = "Who buys this stuff?", next = "buyers" },
        { text = "I've coin. Let me invest.", next = "invest", when = { money = { min = 500000 } } },
        { text = "I know a smuggler when I see one, Tran'rek.", next = "x_rogue", when = { class = "ROGUE" } },
        { text = "Are you offering me work, Tran'rek?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What makes you think I'd sell anything dark?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "I'll bring them.", next = "END", fx = { affinity = 1 } },
      },
    },
    shells = {
      lines = { { id = "s_default", text = "More than I pay you and less than you'd hope, which is the whole secret of commerce, so don't write it down." } },
      choices = {
        { text = "Then pay me more.", next = "shells_more", fx = { trait = { greedy = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shells_more = {
      lines = { { id = "sm_default", text = "Ha! No, but I like you better for asking. Respect is free, and I give it away constantly." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    krazek = {
      lines = { { id = "k_default", text = "Exhausting, since he tells everyone everything and I tell nobody anything. Between the two of us, we make one perfectly balanced goblin." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    buyers = {
      lines = { { id = "b_default", text = "Rich people, far away from here, and that's all you're getting, which is more than Krazek would get." } },
      choices = {
        { text = "Something else.", next = "BACK" },
        { text = "Who's buying, Tran'rek? Or should Krazek hear what you charge?", tag = "Intimidate", next = "buyers_true",
          check = { pass = { any = { { power = { "above", "far_above" } }, { class = { "WARRIOR", "ROGUE" } }, { trait = "stern" } } } },
          fail = { next = "buyers_no", fx = { affinity = -1 } } },
      },
    },
    invest = {
      lines = { { id = "i_default", text = "Invest, with me? Put that purse away before somebody sees it, including me, and especially me." } },
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
      { id = "tp_knows", text = "I know plenty and tell very little, but you're welcome to ask. Asking's free." },
    },
    background = { { id = "tp_ba", text = "I'm a goblin, a businessman and cousin to a talker, and that last one I didn't choose." } },
    steamwheedle = { { id = "tp_cartel", text = "The Cartel? Lovely people, very fair, every one of them. Is this conversation being written down?" } },
    _none = { { id = "tp_none", text = "Wouldn't know, and wouldn't tell you if I did, no offense." } },
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
    { id = "g_inn", text = "Welcome to the Road Warrior! Grab a stool, grab a drink, shake the sand out of your boots." },
    { id = "g_home", when = { homeInn = { "Gadgetzan", "The Road Warrior" } }, text = "You again! Your room's ready and the sand's been swept out of it, mostly." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Easy! You walk out in the heat like that and the Bruisers'll be scraping you off the street." },
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look like the desert chewed you up and spat you out, friend, so sit down and drink something wet." },
  },

  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "In a desert, friend, water is the most expensive thing on the menu, and I didn't set the price, the Water Company did. A mage could put me out of business with a flick of the wrist, so keep the conjuring to your room and I'll keep the stew warm." } },
      choices = {
        { text = "Water should be free in a drought.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Business is business. I'll keep it quiet.", next = "BACK", fx = { affinity = 1, align = { light = -1 } } },
        { text = "Something else, Fizzgrimble.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not often, because the Bruisers are quick and I'm quicker. Still, the port brings in all sorts, and I've had pirates at one table and Booty Bay debt-collectors at the next, so a smart innkeeper watches his guests' pockets as well as his own." } },
      choices = {
        { text = "A smart thief wouldn't steal under the Bruisers' noses.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "I'd never steal from your guests.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Innkeeper Fizzgrimble, of the Road Warrior: the best inn in Gadgetzan, and also the only inn in Gadgetzan, and those two facts are related." },
        { id = "h_sand", when = { metBefore = true }, text = "There's sand in the stew again, so I tell the guests it's seasoning, a very exclusive desert seasoning." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Night's when Gadgetzan cools off and the Bruisers relax, a little. Hear that? Somebody's arguing about water again." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage! Please don't go conjuring water in my common room, friend, because I charge for it, and everybody watching will want it free." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue in my inn! Keep your hands off the other guests' purses, if you'd be so kind, and I'll keep my hands off the bill." },
      },
      again = {
        { id = "h_again", text = "Anything else? Have a drink while you think." },
        { id = "h_again2", text = "Ask away, friend; the stool's paid for and the gossip's free." },
      },
      choices = {
        { text = "I'd like a room.", next = "BUSINESS" },
        { text = "What's the news in town?", next = "news" },
        { text = "Why 'the Road Warrior'?", next = "name" },
        { text = "Do the Sandfury ever drink here?", next = "x_troll", when = { race = "Troll" } },
        { text = "Who cooks for the Road Warrior?", next = "kitchen" },
        { text = "Horde and Alliance drink here together?", next = "both", when = { minLevel = 40 } },
        { text = "You charge for water in your inn?", next = "xmage", when = { class = "MAGE" } },
        { text = "Do guests often lose their purses here?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Just a drink, thanks.", next = "END" },
      },
    },
    news = {
      lines = { { id = "n_default", text = "Water's dear, the Bruisers are grumpy, Marin's elixir made a fellow small for an hour, and someone saw bugs the size of carts out past the dunes, so it's a normal week." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kitchen = {
      lines = { { id = "k_default", text = "Dirge Quikcleave, the butcher, who'll tell you he's the greatest living chef in Azeroth before you've sat down. He's half right, which for Dirge is a fine average." } },
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
      lines = { { id = "na_default", text = "Because everyone who walks in has crossed a desert to get here, so every guest's a road warrior, and flattery sells rooms." } },
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
      { id = "tp_knows", text = "Everyone in Gadgetzan drinks at the Road Warrior, since there's nowhere else, so I hear everything! Ask away." },
    },
    background = { { id = "tp_ba", text = "I opened the Road Warrior with one stool and a barrel, and now I've got four stools. That's growth!" } },
    advice = { { id = "tp_ad", text = "Drink water first, ale second. The other way round, the desert wins." } },
    _none = { { id = "tp_none", text = "Never heard of it, but do you want to hear about the weather? It's hot, and that's the weather." } },
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
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "That's what the last one said, right before he asked me where I kept my strongbox. If you're truly not from Booty Bay, you'll understand why I keep looking over your shoulder, and you won't take it personally." } },
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
    hello = {
      lines = {
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
      },
      again = { { id = "h_again", text = "Anything else? Say it quietly, because ships have ears." } },
      choices = {
        { text = "How much do you owe MacKinley?", next = "debt" },
        { text = "What's in the shipment?", next = "shipment" },
        { text = "Why not just sail away?", next = "leave" },
        { text = "What's MacKinley like, to owe?", next = "mackinley", when = { heardLine = "mackinley.h_default" } },
        { text = "I'm not here to judge you, Stoley.", next = "x_paladin", when = { class = "PALADIN" } },
        { text = "Nobody sent me, Stoley.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "I could turn you into a sheep, Stoley.", next = "xmage", when = { class = "MAGE" } },
        { text = "You should pay your debts.", next = "END", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Debts in Booty Bay are for fools who get caught.", next = "END", fx = { affinity = 1, align = { order = -1 } } },
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
    { id = "g_forge", text = "Welcome to the hottest forge in the hottest town in Kalimdor, friend, and don't touch the anvil, or anything else for that matter." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! Are you buying or mending, because I do both now, and you can ask me how." },
  },

  notice = {
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "A smith! I thought so, from the forearms, so don't look so surprised. You don't look like one, but looks lie, and mine certainly do." },
    { id = "n_purse", cat = "purse", when = { money = { max = 1500 } },
      text = "That's a light purse you've got there, lighter than mine, anyway. Browse all you like, because browsing's free, and everything else isn't." },
  },

  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "For anyone who pays and doesn't stab a Bruiser with it, yes, and I've never asked what my edges get used for. The Repairers' Union wanted me to ask questions, and that's partly why I don't belong to the Repairers' Union." } },
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
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Krinkle Goodsteel. Iron, thorium, flux, and molds for things that nobody else will make molds for. If you can pay, I can pour it." },
        { id = "h_mold", tags = { "news" }, when = { questActive = TODO_QUEST("Mold Rhymes With...") },
          text = "Arbington's courier, or is it Dithers's? Doesn't matter, both send the same bones. Fifteen gold for the mold, up front, no haggling. The lesson on the stem I'll throw in free. I'm sentimental." },
        { id = "h_plume", tags = { "news" }, when = { questActive = TODO_QUEST("Fire Plume Forged") },
          text = "The key needs a fire hot enough to set it, and my forge isn't it. Fire Plume Ridge, in Un'Goro. Find the hottest spot and hold your breath." },
        { id = "h_union", when = { metBefore = true },
          text = "The Repairers' Union pulled my right to mend armor once, saying I was undercutting them, so I filed a complaint, and then I filed five more. Now I mend armor again, and that's persistence for you, friend." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "A rogue, and with blades that haven't seen a proper stone in weeks. I could put an edge on those daggers that'll go through a Wastewander's leathers like butter." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage. You don't need my steel, but I'll wager you'd like a smith who can pour a mold for something the Kirin Tor never bothered to make." },
      },
      again = {
        { id = "h_again", text = "More questions? Ask them over the anvil, because the thorium cools while we chat." },
        { id = "h_again2", text = "Still here? Then you're either buying or haggling, and I filed a complaint against haggling years ago." },
      },
      choices = {
        { text = "Who else buys these molds?", next = "who" },
        { text = "Show me your stock.", next = "BUSINESS" },
        { text = "Goblin steel? Let's see if it meets a dwarf's standards.", next = "x_dwarf", when = { race = "Dwarf" } },
        { text = "Do you sharpen for anyone who pays?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What would a mage need from a mold?", next = "xmage", when = { class = "MAGE" } },
      },
    },
    who = {
      lines = {
        { id = "w_default", text = "Couriers from the north, mostly, with bags of bones and long faces. I don't ask what the keys are for. That's the secret of a long career in Gadgetzan." },
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
      { id = "tp_knows", text = "I know metal, and I know who's buying it. Ask, but don't waste my time." },
    },
    scholomance = { { id = "tp_scholomance", text = "Never been. Never going. I make the key; somebody else gets to use it. Best arrangement there is." } },
    steamwheedle = { { id = "tp_cartel", text = "The Cartel keeps the bruisers paid and the trade roads open. I pay my share. I complain about it, but I pay." } },
    _none = { { id = "tp_none", text = "That's not my trade, friend, my trade is metal, so how about buying some?" } },
  },
}
