-- Thunder Bluff folk the roster scan found unwritten: the Smokywood Pastures Copperpinches who sell at
-- Winter Veil, Cor and Gorm Grimtotem of Magatha's household on the Elder Rise, a Midsummer Merchant,
-- Rumstag Proudstrider the cloth quartermaster, and Senior Sergeant Taiga, the war effort recruiter.
local P = RPGDialogueAPI:Pack("rpgd.thunderbluff")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Seersa Copperpinch: Smokywood Pastures vendor (cheaper goods) at Winter Veil.
---------------------------------------------------------------------------
P:NPC {
  key = "tb_seersa_copperpinch", id = TODO_NPC("Seersa Copperpinch"), name = "Seersa Copperpinch", title = "Smokywood Pastures", gender = "female",
  role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "cheerful" }, values = { "profit" },
  impression = {
    first = "A goblin woman in a red cap trimmed with white fur stands beside a cart of sweets and wrapped parcels on the lower rise. She rings a little bell whenever a tauren walks past.",
    third = "{name} met Seersa Copperpinch, who sells Smokywood Pastures treats in Thunder Bluff at Winter Veil.",
  },
  greetings = {
    { id = "g_default", text = "Happy Winter Veil! Treats, trinkets and cheer, priced for every purse." },
    { id = "g_back", when = { metBefore = true }, text = "Back for more cheer? I knew you were a festive one." },
  },
  start = "hello",
  nodes = {
    ylife = {
      lines = { { id = "ylife_x", text = "Booty Bay, on the docks. My ma sold fish and my pa sold the fish my ma couldn't sell. I learned to shout prices before I learned to read. Smokywood hired me for my lungs, pal." } },
      choices = {
        { text = "Where does the snow on your cart come from?", next = "ysnow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yhard = {
      lines = { { id = "yhard_x", text = "The calves with no coin. They stand there with their big eyes, and I'm supposed to send 'em off. Company rules say no freebies. Should I follow the rules, or slip 'em a cookie?" } },
      choices = {
        { text = "Slip them a cookie. It's Winter Veil.", next = "BACK", reply = "Shh! Don't tell Whulwert. He'll want a cut of my kindness.", fx = { align = { order = -1 } } },
        { text = "Follow the rules. Business is business.", next = "BACK", reply = "Aw, you're no fun. You're right, though. Probably.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysnow = {
      lines = { { id = "ysnow_x", text = "The company ships in a little snow, with a frost mage from Ratchet. It melts by midday, but the calves go wild for it. Best marketing money can buy." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Seersa Copperpinch, Smokywood Pastures. I sell the small things, the cookies and the candy and the wrapping paper, and Whulwert beside me sells the big ones." },
        { id = "yh_troll", when = { race = "Troll" }, text = "Happy Winter Veil, mon! Ha, I been practising. A troll customer, finally! You lot love the candy canes. Seersa Copperpinch, Smokywood Pastures, at your service." },
      },
      again = { { id = "h_again_x", text = "Back for more cookies? I knew it." }, { id = "h_again", text = "Anything else? The bell is getting tired." } },
      choices = {
        { text = "Do tauren even keep Winter Veil?", next = "tauren" },
        { text = "Why split the cart with Whulwert?", next = "whulwert" },
        { text = "Where do the sweets come from?", next = "x_from" },
        { text = "I'm a goblin too.", next = "x_gb", when = { race = "Goblin" } },
        { text = "Do you sell to the Forsaken?", next = "x_fs", when = { race = "Scourge" } },
        { text = "How's business?", next = "x_biz" },
        { text = "Where did you grow up?", next = "ylife" },
        { text = "What's the hardest part of the job?", next = "yhard" },
        { text = "Let me see your treats.", next = "END" },
      },
    },
    tauren = {
      lines = { { id = "t_default", text = "They do now, or at least they buy the cookies. The elders say the long nights are for stories and gifts anyway, and Smokywood is happy to supply both." } },
      choices = {
        { text = "Every feast is a good feast.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "The tauren have their own customs.", next = "BACK", fx = { align = { order = 1 } } },
      },
    },
    whulwert = {
      lines = { { id = "w_default", text = "Because the company says rich and poor shouldn't have to queue together. I get the happier customers, and he gets the bigger tips, and we both pretend we don't mind." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_from = {
      lines = {
        { id = "xf1", text = "Smokywood Pastures bakes 'em somewhere I've never been and never asked about. They ship 'em to every city, and I sell 'em with a smile and a bell. That's my part of the deal." },
      },
      choices = {
        { text = "Do the tauren buy many?", next = "x_from2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_from2 = {
      lines = {
        { id = "xf2", text = "The calves do! Little ones come running every time I ring the bell, and their mothers pay for the cookies with a look like they're paying for a cow. Worth it, every copper." },
      },
      choices = {
        { text = "You like the calves.", next = "x_from3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_from3 = {
      lines = {
        { id = "xf3", text = "Don't tell anyone, pal, it's bad for business. But yeah, a kid with a cookie is the best sale there is, even if the margins are terrible." },
      },
      choices = {
        { text = "Your secret's safe. Something else.", next = "BACK" },
      },
    },
    x_gb = {
      lines = {
        { id = "xg1", text = "Then you know the score, sweetheart. Big holiday, small margins, lots of volume. Whulwert does the fancy stuff, and I do the cookies, and between us we cover every customer in the city." },
      },
      choices = {
        { text = "Smart. Something else.", next = "BACK" },
      },
    },
    x_fs = {
      lines = {
        { id = "xf2b", text = "Sure, if they pay! Can't say I've sold many cookies to the dead, though. One bought a gingerbread man and just stared at it for an hour. Creepy, but a sale's a sale." },
      },
      choices = {
        { text = "Very creepy. Something else.", next = "BACK" },
      },
    },
    x_biz = {
      lines = {
        { id = "xb1", text = "Booming, thanks to the calves. The tauren don't celebrate Winter Veil like the rest of us, but they like the snow and the bells, and that's good enough for me." },
      },
      choices = {
        { text = "Glad to hear it. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    booty_bay = { { id = "ytp_bb", text = "Booty Bay taught me everything. Shout loud, smile wide, count fast." } },
    whulwert = { { id = "ytp_whul", text = "Whulwert's my cousin. He thinks he's classy. He's not." } },
    goblins = { { id = "tp_gob", text = "Goblins sell to everyone, pal. Cookies don't care who eats 'em." } },
    _none = { { id = "tp_none", text = "Couldn't say, friend. Ask me about cookies." } },
  },
}

---------------------------------------------------------------------------
-- Whulwert Copperpinch: Smokywood Pastures vendor (dearer goods) at Winter Veil.
---------------------------------------------------------------------------
P:NPC {
  key = "tb_whulwert_copperpinch", id = TODO_NPC("Whulwert Copperpinch"), name = "Whulwert Copperpinch", title = "Smokywood Pastures", gender = "male",
  role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "smooth" }, values = { "profit" },
  impression = {
    first = "A goblin in a velvet coat stands behind a polished counter of fine holiday goods, every price tag turned so you have to ask.",
    third = "{name} met Whulwert Copperpinch, who sells Smokywood Pastures' finer goods in Thunder Bluff at Winter Veil.",
  },
  greetings = {
    { id = "g_default", text = "Ah, a discerning shopper. Welcome to the quality end of the cart." },
    { id = "g_back", when = { metBefore = true }, text = "You've returned. Quality always calls its customers back." },
  },
  start = "hello",
  nodes = {
    ylife = {
      lines = { { id = "ylife_x", text = "I started in Gadgetzan, selling silk to the Steamwheedle bosses. They taught me that a rich man pays for the feeling of paying, not the goods. That's the whole secret, pal. Don't tell anyone." } },
      choices = {
        { text = "What's your finest item?", next = "ybest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yventure = {
      lines = { { id = "yventure_x", text = "Worry? He's a foreman at a Venture camp in Stonetalon, and if the tauren ever find out, my business is done. He wants to visit for Winter Veil. Should I let him, or keep him away?" } },
      choices = {
        { text = "Keep him away. Your customers come first.", next = "BACK", reply = "Aye, business first. Sorry, cousin.", fx = { align = { honor = -1 } } },
        { text = "Let him come. Family is family.", next = "BACK", reply = "Hah. You've a soft heart, pal. I'll think on it.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ybest = {
      lines = { { id = "ybest_x", text = "The ornate gift boxes, gold leaf and velvet, made in Booty Bay by a cousin with very steady hands. I sold one to a Grimtotem once. He used it to keep a skull in. Customers, eh?" } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "Whulwert Copperpinch, Smokywood Pastures, purveyor of the finer things in festive life. Seersa sells the cookies, and I sell the gifts that people remember." },
        { id = "yh_tauren", when = { race = "Tauren" }, text = "Ah, a tauren of taste! Welcome to the quality end of the cart, friend. I've something in your size, extra room for the horns." },
      },
      again = { { id = "h_again_x", text = "Still browsing? Good, good. The prices aren't going anywhere." }, { id = "h_again", text = "Something more, or shall I wrap something for you?" } },
      choices = {
        { text = "Why are your prices hidden?", next = "prices" },
        { text = "Who buys fine goods in Thunder Bluff?", next = "buyers" },
        { text = "Is Seersa your wife?", next = "x_seersa" },
        { text = "You charge too much for holiday goods.", next = "x_st" },
        { text = "I'm a goblin. Don't try that on me.", next = "x_gb", when = { race = "Goblin" } },
        { text = "What would suit a tauren?", next = "x_ta", when = { race = "Tauren" } },
        { text = "How did you get into fine goods?", next = "ylife" },
        { text = "Does your Venture cousin worry you?", next = "yventure" },
        { text = "Show me your wares.", next = "END" },
      },
    },
    prices = {
      lines = { { id = "p_default", text = "A price you can see is a price you can argue with. A price you have to ask about is a conversation, and I'm very good at conversations." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    buyers = {
      lines = { { id = "b_default", text = "Hunters back from a good season, traders from the Barrens, and the occasional elder who wants to spoil a grandchild. Tauren pay slowly, but they never haggle, which is a miracle." } },
      choices = { { text = "Don't take advantage of that.", next = "BACK", reply = "Me? Never. Well, only a little, and only at holidays." } },
    },
    x_seersa = {
      lines = {
        { id = "xs1", text = "Cousin, pal, cousin! Copperpinch is a big family, and we've got cousins in every city from Booty Bay to Undercity. Seersa does the cookies, and I do the class." },
      },
      choices = {
        { text = "How many cousins?", next = "x_seersa2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_seersa2 = {
      lines = {
        { id = "xs2", text = "Last count, thirty-seven, and that's not counting the ones in the Venture Company. We don't talk about them at Winter Veil. Bad for the family image, and worse for business." },
      },
      choices = {
        { text = "Why not?", next = "x_seersa3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_seersa3 = {
      lines = {
        { id = "xs3", text = "Because Venture's tearing up Mulgore, and I'm selling to tauren. You think they'd buy my gift-wrap if they knew my cousin was cutting their trees? Keep it quiet, friend." },
      },
      choices = {
        { text = "I'll keep it quiet. Something else.", next = "BACK" },
      },
    },
    x_st = {
      lines = {
        { id = "xs4", text = "Too much? Friend, these are fine goods! Imported, handcrafted, festive. Value's what the customer thinks it is, and my customers think it's worth every copper." },
      },
      choices = {
        { text = "Fair price for fine goods. No complaint here.", next = "BACK", reply = "See? A customer with taste.", fx = { align = { light = -1 } } },
        { text = "Holidays should be for everyone, not just the rich.", next = "BACK", reply = "Sure, sure. Seersa's got the cookies for them.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_gb = {
      lines = {
        { id = "xg1", text = "Ha! A fellow professional. All right, all right, I'll be straight with ya. The markup's thirty percent, and I'm not changing it. Professional courtesy only goes so far." },
      },
      choices = {
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
    x_ta = {
      lines = {
        { id = "xt1", text = "The fancy dress, big size, extra room for the horns. Sold three to a Bloodhoof elder last year, and he wore them to council. Best advertising I ever had." },
      },
      choices = {
        { text = "I'll think about it. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    gadgetzan = { { id = "ytp_gz", text = "Gadgetzan taught me the finer points of selling. The sand taught me the rest." } },
    seersa = { { id = "ytp_seersa", text = "Seersa sells cookies. I sell dreams. We're both very happy." } },
    venture_company = { { id = "tp_vc", text = "Don't talk to me about Venture. They're family, and they're terrible." } },
    _none = { { id = "tp_none", text = "No idea, pal. Ask me about gift-wrap." } },
  },
}

---------------------------------------------------------------------------
-- Cor Grimtotem: one of Magatha's Grimtotem on the Elder Rise.
---------------------------------------------------------------------------
P:NPC {
  key = "tb_cor_grimtotem", id = TODO_NPC("Cor Grimtotem"), name = "Cor Grimtotem", gender = "male",
  role = "citizen", tier = "service",
  communities = { "thunder_bluff", "grimtotem" }, temper = { "cold" }, values = { "pride", "tradition" },
  impression = {
    first = "A tauren in Grimtotem paint stands on the Elder Rise with his arms folded, watching the Horde visitors cross the bridges as if counting them.",
    third = "{name} met Cor Grimtotem, one of Magatha's tribe on the Elder Rise.",
  },
  greetings = {
    { id = "g_default", text = "You walk on Grimtotem ground now, stranger. Walk softly." },
    { id = "g_back", when = { metBefore = true }, text = "You again. You have a way of wandering where you are not asked." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Cor, of the Grimtotem. Our elder Magatha sits among Cairne's council, and we live here because she wishes it, not because we love these crowds." },
        { id = "h_tauren", when = { race = "Tauren" }, text = "You are of the Bloodhoof's people, I think. Tell your chieftain that the Grimtotem remember who held these mesas before him." },
      },
      again = { { id = "h_again_x", text = "You are still here. Ask, then." }, { id = "h_again", text = "What more? Be brief." } },
      choices = {
        { text = "You don't like the Horde.", next = "horde" },
        { text = "Tell me about Magatha.", next = "magatha" },
        { text = "What do the Grimtotem want?", next = "x_want" },
        { text = "Why do you stay, if you dislike it here?", next = "x_stay" },
        { text = "I'm tauren. Do you hate me?", next = "x_ta", when = { race = "Tauren" } },
        { text = "I'm an orc. Do the Grimtotem hate us?", next = "x_orc", when = { race = "Orc" } },
        { text = "I'll walk softly.", next = "END" },
      },
    },
    horde = {
      lines = { { id = "hr_default", text = "The orcs came with axes and called it friendship, and Cairne gave them our trust in return. The Grimtotem would rather the tauren stood alone, as we did for ages before." } },
      choices = {
        { text = "The tauren are stronger with allies.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "A people should stand on its own hooves.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    magatha = {
      lines = { { id = "m_default", text = "She is the wisest of the elders, and the only one who sees what the Horde costs us. Speak of her with respect, or do not speak of her at all." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    x_want = {
      lines = {
        { id = "xw1", text = "For the tauren to be what they were before the Horde came. We walked our own lands and fought our own wars, and no orc or dead man told us how to live." },
      },
      choices = {
        { text = "And now?", next = "x_want2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_want2 = {
      lines = {
        { id = "xw2", text = "Now Cairne bends his knee to Thrall, and the city fills with Forsaken. Magatha says patience, so I am patient. But my patience is thinner than hers." },
      },
      choices = {
        { text = "Will the Grimtotem fight?", next = "x_want3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_want3 = {
      lines = {
        { id = "xw3", text = "The Grimtotem do not answer that question to strangers. Ask Magatha, if you are brave. She is kinder to visitors than I am, and much more dangerous." },
      },
      choices = {
        { text = "I'll be careful. Something else.", next = "BACK" },
      },
    },
    x_stay = {
      lines = {
        { id = "xs1", text = "Because Magatha wishes it. She sits at Cairne's council, and she wants her people near her. I go where she goes, and I do not need to like it." },
      },
      choices = {
        { text = "Loyal to her, then. Something else.", next = "BACK" },
      },
    },
    x_ta = {
      lines = {
        { id = "xt1", text = "No. You are tauren, and you have been fooled, like all of Cairne's children. Perhaps one day you will see clearly." },
      },
      choices = {
        { text = "Perhaps. Something else.", next = "BACK" },
      },
    },
    x_orc = {
      lines = {
        { id = "xo1", text = "Hate? No. We simply remember that the orcs drank demon blood before they found honour. We would rather not wait to see if it comes back." },
      },
      choices = {
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    grimtotem = { { id = "tp_grim", text = "The Grimtotem are the oldest of the tribes. We remember what the others forget." } },
    _none = { { id = "tp_none", text = "I do not know, and I would not tell you if I did." } },
  },
}

---------------------------------------------------------------------------
-- Gorm Grimtotem: another of Magatha's household on the Elder Rise.
---------------------------------------------------------------------------
P:NPC {
  key = "tb_gorm_grimtotem", id = TODO_NPC("Gorm Grimtotem"), name = "Gorm Grimtotem", gender = "male",
  role = "citizen", tier = "service",
  communities = { "thunder_bluff", "grimtotem" }, temper = { "brooding" }, values = { "pride" },
  impression = {
    first = "A heavy tauren with Grimtotem markings sits near the Elder Rise's lodges, sharpening a totem-headed club. He doesn't stop when you approach.",
    third = "{name} met Gorm Grimtotem, a brooding Grimtotem tauren on the Elder Rise.",
  },
  greetings = {
    { id = "g_default", text = "Hmph. Another wanderer. What do you want?" },
    { id = "g_back", when = { metBefore = true }, text = "You keep coming back. I have not decided if I mind." },
  },
  start = "hello",
  nodes = {
    ylife = {
      lines = { { id = "ylife_x", text = "In Stonetalon, among the high peaks, where the wind is so sharp it cuts the skin. My mother taught me to hunt and my father taught me to hate the Venture Company. Both lessons stayed." } },
      choices = {
        { text = "Why hate the goblins so much?", next = "yhate" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yhate = {
      lines = { { id = "yhate_x", text = "They tore down the trees my grandfather prayed beneath. The Bloodhoof traded with them anyway. Should a tribe make peace with those who wounded the land, or fight them always?" } },
      choices = {
        { text = "Fight them. The land must be defended.", next = "BACK", reply = "Hmph. You are not as soft as you look.", fx = { align = { honor = 1 } } },
        { text = "Trade. Peace serves the tribe better.", next = "BACK", reply = "That is Cairne's answer. It is not mine.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yleave = {
      lines = { { id = "yleave_x", text = "Magatha's word, and nothing else. If she tells me to go, I go. If she tells me to stay, I stay until the bluffs crumble. That is what loyalty means to the Grimtotem." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "I am Gorm. I guard Magatha's lodges, though no one in this city would dare trouble them. It gives my hands something to do while the council talks." },
        { id = "yh_orc", when = { race = "Orc" }, text = "An orc. Thrall's people. You eat at Cairne's fire and call it home. Hmph. Speak, then." },
      },
      again = { { id = "h_again_x", text = "Still here? Ask, then." }, { id = "h_again", text = "More questions? Ask, then." } },
      choices = {
        { text = "Why guard what nobody threatens?", next = "guard" },
        { text = "Where do the Grimtotem come from?", next = "tribe" },
        { text = "Tell me about Magatha.", next = "x_mag" },
        { text = "Who made that club?", next = "x_club" },
        { text = "I'm tauren. Would you speak with me?", next = "x_ta", when = { race = "Tauren" } },
        { text = "I'm a warrior. Is that club good?", next = "x_wa", when = { class = "WARRIOR" } },
        { text = "Where did you grow up?", next = "ylife" },
        { text = "What would make you leave this post?", next = "yleave" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    guard = {
      lines = { { id = "guard_default", text = "Nobody threatens them today. The Bloodhoof smile at us, but a smile is not the same as trust, and Magatha taught us to remember that." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    tribe = {
      lines = { { id = "t_default", text = "From the high places, Stonetalon and the Needles, where the earth is hard and so are we. Other tribes went soft under Cairne, and the Grimtotem did not." } },
      choices = {
        { text = "Hardness isn't the same as strength.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Hard places make hard people. I respect that.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    x_mag = {
      lines = {
        { id = "xm1", text = "She is our elder, and she is wise, and she is old. That is all you need to know of her, unless you mean to cross her, in which case you will learn the rest." },
      },
      choices = {
        { text = "Does she plot against Cairne?", next = "x_mag2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_mag2 = {
      lines = {
        { id = "xm2", text = "You ask dangerous questions in a dangerous place, little one. Magatha sits at Cairne's council, and she speaks as an elder speaks. What else she does is her own business." },
      },
      choices = {
        { text = "I'm only curious.", next = "x_mag3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_mag3 = {
      lines = {
        { id = "xm3", text = "Curious calves get eaten by wolves. Keep your curiosity for the plains, and let the elders keep their councils." },
      },
      choices = {
        { text = "I'll take that advice. Something else.", next = "BACK" },
      },
    },
    x_club = {
      lines = {
        { id = "xc1", text = "My father, from the root of a great tree in Stonetalon. It has broken more skulls than I can count, and each one is a story my grandchildren will hear." },
      },
      choices = {
        { text = "A proud club. Something else.", next = "BACK" },
      },
    },
    x_ta = {
      lines = {
        { id = "xt1", text = "I speak with any tauren, even Cairne's. But I do not trust them, and they do not trust me. That is honest, at least." },
      },
      choices = {
        { text = "Honest enough. Something else.", next = "BACK" },
      },
    },
    x_wa = {
      lines = {
        { id = "xw1", text = "It is the best. Heavy, balanced and old. You cannot buy one like it in Thunder Bluff. You would have to earn it in the Grimtotem way, and you would not like the way." },
      },
      choices = {
        { text = "I'll pass. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    stonetalon = { { id = "ytp_st", text = "Stonetalon is where the Grimtotem are strong. The goblins have scarred it." } },
    magatha = { { id = "ytp_mag", text = "Magatha is our elder. I guard her lodges, and I do not question her." } },
    grimtotem = { { id = "tp_grim", text = "We are the Grimtotem. We were here before Cairne's city, and we will be here after it." } },
    _none = { { id = "tp_none", text = "I don't know. Ask someone else." } },
  },
}

---------------------------------------------------------------------------
-- Midsummer Merchant: seasonal vendor for the Midsummer Fire Festival.
---------------------------------------------------------------------------
P:NPC {
  key = "tb_midsummer_merchant", id = TODO_NPC("Midsummer Merchant"), name = "Midsummer Merchant",
  role = "vendor", tier = "service",
  communities = { "thunder_bluff" }, temper = { "cheerful" }, values = { "festival" },
  impression = {
    first = "A merchant in festival colours tends a stall of garlands, sweets and fire-red ribbons near the bonfire. The heat of the flames makes everyone nearby squint and smile.",
    third = "{name} met a Midsummer Merchant at the Fire Festival.",
  },
  greetings = {
    { id = "g_default", text = "Happy Midsummer! Warm your hands, and buy something bright." },
  },
  start = "hello",
  nodes = {
    yafter = {
      lines = { { id = "yafter_x", text = "North, always, to Orgrimmar and then over the sea to the eastern kingdoms. I follow the summer until it runs out, and then I spend the winter in Ratchet counting my coins and wishing for warmth." } },
      choices = {
        { text = "What's the best part of the festival here?", next = "ybest" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywrong = {
      lines = { { id = "ywrong_x", text = "Once, when a young brave tried to steal a flame from the Alliance fires and brought the guards running back here. The elders scolded him, and the warriors cheered him. Should he have been punished, or praised?" } },
      choices = {
        { text = "Praised. Stealing their flames is the tradition.", next = "BACK", reply = "That's what the warriors said, loudly. The elders sighed.", fx = { align = { honor = -1 } } },
        { text = "Punished. He brought danger to the festival.", next = "BACK", reply = "The elders thought so too. He spent a week carrying water.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ybest = {
      lines = { { id = "ybest_x", text = "The tauren dances, every time. The drums start low and the whole bluff shakes. I forget to sell anything for an hour, and nobody minds." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "The longest day calls for the brightest fires, and the brightest fires call for garlands and treats. I follow the festival wherever the bonfires burn." },
        { id = "yh_scourge", when = { race = "Scourge" }, text = "Happy Midsummer! Oh, a Forsaken. Stand on this side of me, friend. The fire's hottest on the left." },
      },
      again = { { id = "h_again_x", text = "More questions by the fire? Ask away!" }, { id = "h_again", text = "Anything else? The fire's not going out." } },
      choices = {
        { text = "What is the Midsummer festival for?", next = "festival" },
        { text = "Who comes to the fires here?", next = "crowd" },
        { text = "How long have you followed the festival?", next = "x_long" },
        { text = "Fire is dangerous. Why celebrate it?", next = "x_st" },
        { text = "I'm tauren. Do we honour the sun?", next = "x_ta", when = { race = "Tauren" } },
        { text = "Do the Forsaken come to the fires?", next = "x_fs", when = { race = "Scourge" } },
        { text = "Where do you go after the festival?", next = "yafter" },
        { text = "Has the festival ever gone wrong?", next = "ywrong" },
        { text = "Show me your wares.", next = "END" },
      },
    },
    festival = {
      lines = { { id = "f_default", text = "It honours the sun at its strongest, and the fire that keeps us through the dark half of the year. Every people has a reason, and all of them end in dancing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    crowd = {
      lines = { { id = "c_default", text = "Tauren families, orc soldiers off duty, and trolls who will dance until the fire's out. The tauren say the flame is a gift of An'she, the sun, and they thank it with songs." } },
      choices = { { text = "A fine custom.", next = "BACK" } },
    },
    x_long = {
      lines = {
        { id = "xl1", text = "Many summers, friend, more than I care to count. I start in the south, by the great bonfires of the Barrens, and walk north with the sun. Thunder Bluff is always a highlight." },
      },
      choices = {
        { text = "Why Thunder Bluff?", next = "x_long2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_long2 = {
      lines = {
        { id = "xl2", text = "Because the tauren honour An'she, the sun, and they sing to the fire in a way no one else does. When the drums start on the bluff, even I stop selling for a moment." },
      },
      choices = {
        { text = "What songs do they sing?", next = "x_long3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_long3 = {
      lines = {
        { id = "xl3", text = "Songs of the long day and the short night, of the herds and the harvest. I don't know the words, but the tune stays with me all year." },
      },
      choices = {
        { text = "A lovely tradition. Something else.", next = "BACK" },
      },
    },
    x_st = {
      lines = {
        { id = "xs1", text = "Dangerous? Only if you're careless with it, friend. The fire keeps away the cold and the dark, and on the longest day we thank it for that. Do you see it differently?" },
      },
      choices = {
        { text = "Fire is a gift. It's worth honouring.", next = "BACK", reply = "Spoken like a true festival-goer!", fx = { align = { light = 1 } } },
        { text = "Fire is a weapon. I use it, I don't worship it.", next = "BACK", reply = "Well, at least you'll keep it lit.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_ta = {
      lines = {
        { id = "xt1", text = "You do! An'she is the sun, and the Earth Mother's eye, or so your elders tell me. At Midsummer, you honour her the most. Go to the bonfire and sing." },
      },
      choices = {
        { text = "I'll go. Something else.", next = "BACK" },
      },
    },
    x_fs = {
      lines = {
        { id = "xf1", text = "Some do, and they keep well back from the flames. I don't blame them. One told me fire is the only thing he still fears, and then he bought a garland anyway." },
      },
      choices = {
        { text = "Fair enough. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    anshe = { { id = "ytp_anshe", text = "An'she is the sun, the Earth Mother's eye. At Midsummer, she watches longest." } },
    ratchet = { { id = "ytp_ratchet", text = "I winter in Ratchet. It's warm, and the goblins don't ask questions." } },
    earth_mother = { { id = "tp_em", text = "The tauren say the sun is the Earth Mother's eye. On the longest day, she watches the longest." } },
    _none = { { id = "tp_none", text = "No idea, friend. Ask me about the fires." } },
  },
}

---------------------------------------------------------------------------
-- Rumstag Proudstrider: Horde cloth quartermaster, takes cloth donations.
---------------------------------------------------------------------------
P:NPC {
  key = "tb_rumstag_proudstrider", id = TODO_NPC("Rumstag Proudstrider"), name = "Rumstag Proudstrider", title = "Horde Cloth Quartermaster", gender = "male",
  role = "questgiver", tier = "service",
  communities = { "thunder_bluff" }, temper = { "steady" }, values = { "duty", "community" },
  impression = {
    first = "In the armourers' lodge on the middle rise, a tauren sits behind stacks of folded wool and silk, tallying each bundle on a strip of hide.",
    third = "{name} met Rumstag Proudstrider, who gathers cloth for the Horde in Thunder Bluff.",
  },
  greetings = {
    { id = "g_default", text = "Welcome, friend. Have you brought cloth for the Horde's need?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, and with full packs, I hope." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Rumstag Proudstrider. I gather cloth for the Horde, wool and silk and mageweave and runecloth, and Thunder Bluff remembers every bundle given." },
        { id = "h_q", when = { questActive = TODO_QUEST("A Donation of Wool") }, text = "Wool! Set it here, friend, and the tribe will know your name." },
      },
      again = { { id = "h_again_x", text = "More questions? Ask, and I'll count while I listen." }, { id = "h_again", text = "Anything else? I have counting to do." } },
      choices = {
        { text = "What does the Horde do with the cloth?", next = "use" },
        { text = "Why should I give it away?", next = "why" },
        { text = "How do you track every bundle?", next = "x_track" },
        { text = "Who else donates?", next = "x_who" },
        { text = "I'm a tailor. What's needed most?", next = "x_tl", when = { profession = "Tailoring" } },
        { text = "I'm tauren. Do we give much?", next = "x_ta", when = { race = "Tauren" } },
        { text = "Let's talk donations.", next = "END" },
      },
    },
    use = {
      lines = { { id = "u_default", text = "Bandages for the wounded, cloaks for the braves on the plains, blankets for the young ones when winter comes down off the mesas. Nothing given here is wasted." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "Because the Horde is a family, and a family shares what it has. The tribe honours those who give, and that honour opens doors that gold cannot." } },
      choices = {
        { text = "Giving freely is its own reward.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "I give for the standing it buys.", next = "BACK", fx = { align = { light = -1 } } },
      },
    },
    x_track = {
      lines = {
        { id = "xt1", text = "On strips of hide, with knots for each bundle and colours for each kind. My grandmother taught me, and she tallied kodo herds the same way. I never lose count." },
      },
      choices = {
        { text = "Have you ever lost one?", next = "x_track2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_track2 = {
      lines = {
        { id = "xt2", text = "Once, a bundle of silk that a careless brave dropped off the bridge. It landed in a pond by the lake, and I made him fish it out himself." },
      },
      choices = {
        { text = "Did he?", next = "x_track3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_track3 = {
      lines = {
        { id = "xt3", text = "He did, and now he guards the cloth for me. The Earth Mother teaches lessons in strange ways, and that brave learned his well." },
      },
      choices = {
        { text = "A good lesson. Something else.", next = "BACK" },
      },
    },
    x_who = {
      lines = {
        { id = "xw1", text = "Orcs, trolls, Forsaken and tauren. Every one of them gives cloth for the Horde, and each city remembers them. Thunder Bluff is proud to give its share." },
      },
      choices = {
        { text = "Good. Something else.", next = "BACK" },
      },
    },
    x_tl = {
      lines = {
        { id = "xtl", text = "Runecloth, most of all, for bandages and tents. The Horde's soldiers bleed in many places, and good cloth saves lives." },
      },
      choices = {
        { text = "I'll bring some. Something else.", next = "BACK" },
      },
    },
    x_ta = {
      lines = {
        { id = "xta", text = "We do, though we are slow to start, as is our way. Once a tauren begins, they do not stop until the work is done. Keep giving, and the bluff will remember." },
      },
      choices = {
        { text = "I will. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    cairne = { { id = "tp_cairne", text = "Cairne asks every tauren to give what they can. I only keep the count." } },
    _none = { { id = "tp_none", text = "I do not know. Ask me about cloth." } },
  },
}

---------------------------------------------------------------------------
-- Senior Sergeant Taiga: war effort recruiter on the lower rise.
---------------------------------------------------------------------------
P:NPC {
  key = "tb_senior_sergeant_taiga", id = TODO_NPC("Senior Sergeant Taiga"), name = "Senior Sergeant Taiga", title = "War Effort Recruiter", gender = "female",
  role = "soldier", tier = "quest",
  communities = { "thunder_bluff" }, temper = { "brisk" }, values = { "duty" },
  notices = { "level" },
  impression = {
    first = "A tauren sergeant in battered mail stands on the lower rise beside a banner reading 'The Horde Needs You', calling out to every passing brave.",
    third = "{name} met Senior Sergeant Taiga, who recruits for the war effort in Thunder Bluff.",
  },
  greetings = {
    { id = "g_default", text = "You there! The Horde needs strong arms and full wagons. Will you answer?" },
    { id = "g_back", when = { metBefore = true }, text = "Back again, soldier. Ready to do your part?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "Senior Sergeant Taiga. The Horde is gathering supplies for a great war in the south, and every city must give. Thunder Bluff will not be the one found wanting." },
        { id = "h_q", when = { questActive = TODO_QUEST("The Horde Needs Your Help!") }, text = "You've taken the call! Good, now get to Orgrimmar and see the war effort with your own eyes." },
      },
      again = { { id = "h_again_x", text = "More questions, brave? Quickly, then." }, { id = "h_again", text = "What else, soldier? Time is short." } },
      choices = {
        { text = "What war in the south?", next = "war" },
        { text = "What does the war effort need?", next = "supplies" },
        { text = "I'm too green for any war.", next = "green", when = { maxLevel = 30 } },
        { text = "How long have you served?", next = "x_serve" },
        { text = "I'm tauren. What can I give?", next = "x_ta", when = { race = "Tauren" } },
        { text = "I'm a warrior. Put me to work.", next = "x_wa", when = { class = "WARRIOR" } },
        { text = "Not today, sergeant.", next = "END" },
      },
    },
    war = {
      lines = { { id = "w_default", text = "Beyond Silithus, behind the old walls, something has woken that the night elves sealed away long ago. The Warchief and the Alliance both march against it, for once on the same road." } },
      choices = {
        { text = "Fighting beside the Alliance?", next = "alliance" },
        { text = "Something else.", next = "BACK" },
      },
    },
    alliance = {
      lines = { { id = "a_default", text = "Not beside, exactly. Ahead of them, if we can manage it, and the Horde should be the first through those gates." } },
      choices = {
        { text = "A common enemy makes a common cause.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "Let the Alliance bleed first.", next = "BACK", fx = { align = { honor = -1 } } },
      },
    },
    supplies = {
      lines = { { id = "s_default", text = "Copper and tin, herbs and leather, bandages and food. A soldier is only as strong as the wagon behind them, and our wagons must be full." } },
      choices = {
        { text = "Where do the wagons go?", next = "wagons" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wagons = {
      lines = { { id = "wg_default", text = "To Orgrimmar first, where the war effort counts every crate, and then south to Silithus. Every city's pile is measured against the others, so Thunder Bluff's honour rides on those wagons too." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    green = {
      lines = { { id = "green_default", text = "Nobody is too green to carry a bundle of linen. The war needs hands before it needs heroes, and every bundle counts." } },
      choices = { { text = "Then I'll carry what I can.", next = "BACK", fx = { affinity = 1 } } },
    },
    x_serve = {
      lines = {
        { id = "xs1", text = "Since the tribes joined the Horde. I fought the centaur under Cairne, and the quilboar in the Barrens, and now I gather supplies for a war I may not live to see." },
      },
      choices = {
        { text = "What war is it?", next = "x_serve2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_serve2 = {
      lines = {
        { id = "xs2", text = "A war in the south, against something old and buried, they say. I am not told much, only that the Horde must be ready, and so must the Alliance." },
      },
      choices = {
        { text = "Does that frighten you?", next = "x_serve3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_serve3 = {
      lines = {
        { id = "xs3", text = "Fright is for calves. I am a sergeant. I gather the supplies, I send the wagons, and I trust the Earth Mother with the rest." },
      },
      choices = {
        { text = "Brave words. Something else.", next = "BACK" },
      },
    },
    x_ta = {
      lines = {
        { id = "xt1", text = "Your strength, your cloth, your herbs, and your patience. The war effort needs all four, and tauren have them in plenty." },
      },
      choices = {
        { text = "I'll give them. Something else.", next = "BACK" },
      },
    },
    x_wa = {
      lines = {
        { id = "xw1", text = "Then gather copper bars and linen bandages, and bring them to me. A warrior who fights well and brings supplies is worth two who only fight." },
      },
      choices = {
        { text = "I'll gather them. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    cairne = { { id = "tp_cairne", text = "Cairne leads us well. He sends the Horde what it needs, and the Horde remembers." } },
    _none = { { id = "tp_none", text = "I do not know, brave. Ask the elders." } },
  },
}

---------------------------------------------------------------------------
-- Bluffwatcher: the city guard of Thunder Bluff. Light entry; World guard pool covers the rest.
---------------------------------------------------------------------------
P:NPC {
  key = "tb_bluffwatcher", id = 3084, name = "Bluffwatcher", gender = "male",
  role = "guard", tier = "service",
  communities = { "thunder_bluff" }, temper = { "calm" }, values = { "duty", "tradition" },
  impression = {
    first = "A tauren Bluffwatcher stands at ease near the edge of the mesa, halberd planted, watching the plains below as if counting every blade of grass.",
    third = "{name} spoke with a Bluffwatcher of Thunder Bluff.",
  },
  greetings = { { id = "g_default", text = "Peace be on your path, traveller. The bluffs are high; walk carefully near the edges." } },
  start = "hello",
  nodes = {
    yfear = {
      lines = { { id = "yfear_x", text = "Not the centaur, nor the Venture Company. I fear the enemy who is already on the bluffs, smiling at the High Chieftain's fire. A watcher looks outward, and danger often walks behind him." } },
      choices = {
        { text = "You mean the Grimtotem?", next = "ygrim" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ygrim = {
      lines = { { id = "ygrim_x", text = "I named no one, traveller. But Magatha's people come and go at strange hours, and I see it. Should I tell the High Chieftain, or trust his judgement and say nothing?" } },
      choices = {
        { text = "Tell him. A watcher's duty is to report.", next = "BACK", reply = "Then I will, at the next council, and he may laugh at me if he wishes.", fx = { align = { order = 1 } } },
        { text = "Say nothing yet. Watch until you're sure.", next = "BACK", reply = "Patience. Yes. A Bluffwatcher has plenty of that.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yteacher = {
      lines = { { id = "yteacher_x", text = "My grandfather, who watched for the Bloodhoof when the tribe still wandered. He told me the wind brings every secret eventually, if you stand still long enough to hear it. I am still standing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "We watch the bridges and the lifts, and we watch the plains for the Grimtotem and the Venture Company. Cairne Bloodhoof asks for vigilance, and we give it gladly." },
        { id = "yh_orc", when = { race = "Orc" }, text = "Lok'tar, friend of Thrall. We watch the bridges and the lifts, and the plains below for the Grimtotem and the Venture Company. Walk carefully near the edges." },
      },
      again = { { id = "h_again_x", text = "Anything more, traveller?" }, { id = "h_again", text = "Is there more you need?" } },
      choices = {
        { text = "Do you trust the Grimtotem on the bluffs?", next = "grim" },
        { text = "Where can I find the elevators?", next = "lift" },
        { text = "How does one become a Bluffwatcher?", next = "x_bec" },
        { text = "What do you see on the plains?", next = "x_see" },
        { text = "I'm tauren. Should I join you?", next = "x_ta", when = { race = "Tauren" } },
        { text = "I'm a stranger. Where should I go?", next = "x_str", when = { faction = "Horde" } },
        { text = "What do you fear most, watching?", next = "yfear" },
        { text = "Who taught you to watch?", next = "yteacher" },
        { text = "Walk with the Earthmother.", next = "END" },
      },
    },
    grim = {
      lines = { { id = "g_default2", text = "High Chieftain Cairne welcomes them, and I honour his word. But I keep my eyes open when they cross the bridges, as any watcher would." } },
      choices = {
        { text = "Cairne's word should be enough for you.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Trust your own eyes before any chieftain's word.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    lift = {
      lines = { { id = "l_default", text = "The lifts rise from the plains on the north and south sides of the main bluff. Hold on, and do not lean out to look down." } },
      choices = { { text = "Thank you. Something else.", next = "BACK" } },
    },
    x_bec = {
      lines = {
        { id = "xb1", text = "By serving the tribes, and by proving your patience. A Bluffwatcher must stand for hours and see everything, and many young braves find that harder than any battle." },
      },
      choices = {
        { text = "Is it a lonely post?", next = "x_bec2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_bec2 = {
      lines = {
        { id = "xb2", text = "Lonely, sometimes, but the wind keeps us company, and the plains are never truly empty. I see kodo and plainstriders and the smoke of Bloodhoof Village." },
      },
      choices = {
        { text = "Do you ever miss the hunt?", next = "x_bec3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_bec3 = {
      lines = {
        { id = "xb3", text = "Every day. But a Bluffwatcher's hunt is a long one, and the prey is danger itself. When I see it before it arrives, I count that a kill." },
      },
      choices = {
        { text = "A fine way to see it. Something else.", next = "BACK" },
      },
    },
    x_see = {
      lines = {
        { id = "xs1", text = "Today, kodo by the river, and a dust trail in the north that might be Venture Company. I will send word if it comes closer." },
      },
      choices = {
        { text = "Good. Something else.", next = "BACK" },
      },
    },
    x_ta = {
      lines = {
        { id = "xt1", text = "Only if you can stand still. Most young tauren cannot. Speak to the Bluffwatchers at the lifts if you mean it, and be ready to wait." },
      },
      choices = {
        { text = "I'll think about it. Something else.", next = "BACK" },
      },
    },
    x_str = {
      lines = {
        { id = "xs2", text = "The bank and the wind rider master are on the central rise, and the trainers keep to the Hunter, Spirit and Elder Rises. Ask any Bluffwatcher if you are lost." },
      },
      choices = {
        { text = "Thank you. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    lifts = { { id = "ytp_lifts", text = "The lifts carry you up from the plains. Hold on tightly, and do not look down." } },
    venture_company = { { id = "ytp_vc", text = "The Venture Company cuts at Mulgore's edges. We watch their dust trails." } },
    cairne = { { id = "tp_cairne", text = "Cairne Bloodhoof is our High Chieftain. We watch so that he may lead." } },
    _none = { { id = "tp_none", text = "I do not know, traveller. Ask at the lodges." } }, _none = { { id = "tp_none", text = "I cannot say. The elders on Elder Rise may know." } } },
}

---------------------------------------------------------------------------
-- Honor Guard: Cairne's ceremonial guard in Thunder Bluff. Light entry.
---------------------------------------------------------------------------
P:NPC {
  key = "tb_honor_guard", id = 3083, name = "Honor Guard", gender = "male",
  role = "guard", tier = "service",
  communities = { "thunder_bluff" }, temper = { "stern" }, values = { "honor", "duty" },
  impression = {
    first = "An Honor Guard of the Bloodhoof stands rigid beside the great lodge, painted in the colours of the chieftain, and does not blink when you approach.",
    third = "{name} spoke with an Honor Guard of Thunder Bluff.",
  },
  greetings = { { id = "g_default", text = "You stand before the guard of the High Chieftain. Speak with respect." } },
  start = "hello",
  nodes = {
    yfamily = {
      lines = { { id = "yfamily_x", text = "A mate on the Hunter Rise, and a son who wishes to be a guard as I am. I tell him to be a hunter instead. An Honor Guard gives his life away, and I would have my son keep his." } },
      choices = {
        { text = "Should he follow you, if he wishes it?", next = "yson" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yson = {
      lines = { { id = "yson_x", text = "He asks me every season. Should a father forbid the path he chose himself, or let his son walk it?" } },
      choices = {
        { text = "Let him walk it. It's his choice to make.", next = "BACK", reply = "Then I will. The Earth Mother will watch over him, as she watched over me.", fx = { align = { order = -1 } } },
        { text = "Forbid it. A father's word should guide him.", next = "BACK", reply = "Perhaps. But he is stubborn, as I was. We shall see.", fx = { align = { order = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ycairne = {
      lines = { { id = "ycairne_x", text = "Gentle. He laughs at the calves' games and tells old stories to anyone who sits by his fire. He grieves for those we lost to the centaur. He hides it well, but we see it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hello = {
      lines = {
        { id = "h_default", text = "We are sworn to Cairne Bloodhoof and to his house. Where he sits, we stand, and where he walks, we walk a step behind." },
        { id = "yh_troll", when = { race = "Troll" }, text = "A troll of the Darkspear. You stand before the guard of the High Chieftain. Speak with respect, and keep your voice low." },
      },
      again = { { id = "h_again_x", text = "Ask, traveller. Speak respectfully." }, { id = "h_again", text = "What more do you ask?" } },
      choices = {
        { text = "What does it mean to be an Honor Guard?", next = "honor" },
        { text = "Where is the High Chieftain?", next = "cairne" },
        { text = "How did you earn your place?", next = "x_earn" },
        { text = "Have you ever had to fight here?", next = "x_fight" },
        { text = "I'm tauren. Could I be a guard?", next = "x_ta", when = { race = "Tauren" } },
        { text = "I'm an orc. Cairne honours Thrall.", next = "x_orc", when = { race = "Orc" } },
        { text = "Do you have family?", next = "yfamily" },
        { text = "What is Cairne like, away from the council?", next = "ycairne" },
        { text = "I'll go in peace.", next = "END" },
      },
    },
    honor = {
      lines = { { id = "o_default", text = "It means our lives are not our own. We gave them to the chieftain freely, because he gave the tauren a home when we had only the road and the centaur at our backs." } },
      choices = {
        { text = "A life given in service is well spent.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "No one should give away their whole life.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    cairne = {
      lines = { { id = "c_default", text = "The High Chieftain holds council in his lodge on the main bluff. If he will see you, he will see you there." } },
      choices = { { text = "Thank you. Something else.", next = "BACK" } },
    },
    x_earn = {
      lines = {
        { id = "xe1", text = "By serving the Bloodhoof tribe for many years, and by standing beside Cairne in the war against the centaur. He chose me himself, and I have never doubted his choice." },
      },
      choices = {
        { text = "What was the war like?", next = "x_earn2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_earn2 = {
      lines = {
        { id = "xe2", text = "Long and bitter. The centaur drove us from our grazing grounds again and again, until Thrall's Horde came and stood with us. Then Cairne led us home to Mulgore." },
      },
      choices = {
        { text = "And you have stood here since?", next = "x_earn3" },
        { text = "Something else.", next = "BACK" },
      },
    },
    x_earn3 = {
      lines = {
        { id = "xe3", text = "Since the first lodge was raised on the bluff. I watched this city grow from a few tents to what you see now, and I will watch it until the Earth Mother calls me home." },
      },
      choices = {
        { text = "A long watch. Something else.", next = "BACK" },
      },
    },
    x_fight = {
      lines = {
        { id = "xf1", text = "Once, when a Grimtotem brave forgot himself in council. He did not forget again. Most days, our presence is enough." },
      },
      choices = {
        { text = "I see. Something else.", next = "BACK" },
      },
    },
    x_ta = {
      lines = {
        { id = "xt1", text = "Only if you would give your life to the Bloodhoof. Serve the tribe, prove your honour, and perhaps one day Cairne will see you." },
      },
      choices = {
        { text = "I'll try. Something else.", next = "BACK" },
      },
    },
    x_orc = {
      lines = {
        { id = "xo1", text = "He does, and so do we. Thrall saved our people from the centaur, and the Bloodhoof do not forget a debt. You are welcome here, warrior." },
      },
      choices = {
        { text = "Thank you. Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    bloodhoof = { { id = "ytp_bh", text = "The Bloodhoof tribe is Cairne's. We guard it with our lives." } },
    centaur = { { id = "ytp_cent", text = "The centaur drove us from our lands for years. We remember." } },
    cairne = { { id = "tp_cairne", text = "Cairne Bloodhoof is our chieftain and our father. We would die for him without a moment's doubt." } },
    _none = { { id = "tp_none", text = "I do not know, traveller. Ask the elders." } }, _none = { { id = "tp_none", text = "That is not mine to answer." } } },
}
