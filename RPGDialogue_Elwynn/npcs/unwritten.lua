-- Elwynn folk with no conversation yet: the Bridenbecker household west of Goldshire (Rob, Kim
-- and their daughter Ashley), Homer Stonefield who sells fruit at the Stonefield farm, and two
-- Darkmoon Faire hands for the weeks the Faire camps near Goldshire (Rinling and Stamp Thunderhorn).
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Rob Bridenbecker: the man of the house at the Bridenbecker homestead west of Goldshire.
P:NPC {
  key = "elw_rob_bridenbecker", id = TODO_NPC("Rob Bridenbecker"), name = "Rob Bridenbecker", gender = "male",
  role = "citizen", tier = "service",
  communities = { "goldshire" }, temper = { "warm", "patient" }, values = { "family", "practical" },
  notices = { "travel", "kit" },
  impression = {
    first = "He keeps one eye on his children and one on the woods.",
    third = "{name} met Rob Bridenbecker, who keeps a homestead west of Goldshire with his family.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There you are. I was hoping you'd come by again." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. Say what you need, and then go." },
    { id = "g_default", text = "Afternoon, {class}. If you're lost, Goldshire's just east of here, and if you're thirsty, the well's sweet." },
    { id = "g_back", when = { metBefore = true }, text = "You again, and welcome. The children still talk about you, so mind what you say in front of them." },
    { id = "g_night", when = { timeOfDay = "night" }, text = "Late to be walking the lanes, friend. The wolves come close to the fences after dark these days." },
  },
  notice = {
    { id = "n_low", cat = "travel", when = { maxLevel = 8 },
      text = "You look new to the road. Stay on it as far as Goldshire, and leave the kobold mines well alone." },
    { id = "n_hunter", cat = "kit", when = { class = "HUNTER" },
      text = "Is that beast of yours good with children? Ashley will want to pet it, and I'd rather know before she tries." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Rob Bridenbecker, and this is our place, such as it is. My wife Kim keeps it running, and the children keep it loud." } },
      again = {
        { id = "h_again", text = "Anything else? I've a fence post waiting, but it won't run off." },
        { id = "h_again2", text = "Go on, I'm listening. The post can wait a bit longer." },
      },
      choices = {
        { text = "How do you make a living out here?", next = "living" },
        { text = "It's quiet country. I'd not mind living here.", next = "quiet" },
        { text = "Is it safe, with children so near the woods?", next = "safe" },
        { text = "What did you do before you married?", next = "yyoung" },
        { text = "What keeps you up at night?", next = "ynight" },
        { text = "I fought in Westfall against the Defias.", next = "ywestfall", when = { minLevel = 15 } },
        { text = "Good day to you, Rob.", next = "END" },
      },
    },
    living = {
      lines = { { id = "l_default", text = "A little of everything, the way most of Elwynn does it. We keep a garden and a few hens, I take odd work in Goldshire when there's any going, and Kim sells what we can spare at the market." } },
      choices = {
        { text = "And the taxes from Stormwind?", next = "taxes" },
        { text = "Something else.", next = "BACK" },
      },
    },
    taxes = {
      lines = { { id = "t_default", text = "They come round like the seasons, and they've gone up every year since the city wall started going back up. I don't grudge the king his walls, but I've a roof here that leaks just the same." } },
      choices = {
        { text = "The crown keeps the roads safe. It's fair enough.", next = "BACK", reply = "Maybe so, when the guards are on them. I'll pay, and I'll say my piece about it at the inn like everyone else.", fx = { align = { order = 1 } } },
        { text = "A man should keep what he grows.", next = "BACK", reply = "Say that a bit quieter near Goldshire, friend. There's men gone to Westfall for saying it louder.", fx = { align = { order = -1 } } },
      },
    },
    quiet = {
      lines = { { id = "q_default", text = "It is, most days, and that's why we stayed when half our neighbours went to the city. You can hear the stream from the doorstep at night, and nobody's quarrelling under your window." } },
      choices = { { text = "That's worth a leaky roof. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    safe = {
      lines = { { id = "s_default", text = "Safer than it was during the war, when the orcs burned half this forest, and I tell myself that every evening. The children don't go past the fence alone, and Bradford knows to shout if he sees a wolf.", fx = { learn = { "second_war" } } } },
      choices = {
        { text = "You were here when the orcs came?", next = "war" },
        { text = "Something else.", next = "BACK" },
      },
    },
    war = {
      lines = { { id = "w_default", text = "I was a boy, and we ran for the city with what we could carry on our backs. When we came back there was only the chimney standing, so my father built the rest around it, and it's still the warmest part of the house." } },
      choices = { { text = "Then this place was hard won. Something else.", next = "BACK" } },
    },
    yyoung = {
      lines = {
        { id = "yy_default", text = "I hauled stone for the masons rebuilding Stormwind, same as half the lads in Elwynn after the war. Good work, honest sweat, and then the money stopped coming and the masons went off angry. I came home to Kim and the garden, and I've not been sorry." },
        { id = "yy_dwarf", when = { race = "Dwarf" }, text = "I hauled stone for the masons rebuilding Stormwind, and there were dwarves on that crew who could carry twice what I could. Then the money stopped and the masons went off angry, and I came home to Kim and the garden." },
      },
      choices = {
        { text = "You knew the men who became the Defias?", next = "yknew" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yknew = {
      narr = "He sets the fence post down and leans on it with both hands.",
      lines = { { id = "yk_default", text = "I worked beside some of them. Decent men, most of them, cheated by the House of Nobles and too proud to beg. I don't hold with what they do now, the burning and the thieving, but I'll not pretend they had no cause at all." } },
      choices = { { text = "That's an honest way to see it. Something else.", next = "BACK" } },
    },
    ynight = {
      lines = { { id = "yn_default", text = "Bradford. He's only small, but he's already asking why the soldiers never come this far west, and why we pay for walls we can't sleep behind. I don't know what to tell him, so I tell him to eat his supper." } },
      choices = {
        { text = "What would you like to tell him?", next = "ytell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ytell = {
      lines = { { id = "yte_default", text = "That the world's fair, and it isn't, so I can't. Kim says teach him to work hard and keep his head down. I say teach him to stand up when he's wronged. Which would you teach a boy?" } },
      choices = {
        { text = "To stand up when he's wronged.", next = "BACK", reply = "Aye. I'll teach him that, then, and pray he's careful with it.", fx = { align = { honor = 1 } } },
        { text = "To keep his head down and survive.", next = "BACK", reply = "Kim will be glad to hear a stranger agrees with her.", fx = { align = { honor = -1 } } },
      },
    },
    ywestfall = {
      lines = { { id = "yw_default", text = "Did you, now? Then you've seen what's become of the farms there, and the men in red masks. If you meet a big fellow called Harlan with a scar through his eyebrow, he was my mate on the stone crew. Tell him Rob says come home." } },
      choices = { { text = "If I see him, I'll tell him. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    defias = { { id = "yt_defias", text = "Some of the Defias were good men once. I hauled stone beside them, and I'll not hear them all called vermin." } },
    goldshire = { { id = "yt_gold", text = "Goldshire's where I find odd work and Kim sells her eggs. It's a fair town, if you stay out of the inn's back rooms." } },
    background = { { id = "tp_bg", text = "Born in Elwynn and never left it but for the war. I've a wife, two children and a fence that needs mending." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. Ask at the Lion's Pride; somebody there always claims to know." } },
  },
}

-- Kim Bridenbecker: Rob's wife, who keeps the house and sells the family's spare at market.
P:NPC {
  key = "elw_kim_bridenbecker", id = TODO_NPC("Kim Bridenbecker"), name = "Kim Bridenbecker", gender = "female",
  role = "citizen", tier = "service",
  communities = { "goldshire" }, temper = { "brisk", "warm" }, values = { "family", "practical" },
  notices = { "kit", "travel" },
  impression = {
    first = "She runs the household and does the sums in her head.",
    third = "{name} met Kim Bridenbecker, who keeps the Bridenbecker household west of Goldshire.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There you are. I was hoping you'd come by again." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. Say what you need, and then go." },
    { id = "g_default", text = "Hello there. Mind the hens, they've no sense, and the children have less, so watch your feet." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Sit a moment if you like, though I can't stop working while you do." },
  },
  notice = {
    { id = "n_hurt", cat = "kit", when = { health = { max = 0.5 } },
      text = "Light's sake, you're bleeding on my step. Sit down and I'll fetch some clean linen, and don't argue with me." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Kim, Rob's wife, and the one who actually knows where everything is kept. If you've come about eggs, I've a dozen spare this week." } },
      again = {
        { id = "h_again", text = "What else, then? Talk while I hang this washing." },
        { id = "h_again2", text = "Go on, I've two hands free and one ear." },
      },
      choices = {
        { text = "What's a day like for you?", next = "day" },
        { text = "Your children seem happy.", next = "children" },
        { text = "You sell at the Goldshire market?", next = "market" },
        { text = "How did you meet Rob?", next = "ymet" },
        { text = "What troubles you most these days?", next = "ytrouble" },
        { text = "I'm a healer, if you ever need one.", next = "yhealer", when = { class = { "PRIEST", "PALADIN", "DRUID", "SHAMAN" } } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    day = {
      lines = { { id = "d_default", text = "Up before the hens, bread in the oven, the children fed and washed, and then whatever's broken that morning. By supper I've done a full day's work and Rob asks what I've been doing with myself." } },
      choices = {
        { text = "He doesn't know how lucky he is.", next = "BACK", reply = "He knows, he only forgets now and then. I remind him, gently, with the washing.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    children = {
      lines = { { id = "c_default", text = "Ashley and Bradford, and they're happy as long as there's mud and a stick to poke it with. Ashley wants to be a knight this week, though last week it was a baker, so I'm not sewing a tabard just yet." } },
      choices = {
        { text = "A knight? She could do worse.", next = "knight" },
        { text = "Something else.", next = "BACK" },
      },
    },
    knight = {
      lines = { { id = "k_default", text = "She could, and I'd be proud, but I've seen the boys come home from the wars. I'd rather she baked bread for the knights than rode out beside them, though I'll never tell her so." } },
      choices = {
        { text = "Let her choose her own path, when it's time.", next = "BACK", reply = "I will, when it's time, and I'll cry about it in the kitchen where she can't see.", fx = { align = { order = -1 } } },
        { text = "A good mother steers her daughter right.", next = "BACK", reply = "That's what my mother said, and look where it got me, wed to a man who can't mend a fence. Still, I'm happy.", fx = { align = { order = 1 } } },
      },
    },
    market = {
      lines = { { id = "m_default", text = "When there's anything over, which isn't often. Eggs and a few jars of preserves, mostly, and the Stonefields always outsell me on fruit, but Ma Stonefield's been at it longer than I've been alive." } },
      choices = { { text = "Then I'll buy your preserves first. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    ymet = {
      lines = { { id = "ym_default", text = "At the harvest dance in Goldshire, the year after the war. He'd come back from hauling stone with shoulders like an ox and two left feet, and he trod on mine four times before I agreed to marry him just to make him stop." } },
      choices = {
        { text = "Has he improved since?", next = "yimprove" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yimprove = {
      lines = { { id = "yi_default", text = "At dancing? Not a step. At everything else that matters, yes, though I'll not tell him, because a man who's told he's doing well stops trying. You may tell him I said he's adequate." } },
      choices = { { text = "I'll pass it on. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    ytrouble = {
      narr = "She pins a sheet to the line with more force than it needs.",
      lines = { { id = "ytr_default", text = "My sister in Goldshire keeps writing that we should move into the city, for the children. She says the Defias burned a farm two lanes over last spring. She isn't wrong, but this is our home, and I'll not be frightened off it." } },
      choices = {
        { text = "Your children's safety comes first.", next = "ytrouble2", reply = "I know, I know. Don't think I don't lie awake on it.", fx = { align = { order = 1 } } },
        { text = "Stand your ground. It's your home.", next = "ytrouble2", reply = "That's what I tell her, and she calls me a mule.", fx = { align = { order = -1 } } },
      },
    },
    ytrouble2 = {
      lines = { { id = "ytr2_default", text = "We keep a bag packed by the door, in case, with bread and a blanket and the deed to the house. Rob doesn't know I check it every night, and I'll thank you not to tell him." } },
      choices = { { text = "Your secret's safe. Something else.", next = "BACK" } },
    },
    yhealer = {
      lines = {
        { id = "yh_default", text = "That's kind, and I may take you up on it, for Bradford comes home with a new scrape every evening. The nearest real healer is up at Northshire, and the brothers are good, but it's a long walk with a crying child." },
        { id = "yh_night", when = { timeOfDay = "night" }, text = "That's kind, and you'd be welcome at this hour more than most, for it's always after dark that Bradford finds something sharp. The brothers at Northshire are a long walk with a crying child." },
      },
      choices = { { text = "I'll stop by when I pass. Something else.", next = "BACK" } },
    },
  },
  topics = {
    stonefield = { { id = "yt_stone", text = "Ma Stonefield outsells me every market day, but she gave me my first jar of preserves, so I can't hold it against her." } },
    ashley = { { id = "yt_ashley", text = "Ashley wants to be a knight this week. I'm letting her guard the hens, which is near enough." } },
    background = { { id = "tp_bg", text = "I grew up in Goldshire and married out to the west lane. It's not far, but you'd think it was Westfall, the way my sister carries on." } },
    _none = { { id = "tp_none", text = "I've no idea, and no time to wonder about it. Ask someone who isn't hanging washing." } },
  },
}

-- Ashley Bridenbecker: the Bridenbecker daughter, found playing outside with her brother.
P:NPC {
  key = "elw_ashley_bridenbecker", id = TODO_NPC("Ashley Bridenbecker"), name = "Ashley Bridenbecker", gender = "female",
  role = "child", tier = "service",
  communities = { "goldshire" }, temper = { "earnest", "bright" }, values = { "brave", "family" },
  notices = { "kit", "wonder" },
  impression = {
    first = "She wants to be a knight, this week at least.",
    third = "{name} met Ashley Bridenbecker, a girl playing outside her family's house near Goldshire.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You came back! Do you want to see the thing I found? It's a secret." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I'm not playing with you today." },
    { id = "g_default", text = "Halt! Who goes there? Oh, you're a real adventurer, aren't you, and not Bradford in a bucket." },
    { id = "g_back", when = { metBefore = true }, text = "You came back! Did you fight anything? You have to tell me exactly how big it was." },
  },
  notice = {
    { id = "n_paladin", cat = "wonder", when = { class = "PALADIN" },
      text = "Are you a paladin? A real one, with the Light and everything? Can you make your hands glow, just a little bit?" },
    { id = "n_gnome", cat = "wonder", when = { race = "Gnome" },
      text = "You're shorter than me! I didn't know grown-ups could be shorter than me, and I think that's wonderful." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm Ashley, and I'm guarding the house from kobolds. Bradford is meant to be guarding it too, but he keeps stopping to dig for worms." } },
      again = {
        { id = "h_again", text = "What else? I can talk and guard at the same time." },
        { id = "h_again2", text = "Ask me anything. I know nearly everything about this house." },
      },
      choices = {
        { text = "Have you ever seen a kobold?", next = "kobold" },
        { text = "What do you want to be when you're grown?", next = "grown" },
        { text = "Your brother looks busy.", next = "brother" },
        { text = "Who's the bravest person you know?", next = "ybrave" },
        { text = "What scares you, Ashley?", next = "yscare" },
        { text = "Want to see the Light, little knight?", next = "ylight", when = { class = "PALADIN" } },
        { text = "Keep up the guard, Ashley.", next = "END" },
      },
    },
    kobold = {
      lines = { { id = "k_default", text = "Not a real one, but Bradford says they've got candles on their heads and they say you no take candle. I don't know whose candle, but I'm not giving them mine." } },
      choices = {
        { text = "They're real, and they live in the mines.", next = "mines" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mines = {
      lines = { { id = "mi_default", text = "Mother says the Fargodeep mine is full of them and I'm never to go there, not even with a stick. I wasn't going to, but now I really want to see one from very far away." } },
      choices = { { text = "Very far away is best. Something else.", next = "BACK" } },
    },
    grown = {
      lines = { { id = "g2_default", text = "A knight of Stormwind with a big horse and a shiny helmet. Mother says I could be a baker instead, but I think knights can bake on their days off." } },
      choices = {
        { text = "Knights protect people. That's the important part.", next = "BACK", reply = "I know, and I'll protect everyone, even Bradford, though he'll have to say please.", fx = { align = { honor = 1 } } },
        { text = "The best fighters win however they can.", next = "BACK", reply = "Even if it's sneaky? Bradford hides behind the woodpile and jumps out, and I always say that isn't fair.", fx = { align = { honor = -1 } } },
      },
    },
    brother = {
      lines = { { id = "b_default", text = "He's looking for worms to give the hens, because he thinks they'll lay more eggs. Father says that isn't how it works, but Bradford doesn't listen to anybody, not even me." } },
      choices = { { text = "He sounds determined. Something else.", next = "BACK" } },
    },
    ybrave = {
      lines = { { id = "yb_default", text = "Father, because he ran all the way to Stormwind with Grandmother on his back when the orcs came, and he was only a boy. He doesn't like talking about it, but Mother told me, and I'm going to be brave like that." } },
      choices = {
        { text = "That's a fine thing to be proud of.", next = "yproud" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yproud = {
      lines = { { id = "yp_default", text = "I am! I've got his old wooden sword from when he was little, and I practise on the woodpile every morning. The woodpile hasn't won yet, though it's very good at splinters." } },
      choices = { { text = "Keep at it, Sir Ashley. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    yscare = {
      narr = "She lowers her wooden sword a little and glances toward the trees.",
      lines = { { id = "ys_default", text = "The wolves at night, when they howl near the fence. Bradford says if a wolf came I should hit it with my sword, but Mother says I should run inside and bar the door. A knight wouldn't run, would she?" } },
      choices = {
        { text = "A clever knight runs and lives.", next = "BACK", reply = "Oh. Then I'll be a clever knight, and run very fast.", fx = { align = { honor = -1 } } },
        { text = "A knight stands, but only when she's grown.", next = "BACK", reply = "Then I'll stand when I'm grown, and run till then.", fx = { align = { honor = 1 } } },
      },
    },
    ylight = {
      lines = {
        { id = "yl_default", text = "Oh, yes please! Just a little glow, so I can tell Bradford I saw it, and he'll be so cross he wasn't here. Can I touch it, or does it burn?" },
        { id = "yl_dwarf", when = { race = "Dwarf" }, text = "Oh, yes please! I didn't know dwarves could be paladins! Just a little glow, so I can tell Bradford I saw a dwarf one, and he'll be so cross he missed it." },
      },
      choices = {
        { text = "It doesn't burn. It feels warm.", next = "ywarm" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywarm = {
      lines = { { id = "yw_default", text = "Warm like bread out of the oven? That's what I thought it would be. I'm going to be a paladin now, instead of a knight, and Mother will have to sew a whole different tabard." } },
      choices = { { text = "She'll manage. Something else.", next = "BACK" } },
    },
  },
  topics = {
    bradford = { { id = "yt_brad", text = "Bradford is my little brother. He digs for worms, and he says they're his soldiers, which is silly." } },
    stormwind = { { id = "yt_sw", text = "Stormwind has a castle, and knights, and a cathedral with a golden roof. I'm going to live there one day." } },
    background = { { id = "tp_bg", text = "I live here with Mother and Father and Bradford and the hens. One day I'll live in the castle." } },
    _none = { { id = "tp_none", text = "I don't know that one. You should ask Father, but he'll only say ask Mother." } },
  },
}

-- Homer Stonefield: fruit vendor outside the barn on the Stonefield farm.
P:NPC {
  key = "elw_homer_stonefield", id = TODO_NPC("Homer Stonefield"), name = "Homer Stonefield", title = "Fruit Vendor", gender = "male",
  role = "vendor", tier = "service",
  communities = { "goldshire" }, temper = { "jovial", "stubborn" }, values = { "family", "practical" },
  notices = { "craft", "travel" },
  impression = {
    first = "He sells the family's fruit and the family's grudges for free.",
    third = "{name} met Homer Stonefield, who sells fruit outside the barn at the Stonefield farm.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you, friend. I've been keeping an eye out for things you might want." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. The prices are what they are, and I'm not in a haggling mood." },
    { id = "g_default", text = "Fresh fruit, straight off Stonefield trees, and not a worm in it that I know of. Have a look, {class}." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more? Good, because Ma says I'm to sell this lot before it turns, and she means it." },
  },
  notice = {
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You cook, don't you? I can tell by the way you're squeezing my apples. Go easy, they bruise." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Homer Stonefield, of the Stonefields, as you might guess. Ma runs the farm, Gramma runs Ma, and I sell the fruit, which is the only job nobody else wanted." } },
      again = {
        { id = "h_again", text = "What else? Have an apple while you think about it, though I'll want paying for it." },
        { id = "h_again2", text = "Go on, the fruit's not going anywhere, more's the pity." },
      },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Tell me about your family.", next = "family" },
        { text = "What's the trouble with the Maclures?", next = "maclures" },
        { text = "Business looks slow.", next = "slow" },
        { text = "Let's see the fruit.", next = "BUSINESS" },
        { text = "What's the best fruit you grow?", next = "ybest" },
        { text = "Does the farm have trouble with gnolls?", next = "ygnolls" },
        { text = "I know a thing or two about cooking.", next = "ycook", when = { profession = "Cooking" } },
        { text = "Good day, Homer.", next = "END" },
      },
    },
    family = {
      lines = { { id = "f_default", text = "There's a lot of us, and we're all loud. Tommy Joe's off chasing after that Maclure girl, Gramma's in the house knitting and complaining, and Ma does the work of three men without breaking a sweat." } },
      choices = {
        { text = "Tommy Joe and a Maclure? That can't be popular.", next = "tommy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    tommy = {
      lines = { { id = "t_default", text = "Popular as a kobold at a harvest feast, and you didn't hear it from me. If Ma catches him she'll have his hide, and if Pa Maclure catches him there won't be a hide left to have." } },
      choices = {
        { text = "Love doesn't care about old feuds.", next = "BACK", reply = "That's what Tommy Joe says, and I'll tell you what Ma says when you've a free afternoon.", fx = { align = { order = -1 } } },
        { text = "Some feuds are there for good reason.", next = "BACK", reply = "Aye, and most of ours are about a fence nobody remembers building. Still, family's family.", fx = { align = { order = 1 } } },
      },
    },
    maclures = {
      lines = { { id = "m_default", text = "Nobody rightly knows how it started, and that's never stopped anyone. A stray cow, a borrowed plough, a word said at a wedding, and now nobody on either farm will walk the same side of the road as the other." } },
      choices = { { text = "That's a long way to walk around. Something else.", next = "BACK" } },
    },
    slow = {
      lines = { { id = "s_default", text = "It is, with all the young ones gone off to fight in Westfall or join the guard. Folk passing on the road would sooner buy at Goldshire than walk up our lane, but the ones who walk up come back." } },
      choices = { { text = "I'll be one of those. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    ybest = {
      lines = { { id = "yb_default", text = "The late reds from Gramma's old tree, the one behind the barn. It's older than the farm, and Gramma swears her own grandmother planted it the year Stormwind's first walls went up, and you'll not taste sweeter in all Elwynn." } },
      choices = {
        { text = "Do you sell those?", next = "ysell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysell = {
      lines = { { id = "ys_default", text = "Not a one, more's the pity. Gramma counts them every morning and keeps them for the family, and the year I sold a basket to a lord's steward she didn't speak to me till midwinter. I'll not make that mistake twice." } },
      choices = { { text = "A wise salesman knows his limits. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    ygnolls = {
      narr = "His jolly face goes still, and he looks off toward the southwest woods.",
      lines = { { id = "yg_default", text = "That we do. Hogger's lot come up out of the woods and take what they please, and Ma's lost a cow and two pigs this season. She wants to hire swords and go burn them out. Gramma says we'd be fools to start a war we can't finish." } },
      choices = {
        { text = "Hire swords. Strike before they strike again.", next = "ygnolls2", reply = "Ma'll like you. She'll want you to be one of the swords.", fx = { align = { order = -1 } } },
        { text = "Wait for the Marshal. Let the guard handle it.", next = "ygnolls2", reply = "That's Gramma's word, and Marshal Dughan's too.", fx = { align = { order = 1 } } },
      },
    },
    ygnolls2 = {
      lines = { { id = "yg2_default", text = "Either way, I keep a pitchfork by the fruit cart now, which isn't much good against a gnoll but makes me feel better. The Maclures have lost stock too, though they'd never say so to a Stonefield." } },
      choices = { { text = "Maybe that's common ground. Something else.", next = "BACK" } },
    },
    ycook = {
      lines = {
        { id = "yc_default", text = "Then you'll want the bruised ones, cheap, for pies and preserves, since you're cooking them down anyway. Ma says never sell a cook the pretty fruit, because they'll only cut it up and the pretty's wasted." },
        { id = "yc_dwarf", when = { race = "Dwarf" }, text = "A dwarf cook! Then you'll want the bruised ones cheap for pies, and Ma says dwarves make a fine apple ale, so take a sack of the sour ones home to Ironforge for brewing." },
      },
      choices = { { text = "Sound advice. Something else.", next = "BACK" } },
    },
  },
  topics = {
    hogger = { { id = "yt_hogger", text = "Hogger's the big gnoll in the southwest woods. He's taken more from Stonefield than the taxman, and that's saying something." } },
    maclures = { { id = "yt_mac", text = "The Maclures farm just across the road. We don't speak, but we wave, which is a start." } },
    background = { { id = "tp_bg", text = "Born a Stonefield, raised a Stonefield, and I'll be buried in the orchard like the rest of them." } },
    _none = { { id = "tp_none", text = "Can't help you there. I know fruit and I know family, and that's about the size of it." } },
  },
}

-- Rinling: a troll with the Darkmoon Faire who trades for engineering parts while the Faire camps by Goldshire.
P:NPC {
  key = "elw_rinling", id = TODO_NPC("Rinling"), name = "Rinling", gender = "male",
  role = "questgiver", tier = "quest",
  communities = {}, temper = { "sly", "jovial" }, values = { "practical", "clever" },
  notices = { "craft", "kit" },
  impression = {
    first = "He grins through every bargain and never loses one.",
    third = "{name} met Rinling, a troll with the Darkmoon Faire who collects engineering parts.",
  },
  greetings = {
    { id = "g_default", text = "Hey, come in, come in! Rinling be needin' clever hands and shiny parts, and you look like you got one or de other." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, my friend be back! Tell Rinling you brought somethin' dat whirrs, mon." },
  },
  notice = {
    { id = "n_eng", cat = "craft", when = { profession = "Engineering" },
      text = "Oho, you smell like grease and burnt fingers! Dat be an engineer, and Rinling always has work for one of dose." },
    { id = "n_troll", cat = "kit", when = { race = "Troll" },
      text = "A cousin from far away! You be a long way from de islands, but de Faire takes everybody, and so does Rinling." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Rinling, of de Darkmoon Faire, and I be buildin' somethin' grand for de tent. I need modulators, gizmos, widgets and repair kits, and I pay in Faire tickets, which be better than gold here." } },
      again = {
        { id = "h_again", text = "What else you want to know? Rinling got all day, mon." },
        { id = "h_again2", text = "Ask away, but de Faire packs up soon, so don't be slow about it." },
      },
      choices = {
        { text = "What are you building?", next = "building" },
        { text = "What do the tickets buy?", next = "tickets" },
        { text = "A troll at a human fair is an odd sight.", next = "odd" },
        { text = "I've brought you a Copper Modulator.", next = "modulator", when = { questDone = TODO_QUEST("Copper Modulator") } },
        { text = "How did a troll join the Faire?", next = "yjoin" },
        { text = "Has your machine ever hurt anyone?", next = "yhurt" },
        { text = "Are you Darkspear, cousin?", next = "ydark", when = { race = "Troll" } },
        { text = "Farewell, Rinling.", next = "END" },
      },
    },
    building = {
      lines = { { id = "b_default", text = "Dat be Rinling's secret, but I tell you dis much: it spins, it whistles, and so far it only blew up de once. Silas say if it draws a crowd I can keep de tent, so it has to be grand." } },
      choices = {
        { text = "What parts do you still need?", next = "parts" },
        { text = "Something else.", next = "BACK" },
      },
    },
    parts = {
      lines = { { id = "p_default", text = "Copper modulators for de little ones startin' out, bronze gizmos and green fireworks after dat, and thorium widgets for de real engineers. Bring me any, and de tickets be yours.", fx = { learn = { "darkmoon_faire" } } } },
      choices = {
        { text = "Honest work for honest pay. I'll bring them.", next = "BACK", reply = "Dat's de spirit, mon, and Rinling always pays what he says.", fx = { align = { honor = 1 } } },
        { text = "I'll bring them, if the price is right.", next = "BACK", reply = "Ha! You bargain like a goblin, but de price be fixed, so save your breath.", fx = { align = { honor = -1 } } },
      },
    },
    tickets = {
      lines = { { id = "t_default", text = "Everythin' worth havin', my friend, from trinkets to fine things you never see outside de Faire. Talk to de ticket redeemers by de main tent, and dey show you what de pile is worth." } },
      choices = { { text = "Then I'll start collecting. Something else.", next = "BACK" } },
    },
    odd = {
      lines = { { id = "o_default", text = "Odd be good for business, mon! Folk come to de Faire to see what dey never seen, and Rinling be happy to be de thing dey talk about on de way home. Dey stare, dey laugh, and den dey buy." } },
      choices = { { text = "A smart way to see it. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    modulator = {
      lines = { { id = "md_default", text = "Ah, dat little modulator, it hums so nice in de machine. You keep bringin' parts like dat and Rinling might even let you see de thing work, one day." } },
      choices = { { text = "I'll hold you to that. Something else.", next = "BACK" } },
    },
    yjoin = {
      narr = "He spins a little brass widget on one long finger while he thinks.",
      lines = { { id = "yj_default", text = "Rinling be leavin' de islands young, mon, with a head full of gears and no tribe dat wanted dem. De Faire wagons come through Stranglethorn, and Silas Darkmoon look at Rinling's first little whirligig and laugh so hard he hire me on de spot." } },
      choices = {
        { text = "Why didn't your tribe want you?", next = "ytribe" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ytribe = {
      lines = { { id = "ytr_default", text = "De elders say a troll should hunt and pray to de loa, not tinker with goblin toys. Maybe dey be right, maybe not, but de loa never sent Rinling a single gear, and de goblins sell dem cheap." } },
      choices = { { text = "Your own path, then. Something else.", next = "BACK" } },
    },
    yhurt = {
      lines = { { id = "yh_default", text = "Only de once, and only Rinling's eyebrows, and dey grow back. But Silas say if it blow up near de crowd, it be de end of Rinling's tent. So, do I make it safe and dull, or grand and dangerous? What you say, mon?" } },
      choices = {
        { text = "Make it safe. The crowd comes first.", next = "BACK", reply = "Safe. Hmph. Rinling will make it safe and still grand.", fx = { align = { order = 1 } } },
        { text = "Make it grand. Crowds love danger.", next = "BACK", reply = "Ha! Dat's what Rinling wanted to hear, mon!", fx = { align = { order = -1 } } },
      },
    },
    ydark = {
      lines = {
        { id = "yd_default", text = "Not Darkspear, no, but Rinling hear what Vol'jin's people did, comin' to Durotar with de orcs. Here at de Faire it don't matter much, cousin, Horde or Alliance, so long as de tickets be paid." },
        { id = "yd_horde", when = { faction = "Horde" }, text = "Not Darkspear, but Rinling hear how Vol'jin brought de tribe to Durotar with Thrall's orcs. You be far from de Echo Isles, cousin, in de middle of human country. De Faire keep you safe here, mon." },
      },
      choices = {
        { text = "Where are you from, then?", next = "yfrom" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yfrom = {
      lines = { { id = "yf_default", text = "A little village on de Stranglethorn coast dat don't have a name worth sayin', mon. De goblins of Booty Bay be de first to sell me tools, so Rinling always say he was raised by trolls and schooled by goblins." } },
      choices = { { text = "That shows. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    silas = { { id = "yt_silas", text = "Silas Darkmoon be de boss of de Faire, mon. He laugh loud and pay fair, and Rinling like both." } },
    engineering = { { id = "yt_eng", text = "Gears and springs be de same everywhere, mon. Dey don't care who holds de wrench." } },
    background = { { id = "tp_bg", text = "Rinling go where de Faire go, and de Faire go everywhere. Home be a tent, and de tent be wherever it stands." } },
    darkmoon_faire = { { id = "tp_dmf", text = "De best show in de world, mon, and it pays its trolls fair, which is more than I can say for most." } },
    _none = { { id = "tp_none", text = "Rinling don't know dat one, mon. Ask Sayge; he knows everythin', or he says he does." } },
  },
}

-- Stamp Thunderhorn: a tauren food vendor with the Darkmoon Faire.
P:NPC {
  key = "elw_stamp_thunderhorn", id = TODO_NPC("Stamp Thunderhorn"), name = "Stamp Thunderhorn", title = "Food Vendor", gender = "male",
  role = "vendor", tier = "service",
  communities = {}, temper = { "gentle", "patient" }, values = { "practical", "kind" },
  notices = { "kit", "craft" },
  impression = {
    first = "He cooks for crowds and still asks each customer's name.",
    third = "{name} met Stamp Thunderhorn, a tauren who sells food at the Darkmoon Faire.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good to see you, friend. I've been keeping an eye out for things you might want." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Look, don't touch, and pay before you go. I've learned that much about you." },
    { id = "g_default", text = "Welcome, little one. The grill is hot and the food is good, so come and eat before the crowds take it all." },
    { id = "g_back", when = { metBefore = true }, text = "You return, and hungry, I hope. Sit and rest your legs a while." },
  },
  notice = {
    { id = "n_hungry", cat = "kit", when = { health = { max = 0.5 } },
      text = "You look worn thin, friend. A full belly mends more than you would think, so eat first and talk after." },
    { id = "n_cook", cat = "craft", when = { profession = "Cooking" },
      text = "You know the fire too, I can see it in how you watch my grill. Every cook learns something from another." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Stamp, of the Thunderhorn clan, and I feed the Faire and all who visit it. There is no Horde or Alliance at a cook's grill, only the hungry and the fed." } },
      again = {
        { id = "h_again", text = "What else would you know? The meat needs turning, but I can listen." },
        { id = "h_again2", text = "Speak, friend. The fire is patient, and so am I." },
      },
      choices = {
        { text = "An honest price is worth more than a quick profit.", next = "BACK", reply = "Tell that to my competitors, friend, but I'm glad to hear you say it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "A good bargain means someone else paid too much.", next = "BACK", reply = "Ha! You'd do well in trade, though I'll count my coins twice.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "A tauren this far into human lands?", next = "far" },
        { text = "What's on the grill today?", next = "grill" },
        { text = "Let me see what you're selling.", next = "BUSINESS" },
        { text = "Why did you leave Mulgore?", next = "yleave" },
        { text = "Who taught you to cook?", next = "ytaught" },
        { text = "Earth Mother's blessing, brother.", next = "ycousin", when = { race = "Tauren" } },
        { text = "May your fire burn steady.", next = "END" },
      },
    },
    far = {
      lines = { { id = "f_default", text = "The Faire walks where it pleases, and I walk with it. Mulgore is far, but the Earth Mother is under these trees as she is under the plains, so I am never truly away from home." } },
      choices = {
        { text = "Do the humans treat you well?", next = "humans" },
        { text = "Something else.", next = "BACK" },
      },
    },
    humans = {
      lines = { { id = "hu_default", text = "Some stare, and some children hide behind their mothers, but they all come back once they smell the grill. Hunger makes friends of strangers faster than any treaty." } },
      choices = {
        { text = "The war will end when enough people share a meal.", next = "BACK", reply = "Perhaps it will, friend, and I will keep the grill hot until it does.", fx = { align = { light = 1 } } },
        { text = "They'll still fight once their bellies are full.", next = "BACK", reply = "Perhaps so. But they will fight a little slower, and that is something.", fx = { align = { light = -1 } } },
      },
    },
    grill = {
      lines = { { id = "grill_default", text = "Whatever the Faire's hunters bring, and the frogs, when there are frogs. The little ones like them crisp, and so do I, though my clan back home would laugh to see it." } },
      choices = { { text = "I'll take your word for it. Something else.", next = "BACK" } },
    },
    yleave = {
      narr = "He turns a skewer slowly over the coals and watches the fat drip.",
      lines = { { id = "yl_default", text = "My father was a hunter, and his father, and I was meant to be one too. But I could never bring myself to love the kill, only the meal after it, and the elders said a tauren must follow his own wind. Mine blew east, with the Faire's wagons." } },
      choices = {
        { text = "Does your family miss you?", next = "ymiss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ymiss = {
      lines = { { id = "ym_default", text = "My mother sends word with every caravan that passes Thunder Bluff, and asks if I am fat yet. I am, a little. When the Faire turns toward Mulgore, I will cook for her, and she will tell me it is too salty." } },
      choices = { { text = "Mothers are the same everywhere. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    ytaught = {
      lines = {
        { id = "yt_default", text = "An old Bloodhoof grandmother in Mulgore, who said that meat cooked in anger tastes of anger. I have tried to cook only in calm since, which is not easy at a Faire where a gnome sets something on fire every hour." },
        { id = "yt_cook", when = { profession = "Cooking" }, text = "An old Bloodhoof grandmother, who said meat cooked in anger tastes of anger. You know this already, I think, for a cook learns it with burned fingers. Cook in calm, friend, and the fire will listen to you." },
      },
      choices = {
        { text = "Is that true, about anger?", next = "yanger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yanger = {
      lines = { { id = "ya_default", text = "I believe it. Some here say a cook should sell to anyone who pays, even the ones who come only to sneer. Others say I should turn away those who mock my horns. What would you do, friend?" } },
      choices = {
        { text = "Feed them all. Hunger has no enemies.", next = "BACK", reply = "Yes. That is the way of my grill, and of the Earth Mother.", fx = { align = { light = 1 } } },
        { text = "Turn away the mockers. Respect is earned.", next = "BACK", reply = "A hard answer. But I understand the heart behind it.", fx = { align = { light = -1 } } },
      },
    },
    ycousin = {
      lines = {
        { id = "yc_default", text = "And to you, cousin, far from the grass of home. It warms me to see horns among all these round little heads. Sit, eat, and tell me how the herds fare on the plains." },
        { id = "yc_druid", when = { class = "DRUID" }, text = "And to you, cousin, and a druid besides. Does Hamuul Runetotem still keep the Elder Rise? Sit, eat, and tell me how the herds fare on the plains." },
      },
      choices = { { text = "The herds are well. Something else.", next = "BACK", reply = "Good. Then the Earth Mother smiles, and so do I." } },
    },
  },
  topics = {
    mulgore = { { id = "yt_mulgore", text = "The grass of Mulgore is gold at sunset, and the kodo graze to the horizon. I see it when I close my eyes." } },
    cooking = { { id = "yt_cooking", text = "Good food needs a slow fire, a patient hand and someone hungry to eat it. The last is easiest to find." } },
    background = { { id = "tp_bg", text = "I am of the Thunderhorn clan, from the plains of Mulgore. I left to see the world, and the world is mostly hungry." } },
    darkmoon_faire = { { id = "tp_dmf", text = "It is a strange herd, but a kind one, and it has room for a tauren with a grill." } },
    _none = { { id = "tp_none", text = "That I do not know, friend. The winds have not carried it to my grill." } },
  },
}

-- Chronos: a Forsaken with the Darkmoon Faire who takes leather goods and armour kits while the Faire camps by Goldshire.
P:NPC {
  key = "elw_chronos", id = 14833, name = "Chronos", title = "He Who Never Forgets!", gender = "male",
  role = "questgiver", tier = "quest",
  communities = {}, temper = { "dry", "showman" }, values = { "practical", "memory" },
  notices = { "craft", "race" },
  impression = {
    first = "A Forsaken in a carnival coat, ledger open, who seems to recall every face that passes.",
    third = "{name} met Chronos, the Forsaken of the Darkmoon Faire who never forgets.",
  },
  greetings = {
    { id = "g_default", text = "Step closer, friend, and don't flinch, because the Faire makes room for every sort of face, even one like mine." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I told you I never forget, and I meant it, though I'll admit it's less a gift than a habit of the grave." },
  },
  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "Leather on your fingers and a knife at your belt, so you're exactly the sort of guest I hoped the Faire would bring me." },
    { id = "n_undead", cat = "race", when = { race = "Scourge" },
      text = "One of the Dark Lady's, this far into human country? We are a pair of curiosities, you and I, and the crowd will stare twice." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Chronos, He Who Never Forgets, at your service. I keep the Faire's accounts of leather and hide, which means I remember every boot and jerkin owed to Silas Darkmoon, and every worker who sold his own in a game of chance." } },
      narr = "He taps a long grey finger on a ledger crowded with tiny, careful script.",
      again = {
        { id = "h_again", text = "Something more? I have all the time in the world, which is rather the point of being dead." },
        { id = "h_again2", text = "Go on, ask, and I'll remember the question long after you've forgotten it." },
      },
      choices = {
        { text = "What work do you have for me?", next = "work" },
        { text = "A Forsaken with a travelling carnival?", next = "dead" },
        { text = "Do you truly never forget?", next = "forget" },
        { text = "I work leather myself. Can I help?", next = "lw", when = { profession = "Leatherworking" } },
        { text = "What do you remember of Lordaeron's fall?", next = "yfall" },
        { text = "Do you ever wish you could forget?", next = "ywish" },
        { text = "Enjoy the Faire, Chronos.", next = "END" },
      },
    },
    work = {
      lines = { { id = "w_default", text = "The carnies wear through their boots and jerkins faster than you'd credit, and the Faire's tents need patching besides. Bring me leather goods and armour kits, and I'll mark you down for Darkmoon prize tickets in a hand that never fades.", fx = { learn = { "darkmoon_faire" } } } },
      choices = {
        { text = "Why do the carnies go through so much?", next = "carnies" },
        { text = "I'll bring what I can.", next = "BACK" },
      },
    },
    carnies = {
      lines = { { id = "c_default", text = "Because they dance on stilts, wrestle crocolisks and run from angry customers, and leather is the first thing to give. Last season the Crocolisk Boy wore out four jerkins in a week, and the Bearded Murloc chewed a fifth." } },
      choices = {
        { text = "Hard work deserves good gear, paid fairly.", next = "BACK", reply = "Spoken like an honest tradesman. Silas would like you; he pays fairly too, after his fashion.", fx = { align = { honor = 1 } } },
        { text = "Fools who wrestle crocolisks deserve what they get.", next = "BACK", reply = "Perhaps, but fools fill the tents, and full tents keep me in ledgers.", fx = { align = { honor = -1 } } },
      },
    },
    dead = {
      lines = { { id = "d_default", text = "The Faire asks no questions about where you came from, only whether you can work, and I could. Stormwind's guards don't love me, but they don't trouble anyone under Silas Darkmoon's flag, and so I travel safer here than I ever could alone." } },
      choices = {
        { text = "Do you remember your life before?", next = "before" },
        { text = "Something else.", next = "BACK" },
      },
    },
    before = {
      lines = { { id = "b_default", text = "Every hour of it, which is the trouble with my particular gift. I was a clerk in Lordaeron, counting grain for men who are all dead now, and I remember their names even though none of them would remember mine." } },
      narr = "He closes the ledger gently, as though it might wake something.",
      choices = {
        { text = "Some things are worth carrying forward.", next = "BACK", reply = "Kindly said, and I'll remember that you said it.", fx = { align = { order = 1 } } },
        { text = "Better to let the dead past go.", next = "BACK", reply = "Easy advice from someone with a heartbeat, but I'll consider it.", fx = { align = { order = -1 } } },
      },
    },
    forget = {
      lines = { { id = "f_default", text = "Never, not a face, not a debt, not a promise. Ask me the colour of the shirt the third customer wore on the Faire's first night in Goldshire, and I'll tell you it was mustard, and badly darned at the elbow." } },
      choices = { { text = "Remarkable. Something else.", next = "BACK" } },
    },
    lw = {
      lines = { { id = "lw_default", text = "You can, and gladly. Carnival boots and jerkins are plain enough work, and armour kits plainer still, but the Faire is always short of hands who can make them." } },
      choices = { { text = "Then I'll get stitching.", next = "BACK", fx = { affinity = 1 } } },
    },
    yfall = {
      narr = "His jaw, more wire than bone, works silently for a moment.",
      lines = {
        { id = "yf_default", text = "Everything, which is precisely the trouble. The grain carts stopped coming, then the grain came tainted, then the people who ate it stopped being people. I counted the dead in my ledger until I was one of them, and then I simply kept counting." },
        { id = "yf_human", when = { race = "Human" }, text = "Everything. The tainted grain, the neighbours who ate it, the ledger I kept until I joined the column of the dead. Your kind ask me that more than anyone, as if I might tell them it wasn't so bad. It was worse." },
      },
      choices = { { text = "I'm sorry. Something else.", next = "BACK" } },
    },
    ywish = {
      lines = { { id = "yw_default", text = "Every night, if the dead may be said to have nights. Some of my kind drink the Apothecaries' draughts to dull it. I could, and the ledgers would suffer for it. Should I keep the memories, or be free of them?" } },
      choices = {
        { text = "Keep them. Someone must remember.", next = "BACK", reply = "Then I shall, and I'll curse you a little for it.", fx = { align = { light = 1 } } },
        { text = "Be free. You owe the dead nothing.", next = "BACK", reply = "A cold comfort, but comfort nonetheless. I'll think on it.", fx = { align = { light = -1 } } },
      },
    },
  },
  topics = {
    lordaeron = { { id = "yt_lord", text = "I counted grain in Lordaeron's granaries for twelve years. I remember every sack, and which ones killed us." } },
    silas = { { id = "yt_silas", text = "Silas Darkmoon hired a dead clerk without blinking. I've never quite worked out whether that was kindness or salesmanship." } },
    darkmoon_faire = { { id = "tp_dmf", text = "A travelling city of tents and tricks, and the only place in the world I've been welcomed since my death." } },
    _none = { { id = "tp_none", text = "Not a thing I've ever heard, and I'd know, believe me." } },
  },
}

-- Servant of Azora: gnome apprentices who keep the Tower of Azora for Archmage Theocritus.
P:NPC {
  key = "elw_servant_of_azora", id = 1949, name = "Servant of Azora", gender = "male",
  role = "citizen", tier = "service",
  communities = { "tower_of_azora" }, temper = { "nervous", "eager" }, values = { "learning", "duty" },
  notices = { "class", "race" },
  impression = {
    first = "A small gnome in robes hurries about the tower with an armful of scrolls.",
    third = "{name} met one of the gnomish servants who keep the Tower of Azora.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There you are. I was hoping you'd come by again." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. Say what you need, and then go." },
    { id = "g_default", text = "Oh! A visitor, how unexpected, and please don't touch anything that hums, because most of it is the master's and some of it bites." },
  },
  notice = {
    { id = "n_mage", cat = "class", when = { class = "MAGE" }, text = "A fellow student of the arcane! You'll understand, then, why the third-floor wards are glowing such an alarming shade of violet." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" }, text = "Another gnome, and a long way from Tinker Town! Did you come out to study, too, or are you lost like the rest of us were?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I serve Archmage Theocritus here in the Tower of Azora, dusting tomes, sorting reagents and keeping the wards fed, which is roughly eighty percent of the job. The other twenty percent is apologising to visitors." } },
      again = { { id = "h_again", text = "Anything else? I have a cauldron I really ought to be watching." } },
      choices = {
        { text = "Who is Theocritus?", next = "master" },
        { text = "Why are gnomes serving out here?", next = "gnomes" },
        { text = "What's the hardest part of your work?", next = "xhard" },
        { text = "Do you study magic yourself?", next = "xstudy" },
        { text = "What exactly hums in here?", next = "xhum" },
        { text = "I'm a mage too. May I see the library?", next = "BACK", when = { class = "MAGE" }, reply = "Oh, I'd love to say yes! But the archmage keeps the good books upstairs, and the stairs are warded. Perhaps if you ask him nicely?" },
        { text = "Did you come here straight from Gnomeregan?", next = "yflight" },
        { text = "I'll let you work.", next = "END" },
      },
    },
    master = {
      lines = { { id = "m_default", text = "A great archmage of the Kirin Tor's tradition, who studies far too much and sleeps far too little. He keeps an eye on the Defias and their doings in Elwynn too, though he'd prefer I didn't mention that to strangers." } },
      choices = {
        { text = "Then I'll keep it quiet.", next = "BACK", reply = "Thank you! I'm terrible at secrets, it's one of my documented flaws.", fx = { align = { order = 1 } } },
        { text = "Secrets kept from strangers rarely stay kept.", next = "BACK", reply = "Oh dear, you're probably right, and now I'm worried.", fx = { align = { order = -1 } } },
      },
    },
    gnomes = {
      lines = { { id = "g2_default", text = "After Gnomeregan fell, a good many of us needed work and a roof, and the archmage needed hands steady enough for delicate reagents. It's a fair trade, though I do miss proper machinery terribly." } },
      choices = {
        { text = "Do you think Gnomeregan will be retaken?", next = "gnomeregan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnomeregan = {
      lines = { { id = "gn_default", text = "High Tinker Mekkatorque says so, and I believe him, mostly, though the radiation figures I've read are not encouraging. Until then I'll sort spell components and dream of gears." } },
      choices = { { text = "I hope you see it again. Something else.", next = "BACK" } },
    },
    xhard = {
      lines = {
        { id = "xxhard_0", text = "Feeding the wards, without question. They want a dash of arcane dust every hour, and if I'm late they sulk and turn the doors blue. The archmage says that's a feature." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xstudy = {
      lines = {
        { id = "xxstudy_0", text = "In the evenings, when the reagents are sorted. I've managed a frost bolt the size of a pea and one very small fire. The fire was not intentional." },
      },
      choices = {
        { text = "Will you be a proper mage someday?", next = "xmage" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xxmage_0", text = "The archmage says I'm better suited to engineering, which is what every gnome is told eventually. Should I keep studying magic, or go back to what my people know?" },
      },
      choices = {
        { text = "Keep studying. Your path is your own.", next = "BACK", reply = "Thank you! I'll practise my frost bolt tonight, very carefully.", fx = { align = { order = -1 } } },
        { text = "Engineering suits gnomes. Take the archmage's advice.", next = "BACK", reply = "Hm. You may be right, though it seems a bit unfair.", fx = { align = { order = 1 } } },
      },
    },
    xhum = {
      lines = {
        { id = "xxhum_0", text = "The scrying orb, mostly, the one that watches the Defias in the Brackwell pumpkin patch. And something in the third drawer, which I am not allowed to open." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yflight = {
      narr = "He polishes his spectacles on his sleeve for rather longer than they need.",
      lines = {
        { id = "yfl_default", text = "By way of Ironforge, and then a cart, and then a very long walk. I left my sister in Tinker Town, because she wouldn't leave the others, and she writes that they're still counting who came out and who didn't." },
        { id = "yfl_gnome", when = { race = "Gnome" }, text = "By way of Ironforge, like you, I expect, and then a very long walk. My sister stayed in Tinker Town to help count who came out. Did you lose anyone? You needn't say, I only wondered." },
      },
      choices = { { text = "I hope she's well. Something else.", next = "BACK" } },
    },
  },
  topics = {
    tower = { { id = "yt_tower", text = "The Tower of Azora has a hundred and nine steps, and I've dropped something on every one of them." } },
    defias = { { id = "yt_def", text = "The scrying orb watches them in the pumpkin patch. They're very rude to the pumpkins." } },
    ironforge = { { id = "yt_if", text = "Ironforge took us in when Gnomeregan fell, and the dwarves were kind, though everything there is far too tall." } },
    theocritus = { { id = "tp_xtheocritus", text = "The archmage. Clever, kind, and never, ever asleep." } },
    gnomeregan = { { id = "tp_xgnomeregan", text = "My home, once. I try not to think about it too often." } },
    _none = { { id = "tp_none", text = "I'm afraid that's not in any of the master's books, or at least not one I'm allowed to open." } },
  },
}

-- Stormwind Guard: the soldiers who watch Goldshire and the roads of Elwynn.
P:NPC {
  key = "elw_stormwind_guard", id = 1423, name = "Stormwind Guard", gender = "male",
  role = "guard", tier = "service",
  communities = { "goldshire" }, temper = { "steady", "gruff" }, values = { "duty", "order" },
  notices = { "level", "class" },
  impression = {
    first = "A soldier in Stormwind blue keeps watch over the road, spear in hand.",
    third = "{name} spoke with a Stormwind Guard on the roads of Elwynn.",
  },
  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You're welcome here, and I'll tell the others so if they ask." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I've heard enough about you to keep an eye open. Mind yourself." },
    { id = "g_default", text = "Stay on the road, citizen, and keep your blade where I can see it. Elwynn's quieter than most places, but it isn't as quiet as it looks." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I'm posted here by order of the Stormwind Army, to keep the roads safe between the city, Goldshire and the Eastvale. Need directions, or have you trouble to report?" } },
      again = { { id = "h_again", text = "Anything else, citizen? I've a road to watch." } },
      choices = {
        { text = "The law keeps us safe, and it should be obeyed.", next = "BACK", reply = "Well said. You'd be surprised how few people say it to a guard's face.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Some laws are worth breaking, if the cause is good.", next = "BACK", reply = "Then I hope you never break one on my watch, friend.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "What trouble is there in Elwynn?", next = "trouble" },
        { text = "Can you give me directions?", next = "BUSINESS" },
        { text = "Quiet posting, this road.", next = "posting" },
        { text = "How long have you served?", next = "xlong" },
        { text = "What's the worst you've seen on this road?", next = "xworst" },
        { text = "Do you know Marshal Dughan?", next = "xdughan" },
        { text = "I'm a paladin. Need help keeping the peace?", next = "BACK", when = { class = "PALADIN" }, reply = "Always glad of a paladin on the road. The Light makes the wolves think twice, and the Defias three times." },
        { text = "Do you have family in Elwynn?", next = "yfamily" },
        { text = "Carry on, soldier.", next = "END" },
      },
    },
    trouble = {
      lines = { { id = "t_default", text = "Defias cutthroats in the Fargodeep Mine and around the Jasperlode, kobolds in the tunnels, and murlocs up along the lakeshore. Most of our men are off on the front lines, so the rest of us stretch thin, and adventurers like you pick up the slack.", fx = { learn = { "defias" } } } },
      choices = {
        { text = "Stormwind should send more soldiers.", next = "thin" },
        { text = "Something else.", next = "BACK" },
      },
    },
    posting = {
      lines = { { id = "po_default", text = "Quiet by day, maybe. At night the wolves come down from the hills and the Defias move their stolen goods past Goldshire, so I'll take a dull afternoon and be grateful for it." } },
      choices = { { text = "Fair enough. Something else.", next = "BACK" } },
    },
    thin = {
      lines = { { id = "th_default", text = "Maybe, but the nobles in the city have their own ideas about where the crown's gold goes, and it isn't into my boots. I do my duty, and I don't ask the House of Nobles for anything." } },
      choices = {
        { text = "Duty is enough. The crown knows best.", next = "BACK", reply = "Good to hear someone say it, even if I'm not sure I believe it.", fx = { align = { order = 1 } } },
        { text = "The nobles have failed the common folk.", next = "BACK", reply = "Keep that sort of talk down, friend, though I won't say you're wrong.", fx = { align = { order = -1 } } },
      },
    },
    xlong = {
      lines = {
        { id = "xxlong_0", text = "Six years. I joined after the Second War, when the city was being rebuilt and the army needed every spear. My father was a mason on the new walls, and I watched over him." },
      },
      choices = {
        { text = "Was your father paid for that?", next = "xpaid" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xpaid = {
      lines = {
        { id = "xxpaid_0", text = "Some of the masons were, some weren't. There's ill feeling about it still, and some of those men are in the Defias now. Should the crown pay what it owes, or hang the bandits?" },
      },
      choices = {
        { text = "Pay the masons. Justice first, then order.", next = "BACK", reply = "Quiet talk, friend. But I've thought the same myself.", fx = { align = { order = -1 } } },
        { text = "Hang the bandits. Crimes are crimes.", next = "BACK", reply = "That's the army's view, and mine on duty.", fx = { align = { order = 1 } } },
      },
    },
    xworst = {
      lines = {
        { id = "xxworst_0", text = "A farmhouse burned in the night, near the Eastvale. Defias took the harvest and left the family with nothing but the clothes they wore. I'll not forget their faces." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xdughan = {
      lines = {
        { id = "xxdughan_0", text = "The marshal in Goldshire, aye. Gruff, honest and always short of men. He'd make a good general, if the city lords listened to him." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    yfamily = {
      lines = {
        { id = "yfa_default", text = "A wife in the Trade District and a boy who wants to be a guard like his father, Light help him. I see them once a fortnight, when the sergeant remembers to rotate us, and he usually doesn't." },
        { id = "yfa_dwarf", when = { race = "Dwarf" }, text = "A wife in the Trade District and a boy who wants to be a guard. He's mad for dwarves, mind, ever since he saw the Ironforge envoys come through the gate, so if you're passing the city, say hello to him." },
        { id = "yfa_night", when = { timeOfDay = "night" }, text = "A wife and boy in the city. On nights like this, when the wolves are loud, I'm glad they're behind the walls and not out here with me." },
      },
      choices = { { text = "May you see them soon. Something else.", next = "BACK" } },
    },
  },
  topics = {
    westfall = { { id = "yt_west", text = "Westfall's gone to the dogs and the Defias both. The People's Militia holds Sentinel Hill, and that's about all anyone holds." } },
    hogger = { { id = "yt_hogger", text = "Hogger leads the Riverpaw gnolls southwest of Goldshire. There's a bounty on him, and a good few graves from them that tried." } },
    murlocs = { { id = "yt_murloc", text = "Murlocs up along Crystal Lake and the shore by the Eastvale. Don't let the gurgling fool you; they bite." } },
    fargodeep = { { id = "yt_fargo", text = "Fargodeep Mine's crawling with kobolds and worse. Don't go in alone, and don't take their candles." } },
    defias = { { id = "tp_xdefias", text = "Bandits in Elwynn and worse in Westfall. Mind your purse." } },
    goldshire = { { id = "tp_xgoldshire", text = "A fine town. Stop at the Lion's Pride for a rest." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, citizen. Ask at the Lion's Pride in Goldshire, someone there will know." } },
  },
}
