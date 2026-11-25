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
    first = "She says a customer who can fight is a customer who returns.",
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
      again = {
        { id = "h_again", text = "Anything else, pal? Time's money, and you're spendin' mine real nicely." },
        { id = "h_again2", text = "Keep 'em comin', sweetheart, every question's one step closer to a sale." },
      },
      choices = {
        { text = "What's in these elixirs?", next = "elixirs" },
        { text = "Why travel all over with a cart?", next = "cart" },
        { text = "You sell to both sides?", next = "sides" },
        { text = "Where'd a peddler learn to teach weapons?", next = "weapons" },
        { text = "What's Gadgetzan like?", next = "gadgetzan" },
        { text = "I prefer a bow, or a gun, to anything up close.", next = "ranged", when = { class = "HUNTER" } },
        { text = "Got anything a rogue would appreciate?", next = "rogue", when = { class = "ROGUE" } },
        { text = "Show me your goods, or teach me a weapon.", next = "BUSINESS" },
        { text = "Not today, Gabbi.", next = "END" },
      },
    },
    elixirs = {
      lines = { { id = "el_default", text = "Good stuff, mostly from Gadgetzan, like the Noggenfogger, which might make you a skeleton for an hour, or tiny, or let you float, and that's half the fun. The Endless Experience one, now, that's a premium product, and I'm legally obliged not to say what's in it." } },
      choices = {
        { text = "Legally obliged by whom?", next = "elixirs2" },
        { text = "A skeleton? Is that safe?", next = "noggen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    elixirs2 = {
      lines = { { id = "e2_default", text = "By my cousin's lawyer, who is also my cousin, and also, coincidentally, the fella who brews it. Keeps the overhead low, sweetheart, and the liability somewhere else." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { skeptical = 1 } } } },
    },
    noggen = {
      lines = { { id = "no_default", text = "Safe as houses, pal, and in Gadgetzan houses blow up maybe twice a year, so that's real safe. Baron Noggenfogger sells it right there in town, what goes in it is between him and the desert, and nobody's ever stayed a skeleton, or at least nobody's complained." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "gadgetzan" } } } },
    },
    cart = {
      lines = { { id = "ca_default", text = "'Cause the customers are wherever the trouble is, pal, and trouble moves around. A crossroads with a monster problem is a crossroads full of folks who suddenly need bread, bandages and a quick lesson with a sword, and I'm the gal with all three." } },
      choices = {
        { text = "Doesn't the trouble ever find you?", next = "cart_trouble" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cart_trouble = {
      lines = { { id = "ct_default", text = "All the time, sweetheart, and that's why the red crate's full of fireworks. A bandit sees a lone goblin and a cart, he thinks payday, and then he sees a rocket comin' at his face, and he thinks about a career change real fast." } },
      choices = {
        { text = "Have you ever actually hit one?", next = "cart_hit" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cart_hit = {
      lines = { { id = "ch_default", text = "Hit one? I set his hat on fire outside the Crossroads, and then I sold him a bandage and a new hat, and he tipped. Best day of business I had all season, pal, and that's the Steamwheedle spirit right there." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { witty = 1 } } } },
    },
    sides = {
      big = true,
      lines = { { id = "si_default", text = "Sure I do, 'cause the Steamwheedle way is everybody's money spends the same, and a war's just a lotta customers in two colours. You got a problem with that, or you want some bandages?" } },
      choices = {
        { text = "Arming both sides of a war isn't honest trade.", next = "BACK", reply = "Honest? Pal, honest is when the bandages actually stop the bleedin', and mine do, so you can take your moral ledger somewhere it'll balance and leave the rest of us to make a livin'.", fx = { affinity = -1, align = { honor = 1 } } },
        { text = "Smart. Coin never picks a side.", next = "BACK", reply = "Now there's a valued customer if ever I saw one, and I'm writin' that down, so next time the shootin' starts you come see Gabbi before the other guy does.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "Something else.", next = "BACK", fx = { learn = { "steamwheedle" } } },
      },
    },
    weapons = {
      lines = { { id = "we_default", text = "On the job, pal. You don't sell knives in Gadgetzan for ten years without learnin' which end goes in the other fella, and the Arena boys down in Stranglethorn taught me the rest for the price of a crate of elixirs. Every weapon's just a tool, and I know tools." } },
      choices = {
        { text = "The Gurubashi Arena? You fought there?", next = "weapons_arena" },
        { text = "Something else.", next = "BACK" },
      },
    },
    weapons_arena = {
      lines = { { id = "wa_default", text = "Fought? Sweetheart, I sold snacks there, which is way more dangerous, 'cause the crowd's hungrier than the fighters. But you watch a few hundred fights from the cheap seats with a tray of sausages, and you pick up what works, and you charge for it." } },
      choices = { { text = "Something else.", next = "BACK", fx = { learn = { "gurubashi_arena" } } } },
    },
    gadgetzan = {
      lines = { { id = "gz_default", text = "Hot, sandy, loud and run by the best-paid guards in Kalimdor, and you'll never meet a nicer bunch of crooks. Everybody's sellin', everybody's buyin', and the Bruisers make sure nobody shoots anybody inside the walls, which is a real comfort when you're carryin' fireworks." } },
      choices = {
        { text = "Why leave a town like that?", next = "gadgetzan_leave" },
        { text = "Something else.", next = "BACK", fx = { learn = { "gadgetzan" } } },
      },
    },
    gadgetzan_leave = {
      lines = { { id = "gl_default", text = "'Cause in Gadgetzan there's ten sellers for every buyer, pal, and out here there's ten buyers and only me. Simple arithmetic, and arithmetic's the only religion a goblin needs, though I keep a lucky coin too, just in case." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    ranged = {
      lines = { { id = "ra_default", text = "Sure, sure, until somethin' gets close, and somethin' always gets close, pal, usually the thing with the most teeth. So you learn a polearm or a sword for the bad minute, and I teach it cheap, and you live to shoot another day." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    rogue = {
      lines = { { id = "ro_default", text = "Ha, look at you with the soft boots and the shifty eyes, I love it. Daggers I can teach, poisons I ain't allowed to sell, and anything that fell off a wagon, I've never heard of, and I'll be sure to forget you asked." } },
      choices = { { text = "Something else.", next = "BACK", fx = { trait = { discreet = 1 } } } },
    },
  },

  topics = {
    trade = { { id = "tp_trade", text = "Food, drink, fireworks, elixirs and weapon lessons, pal. One-stop shop, and the stop moves." } },
    steamwheedle = { { id = "tp_sw", text = "Best employer in the world, if you like workin' for yourself and payin' your boss for the privilege. I wouldn't trade it for a throne." } },
    gadgetzan = { { id = "tp_gz", text = "Home, sweet home, if home was a sandpit full of salesmen. I love it, and I love it best from far away." } },
    _none = { { id = "tp_none", text = "Never heard of it, sweetheart, and if I can't sell it, I don't need to." } },
  },
}
