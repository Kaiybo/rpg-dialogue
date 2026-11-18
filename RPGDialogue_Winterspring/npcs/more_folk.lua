-- More of Winterspring: Bronn Fitzwrench, the goblin outside Everlook who lets those in the Cartel's bad books
-- buy their way back with runecloth and coal (Making Amends). Voice: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.winterspring")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Bronn Fitzwrench
---------------------------------------------------------------------------
P:NPC {
  key = "bronn", id = TODO_NPC("Bronn Fitzwrench"), name = "Bronn Fitzwrench",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "everlook" }, temper = { "brisk", "shrewd" }, values = { "profit", "practical" },
  notices = { "reputation", "craft" },
  impression = {
    first = "Bronn Fitzwrench stands outside Everlook selling forgiveness by the bolt of runecloth and the lump of coal. He is in a hurry, cold, and entirely unembarrassed about putting a price on redemption.",
    third = "{name} met Bronn Fitzwrench, the goblin outside Everlook who sells the Cartel's forgiveness for runecloth and coal.",
  },
  greetings = {
    { id = "g_default", text = "What can I do for ya, pal? Make it quick, I don't have all day, and my toes are gettin' frostbit standing here." },
    { id = "g_back", when = { metBefore = true }, text = "You again! Either you're back to settle up, or you did somethin' else bad, and either way I'm listening." },
    { id = "g_active", when = { questActive = TODO_QUEST("Making Amends") }, text = "Runecloth and coal, chum, that's the price. Bring it and we'll talk about your good name." },
    { id = "g_done", when = { questDone = TODO_QUEST("Making Amends") }, text = "Look at you, on the quick path to redemption! Keep the payments comin' and the town'll forget all about it." },
  },
  notice = {
    { id = "n_hated", cat = "reputation", when = { reputation = { faction = "Everlook", max = "unfriendly" } },
      text = "Whoa, whoa, the guards were pointin' at you when you came up the road. Whatever you did to us or our friends, it was bad, and I'm the fella who can fix it." },
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "A tailor! You've got runecloth comin' out of your ears, I bet, and I happen to be in the market for exactly that." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Bronn Fitzwrench, at your service, for a price. Folks who've crossed the Cartel come to me when Everlook won't let 'em through the gate, and I give 'em a way back into our good graces." },
        { id = "h_hated", when = { reputation = { faction = "Everlook", max = "unfriendly" } },
          text = "You must've done somethin' really bad to us or our friends, pal, and I don't wanna know what. At any rate, I'm here to offer you a way back, and it's a good deal, I promise." },
        { id = "h_done", tags = { "news" }, when = { questDone = TODO_QUEST("Making Amends") },
          text = "Every bundle you bring warms a few goblin toes and cools a few goblin tempers, and that's what I call a healthy return. Booty Bay and Gadgetzan hear about it too, ya know." },
      },
      again = {
        { id = "h_again", text = "What else? Time's money, and my feet are ice." },
        { id = "h_again2", text = "Go on, go on, I'm listenin'. Talk fast, though." },
      },
      choices = {
        { text = "What do you want from me?", next = "price" },
        { text = "Why runecloth and coal?", next = "cold" },
        { text = "So forgiveness is for sale?", next = "forgive" },
        { text = "Who's going to be cross about it?", next = "enemies" },
        { text = "I've done nothing to the Cartel.", next = "innocent", when = { reputation = { faction = "Everlook", min = "friendly" } } },
        { text = "I'll be going.", next = "END" },
      },
    },
    price = {
      lines = { { id = "pr_default", text = "Runecloth, a nice thick bundle of it, and four lumps of coal, and I put in a good word for you with Everlook. Do it enough times and you're right back in good standing, no questions asked, no hard feelings, or at least fewer of 'em." } },
      choices = {
        { text = "How many times is enough?", next = "times" },
        { text = "Something else.", next = "BACK" },
      },
    },
    times = {
      lines = { { id = "ti_default", text = "Depends how bad you were, pal. Some folks come by once and they're square, and some folks I've seen so often I've started savin' 'em a chair. I'm not judging, I'm keeping books." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    cold = {
      lines = { { id = "co_default", text = "Have you felt this place? Winterspring's cold enough to freeze the gears in your pocket watch, and most of us goblins came up here from Booty Bay and Gadgetzan where it's nice and toasty. We need blankets and we need fires, and you're gonna help." } },
      choices = {
        { text = "Why not just go back south?", next = "south" },
        { text = "Something else.", next = "BACK" },
      },
    },
    south = {
      lines = { { id = "so_default", text = "And leave Everlook? There's money up here, chum, furs and ore and every adventurer between here and the Plaguelands passing through with full pockets. A goblin'll put up with a lot of frostbite for a good margin." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    forgive = {
      big = true,
      lines = { { id = "fo_default", text = "Course it is, everything's for sale, and forgiveness is a lot cheaper than a feud. You pay, we forget, everybody goes back to business, and nobody gets stabbed in an alley. What's wrong with that?" } },
      choices = {
        { text = "Nothing. Paying your debts is how it should work.", next = "BACK", reply = "Now there's a customer with sense! Bring me the goods and we'll call it square.", fx = { align = { honor = 1 } } },
        { text = "Bought forgiveness isn't worth much. I'll keep my grudge.", next = "BACK", reply = "Suit yourself, pal, but grudges don't buy you a bed in Everlook. Offer stands when you get cold.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    enemies = {
      lines = { { id = "en_default", text = "Our enemies, that's who, and the Cartel's got a few. Pirates, mostly, and other folks who don't like it when somebody's helpin' the goblins, so be warned, helpin' us won't make you popular with them." } },
      choices = {
        { text = "I can live with pirates being cross.", next = "BACK", fx = { trait = { brave = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    innocent = {
      lines = { { id = "in_default", text = "Then what're you botherin' me for? Go on into Everlook and spend your money like a respectable customer, and if you ever do knock over a Cartel caravan, you know where to find me." } },
      choices = {
        { text = "I'll keep it in mind.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "I fix reputations, pal. Somebody's gotta, and it pays better than fixin' wagons." } },
    advice = { { id = "tp_ad", text = "Don't cross the Cartel, but if you do, come and see me." } },
    _none = { { id = "tp_none", text = "Never heard of it, and if I can't sell it, I don't wanna." } },
  },
}
