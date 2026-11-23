-- Redridge folk with no conversation yet: Bernard Brubaker, who sells leather armour from a hill
-- east of Stonewatch Falls.
local P = RPGDialogueAPI:Pack("rpgd.redridge")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Bernard Brubaker: leather armor merchant on the hill east of Stonewatch Falls.
P:NPC {
  key = "rr_bernard_brubaker", id = TODO_NPC("Bernard Brubaker"), name = "Bernard Brubaker", title = "Leather Armor Merchant", gender = "male",
  role = "vendor", tier = "service",
  communities = { "lakeshire" }, temper = { "gruff", "wry" }, values = { "practical", "brave" },
  notices = { "kit", "craft" },
  impression = {
    first = "He sells armour on a hill nobody sane would camp on.",
    third = "{name} met Bernard Brubaker, who sells leather armour on a hill east of Stonewatch Falls.",
  },
  greetings = {
    { id = "g_default", text = "Customer! Come up, come up, and keep your head down, because the gnolls throw rocks at anything that moves on this hill." },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and still breathing. That's a fine advertisement for my leathers, that is." },
  },
  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "You work leather yourself, I can tell from your fingers. Then you'll know good stitching when you see it, so look closely." },
    { id = "n_torn", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That armour's seen better days, friend, and so have you. Buy something before the next gnoll finishes the job." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "Bernard Brubaker, leather armour for the bold and the unlucky. I set up out here because nobody fights the Redridge gnolls in their Sunday best, and they all come past this hill sooner or later." } },
      again = {
        { id = "h_again", text = "What else? Make it quick, I've a rock-thrower to watch." },
        { id = "h_again2", text = "Go on, ask, but keep an eye on the ridge for me." },
      },
      choices = {
        { text = "Why sell out here, instead of Lakeshire?", next = "why" },
        { text = "What's happening at Stonewatch?", next = "stonewatch" },
        { text = "Let me see the leathers.", next = "BUSINESS" },
        { text = "Good luck up here, Bernard.", next = "END" },
      },
    },
    why = {
      lines = { { id = "w_default", text = "Lakeshire's got shops enough, and the folk there buy fish, not armour. Out here every fighter who's lost a jerkin to a gnoll comes stumbling past, and I'm the only merchant for a mile who isn't a corpse." } },
      choices = {
        { text = "Profiting from the war, then.", next = "profit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    profit = {
      lines = { { id = "p_default", text = "Somebody has to, and better a man who sells honest leather than one who sells shoddy goods at Lakeshire prices. I've kept more fools alive with my stitching than the Redridge watch ever has." } },
      choices = {
        { text = "An honest trade is honest, wherever it's done.", next = "BACK", reply = "That's it exactly. You've a head on your shoulders, keep it there.", fx = { align = { honor = 1 } } },
        { text = "A clever man finds the gap and fills it.", next = "BACK", reply = "Clever, honest, whichever. I fill the gap and the gap pays well.", fx = { align = { honor = -1 } } },
      },
    },
    stonewatch = {
      lines = { { id = "s_default", text = "The Blackrock orcs have the keep, and the gnolls run their errands, and the whole valley below's crawling with both. Magistrate Solomon keeps writing to Stormwind for soldiers, and Stormwind keeps not sending them.", fx = { learn = { "stonewatch_keep", "redridge_gnolls" } } } },
      choices = { { text = "Then I'll clear a few myself. Something else.", next = "BACK" } },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "Tanner's son from Lakeshire. I learned the trade from my father, and the nerve from somewhere else entirely." } },
    _none = { { id = "tp_none", text = "Couldn't say, friend. Ask in Lakeshire, they've time for gossip down there." } },
  },
}
