-- Gadgetzan: the Steamwheedle Cartel's desert town. Voice: bibles/tanaris.md
-- Neutral ground: both factions talk to everyone here.
local P = RPGDialogueAPI:Pack("rpgd.tanaris")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "marin", id = TODO_NPC("Marin Noggenfogger"), name = "Marin Noggenfogger",
  bible = "bibles/tanaris.md", role = "vendor", tier = "major",
  communities = { "gadgetzan" }, temper = { "eager" }, values = { "ambitious", "practical" },
  notices = { "purse", "drink" },

  greetings = {
    { id = "g_heat", text = "Hot! Hot, hot, hot. Every day, hot. Come in, come in, out of the sun. I've something to tell you about." },
    { id = "g_back", when = { metBefore = true }, text = "My favorite partner in progress! Partner is a strong word. Associate. Customer!" },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "Now that is a well-stuffed purse. Have you thought about investing in refreshment? Liquid refreshment? With side effects? Minor ones!" },
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Ah, you've been at the Road Warrior's ale. Amateur hour. Wait until you try my elixir." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Marin Noggenfogger, alchemist and businessgoblin. I'm working on an elixir that's going to make me rich. And you a bit thirstier, possibly. Small price." },
        { id = "h_thirsty", tags = { "news" }, when = { questActive = TODO_QUEST("The Thirsty Goblin") },
          text = "The dew collectors in Thistleshrub Valley, southwest of here. They carry a gland full of the stuff. Bring me one. Try not to squeeze it." },
        { id = "h_taste", when = { questActive = TODO_QUEST("In Good Taste") },
          text = "It works, but it tastes like a boot. Take it to Sprinkle. She knows how to make awful things palatable." },
        { id = "h_delivery", when = { questActive = TODO_QUEST("Delivery for Marin") },
          text = "Sprinkle's powder! She says I owe her. She always says I owe her. She's usually right." },
        { id = "h_elixir", when = { questActive = TODO_QUEST("Noggenfogger Elixir") },
          text = "This is it. The finished thing. Drink one and tell me what happens. I'll take notes, and I'll stand back a little." },
        { id = "h_done", tags = { "news" }, when = { questRecent = { TODO_QUEST("Noggenfogger Elixir"), days = 3 } },
          text = "You drank it and you're still the right size! Mostly the right size. I'm putting you in the advertisements." },
      },
      again = {
        { id = "h_again", text = "More questions? Ask in the shade. Everything's better in the shade." },
        { id = "h_again2", text = "Yes, yes? I'm listening. I'm also sweating. Go on." },
      },
      choices = {
        { text = "What does the elixir do?", next = "elixir" },
        { text = "How do you stand the heat?", next = "heat" },
        { text = "What's Sprinkle to you?", next = "sprinkle" },
        { text = "How's business?", next = "business" },
        { text = "Alchemist to alchemist: what's in it?", next = "recipe", when = { profession = "Alchemy" } },
        { text = "Slow fall? I can do that already.", next = "slowfall", when = { class = "MAGE" } },
        { text = "Sprinkle calls you Noggy.", next = "noggy", when = { heardLine = "sprinkle.n_default" } },
        { text = "Good luck with it.", next = "END" },
      },
    },
    elixir = {
      big = true,
      lines = {
        { id = "e_default", text = "Refreshes you, mostly. Sometimes you shrink. Sometimes you float a bit. Sometimes you come out looking like a skeleton for a while. All very temporary! I'm almost sure." },
      },
      choices = {
        { text = "Almost sure?", next = "elixir_safe", fx = { trait = { cautious = 1 } } },
        { text = "I'll take a dozen.", next = "BACK", fx = { affinity = 2, trait = { brave = 1 } } },
        { text = "I'll pass.", next = "BACK", fx = { affinity = -1, trait = { cautious = 1 } } },
      },
    },
    elixir_safe = {
      lines = { { id = "es_default", text = "Nobody's stayed a skeleton. Nobody's stayed small. One fellow stayed very cheerful for a week, but that might have been unrelated." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    heat = {
      lines = { { id = "ht_default", text = "I don't! I complain. Complaining is how a goblin cools down. Also I'm developing a drink for it. Everything comes back to the drink." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    sprinkle = {
      lines = { { id = "sp_default", text = "My friend. My very good friend. My friend who fixes my recipes and reminds me what I owe her. Every day. With numbers." } },
      choices = {
        { text = "Just a friend?", next = "sprinkle_friend", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sprinkle_friend = {
      lines = { { id = "sf_default", text = "Is it hot in here? It's hot in here. Next question. Quickly." } },
      choices = { { text = "Ha. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    business = {
      lines = { { id = "b_default", text = "The Cartel takes a cut, the Water Company charges for every cup, and I'm about to sell the cure for both. Business is wonderful. Or will be." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "steamwheedle" } } } },
    },
    recipe = {
      lines = { { id = "r_default", text = "Dew from a desert plant that refuses to die, and a little something to stop it tasting of feet. The rest is a trade secret. Also I lost the notes." } },
      choices = { { text = "You lost the notes?", next = "BACK", fx = { affinity = 1, trait = { curious = 1 } } } },
    },
    slowfall = {
      lines = { { id = "sl_default", text = "Yes, and you have to learn it! Mine comes in a bottle. Anybody can drink a bottle. That's the whole business, right there." } },
      choices = { { text = "Fair point.", next = "BACK", fx = { affinity = 1 } } },
    },
    noggy = {
      lines = { { id = "ng_default", text = "She does. Only she does. You don't. Nobody else does. That's... that's an arrangement we have." } },
      choices = { { text = "Your secret's safe.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Born poor, got thirsty, got ideas. The ideas are going to make me rich. The thirst is still working on it." } },
    advice = { { id = "tp_ad", text = "Carry twice the water you think you need, and buy it from me. Well, from the Water Company. I'm working on that." } },
    steamwheedle = { { id = "tp_cartel", text = "The Cartel takes its cut, the Bruisers keep the peace, and I keep inventing. Everybody wins. Me most." } },
    _none = { { id = "tp_none", text = "No idea. Is it thirsty? Then I might have something for it." } },
  },
}

P:NPC {
  key = "sprinkle", id = TODO_NPC("Sprinkle"), name = "Sprinkle",
  bible = "bibles/tanaris.md", role = "citizen", tier = "quest",
  communities = { "gadgetzan" }, temper = { "warm" }, values = { "loyal", "generous" },
  notices = { "craft" },

  greetings = {
    { id = "g_kitchen", text = "Hello, sweetie! You look like someone who hasn't eaten anything that tasted good in a week." },
  },

  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "A cook! Then you know the secret: anything can taste good if you find the right ingredient. Anything." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Sprinkle. I fix things that taste wrong. Mostly food. Lately, mostly Marin's experiments. He calls it a partnership; I call it a favor he owes me." },
        { id = "h_taste", tags = { "news" }, when = { questActive = TODO_QUEST("In Good Taste") },
          text = "Noggy's elixir tastes like a swamp? Of course it does. There's a mushroom up in the Hinterlands that fixes anything. Bring me some." },
        { id = "h_secret", when = { questActive = TODO_QUEST("Sprinkle's Secret Ingredient") },
          text = "When I was little I couldn't stand my sister's cooking. Then I found the secret ingredient, and suddenly I could. Fetch me some, would you?" },
      },
      again = { { id = "h_again", text = "Anything else, sweetie?" }, { id = "h_again2", text = "Go on. I'm stirring; I can listen." } },
      choices = {
        { text = "Noggy?", next = "noggy" },
        { text = "What's the secret ingredient?", next = "secret" },
        { text = "What's Marin like?", next = "marin" },
        { text = "Tell me about your sister's cooking.", next = "sister" },
        { text = "Trade a recipe?", next = "trade", when = { profession = "Cooking" } },
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
      lines = { { id = "m_default", text = "Clever, sweaty, and always one bottle away from a fortune. He owes me for every one of those bottles. I keep a list. He hates the list." } },
      choices = {
        { text = "Will he ever pay you back?", next = "marin_pay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    marin_pay = {
      lines = { { id = "mp_default", text = "Oh, he pays. In stories, and in promises, and once in a very nice hat. I'm keeping the hat." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sister = {
      lines = { { id = "si_default", text = "Dreadful. Lovingly dreadful. She'd boil anything that stood still. I learned to cook so I'd survive, and I learned to fix food so I'd survive her." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    trade = {
      lines = { { id = "t_default", text = "A cook who shares! All right: a pinch of salt in anything sweet, and a squeeze of lemon in anything that came out of a swamp. That's free. The secret isn't." } },
      choices = { { text = "Thank you.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Grew up with a sister who couldn't cook and a stubborn tongue. One of those made me a cook." } },
    advice = { { id = "tp_ad", text = "If something tastes wrong, it's missing one thing. Find the one thing. Don't add six." } },
    _none = { { id = "tp_none", text = "Couldn't say, sweetie. Can I get you something to eat instead?" } },
  },
}

P:NPC {
  key = "bilgewhizzle", id = TODO_NPC("Chief Engineer Bilgewhizzle"), name = "Chief Engineer Bilgewhizzle",
  bible = "bibles/tanaris.md", role = "questgiver", tier = "quest",
  communities = { "gadgetzan" }, temper = { "harried" }, values = { "practical", "proud" },
  notices = { "craft", "kit" },

  greetings = {
    { id = "g_water", text = "Water Company business only, please. If you're here about the pressure, take a number." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "An engineer! Look at this pump. No, really look at it. Tell me it's not beautiful. Then tell me why it isn't working." },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "The Wastewanders got you. They get everybody. Get patched, then get even." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Water is everything out here. The Water Company keeps Gadgetzan drinking, and the Wastewander bandits keep stealing it. Guess which one of us is having a worse week." },
        { id = "h_justice", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Wastewander Justice") }, { questActive = TODO_QUEST("More Wastewander Justice") } } },
          text = "The Wastewanders camp around the water sources and take what they like. Teach them about consequences. In bulk." },
        { id = "h_after", tags = { "news" }, when = { questRecent = { TODO_QUEST("More Wastewander Justice"), days = 3 } },
          text = "Pressure's up two notches since you thinned the Wastewanders. Two whole notches! I nearly cried. I'm an engineer; we don't cry. Often." },
      },
      again = { { id = "h_again", text = "What else? Quickly, the gauge is twitching." } },
      choices = {
        { text = "How does a desert town get water?", next = "water" },
        { text = "Who are the Wastewanders?", next = "bandits" },
        { text = "Who runs the Water Company?", next = "company" },
        { text = "Let me look at that pump.", next = "pump", when = { profession = "Engineering" } },
        { text = "Good luck with the pressure.", next = "END" },
      },
    },
    water = {
      lines = { { id = "w_default", text = "Towers out at Waterspring Field, pulling it up from under the sand. Delicate machinery. Very delicate. Bandits are not delicate." } },
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
      lines = { { id = "b_default", text = "Desert folk with guns and no water bill. They take a source, then sell the water back to the caravans. It's almost good business. I hate that it's almost good business." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    company = {
      lines = { { id = "c_default", text = "The Cartel owns it, I run it, and everybody in town complains about it. That's how you know it's working." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "steamwheedle" } } } },
    },
    pump = {
      lines = { { id = "p_default", text = "See the seal? Sand in it. Always sand. You can't keep sand out of anything in Tanaris. I've stopped trying. Now I build things that like sand." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Engineer. Water engineer, specifically, which in Tanaris makes me the most important goblin nobody thanks." } },
    advice = { { id = "tp_ad", text = "Never camp by a water source out there. Somebody already has, and they've got a gun." } },
    _none = { { id = "tp_none", text = "Unless it's wet, it's not my department." } },
  },
}

P:NPC {
  key = "fizzledowser", id = TODO_NPC("Senior Surveyor Fizzledowser"), name = "Senior Surveyor Fizzledowser",
  bible = "bibles/tanaris.md", role = "scholar", tier = "quest",
  communities = { "gadgetzan" }, temper = { "cautious" }, values = { "practical", "dutiful" },
  notices = { "craft" },

  greetings = {
    { id = "g_maps", text = "Careful with the maps. Every one of those circles is a place we used to have water." },
  },

  notice = {
    { id = "n_eng", cat = "craft", when = { profession = { "Engineering", "Mining" } },
      text = "You know the ground, or the gadgets. Either one helps. Both would be a miracle." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Senior Surveyor Fizzledowser, Gadgetzan Water Company. The Wastewanders took half our sources. I find new ones. It's slower than it sounds." },
        { id = "h_survey", tags = { "news" }, when = { questActive = TODO_QUEST("Gadgetzan Water Survey") },
          text = "Take the dowsing widget to Sandsorrow Watch and sample the pool. Should be simple. I say that about everything; it rarely is." },
        { id = "h_lair", when = { questActive = TODO_QUEST("Noxious Lair Investigation") },
          text = "Giant insects, at a water hole? That's not natural. Bring me pieces from their lair; Pestlezugg can tell us what they are." },
        { id = "h_analysis", when = { questActive = TODO_QUEST("Insect Part Analysis") },
          text = "Pestlezugg's report. Let me see. Oh. Oh, that's worse than I hoped. I'd hoped for nothing at all." },
      },
      again = { { id = "h_again", text = "Something else? I'll mark it on a map." } },
      choices = {
        { text = "What are the insects?", next = "insects" },
        { text = "How do you find water in a desert?", next = "dowsing" },
        { text = "What happened to the old sources?", next = "maps" },
        { text = "Pestlezugg thinks they come from Un'Goro.", next = "ungoro", when = { heardLine = "pestlezugg.h_march" } },
        { text = "I'll go and look.", next = "END", fx = { affinity = 1 } },
      },
    },
    insects = {
      big = true,
      lines = {
        { id = "i_default", text = "Big, organized, and coming up out of the sand where they've no business being. I don't think this stops at Tanaris. I'd love to be wrong." },
      },
      choices = {
        { text = "Let's find out.", next = "BACK", fx = { affinity = 2, trait = { curious = 1 } } },
        { text = "Who else should know?", next = "insects_who" },
      },
    },
    insects_who = {
      lines = { { id = "iw_default", text = "Everyone with a city and a wall. I've written to the Cartel. The Cartel wrote back asking about the water. The Cartel always asks about the water." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dowsing = {
      lines = { { id = "d_default", text = "A widget, a lot of walking, and listening for the widget to stop screaming. When it stops, dig. When it starts again, run." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    maps = {
      lines = { { id = "m_default", text = "Bandits sit on some. Sand ate the others. Every circle on this map is a well we used to drink from. I keep them. Somebody should remember where the water was." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { kind = 1 } } } },
    },
    ungoro = {
      lines = { { id = "u_default", text = "Pestlezugg reads more than I do. If he says the crater, I believe him, and I'm going to start sleeping with the lamp on." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Surveyor. I go out with a widget, I come back with a map, and in between I try very hard not to be eaten." } },
    advice = { { id = "tp_ad", text = "If the sand moves and there's no wind, walk the other way. Quickly." } },
    _none = { { id = "tp_none", text = "Haven't surveyed that. Not yet." } },
  },
}

P:NPC {
  key = "pestlezugg", id = TODO_NPC("Alchemist Pestlezugg"), name = "Alchemist Pestlezugg",
  bible = "bibles/tanaris.md", role = "vendor", tier = "quest",
  communities = { "gadgetzan" }, temper = { "brisk" }, values = { "curious", "practical" },
  notices = { "craft", "pet" },

  greetings = {
    { id = "g_shop", text = "In need of supplies? Vials, phials, the good flasks? Don't mind the rat. That's Rose. She's an assistant." },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "A fellow alchemist! I've some insect samples you'd find fascinating. Or horrifying. Usually both." },
    { id = "n_pet", cat = "pet", when = { pet = { type = "Beast" } },
      text = "Keep your pet away from Rose. She's small, but she bites, and she's been at the reagents." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Alchemist Pestlezugg. I sell supplies, and when the Water Company finds something nasty, I take it apart and tell them how nasty." },
        { id = "h_analysis", tags = { "news" }, when = { questActive = TODO_QUEST("Insect Part Analysis") },
          text = "These parts confirm what I feared. These aren't scattered bugs. They're organized. Take my report to Fizzledowser, quickly." },
        { id = "h_march", key = true, when = { questActive = TODO_QUEST("March of the Silithid") },
          text = "Gracina Spiritmight in Darnassus and Zilzibin Drumlore both have theories about where these things come from. Un'Goro, they think. I think they may be right." },
        { id = "h_bungle", when = { questActive = TODO_QUEST("Bungle in the Jungle") },
          text = "I need a scent gland from the hive's own and a handful of Un'Goro soil. With the two, I can build a lure. I'd rather not say for what yet." },
        { id = "h_rose", when = { metBefore = true }, text = "Rose ate the label off a jar again. Now I've a jar of something and no idea what. Rose looks pleased. That worries me." },
      },
      again = { { id = "h_again", text = "Anything else? Rose is getting impatient. Rose is always impatient." } },
      choices = {
        { text = "Let's see your supplies.", next = "BUSINESS" },
        { text = "Who's Rose?", next = "rose" },
        { text = "What did you find in the insect parts?", next = "insects" },
        { text = "Talk shop with me.", next = "shop", when = { profession = "Alchemy" } },
        { text = "Just browsing.", next = "END" },
      },
    },
    rose = {
      lines = { { id = "r_default", text = "My assistant. She tests things. Not on purpose. She's survived everything so far, which is either very good or very bad news about my reagents." } },
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
      lines = { { id = "i_default", text = "Hard shells, shared scent, the same markings on every one. They're not a swarm. They're a hive with somewhere to be." } },
      choices = {
        { text = "Where would a hive like that come from?", next = "insects_where" },
        { text = "Something else.", next = "BACK" },
      },
    },
    insects_where = {
      lines = { { id = "iw_default", text = "Somewhere hot and green and full of things that grew too big. Un'Goro, if the scholars in Darnassus and Ironforge are right. I hope they're wrong. They're rarely wrong together." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
    shop = {
      lines = { { id = "s_default", text = "Keep your reagents dry, your vials corked, and your rat out of the cupboard. I manage two of those." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Alchemist. Always was. Rose came later, and she's never told me where from." } },
    advice = { { id = "tp_ad", text = "Label your vials. Then hide the labels from your rat." } },
    _none = { { id = "tp_none", text = "If you can't distill it, dissect it or sell it, I'm not your goblin." } },
  },
}

P:NPC {
  key = "tranrek", id = TODO_NPC("Tran'rek"), name = "Tran'rek",
  bible = "bibles/tanaris.md", role = "questgiver", tier = "quest",
  communities = { "gadgetzan" }, temper = { "evasive" }, values = { "cunning", "ambitious" },
  notices = { "purse" },

  greetings = {
    { id = "g_shifty", text = "What do I do? A bit of this, a bit of that. Profitable bits. You can't have any." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "Somebody's doing well. You ever buy scarab shells? You should. Everybody should." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Tran'rek. I buy what the desert's got and sell it to people who haven't got a desert. Business is good. Better than I'll tell you." },
        { id = "h_krazek", when = { any = { { questActive = TODO_QUEST("Tran'rek") }, { heardLine = "krazek.h_default" } } },
          text = "Krazek sent you? My cousin. He talks too much. I'm sure he told you so himself, at length." },
        { id = "h_shells", tags = { "news" }, when = { questActive = TODO_QUEST("Scarab Shells") },
          text = "Uncracked scarab shells. Uncracked is the important part. Cracked ones are worth exactly nothing." },
        { id = "h_valley", when = { questActive = TODO_QUEST("Thistleshrub Valley") },
          text = "Thistleshrub Valley has something I want. Don't ask me why I want it. Just bring it." },
      },
      again = { { id = "h_again", text = "Still here? Asking questions? That's how I started. Look where it got me." } },
      choices = {
        { text = "What do the shells sell for?", next = "shells" },
        { text = "What's it like being Krazek's cousin?", next = "krazek" },
        { text = "Who buys this stuff?", next = "buyers" },
        { text = "I've coin. Let me invest.", next = "invest", when = { money = { min = 500000 } } },
        { text = "I'll bring them.", next = "END", fx = { affinity = 1 } },
      },
    },
    shells = {
      lines = { { id = "s_default", text = "More than I pay you, less than you'd hope. That's the whole secret of commerce. Don't write it down." } },
      choices = {
        { text = "Then pay me more.", next = "shells_more", fx = { trait = { greedy = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shells_more = {
      lines = { { id = "sm_default", text = "Ha! No. But I like you better for asking. Respect is free. I give it away constantly." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    krazek = {
      lines = { { id = "k_default", text = "Exhausting. He tells everyone everything. I tell nobody anything. Between us, we're one perfectly balanced goblin." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    buyers = {
      lines = { { id = "b_default", text = "People. Rich ones. Far away ones. That's all you're getting, and it's more than Krazek would get." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    invest = {
      lines = { { id = "i_default", text = "Invest? With me? Put that purse away before somebody sees it. Including me. Especially me." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Goblin. Businessman. Cousin to a talker. That last one I didn't choose." } },
    steamwheedle = { { id = "tp_cartel", text = "The Cartel? Lovely people. Very fair. Is this conversation being written down?" } },
    _none = { { id = "tp_none", text = "Wouldn't know. Wouldn't tell you if I did. No offense." } },
  },
}

P:NPC {
  key = "fizzgrimble", id = TODO_NPC("Innkeeper Fizzgrimble"), name = "Innkeeper Fizzgrimble",
  bible = "bibles/tanaris.md", role = "innkeeper", tier = "service",
  communities = { "gadgetzan" }, temper = { "chatty" }, values = { "generous" },
  notices = { "drink", "weary" },

  greetings = {
    { id = "g_inn", text = "Welcome to the Road Warrior! Grab a stool, grab a drink, shake the sand out of your boots." },
    { id = "g_home", when = { homeInn = { "Gadgetzan", "The Road Warrior" } }, text = "You again! Room's ready. Sand's been swept out. Mostly." },
  },

  notice = {
    { id = "n_drunk", cat = "drink", when = { drunk = { min = 2 } },
      text = "Easy! You walk out in the heat like that and the Bruisers'll be scraping you off the street." },
    { id = "n_weary", cat = "weary", place = "before", when = { resSick = true },
      text = "You look like the desert chewed you up and spat you out. Sit. Drink something wet." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Innkeeper Fizzgrimble, of the Road Warrior. Best inn in Gadgetzan. Only inn in Gadgetzan. Those facts are related." },
        { id = "h_sand", when = { metBefore = true }, text = "Sand in the stew again. I tell guests it's seasoning. Desert seasoning. Very exclusive." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "Night's when Gadgetzan cools off and the Bruisers relax. A little. Hear that? Somebody's arguing about water again." },
      },
      again = { { id = "h_again", text = "Anything else? Drink while you think." } },
      choices = {
        { text = "I'd like a room.", next = "BUSINESS" },
        { text = "What's the news in town?", next = "news" },
        { text = "Why 'the Road Warrior'?", next = "name" },
        { text = "Just a drink, thanks.", next = "END" },
      },
    },
    news = {
      lines = { { id = "n_default", text = "Water's dear, the Bruisers are grumpy, Marin's elixir made a fellow small for an hour, and someone saw bugs the size of carts out past the dunes. A normal week." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    name = {
      lines = { { id = "na_default", text = "Because everyone who walks in has crossed a desert to get here. Every guest's a road warrior. Flattery sells rooms." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Opened the Road Warrior with one stool and a barrel. Now I've got four stools. Growth!" } },
    advice = { { id = "tp_ad", text = "Drink water first, ale second. The other way round, the desert wins." } },
    _none = { { id = "tp_none", text = "Never heard of it. Want to hear about the weather? Hot. That's the weather." } },
  },
}

-- Steamwheedle Port, on the coast east of Gadgetzan.
P:NPC {
  key = "stoley", id = TODO_NPC("Stoley"), name = "Stoley",
  bible = "bibles/tanaris.md", role = "citizen", tier = "quest",
  communities = { "steamwheedle_port" }, temper = { "nervous" }, values = { "practical" },
  notices = { "purse" },

  greetings = {
    { id = "g_dock", text = "Who sent you? No, don't tell me. I know who sent you. It's always the same fellow." },
  },

  notice = {
    { id = "n_rich", cat = "purse", when = { money = { min = 500000 } },
      text = "You wouldn't consider a small loan? To a man with excellent prospects? No. Nobody does." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Stoley. I work the port. I keep my head down. Some people in Booty Bay think I owe them money, and they're not entirely wrong." },
        { id = "h_mackinley", tags = { "news" }, when = { any = { { questActive = TODO_QUEST("Stoley's Debt") }, { heardLine = "mackinley.h_default" } } },
          text = "MacKinley. Of course it's MacKinley. All right. I'll make it good. I've got a shipment coming that'll square us." },
        { id = "h_shipment", when = { questActive = TODO_QUEST("Stoley's Shipment") },
          text = "My shipment. Get it here and we'll all be happier. Especially me. And MacKinley. Mostly me." },
        { id = "h_deliver", when = { questActive = TODO_QUEST("Deliver to MacKinley") },
          text = "Take it to the Sea Wolf, with my compliments. And tell him we're even. Please tell him we're even." },
        { id = "h_owe", when = { metBefore = true }, text = "If MacKinley's sent you, I'm not here. If he hasn't, I'm here, and I've got a fine selection of bottles." },
      },
      again = { { id = "h_again", text = "Anything else? Quietly. Ships have ears." } },
      choices = {
        { text = "How much do you owe MacKinley?", next = "debt" },
        { text = "What's in the shipment?", next = "shipment" },
        { text = "Why not just sail away?", next = "leave" },
        { text = "What's MacKinley like, to owe?", next = "mackinley", when = { heardLine = "mackinley.h_default" } },
        { text = "You should pay your debts.", next = "END", fx = { affinity = -1, align = { order = 1 } } },
        { text = "Good luck.", next = "END", fx = { affinity = 1 } },
      },
    },
    debt = {
      lines = { { id = "d_default", text = "A sum. A sum with friends. It started small and invited all its cousins." } },
      choices = {
        { text = "How did it start?", next = "debt_start" },
        { text = "Something else.", next = "BACK" },
      },
    },
    debt_start = {
      lines = { { id = "ds_default", text = "One game of knucklebones in Booty Bay. I won the first round. Never win the first round. That's how they get you." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
    shipment = {
      lines = { { id = "s_default", text = "Bottles. Good ones. Worth enough to square things, if they arrive, and if nobody drinks them on the way. Sailors drink everything on the way." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    leave = {
      lines = { { id = "lv_default", text = "Every ship out of here stops at Booty Bay sooner or later. So would I. So would he, waiting on the dock with a smile." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    mackinley = {
      lines = { { id = "m_default", text = "Patient. That's the frightening part. A shouting man you can run from. A patient one is already waiting where you're running to." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { cautious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "Sailor, merchant, debtor. Mostly the last one, lately." } },
    advice = { { id = "tp_ad", text = "Never borrow from anyone with a nickname." } },
    _none = { { id = "tp_none", text = "I don't know anything. Knowing things gets a man in trouble." } },
  },
}
