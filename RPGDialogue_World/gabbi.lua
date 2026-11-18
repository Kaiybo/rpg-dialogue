-- Gabbi Goodwhistle: a goblin peddler and weapon trainer from Gadgetzan who turns up at quest hubs
-- and outside the cities. The wiki records her only from Forever's end-of-beta event, so she lives in
-- the World pack (loaded everywhere) and talks about her trade, not the event. Voice: bibles/gabbi.md
local P = RPGDialogueAPI:Pack("rpgd.world")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

P:NPC {
  key = "gabbi", id = TODO_NPC("Gabbi Goodwhistle"), name = "Gabbi Goodwhistle",
  bible = "bibles/gabbi.md", role = "vendor", tier = "service",
  communities = { "steamwheedle" }, temper = { "chatty", "smooth" }, values = { "greedy", "practical" },
  notices = { "class" },

  impression = {
    first = "Gabbi Goodwhistle sells food, fireworks and suspicious elixirs off a cart, and teaches weapons on the side because, as she put it, a customer who can fight is a customer who comes back. She talked the whole time and never once stopped smiling.",
    third = "{name} met Gabbi Goodwhistle, a goblin peddler and weapon trainer out of Gadgetzan.",
  },

  greetings = {
    { id = "g_default", text = "What can I do for ya, pal? Everything's for sale, includin' advice." },
    { id = "g_back", when = { metBefore = true }, text = "My favourite customer's back! Don't tell the others I said that." },
    { id = "g_goblin", when = { race = "Goblin" }, text = "Hey, cousin! Professional courtesy rates, which are the same rates, but friendlier." },
  },

  notice = {
    { id = "n_warrior", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "Whoa, look at you holdin' that thing like it owes you money! Couple of lessons from me and it'll pay up with interest, sweetheart." },
    { id = "n_mage", cat = "class", when = { class = { "MAGE", "WARLOCK", "PRIEST" } },
      text = "A spellslinger, huh? Listen, listen, a staff's a fine stick to hit folks with when the mana runs out, and the mana always runs out, so let's talk about that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Gabbi Goodwhistle, out of Gadgetzan, purveyor of fine foods, fine fireworks and finer elixirs, and weapon trainer on the side, 'cause a customer who knows which end to hold is a customer who lives to shop again. What can I do for ya?" },
        { id = "h_horde", when = { faction = "Horde" }, text = "Horde, Alliance, I don't check the colours, pal, only the copper. Step right up, and mind the fireworks, they're the red crate, and the red crate's the one that's smokin'." },
      },
      again = { { id = "h_again", text = "Anything else, pal? Time's money, and you're spendin' mine real nicely." } },
      choices = {
        { text = "What's in these elixirs?", next = "elixirs" },
        { text = "Why travel all over with a cart?", next = "cart" },
        { text = "You sell to both sides?", next = "sides" },
        { text = "Show me your goods, or teach me a weapon.", next = "BUSINESS" },
        { text = "Not today, Gabbi.", next = "END" },
      },
    },
    elixirs = {
      lines = { { id = "el_default", text = "Good stuff, mostly from Gadgetzan, like the Noggenfogger, which might make you a skeleton for an hour, or tiny, or let you float, and that's half the fun. The Endless Experience one, now, that's a premium product, and I'm legally obliged not to say what's in it." } },
      choices = {
        { text = "Legally obliged by whom?", next = "elixirs2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elixirs2 = {
      lines = { { id = "e2_default", text = "By my cousin's lawyer, who is also my cousin, and also, coincidentally, the fella who brews it. Keeps the overhead low, sweetheart, and the liability somewhere else." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    cart = {
      lines = { { id = "ca_default", text = "'Cause the customers are wherever the trouble is, pal, and trouble moves around. A crossroads with a monster problem is a crossroads full of folks who suddenly need bread, bandages and a quick lesson with a sword, and I'm the gal with all three." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    sides = {
      big = true,
      lines = { { id = "si_default", text = "Sure I do, 'cause the Steamwheedle way is everybody's money spends the same, and a war's just a lotta customers in two colours. You got a problem with that, or you want some bandages?" } },
      choices = {
        { text = "Arming both sides of a war isn't honest trade.", next = "BACK", reply = "Honest? Pal, honest is when the bandages actually stop the bleedin', and mine do, so you can take your moral ledger somewhere it'll balance and leave the rest of us to make a livin'.", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Smart. Coin doesn't pick a side.", next = "BACK", reply = "Now there's a valued customer if ever I saw one, and I'm writin' that down, so next time the shootin' starts you come see Gabbi before the other guy does.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "steamwheedle" } } },
      },
    },
  },

  topics = {
    trade = { { id = "tp_trade", text = "Food, drink, fireworks, elixirs and weapon lessons, pal. One-stop shop, and the stop moves." } },
    steamwheedle = { { id = "tp_sw", text = "Best employer in the world, if you like workin' for yourself and payin' your boss for the privilege. I wouldn't trade it for a throne." } },
    _none = { { id = "tp_none", text = "Never heard of it, sweetheart, and if I can't sell it, I don't need to." } },
  },
}
