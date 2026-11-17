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
    first = "Nergal sells food, drink and supplies at Marshal's Refuge, and he won't buy a thing that grew down in the crater. He's a gruff dwarf with a long memory for every expedition that went down and didn't come back.",
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
        { text = "That's wisdom, not cowardice, Nergal.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "You're missing out on good coin, old man.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Because everything down there's either trying to eat ye or glowing with something, and I've seen what crater meat did to a guard's belly. A warrior needs bread and salt pork and a steady stomach when the devilsaurs come, not a gutful of who knows what." } },
      choices = {
        { text = "Plain rations and a steady stomach. That's how soldiers march.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "I live off the land wherever I fight. It's served me fine.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Not a scrap, and don't ye wave a raptor flank at me either, because I've seen what crater beasts eat, and some of it was a scholar's boot. Ammunition's another matter, and ye'll be wanting plenty of that down there." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Yer {pet} can eat what it likes, mind, because beasts have stronger stomachs than dwarves, but don't let it lick my counter after." },
      },
      choices = {
        { text = "Your caution's sound. Stick with the old rations.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "The land provides. You'd do well to eat from it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "More than I care to count, and the crater kept half of them, so I've buried empty sacks with names stitched on. Say what ye like about the Forsaken, but I'd not want anything walking out o' that crater that I'd put in the ground." } },
      choices = {
        { text = "The dead you buried will rest, Nergal. I'll see to it.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Death isn't always an ending, dwarf, whatever you've buried.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "Because half the fruit down there is poison and the other half is guarded by something with teeth. The devilsaurs don't share their hunting grounds, so I'd rather pay to carry bread up the cliff." } },
      choices = {
        { text = "The crater would feed you if you respected it.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Kill one devilsaur and you'd eat for a month.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Because I've seen what it does to them as eats it. Fruit that makes a man's skin glow, roots that set his belly fighting him, and one lad who ate a raptor egg and swore for a week the mountain was calling his name." } },
      choices = {
        { text = "The crater's gifts are meant for its own. Wise of you.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "The land feeds those who respect it. You're missing out.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "It hurts my pride more than my purse, because I paid a goblin to haul every barrel up that cliff. Still, a mage who can feed their own belly is one less mouth on my stores, and the Refuge needs every crumb it can keep." } },
      choices = {
        { text = "Conjured food spares your stores. That's good for everyone.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Honest food should be paid for, magic or no.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Then ye'll not mind me counting, will ye? Out here a missing sack of meal could starve a scholar, so I count everything twice and trust nobody once, and it's kept the Refuge fed so far." } },
      choices = {
        { text = "Count away, Nergal. I've nothing to hide.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "A man who counts that hard expects to be robbed.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Never mind that.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "It chews them, friend, and spits out the ones too stubborn to swallow, which is how I'm still here. I've watched good expeditions go down that path singing and come back carried, and I've buried more of them up on this ridge than I'll ever tell Williden." } },
      choices = {
        { text = "Then let me bless the ones who still go down.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Folk who go down there singing chose their own end.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Fortified, if I had my way, with a proper wall and a proper gate, but every board up here comes on somebody's back from Tanaris. Williden thinks in crystals and I think in stores, and between us we've built a camp that holds, for now." } },
      choices = {
        { text = "Build the wall. Discipline and stone keep people alive.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Walls make you slow. Stay light and ready to move.", next = "BACK", fx = { align = { order = -1 } } },
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
        { id = "h_druidcl", when = { class = "DRUID" }, text = "A druid, eh? Then you'll be glad to know none of my stores came out of the crater, because I've seen what the raptors eat and I'd rather not join the meal." },
        { id = "h_magecl", when = { class = "MAGE" },
          text = "A mage, eh? Then ye'll not be needing my water, since ye conjure your own, and I'll thank ye not to tell the expedition how easy it is." },
        { id = "h_roguecl", when = { class = "ROGUE" },
          text = "I'll be counting my crates after ye've gone, friend, so don't take it personal. I've known a few of your trade, and every one of them was charming right up until the stores came up short." },
        { id = "h_hpriest", when = { class = "PRIEST", race = { "Troll", "Scourge" } }, text = "A Horde priest, is it? I'll sell ye bread and boiled water same as anyone, but if ye're one o' the Forsaken, I'd ask ye kindly not to handle the bread." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" },
          text = "A priest, is it? Then ye'll have seen what the crater does to folk, and if ye haven't, give it a day and ye will." },
        { id = "h_apaladin", when = { class = "PALADIN" },
          text = "A paladin! The Refuge could use a bit of honest steel and holy fire, because the raptors have been getting bold, and they don't respect a shopkeeper's ladle." },
        { id = "h_warcl", when = { class = "WARRIOR" },
          text = "A warrior, and ye'll be wanting a proper meal before ye go down into that pit, because I'll not have ye eating what lives down there." },
        { id = "h_huntcl", when = { class = "HUNTER" },
          text = "A hunter, eh? Ye'll be bringing me crater meat, I suppose, and I'll be telling ye no, same as I tell everyone." },
      },
      again = {
        { id = "h_again", text = "Anything more ye need from the stores, friend, before I get back to my crates?" },
        { id = "h_again2", text = "Ask away, but I'll keep stacking while ye do." },
      },
      choices = {
        { text = "Why won't you trust anything that grows in the crater?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "Why not live off the crater, Nergal?", next = "druid_q", when = { class = "DRUID" } },
        { text = "Let me see your goods.", next = "BUSINESS" },
        { text = "Why not eat what's in the crater?", next = "crater_food" },
        { text = "Something must have gone wrong with the expedition.", next = "expedition" },
        { text = "Conjured water must hurt your trade, Nergal.", next = "xmage", when = { class = "MAGE" } },
        { text = "I'm no thief, Nergal.", next = "xrogue", when = { class = "ROGUE" } },
        { text = "What does the crater do to people, Nergal?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "You must have buried many from the expeditions, Nergal.", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Should the Refuge be fortified, or abandoned?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Why won't you eat anything that grows in the crater, Nergal?", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Won't you even buy devilsaur meat from a hunter, Nergal?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Why won't you buy anything from the crater, Nergal?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Goodbye.", next = "END" },
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
        { text = "They were brave to try.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "They were foolish to come unprepared.", next = "BACK", fx = { affinity = -1, align = { honor = -1 } } },
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
    first = "Gryfe runs the flights out of Marshal's Refuge for anyone who pays, Horde or Alliance. He's a cheerful goblin who considers a beast that doesn't land in Un'Goro a beast that comes back.",
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
        { text = "Fair terms. My imp will sit still.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Pay in advance? You don't trust anyone, Gryfe.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "The pterrordax try it every week, chum, and every week my flyers leave 'em flapping behind, because I only buy the fast ones and I pay extra for it. Still, I'd sleep easier knowing a warrior was riding along who could swing at anything that got close." } },
      choices = {
        { text = "On a flyer I'd hold still and let the bird work.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "If a pterrordax comes near, I'll swing at it.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Not the ones on the ground, chum, because a devilsaur can't climb and a raptor can't jump that high, though I've seen one try. It's the pterrordax that worry me, and a hunter who thinned out their roosts on the ridge would make my whole week and my insurance cheaper." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "And keep {pet} from eyein' my flyers' legs before takeoff, will you, chum? A bird that's been stared at all morning flies sulky and lands worse." },
      },
      choices = {
        { text = "Pterrordax hunt to live. Thinning them isn't my place.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Clear the roosts. Your flyers matter more than they do.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhcast = {
      big = true,
      lines = { { id = "xhcast_default", text = "Every last one, chum, Horde and Alliance alike, and the Forsaken pray loudest, which surprised me, given they've already been dead once. The updrafts off that volcano will make a believer of anybody, and I don't charge extra for the religion." } },
      choices = {
        { text = "I'll bless your beasts, so they bring everyone home.", next = "BACK", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Let them pray. Fear keeps passengers humble.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "That the silithid breed faster than the Circle can burn them out, chum, and the sand's more hive than desert now. I fly 'em there and I fly 'em back, and every month there are fewer to bring home, which is bad for the return fares and worse for them." } },
      choices = {
        { text = "The Circle must hold. Silithus can't be allowed to fall.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let the Circle handle it. It's their fight.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhsham = {
      big = true,
      lines = { { id = "xhsham_default", text = "Hot and lumpy, chum, like flying through soup. The air comes up off the Fire Plume in great gusts, so my beasts have learned to swing wide round the ridge, because the last one that went straight over came back singed and in a very bad mood, and the vet bill was murder." } },
      choices = {
        { text = "Swing wide. Some winds aren't meant to be crossed.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Fly straight through. Bold winds respect a bold flier.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Not if they pay, chum, and not if the Bruisers aren't asking either. Folk come out of the crater with all sorts of reasons to keep quiet, and I've found I fly faster when I don't know any of 'em." } },
      choices = {
        { text = "Good. Some business is nobody else's.", next = "BACK", fx = { affinity = 1, align = { order = -1 } } },
        { text = "You should know who you're carrying.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "That's the sweetest thing anybody's said to me this week, chum! Ironforge, Stormwind, Orgrimmar, sure, but out here you need a flyer, and a flyer needs me, and I need your silver." } },
      choices = {
        { text = "You'd charge your own mother for a seat.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Fair trade. You earn your fare.", next = "BACK", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Gladly, chum, because their gold spends the same as yours and their saddlebags weigh about the same too. I don't pick sides in your wars, I pick routes, and a flight master who starts talking politics ends up with a very quiet roost." } },
      choices = {
        { text = "Neutral or not, you should know whose wars you're fueling.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Smart business. Wars end, but coin keeps flying.", next = "BACK", fx = { affinity = 1, align = { honor = -1 } } },
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
      },
      again = {
        { id = "h_again", text = "What else, chum? The flyer's gettin' twitchy, and twitchy flyers cost me feathers." },
        { id = "h_again2", text = "Go on, ask, chum, but don't take too long, because the meter's running." },
      },
      choices = {
        { text = "What are the winds like over the crater?", next = "xhsham", when = { class = "SHAMAN" } },
        { text = "You must hear things about Silithus, Gryfe.", next = "druid_q", when = { class = "DRUID" } },
        { text = "Where can I fly?", next = "BUSINESS" },
        { text = "Why fly anyone, Horde or Alliance?", next = "neutral" },
        { text = "Is flying over the crater safe?", next = "safe" },
        { text = "You don't ask who your passengers are?", next = "xrogue", when = { class = "ROGUE" } },
        { text = "Mages can't teleport to Gadgetzan, Gryfe.", next = "xmage", when = { class = "MAGE" } },
        { text = "You seem to fly the Horde as gladly as the Alliance.", next = "xapala", when = { class = "PALADIN" } },
        { text = "Do your passengers really pray on the flight, Gryfe?", next = "xhcast", when = { class = "PRIEST", race = { "Troll", "Scourge" } } },
        { text = "Your flyers must get attacked over the crater, Gryfe.", next = "xwarcl", when = { class = "WARRIOR" } },
        { text = "Do the crater beasts ever threaten your flyers, Gryfe?", next = "xhuntcl", when = { class = "HUNTER" } },
        { text = "Has an imp ever set one of your beasts on fire, Gryfe?", next = "xlock", when = { class = "WARLOCK" } },
        { text = "Goodbye.", next = "END" },
      },
    },
    neutral = {
      lines = { { id = "n_default", text = "Because the Cartel keeps this place running, chum, and the Cartel doesn't take sides, it takes percentages. The Bruisers keep everybody civil, I keep everybody moving, and it's a fine arrangement for all of us." } },
      choices = {
        { text = "Do you think the peace will hold?", next = "op_peace" },
        { text = "More places should work like that.", next = "BACK", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I don't trust anyone who'd fly my enemies.", next = "BACK", fx = { affinity = -1, align = { order = -1 } } },
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
