-- Ashenvale folk with no conversation until now: Bolyun and Harlown Darkweave of Bolyun's Camp,
-- Lilyn Darkriver at the Shrine of Aessina, Gapp Jinglepocket (Smokywood Pastures, Winter Veil),
-- Loruk Foreststrider of Splintertree Post, Sargath (a Highborne freed from a soul gem at Maestra's Post)
-- and Shandrina (trade goods at Silverwind Refuge).
local P = RPGDialogueAPI:Pack("rpgd.ashenvale")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Bolyun
---------------------------------------------------------------------------
P:NPC {
  key = "ash_bolyun", id = TODO_NPC("Bolyun"), name = "Bolyun",
  role = "questgiver", tier = "quest",
  communities = { "ashenvale_road" }, temper = { "wary", "gruff" }, values = { "privacy", "nature" },
  impression = {
    first = "He keeps a hidden camp in the mountains and doesn't like being found.",
    third = "{name} met Bolyun, who keeps a hidden camp in the hills southwest of the Shrine of Aessina.",
  },
  greetings = {
    { id = "g_default", text = "How did you find this place? No, don't tell me. Just keep your voice down." },
    { id = "g_back", when = { metBefore = true }, text = "You again. I suppose you can find the path now whether I like it or not." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I'm Bolyun. This camp is mine, and Harlown's, and we chose it because nobody walks this way. Most of the folk who do want something from us." },
        { id = "h_druid", when = { class = "DRUID" }, text = "A druid, at least. You'll know how to walk softly in the woods, which is more than I can say for most visitors." },
      },
      again = {
        { id = "h_again", text = "What else? Be quick about it." },
        { id = "h_again2", text = "Still here? Then ask." },
      },
      choices = {
        { text = "Why hide up here in the mountains?", next = "hide" },
        { text = "Who is Harlown?", next = "harlown" },
        { text = "The Shrine of Aessina is close by.", next = "shrine" },
        { text = "Is there anything I could do for you?", next = "favor" },
        { text = "I walk softly. You've nothing to fear from me.", next = "druid", when = { class = "DRUID" } },
        { text = "Goodbye, Bolyun.", next = "END" },
      },
    },
    hide = {
      lines = { { id = "hi_default", text = "Because Ashenvale is a war now, with orcs in the south and satyrs in the east, and Astranaar full of Sentinels who want every elf holding a bow. I've no wish to hold one for anyone." } },
      choices = {
        { text = "The forest needs everyone to defend it.", next = "hide2", fx = { align = { order = 1 } } },
        { text = "A man has the right to keep to himself.", next = "hide2", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hide2 = {
      lines = { { id = "h2_default", text = "Say what you like. I've done my share of fighting over the years, and I've buried enough friends to know what it's worth." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    harlown = {
      lines = { { id = "ha_default", text = "Harlown Darkweave, my partner. He works leather better than anyone in Astranaar and sells it to nobody he doesn't trust." } },
      choices = {
        { text = "How do I earn his trust?", next = "favor" },
        { text = "Something else.", next = "BACK" },
      },
    },
    favor = {
      lines = { { id = "fa_default", text = "Do something for us, and we'll know you're no Sentinel spy or Horde scout. There's always something that needs doing out here, and never enough hands to do it." } },
      choices = {
        { text = "Name it, and I'll see it done.", next = "favor2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    favor2 = {
      lines = { { id = "f2_default", text = "Come back when you've a strong arm and a quiet tongue, and I'll tell you. Prove yourself, and Harlown will open his packs for you." } },
      choices = { { text = "I'll be back.", next = "BACK", fx = { affinity = 1 } } },
    },
    druid = {
      lines = { { id = "dr_default", text = "Fear? No. But the Circle has asked me to come down to Astranaar more than once, and I've said no each time. Tell them I'm well, if they ask." } },
      choices = { { text = "I'll tell them. Something else.", next = "BACK" } },
    },
    shrine = {
      lines = { { id = "sh_default", text = "Aessina's Shrine, aye. The druids there are fine neighbors, because they mind their own business, and so do the wisps." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Harlown Darkweave
---------------------------------------------------------------------------
P:NPC {
  key = "ash_harlown", id = TODO_NPC("Harlown Darkweave"), name = "Harlown Darkweave",
  role = "vendor", tier = "service",
  communities = { "ashenvale_road" }, temper = { "quiet", "proud" }, values = { "craft", "privacy" },
  notices = { "craft" },
  impression = {
    first = "A leatherworker who sells only to those Bolyun vouches for.",
    third = "{name} met Harlown Darkweave, the leatherworker who keeps camp with Bolyun in the hills of Ashenvale.",
  },
  greetings = {
    { id = "g_default", text = "If Bolyun let you up the path, you can stay. Don't touch the hides." },
  },
  notice = {
    { id = "n_lw", cat = "craft", when = { profession = "Leatherworking" }, text = "A leatherworker. Then you'll know good hides when you see them, and you'll know to keep your hands off mine." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Harlown Darkweave. I work leather and I sell what I don't need, but only to friends of the camp. Bolyun decides who those are." },
      },
      again = {
        { id = "h_again", text = "Something else?" },
        { id = "h_again2", text = "Speak your mind." },
      },
      choices = {
        { text = "Why only sell to friends?", next = "friends" },
        { text = "Where do you get your hides?", next = "hides" },
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "Farewell, Harlown.", next = "END" },
      },
    },
    friends = {
      lines = { { id = "fr_default", text = "Because strangers talk, and soon half of Ashenvale would be climbing up here. I'd rather sell less and keep the quiet." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    hides = {
      lines = { { id = "hi_default", text = "From the beasts of these hills, taken cleanly and never more than we need. The forest gives, and we don't take advantage of it." } },
      choices = {
        { text = "That's the right way to hunt.", next = "BACK", reply = "It is. Tell that to the Warsong lumber camps.", fx = { align = { light = 1 } } },
        { text = "The forest has plenty. Take what you can sell.", next = "BACK", reply = "Spoken like someone who has never seen it run out.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
}

---------------------------------------------------------------------------
-- Lilyn Darkriver
---------------------------------------------------------------------------
P:NPC {
  key = "ash_lilyn", id = TODO_NPC("Lilyn Darkriver"), name = "Lilyn Darkriver",
  role = "citizen", tier = "service",
  communities = { "ashenvale_road" }, temper = { "serene", "thoughtful" }, values = { "nature", "faith" },
  impression = {
    first = "She sits by the Shrine of Aessina as though waiting for someone.",
    third = "{name} met Lilyn Darkriver, who keeps vigil at the Shrine of Aessina in Ashenvale.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. Walk gently here; this is Aessina's place." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Lilyn Darkriver. I come to the Shrine of Aessina to listen to the forest, which is harder than it sounds with axes ringing to the south." },
      },
      again = {
        { id = "h_again", text = "Was there something else?" },
        { id = "h_again2", text = "Speak, if you wish. The wisps don't mind." },
      },
      choices = {
        { text = "Who is Aessina?", next = "aessina" },
        { text = "What does the forest tell you?", next = "listen" },
        { text = "Farewell, Lilyn.", next = "END" },
      },
    },
    aessina = {
      lines = { { id = "ae_default", text = "The Mother of the Wild, a demigod of the forest who fought beside us in the War of the Ancients. They say the wisps here are her children, and they still guard her shrine." } },
      choices = {
        { text = "Do you believe that?", next = "aessina2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    aessina2 = {
      lines = { { id = "a2_default", text = "I believe the wisps are here, and that they're gentle with those who come in peace. The rest I leave to the druids." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    listen = {
      lines = { { id = "li_default", text = "That it is tired and frightened. The Warsong cut more every season, and the satyrs at Felfire Hill poison what the orcs don't fell." } },
      choices = {
        { text = "Then the Horde must be driven out by force.", next = "BACK", reply = "Perhaps. I only hope the forest survives the driving.", fx = { align = { honor = 1 } } },
        { text = "Fighting only makes the forest bleed more.", next = "BACK", reply = "You understand, then. Not many do.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
}

---------------------------------------------------------------------------
-- Gapp Jinglepocket (Smokywood Pastures)
---------------------------------------------------------------------------
P:NPC {
  key = "ash_gapp", id = TODO_NPC("Gapp Jinglepocket"), name = "Gapp Jinglepocket",
  role = "vendor", tier = "service", race = "Goblin",
  communities = { "silverwind_refuge" }, temper = { "cheerful", "pushy" }, values = { "profit" },
  impression = {
    first = "A goblin selling Winter Veil treats to Sentinels, with a grin that never stops.",
    third = "{name} met Gapp Jinglepocket, the Smokywood Pastures merchant at Silverwing Grove.",
  },
  greetings = {
    { id = "g_default", text = "Happy Winter Veil, pal! Smokywood Pastures, finest treats in Kalimdor, and the only ones this side of the Barrens!" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Gapp Jinglepocket, Smokywood Pastures' man in Ashenvale. Gingerbread, eggnog, candy canes, you name it, I've got it, and at a price that's practically charity." },
      },
      again = {
        { id = "h_again", text = "What else, pal? Time's money and the season's short." },
        { id = "h_again2", text = "Still lookin'? Good, good." },
      },
      choices = {
        { text = "A goblin selling to Sentinels? Isn't that risky?", next = "risky" },
        { text = "What's Winter Veil about, anyway?", next = "veil" },
        { text = "Let's see the treats.", next = "BUSINESS" },
        { text = "Happy Winter Veil, Gapp.", next = "END" },
      },
    },
    risky = {
      lines = { { id = "ri_default", text = "Risky? Pal, these elves love gingerbread as much as anybody. Gold's gold, and Smokywood Pastures doesn't care whose pocket it comes from." } },
      choices = {
        { text = "Selling to both sides is just good business.", next = "BACK", reply = "Now you're talkin'! You'd make a fine goblin.", fx = { align = { honor = -1 } } },
        { text = "A merchant should pick a side and stick to it.", next = "BACK", reply = "Sure, sure. The side with the most gold.", fx = { align = { honor = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    veil = {
      lines = { { id = "ve_default", text = "Greatfather Winter brings gifts, folks drink too much eggnog, and Smokywood Pastures sells the eggnog. The rest is details." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Loruk Foreststrider (Splintertree Post)
---------------------------------------------------------------------------
P:NPC {
  key = "ash_loruk", id = TODO_NPC("Loruk Foreststrider"), name = "Loruk Foreststrider",
  role = "citizen", tier = "service", race = "Tauren",
  communities = { "splintertree" }, temper = { "calm", "troubled" }, values = { "nature", "honor" },
  impression = {
    first = "A tauren at an orc lumber camp, uneasy about the trees.",
    third = "{name} met Loruk Foreststrider, a tauren at Splintertree Post in Ashenvale.",
  },
  greetings = {
    { id = "g_default", text = "Peace, traveler. The Earth Mother sees you, even here among the stumps." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Loruk Foreststrider of Thunder Bluff. I came to Splintertree to stand with the Horde, but my heart is heavy every time I hear an axe bite into these old trees." },
      },
      again = {
        { id = "h_again", text = "What more would you ask?" },
        { id = "h_again2", text = "Speak, friend. I am listening." },
      },
      choices = {
        { text = "Why stand with the orcs if it troubles you?", next = "why" },
        { text = "The night elves say this forest is theirs.", next = "elves" },
        { text = "Farewell, Loruk.", next = "END" },
      },
    },
    why = {
      lines = { { id = "wh_default", text = "Because Thrall gave my people a place among the Horde when the centaur would have driven us from Mulgore. A debt like that is not paid in a season." } },
      choices = {
        { text = "A debt of honor must be paid.", next = "BACK", reply = "Yes. Even when it costs more than gold.", fx = { align = { honor = 1 } } },
        { text = "No debt is worth a forest.", next = "BACK", reply = "Perhaps you are right. I ask the Earth Mother that each night.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    elves = {
      lines = { { id = "el_default", text = "They may be right. Orgrimmar needs wood, and the Barrens have none, but the kaldorei guard these trees like their own children. There must be some better way." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Sargath (freed Highborne spirit)
---------------------------------------------------------------------------
P:NPC {
  key = "ash_sargath", id = TODO_NPC("Sargath"), name = "Sargath",
  role = "citizen", tier = "service",
  communities = { "maestras_post" }, temper = { "haunted", "bitter" }, values = { "freedom" },
  impression = {
    first = "A Highborne spirit, newly freed from a soul gem after ten thousand years.",
    third = "{name} met Sargath, a Highborne spirit freed from a soul gem near Maestra's Post.",
  },
  greetings = {
    { id = "g_default", text = "Free. After all this time, I am free. Is that you I have to thank?" },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Sargath, once of the Highborne. When the world broke apart, a sorcerer named Athrikus Narassin came to us and promised to protect us from harm. Instead, he sealed us inside a gem." },
      },
      again = {
        { id = "h_again", text = "What else would you hear from a ghost?" },
        { id = "h_again2", text = "Ask. I have had a very long time to think." },
      },
      choices = {
        { text = "Why did Athrikus trap you?", next = "athrikus" },
        { text = "What was it like inside the gem?", next = "gem" },
        { text = "Rest now, Sargath.", next = "END" },
      },
    },
    athrikus = {
      lines = { { id = "at_default", text = "For our power, I think, or for his masters in the Shadow Council. He fed on what we were, and we could do nothing but watch." } },
      choices = {
        { text = "The Highborne brought this upon themselves.", next = "BACK", reply = "Perhaps we did. Many of us. But not all, and not I.", fx = { align = { light = -1 } } },
        { text = "No one deserves such a fate.", next = "BACK", reply = "You are kind. Kinder than my own kind ever were.", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    gem = {
      lines = { { id = "ge_default", text = "Dark, and very quiet. I could feel the others beside me, fading one by one. I do not think I will stay in this world long." } },
      choices = { { text = "I'm sorry. Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Shandrina (Silverwind Refuge)
---------------------------------------------------------------------------
P:NPC {
  key = "ash_shandrina", id = TODO_NPC("Shandrina"), name = "Shandrina",
  role = "vendor", tier = "service",
  communities = { "silverwind_refuge" }, temper = { "brisk", "practical" }, values = { "craft", "duty" },
  notices = { "craft" },
  impression = {
    first = "She keeps the refuge's crafters stocked with thread, salt and flux.",
    third = "{name} met Shandrina, who sells trade goods at Silverwind Refuge in Ashenvale.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah. Need thread? Salt? Flux? I've a little of everything and a lot of nothing." },
  },
  notice = {
    { id = "n_craft", cat = "craft", when = { profession = { "Tailoring", "Cooking", "Blacksmithing" } }, text = "A crafter! Good. You'll want supplies, and I've just had a shipment up from Astranaar." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Shandrina. I keep Silverwind Refuge in trade goods, which mostly means hauling crates from Astranaar and hoping the Warsong don't take them on the way." },
      },
      again = {
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "Yes? I've crates to count." },
      },
      choices = {
        { text = "Do the Warsong raid your shipments?", next = "raids" },
        { text = "What's life like at the refuge?", next = "refuge" },
        { text = "Show me your goods.", next = "BUSINESS" },
        { text = "Farewell, Shandrina.", next = "END" },
      },
    },
    raids = {
      lines = { { id = "ra_default", text = "Not yet, but their scouts come closer each week. The Sentinels say they're slowing the orcs' advance, and I hope they're right, because I'm a merchant, not a warrior." } },
      choices = {
        { text = "The Sentinels will hold them.", next = "BACK", reply = "From your lips to Elune's ears.", fx = { align = { order = 1 } } },
        { text = "Don't count on soldiers. Keep a bow handy.", next = "BACK", reply = "I have one under the counter, don't worry.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    refuge = {
      lines = { { id = "re_default", text = "Quiet, for now. The druids tend the wounded, the Sentinels watch the road, and I make sure nobody runs out of thread." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
}

---------------------------------------------------------------------------
-- Elder Riversong: a kaldorei elder honoured at the Lunar Festival.
---------------------------------------------------------------------------
P:NPC {
  key = "ash_elder_riversong", id = 15605, name = "Elder Riversong", gender = "female",
  role = "questgiver", tier = "quest",
  temper = { "calm" }, values = { "tradition", "memory" },
  notices = { "race", "faction" },
  impression = {
    first = "An ancient night elf sits among the ferns of Astranaar, her hair silver as moonlight on water. She hums a melody that seems older than the trees.",
    third = "{name} paid respects to Elder Riversong of the Lunar Festival.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, traveller. The festival has drawn you to an old elf's resting place, and you are welcome here." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "Another Lunar Festival, and another year turned. The ancestors smile on those who seek out their elders." },
    { id = "g_back", when = { metBefore = true }, text = "Elune brings you back to me. Sit, and listen to the water with me a while." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "I am Riversong, and I have heard the waters of Ashenvale for longer than your kingdoms have had names. In this season the people honour their elders, and I am content to be honoured." },
        { id = "h_q", when = { questActive = TODO_QUEST("Riversong the Elder") }, text = "You have come to honour the elders, and so you have honoured me. Take this coin of ancestry, and remember those who came before you." },
        { id = "h_horde", when = { faction = "Horde" }, text = "You come from the Horde, and yet you come in peace during the festival. Ashenvale does not see that often, so I will not waste it." },
      },
      again = {
        { id = "h_again", text = "What else would you hear, young one?" },
        { id = "h_again2", text = "The river is patient, and so am I. Ask." },
      },
      choices = {
        { text = "What does the festival mean to the kaldorei?", next = "festival" },
        { text = "Why are you called Riversong?", next = "name" },
        { text = "You must have seen a great deal.", next = "seen" },
        { text = "The Horde takes this forest's trees. Does that grieve you?", next = "trees", when = { faction = "Horde" } },
        { text = "Elune-adore, Elder.", next = "END" },
      },
    },
    festival = {
      lines = { { id = "f_default", text = "We remember the night Omen was driven into Elune's waters at Moonglade, and we remember our ancestors who fought in the old wars. The druids keep the festival now, and they keep it well." } },
      choices = {
        { text = "Did you fight in those wars?", next = "wars" },
        { text = "Something else.", next = "BACK" },
      },
    },
    wars = {
      lines = { { id = "w_default", text = "I was young when the Legion first came, and I carried water for the Sentinels rather than a blade. I remember the Well's fall, though, and I remember the silence that came after it." } },
      choices = {
        { text = "The Highborne deserved what came to them.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Not every Highborne chose that folly.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    name = {
      lines = { { id = "n_default", text = "My mother named me for the sound the Falfarren makes in spring. I have lived beside rivers all my life, and they have never given me a reason to leave." } },
      choices = { { text = "A gentle name for a gentle life.", next = "BACK" } },
    },
    seen = {
      lines = { { id = "s_default", text = "Ten thousand years of seasons, and they blur together more than you might hope. What remains is a few faces and a few songs, and those I would not trade for anything." } },
      choices = {
        { text = "Sing me one of them.", next = "song" },
        { text = "Something else.", next = "BACK" },
      },
    },
    song = {
      lines = { { id = "sg_default", text = "Riversong hums a few bars, low and sweet, and the ferns seem to lean in to listen. That one was my mother's, and I have sung it every festival since she went to Elune." } },
      choices = { { text = "Thank you, Elder.", next = "BACK", fx = { affinity = 1 } } },
    },
    trees = {
      lines = { { id = "t_default", text = "It grieves me more than you can know, but I have learned that grief does not plant saplings. Take what you must, young one, and leave the old groves standing." } },
      choices = { { text = "I'll remember that.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "That is not a song I know. Ask the druids of Moonglade, for they know far more than an old elf by a river." } } },
}

---------------------------------------------------------------------------
-- Raynewood Retreat: Keeper Ordanus and the guardians of his grove.
---------------------------------------------------------------------------
P:NPC {
  key = "ash_keeper_ordanus", id = 4273, name = "Keeper Ordanus", gender = "male",
  role = "keeper", tier = "service",
  communities = { "cenarion" }, temper = { "stern" }, values = { "nature", "duty" },
  notices = { "race", "class", "faction" },
  impression = {
    first = "A keeper of the grove, half elf and half stag, stands at the top of Raynewood Retreat. Vines curl about his antlers, and his eyes are full of old patience and new anger.",
    third = "{name} stood before Keeper Ordanus, a son of Cenarius, at Raynewood Retreat.",
  },
  greetings = {
    { id = "g_default", text = "You stand in the Raynewood, mortal, among the children of Cenarius. Speak gently here." },
    { id = "g_druid", when = { class = "DRUID" }, text = "A druid climbs to my grove, and the Dream stirs to welcome you. Be at ease." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Ordanus, keeper of this grove and son of Cenarius. I guard Raynewood against those who would burn it, and of late there are a great many of those." } },
      again = { { id = "h_again", text = "What else would you ask of a keeper?" } },
      choices = {
        { text = "Who threatens Raynewood?", next = "threat" },
        { text = "You are a son of Cenarius?", next = "cenarius" },
        { text = "I'll not disturb your grove.", next = "END" },
      },
    },
    threat = {
      lines = { { id = "t_default", text = "The orcs of Splintertree and the Warsong camps cut ever closer with their axes and their goblin machines. Worse, I hear the Horde has put a price on my own head, as though a keeper were a wolf in a pasture." } },
      choices = {
        { text = "The Horde will regret it.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Perhaps you could make terms with them.", next = "terms" },
        { text = "Something else.", next = "BACK" },
      },
    },
    terms = {
      lines = { { id = "tr_default", text = "Terms were made, once, and the orcs broke them when Grom Hellscream slew my father. The forest remembers that blood, even if the young chieftains would rather it did not." } },
      choices = {
        { text = "Then there can be no peace.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Thrall's Horde isn't Hellscream's.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    cenarius = {
      lines = { { id = "c_default", text = "I am, as are all the keepers of the grove. My father fell here in Ashenvale, and his sons have watched over these woods ever since, though we are fewer than we were." } },
      choices = { { text = "I'm sorry for your loss.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "That is a matter for others. The Raynewood is mine to guard, and I will not leave it." } } },
}

P:NPC {
  key = "ash_cenarion_protector", id = 3797, name = "Cenarion Protector", gender = "male",
  role = "guard", tier = "service",
  communities = { "cenarion" }, temper = { "stern" }, values = { "nature", "duty" },
  notices = { "class", "race" },
  impression = {
    first = "A night elf druid in leaves and bark stands guard at the foot of Raynewood Retreat, his staff planted firmly in the moss.",
    third = "{name} spoke with a Cenarion Protector guarding Keeper Ordanus.",
  },
  greetings = {
    { id = "g_default", text = "Halt and be known. Keeper Ordanus rests above, and no one climbs to him without our leave." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "We protect the keeper and his grove, alongside the laughing sisters and the faerie dragons. The Horde has grown bold in these woods, and so we have grown watchful." } },
      again = { { id = "h_again", text = "Is there something more?" } },
      choices = {
        { text = "Laughing sisters and faerie dragons?", next = "sisters" },
        { text = "How bold has the Horde grown?", next = "horde" },
        { text = "I'll go in peace.", next = "END" },
      },
    },
    sisters = {
      lines = { { id = "s_default", text = "Dryads and blink dragons, spirits of the wild who love Ordanus as we do. They seem playful, but they will drive off any axe-wielder who climbs too far." } },
      choices = { { text = "I'll keep my axe sheathed, then.", next = "BACK" } },
    },
    horde = {
      lines = { { id = "h2_default", text = "Bold enough to cut within sight of the Retreat, and bold enough to send killers after the keeper himself. We drove off three of them this moon alone." } },
      choices = {
        { text = "The Horde should be driven from Ashenvale.", next = "drive" },
        { text = "Something else.", next = "BACK" },
      },
    },
    drive = {
      lines = { { id = "d_default", text = "The Sentinels would agree with you, and Astranaar would welcome your blade. We are druids, though, and we would rather the forest healed than burned again." } },
      choices = {
        { text = "Healing is wiser than war.", next = "BACK", fx = { align = { order = -1 } } },
        { text = "Some wounds need a blade first.", next = "BACK", fx = { align = { order = 1 } } },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Ask at Astranaar. We keep to the grove." } } },
}

P:NPC {
  key = "ash_cenarion_vindicator", id = 3833, name = "Cenarion Vindicator", gender = "male",
  role = "guard", tier = "service",
  communities = { "cenarion" }, temper = { "stern" }, values = { "nature", "duty" },
  notices = { "class", "faction" },
  impression = {
    first = "A young keeper of the grove stands at the top of Raynewood Retreat, hooves planted and antlers lowered, guarding Ordanus with the stillness of an old oak.",
    third = "{name} met one of the Cenarion Vindicators guarding Keeper Ordanus.",
  },
  greetings = {
    { id = "g_default", text = "You have climbed far, little one. Speak your purpose before the keeper's guardians lose their patience." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am one of Ordanus's vindicators, and I stand at his side until the forest is safe again. That may be a very long time, and I do not mind." } },
      again = { { id = "h_again", text = "What more do you seek?" } },
      choices = {
        { text = "Are you also a son of Cenarius?", next = "son" },
        { text = "What do you vindicate?", next = "vindicate" },
        { text = "I'll leave you to your watch.", next = "END" },
      },
    },
    son = {
      lines = { { id = "s_default", text = "All the keepers are kin, in one way or another, and Ordanus is an elder brother to me. I have sworn to him as he swore to our father." } },
      choices = {
        { text = "What happened to your father?", next = "father" },
        { text = "Something else.", next = "BACK" },
      },
    },
    father = {
      lines = { { id = "f_default", text = "Cenarius fell in Ashenvale to an orc's axe, when the orcs still carried the demons' blood in them. The forest has not forgotten, and neither have I." } },
      choices = {
        { text = "Hellscream paid for it with his life.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "Those orcs were enslaved to demons.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    vindicate = {
      lines = { { id = "v_default", text = "The forest's right to live, and the keeper's right to keep it. We are not soldiers, but those who harm this grove learn quickly that we fight like them." } },
      choices = { { text = "I understand.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I know only the grove. Ask the Sentinels for the rest." } } },
}

---------------------------------------------------------------------------
-- Horde folk: a Forsaken herbalist at Bathran's Haunt and a Splintertree raider in Torek's band.
---------------------------------------------------------------------------
P:NPC {
  key = "ash_forsaken_herbalist", id = 3733, name = "Forsaken Herbalist", gender = "male",
  role = "worker", tier = "service",
  communities = { "undercity" }, temper = { "cold" }, values = { "knowledge" },
  notices = { "race", "faction" },
  impression = {
    first = "A Forsaken in a stained apron kneels among the ruins of Bathran's Haunt, pinching leaves into a satchel with bony fingers. The smell of rot and crushed herbs hangs about him.",
    third = "{name} met a Forsaken herbalist working at Bathran's Haunt.",
  },
  greetings = {
    { id = "g_default", text = "Step carefully. That patch is mine, and it has taken weeks to find anything worth picking in this wretched forest." },
    { id = "g_undead", when = { race = "Scourge" }, text = "Ah, one of our own. You'll forgive me if I don't get up; my knees are older than my grudges." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I gather for the Apothecarium, which means I spend my nights crawling through elven ruins in search of weeds. The Dark Lady's work is rarely dignified." } },
      again = { { id = "h_again", text = "Anything else? The light is fading, and I work better without it." } },
      choices = {
        { text = "What does the Apothecarium want with these herbs?", next = "herbs" },
        { text = "Isn't this ruin dangerous?", next = "ruin" },
        { text = "I'll leave you to it.", next = "END" },
      },
    },
    herbs = {
      lines = { { id = "hb_default", text = "Remedies, poisons and the odd experiment, depending on the apothecary's mood. Ashenvale grows things the Tirisfal soil forgot how to grow, and Undercity is very hungry for them." } },
      choices = {
        { text = "Poisons for the Scourge, I hope.", next = "poison" },
        { text = "Something else.", next = "BACK" },
      },
    },
    poison = {
      lines = { { id = "p_default", text = "For the Scourge, certainly, and for whoever else Varimathras points at. You'll find the apothecaries are not picky about their customers." } },
      choices = {
        { text = "Whatever weakens our enemies is welcome.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "That sounds like dangerous work to trust.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
    ruin = {
      lines = { { id = "r_default", text = "The night elves come by now and then to kill us, and the ghosts here mutter in the dark. Neither bothers me much, since I have already been killed once and found it overrated." } },
      choices = { { text = "That's one way to look at it.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I don't know and I don't care. Ask someone with a heartbeat." } } },
}

P:NPC {
  key = "ash_splintertree_raider", id = 12859, name = "Splintertree Raider", gender = "male",
  role = "soldier", tier = "service",
  communities = { "orgrimmar" }, temper = { "fierce" }, values = { "honor", "strength" },
  notices = { "race", "class" },
  impression = {
    first = "An orc raider in Splintertree colours hefts his axe and stamps his feet, waiting for Torek's signal to march on the Silverwing Outpost.",
    third = "{name} spoke with a Splintertree raider in Torek's war band.",
  },
  greetings = {
    { id = "g_default", text = "You march with us, {class}? Good, for Torek wants every axe he can get when we hit the elves." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = {
        { id = "h_default", text = "We ride with Torek against the Silverwing Outpost. The elves have killed too many of our woodcutters, and today we answer them." },
        { id = "h_orc", when = { race = "Orc" }, text = "A brother of the blood! Stand with me today, and we'll show the Silverwing how orcs fight." },
      },
      again = { { id = "h_again", text = "What is it? Speak quickly, the march is soon." } },
      choices = {
        { text = "Who is Torek?", next = "torek" },
        { text = "Why attack the outpost?", next = "why" },
        { text = "Lok'tar. I'll be ready.", next = "END" },
      },
    },
    torek = {
      lines = { { id = "t_default", text = "Torek leads the raids out of Splintertree Post, and he is the best of us. He fought at Mount Hyjal, and he does not waste warriors." } },
      choices = { { text = "Then I'll follow him.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "The Silverwing Sentinels hunt our peons in the woods and leave them for the crows. We need this wood to build Orgrimmar, and we will not be frightened off it." } },
      choices = {
        { text = "Then we strike hard.", next = "strike" },
        { text = "Something else.", next = "BACK" },
      },
    },
    strike = {
      lines = { { id = "s_default", text = "Hard and fast, before the elves can call their beasts. Some say we should leave the forest to them, but I have buried too many friends to hear that." } },
      choices = {
        { text = "The Horde takes what it needs.", next = "BACK", fx = { align = { order = 1 } } },
        { text = "There must be another way.", next = "BACK", fx = { align = { order = -1 } } },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Ask Torek. I only swing the axe." } } },
}

---------------------------------------------------------------------------
-- Warsong Runner: messenger of the Warsong clan in northern Ashenvale.
---------------------------------------------------------------------------
P:NPC {
  key = "ash_warsong_runner", id = 12863, name = "Warsong Runner", gender = "male",
  role = "guard", tier = "service",
  communities = { "warsong" }, temper = { "restless" }, values = { "duty", "speed" },
  impression = {
    first = "A lean orc in light leathers, legs crusted in mud to the knee, shifts from foot to foot as though stopping is a kind of pain.",
    third = "{name} met a Warsong runner carrying word through Ashenvale.",
  },
  greetings = { { id = "g_default", text = "Make it fast, friend. I've orders to carry, and the elves shoot at anything that stands still." } },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I run messages between the Warsong camps and the outposts. Lumber counts, sentinel sightings, who's dead and who's late. Mostly who's dead." } },
      again = { { id = "h_again", text = "More? I'm already late." } },
      choices = {
        { text = "What news from the front?", next = "news" },
        { text = "Why do the Warsong fight for this forest?", next = "why" },
        { text = "Run on, then.", next = "END" },
      },
    },
    news = {
      lines = { { id = "n_default", text = "The Silverwing Sentinels hit another lumber team at dawn. They come out of the trees silent as owls, and they're gone before you can raise an axe." } },
      choices = { { text = "Stay alive out there.", next = "BACK" } },
    },
    why = {
      lines = { { id = "w_default", text = "Orgrimmar needs timber, and the Barrens has none. Grom's clan was the first to come here, and we won't be driven off what he bled for." } },
      choices = {
        { text = "The Horde must take what it needs.", next = "BACK", fx = { align = { light = -1, honor = 1 } } },
        { text = "This war over trees will cost us too much.", next = "BACK", fx = { align = { light = 1, honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Ask at Splintertree. I just carry the words." } } },
}

---------------------------------------------------------------------------
-- Warsong Scout: watcher of the Warsong clan near the gulch in northern Ashenvale.
---------------------------------------------------------------------------
P:NPC {
  key = "ash_warsong_scout", id = 12862, name = "Warsong Scout", gender = "male",
  role = "guard", tier = "service",
  communities = { "warsong" }, temper = { "wary" }, values = { "duty", "honor" },
  impression = {
    first = "A Warsong scout crouches in the shade of a great tree, a hand on his bow, his eyes never leaving the shadows between the trunks.",
    third = "{name} spoke with a Warsong scout in Ashenvale.",
  },
  greetings = { { id = "g_default", text = "Quiet. The forest has ears, and most of them are pointed." } },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I watch the gulch and the paths to it. The Silverwing Sentinels want our clan out of these woods, and the Warsong want every axe they own back in the trees." } },
      again = { { id = "h_again", text = "Something else? Keep it low." } },
      choices = {
        { text = "What happens in the gulch?", next = "gulch" },
        { text = "How do the night elves fight?", next = "elves" },
        { text = "Good hunting.", next = "END" },
      },
    },
    gulch = {
      lines = { { id = "gu_default", text = "Our lumber road runs through it, and the Sentinels mean to close it for good. Every few days they come for our banners, and every few days we send them back with fewer sisters." } },
      choices = {
        { text = "Then we hold the gulch at any cost.", next = "BACK", fx = { align = { honor = 1 } } },
        { text = "No road of timber is worth that much blood.", next = "BACK", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    elves = {
      lines = { { id = "e_default", text = "From the dark, with arrows and great cats and owls that see everything. They fight like the forest itself hates you, and maybe it does." } },
      choices = { { text = "I'll keep my eyes open.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "Don't know. Ask at the camp." } } },
}

---------------------------------------------------------------------------
-- Astranaar Sentinel: night elf guard of Astranaar. Light entry; World guard pool covers the rest.
---------------------------------------------------------------------------
P:NPC {
  key = "ash_astranaar_sentinel", id = 6087, name = "Astranaar Sentinel", gender = "female",
  role = "guard", tier = "service",
  communities = { "astranaar" }, temper = { "watchful" }, values = { "duty", "nature" },
  impression = {
    first = "A night elf Sentinel stands on the bridge to Astranaar, glaive at rest, her silver eyes measuring you against every stranger who has come before.",
    third = "{name} spoke with a Sentinel guarding Astranaar.",
  },
  greetings = { { id = "g_default", text = "Elune's light upon you, traveller. You stand in Astranaar; keep your weapons sheathed." } },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "We guard this island and the road through the forest. The Warsong cut from the north, the satyrs creep from the south, and the furbolgs have gone mad between them." } },
      again = { { id = "h_again", text = "What more would you ask?" } },
      choices = {
        { text = "How do the Sentinels answer the orcs?", next = "orcs" },
        { text = "Where can I rest?", next = "inn" },
        { text = "Elune keep you.", next = "END" },
      },
    },
    orcs = {
      lines = { { id = "o_default", text = "With arrows, when they cut too deep. Some of my sisters would burn every lumber camp to ash; others pray the orcs remember what their Grom did at the end." } },
      choices = {
        { text = "Drive them from the forest. Leave no camp standing.", next = "BACK", fx = { align = { light = -1 } } },
        { text = "Mercy now might spare the forest a longer war.", next = "BACK", fx = { align = { light = 1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    inn = {
      lines = { { id = "i_default", text = "The inn is near the centre of the town. Innkeeper Kimlya will see that you are fed and rested." } },
      choices = { { text = "Thank you. Something else.", next = "BACK" } },
    },
  },
  topics = { _none = { { id = "tp_none", text = "I cannot say. Ask the Sentinel captain." } } },
}
