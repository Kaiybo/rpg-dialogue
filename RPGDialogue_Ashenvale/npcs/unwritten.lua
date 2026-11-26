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
        { text = "Who did you bury, Bolyun?", next = "ybol_buried" },
        { text = "A fellow hermit, of sorts. How do you live?", next = "ybol_hermit", when = { class = { "HUNTER", "ROGUE" } } },
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
    ybol_buried = {
      narr = "Bolyun looks away toward the mountains, and his jaw tightens under the beard.",
      lines = {
        { id = "yybol_buried_d", text = "Friends from the War of the Ancients, and friends from the war with the orcs, and too many between. The last one was my brother, Ferel, who went down to Astranaar to take up a bow when the Warsong came, and he died on the road to Splintertree." },
      },
      choices = {
        { text = "Is that why you won't fight?", next = "ybol_why" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ybol_why = {
      lines = {
        { id = "yybol_why_d", text = "Partly, aye, and partly because I'm tired. Ten thousand years of fighting, and the forest is still bleeding, and the Sentinels think one more war will mend it. I've stopped believing that, and I'd sooner be called a coward than lie to myself." },
      },
      choices = {
        { text = "What will you do if the war comes here?", next = "ybol_war" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ybol_war = {
      lines = {
        { id = "yybol_war_d", text = "Then I'll fight, because I'll have no choice, and Harlown will fight beside me. But I'll not go looking for it, and I'll not send any young elf down to Astranaar who comes to me asking for advice about whether to join up." },
      },
      choices = {
        { text = "Tell them the truth. Let them choose.", next = "BACK", reply = "Aye, maybe that's fairer. I'll tell them what I've seen, and let them decide.", fx = { align = { honor = 1 } } },
        { text = "Turn them away. Spare them what you saw.", next = "BACK", reply = "That's what I've done so far, and I'll keep doing it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ybol_hermit = {
      lines = {
        { id = "yybol_hermit_d", text = "Quietly, and on very little. We hunt the hills, we trade with the shrine for what we can't grow, and we keep the path hidden. You'll know the trick of it already, if you've lived out in the wilds yourself." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    darkweave = { { id = "tp_ydarkweave", text = "Harlown is my partner. He works leather and trusts nobody, which suits us both." } },
    shrine_of_aessina = { { id = "tp_yshrine_of_aessina", text = "Our nearest neighbours. They keep to themselves, which I like." } },
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
    xbolyun = {
      narr = "Harlown sets down his awl and looks toward the path.",
      lines = { { id = "xbolyun_default", text = "The one who keeps the path to this camp, and the one who decides who walks it. He's slow to trust and slower to forget, and I've never seen him wrong about anybody yet." } },
      choices = {
        { text = "Why does the camp keep so hidden?", next = "xhidden" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xhidden = {
      lines = { { id = "xhidden_default", text = "Because Ashenvale is at war with itself, and those who keep out of the fighting are the ones nobody remembers to burn. We'd like to stay forgotten as long as we can." } },
      choices = {
        { text = "Hiding won't save you if the war comes here.", next = "BACK", reply = "Maybe not. But it's saved us so far, and I'll take so far.", fx = { align = { honor = 1 } } },
        { text = "Staying out of it is the wise thing.", next = "BACK", reply = "Bolyun would like you. Say that to him.", fx = { align = { honor = -1 } } },
      },
    },
    xcraft = {
      lines = { { id = "xcraft_default", text = "From my mother, who scraped hides by the lake when I was small. She said a good hide tells you how the beast lived, and a bad tanner tells you how he does." } },
      choices = {
        { text = "What does a good hide say?", next = "xgood" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgood = {
      lines = { { id = "xgood_default", text = "That the animal ran free and ate well, and that whoever took it did it quickly. You can feel it in the grain. You can feel fear in it too, if you know how to look." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xwarsong = {
      lines = { { id = "xwarsong_default", text = "They take more than they need and waste half of what they take. I've seen whole groves cut for a single wagon of planks, and the rest left to rot where it fell." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xlw = {
      lines = { { id = "xlw_default", text = "Salt the hide the day you take it, not the next. And don't trust any thread you didn't twist yourself, because a seam is only as honest as its weakest stitch." } },
      choices = { { text = "Thank you, Harlown.", next = "BACK", reply = "Use it well. And keep your hands off my hides." } },
    },

    hello = {
      lines = {
        { id = "h_default", key = true, text = "Harlown Darkweave. I work leather and I sell what I don't need, but only to friends of the camp. Bolyun decides who those are." },
      },
      again = {
        { id = "h_again", text = "Something else?" },
        { id = "h_again2", text = "Speak your mind." },
      },
      choices = {
        { text = "How did you and Bolyun meet?", next = "yhar_meet" },
        { text = "A night elf asks: why hide from the Sentinels?", next = "yhar_elf", when = { race = "NightElf" } },
        { text = "Who is Bolyun?", next = "xbolyun" },
        { text = "How did you learn your craft?", next = "xcraft" },
        { text = "What do you make of the Warsong camps?", next = "xwarsong" },
        { text = "I work leather too. Any advice?", next = "xlw", when = { profession = "Leatherworking" } },

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
    yhar_meet = {
      lines = {
        { id = "yyhar_meet_d", text = "At the Shrine of Aessina, a long time ago, when we both came looking for quiet. He was mourning his brother and I was mourning my mother, and we found that we didn't need to talk much to understand each other." },
      },
      choices = {
        { text = "Do you ever miss Astranaar?", next = "yhar_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yhar_miss = {
      narr = "Harlown's hands go still on the hide he is working, and he looks down the mountain toward the lake.",
      lines = {
        { id = "yyhar_miss_d", text = "I miss the market there, and the old tanner who taught me after my mother died. But the Sentinels came to my stall one day and asked me to make armour for them, and I said no, and they never forgave me for it." },
      },
      choices = {
        { text = "Why did you refuse them?", next = "yhar_refuse" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yhar_refuse = {
      lines = {
        { id = "yyhar_refuse_d", text = "Because I didn't want my work to kill anyone, orc or elf. Bolyun says that's foolish, for leather on a Sentinel's back saves her life as often as it takes another, and I've started to think he might be right." },
      },
      choices = {
        { text = "Make the armour. It would save lives.", next = "BACK", reply = "Maybe. I'll make one piece, and see how it feels.", fx = { align = { honor = 1 } } },
        { text = "Keep your oath. Your work is your own.", next = "BACK", reply = "Aye. Thank you. Bolyun will grumble, but I'll keep it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yhar_elf = {
      lines = {
        { id = "yyhar_elf_d", text = "Because the Sentinels want every elf with a bow, and I would sooner hold a scraping knife. You'll understand that, I think, even if you wear a Sentinel's colours yourself. There's more than one way to serve the forest." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    camp_path = { { id = "tp_ycamp_path", text = "Bolyun is my partner. He keeps the path, and I keep the hides." } },
    astranaar = { { id = "tp_yastranaar", text = "Where I learned my craft. The Sentinels didn't like my answer to them." } },
    bolyun = { { id = "tp_xbolyun", text = "If Bolyun says you're a friend, you're a friend. Otherwise, you're just lost." } },
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
    xwait = {
      narr = "Lilyn looks down at her hands, then back toward the trees.",
      lines = { { id = "xwait_default", text = "My brother, Elendil. He went south with the Sentinels toward Felfire Hill a season ago and did not come back with them. They say he fell. I come here because the wisps were his favourite thing, when we were small." } },
      choices = {
        { text = "Do you believe he's gone?", next = "xgone" },
        { text = "I'm sorry, Lilyn.", next = "BACK", reply = "Thank you. Not many think to say it." },
      },
    },
    xgone = {
      lines = { { id = "xgone_default", text = "I believe the Sentinels, and I hope they are wrong. Some days the hoping is harder than the grief. Should I let go of him, do you think, or keep coming here?" } },
      choices = {
        { text = "Keep coming. Hope is worth carrying.", next = "BACK", reply = "Then I will, a little longer.", fx = { align = { light = 1 } } },
        { text = "Let him rest. Grief needs an ending.", next = "BACK", reply = "Perhaps you're right. It still hurts to hear.", fx = { align = { light = -1 } } },
      },
    },
    xwisps = {
      lines = { { id = "xwisps_default", text = "They drift through the shrine at dusk, like lamps that forgot where they were going. If you are very still, they come close enough to touch. I've never tried; it feels like it would be rude." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhome = {
      lines = { { id = "xhome_default", text = "I keep a room there, near the moonwell. Shindrell says I spend more nights here than in my bed, and she is right, but the shrine is quieter than any inn." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xkin = {
      lines = { { id = "xkin_default", text = "It does, though not in words. It is more like standing at the edge of a song you almost remember. Sit a while, if you like; Aessina never minds another listener." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Lilyn Darkriver. I come to the Shrine of Aessina to listen to the forest, which is harder than it sounds with axes ringing to the south." },
      },
      again = {
        { id = "h_again", text = "Was there something else?" },
        { id = "h_again2", text = "Speak, if you wish. The wisps don't mind." },
      },
      choices = {
        { text = "What was Elendil like?", next = "ylil_elendil" },
        { text = "I've been to Felfire Hill. I could look for him.", next = "ylil_look", when = { minLevel = 20 } },
        { text = "Who are you waiting for?", next = "xwait" },
        { text = "Tell me about the wisps.", next = "xwisps" },
        { text = "Do you live in Astranaar?", next = "xhome" },
        { text = "I'm kaldorei as well. Does the shrine call to you?", next = "xkin", when = { race = "NightElf" } },

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
    ylil_elendil = {
      lines = {
        { id = "yylil_elendil_d", text = "Quiet, like me, but braver. He loved the old songs and the stars, and he would sit on the roof of our house at night naming every one of them. When the Sentinels came looking for archers, he was the first to go, and he went smiling." },
      },
      choices = {
        { text = "Did you try to stop him?", next = "ylil_stop" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylil_stop = {
      narr = "Lilyn folds her hands in her lap and watches a wisp drift slowly past.",
      lines = {
        { id = "yylil_stop_d", text = "I begged him not to go, and he laughed and said the forest needed him more than I did. I was angry with him for a long time after, and now I am angry with myself for being angry, which helps no one." },
      },
      choices = {
        { text = "Does the anger help at all?", next = "ylil_anger" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylil_anger = {
      lines = {
        { id = "yylil_anger_d", text = "Not at all, but it is easier than the grief, some days. Shindrell says I should take up a bow myself and go to Felfire Hill, to find out what happened, but I am no Sentinel, and I am afraid of what I would find." },
      },
      choices = {
        { text = "Seek the truth. Not knowing will haunt you.", next = "BACK", reply = "Perhaps you are right. I will think about it, here, with the wisps.", fx = { align = { light = 1 } } },
        { text = "Stay here. He would want you safe.", next = "BACK", reply = "Thank you. I think he would, too. It helps to hear it.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylil_look = {
      lines = {
        { id = "yylil_look_d", text = "Would you? I would not ask, but I would be grateful beyond words. He wore a silver brooch shaped like a crescent moon, which our mother gave him. If you find it, bring it back to me, and I will know." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    elendil = { { id = "tp_yelendil", text = "My brother. He went to Felfire Hill and did not return." } },
    wisps = { { id = "tp_ywisps", text = "They drift through the shrine at dusk, gentle as lanterns." } },
    aessina = { { id = "tp_xaessina", text = "The Mother of the Wild. I like to think she watches over those who come to her shrine." } },
    felfire_hill = { { id = "tp_xfelfire", text = "Where my brother was lost. I do not go there, and I hope you never need to." } },
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
    xhow = {
      narr = "He tugs at a bell on his hat, which jingles at the worst possible moment.",
      lines = { { id = "xhow_default", text = "Smokywood drew lots, pal, and I drew the short one. The Ironforge stall went to my cousin, and I got a forest full of elves who think gingerbread is a kind of tree bark. I'm turnin' it around, though." } },
      choices = {
        { text = "How are the elves taking to it?", next = "xelves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xelves = {
      lines = { { id = "xelves_default", text = "Slowly. First week, a Sentinel bought one candy cane and stared at it for an hour. Second week, she came back for a dozen. Sugar wins every war in the end, pal; you can quote me." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xbest = {
      lines = { { id = "xbest_default", text = "Eggnog, hands down. The Sentinels say it's for the cold, but Ashenvale isn't cold. I don't ask questions, pal; I just keep the barrels full." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xgive = {
      lines = { { id = "xgive_default", text = "Me? Give stuff away? Okay, okay, once. A little elf kid with no coin, lookin' at the gingerbread like it was the moon. Don't tell my bosses, but she went home with two." } },
      choices = {
        { text = "That's the real spirit of Winter Veil.", next = "BACK", reply = "Yeah, yeah. Keep it down, you'll ruin my reputation.", fx = { align = { light = 1 } } },
        { text = "Bad business, Gapp. That's two cookies lost.", next = "BACK", reply = "Ha! See, you get it. I'll make it back on the eggnog.", fx = { align = { light = -1 } } },
      },
    },
    xhorde = {
      lines = { { id = "xhorde_default", text = "Not from this stall, pal; the Sentinels would turn me into a pincushion. But my brother's got a cart in Orgrimmar, and between you and me, it's the same gingerbread." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    hello = {
      lines = {
        { id = "h_default", key = true, text = "Gapp Jinglepocket, Smokywood Pastures' man in Ashenvale. Gingerbread, eggnog, candy canes, you name it, I've got it, and at a price that's practically charity." },
      },
      again = {
        { id = "h_again", text = "What else, pal? Time's money and the season's short." },
        { id = "h_again2", text = "Still lookin'? Good, good." },
      },
      choices = {
        { text = "How's business this season, really?", next = "ygap_business" },
        { text = "You're a goblin. Steamwheedle or Venture?", next = "ygap_goblin", when = { race = "Goblin" } },
        { text = "How did you end up in Ashenvale?", next = "xhow" },
        { text = "What's your best seller?", next = "xbest" },
        { text = "Do you ever give anything away?", next = "xgive" },
        { text = "Will you sell to the Horde as well?", next = "xhorde", when = { faction = "Alliance" } },

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
    ygap_business = {
      lines = {
        { id = "yygap_business_d", text = "Really? Okay, between you and me, pal, it's slow. The Sentinels buy one candy cane apiece and act like they've robbed a bank, and the druids won't touch anything with sugar in it. I'm runnin' at a loss on the gingerbread, and the eggnog's barely holdin' up the books." },
      },
      choices = {
        { text = "Why not move to a better market?", next = "ygap_move" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ygap_move = {
      narr = "Gapp glances at the elves walking past and lowers his voice to a stage whisper.",
      lines = {
        { id = "yygap_move_d", text = "Because here's the thing, pal, I kinda like it here. Nobody yells, nobody shoves, and the elves say thank you when they buy somethin', which is more than I can say for Ratchet. Smokywood offered me Ironforge next year, and I'm thinkin' about sayin' no." },
      },
      choices = {
        { text = "Would Smokywood let you stay?", next = "ygap_stay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ygap_stay = {
      lines = {
        { id = "yygap_stay_d", text = "Only if I make the numbers work, and the numbers ain't workin'. I could cut the price and sell more, or I could raise the price and sell less but make more on each, and either way I'm takin' a gamble with my own money." },
      },
      choices = {
        { text = "Raise the price. Make the margin.", next = "BACK", reply = "Ha, that's good goblin thinkin'. My cousin would hire you on the spot.", fx = { align = { order = 1 } } },
        { text = "Cut the price. Make the elves happy.", next = "BACK", reply = "Generous, pal. Real generous. You'd be a terrible goblin, and I mean that nicely.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ygap_goblin = {
      lines = {
        { id = "yygap_goblin_d", text = "Smokywood Pastures, pal, which is neither, and that's the beauty of it. Seasonal work, seasonal pay, no lumber contracts and no Cartel dues. My cousin in the Venture Company thinks I'm crazy, and maybe I am." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    smokywood_pastures = { { id = "tp_ysmokywood_pastures", text = "The finest seasonal goods company in the world, pal, and they pay on time." } },
    astranaar = { { id = "tp_yastranaar", text = "Quiet town, polite customers, terrible for business. I like it here." } },
    winter_veil = { { id = "tp_xveil", text = "Best season of the year, pal. Everybody's generous, and generosity looks a lot like profit from where I'm standin'." } },
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
    xjob = {
      narr = "He sets down a heavy bundle of arrows, carefully, as though the wood could still feel it.",
      lines = { { id = "xjob_default", text = "I hunt for the post, so the peons and grunts eat. I take only the old beasts and the sick ones, and I speak the words over each of them. The orcs laugh at that, but they eat what I bring." } },
      choices = {
        { text = "What words do you speak?", next = "xwords" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwords = {
      lines = { { id = "xwords_default", text = "Thanks to the Earth Mother for the gift, and a promise that nothing will be wasted. It is a short prayer. In this place, I sometimes wonder if she still hears it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xlisten = {
      lines = { { id = "xlisten_default", text = "Some do. Senani Thunderheart is a tauren as well, and she speaks to the commanders when I cannot. The orcs are not deaf, only in a hurry, and the war gives them every reason to stay that way." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xcenarius = {
      lines = { { id = "xcenarius_default", text = "We did, and many of us still do. He fell in this forest to Grom Hellscream's axe, when the orcs still carried the demon's curse. I stand among the sons of the ones who killed him, and some nights that sits heavy." } },
      choices = {
        { text = "The orcs were cursed. That debt is paid.", next = "BACK", reply = "Thrall would say so, and Grom paid it himself. I try to believe it.", fx = { align = { order = 1 } } },
        { text = "Some debts are never truly paid.", next = "BACK", reply = "No. I fear this forest agrees with you.", fx = { align = { order = -1 } } },
      },
    },
    xorc = {
      lines = { { id = "xorc_default", text = "No, not wrong, only hasty. Your people need shelter, and wood builds it. I only ask that you cut as a hunter hunts, with thanks and with care, and not like a fire that eats everything." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xkin = {
      lines = { { id = "xkin_default", text = "Then we can share it, and it will weigh a little less. Come to the fire tonight, brother or sister, and we will sing for the trees together, quietly, so the grunts can sleep." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Loruk Foreststrider of Thunder Bluff. I came to Splintertree to stand with the Horde, but my heart is heavy every time I hear an axe bite into these old trees." },
      },
      again = {
        { id = "h_again", text = "What more would you ask?" },
        { id = "h_again2", text = "Speak, friend. I am listening." },
      },
      choices = {
        { text = "What do you see when the trees fall?", next = "ylor_trees" },
        { text = "Do the orcs mock your prayers?", next = "ylor_mock", when = { race = "Orc" } },
        { text = "What do you do at Splintertree?", next = "xjob" },
        { text = "Do the orcs listen to your concerns?", next = "xlisten" },
        { text = "What of Cenarius? Your people revered him.", next = "xcenarius" },
        { text = "I'm an orc. You think we're wrong to be here?", next = "xorc", when = { race = "Orc" } },
        { text = "I feel the same unease, brother.", next = "xkin", when = { race = "Tauren" } },

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
    ylor_trees = {
      narr = "Loruk looks at the stumps around the camp and his ears flatten a little.",
      lines = {
        { id = "yylor_trees_d", text = "I see the Earth Mother's hair cut away, and I hear her weeping. The orcs hear only the axes, and the peons sing while they cut, and I have learned to walk out into the forest at dawn so I do not have to listen." },
      },
      choices = {
        { text = "Have you told the commanders?", next = "ylor_told" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylor_told = {
      lines = {
        { id = "yylor_told_d", text = "I have, and they listened, and they nodded, and they cut the next grove anyway. Orgrimmar needs wood, they say, and they are not wrong. But a hunter who takes more than he needs is no hunter at all, and the Warsong take far more." },
      },
      choices = {
        { text = "Will you go home to Thunder Bluff?", next = "ylor_home" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylor_home = {
      lines = {
        { id = "yylor_home_d", text = "I have thought of it every night for a season. My people owe Thrall a great debt, and I would honour it, but I am not sure that standing among the stumps honours anything. The elders would say stay, and my heart says go." },
      },
      choices = {
        { text = "Stay. A debt must be honoured.", next = "BACK", reply = "Yes. That is the tauren way, and I will keep it. For now.", fx = { align = { honor = 1 } } },
        { text = "Go home. Your heart knows the way.", next = "BACK", reply = "Perhaps it does. The winds of Mulgore are calling me, I think.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ylor_mock = {
      lines = {
        { id = "yylor_mock_d", text = "Some do, the young ones, who have never known anything but the camps and the axe. The older grunts are kinder, for they remember when the orcs had shamans too, and spoke to the spirits. Thrall speaks to them still, I am told." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    splintertree_post = { { id = "tp_ysplintertree_post", text = "The Horde's camp in the forest. I hunt for the peons, and I mourn the trees." } },
    mulgore = { { id = "tp_ymulgore", text = "My home, where the grass grows free and nobody cuts it with an axe." } },
    thunder_bluff = { { id = "tp_xbluff", text = "Home. The wind there is clean, and nobody cuts the grass with an axe." } },
    cenarius = { { id = "tp_xcenarius", text = "The Lord of the Forest. My people honored him, and I still do, even here." } },
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
    xold = {
      narr = "The spirit's outline wavers, as if remembering costs him something.",
      lines = { { id = "xold_default", text = "Towers of white stone over a great blue lake, and music in every courtyard. We thought we were the center of the world, and we were right, until the world shattered around us." } },
      choices = {
        { text = "Did you know the Queen?", next = "xqueen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xqueen = {
      lines = { { id = "xqueen_default", text = "I saw her once, from very far away, and I thought her the most beautiful thing in all creation. I was a minor scholar of a minor house. It was enough for me to be far from her, and it may be why I am still here." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xothers = {
      lines = { { id = "xothers_default", text = "Some of them. Dalarel, who loved poetry, and old Teronis, who argued with everyone. I felt them go, one after another, until only I was left listening. I do not know why I lasted." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xnow = {
      lines = { { id = "xnow_default", text = "Fade, I think, and gladly. But first I would see Athrikus answer for what he did. Is it wrong to want vengeance with my last breath, when I no longer have breath at all?" } },
      choices = {
        { text = "Justice for the trapped is no wrong.", next = "BACK", reply = "Then I will carry that, for as long as I remain.", fx = { align = { light = -1 } } },
        { text = "Let it go. Rest is better than revenge.", next = "BACK", reply = "Perhaps. You speak as the priestesses did, long ago.", fx = { align = { light = 1 } } },
      },
    },
    xkin = {
      lines = { { id = "xkin_default", text = "You are of the same blood, and yet so different. The kaldorei I knew wore silk and scorned the forest. You look as though you were born in it. Perhaps that is better." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xmage = {
      lines = { { id = "xmage_default", text = "All of us did. The arcane was in our food and our wine and our songs. Be careful with it, young one. It answers very willingly, and it never tells you what it will ask in return." } },
      choices = { { text = "I'll be careful.", next = "BACK", reply = "We all said that, once." } },
    },

    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Sargath, once of the Highborne. When the world broke apart, a sorcerer named Athrikus Narassin came to us and promised to protect us from harm. Instead, he sealed us inside a gem." },
      },
      again = {
        { id = "h_again", text = "What else would you hear from a ghost?" },
        { id = "h_again2", text = "Ask. I have had a very long time to think." },
      },
      choices = {
        { text = "Tell me about Dalarel and Teronis.", next = "ysar_friends" },
        { text = "I have arcane power. What should I fear?", next = "ysar_mage", when = { class = "MAGE" } },
        { text = "What do you remember of the old world?", next = "xold" },
        { text = "Were the others in the gem your friends?", next = "xothers" },
        { text = "What will you do now that you're free?", next = "xnow" },
        { text = "I am kaldorei. Do you know my people?", next = "xkin", when = { race = "NightElf" } },
        { text = "I am a mage. Did you practice the arcane?", next = "xmage", when = { class = "MAGE" } },

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
    ysar_friends = {
      lines = {
        { id = "yysar_friends_d", text = "Dalarel wrote verses about the moon that made the Queen's court weep, and she was the last of us to fade. Teronis argued with everyone about everything, and he argued with the dark inside the gem for a thousand years before it took him." },
      },
      choices = {
        { text = "What did he argue about?", next = "ysar_argue" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysar_argue = {
      narr = "Sargath's form flickers, like a candle in a draught.",
      lines = {
        { id = "yysar_argue_d", text = "That we deserved our fate, that the Highborne had brought the Legion into the world, and that we should not blame Athrikus for punishing us. The rest of us called him a fool, but in the dark, after he faded, I began to wonder if he was right." },
      },
      choices = {
        { text = "Was Teronis right?", next = "ysar_right" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysar_right = {
      lines = {
        { id = "yysar_right_d", text = "I do not know. I did not call the demons, but I drank the wine of the Well and laughed at the elves who warned us. Perhaps that is enough to make a soul answer for it, and perhaps it is not." },
      },
      choices = {
        { text = "You did not call them. You are not to blame.", next = "BACK", reply = "Thank you, young one. I will try to believe it, before I go.", fx = { align = { light = 1 } } },
        { text = "You laughed at the warnings. That is a sin.", next = "BACK", reply = "Yes. Teronis would agree with you. Perhaps I will tell him, when I see him.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ysar_mage = {
      lines = {
        { id = "yysar_mage_d", text = "Fear the hunger, young one, above all. The arcane feeds you and you feed it, and one day you find you cannot stop. We could not, and the world broke because of it. Be wiser than we were." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    eldarath = { { id = "tp_yeldarath", text = "Our city, once. I hear it lies in ruins now, in a land your people call Azshara." } },
    well_of_eternity = { { id = "tp_ywell_of_eternity", text = "Our pride and our ruin. I drank from it once, and I would give anything to undo it." } },
    highborne = { { id = "tp_xhighborne", text = "My people. Proud and brilliant, and proud above all. It was the pride that drowned us." } },
    athrikus = { { id = "tp_xathrikus", text = "The one who betrayed us. I hope he fears the dark as I learned to." } },
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
    xsource = {
      narr = "She pats a crate stamped with Astranaar's crescent.",
      lines = { { id = "xsource_default", text = "Astranaar, mostly, and Auberdine by way of the Zoram Strand road when it's open. Some of the thread comes all the way from Darnassus, which is why it costs what it does." } },
      choices = {
        { text = "Is the road safe?", next = "xroad" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xroad = {
      lines = { { id = "xroad_default", text = "Safe enough by day with a Sentinel along. By night I'd rather not find out. A cart went missing near the Zoram Strand a month ago, and the naga don't send ransom notes." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xfolk = {
      lines = { { id = "xfolk_default", text = "Druids and Sentinels, a few herbalists, and anyone with nowhere better to be. Silverwind is the last quiet place on this side of the forest. We all try not to say that too loudly." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xwar = {
      lines = { { id = "xwar_default", text = "Prices go up and customers go down, and I'm told I should raise my rates while I can. But these are my neighbours. Should a merchant profit from her own people's war?" } },
      choices = {
        { text = "Keep prices fair. Your neighbours need you.", next = "BACK", reply = "That's what I'll do, and my purse will forgive me eventually.", fx = { align = { honor = 1 } } },
        { text = "Charge what the market bears. It's only business.", next = "BACK", reply = "Spoken like a goblin. I'll think about it, but I don't like it.", fx = { align = { honor = -1 } } },
      },
    },
    xcraft = {
      lines = { { id = "xcraft_default", text = "Heavy thread and salt, because everyone's mending armour and curing hides. Flux too, for the smiths who come through with Sentinel blades that need fixing." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Shandrina. I keep Silverwind Refuge in trade goods, which mostly means hauling crates from Astranaar and hoping the Warsong don't take them on the way." },
      },
      again = {
        { id = "h_again", text = "Anything else?" },
        { id = "h_again2", text = "Yes? I've crates to count." },
      },
      choices = {
        { text = "That missing cart near the Zoram Strand. Whose was it?", next = "yshn_cart" },
        { text = "I'm a crafter. What should I stock up on?", next = "yshn_craft", when = { profession = { "Blacksmithing", "Leatherworking", "Tailoring" } } },
        { text = "Where do your goods come from?", next = "xsource" },
        { text = "Who else lives at the refuge?", next = "xfolk" },
        { text = "Is it hard being a merchant in wartime?", next = "xwar" },
        { text = "What sells best to crafters here?", next = "xcraft", when = { profession = "Tailoring" } },

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
    yshn_cart = {
      lines = {
        { id = "yyshn_cart_d", text = "A carter named Thalwen, who had driven the Astranaar road for longer than I have been trading. The Sentinels found the cart a week later, overturned in the reeds, with the oxen gone and no sign of her at all." },
      },
      choices = {
        { text = "What do you think happened?", next = "yshn_happened" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yshn_happened = {
      narr = "Shandrina sets down the crate she was holding and stares at it for a long moment.",
      lines = {
        { id = "yyshn_happened_d", text = "The Sentinels say naga, for there were tracks in the mud like nothing that walks on land. I think they are right, but I also think Thalwen was carrying something more than thread that week, for she was nervous before she left and would not tell me why." },
      },
      choices = {
        { text = "Should you tell the Sentinels?", next = "yshn_tell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yshn_tell = {
      lines = {
        { id = "yyshn_tell_d", text = "I have nothing to tell them but a feeling, and Thalwen was my friend. If she was smuggling something, I would rather her name stayed clean, but if it is what drew the naga, others might die on that road." },
      },
      choices = {
        { text = "Tell them. Lives matter more than her name.", next = "BACK", reply = "You are right, and I knew it. I will go to Astranaar on the next cart.", fx = { align = { honor = 1 } } },
        { text = "Keep quiet. A feeling is not proof.", next = "BACK", reply = "Yes. I will keep my silence, and hope it does not cost anyone.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yshn_craft = {
      lines = {
        { id = "yyshn_craft_d", text = "Salt, first, because nobody in Silverwind thinks to buy enough of it, and thread second. Flux is dear this season, so buy what you need and no more. I would not overcharge a crafter, but I cannot promise the next shipment will come." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    zoram_strand = { { id = "tp_yzoram_strand", text = "The coast road west. The naga have made it dangerous." } },
    silverwind_refuge = { { id = "tp_ysilverwind_refuge", text = "The last quiet place in Ashenvale. I keep it stocked." } },
    astranaar = { { id = "tp_xastranaar", text = "My supplier and my nearest friend. When Astranaar sneezes, Silverwind catches cold." } },
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
        { text = "What is the Falfarren river like?", next = "yriv_falfarren" },
        { text = "Do you know my family, Elder?", next = "yriv_kin", when = { race = "NightElf" } },
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
    yriv_falfarren = {
      lines = {
        { id = "yyriv_falfarren_d", text = "Clear and cold in the north, and slow and green where it reaches the lake. My mother sang to it every spring, and I sing to it still, though the water carries sawdust now from the Warsong camps upriver." },
      },
      choices = {
        { text = "Does the sawdust trouble you?", next = "yriv_sawdust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yriv_sawdust = {
      narr = "Riversong dips her fingers into a small bowl of water beside her and watches the ripples spread.",
      lines = {
        { id = "yyriv_sawdust_d", text = "It troubles the fish more than me, and the fish trouble the furbolgs, and the furbolgs trouble the Sentinels. Everything in the forest is tied together, young one, and when one thread is cut, the whole weave pulls loose." },
      },
      choices = {
        { text = "Can the weave be mended?", next = "yriv_mend" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yriv_mend = {
      lines = {
        { id = "yyriv_mend_d", text = "I believe so, though not in my lifetime, or perhaps even in yours. The young Sentinels want to cut the bad threads away, and the druids want to wait and let the forest mend itself. I have seen both work, and both fail." },
      },
      choices = {
        { text = "Cut the bad threads. Act now.", next = "BACK", reply = "Brave words, young one. The Sentinels will welcome you.", fx = { align = { order = 1 } } },
        { text = "Wait. The forest heals in its own time.", next = "BACK", reply = "Patience is the river's gift. I am glad you have it.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yriv_kin = {
      lines = {
        { id = "yyriv_kin_d", text = "Perhaps, for I have known many families over the years, and the faces blur into one another. Tell me your mother's name, and I will tell you if I remember her singing. Most kaldorei mothers sang once, before the wars." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    falfarren_river = { { id = "tp_yfalfarren_river", text = "The river I was named for. It carries sawdust now." } },
    moonglade = { { id = "tp_ymoonglade", text = "The druids' sacred place. I went there once, when I was young." } },
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
    xkeeper = {
      narr = "The keeper's voice comes slowly, like wind moving through high branches.",
      lines = { { id = "xkeeper_default", text = "We are the sons of Cenarius, born of the forest and bound to it. Each of us keeps a grove, and each grove keeps a little of our father's memory alive. When a grove falls, a little of that memory goes with it." } },
      choices = {
        { text = "How many groves remain in Ashenvale?", next = "xgroves" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xgroves = {
      lines = { { id = "xgroves_default", text = "Fewer than when I was young, and I was young a very long time ago. The Warsong axes do not know which trees are only trees and which are something more. I fear they would not stop even if they did." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xguard = {
      lines = { { id = "xguard_default", text = "The dryads, my sisters in spirit, and the faerie dragons who play among the leaves. And the Cenarion druids, who came from Moonglade when they heard the axes. I did not ask them to come, but I am glad they did." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xancient = {
      lines = { { id = "xancient_default", text = "Fire, little one. The sky full of fire, and the Highborne singing at their Well while the world burned. My father led the forest against the Legion, and the trees themselves marched beside him." } },
      choices = {
        { text = "Could such a war come again?", next = "xagain" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xagain = {
      lines = { { id = "xagain_default", text = "It nearly did, at Hyjal, not so long ago. The demons are patient, and they remember us as we remember them. The question is whether the young races will remember, or whether they will be too busy cutting down my trees." } },
      choices = {
        { text = "We must unite, Horde and Alliance, against such a threat.", next = "BACK", reply = "Wise words. I pray the chieftains hear them before the fire does.", fx = { align = { honor = -1 } } },
        { text = "Old debts come first. The Horde must answer for Ashenvale.", next = "BACK", reply = "The forest agrees with you, I think, though it grieves to say so.", fx = { align = { honor = 1 } } },
      },
    },
    xdruid = {
      lines = { { id = "xdruid_default", text = "I felt you coming up the slope, child of the Circle. The Dream is gentle with you, which means you have been gentle with it. Walk these woods as my father would have wished." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xtauren = {
      lines = { { id = "xtauren_default", text = "I know it. Your shamans spoke to my father's spirit long before the kaldorei found you again. It grieves me that your people now march beside the axes, but I do not forget that they once walked with him." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    hello = {
      lines = { { id = "h_default", text = "I am Ordanus, keeper of this grove and son of Cenarius. I guard Raynewood against those who would burn it, and of late there are a great many of those." } },
      again = { { id = "h_again", text = "What else would you ask of a keeper?" } },
      choices = {
        { text = "What is a keeper of the grove?", next = "xkeeper" },
        { text = "Who are the creatures who guard you?", next = "xguard" },
        { text = "What do you remember of the War of the Ancients?", next = "xancient" },
        { text = "Keeper, I am a druid of the Circle.", next = "xdruid", when = { class = "DRUID" } },
        { text = "I am tauren, and we honor Cenarius as well.", next = "xtauren", when = { race = "Tauren" } },

        { text = "Who threatens Raynewood?", next = "threat" },
        { text = "You are a son of Cenarius?", next = "cenarius" },
        { text = "I'll not disturb your grove.", next = "END" },
      },
    },
    threat = {
      lines = { { id = "t_default", text = "The orcs of Splintertree and the Warsong camps cut ever closer with their axes and their goblin machines. Worse, I hear the Horde has put a price on my own head, as though a keeper were a wolf in a pasture." } },
      choices = {
        { text = "The Horde will regret it.", next = "BACK" },
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
  topics = {
    cenarius = { { id = "tp_xcenarius", text = "My father. He lives in every tree his sons protect, and dies a little in every one that falls." } },
    hyjal = { { id = "tp_xhyjal", text = "Where the demons were stopped, at great cost. The World Tree remembers it, and so do I." } },
 _none = { { id = "tp_none", text = "That is a matter for others. The Raynewood is mine to guard, and I will not leave it." } } },
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
    xserve = {
      narr = "He shifts his grip on the staff, and the moss stirs around its foot.",
      lines = { { id = "xserve_default", text = "I studied in Moonglade for a long while, as all of the Circle do. When the Horde came into Ashenvale, the Arch Druid sent some of us to stand with the keepers, and I asked to be sent here." } },
      choices = {
        { text = "Why Raynewood in particular?", next = "xwhy" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwhy = {
      lines = { { id = "xwhy_default", text = "Because Ordanus is old and patient, and he does not ask for help. Those who never ask are often the ones who need it most, and so I came without being asked." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xtrespass = {
      lines = { { id = "xtrespass_default", text = "The first time, we turn them back with a warning. The second time, the dryads lose their laughter. There is rarely a third time, and I take no joy in saying so." } },
      choices = {
        { text = "Is that not harsh for a druid?", next = "xharsh" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xharsh = {
      lines = { { id = "xharsh_default", text = "Nature is not gentle, traveler; it is only balanced. A wolf that hunts the herd too hard is driven off by the herd. We are the herd here, and the axes are the wolf." } },
      choices = {
        { text = "Balance means even the wolf must eat.", next = "BACK", reply = "Perhaps. But it may eat elsewhere, and leave this grove be.", fx = { align = { light = -1 } } },
        { text = "Protecting the grove is a kindness in itself.", next = "BACK", reply = "I like to think so. Ordanus would say the same, more slowly.", fx = { align = { light = 1 } } },
      },
    },
    xhelp = {
      lines = { { id = "xhelp_default", text = "Speak with the keeper, if he will see you. And if you find Horde scouts lurking near the Retreat, let the Sentinels at Astranaar know before they find a way up the slope." } },
      choices = { { text = "I will.", next = "BACK", reply = "Thank you. The grove remembers those who guard it." } },
    },
    xdruid = {
      lines = { { id = "xdruid_default", text = "Then you know what these trees are worth, and you know they cannot run. Climb gently, kin of the Circle, and give Ordanus a druid's greeting. It will please him more than he shows." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhorde = {
      lines = { { id = "xhorde_default", text = "The Circle has tauren among its own, so I will not turn you away for your banner alone. But keep your axe on your back, for the dryads here do not know Thunder Bluff from Splintertree." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    hello = {
      lines = { { id = "h_default", text = "We protect the keeper and his grove, alongside the laughing sisters and the faerie dragons. The Horde has grown bold in these woods, and so we have grown watchful." } },
      again = { { id = "h_again", text = "Is there something more?" } },
      choices = {
        { text = "How did you come to serve the keeper?", next = "xserve" },
        { text = "What happens to someone who trespasses?", next = "xtrespass" },
        { text = "Is there anything I can do for the grove?", next = "xhelp" },
        { text = "I walk the druid's path as well.", next = "xdruid", when = { class = "DRUID" } },
        { text = "I'm Horde. Am I welcome here?", next = "xhorde", when = { faction = "Horde" } },

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
  topics = {
    ordanus = { { id = "tp_xordanus", text = "The keeper is the oldest thing on this hill, older than the trees he guards. Speak to him with patience." } },
    moonglade = { { id = "tp_xmoonglade", text = "Where the Circle gathers. I miss its quiet, but this grove needs me more." } },
 _none = { { id = "tp_none", text = "Ask at Astranaar. We keep to the grove." } } },
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
    xdays = {
      narr = "He lifts his head slowly, and the leaves in his antlers whisper.",
      lines = { { id = "xdays_default", text = "We do not count days the way you do. We count seasons and the rings of trees, and we listen for the wrong sounds: the axe, the saw, the goblin engine coughing in the valley." } },
      choices = {
        { text = "Do you ever sleep?", next = "xsleep" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsleep = {
      lines = { { id = "xsleep_default", text = "Rarely, and never deeply. The druids dream in the Emerald Dream, but my place is here, awake, where the axes are. I will rest when the forest does." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xfoes = {
      lines = { { id = "xfoes_default", text = "The satyrs and their fel creatures, and the furbolgs who have lost their minds to demon totems. They grieve me more than the orcs, for they were once of the forest, and now they are its sickness." } },
      choices = {
        { text = "Can the sick ones be healed?", next = "xheal" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xheal = {
      lines = { { id = "xheal_default", text = "The druids try, and sometimes a furbolg wakes from the madness. More often it does not. My brothers argue whether we owe them patience or a swift end. Which would you give them?" } },
      choices = {
        { text = "Patience. They were victims before they were foes.", next = "BACK", reply = "So says my heart. My spear is less certain.", fx = { align = { light = 1 } } },
        { text = "A swift end is a mercy for the whole forest.", next = "BACK", reply = "A hard truth, and one the forest itself might agree with.", fx = { align = { light = -1 } } },
      },
    },
    xask = {
      lines = { { id = "xask_default", text = "Ask him yourself, for he speaks to those who climb with respect. Know only that he will not ask for much, and you should do it well, whatever it is." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdruid = {
      lines = { { id = "xdruid_default", text = "And I greet you, child of the Circle. My father taught your first teachers, long ago. When you walk in bear's shape through these woods, remember whose sons still watch over them." } },
      choices = { { text = "I will remember.", next = "BACK", reply = "Good. The forest has a long memory too." } },
    },

    hello = {
      lines = { { id = "h_default", text = "I am one of Ordanus's vindicators, and I stand at his side until the forest is safe again. That may be a very long time, and I do not mind." } },
      again = { { id = "h_again", text = "What more do you seek?" } },
      choices = {
        { text = "What is Ordanus like?", next = "ycen_ordanus" },
        { text = "Do the keepers hate the Horde?", next = "ycen_horde", when = { faction = "Horde" } },
        { text = "How do the keepers live, day to day?", next = "xdays" },
        { text = "Who are your enemies here, besides the Horde?", next = "xfoes" },
        { text = "What would you have me do for Ordanus?", next = "xask" },
        { text = "A druid greets you, son of Cenarius.", next = "xdruid", when = { class = "DRUID" } },

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
    ycen_ordanus = {
      lines = {
        { id = "yycen_ordanus_d", text = "Old and patient, as the oldest trees are patient. He speaks rarely, and when he does the whole grove leans to listen. He has sworn to keep the Raynewood free of the satyr taint until he himself becomes part of the forest, and I believe he will." },
      },
      choices = {
        { text = "Will you ever be like him?", next = "ycen_like" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ycen_like = {
      narr = "The young keeper looks down at his own hooves, and for a moment he seems very young indeed.",
      lines = {
        { id = "yycen_like_d", text = "I hope so, in a thousand years or so. For now I am impatient and quick to anger, and Ordanus says that is the curse of the young keepers. He says I will learn patience when the forest teaches it to me, which it has not yet." },
      },
      choices = {
        { text = "What makes you angry?", next = "ycen_angry" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ycen_angry = {
      lines = {
        { id = "yycen_angry_d", text = "The axes, and the fel, and the slowness of the druids who will not strike first. When I see a grove burned I want to ride down on the Warsong and trample them, but Ordanus says that would only make more burned groves." },
      },
      choices = {
        { text = "Ordanus is right. Vengeance breeds more war.", next = "BACK", reply = "So he says, and so you say. I am trying to believe it.", fx = { align = { light = 1 } } },
        { text = "Ride down on them. The forest needs defending.", next = "BACK", reply = "Your words please my heart, and trouble my mind. I will not, for Ordanus.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ycen_horde = {
      lines = {
        { id = "yycen_horde_d", text = "We do not hate, little one, but we remember. My father fell to an orc's axe in this forest, and his blood is in the earth here. Walk with care in Ashenvale, and cut nothing, and the keepers will let you pass." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    ordanus = { { id = "tp_yordanus", text = "The keeper of the Raynewood. I stand at his side." } },
    raynewood_retreat = { { id = "tp_yraynewood_retreat", text = "The keeper's grove. The satyrs creep closer every season." } },
    cenarius = { { id = "tp_xcenarius", text = "My father, slain in this very forest. His sons keep his woods now." } },
    satyrs = { { id = "tp_xsatyrs", text = "Felfire Hill festers with them. One day the keepers will go there, and the hill will be quiet again." } },
 _none = { { id = "tp_none", text = "I know only the grove. Ask the Sentinels for the rest." } } },
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
    xbefore = {
      narr = "The herbalist pauses, a leaf halfway to the satchel.",
      lines = { { id = "xbefore_default", text = "An apothecary's apprentice in Brill, if you can believe it. I mixed tonics for farmers with bad backs. Then the grain went bad and so did I, and now I mix things for people with no backs left to hurt." } },
      choices = {
        { text = "You don't sound bitter about it.", next = "xbitter" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xbitter = {
      lines = { { id = "xbitter_default", text = "Bitterness spoils the hand, and a shaking hand spoils the mixture. I save it all for the Scourge, where it might do some good, and I keep my fingers steady for the rest." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xtonight = {
      lines = { { id = "xtonight_default", text = "Wild steelbloom and a bit of kingsblood, if the elves haven't trampled it. There's a grey mushroom in the cellar of this ruin as well, and the apothecaries pay well for anything that glows." } },
      choices = {
        { text = "Mushrooms that glow? What are they for?", next = "xglow" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xglow = {
      lines = { { id = "xglow_default", text = "I don't ask, and they don't tell. I suspect it ends up in a rat, then in a bigger rat, and then in something that used to be a rat. That's research, I'm told." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xelves = {
      lines = { { id = "xelves_default", text = "They love this forest the way the living love anything, with a great deal of noise and arrows. I'd almost admire them, if they didn't keep trying to put me back in the ground." } },
      choices = {
        { text = "They're only defending their home.", next = "BACK", reply = "Aren't we all, dear. Mine just happens to be a crypt.", fx = { align = { honor = 1 } } },
        { text = "Then they should learn to share it.", next = "BACK", reply = "Tell them that. From a distance, preferably behind a tree.", fx = { align = { honor = -1 } } },
      },
    },
    xherbal = {
      lines = { { id = "xherbal_default", text = "Pick at dusk, when the dew's gone and the elves are changing shifts. And never pull the whole plant; leave the root, and you'll find it again next season. Even the dead understand patience." } },
      choices = { { text = "Thank you. Something else.", next = "BACK" } },
    },
    xmiss = {
      lines = { { id = "xmiss_default", text = "I miss the smell of things, I think. I crush these leaves and remember that they ought to smell of something, and that's as close as I get. Don't dwell on it, friend; it doesn't help." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    hello = {
      lines = { { id = "h_default", text = "I gather for the Apothecarium, which means I spend my nights crawling through elven ruins in search of weeds. The Dark Lady's work is rarely dignified." } },
      again = { { id = "h_again", text = "Anything else? The light is fading, and I work better without it." } },
      choices = {
        { text = "What were you, before you died?", next = "xbefore" },
        { text = "Which herbs are you after tonight?", next = "xtonight" },
        { text = "What do you make of the night elves?", next = "xelves" },
        { text = "Any advice for a fellow herbalist?", next = "xherbal", when = { profession = "Herbalism" } },
        { text = "Do you miss being alive?", next = "xmiss", when = { race = "Scourge" } },

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
  topics = {
    apothecarium = { { id = "tp_xapoth", text = "Our masters in the Undercity. They are brilliant and they are not kind, and the two seem to go together." } },
    undercity = { { id = "tp_xundercity", text = "Home, such as it is. Damp, and full of people who used to be my neighbours." } },
 _none = { { id = "tp_none", text = "I don't know and I don't care. Ask someone with a heartbeat." } } },
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
    xlong = {
      narr = "He spits to one side and grins without much humour.",
      lines = { { id = "xlong_default", text = "Three winters, though there is no winter in this cursed wood, only rain. I came with the first lumber teams, and of those I came with, five are left. I count them every morning." } },
      choices = {
        { text = "Why stay, after so much loss?", next = "xstay" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xstay = {
      lines = { { id = "xstay_default", text = "Because if I go, their deaths bought nothing. The wood goes to Orgrimmar, the city stands, and my brothers are in its walls. That is how I think of it, and it helps." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xtauren = {
      lines = { { id = "xtauren_default", text = "Good fighters, and they never complain. Some of them pray over every tree we cut, which makes the work slow. I let them. It costs me nothing, and it seems to cost them a great deal." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xmorshan = {
      lines = { { id = "xmorshan_default", text = "Mor'shan Rampart guards the road into the Barrens, and from there it's dust and heat all the way to Orgrimmar. Some grunts dream of that road. I dream of the day we don't need it." } },
      choices = {
        { text = "What would end this fight?", next = "xend" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xend = {
      lines = { { id = "xend_default", text = "Either the elves give us the wood, or we take enough that we stop needing it. Neither will happen soon. Some of the younger ones say we should talk to the elves. Would you?" } },
      choices = {
        { text = "Yes. Talking costs fewer lives than raiding.", next = "BACK", reply = "Maybe. But the elves have to want to talk as well.", fx = { align = { honor = -1 } } },
        { text = "No. They answer only to strength.", next = "BACK", reply = "That's what I believe too. Today, we show them.", fx = { align = { honor = 1 } } },
      },
    },
    xother = {
      lines = { { id = "xother_default", text = "Then you're of the Horde, and that's enough for me. Keep your blade high and your head low, and don't chase the elves into the trees; that's where their cats are waiting." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    hello = {
      lines = {
        { id = "h_default", text = "We ride with Torek against the Silverwing Outpost. The elves have killed too many of our woodcutters, and today we answer them." },
        { id = "h_orc", when = { race = "Orc" }, text = "A brother of the blood! Stand with me today, and we'll show the Silverwing how orcs fight." },
      },
      again = { { id = "h_again", text = "What is it? Speak quickly, the march is soon." } },
      choices = {
        { text = "How long have you fought in Ashenvale?", next = "xlong" },
        { text = "What do you think of the tauren here?", next = "xtauren" },
        { text = "Tell me of Mor'shan and the road home.", next = "xmorshan" },
        { text = "I'm no orc, but I'll fight with you.", next = "xother", when = { ["not"] = { race = "Orc" } } },

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
  topics = {
    torek = { { id = "tp_xtorek", text = "Torek leads the raids. If he says march, I march." } },
    silverwing = { { id = "tp_xsilverwing", text = "The Silverwing Sentinels. They don't take prisoners, and neither do we." } },
 _none = { { id = "tp_none", text = "Ask Torek. I only swing the axe." } } },
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
    xlong = {
      narr = "He bounces on his heels, still moving even while standing.",
      lines = { { id = "xlong_default", text = "Since I was too small to swing an axe. The chieftain said legs are worth as much as arms, and in this forest they're worth more, since arms can't outrun arrows." } },
      choices = {
        { text = "Have you ever been caught?", next = "xcaught" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcaught = {
      lines = { { id = "xcaught_default", text = "Once, by a Sentinel with a cat the size of a kodo. I dropped the satchel and ran the other way, and she chased the satchel. Turned out it was the grunts' laundry list." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xworst = {
      lines = { { id = "xworst_default", text = "The names. Every week, a list of the dead from the lumber camps to Splintertree. I learned not to read them, but sometimes I see one I know, and then I run slower for a day." } },
      choices = {
        { text = "Every name means the war costs too much.", next = "BACK", reply = "Maybe. But don't say that near the commanders.", fx = { align = { order = -1 } } },
        { text = "They died for the Horde. Their names are honored.", next = "BACK", reply = "Yes. That's what I tell myself on the road.", fx = { align = { order = 1 } } },
      },
    },
    xnext = {
      lines = { { id = "xnext_default", text = "The Warsong Lumber Camp, then Splintertree, then Zoram'gar if the road's clear. It never is. The naga on the coast don't care whose messages I carry." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xhunter = {
      lines = { { id = "xhunter_default", text = "Stay off the main road by the Mystral Lake; the Sentinels watch it. There's a deer trail east of the river that the cats don't use. I don't know why, and I don't ask." } },
      choices = { { text = "Thanks, runner.", next = "BACK", reply = "Keep it to yourself, hunter. I need that trail." } },
    },

    hello = {
      lines = { { id = "h_default", text = "I run messages between the Warsong camps and the outposts. Lumber counts, sentinel sightings, who's dead and who's late. Mostly who's dead." } },
      again = { { id = "h_again", text = "More? I'm already late." } },
      choices = {
        { text = "Who taught you to run?", next = "ywru_taught" },
        { text = "A troll can run too. Race you to Splintertree.", next = "ywru_troll", when = { race = "Troll" } },
        { text = "How long have you been a runner?", next = "xlong" },
        { text = "What's the worst message you've carried?", next = "xworst" },
        { text = "Where do you run next?", next = "xnext" },
        { text = "I know the hunter's path. Any trails to share?", next = "xhunter", when = { class = "HUNTER" } },

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
    ywru_taught = {
      lines = {
        { id = "yywru_taught_d", text = "An old wolf rider named Grutha, who lost his wolf at Hyjal and his legs a year later to a Sentinel arrow. He sat by the fire at the lumber camp and told me which trails were safe and which were not, and he was right every time." },
      },
      choices = {
        { text = "Where is Grutha now?", next = "ywru_grutha" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywru_grutha = {
      narr = "The runner stops shifting from foot to foot for the first time.",
      lines = {
        { id = "yywru_grutha_d", text = "Dead, last winter, of a fever that came off the river. His name was on a list I carried myself, and I read it before I knew whose it was. I ran the whole way to Splintertree without stopping, and I have no memory of the road." },
      },
      choices = {
        { text = "Do you still read the lists?", next = "ywru_lists" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywru_lists = {
      lines = {
        { id = "yywru_lists_d", text = "I try not to, but my eyes find the names. Some runners say we should know every name, to honour them, and some say it makes the legs slow. I have not decided which is true." },
      },
      choices = {
        { text = "Read them. The dead deserve remembering.", next = "BACK", reply = "You sound like Grutha. I will read them, and run anyway.", fx = { align = { honor = 1 } } },
        { text = "Don't read them. Keep your legs fast.", next = "BACK", reply = "Aye. That is what the chieftain says. I will try.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywru_troll = {
      lines = {
        { id = "yywru_troll_d", text = "A troll! You have long legs, I will grant you, but you do not know the deer trails. I would beat you by a hundred paces, and then I would wait for you at the gate and laugh. Lok'tar, friend." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    warsong_lumber_camp = { { id = "tp_ywarsong_lumber_camp", text = "The first stop on my run. The saws never stop there." } },
    mystral_lake = { { id = "tp_ymystral_lake", text = "The Sentinels watch it. I go around." } },
    splintertree = { { id = "tp_xsplinter", text = "Splintertree Post is the Horde's fist in Ashenvale. I'm one of its fingers, the fast one." } },
 _none = { { id = "tp_none", text = "Ask at Splintertree. I just carry the words." } } },
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
    xbecame = {
      narr = "He doesn't look at you while he speaks; his eyes stay on the dark between the trees.",
      lines = { { id = "xbecame_default", text = "I was quiet as a boy in the camps. The other children were loud, and I listened. The chieftain noticed, and in Ashenvale a quiet orc is worth ten loud ones." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xnight = {
      lines = { { id = "xnight_default", text = "Wisps, sometimes, drifting like lost lanterns. Owls that are too large, and eyes that are too high. Once a whole tree walked past me, slow as an old man, and I did not breathe until it was gone." } },
      choices = {
        { text = "A walking tree?", next = "xtree" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtree = {
      lines = { { id = "xtree_default", text = "The elves call them ancients. It did not attack me, only looked, and I felt very small. I have not told the others, because they would laugh, or worse, they would go looking for it." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xgrom = {
      lines = { { id = "xgrom_default", text = "Grom slew the demigod in this forest, and then he slew the demon who cursed us. The clan honors both. Some say only the second deed should be remembered. What do you say?" } },
      choices = {
        { text = "Both deeds made him who he was. Honor both.", next = "BACK", reply = "That is the Warsong way. Good.", fx = { align = { light = -1 } } },
        { text = "Only the freeing matters. The first was the curse.", next = "BACK", reply = "Thrall says the same. I am still deciding.", fx = { align = { light = 1 } } },
      },
    },
    xorc = {
      lines = { { id = "xorc_default", text = "Move when the owls call and stop when they stop. And never light a fire in the open. The Sentinels can see a spark from a mile away, and they love a target." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    hello = {
      lines = { { id = "h_default", text = "I watch the gulch and the paths to it. The Silverwing Sentinels want our clan out of these woods, and the Warsong want every axe they own back in the trees." } },
      again = { { id = "h_again", text = "Something else? Keep it low." } },
      choices = {
        { text = "Why haven't you told anyone about the ancient?", next = "ywsc_ancient" },
        { text = "A night elf, here? You should not have come.", next = "ywsc_elf", when = { race = "NightElf" } },
        { text = "How did you become a scout?", next = "xbecame" },
        { text = "What do you see out there at night?", next = "xnight" },
        { text = "What do you think of Grom's legacy here?", next = "xgrom" },
        { text = "Any advice for an orc in these woods?", next = "xorc", when = { race = "Orc" } },

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
    ywsc_ancient = {
      lines = {
        { id = "yywsc_ancient_d", text = "Because they would laugh, or they would send a party to cut it down, and I do not want either. It looked at me the way an elder looks at a child, and I felt that it knew my name, though I do not know how." },
      },
      choices = {
        { text = "Do you think it was a warning?", next = "ywsc_warning" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywsc_warning = {
      narr = "The scout glances up into the canopy, as though expecting to see something looking back.",
      lines = {
        { id = "yywsc_warning_d", text = "Perhaps, or perhaps only a question. I think it was asking me why we cut its kin. I had no answer, and I have none now, and I have stopped sleeping well since that night." },
      },
      choices = {
        { text = "What would you tell it now?", next = "ywsc_tell" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywsc_tell = {
      lines = {
        { id = "yywsc_tell_d", text = "That Orgrimmar needs wood, and that the Horde must live. But I would also tell it that I am sorry, and I do not think the clan would forgive me for saying so. A Warsong scout is not meant to be sorry." },
      },
      choices = {
        { text = "Being sorry is no shame. Say it.", next = "BACK", reply = "Perhaps. If I see it again, I will tell it, and hope the clan never hears.", fx = { align = { light = 1 } } },
        { text = "The Horde must survive. Don't apologise.", next = "BACK", reply = "That is what my chieftain would say. I will keep my silence.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ywsc_elf = {
      lines = {
        { id = "yywsc_elf_d", text = "You are not Sentinel, by your gear, and you walk with the Horde's leave, so I will not draw on you. But your kin in the trees may not be so careful, and neither may mine. Walk quietly, and keep to the paths." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    warsong_gulch = { { id = "tp_ywarsong_gulch", text = "Our lumber road. The Sentinels want it closed, and we want it open." } },
    ancients = { { id = "tp_yancients", text = "The walking trees. One looked at me once, and I have not forgotten." } },
    grom = { { id = "tp_xgrom", text = "Grom Hellscream. Our chieftain, our shame and our pride, all in one." } },
 _none = { { id = "tp_none", text = "Don't know. Ask at the camp." } } },
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
    xtown = {
      narr = "She glances back over the bridge toward the lamps of the town.",
      lines = { { id = "xtown_default", text = "Astranaar stands on an island in Lake Iris, and the water is half our wall. Raene Wolfrunner commands here, and Shindrell Swiftfire keeps the moonwell's light, though both of them sleep less than they should." } },
      choices = {
        { text = "Who is Raene Wolfrunner?", next = "xraene" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xraene = {
      lines = { { id = "xraene_default", text = "Our captain, and the sharpest bow on this shore. She asks a great deal of every stranger who comes through, because there are never enough of us to watch every road." } },
      choices = {
        { text = "Then I'll go and see her.", next = "BACK", reply = "Do. She keeps a list of tasks longer than my glaive." },
        { text = "Something else.", next = "BACK" },
      },
    },
    xsatyr = {
      lines = { { id = "xsatyr_default", text = "They hold Felfire Hill and the Ruins of Stardust, and they grow bolder every season. They were kaldorei once, before they sold themselves to the demons, and that is the part I cannot forgive." } },
      choices = {
        { text = "Can a satyr ever be redeemed?", next = "xredeem" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xredeem = {
      lines = { { id = "xredeem_default", text = "The priestesses say Elune's mercy has no edge. I have seen what a satyr leaves of a scouting party, and my own mercy has a very sharp edge indeed. What do you think, stranger?" } },
      choices = {
        { text = "Elune's mercy should reach even them.", next = "BACK", reply = "Then you are a gentler soul than I am. Keep it, while you can.", fx = { align = { light = 1 } } },
        { text = "They chose the demons. Let them answer for it.", next = "BACK", reply = "That is the Sentinel's answer, and it is mine as well.", fx = { align = { light = -1 } } },
      },
    },
    xfurbolg = {
      lines = { { id = "xfurbolg_default", text = "The Foulweald and the Thistlefur were our friends once, and they traded with Astranaar for many years. Now they bear demon totems and howl at our patrols, and I do not know what poisoned them." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xkin = {
      lines = { { id = "xkin_default", text = "Then walk the roads with your eyes open, sister or brother. The Warsong cut deeper every week, and every pair of hands that can draw a bow is one more reason the forest still stands." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xally = {
      lines = { { id = "xally_default", text = "Trust is a long word for my people. You fought beside us at Hyjal, and that buys you the bridge, the inn and my courtesy. The rest you will earn on the roads." } },
      choices = { { text = "That seems fair.", next = "BACK", reply = "It is the best I can offer, and better than many would." } },
    },

    hello = {
      lines = { { id = "h_default", text = "We guard this island and the road through the forest. The Warsong cut from the north, the satyrs creep from the south, and the furbolgs have gone mad between them." } },
      again = { { id = "h_again", text = "What more would you ask?" } },
      choices = {
        { text = "How long have you stood this bridge?", next = "yast_long" },
        { text = "A Horde scout, at your gate. Will you let me pass?", next = "yast_horde", when = { faction = "Horde" } },
        { text = "Tell me about Astranaar itself.", next = "xtown" },
        { text = "What of the satyrs to the south?", next = "xsatyr" },
        { text = "Why have the furbolgs gone mad?", next = "xfurbolg" },
        { text = "I am kaldorei too. How can I help?", next = "xkin", when = { race = "NightElf" } },
        { text = "Do you trust the humans and dwarves who come here?", next = "xally", when = { ["not"] = { race = "NightElf" } } },

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
    yast_long = {
      lines = {
        { id = "yyast_long_d", text = "Since before the orcs came, when the bridge was only a crossing and Astranaar was a town of poets and moon-priestesses. I have watched it become a fortress one season at a time, and I am not certain I like what we have built." },
      },
      choices = {
        { text = "What do you miss about the old town?", next = "yast_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yast_miss = {
      narr = "She glances back over her shoulder, toward the moonwell glimmering between the trees of the island.",
      lines = {
        { id = "yyast_miss_d", text = "The singing at dusk, when the priestesses walked the shore with lanterns and the children followed them into the water. There is still singing, but it is quieter now, and the children are sent to Darnassus when they are old enough to travel." },
      },
      choices = {
        { text = "Should the children stay in Ashenvale?", next = "yast_children" },
        { text = "Something else.", next = "BACK" },
      },
    },
    yast_children = {
      lines = {
        { id = "yyast_children_d", text = "My sister would keep hers here, for she says a kaldorei child who has never seen Ashenvale will never fight for it. I would send them to Teldrassil and let them grow up without arrows on the wind, but it is her choice, not mine." },
      },
      choices = {
        { text = "Send them to Teldrassil. Safety first.", next = "BACK", reply = "Yes. I will tell her a stranger said so, and she will tell me to mind my own bridge.", fx = { align = { order = 1 } } },
        { text = "Let them stay. Ashenvale is their birthright.", next = "BACK", reply = "That is my sister's view. Perhaps she is wiser than I am.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    yast_horde = {
      lines = {
        { id = "yyast_horde_v0", when = { race = "Tauren" }, text = "You are a child of the Earth Mother, and your people honour the forest, I am told. That does not open my bridge, but it softens my glaive a little. Go back south, and tell your Warsong friends to cut less." },
        { id = "yyast_horde_d", text = "You will not, and you know it. Turn back toward Splintertree before my sisters on the wall notice you, and tell your commanders that Astranaar does not sleep. There will be no second warning." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    lake_iris = { { id = "tp_ylake_iris", text = "The lake around Astranaar. It is half our wall, and all of our water." } },
    teldrassil = { { id = "tp_yteldrassil", text = "Our new home across the sea. The children go there now, when they are old enough." } },
    raene = { { id = "tp_xraene", text = "Raene Wolfrunner commands Astranaar. If you want to be useful, she will see that you are." } },
    satyrs = { { id = "tp_xsatyrs", text = "Felfire Hill is theirs now. Do not go there alone, whatever you think you can do." } },
 _none = { { id = "tp_none", text = "I cannot say. Ask the Sentinel captain." } } },
}
