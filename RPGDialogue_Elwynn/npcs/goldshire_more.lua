-- More of Goldshire: Tomas in the Lion's Pride kitchen, Kira Songshine on the roads,
-- and two of the town's children, Bo and Matt. Voice: bibles/goldshire_more.md
local P = RPGDialogueAPI:Pack("rpgd.elwynn")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Tomas: the inn's cook and cooking trainer, in the back room near Toddrick.
-- (Forever: ends Camping 101: Cooking.)
P:NPC {
  key = "tomas", id = TODO_NPC("Tomas"), name = "Tomas", title = "Cook",
  bible = "bibles/goldshire_more.md", role = "trainer", tier = "service", communities = { "goldshire" },
  temper = { "warm" }, values = { "craft", "kind" }, notices = { "hunger", "craft" },
  impression = {
    first = "Tomas cooks for the whole of the Lion's Pride from a back room that smells of onions and woodsmoke. He asked whether I'd eaten before he asked my name, and he seemed to think that was the right order.",
    third = "{name} met Tomas, the cook in the back of the Lion's Pride Inn, who teaches cooking to anyone who'll stand still long enough.",
  },
  greetings = {
    { id = "g_pot", text = "Mind the pot, it spits. Come in, if you can stand the heat." },
    { id = "g_cook", when = { profession = "Cooking" }, text = "A fellow cook! I can tell by the burns on your fingers; they never quite go away." },
  },
  notice = {
    { id = "n_hunger", cat = "hunger", when = { durability = { max = 0.3 } },
      text = "You look like a long day and no supper. There's bread on the board; nobody here counts the crusts." },
    { id = "n_craft", cat = "craft", when = { profession = "Cooking" },
      text = "Cooking's a lifelong pursuit, and I can see you've started on it. Show me your knife hand sometime and I'll tell you how far along you are." },
  },
  start = "hello",
  nodes = {
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It keeps you alive, I'll grant that, but it tastes of nothing at all, like eating a cloud with a crust. Real food takes time and fire and a cook who cares, and that's why the Lion's Pride is full every night and your conjured loaves aren't." } },
      choices = {
        { text = "You're right. Nothing beats a proper meal.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Conjured food fills me just the same, Tomas.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Tomas.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Barley soup, mushroom pie and a pumpkin mash from the Brackwells' field that the regulars pretend not to like. Toddrick calls it rabbit food, but the bowls come back empty, so I don't listen to Toddrick." } },
      choices = {
        { text = "The land gives plenty without killing. Your mash proves it.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Hunting is part of the wild too. I'll take the stew.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Something warm and heavy that stays put, like boar stew with a heel of Kira's bread. Don't eat the spiced chili before you fight, mind, or you'll regret it at the worst moment." } },
      choices = {
        { text = "A warm stew, then, and I'll mind the chili.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll eat whatever's quick and get moving.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, Tomas.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Boar ribs, roasted slow, or a bear steak if you can get one fat enough. The Stonetusks near the Stonefield farm are the best for it, and Ma Stonefield will thank you for taking them too." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Your {pet} will want the scraps, I suppose. Bring it by the kitchen door, not through the common room." },
      },
      choices = {
        { text = "I'll bring you what I hunt and waste none.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll keep the best for myself and sell you the rest.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I said a quiet one, because the loud ones knock over pots and the quiet ones at least taste the stew before they steal it. Truth be told, I'd rather feed you than lose a ladle, so sit and I'll fill a bowl." } },
      choices = {
        { text = "I'll pay for the stew, Tomas, and leave your ladles be.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Free stew's the best kind. I'll take the bowl and go.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Chanting, mostly, and once a laugh that wasn't anybody's, which put me off my bread for a week. I don't blame you for your trade, but I'd thank you to keep it on your side of the wall." } },
      choices = {
        { text = "Whatever laughed, I'll see it never troubles your kitchen.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "A cook should learn not to listen through walls.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Sundays, when the inn's quiet, I make a pot of barley for the Westfall families camped behind the stable. Farley pretends not to notice, they pretend they were only passing, and nobody's pride gets hurt." } },
      choices = {
        { text = "That's holy work, Tomas, whatever you call it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Feed them once and they'll never leave the stable.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Tomas.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Plain bread and whatever's in the pot, and he says grace so long the steam's gone off it. I made him a proper roast once, with gravy, and he gave it to a farmer's boy at the next table and ate the bread himself." } },
      choices = {
        { text = "Wilhelm's right. A paladin should take the least.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "He should eat the roast. A paladin needs his strength.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest in my kitchen. If you're here to bless the stew, go ahead, because it could use all the help it can get." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! You'll eat like three men after a day of Wilhelm's drills, I know, because he sends his students down to me hungry." },
        { id = "h_default", text = "I'm Tomas, and I cook for the Lion's Pride. Toddrick cuts the meat, Dobbins pours, and I'm the one who makes it all worth eating." },
        { id = "h_camp", tags = { "news" }, when = { questActive = TODO_QUEST("Camping 101: Cooking") },
          text = "Sam Sarsaparilla sent you from the road, didn't he? Good, because a camp starts with a fire, and a fire's no use to anyone who can't cook over it." },
        { id = "h_camp_done", when = { questDone = TODO_QUEST("Camping 101: Cooking") },
          text = "How's that campfire of yours? Cook more and you'll learn to build bigger ones, and then you'll have friends wherever you sit down." },
        { id = "h_toddrick", when = { heardLine = "toddrick.h_default" },
          text = "Toddrick told you Farley does the cooking? Farley stirs a pot once a year and talks about it all winter. I let him have it." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "A dwarf in my kitchen, and you'll be judging the ale before the food, I expect. Dobbins handles the ale; I'll stand by the stew." },
        { id = "h_back", when = { metBefore = true }, text = "Back again? Taste this and tell me it wants more salt. Everyone says that, and they're always right." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You came into my kitchen without a sound, and that's the only way I'd ever let a rogue in here, so mind the knives on the board, because they're counted." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "You've come up from below, haven't you? The cellar stairs are right beside my larder, and I hear things on that side of the wall I'd rather not." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! You'll eat like three men, I expect, and I'll cook for three, and we'll both be happy." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Bring me boar and bear, and I'll make you something that'll keep you out in the cold for days." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf in my kitchen! Have you eaten? You look like someone who's been living on nuts and dew, and I've a stew on." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Don't you dare conjure bread in my kitchen, because nothing you make will ever taste like mine." },
      },
      again = {
        { id = "h_again", text = "What else? Talk while I chop; the onions won't wait." },
        { id = "h_again2", text = "Go on. Hand me that spoon while you think." },
      },
      choices = {
        { text = "Teach me to cook.", next = "BUSINESS" },
        { text = "What's the first thing a new cook should learn?", next = "first" },
        { text = "Where does the meat come from?", next = "meat" },
        { text = "Sam on the road sent me about a campfire.", next = "camp", when = { questActive = TODO_QUEST("Camping 101: Cooking") } },
        { text = "I've cooked for an abbey full of novices.", next = "abbey", when = { origin = "human_abbey_novice" } },
        { text = "Why would a rogue be welcome in your kitchen?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "What do you hear through your larder wall?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What should a warrior eat before a long fight?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "What would you cook from what I hunt?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Do you ever cook for those who can't pay, Tomas?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What does Brother Wilhelm eat, Tomas?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you cook anything without meat, Tomas?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Is conjured food really that bad, Tomas?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Just smelling the stew.", next = "END" },
      },
    },
    first = {
      lines = { { id = "f_default", text = "Wolf meat. It's tough and it's everywhere, and if you can make a wolf taste like supper, you can cook anything in Elwynn." } },
      choices = {
        { text = "And after wolf?", next = "first_boar" },
        { text = "Something else.", next = "BACK" },
      },
    },
    first_boar = {
      lines = { { id = "fb_default", text = "Boar, roasted slow, then eggs once you can find them without a hen chasing you off. After that it's practice, and practice, and a few burnt suppers." } },
      choices = {
        { text = "Burnt suppers are still suppers.", next = "BACK", fx = { trait = { witty = 1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    meat = {
      lines = { { id = "m_default", text = "From Toddrick, and Toddrick gets it from the farms and from adventurers who bring in more boar than they know what to do with. I've never turned away a fresh haunch." } },
      choices = {
        { text = "And the farms that sell to you?", next = "meat_farms" },
        { text = "Something else.", next = "BACK" },
      },
    },
    meat_farms = {
      big = true,
      lines = { { id = "mf_default", text = "Fewer every year. There were Westfall folk who sold me their pigs, and now some of them come through the back door asking for scraps. I give them what I can, and Farley pretends not to see." } },
      choices = {
        { text = "Then you're doing right by them.", next = "BACK", fx = { affinity = 1, align = { light = 1 }, learn = { "westfall" } } },
        { text = "Scraps at the back door only keep them coming.", next = "BACK", fx = { align = { light = -1 }, learn = { "westfall" } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    camp = {
      lines = { { id = "c_default", text = "Then learn your first recipes from me and you'll be able to lay a fire anywhere in the wild. It's only the basics, mind; a small fire and not much around it." } },
      choices = {
        { text = "Teach me, then.", next = "BUSINESS", fx = { learn = { "camping" } } },
        { text = "Something else first.", next = "BACK", fx = { learn = { "camping" } } },
      },
    },
    abbey = {
      lines = { { id = "a_default", text = "Then you've stirred porridge for forty and been thanked by none of them. Welcome to the trade, friend; it doesn't get more grateful, but it gets tastier." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 2 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I'm the cook at the Lion's Pride. I've been in this back room so long the smoke's in my hair for good." } },
    advice = { { id = "tp_ad", text = "Eat before you fight, not after. Hungry folk make bad choices, and dead folk make none." } },
    camping = { { id = "tp_camping", text = "A fire's the heart of any camp, and any cook can build one. Everything else just sits around it.", next = "camp" } },
    lions_pride = { { id = "tp_lions", text = "Farley owns it, Melika runs it, and I feed it. Ask anyone which of us they'd miss first." } },
    _none = { { id = "tp_none", text = "I couldn't tell you. Ask me about stew and I'll talk till the pot boils dry." } },
  },
}

-- Kira Songshine: the traveling baker on Elwynn's roads.
P:NPC {
  key = "kira", id = TODO_NPC("Kira Songshine"), name = "Kira Songshine", title = "Traveling Baker",
  bible = "bibles/goldshire_more.md", role = "vendor", tier = "service", communities = { "goldshire" },
  temper = { "cheerful" }, values = { "practical" }, notices = { "hunger", "weary" },
  impression = {
    first = "Kira Songshine walks Elwynn's roads with a basket of bread and a voice that carries to the next farm. She sold me a loaf before I'd quite decided to buy one.",
    third = "{name} met Kira Songshine, the baker who walks the roads around Goldshire selling bread and drink.",
  },
  greetings = {
    { id = "g_bread", text = "Fresh bread, sweet water, and a smile thrown in! You won't find better between here and the city." },
    { id = "g_road", when = { metBefore = true }, text = "Twice in one week! Either you like my bread or you keep walking the same road I do." },
  },
  notice = {
    { id = "n_hunger", cat = "hunger", when = { durability = { max = 0.3 } },
      text = "Oh, you've been in the wars. Eat something before you go any further; a loaf weighs nothing and it'll carry you to Goldshire." },
    { id = "n_weary", cat = "weary", when = { resSick = true },
      text = "You look like you've been somewhere very cold and come back. Sit on the verge a moment, and have some water first." },
  },
  start = "hello",
  nodes = {
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Once, a boy near the Stonefields grabbed a roll and ran, and I shouted so loud the whole farm came out to see. I didn't chase him, because he looked hungry, and I left a loaf on the fence post the next week as well." } },
      choices = {
        { text = "That was kind, Kira. He'll remember it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "You'll have every boy in Elwynn robbing you now.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Kira.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "From the farms along the Goldshire road, and I buy it off the farmers' carts myself whenever I can. It costs a copper more that way, but it's my neighbours I'm paying, and they remember it." } },
      choices = {
        { text = "Paying your neighbours fairly is worth the extra copper.", next = "BACK", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "A copper saved is a copper. Buy wherever it's cheapest.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Oh, more than anyone, and they never think to bring any with them. I've passed warriors in the Fargodeep fields sitting on a dead kobold with nothing to eat, so I sell them two loaves and walk on." } },
      choices = {
        { text = "I'll carry bread with me from now on.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I'll find something on the road.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Two days fresh and five days for chewing, and after that it's for the ducks. Hunters out in the hills toward Westfall always want something that keeps, so I bake them a hard roll that won't crumble in a pack." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Ooh, does your {pet} eat bread? Mine would, if I had one, and then I'd never sell another loaf." },
      },
      choices = {
        { text = "I'll pack your bread and share it on the trail.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "I'll live off the land. Bread's dead weight.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Much better, because cold bread on the road to Eastvale is just bread, but warm bread is a reason to stop walking. I'd never ask for a spell outright, mind, since my mother taught me to bake by the hearth and nothing else." } },
      choices = {
        { text = "Your mother's way is the right way. Keep to the hearth.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Times change, Kira. Hire a mage and sell twice as much.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "More than I let on, because there are Defias in the hills and wolves by the river, and now there's whatever lives under the Lion's Pride. I keep walking because the bread won't sell itself, but I walk faster near Goldshire after dark." } },
      choices = {
        { text = "I'll walk you past the dark stretches, if you like.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Fear's a good teacher. Keep walking fast.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The novices at Northshire, mostly, because the Abbey's bread is so hard you could build a wall with it. Brother Danil says I'm stealing his trade, but he eats two buns every time I visit, so I think he's forgiven me." } },
      choices = {
        { text = "A little sweetness for the novices is a kindness, Kira.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Novices should learn to live on hard bread.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Kira.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Once, near the Brackwell patch, and the one in the bandana took a loaf and paid for it, which was the strangest robbery I've ever had. He said he'd been a mason in Stormwind before they stopped paying him, and I've thought about him ever since." } },
      choices = {
        { text = "He's still a thief, Kira. The law is the law.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The crown wronged him first. I can't blame him entirely.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! You look as though you've forgotten your own supper, like every healer I meet on this road." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin on my road! I always feel safer when there's plate in sight, even if it's only passing." },
        { id = "h_default", text = "Kira Songshine, baker, and I bring the bakery to you! North to the city gates, east toward the tower, and southwest as far as the garrison, depending on my feet." },
        { id = "h_night", when = { timeOfDay = "night" }, text = "I should be home by now, but there's always one more traveler on the road. Lucky for you it's this one." },
        { id = "h_hogger", when = { questActive = TODO_QUEST("WANTED: \"Hogger\"") },
          text = "If you're going after Hogger, take two loaves, one for the walk there and one for the walk back, because I'm an optimist." },
        { id = "h_gnome", when = { race = "Gnome" },
          text = "Ooh, a gnome! The ones I meet always want to know how the oven works. I bake it in Goldshire, I tell them, and it works by being hot." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! I always hope one of you will warm my baskets on a cold morning, though none of you ever have." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" },
          text = "Oh! You gave me a fright, coming up the road with that creature, and I nearly dropped the rolls." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior, and you'll be hungry, because warriors always are! I've a loaf here that's still warm, if you've the coin." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter on my road! You'll have meat already, I expect, but bread goes with it, so let's talk." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A night elf on the road! Have a sniff of this basket, because I'll wager the bread in Darnassus doesn't smell anything like it." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue! You'll pay for that loaf like everybody else, mind, because I count them twice before I leave Goldshire." },
      },
      again = {
        { id = "h_again", text = "Anything else, love? I've got a long way to walk before dark." },
        { id = "h_again2", text = "Ask away; my feet could use the rest." },
      },
      choices = {
        { text = "Let me see your basket.", next = "BUSINESS" },
        { text = "Isn't the road dangerous for you?", next = "road" },
        { text = "Who buys from you, mostly?", next = "buyers" },
        { text = "I stood a Stormwind watch once. Do the guards look after you?", next = "guards", when = { origin = "human_city_guard" } },
        { text = "Would warm bread really sell better on the road?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Are you often frightened on the road, Kira?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do warriors eat more bread than anyone else?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Will your bread keep for a long hunt?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Who do you bake for, besides your customers, Kira?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Have the Defias ever stopped you on the road, Kira?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Where does your flour come from, Kira?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Does anyone ever steal from your basket on the road, Kira?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Safe walking.", next = "END" },
      },
    },
    road = {
      lines = { { id = "r_default", text = "Wolves and kobolds don't want bread, so it's mostly safe, and I keep off the southwest road past the river. Everyone knows what lives down that way." } },
      choices = {
        { text = "Hogger, you mean.", next = "road_hogger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road_hogger = {
      lines = {
        { id = "rh_default", text = "Don't say the name too loud out here. The Westbrook lads tell stories about him that would curdle the milk, and I've milk in this basket." },
        { id = "rh_done", when = { questDone = TODO_QUEST("WANTED: \"Hogger\"") },
          text = "Oh, that was you? Then I can walk the west road without humming to keep my nerve up. I'll find something else to hum about." },
      },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "hogger" } } } },
    },
    buyers = {
      lines = { { id = "b_default", text = "Farmers too busy to bake, guards on long watches, and every young hero out of Northshire who forgot to pack supper. That last lot's my best custom." } },
      choices = {
        { text = "Guilty. I forgot mine.", next = "BUSINESS", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    guards = {
      lines = { { id = "gu_default", text = "They do, bless them. If anyone gives me trouble I only have to shout, and a Stormwind guard comes running with his mouth still full of my bread." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I bake at dawn and walk till dusk. My feet know every rut between Goldshire and the city gates." } },
    advice = { { id = "tp_ad", text = "Always carry more water than you think. The road's longer than it looks from the inn door." } },
    hogger = { { id = "tp_hogger", text = "I don't sell on the southwest road. That's all I'll say, and I'll say it quietly." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, love. Ask me where the road goes and I'll know." } },
  },
}

-- Bo: a Goldshire boy who runs around the smithy and the pond with his friends Joshua and Mark.
P:NPC {
  key = "bo", id = TODO_NPC("Bo"), name = "Bo",
  bible = "bibles/goldshire_more.md", role = "child", tier = "service", communities = { "goldshire" },
  temper = { "eager" }, values = { "brave" }, notices = { "wonder", "kit" },
  impression = {
    first = "Bo runs circles around Goldshire's smithy with his friends and stops only long enough to ask whether your sword is real. He seemed to think mine was a little small.",
    third = "{name} met Bo, a Goldshire boy who plays around the smithy and the pond with his friends Joshua and Mark.",
  },
  greetings = {
    { id = "g_run", text = "Can't stop, I'm it! Well, I can stop for a bit." },
    { id = "g_back", when = { metBefore = true }, text = "It's you again! Joshua didn't believe I talked to a real adventurer, so stay here while I fetch him." },
  },
  notice = {
    { id = "n_form", cat = "wonder", place = "replace", when = { form = { "bear", "cat" } },
      text = "Whoa! Are you a druid, or are you a bear that talks? Either way, can I touch your ear?" },
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.25 } },
      text = "Your armor's all bashed in! Did you fight Hogger? Tell me you fought Hogger." },
  },
  start = "hello",
  nodes = {
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Yes! Only not here, because Argus said no animals near the forge after the time Mark brought a lamb. Could you do it behind the inn, where Farley can't see?" } },
      choices = {
        { text = "Not for show, Bo. It isn't a trick to play.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Behind the inn, then, but only if you keep it secret.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "No, a paladin, but a warrior's nearly as good! I practise with a stick behind the smithy, only Argus says I'm holding it like a broom, and then Mark laughs." } },
      choices = {
        { text = "Keep practising, Bo. Everyone starts with a stick.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Paladins are all prayer. Be a warrior instead.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Maybe, if I could have a bear! Joshua says you can't keep a bear in Goldshire, but there's lots of room behind the inn, and Farley wouldn't notice for ages." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Is that {pet}? Does it have a name? Can it do tricks? I bet it can do tricks." },
      },
      choices = {
        { text = "A beast is a friend, Bo, not a toy.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Pat it if you like. It bites, but only a little.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "I'd sneak into the Lion's Pride cellar and see what's down there, because Farley says it's just barrels but Joshua heard it growl. Then I'd sneak out again really fast and tell everyone." } },
      choices = {
        { text = "Stay out of that cellar, Bo. Some doors are shut for a reason.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Find out for yourself, Bo. Grown-ups hide all sorts of things.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Because they help people, and they don't get scared, and they've got the shiniest armour of anybody. Joshua says I'd have to pray every single day, and I said I would, mostly." } },
      choices = {
        { text = "Start with helping people, Bo. The armour comes later.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Do it for the shiny armour. That's reason enough.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else, Bo.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I'm Bo! Me and Joshua and Mark play by the smithy, because Argus lets us watch the sparks so long as we don't touch anything." },
        { id = "h_paladin", when = { class = "PALADIN" },
          text = "Are you a paladin? Brother Wilhelm trains them behind the smithy, and I watch through the fence. I'm going to be one when I'm big." },
        { id = "h_dwarf", when = { race = "Dwarf" },
          text = "You're a dwarf! Is it true dwarves are born with beards? Mark says yes, and Joshua says Mark's daft." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "Are you a rogue? Can you go invisible? Mark says rogues can go invisible, and Joshua says Mark's daft again." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "Are you a warrior? You've got a real sword, a real one! Joshua says warriors never get scared, and Mark says that's daft." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "Are you a hunter? Is that your animal? Can I pat it? Mark says it'll bite, but Mark's daft." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "Are you really a night elf? Joshua says your lot can turn into bears, and Mark says that's made up, so you have to show me." },
      },
      again = {
        { id = "h_again", text = "What else? Quick, before Mark finds me." },
        { id = "h_again2", text = "Ask me something else! I know loads of things." },
      },
      choices = {
        { text = "What do you play?", next = "games" },
        { text = "What do you want to be when you're grown?", next = "grown" },
        { text = "Want to see a real spell?", next = "mage", when = { class = { "MAGE", "WARLOCK", "PRIEST" } } },
        { text = "What would you do if you could go invisible?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Do you want to be a warrior someday, Bo?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Would you like to be a hunter, Bo?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Why do you want to be a paladin, Bo?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do you want to see me turn into a bear?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Off you go, then.", next = "END" },
      },
    },
    games = {
      lines = { { id = "ga_default", text = "Kobolds and guards! Mark's always the kobold, because he does the voice best, and I'm always the Marshal, because I'm fastest." } },
      choices = {
        { text = "What does Marshal Dughan think?", next = "games_dughan" },
        { text = "Something else.", next = "BACK" },
      },
    },
    games_dughan = {
      lines = { { id = "gd_default", text = "He said if we're going to play guards, we should guard the pond from frogs. That's not a real job, but we did it anyway." } },
      choices = { { text = "Somebody has to guard it.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } } },
    },
    grown = {
      big = true,
      lines = { { id = "gr_default", text = "A soldier, like the ones who went off and didn't say where. Ma says I'm not to, because some of them didn't come back, but she always says that." } },
      choices = {
        { text = "Your ma's right. Stay and look after Goldshire.", next = "BACK", fx = { align = { order = 1 }, trait = { kind = 1 } } },
        { text = "Follow your own road when you're grown.", next = "BACK", fx = { align = { order = -1 }, trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mage = {
      lines = { { id = "ma_default", text = "Yes! No, wait, not near the hay, Argus said there was a fire once. Do a little one, a really little one, over the pond." } },
      choices = {
        { text = "There. A little one.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Magic isn't a game, Bo.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I live in Goldshire! I've been to the city twice, and it's very big and nobody plays outside." } },
    advice = { { id = "tp_ad", text = "Don't go near the lake by Stone Cairn. Ma says there's things in it, and Ma knows everything." } },
    hogger = { { id = "tp_hogger", text = "Mark says Hogger eats boys. I said he'd have to catch me first, but I didn't say it very loud." } },
    _none = { { id = "tp_none", text = "I dunno! Ask a grown-up. They don't know either, but they pretend better." } },
  },
}

-- Matt: a Goldshire boy who fishes badly between the Crystal Lake pier and the town pond.
P:NPC {
  key = "matt", id = TODO_NPC("Matt"), name = "Matt",
  bible = "bibles/goldshire_more.md", role = "child", tier = "service", communities = { "goldshire" },
  temper = { "grumbling" }, values = { "patient" }, notices = { "craft" },
  impression = {
    first = "Matt fishes with great determination and very little luck, walking back and forth between Crystal Lake and the Goldshire pond in search of fish that will bite. I didn't have the heart to tell him about his knot.",
    third = "{name} met Matt, a Goldshire boy who fishes every day and catches very little.",
  },
  greetings = {
    { id = "g_fish", text = "Dang it, nothing biting here either. Shh, you'll scare them, if there's any to scare." },
  },
  notice = {
    { id = "n_fisher", cat = "craft", when = { profession = "Fishing" },
      text = "You fish? Real fishing, with a proper pole? Did Lee Brown teach you? He won't teach me till I'm taller." },
  },
  start = "hello",
  nodes = {
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Not curse them, exactly, only make them a bit less stubborn. I've walked between Crystal Lake and the pond every day this week, and I'm starting to think the fish are doing it to me on purpose." } },
      choices = {
        { text = "Fish it honestly, Matt. You'll catch something.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "A little nudge wouldn't hurt anyone. I'll think on it.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Matt.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Yes, please, because I've been here since breakfast and I've tried three different worms. Lee Brown says it's my knot, but I think the fish have just got it in for me." } },
      choices = {
        { text = "It's your knot, Matt. Learn to tie it properly and they'll come.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Forget the knot. Wade in and grab one, like a bear does.", next = "BACK", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "I saw the guards fight a murloc by the bridge once, from behind a fence. It made a noise like a kettle and they didn't win straight off, and then Ma pulled me home by the ear." } },
      choices = {
        { text = "Your ma's right. Stay behind the fence.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Next time, sneak a bit closer and watch properly.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Bears, sometimes, early, and Ma says not to go near when the bear's there. I think the bear's better at fishing than me, which isn't fair, since it doesn't even have a rod." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Does {pet} like fish? I'll give it one when I catch one, if I ever catch one." },
      },
      choices = {
        { text = "Leave the bears be, Matt. The pond is theirs too.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "If a bear comes, throw a rock and shout.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "It's the fish, because they're stupid, but Lee Brown says I splash too much when I cast. I don't believe him, but I've started casting quieter, just in case." } },
      choices = {
        { text = "Lee's right, Matt. Listen to the man who catches fish.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Never mind Lee. Splash all you like and blame the fish.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "I would, but properly takes forever, and I've been sitting here since breakfast. Lee Brown says patience is the trick, but Lee Brown's old, so he's got more patience to spare than me." } },
      choices = {
        { text = "Patience is the trick, Matt. Lee's right about that.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Forget patience. Find a faster way to fill your basket.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Because of the guards who went to the lake and never came back, and because of the murlocs Remy talks about. I'm not scared, honest, but I said a prayer for the guards anyway, the way Ma does, in case it helps." } },
      choices = {
        { text = "It helps, Matt. Keep saying it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Prayers won't bring them back, Matt. Best not to hope.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else, Matt.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "No, a fisherman, a proper one, because paladins have to get up early and pray, and fishermen only have to get up early. But if a paladin cleared out the lake, I'd catch him the biggest fish in Elwynn, I promise." } },
      choices = {
        { text = "I'll clear the lake, then. A promise to a boy matters.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Stay by the pond, lad. The lake's not my problem.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "Are you a priest? Can you bless my line so the fish bite? Ma says that's not what blessings are for, but I don't see why not." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "Are you a paladin? Are you going to fight the murlocs? Bo says paladins aren't scared of anything, and for once he's not daft." },
        { id = "h_default", text = "I'm Matt, and I'm a fisherman. I haven't caught anything yet today, but that's because the fish in this pond are stupid and won't bite." },
        { id = "h_back", when = { metBefore = true }, text = "I caught one yesterday, a big one, only it got away, so you'll have to take my word for it." },
        { id = "h_guards", when = { questDone = TODO_QUEST("Find the Lost Guards") },
          text = "Is it true you went out to the lake where the guards went missing? Ma won't let me past the bridge now, and I think I know why." },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" },
          text = "You're one of those sneaky types! Don't creep up on the pond, because you'll scare the fish, and they're scared enough already." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" },
          text = "A mage! Can you make fish jump out of the water? That would be the best way to fish there is." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "You're a warrior! Could you hit the water and make the fish come up stunned? I saw a man do that once, nearly." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! Can your animal catch fish? Mine can't, because I haven't got one, but if I did it would." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "You're a night elf! Can you talk to fish? Because if you can, tell them I've got a worm and it's a good one." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock! You couldn't make the fish bite, could you? I'm not saying I'd want you to, but I'm not saying I wouldn't." },
      },
      again = {
        { id = "h_again", text = "What? Keep your voice down, there might be one coming." },
        { id = "h_again2", text = "Ask me something, I'm just waiting anyway. Fishing's mostly waiting." },
      },
      choices = {
        { text = "Where's the best fishing?", next = "spot" },
        { text = "Can I see your line?", next = "line" },
        { text = "Want some tips from a real fisher?", next = "tips", when = { profession = "Fishing" } },
        { text = "Is it the fish or the fisherman that's the trouble?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Wouldn't you rather catch them properly, Matt?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Have you ever seen a real fight, Matt?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Do any animals come down to the pond to fish?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Why won't your ma let you past the bridge, Matt?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Would you like to be a paladin, Matt?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Shall I tell you why the fish aren't biting?", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would you really want me to curse the fish, Matt?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Good luck, Matt.", next = "END" },
      },
    },
    spot = {
      lines = { { id = "s_default", text = "My old fishing hole, by the pier on Crystal Lake. When it's not biting there I come here, and when it's not biting here I go back. It's never biting anywhere." } },
      choices = {
        { text = "Why not Stone Cairn Lake?", next = "spot_lake" },
        { text = "Something else.", next = "BACK" },
      },
    },
    spot_lake = {
      lines = { { id = "sl_default", text = "Because of the fish-men! Guards went there and didn't come back, everybody says so. I'm brave, but I'm not daft." } },
      choices = { { text = "Smart lad. Something else.", next = "BACK", fx = { learn = { "murlocs_east" } } } },
    },
    line = {
      lines = { { id = "l_default", text = "I tied it myself! Lee Brown says the knot's wrong, but Lee Brown catches fish all day, so what does he know about how hard it is?" } },
      choices = {
        { text = "Let me retie that knot for you.", next = "BACK", fx = { affinity = 2, trait = { kind = 1 } } },
        { text = "Maybe listen to Lee Brown.", next = "BACK", fx = { trait = { stern = 1 } } },
      },
    },
    tips = {
      lines = { { id = "t_default", text = "Really? Go on, then, but don't tell Lee, because he'll say he told me first, and he probably did." } },
      choices = {
        { text = "Be patient, and fish at dawn.", next = "BACK", fx = { affinity = 1, trait = { patient = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I live in Goldshire and I'm going to be the best fisherman in Elwynn. I just haven't started being it yet." } },
    advice = { { id = "tp_ad", text = "Don't stand where your shadow's on the water. I read that somewhere, or Lee said it." } },
    murlocs_east = { { id = "tp_murlocs", text = "They stole all the good fish out of Stone Cairn, I bet. That's why I can't catch any." } },
    _none = { { id = "tp_none", text = "Dunno. Fish don't talk about that sort of thing, so I wouldn't know." } },
  },
}
