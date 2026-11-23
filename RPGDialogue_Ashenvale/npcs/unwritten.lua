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
