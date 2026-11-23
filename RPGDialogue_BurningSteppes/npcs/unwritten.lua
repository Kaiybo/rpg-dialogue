-- Burning Steppes: folk a roster scan found with no conversation yet. Voice: bibles/burningsteppes.md
local P = RPGDialogueAPI:Pack("rpgd.burningsteppes")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Expeditionary Priest: Ironforge dwarf priests camped at Draco'dar in the far southwest of the Steppes.
P:NPC {
  key = "bs_expeditionary_priest", id = TODO_NPC("Expeditionary Priest"), name = "Expeditionary Priest",
  bible = "bibles/burningsteppes.md", role = "priest", tier = "service",
  communities = { "dracodar" }, temper = { "steady", "warm" }, values = { "faith", "duty" },
  notices = { "class" },
  impression = {
    first = "A dwarf priest of the Ironforge expedition camped at Draco'dar, as far from any road as a dwarf can get in the Burning Steppes. Soot sat in every line of the priest's face.",
    third = "{name} met an Ironforge expeditionary priest at Draco'dar in the Burning Steppes.",
  },
  greetings = {
    { id = "g_default", text = "Light's blessing on ye, traveller, an' how in the world did ye find us out here? Nobody comes to Draco'dar but dragons an' the odd lost gryphon." },
    { id = "g_back", when = { metBefore = true }, text = "Ye found us twice! Either ye've a fine sense o' direction or the Light's playin' a joke on the both of us." },
  },
  notice = {
    { id = "n_priest", cat = "class", when = { class = "PRIEST" },
      text = "A fellow servant o' the Light! Ye'll understand, then, why a priest walks wi' the diggers, for there's no place in the world that needs blessin' more than this." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "We're the expedition's priests, sent from Ironforge to keep the diggers whole an' their spirits up. The Steppes burn day an' night, an' between the Blackrock orcs an' the black dragons, there's always someone in need o' mendin'." } },
      again = { { id = "h_again", text = "Aye, what else is on yer mind?" } },
      choices = {
        { text = "What is the expedition looking for here?", next = "dig" },
        { text = "How do you keep faith in a place like this?", next = "faith" },
        { text = "The Steppes look dead from the air.", next = "steppes" },
        { text = "Light keep you.", next = "END" },
      },
    },
    dig = {
      lines = { { id = "d_default", text = "Old things, an' answers about them, the way the Explorers' League is always after. There were dwarves in these lands before Thaurissan's folly set them burnin', an' we'd like to know what's left before the dragons take it all." } },
      choices = {
        { text = "Some ruins should stay buried.", next = "BACK", reply = "Maybe so, but I'd rather know what's under my feet than guess. Ignorance never saved a dwarf yet.", fx = { align = { order = 1 } } },
        { text = "Dig it all up. History belongs to Ironforge.", next = "BACK", reply = "That's the League talkin', an' I'll not argue wi' ye. Just mind ye don't dig up a dragon.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    faith = {
      lines = { { id = "f_default", text = "Same as anywhere, one prayer at a time. When a lad comes in wi' burns from Blackrock Mountain an' walks out again on his own feet, I don't need a sermon to tell me the Light's still here." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    steppes = {
      lines = { { id = "s_default", text = "Dead an' burnin', aye, ever since the Dark Irons called up Ragnaros an' the mountain split open. Morgan's Vigil holds the east, an' we hold this wee corner, an' the rest belongs to the orcs an' the flame." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Ironforge raised me an' the Light called me, an' the expedition sent me somewhere hot." } },
    _none = { { id = "tp_none", text = "I'm a healer, not a scholar, friend. Ask the diggers, they never stop talkin'." } },
  },
}

-- Elder Dawnstrider: an ancestor spirit honoured during the Lunar Festival. She stands, improbably, at Flame Crest in the ash of the Burning Steppes.
P:NPC {
  key = "bs_elder_dawnstrider", id = 15585, name = "Elder Dawnstrider", gender = "female",
  role = "questgiver", tier = "quest",
  temper = { "serene", "patient" }, values = { "ancestors", "tradition" },
  notices = { "race", "travel" },
  impression = {
    first = "A tauren spirit, very far from the plains, standing in the ash.",
    third = "{name} paid respects to Elder Dawnstrider, an elder spirit honoured at the Lunar Festival.",
  },
  greetings = {
    { id = "g_default", text = "Even here, in all this smoke, the new year comes. Welcome, {class}, to an old walker's strange resting place." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The new moon of the year is upon us, and the Lunar Festival with it. Few walk this far to honor an elder, and I will not forget it." },
    { id = "g_back", when = { metBefore = true }, text = "You return to the ash and the old walker. The Earth Mother is patient, and so am I." },
    { id = "g_done", when = { questDone = TODO_QUEST("Dawnstrider the Elder") }, text = "You have my coin already. Carry it out of this burnt land and somewhere green." },
  },
  notice = {
    { id = "n_race", cat = "race", when = { race = "Tauren" }, text = "A child of the plains, here among the dragons and the fire? You are braver than you are sensible." },
  },
  start = "hello",
  nodes = {
    hello = {
      narr = "She looks out over the blackened Steppes, and the ash does not settle on her.",
      lines = { { id = "h_default", text = "I am Elder Dawnstrider, and in life I walked every road a tauren could find, from the Barrens to the far mountains. The Lunar Festival honours me, and it seems my wandering did not stop when my heart did." } },
      again = { { id = "h_again", text = "Ask, {class}. A walker always has time to talk." } },
      choices = {
        { text = "Who were you, in life?", next = "life" },
        { text = "What is the Lunar Festival, Elder?", next = "festival" },
        { text = "I have come to pay my respects.", next = "respects" },
        { text = "My people fought orcs here once, Elder.", next = "kin", when = { faction = "Alliance" } },
        { text = "Rest well, Elder.", next = "END" },
      },
    },
    life = {
      lines = { { id = "l_default", text = "I walked at dawn and slept at dusk, and I saw more of this world than most of my people ever will. I saw these Steppes green, before the Dark Iron fire burned them, and I grieve for them still." } },
      choices = {
        { text = "And what holds you here now?", next = "holds" },
        { text = "Something else.", next = "BACK" },
      },
    },
    holds = {
      lines = { { id = "ho_default", text = "My wandering holds me, and those who remember my stories. Somewhere there is a young tauren who heard of me and decided to see the world; while that one walks, so do I." } },
      choices = {
        { text = "The old ways deserve honour. I'm glad they're kept.", next = "BACK", reply = "Good. Respect for the old ones is a road too, and it leads somewhere warm.", fx = { align = { order = 1 } } },
        { text = "The dead should rest. The living make their own way.", next = "BACK", reply = "Make your own way, then, but walk it at dawn. That is the best advice an old wanderer has.", fx = { align = { order = -1 } } },
      },
    },
    festival = {
      lines = { { id = "f_default", text = "It is the turning of the year under the full moon, when every people honours its elders. The living give us their respect, and we give them a little luck and the coin of our line." } },
      choices = {
        { text = "Why do the elders gather in Moonglade?", next = "moonglade" },
        { text = "Something else.", next = "BACK" },
      },
    },
    moonglade = {
      lines = { { id = "m_default", text = "Moonglade is where the festival burns brightest, and every elder feels it calling. I will go, in time, but I wanted to see one more strange land first." } },
      choices = { { text = "Then I'll look for you there. Something else.", next = "BACK" } },
    },
    respects = {
      lines = { { id = "r_default", text = "Then I thank you for coming all this way through the fire, and I give you the coin of my line. Walk well, and walk out of here soon." } },
      choices = {
        { text = "Your memory will be kept, Elder.", next = "END", fx = { affinity = 1 } },
        { text = "Something else first.", next = "BACK" },
      },
    },
    kin = {
      lines = { { id = "k_default", text = "Then your grandfathers and mine stood on opposite sides of more than one war. Tonight there are only the honoured dead, and the living who remember them." } },
      choices = { { text = "I'll remember that. Something else.", next = "BACK" } },
    },
  },
  topics = {
    _none = { { id = "tp_none", text = "I never walked that road, {class}. Perhaps you will." } },
  },
}
