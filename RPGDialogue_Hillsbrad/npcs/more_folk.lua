-- More of Hillsbrad: Kris Legace, the freewheeling leather trader hiding in Durnholde's ruins, and two
-- Tarren Mill sellers, Mallen Swain (tailoring supplies) and Jason Lemieux (mushrooms).
-- Voices: bibles/more_folk.md
local P = RPGDialogueAPI:Pack("rpgd.hillsbrad")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

-- Kris Legace: leather armour trader behind Durnholde's keep, friendly to both sides.
P:NPC {
  key = "hb_kris_legace", id = TODO_NPC("Kris Legace"), name = "Kris Legace", title = "Freewheeling Tradeswoman",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "durnholde" }, temper = { "smooth", "shrewd" }, values = { "practical", "free" },
  notices = { "kit", "stealth" },

  impression = {
    first = "Kris Legace sells leather armour from a hiding spot behind Durnholde's keep, with the Syndicate on one side and their prisoners on the other. She sells to anyone and seems proud of answering to no one.",
    third = "{name} met Kris Legace, a freewheeling trader who sells leather armour in the ruins of Durnholde Keep.",
  },

  greetings = {
    { id = "g_default", text = "Quietly, friend. Some of the folk round here don't like competition." },
    { id = "g_back", when = { metBefore = true }, text = "Still alive? Good for you, and good for business." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Horde coin spends the same as anyone's, and I'm not fussy. Come in out of sight." },
    { id = "g_rescue", when = { questActive = TODO_QUEST("The Rescue") }, text = "Looking for the orcs in chains? Keep your voice down, and don't tell anyone I pointed." },
    { id = "g_alliance", when = { faction = "Alliance" }, text = "Southshore sent you up to thin out the Syndicate, I'd guess. Do it somewhere that isn't in front of my stock." },
  },

  notice = {
    { id = "n_kit", cat = "kit", when = { durability = { max = 0.3 } },
      text = "That armour's been chewed on by every Syndicate blade in the keep. I've better, if you've the coin." },
    { id = "n_stealth", cat = "stealth", when = { class = "ROGUE" },
      text = "You came up on me quiet as a cat, and I respect that. You'll want soft leather, then, the kind that doesn't creak." },
    { id = "n_lw", cat = "stealth", when = { profession = "Leatherworking" },
      text = "You work leather, by the look of your palms. Then you'll see I don't sell rubbish, and you'll keep the prices I paid for it to yourself." },
    { id = "n_hunter", cat = "kit", when = { class = "HUNTER" },
      text = "A hunter. Keep that beast of yours quiet, friend, because a growl carries a long way off these walls." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Kris Legace, freewheeling tradeswoman. I sell good leather to anyone who finds me back here, Alliance or Horde, and the Syndicate's welcome to try and stop me." },
        { id = "h_freed", tags = { "news" }, when = { questDone = TODO_QUEST("The Rescue") },
          text = "So those two orcs got out, did they? The guards have been screaming at each other for days, and it's been very good for business while they're looking the other way." },
      },
      again = {
        { id = "h_again", text = "Anything else? Make it quick and make it quiet." },
        { id = "h_again2", text = "Go on, I'm listening, and I'm watching the wall." },
        { id = "h_again3", text = "Still here? Say it soft, then, there's a patrol due round the stable." },
      },
      choices = {
        { text = "Show me your leather.", next = "BUSINESS" },
        { text = "Why trade from a Syndicate ruin?", next = "why" },
        { text = "The Syndicate must know you're here.", next = "syndicate" },
        { text = "Selling to both sides isn't very loyal.", next = "loyal" },
        { text = "Where does your leather come from?", next = "stock" },
        { text = "This was the orcs' prison, once.", next = "keep" },
        { text = "I'm from Southshore. What's the keep's weak side?", next = "weak", when = { faction = "Alliance" } },
        { text = "I could use a quiet way in and out.", next = "quiet", when = { class = "ROGUE" } },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    why = {
      lines = {
        { id = "wh_default", text = "Because everyone who comes to Durnholde needs armour, and nobody else is mad enough to sell it here. The Alliance come for the Syndicate, the Horde come for their prisoners, and they all leave a bit more cut up than they came." },
      },
      choices = {
        { text = "Prisoners? Who's held here?", next = "why_prisoners" },
        { text = "Something else.", next = "BACK" },
      },
    },
    why_prisoners = {
      lines = {
        { id = "wp_default", text = "Orcs, mostly, caught poking about the keep. There's one just past that wall, and I hear him at night, singing something low that I don't understand and don't much like. Krusk, over by Tarren Mill, wants them back." },
      },
      choices = {
        { text = "You could help them out.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    syndicate = {
      lines = {
        { id = "sy_default", text = "They know, and they leave me be, since a few of them buy from me too when their captain isn't looking. A trader who doesn't take sides is the safest person in a war, so long as she keeps her mouth shut." },
      },
      choices = {
        { text = "And do you keep it shut?", next = "syndicate_shut" },
        { text = "Something else.", next = "BACK" },
      },
    },
    syndicate_shut = {
      lines = {
        { id = "ss_default", text = "Mostly. I'll tell you this much for free: the ones who wear the nicest boots in this keep used to be nobles in Alterac, and they still think they're owed a kingdom." },
      },
      choices = {
        { text = "Good to know.", next = "BACK" },
        { text = "Let's see the boots, then.", next = "BUSINESS" },
      },
    },
    loyal = {
      big = true,
      lines = {
        { id = "lo_default", text = "Loyal to whom, the kings who left Hillsbrad to burn? I'm loyal to my stock and my skin, and so far neither's let me down." },
      },
      choices = {
        { text = "Fair enough. A free trader owes nobody.", next = "BACK", reply = "Now you're talking sense. Come back when you need leather, and I'll still be here.", fx = { align = { order = -1 } } },
        { text = "A war needs people to pick a side.", next = "BACK", reply = "Then pick one, friend, and let me sell you the armour for it.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    stock = {
      lines = { { id = "sk_default", text = "Here and there, friend. The hides come off the bears and lions in these hills, and I've a tanner in the Uplands who cures them and never asks where they're bound. The finished pieces I buy from whoever's selling." } },
      choices = {
        { text = "Including Syndicate quartermasters?", next = "stock2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stock2 = {
      lines = { { id = "sk2_default", text = "Now and again a crate goes missing from their stores and turns up in mine. I pay a fair price for it, and the man who sold it buys himself a drink in Tarren Mill or Southshore, depending on his face. Everybody ends the day content." } },
      choices = {
        { text = "You've a talent for this.", next = "BACK", reply = "I've a talent for staying out of the middle, which comes to the same thing.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep = {
      lines = { { id = "kp_default", text = "So the old folk in Hillsbrad say. Aedelas Blackmoore ran the camps from this very hall and kept a great many orcs in chains here, and drank himself stupid while he did it. The Warchief of the Horde was one of them, if the stories are true." } },
      choices = {
        { text = "And now it holds orcs again.", next = "keep2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep2 = {
      lines = { { id = "kp2_default", text = "It does, and I'll not pretend I don't see the joke in it. The Syndicate lords who squat here now were Alterac's nobles once, and they've learned nothing from the last master of this place, who died in it." } },
      choices = {
        { text = "Then they'll end the same way.", next = "BACK", reply = "Very likely, and I'll have sold up and moved on by then. I always know when to move on." },
        { text = "Something else.", next = "BACK" },
      },
    },
    weak = {
      lines = { { id = "wk_default", text = "The east wall's half down behind the stables, and the watchmen there are the ones who drink. I'm not telling you that, mind. I'm only saying where I'd not set up shop, because of the draught." } },
      choices = {
        { text = "I never heard it from you.", next = "BACK", fx = { affinity = 1, trait = { discreet = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    quiet = {
      lines = { { id = "qt_default", text = "Then you'll want the gap by the old kennels, and you'll want to go when the bell rings for their supper. I've watched a few of your trade come and go that way, and the ones who went at supper are the ones I saw twice." } },
      choices = {
        { text = "Supper it is.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    syndicate = { { id = "tp_syn", text = "Fallen lords playing at bandits. They pay in good coin and bad manners, and I take the one and ignore the other." } },
    alterac = { { id = "tp_alt", text = "A kingdom that sold out its neighbours and got knocked flat for it. Its heirs are forty paces from here, still waiting for an apology." } },
    thrall = { { id = "tp_thrall", text = "They say he was raised in this keep and burned it on his way out. I'd have done the same, though I'd have taken the silver first." } },
    _none = { { id = "tp_none", text = "Don't know, don't care, and don't say it so loud." } },
  },
}

-- Mallen Swain: Forsaken tailoring supplies seller at Tarren Mill.
P:NPC {
  key = "hb_mallen_swain", id = TODO_NPC("Mallen Swain"), name = "Mallen Swain", title = "Tailoring Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "tarren_mill" }, temper = { "dry", "fussy" }, values = { "craft", "orderly" },
  notices = { "craft" },

  impression = {
    first = "Mallen Swain sells thread and dye at Tarren Mill and stitches his own fraying skin with the same patience he gives a hem. He seems to think a well-made seam is the last dignity the dead have.",
    third = "{name} met Mallen Swain, the Forsaken tailoring supplier at Tarren Mill.",
  },

  greetings = {
    { id = "g_default", text = "Thread, needles, dye. Do try not to bleed on any of it." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. I'd hoped someone in this town would learn to sew." },
    { id = "g_tailor", when = { profession = "Tailoring" }, text = "A tailor! Finally, someone who will appreciate the good thread." },
    { id = "g_scourge", when = { race = "Scourge" }, text = "One of ours. Hold still a moment and let me look at that seam along your jaw; I'd not have let it leave my table." },
  },

  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "Your stitching is neat, I'll give you that. Most of the living sew like they've somewhere better to be." },
    { id = "n_fa", cat = "craft", when = { profession = "First Aid" },
      text = "You carry bandages and you roll them properly. Then you know that a wound dressed late is a wound sewn twice." },
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" },
      text = "A leatherworker. Your thread is too heavy for my needles, and my needles are too fine for your hides, so we shall simply admire one another." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Mallen Swain, tailoring supplies. I sell to the deathguards, the apothecaries and anyone else in Tarren Mill who still cares how they're held together." },
        { id = "h_living", when = { race = { "Orc", "Troll", "Tauren" } },
          text = "Mallen Swain, tailoring supplies. The living buy thread for their clothes, and the dead buy it for themselves, and I sell to both without asking which." },
      },
      again = {
        { id = "h_again", text = "Anything further?" },
        { id = "h_again2", text = "Go on. I'm only threading a needle." },
        { id = "h_again3", text = "Yes? I can listen and wax thread at once." },
      },
      choices = {
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "The dead buy thread for themselves?", next = "stitches" },
        { text = "Who were you before?", next = "before" },
        { text = "Who else keeps Tarren Mill supplied?", next = "town" },
        { text = "Your dyes are all dark.", next = "dye" },
        { text = "You said you had a shop in Hillsbrad.", next = "shop" },
        { text = "Which thread should a tailor carry out here?", next = "tailor", when = { profession = "Tailoring" } },
        { text = "Could you look at my own stitches?", next = "mend", when = { race = "Scourge" } },
        { text = "Not today.", next = "END" },
      },
    },
    stitches = {
      lines = {
        { id = "st_default", text = "Flesh that won't heal has to be sewn, and a deathguard who loses an arm on the Southshore road would rather keep it. I've stitched more shoulders than sleeves this month." },
      },
      choices = {
        { text = "Grim work.", next = "stitches_grim" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stitches_grim = {
      big = true,
      lines = {
        { id = "sg_default", text = "Grim, and honest, and I take a certain pride in it. Apothecary Lydon calls it vanity, but a man who falls apart on duty serves the Dark Lady poorly." },
      },
      choices = {
        { text = "There's dignity in it. Keep them whole.", next = "BACK", reply = "Thank you. Not many say so, living or otherwise.", fx = { align = { light = 1 } } },
        { text = "Lydon's right. A soldier's a soldier, sewn or not.", next = "BACK", reply = "Then Lydon can stitch them himself, and we'll see how proud he is of the result.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    before = {
      lines = {
        { id = "bf_default", text = "A tailor in Hillsbrad, with a shop on the green and a wife who chose the colours. The shop is gone and so is she, and now I choose the colours myself, which is mostly black." },
      },
      choices = {
        { text = "I'm sorry.", next = "BACK", fx = { affinity = 1 } },
        { text = "Let's see your black, then.", next = "BUSINESS" },
      },
    },
    town = {
      lines = { { id = "tn_default", text = "A small number of us, and we manage. Christoph Jeffcoat sells the general goods, Ott does the weapons, and Kayren Soothallow keeps a little of everything under the trees. Daryl Stack is the true tailor here, and I merely sell him his thread." } },
      choices = {
        { text = "A master tailor, out here?", next = "town2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    town2 = {
      lines = { { id = "tn2_default", text = "A very good one, and wasted on uniform patches. He can cut a shadoweave robe that would turn heads in the Undercity, and instead he lets out deathguards' collars. I've told him he should go back, and he says the town needs him more than the city does." } },
      choices = {
        { text = "He's probably right.", next = "BACK", reply = "He is. I resent it, on his behalf, since he won't." },
        { text = "Something else.", next = "BACK" },
      },
    },
    dye = {
      lines = { { id = "dy_default", text = "Black, grey and a purple I'm rather pleased with. The reds and yellows have to come by sea, and the sea belongs to Southshore, so the Dark Lady's colours happen also to be the only ones I can get." } },
      choices = {
        { text = "Where does the purple come from?", next = "dye2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    dye2 = {
      lines = { { id = "dy2_default", text = "From Apothecary Lydon's slop bucket, which I ought not to admit. Something he boils for his own purposes leaves a violet scum, and it takes to wool as if it were made for it. I have asked him what it is, and he smiled, so I stopped asking." } },
      choices = {
        { text = "I'll admire it from a distance.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "A good dye is a good dye.", next = "BACK", reply = "Precisely my view. It has not yet eaten through a single garment, and I check them weekly." },
        { text = "Something else.", next = "BACK" },
      },
    },
    shop = {
      lines = { { id = "sp_default", text = "On the green at Hillsbrad Fields, three doors from the smithy. I can see the roof from the hill road, and there are farmers living under it who would put a pitchfork through me. I cut their fathers' wedding coats." } },
      choices = {
        { text = "Do you ever want to go back?", next = "shop2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    shop2 = {
      lines = {
        { id = "sp2_default", text = "To look in the window, no more. The deathguards raid those farms on the High Executor's orders, and I've asked them, quietly, to leave the tailor's shop standing. So far they have." },
        { id = "sp2_done", when = { questDone = TODO_QUEST("Battle of Hillsbrad") }, text = "I hear you were among those sent down to the Fields. I shan't ask what you did there, but if the shop with the green shutters still has its roof, I should like to be told." },
      },
      choices = {
        { text = "If I pass it, I'll leave it be.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "It's theirs now. Let it go.", next = "BACK", reply = "I know whose it is. I only want the roof to stay on it." },
        { text = "Something else.", next = "BACK" },
      },
    },
    tailor = {
      lines = { { id = "tl_default", text = "Two weights, always. Coarse for wool and anything a soldier will wear, fine for silk, and never let anyone sell you one thread for both. And buy bleach here before you go into the mountains, because nobody in Alterac sells anything but trouble." } },
      choices = {
        { text = "Show me both weights.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mend = {
      lines = { { id = "md_default", text = "Turn to the light. Hm. Whoever closed that shoulder used a saddler's stitch, which holds but puckers, and it will pull when you lift your arm. I can redo it flat in a quarter of an hour, and you'll swing more freely for it." } },
      choices = {
        { text = "I'd be grateful, Mallen.", next = "BACK", reply = "Sit, then. It is a pleasure to work on someone who doesn't flinch.", fx = { affinity = 1 } },
        { text = "It holds. That's enough for me.", next = "BACK", reply = "As you wish. Come back when it tears, and it will tear." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_fs", text = "We are a people held together by thread and stubbornness. I supply the first, and the second seems to need no vendor." } },
    scourge = { { id = "tp_scourge", text = "They never mended anything. A ghoul that lost an arm simply went on without it, and I find that the most offensive thing about them." } },
    advice = { { id = "tp_ad", text = "Carry a needle. It weighs nothing, and there is very little in this world it cannot make slightly better." } },
    _none = { { id = "tp_none", text = "I sew. Ask the deathguards about anything else." } },
  },
}

-- Jason Lemieux: Forsaken mushroom seller at Tarren Mill.
P:NPC {
  key = "hb_jason_lemieux", id = TODO_NPC("Jason Lemieux"), name = "Jason Lemieux", title = "Mushroom Seller",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "tarren_mill" }, temper = { "dry", "cheerful" }, values = { "practical" },
  notices = { "hunger" },

  impression = {
    first = "Jason Lemieux sells mushrooms at Tarren Mill and is the most cheerful Forsaken I've met, which says more about the Forsaken than about him. He grows half of them in a cellar he won't describe.",
    third = "{name} met Jason Lemieux, who sells mushrooms at Tarren Mill.",
  },

  greetings = {
    { id = "g_default", text = "Mushrooms, fresh from the dark. Well, fresh enough." },
    { id = "g_back", when = { metBefore = true }, text = "Hungry again? The living always are." },
    { id = "g_tauren", when = { race = "Tauren" }, text = "A tauren! You lot like your greens, so you'll love my greys." },
    { id = "g_scourge", when = { race = "Scourge" }, text = "One of the family! You'll not need feeding, then, but stop and talk, because the orcs only ever grunt at me." },
  },

  notice = {
    { id = "n_hunger", cat = "hunger", when = { durability = { max = 0.25 } },
      text = "You look half starved, friend. Even I can tell, and my own stomach gave up years ago." },
    { id = "n_cook", cat = "hunger", when = { profession = "Cooking" },
      text = "A cook! Then you know a mushroom's only as good as the butter it meets, and I've no butter, so you'll have to bring your own genius." },
    { id = "n_orc", cat = "hunger", when = { race = "Orc" },
      text = "An orc. You lot always ask if there's meat, and there isn't, friend, but a fried puffball's the next best thing, or so a grunt told me with his mouth full." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Jason Lemieux, mushroom seller. The Forsaken don't eat much, but the orcs and trolls passing through do, and mushrooms grow nicely where nothing else will." },
        { id = "h_living", when = { race = { "Orc", "Troll", "Tauren" } }, text = "Jason Lemieux, mushroom seller. You're alive, so you'll be hungry, and so you're my favourite sort of customer. Everything on the left is safe for you, and everything on the right is a conversation." },
      },
      again = {
        { id = "h_again", text = "Anything else? The caps don't keep forever." },
        { id = "h_again2", text = "Go on, I'm in no hurry. I'm dead." },
        { id = "h_again3", text = "What else? I love a chat. The mushrooms never answer back." },
      },
      choices = {
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Where do you grow them?", next = "grow" },
        { text = "You're cheerful, for a Forsaken.", next = "cheer" },
        { text = "Who buys from you in Tarren Mill?", next = "buyers" },
        { text = "The old mill itself is a ruin.", next = "mill" },
        { text = "What's on the right, then?", next = "right" },
        { text = "Don't you find this town grim, brother?", next = "grim", when = { race = "Scourge" } },
        { text = "How would you cook these, if you could taste?", next = "cook", when = { profession = "Cooking" } },
        { text = "Not now.", next = "END" },
      },
    },
    grow = {
      lines = {
        { id = "gr_default", text = "In a cellar under the old mill, in the dark and the damp, on beds of things I'd rather not name. Mushrooms aren't picky, and they don't ask what they're fed." },
      },
      choices = {
        { text = "That's horrible.", next = "grow_horrible" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grow_horrible = {
      lines = {
        { id = "gh_default", text = "It's straw and old leaves, mostly, and I only say it like that to watch the living go pale. You've gone a little pale, I see. Sorry, but it never stops being funny." },
      },
      choices = {
        { text = "Very droll.", next = "BACK", fx = { trait = { witty = 1 } } },
        { text = "I'll buy some anyway.", next = "BUSINESS" },
      },
    },
    cheer = {
      big = true,
      lines = {
        { id = "ch_default", text = "Dead is dead, friend, and moping won't make me less so. I'd rather sell mushrooms and laugh than brood in the Undercity with the poets." },
      },
      choices = {
        { text = "Good for you. Laughter's worth keeping.", next = "BACK", reply = "It is, and it costs nothing, which suits my prices.", fx = { align = { light = 1 } } },
        { text = "Some things deserve brooding over.", next = "BACK", reply = "Then brood, friend, and I'll sell you something to chew while you do.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers = {
      lines = { { id = "by_default", text = "Innkeeper Shay takes a basket each morning for her guests, and Derak Nightfall takes the ugly ones for his stews, which is where ugly mushrooms belong. Krusk's orcs buy the rest, and they pay without counting, bless them." } },
      choices = {
        { text = "And the deathguards?", next = "buyers2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    buyers2 = {
      lines = { { id = "by2_default", text = "Samsa buys one, every week, and sets it on the wall where she stands watch. She never eats it. I asked her why once, and she said it gives the crows something to look at besides her, which is the only joke I've ever heard her make." } },
      choices = {
        { text = "That's nearly friendly, for a deathguard.", next = "BACK", reply = "I thought so! I gave her the next one free, and she reported me for bribery.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    mill = {
      lines = { { id = "ml_default", text = "It is, and it suits me. The wheel's gone and the race is choked with weed, but the cellar's dry on one side and wet on the other, and that's all a mushroom wants. I'd not trade it for a palace." } },
      choices = {
        { text = "Did you know the place before?", next = "mill2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mill2 = {
      lines = { { id = "ml2_default", text = "I carted flour from it, friend, every week, down to Southshore and back. I knew the miller and his dog. Now I sell from the miller's doorstep to people who'd burn Southshore flat, and I've decided to find that funny as well, because the other choice is worse." } },
      choices = {
        { text = "You've a strong stomach for it.", next = "BACK", reply = "I've no stomach at all, as I keep telling people. It's a great help." },
        { text = "That can't all be funny.", next = "BACK", reply = "It isn't. But I've only so many years of pretending left in me, and I mean to use them.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    right = {
      lines = { { id = "rt_default", text = "The spotted reds and the little blue ones. Apothecary Lydon buys them by the sack and doesn't say what for, and I don't sell them to anyone with a pulse unless they can tell me their name backwards first." } },
      choices = {
        { text = "Has anyone managed it?", next = "BACK", reply = "A troll, once, straight off. I sold him two, and he sat under that tree laughing until the moon came up." },
        { text = "Something else.", next = "BACK" },
      },
    },
    grim = {
      lines = { { id = "gm_default", text = "Grim? Brother, I woke in a ditch with a crow on my chest. After that, everything's been a step up. We've a town and a trade and the Dark Lady's banner on the hill, and I count those every morning before I count my caps." } },
      choices = {
        { text = "I'll try counting them too.", next = "BACK", fx = { affinity = 1 } },
        { text = "You're easily pleased.", next = "BACK", reply = "I am. It's the best thing I brought back with me." },
        { text = "Something else.", next = "BACK" },
      },
    },
    cook = {
      lines = { { id = "ck_default", text = "In a hot pan with nothing else until they've given up their water, and only then the fat and the salt. Everyone puts the butter in first and stews them grey. I can't taste it now, but I can still hear when a pan's too crowded." } },
      choices = {
        { text = "That's exactly right.", next = "BACK", reply = "Of course it is. I was a carter, friend, and carters eat at every kitchen door in the county.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_fs", text = "We're not so bad, friend, once you're used to the smell. I can't smell it myself, so I'm taking the orcs' word for that." } },
    advice = { { id = "tp_ad", text = "If you don't know a mushroom, don't eat it. If you do know it, think about it one more time." } },
    syndicate = { { id = "tp_syn", text = "They robbed my cart twice when I was alive. They've left me alone since, and I think it's the face." } },
    _none = { { id = "tp_none", text = "No idea, friend. Ask me about mushrooms." } },
  },
}

---------------------------------------------------------------------------
-- Daryl Stack: tailoring trainer at Tarren Mill; a fine tailor who stays where he is needed.
---------------------------------------------------------------------------
P:NPC {
  key = "hb_daryl_stack", id = TODO_NPC("Daryl Stack"), name = "Daryl Stack", title = "Tailoring Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "tarren_mill" }, temper = { "quiet", "exacting" }, values = { "craft", "dutiful" },
  notices = { "craft", "kit" },
  impression = {
    first = "Daryl Stack teaches tailoring at Tarren Mill and spends most of his own hours letting out deathguards' collars. He could cut far finer things, and he seems to have decided that the town needs a plain seam more.",
    third = "{name} met Daryl Stack, the Forsaken tailoring trainer at Tarren Mill.",
  },

  greetings = {
    { id = "g_default", text = "Good evening. If you've come to learn, sit there, where the lamp is. If you've come to be mended, stand still." },
    { id = "g_tailor", when = { profession = "Tailoring" }, text = "You sew. I can see it in how you looked at my bench before you looked at me. Sit, and show me a seam." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. The stitches held, I trust, or you'd have said so before your greeting." },
  },

  notice = {
    { id = "n_tailor", cat = "craft", when = { profession = "Tailoring" },
      text = "That hem on your cloak is your own work, and it's sound. You've been taught to lock every fourth stitch, which tells me you learned in the Undercity." },
    { id = "n_torn", cat = "kit", when = { durability = { max = 0.4 } },
      text = "You've come off the Southshore road, by the cuts in that. I'll not mend armor, but the padding under it wants a needle before it wants anything else." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Daryl Stack. I teach tailoring to whoever in Tarren Mill will learn it, and I keep the garrison's uniforms fit to be seen. It isn't grand work, but there's a great deal of it, and it doesn't wait." },
        { id = "h_tailor", when = { profession = "Tailoring" }, text = "Daryl Stack. You've the trade in your hands already, so I'll not waste your evening on how to hold a needle. Tell me what you can make, and I'll tell you what comes after it." },
      },
      again = {
        { id = "h_again", text = "Go on. I can listen while I work." },
        { id = "h_again2", text = "What else? This collar can wait a moment." },
        { id = "h_again3", text = "Ask it. I'm in no haste." },
      },
      choices = {
        { text = "Teach me what you know.", next = "BUSINESS" },
        { text = "Mallen Swain says you're wasted here.", next = "wasted", when = { heardLine = "hb_mallen_swain.tn2_default" } },
        { text = "A tailor seems out of place on a front line.", next = "front" },
        { text = "What does the garrison wear through fastest?", next = "wear" },
        { text = "Who do you work with in the town?", next = "town" },
        { text = "What should I learn after wool?", next = "next", when = { profession = "Tailoring" } },
        { text = "I'll let you work.", next = "END" },
      },
    },
    wasted = {
      lines = { { id = "ws_default", text = "Mallen is a generous man with other people's talents. I cut robes in the Undercity for a year, for mages who had forty robes already. Here a deathguard has one tunic, and if it fails her on the road, she has none." } },
      choices = {
        { text = "So you chose to come.", next = "wasted2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wasted2 = {
      lines = { { id = "ws2_default", text = "I asked to come, and High Executor Darthalia was surprised enough to say yes. I'll not pretend I don't miss silk. But I know every soldier here by their measurements, and I notice when one of them stops coming in." } },
      choices = {
        { text = "That's a hard thing to keep count of.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    front = {
      lines = { { id = "f_default", text = "Is it? An army is cloth before it is anything else. Tents, tunics, bandages, banners, the sacks the apothecaries carry their powders in. Take the tailors away from a garrison, and inside a month it's a mob in rags." } },
      choices = {
        { text = "I'd not thought of it that way.", next = "front2" },
        { text = "Steel wins wars, not thread.", next = "front2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    front2 = {
      big = true,
      lines = { { id = "f2_default", text = "Steel has the glory of it, certainly. But I've seen what the Southshore militia wear, and it's good wool, well kept. Somebody down there thinks as I do, and I'd like to meet them, in another sort of world." } },
      choices = {
        { text = "An enemy is an enemy, well dressed or not.", next = "BACK", reply = "So the High Executor would say, and she'd be right to. I only notice the wool.", fx = { align = { honor = -1 } } },
        { text = "Craft deserves respect, whoever's it is.", next = "BACK", reply = "I think so. I keep it to myself in this town, as a rule, so I thank you for saying it first.", fx = { affinity = 1, align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    wear = {
      lines = { { id = "w_default", text = "The left shoulder, where the shield strap rides, and the knees. Deathguard Samsa is through a pair of trousers a month, because she kneels to aim and won't be told. Humbert wears out nothing at all, and I've begun to wonder what he does on watch." } },
      choices = {
        { text = "He stands very still, I think.", next = "BACK", reply = "Then he's the best friend my bench has, and I'll say no more against him.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    town = {
      lines = { { id = "t_default", text = "Mallen for thread, always. Apothecary Lydon for his sacks and aprons, which come back to me with holes burned through them and no explanation. And Innkeeper Shay, whose bed linen I do as a kindness, because her living guests complain of the old sheets." } },
      choices = {
        { text = "What's wrong with the old sheets?", next = "BACK", reply = "Nothing I can see. I'm told it was the smell, and I've had to take that on trust." },
        { text = "Something else.", next = "BACK" },
      },
    },
    next = {
      lines = { { id = "n_default", text = "Silk, when you can get it, from the spiders in the hills east of here. Don't buy it; go and take it yourself, so you learn how the thread lies before it's spun. After silk comes mageweave, and for that you'll go a long way south." } },
      choices = {
        { text = "And shadoweave?", next = "next2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    next2 = {
      lines = { { id = "n2_default", text = "Mallen's been talking. That isn't mine to teach out here. Josephine Lister in the Undercity holds it, and she'll want to see a good deal of plain work from you first. Tell her I sent you, and that the collars are holding." } },
      choices = {
        { text = "I'll tell her.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_fs", text = "We're hard on our clothes and can't feel them wearing. Somebody has to look us over, and at Tarren Mill it's me." } },
    sylvanas = { { id = "tp_syl", text = "I made a banner for her once, in the city. I'm told it hangs in the Royal Quarter, and I've never gone to check, in case it doesn't." } },
    advice = { { id = "tp_ad", text = "Mend it the day it tears. A small hole is a quarter hour, and a large one is a new garment." } },
    scourge = { { id = "tp_scourge", text = "They marched us in whatever we died in. I think of that whenever someone tells me a uniform is only cloth." } },
    lordaeron = { { id = "tp_lord", text = "I was apprenticed in the capital and never finished my time. I've finished it since, on my own, which the guild would not have allowed." } },
    _none = { { id = "tp_none", text = "I couldn't say. I see this town through its laundry, and that never came through my hands." } },
  },
}

---------------------------------------------------------------------------
-- Derak Nightfall: Tarren Mill's cook, who feeds the living Horde from a kitchen full of the dead.
---------------------------------------------------------------------------
P:NPC {
  key = "hb_derak_nightfall", id = TODO_NPC("Derak Nightfall"), name = "Derak Nightfall", title = "Cook",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "tarren_mill" }, temper = { "gruff", "dry" }, values = { "practical", "craft" },
  notices = { "hunger" },
  impression = {
    first = "Derak Nightfall cooks for Tarren Mill's living visitors and takes their complaints as a personal contest. He can no longer taste his own stew, and he has stopped believing anyone who tells him it is good.",
    third = "{name} met Derak Nightfall, the Forsaken cook at Tarren Mill.",
  },

  greetings = {
    { id = "g_default", text = "It's stew. It was stew yesterday and it'll be stew tomorrow. Do you want a bowl or not?" },
    { id = "g_living", when = { race = { "Orc", "Troll", "Tauren" } }, text = "You've a stomach, so you're my business. Sit down, and tell me afterwards what's wrong with it, because something always is." },
    { id = "g_back", when = { metBefore = true }, text = "You came back, so it didn't kill you. I'll take that as a review." },
  },

  notice = {
    { id = "n_cook", cat = "hunger", when = { profession = "Cooking" },
      text = "You cook. Don't deny it, you sniffed the pot before you looked at me. Go on, then, tell me what's missing." },
    { id = "n_orc", cat = "hunger", when = { race = "Orc" },
      text = "An orc. Your lot ask for it bloody, and I do it bloody, and then you say it's not like the Barrens. Nothing's like the Barrens. This is Hillsbrad." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Derak Nightfall, cook. The Dark Lady's soldiers don't need feeding, but the Warchief's do, and so do their wolves, and so does every sellsword who comes up the road. I feed the lot out of one pot." },
        { id = "h_scourge", when = { race = "Scourge" }, text = "Derak Nightfall, cook. You'll not be wanting a bowl, being one of us, so we can skip the part where you pretend to like it. That's restful, I'll admit." },
      },
      again = {
        { id = "h_again", text = "What? I've a pot on." },
        { id = "h_again2", text = "Go on, then. It wants stirring, but it can stir itself a moment." },
        { id = "h_again3", text = "Ask. Don't lean on the table, it's the clean one." },
      },
      choices = {
        { text = "What have you got?", next = "BUSINESS" },
        { text = "What goes in the pot?", next = "pot" },
        { text = "How does a dead man end up a cook?", next = "cook" },
        { text = "Who complains the most?", next = "complain" },
        { text = "Your stew needs acid. A little sour apple.", next = "apple", when = { profession = "Cooking" } },
        { text = "I'll tell you honestly how it tastes.", next = "honest", when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "I'll leave you to your pot.", next = "END" },
      },
    },
    pot = {
      lines = { { id = "p_default", text = "Stag from the hills, when the hunters bring it. Bear, when they don't. Jason Lemieux's mushrooms, the ugly ones, since they taste the same and cost half. And turnips out of the old Tarren fields, which came up by themselves and haven't killed anyone yet." } },
      choices = {
        { text = "Yet?", next = "pot2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    pot2 = {
      lines = { { id = "p2_default", text = "Apothecary Lydon's bench is forty paces upwind of my garden. I've asked him to move it. He asked me to move the garden. So I wash the turnips three times and watch whoever eats first, and so far the worst I've seen is hiccups." } },
      choices = {
        { text = "That's not very reassuring.", next = "BACK", reply = "It wasn't meant to be. Eat the bear if you're worried, the bear lived uphill." },
        { text = "Three washes sounds careful enough.", next = "BACK", reply = "It's two more than the inn at Southshore gives theirs, I'd bet my ladle on it.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cook = {
      lines = { { id = "c_default", text = "The same way a live one does. I kept the kitchen at the Tarren Mill inn when it was a farmers' inn, with a fiddler on market nights. When I woke up, the inn was still here and so was I, and nobody else had claimed the ladle." } },
      choices = {
        { text = "You cooked for this town when it was alive.", next = "cook2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cook2 = {
      lines = { { id = "c2_default", text = "For twenty years. I know which of these houses took their eggs soft. Half of them are deathguards now and don't eat, and the other half ran to Southshore and would hang me. I cook for strangers instead, and strangers are easier." } },
      choices = {
        { text = "Easier isn't the same as better.", next = "BACK", reply = "No. But it's what there is, and the pot doesn't care who it's for.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    complain = {
      lines = { { id = "cm_default", text = "Krusk. The orc eats two bowls and then tells me it wants salt, every day, like a prayer. I've put in so much salt for him that a troll spat it across the yard last week. I think he just likes having something to tell me." } },
      choices = {
        { text = "He's lonely for his own cooking.", next = "complain2" },
        { text = "He's an ungrateful guest.", next = "complain2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    complain2 = {
      lines = { { id = "cm2_default", text = "He's a long way from home with two of his people in a Syndicate cell, and he comes and shouts at my stew instead of at the wall. I let him. I'd put it on the slate as a service, if I kept a slate." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    apple = {
      lines = { { id = "a_default", text = "Sour apple. Hm. There's a tree gone wild behind the church that nobody picks. I'd not thought of it, because I've been cooking from memory, and my memory's all salt and fat. Would it stand up to bear?" } },
      choices = {
        { text = "Bear especially. It cuts the grease.", next = "BACK", reply = "Then I'll try it tonight on Krusk. If he's got nothing to complain of, I'll know you were right.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    honest = {
      lines = { { id = "h2_default", text = "Would you? Nobody does. The orcs say it's bad because it's not theirs, and my own folk say it's good because they can't tell. Have a spoonful, and say what's true. I'll not sulk." } },
      choices = {
        { text = "It's good. Heavy on the salt, but good.", next = "BACK", reply = "Good. Hm. Well. That's Krusk's salt, not mine, but I'll take the rest. Have the bowl.", fx = { affinity = 1, trait = { honest = 1 } } },
        { text = "It's the best stew north of Stranglethorn.", next = "BACK", reply = "That's a lie, and a clumsy one. I asked for what's true. Eat your stew." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_fs", text = "I've a nose that doesn't work and a tongue that doesn't work, and I cook. Make of us what you like." } },
    thrall = { { id = "tp_thrall", text = "His soldiers eat like wolves and pay like gentlemen. I've no quarrel with the Warchief." } },
    syndicate = { { id = "tp_syn", text = "They used to drink at my inn and leave without paying. Some things got better when I died." } },
    advice = { { id = "tp_ad", text = "Never trust a cook who says it's his best yet. It's stew. It's always just stew." } },
    lordaeron = { { id = "tp_lord", text = "Good beef, good beer, and a fiddler on market night. That's the whole of the kingdom, as far as my kitchen saw it." } },
    _none = { { id = "tp_none", text = "Don't know. If you can't eat it, I've no opinion on it." } },
  },
}

---------------------------------------------------------------------------
-- Aranae Venomblood: herbalism trainer at Tarren Mill; knows which Hillsbrad plants the apothecaries want and why.
---------------------------------------------------------------------------
P:NPC {
  key = "hb_aranae", id = TODO_NPC("Aranae Venomblood"), name = "Aranae Venomblood", title = "Herbalism Trainer",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "tarren_mill" }, temper = { "sharp", "patient" }, values = { "knowledge", "practical" },
  notices = { "craft", "race" },
  impression = {
    first = "Aranae Venomblood teaches herbalism outside the building west of Tarren Mill's inn, and she is frank that half of what she teaches ends up in poison. She handles a flower as gently as she speaks of what it can do.",
    third = "{name} met Aranae Venomblood, the Forsaken herbalism trainer at Tarren Mill.",
  },

  greetings = {
    { id = "g_default", text = "Don't step on the drying racks, if you please. Everything on them took a morning to find." },
    { id = "g_herb", when = { profession = "Herbalism" }, text = "You've green on your fingers and a sickle on your belt. Good. Show me how you cut, before you pick anything else in my hills." },
    { id = "g_back", when = { metBefore = true }, text = "You again. Did you find the stream bank I told you of, or did you walk past it like everyone else?" },
  },

  notice = {
    { id = "n_alch", cat = "craft", when = { profession = "Alchemy" },
      text = "An alchemist. Then you're one of the people who ruin my good work by boiling it. Serge Hinott is the same, and I supply him anyway." },
    { id = "n_tauren", cat = "race", when = { race = "Tauren" },
      text = "A tauren. You'll ask the plant's leave before you cut it, I suppose. I don't, but I've noticed your people's cuttings keep longer, and I've wondered about that." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Aranae Venomblood. I teach herbalism, which here means showing people which Hillsbrad weeds are worth bending down for. The apothecaries want some of them badly, and it's healthier not to dwell on why." },
        { id = "h_herb", when = { profession = "Herbalism" }, text = "Aranae Venomblood. You're in the trade, so I'll speak freely. These hills are rich, the Alliance pick the south half bare, and I've spots in the north that I show only to people who cut cleanly." },
      },
      again = {
        { id = "h_again", text = "Yes? Ask, I'm only sorting." },
        { id = "h_again2", text = "Go on. These want turning, but they'll wait." },
        { id = "h_again3", text = "What else? Mind the rack." },
      },
      choices = {
        { text = "Teach me the plants.", next = "BUSINESS" },
        { text = "What grows well around here?", next = "grows" },
        { text = "What do the apothecaries want with it?", next = "apoth" },
        { text = "That's a name to frighten students with.", next = "name" },
        { text = "Where are your northern spots?", next = "spots", when = { profession = "Herbalism" } },
        { text = "My people ask the plant first. It matters.", next = "ask", when = { race = "Tauren" } },
        { text = "I'll mind the racks. Goodbye.", next = "END" },
      },
    },
    grows = {
      lines = { { id = "g2_default", text = "Bruiseweed along every wall, briarthorn in the hedgerows, and wild steelbloom up on the cliffs toward Durnholde, if you've a head for heights. Liferoot by the river, and kingsblood in the open fields the farmers used to plough." } },
      choices = {
        { text = "The farmers are gone from this side.", next = "grows2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    grows2 = {
      lines = { { id = "g3_default", text = "They are, and the fields went to flower inside two summers. I'll tell you something odd. It's the prettiest this valley has been in a century, and it's because we killed or drove off everyone who kept it tidy." } },
      choices = {
        { text = "There's a kind of justice in that.", next = "BACK", reply = "I'd call it indifference. The kingsblood doesn't care who lost the war, and I find that soothing." },
        { text = "That's a bleak way to get a meadow.", next = "BACK", reply = "It is. I pick it anyway, and I try to pick it gratefully.", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    apoth = {
      lines = { { id = "a_default", text = "Lydon wants mudsnout blossoms and anything with a bitter sap, and he wants them by the sack. He's making something for the humans' farm dogs first, and for the humans after. I gather, I'm paid, and I'm told nothing further." } },
      choices = {
        { text = "And does that sit well with you?", next = "apoth2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    apoth2 = {
      big = true,
      lines = { { id = "a2_default", text = "I taught children their letters in this valley before the plague, and some of those children carry pikes against us now. I don't know how it sits. I pick the flower, and what's done with it is done by other hands. Is that enough to keep mine clean?" } },
      choices = {
        { text = "No. You know what it's for.", next = "BACK", reply = "I do. I've known every morning for a year, and I've gone out with the sickle regardless. Thank you for not pretending.", fx = { align = { light = 1 } } },
        { text = "Yes. They'd do worse to us without a thought.", next = "BACK", reply = "They would, and they have. I'll take that tonight, and see if it still holds in the morning.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = { { id = "n_default", text = "It isn't the one I was born with. I chose it when I rose, because it made the deathguards step aside, and by the time I'd thought better of it, everyone had learned it. I was a schoolmistress. Venomblood, I ask you." } },
      choices = {
        { text = "It suits you better than you think.", next = "BACK", reply = "That's either a compliment or it isn't. I'll decide while I sort the briarthorn.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    spots = {
      lines = { { id = "s_default", text = "Follow the river north past the mill until the bank turns to shale, and look on the east side where the old sheepfold is. Liferoot, thick as a hedge. Cut above the second leaf and it will be back in a fortnight." } },
      choices = {
        { text = "Above the second leaf. I'll remember.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ask = {
      lines = { { id = "k_default", text = "Does it? Tell me how. I'm a teacher, and I'm not too proud to be taught, though I'll warn you I've no gods left to ask anything of." } },
      choices = {
        { text = "You needn't pray. Only take no more than half.", next = "BACK", reply = "Half. That I can do without believing in anything. I'll teach it from tomorrow, and I'll say a tauren told me.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    new_plague = { { id = "tp_np", text = "I pick what I'm asked for and I'm not shown the bench. That's all I'll say, and it's all I know." } },
    forsaken = { { id = "tp_fs", text = "We can't smell the flowers. I teach by leaf and stem and the feel of the sap, and my students learn faster for it." } },
    advice = { { id = "tp_ad", text = "Learn the three plants that will kill you before you learn the thirty that won't." } },
    sylvanas = { { id = "tp_syl", text = "She gave us somewhere to stand. I try to remember that on the mornings when I don't like what I'm standing on." } },
    syndicate = { { id = "tp_syn", text = "They trample the steelbloom going up to Durnholde and never once pick it. I've no patience with waste." } },
    lordaeron = { { id = "tp_lord", text = "It had schools, and I kept one. I think that is the thing about it I would most like back." } },
    _none = { { id = "tp_none", text = "That doesn't grow anywhere I've looked, so I can't help you." } },
  },
}

---------------------------------------------------------------------------
-- Fahrad: Grand Master Rogue at Ravenholdt Manor; trains the manor's rogues and wants locked junkboxes for them.
---------------------------------------------------------------------------
P:NPC {
  key = "hb_fahrad", id = TODO_NPC("Fahrad"), name = "Fahrad", title = "Grand Master Rogue",
  bible = "bibles/more_folk.md", role = "trainer", tier = "quest",
  communities = { "ravenholdt" }, temper = { "cold", "amused" }, values = { "cunning", "discipline" },
  notices = { "class" },
  impression = {
    first = "Fahrad trains the rogues of Ravenholdt Manor and speaks to everyone as though he has already searched their pockets. He is more exacting than cruel, and he seems to find most people slightly funny.",
    third = "{name} met Fahrad, the Grand Master Rogue of Ravenholdt Manor in the Alterac hills.",
  },

  greetings = {
    { id = "g_default", text = "You were heard on the path, seen at the gate and counted on the stair. Now that we've established what you are not, what do you want?" },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Softer than most, on the stair. Not soft enough, but I've trained worse into something useful." },
    { id = "g_boxes", when = { questActive = TODO_QUEST("Junkboxes Needed") }, text = "Junkboxes? Set them down. I'll know by the weight whether you've been greedy with them." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. You took the left path this time, which is better. The right one has a tripwire." },
  },

  notice = {
    { id = "n_rogue", cat = "class", when = { class = "ROGUE" },
      text = "Your offhand drifts when you think nobody's looking. Somebody is always looking. Correct it." },
    { id = "n_plate", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You rattle. I mean no insult by it, since rattling has its uses, usually as a distraction for someone better." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Fahrad. I train the rogues of this house, and Lord Ravenholdt trusts me to decide which of them are worth keeping. The manor takes no side but its own, so you may stay as long as you are interesting." },
        { id = "h_before", when = { minLevel = 50, questBefore = TODO_QUEST("Junkboxes Needed") }, text = "My rogues need to hone their lockpicking, and the locks Zan makes us are unfit for all but the lowliest neophytes. Bring me heavy junkboxes, lifted from pockets and still locked, and I'll provide you with throwing knives as fine as any known to our trade." },
        { id = "h_done", when = { questDone = TODO_QUEST("Junkboxes Needed") }, text = "The boxes are in the practice hall, and three of my students have already broken picks on them. Good. Bring more whenever you have them, because a rogue in training needs motivation." },
      },
      again = {
        { id = "h_again", text = "Is there more? Speak quietly; it's a habit worth forming." },
        { id = "h_again2", text = "Go on. You have my attention, which is not the comfort people think it is." },
        { id = "h_again3", text = "Ask." },
      },
      choices = {
        { text = "I'm ready for training.", next = "BUSINESS", when = { class = "ROGUE" } },
        { text = "What is Ravenholdt, exactly?", next = "house" },
        { text = "Why junkboxes?", next = "boxes" },
        { text = "You've no love for the Syndicate.", next = "syndicate" },
        { text = "What makes a rogue worth keeping?", next = "keep" },
        { text = "I pick pockets for a living. Judge my hands.", next = "hands", when = { class = "ROGUE" } },
        { text = "I'll see myself out, by the left path.", next = "END" },
      },
    },
    house = {
      lines = { { id = "ho_default", text = "A house of assassins and thieves with a lord at its head, older than the kingdom that used to stand below it. We are a guild only in the sense that a wolf pack is a guild. Alliance and Horde both climb this hill, and both are searched." } },
      choices = {
        { text = "And whom does the house serve?", next = "house2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    house2 = {
      big = true,
      lines = { { id = "ho2_default", text = "Itself. Kings have hired us and kings have feared us, and Lord Ravenholdt has outlasted several of each. Those who mistake us for common cutpurses generally learn the difference at short range." } },
      choices = {
        { text = "A house with no side is a house without honor.", next = "BACK", reply = "Honor is a coat one wears for company. We keep ours on a peg by the door, well brushed.", fx = { align = { honor = 1 } } },
        { text = "No side is the only safe side.", next = "BACK", reply = "Now you sound like one of mine. Mind that you don't say it where a king can hear.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    boxes = {
      lines = {
        { id = "b_default", text = "Because a lock made for practice knows it is a practice lock. A junkbox lifted from a real pocket was locked by someone who meant it. My students learn more from one of those than from a month of Zan's tumblers." },
        { id = "b_active", when = { questActive = TODO_QUEST("Junkboxes Needed") }, text = "You may open the boxes and rifle through them, if you can. But leave a few coins in each, because a student who finds an empty box learns only disappointment." },
      },
      choices = {
        { text = "Who is Zan?", next = "boxes2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    boxes2 = {
      lines = { { id = "b2_default", text = "Zan Shivsproket, our gnome, who builds traps and locks in the cellar and speaks very fast. His traps are excellent. His locks are honest, which is their whole defect, since no lock in the world outside this house was ever made by an honest man." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    syndicate = {
      lines = { { id = "s_default", text = "They are our own failures, in large part. Rogues we trained and nobles we once took coin from, playing at kingdom in the ruins of Alterac. Every one of their masks that leaves these hills is a favour to the house." } },
      choices = {
        { text = "You trained some of them yourself?", next = "BACK", reply = "A few. I taught them everything but judgement, which cannot be taught, and you see the result at Strahnbrad." },
        { text = "Something else.", next = "BACK" },
      },
    },
    keep = {
      lines = { { id = "k_default", text = "Patience. Any fool can be quick. I keep the ones who can stand in a doorway for six hours without shifting their weight, and then do one thing correctly. The rest I send home with all their fingers, which is generous." } },
      choices = {
        { text = "And the ones who are only quick?", next = "BACK", reply = "They do well for a season. Then they meet someone patient." },
        { text = "Something else.", next = "BACK" },
      },
    },
    hands = {
      lines = { { id = "ha_default", text = "Hold them out. Hm. Steady enough, and you've kept the nails short. Now tell me, when you lift a purse, where are your eyes?" } },
      choices = {
        { text = "On the mark's face, never the purse.", next = "BACK", reply = "Correct. The hand knows the way; it's the face that warns you. Somebody taught you properly.", fx = { affinity = 1 } },
        { text = "On the purse. I don't like to fumble.", next = "BACK", reply = "Then you fumble less and hang sooner. Watch the face. Come back when it's habit." },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    ravenholdt = { { id = "tp_rav", text = "The house is older than Lordaeron's crown was, and it has buried rather more kings. That is all a guest needs to know." } },
    syndicate = { { id = "tp_syn", text = "Amateurs with a grievance. We collect their insignia, and we pay for it." } },
    alterac = { { id = "tp_alt", text = "A kingdom lost by a man who thought treachery was the same thing as cleverness. We use him as a lesson." } },
    advice = { { id = "tp_ad", text = "Never run when you can walk, and never walk when you can stand still." } },
    _none = { { id = "tp_none", text = "If I knew, I would not say, and if I do not know, it is not worth knowing. Choose whichever comforts you." } },
  },
}

---------------------------------------------------------------------------
-- Bront Coldcleave: Southshore's butcher; feeds the town and the militia and frets about the herds.
---------------------------------------------------------------------------
P:NPC {
  key = "hb_bront", id = TODO_NPC("Bront Coldcleave"), name = "Bront Coldcleave", title = "Butcher",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "southshore" }, temper = { "bluff", "hearty" }, values = { "practical", "community" },
  notices = { "hunger" },
  impression = {
    first = "Bront Coldcleave is Southshore's butcher, a loud man with a clean apron who knows every farm in the foothills by its beef. Fewer of those farms send him cattle each month, and he counts them aloud.",
    third = "{name} met Bront Coldcleave, the butcher of Southshore.",
  },

  greetings = {
    { id = "g_default", text = "Good day to you! Fresh cuts on the block, and none of it's been further than the Fields." },
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "A dwarf! Now there's a customer who knows a proper joint. Come and see the haunch I've been saving." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I told the wife you'd be back. Nobody buys from Bront just the once." },
  },

  notice = {
    { id = "n_hunter", cat = "hunger", when = { class = "HUNTER" },
      text = "That beast of yours has its eye on my offcuts. Smart animal. I'll wrap something for it, if you're buying for yourself as well." },
    { id = "n_cook", cat = "hunger", when = { profession = "Cooking" },
      text = "You've a cook's burn on that hand. Then you'll want the shoulder and not the loin, because you'll know what to do with it." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Bront Coldcleave, butcher. I feed Southshore, and the militia, and any traveller who's sick of fish, which in this town is most of them by the second day." },
        { id = "h_horde", when = { faction = "Horde" }, text = "Bront Coldcleave. You're not from the Alliance side, and I'll be honest, I'd sooner you bought and went. But coin's coin, and a butcher who turns it away doesn't stay a butcher." },
      },
      again = {
        { id = "h_again", text = "What else can I do for you?" },
        { id = "h_again2", text = "Go on, I can talk and trim." },
        { id = "h_again3", text = "Aye? Mind the block, it's sharp work today." },
      },
      choices = {
        { text = "Show me what's on the block.", next = "BUSINESS" },
        { text = "Where does your meat come from?", next = "farms" },
        { text = "Everyone here seems sick of fish.", next = "fish" },
        { text = "How's the town holding up?", next = "town" },
        { text = "What would you roast for a feast?", next = "roast", when = { profession = "Cooking" } },
        { text = "I'm with the militia's effort. What do they need?", next = "militia", when = { faction = "Alliance", minLevel = 25 } },
        { text = "Good day, Bront.", next = "END" },
      },
    },
    farms = {
      lines = { { id = "f_default", text = "The Hillsbrad Fields, mostly. Farmer Ray and Farmer Getz for beef, and the Kalaba place for mutton. Good people, all of them. I used to send a boy up with the cart twice a week, and now I send two men with pikes." } },
      choices = {
        { text = "Is it that bad on the road?", next = "farms2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farms2 = {
      big = true,
      lines = { { id = "f2_default", text = "The dead from Tarren Mill come down at night. They don't take the cattle, friend. They kill the farmers and leave the cattle standing in the yard, lowing to be milked. I've seen it twice, and I'd give a year's takings never to see it a third time." } },
      choices = {
        { text = "The militia should clear Tarren Mill out.", next = "BACK", reply = "They'd need twice the men. But I'd sharpen every knife I own for them, and march besides.", fx = { align = { order = 1 } } },
        { text = "The farmers should come inside the walls.", next = "BACK", reply = "And leave land their grandfathers cleared? They won't. I've asked them myself, with tears in my eyes.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    fish = {
      lines = { { id = "fi_default", text = "It's a fishing town, so it's fish for breakfast and fish for supper. Hal McAllister sells a good fish, I'll never say otherwise. But a man needs something that walked, now and then, and that's when they come to Bront." } },
      choices = {
        { text = "So you and Hal are rivals.", next = "fish2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    fish2 = {
      lines = { { id = "fi2_default", text = "Rivals! We've played draughts every rest day for fifteen years. He tells me my beef's tough and I tell him his cod's been dead longer than a deathguard. Then Barkeep Kelly brings us each a pint and we start again." } },
      choices = {
        { text = "That sounds like a good friendship.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    town = {
      lines = { { id = "t_default", text = "We're holding. Magistrate Maleb keeps order and Marshal Redpath keeps the walls, and Chef Jessen at the inn still buys my best cuts, so somebody's got coin. But there are empty houses on the north lane that weren't empty last spring." } },
      choices = {
        { text = "Where did those families go?", next = "BACK", reply = "South, by boat, to Menethil or Stormwind. I don't blame them. I only wish they'd said goodbye." },
        { text = "Something else.", next = "BACK" },
      },
    },
    roast = {
      lines = { { id = "r_default", text = "A whole forerib, hung ten days, with nothing on it but salt and a hot fire. Chef Jessen does clever things with turtle, and good luck to him. But when Southshore wants to celebrate, they come to me for the rib." } },
      choices = {
        { text = "Ten days hung. I'll remember that.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    militia = {
      lines = { { id = "m_default", text = "Salt pork, and plenty of it, because it keeps on patrol. I give Redpath's lads a side every week at cost, and I'd give it free if the wife would let me. If you're riding out with them, take some jerky. It's on the hook by the door." } },
      choices = {
        { text = "You're doing your part, Bront.", next = "BACK", reply = "It's little enough. I'm too fat to hold a pike, so I feed the ones who can.", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_fs", text = "I knew some of those folk when they were alive. That's the worst of it. One of them used to buy my sausages." } },
    syndicate = { { id = "tp_syn", text = "Thieves in fancy masks. They took a cart of mine on the Alterac road, and I hope the beef choked them." } },
    lordaeron = { { id = "tp_lord", text = "We paid our taxes to it and it's gone. Stormwind's a long way off, friend, and it feels longer every winter." } },
    advice = { { id = "tp_ad", text = "Cut across the grain, and never trust a thin butcher." } },
    _none = { { id = "tp_none", text = "Couldn't tell you, friend. If it's not on a hook, I don't know it." } },
  },
}

---------------------------------------------------------------------------
-- Robert Aebischer: Southshore's superior armorsmith; mends the militia's kit and sells the best mail in the foothills.
---------------------------------------------------------------------------
P:NPC {
  key = "hb_aebischer", id = TODO_NPC("Robert Aebischer"), name = "Robert Aebischer", title = "Superior Armorsmith",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "southshore" }, temper = { "steady", "proud" }, values = { "craft", "dutiful" },
  notices = { "kit", "craft" },
  impression = {
    first = "Robert Aebischer forges and sells armor in Southshore, and the militia's dented breastplates pass across his anvil every week. He reads the state of the war in those dents and does not much like the story.",
    third = "{name} met Robert Aebischer, the armorsmith of Southshore.",
  },

  greetings = {
    { id = "g_default", text = "Afternoon. Mail and plate on the racks, all my own work. Have a look, and knock on it if you like." },
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "A dwarf, in my forge. I'll be glad of your opinion and afraid of it in equal parts. Go on, look at the rivets." },
    { id = "g_back", when = { metBefore = true }, text = "Back, are you? Let's see how the last piece wore. Turn round." },
  },

  notice = {
    { id = "n_broken", cat = "kit", when = { durability = { max = 0.35 } },
      text = "That's been through something. I can tell you what, too: those are axe cuts, low and from the left, so you were fighting someone shorter than you who knew his business." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "You've a smith's forearms. Then tell me honestly what you think of that hauberk by the door, because my own apprentice won't." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Robert Aebischer, armorsmith. I make and mend for Southshore's militia first and for travellers after, and these days the mending takes up more of the forge than the making." },
        { id = "h_paladin", when = { class = "PALADIN" }, text = "Robert Aebischer, armorsmith. You carry the Light's hammer, I see. We had knights of the Silver Hand through here in the old days, and I shod their horses as a boy. It's good to see the like again." },
      },
      again = {
        { id = "h_again", text = "Something else? I've a fire to keep." },
        { id = "h_again2", text = "Go on, the iron's not ready yet." },
        { id = "h_again3", text = "Aye, ask." },
      },
      choices = {
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "You can read a fight from the damage?", next = "read" },
        { text = "Where do you get your iron?", next = "iron" },
        { text = "What do they call superior about it?", next = "superior" },
        { text = "How would you temper mail for these hills?", next = "temper", when = { profession = "Blacksmithing" } },
        { text = "Dwarven mail's lighter. You know that.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Good day to you.", next = "END" },
      },
    },
    read = {
      lines = { { id = "r_default", text = "Any smith can, after enough years. Syndicate blades leave thin cuts, high up, because they go for the throat. The ogres up in Alterac leave a plate bent like a spoon. And lately I see small punctures, clean through, in the backs." } },
      choices = {
        { text = "In the backs?", next = "read2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    read2 = {
      big = true,
      lines = { { id = "r2_default", text = "Crossbow bolts, from the Tarren Mill deathguards. They don't stand and fight, they shoot a patrol as it turns for home. I've started putting a second layer between the shoulders, and I don't charge the militia for it. Should I be telling the Marshal what I see?" } },
      choices = {
        { text = "Yes. He needs to know how his men die.", next = "BACK", reply = "Aye. I'll go up tonight. It's not a smith's place, but it's nobody else's either.", fx = { affinity = 1, align = { order = 1 } } },
        { text = "No. Fix the armor and let soldiers soldier.", next = "BACK", reply = "Maybe so. I'll keep adding the plate, then, and keep my counsel.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    iron = {
      lines = { { id = "i_default", text = "It used to come down from Alterac, good grey ore, before the kingdom fell and the Syndicate took the roads. Now it's Azurelode, when the mine's ours, and bar stock by ship from Menethil when it isn't." } },
      choices = {
        { text = "Is Azurelode yours at the moment?", next = "iron2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    iron2 = {
      lines = { { id = "i2_default", text = "The miners hold it, bless them, but they've had the Horde in the shafts more than once, and I'm told the foreman sleeps with a pick in his hand. If that mine goes, I'm mending with horseshoes inside a season." } },
      choices = {
        { text = "Then the mine's worth defending.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    superior = {
      lines = { { id = "s_default", text = "The guild in Stormwind gave me the title, and I'll not pretend I didn't frame the letter. It means the rings are riveted and not just butted, and that I'll stand behind every piece. Anyone can sell you armor. I'll tell you where it's weak." } },
      choices = {
        { text = "Where's yours weak, then?", next = "BACK", reply = "Under the arm, same as everyone's. Keep your elbows in, and it'll never matter.", fx = { trait = { honest = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    temper = {
      lines = { { id = "t_default", text = "Softer than you'd think. It's wet here, and brittle rings snap in the cold off the sea. I draw the temper back until a ring will bend before it breaks, and I oil everything twice. A rusted link is worse than a missing one." } },
      choices = {
        { text = "Bend before it breaks. That's sound.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    dwarf = {
      lines = { { id = "d_default", text = "I do know it, and I'll not argue with Ironforge. Your smiths draw a finer wire than I can, and I've a dwarven coif on that shelf I've been taking apart for a year to learn how. It's the only thing in the shop I didn't make." } },
      choices = {
        { text = "Honest of you to say so.", next = "BACK", reply = "A smith who can't admire better work will never do any.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_fs", text = "They wear our old militia's mail, some of them. I've seen my own maker's mark on a dead man walking, and I've not slept right since." } },
    syndicate = { { id = "tp_syn", text = "They cut the Alterac ore road, and I've cursed them every working day for it." } },
    alterac = { { id = "tp_alt", text = "Fine iron, and a rotten king. The iron deserved better." } },
    silver_hand = { { id = "tp_hand", text = "I shod their horses as a lad. They tipped in silver and said thank you, every one." } },
    advice = { { id = "tp_ad", text = "Oil your mail every night you've been near the sea. Salt gets in where swords can't." } },
    _none = { { id = "tp_none", text = "Can't help you there. If it can't be hammered, it's not my trade." } },
  },
}

---------------------------------------------------------------------------
-- Sarah Raycroft: Southshore's general goods seller; knows who is buying for a journey and who is buying to leave.
---------------------------------------------------------------------------
P:NPC {
  key = "hb_raycroft", id = TODO_NPC("Sarah Raycroft"), name = "Sarah Raycroft", title = "General Goods",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "southshore" }, temper = { "warm", "observant" }, values = { "community", "practical" },
  notices = { "kit", "class" },
  impression = {
    first = "Sarah Raycroft keeps Southshore's general store and can tell from a shopping list whether a customer is going on patrol or leaving town for good. She says nothing about it and packs their baskets carefully either way.",
    third = "{name} met Sarah Raycroft, who sells general goods in Southshore.",
  },

  greetings = {
    { id = "g_default", text = "Hello, love. Rope, lamp oil, waterskins, whatever you're short of. Have a look round." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, hello again! You're still in one piece, so the last lot must have done you." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Oh. Well. You're here, and you've a purse, and I'll serve you. But please be quick, because it frightens the children." },
  },

  notice = {
    { id = "n_new", cat = "kit", when = { maxLevel = 22 },
      text = "You're new to the road, aren't you? No shame in it. Take two waterskins and not one, and don't let anybody sell you a map of Alterac." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! Master Odelic of the Kirin Tor is staying in town, did you know? He bought every candle I had, so I hope you weren't after candles." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Sarah Raycroft, and this is the general store, such as it is. If Southshore needs it and it isn't a fish, it likely came through my door." },
        { id = "h_nightelf", when = { race = "NightElf" }, text = "Sarah Raycroft, and welcome. We don't see many of your people this far east, and I hope you'll forgive the staring. I've a few things from Auberdine that came by ship, if you're missing home." },
      },
      again = {
        { id = "h_again", text = "Anything else, love?" },
        { id = "h_again2", text = "Go on, I'm only counting stock." },
        { id = "h_again3", text = "Yes? Mind the barrel, the lid's loose." },
      },
      choices = {
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "You must know everyone's business here.", next = "business" },
        { text = "What sells most, these days?", next = "sells" },
        { text = "How do goods still reach Southshore?", next = "ships" },
        { text = "I'm heading into Alterac. What should I pack?", next = "pack", when = { minLevel = 28 } },
        { text = "I've come from Menethil. Any message to carry?", next = "menethil", when = { faction = "Alliance", minLevel = 20 } },
        { text = "Thank you, Sarah.", next = "END" },
      },
    },
    business = {
      lines = { { id = "b_default", text = "Only what they buy, love, but that's most of it. When Lieutenant Orinelle wants extra rope, there's trouble on the coast. When Loremaster Dibbs buys ink, he's had a letter from Dalaran. And when a family buys a trunk, well." } },
      choices = {
        { text = "They're leaving.", next = "business2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    business2 = {
      big = true,
      lines = { { id = "b2_default", text = "They're leaving. I've sold nine trunks since the spring. I never ask, and I always put a bit of bread in the bottom for the boat. Some of my neighbours think I shouldn't sell them at all, and make it harder to go. What do you think?" } },
      choices = {
        { text = "Sell them. Nobody should be kept in a war.", next = "BACK", reply = "That's what I tell myself. It doesn't make the street any less quiet, but thank you.", fx = { affinity = 1, align = { order = -1 } } },
        { text = "Your neighbours are right. A town survives by staying.", next = "BACK", reply = "Maybe they are. But I'll not be the one to bar a mother's way to the dock.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    sells = {
      lines = { { id = "s_default", text = "Lamp oil, because nobody likes the dark any more. Bandage linen, more than I can keep in. And sweets, would you believe. The children here get a great many sweets, and I think it's their parents saying sorry." } },
      choices = {
        { text = "Sorry for what?", next = "BACK", reply = "For not having left, I think. Or for thinking about it. I slip in an extra one when I can.", fx = { trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ships = {
      lines = { { id = "sh_default", text = "By sea, from Menethil, when the weather and the murlocs allow. The road north is the Syndicate's and the road east goes past Tarren Mill, so it's ships or nothing. Micha Yance and I share a hold between us and split the losses." } },
      choices = {
        { text = "Are there many losses?", next = "ships2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ships2 = {
      lines = { { id = "sh2_default", text = "One cargo in five, this year. The murlocs down the coast have got bold, and there's talk of something worse under the water that's stirring them up. Lieutenant Orinelle's the one to ask. He's had people look into it." } },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    pack = {
      lines = { { id = "p_default", text = "Warm things, first. It's snow by the time you reach the ruins. Rope, flint, and food for two days more than you think. And don't take the Strahnbrad road alone, love, whatever anyone tells you about it being quiet." } },
      choices = {
        { text = "Sound advice. I'll take the rope.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
    menethil = {
      lines = { { id = "m_default", text = "Would you? My sister keeps a net loft by the harbour there. Tell her Sarah's well, and the shop's still open, and that I haven't bought a trunk. She'll know what that means." } },
      choices = {
        { text = "I'll find her and tell her.", next = "BACK", fx = { affinity = 1, trait = { kind = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_fs", text = "I try not to think of them as people we knew. It's easier, and I'm not proud of that." } },
    syndicate = { { id = "tp_syn", text = "They buy from me in plain clothes, some of them. I know, and they know I know, and I take the money." } },
    dalaran = { { id = "tp_dal", text = "There's a great purple bubble where it used to be. The loremaster says the mages are rebuilding, and I say they might answer their letters." } },
    advice = { { id = "tp_ad", text = "Buy the good rope, love. Nobody ever wished they'd bought the cheap rope." } },
    _none = { { id = "tp_none", text = "I couldn't say, love. I only know what goes over the counter." } },
  },
}

---------------------------------------------------------------------------
-- Jaysin Lanyda: sells poisons and reagents in Southshore; an honest town's one dubious shop.
---------------------------------------------------------------------------
P:NPC {
  key = "hb_lanyda", id = TODO_NPC("Jaysin Lanyda"), name = "Jaysin Lanyda", title = "Poisons & Reagents",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "southshore" }, temper = { "sly", "genial" }, values = { "practical", "discreet" },
  notices = { "class" },
  impression = {
    first = "Jaysin Lanyda sells reagents and poisons in Southshore, and he is cheerful about being the least respectable shopkeeper in a respectable town. He is careful to say that everything he sells is for the war.",
    third = "{name} met Jaysin Lanyda, who sells poisons and reagents in Southshore.",
  },

  greetings = {
    { id = "g_default", text = "Come in, come in, and shut the door. The magistrate's wife walks past at this hour, and she worries." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Ah. One of my regulars, or one who will be. I've fresh stock, and I never saw you." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Either it worked or it didn't, and I never ask which." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin. Now, before you say anything, the reagents are all perfectly holy, and the other shelf is rat poison. Mostly rat poison." },
    { id = "n_caster", cat = "class", when = { class = { "MAGE", "PRIEST", "DRUID", "SHAMAN", "WARLOCK" } },
      text = "You'll be wanting the reagent side. Runes, powders, the usual. I keep them well apart from the other things, since I had a mix-up once." },
  },

  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Jaysin Lanyda. Reagents for those who cast, and something stronger for those who'd rather not be seen doing it. All for the defence of Southshore, you understand, and I've a letter from the Marshal saying so." },
        { id = "h_rogue", when = { class = "ROGUE" }, text = "Jaysin Lanyda. You're in the trade, so I'll not dress it up. There's a war on, the militia's outnumbered, and a coated blade evens the odds. Nobody in this town likes it, and nobody's asked me to stop." },
      },
      again = {
        { id = "h_again", text = "What else? Quietly, now." },
        { id = "h_again2", text = "Go on. I'm all ears, and no memory." },
        { id = "h_again3", text = "Yes? The door's shut, so say what you like." },
      },
      choices = {
        { text = "Show me your stock.", next = "BUSINESS" },
        { text = "Does Southshore mind a poison seller?", next = "mind" },
        { text = "Who buys poison in a fishing town?", next = "buys" },
        { text = "Where do you get it all?", next = "source" },
        { text = "What works on a Forsaken?", next = "undead", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Poison is a coward's weapon.", next = "coward", when = { class = { "PALADIN", "WARRIOR" } } },
        { text = "I was never here.", next = "END" },
      },
    },
    mind = {
      lines = { { id = "m_default", text = "They cross the street, some of them. Raleigh the Devout prays for me by name, which is thoughtful. But when the Syndicate were poisoning wells two summers back, it was me the Magistrate came to, at midnight, to say what it was and how to cure it." } },
      choices = {
        { text = "So they need you and won't say so.", next = "mind2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    mind2 = {
      big = true,
      lines = { { id = "m2_default", text = "That's the size of it, and I don't hold it against them. A town wants to think well of itself. I'm the cupboard they keep the ugly tools in, and I've a comfortable living out of being that cupboard." } },
      choices = {
        { text = "It's honest work, done for the right side.", next = "BACK", reply = "I think so, on good days. Thank you for saying it with a straight face.", fx = { affinity = 1, align = { honor = -1 } } },
        { text = "A town shouldn't need a man like you.", next = "BACK", reply = "No, it shouldn't. Take that up with Tarren Mill; they started it.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    buys = {
      lines = { { id = "b_default", text = "The militia's scouts, on the quiet. Farmers, for the wolves, and I believe most of them. And every rogue the Alliance sends through on the way to Alterac, who all say the same thing, that it's for a friend." } },
      choices = {
        { text = "And SI:7?", next = "BACK", reply = "I've never heard of them, and if a quiet man from Stormwind buys a great deal twice a year, I've never seen him either." },
        { text = "Something else.", next = "BACK" },
      },
    },
    source = {
      lines = { { id = "s_default", text = "The reagents come by ship with Micha Yance's cargo. The rest I make in the back from what grows here. Nandar Branson sells me my glassware and pretends not to know what it's for, and I pretend he's fooling me." } },
      choices = {
        { text = "A whole town of people pretending.", next = "BACK", reply = "It's what keeps us civil. I recommend it.", fx = { trait = { witty = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    undead = {
      lines = { { id = "u_default", text = "Less than you'd hope. Nothing that works on the blood, because they've none moving. What slows a living man does very little. You want the kind that eats at flesh directly, and you want a great deal of it." } },
      choices = {
        { text = "So crippling poison is wasted on them?", next = "undead2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    undead2 = {
      lines = { { id = "u2_default", text = "Not wasted, since a leg's a leg, and it still slows the leg. But don't trust anything that's meant to work on the mind or the heart. I learned that from a scout who came back, and from two who didn't." } },
      choices = {
        { text = "I'll remember. Thank you.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
    coward = {
      lines = { { id = "c_default", text = "It is, and I'll not argue the point. But I've watched brave men go up the Tarren road in plate and come home on a cart. The dead don't fight fair, friend. I'd sooner sell a coward's weapon than dig another hero's grave." } },
      choices = {
        { text = "There's truth in that. I don't like it.", next = "BACK", reply = "Nor do I. If you find a cleaner way to win, I'll shut the shop and thank you.", fx = { affinity = 1 } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_fs", text = "Hard to poison, and good at it themselves. I take a professional interest, and I lock my door at night." } },
    syndicate = { { id = "tp_syn", text = "They used to be customers, before they started on the wells. I've standards. They're low, but I've got them." } },
    new_plague = { { id = "tp_np", text = "There's talk the dead are brewing something at Tarren Mill. If it's true, nothing on my shelves will answer it, and that frightens me." } },
    advice = { { id = "tp_ad", text = "Label everything, and never taste to check." } },
    _none = { { id = "tp_none", text = "Never heard of it, and I mean that in the ordinary way this time." } },
  },
}
