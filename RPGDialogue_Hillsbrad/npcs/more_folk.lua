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
