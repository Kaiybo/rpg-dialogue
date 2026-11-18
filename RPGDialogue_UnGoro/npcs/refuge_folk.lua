-- Marshal's Refuge's quiet hands (0.39.0): the supply seller and the flight master.
-- Voice: bibles/ungoro.md ("Refuge hands")
local P = RPGDialogueAPI:Pack("rpgd.ungoro")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "nergal", id = TODO_NPC("Nergal"), name = "Nergal", title = "General Goods",
  bible = "bibles/ungoro.md", role = "vendor", tier = "service",
  communities = { "marshals_refuge" }, temper = { "gruff" }, values = { "careful", "profit" },
  notices = { "race", "hunger" },

  impression = {
    first = "He won't buy a thing that grew down in the crater.",
    third = "{name} met Nergal, the dwarf who sells supplies at Marshal's Refuge.",
  },

  greetings = {
    { id = "o_el_distrust", when = { gossip = { topic = "explorers_league", stance = "distrust" } }, text = "Williden tells me you called the League glory-hunters. I'm a dwarf, so mind your tongue around my counter, friend, but I'll not say you're entirely wrong." },
    { id = "g_default", text = "Food, drink and shot, all hauled up from Gadgetzan by a goblin who charges by the step, so don't ask why it costs what it costs." },
    { id = "g_back", when = { metBefore = true }, text = "Back up the hill in one piece, are ye? Good, I hate losing a customer to a lizard." },
    { id = "g_away", when = { away = 14 }, text = "Ye've been gone {away}, an' ye're still walkin', which is more than I'd have wagered. I'd started tae wonder whether a devilsaur had made a meal o' ye." },
    { id = "g_word_lie", when = { word = "caughtLying" }, text = "I hear somebody up here caught ye tellin' a tall one, an' word travels fast on a ridge this small. Mind ye pay honest coin, at least, because I count it twice." },
    { id = "g_word_threat", when = { word = "intimidated" }, text = "Word is ye put the fear intae somebody up here, an' I'll tell ye now I don't scare, so don't bother tryin' it on me." },
  },

  notice = {
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" },
      text = "Another dwarf in this steaming pit! Ye've my sympathy, friend; there's no proper stone down there, only mud and teeth." },
  },

  start = "hello",
  nodes = {
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Because I've seen too many expeditions go down there an' no' come back, an' the things they brought back weren't worth the graves. The crater's full o' strange things, an' strange things make folk sick, so I'll sell clean food an' buy nothin', an' ye can call me a coward if ye like." } },
      choices = {
        { text = "That's not cowardice, Nergal. That's sense.", next = "BACK", reply = "Aye, that's what I tell myself on the long nights, an' it's grand tae hear it from someone else. Besides, a live coward sells more meal than a dead hero.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "You're leaving good coin on the table, old man.", next = "BACK", reply = "Good coin, is it? Ye can't spend it in a devilsaur's belly, warlock. I'll keep my old bones up here, thank ye.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because everything down there's either trying to eat ye or glowing with something, and I've seen what crater meat did to a guard's belly. A warrior needs bread and salt pork and a steady stomach when the devilsaurs come, not a gutful of who knows what." } },
      choices = {
        { text = "Plain rations and a steady stomach. That's how soldiers march.", next = "BACK", reply = "Now there's a soldier wi' sense, and I'll stock extra hardtack in yer honour. Marching on a glowing stomach never ended well.", fx = { align = { order = 1 } } },
        { text = "I live off the land wherever I fight. It's served me fine.", next = "BACK", reply = "It's served ye fine elsewhere, aye, but this crater's no' elsewhere. Eat a glowing berry and ye'll see what I mean, from the inside.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Not a scrap, and don't ye wave a raptor flank at me either, because I've seen what crater beasts eat, and some of it was a scholar's boot. Ammunition's another matter, and ye'll be wanting plenty of that down there." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Not a scrap, friend. Yer {pet} can eat what it likes, because beasts have stronger stomachs than dwarves, but don't let it lick my counter after." },
      },
      choices = {
        { text = "Your caution's sound. Stick with the old rations.", next = "BACK", reply = "Good, an' I'll sleep easier knowin' at least one hunter listens. The old rations taste o' nothin', but nothin' never killed a dwarf.", fx = { align = { order = 1 } } },
        { text = "The land provides. You'd do well to eat from it.", next = "BACK", reply = "It provides, aye, and then it takes ye back the same way. I'll stick wi' my barrels, and ye can tell me how yer belly fares.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "More than I care to count, and the crater kept half of them, so I've buried empty sacks with names stitched on. Say what ye like about the Forsaken, but I'd not want anything walking out o' that crater that I'd put in the ground." } },
      choices = {
        { text = "The dead you buried will rest, Nergal. I'll see to it.", next = "BACK", reply = "Bless ye for that, truly. I stitched every one o' those names myself, and I'd like tae think somebody's watching over them.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Death isn't always an ending, dwarf, whatever you've buried.", next = "BACK", reply = "That's no comfort tae a dwarf, friend, whatever it is tae ye. I'll keep my sacks buried and my dead resting, if it's all the same.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Because the fruit down there is either poison or guarded by something with teeth. The devilsaurs don't share their hunting grounds, so I pay good coin to haul bread up the cliff." } },
      choices = {
        { text = "The crater would feed you if you respected it.", next = "BACK", reply = "Respected it, have I? I've respected it from up here for a long while, and it's never once fed me anything that didn't bite back.", fx = { align = { light = 1 } } },
        { text = "Kill one devilsaur and you'd eat for a month.", next = "BACK", reply = "Ha! Ye'd eat for a month, aye, if ye lived through the first minute. Bring me one and I'll cook it myself.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Because I've seen what it does to them as eats it. Fruit that makes a man's skin glow, roots that set his belly fighting him, and one lad who ate a raptor egg and swore for a week the mountain was calling his name." } },
      choices = {
        { text = "The crater's gifts are meant for its own. Wise of you.", next = "BACK", reply = "Aye, that's what I've always said, though no' so prettily. That lad wi' the raptor egg still hums at night, an' I'll no' be joinin' him.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The land feeds those who respect it. You're missing out.", next = "BACK", reply = "Missing out on glowing skin and a burning belly, aye, I'll miss it terribly. Ye go ahead and eat, and I'll keep the bandages ready.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It hurts my pride more than my purse, because I paid a goblin to haul every barrel up that cliff. Still, a mage who can feed their own belly is one less mouth on my stores, and the Refuge needs every crumb it can keep." } },
      choices = {
        { text = "Conjured food spares your stores. That's good for everyone.", next = "BACK", reply = "Spares my stores, aye, and my pride's the only thing it costs. I'll grumble, but I'll no' turn ye away.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Honest food should be paid for, magic or no.", next = "BACK", reply = "Now that's a mage after my own heart! Honest food for honest coin, and the goblin who hauled it up gets paid too.", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Then ye'll not mind me counting, will ye? Out here a missing sack of meal could starve a scholar, so I count everything twice and trust nobody once, and it's kept the Refuge fed so far." } },
      choices = {
        { text = "Count away, Nergal. I've nothing to hide.", next = "BACK", reply = "Then we'll get along just fine, an' ye'll no' mind me countin' anyway. Old habit.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A man who counts that hard expects to be robbed.", next = "BACK", reply = "Expects it? No, friend, I just count better than most. A sack o' meal's a life out here.", fx = { align = { honor = -1 } } },
        { text = "Never mind that.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "It chews them, friend, and spits out the ones too stubborn to swallow, which is how I'm still here. I've watched good expeditions go down that path singing and come back carried, and I've buried more of them up on this ridge than I'll ever tell Williden." } },
      choices = {
        { text = "Then let me bless the ones who still go down.", next = "BACK", reply = "Aye, they could use it, every one, and I'd stand wi' ye while ye do. The crater doesnae care, but they might.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Folk who go down there singing chose their own end.", next = "BACK", reply = "Chose it, maybe, but they didnae know what they were choosing. I'll mourn them all the same.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Fortified, if I had my way, with a proper wall and a proper gate, but every board up here comes on somebody's back from Tanaris. Williden thinks in crystals and I think in stores, and between us we've built a camp that holds, for now." } },
      choices = {
        { text = "Build the wall. Discipline and stone keep people alive.", next = "BACK", reply = "That's all I've ever asked for! Tell Williden ye said so, an' say it loud, for he only hears the word \"crystal\" these days.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Walls make you slow. Stay light and ready to move.", next = "BACK", reply = "Light, aye, and dead when the devilsaur comes calling. I'll take slow and alive, thank ye.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock, is it? I'll sell ye bread and boiled water same as anyone, but I'll not buy anythin' ye've dragged up out o' the crater, an' I'll ask ye tae keep yer wee beastie off the counter." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman, eh? Ye'll not find me buying anything ye've charmed out o' that crater, so don't ask. Bread from Gadgetzan and water I've boiled twice, that's all I trust." },
        { id = "h_default", key = true,
          text = "Nergal, and I keep the stores for the Refuge. Bread, meat, water and ammunition, all carried up here by people braver than me, so the expedition doesn't have to eat what lives in the crater." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, eh? Then you'll be glad to know none of my stores came out of the crater, because I've seen what the raptors eat and I've nae wish to be on the menu." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, eh? Then ye'll not be needing my water, since ye conjure your own, and I'll thank ye not to tell the expedition how easy it is." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "I'll be counting my crates after ye've gone, friend, so don't take it personal. I've known a few of your trade, and each was charming right up until the stores came up short." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A Horde priest, is it? I'll sell ye bread and boiled water same as anyone, but if ye're one o' the Forsaken, I'd ask ye kindly not to handle the bread." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, is it? Then ye'll have seen what the crater does to folk, and if ye haven't, give it a day and ye will." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! The Refuge could use a bit of honest steel and holy fire, because the raptors have been getting bold, and they don't respect a shopkeeper's ladle." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, and ye'll be wanting a proper meal before ye go down into that pit, because I'll not have ye eating what lives down there." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, eh? Ye'll be bringing me crater meat, I suppose, and I'll be telling ye no, same as I tell everyone." },
        { id = "h_dd_salvage", tags = { "news" }, when = { questDone = TODO_QUEST("Expedition Salvation") }, text = "Williden says you hauled our lost crates back up from the crater, and I've been counting them ever since. Half the flour's spoiled and the other half has teeth marks in it, but it's ours again, and that's more than I hoped for." },
      },
      again = {
        { id = "h_again", text = "Anything more ye need from the stores, friend, before I get back to my crates?" },
        { id = "h_again2", text = "Ask away, but I'll keep stacking while ye do." },
      },
      choices = {
        { text = "Why won't you trust anything that grows in the crater?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Why not just live off the crater?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "Why not eat what's in the crater?", next = "crater_food" },
        { text = "Something must have gone wrong with the expedition.", next = "expedition" },
        { text = "My conjured water can't be good for your trade.", next = "xmage", when = { class = "MAGE" } },
        { text = "I'm no thief, whatever you've heard.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What does the crater do to people?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "You must have buried a lot of expedition folk.", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Should the Refuge be fortified, or abandoned?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What have you got against crater food?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Not even devilsaur steak, fresh from a hunter?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "You won't buy anything from the crater at all?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Were the crates worth the trouble, Nergal?", next = "dd_salvage", when = { questDone = TODO_QUEST("Expedition Salvation") } },
        { text = "Goodbye.", next = "END" },
      },
    },
    dd_salvage = {
      lines = {
        { id = "dd_salvage_1", text = "Every one of them, friend. The supply runs from Gadgetzan cost a fortune and lose a third to the pterrordax, so a crate pulled out of the mud below is a crate nobody has to pay for twice. I can feed the Refuge for another fortnight on what you brought, if nobody minds the teeth marks." },
      },
      choices = {
        { text = "The Refuge needs to stop leaving supplies in the mud.", next = "BACK", reply = "It does, and I've told Williden as much, politely. The camps fell fast, though, and nobody stops to pack when a devilsaur's coming through the tents.", fx = { align = { order = 1 } } },
        { text = "Out here, you take what the crater leaves you.", next = "BACK", reply = "That's the truth of it. Plan all you like, and Un'Goro will still eat half your plans before supper.", fx = { align = { order = -1 } } },
        { text = "Something else, Nergal.", next = "BACK" },
      },
    },
    crater_food = {
      lines = { { id = "cf_default", text = "Because half the plants down there want to eat ye first, and the other half make ye sick. The meat's all right if ye can kill it, but most of what's worth eating down there is bigger than a kodo and twice as angry." } },
      choices = {
        { text = "I could hunt something for the Refuge.", next = "crater_hunt" },
        { text = "Something else.", next = "BACK" },
      },
    },
    crater_hunt = {
      lines = { { id = "ch_default", text = "Ye could, and ye'd be welcome to sell it to somebody braver than me. I'll stick to food that came in a crate, thank ye very much." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { brave = 1 } } } },
    },
    expedition = {
      lines = { { id = "e_default", text = "The Marshals came down here thinking it was a garden, and the crater taught them otherwise. They lost their camps to the beasts and climbed up here to the high ground, and Williden's been trying to make the best of it ever since." } },
      choices = {
        { text = "It took nerve to try, at least.", next = "BACK", reply = "Brave, aye, and I'll no' say otherwise. But brave and stupid often look the same down there.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They were foolish to come unprepared.", next = "BACK", reply = "Foolish, aye, and they paid for it in blood. I'll no' speak ill o' them, but I'll no' pretend they were wise.", fx = { affinity = -1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I keep the stores. Where I kept them before is between me and my old employers." } },
    advice = { { id = "tp_ad", text = "Carry more food than ye think, because ye'll not be wanting to eat anything ye find down there." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "I buy everything from Gadgetzan, and it costs a fortune to haul it up here, but I'll not sell a single thing that grew in that crater. Ye've seen what grows down there." } },
    magni = { { id = "tp_magni", text = "Magni's a good king, and he'd be proud of a dwarf who keeps a store up a crater wall. I'd like to think so, anyway." } },
    dark_iron = { { id = "tp_dark_iron", text = "The Dark Iron have their own fire down in their mountain, and they're welcome to it. I've enough heat up here." } },
    explorers_league = { { id = "tp_explorers_league", text = "The League sends a dwarf down into the crater every season, and every season one doesn't come back. I keep a list, and I wish I didn't." } },
    _none = { { id = "tp_none", text = "Couldn't tell ye. Ask Williden, he knows more about this place than I'd ever want to." } },
  },
}

P:NPC {
  key = "gryfe", id = TODO_NPC("Gryfe"), name = "Gryfe", title = "Flight Master",
  bible = "bibles/ungoro.md", role = "flightmaster", tier = "service",
  communities = { "marshals_refuge" }, temper = { "cheerful" }, values = { "profit" },
  notices = { "race" },

  impression = {
    first = "To him, a beast that never lands in Un'Goro comes back.",
    third = "{name} met Gryfe, the goblin flight master at Marshal's Refuge.",
  },

  greetings = {
    { id = "g_default", text = "Need a ride out of the crater, chum? Smartest thing anybody's said to me all day, and I haven't even heard you say it yet." },
  },

  notice = {
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "You're a big one, chum! The flyer will carry you, don't worry, but it'll grumble about it all the way to Gadgetzan, and I might charge by the pound." },
  },

  start = "hello",
  nodes = {
    op_peace = {
      lines = {
        { id = "opp_q", text = "Here's a question I ask all my customers, purely for business reasons, chum. Is this peace between Horde and Alliance gonna hold, and do you want it to?" },
      },
      choices = {
        { text = "I hope so. Neutral ground like this proves it can work.", next = "op_peace_r1", fx = { affinity = 2, align = { honor = 1 }, opinion = { peace = "peace" } } },
        { text = "It won't last, and I'll be ready when it breaks.", next = "op_peace_r2", fx = { affinity = -1, align = { honor = -1 }, opinion = { peace = "war" } } },
        { text = "I don't care, so long as the birds still fly.", next = "op_peace_r3", fx = { trait = { witty = 1 }, opinion = { peace = "indifferent" } } },
        { text = "Ask me after the next battle, Gryfe.", next = "BACK" },
      },
    },
    op_peace_r1 = {
      lines = {
        { id = "op_peace_r1", text = "That's what I like to hear, because a war's terrible for the flight business. Everybody wants to fly away from one and nobody pays." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_peace_r2 = {
      lines = {
        { id = "op_peace_r2", text = "Ready, sure, but a war's bad for my margins, pal, so don't go startin' one on my landing field." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    op_peace_r3 = {
      lines = {
        { id = "op_peace_r3", text = "Now that's a customer after my own heart! The birds fly for everybody, so long as the coin's good." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Not yet, chum, and I'd like to keep it that way, because a burning flyer over Fire Plume Ridge is a story nobody lives to tell. I don't care what you've bound, so long as it sits still, and so long as you pay in advance, because some of my passengers don't come back." } },
      choices = {
        { text = "Fair terms. My imp will sit still.", next = "BACK", reply = "Sittin' still is all I ask, chum, and you're a reasonable warlock. The flyers will thank you, and so will my insurance.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Pay in advance? You don't trust anybody, do you?", next = "BACK", reply = "Trust? Chum, trust is free and burned flyers are expensive. Pay first, fly second, and everybody lands happy.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The pterrordax try it every week, chum, and every week my flyers leave 'em flapping behind, because I only buy the fast ones and I pay extra for it. Still, I'd sleep easier knowing a warrior was riding along who could swing at anything that got close." } },
      choices = {
        { text = "On a flyer I'd hold still and let the bird work.", next = "BACK", reply = "Smart, real smart. The bird's flown this run two hundred times, so you just hang on and be cargo.", fx = { align = { order = 1 } } },
        { text = "If a pterrordax comes near, I'll swing at it.", next = "BACK", reply = "Swing at it? Chum, you'll swing yourself right off the saddle. Hang on and let the bird outrun it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Not the ones on the ground, chum, because a devilsaur can't climb and a raptor can't jump that high, though I've seen one try. It's the pterrordax that worry me, and a hunter who thinned out their roosts on the ridge would make my whole week and my insurance cheaper." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Only the pterrordax, chum. And keep {pet} from eyein' my flyers' legs before takeoff, will you? A bird that's been stared at all morning flies sulky and lands worse." },
      },
      choices = {
        { text = "Pterrordax hunt to live. Thinning them isn't my place.", next = "BACK", reply = "That's a hunter with a big heart, chum, and I respect it. My flyers will just keep flyin' faster.", fx = { align = { light = 1 } } },
        { text = "Clear the roosts. Your flyers matter more than they do.", next = "BACK", reply = "Music to my ears, chum! Clear a roost and I'll fly you anywhere for the cost of the bird's feed. Kidding, kidding, the price is the price.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Every last one, chum, Horde and Alliance alike, and the Forsaken pray loudest, which surprised me, given they've already been dead once. The updrafts off that volcano will make a believer of anybody, and I don't charge extra for the religion." } },
      choices = {
        { text = "I'll bless your beasts, so they bring everyone home.", next = "BACK", reply = "Bless away, chum, and if it brings 'em home, I'll pray too. Even goblins need luck over the Fire Plume.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let them pray. Fear keeps passengers humble.", next = "BACK", reply = "Humble passengers tip better, chum, I'll give you that. Let 'em pray, and let me count the fares.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "That the silithid breed faster than the Circle can burn them out, chum, and the sand's more hive than desert now. I fly 'em there and I fly 'em back, and every month there are fewer to bring home, which is bad for the return fares and worse for them." } },
      choices = {
        { text = "The Circle must hold. Silithus can't be allowed to fall.", next = "BACK", reply = "It has to, chum, because if Silithus falls, the bugs come here next. And then where do I fly?", fx = { align = { honor = 1 } } },
        { text = "Let the Circle handle it. It's their fight.", next = "BACK", reply = "Their fight, sure, chum, until the bugs come knockin' on my roost. I'll keep flyin' till then.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Hot and lumpy, chum, like flying through soup. The air comes up off the Fire Plume in great gusts, so my beasts have learned to swing wide round the ridge, because the last one that went straight over came back singed and in a very bad mood, and the vet bill was murder." } },
      choices = {
        { text = "Swing wide, then. No sense testing a volcano's temper.", next = "BACK", reply = "Wide it is, and wide is what my birds do. Feathers cost money, and I've only got so many spares.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Fly straight through. Bold winds respect a bold flier.", next = "BACK", reply = "Bold? Chum, bold gets you cooked over the Fire Plume. My birds go wide, and my birds come home.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not if they pay, chum, and not if the Bruisers aren't asking either. Folk come out of the crater with all sorts of reasons to keep quiet, and I've found I fly faster when I don't know any of 'em." } },
      choices = {
        { text = "Good. Some business is nobody else's.", next = "BACK", reply = "Exactly, chum, nobody else's business. Pay the fare and I don't ask what's in the bag.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "You should know who you're carrying.", next = "BACK", reply = "Know who, sure, chum, but not what. That's the line, and it keeps me alive.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "That's the sweetest thing anybody's said to me this week, chum! Ironforge, Stormwind, Orgrimmar, sure, but out here you need a flyer, and a flyer needs me, and I need your silver." } },
      choices = {
        { text = "You'd charge your own mother for a seat.", next = "BACK", reply = "My own mother pays full fare, chum, and she's proud of me for it. Family discount's a myth.", fx = { align = { honor = -1 } } },
        { text = "Fair trade. You earn your fare.", next = "BACK", reply = "Exactly, chum, and I earn every copper of it. Flyin' over the crater isn't for the faint of heart.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Gladly, chum, because their gold spends the same as yours and their saddlebags weigh about the same too. I don't pick sides in your wars, I pick routes, and a flight master who starts talking politics ends up with a very quiet roost." } },
      choices = {
        { text = "Neutral or not, you should know whose wars you're fueling.", next = "BACK", reply = "Fueling? Chum, I'm fueling a bird, not a war. The wars can buy their own feed.", fx = { align = { honor = 1 } } },
        { text = "Smart business. Wars end, but coin keeps flying.", next = "BACK", reply = "You get it! I've watched three borders move since I opened this roost, and the fares never once went down.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_lockcl", when = { class = "WARLOCK" },
          text = "A warlock, eh? I'll fly you anywhere, chum, Horde or Alliance, demon or no demon, but if your imp sets my beast's tail on fire, the price goes up and stays up." },
        { id = "h_shamancl", when = { class = "SHAMAN" }, text = "A shaman! My beasts don't love flyin' near the volcano, chum, so if you've any pull with the winds round Fire Plume Ridge, put in a good word for them, and I'll put in a good word for you." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A priest, eh? Most of my passengers start praying the moment we pass Fire Plume Ridge, chum, so you'll fit right in, and at least you'll know the words." },
        { id = "h_default", key = true,
          text = "Gryfe, flight master for Marshal's Refuge, and the fastest wings out of this crater, chum! I'll fly anybody to Gadgetzan or to Cenarion Hold, Horde or Alliance alike, because coin's the same colour whichever side pays it." },
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid! Your Circle keeps watch at Cenarion Hold, chum, and I fly folk there most days, so I hear plenty about the bugs in Silithus, and I'd sell you the gossip if it weren't so depressin'." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "You've got the look of somebody who'd rather not leave a name on the flight log, chum. Lucky for you, I only write down the coin." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "Ah, a mage. Planning to teleport out and save yourself the fare, chum? Go on, break a goblin's heart, see if I care." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! You lot fly heavy, chum, so stand still while I check the straps, because a paladin's armour has made more than one bird regret its career." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior! You fly with me, chum, you strap that axe down tight, because a loose blade in a headwind over Fire Plume Ridge is a very expensive mistake, and you're paying for it." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, and with a beast! Flyers don't mind passengers, chum, but they do mind passengers with claws, so let's have a little talk first about the deposit." },
        { id = "h_dd_fall", when = { deathCause = "falling" }, text = "You've gone off a cliff somewhere and paid for it, I'd guess, by the way you're looking at the rim path. It's a long way down into the crater, so let my birds take you, because they've never once missed the bottom." },
      },
      again = {
        { id = "h_again", text = "What else, chum? The flyer's gettin' twitchy, and twitchy flyers cost me feathers." },
        { id = "h_again2", text = "Go on, ask, chum, but don't take too long, because the meter's running." },
      },
      choices = {
        { text = "What are the winds like over the crater?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "What do you hear about Silithus?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Where can I fly?", next = "BUSINESS" },
        { text = "Why fly anyone, Horde or Alliance?", next = "neutral" },
        { text = "Is flying over the crater safe?", next = "safe" },
        { text = "You don't ask who your passengers are?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "We mages can't teleport to Gadgetzan, you know.", next = "xmage", when = { class = "MAGE" } },
        { text = "You seem to fly the Horde as gladly as the Alliance.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do your passengers really pray up there?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Your flyers must get attacked over the crater.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do the crater beasts ever go after your flyers?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Has an imp ever actually set a bird alight?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    neutral = {
      lines = { { id = "n_default", text = "Because the Cartel keeps this place running, chum, and the Cartel doesn't take sides, it takes percentages. The Bruisers keep everybody civil, I keep everybody moving, and it's a fine arrangement for all of us." } },
      choices = {
        { text = "Do you think the peace will hold?", next = "op_peace" },
        { text = "More places should work like that.", next = "BACK", reply = "They should, chum, and they would if everyone thought like goblins. Percentages over politics, every time.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I don't trust anyone who'd fly my enemies.", next = "BACK", reply = "Then don't fly with me, chum, and walk the crater instead. I'll wave as I pass over.", fx = { affinity = -1, align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe = {
      lines = { { id = "s_default", text = "Safer than walking it, chum. Pterrordax come up off the cliffs now and then and take a look at the flyers, but my beasts are faster, and they've got plenty of reason to be, since I don't feed the slow ones." } },
      choices = {
        { text = "I've never seen a pterrordax.", next = "safe_ptero" },
        { text = "Something else.", next = "BACK" },
      },
    },
    safe_ptero = {
      lines = { { id = "sp_default", text = "A flying lizard with a beak like a pickaxe and no manners at all, chum. Spraggle Frock can tell you all about them, since she's been warning people for weeks and losing supply bags for months." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { curious = 1 } } } },
    },
  },

  topics = {
    background = { { id = "tp_ba", text = "I go where the flight paths go, chum, and right now they go here, and so does the money. That's the whole story." } },
    advice = { { id = "tp_ad", text = "Fly over Un'Goro whenever you can, chum, because everything down there wants to eat you, and none of it can catch a flyer." } },
    steamwheedle = { { id = "tp_cartel", text = "The Cartel pays my wages and keeps the Bruisers here, chum. That's all the politics I need, and all I can afford." } },
    gadgetzan = { { id = "tp_gadgetzan", text = "Gadgetzan's my best route, pal, and the one I charge most for, because it's the one people want most. That's just good sense." } },
    booty_bay = { { id = "tp_booty_bay", text = "I'll fly you to Booty Bay if you like, buddy, but you'll be changing beasts three times. The connection's not my fault, take it up with the Cartel." } },
    thrall = { { id = "tp_thrall", text = "Horde, Alliance, I don't care who's paying, friend, I fly 'em all. The Warchief's people tip better, for what it's worth." } },
    jaina = { { id = "tp_jaina", text = "The Theramore folk fly out of here on the same beasts as the Horde, and nobody's died of it yet. That peace is good for business." } },
    _none = { { id = "tp_none", text = "Don't know, chum. I only know where things are from the air, and what it costs to get there." } },
  },
}
