-- Thunder Bluff, the lower rise: the other two bankers, the auctioneers, the guild lodge, the
-- shopkeepers around the lifts, and the hands at Karn's Smithy. Voices: bibles/missed.md
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Auctioneer Stampi: auctioneer on the lower rise, the lively one.
---------------------------------------------------------------------------
P:NPC {
  key = "auctioneer_stampi", id = TODO_NPC("Auctioneer Stampi"), name = "Auctioneer Stampi", gender = "male",
  bible = "bibles/missed.md", role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "cheerful", "eager" }, values = { "trade", "community" },
  notices = { "craft" },
  impression = {
    first = "Auctioneer Stampi is younger than his partner Gullem and a good deal louder, and he takes a child's delight in every strange thing that crosses the auction floor. He has a habit of stamping one hoof when a bid goes up.",
    third = "{name} met Auctioneer Stampi, the livelier of Thunder Bluff's auctioneers.",
  },
  greetings = {
    { id = "g_hi", text = "Come in, come in, {class}! There are things on the floor today that I have never seen before, and I have been here since sunrise." },
    { id = "g_back", when = { metBefore = true }, text = "You are back! Have you brought anything from far away, or have you come to carry something off?" },
  },
  notice = {
    { id = "n_craft", cat = "craft", when = { profession = "Engineering" },
      text = "You smell of oil and black powder, friend, so you must be an engineer. Please tell me you have something that whirrs to sell." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Stampi, and I take the lots Gullem has no patience for, which is anything that glows, ticks or came off a ship. He says I shout too much, but nobody has ever missed a bid of mine." },
      },
      again = {
        { id = "h_again", text = "What else, friend? Ask quickly, before something interesting comes in." },
        { id = "h_again2", text = "Yes, {class}? I am listening with one ear, I promise." },
      },
      choices = {
        { text = "Show me the lots.", next = "BUSINESS" },
        { text = "What's the strangest thing you've sold?", next = "strange" },
        { text = "You and Gullem seem an odd pair.", next = "gullem" },
        { text = "Good trading, Stampi.", next = "END" },
      },
    },
    strange = {
      lines = { { id = "st_default", text = "A goblin once brought up a brass bird that walked by itself and laid a little brass egg every hundred steps. Three hunters bid against each other for it, and I do not think any of them knew what they wanted it for." } },
      choices = {
        { text = "Who won it?", next = "won" },
        { text = "Something else.", next = "BACK" },
      },
    },
    won = {
      lines = { { id = "w_default", text = "A troll from Sen'jin, who said his loa would find it funny. I hope they did, because it walked straight off the edge of the rise the next morning, and we were finding eggs at the bottom for a month." } },
      choices = { { text = "A fitting end. Something else.", next = "BACK" } },
    },
    gullem = {
      lines = { { id = "gu_default", text = "He is the slow river and I am the rain, or so my mother puts it. He taught me that a price called too quickly cheats the seller, and I have nearly learned it." } },
      choices = { { text = "Nearly is something. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I grew up on the long walk and never saw a shop until I was grown, so perhaps that is why I like them so much." } },
    _none = { { id = "tp_none", text = "I have never seen one come across the floor, {class}, though I would dearly like to." } },
  },
}
