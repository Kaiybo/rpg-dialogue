-- Moonglade folk with no conversation until now: Bessany Plainswind, a tauren of the Cenarion Circle in Nighthaven.
local P = RPGDialogueAPI:Pack("rpgd.moonglade")
local TODO_NPC = P.TODO_NPC

---------------------------------------------------------------------------
-- Bessany Plainswind
---------------------------------------------------------------------------
P:NPC {
  key = "mg_bessany", id = TODO_NPC("Bessany Plainswind"), name = "Bessany Plainswind",
  role = "citizen", tier = "service", race = "Tauren",
  communities = { "nighthaven" }, temper = { "warm", "serene" }, values = { "nature", "balance" },
  impression = {
    first = "A tauren of the Cenarion Circle, at ease among the night elves of Nighthaven.",
    third = "{name} met Bessany Plainswind, a tauren of the Cenarion Circle in Nighthaven.",
  },
  greetings = {
    { id = "g_default", text = "Peace, little one. In Moonglade, no one needs a weapon in hand." },
    { id = "g_druid", when = { class = "DRUID" }, text = "A druid! Welcome home, then, for every druid's home is here, whatever their tribe." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Bessany Plainswind of Mulgore. I came to Nighthaven to learn the ways of the Cenarion Circle, and I stayed because the moon shines kinder here than anywhere else." },
        { id = "h_nelf", when = { race = "NightElf" }, text = "Your people taught mine the druid's path, long ago. I thank them every day, and I thank you now." },
      },
      again = {
        { id = "h_again", text = "What more would you ask?" },
        { id = "h_again2", text = "Speak freely. Moonglade listens kindly." },
      },
      choices = {
        { text = "Do the night elves treat you as an equal here?", next = "equal" },
        { text = "What makes Moonglade special?", next = "glade" },
        { text = "Farewell, Bessany.", next = "END" },
      },
    },
    equal = {
      lines = { { id = "eq_default", text = "Here they do. Outside Moonglade, the Horde and the Alliance quarrel, but within it we are only druids, and Keeper Remulos would have it no other way." } },
      choices = {
        { text = "The Circle should stay above the war.", next = "BACK", reply = "Yes. If we take sides, who will speak for the land?", fx = { align = { honor = -1 } } },
        { text = "Sooner or later, everyone must pick a side.", next = "BACK", reply = "Perhaps. But I pray that day is far away.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    glade = {
      lines = { { id = "gl_default", text = "It is a holy place, guarded by Remulos, son of Cenarius. The Emerald Dream lies very close here, and some nights, if you listen, you can almost hear it." } },
      choices = {
        { text = "What is the Emerald Dream?", next = "dream" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dream = {
      lines = { { id = "dr_default", text = "The world as it was meant to be, before anyone touched it. The elder druids walk there in their sleep. I am not yet wise enough to follow them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}
