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
    first = "She sells to anyone and seems proud of answering to no one.",
    third = "{name} met Kris Legace, a freewheeling trader who sells leather armour in the ruins of Durnholde Keep.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There's my favourite customer, still breathing and still buying. Come round the back, friend, where the competition can't see us." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. I'll sell to you, since I sell to anyone, but keep your voice down and your hands out of my crates." },
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
    w3_customer = {
      lines = {
        { id = "w3_customer_1", text = "Last Tuesday an orc from Tarren Mill bought a pair of bracers at noon, and a Southshore lieutenant bought the matching pair at dusk, and neither knew the other had been here. If they ever meet on the road, they'll be very well matched, and I'll have done my bit for fair fighting." },
      },
      choices = {
        { text = "Doesn't that trouble you at all?", next = "w3_trouble" },
        { text = "That's the cleverest sale I've heard of.", next = "BACK", reply = "Clever's my trade, friend. Leather's only the excuse." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_trouble = {
      lines = {
        { id = "w3_trouble_1", text = "What troubles me is a customer who doesn't pay, and both of them paid. The war was here before I came and it'll be here after I'm gone, so I may as well see that everyone in it has decent boots." },
      },
      choices = {
        { text = "A practical view. Something else.", next = "BACK" },
      },
    },
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
        { text = "Answering to no one doesn't mean cheating everyone.", next = "BACK", reply = "No, it doesn't, and that's why folk still come all this way to me. A free trader keeps her word or starves.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "No banner means no rules. Take what the market gives you.", next = "BACK", reply = "That's how a lot of free traders talk, right up until nobody trusts them and they end up selling to ogres.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your leather.", next = "BUSINESS" },
        { text = "Why trade from a Syndicate ruin?", next = "why" },
        { text = "The Syndicate must know you're here.", next = "syndicate" },
        { text = "Selling to both sides isn't very loyal.", next = "loyal" },
        { text = "Where does your leather come from?", next = "stock" },
        { text = "This was the orcs' prison, once.", next = "keep" },
        { text = "I'm from Southshore. What's the keep's weak side?", next = "weak", when = { faction = "Alliance" } },
        { text = "I could use a quiet way in and out.", next = "quiet", when = { class = "ROGUE" } },
        { text = "Who's your best customer, then?", next = "w3_customer" },
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
    first = "He thinks a well-made seam is the last dignity the dead have.",
    third = "{name} met Mallen Swain, the Forsaken tailoring supplier at Tarren Mill.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, you again, and your seams are holding nicely, I see. Do come in; I've a new dye I think you'll appreciate." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Take your thread and your needles, and try not to bleed on them, as I've asked before." },
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
    w3_difficult = {
      lines = {
        { id = "w3_difficult_1", text = "Apothecary Lydon, who buys my finest silk thread to tie off his specimens and then complains that it frays in the acid. I've told him it's meant for collars, not for whatever he's pickling, and he looks at me as if I'm the one who's being unreasonable." },
      },
      choices = {
        { text = "What is he pickling?", next = "w3_pickling" },
        { text = "Sell him the coarse thread instead.", next = "BACK", reply = "I tried that, and he sent it back with a note saying the specimen had escaped. I've gone back to silk." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_pickling = {
      lines = {
        { id = "w3_pickling_1", text = "I've no idea and I've made a point of not finding out. Whatever it is, it twitches in the jar when I deliver the thread, and I'd like to go on not knowing for as long as Tarren Mill lets me." },
      },
      choices = {
        { text = "Wise. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true,
          text = "Mallen Swain, tailoring supplies. I sell to the deathguards, the apothecaries and anyone else in Tarren Mill who still cares how they're held together." },
        { id = "h_living", when = { race = { "Orc", "Troll", "Tauren" } },
          text = "Mallen Swain, tailoring supplies. The living buy thread for their clothes, and the dead buy it for themselves, and I sell to both without asking which." },
      },
      again = {
        { id = "h_again", text = "Anything further? Mind the needle cushion; it bites." },
        { id = "h_again2", text = "Go on. I'm only threading a needle." },
        { id = "h_again3", text = "Yes? I can listen and wax thread at once." },
      },
      choices = {
        { text = "A tailor owes the dead a well-made seam.", next = "BACK", reply = "I've always thought so. It's the last dignity they have, and I won't skimp on it.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "The Deathguard can't feel the cold. Sew them cheap and quick.", next = "BACK", reply = "They can't feel it, but they can see it, and so can everyone they march beside. I'll sew it properly.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "The dead buy thread for themselves?", next = "stitches" },
        { text = "Who were you before?", next = "before" },
        { text = "Who else keeps Tarren Mill supplied?", next = "town" },
        { text = "Your dyes are all dark.", next = "dye" },
        { text = "You said you had a shop in Hillsbrad.", next = "shop" },
        { text = "Which thread should a tailor carry out here?", next = "tailor", when = { profession = "Tailoring" } },
        { text = "Could you look at my own stitches?", next = "mend", when = { race = "Scourge" } },
        { text = "Who's your most difficult customer?", next = "w3_difficult" },
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
      lines = { { id = "tn2_default", key = true, text = "A very good one, and wasted on uniform patches. He can cut a shadoweave robe that would turn heads in the Undercity, and instead he lets out deathguards' collars. I've told him he should go back, and he says the town needs him more than the city does." } },
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
        { id = "sp2_done", when = { questDone = TODO_QUEST("Battle of Hillsbrad") }, text = "I am told you were among those sent down to the Fields. I shan't ask what you did there, but if the shop with the green shutters still has its roof, I should like to be told." },
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
    first = "He grows half his mushrooms in a cellar he won't describe.",
    third = "{name} met Jason Lemieux, who sells mushrooms at Tarren Mill.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, the hungry one. I grew a fresh batch in the cellar for you, and no, I'll still not tell you where the cellar is." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. The mushrooms are fresh enough, and you can take them or leave them, as you please." },
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
    w3_strange = {
      lines = {
        { id = "w3_strange_1", text = "A pale one with a frilly cap that hummed, very softly, if you put your ear to it in the dark. I'd half decided to keep it as a pet when Apothecary Lydon heard about it and took it away in a jar, and I've not had the heart to ask what became of it." },
      },
      choices = {
        { text = "Did it hum a tune?", next = "w3_tune" },
        { text = "Lydon takes everything interesting, I hear.", next = "BACK", reply = "He does, and he never brings anything back. I've started hiding the odd ones under a sack until they've gone quiet." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_tune = {
      lines = {
        { id = "w3_tune_1", text = "Something like a lullaby, I thought, though Samsa said it was only the damp. I hum it to the new batches now, out of fondness, and the orcs think I've gone soft in the head, which isn't far wrong." },
      },
      choices = {
        { text = "Hum away, Jason. Something else.", next = "BACK" },
      },
    },
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
        { text = "A mushroom seller should tell the living which caps are poison.", next = "BACK", reply = "I tell them all, every time, because the living are dreadfully easy to kill and dreadfully quick to blame.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "The living buy blind. Sell them whatever's growing.", next = "BACK", reply = "And bury them afterwards? I've done enough digging in my time, thank you.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me what you have.", next = "BUSINESS" },
        { text = "Where do you grow them?", next = "grow" },
        { text = "You're cheerful, for a Forsaken.", next = "cheer" },
        { text = "Who buys from you in Tarren Mill?", next = "buyers" },
        { text = "The old mill itself is a ruin.", next = "mill" },
        { text = "What's on the right, then?", next = "right" },
        { text = "Don't you find this town grim, brother?", next = "grim", when = { race = "Scourge" } },
        { text = "How would you cook these, if you could taste?", next = "cook", when = { profession = "Cooking" } },
        { text = "What's the strangest mushroom you've grown?", next = "w3_strange" },
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
      lines = { { id = "by2_default", text = "Samsa buys one, every week, and sets it on the wall where he stands watch. He never eats it. I asked him why once, and he said it gives the crows something to look at besides him, which is the only joke I've ever heard him make." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Good evening, and welcome back. Your seat by the lamp is free, and I'm keen to see how your seams have come along." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Good evening. Sit by the lamp if you've come to learn, and otherwise stand still and don't fidget." },
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
    w3_finest = {
      lines = {
        { id = "w3_finest_1", text = "The garrison's banner, which hangs over the inn: black field, the Dark Lady's sigil in silver thread, and every stitch done by lamplight over three weeks. High Executor Darthalia looked at it for a long while and said \"acceptable,\" which from her is a medal." },
      },
      choices = {
        { text = "Did anyone else notice the work?", next = "w3_notice" },
        { text = "Three weeks for one banner.", next = "BACK", reply = "A banner is looked at by every soldier every morning, {class}. It is the one piece of cloth in the town that cannot be hurried." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_notice = {
      lines = {
        { id = "w3_notice_1", text = "An orc from the Warchief's detachment stood under it and told me his clan's banners were painted on hide, and that he'd never seen thread do what mine did. I've thought about that more than about anything the High Executor ever said." },
      },
      choices = {
        { text = "High praise from an orc. Something else.", next = "BACK" },
      },
    },
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
        { text = "A tailor should never pass off coarse linen as fine.", next = "BACK", reply = "No, and I never have, though I've been tempted when the Deathguard pay me in promises.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "If they can't tell the difference, charge for silk.", next = "BACK", reply = "They can't, it's true, but I can, and I've to look at my own work every evening.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Teach me what you know.", next = "BUSINESS" },
        { text = "Mallen Swain says you're wasted here.", next = "wasted", when = { heardLine = "hb_mallen_swain.tn2_default" } },
        { text = "A tailor seems out of place on a front line.", next = "front" },
        { text = "What does the garrison wear through fastest?", next = "wear" },
        { text = "Who do you work with in the town?", next = "town" },
        { text = "What should I learn after wool?", next = "next", when = { profession = "Tailoring" } },
        { text = "What's the finest thing you've sewn here?", next = "w3_finest" },
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
      lines = { { id = "w_default", text = "The left shoulder, where the shield strap rides, and the knees. Deathguard Samsa is through a pair of trousers a month, because he kneels to aim and won't be told. Humbert wears out nothing at all, and I've begun to wonder what he does on watch." } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "It's stew again, and you came back for it, which means either you liked it or you've no taste. Sit down, and tell me which." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "It's stew. You've complained before, so eat it or don't, but don't tell me about it afterwards." },
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
    w3_wolves = {
      lines = {
        { id = "w3_wolves_1", text = "Every evening, the scraps and the bones and whatever the orcs leave in the bowl, which isn't much. The wolves are better company than their riders, if I'm honest, because they eat what they're given and lick the pot afterwards." },
      },
      choices = {
        { text = "Which wolf is your favourite?", next = "w3_favourite" },
        { text = "The orcs might not like you spoiling them.", next = "BACK", reply = "The orcs don't notice. Krusk's wolf, though, sits by my door every night now, and Krusk's noticed that." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_favourite = {
      lines = {
        { id = "w3_favourite_1", text = "Krusk's, a grey bitch with a torn ear, who follows me round the kitchen like I'm the pack leader. Krusk says I've stolen her, and I say she's got taste, and we've agreed to leave it there." },
      },
      choices = {
        { text = "She's got taste. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Derak Nightfall, cook. The Dark Lady's soldiers don't need feeding, but the Warchief's do, and so do their wolves, and so does every sellsword who comes up the road. I feed the lot out of one pot." },
        { id = "h_scourge", when = { race = "Scourge" }, text = "Derak Nightfall, cook. You'll not be wanting a bowl, being one of us, so we can skip the part where you pretend to like it. That's restful, I'll admit." },
      },
      again = {
        { id = "h_again", text = "What? I've a pot on, and it's boiling." },
        { id = "h_again2", text = "Go on, then. It wants stirring, but it can stir itself a moment." },
        { id = "h_again3", text = "Ask. Don't lean on the table, it's the clean one." },
      },
      choices = {
        { text = "A cook should tell you plainly when the meat's gone off.", next = "BACK", reply = "I'd tell you if I could smell it. Since I can't, I ask the living, and they're always honest about that.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "If it tastes bad, add more salt. Nobody will ask.", next = "BACK", reply = "They always ask, because the living complain about everything. Salt's the least of it.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What have you got?", next = "BUSINESS" },
        { text = "What goes in the pot?", next = "pot" },
        { text = "How does a dead man end up a cook?", next = "cook" },
        { text = "Who complains the most?", next = "complain" },
        { text = "Your stew needs acid. A little sour apple.", next = "apple", when = { profession = "Cooking" } },
        { text = "I'll tell you honestly how it tastes.", next = "honest", when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "Do you feed the orcs' wolves too?", next = "w3_wolves" },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You've come back to the hills, and with clean cuts on your herbs, I'd wager. Show me, and then we'll go further." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Keep off the drying racks, cut only what I tell you, and don't trample anything else in my hills." },
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
    d2_users = {
      lines = {
        { id = "d2_users_1", text = "Lydon takes the most, as you've heard, and the rest go to the poisoners and to whoever's wrapping the Deathguard's wounds. Even Darthalia keeps a pot of peacebloom on her sill, though she'll tell you it's for the smell, and the dead don't notice smells much." },
      },
      choices = {
        { text = "Then why does she keep it?", next = "d2_users2" },
        { text = "A High Executor with a flowerpot.", next = "d2_users2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_users2 = {
      lines = {
        { id = "d2_users2_1", text = "I think she had a garden in life, and her hands remember it even when she doesn't. I water the pot when she's out on the walls, and neither of us has ever mentioned it." },
      },
      choices = {
        { text = "Your secret's safe with me.", next = "BACK" },
        { text = "Something else, Aranae.", next = "BACK" },
      },
    },
    d2_danger = {
      lines = {
        { id = "d2_danger_1", text = "The Southshore militia, chiefly, who shoot first at anyone bending over in the fields. Then the gnolls in the south hills, and the bears, and once a Syndicate patrol who wanted my satchel and changed their minds when they saw what was in it." },
      },
      choices = {
        { text = "What was in it?", next = "d2_danger2" },
        { text = "You don't seem the kind to scare easily.", next = "d2_danger2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_danger2 = {
      lines = {
        { id = "d2_danger2_1", text = "Fadeleaf and a jar of something Lydon asked me to carry back for him, with a skull on the lid. I didn't know what was in the jar, but they didn't either, and that was enough for a man in a black mask." },
      },
      choices = {
        { text = "A good bluff.", next = "BACK", reply = "It wasn't a bluff, it was honesty with a skull on it, and the skull did the work." },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    d2_druid = {
      lines = {
        { id = "d2_druid_1", text = "Then you'll have learned the kind side of it and I the other. The druids teach that a plant is a gift of the land, and I'd agree, though in Tarren Mill we've learned what a gift can be used for." },
      },
      choices = {
        { text = "The land would not approve.", next = "BACK", reply = "The land isn't fighting the Alliance. I am, and so is everyone who lives here now." },
        { text = "Ask you something else.", next = "BACK" },
      },
    },
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
        { text = "An herbalist should leave the roots so the plant comes back.", next = "BACK", reply = "Exactly. Rip out a whole patch of kingsblood and you'll never see it there again, and nor will anyone else.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Strip the whole hillside. The Alliance shouldn't have any of it.", next = "BACK", reply = "A tempting thought, but the hills don't care whose banner they grow under. Leave the roots, and win the war some other way.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Teach me the plants.", next = "BUSINESS" },
        { text = "What grows well around here?", next = "grows" },
        { text = "What do the apothecaries want with it?", next = "apoth" },
        { text = "That's a name to frighten students with.", next = "name" },
        { text = "Where are your northern spots?", next = "spots", when = { profession = "Herbalism" } },
        { text = "My people ask the plant first. It matters.", next = "ask", when = { race = "Tauren" } },
        { text = "Who else in Tarren Mill uses your herbs?", next = "d2_users" },
        { text = "These hills must hold dangers for an herbalist.", next = "d2_danger" },
        { text = "I've learned herbs from the druids.", next = "d2_druid", when = { class = "DRUID" } },
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
    d2_house = {
      lines = {
        { id = "d2_house_1", text = "Lord Ravenholdt, whom you will meet if he wishes it and not otherwise. Smudge brews in the cellar, Zan tinkers behind his curtain, and a few dozen rogues sleep in shifts and pretend they are not watching each other, which is the first lesson of the house." },
      },
      choices = {
        { text = "Tell me about Lord Ravenholdt.", next = "d2_house2" },
        { text = "A house of watchers. Charming.", next = "d2_house2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_house2 = {
      lines = {
        { id = "d2_house2_1", text = "He is old, he is patient, and he has never in my hearing raised his voice, because he has never needed to. If you want his good opinion, do what you said you would do, and do it before anyone thought to ask." },
      },
      choices = {
        { text = "I'll remember that.", next = "BACK" },
        { text = "Something else, Fahrad.", next = "BACK" },
      },
    },
    d2_find = {
      lines = {
        { id = "d2_find_1", text = "They are brought, or they are clever, or they are lost, and the lost ones are rarely allowed to stay lost. The road up from Hillsbrad is narrower than it looks and watched from more places than you saw on your way in." },
      },
      choices = {
        { text = "I didn't see anyone watching.", next = "d2_find2" },
        { text = "And the clever ones?", next = "d2_find2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_find2 = {
      lines = {
        { id = "d2_find2_1", text = "No, you did not, which is how it should be. The clever ones I keep an eye on, because a man who finds this house by his own wits will one day try to find something else in it, and I like to be in the room when he does." },
      },
      choices = {
        { text = "Fair warning, then.", next = "BACK", reply = "It is the only warning you will have from me. Treasure it." },
        { text = "Ask another thing.", next = "BACK" },
      },
    },
    d2_light = {
      lines = {
        { id = "d2_light_1", text = "It troubles nobody here, since the house has taken coin from priests before, and from their enemies in the same week. Your Light may watch everything, but in this manor it is not the only thing watching." },
      },
      choices = {
        { text = "The Light sees more than you think.", next = "BACK", reply = "Then it will have seen that I am very good at my work. Good day to it." },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { text = "Who else lives in this manor?", next = "d2_house" },
        { text = "How do people find Ravenholdt at all?", next = "d2_find" },
        { text = "I serve the Light. Does that trouble the house?", next = "d2_light", when = { class = { "PALADIN", "PRIEST" } } },
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
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "There's a friendly face! I saved a good cut for whoever came in first today, and it looks as if that's you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. The cuts are on the block and the prices are on the slate, and I'll leave you to it." },
    { id = "g_default", text = "Good day to you! Fresh cuts on the block, and none of it's been further than the Fields." },
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "A dwarf! Now there's a customer who knows a proper joint. Come and see the haunch I've been saving." },
    { id = "g_back", when = { metBefore = true }, text = "Back again! I told the wife you'd be back. Nobody buys from Bront just the once." },
  },

  notice = {
    { id = "n_hunter", cat = "hunger", when = { class = "HUNTER" },
      text = "That beast of yours has its eye on my offcuts. Smart animal. I'll wrap something for it, if you're buying for yourself as well." },
    { id = "n_cook", cat = "hunger", when = { profession = "Cooking" },
      text = "You've a cook's burn on that hand. Then you'll want the shoulder and not the loin, because you'll know what to do with it." },
    { id = "n_tauren", cat = "hunger", when = { race = "Tauren" },
      text = "Well, I'll be. I've butchered a great many cattle, and I hope you'll not take it personal. No? Good. Then what can I do for you?" },
  },

  start = "hello",
  nodes = {
    d2_inn = {
      lines = {
        { id = "d2_inn_1", text = "The best of everything, since Chef Jessen won't cook what he hasn't picked himself. He comes in at dawn and prods every joint on the hooks like he's buying a horse, and then he takes the forerib and leaves me the shanks." },
      },
      choices = {
        { text = "And what do you do with the shanks?", next = "d2_inn2" },
        { text = "Sounds like you resent him.", next = "d2_inn2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_inn2 = {
      lines = {
        { id = "d2_inn2_1", text = "Sell them to the militia for stew, and they're grateful for it, which is more than I can say for Jessen. Neema at the inn slips me a bowl of his soup now and then, and I'll admit the man can cook, though I'll never say it to his face." },
      },
      choices = {
        { text = "I won't tell him either.", next = "BACK" },
        { text = "Ask you something else, Bront.", next = "BACK" },
      },
    },
    d2_count = {
      lines = {
        { id = "d2_count_1", text = "I do, every month, so nobody forgets. There were eleven farms sending cattle when the Mill fell, and there are four now, and the last time a farm stopped, I found out from the cart driver and not from the family." },
      },
      choices = {
        { text = "Which farms are left?", next = "d2_count2" },
        { text = "That's a grim thing to count.", next = "d2_count2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_count2 = {
      lines = {
        { id = "d2_count2_1", text = "Ray, Getz, Kalaba and old Nethander's lad, and Nethander's is nearest the Mill, so I don't count on it long. Every time I say the number out loud in the square, Magistrate Maleb looks at me like I've broken a window." },
      },
      choices = {
        { text = "Someone needs to say it.", next = "BACK", reply = "That's what I tell him. He'd rather I said it quieter." },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_hunter = {
      lines = {
        { id = "d2_hunter_1", text = "Then you'll know a clean kill from a messy one, and you'll know why I'd pay a fair price for venison if you bring it in dressed. The deer have gone up into the hills since the dead came to the Mill, and my hunters have gone with them." },
      },
      choices = {
        { text = "I'll keep that in mind.", next = "BACK" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Bront Coldcleave, butcher. I feed Southshore, and the militia, and any traveller who's sick of fish, which in this town is most of them by the second day." },
        { id = "h_horde", when = { faction = "Horde" }, text = "Bront Coldcleave. You're not from the Alliance side, and I'll be honest, I'd sooner you bought and went. But coin's coin, and a butcher who turns it away doesn't stay a butcher." },
      },
      again = {
        { id = "h_again", text = "Anything else, friend? Speak up over the cleaver, I've a side of beef that won't joint itself." },
        { id = "h_again2", text = "Go on, I can talk and trim." },
        { id = "h_again3", text = "Aye? Mind the block, it's sharp work today." },
      },
      choices = {
        { text = "A butcher should say plainly where his meat comes from.", next = "BACK", reply = "And I do, every farm by name, though fewer farms each month. The north road's been taking them.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Call any old beef 'Hillsbrad prime.' Nobody can tell anyway.", next = "BACK", reply = "A dwarf could tell, and so could half of Southshore. I'll not lie about a farm I've known since I was a boy.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me what's on the block.", next = "BUSINESS" },
        { text = "Where does your meat come from?", next = "farms" },
        { text = "Everyone here seems sick of fish.", next = "fish" },
        { text = "How's the town holding up?", next = "town" },
        { text = "What would you roast for a feast?", next = "roast", when = { profession = "Cooking" } },
        { text = "I'm with the militia's effort. What do they need?", next = "militia", when = { faction = "Alliance", minLevel = 25 } },
        { text = "What does the inn buy off your block?", next = "d2_inn" },
        { text = "You count the farms aloud, I hear.", next = "d2_count" },
        { text = "I hunt my own meat on the road.", next = "d2_hunter", when = { class = "HUNTER" } },
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
    scourge = { { id = "tp_scourge", text = "They ruined the northern herds first. I knew something was wrong the year the Andorhal beef stopped coming." } },
    background = { { id = "tp_bg", text = "Third Coldcleave to hold this block. My grandfather cut meat for the men who built the sea wall." } },
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
  notices = { "kit", "craft", "class" },
  impression = {
    first = "Robert Aebischer forges and sells armor in Southshore, and the militia's dented breastplates pass across his anvil every week. He reads the state of the war in those dents and does not much like the story.",
    third = "{name} met Robert Aebischer, the armorsmith of Southshore.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Afternoon, and welcome back. Your plate's held up well, I see, and that's the best compliment my anvil ever gets." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Afternoon. The racks are there, the prices are fair, and I've nothing more to say to you than that." },
    { id = "g_default", text = "Afternoon. Mail and plate on the racks, all my own work. Have a look, and knock on it if you like." },
    { id = "g_dwarf", when = { race = "Dwarf" }, text = "A dwarf, in my forge. I'll be glad of your opinion and afraid of it in equal parts. Go on, look at the rivets." },
    { id = "g_back", when = { metBefore = true }, text = "Back, are you? Let's see how the last piece wore. Turn round." },
  },

  notice = {
    { id = "n_broken", cat = "kit", when = { durability = { max = 0.35 } },
      text = "That's been through something. I can tell you what, too: those are axe cuts, low and from the left, so you were fighting someone shorter than you who knew his business." },
    { id = "n_smith", cat = "craft", when = { profession = "Blacksmithing" },
      text = "You've a smith's forearms. Then tell me honestly what you think of that hauberk by the door, because my own apprentice won't." },
    { id = "n_warrior", cat = "class", when = { class = "WARRIOR" },
      text = "You carry that weight well. Most who come in here wear their armor; you look as though you live in it." },
  },

  start = "hello",
  nodes = {
    w3_evening = {
      lines = {
        { id = "w3_evening_1", text = "Sit on the end of the dock with a pipe I can still taste, and look up the valley at the lamps of Tarren Mill. My father shod horses for both towns once, when it was one county, and I find I can't stop looking that way." },
      },
      choices = {
        { text = "You don't hate them, up there?", next = "w3_hate" },
        { text = "One county, once. That's a sad thought.", next = "BACK", reply = "It is. My father's anvil came from a Tarren Mill smith. I'd like to think the old man is resting, whatever's walking his streets now." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_hate = {
      lines = {
        { id = "w3_hate_1", text = "I hate what they've become, and I hate what they shoot into our militia. But I knew the baker up there, and the carter, and I've no wish to meet any of them across a shield wall, whatever colour their banners are." },
      },
      choices = {
        { text = "War makes strangers of neighbours. Something else.", next = "BACK" },
      },
    },
    d2_best = {
      lines = {
        { id = "d2_best_1", text = "Marshal Redpath, though you'd not know it, since he insists on wearing it under a plain surcoat so the men don't see him better armored than they are. I respect him for it, even if it means nobody admires my finest plate." },
      },
      choices = {
        { text = "And Lieutenant Orinelle?", next = "d2_best2" },
        { text = "A modest marshal. That's rare.", next = "d2_best2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_best2 = {
      lines = {
        { id = "d2_best2_1", text = "Orinelle wears whatever's nearest and wears it out in a month, because she's always the first over a wall. I've stopped making her anything fine and started making her things that are easy to mend, and she's never noticed the difference." },
      },
      choices = {
        { text = "Wise of you.", next = "BACK" },
        { text = "Ask you something else, Robert.", next = "BACK" },
      },
    },
    d2_shield = {
      lines = {
        { id = "d2_shield_1", text = "Aye, and that's no trophy. It belonged to a lad from the Hillsbrad Fields who carried it up toward the Mill and came back on a cart without it, and a deathguard sold it back to Southshore at Kris Legace's stall, of all the cheek." },
      },
      choices = {
        { text = "Kris Legace sells to both sides?", next = "d2_shield2" },
        { text = "So you bought it back.", next = "d2_shield2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_shield2 = {
      lines = {
        { id = "d2_shield2_1", text = "She trades with anyone who comes up the hill with coin, and I paid her three silver for a shield I made for nothing. I hang it there so that every soldier who comes in for mending sees it and thinks twice about how far up the road he goes." },
      },
      choices = {
        { text = "Does it work?", next = "BACK", reply = "Not as often as I'd like. They're brave lads, and bravery's never been much for listening." },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { text = "An armorsmith should tell a buyer when old plate won't hold.", next = "BACK", reply = "I tell the militia every week. Some of them still march north in it, but at least they know.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Paint over the dents and sell the old plate as new.", next = "BACK", reply = "And send a militiaman north in it, to die at Tarren Mill? Not from my forge, friend.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your armor.", next = "BUSINESS" },
        { text = "You can read a fight from the damage?", next = "read" },
        { text = "Where do you get your iron?", next = "iron" },
        { text = "What do they call superior about it?", next = "superior" },
        { text = "How would you temper mail for these hills?", next = "temper", when = { profession = "Blacksmithing" } },
        { text = "Dwarven mail's lighter. You know that.", next = "dwarf", when = { race = "Dwarf" } },
        { text = "Who wears your best work?", next = "d2_best" },
        { text = "You've a militia shield on the wall.", next = "d2_shield" },
        { text = "What do you do when the forge is cold?", next = "w3_evening" },
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
    background = { { id = "tp_bg", text = "Born in Southshore, trained in Stormwind, and came home to my father's forge. I've never wanted another." } },
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
  notices = { "kit", "class", "race" },
  impression = {
    first = "Sarah Raycroft keeps Southshore's general store and can tell from a shopping list whether a customer is going on patrol or leaving town for good. She says nothing about it and packs their baskets carefully either way.",
    third = "{name} met Sarah Raycroft, who sells general goods in Southshore.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Hello again, love! You're still in one piece, so the rope and lamp oil must have done you right. What'll it be today?" },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Rope's on the left and oil's on the right, so I'll let you see yourself round." },
    { id = "g_default", text = "Hello, love. Rope, lamp oil, waterskins, whatever you're short of. Have a look round." },
    { id = "g_back", when = { metBefore = true }, text = "Oh, hello again! You're still in one piece, so the last lot must have done you." },
    { id = "g_horde", when = { faction = "Horde" }, text = "Oh. Well. You're here, and you've a purse, and I'll serve you. But please be quick, because it frightens the children." },
  },

  notice = {
    { id = "n_new", cat = "kit", when = { maxLevel = 22 },
      text = "You're new to the road, aren't you? No shame in it. Take two waterskins and not one, and don't let anybody sell you a map of Alterac." },
    { id = "n_mage", cat = "class", when = { class = "MAGE" },
      text = "A mage! Master Odelic of the Kirin Tor is staying in town, did you know? He bought every candle I had, so I hope you weren't after candles." },
    { id = "n_gnome", cat = "race", when = { race = "Gnome" },
      text = "Oh, mind the bottom shelf, love, that's where I keep things for customers of your height. You'd be surprised how many pass through." },
  },

  start = "hello",
  nodes = {
    w3_children = {
      lines = {
        { id = "w3_children_1", text = "A dozen or so, love, and they play at militia on the green with sticks, and the Forsaken are always the ones who lose. I don't stop them, because it's what children do, but my heart turns over every time I hear one of them pretend to die." },
      },
      choices = {
        { text = "Do they understand the danger?", next = "w3_danger" },
        { text = "Children play at whatever frightens them.", next = "BACK", reply = "They do, and my mother said the same during the orcs' war. I suppose every war gets its own game on the green." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_danger = {
      lines = {
        { id = "w3_danger_1", text = "They understand the bells, which ring when something's coming up from the Mill, and they run inside without being told. That's more than I'd like a child to know, but it's the thing that keeps them alive." },
      },
      choices = {
        { text = "Then the town's looking after them. Something else.", next = "BACK" },
      },
    },
    d2_stock = {
      lines = {
        { id = "d2_stock_1", text = "Thread, believe it or not, because every soldier tears his kit on the hills and every wife in town is mending. The ship brings bolts of it from Menethil, and they're gone in two days, and then I'm selling string to people who know perfectly well it's string." },
      },
      choices = {
        { text = "Can't you order more?", next = "d2_stock2" },
        { text = "String will do in a pinch.", next = "d2_stock2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_stock2 = {
      lines = {
        { id = "d2_stock2_1", text = "I order double every time, and Micha Yance tells me the ship can only carry what the murlocs leave it. I've started saving a spool under the counter for Brewmeister Bilger's wife, since she does the militia's colours and nobody else can match them." },
      },
      choices = {
        { text = "Kind of you.", next = "BACK" },
        { text = "Ask you something else, Sarah.", next = "BACK" },
      },
    },
    d2_breath = {
      lines = {
        { id = "d2_breath_1", text = "It does, doesn't it, love? Everyone's waiting for the Mill to do something, or for the Marshal to, and in the meantime they buy lamp oil and keep their children in after dark, and the whole town goes to bed early." },
      },
      choices = {
        { text = "What do you think will happen?", next = "d2_breath2" },
        { text = "Waiting's harder than fighting.", next = "d2_breath2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_breath2 = {
      lines = {
        { id = "d2_breath2_1", text = "I think nothing will happen for a long while, and then everything will at once, the way it did in Lordaeron. I keep a basket packed under the counter myself, with bread and a blanket in it, and I've never told anyone that but you." },
      },
      choices = {
        { text = "I'll keep it to myself.", next = "BACK" },
        { text = "Let me ask something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Sarah Raycroft, and this is the general store, such as it is. If Southshore needs it and it isn't a fish, it likely came through my door." },
        { id = "h_nightelf", when = { race = "NightElf" }, text = "Sarah Raycroft, and welcome. We don't see many of your people this far east, and I hope you'll forgive the staring. I've a few things from Auberdine that came by ship, if you're missing home." },
      },
      again = {
        { id = "h_again", text = "Anything else I can find for you, my duck? I've a good eye for what a traveller's missing." },
        { id = "h_again2", text = "Go on, I'm only counting stock." },
        { id = "h_again3", text = "Yes? Mind the barrel, the lid's loose." },
      },
      choices = {
        { text = "A shopkeeper shouldn't gossip about what her customers buy.", next = "BACK", reply = "No, and I don't, though you'd be amazed what a shopping list says about a person.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Tell the magistrate who's buying travel rations. Someone's deserting.", next = "BACK", reply = "Then they've their reasons, love, and the north road's reason enough. I'll not be the one who tells.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Let me see what you have.", next = "BUSINESS" },
        { text = "You must know everyone's business here.", next = "business" },
        { text = "What sells most, these days?", next = "sells" },
        { text = "How do goods still reach Southshore?", next = "ships" },
        { text = "I'm heading into Alterac. What should I pack?", next = "pack", when = { minLevel = 28 } },
        { text = "I've come from Menethil. Any message to carry?", next = "menethil", when = { faction = "Alliance", minLevel = 20 } },
        { text = "What's the hardest thing to keep in stock?", next = "d2_stock" },
        { text = "Southshore feels like it's holding its breath.", next = "d2_breath" },
        { text = "Are there many children left in Southshore?", next = "w3_children" },
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
    scourge = { { id = "tp_scourge", text = "My mother's people were from Andorhal. We stopped getting letters, and then we stopped expecting them." } },
    background = { { id = "tp_bg", text = "I've kept this counter eleven years. I had it from my aunt, who had it when Southshore was only nets and a jetty." } },
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
  notices = { "class", "race" },
  impression = {
    first = "Jaysin Lanyda sells reagents and poisons in Southshore, and he is cheerful about being the least respectable shopkeeper in a respectable town. He is careful to say that everything he sells is for the war.",
    third = "{name} met Jaysin Lanyda, who sells poisons and reagents in Southshore.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, one of my favourite regulars! Shut the door, quickly, and let me show you what came in this week." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. I sell to everyone, so I'll sell to you, but I'll be glad when the door shuts behind you." },
    { id = "g_default", text = "Come in, come in, and shut the door. The magistrate's wife walks past at this hour, and she worries." },
    { id = "g_rogue", when = { class = "ROGUE" }, text = "Ah. One of my regulars, or one who will be. I've fresh stock, and I never saw you." },
    { id = "g_back", when = { metBefore = true }, text = "Back again. Either it worked or it didn't, and I never ask which." },
  },

  notice = {
    { id = "n_paladin", cat = "class", when = { class = "PALADIN" },
      text = "A paladin. Now, before you say anything, the reagents are all perfectly holy, and the other shelf is rat poison. Mostly rat poison." },
    { id = "n_caster", cat = "class", when = { class = { "MAGE", "PRIEST", "DRUID", "SHAMAN", "WARLOCK" } },
      text = "You'll be wanting the reagent side. Runes, powders, the usual. I keep them well apart from the other things, since I had a mix-up once." },
    { id = "n_nightelf", cat = "race", when = { race = "NightElf" },
      text = "A night elf. Your huntresses coat their arrows, I'm told, and nobody calls them cowards for it. I've often thought it's all in how tall you are." },
  },

  start = "hello",
  nodes = {
    d2_raleigh = {
      lines = {
        { id = "d2_raleigh_1", text = "That the Light forgives every sin, even mine, and that he'll keep asking it to until it agrees. He means it kindly, which is the trouble, because a man who hates you can be ignored and a man who prays for you has to be thanked." },
      },
      choices = {
        { text = "Do you thank him?", next = "d2_raleigh2" },
        { text = "He sounds like a good man.", next = "d2_raleigh2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_raleigh2 = {
      lines = {
        { id = "d2_raleigh2_1", text = "Every time, and I send him a jar of liniment for his knees every winter, unlabelled so he can pretend he doesn't know where it came from. He kneels on the chapel steps for half the night, and somebody has to look after the knees." },
      },
      choices = {
        { text = "A poisoner's charity.", next = "BACK", reply = "Call it a professional courtesy. He looks after my soul, and I look after his joints." },
        { text = "Ask you something else.", next = "BACK" },
      },
    },
    d2_back = {
      lines = {
        { id = "d2_back_1", text = "It would, since it's where I boil things that shouldn't be boiled near bread. I keep it shut and I keep the window open toward the sea, and the Magistrate has asked me twice to move it further from the inn." },
      },
      choices = {
        { text = "Will you move it?", next = "d2_back2" },
        { text = "The smell must drive the customers off.", next = "d2_back2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_back2 = {
      lines = {
        { id = "d2_back2_1", text = "Where to, the hill? I'd be up there with the gnolls, or worse, halfway to the Mill and selling to the other side by accident. No, the Magistrate gets a closed door and my word that nothing's burning, and so far nothing has." },
      },
      choices = {
        { text = "So far.", next = "BACK", reply = "That's the only promise anyone in my trade ever makes, friend." },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_durn = {
      lines = {
        { id = "d2_durn_1", text = "Durnholde, is it? Then something that dulls the wits rather than the blood, since the Syndicate guard in pairs, and a man who falls over gets noticed. Mind-numbing work is what you want, and you'll want plenty of it." },
      },
      choices = {
        { text = "I'll take your word on it.", next = "BUSINESS" },
        { text = "Something else.", next = "BACK" },
      },
    },
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
        { text = "Even a poisoner owes his buyers the truth about what's in the vial.", next = "BACK", reply = "Oh, absolutely, and every one of mine is perfectly legal for pest control, I assure you.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Sell to anyone, ask nothing, and keep the magistrate in the dark.", next = "BACK", reply = "That's very nearly my business plan, though I'd never say so with the window open.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your stock.", next = "BUSINESS" },
        { text = "Does Southshore mind a poison seller?", next = "mind" },
        { text = "Who buys poison in a fishing town?", next = "buys" },
        { text = "Where do you get it all?", next = "source" },
        { text = "What works on a Forsaken?", next = "undead", when = { class = "ROGUE", faction = "Alliance" } },
        { text = "Poison is a coward's weapon.", next = "coward", when = { class = { "PALADIN", "WARRIOR" } } },
        { text = "What does Raleigh the Devout say to your face?", next = "d2_raleigh" },
        { text = "Your back room smells strange.", next = "d2_back" },
        { text = "I could use a quieter poison for Durnholde.", next = "d2_durn", when = { class = "ROGUE" } },
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
    ravenholdt = { { id = "tp_rav", text = "There's a house in the hills that buys from nobody and knows everybody. I've sent them my compliments twice, and had no answer, which I took as one." } },
    background = { { id = "tp_bg", text = "I was an apothecary's boy in Stormwind, and I was better at the wrong half of the trade." } },
    _none = { { id = "tp_none", text = "Never heard of it, and I mean that in the ordinary way this time." } },
  },
}

---------------------------------------------------------------------------
-- Winstone Wolfe: Ravenholdt's watchman, who walks the approach to the manor and misses nothing on it.
---------------------------------------------------------------------------
P:NPC {
  key = "hb_winstone", id = TODO_NPC("Winstone Wolfe"), name = "Winstone Wolfe", title = "The Wolf",
  bible = "bibles/more_folk.md", role = "guard", tier = "service",
  communities = { "ravenholdt" }, temper = { "laconic", "watchful" }, values = { "loyalty", "vigilance" },
  notices = { "class", "race" },
  impression = {
    first = "Winstone Wolfe walks the approach to Ravenholdt Manor and seems to have counted every stone on it. He says little, looks at hands and boots before faces, and gives the impression that being let past him was a decision.",
    third = "{name} met Winstone Wolfe, called the Wolf, who keeps watch over the approach to Ravenholdt Manor.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You came up quietly this time, both paths. Go on through; the house is expecting you." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Stop there, keep your hands where I can see them, and don't move until I say." },
    { id = "g_1", text = "You were quiet on the lower path and careless on the upper one, so stop there a moment and let me look at you." },
    { id = "g_2", when = { class = "ROGUE" }, text = "One of the trade. You crossed the open ground at a walk, which was right. Running is what gets noticed." },
    { id = "g_3", when = { metBefore = true }, text = "You again. Same boots, I see, and a new scuff on the left one." },
  },

  notice = {
    { id = "n_1", cat = "class", when = { class = "ROGUE" },
      text = "You keep your weight on the balls of your feet even standing still. Good habit. It'll ruin your calves by fifty, if you see fifty." },
    { id = "n_2", cat = "race", when = { race = { "Tauren", "Orc" } },
      text = "You're a great deal of person to bring up a hidden path. I heard you from the first bend. I'm not complaining, it made a change." },
  },

  start = "hello",
  nodes = {
    w3_long = {
      lines = {
        { id = "w3_long_1", text = "Eleven winters, if you count the one I spent mostly in a snowdrift. Lord Ravenholdt hired me on a handshake and a test, and I've never asked for a new contract, because the path never asks me for anything new either." },
      },
      choices = {
        { text = "What was the test?", next = "w3_test" },
        { text = "Eleven winters is a long watch.", next = "BACK", reply = "It's a short watch, done many times. That's the trick of it." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_test = {
      lines = {
        { id = "w3_test_1", text = "To walk up the path to the door without anybody in the house noticing. I made it to the bottom step and found Lord Ravenholdt sitting on it, waiting, with two cups of tea. He hired me for getting that far, and for drinking the tea without asking what was in it." },
      },
      choices = {
        { text = "What was in it?", next = "BACK", reply = "Tea. That was the second test." },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Winstone Wolfe. I walk the ground between the cliff and the door, and I decide what gets as far as the door. You've got this far, so somebody inside wants you, or I've grown careless, and I haven't." },
        { id = "hello_2", when = { metBefore = true }, text = "Wolfe. You know the path now. That makes you either a friend of the house or a problem for it, and I've not been told which." },
      },
      again = {
        { id = "hello_a1", text = "Something else? Keep it short." },
        { id = "hello_a2", text = "Talk if you want. My eyes stay on the road either way." },
        { id = "hello_a3", text = "Well? Out with it, and keep off the scree." },
      },
      choices = {
        { text = "Ravenholdt's rules exist for a reason, and I'll keep them.", next = "BACK", reply = "Good. Most who come up this road think they're above the rules, and most of them leave sooner than they planned.", fx = { align = { order = 1 } } }, -- dp_stance
        { text = "Rules are for the marks. A true rogue answers to himself.", next = "BACK", reply = "Then you'll answer to me when you break one here, and I'm a good deal less forgiving than yourself.", fx = { align = { order = -1 } } }, -- dp_stance
        { text = "What exactly do you watch for?", next = "watch" },
        { text = "Why do they call you the Wolf?", next = "wolf" },
        { text = "Who else keeps this house?", next = "house" },
        { text = "The Syndicate must want this place badly.", next = "syndicate" },
        { text = "What gave me away on the upper path?", next = "path", when = { class = "ROGUE" } },
        { text = "How long have you watched this path?", next = "w3_long" },
        { text = "I'll go on to the door.", next = "END" },
      },
    },
    watch = {
      lines = { { id = "watch_1", text = "Three things. Anyone who looks at the windows before the door, since they're counting rooms. Anyone who asks no questions at all. And anyone in orange, because the Syndicate have never once had the sense to change their colours before they come calling." } },
      choices = {
        { text = "And when you find one?", next = "watch2" },
        { text = "Orange masks, on a hillside. They make it easy.", next = "watch2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    watch2 = {
      lines = { { id = "watch2_1", text = "I let them come up as far as the second bend. It's a narrow place, with a drop on one side, and I know where the loose stones are. I don't shout and I don't give chase. They simply don't arrive, and after a while their friends stop expecting them." } },
      choices = {
        { text = "You make it sound like housekeeping.", next = "BACK", reply = "That's all it is. A tidy approach is a safe house.", fx = { trait = { witty = 1 } } },
        { text = "A warning would be more honourable.", next = "BACK", reply = "It would. It would also tell the next ones where I stand." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    wolf = {
      lines = { { id = "wolf_1", text = "Because I work alone and I keep to one range. Lord Ravenholdt called me that the first winter, when I'd been out on the hill nine nights running. It stuck. I've never much minded. There are worse things to be than patient and hard to see." } },
      choices = {
        { text = "Nine nights in an Alterac winter.", next = "wolf2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    wolf2 = {
      lines = { { id = "wolf2_1", text = "There was a man watching the house from a cleft across the valley. He was good. He never lit a fire. On the ninth night he sneezed. I went and brought back his spyglass, and it's on the mantel in the hall, if you care to look." } },
      choices = {
        { text = "Patience won that one.", next = "BACK", reply = "It wins most of them. People never believe it till they've been outwaited." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    house = {
      lines = { { id = "house_1", text = "Lord Ravenholdt, at the top of the stair, who you'll speak softly to. Fahrad, who trains. Kang drills the sentries in the yard, and Simone keeps the grounds, which are not the garden they look like. Smudge and the gnome are in the cellar, and I'd knock before going down." } },
      choices = {
        { text = "The grounds aren't what they look like?", next = "house2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    house2 = {
      lines = { { id = "house2_1", text = "Simone Cantrell planted every hedge on this hill, and she didn't plant them to be pretty. There are three ways through to the door and eleven that only seem to be. I've walked this ground for years and I still follow her markers after dark." } },
      choices = {
        { text = "I'll keep to the path, then.", next = "BACK", reply = "Do. I'd sooner not have to come and cut you out of a bramble." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    syndicate = {
      big = true,
      lines = { { id = "syndicate_1", text = "They want it gone. We've refused them, and they can't abide a house of thieves that won't join their pack of them. They send a man every month or so. I'm told I ought to pity them, lordlings of a dead kingdom with nothing left but spite. Do you?" } },
      choices = {
        { text = "No. They chose banditry. Let them pay for it.", next = "BACK", reply = "Then we see it alike, and the second bend will go on doing its work.", fx = { align = { light = -1 } } },
        { text = "A little. They lost a homeland too.", next = "BACK", reply = "Maybe so. I lost a brother to them, and it's used up what pity I had.", fx = { align = { light = 1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    path = {
      lines = { { id = "path_1", text = "The scree, below the leaning pine. You stepped on the flat grey stone, and so does everyone, because it looks solid. I set it loose myself. Step on the ugly one beside it next time, and I'll not hear you until you're at my elbow." } },
      choices = {
        { text = "The ugly stone. I'll remember.", next = "BACK", reply = "See that you do. I'll be listening for it." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    ravenholdt = { { id = "tp_ravenholdt", text = "A house that owes nothing to any crown. That's rare enough to be worth a cold night or two." } },
    syndicate = { { id = "tp_syndicate", text = "Orange cloth and old grievances. I count them in and I don't count them out." } },
    alterac = { { id = "tp_alterac", text = "A kingdom that sold itself. The hills are better company than the lords ever were." } },
    advice = { { id = "tp_advice", text = "Wait one breath longer than you want to. The other fellow nearly always moves first." } },
    fahrad = { { id = "tp_fahrad", text = "He trains them inside, and I find out on the path whether it took." } },
    _none = { { id = "tp_none", text = "Not something that's come up the path, so I know nothing of it." } },
  },
}

---------------------------------------------------------------------------
-- Myrokos Silentform: an elven rogue of Ravenholdt who speaks seldom and wastes nothing when he does.
---------------------------------------------------------------------------
P:NPC {
  key = "hb_myrokos", id = TODO_NPC("Myrokos Silentform"), name = "Myrokos Silentform",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  communities = { "ravenholdt" }, temper = { "reserved", "precise" }, values = { "discipline", "silence" },
  notices = { "class", "race" },
  impression = {
    first = "Myrokos Silentform is an elf of fallen Quel'Thalas who serves Ravenholdt and speaks as though each sentence had been weighed first. He moves without sound even across the manor's old boards, and seems faintly pained by anyone who does not.",
    third = "{name} met Myrokos Silentform, an elven rogue in the service of Ravenholdt Manor.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You have returned, and you crossed the hall without a sound. The house is pleased with you, and so, in my measured way, am I." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You may speak, though briefly, for the house remembers your last visit and so do I." },
    { id = "g_1", text = "You may speak, though I would ask you to do it quietly, for this house hears everything twice." },
    { id = "g_2", when = { class = "ROGUE" }, text = "You crossed the hall on the third board from the wall, which is the one that does not creak. Either you were taught well or you were fortunate." },
    { id = "g_3", when = { metBefore = true }, text = "You have returned, and you closed the door behind you without a sound this time. I noticed, and I thank you." },
  },

  notice = {
    { id = "n_1", cat = "class", when = { class = "ROGUE" },
      text = "Your scabbard is lined with wool. Good. Most of your trade line it with nothing and announce every draw like a herald." },
    { id = "n_2", cat = "race", when = { race = "NightElf" },
      text = "A child of the old forests. Our peoples parted long ago and not kindly, and yet you still walk as we do, from the hip and without hurry." },
  },

  start = "hello",
  nodes = {
    w3_lord = {
      lines = {
        { id = "w3_lord_1", text = "Precise. He keeps no more men than the house needs and pays them before they ask, and in eleven years I have never heard him raise his voice. Those he displeases simply find, one morning, that they are no longer expected at breakfast." },
      },
      choices = {
        { text = "And those he pleases?", next = "w3_pleases" },
        { text = "That sounds like a frightening master.", next = "BACK", reply = "It is a restful one, for those of us who prefer to know exactly where we stand." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_pleases = {
      lines = {
        { id = "w3_pleases_1", text = "Are given harder work, which is the only praise the house offers. I was sent to Stromgarde within a month of my arrival, and that is all I will say of it." },
      },
      choices = {
        { text = "Understood. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "I am Myrokos Silentform. I came to this house when my own country had no further use for the living, and Lord Ravenholdt has found work for what I know. I say little, and you should not mistake that for having little to say." },
        { id = "hello_2", when = { metBefore = true }, text = "Myrokos Silentform, as before. Ask what you wish. I will answer what I can, and briefly." },
      },
      again = {
        { id = "hello_a1", text = "You have another question. Ask it; I will not waste words on the answer." },
        { id = "hello_a2", text = "Speak. I am attending." },
        { id = "hello_a3", text = "Yes?" },
      },
      choices = {
        { text = "Why so few words?", next = "silence" },
        { text = "You came from Quel'Thalas.", next = "quel" },
        { text = "What work does the house give you?", next = "work" },
        { text = "Teach me to cross a floor as you do.", next = "board", when = { class = "ROGUE" } },
        { text = "We remember the parting differently.", next = "kin", when = { race = "NightElf" } },
        { text = "What is Lord Ravenholdt like?", next = "w3_lord" },
        { text = "I'll go quietly.", next = "END" },
      },
    },
    silence = {
      lines = { { id = "silence_1", text = "Because a word spoken cannot be recovered, and I have seen what careless ones cost. In my first trade a whisper on a stair lost us four good people. I resolved afterward to say only what I would be content to have overheard by an enemy." } },
      choices = {
        { text = "That's a hard rule to live by.", next = "silence2" },
        { text = "Do you never simply talk?", next = "silence2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    silence2 = {
      lines = { { id = "silence2_1", key = true, text = "With Simone Cantrell, at times, in the garden, about nothing. She is of the elder kindred and has patience for long pauses. It is a strange friendship, given our peoples. We have agreed not to mention the past ten thousand years, and it has served us well." } },
      choices = {
        { text = "A quiet friendship is still a friendship.", next = "BACK", reply = "It is the only sort I have ever kept.", fx = { affinity = 1 } },
        { text = "Silence can be its own kind of lie.", next = "BACK", reply = "It can. I try to keep mine to the honest sort." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    quel = {
      lines = { { id = "quel_1", text = "I did. I was abroad, on an errand of the kind I do not describe, when the Scourge came through the forests. I returned to ash and a broken gate. I am told the prince has gathered those who remain and given them a new name. I have not gone back to learn it." } },
      choices = {
        { text = "Why not go back to your people?", next = "quel2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    quel2 = {
      big = true,
      lines = { { id = "quel2_1", text = "Because the ones I served are dead, and those who live are hungry in a way that frightens me. I have a place here, and a use, and no one asks what I mourn. You will have a view on whether a man owes his ruined country his return, so tell me." } },
      choices = {
        { text = "He does. A people needs every hand to rebuild.", next = "BACK", reply = "That is the voice of duty, and I hear it most nights. I have not yet obeyed it.", fx = { align = { order = 1 } } },
        { text = "No. You owe the dead nothing but memory.", next = "BACK", reply = "So I have told myself. It is a relief, and a small shame, to hear it agreed with.", fx = { align = { order = -1 } } },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    work = {
      lines = { { id = "work_1", text = "I go where a door must be opened and nobody is to know it was. The Syndicate keep their letters at Strahnbrad and in the ruins of Alterac City, and Lord Ravenholdt likes to read them before their recipients do. I am, in a sense, the house's postmaster." } },
      choices = {
        { text = "And if you're caught at it?", next = "work2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    work2 = {
      lines = { { id = "work2_1", text = "I have not been. If I were, the house would say it had never heard my name, and that is correct and I agreed to it. Carlo Aurelius would be sent for me, or to finish what I had begun, and I should not know which until he arrived." } },
      choices = {
        { text = "You speak of it calmly.", next = "BACK", reply = "It is the arrangement. One does not resent the terms one signed." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    board = {
      lines = { { id = "board_1", text = "There is little to teach and much to practise. Walk at the edge of a room, where the boards are nailed. Roll the foot from the outer edge inward. Breathe out as you place it. Do this for a year, on every floor you cross, and you will stop hearing yourself." } },
      choices = {
        { text = "A year. I'll begin today.", next = "BACK", reply = "Then begin on the stair as you leave. The fifth step will tell you how far you have to go." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    kin = {
      lines = { { id = "kin_1", text = "No doubt. Your people say we were exiled for our hunger, and mine say we left a tyranny of moonlight for a place in the sun. I was not there, and nor were you. I would sooner judge you by how you cross a floor." } },
      choices = {
        { text = "That's fair. And how did I cross it?", next = "BACK", reply = "Well. Better than I expected, and I say that seldom." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    ravenholdt = { { id = "tp_ravenholdt", text = "A house that keeps its word, and asks only that you keep your silence. I have had worse masters." } },
    syndicate = { { id = "tp_syndicate", text = "Loud men with a grievance. I read their mail, and it has not improved my opinion." } },
    quel_thalas = { { id = "tp_quel_thalas", text = "I do not speak of it. You will forgive me." } },
    advice = { { id = "tp_advice", text = "Listen to a room before you enter it. It is always already telling you who is inside." } },
    fahrad = { { id = "tp_fahrad", text = "He teaches the young ones. I am not certain he has ever needed to be taught anything himself." } },
    _none = { { id = "tp_none", text = "I know nothing of that, and I prefer to say so than to guess aloud." } },
  },
}

---------------------------------------------------------------------------
-- Smudge Thunderwood: the dwarf who sells poisons from Ravenholdt's cellar; cheerful about a grim trade.
---------------------------------------------------------------------------
P:NPC {
  key = "hb_smudge", id = TODO_NPC("Smudge Thunderwood"), name = "Smudge Thunderwood", title = "Poison Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ravenholdt" }, temper = { "jolly", "macabre" }, values = { "craft", "family" },
  notices = { "class", "race" },
  impression = {
    first = "Smudge Thunderwood sells poisons from the cellar of Ravenholdt Manor, and he is as jolly about it as a brewer at a harvest fair. He labels everything in a careful hand and keeps his lunch on a separate shelf, clearly marked.",
    third = "{name} met Smudge Thunderwood, the dwarf who sells poisons in the cellar of Ravenholdt Manor.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's yerself! Come down, come down, {g:lad|lass}, an' sit by the wee brown jar, for I've a fresh batch tae show ye." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's ye. Touch nothin', mind, nae the green jars an' nae the blue, an' tell me quick what ye're after." },
    { id = "g_1", text = "Come down, come down, and mind ye don't touch the green jars, nor the blue, nor that wee brown one in particular." },
    { id = "g_2", when = { class = "ROGUE" }, text = "Ah, a customer who kens what a vial's for! Sit ye down, {g:lad|lass}, and tell me what's been givin' ye trouble, and how large it is." },
    { id = "g_3", when = { metBefore = true }, text = "Back again! And still breathin', so ye read the label. I do like a customer who reads the label." },
  },

  notice = {
    { id = "n_1", cat = "class", when = { class = "ROGUE" },
      text = "There's a crust on the lip of that vial at yer belt. That's old venom gone tacky, and it'll foul the next dose. Wipe it wi' spirits, never water." },
    { id = "n_2", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf, by my beard! Ye'll no' tell the folk at home ye saw a Thunderwood sellin' poison in a human's cellar, will ye? My mother thinks I'm a cooper." },
  },

  start = "hello",
  nodes = {
    d2_ingred = {
      lines = {
        { id = "d2_ingred_1", text = "The hills, mostly, and the rest by courier from Jaysin Lanyda down in Southshore, who sends me reagents in crates marked 'pickled herring.' The herring joke was mine, and he's never once laughed at it, which tells ye everythin' about the man." },
      },
      choices = {
        { text = "You trade with Southshore?", next = "d2_ingred2" },
        { text = "A poisoner shipping herring. Lovely.", next = "d2_ingred2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_ingred2 = {
      lines = {
        { id = "d2_ingred2_1", text = "The house trades with everyone, {g:lad|lass}, and I'm the house's poisoner, so I trade with everyone too. Jaysin's honest in the way only a dishonest man can be, and he's never once short-weighted me, which is more than I'd say for the Syndicate's suppliers." },
      },
      choices = {
        { text = "You've bought from the Syndicate?", next = "d2_ingred3" },
        { text = "High praise, from you.", next = "BACK", reply = "It is, and if ye repeat it to Jaysin, I'll deny it." },
      },
    },
    d2_ingred3 = {
      lines = {
        { id = "d2_ingred3_1", text = "Once, and once only, and the stuff was cut with chalk. Fahrad sent a polite note to Durnholde about it, and the supplier hasnae been seen since, so I'd say the matter's closed." },
      },
      choices = {
        { text = "I'll not ask what the note said.", next = "BACK" },
        { text = "Ask you something else.", next = "BACK" },
      },
    },
    d2_forge = {
      lines = {
        { id = "d2_forge_1", text = "Every day, if I'm honest. My father had me at the bellows before I could walk, and I was a terrible smith, so I took up brewin', and the brewin' went wrong in an interestin' direction." },
      },
      choices = {
        { text = "Interesting how?", next = "d2_forge2" },
        { text = "Some mistakes make a career.", next = "d2_forge2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_forge2 = {
      lines = {
        { id = "d2_forge2_1", text = "I made a stout that put three Kharanos men on the floor for a day, and none of them could remember their own names after. A gentleman from this house came askin' for the recipe, and I've been up here ever since, and my stout's still banned from the Thunderbrew." },
      },
      choices = {
        { text = "I'd like to try it.", next = "BACK", reply = "Nae, ye wouldnae. Ask the three lads from Kharanos, if they've remembered who they are." },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Smudge Thunderwood, purveyor of fine poisons to the house of Ravenholdt and its friends. Everythin' on these shelves I've brewed myself or tested myself, and I've the stomach of a dwarf, so when I say a thing's strong, ye can take it as gospel." },
        { id = "hello_2", when = { class = "ROGUE" }, text = "Smudge Thunderwood. I've the makin's for whatever ye need: somethin' to slow them, somethin' to dull the wits, and somethin' for when ye want the matter closed. Tell me the job and I'll fit the vial to it." },
      },
      again = {
        { id = "hello_a1", text = "What else, friend? Mind yer elbow." },
        { id = "hello_a2", text = "Go on, I'm only stirrin'." },
        { id = "hello_a3", text = "Aye?" },
      },
      choices = {
        { text = "A poisoner should label every jar plain, so nobody gets the wrong one.", next = "BACK", reply = "Aye, that's why I label in my best hand. A mix-up in this cellar could be the last mix-up anyone makes.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Leave the labels off. Let the careless learn the hard way.", next = "BACK", reply = "Ha! They'd learn it once, {g:lad|lass}, an' then nae more. I'd rather keep my customers breathin'.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your wares.", next = "BUSINESS" },
        { text = "You're cheerful, for a poisoner.", next = "jolly" },
        { text = "How do you test a poison?", next = "brew" },
        { text = "You share this cellar with a gnome.", next = "zan" },
        { text = "Your mother thinks you make barrels?", next = "cooper", when = { race = "Dwarf" } },
        { text = "Where do you get your ingredients, up here?", next = "d2_ingred" },
        { text = "Do you ever miss the forge, as a dwarf?", next = "d2_forge" },
        { text = "I'll touch nothing on my way out.", next = "END" },
      },
    },
    jolly = {
      lines = { { id = "jolly_1", text = "And why not? It's a craft like any other. A brewer makes a thing to cheer ye up, and I make a thing to lay ye down, and we both of us need clean vats and a steady hand. I never could see why one of us gets a guild hall and the other a cellar." } },
      choices = {
        { text = "One of you kills people.", next = "jolly2" },
        { text = "There's a kind of sense in that.", next = "jolly2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    jolly2 = {
      big = true,
      lines = { { id = "jolly2_1", text = "A sword kills people, and nobody frowns at the smith. I only sell the vial. Where it's poured is between the buyer and whatever they pray to. I've turned that over on many a quiet night down here, and I sleep fine. Would ye, in my boots?" } },
      choices = {
        { text = "Aye. The maker isn't the murderer.", next = "BACK", reply = "That's my thinkin' exactly. Have a seat, ye're good company.", fx = { align = { honor = -1 } } },
        { text = "No. You know full well what it's for.", next = "BACK", reply = "I do, aye. I'll no' pretend otherwise, and I'll no' lose sleep either.", fx = { align = { honor = 1 } } },
        { text = "Another matter.", next = "BACK" },
      },
    },
    brew = {
      lines = { { id = "brew_1", text = "On myself, the mild ones. A dwarf can take a dose that'd fold a human in half, so I sip, and I mark the time, and I write down what goes numb. For the strong ones I've a pen of rats, and I name every rat, which Zan says is a mistake." } },
      choices = {
        { text = "Why name the rats?", next = "brew2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    brew2 = {
      lines = { { id = "brew2_1", text = "Because a thing ye've named, ye'll no' waste. I'll no' test a brew on Barnaby that I've not thought through three times over. The ones that come through get the run of the cellar and a bit of cheese. There's a grand old fellow called Magni who's survived six." } },
      choices = {
        { text = "That's oddly decent of you.", next = "BACK", reply = "I'm a poisoner, {g:lad|lass}, no' a monster. There's a difference, and it's mostly cheese.", fx = { affinity = 1 } },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    zan = {
      lines = { { id = "zan_1", text = "Zan Shivsproket, aye, behind the curtain. A clever wee man, and he talks like a kettle comin' to the boil. We've a chalk line down the middle of the floor. Fumes stay on my side and sparks stay on his, since the one time they met we lost the ceilin'." } },
      choices = {
        { text = "And you get along?", next = "zan2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    zan2 = {
      lines = { { id = "zan2_1", text = "Like brothers, which is to say we argue daily. He built me a wee copper still that's the best I've ever had, and I brew him somethin' for his headaches. My own brother Dirk's in the same trade as me, and I see less of him than I do of the gnome." } },
      choices = {
        { text = "A good neighbour is worth a brother.", next = "BACK", reply = "Aye, and he's less likely to borrow money." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    cooper = {
      lines = { { id = "cooper_1", text = "She does, bless her, in Dun Morogh, and tells the neighbours I'm barrel-maker to a lord. It's nearly true. I do keep a great many wee barrels. I send her a cask of proper ale every Winter Veil, well away from anythin' else I've made." } },
      choices = {
        { text = "Your secret's safe in the mountains.", next = "BACK", reply = "Bless ye. And if ye see her, I'm doin' very well in oak." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    ravenholdt = { { id = "tp_ravenholdt", text = "A fine house to work for. They pay on the day and they never ask for a discount, which tells ye they mean to use the goods." } },
    syndicate = { { id = "tp_syndicate", text = "I'll no' sell to them, and they've asked. A poisoner's got to have some standards or he's only a hazard." } },
    advice = { { id = "tp_advice", text = "Read the label, and then read it again wi' yer gloves on. Half my trade is folk who didn't." } },
    ironforge = { { id = "tp_ironforge", text = "I miss the ale, and the forges, and bein' the right height for the furniture." } },
    fahrad = { { id = "tp_fahrad", text = "He buys the quiet sort, the kind that looks like a bad heart. A professional, that one." } },
    _none = { { id = "tp_none", text = "Couldn't tell ye. If it canna be bottled, it's past my learnin'." } },
  },
}

---------------------------------------------------------------------------
-- Zan Shivsproket: Ravenholdt's gnome engineer; traps, locks and the only cloaking device schematic for sale.
---------------------------------------------------------------------------
P:NPC {
  key = "hb_zan", id = TODO_NPC("Zan Shivsproket"), name = "Zan Shivsproket", title = "Speciality Engineer",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "ravenholdt" }, temper = { "rapid", "obsessive" }, values = { "invention", "pride" },
  notices = { "profession", "class" },
  impression = {
    first = "Zan Shivsproket builds traps, locks and stranger devices in the cellar of Ravenholdt Manor, and talks at the speed of something about to overheat. He is proudest of a cloaking device and sorest about what Fahrad says of his locks.",
    third = "{name} met Zan Shivsproket, the gnome engineer of Ravenholdt Manor.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "It's you, it's you, and you didn't step on anything! Come in, come in, I've reworked the third gear and you're the only one who'll appreciate it." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh, it's you. Stay exactly where you are, please, because I've no wish to explain the third gear to you again." },
    { id = "g_1", text = "Don't step there, that's armed, and don't step there either, that's drying, so really it's best if you stay exactly where you are and I come to you." },
    { id = "g_2", when = { profession = "Engineering" }, text = "An engineer! Finally, somebody who'll understand why the third gear is offset, because I've explained it to Smudge nine times and he only nods and offers me cheese." },
    { id = "g_3", when = { metBefore = true }, text = "Oh, it's you, good, you didn't set anything off last time, which puts you in the top third of visitors." },
  },

  notice = {
    { id = "n_1", cat = "profession", when = { profession = "Engineering" },
      text = "Is that a standard arclight spanner? The jaw's worn a full degree out of true. I can hear it in how it sits. No, no, I'm not judging, I'm only saying I could fix it in four minutes." },
    { id = "n_2", cat = "class", when = { class = "ROGUE" },
      text = "You're looking at my locks the way a cat looks at a fishbowl. Go on, try one. I'd like the data, and I'll time you." },
  },

  start = "hello",
  nodes = {
    d2_strange = {
      lines = {
        { id = "d2_strange_1", text = "A mechanical cat, to keep the rats out of Smudge's cellar, except Smudge names his rats and tests his brews on them, so he took it very personally! It's in a crate now, purring at nobody, because I couldn't bring myself to take it apart." },
      },
      choices = {
        { text = "What became of the rats?", next = "d2_strange2" },
        { text = "A purring crate. That's a little sad.", next = "d2_strange2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_strange2 = {
      lines = {
        { id = "d2_strange2_1", text = "They're fine, all of them, Barnaby especially, who I'm fairly sure has become immune to several kinds of death. I keep meaning to write that up, but there's nobody to write it up for, since the Society of Engineers is in Ironforge and doesn't answer letters from houses of assassins." },
      },
      choices = {
        { text = "Their loss.", next = "BACK", reply = "That's what I said! I said it to the cat, mostly." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    d2_smudge = {
      lines = {
        { id = "d2_smudge_1", text = "We do, half and half, with a curtain down the middle so his fumes don't get in my gears and my sparks don't get in his barrels. The curtain's caught fire twice, which isn't anyone's fault, it's just what happens when you share a room." },
      },
      choices = {
        { text = "Twice seems like someone's fault.", next = "d2_smudge2" },
        { text = "Does Fahrad know?", next = "d2_smudge2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_smudge2 = {
      lines = {
        { id = "d2_smudge2_1", text = "Fahrad knows everything, which is very annoying, and he said the curtain was a cheaper lesson than the house would be. So now there's a bucket by the curtain, and a second bucket by the first bucket, and the second one's Smudge's idea." },
      },
      choices = {
        { text = "Sensible man.", next = "BACK" },
        { text = "Something else, Zan.", next = "BACK" },
      },
    },
    d2_eng = {
      lines = {
        { id = "d2_eng_1", text = "Do you? What sort? No, don't tell me, let me guess from your hands: burns on the left, so you're right-handed and you hold the casing wrong. Everyone does! Hold the casing with the tongs and the fuse with the fingers, never the other way round." },
      },
      choices = {
        { text = "I'll try it your way.", next = "BACK" },
        { text = "My hands are fine, thank you.", next = "BACK", reply = "They're fine now! Ask them again after the next misfire." },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Zan Shivsproket, speciality engineer, which means I build the things nobody else will build and several things nobody ought to. Traps, locks, a few devices of my own, and the schematics for them, if you've the skill to follow my handwriting." },
        { id = "hello_2", when = { profession = "Engineering" }, text = "Zan Shivsproket! You'll want to see the schematics. There's one in particular, a cloaking device, my own design, sixty-one parts, and I'm told nobody else in the world sells it, which I've checked, and it's true." },
      },
      again = {
        { id = "hello_a1", text = "What else? Quickly, something's ticking." },
        { id = "hello_a2", text = "Go on, go on, I can solder and listen." },
        { id = "hello_a3", text = "Yes? Yes?" },
      },
      choices = {
        { text = "An engineer should say plainly when a trap might misfire.", next = "BACK", reply = "Of course! This one misfires twelve percent of the time, which I put on the tag, because surprises are for the customer's enemies.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Never admit a flaw. Blame the user when it explodes.", next = "BACK", reply = "That's what my old foreman used to say, right before the boiler blew, so I'm not convinced.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me what you sell.", next = "BUSINESS" },
        { text = "Tell me about the cloaking device.", next = "cloak" },
        { text = "Do you build the house's locks?", next = "locks" },
        { text = "What's a gnome doing among assassins?", next = "gnome" },
        { text = "Time me on that lock, then.", next = "try", when = { class = "ROGUE" } },
        { text = "What's the strangest thing you've built?", next = "d2_strange" },
        { text = "You and Smudge share a cellar.", next = "d2_smudge" },
        { text = "I've some engineering of my own, Zan.", next = "d2_eng", when = { profession = "Engineering" } },
        { text = "I'll back out the way I came.", next = "END" },
      },
    },
    cloak = {
      lines = { { id = "cloak_1", text = "It bends light around the wearer for a short span, about as long as it takes to cross a courtyard, and then it needs a rest and so do you. The trick was the mithril casing, since anything softer hums, and a hum rather defeats the purpose of being unseen." } },
      choices = {
        { text = "Why sell the schematic at all?", next = "cloak2" },
        { text = "That's a dangerous thing to put on a shelf.", next = "cloak2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    cloak2 = {
      big = true,
      lines = { { id = "cloak2_1", text = "Because a design nobody builds is only a drawing! Lord Ravenholdt lets me sell a few, to people the house has reason to trust. I do think about who might end up invisible on account of me. I've decided invention can't be held to answer for its customers. Can it?" } },
      choices = {
        { text = "It can't. Knowledge belongs to whoever can use it.", next = "BACK", reply = "Exactly, exactly! You may have the good stool.", fx = { align = { order = -1 } } },
        { text = "It can. You choose who gets unseen.", next = "BACK", reply = "Hm. That's Lord Ravenholdt's position too, which is why he keeps the list and I don't.", fx = { align = { order = 1 } } },
        { text = "Another matter.", next = "BACK" },
      },
    },
    locks = {
      lines = { { id = "locks_1", text = "I build them, and they're excellent, and Fahrad says they're unfit for anyone but beginners, because an honest lock opens the same way every time. He wants a lock that lies. I've tried to build one. It's very hard to make a mechanism deceitful, since mechanisms are fundamentally sincere." } },
      choices = {
        { text = "A lock that lies. How would that even work?", next = "locks2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    locks2 = {
      lines = { { id = "locks2_1", text = "A false set! The pins click as if they've given way and they haven't, so the picker thinks they're through and puts their weight on the bar, and that trips the second mechanism. I've a prototype. It fooled Myrokos for eleven seconds, and he's promised not to tell Fahrad until I've got it to twenty." } },
      choices = {
        { text = "Eleven seconds against Myrokos is a triumph.", next = "BACK", reply = "It is! It is. I've written it on the wall.", fx = { affinity = 1 } },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    gnome = {
      lines = { { id = "gnome_1", text = "Working, without a committee! In Gnomeregan every design went before a review board, and the board went before a second board. Here Lord Ravenholdt says \"I need a door that kills,\" and I say \"how quickly,\" and that's the entire meeting." } },
      choices = {
        { text = "Do you miss Gnomeregan?", next = "gnome2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    gnome2 = {
      lines = { { id = "gnome2_1", text = "I miss the lifts. And the noise, a whole city humming at once. I was already here when it fell. I heard about the gas a month late, from a pedlar, and I built nothing for a week. Then I built a ventilator, a very good one, far too late for anybody." } },
      choices = {
        { text = "I'm sorry, Zan.", next = "BACK", reply = "Thank you. It's on the top shelf. I oil it. I don't know why." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    try = {
      lines = { { id = "try_1", key = true, text = "Ready? Go. Don't rake it, feel it. There's the first. Second. You're rushing the third, it's a spool. There! Nineteen seconds. That's respectable. That's better than respectable, that's faster than Carlo, and I'm absolutely going to tell him." } },
      choices = {
        { text = "Tell him gently. He's an assassin.", next = "BACK", reply = "Good point. I'll tell him from behind something." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    ravenholdt = { { id = "tp_ravenholdt", text = "Unlimited brass, no review board, and nobody minds the noise. It's the best workshop I've ever had, and it's in a cellar." } },
    gnomeregan = { { id = "tp_gnomeregan", text = "Home. I'd rather talk about gear ratios, if it's all the same to you." } },
    advice = { { id = "tp_advice", text = "Label your wires. I can't stress it enough. Colour is not a label, colour is a hope." } },
    goblins = { { id = "tp_goblins", text = "They build fast and they build once. I build slow and it works the second time too." } },
    fahrad = { { id = "tp_fahrad", text = "A great rogue and a terrible critic. He's never once said a nice thing about a tumbler." } },
    _none = { { id = "tp_none", text = "No idea, never measured it. Bring me one and a spanner and I'll tell you in an hour." } },
  },
}

---------------------------------------------------------------------------
-- Master Kang: the orc who drills Ravenholdt's sentries in the yard.
---------------------------------------------------------------------------
P:NPC {
  key = "hb_kang", id = TODO_NPC("Master Kang"), name = "Master Kang",
  bible = "bibles/more_folk.md", role = "trainer", tier = "service",
  communities = { "ravenholdt" }, temper = { "stern", "measured" }, values = { "discipline", "honor" },
  notices = { "class", "race" },
  impression = {
    first = "Master Kang is an orc who drills the sentries of Ravenholdt Manor, patiently and without raising his voice. He corrects a stance with two fingers and speaks of discipline as something his own people lost once and paid for.",
    third = "{name} met Master Kang, the orc who trains the sentries of Ravenholdt Manor.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Throm-ka, {class}. You come back to this hill, and I am glad of it. Stand with me and watch the drills." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Stand out of the line, and keep silent, for the sentries do not need your distraction." },
    { id = "g_1", text = "Stand there, out of the line, and watch if you wish. They learn better when a stranger's eyes are on them." },
    { id = "g_2", when = { race = "Orc" }, text = "Throm-ka, {class}. It is long since I have heard our tongue on this hill, so speak a little before you go." },
    { id = "g_3", when = { class = { "WARRIOR", "ROGUE" } }, text = "You carry yourself like one who has been drilled. Your left shoulder leads, though. Someone let that pass who should not have." },
    { id = "g_4", when = { metBefore = true }, text = "You return. They are a little better than when you last watched, and so, I hope, are you." },
  },

  notice = {
    { id = "n_1", cat = "class", when = { class = "WARRIOR" },
      text = "You plant your feet as if the ground owed you something. It is strong, and it is slow. A sentry who fought you would simply walk around." },
    { id = "n_2", cat = "race", when = { race = "Human" },
      text = "A human, watching an orc teach humans to fight. You find it strange. So did they, for a week." },
  },

  start = "hello",
  nodes = {
    w3_syndicate = {
      lines = {
        { id = "w3_syndicate_1", text = "Twice, on the path below, when they came at night thinking an old orc would be asleep. The first fight took two movements, the second took three, and I have been ashamed of that third movement ever since." },
      },
      choices = {
        { text = "Why ashamed?", next = "w3_third" },
        { text = "Two out of three is fine work.", next = "BACK", reply = "Fine for a student. A master counts the movement he did not need, and I needed it, so I was slow." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_third = {
      lines = {
        { id = "w3_third_1", text = "Because the man had stopped fighting and I struck again out of habit, not need. A blade that moves without the mind behind it is no better than a Syndicate club, and I teach my sentries that lesson using my own mistake." },
      },
      choices = {
        { text = "That's a hard thing to admit. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "I am called Master Kang. I teach the sentries of this house to stand a watch and to end a fight in three movements or fewer. They were bold and sloppy when I came. Now they are only a little sloppy." },
        { id = "hello_2", when = { race = "Orc" }, text = "I am Kang. You wonder what an orc does in a human lord's yard. I teach, and I am paid, and I am treated as a master of my craft. There are worse places for one of our blood to stand." },
      },
      again = {
        { id = "hello_a1", text = "Ask, while they rest." },
        { id = "hello_a2", text = "The students may breathe a moment longer. Ask what you came to ask." },
        { id = "hello_a3", text = "A question is a door, my friend. Which one will you open next?" },
      },
      choices = {
        { text = "Discipline means fighting fair, even when no one is watching.", next = "BACK", reply = "It does. A blade without honour is only a knife in the dark, and these hills have enough of those.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Discipline is for winning. Honour is a luxury.", next = "BACK", reply = "You speak like a human mercenary. I learned better in the camps, and I would have you learn it more cheaply.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "What do you teach them first?", next = "teach" },
        { text = "How did an orc come to serve this house?", next = "orc" },
        { text = "Are they any good, your sentries?", next = "sentries" },
        { text = "Why not teach in Orgrimmar?", next = "horde", when = { race = "Orc" } },
        { text = "Show me what's wrong with my stance.", next = "stance", when = { class = { "WARRIOR", "ROGUE" } } },
        { text = "Have you fought the Syndicate yourself?", next = "w3_syndicate" },
        { text = "I'll leave you to your drill.", next = "END" },
      },
    },
    teach = {
      lines = { { id = "teach_1", text = "To stand still. It sounds like nothing. A sentry stands for six hours and fights for six breaths, and if the standing has made him stiff or bored, the six breaths go badly. So they stand, and I walk behind them with a reed, and I touch whatever has gone slack." } },
      choices = {
        { text = "And after standing?", next = "teach2" },
        { text = "Patience before the blade, then.", next = "teach2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    teach2 = {
      lines = { { id = "teach2_1", text = "Then one cut, the same cut, a thousand times. They hate it. In the camps I watched warriors who had known a hundred techniques sit in the mud and forget every one. The single thing a body keeps is what it has done a thousand times. I give them that." } },
      choices = {
        { text = "That is hard teaching, and good.", next = "BACK", reply = "It is the only kind that is still there on the worst day.", fx = { affinity = 1 } },
        { text = "Drill makes soldiers dull.", next = "BACK", reply = "Dull, and alive. I have met the other kind, briefly." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    orc = {
      lines = { { id = "orc_1", text = "I was a blademaster's student before the Dark Portal, and a prisoner after the war. When the camps were broken I went north instead of west. I had no wish to be a soldier again. Lord Ravenholdt found me breaking horses in Strahnbrad, and asked what else I could break." } },
      choices = {
        { text = "And you trust a lord of thieves?", next = "orc2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    orc2 = {
      big = true,
      lines = { { id = "orc2_1", text = "He has never lied to me, and he has never called me a beast, and he pays in silver. My own warlocks did the first, and the human wardens the second. I serve a man who kills for coin, and I have asked myself whether that is honor. What do you say?" } },
      choices = {
        { text = "Honor is in the teaching, and yours is clean.", next = "BACK", reply = "So I have come to think. The reed and the cut are honest things.", fx = { align = { honor = 1 } } },
        { text = "A blade for hire has no honor to keep.", next = "BACK", reply = "It may be so. Then I am at least an honest tool, which I was not under the Shadow Council.", fx = { align = { honor = -1 } } },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    sentries = {
      lines = { { id = "sentries_1", text = "Better than the Syndicate's, which is no boast. The tall one will be good. The one with the scar thinks too much of his own arm. I pair them, so the tall one learns nerve and the scarred one learns that he can be touched." } },
      choices = {
        { text = "You know them well.", next = "BACK", reply = "A teacher who does not is only a man shouting in a yard." },
        { text = "Something else.", next = "BACK" },
      },
    },
    horde = {
      lines = { { id = "horde_1", text = "I have thought of it. The Warchief is building something worthy there, they say, and I hear he was himself raised in a human's keep not far from here. But a young Horde wants young teachers, without my years in the pens on them. I would only remind them." } },
      choices = {
        { text = "The young should be reminded.", next = "horde2" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    horde2 = {
      lines = { { id = "horde2_1", text = "Perhaps. If I go, it will be when these ones can stand a watch without me. A master does not leave a lesson at the ninth hundredth cut. Tell them in Orgrimmar that Kang still drills, and that he has not forgotten the tongue." } },
      choices = {
        { text = "Lok'tar, Master Kang. I'll tell them.", next = "BACK", reply = "Lok'tar. Walk straight, {class}." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    stance = {
      lines = { { id = "stance_1", text = "Stand as you would to receive a charge. There. Your rear heel is lifted, and so your whole weight is a question. Set it down. Bend the knee the width of two fingers. Now I push, and you see, you do not move. It is that small." } },
      choices = {
        { text = "Two fingers' width. I felt the difference.", next = "BACK", reply = "Good. Do it a thousand times, and you will not have to feel it." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    ravenholdt = { { id = "tp_ravenholdt", text = "A house with rules, and it keeps them. I ask little more of any master." } },
    thrall = { { id = "tp_thrall", text = "A slave who became a chief and did not become a tyrant. I did not think to see it in my life." } },
    syndicate = { { id = "tp_syndicate", text = "Brave in a crowd and nowhere else. My sentries have learned to wait for the crowd to thin." } },
    advice = { { id = "tp_advice", text = "Do the one thing until you cannot do it wrong. Only then learn a second thing." } },
    internment_camps = { { id = "tp_internment_camps", text = "I was in Durnholde's pens, down the valley. I do not walk that way." } },
    _none = { { id = "tp_none", text = "I do not know it. I know the yard, and the cut, and little else worth your time." } },
  },
}

---------------------------------------------------------------------------
-- Carlo Aurelius: one of Ravenholdt's assassins, at ease near the manor between contracts.
---------------------------------------------------------------------------
P:NPC {
  key = "hb_carlo", id = TODO_NPC("Carlo Aurelius"), name = "Carlo Aurelius", title = "Assassin",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  communities = { "ravenholdt" }, temper = { "urbane", "chilling" }, values = { "precision", "reputation" },
  notices = { "class", "purse" },
  impression = {
    first = "Carlo Aurelius is an assassin of Ravenholdt, resting near the manor between contracts, and he has the easy manners of a man at a garden party. He speaks of his work as a profession with standards, and he seems to regard most killers as tradesmen who never finished their apprenticeship.",
    third = "{name} met Carlo Aurelius, an assassin of Ravenholdt Manor.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, my favourite colleague, and on a day when neither of us is working. Do sit, and tell me about your last little errand." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. I'm not working this afternoon, which is your good fortune, so do keep it brief." },
    { id = "g_1", text = "Good day to you. Do be at ease, since I am not working this afternoon, and I never mix the two." },
    { id = "g_2", when = { class = "ROGUE" }, text = "A colleague, of sorts. You carry two blades where one would do, which tells me you expect to be seen. We must talk about that." },
    { id = "g_3", when = { metBefore = true }, text = "We meet again, and both still in good health. I take it as a compliment to us both." },
  },

  notice = {
    { id = "n_1", cat = "class", when = { class = "ROGUE" },
      text = "There is dried blood under your right thumbnail. Small thing. It is always the small thing that a magistrate's man remembers." },
    { id = "n_2", cat = "purse", when = { money = { min = 1000000 } },
      text = "You are comfortably off, I see. Should you ever need a difficulty resolved, the house keeps a list, and I am on the expensive page." },
  },

  start = "hello",
  nodes = {
    w3_leisure = {
      lines = {
        { id = "w3_leisure_1", text = "I read poetry, the older the better, and I keep a rose in a pot that Simone Cantrell gave me with instructions I follow exactly. The rose has outlived two of my colleagues, which I take as a sign that it is better at its work than they were at theirs." },
      },
      choices = {
        { text = "An assassin who reads poetry?", next = "w3_poetry" },
        { text = "Simone trusts you with a rose.", next = "BACK", reply = "She trusts me with a rose, which is not the same as trusting me. I find the distinction charming." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_poetry = {
      lines = {
        { id = "w3_poetry_1", text = "Who better? Poetry is the art of saying a great deal with very few words, and so is my trade, though my readers seldom get to finish the page. Forgive me, that was in poor taste, and I said it anyway." },
      },
      choices = {
        { text = "I'll forgive it. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Carlo Aurelius. The house lists me as an assassin, which is accurate, though I prefer to think I deal in conclusions. I am between engagements, and so I walk, and take the air, and talk to whoever the Wolf has let up the path." },
        { id = "hello_2", when = { metBefore = true }, text = "Carlo Aurelius, still at leisure. It will not last. It never does. What shall we talk about?" },
      },
      again = {
        { id = "hello_a1", text = "Was there something else? I have the afternoon." },
        { id = "hello_a2", text = "Do go on." },
        { id = "hello_a3", text = "Yes? Take your time; I have nowhere to be until somebody else does." },
      },
      choices = {
        { text = "You call it dealing in conclusions.", next = "trade" },
        { text = "Does an assassin have rules?", next = "rules" },
        { text = "What do you make of the others here?", next = "house" },
        { text = "Why is two blades a mistake?", next = "two", when = { class = "ROGUE" } },
        { text = "Zan says I opened his lock faster than you.", next = "zan", when = { heardLine = "hb_zan.try_1" } },
        { text = "How do you spend your leisure, Carlo?", next = "w3_leisure" },
        { text = "Enjoy your leisure, Carlo.", next = "END" },
      },
    },
    trade = {
      lines = { { id = "trade_1", text = "Every quarrel in the world is waiting to end. Usually it ends badly, at great expense, with soldiers. Now and then someone sees that it could end tonight, quietly, with one man fewer. They write to Lord Ravenholdt, and he sends for me. I think of myself as a saving in soldiers." } },
      choices = {
        { text = "That's a comfortable way to see it.", next = "trade2" },
        { text = "Fewer soldiers dead is something.", next = "trade2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    trade2 = {
      big = true,
      lines = { { id = "trade2_1", text = "It is comfortable. I arranged it to be. A man in my profession chooses what to believe about it, early, and then does not look underneath. I have told you mine. I am curious what you would put in its place, if you had my ledger." } },
      choices = {
        { text = "The truth. You kill for money, and you know it.", next = "BACK", reply = "I do. It is refreshing to hear it without the gasp.", fx = { align = { honor = 1 } } },
        { text = "Yours will serve. A clean end is a mercy.", next = "BACK", reply = "Then we understand each other, and I shall sleep exactly as well as before.", fx = { align = { honor = -1 } } },
        { text = "Another matter.", next = "BACK" },
      },
    },
    rules = {
      lines = { { id = "rules_1", text = "Three, and they are the house's as much as mine. Never the wrong person. Never more than the person. And never for the Syndicate, at any price, which has cost us a good deal of easy coin. A killer without rules is only an accident with a knife." } },
      choices = {
        { text = "Have you ever refused a contract?", next = "rules2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    rules2 = {
      lines = { { id = "rules2_1", text = "Once. The name was a magistrate's daughter, nine years old, and the client wanted a lesson taught to her father. I returned the fee with a note. Lord Ravenholdt read it and sent me back, with a different name on the paper. The client's." } },
      choices = {
        { text = "Then the house has a conscience.", next = "BACK", reply = "It has standards, which wear better. But I was glad of them that week.", fx = { affinity = 1 } },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    house = {
      lines = { { id = "house_1", text = "The Wolf is the best watchman I have known and the worst conversationalist. Myrokos could walk through this sentence without disturbing it. Kang drills the sentries as if they were sons. And Fahrad teaches, and smiles, and I have never once heard him come into a room." } },
      choices = {
        { text = "And Simone Cantrell, the gardener?", next = "house2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    house2 = {
      lines = { { id = "house2_1", text = "I would sooner cross Fahrad than her hedges. She has laid this whole hillside out like a sentence with only one meaning. I walked into a dead end of hers my first month and stood there till dawn, rather than admit it by calling out." } },
      choices = {
        { text = "Did she ever find out?", next = "BACK", reply = "She brought me breakfast. She had known since midnight." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    two = {
      lines = { { id = "two_1", text = "Because the second blade is for a fight, and the work, done properly, contains no fight. If you are parrying, the evening has already gone wrong. Carry one, keep it where it cannot be seen, and spend what the other cost you on better shoes." } },
      choices = {
        { text = "One blade and good shoes.", next = "BACK", reply = "You laugh. I have never been caught, and I have very good shoes." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    zan = {
      lines = { { id = "zan_1", text = "Did he? From behind something, I trust. He is quite right. I am slow with locks. I have always found that a door opens fastest when someone inside wishes to let you in, and I have made a study of that instead." } },
      choices = {
        { text = "Charm is its own lockpick.", next = "BACK", reply = "The oldest one, and it leaves no scratches." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    ravenholdt = { { id = "tp_ravenholdt", text = "The last house in the north where a contract means what it says. I should be nothing without it, and somewhat dead." } },
    syndicate = { { id = "tp_syndicate", text = "Amateurs who kill for spite and call it politics. They give the profession a bad name, and it had little enough to spare." } },
    advice = { { id = "tp_advice", text = "Be forgettable. A pleasant face nobody can quite describe is worth more than any blade." } },
    fahrad = { { id = "tp_fahrad", text = "I know his habits, his tailor and his taste in wine, and I could not tell you one true thing about him." } },
    alterac = { { id = "tp_alterac", text = "A kingdom murdered by its own lords. They did it clumsily, and in public. I cannot respect that." } },
    _none = { { id = "tp_none", text = "I regret that I cannot help you there. It has never been the subject of a contract." } },
  },
}

---------------------------------------------------------------------------
-- Simone Cantrell: the night elf who laid out Ravenholdt's grounds, every hedge of them a defence.
---------------------------------------------------------------------------
P:NPC {
  key = "hb_simone", id = TODO_NPC("Simone Cantrell"), name = "Simone Cantrell", title = "Landscape Architect",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  communities = { "ravenholdt" }, temper = { "serene", "sly" }, values = { "nature", "patience" },
  notices = { "race", "class" },
  impression = {
    first = "Simone Cantrell is a night elf who designed the grounds of Ravenholdt Manor, and it takes a while to see that every hedge and terrace is a wall, a blind or a trap. She is serene and a little sly, and plainly fond of what she has grown.",
    third = "{name} met Simone Cantrell, the night elf who laid out the grounds of Ravenholdt Manor.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ishnu-alah, friend. You walk the worn moss now as if you were born to it, and the garden has noticed." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Keep to the worn moss, please, for I would not have the garden take offence at your careless feet." },
    { id = "g_1", text = "Ishnu-alah, traveller. Walk where the moss is worn, if you please, for the rest of the garden is not as gentle as it appears." },
    { id = "g_2", when = { race = "NightElf" }, text = "Elune light your steps, {g:brother|sister}. It gladdens me to see one of our own on this cold hill, though I can guess what you are thinking of my employers." },
    { id = "g_3", when = { class = "DRUID" }, text = "You feel it, I think. The roots here have been asked to do an unusual thing, and they did not all consent at once." },
    { id = "g_4", when = { metBefore = true }, text = "You found the way again, and without help. The hedges must have decided they like you." },
  },

  notice = {
    { id = "n_1", cat = "class", when = { class = { "DRUID", "HUNTER" } },
      text = "You looked at the treeline before you looked at the house. Good. Most visitors admire the roses, and the roses are the least of what is here." },
    { id = "n_2", cat = "race", when = { race = "Tauren" },
      text = "One of the shu'halo. Your people shape nothing and are sheltered by everything, and I have often thought it the wiser art." },
  },

  start = "hello",
  nodes = {
    w3_lord = {
      lines = {
        { id = "w3_lord_1", text = "Every night, alone, on the one path the hedges will always let him take. He never speaks of what he thinks there, and I never ask, but he stops in the same place each time, by the moonpetal, and stays a little longer than a man of his trade ought to." },
      },
      choices = {
        { text = "What does he look at?", next = "w3_look" },
        { text = "A garden can hold a man's thoughts.", next = "BACK", reply = "It can. That is half of what gardens are for, though men rarely know they've left their thoughts behind in one." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_look = {
      lines = {
        { id = "w3_look_1", text = "The moon, perhaps, or the flower, or the valley below where the Syndicate's fires burn. I have walked the path after him and found nothing there but the smell of the petals, so I think he simply rests." },
      },
      choices = {
        { text = "Even a lord of thieves must rest. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "I am Simone Cantrell. I shaped these grounds for Lord Ravenholdt, the terraces and the hedges and the path you climbed. A human sees a pretty garden. It is rather more than that, and I am pleased when someone notices." },
        { id = "hello_2", when = { race = "NightElf" }, text = "I am Simone Cantrell. Yes, a daughter of the forest tending a human assassin's hedges. I have had a long life, and I have found that one may practise an honest craft in a doubtful house." },
      },
      again = {
        { id = "hello_a1", text = "Ask freely. The garden will keep." },
        { id = "hello_a2", text = "Something more on your mind, traveller? The thorns never mind an interruption." },
        { id = "hello_a3", text = "Yes, traveller?" },
      },
      choices = {
        { text = "What is this garden, truly?", next = "garden" },
        { text = "What brings a night elf to this house?", next = "elf" },
        { text = "What grows on a hill this cold?", next = "plants" },
        { text = "The roots did not all consent?", next = "roots", when = { class = "DRUID" } },
        { text = "Myrokos says you two talk about nothing.", next = "myrokos", when = { heardLine = "hb_myrokos.silence2_1" } },
        { text = "Does Lord Ravenholdt walk your garden?", next = "w3_lord" },
        { text = "I'll keep to the worn moss.", next = "END" },
      },
    },
    garden = {
      lines = { { id = "garden_1", text = "A wall that does not look like one. Every hedge is thorn at the core. Every terrace gives a watcher above a clear view of whoever stands below. There are three true paths to the door, and I change which three with the seasons. Winstone grumbles at it, and follows my markers." } },
      choices = {
        { text = "And those who take the wrong path?", next = "garden2" },
        { text = "You've made a fortress out of flowers.", next = "garden2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    garden2 = {
      lines = { { id = "garden2_1", text = "They walk a long while, and arrive where they started, somewhat scratched and much less sure of themselves. I do not build to kill. A confused intruder who goes home has a tale that keeps ten others away. Winstone has his own methods, at the second bend, and I do not ask." } },
      choices = {
        { text = "A garden that teaches fear without blood.", next = "BACK", reply = "That is the design. I am glad it reads so clearly.", fx = { affinity = 1 } },
        { text = "Thorns alone won't stop the Syndicate.", next = "BACK", reply = "No. They are only the first sentence. The house finishes the thought." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    elf = {
      lines = { { id = "elf_1", text = "Curiosity, at first. After the war ended on Hyjal I wished to see what the young races had made of the east. I found a lord on a hillside who wanted a garden no enemy could cross, and it was the most interesting request I had heard in a thousand years." } },
      choices = {
        { text = "Does it trouble you, what the house does?", next = "elf2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    elf2 = {
      big = true,
      lines = { { id = "elf2_1", text = "I have asked it of myself beneath many moons. They are killers. They are also the only power in these hills that the Syndicate fears, and the Syndicate burns farms. I shelter a lesser harm against a greater. Is that balance, do you think, or only a comfortable word?" } },
      choices = {
        { text = "It's balance. The world is rarely cleaner than that.", next = "BACK", reply = "So I have judged. It is good to hear it from one with fewer years to cloud them.", fx = { align = { order = 1 } } },
        { text = "It's a comfortable word. Killers are killers.", next = "BACK", reply = "Perhaps. I have known myself to be wrong for a century at a time.", fx = { align = { order = -1 } } },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    plants = {
      lines = { { id = "plants_1", text = "More than you would think. Hawthorn and blackthorn for the hedges, since they love poor soil and hold their spines. Briar rose, for beauty and for malice. Yew, which lives nearly as long as we do. And a little moonpetal by the door, which should not grow here at all." } },
      choices = {
        { text = "How does moonpetal grow in Alterac?", next = "plants2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    plants2 = {
      lines = { { id = "plants2_1", text = "I sing to it. Do not smile. It is a homesick plant, and so am I, and each evening I tell it of Ashenvale until it forgets the frost. Lord Ravenholdt once asked what it was for. I told him it was the one thing in his garden that defends nothing." } },
      choices = {
        { text = "Every fortress needs one such thing.", next = "BACK", reply = "He said the same, in fewer words, and has never let it be cut." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    roots = {
      lines = { { id = "roots_1", text = "Thorn is willing. It is in its nature to guard. But I asked an old oak to lean across the east path and close it, and oaks do not care to be told where to stand. We spoke for a season. It leans now, though it took its own time, and I honour it with the first water each spring." } },
      choices = {
        { text = "You asked, and did not command. That matters.", next = "BACK", reply = "It is all the difference. A commanded tree is only timber that has not fallen yet." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    myrokos = {
      lines = { { id = "myrokos_1", text = "Does he say so? Then he has told you more than he tells most. We sit by the moonpetal and say nothing for an hour, and then he remarks that the yew has grown, and I agree. It is the most restful conversation I have had on this continent." } },
      choices = {
        { text = "He called it a friendship.", next = "BACK", reply = "Did he? I shall not mention that I know. He would go silent for a month." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    ravenholdt = { { id = "tp_ravenholdt", text = "A house that plants for a hundred years ahead. Few humans think so far, and I respect it in this one." } },
    syndicate = { { id = "tp_syndicate", text = "They hack at what they cannot cross. I have regrown the south hedge four times, thicker each time." } },
    ashenvale = { { id = "tp_ashenvale", text = "Home. I will see it again, when this garden no longer needs me, and gardens are patient." } },
    advice = { { id = "tp_advice", text = "Plant for the one who comes after you. It is the only planting that is never wasted." } },
    elune = { { id = "tp_elune", text = "She shines on this hill as on any other. I had wondered whether she would." } },
    _none = { { id = "tp_none", text = "I cannot tell you. My knowledge ends where the roots do." } },
  },
}

---------------------------------------------------------------------------
-- Tamara Armstrong: a Southshore townswoman who will not leave, whatever comes down the road from Tarren Mill.
---------------------------------------------------------------------------
P:NPC {
  key = "hb_tamara", id = TODO_NPC("Tamara Armstrong"), name = "Tamara Armstrong",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  communities = { "southshore" }, temper = { "anxious", "stubborn" }, values = { "family", "home" },
  notices = { "race", "class" },
  impression = {
    first = "Tamara Armstrong lives in Southshore with her husband Hemmit and keeps one eye on the north road at all times. She is frightened of what Tarren Mill sends down it, and too stubborn to be driven from her own doorstep.",
    third = "{name} met Tamara Armstrong, a townswoman of Southshore.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Oh, it's you, thank the Light. Hemmit and I were just saying we'd sleep easier knowing you were about the town." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "Oh. It's you. You gave me a start, and I'd rather you went on your way, if it's all the same to you." },
    { id = "g_1", text = "Oh! You gave me a start. I thought for a moment you'd come down the north road, and nothing good comes down that." },
    { id = "g_2", when = { class = { "PALADIN", "PRIEST" } }, text = "Light bless you for coming. We've prayed for more of your sort here, and mostly we get tax collectors." },
    { id = "g_3", when = { metBefore = true }, text = "It's you again. Good. I count the faces I know, these days, and I like the count to go up." },
  },

  notice = {
    { id = "n_1", cat = "class", when = { class = { "WARRIOR", "PALADIN" } },
      text = "You're armed, and you look as if you know the use of it. Would you stand by the north fence a while? Only while you're here. I'd sleep better." },
    { id = "n_2", cat = "race", when = { race = "Dwarf" },
      text = "A dwarf. Your folk at the brewery have stood by this town through everything, and I'll not forget it." },
  },

  start = "hello",
  nodes = {
    w3_young = {
      lines = {
        { id = "w3_young_1", text = "Loud, and full of fish, and every autumn a fair on the green with music until the lamps ran out of oil. The orcs were in the camp up at Durnholde then, and we'd see the guards marching past on their way up, and we never once thought about what was inside." },
      },
      choices = {
        { text = "Do you think of it now?", next = "w3_now" },
        { text = "It sounds a happy place.", next = "BACK", reply = "It was, mostly. I'd like it to be again, before I'm too old to dance at the fair." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_now = {
      lines = {
        { id = "w3_now_1", text = "Since the orcs broke out and came back with a Warchief, I've thought of nothing else some nights. We let those camps stand on our hill for years, and I've wondered whether that's why the war keeps finding us." },
      },
      choices = {
        { text = "You're not to blame, Tamara. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Tamara Armstrong. Hemmit and I have lived in Southshore all our married life, and I was born two streets from the water. There's a town of dead men a morning's walk north of here, and I'm told I ought to leave. I'll not." },
        { id = "hello_2", when = { metBefore = true }, text = "Tamara Armstrong, still here, as I said I'd be. Hemmit's mending the shutters again. He does it whenever the news is bad, so they're very well mended." },
      },
      again = {
        { id = "hello_a1", text = "What else? I'm glad of someone to talk to." },
        { id = "hello_a2", text = "Go on. I'm only watching the road." },
        { id = "hello_a3", text = "Yes? Say it, love, I'm only watching the road." },
      },
      choices = {
        { text = "Why not leave, if it frightens you?", next = "stay" },
        { text = "What comes down the north road?", next = "north" },
        { text = "How is Southshore holding up?", next = "town" },
        { text = "I'll stand by your fence a while.", next = "fence", when = { class = { "WARRIOR", "PALADIN" } } },
        { text = "Tell me about Hemmit.", next = "hemmit" },
        { text = "What was Southshore like when you were young?", next = "w3_young" },
        { text = "Light keep you, Tamara.", next = "END" },
      },
    },
    stay = {
      lines = { { id = "stay_1", text = "Because it's mine. My mother's buried in that churchyard, and my wedding was in that hall. If I pack a cart and go to Stormwind, I'm a refugee with a sad story, like ten thousand others. Here I'm Tamara Armstrong, and people know my bread." } },
      choices = {
        { text = "A home isn't worth dying for.", next = "stay2" },
        { text = "That's courage, of a quiet sort.", next = "stay2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    stay2 = {
      big = true,
      lines = { { id = "stay2_1", text = "I don't know which it is, courage or only being set in my ways. Sarah Raycroft's sold nine trunks this year to families leaving. Each time, I think, there go the sensible ones. And then I bake. Am I a fool to stay, do you think?" } },
      choices = {
        { text = "No. A town lives while its people stand.", next = "BACK", reply = "Then I'll stand, and bake, and tell Hemmit a stranger said so.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "Yes. Go while the road south is open.", next = "BACK", reply = "You may be right. I'd want to hear it from the Magistrate before I believed it.", fx = { align = { order = -1 } } },
        { text = "Another matter.", next = "BACK" },
      },
    },
    north = {
      lines = { { id = "north_1", text = "Dead men, in the Dark Lady's colours, with hounds made of bone. They raid the farms in the fields and they've killed good people I knew by name. And worse than the raids, there's a smell on the north wind some mornings, sharp, like a chemist's shop. Nobody will tell me what it is." } },
      choices = {
        { text = "A chemist's smell, from Tarren Mill?", next = "north2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    north2 = {
      lines = { { id = "north2_1", text = "Since the spring. The dogs won't go out in it. Marshal Redpath says it's nothing, and he says it too quickly. I'm not a clever woman, but I know when a man's been told not to frighten the town. I keep a wet cloth by the door, for what good it'd do." } },
      choices = {
        { text = "Keep the cloth. You're no fool.", next = "BACK", reply = "That's kind. Hemmit says I worry. Hemmit mends shutters." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    town = {
      lines = { { id = "town_1", text = "Thinner than it was. The fishing's good and the brewery's working, and there are soldiers in the streets who weren't here two years ago. But there's a house empty on every row now, and Innkeeper Anderson has more adventurers than neighbours at his tables." } },
      choices = {
        { text = "Adventurers bring coin, at least.", next = "BACK", reply = "They do, and they leave again. I'd trade ten of them for one family that stayed." },
        { text = "Something else.", next = "BACK" },
      },
    },
    fence = {
      lines = { { id = "fence_1", text = "Would you? Oh, bless you. It's only that Hemmit won't say he's frightened, and I won't say I am, and so neither of us looks at the fence. If you stood there a quarter hour, I could hang the washing and not keep turning round." } },
      choices = {
        { text = "Hang your washing. I've got the road.", next = "fence2" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    fence2 = {
      lines = { { id = "fence2_1", text = "There. That's the first time since midsummer I've pegged a sheet without counting the trees. I know it's nothing to you. You'll be gone by supper. But I'll remember there was an afternoon somebody had the road." } },
      choices = {
        { text = "It wasn't nothing.", next = "BACK", reply = "No. No, it wasn't. Thank you." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hemmit = {
      lines = { { id = "hemmit_1", text = "Thirty years married. He was a cooper's boy and I was the baker's girl, and he'd walk past the shop four times a day until I spoke to him. He's not a talker. When the news is good he whistles, and when it's bad he finds a hammer." } },
      choices = {
        { text = "He sounds a steady man.", next = "BACK", reply = "Steady as the tide. I'd not be brave without him, and don't you tell him." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    southshore = { { id = "tp_southshore", text = "My whole life, in a dozen streets. I'll not have it said it wasn't worth guarding." } },
    forsaken = { { id = "tp_forsaken", text = "Poor damned things, and I mean it both ways. I knew folk in Tarren Mill. I pray I never see one of them at the fence." } },
    tarren_mill = { { id = "tp_tarren_mill", text = "It was a pretty town. We'd go up for the apple fair. I can't think of it now without a shiver." } },
    advice = { { id = "tp_advice", text = "Bake when you're frightened. Your hands need something, and at the end there's bread." } },
    stormwind = { { id = "tp_stormwind", text = "Far away, and busy with itself. They send us soldiers, and I'm grateful, and I notice they send no more than they must." } },
    _none = { { id = "tp_none", text = "I wouldn't know, dear. I don't hear much beyond the north fence." } },
  },
}

---------------------------------------------------------------------------
-- George Candarte: a Forsaken leather supplier camped out of sight by Thoradin's Wall.
---------------------------------------------------------------------------
P:NPC {
  key = "hb_candarte", id = TODO_NPC("George Candarte"), name = "George Candarte", title = "Leatherworking Supplies",
  bible = "bibles/more_folk.md", role = "vendor", tier = "service",
  communities = { "tarren_mill" }, temper = { "furtive", "genial" }, values = { "caution", "trade" },
  notices = { "profession", "race" },
  impression = {
    first = "George Candarte sells leatherworking supplies from behind a hill by Thoradin's Wall, as far from any town as a merchant can sensibly get. He is genial enough once he has decided a visitor is not a tax collector, a dwarf or a debt.",
    third = "{name} met George Candarte, a Forsaken leather supplier camped by Thoradin's Wall in Hillsbrad.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Ah, it's you again, and you found the path without anyone telling you. I like that in a customer." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. You found me, so I'll sell to you, but I'd thank you not to tell anyone the way." },
    { id = "g_1", text = "Ah! You've found me. Nobody finds me by accident, so who told you, and do I owe them anything?" },
    { id = "g_2", when = { profession = { "Leatherworking", "Skinning" } }, text = "A leatherworker, or near enough. Then you've come for thread and salt, and not for me, which is a relief." },
    { id = "g_3", when = { metBefore = true }, text = "You again. Good. You didn't bring anyone, did you? No. Good." },
  },

  notice = {
    { id = "n_1", cat = "profession", when = { profession = "Skinning" },
      text = "Fresh hides on your pack, and not salted. They'll turn by tomorrow in this damp. Buy a bag of salt before you do anything else." },
    { id = "n_2", cat = "race", when = { race = "Scourge" },
      text = "One of our own. Then I'll ask you plainly: is there a man in Tarren Mill called Jeffcoat still asking after me?" },
  },

  start = "hello",
  nodes = {
    w3_hide = {
      lines = {
        { id = "w3_hide_1", text = "An Arathi raptor skin, green and gold, brought over the wall by a hunter who'd lost two fingers getting it. I sold it to a goblin for a price I'm still ashamed of, and the goblin told me he'd have paid double, and I've never quite recovered." },
      },
      choices = {
        { text = "Who was the hunter?", next = "w3_hunter" },
        { text = "A goblin will always pay double, eventually.", next = "BACK", reply = "So I've learned. I charge them triple to start, now, and they look at me with real respect." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_hunter = {
      lines = {
        { id = "w3_hunter_1", text = "A Forsaken who'd deserted the Mill and lived in the hills beyond the wall, which I'll tell you only because he's long gone east. He bought thread with the coin, and salt, and walked off toward the Arathi ruins, and I've not seen him since." },
      },
      choices = {
        { text = "I hope he found his way. Something else.", next = "BACK" },
      },
    },
    d2_gnolls = {
      lines = {
        { id = "d2_gnolls_1", text = "The Mudsnouts, you mean, from down by Dun Garok. They come up the hill now and then, sniff at the tent, and go away again, because there's nothing here they can eat and I've nothing they want to steal, except the salt." },
      },
      choices = {
        { text = "They steal salt?", next = "d2_gnolls2" },
        { text = "Lucky you, being so unappetising.", next = "d2_gnolls2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_gnolls2 = {
      lines = {
        { id = "d2_gnolls2_1", text = "They took a whole sack of curing salt last summer, and I'd love to know what a gnoll does with it. I've a notion they're curing the dwarves' old stores down in Dun Garok, but I've never been fool enough to go and look." },
      },
      choices = {
        { text = "Best not.", next = "BACK" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    d2_road = {
      lines = {
        { id = "d2_road_1", text = "I do, because the only people who come up here are customers, deserters or debt collectors, and I like to know which before they reach the tent. You I took for a customer, which is why you're still standing there and I'm not halfway over the wall." },
      },
      choices = {
        { text = "And if I'd been a collector?", next = "d2_road2" },
        { text = "Deserters, you said?", next = "d2_road2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    d2_road2 = {
      lines = {
        { id = "d2_road2_1", text = "Then I'd have been a very fast leather merchant for an hour or two. As for deserters, there's a few from the Mill who come through, Forsaken who'd rather not be counted, and I sell them thread and don't take their names, since I'd want the same." },
      },
      choices = {
        { text = "A quiet kind of solidarity.", next = "BACK", reply = "Call it what you like. I call it minding my own business, which is the only business I've got." },
        { text = "Something else, George.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "George Candarte. I sell the makings for leatherwork: thread, salt, dye, a good awl. I sell them here, behind this hill, by the old wall, because the custom's poor but the company's exactly what I want, which is none." },
        { id = "hello_2", when = { profession = "Leatherworking" }, text = "George Candarte. I've coarse and fine thread, curing salt and a few dyes. The hunters who work the Arathi side come through the wall and buy from me, so it's fresh stock, whatever the place looks like." },
      },
      again = {
        { id = "hello_a1", text = "Anything else? Lean in, and mind who's listening over by the inn." },
        { id = "hello_a2", text = "Go on, nobody's about. I've checked." },
        { id = "hello_a3", text = "Yes? Quietly, mind, there's a deathguard on the ridge." },
      },
      choices = {
        { text = "A merchant should sell fair, even way out here behind the wall.", next = "BACK", reply = "Especially out here, since nobody walks this far twice for a merchant who cheated them.", fx = { align = { honor = 1 } } }, -- dp_stance
        { text = "Nobody else is selling out here. Charge them double.", next = "BACK", reply = "Then they'd stop walking this far, and I'd be a merchant behind a hill with no customers at all.", fx = { align = { honor = -1 } } }, -- dp_stance
        { text = "Show me your supplies.", next = "BUSINESS" },
        { text = "Why hide out here?", next = "hide" },
        { text = "What is this old wall?", next = "wall" },
        { text = "Who buys from you, so far from town?", next = "custom" },
        { text = "I've met Jeffcoat. What does he want with you?", next = "jeffcoat", when = { heardLine = "christoph_jeffcoat.h_default" } },
        { text = "Don't the gnolls bother you out here?", next = "d2_gnolls" },
        { text = "You keep a careful eye on the road.", next = "d2_road" },
        { text = "What's the best hide you've ever sold?", next = "w3_hide" },
        { text = "I never saw you, George.", next = "END" },
      },
    },
    hide = {
      lines = { { id = "hide_1", text = "I prefer \"set up at a distance.\" Tarren Mill has a High Executor who wants every tradesman's name in a book, and an apothecary who wants every hide for purposes he doesn't explain. Out here I sell to whom I like, and what I sell gets made into boots." } },
      choices = {
        { text = "You're dodging the Dark Lady's service.", next = "hide2" },
        { text = "A quiet life, then, by a ruined wall.", next = "hide2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    hide2 = {
      big = true,
      lines = { { id = "hide2_1", text = "I'm a leather merchant. I was one alive, and I didn't rise from the grave to become a clerk in somebody's war. I'm loyal enough. I just do it from a distance. You'll say whether that's fair, I can see you want to." } },
      choices = {
        { text = "It's fair. No one owes their death to a cause.", next = "BACK", reply = "That's my view. I'd shake your hand, but two fingers are loose.", fx = { align = { order = -1 } } },
        { text = "It isn't. The Forsaken stand together or fall.", next = "BACK", reply = "So Darthalia would say. She's welcome to walk out here and say it.", fx = { align = { order = 1 } } },
        { text = "Another matter.", next = "BACK" },
      },
    },
    wall = {
      lines = { { id = "wall_1", text = "Thoradin's Wall. Built by the first human king, to keep trolls out, or humans in, depending on who's telling it. It's stood longer than any kingdom behind it. I like having something at my back that's outlasted everybody's opinions." } },
      choices = {
        { text = "And beyond it?", next = "wall2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    wall2 = {
      lines = { { id = "wall2_1", text = "Arathi. Open hills, raptors, and a great many ogres. The Horde has a camp at Hammerfall, far to the east, and their hunters bring me hides through the gap. Good people, orcs. They haggle by shouting and then pay what I first asked." } },
      choices = {
        { text = "You've made yourself a crossroads.", next = "BACK", reply = "A very small one. That's the right size for me." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    custom = {
      lines = { { id = "custom_1", text = "Hunters, both sides of the wall. A goblin who comes through monthly and won't say from where. And Kris Legace, who trades leather up in the Durnholde ruins and is the only other merchant in these hills with the sense to keep out of sight. We wave." } },
      choices = {
        { text = "Kris Legace trades with Alliance and Horde alike.", next = "custom2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    custom2 = {
      lines = { { id = "custom2_1", text = "So she does, and so would I, if a human ever wandered up here without drawing a sword first. Thread doesn't care who's sewing. I sold a spool to a dwarf once, at arm's length. Neither of us spoke. It was the most civil trade I've done all year." } },
      choices = {
        { text = "Trade is its own truce.", next = "BACK", reply = "It's the only one I've seen hold.", fx = { affinity = 1 } },
        { text = "Another matter.", next = "BACK" },
      },
    },
    jeffcoat = {
      lines = { { id = "jeffcoat_1", text = "Money. He staked me to a cartload of hides before the plague and I never delivered, on account of dying. He holds that the debt outlived us both. I hold that a grave settles accounts. We've each got a point, and he's got the ledger." } },
      choices = {
        { text = "I'll not tell him where you are.", next = "BACK", reply = "Bless you. If he asks, I've gone to Kalimdor. Say I looked well." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "We came back wrong, and they want us to come back useful. I'd settle for coming back and being left alone." } },
    tarren_mill = { { id = "tp_tarren_mill", text = "Too many officials, and that smell from the apothecary's shed. I was happier the minute I couldn't see the church." } },
    advice = { { id = "tp_advice", text = "Salt your hides the day you take them. Tomorrow's too late, and the smell will tell you so." } },
    syndicate = { { id = "tp_syndicate", text = "They tried to tax me once. I told them I was dead and penniless, and one of the two was true." } },
    arathi = { { id = "tp_arathi", text = "Windy, wide and full of teeth. Good hides come out of it." } },
    _none = { { id = "tp_none", text = "Don't know, don't want to. That's rather the point of the hill." } },
  },
}

---------------------------------------------------------------------------
-- Craig Hewitt: a Tarren Mill townsman who worked these fields alive and tends what is left of them dead.
---------------------------------------------------------------------------
P:NPC {
  key = "hb_hewitt", id = TODO_NPC("Craig Hewitt"), name = "Craig Hewitt",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  communities = { "tarren_mill" }, temper = { "plain", "dogged" }, values = { "land", "duty" },
  notices = { "race", "profession" },
  impression = {
    first = "Craig Hewitt worked the fields around Tarren Mill when he was alive and still walks them now, though nothing he plants comes up right. He is plain and dogged, and he talks about soil the way other Forsaken talk about vengeance.",
    third = "{name} met Craig Hewitt, a Forsaken farmer of Tarren Mill.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "You came back! Come and look at the turnips, then, because this lot came up nearly the right colour." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Mind the furrow, and keep your boots off my rows, because they're hard enough to keep straight." },
    { id = "g_1", text = "Mind the furrow, if you would, since I've only just turned it and it's the straightest thing I've managed this year." },
    { id = "g_2", when = { profession = "Herbalism" }, text = "You know plants. Come and look at this, then, and tell me if you've ever seen a turnip go that colour." },
    { id = "g_3", when = { metBefore = true }, text = "Back again. Nothing's come up since you were here, in case you were hoping." },
  },

  notice = {
    { id = "n_1", cat = "profession", when = { profession = "Herbalism" },
      text = "You've good earth under your nails, dark and crumbly. That's not from here. Ours is grey, and it sticks." },
    { id = "n_2", cat = "race", when = { race = "Tauren" },
      text = "A tauren. They say your people can feel what the ground wants. I'd take it kindly if you'd stand in my field a minute and tell me." },
  },

  start = "hello",
  nodes = {
    w3_apples = {
      lines = {
        { id = "w3_apples_1", text = "One tree's still trying, at the bottom of the strip, by the old well. It gave me three apples last year, black at the core and sour as vinegar, and I picked them as if they were the finest in Lordaeron." },
      },
      choices = {
        { text = "What did you do with them?", next = "w3_three" },
        { text = "One tree is a start.", next = "BACK", reply = "That's what I tell myself, every morning, when I walk down to look at it. It's a long walk for one tree." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_three = {
      lines = {
        { id = "w3_three_1", text = "Gave one to Innkeeper Shay, who put it in a pie for an orc, and one to Tara Coldgaze, who looked at it a long while and said it was the best apple she'd ever been given. The third I buried under the tree, to give it something back." },
      },
      choices = {
        { text = "That's a farmer's thanks. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Craig Hewitt. I farmed the north strip here for twenty years, barley and apples, and I've gone on farming it since I rose, because nobody told me to stop. The barley comes up black. I plant it anyway." },
        { id = "hello_2", when = { metBefore = true }, text = "Craig Hewitt. Still at it. Tara Coldgaze says I'm the only man in Hillsbrad who's lost two harvests to the same plague." },
      },
      again = {
        { id = "hello_a1", text = "What else? I've rows to walk." },
        { id = "hello_a2", text = "Go on, I can lean on the hoe." },
        { id = "hello_a3", text = "Aye?" },
      },
      choices = {
        { text = "Why farm, if nothing grows right?", next = "farm" },
        { text = "What's wrong with the soil?", next = "soil" },
        { text = "What was Tarren Mill like before?", next = "mill" },
        { text = "Let me stand in your field a moment.", next = "feel", when = { race = "Tauren" } },
        { text = "The Hillsbrad farms still grow good crops.", next = "fields" },
        { text = "Will your apples ever come back?", next = "w3_apples" },
        { text = "Good luck with the barley, Craig.", next = "END" },
      },
    },
    farm = {
      lines = { { id = "farm_1", text = "It's what I know. The others took up swords, or potions, and good luck to them. I woke up with a farmer's hands and a farmer's head. If I stopped, I'd be a dead man standing in a field, and at least this way I'm a dead man working one." } },
      choices = {
        { text = "There's dignity in that.", next = "farm2" },
        { text = "It's a waste of seed.", next = "farm2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    farm2 = {
      lines = { { id = "farm2_1", text = "That's as may be. Innkeeper Shay takes the black barley for his brew, and he says the orcs can't tell the difference after the second mug. And I got three apples off the old tree last autumn. Small, and grey at the core. But they were apples." } },
      choices = {
        { text = "Three apples is a harvest.", next = "BACK", reply = "It is. I put one on my own grave. Seemed only right.", fx = { affinity = 1 } },
        { text = "Another matter.", next = "BACK" },
      },
    },
    soil = {
      lines = { { id = "soil_1", text = "Everything. It's been sour since the plague came through, and it's worse downhill of Apothecary Lydon's shed, where he tips his slops. I've asked him to tip them somewhere else. He looked at me as if a fence post had spoken." } },
      choices = {
        { text = "What does he pour out there?", next = "soil2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    soil2 = {
      big = true,
      lines = { { id = "soil2_1", text = "I don't know, and I've stopped wanting to. Worms won't cross it. I've a mind to dig a ditch, and turn his run-off into the river and away from my strip. Aranae says the river runs down to Southshore, and that I should think on that. I've been thinking. What would you do?" } },
      choices = {
        { text = "Leave the ditch undug. Poison no one's water.", next = "BACK", reply = "Aye. That's where I'd come to, slowly. I'll haul clean earth instead.", fx = { align = { light = 1 } } },
        { text = "Dig it. Southshore is the enemy's town.", next = "BACK", reply = "I suppose it is. It's a queer thing, though, for a farmer to foul a river.", fx = { align = { light = -1 } } },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    mill = {
      lines = { { id = "mill_1", text = "Busy. The wheel turned from harvest to Winter Veil, and carts came up from every farm in the valley. There was an apple fair, and Southshore folk came to it. I sold cider to people who'd now put a pitchfork through me, and I can't say I'd blame them." } },
      choices = {
        { text = "It sounds like a good place to have lived.", next = "BACK", reply = "It was. I try to remember that more than the end of it." },
        { text = "Something else.", next = "BACK" },
      },
    },
    feel = {
      lines = { { id = "feel_1", text = "Go on, then. Anywhere you like. I'll not laugh." } },
      choices = {
        { text = "The ground is grieving. Give it time.", next = "feel2" },
        { text = "It's poisoned, but not dead. Deep down it lives.", next = "feel2" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    feel2 = {
      lines = { { id = "feel2_1", text = "Hm. That's more than Lydon's ever told me, and he's got instruments. I'll keep turning it, then. A thing that's still alive under there deserves somebody up top who hasn't given up on it." } },
      choices = {
        { text = "Walk gently on it, and it will remember you.", next = "BACK", reply = "I always have. It's the one thing I was ever good at." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    fields = {
      lines = { { id = "fields_1", text = "I know it. I can see their barns from the ridge, and the corn standing gold. The deathguards raid them and call it war. I've been asked along, since I know the lanes. I've said no, so far. It doesn't sit right, burning a man's crop." } },
      choices = {
        { text = "A farmer knows what a harvest costs.", next = "BACK", reply = "He does. I'd fight their soldiers. I'll not fight their wheat." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    forsaken = { { id = "tp_forsaken", text = "We're a blighted crop ourselves, and somebody's still tending us. I think about that." } },
    tarren_mill = { { id = "tp_tarren_mill", text = "Home, twice over. I've not found a reason to leave it either time." } },
    southshore = { { id = "tp_southshore", text = "I sold them apples for twenty years. I don't hate them. I don't say that loudly here." } },
    advice = { { id = "tp_advice", text = "Turn the soil before the frost, whatever else is going on. The frost won't wait on your troubles." } },
    plague = { { id = "tp_plague", text = "It took the grain first, and then us. I've never trusted a full sack since." } },
    _none = { { id = "tp_none", text = "Couldn't say. I don't get much news out in the rows." } },
  },
}

---------------------------------------------------------------------------
-- Shara Blazen: keeps to Tarren Mill's old church; troubled by what the Syndicate is doing at Strahnbrad.
---------------------------------------------------------------------------
P:NPC {
  key = "hb_shara", id = TODO_NPC("Shara Blazen"), name = "Shara Blazen",
  bible = "bibles/more_folk.md", role = "questgiver", tier = "quest",
  communities = { "tarren_mill" }, temper = { "intense", "devout" }, values = { "faith", "truth" },
  notices = { "class", "race" },
  impression = {
    first = "Shara Blazen keeps to the old church in Tarren Mill, among pews nobody else uses. She is intense and restless, and she has fixed on the Syndicate's doings at Strahnbrad as a thing that someone must look into.",
    third = "{name} met Shara Blazen in the old church at Tarren Mill, who was troubled by the Syndicate's business at Strahnbrad.",
  },

  greetings = {
    { id = "g_1", text = "Come in, and shut the door, because the draught puts the candles out and I've few enough left." },
    { id = "g_2", when = { questActive = TODO_QUEST("Strahnbrad Mystery") }, text = "You've been to Strahnbrad? Tell me what you saw, and leave nothing out, however small it seemed." },
    { id = "g_3", when = { questDone = TODO_QUEST("Strahnbrad Mystery") }, text = "It's you. I've slept easier since, or I've sat easier, which is what we have in place of it." },
    { id = "g_4", when = { metBefore = true }, text = "You came back. Most don't come into the church twice." },
  },

  notice = {
    { id = "n_1", cat = "class", when = { class = "PRIEST" },
      text = "You've stood at an altar. I can tell by how you looked at this one, to see what was missing from it." },
    { id = "n_2", cat = "class", when = { class = "ROGUE" },
      text = "You came in without the door making a sound. That is exactly the kind of person I've been hoping for." },
    { id = "n_3", cat = "race", when = { race = "Orc" },
      text = "An orc, in a church of the Light, or what was one. Stay. This roof has seen stranger since the plague." },
  },

  start = "hello",
  nodes = {
    w3_loft = {
      lines = {
        { id = "w3_loft_1", text = "On a clear day, the lights of Southshore down by the water, the ruin of Durnholde on its hill, and a thread of smoke over Strahnbrad that shouldn't be there. At night, the Syndicate's lanterns moving, and once, very far north, a light in Alterac that went out as I watched." },
      },
      choices = {
        { text = "What do you think the light was?", next = "w3_light" },
        { text = "You keep a better watch than the Deathguard.", next = "BACK", reply = "The Deathguard watch the road. I watch the sky over it, which is a different kind of watching." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_light = {
      lines = {
        { id = "w3_light_1", text = "A signal, I thought, answered by nothing. I wrote it down, and the hour, and I've watched for it every night since. It hasn't come again, and I've begun to think that whoever lit it got their answer some other way." },
      },
      choices = {
        { text = "Keep watching, Shara. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Shara Blazen. I keep this church, after a fashion. Nobody prays here now, but someone ought to sweep it. And from the bell loft on a clear day I can see smoke over Strahnbrad, where there should be no one left to light a fire." },
        { id = "hello_2", when = { questBefore = TODO_QUEST("Strahnbrad Mystery") }, text = "Shara Blazen. I'll be plain, {class}. The Syndicate have been at Strahnbrad for weeks, a ruined town with nothing left worth stealing, and they are digging. I want to know what for, and the High Executor will not spare a deathguard to find out." },
        { id = "hello_3", when = { questDone = TODO_QUEST("Strahnbrad Mystery") }, text = "Shara Blazen. You answered the question I couldn't leave alone. I've written what you found into the church book, under the date, so that it's kept somewhere." },
      },
      again = {
        { id = "hello_a1", text = "Ask. I've little else to do but watch the hills." },
        { id = "hello_a2", text = "Go on. The candles will last a while." },
        { id = "hello_a3", text = "Yes? Speak softly, the candles flicker at a loud voice." },
      },
      choices = {
        { text = "What have you seen at Strahnbrad?", next = "strahn" },
        { text = "Why keep an empty church?", next = "church" },
        { text = "What do you know of the Syndicate?", next = "syndicate" },
        { text = "Something's missing from your altar.", next = "altar", when = { class = "PRIEST" } },
        { text = "You wanted someone quiet. Why?", next = "quiet", when = { class = "ROGUE" } },
        { text = "What can you see from the bell loft?", next = "w3_loft" },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },
    strahn = {
      lines = { { id = "strahn_1", text = "Smoke by day and lanterns by night, at the north end, near the old town hall. Carts go in empty and don't come out. Twice I've seen them marching orcs in chains up the hill road. They aren't raiding from there, they've settled in to work." } },
      choices = {
        { text = "Digging in a dead town. For what?", next = "strahn2" },
        { text = "Gol'dir spoke of being made to dig there.", next = "strahn2", when = { heardLine = "goldir.h_default" } },
        { text = "Something else.", next = "BACK" },
      },
    },
    strahn2 = {
      lines = { { id = "strahn2_1", text = "That is what I can't let rest. Strahnbrad was a market town. It had no mine and no vault. But it was old, older than Alterac's kings, and men who've lost a kingdom will dig up anything that might buy it back. I'd know what they hope to find before they find it." } },
      choices = {
        { text = "Why does it fall to you to care?", next = "strahn3" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    strahn3 = {
      big = true,
      lines = { { id = "strahn3_1", text = "Because nobody else here is looking up. Darthalia watches Southshore, Lydon watches his vats. I watch the hills, and I've been told it's none of our concern what bandits do in a ruin. I think a thing dug up in secret is everyone's concern. Don't you?" } },
      choices = {
        { text = "I do. Secrets in the ground rarely stay harmless.", next = "BACK", reply = "Then you see it as I do, and I'm less alone in this loft.", fx = { align = { order = 1 }, affinity = 1 } },
        { text = "No. Let bandits waste their sweat.", next = "BACK", reply = "So Darthalia says. I hope you're both right. I don't believe you are.", fx = { align = { order = -1 } } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    church = {
      lines = { { id = "church_1", text = "Habit, and something past habit. I was baptised at that font. When I rose I came here first, expecting, I don't know what, to be struck down, or forgiven. Neither happened. The roof didn't fall, and so I took a broom to the floor." } },
      choices = {
        { text = "Do you still pray?", next = "church2" },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    church2 = {
      lines = { { id = "church2_1", text = "I say the words. Whether anything hears them, I couldn't tell you. The priests in the Undercity teach that the Light abandoned us and the Shadow is our portion. They may be right. But the Light never told me so itself, and I'd want to hear it from the source." } },
      choices = {
        { text = "Keep asking. Silence isn't an answer.", next = "BACK", reply = "That's what I've held to. It's thin, but it holds.", fx = { trait = { kind = 1 } } },
        { text = "The Shadow answers. The Light never did.", next = "BACK", reply = "Then perhaps I'm a fool with a broom. I'll sweep, all the same." },
        { text = "Something else.", next = "BACK" },
      },
    },
    syndicate = {
      lines = { { id = "syndicate_1", text = "The leavings of Alterac. Their lords betrayed the Alliance in the Second War and lost everything for it, and they've been thieving in these hills ever since, in orange masks. They hold Durnholde, and Strahnbrad, and the passes. They hate the living kingdoms more than they hate us." } },
      choices = {
        { text = "Enemies of our enemies, then.", next = "BACK", reply = "No. Only more enemies. They'd sell us to Stormwind for a pardon." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    altar = {
      lines = { { id = "altar_1", text = "The chalice, and the cloth. I took them down myself. It didn't seem right for my hands to set them out, as I am now. They're in the vestry, wrapped. If a true priest ever comes through, living or dead, who still believes in something, I'd give them over." } },
      choices = {
        { text = "Keep them wrapped. That day may come.", next = "BACK", reply = "I pray it does, if \"pray\" is still the word." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    quiet = {
      lines = { { id = "quiet_1", text = "Because the Syndicate post no proper sentries at Strahnbrad, only men who drink, and a careful person could walk the whole north end by night and count what's in those carts. A deathguard would clank. You wouldn't." } },
      choices = {
        { text = "I can be very careful.", next = "BACK", reply = "I thought so, when the door didn't creak. Go by the east ridge, where the wall's down." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    syndicate = { { id = "tp_syndicate", text = "Thieves with a lost crown. Men like that will dig up the dead if they think there's a sceptre under them." } },
    strahnbrad = { { id = "tp_strahnbrad", text = "A quiet town, once. I had an aunt there. I'd rather it were left quiet." } },
    forsaken = { { id = "tp_forsaken", text = "We're told we're beyond grace. I've not seen the writ." } },
    light = { { id = "tp_light", text = "I don't know what it thinks of me. I've decided to go on being civil to it." } },
    advice = { { id = "tp_advice", text = "Look up, now and then. Everyone in this valley watches the road, and nobody watches the hills." } },
    _none = { { id = "tp_none", text = "I don't know. It hasn't shown itself from the bell loft." } },
  },
}

---------------------------------------------------------------------------
-- Hans Zandin: a Tarren Mill townsman with a long memory and a list of Southshore names.
---------------------------------------------------------------------------
P:NPC {
  key = "hb_zandin", id = TODO_NPC("Hans Zandin"), name = "Hans Zandin",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  communities = { "tarren_mill" }, temper = { "bitter", "sardonic" }, values = { "vengeance", "memory" },
  notices = { "race", "class" },
  impression = {
    first = "Hans Zandin stands about Tarren Mill with his arms folded and an opinion on everything south of the river. He is bitter and dryly funny, and he keeps a count of old neighbours in Southshore who shut their doors when the plague came.",
    third = "{name} met Hans Zandin, a bitter Forsaken townsman of Tarren Mill.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "Well, if it isn't the hero again. You've done more good in Tarren Mill than the last ten combined, so I'll grant you a civil word." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "You again. Another hero, I'm sure. The inn's that way, and I'd thank you to go and stay there." },
    { id = "g_1", text = "Well, look at this. Another hero come to save Tarren Mill, I suppose, and you'll be wanting directions to the inn first." },
    { id = "g_2", when = { faction = "Horde" }, text = "You're with the Horde, so I'll be civil. Don't mistake it for cheer." },
    { id = "g_3", when = { metBefore = true }, text = "You again. Still alive, or still whatever you are. I'd lost a small wager with myself." },
  },

  notice = {
    { id = "n_1", cat = "race", when = { race = "Human" },
      text = "A human. In Tarren Mill. Either you're very lost or very brave, and I've not decided which I'd find funnier." },
    { id = "n_2", cat = "class", when = { class = "WARRIOR" },
      text = "That's a good big sword. Take it south. They've plenty of necks down in Southshore, and I can supply names." },
    { id = "n_3", cat = "race", when = { race = { "Orc", "Troll", "Tauren" } },
      text = "One of the breathing Horde. You look at us sideways. That's all right. We look at you sideways too, and we've fewer eyes to do it with." },
  },

  start = "hello",
  nodes = {
    w3_toll = {
      lines = {
        { id = "w3_toll_1", text = "The Durnholde guards, every one of them, riding down from the camps with their noses in the air and their purses shut. Blackmoore's men, they called themselves, as if that were a coin, and I let them through because I'd a family to think of." },
      },
      choices = {
        { text = "Blackmoore's men?", next = "w3_blackmoore" },
        { text = "Every road has its bullies.", next = "BACK", reply = "Aye, and every tollman learns to smile at them. I smiled for eleven years, and I've not smiled since, which I consider fair." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_blackmoore = {
      lines = {
        { id = "w3_blackmoore_1", text = "Aedelas Blackmoore, who ran the orc camps and drank himself stupid in that keep. One of his sergeants spat on my boots every week, and I hear the orcs he guarded came back with a Warchief and paid him out in full. I'd have liked to see that." },
      },
      choices = {
        { text = "So would I. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Hans Zandin. I kept the tollhouse on the Southshore road for eleven years and knew every carter in the foothills by his horse. Now I'm dead, the tollhouse is a pile of stones, and I stand here and keep accounts of a different sort." },
        { id = "hello_2", when = { metBefore = true }, text = "Zandin. Still standing here. It's a living, as we don't say." },
      },
      again = {
        { id = "hello_a1", text = "What else? I've the whole afternoon to be unpleasant in." },
        { id = "hello_a2", text = "Go on. I've no pressing engagements." },
        { id = "hello_a3", text = "Well? Out with it, or move along; the road's busier than you are." },
      },
      choices = {
        { text = "What sort of accounts?", next = "accounts" },
        { text = "You kept the tollhouse?", next = "toll" },
        { text = "Who's worth knowing in Tarren Mill?", next = "town" },
        { text = "Give me those names.", next = "names", when = { class = "WARRIOR" } },
        { text = "Why do the Forsaken look at us sideways?", next = "sideways", when = { race = { "Orc", "Troll", "Tauren" } } },
        { text = "Who never paid your toll?", next = "w3_toll" },
        { text = "I'll leave you to your grudges.", next = "END" },
      },
    },
    accounts = {
      lines = { { id = "accounts_1", text = "Who did what, when the plague came. Tarren Mill sickened first. We sent to Southshore for help, for a priest, for clean water. They put carts across the road and archers behind the carts. I know which men stood there. I'd waved them through my gate for a decade." } },
      choices = {
        { text = "They were afraid. Anyone would be.", next = "accounts2" },
        { text = "They left you to die.", next = "accounts2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    accounts2 = {
      big = true,
      lines = { { id = "accounts2_1", text = "Both are true, and that's what keeps me standing here. A frightened man who lets his neighbour die is still a man who let his neighbour die. I've nine names. Darthalia will reach Southshore one day, and I'll be asked who deserves what. What do I tell her?" } },
      choices = {
        { text = "Tell her nothing. Fear isn't a crime.", next = "BACK", reply = "Hm. My wife would have said the same. She's on the wrong side of the list to say it.", fx = { align = { light = 1 } } },
        { text = "Give her all nine. Debts should be paid.", next = "BACK", reply = "That's what the list is for. I only wanted to hear someone else say it first.", fx = { align = { light = -1 } } },
        { text = "Another matter.", next = "BACK" },
      },
    },
    toll = {
      lines = { { id = "toll_1", text = "Two coppers a cart, one for a rider, nothing for a man on foot, since the lord of the time thought walking was punishment enough. I'd a stove and a window and a dog. Best post in the foothills. I knew everybody's business by what they hauled." } },
      choices = {
        { text = "You must miss it.", next = "toll2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    toll2 = {
      lines = { { id = "toll2_1", text = "I miss the dog. Brindle bitch, called Penny, on account of the toll. She wouldn't come near me after I rose. Sat at the end of the lane and howled for two days, and then went south. I hope some Southshore brat is feeding her. That's the one kind wish I've got for the place." } },
      choices = {
        { text = "She remembers who you were.", next = "BACK", reply = "That's exactly the trouble with dogs." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    town = {
      lines = { { id = "town_1", key = true, text = "Shay keeps the inn and waters nothing, I'll say that for him. Craig Hewitt farms dead dirt and is the nearest thing to a happy man we have. Tara Coldgaze watches the south road and hasn't blinked since spring. And Shara Blazen sweeps a church. We're a lively crowd." } },
      choices = {
        { text = "And the apothecary?", next = "BACK", reply = "Lydon. I stay upwind of Lydon. That's my whole opinion." },
        { text = "Something else.", next = "BACK" },
      },
    },
    names = {
      lines = { { id = "names_1", text = "Eager, aren't you? No. Not yet. A list like mine's worth more held than spent. But I'll give you one for nothing: the man who built the barricade is a sergeant now, and he drinks at Anderson's inn most nights. Ask who was a carter's boy in Tarren Mill." } },
      choices = {
        { text = "I'll ask.", next = "BACK", reply = "Do. Tell him Zandin's still keeping the gate." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    sideways = {
      lines = { { id = "sideways_1", text = "Because you're warm, and you've got families, and you're going home someday. We're allies of convenience. Your Warchief needs a foothold in the east and our Lady needs someone to stand between her and the Alliance. Nobody's pretending it's love." } },
      choices = {
        { text = "Thrall honours his allies.", next = "sideways2" },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    sideways2 = {
      lines = { { id = "sideways2_1", text = "I daresay he does. He was a slave up the valley, at Durnholde, so he knows this country and what it does to people. I'll give him that. I trust him further than any king I was taxed by. It's the others behind him I count twice." } },
      choices = {
        { text = "Count us as you like. We'll hold the line.", next = "BACK", reply = "Hold it, then. I've been wrong about people before. Not often." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    southshore = { { id = "tp_southshore", text = "Nine names, and a dog. That's all I want out of it." } },
    forsaken = { { id = "tp_forsaken", text = "We're what's left when a kingdom throws something away. We've remarkable memories." } },
    tarren_mill = { { id = "tp_tarren_mill", text = "It was a mill, a church and a road. We've kept the church and the road." } },
    syndicate = { { id = "tp_syndicate", text = "They robbed my tollhouse twice when I was alive. I notice they don't trouble the dead for coppers." } },
    advice = { { id = "tp_advice", text = "Keep a list. People will tell you to forgive. People who say that have short lists." } },
    _none = { { id = "tp_none", text = "No idea. It's not on the list, so I don't care." } },
  },
}

---------------------------------------------------------------------------
-- Tara Coldgaze: watches the south road from Tarren Mill and has not looked away in months.
---------------------------------------------------------------------------
P:NPC {
  key = "hb_coldgaze", id = TODO_NPC("Tara Coldgaze"), name = "Tara Coldgaze",
  bible = "bibles/more_folk.md", role = "citizen", tier = "service",
  communities = { "tarren_mill" }, temper = { "still", "vigilant" }, values = { "vigilance", "duty" },
  notices = { "class", "race" },
  impression = {
    first = "Tara Coldgaze watches the road south from Tarren Mill, hour on hour, with a stillness that unsettles even other Forsaken. She was a huntress in life, and she can say what moved on the Southshore road at any hour of the past week.",
    third = "{name} met Tara Coldgaze, who keeps watch on the south road at Tarren Mill.",
  },

  greetings = {
    { id = "dp_svw", when = { metBefore = true, disposition = { min = 60 } }, text = "I saw you on the river road an hour ago and knew it was you by the way you walk. Stand on my left, as before." },
    { id = "dp_svc", when = { metBefore = true, disposition = { max = 34 } }, text = "I saw you at the river bend. Stay out of my line, and don't think I've stopped watching you." },
    { id = "g_1", text = "I saw you at the river bend a quarter hour ago, so you needn't introduce your arrival." },
    { id = "g_2", when = { class = "HUNTER" }, text = "A hunter. You checked the wind before you spoke to me. Good. Stand on my left, so you're not in the line." },
    { id = "g_3", when = { metBefore = true }, text = "You. You've changed your pack since last time. It rides better." },
  },

  notice = {
    { id = "n_1", cat = "class", when = { class = "HUNTER" },
      text = "Your pet was upwind of the deer trail, and so every deer in the valley knows you're here. I'm only telling you what they'd tell you." },
    { id = "n_2", cat = "race", when = { race = { "NightElf", "Human", "Dwarf", "Gnome" } },
      text = "You've come in under a truce flag or under a spell, and I'll find out which. I've not raised the alarm. Don't give me cause." },
  },

  start = "hello",
  nodes = {
    w3_trap = {
      lines = {
        { id = "w3_trap_1", text = "A bear pit on the ridge above the falls, dug over a fortnight and covered so well I fell in it myself the morning I came to check. The bear came along that evening, looked down at me, and walked round." },
      },
      choices = {
        { text = "How did you get out?", next = "w3_out" },
        { text = "Even a bear knows a trap.", next = "BACK", when = { class = "HUNTER" }, reply = "They know a person in a hole, which is what I was. Dig your pit, then stay out of it, is the lesson." },
        { text = "Something else.", next = "BACK" },
      },
    },
    w3_out = {
      lines = {
        { id = "w3_out_1", text = "Hans Zandin found me at dusk, on his way home from the toll, and threw me a rope and laughed until he wept. He's never told anyone, which is the only reason I'll still stand near him on the road." },
      },
      choices = {
        { text = "Your secret's safe. Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "hello_1", key = true, text = "Tara Coldgaze. I watch the south road. Nobody posted me. I trapped these hills for twenty years and I know what belongs on that road and what doesn't, so I stand here, and I tell the deathguards what's coming before they can see it." },
        { id = "hello_2", when = { metBefore = true }, text = "Coldgaze. Nothing on the road since noon but a cart and two crows. Say what you want." },
      },
      again = {
        { id = "hello_a1", text = "Speak. I can listen without looking round." },
        { id = "hello_a2", text = "Go on. Quietly; the wind's toward the road." },
        { id = "hello_a3", text = "Yes? Say it, and keep still while you do." },
      },
      choices = {
        { text = "What do you watch for?", next = "road" },
        { text = "How do you stand so still?", next = "still" },
        { text = "You trapped these hills when you were alive.", next = "before" },
        { text = "You'd have spooked those deer too, once.", next = "wind", when = { class = "HUNTER" } },
        { text = "Hans says you haven't blinked since spring.", next = "hans", when = { heardLine = "hb_zandin.town_1" } },
        { text = "What's the best trap you ever set?", next = "w3_trap" },
        { text = "I'll not block your view.", next = "END" },
      },
    },
    road = {
      lines = { { id = "road_1", text = "Dust, first. A patrol raises a low steady haze, and a raid raises it in bursts. Then birds. Crows go up for men on foot, and they stay down for riders. And at night, the frogs by the ford. When the frogs stop, something is crossing, and I wake Samsa." } },
      choices = {
        { text = "Has Southshore ever caught you off guard?", next = "road2" },
        { text = "You read the land like a page.", next = "road2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    road2 = {
      lines = { { id = "road2_1", text = "Once, in the spring. They came up the riverbed in the rain, when there's no dust and the frogs are loud. Six of ours were dead before I'd turned my head. Deathguard Humbert told me it was no fault of mine. I've not stepped off this spot for longer than an hour since." } },
      choices = {
        { text = "That's a heavy watch to set yourself.", next = "road3" },
        { text = "Another matter.", next = "BACK" },
      },
    },
    road3 = {
      big = true,
      lines = { { id = "road3_1", text = "It's the watch I owe. Six, in the rain. I don't tire and I don't sleep, so I've no excuse to look away. Humbert says a sentry who never rests makes mistakes. I say the dead can't afford a second one. Which of us would you post on this road?" } },
      choices = {
        { text = "You. Vigilance paid in full is no fault.", next = "BACK", reply = "Then I'll stay where I am.", fx = { align = { order = 1 } } },
        { text = "Him. Even the dead need to stand down.", next = "BACK", reply = "Hm. I'll walk to the inn tonight, for an hour, and see if the road's still there after.", fx = { align = { order = -1 }, affinity = 1 } },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    still = {
      lines = { { id = "still_1", text = "It's a trapper's trick. You pick a thing to look at, the far gatepost, and you let everything else go soft at the edges. Movement shows at the edges. Alive, I could hold it an hour before my legs shook. Now there's nothing in me that shakes." } },
      choices = {
        { text = "Death made you a better hunter.", next = "BACK", reply = "It made me a better post. I'm not sure it's the same thing." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
    before = {
      lines = { { id = "before_1", text = "Fox, marten, the odd bear for the bounty. I sold pelts in Southshore every month. I knew a furrier there, a decent woman, who gave me tea. I've wondered if she's on Hans Zandin's list. I've not asked him. I don't want to know which answer I'm hoping for." } },
      choices = {
        { text = "You'd spare her, if it came to it.", next = "before2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    before2 = {
      lines = { { id = "before2_1", text = "I'd not loose the arrow myself. That's as far as I've got. If she came up that road with a torch, I'd call it out like any other. It's a hard thing, to keep a watch against people who once gave you tea." } },
      choices = {
        { text = "It should be hard.", next = "BACK", reply = "Yes. The day it's easy, I'll have become something else." },
        { text = "Another matter.", next = "BACK" },
      },
    },
    wind = {
      lines = { { id = "wind_1", text = "Ha. Yes. My first winter, I lost a whole season's marten to a red scarf my mother knitted. Bright as a berry. I wore it anyway, since she'd made it. There's a lesson in that about love and hunting, and I've never worked out what it is." } },
      choices = {
        { text = "Wear the scarf. Hunt elsewhere.", next = "BACK", reply = "That's about what I did. I've still got it, somewhere. It's grey now." },
        { text = "Let me ask about something else.", next = "BACK" },
      },
    },
    hans = {
      lines = { { id = "hans_1", text = "Hans talks. I blink. I do it when nothing's moving, which is the right time for it. He stands thirty paces off with his arms folded and watches me watch. I think it comforts him, that somebody's doing it properly." } },
      choices = {
        { text = "He respects you, in his way.", next = "BACK", reply = "He'd choke before he said so. I've seen him bring my lamp oil, though, and say nothing." },
        { text = "Tell me about something else.", next = "BACK" },
      },
    },
  },
  topics = {
    southshore = { { id = "tp_southshore", text = "Four roads in, one ford, and a watch that changes at dusk. I know it better than the people who live there." } },
    forsaken = { { id = "tp_forsaken", text = "We don't sleep. Somebody ought to make use of that, so I do." } },
    tarren_mill = { { id = "tp_tarren_mill", text = "Nine buildings and a church. I can see every door from here, and I count them at dawn." } },
    advice = { { id = "tp_advice", text = "Watch the edges, and never the middle. Nothing that means you harm ever comes down the middle." } },
    syndicate = { { id = "tp_syndicate", text = "They use the hill tracks, and badly. I hear them a mile off. I don't count them a threat, only a noise." } },
    _none = { { id = "tp_none", text = "I haven't seen it on the road, so I can't speak to it." } },
  },
}

