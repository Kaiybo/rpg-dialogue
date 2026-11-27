-- Darkshore folk with no conversation until now: Heldan Galesong (fish seller on the Twilight Shore),
-- Fiora Longears (high elf on the Auberdine pier) and Tiyani (food and drink at the Grove of the Ancients).
local P = RPGDialogueAPI:Pack("rpgd.darkshore")
local TODO_NPC, TODO_QUEST = P.TODO_NPC, P.TODO_QUEST

---------------------------------------------------------------------------
-- Heldan Galesong
---------------------------------------------------------------------------
P:NPC {
  key = "ds_heldan", id = TODO_NPC("Heldan Galesong"), name = "Heldan Galesong",
  role = "vendor", tier = "service",
  communities = { "darkshore_wilds" }, temper = { "calm", "dreamy" }, values = { "patience", "nature" },
  impression = {
    first = "He fishes alone on a long beach and seems to like it that way.",
    third = "{name} met Heldan Galesong, who fishes and sells his catch on the beach west of Ameth'Aran.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Ishnu-alah, friend. Sit, the fish are biting at last. Perhaps you bring me luck." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Ishnu-alah. Please mind the line, and please don't stay long." },
    { id = "g_default", text = "Ishnu-alah. Mind the line, traveler; I've had one bite all morning and I'd hate to lose it." },
    { id = "g_fish", when = { profession = "Fishing" }, text = "A fellow angler! Sit, if you like. The sea doesn't mind company if it's quiet." },
    { id = "yg_0", when = { race = "Dwarf" }, text = "A dwarf! Your kind fish like they mine: loud and determined. Sit quietly, if you can manage it." },
  },
  start = "hello",
  nodes = {
    y_sister = {
      lines = {
        { id = "y_y_sister", text = "My sister Thessiel is a Sentinel at Astranaar. She writes me every season, and every letter ends the same way: come fight, Heldan, the forest needs you. I write back about fish. She has never once laughed." },
      },
      choices = {
        { text = "Fishing in peace is a fine way to live.", next = "BACK", reply = "It is. Thessiel thinks otherwise, but I'm content.", fx = { align = { light = 1 } } },
        { text = "You should join your sister and fight for the forest.", next = "BACK", reply = "Perhaps. But someone must catch the fish. Please, mind the line.", fx = { align = { light = -1 } } },
        { text = "Do you think she's right?", next = "y_right" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_right = {
      lines = {
        { id = "y_y_right", text = "Some days. When I see the Blackwood furbolgs on the ridge, or the dead things in the surf, I think she might be. Then I catch a fish, and I feed a family in Auberdine, and I think I'm right too." },
        { id = "y_y_right_v0", when = { class = "WARRIOR" }, text = "Some days. You're a warrior; you'd say she's right. But I feed families with my line, and I think that counts for something." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_strange = {
      lines = {
        { id = "y_y_strange", text = "Last month I pulled up a fish with three eyes and a mouth full of teeth. I threw it back, of course, then I went home and drank a great deal of moonberry wine. Whatever is wrong with the land has reached the sea." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_stance = {
      lines = {
        { id = "y_y_stance", text = "Some say the corrupted fish should be caught and burned, so the sickness doesn't spread. Others say leave them to the sea; it will heal itself. What do you think?" },
      },
      choices = {
        { text = "Burn them. Stop the sickness spreading.", next = "BACK", reply = "Hm. It's a hard thing, but you might be right.", fx = { align = { light = 1 } } },
        { text = "Leave them. The sea will heal in time.", next = "BACK", reply = "That's what I hope. I'll go on throwing them back.", fx = { align = { light = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlong = {
      narr = "He reels in a little line, considers it, and lets it out again.",
      lines = { { id = "xlong_default", text = "Longer than most of Auberdine has stood, though that isn't saying much. I fished here when there were only tents on the hill and a single moonwell. The fish were the same, and so was I." } },
      choices = {
        { text = "Have you never wanted another life?", next = "xlife" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xlife = {
      lines = { { id = "xlife_default", text = "My sister went to the Sentinels and my brother to the druids. They both ask why I sit by the water while the world needs saving. I say somebody has to feed the people who save it." } },
      choices = {
        { text = "Feeding people is its own kind of service.", next = "BACK", reply = "Thank you. Tell my sister that, if you ever meet her.", fx = { align = { honor = -1 } } },
        { text = "In times like these, everyone should take up arms.", next = "BACK", reply = "Perhaps. But I'd make a poor Sentinel and a worse corpse.", fx = { align = { honor = 1 } } },
      },
    },
    xnaga = {
      lines = { { id = "xnaga_default", text = "Further up the coast, near the Cliffspring. I've seen their wake in the water at dawn, and I pulled my line in very quickly. They didn't come ashore here, and I'd like to keep it that way." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xtip = {
      lines = { { id = "xtip_default", text = "Cast where the waves break white and then wait twice as long as you think you should. And never fish in a hurry; the sea can always tell, and it laughs at you." } },
      choices = { { text = "I'll remember that.", next = "BACK", reply = "Good. And mind your line on the rocks." } },
    },

    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Heldan Galesong. I fish where the Long Wash meets the Twilight Shore, and I sell what I catch to anyone who walks this far down the beach, which isn't many." },
      },
      again = {
        { id = "h_again", text = "Something else? The fish aren't biting anyway." },
        { id = "h_again2", text = "Ask away. I've nowhere to be." },
      },
      choices = {
        { text = "How long have you fished this shore?", next = "xlong" },
        { text = "Do you ever see the naga here?", next = "xnaga" },
        { text = "Any tips for a fellow angler?", next = "xtip", when = { profession = "Fishing" } },

        { text = "Why fish out here, so far from Auberdine?", next = "far" },
        { text = "Ameth'Aran is just up the hill. Have you been?", next = "ruins" },
        { text = "Show me your catch.", next = "BUSINESS" },
        { text = "Tell me about your sister.", next = "y_sister" },
        { text = "Caught anything strange lately?", next = "y_strange" },
        { text = "What should be done with corrupted fish?", next = "y_stance" },
        { text = "I'm a fisherman too.", next = "BACK", when = { profession = "Fishing" }, reply = "Then you know the hardest part is waiting. Sit, and let's wait together." },
        { text = "What do you do with the fish you can't name?", next = "w_name" },
        { text = "Good fishing, Heldan.", next = "END" },
      },
    },
    far = {
      lines = { { id = "fa_default", text = "The fish here are fatter and the people fewer. Auberdine's dock is crowded with sailors and gossip, and neither one helps a man catch anything." } },
      choices = {
        { text = "What do you catch here?", next = "catch" },
        { text = "Something else.", next = "BACK" },
      },
    },
    catch = {
      lines = { { id = "ca_default", text = "Rainbow fin albacore, mostly, and a few things I can't name that I throw back. Lately even the fish seem uneasy, as if something in the deep water disturbs them." } },
      choices = {
        { text = "The sea will settle. It always does.", next = "BACK", reply = "I hope you're right. I've never known it this restless.", fx = { align = { order = 1 } } },
        { text = "Something's wrong in Darkshore. Ignoring it won't help.", next = "BACK", reply = "No, I suppose not. But I'm a fisherman, not a Sentinel.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    ruins = {
      lines = { { id = "ru_default", text = "Not since the ghosts started walking there. Ameth'Aran was a fine place once, they say, before the Highborne who lived there brought ruin on it. I keep to the beach." } },
      choices = { { text = "Wise of you. Something else.", next = "BACK" } },
    },
    w_name = {
      lines = {
        { id = "w_name_default", text = "I draw them, in a little book, with charcoal, and then I throw them back. There are forty pages now, and the last ten are fish nobody in Auberdine has ever seen, not even old Thamarian on the pier." },
      },
      choices = {
        { text = "Have you shown the book to anyone?", next = "w_name2" },
        { text = "Forty pages of strange fish.", next = "w_name2" },
      },
    },
    w_name2 = {
      lines = {
        { id = "w_name2_default", text = "Thundris Windweaver, once, and he turned the pages very slowly and asked to keep it for a week. When he gave it back he had marked six of them with a small black dot, and he would not tell me why. I have not caught any of those six since." },
        { id = "w_name2_w1", when = { profession = "Fishing" }, text = "You fish, so take a look at the dotted pages. If you ever pull one of those up, cut your line and walk away." },
      },
      choices = {
        { text = "Thundris knows something.", next = "BACK", fx = { trait = { cautious = 1 } } },
        { text = "Something else, Heldan.", next = "BACK" },
      },
    },
  },
  topics = {
    thessiel = { { id = "tp_ythessiel", text = "My sister. A Sentinel. She thinks fishing is a waste of a good bow arm." } },
    moonberry = { { id = "tp_ymoonberry", text = "Moonberry wine, the best thing to drink after a three-eyed fish." } },
    fishing = { { id = "tp_xfish", text = "The only craft that rewards doing nothing well. I recommend it highly." } },
    ameth_aran = { { id = "tp_xameth", text = "Haunted ruins up the hill. I hear the ghosts weeping some nights and fish louder." } },
  },
}

---------------------------------------------------------------------------
-- Fiora Longears
---------------------------------------------------------------------------
P:NPC {
  key = "ds_fiora", id = TODO_NPC("Fiora Longears"), name = "Fiora Longears",
  role = "questgiver", tier = "quest", race = "HighElf",
  communities = { "auberdine" }, temper = { "warm", "sharp" }, values = { "adventure", "talent" },
  impression = {
    first = "A high elf on the Auberdine pier, sizing up every traveler who steps off the boat.",
    third = "{name} met Fiora Longears, Red Jack Flint's partner in Auberdine, who sends promising travelers deeper into Kalimdor.",
  },
  greetings = {
    { id = "g_default", text = "Another new face off the boat! Welcome to Kalimdor, or at least the damp edge of it." },
    { id = "g_flint", when = { questActive = TODO_QUEST("Fiora Longears") }, text = "Red Jack sent you, didn't he? I can always tell. He picks the ones with salt still in their hair." },
    { id = "g_astra", when = { questActive = TODO_QUEST("Journey to Astranaar") }, text = "Still here, {name}? Astranaar is south, through the forest, and it won't come to you." },
    { id = "yg_0", when = { race = "NightElf" }, text = "Ishnu-alah, I think that's how you say it. Forgive my accent; I've only been on this coast a few years." },
    { id = "yg_1", when = { race = "Dwarf" }, text = "A dwarf off the Menethil boat! Red Jack swears your people get seasick worse than anyone. Is it true?" },
  },
  start = "hello",
  topics = {
    red_jack = { { id = "tp_yred_jack", text = "Red Jack Flint. He talks too much and he's never once been wrong about a traveller." } },
    queldorei = { { id = "tp_yqueldorei", text = "High elves are few on this coast. The kaldorei watch me as if I might bite." } },
  },

  nodes = {
    y_flint = {
      lines = {
        { id = "y_y_flint", text = "Red Jack Flint pulled me out of the water off Menethil when my ship went down in a storm. I owed him a life, and he asked me to help him send travellers the right way instead. I've been paying it back ever since." },
      },
      choices = {
        { text = "What happened to your ship?", next = "y_ship" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_ship = {
      lines = {
        { id = "y_y_ship", text = "It was a small trader out of Southshore, carrying wine and silk. A storm took it apart in an hour. Three of us made it to shore. The other two went home, and I came here instead. I'm not entirely sure why." },
        { id = "y_y_ship_v0", when = { race = "Human" }, text = "A little trader out of Southshore, carrying wine and silk. You'd know the kind. Three of us made it, and I'm the one who didn't go home." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_home = {
      lines = {
        { id = "y_y_home", text = "I left Quel'Thalas when the Scourge came through. My family stayed. I've had two letters in four years, and the last one said my brother had joined the rangers holding the forests south of Silvermoon. I don't know if he's alive." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_return = {
      lines = {
        { id = "y_y_return", text = "Sometimes I think I should go back and help rebuild. Other times I think there's nothing left to rebuild, and I'd only be another ghost. What would you do?" },
      },
      choices = {
        { text = "Go home. Your people need you.", next = "BACK", reply = "You're right, I know. I'll go. Someday, when I'm brave enough.", fx = { align = { honor = 1 } } },
        { text = "Make your own home here. That's no betrayal.", next = "BACK", reply = "Thank you. I needed to hear someone say that.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    hello = {
      lines = {
        { id = "h_default", key = true, text = "Fiora Longears, at your service. Red Jack Flint and I keep an eye out for travelers with promise, and when one comes across from Menethil, I point them toward where they'll do the most good." },
        { id = "h_done", when = { questDone = TODO_QUEST("Fiora Longears") }, text = "Red Jack never misjudges a character, and he didn't misjudge you. You'll do well in Kalimdor, {name}." },
      },
      again = {
        { id = "h_again", text = "What else can I tell you? Ask before the next boat comes in." },
        { id = "h_again2", text = "Go on. I like talking to someone who isn't a sailor." },
      },
      choices = {
        { text = "Where should I go next?", next = "astranaar" },
        { text = "A high elf, this far from Quel'Thalas?", next = "quel" },
        { text = "How do you know Red Jack Flint?", next = "flint" },
        { text = "The night elves don't seem pleased to see you.", next = "kaldorei", when = { race = "NightElf" } },
        { text = "How did you meet Red Jack?", next = "y_flint" },
        { text = "Do you hear from home?", next = "y_home" },
        { text = "Will you ever go back to Quel'Thalas?", next = "y_return" },
        { text = "Is it true about Quel'Thalas?", next = "BACK", when = { class = "MAGE" }, reply = "The Sunwell's gone, if that's what you mean. A mage would feel the lack of it. I do, every day." },
        { text = "What do you make of the night elves, honestly?", next = "w_kaldorei" },
        { text = "Goodbye, Fiora.", next = "END" },
      },
    },
    astranaar = {
      lines = { { id = "as_default", text = "South, to Ashenvale, and the town of Astranaar. The Sentinels there are fighting the Horde for every tree, and they need people like you more than Darkshore does." } },
      choices = {
        { text = "What's waiting for me in Astranaar?", next = "astranaar2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    astranaar2 = {
      lines = { { id = "a2_default", text = "Orcs with axes, satyrs in the woods, and furbolgs gone mad. It isn't pretty, but you'll learn more there in a week than you would in a year on this pier." } },
      choices = {
        { text = "Good. I want a real fight.", next = "BACK", reply = "Then you'll find one. Try not to find two at once.", fx = { align = { honor = 1 } } },
        { text = "I'd rather find work that pays than fights.", next = "BACK", reply = "Astranaar has both, if you're clever about it.", fx = { align = { honor = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    quel = {
      lines = { { id = "qu_default", text = "Quel'Thalas is a long way, and a sad place since the Scourge came through. I wanted somewhere new, and Kalimdor is as new as the world gets." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    flint = {
      lines = { { id = "fl_default", text = "Jack and I have sent travelers back and forth across the water for years. He talks too much and I listen too little, so we get along very well." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    kaldorei = {
      lines = { { id = "ka_default", text = "Your people and mine have old grudges, I know. I'd rather leave them in the old books where they belong. I'm only here to help." } },
      choices = {
        { text = "Old grudges have their reasons.", next = "BACK", reply = "They do. But I wasn't alive for any of them.", fx = { align = { order = 1 } } },
        { text = "Then let's leave them there.", next = "BACK", reply = "Thank you. That's kinder than most.", fx = { align = { order = -1 } } },
      },
    },
    w_kaldorei = {
      lines = {
        { id = "w_kaldorei_default", text = "Honestly? They're very like my own people, if my people had spent ten thousand years in a forest instead of a palace. Same long memories, same pride, same way of looking down the nose. They just look down it at trees instead of at humans." },
      },
      choices = {
        { text = "Do they know you think that?", next = "w_kaldorei2" },
        { text = "That's not very flattering.", next = "w_kaldorei2" },
      },
    },
    w_kaldorei2 = {
      lines = {
        { id = "w_kaldorei2_default", text = "I'd never say it to their faces, and you'll keep it between us. The truth is, I like them better than I expected. There's a Sentinel on the dock who brings me tea every morning and never says a word, and I've grown very fond of her." },
        { id = "w_kaldorei2_w1", when = { race = "NightElf" }, text = "Oh, you're kaldorei. Well, I meant every word kindly, and you'll forgive a high elf her habits. We were cousins once, after all." },
      },
      choices = {
        { text = "Old grudges can soften.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else, Fiora.", next = "BACK" },
      },
    },
  },
}

---------------------------------------------------------------------------
-- Tiyani
---------------------------------------------------------------------------
P:NPC {
  key = "ds_tiyani", id = TODO_NPC("Tiyani"), name = "Tiyani",
  role = "vendor", tier = "service",
  communities = { "grove_of_ancients" }, temper = { "gentle", "shy" }, values = { "hospitality", "nature" },
  impression = {
    first = "She sells dew and bread to travelers among the ancients.",
    third = "{name} met Tiyani, who sells food and drink at the Grove of the Ancients in Darkshore.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Welcome back, friend. The ancients are listening, but they seem glad you're here." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Please speak softly. The ancients are listening, and they don't like you." },
    { id = "g_default", text = "Welcome to the Grove. Please speak softly; the ancients are listening." },
    { id = "g_back", when = { metBefore = true }, text = "You're back. Thirsty again? The dew is fresh this morning." },
    { id = "yg_0", when = { race = "Dwarf" }, text = "A dwarf, here? Please, quietly. The ancients do not like hammers, and you look as though you carry several." },
  },
  start = "hello",
  nodes = {
    y_mother = {
      lines = {
        { id = "y_y_mother", text = "My mother still keeps her bakery in Auberdine. She sends a basket every week on the supply cart, with a note telling me to come home and marry a nice Sentinel. I send back the empty basket and a sprig of grove moss." },
      },
      choices = {
        { text = "The Grove is worth tending, whatever your mother says.", next = "BACK", reply = "Thank you. I think so too, though I miss her bread.", fx = { align = { order = 1 } } },
        { text = "You should go home and help your mother.", next = "BACK", reply = "Perhaps. But this is my home now. Please, speak softly.", fx = { align = { order = -1 } } },
        { text = "Will you go home?", next = "y_go" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_go = {
      lines = {
        { id = "y_y_go", text = "Not yet. The ancients are worried, and Onu speaks more than he used to, which means something is very wrong. While he worries, I want to be here, even if all I can do is keep the bread warm." },
        { id = "y_y_go_v0", when = { class = "DRUID" }, text = "Not yet. You'll have felt it, druid. Onu speaks more than he used to. While he worries, I want to be here." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_secret = {
      lines = {
        { id = "y_y_secret", text = "Sometimes, at night, I hear the ancients humming. Not speaking, just humming, low and slow, like an old song. I have never told anyone. I think it is the oldest music in the world, and I think they do not know I can hear it." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_stance = {
      lines = {
        { id = "y_y_stance", text = "Some of the druids want to wake more of the ancients and send them to fight the corruption. Onu says the ancients should rest. Who is right?" },
      },
      choices = {
        { text = "Let the ancients rest. They've earned it.", next = "BACK", reply = "Onu would agree. I think I do too.", fx = { align = { order = 1 } } },
        { text = "Wake them. Darkshore needs every defender.", next = "BACK", reply = "Perhaps. I hope Onu forgives us, if it comes to that.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcame = {
      narr = "She smooths her apron and glances shyly at the great trees.",
      lines = { { id = "xcame_default", text = "My mother kept a bakery in Auberdine. When the druids started coming south to speak with the ancients, someone had to feed them, and I was the quiet daughter. The Grove suited me." } },
      choices = {
        { text = "Don't you miss the village?", next = "xmiss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xmiss = {
      lines = { { id = "xmiss_default", text = "Sometimes, at night, when the ancients are silent and I can't hear anything but my own breathing. Then dawn comes and the dew is fresh, and I remember why I stayed." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xonu = {
      lines = { { id = "xonu_default", text = "The eldest ancient here, and the one who speaks for the rest. He has a voice like a slow river. He asked my name once, and it took him an afternoon. I was very honored." } },
      choices = {
        { text = "Does Onu trust outsiders?", next = "xtrust" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xtrust = {
      lines = { { id = "xtrust_default", text = "He trusts those who help Darkshore. Some say the Grove should be closed to all but the kaldorei, so the ancients may rest. Others say we need every friend we can find. I can't decide." } },
      choices = {
        { text = "Open the Grove. Darkshore needs friends.", next = "BACK", reply = "Onu would agree, I think. He is very patient with strangers.", fx = { align = { order = -1 } } },
        { text = "Keep it closed. The ancients deserve their peace.", next = "BACK", reply = "Perhaps. It would be quieter, at least.", fx = { align = { order = 1 } } },
      },
    },
    xtravel = {
      lines = { { id = "xtravel_default", text = "Not many. Some Sentinels, some druids, and now and then a dwarf from the Explorers' League who asks if the trees are edible. I tell them no, and I sell them bread." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdruid = {
      lines = { { id = "xdruid_default", text = "Speak to Onu, please; he always has something for a druid. And eat something before you go. The druids who visit always forget, and then they faint in the middle of a ritual." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    hello = {
      lines = {
        { id = "h_default", key = true, text = "I am Tiyani. I keep food and drink for those who visit the Grove of the Ancients, and for the druids who forget to eat when they're talking to trees." },
      },
      again = {
        { id = "h_again", text = "Is there something else? The dew is fresh from the ancients' leaves this morning." },
        { id = "h_again2", text = "Yes? I'm still here." },
      },
      choices = {
        { text = "How did you come to the Grove?", next = "xcame" },
        { text = "Who is Onu?", next = "xonu" },
        { text = "Do many travelers come this far?", next = "xtravel" },
        { text = "I'm a druid. Is there anything the Grove needs?", next = "xdruid", when = { class = "DRUID" } },

        { text = "Do the ancients really listen?", next = "ancients" },
        { text = "What do you sell?", next = "dew" },
        { text = "I'll buy something.", next = "BUSINESS" },
        { text = "Does your family write?", next = "y_mother" },
        { text = "Do you have a secret?", next = "y_secret" },
        { text = "Should the ancients fight?", next = "y_stance" },
        { text = "Farewell, Tiyani.", next = "END" },
      },
    },
    ancients = {
      lines = { { id = "an_default", text = "They hear everything, though they answer slowly. Onu speaks for them, and even he takes his time choosing words." } },
      choices = {
        { text = "What troubles the ancients?", next = "ancients2" },
        { text = "Something else.", next = "BACK" },
      },
    },
    ancients2 = {
      lines = { { id = "a2_default", text = "The sickness in Darkshore, and the furbolgs gone wild, and the naga on the coast. Onu worries for all of it, and I worry because he does." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    dew = {
      lines = { { id = "de_default", text = "Morning glory dew, gathered from the leaves at sunrise, and bread baked in the old way. It isn't much, but it's honest food." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
  },
  topics = {
    auberdine = { { id = "tp_yauberdine", text = "My mother's bakery is there, and most of my family. It's a good village, if a damp one." } },
    ancients = { { id = "tp_yancients", text = "The ancients of the grove. Old, slow, and wiser than all of us." } },
    onu = { { id = "tp_xonu", text = "The eldest ancient. Speak slowly to him, and listen even more slowly." } },
  },
}

-- Elder Starweave: a night elf ancestor-spirit in Auberdine during the Lunar Festival.
P:NPC {
  key = "ds_elder_starweave", id = 15601, name = "Elder Starweave", gender = "female",
  role = "elder", tier = "quest",
  temper = { "serene", "wise" }, values = { "memory", "Elune" },
  notices = { "race" },
  impression = {
    first = "A silver kaldorei spirit stands by the shore of Auberdine, her gaze on the dark sea.",
    third = "{name} honoured Elder Starweave in Auberdine at the Lunar Festival.",
  },
  greetings = {
    { id = "g_default", text = "Ishnu-alah, traveller. The festival moon has brought you to me." },
    { id = "g_festival", when = { holiday = "lunar" }, text = "The lanterns of Moonglade are lit once more, and I have walked back from the long sleep to stand among the living. Linger a while, and remember the old ways with me." },
    { id = "g_back", when = { metBefore = true }, text = "You return. Elune smiles on those who remember." },
    { id = "g_quest", when = { questActive = TODO_QUEST("Starweave the Elder") }, text = "You seek the blessing of the elders. Come, and receive mine." },
  },
  notice = {
    { id = "n_elf", cat = "race", when = { race = "NightElf" }, text = "A daughter or son of the kaldorei. Your ancestors are glad of you." },
    { id = "n_dwarf", cat = "race", when = { race = "Dwarf" }, text = "A dwarf on our shores. Your people's ships have been good friends to Auberdine." },
  },
  start = "hello",
  nodes = {
    hello = {
      lines = { { id = "h_default", text = "I am Starweave, and once I wove the starlight into songs for the Sisters of Elune. Now each year the moon lets me return to these shores I loved." } },
      again = {
        { id = "h_again", text = "Speak, child. The tide is patient, and so am I." },
        { id = "h_again2", text = "What more would you ask an elder who has seen so many festivals?" },
      },
      choices = {
        { text = "Why return to Darkshore?", next = "shore" },
        { text = "What is the Lunar Festival to the kaldorei?", next = "festival" },
        { text = "Darkshore seems troubled these days.", next = "troubled" },
        { text = "I serve Elune too, Elder.", next = "priest", when = { class = "PRIEST" } },
        { text = "What songs did you weave for the Sisters?", next = "es_songs" },
        { text = "Do you see the living when you return?", next = "es_living" },
        { text = "Was there a song you never finished?", next = "w_song" },
        { text = "Elune keep you, Elder.", next = "END" },
      },
    },
    es_songs = {
      lines = {
        { id = "es_songs_1", text = "Songs of the moon's path across the sky, and of the stars that Elune hung to light the way of the lost. I sang them in the old temples, long before Darkshore was a shore at all, and the Sisters sing them still." },
      },
      choices = {
        { text = "Sing me one, Elder.", next = "es_sing" },
        { text = "I'm a priest. I know some of those songs.", next = "es_sing", when = { class = "PRIEST" } },
      },
    },
    es_sing = {
      lines = {
        { id = "es_sing_1", text = "A spirit's voice is thin, child, but listen. The moon rises over the sea, and the sea remembers, and all who are lost may find the way home by her light, if they will only look up." },
      },
      choices = {
        { text = "That's beautiful.", next = "es_beauty" },
        { text = "A song for the lost. Something else.", next = "BACK" },
      },
    },
    es_beauty = {
      lines = {
        { id = "es_beauty_1", text = "It is old, and it is true, which is the best a song can be. When you see the moon over Auberdine tonight, look up, and remember that the dead do not forget the living." },
      },
      choices = {
        { text = "I will remember.", next = "BACK", fx = { affinity = 1 } },
        { text = "Something else, Elder.", next = "BACK" },
      },
    },
    es_living = {
      lines = {
        { id = "es_living_1", text = "I see them, and they do not always see me, for the living look ahead and the dead look back. I watch the Sentinels at their posts and the children on the docks, and I am glad that some things endure." },
      },
      choices = {
        { text = "What has changed most, since your time?", next = "es_changed" },
        { text = "I'm a night elf. I'll honour your memory.", next = "es_changed", when = { race = "NightElf" } },
      },
    },
    es_changed = {
      lines = {
        { id = "es_changed_1", text = "The forest has grown sad, child, and the furbolgs have grown angry, and the Highborne ruins are full of restless ghosts. But the moon is the same, and so are the songs, and that is enough for an old spirit like me." },
      },
      choices = {
        { text = "The moon remains. That's a comfort.", next = "BACK" },
        { text = "Something else, Elder.", next = "BACK" },
      },
    },
    shore = {
      lines = { { id = "s_default", text = "I walked these shores when the forests were young and the sea was gentle. The land has changed, but the moon on the water has not." } },
      choices = { { text = "It is a beautiful sight. Something else.", next = "BACK" } },
    },
    festival = {
      lines = { { id = "f_default", text = "It is our oldest rite, the honouring of the elders. In Moonglade, the druids open their sanctuary, and we wake the ancient Omen with light." } },
      choices = {
        { text = "Who is Omen?", next = "omen" },
        { text = "Something else.", next = "BACK" },
      },
    },
    omen = {
      lines = { { id = "o_default", text = "A great beast of the old wars, cursed and driven beneath Moonglade's lake. Each festival the fireworks stir him, and brave souls drive him back down." } },
      choices = {
        { text = "I would fight him gladly.", next = "BACK", reply = "Then bring friends and bright rockets.", fx = { align = { honor = 1 } } },
        { text = "Some sleeping beasts are best left sleeping.", next = "BACK", reply = "Wise, perhaps. Yet tradition is tradition.", fx = { align = { honor = -1 } } },
      },
    },
    troubled = {
      lines = { { id = "t_default", text = "Yes, the furbolgs have gone mad and the old ruins stir with the restless dead. The Sentinels of Auberdine need every hand they can find." } },
      choices = { { text = "I'll lend mine. Something else.", next = "BACK" } },
    },
    priest = {
      lines = { { id = "p_default", text = "Then you know her light does not fade, even for the dead. Carry it gently, and she will carry you." } },
      choices = { { text = "Thank you, Elder. Something else.", next = "BACK", fx = { affinity = 1 } } },
    },
    w_song = {
      lines = {
        { id = "w_song_default", text = "One, child, a song for the stars that fell into the sea when the Well broke. I began it the night of the Sundering, standing on a shore that is not there anymore, and I could not find the last verse before I died." },
      },
      choices = {
        { text = "Could you finish it now?", next = "w_song2" },
        { text = "That's a heavy song to carry.", next = "w_song2" },
      },
    },
    w_song2 = {
      lines = {
        { id = "w_song2_default", text = "I try, every year when the moon lets me come back. I stand here and look at the sea and wait for the verse. It has not come yet. Perhaps it is not mine to write; perhaps it belongs to someone still living, who has not yet seen enough to sing it." },
        { id = "w_song2_w1", when = { class = "PRIEST" }, text = "You serve the Mother Moon, child. If you ever find yourself singing a verse you did not know you knew, come and sing it to me here." },
      },
      choices = {
        { text = "Maybe next year it will come.", next = "BACK", fx = { trait = { kind = 1 } } },
        { text = "Something else, Elder.", next = "BACK" },
      },
    },
  },
  topics = {
    background = { { id = "tp_bg", text = "An elder of the kaldorei, a weaver of songs for the Sisters of Elune." } },
    _none = { { id = "tp_none", text = "That I do not know, child. Ask the Sentinels." } },
  },
}

---------------------------------------------------------------------------
-- Auberdine Sentinel: guards of the village on the shore.
---------------------------------------------------------------------------
P:NPC {
  key = "aub_sentinel_guard", id = 6086, name = "Auberdine Sentinel",
  role = "guard", tier = "service",
  communities = { "auberdine" }, temper = { "calm", "alert" }, values = { "duty", "the shore" },
  impression = {
    first = "A Sentinel stands on the docks of Auberdine, the sea wind tugging at her cloak, watching the water and the woods by turns.",
    third = "{name} spoke with an Auberdine Sentinel on watch over the village.",
  },
  greetings = {
    { id = "g_disp_warm", when = { disposition = { min = 65 } }, text = "Ishnu-alah, friend of Auberdine. Mind the docks, though you know them well enough by now." },
    { id = "g_disp_cold", when = { disposition = { max = 34 } }, text = "Ishnu-alah. I have my eye on you. Mind the docks and mind your step." },
    { id = "g_default", text = "Ishnu-alah. Welcome to Auberdine. Mind the docks; the boards are slick after rain." },
    { id = "g_back", when = { metBefore = true }, text = "Welcome back. The shore has been quiet, which only makes me more careful." },
    { id = "yg_0", when = { race = "Human" }, text = "Ishnu-alah, human. The Menethil boat brings your kind more often lately. Mind the slick boards." },
    { id = "yg_1", when = { class = "HUNTER" }, text = "A hunter. Keep your beast off the pier, please; the fishermen have complained twice this week." },
  },
  start = "hello",
  nodes = {
    y_hist = {
      lines = {
        { id = "y_y_hist", text = "I served at Feathermoon once, far to the south, before Glynda asked for Sentinels who knew the sea. I have stood on this pier for thirty years. That is not long, for one of us, but long enough to learn every plank by its creak." },
      },
      choices = {
        { text = "Keeping the docks safe keeps the town alive.", next = "BACK", reply = "It does. That is why I stand here, year after year.", fx = { align = { order = 1 } } },
        { text = "The docks don't need guarding. Nobody attacks a pier.", next = "BACK", reply = "You have not seen what comes out of the sea at night.", fx = { align = { order = -1 } } },
        { text = "Do you miss Feathermoon?", next = "y_miss" },
        { text = "Something else.", next = "BACK" },
      },
    },
    y_miss = {
      lines = {
        { id = "y_y_miss", text = "I miss the warm rain and the colour of the water. Darkshore is grey and the sea is cold, but it was the first place my people landed after Hyjal, and someone ought to keep watch over it." },
        { id = "y_y_miss_v0", when = { race = "NightElf" }, text = "I miss the warm rain, sister or brother, as you would. But Darkshore was where we landed after Hyjal, and someone ought to keep its watch." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_night = {
      lines = {
        { id = "y_y_night", text = "The night watch is the worst of it. Glynda doubled it after the Murkdeep raids, and now half of us sleep through the day like owls. I have not seen a sunrise in three weeks, and I am beginning to forget its colour." },
      },
      choices = {
        { text = "Something else.", next = "BACK" },
      },
    },
    y_ruins = {
      lines = {
        { id = "y_y_ruins", text = "The Explorers' League digs in our old ruins along the coast, and Glynda lets them, because they are allies. Some of us think the past should stay buried. What would you do?" },
      },
      choices = {
        { text = "Let them dig. Knowledge helps the Alliance.", next = "BACK", reply = "Perhaps. They are careful, at least. Mostly.", fx = { align = { order = 1 } } },
        { text = "Send them away. Those ruins are kaldorei.", next = "BACK", reply = "I agree, though I would never say so to Glynda. Thank you.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
    xcmd = {
      narr = "She nods toward the moonwell at the heart of the village.",
      lines = { { id = "xcmd_default", text = "Sentinel Glynda Nal'Shea keeps the watch, and Thundris Windweaver keeps the Cenarion work. Between them, Auberdine has more orders than it has Sentinels, which is how every outpost feels these days." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xshore = {
      lines = { { id = "xshore_default", text = "The sea has been restless since the Sundering, and lately more so. Strange things wash up on the beaches, and the naga come further inland each season. Some of the elders say the deep is waking." } },
      choices = {
        { text = "What do you think is waking?", next = "xwake" },
        { text = "Something else.", next = "BACK" },
      },
    },
    xwake = {
      lines = { { id = "xwake_default", text = "I do not know, and I do not like guessing at the sea. I would rather the priestesses studied it carefully than the Sentinels rushed into the water with glaives. Or would you rather we struck first?" } },
      choices = {
        { text = "Study it first. Rash blades start worse fights.", next = "BACK", reply = "That is my counsel too. Patience has kept this harbour alive.", fx = { align = { order = 1 } } },
        { text = "Strike first, before it reaches the harbour.", next = "BACK", reply = "Bold. Glynda would like you, at least.", fx = { align = { order = -1 } } },
      },
    },
    xboats = {
      lines = { { id = "xboats_default", text = "West to Rut'theran Village below Teldrassil, and south across the sea to Menethil Harbor. The Menethil boat is late more often than not, so bring a book while you wait." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xkin = {
      lines = { { id = "xkin_default", text = "That it was our home long before Teldrassil, and that our old cities lie in ruins along this coast. Walk through them with respect. The ghosts in Ameth'Aran still remember who they were." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    xdwarf = {
      lines = { { id = "xdwarf_default", text = "Often. The Explorers' League has a camp up the coast, digging in our ruins with more enthusiasm than care. They mean well, and they always pay for their ale, which earns them a little patience." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },

    hello = {
      lines = {
        { id = "h_default", key = true, text = "Auberdine is the last safe harbour on this coast. The boats sail to Teldrassil and to Menethil from here, and we keep watch so they keep sailing." },
      },
      again = { { id = "h_again", text = "Is there more? I can answer while I watch." } },
      choices = {
        { text = "Who commands the Sentinels here?", next = "xcmd" },
        { text = "What happened to the Twilight Shore?", next = "xshore" },
        { text = "Where do the boats go?", next = "xboats" },
        { text = "I'm kaldorei. What should I know of Darkshore?", next = "xkin", when = { race = "NightElf" } },
        { text = "I'm a dwarf. Do my kin come through here?", next = "xdwarf", when = { race = "Dwarf" } },

        { text = "What threatens Darkshore?", next = "threat" },
        { text = "What do you think of the human visitors?", next = "humans" },
        { text = "Where did you serve before Auberdine?", next = "y_hist" },
        { text = "How is the night watch?", next = "y_night" },
        { text = "What of the League's digs in your ruins?", next = "y_ruins" },
        { text = "Farewell, Sentinel.", next = "END" },
      },
    },
    threat = {
      lines = { { id = "th_default", text = "The furbolgs have gone mad with something foul, the naga creep up the beaches, and the Twilight's Hammer haunt the ruins to the north. The forest itself feels sick in places. We do not yet know why." } },
      choices = { { text = "Something else.", next = "BACK" } },
    },
    humans = {
      lines = { { id = "hu_default", text = "They come off the Menethil boat loud and curious, and they ask a great many questions. They fought beside us at Hyjal, so I make allowances." } },
      choices = {
        { text = "The Alliance makes us all stronger.", next = "BACK", reply = "So the priestesses say. I hope they are right.", fx = { align = { order = 1 } } },
        { text = "Kaldorei should look after kaldorei.", next = "BACK", reply = "Many here agree with you, though few say it aloud.", fx = { align = { order = -1 } } },
        { text = "Something else.", next = "BACK" },
      },
    },
  },
  topics = {
    glynda = { { id = "tp_yglynda", text = "Sentinel Glynda Nal'Shea keeps the watch. She asks much and she gives more." } },
    feathermoon = { { id = "tp_yfeathermoon", text = "Feathermoon Stronghold, far to the south in Feralas. I served there once." } },
    auberdine = { { id = "tp_xauberdine", text = "Our harbour and our home on this coast. Keep it peaceful while you are here." } },
    naga = { { id = "tp_xnaga", text = "They come from the sea at night. Never sleep on the beach." } },
  },
}
