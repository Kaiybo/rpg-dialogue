-- Loch Modan between the towns: the towers, Algaz Station, the loch shore. Voice: bibles/loch_roads.md
local P = RPGDialogueAPI:Pack("rpgd.lochmodan")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "stormpike_mtn", id = TODO_NPC("Mountaineer Stormpike"), name = "Mountaineer Stormpike",
  bible = "bibles/loch_roads.md", role = "soldier", tier = "quest",
  communities = { "thelsamar" }, temper = { "gruff" }, values = { "dutiful" },
  notices = { "class" },

  impression = {
    first = "He will tell you about his exploits before you ask.",
    third = "{name} met Mountaineer Stormpike, a grumpy but able Mountaineer of Loch Modan.",
  },

  greetings = {
    { id = "g_post", text = "State yer business, and be quick about it. The kobolds don't wait for pleasantries." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Good, I've work, an' ye've the look o' someone who finishes it." },
    { id = "g_away", when = { away = 14 }, text = "Ye've been gone {away}, an' the kobolds didnae miss ye one bit. I did, a wee bit, fer the work's piled up." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Ye've grown a fair bit o' muscle since ye last took work from me. Nearly enough tae match my own exploits, if ye keep at it." },
    { id = "g_word_intim", when = { word = "intimidated" }, text = "I hear ye've been leanin' on folk about Thelsamar. Lean on the troggs instead, fer they've earned it an' the townsfolk havenae." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "If they do, the earth's got poor taste in friends. They dig as if they've been told where the seams are, I'll grant that, an' they've found silver where my miners passed it over. Clear them out o' the mine, an' if the earth's annoyed about it, it can take it up wi' me." } },
      choices = {
        { text = "Clear them out. The mine belongs to the King.", next = "BACK", reply = "Aye, every seam an' every nugget, an' the kobolds can go dig somewhere the King doesnae want. Clear them out, an' I'll stand ye a pint.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Even kobolds have a claim, if the earth chose them.", next = "BACK", reply = "A claim? They've a claim on my patience, an' that's about all. The earth can choose who it likes, but the mine's on the King's map.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Welcome's a strong word for a dwarf tae use, friend, but I've seen what a gnome warlock can do tae a trogg, an' I'll no' pretend it didnae impress me. Clear the vermin out o' the Silver Stream Mine an' I'll call ye welcome, an' mean it." } },
      choices = {
        { text = "I'll earn it in the mine, Mountaineer.", next = "BACK", reply = "Earn it, aye, an' the lads will remember ye for it. Mind the candles, for the vermin wear them on their heads an' they'll set yer beard alight.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I don't need your welcome. I'll clear it anyway.", next = "BACK", reply = "Clear it anyway, will ye? Then I'll no' waste my welcome, but I'll still be glad o' the work.", fx = { align = { honor = -1 } } },
        { text = "Something else, Mountaineer.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Bears in the hills and boars along the shore, but the best sport is the kobolds, for they scurry like rats and bite like them too. When I was your age I'd bag a dozen before breakfast, and I'll thank you not to check that." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Bears in the hills and boars along the shore, but the best sport is the kobolds, for they scurry like rats and bite like them too. Your {pet} has the look of a fine tracker. Point it at the mine's mouth and it'll smell the candle wax before you see a single kobold." },
      },
      choices = {
        { text = "I hunt for the valley's sake, not for the boasting.", next = "BACK", reply = "Good on ye, for that's the right reason. The valley's quieter every time somebody like ye walks through it.", fx = { align = { honor = 1 } } },
        { text = "I'll bag two dozen, and I'll make sure you hear it.", next = "BACK", reply = "Two dozen! Ha, I'll be listenin' for it, an' I'll want proof, mind, for every hunter in the lodge says the same.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Quiet's well and good in a tunnel, I'll grant ye, for the vermin hear a mail shirt comin' a mile off. In the Second War we had a few of your sort scoutin' the Horde's camps, and half of them came back with better stories than mine." },
      },
      choices = {
        { text = "I'll cut down their leader before the rest wake.", next = "BACK", reply = "Quick an' quiet, aye, an' the rest will scatter like rats. Just make sure ye've a way out before the shoutin' starts.", fx = { align = { honor = -1 } } },
        { text = "I'll face them openly. Vermin or not, it's a fair fight.", next = "BACK", reply = "Fair, against kobolds? Ye're kinder than most, an' braver than ye need be. I'll no' stop ye.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "What's in the mine, exactly?", next = "mine" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "It would, and it'd bring the roof down on the silver and you both. Use yer fire on the kobolds and not the timbers, and mind the candles on their heads, for they're daft enough to catch alight on their own." },
        { id = "xma_gnome", when = { race = "Gnome" }, text = "I heard how Gnomeregan got cleared, an' I'll no' have my mine cleared the same way. Burn the kobolds by all means, but leave the timbers standin', for I want that silver back." },
      },
      choices = {
        { text = "I'll burn only what needs burning, Mountaineer.", next = "BACK", reply = "Good, an' I'll sleep easier knowin' it. The silver's worth more than the kobolds, an' so's yer skull.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "If the roof comes down, the kobolds come down with it.", next = "BACK", reply = "An' you wi' them, an' the silver, an' my whole afternoon. Burn the vermin, no' the beams.", fx = { align = { order = -1 } } },
        { text = "Why does the mine matter so much?", next = "mine_why" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "If they are, it's a part I'd sooner do without. They came up out o' the deep stone, an' they foul every stream an' cave they touch." } },
      choices = {
        { text = "Then they must be driven back.", next = "BACK", reply = "Driven back, aye, down tae whatever hole spat them out. I'll lend ye a rifle if ye mean it.", fx = { align = { honor = 1 } } },
        { text = "Everything has its place, even troggs.", next = "BACK", reply = "Their place is deep under the stone, an' no' in my streams. Tell the troggs that, if ye can find one that listens.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "No' lives yet, thank the Light, but a few fingers an' a deal o' pride, which in a dwarf is near the same thing. If ye want tae say a word over the lads, they drink at the Stoutlager, an' they'll pretend they dinnae need it." } },
      choices = {
        { text = "I'll find them there and say it anyway.", next = "BACK", reply = "Then they'll get it whether they like it or no', an' I'll no' stop ye. They're in the bunkhouse sulkin'.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Pride heals on its own. They don't need me.", next = "BACK", reply = "Aye, it does, mostly, though a dwarf's pride heals slower than his fingers. Leave them tae their sulk, then, an' they'll come out for supper.", fx = { align = { light = -1 } } },
        { text = "Something else, Mountaineer.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Aye, at Dun Algaz when the Horde came at Khaz Modan, an' a paladin o' Lordaeron held the line beside me three days wi'out sleep. I never learned his name, an' I've regretted it every year since." } },
      choices = {
        { text = "Then I'll honour him by holding the line the same way.", next = "BACK", reply = "That's what I'd hope for, an' he'd be glad o' it, wherever he is. Stand where ye're put, an' dinnae budge.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Names don't matter in war. Only who's left standing.", next = "BACK", reply = "They matter tae me, friend, for he's the one I'd have bought a drink. Maybe ye'll learn that someday.", fx = { align = { honor = -1 } } },
        { text = "Something else, Stormpike.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Mountaineer Stormpike, an' I've held this valley against worse than kobolds in my day, by my beard. Still, the vermin in the Silver Stream Mine have got to go, and I've only two hands." },
        { id = "h_paws", when = { questActive = TODO_QUEST("Filthy Paws") },
          text = "The kobolds took our mining gear into the Silver Stream Mine, up north. Get it back before they dull every pick we own." },
        { id = "h_order", when = { questActive = TODO_QUEST("Stormpike's Order") },
          text = "My orders are sealed, so don't go reading them on the road. Get them where they need to go, and fast." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid on the road! Yer kind's welcome here, though I'll warn ye the troggs don't care whether ye're a bear or a dwarf." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, is it? I tracked a cave bear three days through the snow when I was young, and I'd wager you've never bettered that." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest! Good, for there's lads come back from the Silver Stream wi' more than bruises, an' I've no' the words for them." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! I've stood beside yer kind against worse than kobolds, an' I'll tell ye about it, whether ye ask or no'." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock. I've held this valley against worse than kobolds, an' I'll no' turn away help, but keep yer beastie off the mine road." },
        { id = "h_kills", tags = { "news" }, when = { killed = { name = "Tunnel Rat", min = 30 } }, text = "The Tunnel Rats are fewer in the Silver Stream these days, an' I'd wager I know whose work that is. Keep it up, an' the miners might get their tunnels back before winter." },
        { id = "h_mountaineer", when = { origin = "dwarf_mountaineer" },
          text = "Ye walk like ye've kept a pass in the snow, so ye'll be one o' the Dun Morogh lads. Good, for ye'll know there's no glory in this work, only cold feet an' a long watch, an' the vermin never tire before ye do." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, here in the loch? The kobolds in the Silver Stream are the only ones I know who talk tae the earth, an' they mostly ask it for candles." },
        { id = "dd_rats", when = { questDone = TODO_QUEST("Rat Catching") },
          text = "Kadrell says ye've been clearin' tunnel rats in the foothills for him. They're the same filthy lot as my Silver Stream vermin, so ye'll know which end o' them bites." },
      },
      again = {
        { id = "h_again", text = "What else? Speak up, for a kobold caught me by the ear wi' a pick last week an' it's still ringin'." },
        { id = "h_again2", text = "Ask yer question, but keep it short; the Loch road needs watchin'." },
      },
      choices = {
        { text = "Are the troggs a part of nature, Mountaineer?", next = "druid_q", when = { class = "DRUID" } },
        { text = "The Silver Stream Mine seems to be in some trouble.", next = "mine" },
        { text = "I hear you have stories to tell.", next = "stories" },
        { text = "How do you see the Loch these days?", next = "loch" },
        { text = "A warrior reporting, Mountaineer. Where do you want me?", next = "warrior", when = { class = "WARRIOR" } },
        { text = "Kobolds in a mine? I could clear them without a sound.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "A fireball would clear that mine faster than a pick.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Is there game worth tracking near the Silver Stream Mine?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "I'd guess the kobolds have cost you a few good dwarves.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Did you fight beside paladins in the Second War, Mountaineer?", next = "xapala", when = { class = "PALADIN" } },
        { text = "Would a warlock be welcome in Loch Modan, Stormpike?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Do the kobolds really listen to the earth, Mountaineer?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I kept the high passes in Dun Morogh, Stormpike.", next = "xorig_pass", when = { origin = "dwarf_mountaineer" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    xorig_pass = {
      lines = {
        { id = "xop_default", text = "Did ye, now? Then ye've had trolls at yer back an' troggs at yer feet, same as I had at yer age, an' ye'll know never tae let either catch ye with cold fingers. Why'd ye leave the passes, then, when they need every axe they've got?" },
      },
      choices = {
        { text = "The trouble was moving south. I went after it.", next = "xorig_pass2", fx = { trait = { brave = 1 } } },
        { text = "I needed to see more than snow.", next = "xorig_pass2", fx = { trait = { curious = 1 } } },
        { text = "I'd rather not say, Mountaineer.", next = "BACK", fx = { affinity = -1 } },
      },
    },
    xorig_pass2 = {
      lines = {
        { id = "xop2_default", text = "Aye, well, the loch's no' so different, only wetter an' fuller o' kobolds. There's cold work an' plenty of it up at the Silver Stream, an' the pay's no better than the passes." },
      },
      choices = {
        { text = "Then point me at it.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mine = {
      lines = { { id = "m_default", text = "Kobolds drove the miners out an' took the picks with them, the filthy little thieves. Every day that mine sits idle, Ironforge's forges go a bit hungrier." } },
      choices = {
        { text = "Why not send the Mountaineers in?", next = "mine_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mine_why = {
      lines = { { id = "mw_default", text = "Because the troggs keep us busy at every gate, and Dun Algaz eats men like bread. So I hire strangers, and I don't apologise for it." } },
      choices = {
        { text = "Hiring strangers is how the Loch stays free. Good.", next = "mine_end", fx = { align = { order = -1 } } },
        { text = "The King should send more soldiers, not rely on strays.", next = "mine_end", fx = { align = { order = 1 } } },
        { text = "What happens when the mine's clear?", next = "mine_end" },
      },
    },
    mine_end = {
      lines = { { id = "me_default", text = "Then the miners go back, the ore flows, and I find somethin' else to grumble about. That's how it goes in the Loch." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    stories = {
      lines = { { id = "s_default", text = "Mountaineer Kadrell talks too much, but he's no' wrong. I fought orcs in this valley in the Second War, when they held the dam and we took it back stone by stone." } },
      choices = {
        { text = "What was that like?", next = "stories_war" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stories_war = {
      lines = { { id = "sw_default", text = "Cold, loud and long, and I'll no' dress it up for ye. The Loch remembers it, though, if ye look at the broken catapults on the bottom." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    loch = {
      lines = { { id = "l_default", text = "There's troggs to the south, kobolds to the north and Dark Irons sniffin' round the dam. It's a fine place, mind, and that's why it's worth the trouble." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    warrior = {
      lines = { { id = "w_default", text = "At the mine's mouth, with yer shield up and yer mouth shut. I like ye already." } },
      choices = { { text = "Understood, Mountaineer.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Not my concern, {g:lad|lass}. Ask someone with less to do and a shorter beard." } },
    magni = { { id = "tp_magni", text = "King Magni's Mountaineers hold Loch Modan, an' I'm one, an' that's all the speechmakin' I've time for." } },
    troggs = { { id = "tp_troggs", text = "Troggs on the ridges, kobolds in the mine an' me in between. They're no' my concern, the troggs, but they keep makin' themselves my concern." } },
    second_war = { { id = "tp_second_war", text = "I served at the dam in the Second War when the orcs came up the valley, an' I've been guardin' holes in the ground ever since. Now it's kobolds, which is a step down." } },
  },
}

P:NPC {
  key = "cobbleflint", id = TODO_NPC("Mountaineer Cobbleflint"), name = "Mountaineer Cobbleflint",
  bible = "bibles/loch_roads.md", role = "soldier", tier = "quest",
  communities = { "thelsamar" }, temper = { "steady" }, values = { "dutiful" },
  notices = { "race" },

  impression = {
    first = "He wants the troggs thinned before they come over the wall.",
    third = "{name} met Mountaineer Cobbleflint at the south gate of Loch Modan.",
  },

  greetings = {
    { id = "g_tower", text = "Welcome to the south gate, friend. Keep yer weapon handy, for the troggs don't knock." },
    { id = "g_back", when = { metBefore = true }, text = "Back at the gate, are ye? Good. The troggs have been busy, and so should you be." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "From under, an' that's all anybody knows for certain. The League says Uldaman, the miners say anywhere there's a crack, an' the old dwarves say the earth itself is spittin' them out. I dinnae know which, but if ye can tell me the hill before it boils, I'll buy ye every ale in the Stoutlager." } },
      choices = {
        { text = "I'll stand your watch and warn you, Mountaineer.", next = "BACK", reply = "Bless ye, that's all I need. Keep yer ear tae the ground, an' shout if it shakes.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Towers are for soldiers. I'll hunt them below ground.", next = "BACK", reply = "Below ground, aye, where the rest o' my lads willnae go. If ye find where they come up, mark it for me.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      big = true,
      lines = { { id = "xmage_default", text = "Aye, plenty, for the troggs swarm up the slopes at night an' my rifles cannae find them all in the dark. A mage who could light the hillside would let my lads pick them off before they reach the walls." } },
      choices = {
        { text = "I'll light the slopes for your riflemen.", next = "BACK", reply = "Light them, an' my lads will do the rest. That's the best help I've been offered all season.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'd rather burn them myself than light targets.", next = "BACK", reply = "Burn them yerself, aye, but my rifles cannae see what ye're burnin'. Light first, burn after, an' we'll both be happy.", fx = { align = { order = -1 } } },
        { text = "Something else, Mountaineer.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "They drive out anything that can't fight back, and plenty that can, so the bears have moved up toward the ridge. I've watched the boar herds shrink every season since the troggs came up out of the Badlands." } },
      choices = {
        { text = "Then thin the troggs and give the hills back to the beasts.", next = "BACK", reply = "Thin them, aye, an' the bears an' boars will come back down. That's how I'd like it, too.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "The hills have always had predators. Let them settle it.", next = "BACK", reply = "They have, but troggs arenae predators, they're a plague. I'll no' wait for them tae settle anything.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "On the wall facing the Badlands, where the troggs come up the slope in a howling mob every few nights. They're stupid, but there's always more of them, and a warrior who keeps his feet and his shield up is worth five who charge down after them." } },
      choices = {
        { text = "I'll hold my ground and let them break on me.", next = "BACK", reply = "Good, for that's what I need on my wall. Plant yer feet, an' let them see they're runnin' at stone.", fx = { align = { order = 1 } } },
        { text = "I'd rather charge down and break them first.", next = "BACK", reply = "Charge down? Into a mob o' troggs? Ye've the courage o' a dwarf, I'll grant ye, but no' the sense.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Bears and boars, and the odd buzzard picking at whatever the troggs leave behind. But it's the troggs I'd have you track, for they come up from the Badlands by trails I've never found, and I'd dearly like to know where." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Bears and boars, and the odd buzzard picking at whatever the troggs leave behind. That {pet} of yours could follow a trogg's stink back to its hole, I'd wager, and then we'd know where they're coming from." },
      },
      choices = {
        { text = "I'll follow the trail to their hole and face them there.", next = "BACK", reply = "Their hole, aye, an' I'll send ye wi' a rifleman for company. Mind the dark, for troggs see better in it than we do.", fx = { align = { honor = 1 } } },
        { text = "I'll set snares along their trail and let them walk in.", next = "BACK", reply = "Snares! Now there's a hunter's thinkin', an' cheaper than bullets. Set them, an' I'll check them come mornin'.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Count them? I'd settle for knowin' where they come up, for they don't use doors like decent folk. If ye can get close to the Stonesplinter camps and back again with yer skin on, ye'll be the first this month." },
      },
      choices = {
        { text = "I'll scout and report. Killing them sleeping isn't my way.", next = "BACK", reply = "Good, for that's what I need, no' a pile o' bodies tae explain. Bring me the count an' I'll thank ye proper.", fx = { align = { honor = 1 } } },
        { text = "I'll count them, and slit a few throats while I'm there.", next = "BACK", reply = "A few, aye, if ye can do it quiet. I'll no' weep for them, but I'll still want the count.", fx = { align = { honor = -1 } } },
        { text = "Where are the troggs coming from?", next = "troggs" },
      },
    },
    xlock = {
      lines = {
        { id = "xwl_default", text = "I've heard what you lot bargain with, and I'll not have it near my tower, troggs or no troggs. Still, the Stonesplinters have cost me good mountaineers this season, so I'll mind my tongue if ye mind yer imp." },
        { id = "xwl_gnome", when = { race = "Gnome" }, text = "A gnome with a demon at heel, and after what yer people lost under Gnomeregan, I suppose I can see how a body ends up there. Keep the creature away from my tower and do yer killin' out in the hills." },
      },
      choices = {
        { text = "Then I'll do it without the imp, and leave your tower clean.", next = "BACK", reply = "Clean, aye, that's all I ask. Do it yer way wi'out the beastie, an' ye'll be welcome on my tower.", fx = { align = { light = 1 } } },
        { text = "The imp burns troggs all the same, whatever you think of it.", next = "BACK", reply = "It does, I'll grant ye, an' I've seen it. Keep it away from my tower, though, an' we'll call it even.", fx = { align = { light = -1 } } },
        { text = "What lies south of the tower?", next = "south" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "The lads tend each other, wi' bandages an' bad jokes, an' the ones that need more go back tae Thelsamar on a cart. A priest on the tower for a week would save me a dozen cart rides, an' I'd no' say no tae a better joke either." } },
      choices = {
        { text = "Then I'll stay a while and tend whoever needs it.", next = "BACK", reply = "Bless ye, the lads could use it, though they'll no' say so. The bunkhouse is round the back.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Bandages and jokes will do. Save prayers for worse.", next = "BACK", reply = "Aye, bandages an' bad jokes have kept this tower goin' for years. Save yer prayers, then, for when the troggs come in force.", fx = { align = { light = -1 } } },
        { text = "Something else, Cobbleflint.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Ironforge says hold, an' I hold, but every week I hold there's more o' them in the hills. If it were my say, I'd take twenty good dwarves into the Badlands an' find where they're comin' from." } },
      choices = {
        { text = "Ironforge says hold. Then we hold, Mountaineer.", next = "BACK", reply = "Hold we will, then, an' I'll take comfort that someone sees it my way. The King knows best, I suppose.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Ironforge isn't here. Take your twenty and go.", next = "BACK", reply = "An' be hanged for desertin' my post? I'll no' do it, much as I'd like tae. But I thank ye for sayin' it.", fx = { align = { order = -1 } } },
        { text = "Something else, Cobbleflint.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Mountaineer Cobbleflint, an' this tower watches the pass south to the Badlands. The troggs swarm the hills round here like ants on a dropped pie, an' they've about as much sense." },
        { id = "h_def", when = { questActive = TODO_QUEST("In Defense of the King's Lands") },
          text = "The Stonesplinter troggs are out in the hills round the gate, so thin them out for me, an' the King's Lands will be a wee bit safer tonight." },
        { id = "h_done", when = { questDone = TODO_QUEST("In Defense of the King's Lands") },
          text = "The hills are quieter since ye went through them, and my lads are sleepin' sound for once." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior! Good, for I need a shield on the south wall more than I need another letter from Ironforge." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter, eh? A rifle on the tower and a beast at the foot of it would thin the troggs nicely." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest on the south tower! Bless the wall, if ye've a mind, for the troggs have clawed the mortar out o' every course they can reach." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Stand on the south wall a while, for the troggs dinnae like shine, an' I've a mind tae see them squint." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid at my tower! The troggs are swarming the hills again, and if you can talk to bears, tell them to eat a few." },
        { id = "h_magecl", when = { class = "MAGE", faction = "Alliance" }, text = "A mage! Good; the troggs in these hills are thick as stone in the head an' the hide both, an' fire gets through either." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Ye'll feel the troggs comin' before I see them, then. Stand on my tower an' tell me which hill's goin' tae boil over next." },
      },
      again = {
        { id = "h_again", text = "Somethin' else, friend?" },
        { id = "h_again2", text = "Ask away. The gate's no' goin' anywhere, an' neither am I till my relief sobers up." },
      },
      choices = {
        { text = "Where do the troggs come from?", next = "troggs" },
        { text = "What's south of here?", next = "south" },
        { text = "You can't be holding this gate all on your own.", next = "people" },
        { text = "The troggs took my home too.", next = "gnome", when = { race = "Gnome" } },
        { text = "I could get into the trogg camps and count them for you.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "The troggs fear fire. My imp could teach them more.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "Where would you put a warrior on this tower, Mountaineer?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Is there anything worth tracking in these hills besides troggs?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Who tends your wounded out here at the tower, Cobbleflint?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should you take the fight to the troggs, or hold the wall?", next = "xapala", when = { class = "PALADIN" } },
        { text = "The troggs seem to be driving the beasts out of these hills.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "Would a mage be any use on your tower, Cobbleflint?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "Where do the troggs come up from, Cobbleflint?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Stay safe, Mountaineer.", next = "END" },
      },
    },
    troggs = {
      lines = { { id = "t_default", text = "From under the earth, an' the Explorers' League says from somewhere older still, some deep stone nobody's dug to yet. All I know is they keep comin', and they don't stop to talk." } },
      choices = {
        { text = "The Explorers' League must have a theory about them.", next = "troggs_league" },
        { text = "Something else.", next = "BACK" },
      },
    },
    troggs_league = {
      lines = { { id = "tl_default", text = "Prospector Ironband's dig east o' the loch turned up more of them than old stones, so ask him. He'll talk yer ear off about Titans, but there's sense in it somewhere." } },
      choices = {
        { text = "They're beasts. Kill them and be done with it.", next = "troggs_end", fx = { align = { light = -1 } } },
        { text = "If they're kin to us somehow, we should learn why.", next = "troggs_end", fx = { align = { light = 1 } } },
        { text = "And what do you think?", next = "troggs_end" },
      },
    },
    troggs_end = {
      lines = { { id = "te_default", text = "I think a Mountaineer's job is to hold the gate, and the scholars can argue over the bodies. That's enough philosophy for one day." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "troggs" } } } },
    },
    south = {
      lines = { { id = "s_default", text = "The Badlands, dry as an old beard and full of ogres and worse. Prospectors go down there lookin' for riches, and most come back lookin' for water." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    people = {
      lines = { { id = "p_default", text = "Captain Rugelfuss commands here, and he's sharper than he looks. The rest of us are just good dwarves with long watches." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnome = {
      lines = { { id = "gn_default", text = "Aye, and I'm sorry for it. Gnomeregan's troggs and ours might be the same brood, so every one ye put down here is a bit of payback." } },
      choices = { { text = "Then I'll put down plenty.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Can't help ye there, but somebody in Thelsamar might know." } },
    troggs = { { id = "tp_troggs", text = "Troggs come up out o' the ground faster than we can put them back. Ask in Thelsamar where they came from, for I only know where they're goin'." } },
    magni = { { id = "tp_magni", text = "We serve King Magni from this tower, an' he's a good king. Somebody in Thelsamar can tell ye more about him than a gatekeeper can." } },
    dark_iron = { { id = "tp_dark_iron", text = "Dark Irons skulk about near the dam, I hear, but I've only seen troggs on my stretch. Ask Mountaineer Kadrell in Thelsamar; he keeps the posters." } },
  },
}

P:NPC {
  key = "rockgar", id = TODO_NPC("Mountaineer Rockgar"), name = "Mountaineer Rockgar",
  bible = "bibles/loch_roads.md", role = "soldier", tier = "quest",
  communities = { "thelsamar" }, temper = { "sharp" }, values = { "dutiful" },
  notices = { "class" },

  impression = {
    first = "Beyond his pass lie the Wetlands and the Dragonmaw.",
    third = "{name} met Mountaineer Rockgar, who commands the pass at Algaz Station.",
  },

  greetings = {
    { id = "g_pass", text = "Halt, and let me see yer face. Right, ye're no' an orc, so come in." },
    { id = "g_back", when = { metBefore = true }, text = "Ah, it's you. Still in one piece, I see; the last runner came back missing two fingers and his satchel." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "Somethin' that calls fire an' shouts at the sky, an' I'll no' split hairs about what tae name it. I've lost good dwarves at Dun Algaz tae it. If ye're the same sort o' thing in a dwarf's beard, then ye'll know better than me how tae fight it." } },
      choices = {
        { text = "I'm not the same sort. My gift serves Khaz Modan.", next = "BACK", reply = "Good, that's what I wanted tae hear. Use it on the Dragonmaw, an' ye'll find me grateful.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Orc or dwarf, the elements don't care, and neither do I.", next = "BACK", reply = "They might no' care, but I do, an' so do the dwarves I buried. Keep yer distance from my lads.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlock = {
      big = true,
      lines = { { id = "xlock_default", text = "Trolls in the hills, Dragonmaw in the marsh an' mud up tae yer knees, an' that's on a good day. If ye meet any o' the orcs' old dark sort up there, ye'll know better than me what tae do about them, an' I'll leave it tae ye." } },
      choices = {
        { text = "I'll fight them, not learn from them, Rockgar.", next = "BACK", reply = "Fight them, aye, an' learn nothin', for there's nothin' worth learnin'. Ye've a good head on ye.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "I'd learn what I could from them first.", next = "BACK", reply = "Learn first, is it? That's how the orcs came tae their dark sort in the first place. Watch yerself up there, an' come back the same as ye went.", fx = { align = { light = -1 } } },
        { text = "Something else, Mountaineer.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Dragonmaw scouts, mostly, testin' us to see if we've gone soft, and now and then a Mosshide gnoll that's wandered too far from the marsh. The pass is narrow, so one good warrior in the right spot can hold it, and I'd sooner it were you than me some nights." } },
      choices = {
        { text = "Then put me in the narrows. I'll hold it.", next = "BACK", reply = "The narrows it is, an' I'll be glad o' ye. Hold it like ye mean it, an' we'll have no trouble.", fx = { align = { order = 1 } } },
        { text = "I'd sooner go north and hit the Dragonmaw first.", next = "BACK", reply = "North? On yer own? Ye'd have the whole Dragonmaw clan on ye in a day. The pass first, the orcs after.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      lines = {
        { id = "xro_default", text = "Through Dun Algaz? There's Dragonmaw at the north end and Dark Irons pokin' about the hills, and they watch the road, no' the rocks. Keep to the rocks and ye'll reach Menethil with more blood in ye than most who walk it." },
      },
      choices = {
        { text = "I'll walk the road and let them see me coming.", next = "BACK", reply = "Walk the road? Then ye're braver than I'd be, an' maybe dafter. They'll see ye comin', right enough.", fx = { align = { honor = 1 } } },
        { text = "I'll go quiet and leave the orcs none the wiser.", next = "BACK", reply = "Quiet, aye, that's how it's done. Keep tae the rocks, an' ye'll be through before they know it.", fx = { align = { honor = -1 } } },
        { text = "What's waiting in the Wetlands?", next = "wetlands" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "A ward! Aye, if ye could hang it on the rock and leave it there, I'd call it a fine idea. The trouble is that wards need watchin' and mages need sleep, and the Dragonmaw never seem to." },
        { id = "xma_gnome", when = { race = "Gnome" }, text = "A gnome talkin' wards, and ye'd know better than me what holds and what doesn't, after Gnomeregan. But wards need tendin', and I've no gnomes to spare and no mages at all." },
      },
      choices = {
        { text = "Then I'll stand watch here like any mountaineer.", next = "BACK", reply = "Then ye'll stand where I put ye an' sleep when I say. Welcome tae the station, an' dinnae touch my stew.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'm no sentry. I'll burn the orcs where I find them.", next = "BACK", reply = "Burn them, then, an' I'll no' stop ye. But the pass needs watchin' too, an' I've no' enough eyes.", fx = { align = { order = -1 } } },
        { text = "How long have you held this station?", next = "station" },
      },
    },
    druid_q = {
      lines = { { id = "dq_default", text = "I don't dislike the land, only what it does tae my boots. Still, the Dark Irons an' the orcs up there are worse than any swamp." } },
      choices = {
        { text = "The swamp deserves protecting like any forest.", next = "BACK", reply = "Protectin'? It's a swamp! Still, I'll no' argue wi' a druid about what deserves protectin'.", fx = { align = { light = 1 } } },
        { text = "The swamp is only mud and trouble.", next = "BACK", reply = "That's my view entire, though I'll no' say it too loud wi' Wetlands folk about. Mud an' trouble, an' wet boots for good measure.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "More come back hurt than whole, for the marsh fevers get the ones the Dragonmaw miss. I've buried three this season by the station wall, an' I'd like better words said over them than mine." } },
      choices = {
        { text = "I'll say those words before I go north.", next = "BACK", reply = "Thank ye. They were good lads, an' they'd want somebody tae say them proper.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "The marsh claims the careless. Words won't change that.", next = "BACK", reply = "Aye, it does, an' I've seen it. But I said I'd like the words, an' I'll find someone who'll say them.", fx = { align = { light = -1 } } },
        { text = "Something else, Rockgar.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Hold it, for if this station falls there's nothin' between the orcs an' Thelsamar but sheep. I'd dearly like tae march on Grim Batol, mind, but that's a dream for a bigger army than mine." } },
      choices = {
        { text = "Then I'll hold the pass with you. Duty first.", next = "BACK", reply = "Duty first, aye, an' ye'll make a fine mountaineer. Take the north watch; it's quieter at night, if ye dinnae count the wind.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "I'll go north alone if the army won't.", next = "BACK", reply = "Alone? Ye'd be one more name on my wall. I'll no' stop ye, but I'll no' bury ye either.", fx = { align = { order = -1 } } },
        { text = "Something else, Rockgar.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Mountaineer Rockgar, and this is Algaz Station, the last friendly roof before the Wetlands. North of here there's trolls in the hills, orcs in the marsh and mud up to yer knees." },
        { id = "h_report", when = { questActive = TODO_QUEST("Report to Mountaineer Rockgar") },
          text = "Kadrell sent ye, did he? Good, I've been short of able hands since the pass got busy." },
        { id = "h_druidcl", when = { class = "DRUID" },
          text = "A druid at Dun Algaz! If ye're headin' north, ye'll find the Wetlands more tae yer likin' than mine, all swamp an' frogs an' raptors." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "A warrior at Algaz! The pass needs strong arms, for what comes down it from the Wetlands doesn't knock first." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "A priest at Algaz! What comes back down that pass from the Wetlands could use yer prayers, when it comes back at all." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin at Algaz! The Dragonmaw would think twice about the pass wi' the likes o' ye standin' in it." },
        { id = "h_lockcl", when = { class = "WARLOCK", faction = "Alliance" }, text = "A warlock, headin' north? The orcs in that marsh had warlocks o' their own back in the war, so I hope ye're the better sort." },
        { id = "h_smuggler", when = { origin = "dwarf_loch_smuggler" },
          text = "Halt, and let me get a proper look at ye. Aye, I thought so, for I've seen that face slip past this station at midnight wi' a cart o' somethin' that wasnae on any manifest, though this time ye've come in by the front." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman, at Algaz! Ye'll find the Wetlands' earth a sour thing, all mud an' rot, an' the orcs up there call on powers o' their own." },
      },
      again = {
        { id = "h_again", text = "Anythin' else before ye head north?" },
        { id = "h_again2", text = "Speak up. The wind takes half of what ye say up here." },
      },
      choices = {
        { text = "Do you dislike the Wetlands, Mountaineer?", next = "druid_q", when = { class = "DRUID" } },
        { text = "This pass looks a bad place to travel alone.", next = "pass" },
        { text = "What's in the Wetlands?", next = "wetlands" },
        { text = "You have the look of someone long at this post.", next = "station" },
        { text = "I'm a hunter. I can scout the pass.", next = "hunter", when = { class = "HUNTER" } },
        { text = "I can slip through the pass where your patrols can't.", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "A ward might hold the pass for you.", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "What comes down the pass that needs a warrior's arm?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Travellers must come back from the Wetlands hurt, Rockgar.", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "Should Algaz hold the pass, or march north on the Dragonmaw?", next = "xapala", when = { class = "PALADIN" } },
        { text = "What lies north of Algaz Station, Rockgar?", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What powers do the orcs up there call on, Rockgar?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "I stood the watch here once, Rockgar. Grim Batol's smoke still bothers me.", next = "xorig_algaz", when = { origin = "dwarf_dun_algaz_watch" } },
        { text = "Farewell, Rockgar.", next = "END" },
      },
    },
    xorig_algaz = {
      lines = {
        { id = "xoalgaz_default", text = "Aye, an' it bothers me too, for it's never once stopped risin' in all the years I've stood here. I mind yer face from the night roster, though ye had less grey in yer beard then. Did ye ever get a full night's sleep, after?" },
      },
      choices = {
        { text = "Not one, Rockgar.", next = "BACK", fx = { trait = { stern = 1 } } },
        { text = "A few, in Ironforge, with a mug inside me.", next = "BACK", fx = { affinity = 1, trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    pass = {
      lines = { { id = "p_default", text = "Mosshide gnolls and troggs crawl up from the Wetlands side, and they pick off travellers who come through alone. I keep the gate, but I can't watch every rock." } },
      choices = {
        { text = "Holding it with so few can't be easy.", next = "pass_few" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pass_few = {
      lines = { { id = "pf_default", text = "It takes stubbornness, mostly, and a good wall. Ironforge sends what it can, but Gnomeregan and the Dark Irons take the rest." } },
      choices = {
        { text = "Ironforge should hold its borders before anything else.", next = "pass_end", fx = { align = { honor = 1 } } },
        { text = "Then cut what corners you must to survive.", next = "pass_end", fx = { align = { honor = -1 } } },
        { text = "You must need more than a good wall out here.", next = "pass_end" },
      },
    },
    pass_end = {
      lines = { { id = "pe_default", text = "I need hands, and ye've got two of them. Travel the pass in pairs if ye can, and keep to the road." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    wetlands = {
      lines = { { id = "w_default", text = "There's Menethil Harbor on the far coast, and the Dragonmaw orcs at Grim Batol behind it. Between them, there's crocolisks the size of rowboats." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    station = {
      lines = { { id = "s_default", text = "Long enough to know every stone on that wall by its first name. It's a cold post, but it's an honest one." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hunter = {
      lines = { { id = "hu_default", text = "Do that and I'll owe ye a pint in Thelsamar. Watch the ridges, for that's where they wait." } },
      choices = { { text = "I'll keep to the high ground.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Can't say I know. I've been up this pass too long to keep up with gossip." } },
    thandol_span = { { id = "tp_thandol_span", text = "Everythin' that comes down from the Wetlands passes my station, an' lately it's soldiers wi' bandages from the Span. That bridge is costin' us dear." } },
    dragonmaw = { { id = "tp_dragonmaw", text = "The Dragonmaw hold the highland past the pass, an' when the wind's from the north I can smell their smoke from here. I keep the station shut tight on those nights." } },
    magni = { { id = "tp_magni", text = "King Magni wants the pass open an' the road safe, an' I want a fire that stays lit in this wind. One o' us'll get his wish." } },
  },
}

P:NPC {
  key = "bingles", id = TODO_NPC("Bingles Blastenheimer"), name = "Bingles Blastenheimer",
  bible = "bibles/loch_roads.md", role = "questgiver", tier = "quest",
  communities = { "thelsamar" }, temper = { "eager" }, values = { "curious" },
  notices = { "race" },

  impression = {
    first = "He managed to lose almost every one of his tools at once.",
    third = "{name} met Bingles Blastenheimer, a scattered gnome tinkerer camped by the waters of Loch Modan.",
  },

  greetings = {
    { id = "g_camp", text = "Oh! Oh, hello! Have you seen a wrench? Or a hammer? Or anything at all, really?" },
    { id = "g_back", when = { metBefore = true }, text = "You're back! Splendid, and I've only lost two more things since you left." },
  },

  start = "hello",
  nodes = {
    xdsham = {
      big = true,
      lines = { { id = "xdsham_default", text = "I've no idea, but I've exhausted every other option, including shouting at the loch. A dwarf in Thelsamar told me the earth keeps everything you drop and gives it back when it's ready, which sounded very wise until I realised he meant the mud." } },
      choices = {
        { text = "I'll help you search the honest way, on foot.", next = "BACK", reply = "The honest way! That's very sensible, and very slow, but I'm grateful beyond measure. I've drawn a map of where I think they went.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The earth keeps what it finds. Build new ones.", next = "BACK", reply = "Build new ones? Do you know how many hours went into that spanner? I'll find them, thank you, earth or no earth.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xrogue = {
      big = true,
      lines = { { id = "xrogue_default", text = "Well, some of them went off with the troggs and some of them went into the loch, and one is entirely unaccounted for, which is the worst kind of accounted. A rogue with sharp eyes and quick fingers is exactly what I need, so long as the fingers bring things back rather than take them away." } },
      choices = {
        { text = "I'll bring back every piece, Bingles.", next = "BACK", reply = "Every piece! Oh, that's marvellous, you've no idea how much that hammer means to me. It's sentimental, and also slightly explosive.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Finders keepers, Bingles. Mind your tools.", next = "BACK", reply = "Mind my tools? I was minding them, thank you, right up until a trogg minded them better. I'd like them back, please, ideally without bite marks.", fx = { align = { honor = -1 } } },
        { text = "Something else, Bingles.", next = "BACK" },
      },
    },
    xdruid = {
      big = true,
      lines = { { id = "xdruid_default", text = "Some of them, I'm sure, and I'm fairly certain a bear sat on my hammer. I don't blame the animals, exactly, but I do wish they'd stop collecting gnomish engineering." } },
      choices = {
        { text = "Then gather every piece. The loch shouldn't keep your scraps.", next = "BACK", reply = "Every piece, yes, and especially the hammer, if the bear's quite done with it. I've already lost one prototype to the loch, and that was a boat.", fx = { align = { honor = 1 }, affinity = 1 } },
        { text = "Lost tools belong to the loch now. Buy new ones.", next = "BACK", reply = "Buy new ones? With what, my dignity? I'd much rather have the old ones back, if it's all the same to you.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwarcl = {
      big = true,
      lines = { { id = "xwarcl_default", text = "Well, the loch's crawling with things this season: crocolisks on the shore, kobolds in the hills and troggs nosing about the Ironband dig. I'm fairly sure one of them is sitting on my best wrench right now, and I'd much rather a warrior asked for it back than me." } },
      choices = {
        { text = "I'll fetch them back. No payment needed, Bingles.", next = "BACK", reply = "No payment? Oh, you're a gem, a genuine gem, and I'll put your name in my notes as a twelve out of ten.", fx = { align = { honor = 1 } } },
        { text = "I'll fetch them, but an expedition like this pays its guards.", next = "BACK", reply = "Pays its guards, yes, quite right, though my budget is roughly three copper and a sandwich. I'll owe you, if that helps.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhuntcl = {
      big = true,
      lines = {
        { id = "xhuntcl_default", text = "Oh, I should think so! The crocolisks on the shore swallow anything shiny, so my hammer is probably inside one of them, and the kobolds took the rest toward the hills, leaving tracks even I could follow if I knew how to follow tracks." },
        { id = "xhuntcl_pet", when = { pet = { type = "Beast" } }, text = "Oh, I should think so, for the crocolisks on the shore swallow anything shiny, and my hammer is probably inside one of them. Does your {pet} eat crocolisk? If it does, you could feed it and fetch my hammer in the same afternoon, which is very efficient." },
      },
      choices = {
        { text = "I'll follow the tracks carefully and bring everything back.", next = "BACK", reply = "Carefully, yes, please, the reagent pouch is only mostly stable. Thank you, truly.", fx = { align = { order = 1 } } },
        { text = "I'll open crocolisks until your hammer turns up.", next = "BACK", reply = "That's, er, a very thorough approach, and I'm not sure the crocolisks would agree. Do try the shallow ones first, would you?", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmage = {
      lines = {
        { id = "xma_default", text = "Conjured them? Oh, I wish! I'm an engineer, you see, and engineers make things the long way with spanners, which is far more satisfying right up until the murlocs run off with the spanners." },
        { id = "xma_gnome", when = { race = "Gnome" }, text = "Oh, you're one of the arcane lot from the city! I always meant to take a class, but then the troggs came, and then the evacuation, and now my best spanner is in a murloc." },
      },
      choices = {
        { text = "I'll bring back every last bolt, Bingles.", next = "BACK", reply = "Every last bolt! Oh, you're wonderful, and I promise not to blow up the next ones. Well, not intentionally.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "I'll fetch them, though I may keep a gadget for my trouble.", next = "BACK", reply = "Keep a gadget? Er, well, I suppose that's fair, if it's not the hammer. Or the spanner. Or the pouch, actually.", fx = { align = { honor = -1 } } },
        { text = "What's the research for?", next = "research" },
      },
    },
    xlock = {
      lines = {
        { id = "xwl_default", text = "An imp? Er, that's very kind, but the last thing a fellow with flammable reagents wants is a fire demon going through his bags. Perhaps you could fetch them yourself and leave it outside?" },
        { id = "xwl_gnome", when = { race = "Gnome" }, text = "An imp, from a fellow gnome! I suppose after Gnomeregan we all took whatever help we could find, but please keep it well away from my blasting powder." },
      },
      choices = {
        { text = "Then I'll fetch them myself.", next = "BACK", reply = "Oh, thank goodness, and thank you. My eyebrows have only just grown back from the last fire.", fx = { align = { light = 1 } } },
        { text = "The imp goes where I go. It'll behave.", next = "BACK", reply = "It'll behave? That's what Gnoarn said about his prototype, and look where that got his eyebrows. Keep it on a short leash, please.", fx = { align = { light = -1 } } },
        { text = "Who is Gnoarn?", next = "gnoarn" },
      },
    },
    xapriest = {
      big = true,
      lines = { { id = "xapriest_default", text = "Only me, mostly, and once Gnoarn's eyebrows, which grew back crooked, and he's never quite forgiven me. Science has a cost, you see, and I try very hard to make sure I'm the one paying it." } },
      choices = {
        { text = "Then be careful, Bingles. Others' safety matters more than results.", next = "BACK", reply = "They do, yes, you're quite right, and I'll add a third safety valve tonight. Possibly a fourth.", fx = { affinity = 1, align = { light = 1 } } },
        { text = "Progress needs risk. A few eyebrows are a fair price.", next = "BACK", reply = "That's exactly what I told Gnoarn! He didn't agree, but then he had fewer eyebrows to argue with.", fx = { align = { light = -1 } } },
        { text = "Something else, Bingles.", next = "BACK" },
      },
    },
    xapala = {
      big = true,
      lines = { { id = "xapala_default", text = "Well, if it works, it'll tell us whether the rock here can take a proper tunnel, and then a few of our refugees in Ironforge might have somewhere to dig that's their own. If it doesn't work, it'll make a very loud noise, and that's useful too." } },
      choices = {
        { text = "Then I'll see your work done. Your people deserve a home.", next = "BACK", reply = "Thank you, that means more than I can say. Gnomeregan was home, and we'd very much like another one.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "The dwarves gave them a home. They should be grateful.", next = "BACK", reply = "We are grateful, very grateful, and we'd still like a place of our own. You try sleeping in a bed built for someone a foot and a half taller and twice as wide.", fx = { align = { honor = -1 } } },
        { text = "Something else, Bingles.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "I'm Bingles Blastenheimer, inventor, and I'm on a very important geological survey for Gnoarn, my colleague in Tinker Town. Unfortunately, my supplies have wandered off around the loch, and I can't take a single measurement without them." },
        { id = "h_find", when = { questActive = TODO_QUEST("Find Bingles") },
          text = "Gnoarn sent you? Oh, wonderful, he does worry so, and I'm perfectly fine apart from the tools." },
        { id = "h_supplies", when = { questActive = TODO_QUEST("Bingles' Missing Supplies") },
          text = "My wrench, my hammer, my screwdriver and my blastencapper, scattered all over the loch! Find them and you'll be a hero of science." },
        { id = "h_warcl", when = { class = "WARRIOR", faction = "Alliance" }, text = "Oh, a warrior! Splendid, because the things that wandered off with my supplies have teeth, and I don't." },
        { id = "h_huntcl", when = { class = "HUNTER", faction = "Alliance" }, text = "A hunter! You must be good at finding things that have wandered off, which is exactly the skill I'm short of today." },
        { id = "h_apriest", when = { class = "PRIEST", faction = "Alliance" }, text = "Oh, a priest! Could you bless my blastencapper, once we find it? It's never been blessed, and frankly it shows." },
        { id = "h_apaladin", when = { class = "PALADIN" }, text = "A paladin! Marvellous, because if anything with teeth comes back for the rest of my supplies, you can glow at it." },
        { id = "h_druidcl", when = { class = "DRUID", faction = "Alliance" }, text = "A druid! You haven't seen a wrench lying about the loch, have you? Or a screwdriver, or a hammer, or a very important blastencapper?" },
        { id = "h_roguecl", when = { class = "ROGUE", faction = "Alliance" }, text = "A rogue! Oh dear, you didn't happen to borrow my supplies, did you? No, no, of course not; they wandered off on their own, mostly." },
        { id = "h_dshaman", when = { class = "SHAMAN", faction = "Alliance" }, text = "A shaman! Could you ask the earth where my spanner went? And my screwdriver, and my blastencapper, and, well, everything?" },
      },
      again = {
        { id = "h_again", text = "Anything else? I'm listening, mostly, with about seventy percent of my attention, which is very good for me." },
        { id = "h_again2", text = "Yes, yes, what is it? I've a theory brewing, and possibly a small fire, so be quick." },
      },
      choices = {
        { text = "How did you lose everything?", next = "lost" },
        { text = "You must be researching something out here.", next = "research" },
        { text = "Who is Gnoarn?", next = "gnoarn" },
        { text = "A gnome on an expedition ought to have an escort.", next = "gnome", when = { race = "Gnome" } },
        { text = "Couldn't you have just conjured your supplies back?", next = "xmage", when = { class = "MAGE", faction = "Alliance" } },
        { text = "My imp could fetch your things. It's quite good at errands.", next = "xlock", when = { class = "WARLOCK", faction = "Alliance" } },
        { text = "What's guarding your lost supplies, Bingles?", next = "xwarcl", when = { class = "WARRIOR", faction = "Alliance" } },
        { text = "Could a hunter's tracking help you find your supplies?", next = "xhuntcl", when = { class = "HUNTER", faction = "Alliance" } },
        { text = "Has your research ever hurt anyone, Bingles?", next = "xapriest", when = { class = "PRIEST", faction = "Alliance" } },
        { text = "What will your research do for Gnomeregan's people, Bingles?", next = "xapala", when = { class = "PALADIN" } },
        { text = "I'd guess the wildlife carried off some of your tools, Bingles.", next = "xdruid", when = { class = "DRUID", faction = "Alliance" } },
        { text = "How did your supplies wander off, Bingles?", next = "xrogue", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Would the earth really help you find your tools, Bingles?", next = "xdsham", when = { class = "SHAMAN", faction = "Alliance" } },
        { text = "Good luck, Bingles.", next = "END" },
      },
    },
    lost = {
      lines = { { id = "l_default", text = "A small incident with an explosive and a very loud noise, and then a lot of murlocs were involved. I'd rather not talk about the murlocs." } },
      choices = {
        { text = "So the murlocs took your tools.", next = "lost_murlocs" },
        { text = "Something else.", next = "BACK" },
      },
    },
    lost_murlocs = {
      lines = { { id = "lm_default", text = "Some of them, and the rest are lying about the shore where the blast threw them. Murlocs love shiny things, you see, and my tools are very shiny." } },
      choices = {
        { text = "Then the murlocs are thieves. They'll answer for it.", next = "lost_end", fx = { align = { order = 1 } } },
        { text = "You blew up their shore first. Fair's fair.", next = "lost_end", fx = { align = { order = -1 } } },
        { text = "Where should I start looking?", next = "lost_end" },
      },
    },
    lost_end = {
      lines = { { id = "le_default", text = "Along the water to the south, I think, though I wasn't paying close attention while I was flying through the air. Bring back whatever you can find." } },
      choices = { { text = "Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    research = {
      lines = { { id = "r_default", text = "The loch, the dam, the troggs, the water pressure, everything! When you've lost a city, you start studying the ground very closely." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "gnomeregan" } } } },
    },
    gnoarn = {
      lines = { { id = "g_default", text = "My colleague in Tinker Town, and he's convinced I'll blow myself up one day. He's very nearly right, about seventy percent by my own figures, so I've stopped telling him things." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    gnome = {
      lines = { { id = "gn_default", text = "Escort? Oh, cousin, the budget barely covered the explosives. You'll be my escort now, if you like." } },
      choices = { { text = "I suppose I will.", next = "BACK", fx = { affinity = 2 } } },
    },
  },

  topics = {
    _none = { { id = "tp_none", text = "Hmm, fascinating, but I have no idea. Ask me again after I've found my notes." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Gnomeregan! Oh, the workshops were marvellous, and now they're full of troggs and worse, so I've set up beside a lake. Lakes are very nice, though, very reflective." } },
    magni = { { id = "tp_magni", text = "King Magni let us gnomes live in Ironforge after we lost our city, which was terribly kind of him, though his dwarves do complain about the noise. And the smoke, and the occasional small fire." } },
    darkmoon_faire = { { id = "tp_darkmoon_faire", text = "The Faire has a gnome who makes clockwork toys, and I've always wanted to borrow his gears to see how they spin. I'd return them, mostly, eventually." } },
    stonewrought_dam = { { id = "tp_stonewrought_dam", text = "The dam is a lovely bit of engineering, and Chief Engineer Hinderweir won't let me near it with anything that goes bang. I can't think why!" } },
  },
}
