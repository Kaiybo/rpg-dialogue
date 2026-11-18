-- Nighthaven's shopkeepers: Kharedon (light armor), Meliri (weapons), My'lanna (food and drink)
-- and Darnall (tailoring supplies). Voice: bibles/nighthaven_shops.md
local P = RPGDialogueAPI:Pack("rpgd.moonglade")
local TODO_NPC = P.TODO_NPC

---------------------------------------------------------------------------
-- Kharedon, Light Armor Merchant
---------------------------------------------------------------------------
P:NPC {
  key = "kharedon", id = TODO_NPC("Kharedon"), name = "Kharedon", title = "Light Armor Merchant",
  bible = "bibles/nighthaven_shops.md", role = "vendor", tier = "service",
  communities = { "nighthaven" }, temper = { "dry", "gentle" }, values = { "craft", "patient" },
  notices = { "class", "level" },

  impression = {
    first = "He mends what you bring him and asks where it got torn.",
    third = "{name} met Kharedon, who sells light armor and does repairs for the young druids of Nighthaven.",
  },

  greetings = {
    { id = "g_default", text = "Come in, come in. If it's torn, I'll mend it, and if it's too small, I'm afraid that's all I stock." },
    { id = "g_worn", when = { durability = { max = 0.3 } }, text = "Elune's light, you look like you crawled here through a bramble. Let me see to that before it falls off you." },
    { id = "g_away", when = { away = 14 }, text = "Back after {away}? Let me guess: something needs stitching." },
  },

  notice = {
    { id = "n_druid", cat = "class", when = { class = "DRUID", maxLevel = 20 },
      text = "Here for your trials? Then you'll want something that dries quickly after the lake; trust me, every young druid learns that the cold way." },
    { id = "n_high", cat = "level", when = { minLevel = 50 },
      text = "You're far past anything on my shelves, I'm afraid. But I can still mend what you're wearing, and I'll do it properly." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "I'm Kharedon, and I keep light armor for the Circle's visitors: embroidered robes, reinforced leather, a good cloak or two. Most of my customers are young druids who've come up for their first trials, so my stock runs small and sensible." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid of the Circle. Leather's best for you, I think; it moves when you change shape, which cloth never quite forgives." },
      },
      again = {
        { id = "h_again", text = "Anything else? My needle's waiting." },
        { id = "h_again2", text = "Go on. I can stitch and talk at once." },
        { id = "h_again3", text = "Something more? Hold this seam flat while you think, would you." },
      },
      choices = {
        { text = "Why stock armor for the young?", next = "young" },
        { text = "What happens to armor when a druid shifts?", next = "shift" },
        { text = "What are these trials the young druids face?", next = "trials" },
        { text = "You ask everyone how their armor got torn.", next = "tears" },
        { text = "Where does your leather come from?", next = "leather" },
        { text = "Do many tauren come up for the trials?", next = "tauren", when = { race = "Tauren" } },
        { text = "Nothing on your shelves fits me now, does it?", next = "high", when = { minLevel = 50 } },
        { text = "Can you repair my gear?", next = "BUSINESS" },
        { text = "Farewell, Kharedon.", next = "END" },
      },
    },
    young = {
      lines = {
        { id = "y_default", text = "Because they're the ones who climb the path from Darnassus and Thunder Bluff, wide-eyed and badly dressed for the weather. The old druids come here too, but they've worn the same robes for three hundred years and won't hear of new ones." },
      },
      choices = {
        { text = "Do the young ones do well here?", next = "young_well" },
        { text = "Something else.", next = "BACK" },
      },
    },
    young_well = {
      big = true,
      lines = {
        { id = "yw_default", text = "Most do, and the ones who don't usually do the second time. I've seen a tauren calf come back from the lake in tears and walk out a week later with Dendrite's nod, and I gave her a cloak for free, which I'd ask you not to repeat." },
      },
      choices = {
        { text = "That was kind. Every young druid deserves help.", next = "BACK", reply = "I thought so too, and the calf brought me a carved stag the next spring. It's sat on my counter ever since, and I dust it more often than my stock.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Coddling them won't make them stronger.", next = "BACK", reply = "Perhaps not, but a little help never weakened anyone who was already willing to try. The lake does the testing, I only lend a cloak.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    shift = {
      lines = {
        { id = "s_default", text = "It goes wherever the druid goes, somehow, and comes back when they do, and nobody in the Circle has ever explained it to me to my satisfaction. What I do know is that a bear tears seams that a night elf never would, so I double-stitch everything." },
      },
      choices = {
        { text = "Have you asked the druids how it works?", next = "shift_ask" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shift_ask = {
      lines = {
        { id = "sa_default", text = "Once. Loganaar told me it was a matter of the spirit, not the body, and then he looked at my stitching for a long while and said I should keep doing whatever I was doing. I took it as a compliment and stopped asking." },
      },
      choices = {
        { text = "Wise of you.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    trials = {
      lines = {
        { id = "tr_default", text = "Dendrite Starblaze sets them, and they're different for every shape: the Great Bear Spirit for the bear, the lake and the sea for the water shape. I only see the beginning and the end, when they come in nervous and go out proud and soaking wet." },
      },
      choices = {
        { text = "What is the Great Bear Spirit?", next = "trials_bear" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trials_bear = {
      lines = {
        { id = "tb_default", text = "An old spirit who lives up in the north of the vale and speaks to druids about what strength is for. I've never seen it myself, but every young druid who comes back from it sits in my shop afterwards very quietly, as if they've been told something large." },
      },
      choices = {
        { text = "Strength is for protecting others. Surely that's the lesson.", next = "trials_lesson" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trials_lesson = {
      lines = {
        { id = "tl_default", text = "Perhaps, though I've heard them argue about it afterwards over My'lanna's bread. Some say the spirit taught them to hold back, and some say it taught them never to hesitate, and they're all very certain." },
      },
      choices = {
        { text = "Strength held back is the greater strength.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Hesitation gets people killed. Strike when it's needed.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "cenarion_circle" } } },
      },
    },
    tears = {
      lines = {
        { id = "te_default", text = "Of course I do. A tear tells me where to stitch thicker next time, and it tells me what's out on the roads, which is more than the wardens bother to." },
      },
      choices = {
        { text = "What have the tears told you lately?", next = "tears_lately" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tears_lately = {
      lines = {
        { id = "tla_default", text = "Long claw marks from Felwood, more than last year, and burns that smell wrong, like a fire that's been somewhere it shouldn't. Whatever is loose down there is getting bolder, and my thread isn't the answer to it." },
      },
      choices = { { text = "I'll be careful in Felwood. Something else.", next = "BACK" } },
    },
    leather = {
      lines = {
        { id = "le_default", text = "Hunters bring me hides from Winterspring and the high passes, and I pay fairly for clean ones. Nothing is skinned in Moonglade itself; the Keeper wouldn't allow it, and I'd not ask." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    high = {
      lines = {
        { id = "hi_default", text = "Not a stitch, I'm afraid; you've outgrown me the way the young druids outgrow their first robes. But bring me what you're wearing and I'll mend it as carefully as anything I've made myself." },
      },
      choices = { { text = "I'll hold you to that. Something else.", next = "BACK" } },
    },
    tauren = {
      lines = {
        { id = "ta_default", text = "More every season, up the long road from Thunder Bluff, and they're the most patient students the Circle has. They also need the widest cloaks I stock, so I've learned to keep a few in the back." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_cc", text = "They're very wise and very hard on their clothes." } },
    advice = { { id = "tp_ad", text = "Get your gear mended before the road, not after. A torn seam in Felwood is a worse thing than it sounds." } },
    _none = { { id = "tp_none", text = "I know cloth and leather. For anything else, try the druids." } },
  },
}

---------------------------------------------------------------------------
-- Meliri, Weaponsmith
---------------------------------------------------------------------------
P:NPC {
  key = "meliri", id = TODO_NPC("Meliri"), name = "Meliri", title = "Weaponsmith",
  bible = "bibles/nighthaven_shops.md", role = "blacksmith", tier = "service",
  communities = { "nighthaven" }, temper = { "brisk", "wry" }, values = { "craft", "practical" },
  notices = { "class" },

  impression = {
    first = "She sells swords where nobody may use them, and finds it funny.",
    third = "{name} met Meliri, the weaponsmith of Nighthaven in Moonglade.",
  },

  greetings = {
    { id = "g_default", text = "Weapons, repairs, sharpening. Just don't draw anything in the village, or the wardens will have words with both of us." },
    { id = "g_worn", when = { durability = { max = 0.3 } }, text = "That edge has seen better years. Put it on the anvil and let me look at it." },
    { id = "g_away", when = { away = 14 }, text = "Back after {away}. Still carrying my steel, I hope?" },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "ROGUE", "HUNTER" } },
      text = "You're the first customer this week who looks as if you'd use a blade for something other than cutting bread. Welcome." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "I'm Meliri, and I keep the weapons for Nighthaven: swords, axes, maces, a dagger or two and a good staff for the druids. I'll repair anything you bring me, though I'd rather you didn't tell me what you used it on." },
        { id = "h_druid", when = { class = "DRUID" },
          text = "A druid? Most of you buy a staff, lean on it for a century, and never once hit anything with it. I'll sell you one anyway; it's good wood." },
      },
      again = {
        { id = "h_again", text = "Anything else? The forge doesn't watch itself." },
        { id = "h_again2", text = "Ask, then, while the iron heats." },
        { id = "h_again3", text = "More questions? Pass me that file while you ask them." },
      },
      choices = {
        { text = "Who buys weapons in a peaceful village?", next = "peaceful" },
        { text = "Do the wardens trouble you?", next = "wardens" },
        { text = "Where does your steel come from?", next = "steel" },
        { text = "That's a very small forge.", next = "forge" },
        { text = "What's a druid meant to do with a staff?", next = "staff", when = { class = "DRUID" } },
        { text = "You'd sell steel to the Horde?", next = "horde", when = { faction = "Horde" } },
        { text = "Show me your weapons.", next = "BUSINESS" },
        { text = "Farewell, Meliri.", next = "END" },
      },
    },
    peaceful = {
      lines = {
        { id = "p_default", text = "Travellers on the road to Felwood and Winterspring, mostly, who'd rather not meet a corrupted bear with an empty hand. Moonglade is peaceful; the roads out of it are another matter entirely." },
      },
      choices = {
        { text = "Does it bother you, selling weapons here?", next = "bother" },
        { text = "What's out on those roads?", next = "roads" },
        { text = "Something else.", next = "BACK" },
      },
    },
    roads = {
      lines = {
        { id = "ro_default", text = "Felwood to the south, where the Legion's filth soaked into the soil and everything that drinks from it goes wrong. The Timbermaw hold the tunnels in between, and they'll let you pass if they like you and won't if they don't." },
      },
      choices = {
        { text = "How do I get the Timbermaw to like me?", next = "roads_timbermaw" },
        { text = "Something else.", next = "BACK" },
      },
    },
    roads_timbermaw = {
      lines = {
        { id = "rt_default", text = "Kill the furbolgs who've gone corrupt, and bring proof of it, because the Timbermaw grieve for those tribes and can't bear to do it themselves. It's grim work, and I've sharpened a lot of blades for people doing it." },
      },
      choices = {
        { text = "It's a mercy to put the corrupted down.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Killing their kin for their favour? That's cold.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "timbermaw" } } },
      },
    },
    bother = {
      big = true,
      lines = {
        { id = "b_default", text = "Sometimes, when I see a blade I made leave with someone I wouldn't trust with a kitchen knife. But a sword at someone's side keeps a good many fights from starting, and I've decided I'm in the business of keeping the peace, from a distance." },
      },
      choices = {
        { text = "A good blade in good hands keeps the peace.", next = "BACK", reply = "That's what I tell myself, and on most days I believe it. The rest of the time I hope the Keeper is watching.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Blades make fights. Don't fool yourself.", next = "BACK", reply = "Maybe so, but a fight will start whether I sell the blade or not. At least mine are well made, and they end things quickly.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wardens = {
      lines = {
        { id = "w_default", text = "Only when someone tries a sword out in the square, which happens oftener than the Keeper would like. The wardens are very good at stopping a fight before it starts, and very bad at believing me when I say I didn't sell it to them sharpened." },
      },
      choices = {
        { text = "I'll keep mine sheathed, then.", next = "BACK", fx = { affinity = 1 } },
        { text = "How do they stop a fight?", next = "wardens_stop" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wardens_stop = {
      lines = {
        { id = "ws_default", text = "Quickly and without asking who started it, which is the only fair way in a place where both sides are always sure it was the other. I watched one put an orc and a dwarf on the ground at once last spring, and neither of them could say how it happened." },
      },
      choices = { { text = "Remind me not to test them. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    steel = {
      lines = {
        { id = "st_default", text = "Bars from Darnassus, and more from the dwarves through Auberdine, carried up the long road through the Timbermaw tunnels. Nothing's mined in Moonglade, of course; the Keeper would sooner see me melt my own anvil." },
      },
      choices = {
        { text = "Do you mind working with dwarven steel?", next = "steel_dwarf" },
        { text = "Something else.", next = "BACK" },
      },
    },
    steel_dwarf = {
      lines = {
        { id = "sd_default", text = "Mind it? It's the best steel I can get, and I'll say so in front of any kaldorei who grumbles. Dwarves dig too much and talk too loudly, but they know metal the way druids know trees." },
        { id = "sd_dwarf", when = { race = "Dwarf" }, text = "Mind it? It's the best I can get, and you can tell them back home that an elf said so. Your people dig too much and talk too loudly, but you know metal the way druids know trees." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forge = {
      lines = {
        { id = "fo_default", text = "It's as large as the Circle allows, and they argued about that for a month. Big forges mean big fires, and big fires in Moonglade mean druids standing around my door looking disappointed." },
      },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    staff = {
      lines = {
        { id = "sf_default", text = "Lean on it, mostly, and look wise, which the elders have made an art of. But a young druid in caster's shape needs something to keep a furbolg off them while the moonfire gathers, and a good staff will do it twice before it breaks." },
      },
      choices = { { text = "I'll take a sturdy one. Something else.", next = "BACK" } },
    },
    horde = {
      lines = {
        { id = "ho_default", text = "Here, under the Keeper's peace, I sell to anyone who keeps it. Whether my blade ends up in Ashenvale afterwards is a question I try very hard not to ask, and I'd thank you not to answer it." },
      },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
  },

  topics = {
    timbermaw = { { id = "tp_timbermaw", text = "Furbolgs who still have their wits, holding the tunnels to Felwood and Winterspring. Earn their trust before you need their road." } },
    advice = { { id = "tp_ad", text = "Have your blade seen to before you leave Moonglade. The roads beyond aren't kind to a dull edge." } },
    _none = { { id = "tp_none", text = "Ask me about steel, and I'll know. Anything else, and I'll guess, badly." } },
  },
}

---------------------------------------------------------------------------
-- My'lanna, Food and Drink
---------------------------------------------------------------------------
P:NPC {
  key = "mylanna", id = TODO_NPC("My'lanna"), name = "My'lanna", title = "Food & Drink",
  bible = "bibles/nighthaven_shops.md", role = "vendor", tier = "service",
  communities = { "nighthaven" }, temper = { "warm", "chatty" }, values = { "generous", "kind" },
  notices = { "race", "weary" },

  impression = {
    first = "She takes it personally if anyone leaves hungry.",
    third = "{name} met My'lanna, who sells food and drink to the visitors of Nighthaven.",
  },

  greetings = {
    { id = "g_default", text = "Hungry? You look hungry. Everybody who comes up the path looks hungry." },
    { id = "g_away", when = { away = 14 }, text = "You've been gone {away}, and you're thinner, I'm sure of it. Sit, sit." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = { "Dwarf", "Human" } },
      text = "You'll find our food lighter than you're used to, I expect. Eat two, then; nobody's counting." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "The tauren druids tell me my bread's too sweet. They still eat three loaves each, so I've stopped listening." },
    { id = "n_weary", cat = "weary", when = { durability = { max = 0.3 } },
      text = "You've been in a fight, and a bad one. Eat first, and then go and see Kharedon or Meliri about the rest." },
  },

  start = "hello",
  nodes = {
    dd_timbermaw = {
      lines = {
        { id = "ddt_default", text = "Then you've done more than most. The Timbermaw bring honey and herbs down to Nighthaven and take bread and cloth home again, and they are the gentlest traders I know, so long as nobody forgets the tunnel is theirs." },
      },
      choices = {
        { text = "Do you ever go up into the hold yourself?", next = "BACK", reply = "Once, by invitation, and I was made to eat something I still can't name. It was delicious, and I didn't ask." },
        { text = "Something else, My'lanna.", next = "BACK" },
      },
    },
    hello = {
      hub = true,
      lines = {
        { id = "h_dd_timbermaw", when = { reputation = { faction = "Timbermaw Hold", min = "friendly" } }, text = "You came through the Timbermaw tunnel without a scratch, I see. The furbolgs only let their friends walk it unchallenged, so you must have done right by them in Felwood." },
        { id = "h_dd_deadwood", when = { killed = { name = "Deadwood", min = 30 } }, text = "The furbolgs who come to trade say the Deadwood have lost many of their warriors, and that an outsider did much of it. They didn't say your name, but they described your boots." },
        { id = "h_default", key = true, text = "I'm My'lanna, and I keep the food and drink for Nighthaven: kaldorei cooking, fresh bread, moonberry juice and cool water from springs the druids keep clean. Anyone who walks this far deserves a proper meal, Horde or Alliance or something in between." },
      },
      again = {
        { id = "h_again", text = "Something else? There's more bread if you're still hungry." },
        { id = "h_again2", text = "Ask away, dear, and take a roll while you do." },
        { id = "h_again3", text = "More? Good; talking makes people hungry, and I like a hungry customer." },
      },
      choices = {
        { text = "The Timbermaw let me through their tunnel now.", next = "dd_timbermaw", when = { reputation = { faction = "Timbermaw Hold", min = "friendly" } } },
        { text = "What's kaldorei cooking like?", next = "cooking" },
        { text = "Who eats here besides travellers?", next = "who" },
        { text = "Do Horde and Alliance really eat side by side?", next = "together" },
        { text = "You seem to know everyone's favourite dish.", next = "favourites" },
        { text = "Your bread really is too sweet, you know.", next = "sweet", when = { race = "Tauren" } },
        { text = "Do druids ever come in still in bear shape?", next = "bear", when = { class = "DRUID" } },
        { text = "Let me buy something.", next = "BUSINESS" },
        { text = "Thank you, My'lanna.", next = "END" },
      },
    },
    cooking = {
      lines = {
        { id = "c_default", text = "Light and green, mostly: nuts, fruit, roots baked in leaves, and fish when the druids allow it. We don't cook much over open flame here; it upsets the wardens, and it upsets me more, because it's how you burn good bread." },
      },
      choices = {
        { text = "Do the druids eat meat?", next = "meat" },
        { text = "What's the best thing you make?", next = "cooking_best" },
        { text = "Something else.", next = "BACK" },
      },
    },
    meat = {
      big = true,
      lines = {
        { id = "m_default", text = "Some do and some don't, and you'd be surprised how heated a dinner gets over it. A druid who spends half his life as a bear finds it hard to say no to fish, and a druid who spends it as a stag finds that hard to watch." },
      },
      choices = {
        { text = "Take only what you need from the wild.", next = "BACK", reply = "That's the druid way, or so they keep telling me over supper. I just make sure there's enough of both on the table.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A meal is a meal. Nature eats nature.", next = "BACK", reply = "You'd fit right in at my table, then, though I'd sit you between the bears and the vegetarians. That always livens things up.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cooking_best = {
      lines = {
        { id = "cb_default", text = "Moonberry bread, still warm, with a little honey from the vale's own hives. I won't tell you what else goes into it, because then you'd make it yourself and I'd never see you again." },
      },
      choices = {
        { text = "Not even a hint?", next = "cooking_hint" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cooking_hint = {
      lines = {
        { id = "ch_default", text = "Something that grows only by the lake, picked by moonlight, and that's all you'll get from me. Rabine's apprentices have been trying to guess it for two years, and they're nowhere close." },
      },
      choices = { { text = "I'll keep guessing. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    who = {
      lines = {
        { id = "w_default", text = "The wardens, between watches, and the druids who'll admit they're hungry, which isn't all of them. Rabine sends his apprentices for bread every morning and swears it's for them, and they swear it's for him." },
      },
      choices = {
        { text = "And the Keeper?", next = "keeper" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keeper = {
      lines = {
        { id = "k_default", text = "I've never once seen Keeper Remulos eat, and I've watched closely. But a basket of moonberries left by the path is always empty in the morning, and I've decided to believe that means he likes them." },
      },
      choices = {
        { text = "That's a charming thought.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    together = {
      lines = {
        { id = "to_default", text = "At the same benches, if not always at the same table. Under the Keeper's peace an orc and a night elf can both want seconds, and I've found that nobody stays angry with their mouth full." },
      },
      choices = {
        { text = "Has there ever been trouble at your benches?", next = "together_trouble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    together_trouble = {
      lines = {
        { id = "tt_default", text = "Once, over the last loaf, a Sentinel and a tauren both reaching for it. I cut it in half and gave them each a piece, and they sat and ate it together without a word, which I think is the closest Ashenvale has come to peace in years." },
      },
      choices = {
        { text = "That's how it should be everywhere.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "A loaf won't mend a war. Moonglade's different.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "ashenvale" } } },
      },
    },
    favourites = {
      lines = {
        { id = "fa_default", text = "Of course I do; it's the first thing I learn about anyone. Loganaar likes his fish plain, Dendrite pretends not to take a second roll, and Bunthen the windrider master eats anything at all and says thank you every time." },
      },
      choices = {
        { text = "And what would you guess is mine?", next = "favourites_mine" },
        { text = "Something else.", next = "BACK" },
      },
    },
    favourites_mine = {
      lines = {
        { id = "fm_default", text = "Something warm and filling, eaten too quickly, because you've a long way to go and you think you haven't time to sit. Sit anyway, dear; the road will still be there after the bread is gone." },
        { id = "fm_dwarf", when = { race = "Dwarf" }, text = "Something with a great deal more meat than I'm allowed to cook here, and an ale I don't stock. I'll do you a fish pie instead, and you'll grumble, and you'll eat it all." },
      },
      choices = { { text = "You're not wrong. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    sweet = {
      lines = {
        { id = "sw_default", text = "So your people keep telling me, between their second and third loaves. I've tried making it plainer, and the tauren druids looked so disappointed that I put the honey straight back in." },
      },
      choices = { { text = "Leave the honey in. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    bear = {
      lines = {
        { id = "be_default", text = "Once, a young one who'd forgotten to change back, and he ate a whole tray of honey cakes before anyone noticed. I made him wash the tray afterwards, in his own shape, and he's never forgotten again." },
      },
      choices = { { text = "I'll come in on two legs. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
  },

  topics = {
    cenarion_circle = { { id = "tp_cc", text = "They feed the land, and I feed them. It seems a fair trade." } },
    advice = { { id = "tp_ad", text = "Eat before the road, not after. You'll fight better on a full stomach, and you'll complain less." } },
    _none = { { id = "tp_none", text = "I'm only the cook, dear. But eat something while you think of who to ask." } },
  },
}

---------------------------------------------------------------------------
-- Darnall, Tailoring Supplies
---------------------------------------------------------------------------
P:NPC {
  key = "darnall", id = TODO_NPC("Darnall"), name = "Darnall", title = "Tailoring Supplies",
  bible = "bibles/nighthaven_shops.md", role = "vendor", tier = "service",
  communities = { "nighthaven" }, temper = { "fussy", "precise" }, values = { "craft", "careful" },
  notices = { "craft" },

  impression = {
    first = "He will tell you which colours the moon approves of.",
    third = "{name} met Darnall, the particular seller of tailoring supplies in Nighthaven.",
  },

  greetings = {
    { id = "g_default", text = "Thread, dye, bleach, needles. Please don't touch the silks unless you mean to buy them." },
    { id = "g_away", when = { away = 14 }, text = "Gone {away}, and back with that same hem, I see. Never mind; I'll say nothing." },
  },

  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor! At last, someone who'll appreciate the difference between my thread and the rubbish they sell in the cities." },
  },

  start = "hello",
  nodes = {
    hello = {
      hub = true,
      lines = {
        { id = "h_default", key = true, text = "I am Darnall, and I keep tailoring supplies for Nighthaven: threads of every weight, dyes in every colour the druids approve of, bleach for the ones they don't. Visitors forget how many robes a village of druids goes through." },
        { id = "h_tailor", when = { profession = "Tailoring" }, text = "I am Darnall, and you're a tailor, so you'll understand why I'd rather you didn't finger the silks. Ask me anything about thread; I've waited all week for someone who'd follow the answer." },
      },
      again = {
        { id = "h_again", text = "Anything else? Quickly, if you please; the dye's setting." },
        { id = "h_again2", text = "Yes? I'm listening, with half an ear." },
        { id = "h_again3", text = "Still here? Then mind the indigo, it stains." },
      },
      choices = {
        { text = "Which colours do the druids approve of?", next = "colours" },
        { text = "Why do druids need so many robes?", next = "robes" },
        { text = "Where does all this cloth come from?", next = "thread" },
        { text = "You and Geenia must work closely.", next = "geenia" },
        { text = "What thread would you use for fine work?", next = "tailor", when = { profession = "Tailoring" } },
        { text = "My people dye with clay and roots.", next = "tauren", when = { race = "Tauren" } },
        { text = "Let me see your supplies.", next = "BUSINESS" },
        { text = "Good day, Darnall.", next = "END" },
      },
    },
    colours = {
      lines = {
        { id = "c_default", text = "Greens and browns, of course, and a deep blue for the ones who walk at night, which is most of them. I once sold a young druid a bright red dye, and the elders looked at him as though he'd set fire to a tree." },
      },
      choices = {
        { text = "What happened to the young druid?", next = "red" },
        { text = "Something else.", next = "BACK" },
      },
    },
    red = {
      big = true,
      lines = {
        { id = "r_default", text = "He wore it anyway, all through his trials, and passed each one, and now the young druids all want red. I don't know whether I've done the Circle a great service or a great wrong, but I've sold a lot of red dye." },
      },
      choices = {
        { text = "Good for him. The young should find their own colours.", next = "BACK", reply = "That's what I told myself when I sold him the cloth. Still, I'll not be dyeing anything purple, no matter who asks.", fx = { align = { order = -1 } } },
        { text = "Traditions exist for reasons. Green suits a druid.", next = "BACK", reply = "They do, and I've no quarrel with green, it's served the Circle well for ten thousand years. But the young never listen to tradition until they're old themselves.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    robes = {
      lines = {
        { id = "ro_default", text = "Bear claws, swamp water, the lake trial, moonwell stains, and an astonishing amount of honey. A druid's robe lives a hard life, and I'm the one who has to sell them the thread to mend it." },
      },
      choices = {
        { text = "Why honey, of all things?", next = "honey" },
        { text = "Something else.", next = "BACK" },
      },
    },
    honey = {
      lines = {
        { id = "h2_default", text = "Rabine rewards the young druids in bear shape with honey, and his apprentices always stand too close while he does it. I've stopped selling white thread to anyone who works for him." },
      },
      choices = {
        { text = "A sensible policy.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    thread = {
      lines = {
        { id = "th_default", text = "Linen and wool from Darnassus, silk from the spiders of the deeper forests, and the finer cloths from adventurers who've pulled them off things they'd rather not describe. I buy almost anything, so long as it's clean." },
      },
      choices = {
        { text = "Almost anything?", next = "thread_fel" },
        { text = "Something else.", next = "BACK" },
      },
    },
    thread_fel = {
      lines = {
        { id = "tf_default", text = "I won't stock felcloth, whatever the warlocks pay. It comes off the satyrs in Felwood, and it carries the Legion's stink in every thread, and I'll not have it in the same room as a druid's robe." },
        { id = "tf_lock", when = { class = "WARLOCK" }, text = "I won't stock felcloth, and you'll forgive me for saying so to a warlock. It comes off the satyrs in Felwood, and the Legion's stink is in every thread; take your business to someone with fewer druids for customers." },
      },
      choices = {
        { text = "Good. Nothing of the Legion belongs here.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Cloth is cloth. Power is power.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "satyrs" } } },
      },
    },
    geenia = {
      lines = {
        { id = "ge_default", text = "She buys my thread and complains about my prices, and I sell it to her and complain about her hems. It's the most reliable friendship in Nighthaven, and neither of us would admit it's a friendship at all." },
      },
      choices = {
        { text = "What's wrong with her hems?", next = "geenia_hems" },
        { text = "Something else.", next = "BACK" },
      },
    },
    geenia_hems = {
      lines = {
        { id = "gh_default", text = "Nothing, if I'm honest, which I try not to be in front of her. She sews a straighter hem than I ever could, and I've told her so exactly once, when she was ill, and she's never let me forget it." },
      },
      choices = { { text = "Your secret's safe. Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    tailor = {
      lines = {
        { id = "ta_default", text = "Silken thread for anything that moves, and heavy for anything that takes a blow, and never mix the two in one seam. Most tailors' failures are a cheap thread somewhere it shouldn't be, and they blame the cloth." },
      },
      choices = { { text = "I'll remember. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    tauren = {
      lines = {
        { id = "tau_default", text = "So I've learned from your druids, who bring me red earth from Mulgore and ask whether I can match it. I can't, quite, and it vexes me more than I'd like to say." },
      },
      choices = { { text = "Some colours can't be bought. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },

  topics = {
    satyrs = { { id = "tp_satyrs", text = "They wear felcloth and smell of it. I won't have either in my shop." } },
    advice = { { id = "tp_ad", text = "Buy good thread. A fine robe sewn with cheap thread is only a cheap robe that hasn't failed yet." } },
    _none = { { id = "tp_none", text = "That's not thread, dye or bleach, so it's not my business." } },
  },
}
