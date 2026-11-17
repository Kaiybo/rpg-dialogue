-- The Everlook Bruisers: Cartel muscle in fur hats.
local P = RPGDialogueAPI:Pack("rpgd.winterspring")

P:Pool {
  id = "guard_everlook", role = "guard", community = "everlook",
  barks = {
    { id = "b_cold", text = "Can't feel my ears and can't feel my toes, but I can still feel my paycheck, barely." },
    { id = "b_yeti", text = "If you hear a yeti in town, it's probably one of Umi's... probably." },
  },
  greetings = {
    { id = "g_everlook", text = "This is Everlook, and it's Cartel ground, so Horde, Alliance or whoever you are, you trade here and fight somewhere else." },
  },
  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Furbolgs, or frostsabers? Either way your gear's in pieces, and the smith's inside, where it's warm." },
  },
  react = { { id = "r_form", on = "form", when = { form = "bear" }, text = "Another bear, is it? Fine, just don't track snow into the inn." } },
  lines = {
    { id = "l_default", text = "We keep the peace and the yetis out, or mostly the peace, since the yetis do what they like. One got into the inn's larder last winter and ate a wheel of cheese, rind and all." },
  },
  -- 0.71.0: the bruisers' own conversation (community pool, so it beats the faction guard tree).
  tier = "service",
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Stamp the snow off your boots before you go inside, and keep your weapons on your back while you're in town. What do you want, pal?" },
        { id = "h_horde", when = { faction = "Horde" }, text = "Horde, all the way up here? The wind doesn't care whose side you're on and neither does the Cartel, so keep your axe cold and your coin warm. What do you need?" },
        { id = "h_alliance", when = { faction = "Alliance" }, text = "Alliance, all the way up here? The wind doesn't care whose side you're on and neither does the Cartel, so keep your sword cold and your coin warm. What do you need?" },
        { id = "h_rep", when = { reputation = { faction = "Everlook", min = "honored" } }, text = "Hey, it's Everlook's favourite visitor! Folks inside say good things about you, which is more than they say about me, so what can I do for you?" },
      },
      again = {
        { id = "a_cold", text = "What else? Talk fast, my teeth are chattering." },
        { id = "a_feet", text = "Anything else? I'd stamp my feet while I listen, if I could still feel them; I think the left one's frozen to the sock." },
      },
      choices = {
        { text = "What are the rules in this town?", next = "rules" },
        { text = "How do you stand the cold?", next = "cold" },
        { text = "What's out there in the snow?", next = "trouble" },
        { text = "Who runs Everlook?", next = "boss" },
        { text = "Doesn't staying neutral ever bother you?", next = "neutral" },
        { text = "Do the Alliance give you trouble here?", next = "sides", when = { faction = "Horde" } },
        { text = "Do the Horde give you trouble here?", next = "sides", when = { faction = "Alliance" } },
        { text = "Who'd notice a purse or two going missing?", next = "rogue", when = { class = "ROGUE" } },
        { text = "Do you get many druids up here?", next = "druid", when = { class = "DRUID" } },
        { text = "Stay warm.", next = "END", fx = { standing = { everlook = 1 } } },
      },
    },
    rules = {
      lines = {
        { id = "ru_default", text = "Same as every Cartel town, pal: nobody fights, everybody pays, and the yetis stay outside. That last one's more of a hope than a rule, but we work at it." },
      },
      choices = {
        { text = "And if someone does start a fight?", next = "rules_fight" },
        { text = "Simple enough.", next = "BACK" },
      },
    },
    rules_fight = {
      lines = {
        { id = "rf_default", text = "Then we put them out in the snow to cool off, and believe me, out here cooling off doesn't take long. Most folks come back in a lot more polite, and the ones who don't, well, the frostsabers aren't picky." },
      },
      choices = {
        { text = "Cold, but effective.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cold = {
      lines = {
        { id = "co_default", text = "Fur hat, three pairs of socks and the knowledge that every customer up here is too cold to haggle. I'm told the Cartel pays extra for this post, and some day I'd like to see some of that extra." },
      },
      choices = {
        { text = "Why take the post at all?", next = "cold_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cold_why = {
      lines = {
        { id = "cw_default", text = "Because every trapper, miner and lost adventurer in Winterspring ends up here sooner or later, needing everything, and the Cartel sells them all of it. Where there's that much business, pal, somebody has to stand at the gate, even if his nose falls off doing it." },
      },
      choices = {
        { text = "Money keeps you warm, I suppose.", next = "BACK", fx = { trait = { greedy = 1 } } },
        { text = "Mind the nose, then.", next = "BACK", fx = { trait = { witty = 1 }, affinity = 1 } },
      },
    },
    trouble = {
      lines = {
        { id = "tr_default", text = "Frostsabers, yetis, the odd chimaera and the Winterfall furbolgs, and lately the furbolgs are the worst of the lot. They used to keep to themselves, but now they're mean and they're bold, and nobody up here can say why." },
      },
      choices = {
        { text = "What's got into the furbolgs?", next = "trouble_deep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trouble_deep = {
      lines = {
        { id = "td_default", text = "Something they're drinking, if you ask the folks who've been out to their camps, and it isn't anything good. Talk to the ones who study them out in the snow; they'll tell you more than I can, and they'll be glad of a strong arm." },
      },
      choices = {
        { text = "Maybe I'll look into it.", next = "BACK", fx = { trait = { curious = 1 } } },
        { text = "Not my problem.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    boss = {
      lines = {
        { id = "bo_default", text = "The Cartel, same as Booty Bay and Gadgetzan, and the Cartel keeps its bosses somewhere a lot warmer than this. Up here it's us, the merchants and Umi's mechanical yetis, and only two of those three ever do what they're told." },
      },
      choices = {
        { text = "Mechanical yetis?", next = "yeti" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yeti = {
      lines = {
        { id = "ye_default", text = "Umi Rumplesnicker builds them for a laugh and sends them out to scare folks, and every time one comes clanking up to the gate I've got about a second to work out whether to swing or wave. So far I'm right about half the time." },
      },
      choices = {
        { text = "That's the funniest thing I've heard all week.", next = "BACK", fx = { trait = { witty = 1 }, affinity = 1 } },
        { text = "Someone's going to get hurt.", next = "BACK", fx = { trait = { cautious = 1 } } },
      },
    },
    neutral = {
      big = true,
      lines = {
        { id = "ne_default", text = "Pal, up here the snow kills Horde and Alliance just the same, so picking a side would only mean freezing with fewer friends. Everybody trades, everybody gets warm, and the Cartel takes its cut from all of them." },
      },
      choices = {
        { text = "Smart. Everyone's coin is good coin.", next = "BACK", fx = { align = { honor = -1 }, trait = { greedy = 1 } } },
        { text = "I'd pick a side, and I'd freeze for it.", next = "BACK", fx = { align = { honor = 1 }, trait = { stern = 1 } } },
        { text = "Do the two sides ever cooperate up here?", next = "neutral_coop" },
      },
    },
    neutral_coop = {
      lines = {
        { id = "nc_default", text = "When a blizzard comes in off the peaks they do, because nobody argues about banners while they're sharing the same fire. The day the weather clears, they go back to glaring, but I've seen an orc and a dwarf split a blanket." },
      },
      choices = {
        { text = "That's good to hear.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sides = {
      lines = {
        { id = "si_default", text = "Not in town they don't, because we don't let them, and it's too cold to fight properly anyway." },
        { id = "si_horde", when = { faction = "Horde" }, text = "They come up through the Timbermaw tunnel same as you, frozen and grumpy, and they glare at you the way you glare at them. Nobody draws in Everlook, though, because everybody's too busy trying to get warm." },
        { id = "si_alliance", when = { faction = "Alliance" }, text = "They come up through the Timbermaw tunnel same as you, frozen and grumpy, and they glare at you the way you glare at them. Nobody draws in Everlook, though, because everybody's too busy trying to get warm." },
      },
      choices = {
        { text = "Good to know.", next = "BACK" },
      },
    },
    druid = {
      lines = {
        { id = "dr_default", text = "A few come through from Moonglade, quiet types, and they look at Winterspring like it's sick and they're the doctor. One of them told me the forest up here is in pain, and I told her so's my nose, but she didn't laugh." },
      },
      choices = {
        { text = "She was probably right.", next = "BACK", fx = { trait = { pious = 1 } } },
        { text = "I'd have laughed.", next = "BACK", fx = { trait = { witty = 1 }, affinity = 1 } },
      },
    },
    rogue = {
      lines = {
        { id = "ro_default", text = "Everybody would, pal, because up here folks keep their purses inside three layers of fur, and you'd have to hug them to get at it. Try it and you'll find out how fast a frozen bruiser can run." },
      },
      choices = {
        { text = "Just asking.", next = "BACK" },
        { text = "Hugging's not my style.", next = "BACK", fx = { trait = { witty = 1 } } },
      },
    },
  },
  topics = {
    steamwheedle = { { id = "t_steamwheedle", text = "Same Cartel as Booty Bay and Gadgetzan, only colder, a lot colder." } },
    _none = { { id = "t_none", text = "Ask inside, friend, because my jaw's frozen." } },
  },
}
