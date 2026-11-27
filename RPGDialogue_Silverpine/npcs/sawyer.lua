-- Abigail Sawyer, bowyer at the Sepulcher. Voice: bibles/sawyer.md
-- Makes bows from Silverpine's own trees and judges every customer by their draw.
local P = RPGDialogueAPI:Pack("rpgd.silverpine")
local TODO_NPC = P.TODO_NPC

P:NPC {
  key = "abigail_sawyer", id = TODO_NPC("Abigail Sawyer"), name = "Abigail Sawyer", title = "Bowyer",
  bible = "bibles/sawyer.md", role = "vendor", tier = "service",
  communities = { "sepulcher" }, temper = { "brisk" }, values = { "craft", "practical" },
  notices = { "class", "race" },
  impression = {
    first = "She checks a customer's arms before she checks their purse.",
    third = "{name} met Abigail Sawyer, the Sepulcher's bowyer.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Back again, and holding that bow just the way I showed you. Come and try the new draw I've been stringing." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You. I'll string your bow and take your coin, but keep your hands well away from my drying rack." },
    { id = "g_shop", text = "Bows, strings and arrows, all made here, and all made properly. Mind the drying rack behind you." },
    { id = "g_back", when = { metBefore = true }, text = "Back again? Let me see how you've been holding that bow, because I can always tell." },
    { id = "g_grown", when = { metBefore = true, levelsSince = 8 }, text = "Your shoulders have filled out since you were last here, so you'll want a heavier draw, and I happen to have one." },
  },

  notice = {
    { id = "n_hunter", cat = "class", when = { class = "HUNTER" },
      text = "A hunter, at last, and not another warrior who wants a bow to hang on the wall. Come and feel the difference between my stock and the rubbish you've been using." },
    { id = "n_troll", cat = "race", when = { race = "Troll" },
      text = "A troll! Your people have the longest arms I've ever fitted a bow to, and I've never once had a troll complain that the draw was too heavy." },
  },

  start = "hello",
  nodes = {
    d2_guns = {
      lines = {
        { id = "d2_guns_1", text = "Because a gun tells the whole forest where you are, and a deathstalker's whole trade is that nobody knows where she is. Faerleia's people go into Pyrewood at night, and one shot would bring every worgen in the village down on them." },
      },
      choices = {
        { text = "And in an open fight?", next = "d2_guns2" },
        { text = "Quiet kills, quiet folk. Makes sense.", next = "d2_guns2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_guns2 = {
      lines = {
        { id = "d2_guns2_1", text = "In an open fight, the gun, and I'll say so to anyone who asks. A goblin rifle will knock a worgen down where my best bow only annoys it, but you have to be alive long enough to reload, and that's the trouble." },
      },
      choices = {
        { text = "Honest of you, for a bowyer.", next = "BACK", reply = "I'd rather lose a sale than lose a customer, and the dead ones don't come back to complain." },
        { text = "Something else, then.", next = "BACK" },
      },
    },
    d2_buyers = {
      lines = {
        { id = "d2_buyers_1", text = "The Deathguard on the Ambermill road, who shoot at the Dalaran wizards from behind the trees, and the odd hunter passing south toward Hillsbrad. The orcs who come through buy the heaviest draw I have and break it inside a week." },
      },
      choices = {
        { text = "Break it how?", next = "d2_buyers2" },
        { text = "Orcs aren't gentle with anything.", next = "d2_buyers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_buyers2 = {
      lines = {
        { id = "d2_buyers2_1", text = "By drawing past the point I told them to stop, every one of them, as though the bow were being rude to them. I've started making their staves thicker than any sensible bow ought to be, and they've started bringing them back less often." },
      },
      choices = {
        { text = "Clever of you.", next = "BACK" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    d2_tauren = {
      lines = {
        { id = "d2_tauren_1", text = "Not too big, only bigger than anything this forest grows straight. I'd need a yew from the lake shore that's been left alone for a hundred years, and the gnolls have cut most of those for their fires." },
      },
      choices = {
        { text = "Then I'll keep my own bow for now.", next = "BACK" },
        { text = "Ask you something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Abigail Sawyer, bowyer to the Sepulcher. The deathstalkers need something that kills quietly at a distance, and a bow is quieter than any gun the goblins ever sold." },
        { id = "h_hunter", when = { class = "HUNTER" },
          text = "A hunter, and not a moment too soon, because I've a rack of good bows going to waste on deathguards who hold them like brooms. Tell me what you're hunting, and I'll tell you what you need." },
        { id = "h_warrior", when = { class = { "WARRIOR", "ROGUE" } },
          text = "You'll want something to throw at the worgen before they reach you, I expect, and I'd say that's wise. Even a fighter should be able to put an arrow in a wolf's eye." },
        { id = "h_tauren", when = { race = "Tauren" },
          text = "A tauren, and with arms like that, I'd have to make you a bow from a whole tree. I'm not complaining, mind, because it's a challenge, and I miss those." },
      },
      again = {
        { id = "h_again", text = "Anything else? Ask while the glue dries." },
        { id = "h_again2", text = "Go on, then. I can talk and string a bow at once." },
      },
      choices = {
        { text = "A bowyer should tell a buyer when a draw is too heavy.", next = "BACK", reply = "I always do, even when it costs me the sale. A torn shoulder never made anyone a better shot.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell them the heavy bow anyway. Their shoulder is their problem.", next = "BACK", reply = "And then their arrow flies wide and the worgen have them, which makes it my problem too.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Where does your wood come from?", next = "wood" },
        { text = "Can the dead still draw a bow?", next = "draw" },
        { text = "What should I use against the worgen?", next = "worgen", when = { class = "HUNTER" } },
        { text = "Show me what you've got.", next = "BUSINESS" },
        { text = "Why bows, when the goblins sell guns?", next = "d2_guns" },
        { text = "Who do you sell to, besides deathstalkers?", next = "d2_buyers" },
        { text = "My arms are too big for your bows, aren't they?", next = "d2_tauren", when = { race = "Tauren" } },
        { text = "Good day, Abigail.", next = "END" },
      },
    },

    wood = {
      lines = {
        { id = "wo_default", text = "From this forest, mostly, from the old yews along the lake shore and the ash trees past the Dead Fields. Silverpine grows good wood, slow and tight, and it's the one thing here that hasn't tried to kill me." },
      },
      choices = {
        { text = "Who fetches it for you?", next = "wood_fetch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wood_fetch = {
      big = true,
      lines = {
        { id = "wf_default", text = "Whoever owes me a favour, and a lot of deathguards owe me favours. The gnolls in the south like to hide in the same groves I want, though, so every staves-run turns into a skirmish, and I've lost more good wood to blood than to rot." },
      },
      choices = {
        { text = "Then I'll keep the gnolls off your groves.", next = "BACK", reply = "Would you? The deathguards will be jealous, and I'll have yew enough for a month of bows.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "Cut where the gnolls aren't. It's not worth the blood.", next = "BACK", reply = "Sensible, if a little timid. The good yew grows where the gnolls are, but I'll make do.", fx = { align = { order = -1 }, trait = { cautious = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    draw = {
      lines = {
        { id = "dr_default", text = "We can, but our arms aren't what they were, and some of us have fewer fingers than we'd like. I make the Forsaken bows a little lighter in the draw, and a little longer to make up for it, and nobody's complained yet." },
        { id = "dr_scourge", when = { race = "Scourge" }, text = "You'd know as well as I do, since you've the same arms I have. I make our bows a little lighter in the draw and a little longer to make up for it, so you'll not tear what's left of your shoulder." },
      },
      choices = {
        { text = "Did you make bows before you died?", next = "draw_before" },
        { text = "Something else.", next = "BACK" },
      },
    },
    draw_before = {
      lines = {
        { id = "db_default", text = "I strung them, for my father, who made them, and I was never allowed to touch the knife. He'd be appalled at some of my joints, I expect, but he isn't here, and I am, so the Sepulcher gets my way of doing it." },
      },
      choices = {
        { text = "Your way seems to work well enough.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },

    worgen = {
      big = true,
      lines = {
        { id = "wg_default", text = "Something heavy, with broad heads on the arrows, because a worgen will take a narrow arrow in the shoulder and keep coming. Hit it twice before it closes, and then let your beast do the rest." },
        { id = "wg_pet", when = { pet = { type = "Beast" } }, text = "Something heavy, with broad heads, because a worgen will shrug off a narrow arrow and keep coming. Put two in it before it closes, and then let {pet} have it, which I suspect {pet} would enjoy." },
      },
      choices = {
        { text = "A clean kill from range is the right way.", next = "BACK", reply = "It is, and the only one I'd trust against a worgen. Get close and you'll learn why.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Whatever brings it down. I'll poison the heads too.", next = "BACK", reply = "Poison and broadheads together, yes, Patrice will be delighted. Just don't nick your own fingers.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },

  topics = {
    advice = { { id = "tp_ad", text = "Unstring your bow at night, because this forest is damp and a strung bow takes a set. Nobody listens to that one, and then they come back to me complaining." } },
    _none = { { id = "tp_none", text = "Couldn't tell you. If it isn't wood or string, it's someone else's business." } },
  },
}
