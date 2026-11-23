-- Burning Steppes: folk a roster scan found with no conversation yet. Voice: bibles/burningsteppes.md
local P = RPGDialogueAPI:Pack("rpgd.burningsteppes")
local TODO_NPC = P.TODO_NPC

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
